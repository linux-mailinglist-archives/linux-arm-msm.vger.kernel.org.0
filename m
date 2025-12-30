Return-Path: <linux-arm-msm+bounces-86899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E310ACE88D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6F8E3015861
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D792E040D;
	Tue, 30 Dec 2025 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR/LmQic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18812DA759
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061663; cv=none; b=ckCheGWUcIWqg5qHJ2t13Yjmhbb0TdjplA5ApedCy1eww1Lrp3g3fs/rYwpRB/6Z2wfW4t2cLcQhDN3HSaAkneKzTwGVJIB9OpxDfujtSSMw3MlBrjNSyq239MaOag3I8toY4F9/BG4hlI/bhvquBKKyTqqL2KAR/Ca1N1Bmrr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061663; c=relaxed/simple;
	bh=JvXBFBmoewzypaOA7gaaUWUOvKih92w8JV88pUevGHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJK8ofwbO/vqcv4H4TFEbgDdo67mvLOI8d1fdW5wFbWg1Tuu0qquxLwzDefjUF3y5KtAzrNPYXyrugDjJDjVGKM5rp2okeaoDylXH6JFPiSDcoBp53nc65swNe/yugWALdx3WCnO1lYvPTvWA4SSYnIjwzcQiQo7nl/DHzREC7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR/LmQic; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b2a4b6876fso1406782485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 18:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061661; x=1767666461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=js/ehHU4D0Kf9VZJJ3nWUpx1Ps8Ec/Y5UmWDwv2QY1Y=;
        b=fR/LmQicooLGUyAwxdi1Bq3X1r6yAQm8/+treyrUtxVUc1V57N61secogi0+enC5Uk
         c36kKQQrX5TflyUddaydySsISlOjbdqMd71QS5wiXR87Eft7BhvHvJWeKuuBbQbozrnR
         DmOCBq18XSz5cDnDw6dhNyURObJesWgwoebKa7Tzc52vtbuYwzaHaLZwi2ifKLOCu92L
         X11fNdAoOVgc82hjSuwezW/j1keev/FaS3xcOiUKTIcfyvXl3pBdpFf+mJBHoKJ5Dg5Y
         GVyuNuZOH5d+BPtNBslWc/OnV0d31w5D4PZ8zc8hEtsMQSTmEE6S9cuyKlHhnrX5zfw6
         aXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061661; x=1767666461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js/ehHU4D0Kf9VZJJ3nWUpx1Ps8Ec/Y5UmWDwv2QY1Y=;
        b=hJIuBZ3Hfrwq79j/buuO8qoBr0xdxNM0oeM/NGx18Xd0fpSMAoNoyO0fE0Qp488F7u
         iOs2vBt0Bc4dOK5VFtQbcfdegSvvXTAri+L3HNGAe6xuabvhH1f9UsGOKcXyYl4CQLlX
         ryaZTo4M6IrFXAnnCfhZATOMngBDR/T6ZkhD3j227+OThguKmNzIBV7uqi42mUoxI1SR
         jqF4bX25Z70ADVTbYhiWazNtRv7bjrwojPncKfu2TagWBtP/wyvhCEPJZNpLO8tt3Gf4
         ePnxuvE1L2nTx8LjoUmOuDepZEfOaSucoefN5HiLHzsdCkfMbB/WKtesEz083OvYfJNy
         dpEg==
X-Forwarded-Encrypted: i=1; AJvYcCXwFSNbRuQn1o4DKZFK0yqS5hY7su3w7hVv24u0CvVa7KAe/0hlwXdqJzZygHNjiDs0udJpCbK94f83j0Gj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv+8zdpZau8hGxOSiJhPsQR4IwnYfIZnBg4LMubM32noa7vSCp
	o7jVvwEEmIJO5AQKh/Cwr4hstDjmVnLTG/nB24z5N7rX3R7YsuSdrfsU
X-Gm-Gg: AY/fxX6Bps4OBmhgeh+wc8FDn5I8Szf8mmDlinyHz/YLE0BwtRcSmNxWa2PAPj5wal4
	501pJzLQoFeDm+qKVhW9BmD90iR3Am/aRwvrrpZfUuSPRX4aGN0bOYUKdlaqZ66zBP68a9vuwIT
	Ib8ot6U1PvVLBFYjKgqj0BD9IH8XPqp9RCzRsHqIUFNhBteFImxAaaPoU2xP1g1TnNIddNzp1dS
	c+4p9/1cWabp8kRhhf86t3gJwDeL244w+nVTo03H9QX7ftwbEeROUlHJubKNnRqBBOQ4KezLk9w
	14Es1uTJT3UgmCA1WyoZyutP2Q4Y1OHCUdw5bkSxsoeg+hr0XJdaZAo3gav07vgFZwXb50HEOp/
	5whCPKcadv4hrHQ3rObqV8RNKeDnmST4Nx3xOrOjMuYAt9Y3Oz3LHv9Ank20ZKMReagviQXaVjy
	CaIBOYZ1AtLfM9+Q==
X-Google-Smtp-Source: AGHT+IE0AZ0PEltmcT/SoQGprCdCdVVYI3Af9vEYwBo5pDPoyjkZuyTvni/G9CwJBfy7DmisDJGu4g==
X-Received: by 2002:a05:620a:4113:b0:8be:8e5a:7a6c with SMTP id af79cd13be357-8c08fbbbf99mr4387462585a.73.1767061660744;
        Mon, 29 Dec 2025 18:27:40 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689246asm2500281685a.20.2025.12.29.18.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:27:40 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint nodes
Date: Mon, 29 Dec 2025 21:27:56 -0500
Message-ID: <20251230022759.9449-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for empty endpoint nodes. It is currently RFC
because it continues an ongoing discussion on how to selectively connect
some CAMSS ports to cameras and leave others disconnected.

The SDM670 patches are for a full example. If agreed on, this should
expand to SoCs that have CAMSS.

Example SoC dtsi:

	camss: isp@00000000 {
		...

		status = "disabled";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				camss_endpoint0: endpoint {
				};
			};

			port@1 {
				reg = <1>;

				camss_endpoint1: endpoint {
				};
			};

			port@2 {
				reg = <2>;

				camss_endpoint2: endpoint {
				};
			};
		};
	};

Example device dts:

	&camss {
		status = "okay";
	};

	&camss_endpoint1 {
		clock-lanes = <7>;
		data-lanes = <0 1 2 3>;
		remote-endpoint = <&cam_front_endpoint>;
	};

	&cci_i2c1 {
		camera@1a {
			...

			port {
				cam_front_endpoint: endpoint {
					data-lanes = <1 2 3 4>;
					link-frequencies = /bits/ 64 <360000000>;
					remote-endpoint = <&camss_endpoint1>;
				};
			};
		};
	};

Richard Acayan (3):
  dt-bindings: media: camss: sdm670: Make endpoint properties optional
  media: qcom: camss: allow endpoints with no remote
  arm64: dts: qcom: sdm670: remove status properties of camss endpoints

 .../devicetree/bindings/media/qcom,sdm670-camss.yaml | 12 ------------
 arch/arm64/boot/dts/qcom/sdm670.dtsi                 |  3 ---
 drivers/media/platform/qcom/camss/camss.c            |  5 ++---
 3 files changed, 2 insertions(+), 18 deletions(-)

-- 
2.52.0


