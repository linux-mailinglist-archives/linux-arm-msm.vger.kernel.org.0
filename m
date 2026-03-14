Return-Path: <linux-arm-msm+bounces-97647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKVxAES1tGmMsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D5328B1BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 02:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02C12301B648
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEB32550D5;
	Sat, 14 Mar 2026 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9PGtWcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O//lm92J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71F242D60
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450559; cv=none; b=e7zyabV0EVJ5HshpBcJgQmk6nGnPmEedmann3BJPoS1DV/hJ+ZHA2FqQu1TsUxD16II37MQsCZnjJSY6ECEtrdQwyabMA+ZtBMd77hWqmFY+Qq6B35H3imr12TnbW4uBC779LjQU6UlFX2uU1vXnL/5wuwqcKshGnz1x226IFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450559; c=relaxed/simple;
	bh=pcaLSoRFt3SlaD+08joU4LXPTYdyqHPVDM41X2YrGtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOfFpZlpY57jcnLnW63uHCGR4Frqt3HZ9cGVbjZAxM6xvJxgFGtvX8a5LIeAuFjGRE/X2VxtbHE/Pz7t4hiTTxb38c0a7WqNajQYdTBE+hverrQ99+wGF7P2lZpQkNOXwnT5n0+Q/EQLrS+esP97izvFZpkWfk/XZ3Hui+GoFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9PGtWcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O//lm92J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E0JeYS2107932
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeGmUPYleUd1gI+tkP9VMwvXNEE1375NE+M4CsEsAl8=; b=i9PGtWcRErUChHkS
	K78Zt3xE6VfqxWve6fHd1hfsYbBypv9VaqD0TCjZcjRyxXIRv8P64C0UZUx14uS9
	Ne2qn3kPDq/jgCy3zifkQ9fJGUzuVyO8HPPKj4lHEh3S6BM+k45UQVP6I2qyrRQ6
	Rfofig2yyMDP8UPWCTkDBBG9PSRnJyPmdBAR+1UXVes+PY0AaIyQpfqjeU5GZIlc
	inEtOWRzGbDLxsCQDvdjg5665zbIl0cJORG/NTiwwi55scmRaukZqVJbjldjwJ2R
	9Wjs5FX/Mt5Q6dInFDzSuPIuZlxXqOqFUP6KdXvAbtl9GN/UFYBk9P4ifFqVncBM
	lUD0rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvw1p83kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 01:09:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so2565257185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 18:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773450557; x=1774055357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeGmUPYleUd1gI+tkP9VMwvXNEE1375NE+M4CsEsAl8=;
        b=O//lm92J2Fe/y92Ww/c13GDs/yeNBl2nGEczq6qGuDJOxVzWT/eMWiZ5Po36yS8JCe
         aS3kymqSRZy6HSLiu+OTX/fmDE285Mavu4jLzGBlHH97B/ZRe69AsBIrcKNP6kRq4CwC
         l0q2YnC+60CpBQ2EZ2jsQZqoDEK3VFum2ZMwDof7+osLBAbxOUsOTBQ/KNPX0Xn7bfn9
         VZEq3DFDgdDmpX9V64rl8xq04iE6gwbd9bgAtiWgwp7g6ZG2SCNrH3TFFEkzR3A8QmB5
         ixOxNCky5M9A6JsbARRTthjJ4nX6Ec3+htuUiH4/IOvNzf3UZ2oBFbK5hF6fM7grQmsn
         L+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773450557; x=1774055357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DeGmUPYleUd1gI+tkP9VMwvXNEE1375NE+M4CsEsAl8=;
        b=rsYzjwB97znZWZf20/AFvLSZEodTWbLwTc4XXR01CZnyx1x87DELIYd89/FFh1Oj/1
         eVbG9QU0ptP57q0ecgt5UHpEz86I8EsGakM835MGy9omHXTwQiUPI64XnRoLdoPfZx57
         WViRxZosTIy+TAvEm1dylvygLHTxuGzvPPHft4DyCrShYiqZkhhKgXtMdA9VVvK7ZOpN
         CfjbtAACHPL4ub1SWkgqH13l4gZZNco8HdbLGKT+yMryMsb3rTOypZJUrSppc1qPELVl
         +L3ThYCCAgjb0GuqYAqgSaQ6rgD/Tqqi2fkYGCSCUh+YT7T1QMUlA4vBTgMsq7ym3FIH
         7TVQ==
X-Gm-Message-State: AOJu0Yxn8cZoQNQIdFAHVPu5z0cu3ScmnqTFdFMlL/tkDcYrd/oX7TMO
	7yADlaBBSUju5S9PTZgXJGPJOiU3+Qd1q+zcS8XSjGxha4/eXARCJJSC8fwNsFVhOk4elZlcZ58
	xjTDpf6NE7sYhv10IHLqUD0r6H+8j6XHxfxxY+rpdx1brZquiALtX7XPRTZvcRMaCpYcD
