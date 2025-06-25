Return-Path: <linux-arm-msm+bounces-62322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E82AE7BAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8288C17A306
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0802882C7;
	Wed, 25 Jun 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y5J/uRow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742D4285CB8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842717; cv=none; b=Yy5KrjHVKdjl/6zvtIAHijBVTnLbxbomwSiSzfjPZ2fL1jpJeWlAOUdt9vhpCiCuRFraU2cShLKFdv6jvlvcFdxxGDCfKBU+xAq5GhQ8p1wzBtR85tEFScwjivY4ppk/QldMaWo3bBjBNouUEFlWBuAJf2AqNHmEPCDSPYjC6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842717; c=relaxed/simple;
	bh=oNDr9/X8UcHuDpI/T6MeItHYUpNzR8kTjczcLR5Y4Rs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XIV/n9S7x42iELPeXM+XxIaA/elL8CfnGE7aiwM7aMukWyxW+RG+ISj9Z5ELQerSOwlFLSkYYuVSK+sr5d7HXxIktdJb+UoB4ErCKus1JybivNpwn6lsf6JRBxIt67ZfwLy1+g5hdgZ4U6tT1v9dz3IVCTBA8AxxokoB4w8iZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y5J/uRow; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adfb562266cso267984266b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842714; x=1751447514; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfFXc6iptJS8RJF+pdB6dJ+3zW4rpMtdvg+gecd3YNI=;
        b=Y5J/uRowiphik0u9r/mbWlhdUhdGD4dy0AvPbd3tRdYgqqQ0z6EBSv2bzFh2GJQQkJ
         PP6HHH7ZNspAeBD4Ok4bT8dpcPIwRnvCnQ9LRS4BEXMNDG41SqE902XRwT7X2r1qpMIL
         g3eEN6LM/Dr84svFYP0lyyCay98HTrMObuptxl8kAcKDv5EY/P2oxLmUiPNLylSX0zh6
         ABw1QoGlIfKjT9DypqfpVxXFZr97VcCGe5Fv7odv5KOAfdpkb+xtBW+uAL5O8uzlT6G6
         qLy5sT+myrEs7R724nwqf8RWIdQnmigLV8b76e4sVApPALOTgIxuKXYchYDwwFf4pAHg
         4DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842714; x=1751447514;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfFXc6iptJS8RJF+pdB6dJ+3zW4rpMtdvg+gecd3YNI=;
        b=BES/iXEZu0UqUC9iX1ejqHl4/TBZRWxJmci9PlnjXBmlJyfozyJAbVCyWSH5NQwARj
         tI2hr1Pi7Mr2pd7DuPBiu7lDD2elS0Bc+eDbKNh9XHgfkrrRGYbbJzftOH4TqP4bb56z
         2Y+zrYPkFomfMH8DFLGrByR34hIJFykBvdewd4G6k6/t8Yuyb4+P+PLp8zUUm0PIRDWH
         VEAMOB8lp9FFKTkAwp6JBERq1tby3pJ34NUbbAafSi7xpHGOua4Tpf1Sg0kzNs1+dujb
         GCI+jM71fMA1wW3Jtooh9SO14PSyNxk6tcBrAosYo/0dUqiZgfd3a38MryEvtlcCmRMn
         OLWg==
X-Gm-Message-State: AOJu0Yx9GT0Y9746OcncrtM3Wy1BaZrvfMNEWDAgpA+AxYB1E7/RJn98
	/yEDMORCUUtmWP9g4fsrS7QvpWjZmvCeuO5Mviy1rpy9nIct9l8tQtpkw7MQBUqsOVU=
X-Gm-Gg: ASbGncvbxoyjp8w/gcIaO1RPH9oYT7yvQJGow96FwfHTycfM6tVhvlj5McH/OJ+hlxn
	CWE87/YFdcP2cHZxdYDtdr/A3JniOsTxtzKXFm3xR721Y4G2L+68uWbTjiq4IHywXmCGWfx8OsV
	Yx80JChksuORBDxkqVjFunO+8Tsg4eOkJxgTnm5GqpCpht93EDOXr65x1SO9xDpygdA2jhYCrIJ
	QK3+vcw1Wa3K7j4/TpCSyqcCvarbzf/F86Giw53XUGtIxyInpZ9NJFJagMYJFWf1FVEmvBItDa8
	MRGqcoHPaW3lRpYRRt1JIBU0z8O1hteN74/tR95ZTUOuWapSyjgaOdDk5w0LRzcKoekajW+yei/
	8BGL6wujlI6MtvpPL+8ED+UQJtL7C25Mg
X-Google-Smtp-Source: AGHT+IGLwXMNfnnZ9yNaJO1cgTQkdowy9Zm9EiHvT+fTVIAaeRQJzn72dS9FzJ5dzo+2EnQB1et98g==
X-Received: by 2002:a17:907:96aa:b0:acb:5c83:25b with SMTP id a640c23a62f3a-ae0bebe8f00mr227086566b.7.1750842713726;
        Wed, 25 Jun 2025 02:11:53 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b39e0sm1007242866b.110.2025.06.25.02.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:11:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add SM7635 and related PMICs to socinfo
Date: Wed, 25 Jun 2025 11:11:43 +0200
Message-Id: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+9W2gC/x3MQQqAIBBA0avErBPM0KyrRIvQsWaRhgMRiHdPW
 r7F/wUYMyHD0hXI+BBTig1D34E793igIN8MSiotjZKCr8mMWnByFEMS1hlE661ys4cW3RkDvf9
 w3Wr9ALnTl6dgAAAA
X-Change-ID: 20250620-sm7635-socinfo-8c6ee8d82c9d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842713; l=701;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oNDr9/X8UcHuDpI/T6MeItHYUpNzR8kTjczcLR5Y4Rs=;
 b=hcguLzFSeCguAsvM5GY1KzH8aSsPu/KuTzADUtsgqbtgrxMkf9hJsPREpw9P8rR6xc0XWM6g0
 OZs5NPRxzneDMARH545x0WaJGpWyy6rZ9bYtj+rcoPK5yFDbwXp21aI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the SoC IDs of the 'volcano' family, namely SM7635, SM6650, SM6650P,
QCM6690 and QCS6690 plus the missing PM7550 & PMIV0108 to socinfo.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs

 drivers/soc/qcom/socinfo.c         | 7 +++++++
 include/dt-bindings/arm/qcom,ids.h | 5 +++++
 2 files changed, 12 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-socinfo-8c6ee8d82c9d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


