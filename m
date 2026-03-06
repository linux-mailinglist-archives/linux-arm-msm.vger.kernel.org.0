Return-Path: <linux-arm-msm+bounces-95703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDZhDvlGqmnxOQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:16:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EC21AF4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FED33012267
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 03:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4E336AB7E;
	Fri,  6 Mar 2026 03:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9Wpcb4S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/hzSmd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AAF2D7DE1
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 03:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772766912; cv=none; b=q55/3LgbGtCaWUDFUB9kggKiVFF7ekdY/Nw03Vb0XVthEcsmfHUCMJ4cT7Ip1xzTlbyuU8tOhomA6XhmbecisRAj3JB1wwlqcWZ5NYvgFrP/KgYzXm1c56WpQRtJlYdE4i4QUv33elVsSD/o3DfzuB6WRxBvsyRoKNPIMZ4i5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772766912; c=relaxed/simple;
	bh=+saMSvsJY6mVD9QU0OTzOwKazBDuFAb+H2lS6aaGlIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCbubh7a+r6eQEK277mnZQ3Ehujyusc/YWYD1C/5NpV+9ilHdlonmN3Wu+fs8hbVWtOy+va+hBSp7q6VYOvwxwY1sYN9IRu68n8f6GrD4gcu4aicp4gjuHqFUnJgAzsRq3DJ8qbDaJe8STlM9VZIxq+Hc2G8uRn43C5l13Me2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9Wpcb4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/hzSmd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmaas3136527
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 03:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wb0RowlXX3BwSjJGetpaGFa/hxWRGmgzMfSpVsngYC8=; b=f9Wpcb4SS+3OdaSO
	ax0KQwFAGb1LS8t2DSmmm2S7IE05XINLFMC59+VjAqCIXo/MEJkP1MwRa28CGaZy
	jKMWqtgO2g5EJoHEJvdqGG0oL6YtRj/XFcstUauje4c2p6k2R2tJXW5qJTz8WvX3
	zANoDT58QS/3XJqjn69XnDJEzF7UGqBsM3ANs1qzK+EajR98JJH62VMR5ujG2Rxo
	1mqhGaLVWpQP4XdNRu7+0YxXUVnu6bvrzRy02xK5U97G6ZXt35fKp6XjvZz2f+U5
	aknM+bhyJHhilb2zlZ0auk5eykNN3LAKzjYeMbkIMxF9+6K+1Y94AR9QnY139H8T
	aFd06g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk4bpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 03:15:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be27d4e3e5so13389242eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 19:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772766856; x=1773371656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wb0RowlXX3BwSjJGetpaGFa/hxWRGmgzMfSpVsngYC8=;
        b=D/hzSmd8AP1QtKFS4yAqf6j8xOxjtR1+7/6BBTFPya3e6bEMgOWdNczRsMYbH8jpAL
         GP+PFF6+b2JzQUS6WFzJpvZhKp+so3GG3hkqGH7p6LmQ8JI8lRgSCNdsQbIlAONCbyGj
         CTnwggunHdUbXJYnhH24snUC2Xi0juDr1v8zSlOo0KRcYZ3cgRUKHFJDMVGw9JrhXIsD
         0Ciiu7O/U/dLcpoYGXJ03hYvLcIVTf+Xy13apmx/5K1S5HYlTARvdyX7Fbhki6qU9W6P
         vOxaESCUM+gQfb1BPx4k9EMSoh/lD3Ipr85akCQL1FhgSn67eIn34FxQI9OhddZMONq7
         dljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772766856; x=1773371656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wb0RowlXX3BwSjJGetpaGFa/hxWRGmgzMfSpVsngYC8=;
        b=VquyoFU4TkmQKMLZV2aleVivowIRvj4gTcAwixE2K1tuvgyfA56Y/C+yRXGHK861lI
         gwFHsbTQF4WoG9nbrD34U0Pph6JcCRlxDQYX15JLTnzP3QXZIxWYsFZ5Z+LwDaQiPvyY
         FRI5NMtCht+5T2cgS0ADNFgx1FxQ4CH2X9FczgrQH/d4nUORV0zZsiFoDKhB3TJssyoN
         BdcjxOc2LpFxEnp5V5VBj5pwBnG6Dh3/cMgaR9igkFpRKhtJsDEa7fmJKiX5zCfRgETd
         dEV3UIwiDTQdoZW+Cjhg/zAy4F6zDgs95dmY94SCqs1BPG3GHjYnzahQsvslxsBpuvoU
         xNWw==
