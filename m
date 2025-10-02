Return-Path: <linux-arm-msm+bounces-75783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5EBB35B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 10:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 129A5188E51F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 08:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00832FE063;
	Thu,  2 Oct 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDIQ9QHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E42DF14E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395188; cv=none; b=XnA825tvDQrS9O9+Hce4aMaMx2e/Wddc/pZjdZILMAvg3TfhylMXLvWPjaRAqbO3+4lgG7aLYqS8VCgWBKSLdYiu4NtXQEjRpFaxOWKRbjiZ8Mxb/IhK2ZvT8rPHiViaBlvDrctFOZ6bK1u1GsZt73nnTqyfOXgNKbtLF/Tat3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395188; c=relaxed/simple;
	bh=yEWKVEONPMuo/1ZLJQobHQKN74Mos671QJLh8xq2IEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BSVTlpsFy6iurJDDmTLO9KSOJzpyRNDM7Z4vCQxpLOlg9sR2KocyyIFWIWmKq7kt2mpU6d5ny5e9SooPjBarF8UDS2VDFAm8Mv6UIrSNOVZhvILiupCfw2sH2IzataSVkt8HMySdPiMQiKmfZN85N6MJlAMcfZb5EFgexBVFM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDIQ9QHY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5928pw7C024045
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 08:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDVKEu0l6U8/m1DkbF4V1wuFoj1Y7XDb8Q8vVrzOiNI=; b=bDIQ9QHY77iWHYUn
	ROjZnAipZqv2MDIVn4zBi509kJ8ZzZS69omgEOBUolx29qdmLcTIjhYITOojM3jF
	ZpJFC3shbwzeZE3zd42iyk/DAzOA9/9zR2omgdDB4mkVjS2psV9fBEm7eBvCEfNo
	dbVXuHzOcmMs5VwbnfI6Lcj+n+ZasS93MLYvDDcNodCH7zzA81ZVxBEiWdC6bPxY
	uA4AAU3O8YzbJKp7R3lM1jiemXy7xMwwVS/MGItB4OCXYA3C9KBKXHJCU5PUx4pI
	km7hLSxxDDEOVqQXeG1AMGZ9ifvwvNfZG0whT+6zx+7hnlvdgFeMKeOov872Z4xi
	AB64zA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n7n3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 08:53:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d8b8c3591fso21900501cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 01:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759395184; x=1759999984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDVKEu0l6U8/m1DkbF4V1wuFoj1Y7XDb8Q8vVrzOiNI=;
        b=gb6RpkiLLJaH1LXGKyPGUVGHQlGSHyODbGCKOfkHAhGLPIna0wlALb5+xF2vGL8+RU
         0qHBxXGFeX7sZ9ky50dEVYgHGEDzdRL0n42Iq4oJmgTRVpR94KmJRg7esIFVtwbzNjOT
         b+yZRluDYvPCuRDPkIrhYZEdAEgFyZaw4Bkok3GbxCi5UM/yKTSM98yJ6SMtUhVBBAOm
         S4SyL28bEAQ1Op7TlSIcEDPPXTqI5oSld+c56Vy2ozhL+OHB2QwxiKeNO/9r+ikvymvW
         jpnrwuLr5zrTFjbJsV1hnZJEe/L1HBv6mlRiUximbuLuIqND2RszpXcchqzDNO9oR7oF
         Pkow==
X-Gm-Message-State: AOJu0Yzum8Lh9mZ+uriYPRuo7FSfSPCsSZ8kK+eM/rAjT+RzQYsbzF/X
	FrU1bnKNnFxX9rNJCm7N/CrFTeSl6/m1t/RC3AOzpInX9sDoaB0KHF/AEAo7/xzR+a8pIQBhGa5
	YNrsCXP32IWb5RRBsWLZC0x+sULlminZa0hYTQRQpROneehcTjF7UbLtrlj3HfM0ZJzBr
X-Gm-Gg: ASbGncviTf87SxRfUwkNayVNuyorPdXhcjiMSAxmSe31/j0njyAPbpE2J2PC5miBwfw
	+lGSqWM616+RI3UTzNf/iPI9sWxfDlByMZT7+UrcjLIYuIofzoZ2rgfnykJGxBkOBrtGkrZrd0i
	0HPCkgcUi0ea1Vtv7p+MVz5TLKTTS4cL7xogp8Uw8NZPTu00JQCzW3Rn3LN95MSnalBYmLrvhPv
	h3NLd/IIJWiEVwMDkcbj6mG2ooq/GTEYvMv+ysXAXMFfJcb0QxMIVbF0w4xsdLXwOfxmSqzWzX+
	pxitKIJb/Jlcg4c+TB6ic2X7Ak2tX/OymxUYDI+ei598FJ8wFNqxCs9o1QWsfelrvGrT0rdIs1h
	SiTcggY2X+bt/gv+LXeAJbve7DhXrbMwesfqtG/HRQD/5YozOBl+Ompuorg==
