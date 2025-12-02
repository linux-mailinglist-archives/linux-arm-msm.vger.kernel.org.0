Return-Path: <linux-arm-msm+bounces-84048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322DC9A9BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 09:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA2103A4B64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 08:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2C7306491;
	Tue,  2 Dec 2025 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8G7sPOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQMHmLS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA98221FB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663028; cv=none; b=qz5PP9If+lJ4mArqyqeGrGoidjRofb0/FUHseDI8mNZLZpaY0UJ/WXodv6EaQ/D2CnbPBOXx9ViskAX7xpZWkru5QqNM6ZCDb7RhGLu3vvHNZuKml36TKbuaW4W/oxuEjhowF77ovyWS90aqGdpM+nSw8qjxY9oqI5tH4qbBGKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663028; c=relaxed/simple;
	bh=TM2PWCsUIm9itNucX5QsGbxrkbAIadxyZQEgaDGFPrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ayMP9Rwy5B3hJAL1MxkeV+AaLzYDcFVtX+rTLr4ImSOrkMaM6yERbrebqI4QR4GUevYWfBtA2pS6qxdnXa8GK1J4+cvJ0Kj0JobOYxBqmyPNxxMb7DjLlVjy9tNY85LpqZOKnMWUF8ZYQP/XoAQkW2Uiu/VYU844ehVB/q657hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8G7sPOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQMHmLS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1Mml141927061
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 08:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xw4n7QKtCSjg1ZX8a/id12dlKeUndubCAKa
	CK+KYtDk=; b=c8G7sPOWFbcBxuBY5ZrwljsnlaFUNGqZvEOmsvO7khaU2O52Wj/
	xMYZI1kHCWX19s3FbqrhSA5K6+Hi4bea1q+mPE/Mly9yOgZs80DYwQ2DruDK1Lvy
	E4VP5I2caFIWicDiKSrC0b24yRx5FXsdDyTa7FLMPHLfXy34ZrANhpgxv5KtrPjO
	HMWZnVrkZOGHRGZJkHCdL0QqrWNr6elfrkDf2OQTGroueqkRb3mwZk94gaGq9SWo
	tla1qhDrN/mxoQTlUL7FPpkS4VC7eIZHFFGRXrgM6EbOtJIqW4wsXn4IURgTCGPI
	3a2y7lLNjlO/J/VXoSDUYB+MfYfkqUiRmMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm4xse0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:10:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3437062e4eeso1185063a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764663025; x=1765267825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xw4n7QKtCSjg1ZX8a/id12dlKeUndubCAKaCK+KYtDk=;
        b=bQMHmLS2uxai2BMHeTPQkrk6V7/XdNMBs7UxCG8v3WEz7eEeQRCRrkmr/JFrLnRndx
         Tjkb/HjfoIoIU+6WuW3U51/5Ins5roi8skm6zq9lBvG2xqRilzteqkNQ/lGixS4O//Z3
         1arl4gMEIzyj7GdPmPc0V39a9vNh8zeNifohw+UG5Kd04R15qIaRuRb3TOyAjGq5CMV/
         ZoHSHtx9NUu05cUzrYrN8Xa8oBhzW4ylQWpEvOMbfkSONI42NgohdyXyPUPsz/fKg7L5
         9MmEghwBhSJltM4e7pds5ps6qPYCE7ZXNuS6I1G93e+73jNXAKGKKrcdFdfZoH+alcvO
         7fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663025; x=1765267825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw4n7QKtCSjg1ZX8a/id12dlKeUndubCAKaCK+KYtDk=;
        b=Odaj22DAYTqsNWBmS5Smky7OgicSrdnbhRj/9dnVnFs9IFwclpiqYgUoFtPVw2tvt+
         vNgsvdTFPQwSTRpq7eYlg4UX1YUlNh8gf1kjVQUfdxZeV1GBPJ9AzuShJtd67MtsTptk
         xfeRDF4Ar6zszhRfh+aNzoujlsWyhcmeggvpOHU+O0y+FrRinb8EbVt7irBj7bCKOJ9l
         git1nfX/SVvCDUzJmUxjiZktOvcNfZKJGCQKCWeqvuecdvmK2WbDDwlQPZgX/gYGFf/5
         /8oaioCPLrnGUp0h+6qvfKtsATn7KmKPEORnfuCa+0Bk5wMd08Vlf8Q9dB2U/sjKa8oO
         BL7g==
