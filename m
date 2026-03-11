Return-Path: <linux-arm-msm+bounces-97078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMA0NzDOsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:18:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60C269E49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 513DC3033BC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0441392824;
	Wed, 11 Mar 2026 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMgiB8P0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGBq4k4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59DB391E70
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260273; cv=none; b=N75jLxq0jkR8xQt3j1cZeFVjwKqQD/PUueW7RM0XArWkSlUG1T6OuJOHDgrmMpBD5Mdu6ygO7o/r00sHta9ToE5YG7IuNtZhSh/zNN0ubh61AscyshFKWs5SRrv2PeRpA4UyIE8qUYH4+YAJh+BSofAFlAd3uM7UteZiQ3WWSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260273; c=relaxed/simple;
	bh=8XMa4wsTUcexijaN95Xa/+lE5OvRgvIaBdz6gmBRNU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NggY9BA2G6tprd/KeTmQNiLMw+aTwOVNp8h5M8qVxIuhM0lwSnab56oeU1JOecIcLbWmXMTm+uOIrn0OvkjWTn58NRw8PMXUg5hz301WfUJ/PB+OyQbpksp/tOAUVFiadg097nMxkj4pQO8aoFCst3lP26/VUUhSGN291Yh+bB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMgiB8P0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGBq4k4B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BIc0wU1439761
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUfDsXE2bewsJbQrNcPdTtiQ5aMigLmKp8tPDJLp/a0=; b=kMgiB8P0H8w3+zT3
	FcgU+Aq5DunS/yH6Yl/Hn5mt3MbzvC9njX2Xf4BTEM0IYc2fZ4A0plMQKX5/y4NU
	Ah2BwRpgWoXgFFiKmuqNpBKXmtamNMqBR99YhgLzS8TvvNi42qcQzz/+bmv2YuQw
	sqTMLqQ+E5wKrwhL0LK9A5TZ0u7IZPJc/3aF4ejtTXpZGV1vO+CYNFVZy7JGdwt4
	2fqUtV82qd7H+UN6nuUV8OI/S46E/Zr5LfGJb6t5Xsg1gu1vSpkMx/eh+A/3QB1I
	TTMZ+aDBk5XtjiN1B5tcCfGp+bgTsnUeLSEpRE4ZkoO82bP4TPmr9hNQDZSn94Sf
	AW1RiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yjwk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so34062381cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260270; x=1773865070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUfDsXE2bewsJbQrNcPdTtiQ5aMigLmKp8tPDJLp/a0=;
        b=RGBq4k4BtH77auG0FGeufFqTN15Ck0TexIdsi6Ou9pn1oJDZH16e+/I3ze1tsXAl6I
         M8km6iTi5kPrbsVcxrrPczADgmEZVZ+YXVP2JV05YLT5nl+zTfNpWdU7teU2UwexTH+g
         E5VQ5RtLt+5KCDR654+O+tZ8k95iacpx2qvgqRYYUVzSlE1eXxSKm9T1R84epntyCma9
         Ww8LgKt3fmWYUNUCc8vzE3rqM6NkXyGvAqb7UHHtdeXJZ3JD82Jy1NYkzmibYvER1BqX
         Qlq9y0hwiEFL0t6OZ+nl3BeJSI9j70X5KAr8dC8oW2xCWJAr0FrXOwtea7kVz1B18lS0
         81aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260270; x=1773865070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WUfDsXE2bewsJbQrNcPdTtiQ5aMigLmKp8tPDJLp/a0=;
        b=OzRR7+Msatod+yzmE0WB/+3BY+Rnji5rISJj+QnBVAJComaFT0mKoZjjQ5ZkAeEFkD
         Bcpaf4kv+7YE67HNaP/BluTJpfA7/y8YhGaNhj23gryIYA9l1uQdt0WQYUO8x6HQOTHZ
         htOUQz3XN2fPP1m3VNjoDh4dz6DrBHbEEX9OEJanJTl7wFGQnI0bbvEHpGCgltV7dk3G
         I087ulj4/gKU5oyTfz7yjnyUCNqdkkvrXQ1+SpmrMSZhJ8zdiau0FcuitJyHuXpyQgg2
         08Zc13Qlor0R8TBdWIcdJlrKowx6HJJP+64KOp83vQwxWDh37CjvTuav6oNtV117b+DG
         7bFQ==
