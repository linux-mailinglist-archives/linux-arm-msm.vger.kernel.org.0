Return-Path: <linux-arm-msm+bounces-64921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C889CB050E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1E6C1AA7CB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA8A2D375F;
	Tue, 15 Jul 2025 05:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBssq24u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C6D25A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557271; cv=none; b=QcnRmaoc2fdErHUgQRrtyFYXy2G/MylbjXq9odlVxmmRXCvxheeSxH26h6bUGHG1PEZylLeMu2NL0MMboW6oQy+DWCUaOSbAB98iPZBYjVosNFo0P1/fGI5pZaUYTZyJ3Lon1uk2RXWz/BIP96KAMikq3d0OF010CeSnTlr61QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557271; c=relaxed/simple;
	bh=OdZcOnWlDlS0Dtxl7r8WgOSua/jQ0jnj/DPRfgyS/xw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DfgKQpZrLdr7pBZzAptv4NAKSuAwltuDMHUDfB4rc2NJPs1SN6gLR6n7caK8l5kjSPnLQEDG8+GIZsLBSZ5z1icSnKF+ij74PHqB5PF9OmXdHgU4bnX+n6wSXOerRZGrnkjr38I19Q4UdcaGNfdkbfgZuxUNt6c3wZJIMae9Lt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBssq24u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EIYxlW027348
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c3c4FOJ9UeCHswM4DxqKozbwHlRtODnFqma
	Qc+sA9Zo=; b=BBssq24uFDgbMHZedYYBTZ3qlI+JCMPmDPNFF8rMGmmnySjxwI7
	O36oZwK2tT1WE4N802LuA3vBzY0RaYEuCPbxaBpFaglN9c3DFeyuYf1E7BGPGwHi
	mCL3RIhTLMNWdgifLExoxBRXZH0F1izwnxfdijQ7GJyUcYQnErm+YYOjnznu+W4P
	751Gs7RQVb5t/nynPMgaliaoA73K1s4jghafciK6feBOUYQK0aiwNVGlFdtsife6
	/8lisaIn8UBsGr+pXBDf2csqC4sa/cndvwjcT15YQEJz7xpy27KO/6SmXhiDODG7
	dxKa8Nl/bmJd9gMGQ3q2oisTlBNMVIOYz2g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37y1s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 05:27:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74ad608d60aso4426582b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 22:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752557267; x=1753162067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3c4FOJ9UeCHswM4DxqKozbwHlRtODnFqmaQc+sA9Zo=;
        b=E0QSbldG7LOomUOLupeciswqL6KrhwfULwPAstBAP46ZXEWXdA90zBboKlNF0+WVqU
         U4Qo3XcuNnTtfYvlQ+2CEwzbsAI4d8sCDLJ4ZJpPO47vAKPmlL8J4Zv0uu15JWaqUwxE
         reTtOndgBzo7770OyHT5hjPU+8MtrEnohXO2HtZMPUReaCQY68MDUPVqSh5qJ5KLJrx5
         utP/OpTWF5j1uys7llIGp9LXNYYw72aQOQzb9UREKfhBfXI48QR1VU+d+aHBdr/gAHMb
         beppYGRJIXVons6HWxdIWyc5e7iEDrg7506GeTI3bdBWEwvdNhUlyuBu+5sUZb0t1ehZ
         /TQA==
X-Forwarded-Encrypted: i=1; AJvYcCVSeRn0EeQRFAoOHUHmIE+zPmnLtJMucPvIMQjGHYZqBgIb+RABdjf6uiJKmTJnPvAkH/8SXBE96OeHLzIP@vger.kernel.org
X-Gm-Message-State: AOJu0YwfuyijkNu49zOmxSTGy6z7iG1yGQjxmEfq3cxFEg1K1itNvpfa
	Op7vsYRAyObIpoW3eSrnM9CYgXuomCQA0nnHs3pgryw4G1LVgnvdSrcGWzH52jrkuxBGDtOjuIp
	WXU3Yrw8tmclHfN94MrEYiu1AE2jspiyE5IzX0kbbjG5XdVxut14CpcjWftppOEYWFqqQ