X-Gm-Message-State: AOJu0YxAp1c2BfuiAzU5yeXJvpD/hwdekfhy7SXopX7KcFY+j7Uxa+RQ
	BKp9DseA3M3AOTOmH6RivyyCjGgs0dmFNNHmm4aPjYKBot3/+uL91vZMlKGAHavV8G8ItL7RerG
	droW1Y0MD2+smvJ4EhQ1YrQ0YqiRAsY0fmg2y3TIDHFY57zZUmy3OglHecqGm+T06vLU=
X-Gm-Gg: ATEYQzwC0Tu/g6vfz3Uxr5VeXWkG723RudzZujdGebCRuJTUBB32iwRednxPdA3QlIh
	OcooujXrTVTlfTrll2PadjuqFBmCWajFZEjhVGiaI4MMBJAVgr2ENPDYNaCEu464E4Kjk+HPUDG
	X2bejRO/ILjFdrbMiMRiAYcIYufGkLgtMEydGlWmQaY1YxlVRtUevU62F3u0IuK53/N9Kh5PK8X
	bMFDwF5vAOM3h/IPTcyx211D3A/QuQ6uz//Q00lPRTmLXFF+sWEq9P5/kx5caSenPx+Un4wRTDu
	r5/NMAakx3HSQ856CEaMHjjYJ0oyAotIVwPiWEq2HpKNKgF4h3CAU2N5I6WPQiYZpLEANMDERvw
	EH4vCpF/m5NUTBPGCytMJ0wbhIG71wNqnMa/1wg67KEXc2AhcPFATLba/4xGAgmYEKOiDQ8Y6Yw
	==
X-Received: by 2002:a05:7300:2393:b0:2be:2912:ff66 with SMTP id 5a478bee46e88-2be4e02bf42mr417252eec.25.1772766855710;
        Thu, 05 Mar 2026 19:14:15 -0800 (PST)
X-Received: by 2002:a05:7300:2393:b0:2be:2912:ff66 with SMTP id 5a478bee46e88-2be4e02bf42mr417224eec.25.1772766854852;
        Thu, 05 Mar 2026 19:14:14 -0800 (PST)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82b1d3sm197839eec.11.2026.03.05.19.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:14:14 -0800 (PST)
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 19:12:05 -0800
Subject: [PATCH 1/2] soc: qcom: llcc: Add per-slice counter and common llcc
 slice descriptor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-external_llcc_changes1set-v1-1-6347e52e648e@oss.qualcomm.com>
References: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
In-Reply-To: <20260305-external_llcc_changes1set-v1-0-6347e52e648e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772766853; l=6960;
 i=francisco.ruiz@oss.qualcomm.com; s=20260305; h=from:subject:message-id;
 bh=b8ChikLHsWId/I8qgj89+yZl5hIW8YyLKIwiSgXH8+8=;
 b=g1t+/M3UjMwRuSFA58OKBOBWuAlAXTHn0UOyzSN0Py85Cfxq8LXIRddO5VTT6D3G9cRTfxNnE
 gawGSWZ95lUCfIMmEtwKfjz11XKYfQfBCIvSleALH2ls4Qngxyg5gZs
X-Developer-Key: i=francisco.ruiz@oss.qualcomm.com; a=ed25519;
 pk=Gcv2CX7iHozjnQ4oK+9fINmBiQTmVC4SpaZzoM63CHE=
