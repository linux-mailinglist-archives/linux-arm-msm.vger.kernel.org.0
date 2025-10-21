Return-Path: <linux-arm-msm+bounces-78147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E9BF5F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D33E35342B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1277F2F39A1;
	Tue, 21 Oct 2025 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjsV+D+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4112F360B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045065; cv=none; b=ODmRb39rAVhgdPqhlo6duaZpCTkAONzlMSN6MGJSot+CAcYdt955yK4t5YppyMypWkcF4w95V60i+9SVvCFN6de/auTC59Go+aPq4dZlCCiwOYRCb5t85X5nlr/ZWgzFVfNOn2Xtvny8kdFZL4jTvHB7TCFgwWOWsLyC82zq+fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045065; c=relaxed/simple;
	bh=ksFlsenVG5BLSjQ9Fd4ZX90f73sEys91+3sYDn06OyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSIGJS0Cs6Q0Y6DCUasohBEHJtWdq0wiu7Zz2JIs9cabjl9AYhcGANbGyqfbVdfUnHvDeUTLPJRI1zGLKTFTbnNGU+Ufe/3+Tnos31HDQHwjK8dF9ETmrk3V28ye/Hdy8ThIngMqVE3b/fEOqpheZipvFK97kLsJP8LCceVMbO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjsV+D+/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42702037a01so794975f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761045061; x=1761649861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5EyTqZZ7MGdSDa8l4x23g921Hy97xpn6zc3palSUX4=;
        b=rjsV+D+/SrANC3r+qem8Fq2BHxg0FUbYXjRpNb76S2VvsAL8pHlj8VMBORNK5+o1bh
         rJM3gV175XLtZQpOSx++IDYnOsOzV8T1dq1lhcuie8ssN5HyqJ/xiGtJua88lHuBsxfm
         mz/+n4ffcFOJNubyaknd71RcToPNMpwgd4A9vnPIY6xgjSCHfeLcopy5XAFwM8YSF22x
         KNVHauV5vMfR0zLWBxYZkrtFvBD9XIkOQo4z1ywbrkF+zJiA7SnKShesfQQ8OMckGK1T
         khee3EYjSwzGciY8BpOjms4gBWfJz02NoD5v5vgrbDYvNaeo+LHRcNG64QdNiaYGImKf
         g3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761045061; x=1761649861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5EyTqZZ7MGdSDa8l4x23g921Hy97xpn6zc3palSUX4=;
        b=YqZQOfr/NnpbrkNPGQ6wkmq4nNpbj2iLPrWExwG5xMb5GXTnEbs/IPfUKyAPDQ+/pa
         qi7utmH6VTaQNFE36lw9mG4YFaSAKWUarJbVA+nR36tid2fHDfnrGNcFBpy6FloQrhkd
         574xBZ9+DIwOYZNglFyjX9OJacgUPQ9OVpaKdiRvKFUa9xxpCsxWMVcP0ils0ayeKWwJ
         zuzNeiGwX0+uFSJAOFaf9I34CibwBgEQb9m7CQ9R3NGvF3tvO1LKHhMnR8qULUi2mbFP
         q3IjVx2AljUobKXTdAM4ZhFeEDE4aTFRvK7gEeeunbEGF2LzcWGXPNaIUFylYzdkiN5F
         7lLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV/t6TIqvJZranxjeFL8dhHIlNrrxU/8isT8hV+3YdnLIlLJSvpwj9kcYBS28GT4d2mtG//i2DpITVtBvt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy654Lp3PcynhOWAc+xP4oimumlRVMy5/Q5Gfknb2JTwEbkte8I
	QuLICY1s5BSI5gy6erTIMryp9t8+K0dkNmMTwax+XDCTXgPev9zNPEfOuk88JNfeM+o=
X-Gm-Gg: ASbGnctW/Z2rayWggWjU6FmnLAidgN8E3EaT1/XlM2pXaTlp1hegDfhj9l0UrX/7fz7
	TXC846Vsl5sIDV9vggyz46Mg2gPzx7r7cbtoVVfHbTjFIEYc5meC8NH3wQL0ZSqf4WiQR4n8SsZ
	D0CmXIb35fU/uNseYkptpIlwNx2GKQyajriA0z1MckVLiJnY4w4Rb+1+79H7ybycIm1VM1QL9/8
	UmNR3BvaYtDSLlir0VjAd0sQGj7MouSZILJTjcr1WV5Aviv4N7HbVBl4JXCxsIg2SVrli4J786/
	40V/tWq3ayJbsR6fqaTpYoXh+cUWNkVNLoPpWxvy1hWWcHsdsKK7Pnp29Ri75CxVXO5aaAEX+L/
	+hmpksaLDoODsbcDAWEWvNxNOCzY1zXN48qz6r3InwQs9EfbDgdjyCTk9wfBEUkiPtj1hsHCjiT
	wpo7eGZyaP5D0=
X-Google-Smtp-Source: AGHT+IE6kW17wi16G56epg97Q5LRZhtLyC50m5D+iXMza5wlR5ua98abI/s6v0YwjekhlOLH+56S6w==
X-Received: by 2002:a05:600c:19c7:b0:471:152a:e57d with SMTP id 5b1f17b1804b1-474942d9c6fmr12082165e9.3.1761045061205;
        Tue, 21 Oct 2025 04:11:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce06bsm19510485f8f.45.2025.10.21.04.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 04:11:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
Date: Tue, 21 Oct 2025 13:10:52 +0200
Message-ID: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add necessary DAI links and DAI name prefixes to enable audio playback
over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
should carry respective DAI name prefix regardless.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

ALSA UCM and audioreach topology will follow up as well.
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 654cbce9d6ec..103c4ca97adb 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -351,6 +351,54 @@ sound {
 				"VA DMIC1", "VA MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -1013,6 +1061,8 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
+
 	status = "okay";
 };
 
@@ -1021,6 +1071,8 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
+
 	status = "okay";
 };
 
@@ -1028,6 +1080,10 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	sound-name-prefix = "DisplayPort2";
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
-- 
2.48.1


