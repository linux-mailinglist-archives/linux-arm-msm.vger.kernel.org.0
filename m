Return-Path: <linux-arm-msm+bounces-34132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 984CA99A79F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83941C25327
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80E7198A21;
	Fri, 11 Oct 2024 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="QX5EgXCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCB19753F
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728660456; cv=none; b=E1FCSmmwU0s6tW1OdUiDWgLxLBXm5mxECiHodXCmd0qO9xJjdeA27ITp92PFUOXZHntIfpf5w2cJrLzbgptxCRJomSUHmu/uFPvyOJVapNrOSLIIBPQAR1EoT2Npq74PxNWzVEW+vKqC7+pONHCQKPORgBulNhnsrNEYXBqhxqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728660456; c=relaxed/simple;
	bh=dEvzDCYAXuLeb9shmkvV229Mz3PupSTBjVcy+LVPZCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvhVFu1LoB74rm28h9+cU+VvKCfBccWkP+xJn/9aPWmajDdqnE5VuR3rZzAD4E16jujP0z8q10xzcsp+EGtzJCaytxBCTVo4HCKFYU5uuUVPg8k6/yDfaMK2GR1B75vV5uYZoS46OKyWj8v3/bmJVWSJBw3Fnf6X8FQyDH3Dt2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=QX5EgXCj; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46045199e4dso17516211cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728660454; x=1729265254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q571hUiLhwNDOzZzuG6Dkz03yB6v2Tw/xn24I5ji6Yg=;
        b=QX5EgXCjUW8pYNY3bcFxosbgLMEoKEW5+aS5GKMepxKM+LstlWx0QUFvcTj4CpB7Ul
         9WZFzo0UvX8zXSTp6jXB+6Kw86fvLEmVbAUYwhg+no4R4YwUM+p7U6VqFsJtMrONTUFu
         uKLLbNbSalqKs8ykU7drsmc2tJYJQLIOf6KQtFKzNa+TnVncHEG7KFBiol9fMo+YvRaF
         c1CsjHVNAdihfwIfmutxOrmvxCbybmlM3ZYCTO9SBK9nC506ZUCdxfeUTyj8RzOT4ubq
         OVqFSCz5iVKicIGFfQyzKvHIqfGNbZpWe9KR5rQa2Fx9OpULO0zyFcknf5h/evJqGDfK
         IRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660454; x=1729265254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q571hUiLhwNDOzZzuG6Dkz03yB6v2Tw/xn24I5ji6Yg=;
        b=gkOMS6XeVNpgh8nM7wTdEk3zpS+4thxaDB1x2FPf7TfH8x850ftPKJZg7H5gRlFcFH
         6xEn64n4LwOFCMWjnBCeY9xeUgL2Wa55aaF3qrMthWgetIf7mrQtTfW/tyeXSymB/ur3
         yfnEuaD6cDwx88BZKcBQaRrQBrp5MtwexX/avbWWZ82S5Z0CEmjmwth2Q9spz8TX0L+k
         I44xwS5KyND+1ZK3Dn5unbUeN9smmfQjwxdwSWTldXkGglk5XiYpiT2hUdwhxOkIIPK3
         5WnmLVk2NJj9lrOnH8PlrZ63lEn3Xfu+9h7u8mYu7PK8lb4Xwh2zliAmFa2J5gFKHpKh
         309w==
X-Gm-Message-State: AOJu0YweFXYK40NYHowjhE4a+G4AwvtMTrLKM9Rz1HwaWNW4ncXau/lX
	88iALgstyfcdkm0SlgiZUhgiJ0yiedw/KyM6Lk7pZbZWVU9/YUZNL2bNoL62sWg2HZM5deH9Vpu
	KuSE=
X-Google-Smtp-Source: AGHT+IHYfPQwR4zCXOR7gPAHxDGjfJdijerKgatLMcVSSJq8egdoY5LDJMsFjviVfi9qPOvZKtdp2Q==
X-Received: by 2002:a05:622a:1b1e:b0:460:3f14:89b6 with SMTP id d75a77b69052e-4604bbd4f30mr46871291cf.28.1728660453911;
        Fri, 11 Oct 2024 08:27:33 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5220sm16344131cf.32.2024.10.11.08.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:27:33 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] arm64: dts: qcom: x1e80100-crd: add rtc offset to set rtc time
Date: Fri, 11 Oct 2024 11:22:42 -0400
Message-ID: <20241011152244.31267-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241011152244.31267-1-jonathan@marek.ca>
References: <20241011152244.31267-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See commit e67b45582c5e for explanation.

Note: the 0xbc offset is arbitrary, it just needs to not be already in use.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 53e76b3f0c831..c8fac0f2701b9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1224,6 +1224,17 @@ edp_bl_en: edp-bl-en-state {
 	};
 };
 
+&pmk8550_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+};
+
+&pmk8550_sdam_2 {
+	rtc_offset: rtc-offset@bc {
+		reg = <0xbc 0x4>;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
-- 
2.45.1


