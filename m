Return-Path: <linux-arm-msm+bounces-43201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59FE9FBAA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0CF4161946
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E9D86250;
	Tue, 24 Dec 2024 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqM9bkAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA28816F0FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029996; cv=none; b=sqNjZ4IVUGxZ/RgnqPQ2sILUSitTCZIxZkH6f2qRVdh6QJ03X/cd9/oqbk91kxhCQMgex8TYKoOm4rEYk3Jje3hMvCpDox3gxuMSlPHvWUWXTDNYZMb/vxgjFGjTug/J/f6XEWLaw3WWYhigx36V9wCRywWCPg0ffFTf1fWqyZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029996; c=relaxed/simple;
	bh=6m3t0Q+ee8LpnU5pwY7dC/s+jt8r2vlpmVm/8YgvW3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=REQ4oUMZzZjoMGze08M37DBZeba4FgNeJXwDIspYetb1c1+wA7fvt+onARiQn+fdmc74xj4IB6EZmkWniSi3RVmejSsrjF7Mty9qRLxN2kPRRI8QmHVo5O2dwKS85XgFI3oFTX2wncTue6/C1p0FoEQnaSCr0zykYFel/WgCfKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqM9bkAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO0mcju028855
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/dFp7/inuZ2ik3aChnKC4Hn4A+aJ5IKNhmJ
	4jwh2274=; b=YqM9bkAp0N/XzURdMolOT3S28pZZssHslkXEiR52EjCm8EzHhXV
	BOWDtePHVVPiZI4oUheSNC29xHTV8t1rHH4xIGkuLxBjOfVi6T0LEEG+g6PVA+ZA
	F8RGiV+nFxfLmm5U5Wv6Yobc/wpBORuloD0Nk6AyQPtAeGtqMj2fhAx8XR0T2Nbr
	VgHkO/FuEojVQC3ThrVFf/HirKLBLTJL8fVG+jcwlb8EbhoTI8ib3ZH/xkJroD8t
	BSGYpjIMR9m0CqtDDI02/r7vG53ouzutNzbqtthIMZZ+jZi4cEXDCw+jym6Tj0hn
	c44P5ABvtHxN5FT0Kr4XgusJPdjrEBg1r1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qjqvhqqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 08:46:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216430a88b0so50810795ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 00:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735029991; x=1735634791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dFp7/inuZ2ik3aChnKC4Hn4A+aJ5IKNhmJ4jwh2274=;
        b=PPFj63GqL3652oSWHD+q7DdZettchWrbndvzAaK9OS4AjTfnWlqqs365SeYCSZ/bOf
         ntUGjiZ57u4uxZfCRU/vqw1SvIj2m7pj4xyg7x2PcNenGcb4vDQDyKXOWjImUVh2UVbv
         7nmS2DDHKnI0mD4PijzZsQxQVpquiUdklmzA7YBHYrKzShilGVJncNzpqulLHTZL956g
         jwf+kv+UGj6olS/RktPYCuLrhhpRj3p8RTyYQlbidxO44rYJHFaduLa2XMsUXBkjKD3r
         K648ryVJjCU9QqjMAyK7gGbjj65moyl1dhc7XspNT1guDN1UDeHm9Bl+uBH1spblN8iB
         FY3g==
X-Forwarded-Encrypted: i=1; AJvYcCXUiIMnQq63qGPn8MpSLMPYoW3G7pBTU1kGSStB+87ckwRTuljKde0Xfrnkl/8TbsANOA7v90vDBd1jTh01@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHHR6JEqEyXkeajKDabVqwwvtxR3Eandunl/DC6M9FlhVx9lb
	ZvxiDWKw8HLc4795qGSj5ZhU5LdacsYnzs8B/pp9RKLT8BnRAcmhSzg0zbAUCd3NjvNr5MsL9qr
	JlXk4QYhYlv+ljYMeydwS/sFtae0cgyJ+mww1sJr76WaUS/Gzl9Lh+PZprQOdBWcG
X-Gm-Gg: ASbGncuG8k4nMG0Duns/H3NC9Y9bvclsdS47Fv89jVQDIg64ufbuorHpM4SCBXY7IHI
	dsvWEwsyL/L/Z4a0Wo+PFMOjMMIRk2PgiPwPD/zuWAVxNEm+jyQWDGuMUDGhQuiJQwJf8QrWSM4
	7DaqTSzMMlVql2QZ3QTt6nOGp9UShy8BA5hRCLUrdkQruJRQg+LDiOrGg9BIUs/gvSxKBnNcnLf
	GdQAM1xHAzck+Ms39eHAkd4IX+5o9Ey7K23rVfeWnMPe7hYNCxRjTTb+spuBEr0Sl2t8weDu3vH
	5te6Xy7lozq4aOaMQJY=
X-Received: by 2002:a17:903:2306:b0:205:4721:19c with SMTP id d9443c01a7336-219e6f1448cmr197392625ad.37.1735029991378;
        Tue, 24 Dec 2024 00:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx6N+BNVCJnCmEfHaE8WX8Zsoe41fiC374QBtCvPlMKHKhsQSSjWcfjL9+FH+eBLnuvq+wjg==
X-Received: by 2002:a17:903:2306:b0:205:4721:19c with SMTP id d9443c01a7336-219e6f1448cmr197392315ad.37.1735029990976;
        Tue, 24 Dec 2024 00:46:30 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f692fsm85471195ad.216.2024.12.24.00.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:46:30 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for USB controllers on QCS615
Date: Tue, 24 Dec 2024 14:16:18 +0530
Message-Id: <20241224084621.4139021-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: o8Gnvt8BNH5nqDtI3tA9bk3wIYdA2Ksj
X-Proofpoint-GUID: o8Gnvt8BNH5nqDtI3tA9bk3wIYdA2Ksj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240072

This series aims at enabling USB on QCS615 which has 2 USB controllers.
The primary controller is SuperSpeed capable and secondary one is
High Speed only capable. The High Speed Phy is a QUSB2 phy and the
SuperSpeed Phy is a QMP Uni Phy which supports non-concurrent DP.

Link to v1:
https://lore.kernel.org/all/20241014084432.3310114-1-quic_kriskura@quicinc.com/

Link to v2:
https://lore.kernel.org/all/20241017130701.3301785-1-quic_kriskura@quicinc.com/

All the patches are acked. But some are merged and some don't apply clean.

Phy bindings have been acked on v1 and have been merged from v1.

The v2 DWC3 binding patch has been acked but conflicts with sar2130 code
and hence v2-patch-1 doesn't apply cleanly.

The QUSB2 phy driver changes in v2 conflict with IPQ changes that went in
recently and hence v2-patch-4 doesn't apply cleanly.

Changes in v3:
Rebase on top of latest linux next to avoid conflicts.
Updated mail ID from quicinc to OSS. So changed the SOBs and retained the
ACKs since the author is still the same.
Updated cover letter heading since the changes are for both ports and DT
for first port is merged and second port is ACKed.

Changes in v2:
Addressed comments in v1 by using lowercase for reg values.
Removed explicitly setting of struct params to false (as they are
already false).

Krishna Kurapati (3):
  dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings
  phy: qcom-qusb2: Add support for QCS615
  phy: qcom: qmp-usbc: Add qmp configuration for QCS615

 .../devicetree/bindings/usb/qcom,dwc3.yaml    |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 27 +++++++++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.34.1


