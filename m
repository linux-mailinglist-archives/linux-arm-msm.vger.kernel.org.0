Return-Path: <linux-arm-msm+bounces-107061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMHoNFzsAmryygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:01:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9D51D2FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C93EC30268E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680553A6EF5;
	Tue, 12 May 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCPRuTbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeOsVdCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A13A1A3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576155; cv=none; b=AK3bQ6fqh6m7E+yfBMLZlQCWSOVdNfjHKybqkcO6QVFXa065ZJmybELGJ4XuQjCBleJvyvwSuwkHBFe4d2f/tqBNVGy00kDrwV6EROE4TYppfq3k3L/avyX3OTSOlu7cjSEbBoWnfyIEz6phj8szV/CU7d1mVL5ED2fcHmJCBM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576155; c=relaxed/simple;
	bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhAPIpLmaLfj5a152B+eGAeBKi3aZuekdWuJ/w9THwTFosVh95HFgQgvxJBBuuFNEuMspvrcg3Pz/kdrXEm4AAQ4U4VUWCXkrcPwpdNuI8pDDYauGeOcyMBZUOYednCCwSgVlf0ZRFZoArd6lWuz6RI02IWgnVVRYCLKfVahKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCPRuTbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeOsVdCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5BZR53385878
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=; b=bCPRuTbER42E/UE9
	OOIaKNSluSCSc8oGXOuZzfWWG7xRY/Gw6l2j52k59An/324evxY0oZv3SLZY+3yR
	EbIYScW/V9DjE1Ihl6ozZofUV4fGK+PXwg1D4T3ee9vQaCaCy18vtgUTSP6lEdn8
	FpnSROtUdQYER5g8kvGvQyfcQfsrqLXbHCeIY1IeVREZC1dO/D0M+ENtqAre2rHO
	ckkolT9kvxyczB0+yDk/Dk4dzLuqSqfApVD0uaetv9wkJEQ2iKXMWCmE2yd9IvIJ
	DOMw2DKrmrUc7fgOYfQ6J3GbrwFcgWfHJHJl9hWRnQiYCNgx5tVM7VUVPijKKAjY
	4YJjCg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv4j9h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:55:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc977e6aedso27599855ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576141; x=1779180941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=aeOsVdCSNjgNv+yP1iBGVsL0oOzM3QEm8BSjAU0gk40EKEq9phjErcogBZsu953qIZ
         lnmLiU0YAYjUeRk/NceeqTzDJrlfwQq9tr8MWVSlEM7ExjBhJSQENsFe02jIb4RakNQG
         wxuSXNeBPSNA4YhfCD1pIKo6p1Bnua7wz14hd1MYen0+KMw5/ThhQYacZbULBfCae3Zg
         sGF7DJ2VQnjGtOxvh67WL9eYx+CnV/TEscVmwvPwcbkV8Bm0Va6aUV8jMWEI4812vvkC
         ePBvyKvKpzmOf3nwQNQOvDc0sJWoKVhpqMTbFZn6ZzchOnM0GXE005NJCR/X8ybg9pNN
         6yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576141; x=1779180941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=gboDUrHgNPldKIpJ0AdMHZu/aiZBZwIzNHATbnqkGbb3gcmSQ1f85xwrHqfNrSE96w
         76VuQVxiaXjiSAom6WEs6h1HYS1fwc4HaG7DO/LJ/YosZu1Ex0TFFX/W0pjpftQPhY/L
         qJB1pjxWkBqv7j7CErxhvnfeaAUw36+tgvM7gCZDQ2EUsUcH2OAdz+fFl0kb29SPeWiS
         4w9UnIS87J9aoji0A9izmpdvJCgyEwrBNQoTDtDufWMCCV6RSXGVN/yPITzUfoAWaXcp
         llwUEfJ1ACX5kai/rhxdluN4RGMlC3VXMLvRsnm+djoOOAAqyO3l4DEhqAAGyoPh1WB6
         AzRA==
