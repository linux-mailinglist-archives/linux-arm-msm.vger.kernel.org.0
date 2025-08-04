Return-Path: <linux-arm-msm+bounces-67628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D160B19AF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 07:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87B2017053B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 05:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E988421C9E3;
	Mon,  4 Aug 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muXpCsr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701491B043A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 05:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754283982; cv=none; b=ZpxSw0cTQkV2wlRVQEmK94q+iJWxka/c3O0cOo+tJkjfHlTVRwo9nNcWzwPnYyAT90Ea7UkNcvC86EV8UVwwMOFyxk0JZnQU5iBMblkATybxBQMMXHCwZ8C6JctA7/RLnOutkbQ6BoTxJXSzzTIMv+3IVwx0nsiVy7UjP2BL9Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754283982; c=relaxed/simple;
	bh=o+KKhqjgceUKc54+3lwvh9D2uZKZYubKBJvC6PvrxDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IneV7RMdhIKdF/FaNBkb3H6p7z0jk/wE6oW8wMfB4NMe+CWSGtTLP8m8rCJHLDmZp3WRrF9Tsd+25S8q4Rk2qi8QAkzhpQviEn/exdbLYLaifPq8vSlh98hAKGPHBc8oF7LqXXUaCQ/fBrhxUeUOMcpZHItRzO8o+2JshXWbewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muXpCsr/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573LoXJk016577
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 05:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mFgAZJ7P3Zm+6XkWFs5BVvgYy6OJo2QLp+7
	HH563RNs=; b=muXpCsr/zsFbL166dtN8CxzUqtxQo9GaQvp56QrnjHQiI/nJsSE
	j4C6ztRwWvDL+KNADD66Y8sC2T+7sbnMhQPJzbKrrnGgUFg1Ri4F+jvP2zSdVQL4
	TAdmceULpyCPOYYHqG/hJEEGkglnseIR2t8BdB4avGLPLfmfYntSXfi1qv7esaxV
	45hNtxjeFI9mg66jFAkkJcmwVBINQXcrupnNlvKJKqdIDAoDRpLSKju1Af2Hf2ym
	h1EwWyguCa38yFDky7HOliATiKugyCqNboBBjFaqhDHZeXVbuHXGvVGvEsQ04w1E
	4jGkOnp3PYZlhATLYhkNmhtJKb0A1BEVrmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjkrp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:06:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f3b65ce07so6559702a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 22:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754283980; x=1754888780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFgAZJ7P3Zm+6XkWFs5BVvgYy6OJo2QLp+7HH563RNs=;
        b=Tdf58xUlCJp4PVL6kQD4Yd4jEuk+bHhL8Yrsig6NMg5bm2Q9TSxdu/4eiaiOkdRqGq
         M44q/kH6dzPtRuZYWoQvXg1qVTXZYrbOhE8vEdy7wyUNutnyD4GJCV/thCqgiPFemO9G
         O14s+qXuf3HiM0VBgN2RyaDNwOQVSFonC6QsYnvEokOBvwkhH6Qwt5qyLk9A/e095yOE
         s1VajQ38PuBRKDHJj/L4T81zAUI+eAZ1+HfKGAqJwVi90HqmrEr4cj9njpKKLyMyq2pM
         KsB43fkdm558jiHQwC0Kg3Tu6Rt+zy3Giqyx/YD6Bn5ID6C6IwfwnxENg76WVDSvrV46
         BErQ==
X-Gm-Message-State: AOJu0YwGeXl55uDRSxWTnlU1vbGtm7EhOELQfZy4n4EYEHw/RFUfLOE9
	k4uN5QuDr+niiDfLaBy1jTOGBSxLACSbQ6sCfDe6SGngIQbYHHhCtTS2GBiWcAEutMgJirBS0NI
	TZueeQrT7aT+u7AxIQVImOVI9LTFO02TK+l52y8G3p5Flh1VZFGgqsQiQn3dz8d8qtvUZ
