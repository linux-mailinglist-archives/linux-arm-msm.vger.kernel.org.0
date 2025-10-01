Return-Path: <linux-arm-msm+bounces-75697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F4BB0AD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46D21780F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C5E262FDD;
	Wed,  1 Oct 2025 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="UDMkpCFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA1212B31;
	Wed,  1 Oct 2025 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328485; cv=pass; b=naznl1kUh93abeAZPTNDJU08HbSosRAG8HVy0FKA8UKtQqd6BQPwcrPuD8S+62PdsOrPrm7Fd+WHa4NYEb+M+UnnXX7BDvJzvpVP5m1uiIcB0s+Hy96vMfDBqjYB8StmKOrrvkloFPfoogyfA8D21MXCKHRV1R2lkJGUmskJg6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328485; c=relaxed/simple;
	bh=pj5w0JvTLLoIK5037GT87NPo+f4njHnh+8AtjwsXFn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KdGSydDJzY4VfFdme/2SQUI8IjwAOefxC/vRYZQHMv7LM5GJHTcgyrgdkyeGIQZDh9asv9ktRYh6ijY5R3lUvcLvyO0CSTnnkOVkeLdNFY44y9d0kcEhZj2mgZwh1j3kgkpvyZX/DjQQ/ahi3G+jg6lGEtfj3iyDaEyX9YyGvJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=UDMkpCFf; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759328478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fqhl14wtUd7PYAlT5LLigrl/3Q5cCIGdMSZi04GSdLFLNrJT2TpwiSwOOLUeTkyJxbPSMfI9v25z6KvltQezBoMfT/fWMT8Yl9DLcdckGflkrM1o6Vk6u+8af2GkDvQTPlVcWIrYuRNuLcueFds0ySr60X8XL14dmo7zruYeihc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759328478; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p5knZ4f09kOEKFF560RX25JLB+T/qV19T0sLLuUnYmY=; 
	b=nswxupNF0RwiLdAkt0NhoGV4wy0axi7DLGfoSnDUPoE4vzSWAPU6/ZsnmDbYHZ2yb5DVtb7zcaAFHM78PO9SjUKx7athKA8sp5HRMHrVDGKpBby5SDXTKUlJMT3R5V00eTfmGVBPF7UZtT+liYppxHAxoOQfT4UUEiEzyJTCyn4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759328478;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=p5knZ4f09kOEKFF560RX25JLB+T/qV19T0sLLuUnYmY=;
	b=UDMkpCFfghkDPjbR2LSW2Hft611AVb0InMuQ/57sI26M3n9obc1InLLNtLteqGiR
	9W3E7rLwJ3LT1koUcHcjo3yZskAYYysaOkwN29HUjEOO3DtMSBHWPBN7wCnYU8hqRkD
	Cpe76jeymQJ24H8ZnYchr52a6YnhMVhDldvO4m0Y=
Received: by mx.zohomail.com with SMTPS id 1759328476385952.4884192719444;
	Wed, 1 Oct 2025 07:21:16 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Introduce Huawei MateBook E 2019
Date: Wed,  1 Oct 2025 22:21:05 +0800
Message-ID: <20251001142107.21860-1-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227b46fae296eecea70363794f80000fcc9cfde41c9290e8ba8af01c18c114fffbbab49193b8f968e:zu0801122742b32b5960a32ad12699f9360000f3340ab9a28eb6f9669ad6238ef27abc4ed9e508e407348c2f:rf080112264716123b53c01192a003ba8c0000dd4a753aa1e6949e5fddb27474bfb444bd77fdf0991a1db2:ZohoMail
X-ZohoMailClient: External

Huawei MateBook E 2019 is a 2-in-1 tablet shipped with Windows on ARM.
It is one of the early WoA devices powered by Qualcomm Snapdragon 850,
or the sdm850 platform. This series adds mainline Linux support for this
device using device tree.

Changes since v1:
 - Remove 'enable-active-high' property from &vreg_s4a_1p8 and
   'input-enable' property from &i2c5_hid_active to avoid warnings
   mentioned by "Rob Herring (Arm)" <robh@kernel.org>

base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a

Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
Jingzhou Zhu (2):
  dt-bindings: arm: qcom: Document Huawei MateBook E 2019
  arm64: dts: qcom: Add support for Huawei MateBook E 2019

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sdm850-huawei-matebook-e-2019.dts    | 962 ++++++++++++++++++
 3 files changed, 964 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts

-- 
2.47.3