X-Forwarded-Encrypted: i=1; AFNElJ/qVjWBpn1h4CKT7xSCzR9HbxeuZT1YksKIyQ3NLcKUM0SoqiUe3X8U9Dk3HUY5RDBcvbwJCP9lyFzZ3UGA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3W42CGMLJh46LyN/8izjU1SllT35Molxmd61BIzNUVrupNYIG
	5dsp6tJVQ4n1sQtvgfFCM72wNFS4xrbvQJfjuyZHXgj2vqbXWOZCac3sHcevFPb4SeMKNrAg8kB
	4aASSuO3UqtADzhZwf3gtWxsVmF7XIdOvNeBEfUYeQ47iHDHVqkAXhe4dmiSnrvlREyEF
X-Gm-Gg: Acq92OEgPKoS8NIYcTGzt/mmBRydaFhH2KoeykCUIrRoZiQjaqsUU2ZSY8HvXa/c/k2
	TaxBGUmGwYsrA/4746J7dk3s/M6mj262wpopdIQFphylCTnT7dUOd3592tfcIhu5F6Y7KNwXm4I
	tzEtmXRloj/+nspqK8aYO8Ak/9MQrttvFEIbnOz2Wm1lcQAm77ODvYoErcizaS6RRPtMP20CLve
	5ohwqCd2WpJp9kbx+pv+Tyv0vkMrMmvf0ziwz8NZqnknrNUw2O23+WcfmTtDtekhOsLV5/7meHC
	akf8X9D4LlgJQskx5yz7tJU/cUZy0RGLk15JGmJoTpGFgYsXs5qSKjpudYq+5C4l4KBRkSIeqIr
	OnPuz2X2CM13IvWix6nTb0C6klTRoKPEAUb/VGijisI1c0GrWz7DO6fKKXbxcKj5qZ67jfEAGeL
	I05UMG4sJN6X+2D0HESpAz
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr194198145ad.4.1778576141218;
        Tue, 12 May 2026 01:55:41 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr194197905ad.4.1778576140685;
        Tue, 12 May 2026 01:55:40 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm127641405ad.66.2026.05.12.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:55:40 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:55:15 +0800
Subject: [PATCH v7 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-batch2_features-v7-6-4954e3b4df84@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
In-Reply-To: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576115; l=1573;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
 b=ZXeyI65zFtdp23qlYf2KAxFXLl1xjBxlL3/tg6yVFNX9ZR3a3z/EKsXyY3Zqee9uqB1G4m3de
 5Ef3W3wqNo3AF3E8KSeagGYIJ7d+RjJnfOFYQZyRh7a5Gc0qShLV51t
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=ZrTd7d7G c=1 sm=1 tr=0 ts=6a02eb0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfX8+LOUj8UcZF2
 3JDmclzZEAR9Zxn6YS0koe5ahL/K0NdXUCNjorTH84R5BM3c/vwTQSnh/isKLfNoZ83KVSHL01r
 lS0swOpcixO+DmRN1AOVq5VkukRK/vRQYCPDEV3Vc/bpzq+phkoY0ZeODxMMPfhMe3j0twY0IbZ
 FySyR4OwhJ1G1JyNNldHWj2ZZBNxY9Ncto+BlKzk02VuJDEmUJVq1NeL2JS2MgGOi6gNi5eiBxg
 SQ1oG2bxT3mK3UZKTBL+GcLkwPiScm18XcBVUUpB8eUgMmAw6CsDzJJIuSvLDD0XwB/E0NHM/gw
 h2LxMRDx7qoJ7g18DXFAgTrDU9eDi0YRJ6NmWFS1Ueh9JSNjvjrLEYsprREP00bgaUIdgA/pSiM
 kyFj9wMs3rRjIOuymXqPqgnZZKTe9lkEusY1EuZjX7OKQPUrl1n6fKxnfy4u1Z7urcYMam1lhvS
 GXVEPofg8N83XxKXOsg==
X-Proofpoint-ORIG-GUID: TxuUizj2nv623BYsrdhm1AbfHNmE3D4L
X-Proofpoint-GUID: TxuUizj2nv623BYsrdhm1AbfHNmE3D4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120090
X-Rspamd-Queue-Id: 7BC9D51D2FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107061-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Unify AVC/HEVC handling by computing codec and lcu_size upfront.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index c2cd4adc082394a9ab6f32a37fe4e57678019d89..f55db869fee4d64273763fd3f98d286f58e2e7b1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1014,16 +1014,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = hfi_buffer_get_recon_count(inst);
-	u32 lcu_size = 16;
+	u32 codec, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	codec = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, codec);
 }
 
 static inline

-- 
2.43.0


