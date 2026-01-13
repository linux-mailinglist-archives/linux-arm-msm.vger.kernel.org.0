Return-Path: <linux-arm-msm+bounces-88648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61757D1645C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 03:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07D84301D58E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FEE2C21C2;
	Tue, 13 Jan 2026 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOwmzTWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A72853F7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271192; cv=none; b=k9CF9p5aU/OjOvWbtMTdkpGnWOEh77N/s6PKqE71IECJFpaLbh9plqVe61/z+PaZPDiRuU5AFuLY/T5mb1b44YpN8o7uobm7tvCi71HtLPbvrEurw+qckZNC4ImSumaSUrZlfYMQ7l4Hy/LXfyOfOYkNwdFMHlvGUCloBNDmn+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271192; c=relaxed/simple;
	bh=fryX6UynJ5IFJ74anXaeAvTTH2dF+8rnd5xH2b5jc5g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uFzmXsX4unl1dIhFdjj1k2Xh6HWRINHjy9fxGg+ondBtztRMl+YftK0kKaJD86Jq9RVo4RRZpSIRwVP8tlPmDiVJbZUsnPXfwNfIfEGyn0AybUZYxAbALWDlyi04uhtU9mzBs4dEdK/Bq4s8JdsJKF8eN4XJoXOc7N4Zlma82WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOwmzTWF; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-81f416c0473so1849703b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 18:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768271190; x=1768875990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iW1zjR2bH63sUC9kWdfqTHJPDTn4Q4NXCWxZ8Jhpl0M=;
        b=YOwmzTWFhnmhqQE90gcpHabudO/iWtMeQFPts/H4FkbqBv3H1GRwXqJt5yZJ9zYCeD
         Ic6DeJT0X1VI2n2P0DFh2fKzaqwr8kEDqwOVBo1uNIRqVDAgw+BQI7gy+sHnb4cXXK4x
         eMqCrP+NkxKXc6YtY8ivWE4LbZJprSBmTuH+HIyMF5cEVvk/s7C6KG/FVn4L1Nq8PHwR
         ctxZU0rAHBYvWznRxLSJvPwGCeHtfQG0nHgRqk21EywiGkVM9L9/5WdmfEg10gCT3H+q
         sUz180XqcHZuhdSMbLjDPrwHkWELDcmLoNw5/DK6qDYnLrq6Tio28bJoYhuPsJNw7HFt
         N5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768271190; x=1768875990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW1zjR2bH63sUC9kWdfqTHJPDTn4Q4NXCWxZ8Jhpl0M=;
        b=VCcd2ank6fBNKFmvo+A5K26MhJLGFkrGW5Bn+fuF1k4VgoXy0QQftVPMWsnk1fda9Z
         qoJIVOtaX8v2zKCsqtDfTtMwjCkxmkcnJ7zdfei2tKGkP5IU/ND7Q4UZa4fKYP1d+qg2
         66PGHq//eZcSO3fjZCK1SvTj/fzogNi1e+lM5Urmmj7ZXDEsCWsWYJjorod8dusNcbyf
         ycANCPCLyPlhuQqRPEB7ef7TeDFCFBtFa94YRhpQAr0c/NNIFDDtan+gw81jCiBiD50y
         X15ehQ5LsUpNhp96zEM9HdmzJefrF5ZBe32g7gVgmXonfJ3kJL6TlqG4h93/B6yJ+Qbi
         m4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdXXFLPSZw4hJ9Ny/B+dBftl8rB0OvG0E1ptuedYj7uskIg7yG8bZ6OaQzzBlbNoZyqqzOCy2kVzBVGANM@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGaOJ5o1Ho8CZc+KUXxScD3G/QELpVwZ8Alm3l3cPjcDSXneU
	lizvN8P8ADZ9qV+TJ17Z98TOwCcM9+Op3URvl7sQPkX1GoFTvWUVBQ50
X-Gm-Gg: AY/fxX46HSyB/P+kNCC7046jt79t7juqmfu/UJfdPtKLTEeoeLx+hIvoebikeTpp8/J
	NqaRiDJjMRP1lU5enevkr2ENTB3TLYVIceMBHtr9iOufyuB0xSsZ8gJdiOW31CPt5CBVx4mC4FQ
	r0F/1fTFLeJoxfY6lJyyV8gpTOUcPbGnp1DaZ7Eg7W404JBW8wtUDr66mzLiElulIRcs3E0XO6O
	CGWmKOOcAdiHiXD+y3O4rGqJFV7Z/d6fqIBx8+lA4c8s+htJrapjldaDP52Qj8b9CigrqwkV04+
	57W5n4R3UQfjh6CoL04LVLIUDp+dBjV0B4DO0krRZMKtvOZhbqxakY3P39zS3XExVfgcd8W7geR
	8CdTmUMdsJ/aD2ASXC52EcHZaN+ksssd+nCRJY0t7EgGaglbTwsnYUwyXoYg6/APKyiQH9m3hJ2
	v4/muaEunMucXe3bpDPZvax1I=
X-Google-Smtp-Source: AGHT+IF5FvYiWFIbb5ECATEVt0CMutY2gIZKibKQM75WoVY6vMqwsXyRdBCG36b7Ofr9nw/C7ccN3A==
X-Received: by 2002:a05:6a00:90a6:b0:7ee:f5f6:68f6 with SMTP id d2e1a72fcca58-81b7f6ec194mr17648003b3a.38.1768271190060;
        Mon, 12 Jan 2026 18:26:30 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81c4905ca83sm13965064b3a.38.2026.01.12.18.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:26:29 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org,
	amahesh@qti.qualcomm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>
Subject: [PATCH] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
Date: Tue, 13 Jan 2026 10:25:50 +0800
Message-Id: <20260113022550.4029635-1-xjdeng@buaa.edu.cn>
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

Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
---
 drivers/misc/fastrpc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index fb3b54e05928..cbb12db110b3 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		if (!err) {
 			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
+			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+			if (err) {
+				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+					res.start, resource_size(&res), err);
+				goto err_free_data;
+			}
 		}
 
 	}
-- 
2.25.1


