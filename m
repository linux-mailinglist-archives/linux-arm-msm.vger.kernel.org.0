Return-Path: <linux-arm-msm+bounces-91988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHAuLGajhWmSEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:16:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E59FB586
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 09:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 573D13063A35
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 08:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33660346E5D;
	Fri,  6 Feb 2026 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA813PFF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ys4JozH5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158F346E4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365583; cv=none; b=cVOlLj1lQx3FYE0lCdXT7ZfjrQu1my5DulciSwiQSBTGK1AIAbss8XaziVrZFxuFANIXnT413hZA1n2C3wiK5j6jQvEBntxRFeKSopPPCsJQ5SSlq+djivl4kwPXkmrd+vp1W5biDPi6vKIeiXrI4bTf8XrYcrT8fdyF/O0nJSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365583; c=relaxed/simple;
	bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IR2jpZbOpB95O0DZkd+znqbTMuIRbcAaNgh+5RykkvfA/Sl/96NYsGtZOqZdV9fkb+XcjNBTqHc/yFlfiFqmk/f6uQ71Oravl9Rb5MxPxcYhCuKGYFcua1ygSGaa0F7UFv4oxVFkcAE7bfb980QlpOhBHC49y2OqF63FCPG3Q8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA813PFF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ys4JozH5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XfEa1852738
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 08:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=; b=lA813PFF+miNofoW
	RNKoSqkNbIaSnL7oVldgrFcOB5Py+KSQ/N/OGEjhnRdNdUTM5kS/Z+1IXiuefZnr
	Ucd6DGC0uYWSyi9SKngMNEM52ufbQQGJZk++X7PCLHF4FIKtMaHNItT3TVevVvVJ
	AkDPsrVOx7SDBkA8IDxVlcpkrpD8x6ngrmYA4qrV6fCjPscHsWTmSxzuZ8b1Ozb6
	1KfSbOQ5dkUblYRSh5v7FoT4LQ+k/n8M/A0iK5jcYuHc2sr1S5DPeZDfWhIlKX+/
	/QzAjFikmsDXCQ3hUHzKfyCxZ6yhEl16posZwUXZBuyKi4tt2D2KoPLPKOEG9CIP
	Wuh5/w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c1483qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 08:13:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81e81fbbb8cso1863143b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 00:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770365581; x=1770970381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=Ys4JozH5LscH6E5gCdWwcZxZGlcVjCf2rCukOIYcX/WwaWcNIA6p3qphM3MILKK0Vb
         hy1vWmgRGZ2T/ew2VwUNLeUPkk1Y/HXmzAbwrULHp7HeVuDwDTELFHcUqhM7LkcvL297
         nymEzxN24gz04KvsQLyPat9/6jg72OI620JiqBrUYuwloXXlSuZZ+wrmcFOcTZoh+r2p
         osN9f7L5gBdntNns2UvSbG28GvdswGRDn5eSwQpvEIXJ6XhO7HXOll7J6bBuh3HFqTRt
         aIR/Xy706x1/ZAAuQIJmvs12Kin2phgeBZj6vDjt1QDf8j0Ed3/RCdbyKm/YFfCrLC/P
         Myww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770365581; x=1770970381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAKBWAJ2X/2OLZYyocKi+WlPjuToeQEsQ6K7eCRcW5A=;
        b=xDvV9QR/T1Kw84U4f/6ctbqpm5s9JUaUfemLyFXMW0lEQ2GqM6BFpY+rsZiCkuBvao
         tsX1tjwt57epVhdxokF9KrFC0zGBeHxM9yZwJKVycNOehYQm6y6biCnXoxEQcRYARC4Z
         taFf9TuCaoaptAFlir06u4xQHvIVB+m/HvWHJ7e1CKvmnjA20jnrPZMWvLhHU55sZkZY
         8+8JwkVcfqoDoN7aD6skG2dTct1OLqI6FqWIf9epfvBIAcRk+S8WneT79l4ZE12tuX0t
         Z70trmyhErPZcPLIQjGLQLADGGzW1VLebD2k5zkhhscfJ5e3QInj11HNiUPe4QW71Vja
         dr9g==
