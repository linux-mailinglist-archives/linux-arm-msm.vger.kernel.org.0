Return-Path: <linux-arm-msm+bounces-24462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81491A711
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B3C1C23E72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE5817E900;
	Thu, 27 Jun 2024 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Igh5UJZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EECC17965E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493046; cv=none; b=Sv48Vpm0PDT4vwZsDFWLwpetE+iVur79p4qrS3tFqYBb60JMZ8Z7gsg06Ka50Kbs+sawnFdFetnht8raDWaSel1lzIxPmZ2FB2NSZoSYXiEEgGCPiTt7xEE6+5kIl9CfwMfK/W76Z+Q/OWRNCxGCIdyIAtu4s6xb9ZxFFSfFJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493046; c=relaxed/simple;
	bh=qk0AqVYhSWDWjHHJE1wLcilj6w7ry61qK4waqocNLII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCwVgPu5gNGpsaBhXgju2oPp07AFnOP13ieNjojwD0WQAai+/UdmRDAk6+aUNKXSbrAFK1bKqKF9Hqiwg/ROThaOUD2kFX+YwySeKasxaROHnDm0zApmFEWyKLxcpsAXUpPY1tYaj3+9fNZyJcvkCrLkGk2d5xEPd3XNvFyfoyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Igh5UJZR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-362b32fbb3bso5020805f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719493043; x=1720097843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKjszb83CsEYX7PAp5HEuYs2y4v1+lep4AAiRj0YQNs=;
        b=Igh5UJZRXclIwntSXUcD8rw/6E/PuTczxyIl4WSJPbjIKOw+Ncsh8DH4IjtCGxto+j
         lDn3dkyzrddXs27f326440RcnpDctwYJyQLaUyBzNLYXRpf+e6zLpRhsS6zqWVsoePEv
         Mx7VqEmbX5rdWRqVtOFYU7Qn+6D7fv22v/pjLvpCR/ZLllSoInkV90ELm4n3fSqX6eQq
         jSb2WUTTPqAw2lx+K+o8IXOpyS0Kqr/UccOsQuPfPMZabNRCSYTmLpPsjVg1c/LiFCsd
         gxvnyun7I/M4sh2my1TLHm/UtfufKASBru9HK6lavvzoHAOKLyl50Jv/0pGSsGig5WYn
         rRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719493043; x=1720097843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKjszb83CsEYX7PAp5HEuYs2y4v1+lep4AAiRj0YQNs=;
        b=TNbwauPQ/i0MndbdOBRuBIg373eBBCa2e/bsRQwpKeCWCrS7YXEcZSl0eoh1LwHC/v
         X9LVzAqsh/ycBnkKLR+rjEfzY0WSvvXsf6ZwVlUiXOOUwef005IOlBtYY/IDYCdJ9G7N
         G9oPu2xUU9N1A+GxA0yoFgn1tvqh7Q8N01taMd4wYMYcWMvSBTbr9vHuuGqGG4hnX6o5
         1bBFXoxKM1Xe0a8X11pw/80DgIw84cTxC/Pu5eWzBF3d1sAosYQHJS/psOWJoA/HTD1R
         Zqj+IUZndYwf9kFE8G3RvmtpWNXkZEPeKtTl+kfil9ZGENCc3DNpMppIDaQNQhUqURAI
         8Arw==
X-Gm-Message-State: AOJu0YwlGSXeM/R5+t0AmM2fL7EzbwKfKi565ShCdXN+bmSc/n3yYi+9
	0wlhFVLo9N9wXGTEuJUxWUeE8WFelu0aKc0mNK0DBHBty0O1t/x5B1iifvnn0DY=
X-Google-Smtp-Source: AGHT+IEMNQfSOqY7Yqb2X0OTu+FbXJzDzz+qP4cl0us/udj2+A4BUzIOsmirGNMU4TCfcEsjE4+zGQ==
X-Received: by 2002:a05:6000:144b:b0:366:f2c2:61f5 with SMTP id ffacd0b85a97d-366f2c263a8mr12349854f8f.52.1719493042978;
        Thu, 27 Jun 2024 05:57:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357fcecsm1800752f8f.26.2024.06.27.05.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:57:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Jun 2024 14:57:14 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: sm8650-hdk: add port mapping to
 speakers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-topic-sm8650-upstream-was-port-mapping-v1-1-4700bcc2489a@linaro.org>
References: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
In-Reply-To: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qk0AqVYhSWDWjHHJE1wLcilj6w7ry61qK4waqocNLII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmfWGwkGSglCHpAG6WBO2cCw1YuI0WLdXBmA8Pew3/
 V40mcEiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZn1hsAAKCRB33NvayMhJ0WHZD/
 sHRk65mAh0FmWnplGquaJWy16ZT3uYAoviIFvUcjLiw6Ks5khebXA/3x8CoWxKHzHwOUHj0sDdgGvD
 lODibu2xOpepNS244Zp2joDdLt8ByQY9ip6Vv5PwkVMZeD3gbUdTgNNSu1D243gcOk43R8IbVR7cuA
 M++HQ860L5EE1dbyFrBkBMqo27EtOFVqrMM34x91R7Qnq4gQ0q9Eeb1evaEUTKdWp3+ijqBw90/Mqu
 K1enAbEgS4BNR/4ILaO7yVff2OXbPsotXjkgI18BHeesBSBe3HpyMMnlrY+odkp3zlW99zzkm//rs3
 pmNNPzcMqODs9SHetZvekIfxC/SiXBLB6XC5F+bRfyXAPOI+BVFTUTbfJdc5yDNnmv8Pq8ZlLvbFTe
 KRaYJUsgTPTI8FnDBlFAky9Ti+1nQZFWT0sKtgVwnio9pnzP+hOx0t3B0ZWg35K7hbuzGjWjBI+vKx
 fuyYLv96nS9XFCCjByJbZ9ur/YnR/Vz4wYj7vu++rDFqKE26KjC+pUWgVBtLD0j1qhaQTaiXKVSWXB
 oeORF36KaRs42H5SlA1AYW4VHeEpXJepKyVVJtCTyAFLfM4lNK5+lZLuDe8UcZNtSsooZJUGnHHYnr
 tCdznv6q/jhz6XkWra8AFAhVkIjRHmOKFRTBVd6dxjts63lJqHzsHDNHAxOA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add appropriate mappings of Soundwire ports of WSA8845 speaker
to correctly map the Speaker ports to the WSA macro ports.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eb2f910b4f58..591e6ab9bf5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1137,6 +1137,16 @@ north_spkr: speaker@0,0 {
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Speaker South */
@@ -1150,6 +1160,16 @@ south_spkr: speaker@0,1 {
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l3c_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.34.1


