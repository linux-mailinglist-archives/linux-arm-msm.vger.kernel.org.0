Return-Path: <linux-arm-msm+bounces-102413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EO+JK9G12mTMAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:26:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027A3C693B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 08:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE0233016C9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 06:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2541F3148A7;
	Thu,  9 Apr 2026 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awwcLrJt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJjLpAsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424C315D3B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715998; cv=none; b=UyWPxtKeJvzhuF7YVPNZvtPLl0SQmtSV8wL5iN4Pq7OzlUplYfwJnNfToGtJRVnUZe6XOvl5gAnzriTH1IIUZovXCqLoKrHVndSaOM0k/mmrY4ldN2WQ1JGfT+f1r8ZsF8TAcP0pdBECBNyrxH+pHPprdLTQjIWyoUsZUeicaGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715998; c=relaxed/simple;
	bh=z6vbDo0OkzuQGNRRmVefXteFHpfMXlyyWBpHr+UoyQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aEA9kjOBu7WuRFNdPCPb3mh+k2G4QQBNszt4619cHoMFDU2xO8wHLyeCd+Kbpw1PBReYBpiE34riAv5G7uyWqC+vWRhsZw2fioYrHTs7TTwcdLctOVy/lqI9WsD15pds4ASqmC3K9Ye+7Pqu8tZJba0yLqCw6SX9ynDnRVulZ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awwcLrJt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJjLpAsP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638NbhQh1071849
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 06:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pX4/CzTEsQ9
	azlafCB2t1IsspVCg3AMoDjZdlkJJoE4=; b=awwcLrJtHXQ5tfoHcotTtyGJOSD
	0MeLxKwccPj+SJ06MoxJ8ZK1K938h61GWnCehkSek+qUwHMrc6phwRSg7wEc89L8
	mFNeo3JSVqk5E/QxBjHFcKkNTnPj/AoLKpHEKZFPy5l8WgPsB4Rifo1ixZ75X7P2
	2U0I11c81EkV3DuHbAPN62L5WhlbG/hD8Vs5+H81h5g8BMyANOKG1T71AbgohLbb
	u7PUi/TrP1uIMzAszl4Pn7OxSfehD7xCvyd5xLpBi+MyFuLFb9XfbUWZxOPH8s5V
	VHO+9B7eyRg/tY943OGRzHz1X1F6atcUbHKGTymz8LSx9TeAweoQuctj7bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3aph9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 06:26:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so8516215ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775715995; x=1776320795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX4/CzTEsQ9azlafCB2t1IsspVCg3AMoDjZdlkJJoE4=;
        b=RJjLpAsPV0D52+wfCCpU4bGpWzqzqiNtpVGW/GsuGNNplUW9jhKmTa9ny1trKT06Hl
         NdOABvQu98+4noJ5u6ns2xNdlDRIg+ygHc06V5P9mnKCRShFH1Ft+kZ3RZwGLmcMJW0u
         zvie6WaC2NzvlpGaANcpw6mlwAS/U7XdDGOjkM+1f6wr1upqA66iQcj16YlsP5Yz5qid
         6c1JBOq9LkOsMAXjd8FIIG3Qke5bSRvrtop+TLEXy3lNR/wQK2aBRe1SaSeGD4z284jd
         Jm7FGwgNLet3+FZzW/l92pULOM/xdRM05yFhVofZDZXltu/6mABFaQiTOkKxuaNmAb83
         pDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775715995; x=1776320795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pX4/CzTEsQ9azlafCB2t1IsspVCg3AMoDjZdlkJJoE4=;
        b=ZWS0z1BLmnHN4qvA198wsC149q6jy8zQK8eU2t2GUV2cqzHZb53ypb+k4Xrz8h8dNK
         X+6o2DXY14QnmuY7Qx25NXVX/eJxSH0KNZK5owPV66d+fVd9ETRT9o3EUxfzI7dqArbX
         6VaMU6yVndH75SIjyQuazlea7X3guBD+g9tc8GTPeNxdR/uTtEJuwVvDAeQ5doQa8Vgf
         8lqlnRPcbwBclAa7YJ46lbkGxmNVp1DWQJR+ZnZ1WaZ8/aVlOwIC1iSXtWGK2SaFDxjo
         vGf2U8ZqLlYipEnCVYXCoIC66KbcyWYEszhAZZlf2+h99undsgwLcMAqci8Mdm4rek5i
         yZvg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmm7S4Y+qCyUPk55wohv8fHkb0999ftkHXrp5kKCwnyxbZsRf3BOam0Wuku++x9aAjShFijduqSv7E4nt@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvs4EPaxNPme7JWe6x9mO+XBxv3BkeGvATVG6/z3AftzzG0AY7
	gnk6RuMBPRo71lU7dYWmhjxCVVLDhbtxKum3a0Dv4vzRgOyB70V39lszVPCQlrXx2vAxHq4ERaz
	ZQo/vj0pc23KNNCiS6Y/Bj1Mrs/XfWD271L2EHxmwQSs1MTtFTbQGPdIfDGx/XLMx2C4m
