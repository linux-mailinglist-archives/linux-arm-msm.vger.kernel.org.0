Return-Path: <linux-arm-msm+bounces-97625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILAqGfJqtGn9ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C4B289743
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 20:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2E4F3031B39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5263E0C4F;
	Fri, 13 Mar 2026 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmr72iyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOrVYQRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EEE3E024D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431525; cv=none; b=FJeecJFDg25woda7xz84f79hscWmr3dUU9I9EMjoJIZ2WrbgcafRYKhtTVj33znbUK7a5HsQUPCduZYhAGS4JjUekFe04uYHEVmL1RWtJ04x751SZVfta7AlOmhMcfXfclhTFSRZTrpQNasCqHcwIrlpHP9u2CNpglhSf9zvEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431525; c=relaxed/simple;
	bh=RGNYsDHHNfShLv/xZD3iLjvQtvitFFm8+m9j8/SqbpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uTPTsG6/3vCAsfBu6FBtullDUW30N0FXpN2hnPx/2oYEDXMVkutrCj0TwwDRkQF6BmcMAIZAI3KVgBBPK6V7L18SnrHfrdjN/U3WcVUJQK8XCQb3B6j/RPyrOMMfbbclRJ+hedI1vp8j7VwZqRKfmB+YWHIaEPPd/PPsoER3vCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmr72iyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOrVYQRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DHUVpT1499093
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gr9E5DfiexT
	Ovtee35m87lxhGRVlsW+KaUZHlNYJATQ=; b=hmr72iytzDIa8GNizZ7Zx2t7vkS
	3FWdQIX6Yr8v9gvCWGQUvPtfIrLTTl/CNI5lgcbAfk34m4GH+283y/sqtcN1Fkhs
	TQIZJaX+Aqgg4nW3iQWNjP++uRtPJHK2PAoe8c1iEzVVyKWqP7F35fknMbRdqnF4
	K9vk/88JGMRs/g0vJHPI/4lRhBdCIcjOvK8DSPEGsUWTyc9hOeIlTe12P8MtDu1h
	KZ0d/sxhSpEG29txN7UtSWRvRVTnlLc67k1yBIiNvWLAstr6gy046fn/Utik18rm
	S19LjWVuoNZnxrXg09oLyluuuy+5nNGbFdaKR7lVZrrVQwGB7hI0NqYHZYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hj54v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 19:52:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so1949854585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773431521; x=1774036321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr9E5DfiexTOvtee35m87lxhGRVlsW+KaUZHlNYJATQ=;
        b=eOrVYQRoOoHIyenciLrIVXgLwArfOX+ZlfRV2HD9Y54cBKCxpbIjgXncRWSvvSJcDQ
         l6PzlFZlGZl+J3Q6b3IPMud8LvB8y3RScQuxg/+yZL66U4CvLP2Nr58fVMGFFoWsSllX
         9VAroo90m5IxBhKiikTNJ8lO3S4qDuXPLx/Mo10KMmF4WgU4oMAz1279QCD1qM/SM9Ac
         jVrSncpEVG5Pzi8oZs8IQYu3wrBGvSgULb/zERhRKLG/SOWZZf/loQlAGvybX+0jOaLl
         dVRo/3TzZxjSeDkUGqdY2j+ATUkIF5ubnETNwmDsKxbSfXunKl3DUXFRhiuHo1VmcnwA
         CivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431521; x=1774036321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gr9E5DfiexTOvtee35m87lxhGRVlsW+KaUZHlNYJATQ=;
        b=XESh6Ldb2SYfw2Oml7XMkotS/FfdtKZygKi9rgpmQzzEyS3r7d9sFR9YHiOG9tNgrq
         royDeKWH6IzHg99nPpyJx8uKuDG6gG00XGJKKQu0ntWa4a/tlRXyHgZWL/V5F77PxCnx
         nSqy8VaJrkaLtYXp12ZLrVlJNs7TyhNVCaH8Hv0Yf49PQybvO+440L5sv+B4UIB7+tnN
         t/LgJRDhWlF56eFEKKPTUELfq72GMLhRVWnop+PIdyWNNKg8/dh9+Z1AH/lXm6azV7vh
         7cbzFhxqBkue8BYCvmEVFt/O+xPiVJrQlE4OSjQgPBRoRn+662xAdaGj/+NxL82pN8H/
         s1pA==
X-Forwarded-Encrypted: i=1; AJvYcCVgaHuN4+38H6EzrOvWaHsyQe8Xpa+t6Xi5ZWOXXRTClskw8/nPjkzHWaaMIw7REeA9AAtqhjElHa1vFA8f@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdfXkFMYG1WxthHjv2yPnayIphI2yBy3FhUqMxb2NbszqBSmu
	vEwtrTayCHBpwNLcBT7M4UfwjFw5HqHBN0OAMCtmqPMUymD9Nb6h/qZw33FhRfZNKRMEnKu/XLm
	FELzIavdZAnjdMCW0zVaWMRNzjWPAn5u0BYhMr8QO7vbscp7Nmg2yiV1bO+hjVSF6NGyG
