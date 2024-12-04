Return-Path: <linux-arm-msm+bounces-40214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E39479E38CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1647B33EF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511251B6CF8;
	Wed,  4 Dec 2024 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMklZTWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956E1B21BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309825; cv=none; b=SnstmLM31hM801VCDNuNibNU2GoinJJuGuweGJVVQKZO5WHo0KyS/uclYcrRXcFtsKki2nbL4ScB2Ay5Qsoud9LxrNGsh12LQ/hiUF0KA7Hg5toS42vLYUAakLu0W0d5+oACoHTH5Tm9GbmD6CppK3Np19peMTieD4tiQQwMXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309825; c=relaxed/simple;
	bh=X0jc67fLpdkoLWvGYPtJ2t6lBko+be5V42GTdXCU6OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ah2thSV4schWOLaQuC8ieYm3eYFvr5pU9FqeyvtcE6wgnBQmqrIoMamRM7O0QN3ZGn0pMe7a2BI3+w/YvYDzEkSMNa5osT0YR9bN5KmF0Q9979fDdJxHhoEEKl60pmQc+4fsMGl8fu7bKeW54rxhxbjWATaVgJLYTZ5ZWzb4mJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMklZTWH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e1f3f2a6so3226280f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733309822; x=1733914622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S9eHrj096rces9dTnn414lc2v6tceqMDXtlGmwyprw=;
        b=qMklZTWH3Q/jOMelZyE7x5NMO9gfHJ82k0IgvO6nJ7FCChkBanUa+8OmSAYxTsAvZQ
         RqNzB3Hy++OqdlvKI31ehWeNX5cmPCU6K1xKgUx8FszUKjywXEhQK6xuuoB+6unKO8+0
         ES8BgNfUw0WC6WEedNatolEsCXu0/n9exXfNGSCgOuvh9DP3Zu/PGmGGatiiMJzTPpJC
         0noaMXg+Xha+Cuacs5pgrONENsp8XYprvCCieziRxrZp3VrAyI0ziJnobBAYpVAYX203
         i9osp0wYCKrWNX6vD+MD17zO1uDx/wsdsu71bh+5bEgu0WKlgjRKk6AoACYHzcKLPVn3
         aqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733309822; x=1733914622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S9eHrj096rces9dTnn414lc2v6tceqMDXtlGmwyprw=;
        b=r7qcrvhf/wmN7/fA1WHl8OhL+vkqmYRFeLrtbQXzmWueAyo20AM9ZMOTJ+4gKYpTZA
         UhJUuc/qd3dEsFKrayYmpImEw1Vfbcyb3Q2pG6q4sUPAlImT9f9TP5Bs+ziRMZcF/CC2
         Ipj88aPkJEsnB1B/qPa5jKvbfhBvgnDUkOaPhiBEmZOED1Ar9iCYnQv+fuJ4yRGFn3mY
         Dc01bJFdt6+9KUsfszhNAnr1V+erBtoB83CsCaMMpdDMI/QVdWT+7QXZKAl1iWMuGh54
         O6tjdVAZ0sFE7KzviuLXhWkD+eI8UH8bOvQ8dB6s46a5LnSbC+aRvyA4AHtFdkm3RzUF
         2e4w==
X-Gm-Message-State: AOJu0YzO1t8xdJ5NTgkOul4gj9gS8V42omTrQNazdHYg6/hurRZ6BYUP
	ZizCpIQWYRG2Q6jFWZoLwg3NZTEvPfJQqSkDgFT+G7YOdvt9I4cYFODvgpW1jss=
X-Gm-Gg: ASbGncsoccohk/xDNtrSsCaGHwTyTjoA90URwFLdkUvYREJtVuXFzxzIATy66pLCXFa
	5bWAAxX+QqazbuaLynnUsZbVbfzOewTEi0L2rCsMORBT9E6f8d7Pppc90gCkbg2r+4kRD4YIR9Z
	n5qkcXgIYeuh/izYKS0xVaRab9rd0c5aT8xc9qUnAljmhfbxUNckqVW7JlsWGUAOppLk0fpg36E
	NeRTo5f5E7mAPP1bV5zFSPia3UOYaftkuiYuIkP6nnI6iSb/6OyubfZAE1XUIhjcDVzrcg=
X-Google-Smtp-Source: AGHT+IEEM9AsEZljH5GjZsXEAk+mrPOJrw9hP44cLvyc3CTJQnaqJ4zsxawmC4hW80yomi0T8mh7Ow==
X-Received: by 2002:a05:6000:18a3:b0:386:5b2:a9d9 with SMTP id ffacd0b85a97d-38605b2abd8mr3656724f8f.53.1733309821653;
        Wed, 04 Dec 2024 02:57:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd687c3sm18459063f8f.77.2024.12.04.02.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:57:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:56:57 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: sc7180: fix psci power domain node
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-dt-fixes-v1-5-6d320b6454e6@linaro.org>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=X0jc67fLpdkoLWvGYPtJ2t6lBko+be5V42GTdXCU6OQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDV4WWqHWIKjlb6aDDBeDzpTK6Gcc6KvSw48blx2
 BsqVofiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1A1eAAKCRB33NvayMhJ0TXlD/
 9ydTp6OJnbwT4nYhnKvWUL4PXt2eLBMUFXNtfytH3fNIvMv9Dn4cPtSfN/vIqB91udb+9e079PJZKd
 TxgaHog/ba6IA9w4d2O199Z3DbUX2pNUczVpYdCLCrHp3wf6TRoPHEVWB92Btu5n6anDR2fXdPXGSW
 Zu6VnYYvizOLOW5EgaSPhBcl/i7nboQEVFNOnQE475zGeYvRg1IpbPUn6VD9h86Ky92TaZW22kT1K9
 el3P09nPiIdxU5oq6BptRs9SsDdpFC4fF1wMlF1FEG180AdqLFQUt3vFuqNH4ZR3h53qQZb3c03h27
 vqZ1negPaeoERmLxBQkip0/EGoPxH+/SHN/UU/l3/xVA8Sl/pho95AlNtkBSmnWjyKZkHvd1cIqJKw
 YXGdyXsniO8g+kTXHttv0vWuia/Ha2cDz7Hnr4HvXak7WYBMJ5joUGfhAgGK65+sDKdXYRPvC8v5Fk
 6cmhVgFGJfjfnQSHbpCkFrLOGiaOtAnIWeVP4uOdZdkqLNaQDlKpUMBzwibXkMROBAar0unXqNWxSr
 MwC/hE+9Syb4UHmAXT3/CIwYBQVobgaZSN0gRq/A9yqlKxY/BsI9hJv84TueCpj7f5BHZ9ojcEzpQW
 fUvqzd08T5Dm9jRROaXDR8vuvdojz3ZXtn2i54/uFeX7c/80KDb8IuAfOpYQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Rename the psci power domain node names to match the bindings.

This Fixes:
sc7180-acer-aspire1.dts: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 76fe314d2ad50d002ee6adf4659fa685ddae89de..e7773d215f34eba9a42808eb37fac7fa1fda87b1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -580,55 +580,55 @@ psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
-		cpu_pd0: cpu0 {
+		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd1: cpu1 {
+		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd2: cpu2 {
+		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd3: cpu3 {
+		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd4: cpu4 {
+		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd5: cpu5 {
+		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
 		};
 
-		cpu_pd6: cpu6 {
+		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		cpu_pd7: cpu7 {
+		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
 			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
 		};
 
-		cluster_pd: cpu-cluster0 {
+		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&cluster_sleep_pc
 					      &cluster_sleep_cx_ret

-- 
2.34.1