X-Proofpoint-ORIG-GUID: cBsNQ-6yhdJSZEqUawOzdwQf8IHEjevg
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69aa46bb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yKi7PR63AOroTQ6r2rwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: cBsNQ-6yhdJSZEqUawOzdwQf8IHEjevg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDAyOSBTYWx0ZWRfX8LoMlmJp7TXl
 eJk+A0I6M9/tY7MiHHyBTW15Nqt11mWQhrzYJ1m/TJZR0NwwCdWEWBwxb7Ln67VKTjhcjKFHoLR
 BKlgQHbOUqqlAa7blJ8p9GdGNLYyGT5fEOJKMKOGq71Cn3rzi1+Ysj8qOe3K0GpOquOnXQhqgWF
 YJVskTK1lzGQ8QQQJP3yeyWUNHFeCL+JHOMutqgQeRCaYPbni99JCAV2j1TUpSbrpjm/RfTxnWQ
 9uhasLyfI3sC+UOOoD4QN4vGGS64Nz8IqCgszFtJJmKPyosBicOaWI47WAzqO26Ud012a7UzYsu
 kFNSLX095EnmJIpuI2oONQEXvSRQM1+PxYq3nq8LYb2rtZzdbcFzd5kbKMOoXt9Bplx5/cjXBDC
 1T4UJMw+0H6/e2f2A+3PQHB18IAKa3RBRPD+2u/sbe5CwGlxFXIzdwBALuBlPP+9gbtq2jg6Uh7
 IaF6ol6i+K8RpTYrPvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060029
X-Rspamd-Queue-Id: 8F7EC21AF4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95703-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[francisco.ruiz@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

Fix incorrect slice activation/deactivation accounting by replacing the
bitmap-based activation tracking with per-slice atomic reference counters.
This resolves mismatches that occur when multiple client drivers vote for
the same slice or when llcc_slice_getd() is called multiple times.

As part of this fix, simplify slice descriptor handling by eliminating
dynamic allocation. llcc_slice_getd() now returns a pointer to a
preallocated descriptor, removing the need for repeated allocation/free
cycles and ensuring consistent reference tracking across all users.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 57 +++++++++++++++++++-------------------
 include/linux/soc/qcom/llcc-qcom.h |  8 +++---
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index ad5899d083f3..2e7f05df93a6 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
@@ -4431,8 +4430,7 @@ static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 {
 	const struct llcc_slice_config *cfg;
-	struct llcc_slice_desc *desc;
-	u32 sz, count;
+	u32 sz, i;
 
 	if (IS_ERR(drv_data))
 		return ERR_CAST(drv_data);
@@ -4440,21 +4438,14 @@ struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 	cfg = drv_data->cfg;
 	sz = drv_data->cfg_size;
 
-	for (count = 0; cfg && count < sz; count++, cfg++)
+	for (i = 0; cfg && i < sz; i++, cfg++)
 		if (cfg->usecase_id == uid)
 			break;
 
-	if (count == sz || !cfg)
+	if (i == sz)
 		return ERR_PTR(-ENODEV);
 
-	desc = kzalloc_obj(*desc);
-	if (!desc)
-		return ERR_PTR(-ENOMEM);
-
-	desc->slice_id = cfg->slice_id;
-	desc->slice_size = cfg->max_cap;
-
-	return desc;
+	return &drv_data->desc[i];
 }
 EXPORT_SYMBOL_GPL(llcc_slice_getd);
 
@@ -4465,7 +4456,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_getd);
 void llcc_slice_putd(struct llcc_slice_desc *desc)
 {
 	if (!IS_ERR_OR_NULL(desc))
-		kfree(desc);
+		return;
 }
 EXPORT_SYMBOL_GPL(llcc_slice_putd);
 
@@ -4541,7 +4532,8 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 		return -EINVAL;
 
 	mutex_lock(&drv_data->lock);
-	if (test_bit(desc->slice_id, drv_data->bitmap)) {
+	/* Already active; try to take another reference. */
+	if (refcount_inc_not_zero(&desc->refcount)) {
 		mutex_unlock(&drv_data->lock);
 		return 0;
 	}
@@ -4555,7 +4547,8 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 		return ret;
 	}
 
-	__set_bit(desc->slice_id, drv_data->bitmap);
+	/* Set first reference */
+	refcount_set(&desc->refcount, 1);
 	mutex_unlock(&drv_data->lock);
 
 	return ret;
@@ -4581,10 +4574,12 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 		return -EINVAL;
 
 	mutex_lock(&drv_data->lock);
