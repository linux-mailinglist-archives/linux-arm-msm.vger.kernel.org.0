Return-Path: <linux-arm-msm+bounces-94166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMsoLBkWn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:32:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9F199A50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 779413177762
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64373B8BB5;
	Wed, 25 Feb 2026 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdrYxcDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVO25+nH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE129A9C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032937; cv=none; b=M53UWMhWArAevxggZTbBD7GPRl15kmPjzozBrul3r95DQixIq83At9SNb4BEN2mSHWi6oJmACX1P4ZFDU/iu4N0kjnNi7VrnfihiEQ3UltpBBOx+w0bOnwAWqRFC1+s0uAdUPIcdDcGnLTS/XMHhM/D9TMT7PaDaqIXLo+FDuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032937; c=relaxed/simple;
	bh=VdCPHC+lv/6qpBzYdZ9HT8OY0Utr3VthZpI8xrnEPaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kqCNMY1fB9/LETCtyuIH1oEHOI/ayH5de6qsgLoXUV+qmH9AyX6I9BpI6FSR0bxrKrWxIa/S3oqQEDpnlQjrJgiS63zBc/ciOi4EgHnYCdTLOnomt5AOTTl4ZwpxwlR5SRYji6SafGtZmd5yAlWhwEAZMGOwfzZbnekeXwqEXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdrYxcDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVO25+nH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Sc121087941
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFviwGLCo5ioexgOtF3xpIXVZXd22kE/lq3
	dwHIQ0JI=; b=SdrYxcDlSjFvLloyfsOpV8NUv4SrbYQi4HRMtD2i8zdkIOSww3H
	7Ll3ZwDF3N+/HXO/ttbpkMjc19jimEPgWsszyDUwJJM90RwkiEH+5qUbGFUYEV+z
	LKsmRrI07z6KAWaU7jm41UGVEchFS3BXOSXi6HYzTwxjVKAYK3Be+AznL8KF97C9
	sixyqR2r5xyQTqxMz/nKxOCL7KqYO4KPKLu/xttv1ixBaEInG85hqDgoKz2nM8Vw
	Ioq9gfAoR5i0HbTlS5sXXRf5ZBP0Ih3F+qNOvM/KBBnFHckDhVKv77/kJxrIyPSs
	EUYJTCvZRLG03OhqbIuF7ndQUYsMd4Mpq6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh473e8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:22:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506afabb8d3so54707221cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772032935; x=1772637735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFviwGLCo5ioexgOtF3xpIXVZXd22kE/lq3dwHIQ0JI=;
        b=AVO25+nHGGcX2NefdrDrplH6jQ3KMJ4/ctM8pQ9b1eOZalBhOlegeVNOko44kPgG8u
         G5hduB/3dfUDUoaYwV3pCSI4CPt/lwnrDYRJ1J6HM+gnJR4yabFIfX94cO+uAoQkdSzh
         E6zISbNtPh3jQcB2Z/i5mk39CKkwKhdqSYbCwC8ncvxHem6zUnKWhMcGapZzqrdzNEAG
         lfMCPTjQvyzoSMoMmdGxGZojw8YJlPHxkNtRSnHfi8bw4YZdJiQUMT3jSbVl08UG+/SF
         a1g0kAGm8NAHIvvFuSh68Uo9xcYGdE5lUDNnMJa0h0UzlTyaLvi5HzB1qUOlOxiwODfx
         b+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032935; x=1772637735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFviwGLCo5ioexgOtF3xpIXVZXd22kE/lq3dwHIQ0JI=;
        b=JIVnOfcJxeXyPfBnJSzBOgGEMlwuC6KB373mFuzQt4a6S8FgYKGCWYkufoY3rieMLH
         rAan5KDwclTvJjqmDdUY6G7gOBJUnegK+WmdS23Gg6FuaRDUlAH9HIFQ2oSGi0wo5+s/
         SBn2LHBjIObtU6avsiJtBXztkqNcHNf4nmoWOLoW20fozwEj2ztm/er/q1PnHD9+E5rW
         ysQ07MVQd/UcJ5/m9JOSLm7uCt38tBKU11Yy91yArfhdSqFtVZhM0yczLcliro3au3o/
         2jv2+olQvmOZVnIduf/RW6cMlczHulGnp59DYmJyHw8x0tT7xpkrwcKTrxagg9GzTSUB
         OUQQ==
X-Gm-Message-State: AOJu0YyhZ9QVaRApbkn8/N46CW+zyTm20vcFi9cimp5U+F+IEsZlGt7O
	CqcvvJ6fqwoZDjqPnpmrXiXB3pMSK5Rqnb2RauyaPmaxvGf63l3BjQEk9+uMqAGqcfSeUde9Y/n
	1kG7UBzZrE3mziiziXrwFSS6wbZG78BMy07XWV89uWjqdpnpzGTOh3PodtwdPTwEJNf1c
