Return-Path: <linux-arm-msm+bounces-95873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EIiKAH8qmmcZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:08:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BEA22491E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B72730022FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CC33A9D85;
	Fri,  6 Mar 2026 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7CpuyPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtvWp6Tw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC13E8C6D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813308; cv=none; b=AuZHsDNMnRdJL6eC5DcE01M9HqAIUTyLCu9740S2cKqVeBvmZwJElD8lGronzSpFa8DwTXoA3JAC+OsbRNWDhaGsoPuiAUjnPzNz0UDzfcLRPUdrlDrJVwCnQOjTPfQpR7towQJ4REtoyutgIEWGvpxGfe/GWx0XKhDx6Lc6aA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813308; c=relaxed/simple;
	bh=jao7WzPpxARrtkYPwFNOiftYRUIGBhQZLDKatCNwVDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=REF/5Y6VSpl9cux/YOifShcMYdNENq7gZ4w6H4GzDKGBfNxHCOBepVW82b1apaQv0He72D0+vMwwEPpUIAIBZVC2X2sRDnoKuqxTwqyx/Qs24Mou/WC1fu41PNRtlGoR89i9O2c9kYql0P2X1ih1djY5iNWPhTFuZqmyNk00B7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7CpuyPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtvWp6Tw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr0e3586106
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OXZ2U0fIgdz
	SVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=; b=l7CpuyPVkEvNlwnKVcStcz4jF0c
	GJ4/Rfp33k6OkjIuLU7Bd2stLKFJ1i9eo/hsNZ5Rbkzc4qVCL5qlhyMHUAU41nY4
	ZLtHze3JU5Q4qBbDK/NmkrspqCdzHIuCti/mHbJA34TodMnNFFDmpWRDHSuSQCYy
	fnbjm9aYvehO/rys0tIgORdlcrlQ/4zK4Yb9A1bqbS2/GXQkBy2gvK25vO3tMl1c
	ZWSFZFv7kJfKohHt1pRZebPsjqLmcEJHv7L88SaYtulra/UN/AnrJSJhualwvE6r
	8dQmXRAkFsxgVakof5eoAVeyxkkCAEwfgEMP8asU6DJILfK7k1NhS5ozgsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtech-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:08:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so5056500285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772813305; x=1773418105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=CtvWp6TwUmSZ+j5O/oRctxt0s7hp63SPKpNkhnplvGy5+KpAK5TzYBAEBJGfo8F1gk
         YgerrhfUU9curjlOQjlzBYnv+ZI5Oij7jhi/QWtYEwzDsPRca32zX6aIaFsGpCCxDno1
         uTgQeXvhS5zSOmXqht/3QC9wAfntniUZhFED+MrWQ+5ukWcM/CTvx9VV1zhCSu8J+Tt5
         yjwFc+YVUhn9NEFFQMO+Na0QkHkoFcBv4JbTmDvWZr2alIofKXbWMHDDgJKqBDgTkAd+
         25KVb1aJya+S/WK+08zcRyvFzOF48rJybwedOGgl1GLPE6O4+j5JdW5SdhdQCklCV4OE
         5/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813305; x=1773418105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=eO17K+hd6ClZkOy0EZa/w0SM9K3vj+BcMdcRj93nRHDuNrvjadSer7jh3MdrLLLvB+
         tSsUpZXt7OTDFW/ns4tnPunWhcdB3hCjieMfvOJ4HXUOt+tJaLQ9nHXdS/JS9t6KChts
         9u9WU50fPtxcoqYEgeEfqH7dok+G9sYMfbpY5zpsZ1Ht4moTGsAo7fQoGBzqhRtfmSZL
         GQPIV6Y9kltP9+dbNfXbZrdKVOUvccaegmqWjuBXoqEXMfNOWHc/xFxQdqPcl5Y2FB8u
         mu+04rg55g62lsBEpxeEt64JAuQ1Qy+Hn5+WLm8P/IZWmYqkPCKzgzmXb8hM0QpS8S9W
         Cf5g==
