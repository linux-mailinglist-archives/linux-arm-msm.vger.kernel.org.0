Return-Path: <linux-arm-msm+bounces-39425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D509DB722
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BF48163A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 12:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00A119004B;
	Thu, 28 Nov 2024 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g95C0Zm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E590419340D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795755; cv=none; b=BWhkUd1CdLrVV94YbbYLVe5/V+nbq0PLbehV8YoRpod0sM8TNdqegSDGSkt2gvRjWPQBPGn8K6bh+myVyR9Tc5UE/lLgBtua13kWhwZuO7hiVKI60VRH2CkhlsxGtfgSAzTdJls9sqfUKw3WlXAHiO9rVoFK+/P7kvULHEitWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795755; c=relaxed/simple;
	bh=RW3VZirTHPIW66UyzCS45tHNq7eH8+C33ljA4Nll6ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS56y3w2BRXwujIsG0lYhCWFWUmlPO2EJaudUyNQYf9IyZaCxUWFwqlJ5Pk0PlfTa4JXR06sklEcjp5PAZyzEzdXVKg8BcJUYW4zrlAc4Dcp8aTpZIH8zwRq9ZM46apxsHMsCWt3yZ/Fs9w8TMZ1w203EJmhCkIGloGwYFMa0fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g95C0Zm5; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-2ffd5c3622cso564771fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 04:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795752; x=1733400552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwTWwA6azgLnozBWQBgEU2aEg7DOq4OXVVpm7/SKa7w=;
        b=g95C0Zm5icFPawGfuyhIa+KLv+MwhNzbFM1YSsW1F8Bf5DR5/yE3mNlX8xruokEXjc
         9gM6/92l2s6pjxAr8GuUOlCAS47vO7DPTFpwvZzeDzwv5Q3rUams2cp2Zny4M1Yq5dS2
         reuhGFhpyaa5e8ahzzmZgH8KTvQ642ViZCZEZwnX+bVtgURS4j2yW9GwVuSE1zBV0ffO
         fiImHbCqwPGkNZhxYiTGTJpBul0xWAlaVtLcrdRvjZvKCtEN20DpEEJAYoeI50YE1tXW
         YY2UDU9aT3V39nxaI1n5wx8ED/M9NdKK7++ucjdbmU7dtk+JFZAqrlpLwhpSciRtRkFx
         C0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795752; x=1733400552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwTWwA6azgLnozBWQBgEU2aEg7DOq4OXVVpm7/SKa7w=;
        b=VhRoXXkiz8j4qjutO5EM4f7hPBAjYmWgASo/8fqdfLlDWRNVwzjr++1xWe+CIQ4TfL
         V0F/hHn2RVBSUJfbFrPl7Y4V7Q4t8UHVY19QqbuMyKwKdXcrGtqKL72qC/TIRJfAVSC6
         UKg6+PtQHV5XgiWHeDb2LzVI0S3egPNogiGoQj+iZIhTp0tQCrTC0Emy7feoG1Al9FPt
         XG1x/RryDx7ES2Ob1eU3xgDo86uFYf3pqRr42Wl9M9RsOVwpbkSiTAOyiSszFQNm+Wqn
         hvjQRNtIocdcZgj4zZO+33n6o+JVIGSmx4nTydvmNIwYfU9+WjeH0v1dNwweq4GeTu35
         mgSQ==
X-Gm-Message-State: AOJu0Yxbu339s/nagUfPNBqbyng2PN4bHn7gdXPcKR9vw+5yY7ddoZ/Y
	TdRpuNUlkiirFCkwqrtlrshbEFufxphX27oXVGhWGM205sZ6fMwDw/5RFgUwfq8=
X-Gm-Gg: ASbGncubKJYSl0a6gMO/PlccPJRzmqEtSOaDBCMd5PTe7nE6D7a/e5teNFtel90Czns
	2zUGljhhxupwH9KgxgWil72MXqUn7UGFjAaUOtJ4tymFV1AJVOsgmI/cce9hqbz8X1wSOoMmXgz
	8oUl+1vtwO8QJxJjpVUZ5asDbENVAFRTcm6ZM7eWy2h8fgkM288iDoD00W69DxbOIwGfXtPHner
	JGX9gDPEjhiHElDWMc/vqC+JgZm9Noc3EHL3oHXiKW0sFRFXygTM/gkys8GQW8nLhW3QqPqvSjb
	NGiJdNj6c+gbj6MptK8wrtDi9Brm
X-Google-Smtp-Source: AGHT+IGb+CquWGoLlCxlMN54dryp8DwwxL61NpjsPl9cVKA1OdiBA+RXxSDRUTTEFIMowEslwGRMSw==
X-Received: by 2002:a2e:a583:0:b0:2ff:a97d:98f4 with SMTP id 38308e7fff4ca-2ffd60ab680mr9240231fa.9.1732795751941;
        Thu, 28 Nov 2024 04:09:11 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc9bd7asm1726121fa.94.2024.11.28.04.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:09:10 -0800 (PST)
Message-ID: <a73a3b5a-cd83-4f87-876d-ea99ef8bbd70@linaro.org>
Date: Thu, 28 Nov 2024 14:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
 <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/24 17:53, Bryan O'Donoghue wrote:
> Right now we support one power-domain per clock controller.
> These single power-domains are switched on by the driver platform logic.
> 
> However when we have multiple power-domains attached to a clock-controller
> that list of power-domains must be handled outside of driver platform
> logic.
> 
> Use devm_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock-controller driver.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Please simplify this change, please do not ignore patch reviews, if you
find it possible.

https://lore.kernel.org/all/8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org/

--
Best wishes,
Vladimir

