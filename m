Return-Path: <linux-arm-msm+bounces-88793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8218D19872
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B60A300F9D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E843E2BE632;
	Tue, 13 Jan 2026 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtuKhTeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738DC29AB02
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314897; cv=none; b=Y0bOWjOpWIOZ1jjvMXQJUE15dR3vhB/PtwBIIKMDlF2WbXgNiFLfbKc4LEx4GMt1i/dZPer1paLpK5LzrkparX/wQ/GJPyPzlAlkY+PGghXUPN6L37tGzaZxzdvp3qEDmvllpI8kenJFnOduvb9muV7Uf/VKhl6Eemcki921ShM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314897; c=relaxed/simple;
	bh=w9SRfKMgXMYlGiDMWRvrXKKEWnKXVzUlYqo8KAefPQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qeAMZvYcM66nzV10Wl+nTYJBWvRCRZS7lYJyO+NVlw6AxSQAVI0yXrxDRqkeraic0iZB3vzM7avx5MGZ0TT8VU4f+7apK/0jpfMB+e9dyqU4+jUOqn13CaKfKfjfI4v6VxCWvJg/sO4bi4v6oocRuccSs/dEc++VGVWZFO8LPEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtuKhTeR; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-121b14d0089so8422889c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768314894; x=1768919694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zco7EFUTNtZlgUYwabK6K3z7XvpUMikF8ohw5sUN8wk=;
        b=BtuKhTeRzKfnBSpBQEbotrHOhgD0fk/dPBT3W1oa9MliwmukA2wdOqtHlP22vkKQ7U
         XlhDUYICGjWxtgO++Enf7tDtbjalP2zlYUBiE3wQOh76G0DGlWrtBLjdWpRDk2Vk+PYL
         pIY+C7lRrVjVP8Gj0WoU2uAbxH6kgbM9WbjRRjSqjA/sej5i7tU8+CwYBGMRZbBGpePq
         LphD6RAP7fQRQKMeqrkzKvP2Hg5qCOr+qtY9ABs/gqdFgAEyXDr/AibBEROcaGB//bUk
         +1fo5GfcmYUuYOeCCp84I3g4sofpogzlBpoKdMb+2ZyjVLMDUBJotrpf8ODrrza7A2It
         XMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314894; x=1768919694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zco7EFUTNtZlgUYwabK6K3z7XvpUMikF8ohw5sUN8wk=;
        b=gGZ3srNJp13+qipseTxQfkEgJJJPeQXCiI3kMkchJk+3iGeGQPymF88TcOPB2NrWzW
         /mgXTKAUsxXdad48rlRZNVc3ijYelq6jhpUtThA0lvTNdhICPSmFX4ibi4oNcFCQfEbN
         Fbo72t3Q4E55FUbhr6ca//weGra0WUWycX1gk+obdzcsVKTyCRtkQKvLIvfgBOjdCo6J
         AU/csmJUzu2nnWkT74PGI1zgYezxWZOTyeYiptNejvUAzQ3rypIx4cBoDDW1gRbVvs22
         qeUqVeRB9RQ06BQAD/aMAeQ5orrFfNcc1k/EuA5xwAvy6GEu1Gku9ADIKZun4VRl+JLq
         +ehw==
X-Forwarded-Encrypted: i=1; AJvYcCXCndVIw+CRYRe5o89D5Gml+fad1WvrjPMK8nr1gdauWYgTT/+3HdWSFDJYYAVCODRm3Lp8syTnr30fuTNQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBn0nFO3/n0ZZBePMlpeu1cU6tNSMWyM99/8fxQJRhyzgjpVC
	F1vvwJc9BRdBh3oeUQ2dWrl/T+yfCELJWfvliHzuUMthEoQicp8ubZdi
X-Gm-Gg: AY/fxX5WctHbs+lmRJG91QyHSsHDdM0B04LDe7N5Kb3wbS5B8r2dDvt27HcmAytkLwz
	w+juQXzms1up2pEBI8Z+Qqw622HTK2GtXBShkv0ylTYvjlilRuuXpNZSOgsBPRopzblU75+PHEr
	ZKXL5mIMgBdY1F8JTe2rRmdlbNn/t7c+c87SLLNyNzlmIfGRPp8UDb6Hr9tCwS25dK4rmLYdLng
	kKIwmbZuhnKXfDX9YxIqbNBitIXX04tISwMUdOQeNpvfgLZxTiM/ELwUcLiz9Chyclj6PG5YLyt
	5z/WOJvnXGGu+FIVmgczLdbBMviwUHfp3PXiPXwlt7oN7aSOcQjmwVeSRrwGDLGiW/VVZk9MjQx
	kOF/2MN2pAGH6UuuDGSPgOqjtz2gngeZHBdnv4eWYrZt5tiReSwTMa4FKyWnhgEHX8uYNNm+7nH
	dKD+cjLUDaSu2OotucJvQF
X-Google-Smtp-Source: AGHT+IE6eqficxeF/oTartYDjBh3+Z6jmQslJHwouLzBiZA7Qxp1OVpE8sFLB0l1i1KCqcJgNMf5pg==
X-Received: by 2002:a05:7022:4390:b0:119:e56b:98ab with SMTP id a92af1059eb24-121f8b0e125mr22306128c88.18.1768314893939;
        Tue, 13 Jan 2026 06:34:53 -0800 (PST)
Received: from localhost.localdomain ([1.203.169.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b21dasm19672434eec.27.2026.01.13.06.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:34:53 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH v4] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Tue, 13 Jan 2026 22:34:45 +0800
Message-Id: <20260113143445.889031-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
reserved memory to the configured VMIDs, but its return value was not
checked.

Fail the probe if the SCM call fails to avoid continuing with an
unexpected/incorrect memory permission configuration

Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
Cc: stable@vger.kernel.org # 6.11-rc1
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

---

v4:
- Format the indentation
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t

v3:
- Add missing linux-kernel@vger.kernel.org to cc list.
- Standarlize changelog placement/format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t

v2:
- Add Fixes: and Cc: stable tags.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u

Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index cbb12db110b3..9c41b51d80ee 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2339,10 +2339,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
 			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
-				    data->vmperms, data->vmcount);
+				    				data->vmperms, data->vmcount);
 			if (err) {
 				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
-					res.start, resource_size(&res), err);
+						res.start, resource_size(&res), err);
 				goto err_free_data;
 			}
 		}
-- 
2.25.1


