Return-Path: <linux-arm-msm+bounces-112820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZDFBXg1K2o24QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59410675999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:23:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m8W2axrD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXlcX1in;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112820-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112820-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8765C334E9C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BFB395AC2;
	Thu, 11 Jun 2026 22:22:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CD33E37C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:22:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216536; cv=none; b=GSCsZWyUHoPQ73ZDNneSxWdVDSlWJWscyAsdBN9Hb/5/yXAvxucplpCXxMK5u1W+nv3Kru08xJI3QoRuZMIg32vjt5E5300x5DXGmAzF0AGGDHB9ALNnI9rtktsRaTtzGF1GXUa3Fn+53gXQbrPlwzzk8IW16XBG6RAM7CI3D1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216536; c=relaxed/simple;
	bh=d1J3Qe5UigcccE7VBHSzeQf0kk7LLlF3NSyoVO2nIx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lKXnbAgwNgYPf83nUjk/xG+D7A+jz2MxcUqJKu6rCceNz3LLcCGBV5kurGncPmp1O9JAfStyHJaXlL1bIFfJ5xcpF8hkLu6m7oMxio1Evre6cKCKIwfHt9dbuNfqYj3s/JrtwUOShK/tR/UODXwS7GitzJ1uASm+iEpqlXzcTOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8W2axrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXlcX1in; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3H7Z1482168
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1dY6K2xgh2U7p8EG/dBjjf
	n2raq9Fy1d0oOPTCjgX0c=; b=m8W2axrDDw54UVooPixMv3zRO2/abayEvZwcS4
	pAc3VfgCc3fAMvDGOR6tG3ElR9iU908GwXW/oe0Ib7rA3+aCIn/MW4psj6ip6yiy
	J8HMluwZDcIYJtwB6W/vv4B2k6TRgX9Fyk3Hzwj1nBMb7GQKV3Gy66qHeYpP3kl+
	j1FUl4upVl48LH8E0ttDqU3q1go8YbcTJvNkIYv5oPLKyvbWORxlhXZ8b+Jgaakl
	ZH6c32MTisfR0fIThkIr5Rlu6JJiW/ZFL6irfd5MthI3YnvrlgGWBHbVHwJas1SK
	7QEuZsDhzpyhvCaHkM1YaYdJ0riKxhtcm5hl5Ff/xTIFO4Ow==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd1b42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 22:22:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304c652be4eso1018554eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 15:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781216529; x=1781821329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dY6K2xgh2U7p8EG/dBjjfn2raq9Fy1d0oOPTCjgX0c=;
        b=QXlcX1inyPKtWlZufo6kxaKxcumMEF5d1CNt5zJeolQcdt9l8ba9scpX3XU6iN4Vyv
         rEO3gZFrAStSi3+Qps4hA87ffkNgAQ02lRpVcvYOitdOk00SMnGZ/KdHgu62kLuU1zGQ
         UGBrT1meya8/6Y+1YOjq07Rw2oJB3bEYwPpbWmxtphqLniMvCvegIwXljPTJhsT7XjXg
         UiOezg0wCVfoeF7figZ56f1t2uwQrV9GboMDC6dS9kYquBN1IgOFa2u0Gc3mh5fjJQWU
         F9kRmdZQ239Xo8iyHjNzQLI9tm6csZZkB4VKvS/sZ8z7BN7/bZz5+bBoMHxTgqNAXZur
         Ji5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216529; x=1781821329;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dY6K2xgh2U7p8EG/dBjjfn2raq9Fy1d0oOPTCjgX0c=;
        b=F3WpW8y9LG7htTTAJ/d3L2N2aFTltR5F0gzE4P8v7fWay8Mt9lmWEvgUIqE6kzYn1i
         ZUgKdMj6T26Zao9SU8oUcTBxAHcU0mhXDzDs1jMyDjZpP8pf7soOEtAcMSb5E0/V0t+7
         VWisKlwORP+81MNbiDmVuosRRx9DNH2ZjwNwoiah5jrO82k3Xi6D4YLbiFPEnWQ4uCnj
         imaHQAhru4UAuuzjWmhrBsLDIaTsJVOzBi+hc27U7G8h+af4oKjAiJKbsvyVcowXE26U
         ZIyRH/4G0LpR8rBkKSFEon6cr3iUs17V1OuEH/K5nzV4FX5kahPKaFEaL/jpUUKTOlI6
         fu/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Um3OxheBn2ZMm/d8G4nFl5RDW6Fg5YgJ95weligHXO+QPX93SPqolEnyv44GOzT+yZS8bdhK3336IPeGa@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKUIwJMMsJhEL4mIm4GHekOXSG//Q60K1E8+S0ple5RZHy5ht
	k0Czo17VDd4DTcpc6ljbT+TpdVumU6xLhPZ8ffFjoLteB4ZI1lrUB1ZO27cNMoYF4S5zUuAKBvC
	2+EBl9xo5Fp9nfnSJRRVAALXWa040DHVq1vuV6NcTOJitNUnLFkpE8ZjQk2hpTpaARhEm
