Return-Path: <linux-arm-msm+bounces-81748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE2C5B119
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EC973AFA93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B607258CF0;
	Fri, 14 Nov 2025 03:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qfw97WfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en2xc0q0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB35256C61
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089870; cv=none; b=TRrN11E7DOnTRlP16ytYU38LIebEZ3az1aFEFGippIgkoZTYDJOMRFFK8/A4n5x2C9ubeq+8QxAi3pVGVpZHJuZ2gyl9NG+3kMqe7jnx5eQJ0BsIWbXpRAZlNcgGG+tc6i3Qk54ihDGRBlP8OUHdcV6rR9i7pSMrgvOkxXPAwjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089870; c=relaxed/simple;
	bh=E/3i2/+44CedmRS8ulf2O/Swxg+3oJwtmc68sYT+BcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elwmX1cEL4x5Aqcd/dsfODjkddP8emoSVI3dEKFLt/nZ24UUFwaEdRw7Hz+T2o7kyH+03ZSVpnDG53a7nGn8gawt8B2bTGFPgM7sFzd1FQqELqyH4tz4uoVRNDH1bhZHpeHh+OKyeO5CMvjFVUeN3y+A/CgMjXMwuh2OkJvC7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qfw97WfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en2xc0q0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMak4t1745319
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLwsNIV9PC6cPYdCEvfzQ1SasdDd3Px68Ca5i3GYDSg=; b=Qfw97WfUpZrU3nN5
	jkPHO6ggbAxkm9RHUn/YY0/cuQUvessZZKz9JKgkuzs8jay056miatKM2h5q3561
	9aavkcIPbzeKFPmIsSCWENRb25O1xzKidxDejW8Gkh8IEkfLYK2kAFWN6W2ECOpH
	jC/R9oKiKGL0OWAvEPl3ZDGBWzGccAd8VhUFo93zAMx7z2xhxJ1MAJqUK1YaPmdG
	f0OX69tlZq+FCx7lL6I3Mk2lQez8O2uJ8iY8F6Kg+uhWDhYsjdS9YJTOWWpih6yA
	I7whzi8XB3oxwADLutoQSwncyK8m4BjkVV/RFZ/+PTxN4uO3nFaET75QfUhRXp4G
	Et45pg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9egmms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so1290644b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089866; x=1763694666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwsNIV9PC6cPYdCEvfzQ1SasdDd3Px68Ca5i3GYDSg=;
        b=en2xc0q0rJX9mIorSB++hN+bU1UIIIxdorCtThVj/q+IaxeSwSL14hsXsLumC5/vfv
         9zI5Wh2rKJBRamGEU69TC7gaVYXg8NEpOCaBWHwy2NCEuGM5/laAowSpqE18Gi15aA8/
         DUVd997H++5Oxbrzpuktcl5Q85kj5j3owAve0zc62lFj0R2geU7EJfpa39vsPBBInR//
         zXhFtAm03QVrfb+NZe5Sy2vLHMmlnfcfZhx0NSjfaA4m0Q+WOdmZSfmmHQDmEHWsh58d
         jxgvED/wxUr9tCq6sZCSKnPG3XBFMyF7XcoZR8D5lxHHML+Aq6GuuDo5TGA5chjk4BoO
         LNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089866; x=1763694666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLwsNIV9PC6cPYdCEvfzQ1SasdDd3Px68Ca5i3GYDSg=;
        b=wZXZhmWuOQJqTGsydecs5apHsmeEr9hvV9e2RUB0BaS0BkNEELkjfy4MsMMEFCDT7u
         BcYa7hcm9FG3c/BLbGLSS8xb26jD2djVv0y2rNYX1UtnPHD/9YTgVuPvQvKyV41z6LX8
         aL6NKTiQvrKviMqZJHE7jJ4c3ijF3COZT6AupAMAwcELti8z8W8uoEPaNXot3lURjTsy
         4vEzl14bl15I0aoNbI/aBeZIs0auEBvE3KAXFxnzoE4c5caHDDRfUr2FvY4KCosi1bs2
         swZIoWB+k2s9tN7oAamtcQUuhIkZh/JSm+yp1CIuWb3LN18ZnRNj0oHp6fVJe5lZH/u1
         usTw==
X-Forwarded-Encrypted: i=1; AJvYcCV6iugjSja+MOmhKzbnQzKprfTGq+uDPZJoJ9WYZiN0jCMA+x4x15C2uH3VcMy4+47ADYchOAVcaFTGIRsX@vger.kernel.org
X-Gm-Message-State: AOJu0YxW26vhjmRrG3vVzVBZnA+T8WHKibJ0Mlz2tIr8BqtHapfjlZzE
	RBrQDMJ3VMkZ6M98qpTT5w73dUdD087WUB3+A3naelwsdd1TjpmyKd2p4ocmtCmyWTH/U6KAJMP
	Z8+WGV1xRQK36cKnMrGVC/dx6ghb/jPyaq8iCtvbraVJrfOKf0NKm29mkPXFDizTNGmmO
