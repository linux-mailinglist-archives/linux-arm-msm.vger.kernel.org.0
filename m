Return-Path: <linux-arm-msm+bounces-47672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B05A31AF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881AF3A8C19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCE317993;
	Wed, 12 Feb 2025 01:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhxXU12M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A8271811;
	Wed, 12 Feb 2025 01:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739322501; cv=none; b=mGm7JwiZL+MzY9HY6HZlr/fXaSBJrWfTPi4aEgTqQxWzOBDdTBJcrug0c7Kmqhu6xL+cPgKPGxYFBYz2vJO8p21c7x4SntlMKWgRw1d3MPRZ7UgcGjxsuoy8eXhxLGhEQLlgWEXWuMnHtvy99NBR1XUsqITjXjWvKRkap65Wxes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739322501; c=relaxed/simple;
	bh=20Ap9aAZ+Ch4c8R+BNmFdvqVW+TRYONxjh68ki4MqOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnIjCr3yQ6iPBPJtLtfqptzcFXWKVGpIqYhSEBLxynJfuRVlWXElFiJXg/8hhPeM4ewB1jC+IEBU/77t45H6r0nHPhtVfVR0WCQkoDKkcLV3CkREBOH2g2XuU0PBpDQMs3ZQcglola+Xva08TDR+k6pzRhSx/eY1VlETzw5vGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhxXU12M; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8573241a91.3;
        Tue, 11 Feb 2025 17:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739322498; x=1739927298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1TRAUpwttsFmuI80sWwjqr4fHIXT9YMFZZ9UQxehD0=;
        b=NhxXU12Mi0YMRUT9b7MGng0mNm2mZ5ssiYREDHTYzW9Qe/xIPZ/eNUrss5mdvmpfJt
         AyNsNYuTzgWJV6444V5rGrdkf7o/NBR8Gm9tSYq2lVb+r29LkgUjXW4IXLuVL6swljA8
         dDD1qARbyuAM+q9NB320OBkOfyb5mQupV/3GgwHNQceigcCWovIZsvbQQ/2az+RiXnJr
         AJwqD9axSW0xb5FibsUSmmcPawvvn/oJZbY8FSrIn1yql2glyojh5Skvw+HKV+Xey0TN
         k2MRH2neTUrsiaC2nJmOaGQonoGidHaL5yUswr6lqbBmp/vBHD35Fr/KToMphxcOs/Df
         7Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739322498; x=1739927298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1TRAUpwttsFmuI80sWwjqr4fHIXT9YMFZZ9UQxehD0=;
        b=NjafsMgCU15LIvDkVxb/zbWKY06nQE3FpdB5JHw7Cevu8z6qC7T1pQZ/mtOy/2Vkic
         oYk1ufExK15Ft6PZdRje2/4KvXZXND2dqsv+JUOH8Lrccuvb5pAD/cXHQu54qJjcNznM
         HuVG4SY/26ycxz2rB3JbUMGCyEItJjh25m052tN8kB2nWll6OVLqp4H1Ts7LYFgYFAR2
         C+eD72Fklo4fEIhcbWY7S/0JcTYaCl0DqJ1CpM7T5MPC/ejv2mzVbzCfYp5hIDHSQEFZ
         S8E8rpW0e44D5JtqVfd7HRcMHxctcuV2cskoP3a5QSzyUW8rKM2Bb8dbZKSxTTBOjpZo
         nc3g==
X-Forwarded-Encrypted: i=1; AJvYcCUa4MiOhoZrbVDDEwC2pFFz0l/LFjTfdV7HNiOHh8hTRgV/gxNKl9z4/7g3vCkCto6PDQH41slNZl6s@vger.kernel.org
X-Gm-Message-State: AOJu0YyOx/OGQmoyEPggp51w7qYKPmp3UhBgAsSScxC0xpojjW/q+PW5
	U5hydZur85xu4GQo5Fk+ro2nWcV5KAGmney4u/awROC18wNJsJ9Z3WW1G83C
X-Gm-Gg: ASbGncuLrqM8+6L2YmoR/D4JxpMDfAgOPwrBLdjDjQJwo//v6YhraVs0Oc3zKUB92jH
	bvafemuFDaaYMEVyFgpI8jsfIC54xG6hGwTkHLfzBdldmZi4yqsHDjVGAyCK6pUG7RQAXpNIz3i
	G44kMtWRhir9RC1JlUMHfzvk9zvXUugrcyl5d1Lch5M6jpfS4lR3SfuUP4T+bENAe8bp41nB1tM
	9tEKItg10OR+2IUhveOGYfHrcD8HcFgdoJZBW2IAYIMtQcALSyvVubW/jJ1uoJPI97/msKIKHxG
	OomByJcAWDIQxrqbkB9yFwQhmPZzI3MCBmbMug==
X-Google-Smtp-Source: AGHT+IF4TMKc6KT3C/K020xhd/HHg4qxnpumAIl79CQqU3rKDGbruejw3iY7NkRcKY0oF93E8plG7g==
X-Received: by 2002:a17:90a:d645:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2fbf5bf731dmr2170484a91.10.1739322497832;
        Tue, 11 Feb 2025 17:08:17 -0800 (PST)
Received: from localhost.localdomain ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d3d16sm190408a91.13.2025.02.11.17.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 17:08:17 -0800 (PST)
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
Subject: [PATCH 0/3] Add PMI8998 VBUS Regulator Support v2
Date: Tue, 11 Feb 2025 17:07:41 -0800
Message-ID: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings,

Thank you all for your feedback. I have integrated your recommendations
into this revised patch series (v2); please disregard the previous thread.

Summary of Changes:
- Patch 1/3: Updates the Device Tree Schema bindings to include
  "qcom,pmi8998-vbus-reg" for PMI8998 support.
- Patch 2/3: Extends the Qualcomm USB VBUS regulator driver to support
  PMI8998, dynamically configuring the regulator based on the PMIC type.
- Patch 3/3: Adds the VBUS regulator node to pmi8998.dtsi, enabling
  USB Type-C VBUS support.

Motivation:
To enable VBUS operation on the SDM845 platform PMI8998 PMIC.

Kernel Version & Testing:
- These patches were developed and tested on Linux 6.13.
- Attempting to run Linux 6.14-rc2 on our Lantronix SOM resulted in a
  hard crash, making it unsuitable for validation.
- Validation was performed using a modified device tree, confirming proper
  regulator configuration.
- No regressions were observed on existing PMIC configurations.

Next Steps:
If there are any suggestions or required changes, please let me know.
I will be happy to revise and address any concerns.

Thanks again,
James A. MacInnes
james.a.macinnes@gmail.com


James A. MacInnes (3):
  regulator: qcom_usb_vbus: Update DTS binding for PMI8998 support
  regulator: qcom_usb_vbus: Add support for PMI8998 VBUS
  arm64: boot: dts: pmi8998.dtsi: Add VBUS regulator node

 .../regulator/qcom,usb-vbus-regulator.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  6 +++
 drivers/regulator/qcom_usb_vbus-regulator.c   | 38 ++++++++++++++++---
 3 files changed, 40 insertions(+), 5 deletions(-)

-- 
2.43.0


