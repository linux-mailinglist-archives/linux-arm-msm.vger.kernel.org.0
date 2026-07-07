Return-Path: <linux-arm-msm+bounces-117144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KW3JEhWZTGpymwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:13:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 486D0717D57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:13:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cpp+n5WE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NXJEWm7e;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE5BF300E91C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B678238F920;
	Tue,  7 Jul 2026 06:12:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFCA38A701
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:12:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404741; cv=none; b=FlVfHM3kpyvJ6+BOK5WR5KLI0oEBPTL20Llc+UqxTgRXCke0AsAyGwiiY9cIPKoFjVDuUNS88W7tE7IUmaYxiClJYxZSitWRv1iMbzlcVntTXMTZmUc/uxD89o2T7ZeLZY4nscHFGv9vJY9Qrk187fVQ5sCMv8X9CyMIiW4if0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404741; c=relaxed/simple;
	bh=EfGautIJzT+FUsw/yhzLv9bbZyARVX6CtMelQUoL2G4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEXETY2I3dpc3OcLSTtHqM7yKG9Yu+E1iUvby2drO/Jmzv2TSMeSEHq9WYw4HiSqNr7xB+GtKLHMDJcELO0EWnVNDkO+obGIYiO3RtDsUOo2f7/UWIaRNA2Hos2EB4GVae2Uooo4C8ipz295wIFIavxj5bwbqPo/A1U4G1gsxz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cpp+n5WE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXJEWm7e; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749McR2645772
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 06:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfnuyctgLY2Nqkn5CYZ26xnKmCeJR/ZgpKG/zqeI4AU=; b=Cpp+n5WEE7q7AijQ
	lsDMIsc7oeanuwEl5zVxo4ACIzjfnpzccOFikix9tWTjct1KhrZZbI+ZUrSFen2c
	ddDLP9enMJjtd6GOT/vk8yB0ABxAa/kdPsAiVayedwApEkDuBmDBIV0H/HsUPm7U
	20N82tnQui+gjSdJzCY0P7NJ72/BtK5HbU++yzcmJ/q4v938Z+ow4Reg2+m+Ifwp
	aS/o8NfI+oHDnVb7yHX2vz3Y6jiIag87x0qH2HuZjkiEteaY5k+jc6cJqHhbddSk
	U7dW4m5Sl28xxQF2ctOEazSRYUKvU0ri+FDt9n+K/PL2Gtdh7MLlZ1ImQqfjVMG+
	Vd9bRw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cwa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:12:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847a483ea41so580801b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 23:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783404737; x=1784009537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfnuyctgLY2Nqkn5CYZ26xnKmCeJR/ZgpKG/zqeI4AU=;
        b=NXJEWm7etDIaQSNZ6XQYbuNBruilk9zRDL1YBk3k7rQ+U4XWo/CiTYEj6z8gRhqUUf
         75YPlC0JxkU/1KjVrCy8PO1V05Oob6gWawWZauqFXGg3TLI0gzo+ml8KPek3pQgRnq5K
         iJCWRW6Nbc8Ofm56D3D+JJDVQ14uRGDC6B7IlW+bu7lXrE5ov2oVuNZg7Zy2D086kchS
         onoZihyt+Yw3ru+dRUnWBBoz89GihEVt+cjoNdoFk0UP+2JyjVfTHs1N2QkExevyk5LD
         11sGSvTn2DOtTuQwJz8XOUW8+9cfXvekpXqJ79JTvhs+7gO4O1b7zCjzn3KLtQzl9zVQ
         wb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404737; x=1784009537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfnuyctgLY2Nqkn5CYZ26xnKmCeJR/ZgpKG/zqeI4AU=;
        b=S+t+zejI+r4a8obJAMYjiYwurOl47IUO0dvwjIhdRDHRLEEE0ljw2WF9+bTvDKpZnd
         Nux07vN6DL2KwYht8fLaLprRRirpYQ7MkbAu8/oU4lWNiWlz+KhrEmjCoY6QLobAOSl5
         uGZ1wab6AmbA/1UHZ+7VdGYc3UTqXYpvsIvTEy4tekptp8k2HREZ9z8pAZkYEx9adM9a
         qlDqGPlz3Hb7l1Ju3T7hFMSLHgeYYZwCjub5CT2FhgTfP45Hxs+a6rqK6cVGqzZKpfmM
         s18XZyOCNj1vwpYxf9remeBal1Jw+K4MffNqVPyazuIBEWOYkmYIxWh+TXXs8HezsWH4
         gwiw==
X-Forwarded-Encrypted: i=1; AHgh+RooE74Cm89R4Uy845Mhm0f0b1BdKG6mXlV6pkWZnBLcQKcEDkfkxw0hUYllig3/OGN0+e20onF1Uj0ozAQh@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOnB+dOv2KsfH/Ac52leLKf2tN16fireP02xXxqqmmK+7sOp6
	Kc3dyXjYZ+cJgVr/ZAqMSHNhKRpKjtCb1Xl7pgIKNQNcMcY+BG04z81PDnOTYLAMV8ONa1MPqF6
	ac4EBI5Qw7eQKT/ZiClXvzlv+X9+U4gqGNwHqART/R8JBAzcmO5f50jG0qCAfZF5Kj1h5
