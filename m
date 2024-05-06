Return-Path: <linux-arm-msm+bounces-19238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E015B8BCC22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 12:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D18D1F239F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 10:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C310D4204B;
	Mon,  6 May 2024 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="gZrOyVWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B247580D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714991975; cv=none; b=IPSeO5KcgjOVlDqa2VutHBW/s+wUxeFLJkcpeFeb+JuC0TLENTmbWl6eTa/fuHChQr5UYKcc54UahUJYPeyUhPjFlMy3dGg6K2DauWwOQUcUvYcT2FScZvO7YTZDZo+XRhkYbtFTpoWr9mIOwCIf/13O3glmjmJUn+2MIg5TJog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714991975; c=relaxed/simple;
	bh=VCaKT5u8lTLVTjXueD0jCJ5iZBZGDGU+D3AGpglbVzs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HwGDKXPdBB0OimRtBuNuX8/RtJNgK1mZ6NCIFH/iFh/0Gdcn0Eq1rYjzZB2b1zOvt5ZorJ8DwudbkpHUaLP4KbwwiwoYTqkWHca+xN2uD/rS3J37P3909DDv1+E6O/ED/KxLHqKwnOy5iSH9ZbmcJAxr1/75267yIOeNITo3oS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=gZrOyVWT; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a64db066so399730966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2024 03:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714991971; x=1715596771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaZ3b+wA8MZ5j8DpPLxbQdJidq7dsWbxXymGm0E7eaE=;
        b=gZrOyVWTENpaMGslLhdPvqLVxXNhtbtFWf3JU9x9j+2URHXq+uyzi6m4aHjHYYO2mQ
         DIAkDZ0jKM+zTbzkFgfdjWxybEWMFPJXtO69ED4QdCqSbvcNg8JgB1msaY/uPoCpXzT/
         Bs9wJoeGgukaJC+bdk1kz03vCc4YEvXF69qjKg9M2vO3lC6njIB2J9YeSlpMETTNFOnC
         AyDlaZG/rAZtNANYfbd0Rtefe/H0cr9iJiyl2hOCqKl0W9IJQMJNIDz0EQ/z8JVxQqlZ
         guXJrks0hB6+xuKRHl9btYArEBytF36L1cp9AZrSICoSAIIyaYFNwgAO+sANqyx5FqL/
         1V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714991971; x=1715596771;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaZ3b+wA8MZ5j8DpPLxbQdJidq7dsWbxXymGm0E7eaE=;
        b=hNx5zLTBhc8SvDZx5cNQnQYLjOO2taepvVaUNCISfjvuinTPsp/+iu9E2zkAINk7Db
         i8uNWLC7YNXVBrm/EKJLdM/0Am6O/FetRTlu/8GV+30ZyU9RnY2/qVvULrJZ3AAhxblo
         WeI6yPTDA/aOdLzlWRk7XqvU7gpKcbtnoG44NstDKlF3mQQ4B3PLcwkKe4u1vUbI+0rA
         NbzE1fBRzZrAhbvNHp92kLpYY8x7Fpp/jEHqQY5BOF5A/nBpClKngmXjtgXbl84pZ54k
         gRqFzrnGOBfueXLgYxxF+XuTNIjzHw+Fpo6oduFjymzLN3TnXd2C7mqYfmzul6zR8bgS
         2jNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhFfttN9ap3dTc5FuNMDDI12ifF37oH1Lx8jBOhtoCBg8Dky/yVmxvhmEkBiRkA/cnNdvTAgoVrbumt5iGXFsY2+5K/aBfuvAozQjmFA==
X-Gm-Message-State: AOJu0YwkDHON0fUSDcaVDqql1xFTSBbVO2Ltn3cETJw4UeyOVCK1/bTu
	Xc95EoSr+LIBv3LBn8jmkC1m5EdYJ1tQYBAkpbGr10PFw9eJ3c1wakWP4SWl+O4=
X-Google-Smtp-Source: AGHT+IGx9LmYxtU/pPmXwTNmUrrwCTPVyDDzwM65RRchtvkrvBiT8EBHMSY9rEMAgxT0sUZSnIarQA==
X-Received: by 2002:a17:907:94c1:b0:a59:cdc9:6fe1 with SMTP id dn1-20020a17090794c100b00a59cdc96fe1mr1817914ejc.19.1714991970848;
        Mon, 06 May 2024 03:39:30 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ao17-20020a170907359100b00a59c3024258sm1809387ejc.84.2024.05.06.03.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 03:39:30 -0700 (PDT)
Message-ID: <02592b09-8ab5-42ab-bd6b-6db79722d708@freebox.fr>
Date: Mon, 6 May 2024 12:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Content-Language: en-US
In-Reply-To: <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2024 16:07, Marc Gonzalez wrote:

> The ath10k driver waits for an "MSA_READY" indicator
> to complete initialization. If the indicator is not
> received, then the device remains unusable.
> 
> cf. ath10k_qmi_driver_event_work()
> 
> Several msm8998-based devices are affected by this issue.
> Oddly, it seems safe to NOT wait for the indicator, and
> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
> 
> Jeff Johnson wrote:
> 
>   The feedback I received was "it might be ok to change all ath10k qmi
>   to skip waiting for msa_ready", and it was pointed out that ath11k
>   (and ath12k) do not wait for it.
> 
>   However with so many deployed devices, "might be ok" isn't a strong
>   argument for changing the default behavior.
> 
> cf. also
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 67b8374ddf02f..4e6245095adfc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -3234,6 +3234,7 @@ wifi: wifi@18800000 {
>  			iommus = <&anoc2_smmu 0x1900>,
>  				 <&anoc2_smmu 0x1901>;
>  			qcom,snoc-host-cap-8bit-quirk;
> +			qcom,no-msa-ready-indicator;
>  		};
>  	};
>  };


Bjorn,

This patch is supposed to go through your tree, right?

Regards


