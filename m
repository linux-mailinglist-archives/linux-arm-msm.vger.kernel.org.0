Return-Path: <linux-arm-msm+bounces-10568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C085098F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 15:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7E391C21A9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 14:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D375B5C1;
	Sun, 11 Feb 2024 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P77ZHI2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA145B5AD
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707660195; cv=none; b=ojwOc6+BOJjeID+k6NQrer8QcDgb40FglQjtH1bYwe8KSXrSFt4rMEi8/GfllqB1cincWFbk7pVM/czJz8461EHhpFaai4i0KNB1doyfzym39KbsQDhypITM73ZZScSTlTfNdaKUlHvHdR00clx/nFwGNNFjuWnujQ4axVsLrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707660195; c=relaxed/simple;
	bh=ySg49wH1MZl+TZqNmO/+mV1ev47mu7e8Xx/aZ1DcnfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIuNzySBPic7J5x2FdjHZSvHePexQzpstvpk5kCEBcCyvpSXrk1WZrWHGUvNpPA9eX65fz3Lm3zqMZJYYxaQ+ncEqmQF7o4jqQqFgAeVCLBftIcMlTcp6wXbzSCzfHtLQd/x5le1GTGWiS4xw+xYCnoWFUYD9nNzXo7ILjTyndA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P77ZHI2Z; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511821e60c2so1106406e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 06:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707660191; x=1708264991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAiPq5tNzTb60mVNrydYL8AHp7cdOEZ2hPHL9RP1nhk=;
        b=P77ZHI2ZSpHgs/z77pHVloyFD6nJJQzWwTYwsf9HqA1e2ePRkoXyUS07UcCwxo2wla
         wksKYkBwMYTgsIH0Dt2CJE02hyhfdvNtlqGoL1yL4EtxZHokfGzNcXqiWhV0YuRvuGF4
         XoSO7iiCZ0RjopDV+V0u6hgQO0E5pXT4mijCgsziqng56z6wKgZ3bylfbQiyCZruVcYa
         vJxQ57F8sFXwSqvZGA9E4kOzywIwfRY69C/ldMp9xLqqpC/XTLzKCehX5v2slIfbQqPZ
         BZ2KHWzlnqFvCpx2QwbpZd9k84hoyNntlQ0dgP2bkUnOT4vD9J5MyXnT7cv2pBVYE6/0
         KstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707660191; x=1708264991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAiPq5tNzTb60mVNrydYL8AHp7cdOEZ2hPHL9RP1nhk=;
        b=NVcPx3sS4gtKrgJ6bwoAaafVRZ+4MobOlVsGaQbndRLxiyDpWeK6BFlVWNpZCMwxmV
         Wfcfi5mVpFMB74PsXFJUUPzv1wFcvccQC7MwzVQ3tQ68bf0Zdrp4RYIsaGcBqNthSkJW
         alRunnt30ZTwzVSKylLdmqwM4/tIRZ4I3hyuZIiRMBvW79GBQ+QRzgiN14h0LzUynh+3
         u/a/k95avyp2VKM20xQE08MMH85iucuo05qIwgDIgRJrcpx04sYdhfBV9Wpgi80/3w8O
         qIpfUn1yy4EBa6l5Lx7PRTuu6cjAYks1/htQs9HNYM3raUk+kVK+4vVbIy2Z//qSrnHP
         5JVQ==
X-Gm-Message-State: AOJu0YzMvpLVFQrJv2nkilJCoiQ44ViTajGAAjCCzJOaLydUDKbmtgjt
	EHdNvX5/MEQrDOvav3Vsh9TgLExUbyd2x2EN0fEsj394crIZU6d35V2Bhgo3+q0=
X-Google-Smtp-Source: AGHT+IFmOYQ2uOygwqWQvb0NdADcfGJ+ql04N10YhFZBS8I0ZQklhN/UE4geAdPvvx4DbEyLOQ2BkQ==
X-Received: by 2002:a19:6458:0:b0:511:5040:f6e4 with SMTP id b24-20020a196458000000b005115040f6e4mr2677546lfj.56.1707660191608;
        Sun, 11 Feb 2024 06:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmKVLp3Z2tNvlHniQPyssnoVK+/u541BkjLNkhjdnf8Hx+C+ixrT8uJ/sbAkUNYrymBJNcsKLaw+aK7aOiQ4mFixfL+gBkL01BikrKNDmwWo/Fvl9E405Rrab6zMlXCw81V3WdllPcvWKVsS/+gVsnWP1ZtGXVPkBBc7dAK7KFJcxWHdWWmrtaaVgA6gppKkJgpWlOvDhsFMEUatQT4mD/mqtQGMCzEoRPDfXnIXj1IbvNzFyuhQVzfRh6fpN1Hi3S5f/ewwHwifJpnMKkPvcA1YcqZPIUDeeIyy42bqFauxsZz9z8U/7mPAU8AYWOp4GCYZKXij6RATXTXgziCXRqG8rKiU+1byMSoy2Rb/cHtMzXTmDJAcunyM3LBZzzUfi5J0csv3sWmlTApi3PYopcKh0c4OHfWJXvlJgGukOqhxS5Yzx/N0bcWLUAwoAQVK4TRSLcRws0ZOF8DQArQ+So6PdLsJYHgQCCDJ5vbBhyA4BAf9XM/BCUlf0BW5FwAepGn3y91O9F8By9VdoXoWVfca5496ufgacd+Nr0GJ/JXGXln/sZINAkkZFUyUh9KQlLHwOK2faIviB+jWYrD3Wa5WfaO5jRuSHcz6q/igGtHMpgzA0g+iEjrJwGw4dxU4ZZP0+riym03iBT
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c4fc100b0040ff583e17csm5961987wmq.9.2024.02.11.06.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 06:03:11 -0800 (PST)
Message-ID: <75b0161b-498b-4969-be48-da933d7515c1@linaro.org>
Date: Sun, 11 Feb 2024 15:03:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] dt-bindings: ufs: qcom,ufs: drop source clock entries
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>,
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240209-msm8996-fix-ufs-v1-0-107b52e57420@linaro.org>
 <20240209-msm8996-fix-ufs-v1-7-107b52e57420@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240209-msm8996-fix-ufs-v1-7-107b52e57420@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2024 22:50, Dmitry Baryshkov wrote:
> There is no need to mention and/or to touch in any way the intermediate
> (source) clocks. Drop them from MSM8996 UFSHCD schema, making it follow
> the example lead by all other platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