X-Gm-Gg: AfdE7cncvNzquHUagHZlL8sGk3M8s1vs4f1xDlYTtDjwDiu8bQ1bloPbTexXabcMZPI
	RkTLhw1WgJ3ehUJ60G2wcaCql+NQM4HNaThbJc1y1N/ioNACe4a+Xh5B9XtLLb7cSTrGLTRffAh
	s7TmVqtypfgQEfSCZXWZyTzNrP6KwGBsvBlVg9oX/CBW2iFGAsTlJCEtXsdSoAyjwCYf1gf0ZTk
	cbgAuJhJh4Rgzb3K5WYlN5NF54yxWYCART07zEmO7ZmFYTlDXZtatpDnfOGSN1km0y9Sds/rPcB
	V+JrY4it9yTydIy//Ln5TOQX4FfNLTsNqT80bKdEU4LhcNcxMUz5tSyWEWOvvmOvud/oCt9RIVM
	K5CbEGSREeNdGENm7Evd7iTl0CBHvBsfnPUja
X-Received: by 2002:a05:6a00:aa82:b0:847:8791:f54f with SMTP id d2e1a72fcca58-8482f533703mr1165908b3a.29.1783404736703;
        Mon, 06 Jul 2026 23:12:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa82:b0:847:8791:f54f with SMTP id d2e1a72fcca58-8482f533703mr1165876b3a.29.1783404736151;
        Mon, 06 Jul 2026 23:12:16 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm3299321b3a.8.2026.07.06.23.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:12:15 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 11:41:30 +0530
Subject: [PATCH 4/6] tee: Export uuidv5 generation for TEE clients
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-4-f659cbd5d04c@oss.qualcomm.com>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
In-Reply-To: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783404715; l=2841;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=EfGautIJzT+FUsw/yhzLv9bbZyARVX6CtMelQUoL2G4=;
 b=PAw3EDVOOI2OCVEVYzRbl6L3ZuNWff3L3fJ0cAsU43Ep4i6n3ph0JorJ1G1zWS7Zf+gM/XdRH
 CyhtGsu/djEAA8S/ZMHG0VoY7eTivzh7mMXfGkw26iJBhhqsw4Haey2
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: jNv9mc6Bj_wzUIfPwq4ZJGrperScWmu4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX/LDT/za/GLfV
 8lpVAPicpvCBDZyQw5SNasBknHnQXbrCCT+Q9GZ52cSI9s+RKLnyaysw0D9wYxPghkzpNnYvAt4
 k6AWZYH7V+L0NYy/TQvQketQ7ptBADM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1NiBTYWx0ZWRfX9HkZjDE7hdrV
 L67VCAs5AZwAW/q/X3o2HXkEQ8YsLW4NnqCNLM1Apy79Kcs04Z+49Ec+tNeZSywmYOblSVgZVDC
 5NOaJQyvZN/ZWkPLvFOac1kzIir281+I/X/guMPyCc11ln8mg6R6oDaqM5u/7oEEU8hNEQ8nONt
 rqn2KhtJ7PdScuPkYsTW7SqnGay4ZAoFo8+6lm/CKBxigXcTXGc0MkZ/h53dhvN6fYZHLePrP1J
 VHdJZFsBufQlwDyjXt2nrd1aLwQtR9k9NokOLIcxwqklCAfzp61Wt6ZHZGs0jsKDnJF1q5e04sp
 YS2eJv2mQsDaL/ZOPTcU7KCGgNbdmBy54iJa2Jja4Z/d6fXrCqAVyXbIwyhISy40eIW4Xiklxhg
 v2mXrU+iGkq43xH5G95Bs0TWCBbrKFiuFGQ6ynOrLE426q3ElChmk4YPcxYcdAlL9skOuyRbRaX
 J1dQIKRjDf9gHCW9hjQ==
X-Proofpoint-GUID: jNv9mc6Bj_wzUIfPwq4ZJGrperScWmu4
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c98c1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_y_UpZ8dDEjReVSEE2UA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117144-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:sumit.garg@kernel.org,m:amirreza.zarrabi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:harshal.dev@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 486D0717D57

Export the uuidv5() function defined in the TEE core to all TEE backends.
This enables the TEE backend drivers to generate a UUID for identifying
and registering their secure services on the TEE bus.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   |  9 +++++----
 include/linux/tee_core.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 0783802fd010..61dd99bbf5f6 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
 }
 
 /**
- * uuid_v5() - Calculate UUIDv5
+ * tee_generate_uuid_v5() - Calculate UUIDv5
  * @uuid: Resulting UUID
  * @ns: Name space ID for UUIDv5 function
  * @name: Name for UUIDv5 function
@@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
  * This implements section (for SHA-1):
  * 4.3.  Algorithm for Creating a Name-Based UUID
  */
-static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		    size_t size)
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size)
 {
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct sha1_ctx ctx;
@@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
 }
+EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
@@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 		goto out_free_name;
 	}
 
-	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
+	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
 out_free_name:
 	kfree(name);
 
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f993d5118edd..13807e795880 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -266,6 +266,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
 
+/**
+ * tee_generate_uuid_v5() - Calculate UUIDv5
+ * @uuid: Resulting UUID
+ * @ns: Name space ID for UUIDv5 function
+ * @name: Name for UUIDv5 function
+ * @size: Size of name
+ *
+ * UUIDv5 is specific in RFC 4122.
+ *
+ * This implements section (for SHA-1):
+ * 4.3.  Algorithm for Creating a Name-Based UUID
+ */
+void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+			  size_t size);
+
 /**
  * struct tee_shm_pool - shared memory pool
  * @ops:		operations

-- 
2.34.1


