Return-Path: <linux-arm-msm+bounces-85795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CDCCED8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 08:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78DE43021682
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 07:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D8F2ED17C;
	Fri, 19 Dec 2025 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tr1Z2Ru/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrPOJn+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709012EC541
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 07:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130210; cv=none; b=YSpbKL521RbBIsVlcUQm4elNpE7PauMHu9wbzTvIsoaeAEJBb85Jw9l0gFaeklQz9JuvNDfXMDLIwKa03xarOs4uXXP+biym7sNUbCoBtL+M5IwR8gRW8f/dMPEJl5NikLqHJBe9REfQNK/rOHs+tsBtZcgTsur3O1Hb2gSTGzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130210; c=relaxed/simple;
	bh=uIMTSmtJoVkGUl0RGol1bMIhEjXPmF2zePxvZdQhLiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ66P00g4wKhTwxgojeXxIR+0Dv69e0vEaArcMvh7PUHVYbpr44DBS1O5HJ6aLPWDaWNKTmIvaipK2cfZXnkg5pQ/8l78Op/NDLjM/0IcDCt/Po6ucvmMQrHtL+x79Xy7Eds/z9PtLmhK9A2yPJhK43FSNMD00N0DPmQIC2wxuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tr1Z2Ru/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrPOJn+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c8283975650
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 07:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvPwkihF9+yeuuXUKkRYpVA/NsYjUy9wnJEg8/IUJzE=; b=Tr1Z2Ru/qOiULuuS
	LIu8nShiw5+9YW4bF1BLMTL58dt9a+IQ0rGSxOR7r+2RUI5kIEePzCx0u67a1lyG
	siZM1QlXvou8ACUsWLqJVyv+QFzp0Ga08hqTSuLrtTQNP9Dg+k0B9iO0i91IlNVP
	sTsQXdbw3y++cLl2WPyvLGib+A4YZn3asnrS5cAMUQpJgNYTArdJm567B8muzzi1
	s+NX7hMvHRoFLeb7g9uLu0yeafpL/PJojYGiYdN1p8ihBkggXaAFcuTzVdyZuAnF
	bCMhY8ni11uaeLJQMuJ4ggL9d8dfnlELbVd7CZUghpL6LecLJ4SbsfX7Micl6Vh/
	nz8Oeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fhpmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 07:43:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso14451155ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 23:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766130206; x=1766735006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvPwkihF9+yeuuXUKkRYpVA/NsYjUy9wnJEg8/IUJzE=;
        b=ZrPOJn+uagq9xhBWnhRx8pOwDe/X9bE0MUEsTFxHVPEttahuQFykWM/I7E9Axny7G2
         8f1Am9UZT0Kb3sqk85igkZrjpaRmCP0UTKjE9zD7UO6ZYY25YMbr3NDNoauj+kAQeWCS
         kebBf0EXbQml9fbVISVVxdxm66pPDauRZP4rsqEc0jdZD8nuq3MNGqrMBQ2JocckTggZ
         OkSB391He0+ETAYYsnRwtM1SmHa/4FgmpEVtlUql2NUwTGOAijOuAwXE+KOaYwA8uauQ
         K1kfqBKnTLHYyugqkiNLnIFZsKg9gvPsJBNW9IjVYJLW8KW14O2oI+/xaCHWQp5pNuG9
         Mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130206; x=1766735006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvPwkihF9+yeuuXUKkRYpVA/NsYjUy9wnJEg8/IUJzE=;
        b=j5a5AjxhXoN85xGzOeIYDAgcKgFm8VO4i4S+ei690mX4sPJKqOgAZL7bmmZhqrkSEn
         mG8AogNi3feF5rWODAtWPRpJjuaptH/e5e1Rh4lJZSt9qHtQ4QPWypk0lWbBRYoKA4cU
         2cJ6mKLO6wQXHPFYSOf85qJts9J/r8lxde/lKhJ0YaV6IP6TWF0UHsjANo88S/5cTFGe
         l2FATqqRANMsjpeuiKbCcLt+1pasOmd+rx1ZCFDQ9odGq30OdVTBnhPM7zil3gJ6ZQHA
         tSYlJZO3ZB+mubIHgagg56pzwNDLjRKhMJJ7iqtykEdGteBT3+eE4WR1JIMDg8Z2eSrZ
         883A==