X-Gm-Gg: ATEYQzw6csZKcswJmEGjCiDrNt24K45UGDKLrOtj4WoTlvb+sDEqtLd/tcDqjHTYDWb
	4O5DJanAQHKnAkgC7K+cEqKAQMBYqobtAGV4jphOadAkXtm1UnlkN1wXdL6NFSe/+yrraq5lDty
	0vUZ0kLgMrJxr4lWCXZwddzSb45y0Nkzn2GlVGWJIlf3B0TqwlYF3cYSSqA1gbi6Fbfb7hh5+yt
	OBW6lkJFhpP50HGjoiGbhJAYtCDXaLX80ZrCJ69Vk06F/WWoUpesVt/qv5T/5Z1asnanMVkgowV
	XAAYLoZ1/aja1gzMqiq3rpkTWmphnL9K1/hrW6EPaeyHhJj4//1PNRCXRUFOoMPhfYFgqFCc/4l
	qGp8gSOWxD5LDGZQx2qnJCV38UR3GM9M+MWMGamvBPXDouC76xM7kiIBXr/kYaBh85YVXDH3Dve
	femOrALdEu8R6O
X-Received: by 2002:a05:620a:4514:b0:8cd:9300:c864 with SMTP id af79cd13be357-8cdaa88a14amr1067583285a.35.1773431520859;
        Fri, 13 Mar 2026 12:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:8cd:9300:c864 with SMTP id af79cd13be357-8cdaa88a14amr1067581285a.35.1773431520440;
        Fri, 13 Mar 2026 12:52:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm20112060f8f.16.2026.03.13.12.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 3/3] media: qcom: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290
Date: Fri, 13 Mar 2026 20:51:52 +0100
Message-Id: <20260313195152.275196-4-loic.poulain@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b46ae1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KTbTtSzwl6QXNmdirioA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tAFo8PznEZc0f499nmHM-WwdCcj23j0b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NiBTYWx0ZWRfXxP+rix3xTFKR
 m7ETZeZSE5+u1Jtvzcyyoc0HMtF2pqbGdVB4MJ26hL2YkUgyzUe9m0zwWDMv/hx+eQmzmyEMxum
 aavwK+OfTdk+I3wp+cAbNY/1iE/HFHJ1U3Qsw/t2fs25azq7X+E/Dr2w5nWqk+R3FOkwkTb14tm
 VMlOIdGAc5tgqY8F7n67LzEHC+W+BiZhSwCVnRcoUsn1zg93Tos4BPZKUMFYxADCiDDa0c5xEzg
 7B+jDigl13Gl6P78uo+QUiHzHpQIzxOIDstW4/2+WMUDhsaXnapyyqXJZ7Tm0mM8vkqHuaG4T8q
 d4/v3DU4zZr/WmhZqAHA8depgm72mz1+tO8xS0TH2gVaqZVQCAqNMNajvQ6pyEFXVGfBT7zNp/e
 b81cbDRJ1eDHRKTb3PfI08lycxvchDt9nm9kAMPb4AJwi09Z5ELUEI+fXcgB5LEatdRsyntKBPZ
 luWJoyQXmTdBTQ9UvFw==
X-Proofpoint-GUID: tAFo8PznEZc0f499nmHM-WwdCcj23j0b
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
	TAGGED_FROM(0.00)[bounces-97625-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: E9C4B289743
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Split the VFE bytes-per-line (BPL) alignment logic into separate
helpers for RDI and PIX paths. RDI is usually aligned on RDI write
engine bus constraint such as 64-bit or 128-bit. But PIX engine
is usually (at least on platform I looked at) based on pixel format.

On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
alignment must be derived from the pixel format. This allows the
pipeline to use camss_format_get_bpl_alignment().

For other platforms, retain the legacy PIX default (16 bytes), until
PIX is properly tested/enabled.

A future improvement would be to remove platform-specific conditionals
from the VFE code and move the alignment requirements into the
per-platform VFE resource data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9c7ad8aa4058..c174c7d706e2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static int vfe_bpl_align(struct vfe_device *vfe)
+static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 {
 	int ret = 8;
 
@@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	return ret;
 }
 
+static int vfe_bpl_align_pix(struct vfe_device *vfe)
+{
+	int ret = 16;
+
+	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
+		/* The alignment/bpl depends solely on the pixel format and is
+		 * computed dynamically in camss_format_get_bpl_alignment().
+		 */
+		ret = 0;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -2085,11 +2104,12 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 
 		video_out->ops = &vfe->video_ops;
-		video_out->bpl_alignment = vfe_bpl_align(vfe);
-		video_out->line_based = 0;
 		if (i == VFE_LINE_PIX) {
-			video_out->bpl_alignment = 16;
+			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
 			video_out->line_based = 1;
+		} else {
+			video_out->bpl_alignment = vfe_bpl_align_rdi(vfe);
+			video_out->line_based = 0;
 		}
 
 		video_out->nformats = vfe->line[i].nformats;
-- 
2.34.1


