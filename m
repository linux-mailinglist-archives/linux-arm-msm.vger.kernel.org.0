Return-Path: <linux-arm-msm+bounces-48573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6485A3CBAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BDA17A51E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267CB2147E4;
	Wed, 19 Feb 2025 21:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6YyJEnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042D23C8B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001283; cv=none; b=gqnmkAJeNTov0TcivNjO7LUZR2iPXAglJ9+BgY9l863A0AtKgWANew3fAh5tKkI1lh1DALl0q2wyvtE0/eJUlAY8vMQct5vUGpyfrsI55zp2ap8DpzC8QURnS1csXQcX06p4/X4Xi0ch0RCaXOfNcjk+Gj+ZqouKyaBxyj8NyYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001283; c=relaxed/simple;
	bh=xaGvym5RKH2mpVv4LlETiIiUiAjEH8sdnTTVMiObclg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oDTJoE/pZLt8BtzAxlJ+hbuP3I0dOLMUe8sqpa0X55GTbNbEMn47Mpr7PfBI926c9hquf2+YE9IrorS5vMiL2Egl5pwZAFnHkZM0tPOvFK0i+yejMuUZeYQr7STLO+xSjGCuVPleD05P1LdP9k7jJPE4+4tPBCSCbutvjVB9pog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6YyJEnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JH8O47015051
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 21:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WtJk7J+L8STgsfYU6SmyrwCAbVUZ+0/gGqo
	u6kln5js=; b=h6YyJEnpFmO83l55NtwqxqZb3fjuNT8fjux95Yak8rY34a/ljg7
	SIpSbC+5VqH5GVOUjXCHRt3E1qadunbl5OhYXIPVZ7nRzm90wcC6GLofZqnY6t7q
	RhkA0Sx3vQX3wLQPZPhzIvFfgNDV07Ep3ZGbc22cImmbtMztlgasnbqKN3iX5lpB
	qPqjdE4fnbYm76QxMN8M1REgKLaoS9P0X0nd7O5MrTyl82Eru2yipCXAMyD2BUfj
	HYiIw61U/gE2VPTl84PaMaP/yLazCD+m5hCkAcL/E4JZ/Rl6Jay0nQk2sVmu8gCl
	ugk3WNDUGjKXqb8G7k+rwtWL8x7BazNtQkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy140ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 21:41:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220ec5c16e9so6613415ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 13:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740001278; x=1740606078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtJk7J+L8STgsfYU6SmyrwCAbVUZ+0/gGqou6kln5js=;
        b=XUe9k9U65eH3t6Lvh9l5p+ifotHRe2kiSJh3E4dwVM1Hu3/bk56pn4Em610fufuXt7
         3Mo8XHlZQu/DVBDl5sJE5n8lgphgsOpwNgS2j617ezQOLKiw98eO6RqFDI7NEhnm56Wg
         n0qKf4j29+it/mMIgMsZ2fZj2t0JmI88qVBcuB/hzmSlKWZ8rs7VOIAlkOytoYMHBYnt
         dMAcvQHiX3KhiWbPTvj6A+7SHRAFjn34xUimvQ5qGli/X7TbXjn9Q7xV1o86BKH2F8mA
         7xPAdP6Au7mODo9ombaL5FI2daVsEcz+4eXqMuN4QqEgfC8GfQ1i2BhjacpDEMtBA/rV
         DC7g==
X-Gm-Message-State: AOJu0YwtLo3DbNwIk/23Z4v/pN36U4+43gnrepVXWaPn1wTxG/B5vnxc
	4FduOtx6Uz0DCmwj2MI+AXI+yGhBjtLiAJ2T6tSeZaiQstou1bqChYcqBqwQV+r3xY9g21jaDK1
	tFU5KSXkEwhmOyQ1a+9/PDhKmOMOOT4tH07Y1rnb/GnnzhkiOMXT66yix0EZ9OUZX
X-Gm-Gg: ASbGncs8lmaRTVMOx759tZ+Ai4UHykpLIP8Kitjubo2Bgr/e0NnjTapqvjUxzZIfNkK
	BdLGW/en2JyJ6pfAqh22j01gwA7zP0gdaar5eNNZg440BqUdn6qFFSSsaCcx0WSJSDqrgk8sYe7
	za8FEmqbfEbO0PISjPHdHqCTSRXZEzPyh3sv1uKrk+VN7XQ2qkejEpKBIgkN2Yc3EI1+3cE1qtd
	J6A8oIa3adhE0UpahThkJLEWj+Oi1XbkfSSBg83YMc3GCCFgMdYQPUTdSsZEtrV74gBbHTvnTYm
	O8DfL3xYd7Aaj3NGP1GFnbOGiUmtsFoPFro3Td3h3sMSVSD29hnJlg==
X-Received: by 2002:a05:6a00:198c:b0:730:8386:6070 with SMTP id d2e1a72fcca58-73261445ce1mr32387869b3a.0.1740001278127;
        Wed, 19 Feb 2025 13:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYy8GSI+yB3hoPIZBl5aPJIOh94NXuDkh6EdcQ4qKTjkPx3KBxkM3IM4tfQQ7jjYkV93lZpQ==
X-Received: by 2002:a05:6a00:198c:b0:730:8386:6070 with SMTP id d2e1a72fcca58-73261445ce1mr32387837b3a.0.1740001277752;
        Wed, 19 Feb 2025 13:41:17 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325a8236bfsm9732983b3a.31.2025.02.19.13.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:41:17 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Update my email address
Date: Wed, 19 Feb 2025 14:41:12 -0700
Message-Id: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HsBywyxwze6WmjiuPHILDB-yHNKfkeAk
X-Proofpoint-ORIG-GUID: HsBywyxwze6WmjiuPHILDB-yHNKfkeAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190161

Qualcomm is migrating away from quicinc.com email addresses towards ones
with *.qualcomm.com.

Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index ae0adc499f4a..f4b927e48ad1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -320,7 +320,8 @@ Jeff Garzik <jgarzik@pretzel.yyz.us>
 Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
 Jeff Layton <jlayton@kernel.org> <jlayton@primarydata.com>
 Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
-Jeffrey Hugo <quic_jhugo@quicinc.com> <jhugo@codeaurora.org>
+Jeff Hugo <jeff.hugo@oss.qualcomm.com> <jhugo@codeaurora.org>
+Jeff Hugo <jeff.hugo@oss.qualcomm.com> <quic_jhugo@quicinc.com>
 Jens Axboe <axboe@kernel.dk> <axboe@suse.de>
 Jens Axboe <axboe@kernel.dk> <jens.axboe@oracle.com>
 Jens Axboe <axboe@kernel.dk> <axboe@fb.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 950e8b7c0805..815a28c7e6fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19426,7 +19426,7 @@ F:	drivers/clk/qcom/
 F:	include/dt-bindings/clock/qcom,*
 
 QUALCOMM CLOUD AI (QAIC) DRIVER
-M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
+M:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
 R:	Carl Vanderlip <quic_carlv@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1