-	if (!test_bit(desc->slice_id, drv_data->bitmap)) {
+	/* refcount > 1, drop one ref and we’re done. */
+	if (refcount_dec_not_one(&desc->refcount)) {
 		mutex_unlock(&drv_data->lock);
 		return 0;
 	}
+
 	act_ctrl_val = ACT_CTRL_OPCODE_DEACTIVATE << ACT_CTRL_OPCODE_SHIFT;
 
 	ret = llcc_update_act_ctrl(desc->slice_id, act_ctrl_val,
@@ -4594,7 +4589,8 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 		return ret;
 	}
 
-	__clear_bit(desc->slice_id, drv_data->bitmap);
+	/* Finalize: atomically transition 1 -> 0 */
+	WARN_ON_ONCE(!refcount_dec_if_one(&desc->refcount));
 	mutex_unlock(&drv_data->lock);
 
 	return ret;
@@ -4638,7 +4634,7 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	u32 attr1_val;
 	u32 attr0_val;
 	u32 max_cap_cacheline;
-	struct llcc_slice_desc desc;
+	struct llcc_slice_desc *desc;
 
 	attr1_val = config->cache_mode;
 	attr1_val |= config->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
@@ -4787,8 +4783,11 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	}
 
 	if (config->activate_on_init) {
-		desc.slice_id = config->slice_id;
-		ret = llcc_slice_activate(&desc);
+		desc = llcc_slice_getd(config->usecase_id);
+		if (IS_ERR(desc))
+			return PTR_ERR(desc);
+
+		ret = llcc_slice_activate(desc);
 	}
 
 	return ret;
@@ -5101,18 +5100,18 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	llcc_cfg = cfg->sct_data;
 	sz = cfg->size;
-
-	for (i = 0; i < sz; i++)
-		if (llcc_cfg[i].slice_id > drv_data->max_slices)
-			drv_data->max_slices = llcc_cfg[i].slice_id;
-
-	drv_data->bitmap = devm_bitmap_zalloc(dev, drv_data->max_slices,
-					      GFP_KERNEL);
-	if (!drv_data->bitmap) {
+	drv_data->desc = devm_kcalloc(dev, sz, sizeof(struct llcc_slice_desc), GFP_KERNEL);
+	if (!drv_data->desc) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
+	for (i = 0; i < sz; i++) {
+		drv_data->desc[i].slice_id = llcc_cfg[i].slice_id;
+		drv_data->desc[i].slice_size = llcc_cfg[i].max_cap;
+		refcount_set(&drv_data->desc[i].refcount, 0);
+	}
+
 	drv_data->cfg = llcc_cfg;
 	drv_data->cfg_size = sz;
 	drv_data->edac_reg_offset = cfg->edac_reg_offset;
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 8243ab3a12a8..227125d84318 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -91,10 +91,12 @@
  * struct llcc_slice_desc - Cache slice descriptor
  * @slice_id: llcc slice id
  * @slice_size: Size allocated for the llcc slice
+ * @refcount: Atomic counter to track activate/deactivate calls
  */
 struct llcc_slice_desc {
 	u32 slice_id;
 	size_t slice_size;
+	refcount_t refcount;
 };
 
 /**
@@ -152,11 +154,10 @@ struct llcc_edac_reg_offset {
  * @edac_reg_offset: Offset of the LLCC EDAC registers
  * @lock: mutex associated with each slice
  * @cfg_size: size of the config data table
- * @max_slices: max slices as read from device tree
  * @num_banks: Number of llcc banks
- * @bitmap: Bit map to track the active slice ids
  * @ecc_irq: interrupt for llcc cache error detection and reporting
  * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
+ * @desc: Array pointer of pre-allocated LLCC slice descriptors
  * @version: Indicates the LLCC version
  */
 struct llcc_drv_data {
@@ -167,12 +168,11 @@ struct llcc_drv_data {
 	const struct llcc_edac_reg_offset *edac_reg_offset;
 	struct mutex lock;
 	u32 cfg_size;
-	u32 max_slices;
 	u32 num_banks;
-	unsigned long *bitmap;
 	int ecc_irq;
 	bool ecc_irq_configured;
 	u32 version;
+	struct llcc_slice_desc *desc;
 };
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)

-- 
2.34.1