X-Gm-Gg: ASbGncv+FniZNGHwRx1M008EAjLKgI/C1+TCQbAUXifwibUV4Sfo/L3IZsgAyEHsS8w
	rtolYirkuRmQWZms89e4nlCn9rVEr+iwSL01jL32Xz9RDwuli4XiMeYeTfXEww/TKMpZkJuxV39
	aFofc0GPKgL6jGMOisHkgb6szpCvCu2//rNbACznGLawxpm6uvNjTMng8HZCxHs2yRdROngy3Zm
	GsGwSv8Se6+Jt7umOeuxMDwWuFsKE9ULRy5NX7y5ychGmUZdvyQVWnclKIsj6TFVisYt/iH5YS/
	D+n6Y5LUVjiXKAnVdaer2pwaTCEreCWvil75sEFg6R5ejTQSIUkPiSY7CrpAsMiMQ0IVXsm1woO
	XJoFPN5vjR69WW53u2gkKT1Y7XBOQv9rqPMAZMSsgkYv43N2AI8H8U6EOiTK/ct3IIYiY1nPSQL
	AuIH/cAdbs
X-Received: by 2002:a05:6a00:3cc8:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ba39b79f58mr2163414b3a.4.1763089866375;
        Thu, 13 Nov 2025 19:11:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr7nQFy4/LctFwnJ5En2cKeocm+jGZ6Z/wTsYu/Reba5o1kThs3DdudFabVI+prksf4UMa+Q==
X-Received: by 2002:a05:6a00:3cc8:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ba39b79f58mr2163376b3a.4.1763089865839;
        Thu, 13 Nov 2025 19:11:05 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:05 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:08:58 +0800
Subject: [PATCH v6 1/6] media: qcom: iris: Improve format alignment for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-1-d6d35a92635d@oss.qualcomm.com>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
In-Reply-To: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=3515;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=E/3i2/+44CedmRS8ulf2O/Swxg+3oJwtmc68sYT+BcE=;
 b=1WeoDxJJIk46lr5wsCFUzv/qO6WmQtRwp8Ixt8LOraZVcuthYtKkCSYHJN8b2vo7OG340CptB
 m2wf0zmWpKcCdlUH4XxAypPjD6caEZtkuYD9ORw2Fk1BAM6tA/ZZ89b
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMiBTYWx0ZWRfX56HouswrSns7
 z3fk8rZbJIOyGIVY8pjCbZnaMX+/yQg7nHgcWzDaCqF5bhOr8tGFTUYfqXBsKd4z85Rnrh6qsGU
 gX5HfAtMNjF37jV3dF+7BvC0CFIOl0YUnCOWq3ZkwwLGu/uZYSstYuztByRI0ZddQBWBJ4j1M6H
 IWMR7UCz4C69JBTaA6HMlyWn+0vmNt9hpi0cx5KHRuMZEN4VK7mAERMamR3LpyOhIDPp4Xrfk5V
 8izxv8fOuA9EkE9fBJYTNqwekXGLTQBC2JHIqUB+Av0XX0bmarUtiBZ3ff//nDyNJy8k7DZ3ZGK
 MvIfk9MYyEmsFjl7mrOnsLuHI7FNPdq5jKGTvDfAQFbWIzVPzy0RSyteKWdHAKAlLLx2G920k9P
 D0I7j1G9rCKuyn0pPlu29SpMSkRk3g==
X-Proofpoint-ORIG-GUID: 43QPYJeQpTVIQey2ytgyK5cP7mBgVFrA
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69169dcb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Ydk8v881x4eQe87C_TwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 43QPYJeQpTVIQey2ytgyK5cP7mBgVFrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140022

Add members enc_raw_width, enc_raw_height to the struct iris_inst to
support codec alignment requirements.

HFI_PROP_RAW_RESOLUTION needs to be set to the actual YUV resolution.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +--
 drivers/media/platform/qcom/iris/iris_instance.h         | 4 ++++
 drivers/media/platform/qcom/iris/iris_venc.c             | 6 ++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..b5ae3d4745c6a7b354ab8907aacd532b81b48aab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -168,8 +168,7 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
 
 static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
 {
-	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
-		inst->fmt_src->fmt.pix_mp.height;
+	u32 resolution = inst->enc_raw_width << 16 | inst->enc_raw_height;
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 
 	return iris_hfi_gen2_session_set_property(inst,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 62fbb30691ff967212022308fa53ff221fa24ce9..a95244cf6d30cd81199b9f1e51bf64c991be1790 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -69,6 +69,8 @@ struct iris_fmt {
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
+ * @enc_raw_width: source image width for encoder instance
+ * @enc_raw_height: source image height for encoder instance
  */
 
 struct iris_inst {
@@ -107,6 +109,8 @@ struct iris_inst {
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
+	u32				enc_raw_width;
+	u32				enc_raw_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 5830eba93c68b27fa9db87bac63a691eaca338d2..07ffcd4d20969c8c33084dc8b03156913e8c89fc 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -68,6 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;
 
+	inst->enc_raw_width = DEFAULT_WIDTH;
+	inst->enc_raw_height = DEFAULT_HEIGHT;
+
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
 
@@ -287,6 +290,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
 	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
 
+	inst->enc_raw_width = f->fmt.pix_mp.width;
+	inst->enc_raw_height = f->fmt.pix_mp.height;
+
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;

-- 
2.43.0