X-Gm-Gg: ATEYQzzo/pXH6qs6a2/SADHc8/xpIvTZEBISVGvxRf41egcfrk2rMQlNnHE2xhGQzkv
	OwvLUl+2zpiX835RlT7RfrQ1xKm1NSz2pdl/BOVxjlJC9UARL+JvyrolBFhR/HiBDWg2tJcvmZH
	3Jcnoh1cCuv49at828mk8Ui17sfoC6gaSNU4aO7zOSgrnYDhs2m4nYyHP8feiTIasdAVmntN59p
	vFt4YPGiTbW9+NEnmt0loeMt+3dYqwlbQaZ7b/hnhtBPQIPO53lSc/C/y9NlqjSj6v85lulYCmB
	sjD5tKnh+SeKUBYoQg+PhYF5gSjuZ++bw1yz3qFGhtcX3vghArcXcB8Bv3l4mevyblM1PdgCqpV
	NdkULw8J8K6D37H/tih2bxKX1OeGFOMpcnArsm2TiLY+wS6DCLzCB6gAD0fDDe/myHHOrIRfpM7
	HcX+8r/H6oaaPp8XpxGo/IQDhmmFyMEkssFSk=
X-Received: by 2002:a05:620a:4101:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cdaa77938bmr1061168685a.7.1773450556789;
        Fri, 13 Mar 2026 18:09:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:8c7:e8c1:ea05 with SMTP id af79cd13be357-8cdaa77938bmr1061166785a.7.1773450556351;
        Fri, 13 Mar 2026 18:09:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366b22sm1806805e87.77.2026.03.13.18.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:09:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 03:09:05 +0200
Subject: [PATCH v5 01/10] drm/msm/dp: fix HPD state status bit shift value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-hpd-refactor-v5-1-0c8450737d64@oss.qualcomm.com>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hzwfWK5+EPLPBOMgkg/4Azem10iuzkilPWoxif3rO60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptLUy8W18Y1yfE5HK49Yw4+p+AVbfCcNE8CMe1
 zRTg8C9khuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabS1MgAKCRCLPIo+Aiko
 1duiCACQzw9dsW4ibwfY0VGKLAVvRpZSU1ckvWSmXXgpd38pxyDM4YkshNrmfTKz4BFaMh904Db
 ps8LI/7Dej/U68vZAajNnaZ6kkwV7IgYt2RBcCXOG/O1LahH99RMvIB3WkRgWnyeQakQi+oFpDi
 /vFskvbwcB0ESz5org/uNgFhedTvxIdaAwOh81xtI2mWdE+7RFIcttm5ip40KjvLev0/DMDmSUd
 qKAOEmJqQlvE9+etXHiktS8NYMkgBzleDLV92/4NdLQ/X3yW1eR1ehl1/AP1vO0313Qd4LareMT
 IjV1DiuH3rSKv3pPoLgsnEBZBsEAyqDjVY3EqPxaUXXQ+5w0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: E8C4IxZ0FiA8Q25Y_kBM-7JNA0oZbYQc
X-Proofpoint-ORIG-GUID: E8C4IxZ0FiA8Q25Y_kBM-7JNA0oZbYQc
X-Authority-Analysis: v=2.4 cv=auK/yCZV c=1 sm=1 tr=0 ts=69b4b53d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=IBRk8GtBIsankUNt0b0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwNiBTYWx0ZWRfX15hF8hg96cy0
 M5PMSpkILRe8J3R6ABUlXh047auHMHbO6RSLw2pKkl/QcZoJHEcKFTFBR3rvhyJ6FIRXDE7wPJY
 E0x87jJ3bitbaRCN5OER/coalw47VVEWlfGytx6QzJjQjPdLCsH1BhGW7RMbyx2ojS0QrZgEtx2
 MIebcQok/5t9aTylUQO40YEG+GHW90l0aEDotbO4I0rytqiK3tqCFZPpVu+S4TAM6u3DJegwuBX
 z9Q8XB31T1SELQ35ZEJt8kJdcZzH7o7Ejd27O3VaoFo9TSXtGBrJykRgFcFp0BDugLLplBTjmYS
 UxM5oUQoHV1IjGVTDxCumpoqW00+56+jNF/jCszcnHdykfLwp3CCoChnZSpPM4whOO5CQ1m9d/u
 XNiWdP1RFEfTmZ+1jf/5Bt3RvWl8mnpTDIS084a/Bdtc6obyMn6aQ/2addpMTPENRTho4oHIQ3p
 pD7Jzq2VYXW60fVZlnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97647-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03D5328B1BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jesszhan0024@gmail.com>

The HPD state status is the 3 most significant bits, not 4 bits of the
HPD_INT_STATUS register.

Fix the bit shift macro so that the correct bits are returned in
msm_dp_aux_is_link_connected().

Fixes: 19e52bcb27c2 ("drm/msm/dp: return correct connection status after suspend")
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_reg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 7c44d4e2cf13..3689642b7fc0 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -68,8 +68,8 @@
 #define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
 #define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
 #define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
-#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x0000000F)
-#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1C)
+#define DP_DP_HPD_STATE_STATUS_BITS_MASK	(0x00000007)
+#define DP_DP_HPD_STATE_STATUS_BITS_SHIFT	(0x1D)
 
 #define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
 #define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)

-- 
2.47.3


