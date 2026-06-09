Return-Path: <linux-arm-msm+bounces-112121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MmnWHCPqJ2os4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:25:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65E65EDB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:25:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XJxaiRNT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PiCaM8YT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3A69304E43D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E4D3F0AAD;
	Tue,  9 Jun 2026 10:23:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883623F1643
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000593; cv=none; b=K1laAIHtkRz/RLqJA7FfnccV3CreP7vttRY3v+VqttsiQsdd6kLKpx6r4B6qj3vd1U/zgnTG5aNHcVuutFqwaao71I79FqVPElhJpG80lUvQLu8WGaAsRc7eeNE75oxLeQ03g7U1k6pny3lKcOlahhYfpyv+Y/OekeEUvy/SBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000593; c=relaxed/simple;
	bh=kCOJWtO9F47+b3gcGs0sqsq2t7/rJoV4159sYbTNwBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQ5m3yP15kC2yxaCCfbKJ5iuSLjqv5XFXZsHtrpORJpslA5SVI1b+Dj/s8naMIzoh9q+qspUYMrKB3ppr2EEqpAJtrjBRr78HiJxcqYfRbWjLPcf4HBS8Th5z8/xiWqiLCoky2wZJGXRX2lXoOUzh9a6OcINwsgEek72t9wYtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XJxaiRNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiCaM8YT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vPuT264909
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e6543jtmJUE
	4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=; b=XJxaiRNTSqd5roaNqNiPS/EZIgK
	VJf1nzyeNjzj6k9/oSLDrjylCqGas0knhhYoN7jc60SCm/240dYUnQE7Wf9TNmw8
	s3N119IvtVzw4GTDzgDru2+CFBJejd2MDbI6mRcIXK9GTS7mjtxbW3m63kM7KJhF
	Y79Y6Y0A0xftorUVp0+LU8j0cVkIOHRkwA40g3JQW2Aq6TXBY8F5aeS5JnHuPfaf
	YITLG8+CeV8jOApDzkayCjrrZtfudZD2K3FT2bzaLiJkBhAcgdfUXhxvZ/Kc7GVi
	iF+ZtNY24EgC7etkf0Rppw55RwkYtzYhkpDciNtLikijD/VHZMan++4Xz9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0srj6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so41017275ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000591; x=1781605391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=;
        b=PiCaM8YT3pAGD5UpVDWNACRXFkXw2FZNRVBF3VFerszgY8uS5sOWujb+vl/bg5mtse
         bLw5xNFO6+gd07c3G+VpTKpqJr5uNr6VhxxB20xM3we4SAJiUJLNO7cQGwnxEftxH59k
         4+3+JgbAokCxE84EsGtvL5c1qkqOSIJEK2SO+juJsJ20U/vKjnMKL0EZRRC/NrAOF4bw
         fwDEYg8aCATb9dqKlGx1O1oG+QONWlLQ7ABSVAWrFf4QOCOd80ZmFmpXiEZy9R7ZoHum
         3s5+jzCvPTr43LO/QeLjAN03RLk94l15KpVihjJHvs48h2oyVPBS626TyJVktOawffxp
         KWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000591; x=1781605391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6543jtmJUE4LrGeqokz4NTAuP6hzn3dMwJfSvMTunc=;
        b=A7VQoSFK5NXHPBdCFhi8qfzZPqhiLpCzhzNlUGUBuQn1H7DTTvIeKzvJSEJ80qG7tF
         P30TPobxksXDNm9RQXDaPZVCddNxEUsUY9LOXtNAsHT1OagkYzIuFB9vXQiNcG3VvXbl
         3/6+LlysGFvEekZurgONzxavOmuKKC8TLgsFRlJsr0q6XPt3B964jDuyLocE//tNZC5G
         IZa13gsWhtrXf4FUmmqtR1PBJGmogZbAl/4xyVDWVuvQB7q9W6/4vmFcA5dBngXJxD91
         x7qwWgq/45rvbe0bvphws0UA7sRNcuOgw9Z5eVZvKK1dOA22aiXkD6zNm8SdPIOVtaWQ
         iZZA==
X-Gm-Message-State: AOJu0YzvH7BY3GuF191Z11TyFpvV8IILPv5fgSAquul0b5ZTO10goSck
	5PlDRKQmCutyLEUKUIALxUHCLgro4P6/gZ58SEgccJQNzL6bTJTbGRDG058k17gH1Zk/KULpma4
	hiHSSkIQid6s8IPDrujCX36IzUIvDAS9eS019ljX0Csn+aZhQkEK8M2UcHY2RRkAVh4k6
