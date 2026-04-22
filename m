Return-Path: <linux-arm-msm+bounces-104086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NUdH4yu6GkhOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:18:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8C4452A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A26AE3033DDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B59F299944;
	Wed, 22 Apr 2026 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yi3OISCY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCymLkcr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A313CF024
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856635; cv=none; b=iOLbYmS5bJW0QZZ3hNGsHrTA9DgXA1cn4GN2WK0H7mC0fXuLTVGjEZ+Qzq7k/o1zc6OOp5TvCSY4jrXWhBhabFXBbuauuUUElSOnnGER6ti6l9rWv35qDuqafZEqVwplxM4+S2PcjL38R/jru5TFiTlHvN8PhOttoJCmF0oKtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856635; c=relaxed/simple;
	bh=cZWoW0QtVKH8JIVtUlT67HMSZVr757vitB1z3b7VwJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uArbCtCEQrPCiinvb9FxkTdBiR3Ps27jdHfkc1J1D4IsxASGPfZU7An+VjHxd/l/7/FDgxV4O3ANddsbUQiKYcIwhSkfzxQi3RX0Gc69E8P3sZn8yTAT21jQHLPW2uHDooPnYi415U5vizlywj+XAsx1HF4Yfvg+zYv4vE+391c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yi3OISCY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCymLkcr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M99D6W647290
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DhrOe5+iY2QBpjWGl8a6mJqg/wd0SGxajIelouCwIfo=; b=Yi3OISCYxuQQCkiK
	L6sYlAGHivF5uV5jH6ciqnTC2Ui9y7gOQ7HFyQnb0FlwJRfXN3yxItO5RkMyrZrY
	iovkB4aIZcHSDa2Ur7eNHJK5fcpC1mlyW9VXAlwFG7tj5Sj/6104KJ05wi4CQTvy
	nf//0BCsVpbzqVGJ+pqNgLO3DdE3+ug40a2rGbwUlVYTFG7m3nscX4aAy0gaTZxo
	11zF3L3WTG93PTeeeNhDfPTVcyR0TNhDalopDSjrUiTHTvKEg0xgRS1XIXmYWUQ+
	nzmkePCYOxoBDuZuTk4bl+LxCl2kJW8VTXsXG9gu41awvJqwb/2EaefaeRck5l24
	6vyGQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkb20c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242b9359aso51918895ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856632; x=1777461432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhrOe5+iY2QBpjWGl8a6mJqg/wd0SGxajIelouCwIfo=;
        b=iCymLkcr10/GXsL0LG9z5l2lOwqpw1W6583L0ghpB53q1vyejETvtJG4IL3cZjnbIX
         OYWX/LlXUmjC8JE6wSIxPpB29jqX4YRz6h2z0G1pKolIGK0Y7Y/RCEOQu/efQxuGF0RD
         GNWqH10MazPifid0m1futx/f0+zjOgC0o7q812yq/6b+02BtBrSmwaO5T7J7yf+lz+Dh
         GPrmsbjaICZIgBsac5uYYmO92Q9Zw8RTEZ4dpKYEeoyJzeexYgbnQ6CYPvHI7iwUNy7m
         UEQR5gefH/mJvyup2hsYOlIiRuCXNzyiFTe2MvTrz8uQsHNn8eg2bMotCZR/V2zLn8iH
         Vj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856632; x=1777461432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DhrOe5+iY2QBpjWGl8a6mJqg/wd0SGxajIelouCwIfo=;
        b=Ci70yChGlWUTHtovHqPAsGfZJSyX3XtYzDlFCkU3WkOV0uREfmPP4tYxduUg0FTNjL
         sJ9Wkj8qJTEQaxV5mit9q2pFkR8k7oWZLFszmpNfzSMsPkBVJ+HuJYe3I2ZsP/2JBvrp
         N3lLQ3prmy8/UAEn07MtsdcpXpm7UXaiIl9vNM9FadTUrbhdLWJLblONZmATErLOpr4r
         S5gUrs9duKo1DjY5atSFs9MkWIH7LwrpSUOm9bU48B/9rRcjz/r+/cXFVLLpW/T1Gtcd
         H+RyyaLCqUQB47h9T9mDbhTJcq6pcsw9GGWPI8xxuXyZ/NvLYQsb+I9EFn/HK+Djs6qy
         FHxw==
