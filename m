Return-Path: <linux-arm-msm+bounces-60909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82216AD4A83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 07:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198A83A65EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D62B226534;
	Wed, 11 Jun 2025 05:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXRSRZdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A462253F3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620663; cv=none; b=cy5v+kO32JQWX6xkVEX/b1AyWKGs4OLkVFSzmhlRTF0flK2mn5Yxh/I75olxz2lGfvwddEbAgk5wGUjX8dJkKKEyP69hf5qr9jZVBGF1NzSSaDiODvWpGt/hb1RhpJlpBofFMQFt1LY0DNduOjzZTwb6SfOAyv+zPEQ5tDhVb4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620663; c=relaxed/simple;
	bh=4bPODOzNV1J1Wag20WqHQpC7iwILRqUaFidO5fo7Wj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HXpcRD+LDZG+fHYKt1Auk+PsU6uOSnki8fvM/NUP4xaaTn8neEdpeQxfz300uv3f8u9qLRlxgdDJ54do8AbyK3HofPVO/hLMt433wmEpnVHc7qgEGFCGj+SN3ezWKmQVUtxvExreNxEiHHNLWPeixcnY8YAz8dIsxjTLVZwFkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXRSRZdE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4sqZd017402
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 05:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2paThcjo4kV5rlHhG4CJt
	0FpfCXVKHmPjNjUTqWvJw=; b=SXRSRZdEgdV0prrcKjzTTowChbnivKHrZeLDPb
	WL7MhNdZGWFmcDVzAA4ABDh/Va9NzJdysQn/Dm4TvUjFni2GWj7nsOh9iWxMKVGU
	o9NK3ZFP5knGhGE9DHyAR2W5QbGLZ8GyMBRoPzMcf6YEOpFLQawHrqrT+UsL4bR4
	/bKZA2ZYXjy3IhdbRLl7tbI17s/J26UCcV7soTCGIA06akVZayXyZzJhGSWxccsT
	AdAqQ+tIAdM29u/KlQvEgvrQWXXrrBfCEx4QRRROanC8TNBBnJFep6eeq3wny2UK
	IW08dnWVRIxkk1BwlhW2wML3k5FRSSK68ffmS3dHdR5Q680Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47736dr35x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 05:44:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748269c6516so3926085b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 22:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620658; x=1750225458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2paThcjo4kV5rlHhG4CJt0FpfCXVKHmPjNjUTqWvJw=;
        b=L3WdWNHAwc1rPnODO8F/af96SmySjVM7grIf8P/OgtS109eCvWt0G5csk03erx7teC
         GFxkWQlEyp08/t5NLYpKFWQlak8JoYBXUDFa+Xi59ZjuT6TYVU0i+OodoLFXQdLtWMKp
         Tapikac9bkcr8U8Jbvqhda9F3+bYU3yVzv8dGE0nA6iEyDrwbJ/LKtIpIIXMdUVQWw7U
         C83xIAbfzaZjM3xHPejtQZ+AIjQsEdSulzeuztSN4+IGgZWixjepLZiDdEIJ/NzfpBh5
         xHMdSu6T13pCwonqY49qQZU32Y0l3GLkZ689eMSSJoUBqxZNQx7FmMxUdDWr7MwIhMv2
         877w==
X-Forwarded-Encrypted: i=1; AJvYcCVuHrAi6ADMVveOcQWBTmlxERjfJftyuh5Ce8dRLwui622pOcRWIUawOkexL8pFPcpN75h63dhyC6MeR+D5@vger.kernel.org
X-Gm-Message-State: AOJu0YwCM53ajpKjssqZdhGyj3enFWtb+XV5eyTrI5ZRdpUsd7kArSs3
	ECXfdFpK9yr+zzbnzboFZN8tCSs9lM7NjpT/T6Dk8DVCNs7+PW1FmO5ijSvJ2PoZUnIITTE7vqy
	hsjCYv2dzXBomWLuwxfEHlGih9SSFFemeoOtZ1QLPlOKZpnszsbxiMO8w/D2uj7Hkq5Yb
