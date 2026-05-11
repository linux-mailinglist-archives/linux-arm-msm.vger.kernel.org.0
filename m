Return-Path: <linux-arm-msm+bounces-107008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOK6FIFXAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:26:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B0516D9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFBA3302470C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9F6383314;
	Mon, 11 May 2026 22:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKo9MRf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIqfFFgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004D38330A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538224; cv=none; b=Bpj6wS+cOUGPZQkkprk/MN+W02JVa+YtxM0mKRVDyLrNH56nr8BSgErScwl52deTKDvRM0gqtEeSfDVEQgf2G4PIIB13nR0xZAl9+9qDApuMTb1Zp3+Q9y6Q7f6XNbHE8HhiNMYrkDMtS1tNVyYmPjvu1ZbNJfV3ThLONokSyMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538224; c=relaxed/simple;
	bh=qFEjGgC4wb1fvQfsiuDZ/uQBzV5scQmb40bLkCfeBGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ijl2bVK/Y1SAo5XPFm04n7qiP1QpoG61igjsGGhh8afpaYgq+i57+40WKuONH4sqxfvsO+uZtuIMGRjyLHJPd3NBR94hxYxVpx/zuCsNlmxz2J4Q3H3ZhHFXCbjZs3Jr0ctW+1dFVGY3d0IekGULJLNQu3aoVt7ubwIAR1j3m7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKo9MRf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIqfFFgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6f6W2573884
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=; b=hKo9MRf3/BMSbuvJ
	o8LINdzdvxd16Af2Put7T6zzZBBUBCJI1tB5ibOUFOhmhaLx9iirsACJRiU2fHj9
	mphD/eMOE/pybz9LFSFRLFTnrpfZuM915o42jL6vn2kmsrpO23Ap3NMwoZcPtStv
	ko/waX+jd3cegtaEimjRbEQ7uNwFH5raSxLj3ECssCrZj5QOupsqKjdRUPhshMEg
	76ECORk0L+sioTLrAdxa65fWi6PllGBYSv4ktJyHsm0+2gxquJ0ZDC2pDkDkFbk9
	c5NDnqy6nCJ5L6bp/KrXE2hk4/y/eSiVAgS8OH8rjFHyMM6/Jj6DpkZuNJVSM0U9
	7zpX/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28f9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:23:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c827ee34adbso850507a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538222; x=1779143022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=;
        b=BIqfFFgZvNg/TFdfSAfxF+EPD8RXCy6uKdOEDUsTkOS6SqpjBjI4JdBv2Mz5BXMThc
         VjXU9bib1hWX9rBPIUpvo8bl325KxnAjZnADHFtBI1lXwgP/xA7cp+rrgzNEq+UsNwdx
         SLZGNZI3gDiMOzwiVqjzN9Rkm5aQpUyIU7KqLWMmTym/uqaqJTbWuLYVHUPXtHGUkaev
         JWoWHjA5CPhPD7hC5KNP+bFLLkLqsfflotixTT657f4zELKhbIsUwhi492F9wOdufBTh
         y7er8CsLO7ZOCNMVlmZLVWM04eI0s9hfvwklQQ5vB15pArv/JLFKhLIyMUWKgucpIDUC
         azCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538222; x=1779143022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1Ik9X4nwCWuWmFkc7YBJISS24AV0UyjAE4EfL4tKIs=;
        b=ZGL8ku6SJkrLdwyAJEj/+tHLwSpTMzWzeY7DC64DoHvKbqqi7/sULn4wyxZ/vXrLsN
         f9hh1JJNdsqkkCy1X1OPhMQr4HbhurfABmXntIZwZHFtH3zGcqJnK60WdmZLf5KH4dO+
         iXrFD3+KNefZIg7Fb0gg6Y9tFFvEdCPgNsAL87VvtUEVkcAEaQBQ4P+urPM6OcqePUVX
         lKazkD+7Qv0YmiLI/YNQynI5ILvumSoQc6Ze6zhtMT9m9jE/oiJQCIoRal+emtZNmMl9
         ERrdcKFAAOeQnlr+Pv5ZcRiXr+yI4Qm4DY4hm5R/zrsVcFYlVxaNhJ1Dub0aB2d+FqS1
         6CjA==
