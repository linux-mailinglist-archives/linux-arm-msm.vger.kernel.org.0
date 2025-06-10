Return-Path: <linux-arm-msm+bounces-60738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F062AD31A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C771F188424B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFA328C033;
	Tue, 10 Jun 2025 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKfdBQj+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB428B7CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547095; cv=none; b=pZozvM2HRba9VzrfuD5jVHvjZqUYYBEpNJqPrLPQs5ATJidMvisxszu9VuxLoHEsb6FL/YqjBVT3x9n3uY7fJshYYMc01D0bp7TTObeywsRx7Xfohm1Qq0moRmG5QuZ3vRjmkJlsIBpUOQc9DE26AoKWXBdouDbRPWDLpo3r4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547095; c=relaxed/simple;
	bh=S02eX3cwwq3IqD5T1Y/z8bQjR5t8zDb4jbbctA55FK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AhZXpyq73xKmAlahDOrNU+TzwCqx18LItdQRegjYPaPTuHyvWCcOtGVhSDgVIDid4xEYJJvnk1pU9k3ryHnAZP87+P9gSGnyCtPmho5p8dhZ57pmVPaVHFnIlJpnrg1O+etX2nX7GCGhA4cOc4Xk0r9DzjLEaxbthXHG/8ttE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKfdBQj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8wrBb001471
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LD/9cXhB15D7e64MfPVXxDkC/NmdpQlnbE3
	wwb3R8hk=; b=BKfdBQj+v9xEWynAzywk0NwBVBT3M0DtiZKhfuxUDLOCxQ0V/nj
	UnBrLTaBQ4zIOzH5gaw2i9ikz5hCsw5e+cnyFjkFenwNorTF4TcON+cYglxsR4rm
	uJ/TmR3HpQZg9UeSDI40K0ZYD7hJgGU3ngrQcAjdAus8WpfZM/k+8WhLrKxk9488
	3A2OSyip7MkMZB44YBw2p7YIA31PSMzrD1qwIzDX5PXEZvgShq3hy+ddGJ6HhyVL
	4yWTc1JzCotvU64PxjgfqFKvCDY5+Nw7n5o4F/3kH+EX7pkoZR2ijZYSr/EvKlTY
	kv9X8ZgZf3q1jOU3EHaRkm9DDT6srsZlBHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn68rmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:18:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311b6d25163so4568339a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547092; x=1750151892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD/9cXhB15D7e64MfPVXxDkC/NmdpQlnbE3wwb3R8hk=;
        b=PSir7ThdXFfl+vYCx9Ogj2PkhhzNDHjO/HkSbdmN1AiR+BuwItyuCOItj718us/KhR
         1mq3t0KSIr+bBTmFVihxirW7E5Ivx5+6INhTsoBj33XTa9OQRRAlDWGrFOhXer3HOl7H
         ndhOfRltFzVTyISL1dqKJhcKcP4Mc8Pn5dtfTotEdB6nPGWR08ZIXBF8gVJ9d29TzkOc
         3djV0XYA4Dp7m9vXLIVTxfrbfJ3XxgJW6IY9KUE5K8pq8gd6Kz0s6kPKBh/a041k2U5t
         7hEuj3UBW3ed6ADzbqh5YUxq/O3C8UK04/qv1OIT62rKSOFpaVRZmKT+DqjWJafvmIqf
         xp5w==
X-Forwarded-Encrypted: i=1; AJvYcCVmpq1SeWWyZ2lYwxKX3VZfRFbcCO3beal7VDcFTaTsIxxWTOee35l+Fd6rFJZxt7/0cQ204PrYNC6r8y4H@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1lCq2UIMRknyXTgjQyYnixnNN+co050SvnoFrCbInSh8NUsj
	kiBuZzbE1++8XAOnQnzhGJLEZg6VLUHOi+LYy7RTUnSTd4atpROUYs145YMCB/rOIXAyYoFRGqY
	+ZZtg/WaLyZwk3XJuMAWxI6sl21wxecWtNThY8JAKHygKt+l5847K5jzWn+eaR3bhsOvU
