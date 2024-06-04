Return-Path: <linux-arm-msm+bounces-21607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 500648FB465
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808D21C22174
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8CCDDB2;
	Tue,  4 Jun 2024 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="c1pO2qQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B2171CC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717509056; cv=none; b=p32crCa2ssMse34jW9942YRLfwmrrskdDytBJOSwU2H3tZTNIttmI7H9tUPqXmhX25l09Xk7AZJM+nt4Th3G3MDC32NphRC8t1oL46bhm1bWF/ge9D13NIpHBKPYA3f3G8FZ7fCi34xuBtAPXWFgPFkiKYrPLG6ynrMkRyRBhSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717509056; c=relaxed/simple;
	bh=WNuAZBY5M5utaqDRaS3YVc/66sKW+YV2ror0qkCbifs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Om3fkrlPxIlZttyXs5+CXkhEnjXneRq5KmJeB5ASxpgYSOteEC29KlDK3YT41S+nYcgn2fmPo8e7EUZFnQwT1sb6z630XDaOc3PGzib21papY4DPP39/mUP9YpruKI6SULJFmcQzjQmiHPMah3o5aV5Icc09SkUGu86BhgENGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=c1pO2qQo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-421555a4454so1214375e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509053; x=1718113853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CmU0DTF3wr3QsPtiX/X8uKixsYvsbrBSlvb1F0M3SQ=;
        b=c1pO2qQoMk5t3d9w8D1BYL/fNQWFzyseRfuJ1MBWrWd4iynKaLK88duS6nnQbaneN7
         VwHWd/Jbn38OiJHmqaszpDGqVjEuRodzajdn1azuYQVrv6ffEBsVGMMlVrYnryH8XvB7
         OaVoJy7nM16FCJzCudVHMaVdOiAgPISne4OiXNEpGwst6EwCMBGGrBNLNuP6u7J/1Vhq
         tyZK+Kk3Fld2Z3TZv4YKqZFrC63f+F1MbMYS4C4Og7k/UFpLmTNzmFJA8cZhwYhThPCK
         llbMsnD0NJfzu9TKSswf3ijSAo3xgREwr0ay4jKBFDCTbWts1dLlRbUq+G6jfOT280yy
         m0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717509053; x=1718113853;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CmU0DTF3wr3QsPtiX/X8uKixsYvsbrBSlvb1F0M3SQ=;
        b=iIiIzMHPiotJVY4kmLOzcCTvqwBY1qaY80oeuWWodyu+xG+TLYOgCGrvDkpF9m3aHk
         gfa0sGjFjnpkd0J3lm87BLC/uviLq3kwvy5wMHaHGK7TcwgUlUhedBVD3hkEU//HZ/Ho
         QmCDadnJtA2/kQ4pPg6HCYMSvg/62AHSxZ9pq5j+BF2LNA4q2rOoJZso/n/+9+Ca4LSP
         sbeiJYBV3MSEVyqssvepF1bfXiqajn0S8qbsnsB2qoPjNkDUUKG7FeeDoKa4epHs2oMc
         tlJQlhEJQM0M7ljk2G+dygjkYRnh8yfwDJDUWM0lLUzYwaCh/XeXAjVFY3HU1lh9PRqi
         4dtw==
X-Forwarded-Encrypted: i=1; AJvYcCXd+i6OvK9ZlsQ5ONJSEjqOeTiccPfbRIl06fY8k+KwQHjQOelpqwA8EQc6QKgv14TUwG1UF9zsoZThLpS8jt1Od3je8+/xHPo6Lcdq2A==
X-Gm-Message-State: AOJu0YwYIMyNuYRffMfxgt/xEK6s1JHEUzk+3SKXcsCNHnfwfDnHm0Wr
	CXDRXFyCEYVTdw2T2YeVyLfwngTOTC3sCRhJmSgaQlCE1sKpYDTOA3Fy0fYjs2g=
X-Google-Smtp-Source: AGHT+IEKzaDjXASfbYTGTMDqSF3S8HOCUTwRYdvhMGZS2at1GRzbC8wUQ7EhWXjf0frP4FQPZnZyBQ==
X-Received: by 2002:a05:600c:524f:b0:421:494c:9e74 with SMTP id 5b1f17b1804b1-421494ca032mr20179575e9.23.1717509053151;
        Tue, 04 Jun 2024 06:50:53 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
Message-ID: <84a86082-f28d-4750-a4ab-1c534bc54b78@freebox.fr>
Date: Tue, 4 Jun 2024 15:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8998: add HDMI GPIOs
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
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
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e5f051f5a92de..ba5e873f0f35f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1434,6 +1434,34 @@ blsp2_spi6_default: blsp2-spi6-default-state {
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
+			hdmi_ddc_default: hdmi-ddc-default-state {
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