X-Forwarded-Encrypted: i=1; AJvYcCWKsFdClnqtojdLydxTiIv/s06olyVLMIYAes5MtB4BDKw6Zv6e4PJQ31p7lme0mozO0b+aops9Oy/wMsXc@vger.kernel.org
X-Gm-Message-State: AOJu0YzHlfG7+t4swD0UtLkaV7E5wegwbj3zdOQvZAWTPjFkVfofxl70
	UZimeXmRvaiSnixV//P2cSxx14/jUuOQbz17CkDXE3XNa0pPchovLbtlfKhaCQsA/ykg/nlnyDv
	P32aKc3fS3xlt7fpyMFXfHY47vQmSrHwjbx6hJUGgohZdb0nGDfWb3YIYeyBZAOUmjnIj
X-Gm-Gg: AZuq6aJGWG8N7YnOHKtUTaTvyR1BYAycg/PvACzOkqTpPYp9uMqtUv/+YhFyQkhkic1
	hDWRznIojnPFWX6fCdlnVX8piG3fioy3hOsW/IngoFYOqAFX0DK9A20DSJwHQl5MqqpwVByBzHi
	3jpImNF2rOSZVuXvK1VXxyV6oy5R1wykTxmlBjV+0RyH4R2t7YlhOUe89dzPL0reNOJmIQw/ZlU
	RNU3bCzNxojdSDOILdcmvfLXAB9et4U6dNrIeo4Vu/tq97sr5Dq9HP9Uqhp0rz/5TyvvcBfuVol
	4TPhAdso+c5VNeKYkcaiMxhD3lO+wAFqjsorvkz88cE7Ltxrq0iQYVFldmx+eYFk/t954jjirbf
	X/AeiJ3tieOpikcurBtRqp5av0eyQjQnprIcVEVU8qm9mBYpt99EhmPxDJmyBVhbefdPOyIgDAp
	TVuHwhG3tR
X-Received: by 2002:a05:6a00:3cd6:b0:7e8:4398:b360 with SMTP id d2e1a72fcca58-8244176508emr1821989b3a.51.1770365581502;
        Fri, 06 Feb 2026 00:13:01 -0800 (PST)
X-Received: by 2002:a05:6a00:3cd6:b0:7e8:4398:b360 with SMTP id d2e1a72fcca58-8244176508emr1821962b3a.51.1770365580997;
        Fri, 06 Feb 2026 00:13:00 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm1671866b3a.39.2026.02.06.00.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:13:00 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 16:12:15 +0800
Subject: [PATCH v5 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-batch2_iris_encoder_enhancements-v5-6-fb75ed8fa375@oss.qualcomm.com>
References: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
In-Reply-To: <20260206-batch2_iris_encoder_enhancements-v5-0-fb75ed8fa375@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770365554; l=1573;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=W5OCjv9SAZMljCuLBN/Nsa8uVEm2rVmAfFav+iwZiDc=;
 b=8Pwd94POKjzk2YJ0Y1RveUPhiz9MnuPpuHaeqbg0WEhmodzZSW5/+92doGwTk0BHmMjAuq+Eu
 I/g+73l0wuIAdkN+Bl0BHBq8niNAp47mpBvjr9fxWfVpXZg/GhOCYGD
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985a28e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA1MiBTYWx0ZWRfX+rFgBiqkaTg8
 UZcBcgtqsKqpGCRpU36d02Xnpehlc0MT6N5wDePXFOYqQ4jH5yFLqkqeJXj4YaDVNPlgX6adTeT
 d1i/F/xzdROr9KCNLF2m83Sz9lhcfb/MsyfpPuKRMxZpvQqK2faPqpRRMFPRlsvdbHdpQnNzXW9
 3qbfeAXM2paeH+BooIewN69xfrmksTGFTV49pZkJO2COe1eD4qvrZyoMs6+QjV0O91L65mWuBgF
 OnShclIKIPghbVTYWvl3MwxPzXIqlAxg2MeQhn81VGtgiApIcdl+IgvKGoLOXhprvgYRvMJUiS3
 euyj1GDn70+LA/wBnlgnPMmn5wxcljyOiX/7Ye5xmKZxJ+evFIi+wzw+HkSwAKWJZe14mECfcqh
 c7v9s3ZtNy0GDus/5ySQsamEwwhPMtEEea69rgxQ2DdHGStRPPd+k0/671SwNr5jJxoANf7j1jF
 G/o6tym0aqfK3MlXiSQ==
X-Proofpoint-ORIG-GUID: gP84BZFGgtD8Dxswe3sT9QLssB8uPs2m
X-Proofpoint-GUID: gP84BZFGgtD8Dxswe3sT9QLssB8uPs2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91988-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16E59FB586
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


