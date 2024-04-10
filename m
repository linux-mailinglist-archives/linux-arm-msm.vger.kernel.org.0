Return-Path: <linux-arm-msm+bounces-17030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B777E89F24F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 14:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0371F2244C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 12:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F7A12EBEF;
	Wed, 10 Apr 2024 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="my+Ci1EC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741938DC9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752421; cv=none; b=oUTGYiVEfItKTzf+1Vhz+G2JNYi+6QFNlSQ/k+tPpQh3uzvH2p8m+xEDziKV4G0CmdrMf+cUAvt1MAFZs5247Im10D4VzQ1fBZTedW4HnK03VfP0SXU9d2Uq4tbQJM5qPyIKyKEJfObzy3IPKkT43YZAezhXGE/IyxWmAKVYtt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752421; c=relaxed/simple;
	bh=kc0dZ0e3JBP4lFFSI4x6NCpdXrRlKfuJR7I+rUGURhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHIKuqSZ4kWtbCcOsD0doWvHUmCDS08BOTv/hU7eGyaeRi4wUQ4cFyr9C5b4UAfjHxdyfE8Wc9zMNdBbQQAh6hakljH9/69dHimuePO4vFdtmKUUm4uIUtHtshA2UzGzAJOszGFonB5akwcOLGfbIrmU0q0rr87JQhWAZCcSxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=my+Ci1EC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so6332225e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712752418; x=1713357218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDmd9nV27QdHdemsMkqkYQn+1GeM6AqMiOUOo3y6Fjw=;
        b=my+Ci1EC6LFP1uNlc+2L9Q7QG94FJ9VneXVizCT5QCKFlmuzMsiz/cSSHQ2qROw4X5
         z1YYWQz/bAJK+bbkmipK9Ry9eFIL9n+Cp7vWOfap5+W91fRBb9pfaxTsY6SGu0qJQfut
         GxItmnci9XDh1ug+p/VWWe8uM70NR9LG+IPtNIj7PvnaQQWf5b5B8MJOcsgImfzlGUK6
         p0LmjzUwotV864u5ItbNFNqVVp6CgeI+/5A3y0hOMEAhgHy02xQokRnO2NVC5a+limFW
         oZhqguAv4RhIKxwS2w7cOoJfQogMHZOhm6H4Nxz9RyObmdTTHGRRNZOMcVYz3310YHCl
         r5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752418; x=1713357218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDmd9nV27QdHdemsMkqkYQn+1GeM6AqMiOUOo3y6Fjw=;
        b=Iav9AMhB5shXmLePZeYgzSCqOYVyfbXA1u6RsGkEwsrqqkgs3rfThej+Aa3QnxZfuT
         gc0PnmARQ4ultO9hXEz1hqUMpMBKr2TU5uMc3dlu1zDl2M5QgeQmDhUP+q8VeHyXmiwt
         Mji6UP5hQtoZiuDoxKGEPksBCBf3oFQr/FuPlNv1wGzj/RbX3SmKN5RtXVKVJNJjivUC
         ypV8IG/vf8U7voO0RYls4sevRK3Qng107vRBCSziiYDx9LMtvv/ahbIbQFWNI0SXYKdM
         fIZdchf2x0+J7XPIKL1qG/2FMEWJT9C9RJavf0wPSFQmDs2upkRGbexdT+lMhLs0aTgc
         Mzrg==
X-Gm-Message-State: AOJu0YwWGoNBUyINJsbFYHLLpI08y0gomCFJGPInshAOMB6x1Sjq6b8P
	MPFa7KM2F2qcliEqpVgaOw/rwca0B0fXpyp/X3fTj35T0ogxYC5NQ10hZVVvFdA=
X-Google-Smtp-Source: AGHT+IFTii5izHkTaj9l6tWb307f9H7wWwEJ+dZ19x9pLNKHm+gaZZyS5VFsXUAMjzM4j2enKnHtww==
X-Received: by 2002:a05:6512:484d:b0:517:b2b:6ca7 with SMTP id ep13-20020a056512484d00b005170b2b6ca7mr1521768lfb.59.1712752417721;
        Wed, 10 Apr 2024 05:33:37 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a3-20020a056512020300b00516d63a315bsm1737647lfo.104.2024.04.10.05.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:33:37 -0700 (PDT)
Message-ID: <17b279d9-e353-4d72-8606-0780ef7194cf@linaro.org>
Date: Wed, 10 Apr 2024 14:33:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs
 to new bindings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20240401-typec-fix-sm8250-v3-0-604dce3ad103@linaro.org>
 <20240401-typec-fix-sm8250-v3-5-604dce3ad103@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240401-typec-fix-sm8250-v3-5-604dce3ad103@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/1/24 22:33, Dmitry Baryshkov wrote:
> To follow other Qualcomm platforms, update QMP USB+DP PHYs to use newer
> bindings rather than old bindings which had PHYs as subdevices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

>   		usb_sec_qmpphy: phy@88ee000 {

This unit address also needs to be updated

LGTM otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

