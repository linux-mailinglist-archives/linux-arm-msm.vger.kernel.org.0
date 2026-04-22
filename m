Return-Path: <linux-arm-msm+bounces-104106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H7yDQG26GmgPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:50:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D309445935
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D830301A3B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B843A1A43;
	Wed, 22 Apr 2026 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poM3JtLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jsek5mg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE5B382F19
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858598; cv=none; b=cBq9zsLXLJzSlFAuyPyapcTzk+8k3hBQQJQdMKaLQZZ+Zi/shh/WZHzX1zkaSwAGcGLH4WxSGuTurIQDFlJxTdEIhW64rZFkukDNcnP40JAH8Yh1kE5BYxWlep1ZzoYr3p7beiNhjI3b0ym6vjF/I/KIdUCwKa1RQQP4F0Bzb6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858598; c=relaxed/simple;
	bh=R5g1AEpsUhkpB+vKfkU4doSkGb3/fFyv8wBJh7RYZgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=diwOsdVln0Z51Qk5rB4E4aMDFG+C0bneYptPA5lbILVW4vZL10//kBkHtaubqsmGNNPx2ft3j2PVD1CZ8t5pKXC5toFog+11BHtDUOgz7NXbQ+Xidy5jwrWtVHaJNX7QrOaiGQVudK2ZkvLESnbimtZxkdiUDbYfmGdDzhWspNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poM3JtLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jsek5mg0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAlSf02209080
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HzJc5YwAYvE
	SGw264S07BfCAoWa2ckeWSsi2YS5Hpig=; b=poM3JtLeX2KDx6uo11rIiVHUvJs
	teANa9uGM2aVnGJE6aRhieFdAOAsQZY83YRl/tMQL39T9R+jBhh5h1lfi+W5wwS2
	P38v7aFuKZR7zm9rujc5bWNGMl44KeCMh5qRIWwyF+PzjBge+k6sC2COEh/ozRBw
	d8JbFliQZk3CIeJkblC2UR48NJQiDdeilvw7bXTmKGDDfbrTQdbQPsqn8S/mfByQ
	tuOrGLxykbGfCEI1qLp0BhDawZOfZMpEDR2ZHkaduMdA18vGDm8HYU4zFr/ezUsz
	qwbH/P2o5tV6cROzWrJJoLu/dPHIvcLAE/+3pH4vg0yC19nDbKkvVaRvw1g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengb60f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:49:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b458add85aso54237825ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776858594; x=1777463394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzJc5YwAYvESGw264S07BfCAoWa2ckeWSsi2YS5Hpig=;
        b=Jsek5mg0dLqMm7zgPkwWhT308/7IxiPjGc/eoVVZ15Z2C+gfxNkNyZvvNfIraDXd9v
         5s1Nr0lK7ZmoVA9UMc2VFttrGQJXRSni86hegspLsiLl6VAXy3zev3NCgml4BW4gNztd
         1WfUrwplgEM6orSFBC1Q6H2f6f32ZdwMQ9Pkh110LMUxKt+UMNscUG2rYpYGfh6NZWSG
         duTMhoTycXwxFJdl7X52YliJuTFSa3ATJfI2Z1QenGcJK3z46cio0EF3H80P2nKEZv1D
         SvZVDa2eoEEdl8MwoqwlAjrU2Jd6E8cNwGTtJwOxc601pvo74PQ44LM690i7nIVGmPv7
         0V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858594; x=1777463394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzJc5YwAYvESGw264S07BfCAoWa2ckeWSsi2YS5Hpig=;
        b=HzYfXo9KoRx4wVaD1HchJV0qrY9YP8Fl8wVQKIZcvSnU2wAnYUQGhj01It0vPCu44c
         fDLVsO0Ve8haNbGUl2UzRtE2bF9xXp31oTae9rtY6U89EMeGhTjodbwqtk0bgVCSgv0s
         opra/+kuU0GtzMmLP+9wJweFCXcJFx5woYbOFbGp1bga3faMdiHV1pTV+xl5mFd1zUWP
         J68xOk0XEJjnW3IZB73ls5gKwf8RoP8j6yLOHFyUdbeYYonw9YNiXVq1Q2j5y5+uQ/gK
         aNb7+U8C6qS2ySp61TKd0OKeq757BHQslW3n5E2oTO3UBnp+lY40Tyu892LKofsXi999
         +bqw==