X-Gm-Gg: ASbGncsGuYqNHZd6OE+kT7Y22CJyZqoBO7klSU7KuKc7wLXd/4p7YlkaRWT9wiNcKKn
	a8b4Ku5sWL9OXQZkoqWffVO06t1bbQcX6tbLJ6vx/81+BPZ3JRdoGg4Qjc+pirq6U9de+LGJSFt
	SbZntFqu0x0a5oATYtOTrWhrNJsAKs308lzB363oxbsSpJceM4LQjVYHChDoDtTrx4H6m++yGzS
	fy6G8vsVcckO6NgbR2uYXAnvrEfZZYPXttHcdVURQ8GY/wYkp2YbBo6iTtF567hSXNYMcBY7WC8
	CToAZ51HihFjjNZwO3nctFnaEsaVVKgibgdPnb6IFLz+O0pxiUufhmwYTswr/4C5zQ4HS24wT89
	yng==
X-Received: by 2002:a05:6a21:7605:b0:232:1d30:cd90 with SMTP id adf61e73a8af0-2321d312340mr12459682637.5.1752557267061;
        Mon, 14 Jul 2025 22:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBixWemli7vwhqiHf4hBXxvnp+xBG8sPeb2OboZSZ9D/ipl8EcTiq0MJAoOKcPp5S+rS6rVA==
X-Received: by 2002:a05:6a21:7605:b0:232:1d30:cd90 with SMTP id adf61e73a8af0-2321d312340mr12459662637.5.1752557266629;
        Mon, 14 Jul 2025 22:27:46 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f24dsm11071535b3a.156.2025.07.14.22.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 22:27:46 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Flattening USB controller on SM8450
Date: Tue, 15 Jul 2025 10:57:37 +0530
Message-Id: <20250715052739.3831549-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NyBTYWx0ZWRfX51Eevdn3c/7I
 DBCGvLHyWmv3HkwCGtsShZbnvMys8C/NiwDckxe93wy/1YDSGjxchfhcM9QX+1lMfmjF/trFRHY
 tw69izq8f/lPP4NTi3f0UaCgsnQASi4cNdwpXRU/6SzALtvi9PfFu0RK42Y7Xk1NgsdZpuh6i6C
 uuKYyw37qrwmsuD+kZWPLqqpE4i7fJb41GIJmJLZwMi5WLn823TRi/j39CT7kW497TYQRFw+0XF
 GHd3YMAwMNHRT5djEEJvT/LnMo8HjJ7+QNNv9430I4ZDGLci9uvy21GPEEgyeCTyfknkMKDccTe
 Ro7v722KfVPhgzuZIVrzX98sFtjXV6cl4ZUVdL32cfPq8LXJ6uvwMDRRmZ/+jrUikYf+2NK49+7
 S4AyAjKOK863JOLUhKSevZfHUeBrx3BOUXDdZ3Zy1AVGApaaeZOqlyYkjN1DrP8U2IIZmE9u
X-Proofpoint-GUID: jlW6355jn5LZG4d-s8-LuDIx9YdwlkkD
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6875e6d4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UcbzNMOkSj1vwIQaWDsA:9 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jlW6355jn5LZG4d-s8-LuDIx9YdwlkkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=746 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150047

Flatten USB Controller node on SM8450 QRD to move away from legacy USB
Qualcomm glue driver and make use of new one.

Tested the series on top of a QRD. As per Neil's comments, made changes
for HDK as well. Gave a compile test for the sony-xperia-nagara changes.

Changes in v4:
Moved pmic glink node above vph pwr node.
Modified reg offset as per comments received from Konrad.

Changes in v3:
As per comments received:
a) Flattened all platforms.
b) Addressed Dmitry's comments - moving properties from QRD to base DT.

Changes in v2:
Rebase from RFC.

Link to v3:
https://lore.kernel.org/all/20250714045310.2092385-1-krishna.kurapati@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com/

Link to RFC:
https://lore.kernel.org/all/20231017131851.8299-5-quic_kriskura@quicinc.com/
https://lore.kernel.org/all/20231017131851.8299-6-quic_kriskura@quicinc.com/

Krishna Kurapati (2):
  arm64: dts: qcom: sm8450-qrd: add pmic glink node
  arm64: dts: qcom: sm8450: Flatten usb controller node

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  5 --
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts       | 51 ++++++++++++++++-
 .../dts/qcom/sm8450-sony-xperia-nagara.dtsi   |  5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 57 +++++++++----------
 4 files changed, 76 insertions(+), 42 deletions(-)

-- 
2.34.1