X-Gm-Message-State: AOJu0YwVZvcpOhR7byxxEf8uqGiL7+U6w9FPAW6HGOl/r8z/5/q8d1rQ
	A/wnA2UtsdvM6apVRPouQSXuRmWfxqyfhydOn4B/UmzP6r4LDGqR0bfMFy0Dt2UYZhcKPANY7tj
	dKwwF245Wl5F+Sz6f8tcYFhlm/awr0X0gdRYnUoWTK/JWIY/Cex/s2pzzuacaaqsIN1wr
X-Gm-Gg: ATEYQzywxbgjapuM/ix+xm7Rq7mCd0k/yjlelh2YsPlpaTugWKMLAvcOcg95t+kpdcu
	rooZ1+DPVEmw2VF/meYARh+pX18d5ZkZQocoPnC1ut47UNSz81OZOmBkxMeajhCN6xz7JlSvACg
	+/kEb3SDdSt45SAl8MXWm/g/ryTi6kv5JDYpzPIQsfWDYdhr9znsDmsDWfElCiDtVODgGOjf22A
	XJIeT7Nx16001Gg+hV7Uo37WPd9Pg5ULfsfmk5C0aJoBIltHH4xTPJWMW/l2JH3eUpdT6lk0mZ8
	GeeybylhP3PtEyzvQxbjKfueCZMn50w4pQMQcFsDP0o0Zt3yMM0Re6w4kPPmSVmvjlHH6DKO0js
	AtB9p8i5Ncl2WGB9uPQLs+84KvnBUsmpqO9WwiOSoJ+pP
X-Received: by 2002:a05:620a:708a:b0:8cb:4059:a909 with SMTP id af79cd13be357-8cda1956ac0mr553432385a.21.1773260270125;
        Wed, 11 Mar 2026 13:17:50 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:8cb:4059:a909 with SMTP id af79cd13be357-8cda1956ac0mr553428485a.21.1773260269682;
        Wed, 11 Mar 2026 13:17:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:31 +0100
Subject: [PATCH 7/7] drm/msm/hdmi_hdcp: Simplify register bit updates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-7-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9385;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8XMa4wsTUcexijaN95Xa/+lE5OvRgvIaBdz6gmBRNU8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3cfvxWGj/HrNqippRl5yeLDVnfLLiTatfgb
 vOaaMf4BPGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN3AAKCRDBN2bmhouD
 1447D/0QPvgUPTbzaC5cY2j7uyYgBrjkju5R1+H21BG9UvvJd+Wxz+McNqCfV34gBK1EPc7bfg7
 bD0TUjKJByBioIN+3gL2RZiJJxucvEqsFWmhWxTuOZoFOndaUuymfzBCJMD6EyBPIwk+0Y3VLPq
 xaxMRrylzi0WnRCxTb6DQqprOOyYBaW/N9C4LFDnvQMbFyTlLLfsiRkVn1WLBkRL1k9ABay7Hoh
 OuoZRTjgAJjnwmUDR19X/XpiqLYW60aNRv9aNUQJ+12pDskGNQRIAH/TPsZaZ3PSkn0CplVjNOW
 ESxaZSXWFs5MhcjUpxE4Ot3jS1IgUNz48eclsE96oOucjC+g1CEoX2CeCIucAnEzqYJRbCmuHLH
 eFLzbiuyUZWedLS4HHY+Hlw/laVRyRl7+wtsAUMIw2nGTfs/wOctan2i/swBiXVyYrVnkSkK5mO
 YuuFYK4sy1i+2WdhyDbmYkwM9A7VPDXEJaVM+2L6aAEGg5hbZzRwOSrB1r1uPqZE/vLtegZGqCs
 6xrcmPEaEWXLQw66S/iNiwbwOar0l3ZgWkiEu99PmHy5AoozRAfuAaZ6UvCAukuANQiq8Ak1/1Q
 DD+MquVqa7BMAx6JuvwQMY55m3k/DFNbh8jesZfro1no9WwgJBbA6kulK8c9DV5indwq0TQJcTU
 lL0VK0Gn4XITvMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfXwS83EK7JBKPj
 TiZM00TBS+FXSmJiF+FafWcIM0TYLUAc6juYBcDPEbLlEuATylDeaJo4mupPsu6g0iAXDc3+sjD
 X00+tMt5VZPEzkxjVT5WCoW24ccqtZK05ZvILJmE4bnSKjf4K7AkwimbRscucHngFtfFH+H/3Ch
 zBiPmFmNTN+GO3DB+PceenMK2BH9zq8Kr+Pj1qNhYZIIdphWhY2wt5FvmWMH/J6MGu1Bq2haGTA
 b0vGybakZNbSFFe02WgMDO7gbDuKpH+6gdK7EhptKwwU2017HHxxAqMzSeoQFrz3PYUaHvj6FcX
 LRG8QPePgg8igxQE01z/0vBCayU4AkmI+WXQ2JnYPK349YbD5BB4WoMObjRppEm3YQQBr7LHEx2
 rSMOWkRxiMWeZe2I/on3ij67B49rXxuNrirWEawriNs+C6ZpwW5kI82/n1xyT8dqPIkt4pU7BnC
 pQGcDBXlGO6RS4726YA==
