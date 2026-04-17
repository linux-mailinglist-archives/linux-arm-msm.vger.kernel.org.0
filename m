Return-Path: <linux-arm-msm+bounces-103467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOmbOJi94Wl4xgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:56:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63F416F0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A0D030A195F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 04:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870C6318B9C;
	Fri, 17 Apr 2026 04:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZNYkR1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu0eBjDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347CA2C86D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776401787; cv=none; b=Xrd5ZA4M1821+NPuSmTH5Msu7YJXkJsTItG4flwcrbmU1+ncbbIZn7HAbWsqiMe65u8uz9iU8V0ya5zkiHI/LTDkfABL1iDPzAPYNq/B1th8A9ZU8Bxn+k+FZ5cSWdRBfX6a4Jv7Dprk6IIcfb/qb+la5uKVgUvwAk9OFXJoaVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776401787; c=relaxed/simple;
	bh=OT5u2ONptORC5MouS3fuNPzcbostP9NpKv1/r7MwhjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/6eqBjVUk7OmY2a6Y/ju0XSXQxSpGGcsxWpO7ujwgE0J/q/8EIzVlfkXB9AbWLNQx/dvTgB+eN5MfIkxjbv13I0CR+TEQfSvzWyr383NQHjYVkMiDsYaT9TDWeRjd0Wd0pEb/klBbrElkJa/CKr4hs3a6mvqetGDfTDv537UTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZNYkR1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu0eBjDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0foeu2012122
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ayxjj0kFxM6
	lXABDb6ZrdOtAZi6U3ltyOfDuAQr5w3o=; b=QZNYkR1Qq83MTZ8CNzyFDbVFgOH
	rLVWrM6UPyljJ7GQpEyi55Bb1+RjnsePtYljuq9m3Fg9gEHWA/Zph8/zxIb5zVlY
	M+bAfybgVvYx+pREqRPbY+aMqfhN0I4zRSk6HM7HxhC3WYYWxwP27fsP73sCPsBE
	70QOorH/kJrZNhkxvTBb+DnpzURYhE5Ni9j8mDxc6n2AUn9+KK4mfcBUNqKMbUkz
	Xs5IViPdCUsqz8KnBhkchAlU2+OrQ49nU35Z3N/hvpuSNUtBxgL2oPT3zcM8tw0X
	1kDRvDGFbPZbFrX7FzTYS20ztvmbb4YtZuFl66YsOM65QhGzcAmgKOMcCKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrfbqec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso953648a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776401784; x=1777006584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayxjj0kFxM6lXABDb6ZrdOtAZi6U3ltyOfDuAQr5w3o=;
        b=Bu0eBjDTLq+EI/dfzwu+P6N9JAFl1d0mD8r4kH4GXIkAr+KiEKg36z0MCcc/l6x2as
         UfoM3S/gTWWnZov0rWut9ngkSN6pD/2gTzkZSTlRLWTH6u1q4+fPApAizG4ROTEnc3a4
         XTL+1V80p0xxaFZUY8Ijg9eJOJZgKvOh8w4vNs501gs6YOegPJwWfPqfDm61vRnxM1vs
         lCGIUC2db53yFLd/AufZirypih4fj600PI1ln/Kd+GObBo+3CCWPMr8Gxh+t/j8+dIJv
         CGgMX/wa8JqlC8TlogCYJHryE/j6Mf+P/nlXIp3cnJssMeXn4vEHRNz0RdPdAPPsqN7F
         0xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776401784; x=1777006584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ayxjj0kFxM6lXABDb6ZrdOtAZi6U3ltyOfDuAQr5w3o=;
        b=LB4VTO2LGnlbgWkrgu3pZDHX8GWPAFoafroCjfRrxxUNBQqyJ+ja4T1OjBuQxVMCRW
         vuxFNrRK5TFWrIAkY5l2qpuY0iBeZZ3Ue22uuutQVISRh5XAvXNV5m24AVM10wo93CtZ
         Gqbgksce7E/sv6WeqqS6ILcbvWMQYl0NIC1BFVcq4/xy1j3Sq7QcgmHLQ3qSxobc0M5K
         IdKsR7DrtDKR59VunRgdxe8pFNJLmxLNTAqxaBEt+9CNSvRrLKbAS009LpfEXMw/sDjc
         UgdH0yiyG0d3Y4LTM44u/wC8QcC1Fzif26PxHcsQun6RuYy9U1rAcywK3q3fXznCCYfA
         7PNg==
X-Gm-Message-State: AOJu0YzqgNx3uNhVenIMNIVTHgaghDf4J58vYTtxIRukCXk4FVNQHDAa
	Jea3fOGs/KRwzJ8ndMqEfkbuZ0zGsFeyzHOIQn43ljUyVWgXiC5Xio+NhBQra1xtWvgc5XZyiAx
	MNTFjDe2HxxykBEjj+uw9MPPPoENr4lN/PQpKLXyrHl+v0sJwhWUsRsHW/xtIlBkB3Ec5
