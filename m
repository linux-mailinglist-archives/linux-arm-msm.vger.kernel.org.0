Return-Path: <linux-arm-msm+bounces-97624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOU+Du9qtGn9ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5595289734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 326893037794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A093B3C5DA7;
	Fri, 13 Mar 2026 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7UB5yz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DC43NTm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B706A367F22
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431524; cv=none; b=c7ZGsAa4SiksC07tFhRu0p9fpaMpJf8uk8311S+G7CqAbGaW+qb7jzlBztrf7J/IXiJLscxi0qgOY1xXU3eb36tapCeDP2vkCWGk2jCPfU0LC962SptP5gfMkK+hsogaiG9EC3bF1DUCdwSchN+9afTMPRLvRX/pwbbO3PLWcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431524; c=relaxed/simple;
	bh=jao7WzPpxARrtkYPwFNOiftYRUIGBhQZLDKatCNwVDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bJRFDqFTErPh88Q3uhQONQTZ066VQ/azNSrFEOTPB6TCTRdp6PuEnttyXtDStE89aQGBNHpgB7dWXE+XDmbtlj26vKNyodHq/Fxxy/TKYD0llvMdI8Kj6jQYOTRKtupbKCvtGanE4bRpSJ5sa3ngDcE4PKhPe+eyB8uyGau3QUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7UB5yz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DC43NTm+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DGqXQ11498963
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OXZ2U0fIgdz
	SVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=; b=Z7UB5yz0VwrpEHlu93l+MOk/46l
	70RKYY9Iw4Apm+gi0+0MTX6zMsRcHLX0SLOkHYNFM3LOfGlMv/yPVYtqKk5Q1dsn
	t5bVly+5klLIUFhZUzMZXakLWDR0V7AsvfKUGqqV4qr8qpSSHTJ1rUA5Z0zgEADd
	lXYiWAWB7ffcn+0GRG+43exYazp25l5tENyG6Q8fhyP7K6Leoa0iSHTwD9ABiU9o
	vNhENjqMqc3UUwMBDAF5BK8orSGBtiYaNjXQysctaF25Ge60Sj3HcMqtSw7W+v7j
	WvC+dgytI6nlmFkYdhz73/SapbsFRPbV/EjdlBIgTYD93W1OQsDPCintNPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hj54t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd781c0d90so1955906685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773431520; x=1774036320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=DC43NTm+3zoAlAgSByq/KoEcCIskG9kGOPpMBhEp2788tkeIDC75QHqrDJlZGxMAt+
         T7+RRa0awkNox8Eu0RpAPAtBBCbRv8KuOcv/jYNTIaMFUEO2wDtELRrQjd77l/PBnhBs
         Ywe72c99nlpC5M2aaAeivNibPTx/qZ9aMVbYU8EGKv9cVtgv2xnhr9jWwY6bAJhhwiUv
         Bs1Hafj/VG4VHTmtBf9I/cw0+dMsn+jY34sIcZbp17WZR81h8klxIFdakiuidJa6V33z
         uFmQEeBy93gCDXz8ZZu4IXQG3cxIEkztsGdJtXiK9NqsDcj/0/+53QddI486FsFL3xzC
         rx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431520; x=1774036320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=B09Vha7hg4u5jwoPVNxy/iaBWTI0mgqgQXNgIcivyEUSzEH9kASNpJ8XYWywRunO8H
         bMYq9ZlxracqqzuPNHnkTUB1vazkKgdjjwB4g+KmIEeCfzEMxt8jFGRP+cn7mtpN20x3
         Did/N4X0Bw+oAZCQU1PDdUsmGU1hk7qJTqGe0ZbnnjQ8FsjiOgoCSujiih4PQXyFYdh3
         wa+BU5iuoSSD540PuMrrYOMG9AH5/soKp/BhVfeUZF3OIBilqElajCYCR2q/lOhq2iG2
         yfEJbqm5eImVca6QC+ngCWguibgGGioedrR4HULpIfZCXd/nx5wGhamXgK0UpH5h0LKQ
         fkyw==
X-Forwarded-Encrypted: i=1; AJvYcCXkAc7c7NDXaZEY8raKbISqX4xK8cyvhBPBlqmue8KLpgK1fyT+WF06h40ExgBZ2vtI01x4hwNIN0TFPZla@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZR/oqm3lbkXuspWz23rJdi6v5XWQzj9GUd9UuLDPK0n5jLDz
	Vg24uiU9AHhneOTqUa/i/JEGJ9vG9LigJ95Te+iPh4Aey0k+/Xx9ehHAc2/OiyMT3h2tpsg/FDd
	xKL+oCYKistre5u8bgdVYPRrKN912+gQgaYd6vw0vYcnCj6JmWr/+2jwaMlDfi5Zj/r2o
X-Gm-Gg: ATEYQzwKgQ7a9FaiSy0xFq1PZ5Z6nfOE/NW8LFN0OgLXOMk/X2/Rutpgw/O7X0ZyKbJ
	4CxvpDat6cDNb3bIO0CYpJGssZWjbmISaH0rxGpxviPRXo0cU97Tu9DSvpCuF+bUVkjTCuE4Y2r
	joJCFH8GAvUfJJKzSuDcVuZ9mfnPT5CZC7QnJZYbBG4IFQeqae9EcBzFvGQiGcx1A+9lhgrTWsf
	LveQwHZqtF33j6V45aSXj58guUfmXF6x6j0bpV584cwakq2UGcsHRWpCsZhwrFO2ANz9eza/LwT
	L0HxQdsaCIvKBGekFZiw1YgryTG0q0miaAsH+54VknAcofYYc+D+ODCXIE57fKRxyAmEle6vlpO
	oGjdw7nomEj3gUS4GyJlxPHxoTN6btqLKPd6qgDB27qEDHuj//1hyiRcYrIv4K2LZgT6qOWe8kZ
	Txn7a2oqVqw/Y4