X-Proofpoint-GUID: zj5Y00U2tQwBwZUJ4tKD853mqwW24uA7
X-Proofpoint-ORIG-GUID: zj5Y00U2tQwBwZUJ4tKD853mqwW24uA7
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b1cdee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kVIxuixzSQivcz-PG0cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97078-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA60C269E49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify reister updates (read, apply mask, write) with a wrapper to
make code more obvious and avoid possible errors of reading and writing
to different registers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c | 85 ++++++++++++------------------------
 1 file changed, 28 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
index 8fb5497aac9f..7862bd67d154 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
@@ -306,9 +306,9 @@ static int msm_reset_hdcp_ddc_failures(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 			HDMI_HDCP_DDC_CTRL_0_DISABLE);
 
 		/* ACK the Failure to Clear it */
-		reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DDC_CTRL_1);
-		reg_val |= HDMI_HDCP_DDC_CTRL_1_FAILED_ACK;
-		hdmi_write(hdmi, REG_HDMI_HDCP_DDC_CTRL_1, reg_val);
+		hdmi_update_bits(hdmi, REG_HDMI_HDCP_DDC_CTRL_1,
+				 HDMI_HDCP_DDC_CTRL_1_FAILED_ACK,
+				 HDMI_HDCP_DDC_CTRL_1_FAILED_ACK);
 
 		/* Check if the FAILURE got Cleared */
 		reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DDC_STATUS);
@@ -324,28 +324,22 @@ static int msm_reset_hdcp_ddc_failures(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 		DBG("Before: HDMI_DDC_SW_STATUS=0x%08x",
 			hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS));
 		/* Reset HDMI DDC software status */
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val |= HDMI_DDC_CTRL_SW_STATUS_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_update_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SW_STATUS_RESET,
+				 HDMI_DDC_CTRL_SW_STATUS_RESET);
 
 		rc = msm_hdmi_hdcp_msleep(hdcp_ctrl, 20, AUTH_ABORT_EV);
 
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val &= ~HDMI_DDC_CTRL_SW_STATUS_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_clear_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SW_STATUS_RESET);
 
 		/* Reset HDMI DDC Controller */
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val |= HDMI_DDC_CTRL_SOFT_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_update_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SOFT_RESET,
+				 HDMI_DDC_CTRL_SOFT_RESET);
 
 		/* If previous msleep is aborted, skip this msleep */
 		if (!rc)
 			rc = msm_hdmi_hdcp_msleep(hdcp_ctrl, 20, AUTH_ABORT_EV);
 
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val &= ~HDMI_DDC_CTRL_SOFT_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_clear_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SOFT_RESET);
 		DBG("After: HDMI_DDC_SW_STATUS=0x%08x",
 			hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS));
 	}
@@ -399,7 +393,6 @@ static void msm_hdmi_hdcp_reauth_work(struct work_struct *work)
 		struct hdmi_hdcp_ctrl, hdcp_reauth_work);
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
 	unsigned long flags;
-	u32 reg_val;
 
 	DBG("HDCP REAUTH WORK");
 	/*
@@ -409,9 +402,7 @@ static void msm_hdmi_hdcp_reauth_work(struct work_struct *work)
 	 * AN1_READY bits in HDMI_HDCP_LINK0_STATUS register
 	 */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val &= ~HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE);
 
 	/* Disable HDCP interrupts */
 	hdmi_write(hdmi, REG_HDMI_HDCP_INT_CTRL, 0);
