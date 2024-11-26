Return-Path: <linux-arm-msm+bounces-39232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1179D9FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 00:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB736B254FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 23:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC01DFE08;
	Tue, 26 Nov 2024 23:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUu5Kvny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331A81DFE23
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 23:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664726; cv=none; b=PBhzc9HBpN2eWtw7UA0trASAU4OUdGBVk04Z5wS+NpayKQbLexn6+iAcgHRUvtI9dWpG7xaZ7nLIn7DyyDg0DMcv+19EtI4uTvafAaF6YzNRt0SJWzvttTBMXDz7h4FZC4F+uV/LLMGKuubha8VjK4U/S6J3b9/rv8RCfxmNXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664726; c=relaxed/simple;
	bh=VXT7wVN1rHLhIih/1QX0aBa8H8bgdCdyGTEgIzvjv84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrUerCuHUSnvSwTwDCsBOF7JHzvN7eKQqkVuPgAO6qzCd5+6uRQvhSAGr/MDCMnCQLgGrhlSIpRZh7CneHkib/NuPQZXUKPQ9XiGniVs+WXqVm7LGCTe53BKssXWzo+zrC9kVmOE1WCGlXYkav8f97gyBGFxH7vNFTyLL806b+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUu5Kvny; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3824709ee03so4460971f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 15:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664722; x=1733269522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cTIQDR6gO8Gy9gR3S1W7hO6fiHoSmnxEdBfKcw5IXcY=;
        b=IUu5KvnykpEN5he7ICWm0l3EJpE8/4nD46YhWU0Hfh7/i3UoASQzhD9I6WP04eJ3s6
         8GkfuZbXWL4D0fEm2HevL7C98r1pJUtdMn22kwuurNYeTO8qFFyEMrOS4e3Yl3Jm5L0K
         bEuzq6D42xrQ3tf7cR30sCh2SGRzydbQjQenLEgwKOtPU+PivgDDlrnJLAHdanQGx5Tt
         J/AhgvYc/AWUYFSSF3NsB7JtnWkn/nTaaLqpMba7mpxqB6oCCKZFMqS/VYJeaYALVAxu
         p9iQtFiVigKptAVFH/RpHhLXE6EcPlmU0EkS1Ai1wA9NaVfXbd82En+KdMRRCvebE+2+
         wkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664722; x=1733269522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTIQDR6gO8Gy9gR3S1W7hO6fiHoSmnxEdBfKcw5IXcY=;
        b=YvTfTuTpHumjEba4bJcHGcFw8w+OWVZd+IjroiuszzSrd7AizHqBjS1THMq161Oxo7
         tUlor/SVzrKngMOih1kHOTyggw2yKSn/HGP5bVarrt+AOYtZLq2197fMoP+XG0L4bTaK
         2RVzCSArxvjI0TkC/UMekp8dZOLnMaBQHc2cjJAb9VWxqJzyLC1b+lXrL8+xXhy9R3ud
         Ye7HKmQKuXW423Wg3R7Icqz/R2m60EAnBhuuslfPmNXjXUQ6uAI4kPtC8Y7od8ytwTH+
         EyfO0nlubNGUhN8wMI3moPn9HtekfVKFp/8AtSz4BTHLNt3VyIUwcGz6GBgtTtgLX1q7
         tdYg==
X-Forwarded-Encrypted: i=1; AJvYcCXFMvt8IPaChPjtKN1gIJYnKfvJY7pzWUIzJRNCSc22o4vtWfjZ0jPKIt5WJHDxkdfmSv/4FZBHD40nMyNj@vger.kernel.org
X-Gm-Message-State: AOJu0YxISCbz5Z9D5YwRiq3QJjCXZgbJil5kT7+FfYe48IulFpI8weG4
	zdLz+A2dci9Mq5dgeR8zIBfRKUxkLmW5od8nomDlAriUB/sBr4qq/x4iOcXEOjI=
X-Gm-Gg: ASbGncthHdEmC8zg3WTfPCkBzHC6uP6JvKLd6kD3J/fj5XNi0i0SSSH2Ro7wK+Z8zKk
	3WWmxqWo40sS27AHjEN/keFPhk7YCLOgEheuP8eOFPqi2eDw4QjyGb469R08KufhMiqmUh3Msle
	kuf0CZsIbm9DDHllff+ztZU0PSlJc81JrgYjSZhUqZ+GdVBBXfoLVJXGPO09Q/DwrNS4CFp29hw
	2n+Gs8s4gPm4C/r7iKeqCt5BYs213qdI9BCHJLTCcNpSt/Zsby4iovlsYlKRjQ=
X-Google-Smtp-Source: AGHT+IGgTq9G93zWAnGOsfichoeaSKEevf+t6zRWeozKkzcjQJicK+VxCL2bOFNMReJ5cRUfsxifbA==
X-Received: by 2002:a05:6000:2c6:b0:382:4a69:ae0e with SMTP id ffacd0b85a97d-385c6eb697cmr583035f8f.14.1732664722646;
        Tue, 26 Nov 2024 15:45:22 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafeceesm14595766f8f.37.2024.11.26.15.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 15:45:22 -0800 (PST)
Message-ID: <faae3508-5dce-4c38-a344-1d35186e0909@linaro.org>
Date: Tue, 26 Nov 2024 23:45:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <zhhna2wni4yqhnc2tqfc2ugril3h4kzbyr3ix6vpwrgghwytfa@kjfpff5zdl4z>
 <7a52ca1f-303e-44ae-b750-6aaa521516c3@linaro.org>
 <ava6dkmz5g725skafuqyb4rly3qna5z4bhfmrqgogcmdcubzf3@eu4odajw6e6d>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ava6dkmz5g725skafuqyb4rly3qna5z4bhfmrqgogcmdcubzf3@eu4odajw6e6d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2024 17:23, Bjorn Andersson wrote:
>> I'm finding with this patch reverted but, keeping the first patch that it
>> pretty much works as you'd want with the caveat that gdsc_register ->
>> gdsc_en -> gdsc_toggle fails the first time.
>>
> Can you clarify that call graph for me? 

Ah no my apologies, that wasn't the call graph I realised about 2 
seconds after sending the mail and never corrected the record.

Please see the v3 of this series instead.

https://lore.kernel.org/lkml/20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org/

---
bod



