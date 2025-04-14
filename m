Return-Path: <linux-arm-msm+bounces-54231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F51A87FCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59AF23B261F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36EBA29DB8A;
	Mon, 14 Apr 2025 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4L48kaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3229CB4B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631583; cv=none; b=IKBWNj0RPrPNlKUIBKlSrzrZgWM31dS8aJ+t0J88WEt4R3/8FTXtkIA1lGnrk3eRR4ymQCyvGktfqZ+c3UXVnvhkgII4ZfCHEH3VO5MKIhArpmEsnC6Z2wI9YWLbp/qrtBrhREqCN1FCDcQwhdzxu/U5Ef64785hJKBpI0nOrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631583; c=relaxed/simple;
	bh=wk/Fhq9Q3rutgnD4Qc6wZpn1xULO5MLO0XKdfB5uUPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRcP/FpZazyz8b2vK7bRiIdVK5ugDmPVT3rW6FvnikhFEUNPHui0VwdJvxYCl83pwRD+e2ZZfGJFnljDQz/ojMRzgjAJdKERRlDRufsm53eFf1J0ENLrzEEmmi3MuejiUgS/QTNtjjgu5c8NrZ4lIV+5kZ3Ic7+t94j33jQ2o7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4L48kaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99nff015729
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRH0CgOt7qs92GLKK4hmTnFI4HEOYb6qRnDMsfUX7Ks=; b=T4L48kafgUFhvliy
	7SqJqXxDFuT0IZB0mSlADmRl3I9MZM/KIyO5Tj8zaq/Bwk//KS8g35NRpiJHx2U4
	02M8wJeY6yVeuKJ2WROAPJ+y4zpDtaAWQ6BWPSTgzJ8or4U0mf+adW+qkui/pFl7
	6+I7PG9+jzQYqI1UdqOL47Gj8Gun1D24BiZ0u91uGsSqcMVKNaWiLTd7knL14Tk+
	FzHJhdMs01fHFU+9bb88rRQxxzc2TuIE9BDRQPXEA+q5SBrbdhS358eXOTdggCCl
	o2Z7g+k9hiXVzmPqnA1IO6tCw05ImGVWxp3EcYy/AwXNVccqv68EuSf06gtqv76p
	Shd7bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6cek0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:53:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2255ae39f8fso46411765ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631580; x=1745236380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRH0CgOt7qs92GLKK4hmTnFI4HEOYb6qRnDMsfUX7Ks=;
        b=Xr18Fa2Ag8n/jgswWZlGRTsWexsSCVHp8rDbRgc/kH6DsiwVEV8oxjS4O9ai+aPP8x
         jf1i6h/SU5mk1oR3/+/KcdGMytw9e8y/SKbkT6JWFc6K3t5gqtlwNRWmM45OxrNlswnE
         1UgBjywSgSQ2j+/EfMRMhrg9asx/xvAwAN820FSRAutuXe6tehK3eo4txjgoqsCqtRFz
         6WHi7W3I1tbyA3tWrofqnvuKDl8wYvEeAwNMmaTcwHzfJ+NL+Az6bLqDv7I+/JfNfXLS
         TH/PfqqGTczXLCuP7WDxdLn9MJFau9i7VVFjaZW7eO4Y5mYl9PqSV19ND2+4nULY+lan
         T8Zg==
X-Gm-Message-State: AOJu0YycNgzfhUlxe5jDy9UJE87g4euaYSW52u+LbplY2ES5FHXfCvqt
	h7h7URz6Om4QsJu/ncdnnv5oi3WIZVBWO9HTVHSvNHP+iRcXkj0F9lEnipSPOxCMuIy2SwTgTgF
	Ii1sDaxwJ/MGWQ2kFVzKMpwkBDx8F6CFGtgHSxpT3E9gaD4hqfy2YA7/x8e8x70qC
X-Gm-Gg: ASbGnctHcLvCc/y7dm6/Ulux/nFr3kUdrzqHFIpdyWh8CkneeQc85t3eWKnXOrEObzG
	PybaMEIb6qE0LBxdkjhC8827rNsl/Qc7EVWkM5LEBjii/e7N38Ql4GGiw/YzSO+WDBuAOZzjRNw
	df6HC9GYyVSu2Tr8L9AHF2EezqnXj1XcQ77pHQ0vSh90Bl7gD8lx8M6aPnvmmlH1xOssB8+UnLp
	995qgiMEAmqoHq07kKMzbTXOkD59S/EBnRJuJyHYT7fIdOF/XEbRJ1g/d8WX12gCrdhxlZVdZZn
	GVeSBZkGoHNOKjyErTZX95OmyvQOp9R5+egOVMst1ev+QLY/BWEKqmCb2N9aAwYU0LGzvuc2loY
	z16EsTKXm2ShgxqhyPOXa+WXJqOfxN3jyAMfNkvqNwlshBto=
X-Received: by 2002:a17:902:f54d:b0:223:517a:d5a9 with SMTP id d9443c01a7336-22b694c18d9mr213896025ad.15.1744631579784;
        Mon, 14 Apr 2025 04:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPXOEiRYhXgMglgs11kctzcDXDK3b6W0HXJff+ysU258rbYV0ZpyqGT43lZkTX3t1fwWlzJA==
X-Received: by 2002:a17:902:f54d:b0:223:517a:d5a9 with SMTP id d9443c01a7336-22b694c18d9mr213895835ad.15.1744631579375;
        Mon, 14 Apr 2025 04:52:59 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm96425735ad.86.2025.04.14.04.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:52:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 17:22:50 +0530
Subject: [PATCH v2 2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for
 IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-revert_hs_phy_settings-v2-2-25086e20a3a3@oss.qualcomm.com>
References: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744631571; l=1188;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wk/Fhq9Q3rutgnD4Qc6wZpn1xULO5MLO0XKdfB5uUPQ=;
 b=hAqdX7W+eHb4WuShSmXpBAAbTWTL9nQNSkf60MHrsSQNnXnMxz0CKkqs+q1bbkIziNaftbaw6
 tYEmHNpWr39BVfmO5b9O6k/4HC+Qc6igstYAHGbeJm+u/uWJQ6tdEC7
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 7co0CG396bi-vdDfiq3QHHropIef6waq
X-Proofpoint-GUID: 7co0CG396bi-vdDfiq3QHHropIef6waq
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fcf71c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=45MnPZ1KAyxS56gpr9IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140086

With the settings used in the commit 9c56a1de296e ("phy: qcom-qusb2: add
QUSB2 support for IPQ5424"), complaince test cases especially
eye-diagram (Host High-speed Signal Quality) tests are failing.

Reuse the IPQ6018 settings for IPQ5424 as suggested by design team,
which helps to meet all the complaince requirement test cases.

Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 81b9e9349c3ebb4d303cb040b5c913336bb6b6d6..49c37c53b38e70db2a1591081a1a12db7092555d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -929,6 +929,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq5424-qusb2-phy",
+		.data		= &ipq6018_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq6018-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1