X-Gm-Message-State: AOJu0Yw8H/lZzG57fM3D5hsHaXZE49w4uop/B1O8cgzv/gFqLZNK7Hxi
	6pRw2ItPef9aKaESIt/bKUWglLdxI+QVZrCFH++O0dEtpxC1W2WOQ3tNtL9ycSKUZ4F0D8grLg/
	RTKTi7KT6we3OdZB+z20MFtwVolfBkYak+OF+JfT53g/YuYOQc2UAKC0+x2yHiUwe0fcp
X-Gm-Gg: AeBDiesDjxhVkKhA1hSPB4IpZlYG/Bpp08H1B2diR5tEn09ydE64jK59HvEpZ3f/p6B
	ySl/Yr+kUl7pLb3n3D+41Y3w9aguzsW/S7Cwr0MeicqmvldNe5nh95ekFE1vtZbk8rJrThJbRrZ
	RnuPwcuRqRNVQtAjLoPYfADzNtYxd+nNBKcptYuJ4+hd96ui71AInkXQfZ3iMs9Tdb91fh25F3s
	7jJvkitfPx5d/nKrGHpV5/9J/8AE2ShpcBOqMyVYbSwZ8nv20yeyYBlwSd9nSzfdHYhRjemYnW4
	HkjSvOUArbT6efFDrzStNydo9yZ8E7yNhNRYxQAol7rVseeanYznyL8GiVN1xaKTxO5zqZbrLZR
	ihV9hz+kOs3aUXvkI1FLEUrQtqJ10rXf3IDuoEhvMptUe5Q0EUpBadsbXmQdGjFjG
X-Received: by 2002:a17:902:d50b:b0:2b4:6470:760d with SMTP id d9443c01a7336-2b5f9e8e436mr230479245ad.14.1776858594509;
        Wed, 22 Apr 2026 04:49:54 -0700 (PDT)
X-Received: by 2002:a17:902:d50b:b0:2b4:6470:760d with SMTP id d9443c01a7336-2b5f9e8e436mr230478865ad.14.1776858594022;
        Wed, 22 Apr 2026 04:49:54 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa34ea7sm163047125ad.34.2026.04.22.04.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:49:53 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
        bvanassche@acm.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V5 1/2] ufs: core: Configure only active lanes during link
Date: Wed, 22 Apr 2026 17:19:38 +0530
Message-Id: <20260422114939.2901925-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
References: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExMyBTYWx0ZWRfX/SCfmUiR72fk
 mgcVNEECW0cybAH9aD4gnQS/o7peNSK4ot1vCVn4RJ+oAolJ5YbFuWHDx6ZLKagTb5jKVhm49LY
 ulwHKVjPYmU4rf3yF7Qnkx7H3VxDTXlHj5FA0KCmN2YeBB+JXMgiwR/60t/vQ5Ao3caC/aWFUQT
 EiJFj/DixDLvz6BtFX5pkfVIeGKNXCxv7pY2OTxt/yXtzsu9FNy1AVQzIDwBKm1Zoi5uJOzLm1a
 0aFQRCsWdW5WvvgnBJxslSTxM+9prmXK9A5THTz/TCJCXlg1OBm4Q3HNq858gWU9vAys/4Of4ZX
 nexK8DboRz7qynJdltGDqoMIsdyASZtbiOmXXyq5QUqAi3/Ok9tOht03rq3FmSLTVdh/ztpCU8a
 Jf3tK11fEb6OZwRCtu2Hic0N8IkP300jalSTXssyWbBcbkLXW94FjOIspbTCYB9eM+QyzMtqEoM
 TYHEgJEPtw2CwPQ+0sg==
X-Proofpoint-ORIG-GUID: KFkh6XXE_EWSQQEuoB4UyQrL0mp_EHC5
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8b5e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Z8YMyZzXpU5RQDwMThsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KFkh6XXE_EWSQQEuoB4UyQrL0mp_EHC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220113
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
	TAGGED_FROM(0.00)[bounces-104106-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D309445935
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
 drivers/ufs/core/ufshcd.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 31950fc51a4c..fe5bc85c6870 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5035,6 +5035,37 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
 }
 EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
 
+static int ufshcd_validate_link_params(struct ufs_hba *hba)
+{
+	int ret, val;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
+			     &val);
+	if (ret)
+		return ret;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+		return ret;
+	}
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
+			     &val);
+	if (ret)
+		return ret;
+
+	if (val != hba->lanes_per_direction) {
+		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
+			hba->lanes_per_direction, val);
+		ret = -ENOLINK;
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * ufshcd_link_startup - Initialize unipro link startup
  * @hba: per adapter instance
@@ -5108,6 +5139,10 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
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