X-Gm-Gg: ASbGncv5FkHyndfBIsEO5Qs9HZ6VZqMvlQo7CuXRDIzGNbgfON0FHhr797105xGapPr
	PP9GYbYvIi2KVCMbg/Ty6cODYf4amf6AG+wiC3ssbLVZFNHL3PC0+p2Lkgx5IMc8f+SyPWTfQJx
	tQXGkLFcxOU6+fbn7tbcEP6u3MOBOUt5Bid5o3zKqYby/KIlmfp49pE9A/vIhnmGx5ROtaiWCmi
	L6FPD/Hr50MZAx+G7vvW/scBiEsPB6+2l/YIRd/P8xVigievpajoeyjXPt4cC+pOPRinmUAuBGa
	INGfH5iUndSTJ48AMVu8dld0kwHgLqtLDHyEdNP1FbxbAz0QIm9fHq9KbrrwDLG5C/NvYbWwah8
	kSxY=
X-Received: by 2002:a17:90b:3b45:b0:31e:ff94:3fa0 with SMTP id 98e67ed59e1d1-321161d6078mr11744940a91.6.1754283979754;
        Sun, 03 Aug 2025 22:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGWeHm4SZUpqc8ezy4PspRdFA/54Q0jokeRMGEtdsPupU2NKwBbTJIGQaIB1gJqcWLAo0wvw==
X-Received: by 2002:a17:90b:3b45:b0:31e:ff94:3fa0 with SMTP id 98e67ed59e1d1-321161d6078mr11744914a91.6.1754283979290;
        Sun, 03 Aug 2025 22:06:19 -0700 (PDT)
Received: from e0cec1fbb194.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm99705135ad.7.2025.08.03.22.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 22:06:18 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] Add OSM L3 provider support on QCS615 SoC
Date: Mon,  4 Aug 2025 05:05:40 +0000
Message-ID: <20250804050542.100806-1-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=68903fcc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VdEDuztqGucW-MqrkSEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FfYdGn2bpmcArkRyRsBLgtCwgkHe9w_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAyNCBTYWx0ZWRfXyUwscfSW3KDO
 8eDpxujGqJPFZkrpiSc0Vig7pV9k/E+R5ghj5yzvarrGlF6Pin4FXvNyVloxdaIEnkl4ReeWJmO
 Q8T6A59osozXgLN2j1ENhjzmsXS3W99ClAySccrwDY1r81TdSYE3Jvb6H+kIgQ9+qWuRl79+Glk
 kAhtdUOiTyi6TNJpwv4F2UTQS9cbS3jp0MncseKP6UXvUMVneTwABwm8RWsI4ioaFs41s1eif+x
 ECShF+sqtgtZhsyw03Sj36vjp06syRwmQ4bOgnc6g+m3nI5CdO88BCsZWiMM3vuyJe6Ri053mVz
 dusdtZQg2KMPjRA769sr/SrDmXiSS3Z+KP6wNoKoCEdPLtjvGcP4iS6cXJTwg4ws7CeuAwb0MKR
 awtS33Wk0/smatS2Ubjxffpd7FAoEyWi524OtnHLTHGDNnCYmQy45UIwTPhkYTFSxUuKZqy8
X-Proofpoint-GUID: FfYdGn2bpmcArkRyRsBLgtCwgkHe9w_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040024

Add Operation State Manager (OSM) L3 scaling support on QCS615 SoC.

Raviteja Laggyshetty (2):
  dt-bindings: interconnect: Add OSM L3 compatible for QCS615 SoC
  arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and
    CPU OPP tables to scale DDR/L3

 .../bindings/interconnect/qcom,osm-l3.yaml    |   5 +
 arch/arm64/boot/dts/qcom/sm6150.dtsi          | 148 ++++++++++++++++++
 2 files changed, 153 insertions(+)

-- 
2.43.0


