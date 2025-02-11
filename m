Return-Path: <linux-arm-msm+bounces-47636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CFFA315EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 20:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D193188B807
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 19:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A1C2641EF;
	Tue, 11 Feb 2025 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URe19GbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDA2641FA;
	Tue, 11 Feb 2025 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303393; cv=none; b=oN00OeAZ8OtLXBcfT7Pfe7tumtm29AyU6ryF3N32hsFG/aL2FuFU3aZSNRQv2OmAFNrLPI3EAn4vyKg5TBLapgadaBIHubREk5mdxnsjmwY0bMNKkG0rFat9jADRK3T17u4TyMtq3eZfo53ngv//woPmSb2L5kH5PfsPujZORcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303393; c=relaxed/simple;
	bh=mmPSG2J0wFLbRJe/3wTyhzBmBYWMvj3Prn3iKXV5pPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irD0JT1WNIDlQntd2PXlEIF2LFsrAxvivp4sFaMWMV/jUUvUjzF6C/gTRL9xHE3o8AblbG4UcLSUCfDuERVLVZEhDkfiR5g/BtwL77OFYj27S0mat8ozYXD2gw0BVZsXqSqEeTrczYdfoyQU7Hk/bBJKvY8YFgCJl5XEhUZmUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URe19GbO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa1d9fb990so9544728a91.2;
        Tue, 11 Feb 2025 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739303391; x=1739908191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuFtRlkVwzfsd0hbMOfTOhdeC+NVKWiRoYV+k56NFus=;
        b=URe19GbOR/l0TztQchLXCA9I+rRyF246wS7Qjxecd0v1/Tfu1LYARTXqSleaYt1eqC
         OEeXYponvhkQtVr/C0nRXeNHwTDP4aq+q9d+ea+f+uYok9uyRVus0jlPfVuQ4Ps5VkDh
         V2FZ1trwzvOf7pSdWUV8cCjMH1qQs2dxwB2khoA31XqenMYANPpzRh1M9zzxVQR3uIuI
         rtwkhnKPejAXoc2HE4aMyZTFfs9r+SQH7PHKzE22fMlm5wEm4yNBFOaaD0XWd/FIgnSP
         DSoqJAXvynAa+RThC3QU8Lz2ZxIYbjY3K8pUSXmwh9LF9v5e57uXsOBZ5Yj5VkoUCq7G
         YqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739303391; x=1739908191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuFtRlkVwzfsd0hbMOfTOhdeC+NVKWiRoYV+k56NFus=;
        b=YzONgoIrBBId7btXji/ns1/ukOZntL+GK5hLcMmow6WeiPFwmFhYF/zkTeVMoRC2EB
         sNzmpzsWzXvGQsCMkpe6YeY7gnTgZc2USxomu8QGGr9bUD8fTKmGFp9s7QM86OsmscrI
         2YrY4tzJTBt2ZNVo46UMaoTVWhfTC0Ptb8v4mmibO/x+g4Y5+Lb6ovLUExsHv4gIsOki
         TX4kzhQ7aeKxw+hAiaRLUdayXHDDfX6pdF4PNZ+DG0kzf26Mxq00yJyHs/RS0wljep5c
         ufn4wDCTe01pN17PG4FDqVFTAn+IkXU9QpSQLCx2+vS27RQhbMJ+hYAt+Ny+hoUHTzNm
         ZoIA==
X-Forwarded-Encrypted: i=1; AJvYcCUVpiqo/BozQ3X1AdHUqYXMWV4tiEz47MIg2WLI2rVEgAOIs2kmMB8jRzMoeA/rbr/FPY/t75uuPQQF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+C+u1c/bp2rsLn96Xul3VkS5bwSdSf+Gm/2juSjtdR+luf+iv
	h5pqcIByivWER2Mnn0SGVbbOl+Qei/pczhycqzDSpuY49fgxE+BsRGtZfyF4
X-Gm-Gg: ASbGnctI26YK2EZyvKfDQpIw+sZD5a94QhSXQRqXIKd/RJUIPmOw2FhWacS5rGCwnGE
	0AIyfOj4XbH0gqPfnwH5/2Zvf0GvzM7kfX6fnTfh7LHkdH8BQehQTSuiYK62umJ8Pskry612dwA
	zSx9nTANPzdrOkRTlCCoF2fL2ZRWrJjPVjzKkmmd86l82ZZgi9QBI1JdR0Y9mT4OPSVwMyX+Ubr
	tQiAdQtM1VYIDSfBVTQQsxCTICiQhEwkg5G3n8fhmO0shLkdb5OMrktjTB9qx5aMtrgj7IFZ3aT
	XEbQ6zrK6Cxdj030JiZUJeov6OLwk8YFA+HW8w==
X-Google-Smtp-Source: AGHT+IFi/gupW0gRt3BlxdcXao4XArg2Mfg/mTJVjvpk1+IGif2vaf/Fi+m7ypL9uHg744O/bjjJVw==
X-Received: by 2002:a17:90b:2743:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-2fbf5c0f614mr621150a91.17.1739303391298;
        Tue, 11 Feb 2025 11:49:51 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e68bsm99815035ad.169.2025.02.11.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 11:49:50 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	quic_wcheng@quicinc.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	"James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH 1/3] regulator: qcom_usb_vbus: Update DTS binding for PMI8998 support
Date: Tue, 11 Feb 2025 11:49:14 -0800
Message-ID: <20250211194918.2517593-2-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the binding in
Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
to include the compatible string "qcom,pmi8998-vbus-reg".
This change adds PMI8998 support to the Qualcomm USB VBUS regulator
bindings.

With this patch, device trees that describe a PMI8998 USB VBUS regulator
using the "qcom,pmi8998-vbus-reg" compatible string will now validate
correctly. This is required to support hardware based on PMI8998, which
has different current limit tables and other regulator-specific
configurations.

Tested: The next patch contains the driver and has been tested with
Lantronix SOM.

Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a..6092560e9048 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pmi8998-vbus-reg
       - items:
           - enum:
               - qcom,pm4125-vbus-reg
-- 
2.43.0