X-Forwarded-Encrypted: i=1; AJvYcCV+Zc6QV0FTVNyFN9PskFA8Cu3r9RjMY86WvH7lFx5mGue/bDy+n1yLb2kzeO1W5qF3kEPyiQa3X6XS8nBd@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAjFIsqONByMlJEIEYj3FnGWiu0UuNwWpoyZy+/p7WKIZ7LUF
	xaJxogAJwynCK8nGzcNP4nMv8Pc/NSMiox4T7j1lLysCNqH3hXS0/adBrm6OZSHe4Yo9lKbsPwa
	7q3Bsc51j7MjZlmCuT8u1OE7MBsmC2GdczDAG9pwvQddWe7ngRpiHlXMvs5z89Sg8kfDGwRUjgK
	UoxfQ=
X-Gm-Gg: ATEYQzzS1DE9Qt2ZjTKDUKZ5RDTXR0qIlMAGhlCwkUQ9xnNouhkpv1pFOUPjkaGlH+j
	xlTlgr7oyt90k5rOn3P8llumAR6zZPjNNgxhzUVHgxxzvsSX2zGohdzcFDUOMy8o+JwPlq+aQdk
	DDbhEfcPsq1MPmYLrrBOupAJ8XynePfZvnIdakmAhsOuxGMhYOMwEOQln5zCCN24ghQ47KPUvWH
	St8nXHZurybgPsJMqTpTKPabcZ3mH49YJimrcwJQ3EEfh+OSyQdoH/Ad0+ldnHtZfKIb6FsSNhi
	HmcMh5lP5Gp7dT0SqjioIBB+ECe2K37jEzKEfuMBCeIj1tpBHCZLehDjsfr1MWj0+lb8Q0MFNMs
	24OmBesBDkR0uOUq5nFk6T97DkZnWtRFTph+IGlBVPpEs4uzxf3xoxa1Sdnh2xMk+tox7qHQxi6
	VA4A11RzfMJPJtCB3Ey7NGMPaEcPK54wGg9cB0BODvRg==
X-Received: by 2002:a05:620a:2886:b0:8c7:15fc:2a23 with SMTP id af79cd13be357-8cd6d54bb3bmr341469685a.79.1772813305418;
        Fri, 06 Mar 2026 08:08:25 -0800 (PST)
X-Received: by 2002:a05:620a:1991:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd6d54ce7fmr343222285a.81.1772812813319;
        Fri, 06 Mar 2026 08:00:13 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:12 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/3] media: camss: Use proper BPL alignment helper and non-power-of-two rounding
Date: Fri,  6 Mar 2026 17:00:05 +0100
Message-Id: <20260306160006.1513177-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -zuAS24ZfnX9BCnDo7thgL5v4y01ys5f
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aafbfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zUK7vVYnaECQvLc2T7MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MiBTYWx0ZWRfX65qI/eszItM5
 arwp/JKrJNP0wBRWe58nWtnOCGnDVuWAF6+Nrr5Oos29+oFfqKJqM/WnFYfo/iPRgoFf2ADqLiB
 Muh8qEEebzJR8VhePvuyAnEs1F6s2a6874i7+KJo4KDV5qxDoivyurWUu6cTnbIFiCwzgpxMHqN
 CIWHyxmpis1I9H3Yq3/uP1JLqso8BnUhZEyu/KbemJhBpAUwtU4E3liJrMwgj5hb87ux4VdoXtp
 pZ2CCagb9eTLIHKYh+mBCedmqqIWWPC8+pOW4nL2203uUXbD1YwhRjFQni4N2k4YH9z+Yz24b4W
 /UStYSZ6HrPVtyFPA5k9Bp+XOKHyhNZQnk9dDQ1hiRDDNSJG1W+OKzgNoecVSoLCIb22rmcTUXi
 ktQCRGeIacTjj0SUjEqbhyhyHKmQzXdoVALso7o5O/761Mxd2LfLAB7gtfw5xpqR/l/xIvZMgjR
 rJEczFKk6zm/KgHbi+A==
X-Proofpoint-GUID: -zuAS24ZfnX9BCnDo7thgL5v4y01ys5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060152
X-Rspamd-Queue-Id: 41BEA22491E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95873-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.984];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


