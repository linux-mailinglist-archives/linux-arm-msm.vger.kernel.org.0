Return-Path: <linux-arm-msm+bounces-107912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFsyN+sZB2rnrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:04:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE5550248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1C2D30AE0A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF53A3F0A97;
	Fri, 15 May 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqvvgGEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vlqvc89Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F5347ECF6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848963; cv=none; b=AXJujjdo/tVs3/hk7WK3UC3YIpfYt2Ai31fB9p+qPa3msUjDRYYit18WSmN2ManWatBKV+OKZaJ09BPJMWuJ5g56n2+bhfbxQ10btEKL+2JyKGzZAtQe3BfB7eWUz8DL6Q+knz72rInikOEj8BXL7gkYRk97L2WTVejm3CZRvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848963; c=relaxed/simple;
	bh=B5X3IHqMv3RqkYzDSDwFq4aExehCiMVP6Uc3J+3VUZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hGW9ab+FXHJbSBfmTqrAw/YFXh4L2qbyDdK128UKI3Ji2b6kb7CLcQvzFOAVLWvuK6qRd++LUS2mY3XQS+2kNvXrYut099OlNx6t74gRZg2SYfFSHhgLEOZFYru2mTHXDwjmTnWBfJ1EOC4ei5WcruJqn/GON8RZsdzI8GocthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqvvgGEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vlqvc89Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBAJCF3795527
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qVx3dP68cn2
	vag91UBEub6zPiFFjytB60mI7WrNd8p0=; b=gqvvgGEvQH8OtqlE2V3ymt9iJJc
	QcAIX9x+IlqWg42sQJ6tIclOSrU51vVsc+hCH3kWOnAe7PWdW8A19jq0gvSGOyZx
	DnelgxEmGBvGyTMooy54xHhvvRMGCSmFLa1lPL9vkBOLL5F6ZH/UbAMpJd/gUhhV
	zYcf/GOzADOmBd2zoy1dkpNX6BP83OFn4IzVotOcRW+rcvuEsVeBQsyUcLcdZOuo
	tbYDjbf2Ht5shZD0APfni/c2MEnY+H8PhPIQKlo1yE+WtbWxGOMTvQn0PKpYt3Fj
	0Nd6WcT8Eq3HTW3BVfN/FaXkBA9jC7O68qznUiAcWzcJxFO0d9bHgqvajkA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su774-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:42:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36629e48023so9668434a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778848960; x=1779453760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVx3dP68cn2vag91UBEub6zPiFFjytB60mI7WrNd8p0=;
        b=Vlqvc89Ze/4xspbwTBlAM0Op+PkZgp9z0f8WisvOVw8n1QUxQd6gl9W2VOiteaQnZK
         uOBIYS5Ea9frKwy72Ah6+UNYsCgrOTjyV+OQtq3Xml+jy8W+jjUujBnHANv51pnxP+8t
         UtQq3PW/nrUrVcfLopqV/+n0e9Hm6/Q4Odgo5Ro4Ubjecw9EwYwUk6rOT5DaP68K7FEC
         3pT+2dM6SOR57S44R6YggTz7oTkW7WDZPti+FvUv0bY7MGLJ/hAzBMqMz7nB4N92UL3D
         V4k+EHpXFP52jIfIlo60P6Kywzgk4o/A9GABNzeDlhOzAZkhseLxTKu+22U12K4gb65B
         CHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848960; x=1779453760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVx3dP68cn2vag91UBEub6zPiFFjytB60mI7WrNd8p0=;
        b=BuM5g6l/Le+OW1FiBZekmJHgLfdxnC40Dg7mtEIYDfSja2dZpW09Oue+Z7OoEBb7lH
         /Me9uViyuWHEL/EMhp6LaJG78eAY999yMAiMip29CmClXXdTmYsA2vdh+XzdtSotLdai
         kbkDtU5q6aFWmFt1lebmZe7OOyYRAwHnC5c6RwSK0mA1qcRI1LE5X1+M3c/tm9D8zyJx
         yMSYNKTJOf6/EW2GCr+i/dCexunJLM9Xkl5UOoBkjJdadslsRqyjGczgd/DmDGnki6Qs
         +c0s75m/ZIp6vK0Wi6bDR+6fpFbfxhwC42JfVqsRONxdcfM9SjPKST7C/bKCHaXZYDcu
         POlA==