X-Gm-Gg: Acq92OGzpHYZGHLTdy7m6+ins/1oUdqNSC+FoB97450h4xUh68TqTwyX/yA5JO8wMtP
	eo1qSxf2yK1gGRPuo7O7JMes4jVylE73LgCgdb2RLK66ktBph4fOINsXmhfN2Urb0sLX/ANTte3
	zEwiuFRw8GKd7sx/R73noBmwivqhznaVMWHjISy7z4Is9/S85wRnoSSfrFZRC9iMgota0JaiaLo
	xo2xC2gOipXqEaWLcE9wzLfYBTNkr0cEhPCrQqS+r1G+kldLjBy5mrkLAyNuqKKUmIdBVaBPcuf
	+U9fROcjEuYhufcoeRElVMiBuIQwU1LIPUaYOIaC9vCub65rdzxzXOp61xAcCP4BOf+Ivpd0/iA
	C5tSPpapy17mzeIPYzNKMLfxnVzEyUppeQlevLq59rKw+l82ZMSMF4g4Ek6b3WA==
X-Received: by 2002:a05:7022:100a:b0:138:40b4:6cf9 with SMTP id a92af1059eb24-1384b65548fmr241325c88.19.1781216529323;
        Thu, 11 Jun 2026 15:22:09 -0700 (PDT)
X-Received: by 2002:a05:7022:100a:b0:138:40b4:6cf9 with SMTP id a92af1059eb24-1384b65548fmr241305c88.19.1781216528759;
        Thu, 11 Jun 2026 15:22:08 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm203807c88.9.2026.06.11.15.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:22:08 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 22:22:02 +0000
Subject: [PATCH] usb: typec: ucsi: unregister debugfs entries on teardown
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAk1K2oC/yXMMQ7CMAxA0atUnrHUBFoJrlIxpI6TmiFUdoOQq
 t6dAOMb/t/BWIUNbt0Oyi8xeZYGd+qAllAyo8Rm8L0f+9E5rEaCtShnsY0VI881J8PgL5TimYZ
 rIGj1qpzk/TtP97+tzg+m7buD4/gAFyU95XsAAAA=
X-Change-ID: 20260611-usci-unregister-debugfs-a24cfd3c59ac
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781216528; l=1774;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=d1J3Qe5UigcccE7VBHSzeQf0kk7LLlF3NSyoVO2nIx8=;
 b=MmBVIknFAuqnuBLFMsG8PiAOJNIIw7kUv+JSy3OOVtboAO7bzhEDKCesjA+7+PYbyC3pxtvyR
 nOZLcSEgu95DvsLIwiW0aBcjXzF7hwkeFXlhaGzqu9ZIR98g7aDaQr5
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: 4uz7unXq9vaEVkgO6rH4om-6HLYyiqCz
X-Proofpoint-GUID: 4uz7unXq9vaEVkgO6rH4om-6HLYyiqCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIyNCBTYWx0ZWRfXxp7y2/GNkiBL
 amC8QwKmP8BebO70yP47cI/vEa945nBipdvcjIG2aNgsNmKAgR8s/2Q1yQcfmvKk3ZBjD4Cw9tf
 J7QLZaLHuVqhZpFtV1CI1m1zNGPblO7Bl4qnwOCYVJ7aI+cTnemr08AQwM5yjT0wUbmiNyp7zV4
 iaa4Cdsadyj4hSPu9n87wXyKDTT1jBvcmmphkqDH52UGYwPa+W/16j9f53/lnG87K75Nz6IoOGM
 fjpvoJys6idMrDSXuE/skXutte8ZdPC2OCrsVfqg4bHOZucZnTOaBvavtTiKv0digRrkBjztJU/
 L4vIVrgafSk52oADdU4GsaixbGt/8ZEQQf7rwStvnP28ksLYreNT9iew5ZEEQS/Ty9tYksC43yc
 0qElgkgbRGW02rD7WzOmCzIfGYEG3aBaLVWNb+zPCatkHeYxANJ+5yqJiXzWsFPZqe73mzKqHAH
 XI0qdzsQDHgMd0epTtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIyNCBTYWx0ZWRfX29noum2gYDiM
 SZO47OFnPMd6PEXIvPNBZIOzu3K8f9aqM+N/cx/HuG5p9u+A2JrQnUxILsYDylMiws+E0cq05kA
 BdEZe4WykMjYyTOafX3iK2yd8MeP+eI=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b3512 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0uOraXvCSQh-yJGorEIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110224
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112820-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59410675999

ucsi_register() creates per-instance debugfs entries, but
ucsi_unregister() keeps them around until ucsi_destroy().

Drivers like ucsi_glink that unregister/register the same UCSI
instance across remoteproc restart then try to create an already
existing debugfs directory and log:

  debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'

Unregister debugfs entries as part of ucsi_unregister(), and
clear ucsi->debugfs after freeing it so repeated unregister
paths remain safe.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 1 +
 drivers/usb/typec/ucsi/ucsi.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index ff33a5e7c6b0..a124105b6226 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -162,6 +162,7 @@ void ucsi_debugfs_unregister(struct ucsi *ucsi)
 
 	debugfs_remove_recursive(ucsi->debugfs->dentry);
 	kfree(ucsi->debugfs);
+	ucsi->debugfs = NULL;
 }
 
 void ucsi_debugfs_init(void)
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b1..dcef37754124 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2186,6 +2186,8 @@ void ucsi_unregister(struct ucsi *ucsi)
 	cancel_delayed_work_sync(&ucsi->work);
 	cancel_work_sync(&ucsi->resume_work);
 
+	ucsi_debugfs_unregister(ucsi);
+
 	/* Disable notifications */
 	ucsi->ops->async_control(ucsi, cmd);
 

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260611-usci-unregister-debugfs-a24cfd3c59ac

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