X-Gm-Gg: AeBDieuEt0LdMhOVFSunNKdlhxllPp72A6yvOuFOh3urfqCpe3D+G+iU4W3APiJRfBW
	OuJtAupNV6aAolbHy+z4+gZ3PW1btacSjD/U66oLiUS0wVmzuE6ONfwl8N70KJq4zs9ESxmG9NY
	NZBdfs6YPwvbQ3LmCXdB3Z8g61Nn0zVmRM6C/idaetIdsNJ6aCv0IB3kxu/pPWypkr+13+5bjsz
	zWqtUkg/eRSWtqocwSoJQT0jZhPipxcLMSU1yX7Y6xxP+u7McujrMUk3Hd17iW13pYRvJt3tFjM
	NsHWXb9Izm6LZ8jRCd/s3B/0iAq9/FOQ5+Nm9/Q8vUxsqyvTDKdZgvoXUxzWa0B41hvIbaYtLel
	xRStkEAMXpCK0ColnfI5XwbJhZIeJncgfQCQGVJcZmh4Mi7+jbJC9NPrWc1KRPr72
X-Received: by 2002:a17:903:2b0c:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b5fa009d46mr14057455ad.38.1776401784280;
        Thu, 16 Apr 2026 21:56:24 -0700 (PDT)
X-Received: by 2002:a17:903:2b0c:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b5fa009d46mr14057125ad.38.1776401783760;
        Thu, 16 Apr 2026 21:56:23 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3a8sm5702115ad.12.2026.04.16.21.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 21:56:23 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        nitin.rawat@oss.qualcomm.com, shawn.lin@rock-chips.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v4 1/2] ufs: core: Configure only active lanes during link
Date: Fri, 17 Apr 2026 10:26:01 +0530
Message-Id: <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qoklQrGuQWHTjr63q6x7xeHN8E2SgfZm
X-Proofpoint-ORIG-GUID: qoklQrGuQWHTjr63q6x7xeHN8E2SgfZm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA0NiBTYWx0ZWRfX6OY6dgwVAL+w
 BPCjuvvzLa9MyLnMLVbckfV0iEG49Gvve6Wd5ESN2imCeti7kN0QzWwVm6mlKGGIbdYKc79WH1A
 ELzH5on0IpGo9Q+jDkMFf+yO5T+UwPkH6s+kN5N4PZag0O6VPFtkRtj+N8bEK0v2LWmgYm3B8+b
 8EwJAGvDcKq5Jk//Gc6qnpFqjnEgzuNG9qyEkc0rK+4HvD6hj9GOTxNTuboqQc1yic6uEn8tsSp
 ZwoXeDgrnG2bddBsPBdb043Qiq6/WgPCfdGw1HNa4HDNEh8T8g6pNL/JUp/St63lM/N/jkMa8Og
 CTyuox60+9Nr7JJQzAGyARro1CzV3vGmIVt5J0z54UAFckS+73ghJoyiKry9AXacE+38gwBaziY
 6JNoXCu7mdazd9z9t7Ccp9vF9WcBtbtNhy3y+j8aT+vn+/fffVv/4LkSNtqQQULRW6flbIa6lXP
 PTrh5m3id2Iq172AjSQ==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e1bd79 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Z8YMyZzXpU5RQDwMThsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170046
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103467-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E63F416F0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

The number of connected lanes detected during UFS link startup can be
fewer than the lanes specified in the device tree. The current driver
logic attempts to configure all lanes defined in the device tree,
regardless of their actual availability. This mismatch may cause
failures during power mode changes.

Hence, Add a check during link startup to ensure that only the lanes
actually discovered are considered valid. If a mismatch is detected,
fail the initialization early, preventing the driver from entering
an unsupported configuration that could cause power mode transition
failures.

Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 drivers/ufs/core/ufshcd.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 31950fc51a4c..10f8d2b552be 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
+static int ufshcd_validate_link_params(struct ufs_hba *hba)
+{
+	int ret, val;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
+			     &val);
+	if (ret)
+		goto out;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+		goto out;
+	}
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
+			     &val);
+	if (ret)
+		goto out;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+		goto out;
+	}
+
+return 0;
+
+out:
+	return ret;
+}
+
 /**
  * ufshcd_link_startup - Initialize unipro link startup
  * @hba: per adapter instance
@@ -5108,6 +5142,10 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
 			goto out;
 	}
 
+	ret = ufshcd_validate_link_params(hba);
+	if (ret)
+		goto out;
+
 	/* Include any host controller configuration via UIC commands */
 	ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
 	if (ret)
-- 
2.34.1


