Return-Path: <linux-arm-msm+bounces-87652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D446CCF7678
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CC7C301052E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0790130CDBB;
	Tue,  6 Jan 2026 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOhpBJT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaV+LWH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0430C342
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690476; cv=none; b=epN6fO32+Ax4BRc48vCo1KF5cm9QqTau2M4jVm9wJh++C7ZRnJQYvCCHjoM6pN7LSCEaPAjVZfruijHLsxBT2d/tmyGcjseinO/+WKEt3albVXlfU5BN6WJgM8pP+eqNMtHLqmRrL4qOZSUSDUTQaEbtSHqOkFhtYE4Mb9pEnKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690476; c=relaxed/simple;
	bh=X4qJ2D98qGhLijujFDY5kqO9TmCXMN2zWv7tK9kzQXA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=siVDojFT1dXHJCjuY8o+yFjuxiv3u+HOSHWUo5VXpw7P5kX/vbEbWMBWcmVUhh6dXL6bEaIBm640uFvAptE84wVn6ssnhTvjOcYmkRe2IgIwY/MxZConPwSQTJHL7cq9jmq1yR7p4EKRJCxoxc6NLEB0io9uM9VrOFv4mFUXe/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOhpBJT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaV+LWH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Qnbi3443623
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YqGHxIhVIKqmM3RvYNTkrh
	Ug0l+CB7V5UnftpY5yaxQ=; b=lOhpBJT85cMXGDAwBWBB4g4GOhXU94mTb/+Nib
	7aoLpHayixSJ+QpxAGH304dn2Kk5cmIAwhgDBdpknNa5PssIpjCUrg4nxUh7PYyd
	5z9hFwaJl7fP4Y9anb2PH+swCzYjPWtd4Z9SqSM6IFQa6Z1AUkh0MzZv3tnGR2Gj
	LpKdJzZYUjglOiUMMUFVVou3WUwC5qW+c8j7ztwEXK7Tr95yh4inf6fu180eb0iL
	+zkQu0YlgEIEtonCLKEUrf4jkKESo6zmKyudo0N1G5zdPjQ5YCsLhRpQGE4by8Vj
	DEMWN0In2LynEv0AjG+4ASWsgkEhlFF3g+EQFDnXPmr4PAVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9tg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:07:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed782d4c7dso12456711cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690473; x=1768295273; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqGHxIhVIKqmM3RvYNTkrhUg0l+CB7V5UnftpY5yaxQ=;
        b=GaV+LWH4/+0Qa8Y4ttGuhZa3hlbtRDmPQxBHAufjpP5vb6FWflL0noVkc4ywp6qmXn
         efuzM2gaFYFeL4Pxsx7RxWKiqSAgNSOvLaCydaFIMviaDEcUmCynyk4KRj9r6HX10fPy
         TjFI4BYnlu9+vTI2MPmvW1r4u4r7eXINt91EPSBfI2Vr+MkqrN0+ppCNRxaf8FjMpIlA
         CoqK81FL/8XU0MphcFBq5PFtabHvC/AkN5SnDRYmH7T/erGht7cmhq4T+LqedOMqHjI6
         rMVy1IThZ7dRoKeXERJM5O0+t2EVIlVJeRqR6M2rBqoIQtJw8SOvUYJEZ4tPGW1KCbfQ
         tewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690473; x=1768295273;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqGHxIhVIKqmM3RvYNTkrhUg0l+CB7V5UnftpY5yaxQ=;
        b=QSmTxqQJsmHbJwkilQUn9+4jT/kzLbQcucP+ohYTxuMXKXBJYMQd4z8MPHzTmBimrO
         2MZVQnnGxTJBTSe6/Dzq8cb91HXtH1tQU199Ln0MyquNyXg69aFqedh7ud0y5zxOz0mH
         AX71qbuoWTIWc6b/kB2CwmaF9/Z17USkJi9959C1q9Vqin0+Dz4fiJpfyX3xlLbs4Vao
         YqS4qffIYORFQA6gFhpO5ID78E5E7jAaZOLOMvHAAJXuMCvVHs4+kIOAcAzZBB4FgtRq
         4QOhQXbcYG39NdDVYtqjg1Zm5/TDtz3/bcD3XZgXRYSRO2lraYo3WYkeBcUc2cQUDfvy
         DXkw==
X-Gm-Message-State: AOJu0YxVRE+U8j8a5YJSnokM9qc0CkNBalT0EK3DC4kQT/OR5ksFc3jP
	mhn5nVyjhbUauWzNKc0ToS69l32QFjl7+3IjVayAdHuUu4ViHrOwx8ucik0N6qlTDmi0J7bSVh/
	MJcuTy3PXQNYX4+rMMJMghFGJaTU4tDZGfbhpqop0pztts+OArh7fXfpQOmqhvUPbNhCo
X-Gm-Gg: AY/fxX4Lx//yKN8ZOWVBTKHHg23dz2fEDz/WuGUNGJDS6bCGCYD8JZRCrYJIQUVzxpW
	5u/hTnk6LcachyzPSHdCdA1/JMQbSav/9LIaCkk1fpwf1aoTPDtQ5uuMIWpkX04LqyUY9pkT13g
	hmfh9WOhQhXfIxGD4xmAWcicC2RDj5RPERaf0pxruPo5rk2OO57OoVTVWTIZvZCUZfXfCpZC6z6
	9EgKfLYtAYdPZZrvF30uDk8K0BGASFb/2UgLwc01ZK/HULzmzmjVxe1C2uUmX2sSRMqkBCEtPIF
	0gxlZoHaYACT1+8lmK9U8ikp5RobvRB+oxR9Gs5L8NzdF6/l8Qh24EFlipQcFUBmeCfpBTcJBL4
	M9AXkFitTN4pyyZN86UOPCzZAz+3JwYcsRQ==