X-Forwarded-Encrypted: i=1; AFNElJ+aRmOh0564YSOTGpHZYpoxqrjLwZNosNOpaYUHyZqoOkNCh5oynUuPexOpwYesCcJMRUq/zlEb7MKnFye6@vger.kernel.org
X-Gm-Message-State: AOJu0YxWtr9PxxkkqIm75NVrkJF2NaHUMq9NgXGpj6Y0/8EERnKAgjpI
	32KL1m4xbFokF40MA+Qbr96P6DrpP1lqgNLL/B6iJvSCmf5pI1fhxzMewuv5lw/XsrrtdmvlWm6
	7ESF7Vv/GYgVx8T5I+/RQH3sFFdfj2wTe0XatzH6CQ9Qmz14d2roAopOvHRKAA/0CKSOl
X-Gm-Gg: AeBDiesa8k/t58uO8YsD+DtuGT0chBOodjgux0/dtDjQSdsPoaozq4psPVdtjrhziq3
	iMcXHOLBa0PzAxgBHSDcFz/2MLr2Sc7xGeL1Ri7236XIiKpOYUK2GBXnQc/5dM1GYeKRXWaT/0U
	uak+CnZC16FwHFbsT4vDjiXry0ZxBMo7UrEPtO0Yz0hYHcoBYtcn4S6TcDBs31GIqUVqGMRna/N
	wumgcjpyKbgfTQF9NLdPta+M1/pCmur3t5pO7+F2GflAGG2UDkkPQNKp/B6te/nAyVcZHl1FXD4
	NZ/OMvJA7kiYu+qnbFODAfB3V5YQZst+J/+TcdkIes7eaCdlZjRaYP3YhtBDNx0lQC8+hzDE+e0
	T7eeW+tFGbacyMnEizP/lCPcUTHIccFX5MKz7P0ravy1ZZvRFgDaK7DBdJPSj5W685oSr+A==
X-Received: by 2002:a05:6a20:a113:b0:39b:c9ff:e3eb with SMTP id adf61e73a8af0-3a08d6879c8mr25419770637.4.1776856631800;
        Wed, 22 Apr 2026 04:17:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:a113:b0:39b:c9ff:e3eb with SMTP id adf61e73a8af0-3a08d6879c8mr25419727637.4.1776856631301;
        Wed, 22 Apr 2026 04:17:11 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:11 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:38 +0530
Subject: [PATCH 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-5-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1298;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=cZWoW0QtVKH8JIVtUlT67HMSZVr757vitB1z3b7VwJY=;
 b=x7UK8J0rJmpaw3XK3wfvpIDBpo0KeW5jh5IMMR7ZopJl69ODuA+YWEzoVCDscfVphPiV3/T/0
 E2Zfhi+UEK/CRYUcKGyKF+nhyk82zo7/ayLi4OqgEQZqwBu/CRSYn6J
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: vVnS3_glD0rKIYTAXBrzgz2mYJbXrlNW
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8ae38 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jSGZT_DOcC9zL5wkuQYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vVnS3_glD0rKIYTAXBrzgz2mYJbXrlNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfX9oPSQ56dF+9z
 d/Mxdj+Zf9t4WkwlFc/cY/t9LZmXXZ+I0C2Pac4Ox/ppnRgpRewHlsQDt/aLe+51pWIeTRVG5Uy
 0SzVQGPvATu64pn2JoN8BO0GKHkptU2cbLemU+0t3J3NrzeHBm1Pd4VH4CZcnZSf91SBsiOyISN
 XV50ZlNXhP1rR49CJsV5Qcblm/hLtlFW+j23lwAQuBdnbD1Jk77qW7Vs8xkPFpKFQ6cSQtZnB/h
 0q47GIDkCZ8DxaHkmtiVWrVewVRvrkbFORZXOszBugoul8TEfvywlb8Br+XWZAdOsdXoNtfUfxs
 Mvv0kIwID+1f5YT3L9HtzhCDnXmWed5czSoSg+yi1lrTcjZXllv0MK31waVY106kUSHEoRxSyJJ
 bssuv0GurtPtDdKzgFp8y9fhUqBYzvy+IRn3D4/DZ+sTiM1971EzGUWuii0QlS6lidxNpNGnvZb
 YRcVTJDhmZHZOJzsLbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104086-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EF8C4452A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
dispatch table, causing the property to be sent to firmware twice on every
config-params call.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 06698fde639ec654ff9ec78a178271ab2284f5f0..dc7acde1913e65eb39734702cb164bb26b8ea6c2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -623,7 +623,6 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {

-- 
2.34.1