X-Gm-Gg: AeBDietzda0WNMRdXMeeKr5eS6s8OLW6s69BAoARz3N8RIdBAFu4m7mgOdU7TvBlM92
	4G5bMOEuBOnMcceRLfapfWqQF8ynCdu1TSStECRolf5A0vF0LfAQ3Negb2FpBuPQj4zvfNAIfp5
	xL4WyP/rcj0O8kcHY3NPPW+cfKWE2SaatkQq6W609zYZJI5bIwiRP8V9pQ9clBzdRIXXQRHN9eT
	1vajZIuYm2UNxF86nwww0nPL8erA92QxbsHKIk0HeadG0Op/t5COjiyiM3ztOSD4uc6q+abwOfX
	2bP8jK52Q7lh7ukJw1XgEa/AloSJnf6aHDWNPIk0E9pRJ0pappSAAG7Od+8rxrylaQZcN7HQqI+
	bwYrcjwuqiGQxPKyiXgH5cg+gX98LA7Hfy/RoDofa9KYxVt+FoO+JvEI30BdnhcpvXdbU5xJFlX
	uO+pYAxZX0kk2OO/ZCLw==
X-Received: by 2002:a17:902:da83:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b2817add40mr242580455ad.20.1775715994552;
        Wed, 08 Apr 2026 23:26:34 -0700 (PDT)
X-Received: by 2002:a17:902:da83:b0:2ae:5163:c2aa with SMTP id d9443c01a7336-2b2817add40mr242580075ad.20.1775715994073;
        Wed, 08 Apr 2026 23:26:34 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm220786795ad.76.2026.04.08.23.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 23:26:33 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com, stable@kernel.org,
        Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v4 2/4] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Thu,  9 Apr 2026 14:26:15 +0800
Message-Id: <20260409062617.1182-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NSBTYWx0ZWRfX1RfgKhdKrdVg
 cCoW8lh7tuM2H9bsmeykN+976g93JHsRsK+Pm6Bw6UN4DmkXnRmtAr7iv30bYU/fOES2RoUx3uY
 X1I1ZfveR1XGWShB4Mq80kY0gV2otP7Z/RdIwZNFjY0uN/kXspl6sK8ApnO5S56hnnhsk07sM0B
 dOaxsk077VBgQ5K7XKT3/eLYMlfE/lswIpA+D15I7gsiiJDZykUcUJWM0c0R3xSWna1gEUsdu/4
 DWcISCeHWq4pnHu2BScJX/OjXHq2vJeaivIZ8tOagiXiZZpgYeS+FGEC3zifwJQXcvqgZCh//O4
 zes7zMCbh69czAYm+mO2RO2Ogllj/T081uyN0Ewyi1/HOmTSkZMJNdUF1G6I+daiXzg2vIz4Rk8
 Jdv1MzHrP1HNNvJ42UekJJnKDTTsACMS9utJ4NNBQqdaNOl/XxkjE84VVjJIBmPwg4/xu/rMc+A
 pBCpXnpbC6OYdFZ0Yrg==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d7469b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZnmZ8TzD_GdZzTgawW0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6-Cd3g2szNaattJwvyRJx4JgTNawhMET
X-Proofpoint-ORIG-GUID: 6-Cd3g2szNaattJwvyRJx4JgTNawhMET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090055
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102413-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0027A3C693B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if any other thread removes the entry
from list while unmap operation is ongoing. Remove the entry before
calling unmap operation.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b87a5f97c96f..148085c3b61a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1862,9 +1862,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1878,6 +1875,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1885,6 +1883,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1897,7 +1896,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1988,14 +1994,17 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
-		goto err_assign;
+		goto err_copy;
 	}
 
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 		buf->raddr, buf->size);
 
 	return 0;
-
+err_copy:
+	spin_lock(&fl->lock);
+	list_del(&buf->node);
+	spin_unlock(&fl->lock);
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
-- 
2.43.0