X-Received: by 2002:a05:620a:1986:b0:8cd:937f:1402 with SMTP id af79cd13be357-8cdaa7b6238mr1035233685a.13.1773431519687;
        Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1986:b0:8cd:937f:1402 with SMTP id af79cd13be357-8cdaa7b6238mr1035231985a.13.1773431519269;
        Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm20112060f8f.16.2026.03.13.12.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:51:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 2/3] media: qcom: camss: Use proper BPL alignment helper and non-power-of-two rounding
Date: Fri, 13 Mar 2026 20:51:51 +0100
Message-Id: <20260313195152.275196-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b46ae0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=zUK7vVYnaECQvLc2T7MA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: viU7ZWhknkYXmgKUev8M_9Dx8V8Z1err
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NiBTYWx0ZWRfX7P7HssBfwrXV
 FJHPHTSerJiANGs2Ql8Ijr6whoV5k3kTyujj5AawibI+pbs2QB+pyQ9A52srF+agqtjTvlKJ0SY
 2RSmcjcqEDieu8u1UDByE6/lMqiGHYaDKqYXYknho/JBNvbNvJgWGONaxgsa8v1x1H+MJ93wsfS
 jPENykx/hV2lIda5QtToGfS73ueD3YjpRJoTPm0FGr9FUMvu9thpGfHg01xF5cYbnswzT+55Wpx
 FvBNYySMSo15oniu4Zf9I+/9QTbMpnQC8DhTwLBlRarDngnDyTschPQSfviVRwXYVFb3BCjcaFl
 TbpX55ZCHbOOm6SsTWsjkjWRBv30KBHlOsNpVPI011x+7oLmLfPTYa3yi8X5S1Q4NIqxLOChj63
 IsvDOZ/7MQ0zKFOVy0wb9RDMpIDtej3R18WvUKzlhV6drxiuH9Mm8V34SfjrhUMiswGMB7SRVZx
 yuNAhdyKfGIQJAA6yHQ==
X-Proofpoint-GUID: viU7ZWhknkYXmgKUev8M_9Dx8V8Z1err
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130156
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97624-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5595289734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bytes-per-line (BPL) alignment in CAMSS currently uses ALIGN(), which
only works correctly for power-of-two values. Some RAW Bayer packing
formats (e.g. RAW10/12/14) require non-power-of-two alignment such as
3, 5, or 7-byte multiples, so ALIGN() produces incorrect results.

Introduce the use of roundup() with the per-format alignment returned by
camss_format_get_bpl_alignment() when no hardware alignment is enforced
(video->bpl_alignment).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index f52d8e84f970..0852eb6f1315 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -47,6 +47,9 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
 	unsigned int i;
 	u32 bytesperline;
 
+	if (!alignment)
+		alignment = camss_format_get_bpl_alignment(f);
+
 	memset(pix, 0, sizeof(*pix));
 	v4l2_fill_pix_format_mplane(pix, mbus);
 	pix->pixelformat = f->pixelformat;
@@ -54,7 +57,7 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
 	for (i = 0; i < pix->num_planes; i++) {
 		bytesperline = pix->width / f->hsub[i].numerator *
 			f->hsub[i].denominator * f->bpp[i] / 8;
-		bytesperline = ALIGN(bytesperline, alignment);
+		bytesperline = roundup(bytesperline, alignment);
 		pix->plane_fmt[i].bytesperline = bytesperline;
 		pix->plane_fmt[i].sizeimage = pix->height /
 				f->vsub[i].numerator * f->vsub[i].denominator *
@@ -459,6 +462,7 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 {
+	unsigned int alignment = video->bpl_alignment;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct camss_format_info *fi;
 	struct v4l2_plane_pix_format *p;
@@ -491,6 +495,9 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 	width = pix_mp->width;
 	height = pix_mp->height;
 
+	if (!alignment)
+		alignment = camss_format_get_bpl_alignment(fi);
+
 	memset(pix_mp, 0, sizeof(*pix_mp));
 
 	pix_mp->pixelformat = fi->pixelformat;
@@ -500,7 +507,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 	for (i = 0; i < pix_mp->num_planes; i++) {
 		bpl = pix_mp->width / fi->hsub[i].numerator *
 			fi->hsub[i].denominator * fi->bpp[i] / 8;
-		bpl = ALIGN(bpl, video->bpl_alignment);
+		bpl = roundup(bpl, alignment);
 		pix_mp->plane_fmt[i].bytesperline = bpl;
 		pix_mp->plane_fmt[i].sizeimage = pix_mp->height /
 			fi->vsub[i].numerator * fi->vsub[i].denominator * bpl;
@@ -525,7 +532,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 			lines = p->sizeimage / p->bytesperline;
 
 			if (p->bytesperline < bytesperline[i])
-				p->bytesperline = ALIGN(bytesperline[i], 8);
+				p->bytesperline = roundup(bytesperline[i], alignment);
 
 			if (p->sizeimage < p->bytesperline * lines)
 				p->sizeimage = p->bytesperline * lines;
-- 
2.34.1