X-Forwarded-Encrypted: i=1; AJvYcCW7zZDZSPEpdGWC3W1XFtv392F1Ug9kcIt5GnbRdXgMl6I1HohL69AWocfXk0foONjjAkFI2LyFaQQ1wX+y@vger.kernel.org
X-Gm-Message-State: AOJu0YwFU8YKFmtU2I0lJ+47qRkcDmqcPaUIV0kv19xwiFXO5DuCYMeY
	CiMP753bhwS04iWPtNLM5JMHQAPyzlUx2hwHpWy947QcS13eW15rB2seYl96JT2y3GP9s5HJew5
	EieVHYdvLlRr4ovs8eb9MROjT/Z0M+wTPMOP6/+8MBgeTBB0kspqqUpNJGfWE0PnA1MWw
X-Gm-Gg: AY/fxX4LY2I++eDmnZjnBbr5McRePpafO5Zwz6Ubog0DkZqeb/kfuvVX/GaODg5fhho
	CLlHg6REA+IO/J/HJbbsD6LB/ym4p+onlVrVxNZeucUSTu6OPchJc7UFKT5XZaBBIXIc5wltOZj
	Y3OHc4K+En6lTYomoqMA8Y+hZvz4djOW2WtkKcDJVkyiLTCSTI4Lx2dfYvJq/IFUziEO8Tva055
	bla1DGZ/xn8Jzgu+XvfKTteI57HHRd6T8R9hX8zgeQ/s09Nj/PH2w33tNfV+LQWgANPQDzhe8gw
	GB91wAlHKUHxpHJO3UiLWu7fA2W9nuROMxvrN9Qi7v5ia4YNMZ5Dq6Y7mwcn7xg0akEpGlo/LUg
	qjRtQWpDESANHcv7thAg9CNhF/DeFxlMoelBfbqTS
X-Received: by 2002:a17:902:c94f:b0:2a0:d527:4d07 with SMTP id d9443c01a7336-2a2f0d2db0amr24235215ad.17.1766130205695;
        Thu, 18 Dec 2025 23:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+ko1eCYY3xiUYKJRpBf66RTUV7GT1KAXGRjRu2KHKw6DGNvX2wWFBl4npMxnoA1UIKnmWFQ==
X-Received: by 2002:a17:902:c94f:b0:2a0:d527:4d07 with SMTP id d9443c01a7336-2a2f0d2db0amr24235015ad.17.1766130205219;
        Thu, 18 Dec 2025 23:43:25 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm14007325ad.51.2025.12.18.23.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:43:24 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:42:34 +0800
Subject: [PATCH v2 6/6] media: qcom: iris: Simplify COMV size calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-batch2_iris_encoder_enhancements-v2-6-371f7fe24801@oss.qualcomm.com>
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130176; l=1442;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=uIMTSmtJoVkGUl0RGol1bMIhEjXPmF2zePxvZdQhLiU=;
 b=Tbe5Ji47HKTOfrbM7WITyBB5sVo/7KDAGSedBno61TnuDcAK1r6YL8tgtHu+T74NW30lESGlQ
 xS5dH9nbAxNATFSw5qoOPx59pWIer1mjk0HffvKVoKKAjsNrQFcAF/M
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=6945021e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ihyF2tqwNky6lgPlo9sA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YvNJaX42anjM-AlvGjioNZ9JETv5pBLa
X-Proofpoint-GUID: YvNJaX42anjM-AlvGjioNZ9JETv5pBLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MiBTYWx0ZWRfX30ogfVmnVc38
 PKhMehEZ7TNL2qkYpObpPmaXJjX0O2iO/bzK7hCFcxqDVjFwSEMRNwvDm7WPYGOkI5Za9v1OTkY
 c36yJ5/Aoy/h58eQbFKBWhU/aMkv6z8JJ0d+JkNzhuRIslOV/Ee9bMYl4eSnGcd3vaYjf3/Yl8A
 Q349g1eBR70SlU6hXYnsHEzOgCF3k0G+uYgF8UbqxfuZqXva25/UCULc77W3LuFJ+QBtUHlB8zD
 L9YeGAdUb0vNKffgCcQXnegzPdTVmODWx1v6VeLsEr201/GtzW4RwTjQ8Hs6HNHlq4rn0AB9+RI
 /J7320F679pD5p+0L3kJG4smkQipI206g18lvY6E1zpABhbpGqwzW2F5+Ki8SZeMXJUT3Hu9sfJ
 9kPoxw97/BMueOEkpqhlLOT6+NrTKbm47m+LTdGPOCr+5HnuURBLXv9vslK6naK9VeHoRPxGNBe
 F7+icTxc2yvHFvQJiRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190062

Unify AVC/HEVC handling by computing codec and lcu_size upfront.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index c962042518fceb0f82a48956df01c8f3cd26df99..d3f1120dac8d64abcf5f87bc11aa368cfb02820f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = hfi_buffer_get_recon_count(inst);
-	u32 lcu_size = 16;
+	u32 standard, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	standard = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, standard);
 }
 
 static inline

-- 
2.43.0