X-Gm-Gg: Acq92OFgm45ksM9vSmkz75IPIUXr7l86NXAeTAuoQlxFxPuZ3DIs10U7NwzD6J2J43z
	+cCIzRX7KYr4oJw3GbC3qZOoYcYHxeHnqKWjI9OwbiKH5E+4Beu6T1tCDF/DlandkPz5iGO2baY
	+G0jI0Z9O4mGkURsOrEJsBDmHo57uUXP2MHN5LFyVnz2RGu5oKle0gv2pmHwHa3I3VCVY6HG/NN
	I/L60MyTCnwodMd1NV0mDBuyArS00qg2+EbVArW8PO9bOt7utNvx3mUs7wD9PdwTtuvjeqQLQAn
	HjuOtoXY3wjp3OsUAlAIF6eisV/wJUhePFvU7DAU12N/w/uBXk5XPtCvoh/EMBsnWrj17qJGFhu
	eaf1DfGHIheUTmZknC8+X0SmiybQEcabdSsHskZ4rQjF4EJd3xPTVehipd/s=
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id d9443c01a7336-2c1ec920ec1mr171681645ad.13.1781000590917;
        Tue, 09 Jun 2026 03:23:10 -0700 (PDT)
X-Received: by 2002:a17:902:c403:b0:2c0:c262:b924 with SMTP id d9443c01a7336-2c1ec920ec1mr171681235ad.13.1781000590335;
        Tue, 09 Jun 2026 03:23:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: abort subdev stop sequence on first failure
Date: Tue,  9 Jun 2026 15:52:52 +0530
Message-ID: <20260609102254.2671238-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX2Mf3qR8KuZ4L
 QOSekBW7BAPJCLBlnssWupP0t0i0zV8Nj7LPennxj8NRFEWUEBdct75MIjmG9S474wHScqROytD
 /NLF4AcxBRhJSsBw4BdokQhMao6cli1x8Z+mEBHQ0m8h/whz8k5h0zsAYUnWrqns3Y4BtltQOwu
 GUwHvcQZCz8wB5XslAgBq1W++Kqv0Gr2hz+xzij+8ultvLkGBzH/6Qb6wFF3LCToW7bXIfLxSje
 CBpOiLN7UIopsmjcDMvE+DW9Ojj8+7PVgUxsGfwabWgrbJxxDiT2h5QGX8lTyMH0UfIGLisSYsf
 FIJDiCis5EWFFJYETJz3eK5EFRlSCoIV+Ag0wE9zGObpFoPav5MYr1jc99lxIccakDQ5LXWYTxJ
 aDyuml0yRc8NqXiE5aVy4ruiaSfY8zqTHk9knwsyOpOnXLolQmezQjk56qBhy0ZYLIajX/6HW9g
 GbZtKzVfgS1HYVakuSQ==
X-Proofpoint-ORIG-GUID: 4tiU69rHcUbn0EoE0ExgbgrgILA9SJvc
X-Proofpoint-GUID: 4tiU69rHcUbn0EoE0ExgbgrgILA9SJvc
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27e98f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BqsRjhFJy6yuMY8SxUQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:mukesh.ojha@oss.qualcomm.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112121-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA65E65EDB1

If a subdevice fails to stop, it indicates broken communication with the
DSP. Continuing to stop further subdevices against an unresponsive
remote processor could close rpmsg devices that could remove the memory
mapping from HLOS and in case if remote processor touches those memory
can result in SMMU fault.

Change rproc_stop_subdevices() to return int and abort on the first
failing subdev. Propagate the error through rproc_stop() and
__rproc_detach() so callers are aware the teardown did not complete
cleanly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 21127d972bff..77c4f09c7604 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1110,7 +1110,7 @@ static int rproc_start_subdevices(struct rproc *rproc)
 	return ret;
 }
 
-static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
+static int rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 	int ret;
@@ -1118,10 +1118,14 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
 		if (subdev->stop) {
 			ret = subdev->stop(subdev, crashed);
-			if (ret)
-				dev_warn(&rproc->dev, "subdev stop failed: %d\n", ret);
+			if (ret) {
+				dev_err(&rproc->dev, "subdev stop failed: %d\n", ret);
+				return ret;
+			}
 		}
 	}
+
+	return 0;
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
@@ -1712,7 +1716,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, crashed);
+	ret = rproc_stop_subdevices(rproc, crashed);
+	if (ret) {
+		dev_err(dev, "failed to stop subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_stop(rproc);
@@ -1751,7 +1760,12 @@ static int __rproc_detach(struct rproc *rproc)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, false);
+	ret = rproc_stop_subdevices(rproc, false);
+	if (ret) {
+		dev_err(dev, "failed to stop subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_detach(rproc);
-- 
2.53.0