X-Gm-Message-State: AOJu0YwjJbq6FF8QgAlGp9pfx9lJy5g4two0rpvsOSHoG/4yz8wLA8Fr
	xhfkZD5En0NWOeF8JN7GbFP+tTzp81BMbwFtQLt7q7c+eQi5o/HIf9JffoZSJCxHUSgzSuBVoyH
	DxhErEaLSh5xHhnXXtOIf/Nx4wqe9ZAdgQr+1NBbEKk7raubKiQPLkh461bPtYKnqUXk=
X-Gm-Gg: ASbGncssL23z/VHLP6wd30tIHgdPm/v5/vhATwetzYrUWcvw8pHurwUWSR0VjFDfBBK
	7Ni0mD0UQOjWIPe//NsDVAGxWJOQUp4j2xdO8NEL3HNSttcOuv9SEUvQkYkgrmLuxJJlQgOBYT8
	il73P0YRtUIxhlRh2H3+Db2eVm5PaoEzJFc5Nco3KDYItdkiJgEIRgkecUJw6ffVucPGdk1y/Bn
	r/agHttZABGq7xgG1GkYPvcS6+MKs8oDOdwGZGMqDM2XDcBrmOSirHey2fWRCe4uMSF3WGBQEol
	iPS5nWpjlBNtPcOgbZgTYaCjsqeR3quCXXkbTgZcFcBlduvivsqaguVRi5NUe1UZ+oWGuPH22gA
	HsLG1KDuh2shH2uL9xxBVFcZiQK4RwptBAL6J+LBh
X-Received: by 2002:a17:90b:3b8c:b0:341:a9c7:8fa0 with SMTP id 98e67ed59e1d1-34736b7af3bmr22353954a91.4.1764663024755;
        Tue, 02 Dec 2025 00:10:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCYK4eho9CRfxdxsdOlewllrkeEDFHddrnNnGybhgpdUBIoUzU1IL7M9YhVg3q/1WtNs8Nbg==
X-Received: by 2002:a17:90b:3b8c:b0:341:a9c7:8fa0 with SMTP id 98e67ed59e1d1-34736b7af3bmr22353935a91.4.1764663024274;
        Tue, 02 Dec 2025 00:10:24 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b1cbdc0sm15419794a91.2.2025.12.02.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:10:23 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V6 0/3] Add SD Card support for sm8750 SoC and boards
Date: Tue,  2 Dec 2025 13:40:14 +0530
Message-Id: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RbifosdSihIyOQ97VZrqshFnPYpuOBjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2NCBTYWx0ZWRfX5YNMV866J0XK
 Ao0kzZ3tM5qZt67h2aYZ/4kHzf2nzgG+A2IHo6dRsLVOo9QWU4/SaxVDL3cheinOOD7HoaL6Iai
 LWZix7tVJwTD8ihxsDuW1KNiBZD+8m7l1JnlgbS8bfPKuCEENHXOLGaSp/iFLGpSYt2URZbkX4e
 saFEECuyjvV44HxQsR6DfD5gvRnNDRldGGvSpRD6XH1ye0kf7DfOuD9Q7Pt3/VR/S69+ats0jal
 QNlIsumEAu3KO2vbCmogTGfEKx8v/CWY7A5wHVe/d9HQE2Y1a61CIYOUsiHDC++f7+dshp/49YX
 EEPYXw7Lg5WjNaQb1mEpU2CXMIoRNEFM8GlQsejzJCZl/XekrYc5iitGaEtbqteqc1vuT/K+RZq
 5i/ZpBQgXpYvMnM+cjtXZjqIX0Y+9A==
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=692e9ef1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rfq7y1KLf-xer_pzc54A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: RbifosdSihIyOQ97VZrqshFnPYpuOBjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020064

Add SD Card support for sm8750 SoC, including MTP and QRD boards.

- Changed from v5
    - As suggested by Konrad Dybcio align '&'s to the previous line.

- Changed from v4
    - As suggested by Konrad Dybcio sort nodes with a unit address
      (numbers after @) by that register address.

- Changed from v3
    - As suggested by Krzysztof Kozlowski refactor the code to follow
      DTS coding style and use hex everywhere in reg.

- Changed from v2
    - As suggested by Abel Vesa move the GPIO configuration for SD card
      detection (specifically the pin settings for gpio55) from the
      SoC-level device tree (sm8750.dtsi) to the board-specific device
      tree files.

- Changed from v1
    - As suggested by Konrad Dybcio the patch into separate commits per
      board and did formatting improvements (e.g. aligning < symbols,
      placing each item on a new line).
    - Addressed Konrad Dybcio comment to use SVS_L1 for opp-202000000.

Sarthak Garg (3):
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
  arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
  arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 23 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 23 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 54 +++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

-- 
2.34.1


