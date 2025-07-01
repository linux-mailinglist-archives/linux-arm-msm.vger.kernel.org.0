Return-Path: <linux-arm-msm+bounces-63284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD7DAF02DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4586A3B9D5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D095A280A51;
	Tue,  1 Jul 2025 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gei8FHcJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D7271442;
	Tue,  1 Jul 2025 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394993; cv=none; b=HD44DlLFBQbWbOV65iCA/ecMvUCUTGYSNkQzmk1eH1pY+gU08FXFv330k2AZ6VIvnYJKTBPmGPy2eTDI4YXBNjZnbbsWgqxvly0kVc3OKaXWaTAjhTv3+YUNNBh7sVW15qPhhUnOHIVH6RxShbUZfH7AorRyNySObYDpxe6qbnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394993; c=relaxed/simple;
	bh=yRjplaKXpH/VFpaOavRCRnqrcAYZmLRtHLxP0FlmjEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQCoLM5R8wYUTybCCq8ayV9XPR2ge+idIugAUxT+zPn1cNR7QbaleQvyMvmT0Q7wUg7jNNNZOpRfpLQCKXRhLPvny18aVeBH3P8/aEQuMSJ8V5QW6LsaH72L8Y32YJ0iprAlhmdiwJopiUfnk6ohI5OIWt/lbFl7HWfazH+J34Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gei8FHcJ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0e0271d82so1058684566b.3;
        Tue, 01 Jul 2025 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751394990; x=1751999790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvZSAsGgT4y6tCjof4rP96wWIXxPBf7t0erZSib3VB4=;
        b=Gei8FHcJDZXbSnyP4PE+fIXvWRm45zmJWxp1kwP9uSwDZoAKCgMjwaCiCN8vYtwQ4t
         TcZGX+XuomNCMwOrjYcluCysaFKs4Pkz8nCdM44ETa03LFzLMGRFvWDDJI62+tNR3iE0
         Jxzfs2oJfqJJCHtgQ8iL66XXcOY45rjmBcxk20WincucQzCXBSuLqTVpWgDRypuy7r13
         qw4E2MN4Sykcu7QXEIZT62K01vboCQN7JnzRpi//2kb0YPnBvkMqm31abrFE0pYli4H7
         sfA3SOY/3z63hnXtBNFpNNSDbSn+nm0kncRnRYf72uK3bEfyqFDbikIQnweqAk0Cv1Rd
         0oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394990; x=1751999790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvZSAsGgT4y6tCjof4rP96wWIXxPBf7t0erZSib3VB4=;
        b=Z87AKytHIKstUbrLjY1Gn6vlrE1YsVq+liR1o8A3W3ahLkmEEu1Oe+ER/GWGAkHQpa
         jkpHPQhm9VpTox71dG/I9DscH1T3xVybcoxSdvr3HHhp7l0xkPztWqHq+DOfWDlqTcYN
         44aBhmETLOxduNMlZZNBUnZkXZdIYHlP9heZCQNRpbiYE0Um38AkVCEZbop9Gv/a8NLe
         /0LfE2TiqM9Xfud5e75J37ZKG3Yv4P+tvxb/eXxy8SB/mwNKUuh2fj4NUxNiB7x0nfxr
         8kdFyZVOJ59gnR2RQ4dbeS2e6MllxRGcfgtxuK+b0JGlUFe4orMM2IvJjM5ttq5VRF0Y
         C1uw==
X-Forwarded-Encrypted: i=1; AJvYcCUBzicsYU2EyZIU4DMzTSfoBLVha9wRRFzIWrl7ghQkf2UJPNBRgpomrI2/k3x+OlS1vz72mxtXeBkkQT86QQ==@vger.kernel.org, AJvYcCVzjYyU5waoxZsxV9cmAxA+MCZRSMwBzxpZDLS63YGMmoe7Xjoyl1kDWr+tT8R99YotMeuRoNu9l36ATYMr@vger.kernel.org, AJvYcCW2Mmnu9NN5dX/ZWtwzO/UYpYhus3sjndFYVE/A6L/8DVityDwqWDDsFHfmiE9s62SjsTBUzQDT@vger.kernel.org, AJvYcCW3cA9PlCrSPcBvMzs5jHeLZMQEA+Y/Vlhezvhz69AJk49Ygc/mnqk5Y0NJ4Igs/j7JfIFusS0tWuIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Jd8kIMcgxasXrju62jec0lpN1OUujf0q25rLfC2GGMtxh979
	FNYTarJEtL7W5kUIcvfC5jC9vAWmECxHxF6HFCabIkZe6NNvOJfCjpBszOnMLrVzyw==
X-Gm-Gg: ASbGncu5WdkXnvjGJs58HsUCIOg8Xn25h+C0hPPweL8cOo7Own/AFaeoDHGISB0uZ01
	n3CS6PjtCmt5C3ZIyd/2jv/e358+rmQK1w1Z/cK3aERJVMet1wcqW98I704CH8Ecb789sGGmIrI
	BuMyL7DZBFUI/f78I5NSZDgza941nIlEEdml2xx0hiQHBBfmDT97JBeRa7pQdhLzSi0LG/mo6PC
	0yJCXkTChoYp6yqTbExzsdY9eDp/f1SGcUksOeuwM0GLHXqYHv1UkeERpaGAfVNaTVPLgUAhZT+
	amUNipvnHbg38pKCrO8Bzzh3Utvl9kn8zPzaHP5FXGM7PXAAaGjNGAVoZJ+ndl/TSTvG6APm/5x
	lmMuYabxqLclHjQw=
X-Google-Smtp-Source: AGHT+IGxDgDRfcO4OsA6oSf98ANF2jZNp1bEJWf7WwHC3hoaBCRtjYBncfle2chgYxw2mC3t34wNJQ==
X-Received: by 2002:a17:907:3d8c:b0:ae0:1fdf:ea65 with SMTP id a640c23a62f3a-ae34fd8821fmr1755494466b.17.1751394990039;
        Tue, 01 Jul 2025 11:36:30 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c013b7sm915374566b.80.2025.07.01.11.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:36:29 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	stable@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default
Date: Tue,  1 Jul 2025 20:35:53 +0200
Message-ID: <20250701183625.1968246-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701183625.1968246-1-alex.vinarskis@gmail.com>
References: <20250701183625.1968246-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm8010 is a camera specific PMIC, and may not be present on some
devices. These may instead use a dedicated vreg for this purpose (Dell
XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
alltogether (Lenovo Thinbook 16, Lenovo Yoga..).

Disable pm8010 by default, let platforms that actually have one onboard
enable it instead.

Cc: <stable@vger.kernel.org>
Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index e3888bc143a0..621890ada153 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -475,6 +475,8 @@ pm8010: pmic@c {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		pm8010_temp_alarm: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
-- 
2.48.1