X-Gm-Gg: ATEYQzyE51WR6BGD/3xA9WNlrAGlTTJPC3OSwoaBjHepWr1avt/W08zSBW/TIvRmikL
	eQk0WW+bl8XIqKlbjzQBeasTILN/ZFdG22lcyQYmcHzU23eOSXsAYavjAE1h8HrUvDq69emceWs
	RgTZvqVHKC1NcEnqX7yDs99QiothFZSeVRm4fcwuyJUtiTssIHH2eeX5mAe6Nf6h7BbjTDEOMPC
	cqnD1ORjIdWpS+9nUUnqL3Ha9NINd6CM51eFFtzW7TLy9YDBf+8qL/H5X6V7MUZ5ems2khYJA2G
	SHUNmllEF68+nd3TrTspmzixh8NM+/6nOSWZQ5JyrznGhFVm/qW3j+pP2xljQtmuwXTmm8nbkZO
	uxs2B6/Hg/nUoXkWIV0F6OOrSq8VpCcNHzKmK/lAtSwmG34kcdBxUhoeByNsKSXhAHOxhmLN8Iw
	+gajRV/dIXsIU=
X-Received: by 2002:a05:620a:c4d:b0:8cb:8d0f:6ba7 with SMTP id af79cd13be357-8cbb1fddf90mr487773185a.16.1772032934702;
        Wed, 25 Feb 2026 07:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:8cb:8d0f:6ba7 with SMTP id af79cd13be357-8cbb1fddf90mr487769185a.16.1772032934179;
        Wed, 25 Feb 2026 07:22:14 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5de66sm546490466b.10.2026.02.25.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:22:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: Add debug message to camss-video format check
Date: Wed, 25 Feb 2026 16:22:11 +0100
Message-Id: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WyrI_rFHJrLytz1JnxKsXvyrUufcO1Mr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NyBTYWx0ZWRfX3GtgxYTn5Xl/
 U+uRZ10NmjEsUiNcecRTsFW9cpH58/uGesqxU3XYL2Wsal5ZpBWWc0Ntd7bEax2R/eZKms1r7Ha
 TWWyZb1KMsMUCiFHEAHQOJxdAqwAfoxiJj2ZMw2VL2x7QVqUhPyzmSTkbD7EO4aTCN+58T863lm
 Z+lSXh7BZBxcbsABz4KGoAf9AEJo6cVEYN4M8WF/Z0JZTPR+UQefkUxb+q6GZ2sjpik1Z/Ssnko
 MLDbjygdQWhH/M6ky830DkcumqlrXKwMejUciQiaj+ZDD6DHDpshoIQgHHJoUhSjE5WC2FGH+CD
 m1s1OspXbHXvdc7MTNoYUHhAKoBcHvIXB1JU2B4Ue8zjM2ml+jbCcmG4z6ONK7bfm4wprj8PKby
 3FouIQzvJrtwlTQstZ+ae4TUzxZBimb9KPXGWXC60p2tAxc0++NEJ+MZKBgHO32rNXJtS2qrcW4
 WG/WYXrT/JjIchfiAvg==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f13a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=q9RLfEvHQeQPQIK2xucA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WyrI_rFHJrLytz1JnxKsXvyrUufcO1Mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94166-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4A9F199A50
X-Rspamd-Action: no action

Add a debug trace to video_check_format() to log both the subdev-reported
format and the format requested by the video node. This makes it easier
to diagnose mismatches between subdev output and the negotiated V4L2
pixel format, as well as issues related to plane count, resolution, or
field settings.

A small helper, print_fourcc(), is introduced to render fourcc codes in
a readable way.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0c76bc2cc574..601d5a43306f 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -114,6 +114,19 @@ static int video_get_subdev_format(struct camss_video *video,
 				    &video->formats[ret], video->bpl_alignment);
 }
 
+static char *print_fourcc(u32 fmt)
+{
+	static char code[5];
+
+	code[0] = (unsigned char)(fmt & 0xff);
+	code[1] = (unsigned char)((fmt >> 8) & 0xff);
+	code[2] = (unsigned char)((fmt >> 16) & 0xff);
+	code[3] = (unsigned char)((fmt >> 24) & 0xff);
+	code[4] = '\0';
+
+	return code;
+}
+
 /* -----------------------------------------------------------------------------
  * Video queue operations
  */
@@ -218,6 +231,12 @@ static int video_check_format(struct camss_video *video)
 	if (ret < 0)
 		return ret;
 
+	pr_debug("%s: format is (%ux%u %s/%up field:%u), trying (%ux%u %s/%up field:%u)",
+		 video->vdev.name, sd_pix->width, sd_pix->height,
+		 print_fourcc(sd_pix->pixelformat), sd_pix->num_planes, sd_pix->field,
+		 pix->width, pix->height, print_fourcc(pix->pixelformat),
+		 pix->num_planes, pix->field);
+
 	if (pix->pixelformat != sd_pix->pixelformat ||
 	    pix->height != sd_pix->height ||
 	    pix->width != sd_pix->width ||
-- 
2.34.1


