Return-Path: <linux-arm-msm+bounces-18806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E63ED8B5AF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2341B1C203B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FA47C6C5;
	Mon, 29 Apr 2024 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="LD+oAJp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5F763FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399706; cv=none; b=F2kAfW2VjUAMOfKCkxn4iznp0KHaxjfDKQD6DfN06bLrScjzaGoEeDWKv9U6Svh3w4vORCSiiSubZJd9TlFmsLqoEtyt2LFu7wAcT2MkuPbTc7tAcdphSvxDzCAW+IvnG96bCfhWqKroh7e7Mb/z42tkGsHDlyfHQ+MxA1IbZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399706; c=relaxed/simple;
	bh=WrCjqqS4I8VzWNdnSjP2v41ZlCPdZRUDzsyBoXAuSUg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D4rfPXkj8Qo/6BGEXz1cDZiju6N2MR+KBPIG055td/jfjqvoGTiZ9O+E6z0H6fxaVXF98ebuIIHdppG3PumTq2dUv/YLRzaQpIsJXjCUZzoytra1rFpRRc9bIqMV8Rke0UcVyRjXzjEqcmQ54R7t3+qOGVWXS+B90oEwN4tfGSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=LD+oAJp1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-344047ac7e4so3157369f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714399703; x=1715004503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGP2iA16V5Nst5OwKNnVBbqTeg1qcPV1rwQPISYCkp0=;
        b=LD+oAJp1ytflpXrnrbzP4asQgsLC/HTvdpRdEuh3ls/E8OP0pTerDOaB52bS8X5YtV
         QlAtriUgAKOxzNFmt3yTml8dR9UjECCkBlFEokalCSATLBjvH1zV5/+5FC+9DwH0B25V
         aBGd72T5NoeTN1dnlN+XbK8/3nwOnFLw9STVgFSb89uy42TFEx2bqGh18KBImBhSjfdA
         UCCRZo2CTBNBA+LdF3C49ydS5Nlrs8gSO0s+LrRKsRju/kkZFFmpkQ+MxGrlOWIobS4G
         /Sz1lVesym28O66XfvgQWNC0jrvLeENjXxmqHovbuaTaMJ5DC7Ldr4cePiiT78F68+ce
         VmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399703; x=1715004503;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rGP2iA16V5Nst5OwKNnVBbqTeg1qcPV1rwQPISYCkp0=;
        b=tGtlSrYuzvr8aVXnsFAOYwnZSciQIA5kwnhUfLGUAy27ZvVMuKRnZ8h8xd9/FU6Mdz
         gkVT+k5+cunYLWTl+ArgrN1FSqwwGnWbbSz8Ojjnj8ExrnsJU+e9PznItlAXJZckwl+d
         ayCLjaLFrc173q1mB8f9ZKbtKewtRnecwyrxdx16RJXgjKpo8OCR3Bhx9/bbFvmP+uAb
         Bd6tmVe/y15pDPXp9h9/sgnlCmgwn8E+TZKuX7IZcV31QWUx6e0yLffv/tIezhvS/45E
         ZhFgTtY76fFcDlldmRAevtuD0v3ZTFOHrIGNbrTD4KG1bydS5miYsJ04pBHih3gNra8s
         KiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIzSfF/0HrvURAgDkOVPYTU3Sb/4JjBZgQUUt0GeyCsw8Aotg5gn7mO6LSTMg5G152pd+RnGe8wi0iJuW6iGSViiWsNCJKHbliWCRzcQ==
X-Gm-Message-State: AOJu0YzCL9wB4Ub3YKt6dssstrLtooctLaL48NCPRh8SLK6GpWWs7AN1
	p8ku/axUIslMzBtqez4aqrrmIK4CBK0QuZkXRrri3oRBv8N/iZErGw6AO9jarSo=
X-Google-Smtp-Source: AGHT+IGZQ41fU/EkV4HmK7QBpPzyho5VaflH4h8vksb+XnkyV8QbMyfG8zg8SLKLUmGItkgqlupe+A==
X-Received: by 2002:adf:f3c1:0:b0:343:8bd6:97cf with SMTP id g1-20020adff3c1000000b003438bd697cfmr5372945wrp.35.1714399702664;
        Mon, 29 Apr 2024 07:08:22 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6881000000b0034615862c64sm29585477wru.110.2024.04.29.07.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:08:22 -0700 (PDT)
Message-ID: <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Date: Mon, 29 Apr 2024 16:07:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Language: en-US
In-Reply-To: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The ath10k driver waits for an "MSA_READY" indicator
to complete initialization. If the indicator is not
received, then the device remains unusable.

cf. ath10k_qmi_driver_event_work()

Several msm8998-based devices are affected by this issue.
Oddly, it seems safe to NOT wait for the indicator, and
proceed immediately when QMI_EVENT_SERVER_ARRIVE.

Jeff Johnson wrote:

  The feedback I received was "it might be ok to change all ath10k qmi
  to skip waiting for msa_ready", and it was pointed out that ath11k
  (and ath12k) do not wait for it.

  However with so many deployed devices, "might be ok" isn't a strong
  argument for changing the default behavior.

cf. also
https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 67b8374ddf02f..4e6245095adfc 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3234,6 +3234,7 @@ wifi: wifi@18800000 {
 			iommus = <&anoc2_smmu 0x1900>,
 				 <&anoc2_smmu 0x1901>;
 			qcom,snoc-host-cap-8bit-quirk;
+			qcom,no-msa-ready-indicator;
 		};
 	};
 };
-- 
2.34.1