X-Forwarded-Encrypted: i=1; AFNElJ/D3fZK2g4GVB4pCiuDu8nFiT+/tvgaeSttPheyH8+vUbViRilTRDPcqB/bikSoSJk2O5E3RVQPu6kIvYpG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5S316fKL6tZTtYox/1Fw0LaZxDst5ZNifERbj6MUUSEly7dSq
	kxhxkJa4jG3vKkkQ9c7uemjRmriJT9fF+ggQe5GRdi4lJW6u2dAXtABYWSsyNxt29WqIHfrbG6L
	oHXHwEoZ6rJ9iboCiJuahqWtqssbk6PAayI5fozpfBrFjD3YH68Kbvoq4VQPTbJYqTUYg
X-Gm-Gg: Acq92OH5moxDQEUpMYzKNYWomDCfSjm7N0OXNzAr+6nTSu9tGigrOxqX0wX99qfX/mR
	AEa6ONLocvpk4evD7XjSTJV+EREC79cElOAWF+Lt1fHNwkyChKyJ25g0ORF7grbarGrkk0luXfW
	TovZmC2dme0BB3AZniIE14EcrEmCaNuV+JT2sQ+/ufvjtKiUK/JkbF1+fWZeNF0LzaoloTm+wRR
	Itxgi12CVb+j7aKHbn+63AKgkSKI6JiSX06O1PezoiDnA+D96vioNogiQz3mXcOMcBOaZgDRnL0
	I2sEy0HXnJ4sa8oyunlFcGczL5tJeaWAgaaSIf2x7pdsnzGBdJP3HFK86TVe0sD1MFUyONNJL0p
	D0+6t0ofnVwT0P+KiFdokCiDS2w6M8SPz6t10KMVknj2WIWMe1St4A7CxR+Ro8tRWdN3HgXd//L
	bGkGecMIu1fwuhu/0ruvDXyGQ1Ggp/Ng==
X-Received: by 2002:a17:90b:5790:b0:368:98c0:8836 with SMTP id 98e67ed59e1d1-36951a667c3mr3720197a91.18.1778848960475;
        Fri, 15 May 2026 05:42:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:368:98c0:8836 with SMTP id 98e67ed59e1d1-36951a667c3mr3720158a91.18.1778848959811;
        Fri, 15 May 2026 05:42:39 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm56119395ad.25.2026.05.15.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:42:39 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org, Jianping Li <jianping.li@oss.qualcomm.com>
Subject: [PATCH v5 2/5] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Fri, 15 May 2026 20:42:14 +0800
Message-Id: <20260515124217.20723-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyOSBTYWx0ZWRfX6/JhnUvg/27F
 cc+1z2DejD+tAbRgtE2Gl3SUYzeXTnTbX1O/U3YKnkY2VjLiic0/IHycBLh8guPa1bWnEGejpZY
 ikc4HL+xwqMyfNu9boPByJH6l5PToT04C7qioZOqBf4Ho2+aV9tHY5CoqimiVfTJ4CkE4bPYSBp
 k7EErOIymf/EjVegsT9YRDhbADbEnR7cjjepEawrrYNMBc+w9w9kWz64cOCw0SAEdsqAfGttCAi
 GPDepEQGGagw8PsgWxwBojqsOo8Cucflv7Vfr7sJwu8Shahg6OAjNKEy0vR978JvyqyGsw+Icsm
 YfpLrblmf8TyjmbXsJUKP+U4JsaPU5S+qlmIu0SVWbf3wZrAOhwB9Lr1DBQd2sLOtaRdisxzMJ4
 ankw1akaVS23rm7rRKChG6PuTgJPE+/gfTzW+QgCYNCD2Q8zjdgh9CUGE7zqCXb1HuhSffEFtX0
 ayjyZoTADeDb57oDx1Q==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a0714c1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZnmZ8TzD_GdZzTgawW0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MEeAjqxoS19oaiopGDu0yRHjZlUG7HWe
X-Proofpoint-ORIG-GUID: MEeAjqxoS19oaiopGDu0yRHjZlUG7HWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150129
X-Rspamd-Queue-Id: 3FEE5550248
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 8b21f85cd9f4..3c7c3b410d7d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1863,9 +1863,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1879,6 +1876,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1886,6 +1884,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
 		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1898,7 +1897,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
@@ -1989,14 +1995,17 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
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


