Return-Path: <linux-arm-msm+bounces-20637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B18D065E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 17:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED97B1C2220D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 15:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC3661FD2;
	Mon, 27 May 2024 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="bBYqcC4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8E1EB3E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 15:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716824421; cv=none; b=NtmgrhQxc7sM4mqaCxBgRPHsHKHa9QNE8Xzhm0CwyZZVY3cvtqK+/iB9BmofnIKs0WoHnJ+U4wvMo63X6ZRbIyWiQmK0GjnXGy95wtk4lM9ReIK0CXdt8/+faf6OAwucevKuZif6WpObcfEDCqCbUWfeRFOa1iT47Nm2KB1PEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716824421; c=relaxed/simple;
	bh=DVhtxKy/g6Jw9Zac26mbMJkQSFj9K9gpSNpyZiB8W28=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cHvIKjyjYVgAASVIWXbA8r7awO8SdYDpD6bodyFUMnt/MkI56GKC21qVGUeFy8pgJzRRvstQevls+TuTCWXSGZMQpnv9RzPd3tNJGwp0DV6OElMMcNt9QwsaWAe+OJYH+2p0HofLVgeBD4M02zQf9p/IhqVrhKe0Rlz8us0mjwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=bBYqcC4z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so4681379f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716824417; x=1717429217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVr9JrV0nG2+wTrmTNe0v5f/mYkzf+N7lyxDsOb/dPs=;
        b=bBYqcC4z7kpd20ffWLgjfuOK0qs4+++S+dPK154UB4UXNqcVmRCTZH48qjalexLZM3
         bPvVHAx28YtAeejvinA4tSJqNGcT7kDFnA1akTZv6QAafokb75Yf02A6UbqrqCoeBs+/
         vwT03OfADKLi06ymH8Fbm1RcSFkBYIedvZv1ZjRBdhU/QSw9IovIeu2WbaRoOeY/Tbpe
         s0hcqLvnhcehGjgl7T1iIwN2oWTIfuOT0fIvkjtqSjnxFe3oZzcAIthdd8lXXlNjnX69
         WOz1iN5vK/QaJvkl9pFsbd6m1sjlRxIYIy6PK6Ly45BJyg8/AL/9AzM8wZvCuSjE3PFY
         xGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824417; x=1717429217;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVr9JrV0nG2+wTrmTNe0v5f/mYkzf+N7lyxDsOb/dPs=;
        b=C/9WKSw7zOaNYPdSPD3fq26AuqVSip5FqkbJmC24bQVeGX6JCXeHMac5b0m5boxvJh
         57WeRbgsgEytJBrsJTarxePgp85mnZShcrVzDrAN4tEmF2Ng5F+jE+M9DkLc20M4YFHH
         Hwqn5noAnfiU5bO3PHEVaqsr02BGwOGinped9HJ6QCpFUSBzEpanjulprSOcbZDpvXYv
         LNfmxquCDSxneP9kvMruXpwqs7zNtU9YquuxGjbqYqntv+LU3sjxEx33Uv1rKmRoVPx0
         C1Va4I8seu6M/0k0+j7RR+YaztwlNpEGxP0VZwffgg7aZfUWNA3FOy9R6ay+obEc/OpH
         uJqg==
X-Gm-Message-State: AOJu0Yyovk9XvHTlRGJtH0pW9sZIsj/h/3DJdXazMoPMb9AoDoHFfO7U
	hcVQBDl98SgWfqhQ3o+UHBUpbh7gQZ7N5zY+dlTXvTh4zx9g7sEyY1pI0vQ33Xo=
X-Google-Smtp-Source: AGHT+IF+VR8zvPqcmS9JVDxwhcv/vAODOlwnqPTA2SWhHKo1nHb3CASRkC8D7fFqdeGXUnHZPETx3A==
X-Received: by 2002:a5d:5050:0:b0:355:75f:2876 with SMTP id ffacd0b85a97d-35526c3d541mr6991025f8f.5.1716824417139;
        Mon, 27 May 2024 08:40:17 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a090366sm9221319f8f.56.2024.05.27.08.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 08:40:16 -0700 (PDT)
Message-ID: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
Date: Mon, 27 May 2024 17:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

MSM8998 GPIO pin controller reference design defines:

- CEC: pin 31
- DDC: pin 32,33
- HPD: pin 34

Downstream vendor code for reference:

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400

mdss_hdmi_{cec,ddc,hpd}_{active,suspend}

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index edf379c28e1e1..ec4e967ed9b2a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1424,6 +1424,48 @@ blsp2_spi6_default: blsp2-spi6-default-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			hdmi_cec_default: hdmi-cec-default-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_cec_sleep: hdmi-cec-sleep-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_ddc_default: hdmi-ddc-default-state {
+				pins = "gpio32", "gpio33";
+				function = "hdmi_ddc";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_ddc_sleep: hdmi-ddc-sleep-state {
+				pins = "gpio32", "gpio33";
+				function = "hdmi_ddc";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_hpd_default: hdmi-hpd-default-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <16>;
+				bias-pull-down;
+			};
+
+			hdmi_hpd_sleep: hdmi-hpd-sleep-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
-- 
2.34.1