X-Forwarded-Encrypted: i=1; AFNElJ+gavvG2FqsVhXa9C81sVcK/yVnX23M9cKV3wF7/7+1qLZ8lCkaoS6vahQowTF06XsAh/a8oM3ytNKFTrDH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7usqzooKDMFjPLCD1KuGBMuDq89tfodSGEWRrdhAkuw8itLP
	ZZB92DxkFUbboNT/1KD7oPW2bESH1/V+j6XjuKQ6dwYN0pZIHZU8lo4pWAJYO7r9DlDDC9fiqfY
	RKpHTDX7R+SbkBRlQq8RqzWnIZLkCcOAtcmNuIihVfD0UpeMxbMzmnG0c5RUJvwKQO39nitqfMp
	Og
X-Gm-Gg: Acq92OHCOjE0sGSMdigCWjCO3c//nAHOMqvF8gFyWFel71m7GR5XwUR5KOMudi1r4PP
	cVgwy9XNZ45RD7AOaTkiclHabLN2VdXlqbRle7RfFpfklTvVibaZ6V9ExboRyr/zC9eHf3YRydE
	5GhgPKiBT6TeCnQGeWzS8wlWnuhl3aA7DfSuTPNj14TBlReXqhPqvQgFU0KdRfMav3ZEdD9q1cl
	5Sr/iHzs+yMVZXHyIPnlU0UKFV3rE81KMMuOxBONv+mGGsXz5NP8HuQ3hojZZISSQt5NFzF80Zk
	n+xR5r+yrwzP4Me3cqhmS1UDJPCQbCT12wTDX8pffRko+X260pUxE84gTDz4Y+uC9d4MS3nXOjp
	EkNoLv9cJ/hNnQGhn85fFEJsdudFJNZlJtkfHkliV8k/Mqg==
X-Received: by 2002:a05:6a20:12c5:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3aab12e2f4cmr17859591637.4.1778538222105;
        Mon, 11 May 2026 15:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c5:b0:3a0:b781:4c80 with SMTP id adf61e73a8af0-3aab12e2f4cmr17859568637.4.1778538221662;
        Mon, 11 May 2026 15:23:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:15 +0530
Subject: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=866;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFEjGgC4wb1fvQfsiuDZ/uQBzV5scQmb40bLkCfeBGg=;
 b=63jkHzMyfC934McaMS72qQzI1obDzNntWJQBUz0AVtE273amGFUWx7fovSDObmw7m1nz/fPSz
 r8jcxbe20XFBLRx4d/OizdOTrANdLrOMhCUnnVRkTpMBeNetRGijKeL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a0256ee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RQVZ3Ks9ONUmwc3llXAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: KN7mh6HjzjDSDBf0Y3byoCyU7fhUQzHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX3ZfZeY78PhJg
 VEMYtrZOEQ2hBWaTOHUtEAUUpR73WrSmr0L/bC1wTxE+aYiGH+Ws6zPwbcJuxru9XU9mPGqB7ES
 GkNDzybFBaFXO+8Yb2sahGjpiYKVPg19kXqFW4nCs0sXP5peRit4N93Bp+ygFHoOh6IxAQ6Fe04
 UBynwqCQUN1/NqiuRf0MTR2yI4eo5UeaFlldWJk+VWl/VxcHcEtw5vcSvuv2puA/kKyPv/+tmV/
 KrxGZ04Z9tT3yYf6S7H4eRGq6tRvAl2Ov5lcQM8urHi8W7pCCO6IEh15+u+EhijRRSJjL8pgNZb
 P81LJEmvGKSuHLN9ORfdM1jk1aui8YjNUs9jRfWY+KB4GoT4vIOx0qRhNkE3isvPH2znGXIyfrG
 HpHQex2z+HoZYNePxL06XCdDb/DjMYLKHgFsqI6tt227OMYCp+ypAYGEAO54s5LGdzuZs9q/pB7
 ZPC0V1VVbjwSg4MHkbA==
X-Proofpoint-ORIG-GUID: KN7mh6HjzjDSDBf0Y3byoCyU7fhUQzHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-Rspamd-Queue-Id: E28B0516D9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107008-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the sm8750's clock description section to also cover Kaanapali GPU
SMMU since it uses the same single "hlos" vote clock.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index b811ece722c9..d1330fc0178a 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -568,6 +568,7 @@ allOf:
           items:
             - enum:
                 - qcom,glymur-smmu-500
+                - qcom,kaanapali-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500

-- 
2.51.0


