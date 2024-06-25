Return-Path: <linux-arm-msm+bounces-24178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219D9174D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 01:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C19A0B207CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8225017F4F6;
	Tue, 25 Jun 2024 23:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkUSQlcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1885EE97
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719358758; cv=none; b=B/tJ8tv/RjLRTANuwwdZNXIwFPqc/YyN+0C0bHFs+d2/ZHieUxikKuMxvs4RRF+tslhVh81wre9EM9h6QeebSqcN6d9oUeCOF5OMcNI7zzVPUzEmqSLQvqar0JL77KzU0sYCsFWt2wwqrRdgG1hHMA8+BxcooOH6neo/mcDoNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719358758; c=relaxed/simple;
	bh=QGNSrDndDsy7znAyv3HWUXfitKZOGxn7Hlaptwk5My0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INo9f4OOm+eZIvSkfRgmt5rv8XrYyUq2uz+yTQkrlXpJ/j+zaalv4fOlSb4fdXAJ+4A3D9yOCu/6ZcLrbCZVsIvwGT+V0B7IHGMdsxzZYohZvuIAt7w3fpIMWFbSCW+P6PNB+vpqcBmX4N8mQcK4R/E1lGjBzfclFlYFCsnO6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkUSQlcB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-424aa70fbc4so4677225e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719358755; x=1719963555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJjV12XAs8YTnmMTkvXhbzSiugdS4KJZNqWtwvtnOu0=;
        b=xkUSQlcBnbF4toqaDFFLQ1uLKJH/KAPqXMZhGUZEASzWNqpBWoV/eDdwWQjpjizIx9
         v8viSCRj3k9mPO7xX9eAgG4c7awfM7QkR0CB9LHX4sRJzentMiRL5NXXFVJ7u9hQPUrp
         oXVQ/fk5FtFXzQ+g5bgM1JFEDpV31LmnLDryzdAxFKH3/pahXuN64P8i4Dy2PVwJyCqP
         MX8xSy/NkxOuWRbz1bfifQuwfzcf7UWoNlZreyu+oaeLOE2NuAnnqP/AtebZhU2BInV5
         NdP+lSmcW7cSSx+hqDk6ugLBonaZLCvZZ9+1BshBv3Nq5U46PWZhQiecF1x+F3IZ6rVG
         kSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719358755; x=1719963555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJjV12XAs8YTnmMTkvXhbzSiugdS4KJZNqWtwvtnOu0=;
        b=AdSXutEAk++ZN7zTHCfI/rcAUPMtYN/JoGB/mjrnYzSy742lpnQI4xnkr0ZD5uG7vh
         ky1VS/9N+lEchB+ZZIJyLCeLwe5g0AqTfsnRzNeoxrHFAbHP4diTVqQCQfHRXdD04a2p
         5px0SE1381IFqZFXgq9NMQTt9R7EAZPqFcj7BdqsX37WqLexK/an76CGklPlynlEV+3z
         siUnR1xaJ5fRA7QdAycgKPUUUT16SB8fq/KBooc+Yo+QpmBV/ShO6hQTjsZAidiyZZxQ
         rX08G5IUPuMNB27iR7FayyfMOduzCKAtZ4EyoyudDoQ2bK8j56IPIvi8JXRsi27sCpF3
         xJiw==
X-Forwarded-Encrypted: i=1; AJvYcCUgwsb77o+TlWnzHNKVElT8r5MjiFP7ABu/UoxSeUDegHQvseXS00QMgmxBky+QEzEcIoWwbp1AopSqNiOI8SKW+bJGPzZ+x6Pgm9URPA==
X-Gm-Message-State: AOJu0Yyyeb7jaZKWTnoYKvq1/IYoF4GnLi1E5vSSm3Wtzd3JZIf6aJoT
	ElAQT3XHgp7qYLa35U7Gu2ShyMrMJ/XE+M9hKjQnu+11BdPm8nFQc+21yV7Cx8WaPfxL/UR97Gk
	QmTXymw==
X-Google-Smtp-Source: AGHT+IFA2Uu4BfBXGHIeU80NqPpZU+/Zs8jXP928i5OqkQLy2FnHSlXNYfDdGXVee2FNygHhf4p3sA==
X-Received: by 2002:a05:600c:434c:b0:424:7e68:99ff with SMTP id 5b1f17b1804b1-4248cc2a78dmr68196155e9.15.1719358755286;
        Tue, 25 Jun 2024 16:39:15 -0700 (PDT)
Received: from [192.168.0.16] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3664178f5f7sm14004988f8f.19.2024.06.25.16.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 16:39:14 -0700 (PDT)
Message-ID: <d770412c-e1d1-4e84-a72a-bc615294b5b7@linaro.org>
Date: Wed, 26 Jun 2024 00:39:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 4/5] media: qcom: camss: Add sc7180 resources
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-4-89ece6471431@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240624-b4-sc7180-camss-v3-4-89ece6471431@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> This commit describes the hardware layout for the sc7180 for the
> following hardware blocks:
> 
> - 2 x VFE
> - 1 x VFE Lite
> - 2 x CSID
> - 1 x CSID Lite
> - 4 x CSI PHY
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 251 ++++++++++++++++++++++++++++++
>   1 file changed, 251 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1f1f44f6fbb2..9ed810afc048 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -834,6 +834,244 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_7180[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},
> +		.clock = {
> +			"csiphy0",
> +			 "csiphy0_timer"

Broken indentation.

Once fixed.


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

