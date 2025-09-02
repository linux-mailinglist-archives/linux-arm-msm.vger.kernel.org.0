Return-Path: <linux-arm-msm+bounces-71495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B95B3F504
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B593A3A8B93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C7B2E267E;
	Tue,  2 Sep 2025 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eq4Fo0OB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2946E2DF158
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 06:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756793248; cv=none; b=AcwXDllGPaUpbVT4HnZc3IEDX6Z0lVjfYmgBQGoLmpXNU0vtr/uPMZ9BB4Gqb2GeNgPJCBzvereES8oXOpCLiE+fd8RtmmoKc1fyA1hW6YauaCPRAKOWRFfZn+EDshFziqXligoyurasX/QGHx2odvwdillH82vaK8ur6YjFveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756793248; c=relaxed/simple;
	bh=lcRKGuBTIwV8aVWzCNRgaz6ffqBzMJw3nBGepR5YPBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEIWfukXTT3LU6CPvBjJxjqrAIQzF6TzX5cVQWxuXKlXZEdpA+LWhokGMY/v4GzMjRhH3Kgcn0ygc7bWcqgFP2lIenaob9JfS6H8Ely15tSXQg0QQBhO0xWSuBD18inBJiJd7pdPqKWCIK9JmLLnF9fL0wbO3r1R3uo1BJlvFlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eq4Fo0OB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3cef2c300afso630150f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756793244; x=1757398044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t/B1FaoD/CzixDmOU5vubVEgdSvYSaE5OyF1FY9TFP8=;
        b=eq4Fo0OB48ug0o42blUy1TViLJd+GzMSgN+8DH2C/hOMuIRebDXsv2BqZZqXxGRa/5
         zFXFcdODNkSlMhE6m2hf7yxsMmUc0gWjmFTBqtpUWEo3otBFUWgXmN331lNSLx2thxs+
         UTScoh1dJu/XZHOTw7TN3+fpmGdE7ehfXNVInmG9Lcper/9RgqaDXzRE1DR1EbiMQTmD
         fLHnClYL3IgSM4KpgKgNbq+wy2n0OsepaNdE3XrAJkuTq8V+/JLEdYc+yaYQoc0lxqYL
         XgZPpqceiU6YyHB9NcOD46McvsMvf/h/Ao7r1Dc08TQ4aos1pcx8H/9FMamaPvtZwpZ2
         WbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793244; x=1757398044;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/B1FaoD/CzixDmOU5vubVEgdSvYSaE5OyF1FY9TFP8=;
        b=giWBH1iVrD4Yz8YxxVleuGCAiLPpvz0rnw92PLqWG89pkVgsRnrxXeeEQGOi1DDl7i
         DrZE2QoWCuTSLI5hihEUTKGEm0gNl/90vt5GxGtnD8VFcfmT8wT0o72hOaZII/vh17Eb
         KyVJ/FKuUku4YfWBfpWXyAHPNxRMXCwNHF0l/TkxIRHyz2MK1OCvrv/GXPx9X9twWMHv
         vMfUbYvOu3WgIgaW5hV175W7i57XgdV3WtB9Zytdh9A4M9FyqNWkgpNa8V0K0TEbXTji
         C2CQVBaFkrJVa4h/i8JMLYsVS+w/xei8XRznY8NiKpVXGJbIHpPxhwNHjQldYl3e3o6K
         HP5w==
X-Forwarded-Encrypted: i=1; AJvYcCXCyxEkK8fia38v/Vz9vv0d7kssVrOVXDhKZrRyoFkYJNIwCSoSfModXcqN571WFY/Mk5TP/YzbCj8nUcn2@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7EqoalmfLuMlzc73eS8vDkHyR/OdJW97xXMAC9fgXvF0f1Tn
	b3neXXY1GlhUFUU0qQjqA7QEtMGpnVFZvbBrQiG/K4/wumaZXs3lbRvbfOF2i+EKdWU=
X-Gm-Gg: ASbGncsOL0jm31kePXbyulcFSuhC20WiWDAlZw3Q2PoMrCoMNPcA8mkewNURnNT0C27
	ulOKjQkcW4KElgXtnq5RFDHHOsrAMC5CE6o8aVSq0K5RsEZsebUt4DIjbRLaNeLN2mbA9yv/aw6
	zBLBYtwHbL4VhoAh4QsHIYRj6D65Rj09cxSvVIoSSWfLXvxFPVhlvhAuFz6XpViUU34vbSv6nyR
	RekWK1kY6riNDRQTo2da2apaV4dJdKngiz5OUWo9+uKgk4+nSgOfRqI05tZrl+CZVfKxAfobzCx
	nrGBP8vOXjCD0C8bDPbiey0xbJjASTpt5581pTvstGbe4qZ8SpmWXvAzuiCl472UjDKDNv6tRg3
	ToYXqSbCh089LFYLAGWx8sZdjUT7vvrDr7feoGe/96AaYrpl455jGpQ==
X-Google-Smtp-Source: AGHT+IHlJQa2ozPDy4pXB3L1qvYBOkak8WzZG+cqww52jrlmExUNErZsn4LdUbYEor0rhiu5nFzizw==
X-Received: by 2002:a05:600c:4f8b:b0:455:f12f:e3fc with SMTP id 5b1f17b1804b1-45b81e92f7fmr56974255e9.2.1756793244503;
        Mon, 01 Sep 2025 23:07:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm186726245e9.0.2025.09.01.23.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 23:07:23 -0700 (PDT)
Message-ID: <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
Date: Tue, 2 Sep 2025 08:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP compatibility
 strings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
 <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2025 06:04, Dmitry Baryshkov wrote:
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -2249,7 +2249,7 @@ opp-560000000 {
>>>  			};
>>>  
>>>  			mdss_dp: displayport-controller@ae90000 {
>>> -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
>>> +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
>>
>> No, that's breaking all the users.
> 
> WHy though? Both old and new lines are using fallbacks to bind the
> driver to the device.

Kernel has sc7180 fallback, but what if other DTS user does not and that
other user was relying on sm8350 fallback compatible? That other user
won't have sm6350 dedicated handling as well.

That breaking of users I meant.

With the kernel it should work, assuming SC7180-dp was introduced
similar time as 8350-dp.

Best regards,
Krzysztof