X-Received: by 2002:a05:622a:4d0e:b0:4cb:102c:56b2 with SMTP id d75a77b69052e-4e4192f7886mr86280751cf.0.1759395184131;
        Thu, 02 Oct 2025 01:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzoeXCsCYajxT61dCdKaUdyvl96BO5g78vsxvJhmN//YTWTsStifnvfSF0Kf3B7QHZtn7D9Q==
X-Received: by 2002:a05:622a:4d0e:b0:4cb:102c:56b2 with SMTP id d75a77b69052e-4e4192f7886mr86280511cf.0.1759395183470;
        Thu, 02 Oct 2025 01:53:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba3124bbsm5207351fa.27.2025.10.02.01.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 01:53:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 02 Oct 2025 11:53:00 +0300
Subject: [PATCH 1/2] interconnect: qcom: msm8996: add missing link to
 SLAVE_USB_HS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-fix-msm8996-icc-v1-1-a36a05d1f869@oss.qualcomm.com>
References: <20251002-fix-msm8996-icc-v1-0-a36a05d1f869@oss.qualcomm.com>
In-Reply-To: <20251002-fix-msm8996-icc-v1-0-a36a05d1f869@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yEWKVEONPMuo/1ZLJQobHQKN74Mos671QJLh8xq2IEI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo3j1s5EDM9dHkNBqE1ej+iY8LhlPeUyUebTYbE
 +8rfOXz9FiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaN49bAAKCRCLPIo+Aiko
 1VbaB/9I8MxIptyQz+jehF3TFFzZP1BOna+zENlbWyss4aU13MaIdAtq6etDhYdtsSHMQyDvMhe
 4iS84XB3WDiDXwHACSYW4P6DS05vNv9ovjCk4SAQXclLGZztZtQo+Fn8vxe9uO51ajsCRfwgpER
 SEhIYuUpuYqjFk7ksnlKJ95jhAKYppDUkqnyxgO5v3AqlE14z4pLw1zsZP1ChUmRpkU1Dcc8qRV
 DXbrrYAir2Fx8sqQc42uBLbd0WHmZmgKDg7PBYhoCBMDICxKnF5MLhumqdzIhl0ZeHevh8mnze+
 v4lozF7Avfx1pwtupEfhRaHlPOfhrHRafSUau64XAo6RgmQN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -cxd_heozBhh7nifwrmz26yepu9I0ly7
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68de3d71 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=PsYRQ7GA2nqPEF2217oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -cxd_heozBhh7nifwrmz26yepu9I0ly7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX2k5DQp/FfK4j
 3V8nuPABMCdWzQZ6XMvTeijPCz/kHgRvfkn+ozyhqpxp6WnTc6+WSXuMhsSZtKPCOGAxNXQQcvS
 oXQLVMEjQ3TMsdalfSDLz4GVViyV0qo/vvNshelKPgktDagruTnPW3jWw8dtQRa7hpEI+DmT5IZ
 tLtfCAEC5NUf09fDaojPVuMebSN0zutggSDOrM0ndIfylVE+CdrJFlaSU+dn4lCXKGv3DnhddLR
 F3+SmNgep4NMLvTE4t+49UoE0UVDzIF7EuuIkzHuGWrypiLQjP7H5a9Wf/siqK25Q6yONnCr/Pl
 UDtmvxRnt1CIBxTCI5pVPEvrqsappp6bGTbiwiPClzYP+Sis6eQ+mY+wF5oqhgsdv2YiVWuiuA3
 nUllV0CBTDOK0mMVoI04zvjWZcnlvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

From the initial submission the interconnect driver missed the link from
SNOC_PNOC to the USB 2 configuration space. Add missing link in order to
let the platform configure and utilize this path.

Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/msm8996.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/msm8996.c b/drivers/interconnect/qcom/msm8996.c
index b73566c9b21f9dd275878419e030ab07163ef8dd..84cfafb22aa17dba0d5fc4074613546c3dd95625 100644
--- a/drivers/interconnect/qcom/msm8996.c
+++ b/drivers/interconnect/qcom/msm8996.c
@@ -552,6 +552,7 @@ static struct qcom_icc_node mas_venus_vmem = {
 static const u16 mas_snoc_pnoc_links[] = {
 	MSM8996_SLAVE_BLSP_1,
 	MSM8996_SLAVE_BLSP_2,
+	MSM8996_SLAVE_USB_HS,
 	MSM8996_SLAVE_SDCC_1,
 	MSM8996_SLAVE_SDCC_2,
 	MSM8996_SLAVE_SDCC_4,

-- 
2.47.3