@@ -431,9 +422,8 @@ static void msm_hdmi_hdcp_reauth_work(struct work_struct *work)
 
 	/* Enable HPD circuitry */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val |= HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE,
+			 HDMI_HPD_CTRL_ENABLE);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	/*
@@ -456,7 +446,6 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
 	u32 link0_status;
-	u32 reg_val;
 	unsigned long flags;
 	int rc;
 
@@ -472,14 +461,11 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	/* disable HDMI Encrypt */
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 
 	/* Enabling Software DDC */
-	reg_val = hdmi_read(hdmi, REG_HDMI_DDC_ARBITRATION);
-	reg_val &= ~HDMI_DDC_ARBITRATION_HW_ARBITRATION;
-	hdmi_write(hdmi, REG_HDMI_DDC_ARBITRATION, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_DDC_ARBITRATION,
+			HDMI_DDC_ARBITRATION_HW_ARBITRATION);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	/*
@@ -498,9 +484,8 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL1, 0xF00DFACE);
 
 	/* Disable the RngCipher state */
-	reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DEBUG_CTRL);
-	reg_val &= ~HDMI_HDCP_DEBUG_CTRL_RNG_CIPHER;
-	hdmi_write(hdmi, REG_HDMI_HDCP_DEBUG_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_HDCP_DEBUG_CTRL,
+			HDMI_HDCP_DEBUG_CTRL_RNG_CIPHER);
 	DBG("HDCP_DEBUG_CTRL=0x%08x",
 		hdmi_read(hdmi, REG_HDMI_HDCP_DEBUG_CTRL));
 
@@ -537,15 +522,12 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 static void msm_hdmi_hdcp_auth_fail(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
-	u32 reg_val;
 	unsigned long flags;
 
 	DBG("hdcp auth failed, queue reauth work");
 	/* clear HDMI Encrypt */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->hdcp_state = HDCP_STATE_AUTH_FAILED;
@@ -555,7 +537,6 @@ static void msm_hdmi_hdcp_auth_fail(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 static void msm_hdmi_hdcp_auth_done(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
-	u32 reg_val;
 	unsigned long flags;
 
 	/*
@@ -563,16 +544,15 @@ static void msm_hdmi_hdcp_auth_done(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	 * there is no Arbitration between software and hardware for DDC
 	 */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_DDC_ARBITRATION);
-	reg_val |= HDMI_DDC_ARBITRATION_HW_ARBITRATION;
-	hdmi_write(hdmi, REG_HDMI_DDC_ARBITRATION, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_DDC_ARBITRATION,
+			 HDMI_DDC_ARBITRATION_HW_ARBITRATION,
+			 HDMI_DDC_ARBITRATION_HW_ARBITRATION);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	/* enable HDMI Encrypt */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val |= HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED,
+			 HDMI_CTRL_ENCRYPTED);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->hdcp_state = HDCP_STATE_AUTHENTICATED;
@@ -1304,7 +1284,6 @@ static void msm_hdmi_hdcp_auth_work(struct work_struct *work)
 void msm_hdmi_hdcp_on(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
-	u32 reg_val;
 	unsigned long flags;
 
 	if ((HDCP_STATE_INACTIVE != hdcp_ctrl->hdcp_state) ||
@@ -1315,9 +1294,7 @@ void msm_hdmi_hdcp_on(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 
 	/* clear HDMI Encrypt */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->auth_event = 0;
@@ -1330,7 +1307,6 @@ void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
 	unsigned long flags;
-	u32 reg_val;
 
 	if ((HDCP_STATE_INACTIVE == hdcp_ctrl->hdcp_state) ||
 		(HDCP_STATE_NO_AKSV == hdcp_ctrl->hdcp_state)) {
@@ -1345,9 +1321,7 @@ void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	 * AN1_READY bits in HDMI_HDCP_LINK0_STATUS register
 	 */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val &= ~HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE);
 
 	/*
 	 * Disable HDCP interrupts.
@@ -1375,14 +1349,11 @@ void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	hdmi_write(hdmi, REG_HDMI_HDCP_CTRL, 0);
 
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 
 	/* Enable HPD circuitry */
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val |= HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE,
+			 HDMI_HPD_CTRL_ENABLE);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->hdcp_state = HDCP_STATE_INACTIVE;

-- 
2.51.0