X-Received: by 2002:a05:622a:2b45:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4ffa781f3b2mr26601191cf.75.1767690473448;
        Tue, 06 Jan 2026 01:07:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPlo0BnssObwFNo4iBTv3ZYOVOeQG05tk8hMyRS+f+oXu6UfPpy2JrNK5cEThPmZv96iGyoQ==
X-Received: by 2002:a05:622a:2b45:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4ffa781f3b2mr26601011cf.75.1767690473036;
        Tue, 06 Jan 2026 01:07:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2bcd30sm176270166b.28.2026.01.06.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:07:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Date: Tue, 06 Jan 2026 10:07:38 +0100
Message-Id: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANrQXGkC/33NwQ6CMBAE0F8hPVvTLi0FT/6H8SB0xY0KukWiM
 fy7FRI5aDzOJPPmKQIyYRCr5CkYewrUNjGYRSKqw66pUZKPWYACq5w2sjQynHNnlSSmIH0XJJa
 +tL4yiOBEHF4Y93Qf0c12yozXW7S7uTxQ6Fp+jMe9frd/P3otlSzSDIoSTOYB1ydqdtwuW67F2
 +thNnKV/TQgGlChLpwFi+i/jPRjaA3qp5FGI3faGgNVqnyxPiI3eJqMYRheuUYeY1IBAAA=
X-Change-ID: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X4qJ2D98qGhLijujFDY5kqO9TmCXMN2zWv7tK9kzQXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNDkKzTFneDfThw/jE1JY4uR1rxGuKYwAxBMW
 mG62ARjFyCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzQ5AAKCRDBN2bmhouD
 122LD/9dqEmuN7+P0PxdlCsGhMICEZ/hi7nmfoBysCh0CtIe5L3t9ELUVZrP0S19mUWI6WPcZYp
 C08D0/GwlC88gfXQ54ALWZHae+23E4QVWMk598F66p9zvi+AqF37mKj6BJk4ZRKp4BoRTGkcZk1
 MynljE5blXHD4vXKS6hC0zqAC1PCVUcd+nz/I/gKflaTdDCr3pTH66823sYBCVNvzYf9CPbUiOf
 XauwGDec4MBWAHzz9iPz4EgJWSV7l1MpmX9TZ4qJJVSzcJOJGfcnhU+IRyi+Kxhfcl3vDWitB1E
 8P+S51lagbzl8XVNNsT+XQHs2m2pbOuUYo99A92gQ5dWMvfE/2QYeJOeF8K93EtS59Q6TWd2iO7
 8SNREXNno1ROijUnIEiNvR4cRM++ltaAF5yc1mlcDL3Nj+IhoC3SAxIxzGHoLwBsMP2UxRU22Io
 B2MioYgzRFRznnz5TCkuceGN+JWmvtezGC6sDjlSDS4BFYzMkTqGq2XJMdS5ecqbfd7hggDyJ06
 V+og0nPyjCu74ZrDG1LiyEdl9DBqUgxQipORq8OO36BvZ8sk6NFlrG5qQBz0TVnWhnI5RJ5N8zy
 kwVmlKjWqqSElIs0BlnId1m2xvzDkRwPQh6j4HMSmqzhQw8U9Ymb5DOV1pchxc4Qqs9Od75G83e
 CLNJz3K/NLEw0dQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: dKZ0gMjrzmrRN9Eyx2ihMedx2zxVCpOQ
X-Proofpoint-ORIG-GUID: dKZ0gMjrzmrRN9Eyx2ihMedx2zxVCpOQ
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695cd0ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=98WjNe2C1iC8tDunrpwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfXy9JBw67EnZSS
 mJzzTF1L7CVUaBSD2tvr0ffjOItJiy6OaKVP3zG7FosMVsqXgluHMMdR1Ve4jxXc2BsZFzov0fv
 WcfD/ly13BBZprdgh6tB6KX0qjheD7nf4HoFAlIylKWxBCRsixmfPlTKlKXxkyn/2USOMl4zI0E
 wQsUKld6ruwF1zQrxG86x6lZ4NmPdaegtoMQJR8fgigywdzJVY01rls81hu8AchMj0MaZeaXelH
 xNnFEi7b9BCRbYfNogKGSXuIkuZgAbpIkCQ4EPJ37Ok9Rgluy4D/Tc6gi617cc+ptrSqchn/HCb
 uLjkx1Nk4zLpNjC3PHBMgg88LMsktE4HAMHpxjh3HLDc5eZNaxWH/c52bMCFkmJC1SJ/sNG3z6X
 ZfACPccFVYfL+YXmOZ/QpaDsmlttpN34j3Tu8byJ9aBf6f/jgBJt1WXKHM9z/6wcHU2dCNgkat7
 PP9aqBOSSrLHMvszEZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060076

Hi,

Changes in v4:
- Add required-opps to fix reported dtbs_check error
- Link to v3: https://patch.msgid.link/20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org

Changes in v3:
- Add tags, update dependencies, rebase.
- Add missing opp-570.
- Link to v2: https://lore.kernel.org/r/20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org

Changes in v2:
- Patch #1: Add RPMHPD_MXC (Konrad)
- Link to v1: https://lore.kernel.org/r/20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org

No dependencies, can be merged as is.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      arm64: dts: qcom: sm8750-qrd: Enable Iris codec

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts |   4 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 121 ++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
---
base-commit: ee5fcf7f77ea551082fe5bbc257aa3b727571494
change-id: 20250714-b4-sm8750-iris-dts-ebdb5dc4ee27

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