X-Gm-Gg: ASbGncvgG9jABDc6AVMh+/7ncQbvtBzBEFM1+bFpoENWBwlXyt8foKHBBsktgApzVGu
	PS0K5757W3IQhhPsEoVQnIm6cXDX9n0xlwxKPxEOny+gEEfYQjbB99530P4gQRhdFP9AtHhNx7U
	lG7xWcJKjBxcGlS1nJfwhV1LzcqWTjM1i5tQ4HaZmIibIKHwPC9S5nbIKqsmErOm7c/Va6IjqjU
	QrCArBXI9YJftaloMJ6wq+9bFHhG2qHzO1cmep346P8zJ4aT6qC/nz65jk3efp9PfEgZFw1kdkQ
	rN1jCBEWuT5mPScMl67wxOGM79K3v1gTKv1jNxWBsYY0IIhcrZbeB7SyHg/7
X-Received: by 2002:a17:90b:254d:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31346afa132mr21731762a91.4.1749547092314;
        Tue, 10 Jun 2025 02:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA6A7Fb6MP+DJ9bPZH2QmIbZNP81kULJOwxSyuh+v1p3lpVKxB4ERFlDWV9kdLaXlo1o/WCA==
X-Received: by 2002:a17:90b:254d:b0:311:c939:c851 with SMTP id 98e67ed59e1d1-31346afa132mr21731729a91.4.1749547091884;
        Tue, 10 Jun 2025 02:18:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603d14206sm66951195ad.34.2025.06.10.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:18:11 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Flattening USB controller on SM8450 QRD
Date: Tue, 10 Jun 2025 14:48:03 +0530
Message-Id: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfX9Bq2WCyhQcp4
 6CFd6ka77VRDu8wu417BI5fP/SHBu8n409ydIvM3mf2WKqJ+TudykXqe4WN4h9lpHLhgosGr4JE
 8NSc0flSrlmMN2EnyuYGYp1wv7q/Pla8OwUV42p+tEZRaMtSvoNuSL9hX9oQ1hD1w1l/kzsqwIF
 tIBbJ11vX4bGgj25YzqVr5/fUlIsDuRMvBdH9BE5idNXHvxHUQs1IWKA8CwSV1t/+w0YrNhyqbP
 0SpuyPymkDqc88GvdW+lG84e3bUlASxHYksygv7/MfB8ImklPvUwND2ne1ODQSE0bNn7DU/wDeB
 dIcGK9AYEPzsdewmBsFaih7Ip/bWKDT4Ri6Wti/jDU60Aex3BFL9qfZYq7d0Ax3q7pM6C9uYMU8
 hx++MEOojPjdD82z5i9peVlR4Pgds6C0iVNvNSVJfRuWfYVjYCTbsIA1Tim5gLEnRA1T4hhm
X-Proofpoint-GUID: 5C9FGC2YwqcjL0rGJBbKowIowKBWRDZv
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6847f855 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h4yBHxX_cEBQcTB0eGkA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 5C9FGC2YwqcjL0rGJBbKowIowKBWRDZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=820 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

Flatten USB Controller node on SM8450 QRD to move away from legacy USB
Qualcomm glue driver and make use of new one. The series has been tested
with driver changes [1] to enable runtime suspend/resume during cable
disconnect/connect scenarios.

I was testing on SM8450 QRD and hence flattened usb node on that platform
only. If the community suggests to flatten all platforms of sm8450, I can
do a compile test for the ones I can't get hands on and send a follow up
series.

[1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

Krishna Kurapati (2):
  arm64: dts: qcom: sm8450-qrd: add pmic glink node
  arm64: dts: qcom: sm8450-qrd: Flatten usb controller node

 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 110 +++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 2 deletions(-)

-- 
2.34.1