X-Gm-Gg: ASbGncslmXTm53+/OYiTgUqgL0llXUFggrQ5U7WcJf6vpCLrs8UlHpAgXay90bQ5ecu
	QhWZXEkIqIz21aH9l+gczHjWF1B0zQlhsV3IkzipTnuz+Z0BpGL+HO0rWEWkxcwvjPt89irNnls
	7wHCklipzAn78La/6m28eQTXVwfoWntlR5frhMUDCkBGO37FAqrMBbE74wuj0nXNtda+cIcO32y
	5xa3I7Vui+kvErWF2LTv+wNl/jXqAfrOCP4BJgkxxpN2bCNZP0imrMFG5PNah+xlz4O3O3ju0/V
	94HoDDwFIlf4nH6O/N6rVwR1D7+Zdbkd
X-Received: by 2002:a05:6a20:2589:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21f86754dbemr3178023637.38.1749620658386;
        Tue, 10 Jun 2025 22:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5RTYJPaD19g1+QKXGXvxhjvcmz9N0P/Wo4pkBLGPiOVS4sBLpqjPb8UTr/LDjbvr/4AnFYw==
X-Received: by 2002:a05:6a20:2589:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21f86754dbemr3177998637.38.1749620657998;
        Tue, 10 Jun 2025 22:44:17 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0eb0dasm8629697b3a.170.2025.06.10.22.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 22:44:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:13:44 +0530
Subject: [PATCH] media: iris: Fix opp scaling of power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iris-opp-fix-v1-1-424caec41158@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI8XSWgC/yWMQQ6CMBAAv9Ls2TVtSTHyFcOh1EX3AK27SEwIf
 6eR40wys4GSMCl0ZgOhlZXzXMFdDKR3nF+E/KwM3vpgg78hCyvmUnDkHzY0+nB3yTY+Qk2KUNX
 /3aM/WejzrdfllDBEJUx5mnjpzNpeXYuSHPT7fgAkGRzpiwAAAA==
X-Change-ID: 20250527-iris-opp-fix-3ef2591c032a
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749620655; l=1267;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4bPODOzNV1J1Wag20WqHQpC7iwILRqUaFidO5fo7Wj8=;
 b=GW1VPWKI/sCUGw/lmdjcfb1/v1p4eeE2hxIHDUz6r0uc8ZG6Nh6B1h6ZjF1CXCVBjg7JskGvw
 jcYo3SVzHEYBjKshveIrasbrGRIJ9GRxGQPohIyCG7g/J+DEMY0SQcC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=GIYIEvNK c=1 sm=1 tr=0 ts=684917b3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Bqk5Gw0CwUaqKlFR4NYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: AmftLXpSwHuAF5OJhDhj8I8-zAXpbvH0
X-Proofpoint-GUID: AmftLXpSwHuAF5OJhDhj8I8-zAXpbvH0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA0OSBTYWx0ZWRfXxXT7y88p+1f8
 qP6Zg4+bS9JSTYjw6b355zVALcAN2AltHb82GGsT4Vqy2TVdmPOHAtRxfk7JpfR87aioN/Kd7RN
 KC2GJdSeItdf+Z6E8bu19UPEFP5i1Mj0VrBxigXxl0sdO5ft3L4HLq9PlrxWPGkJfkVZnBfYLjh
 KpwhreCpf4j3/fp6QVV40+HdQH/rZR5S80e3ZGo7s9BWPdkmANEPJV+X56NVqswv7REu6MYWpPs
 I3ZCL8vfZHvbfqycgcAiCzulevn2iGJsJvJbS5E0rSV05ngffxNGJidNGLhozXAU6ISLm6PS8sD
 Ii7jTLMTALuBVhrwkXN1Y42VFvgdBR4/M7+mg9VrCnhUV8uu9FeaSEi6in1S0VsmY4acRr5ZWV5
 W61UcZ0gjVBnRrX0FpxCt0aANArn3HdiWFfkKhqs02LqhAj7TpwT+D72uzSUW1GtiFRtLBMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110049

Pass PD_FLAG_REQUIRED_OPP flag to allow opp framework to scale the rpmpd
power domains.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Found this issue while reviewing the Iris source and only compile tested.
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9a7ce142f7007ffcda0bd422c1983f2374bb0d92..4e6e92357968d7419f114cc0ffa9b571bad19e46 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -53,7 +53,7 @@ static int iris_init_power_domains(struct iris_core *core)
 	struct dev_pm_domain_attach_data iris_opp_pd_data = {
 		.pd_names = core->iris_platform_data->opp_pd_tbl,
 		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
 	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);

---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250527-iris-opp-fix-3ef2591c032a

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


