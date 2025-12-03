Return-Path: <linux-arm-msm+bounces-84163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C839C9E3D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B043A4904
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F139D2C11D6;
	Wed,  3 Dec 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7lFsHS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyXUGkc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799A8460
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751007; cv=none; b=igGkijqbBKQXE9ZLor0Zwdul01JVXxEPNBkoNcdSV1QDQ/f9a72CUsOwdZk39LmhgNIBxza1sJ3yugLcJu+FGRrcpj5J+MyAoY49cNmWPgNUy181FLFH3lAPibd5uZYQv1usCSx8KmhvVBvcjVBEfmxOjFUYAXRdF4iaaF2B2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751007; c=relaxed/simple;
	bh=XzeutB6SQqbBrm8weCmxvKn8QPjcaVMvoEVU8C+tDiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WEKEMLQHtrIpL58X66fZ2lCeVMWCJvXv6YK0+X/+0bVZNj8ButWpclaevGcP7ApkrLJ0o8kwtwPvBKgOM9kkMrr48nv+gZx04Dvf3362wb3Nk/XP6BgYyJuMH2z1Ph1eH7TA1S/aa5nUzsKqY8X+VQ3CDAVg2RGCbFgCuI2HbPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7lFsHS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyXUGkc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B33YPN43192082
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pXtm/w82FCaBm1by84KgFLixNlH2Fu75EuM
	S2Juh5DQ=; b=Q7lFsHS5Aw+czgBukkh6/BvpjJFvLAHPJLJ6TKGE9V3Gm7rf13N
	d+uM0/DWDrc1ZgUKJM+3u5cnZ/kd6MCDC/hVmzo34liSZWbpIp7he49WymJzj0tz
	ZnWrOmD5Uz7F4/P/521+mFWB98D3ev5W4ts+FrMFKccENgGU4/Znkv3l7VUIlGMw
	cUJ9MRBAEvxhgTHQNaszc2HKAdlLxLqoS98a2cCNm8C+dyMY5wmn0DECbl1TY6Wc
	cguYyJlOSHWW8cYxeZiN9GcSmmXuahB4lmeWe9DnoDVYzPWLHvEueyLTYdO9G2nN
	3L8iP/7q8dyxRkGC4KxICUQqXWTFdlU9Zng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at3qjjhfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:36:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2954d676f9dso46677975ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764751005; x=1765355805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXtm/w82FCaBm1by84KgFLixNlH2Fu75EuMS2Juh5DQ=;
        b=gyXUGkc2AQUf2E0X0L/UaBoPVqU8JaH1afnZ0uX805Bbomu/JUGGkImPA+Lpt1A4Zy
         FOwNGX+Fz7qh7a2dMMVxPKSKOf35P6uT18nmlescM9a2EQ3+mM1r4gbcwyvqScs4+KiS
         7GftHDaEBx/iNTq5EIO3yAut0sD6D/OkBmCOK8cyTzPEDpUw1G5iQco01u/W+mHhykuJ
         2G8s7UJf/RDW0nivrXRUSkstP5YDVdprLUHK6+/YfKoyo0fGLoy3y5apGwQt3IcTdQzB
         lkbv4iQnYiUd210p/KLFWXz1WwCN8p54tWvVkJ0URr12/czGFhPNU/xCC6/rkQiX7Efh
         PJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751005; x=1765355805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXtm/w82FCaBm1by84KgFLixNlH2Fu75EuMS2Juh5DQ=;
        b=rDv2Q+4HiRyU5FwDmp+MuMLTaS0gxRIIYm/1yqLHB/y4ShedWZDI2aQ8+MfFkusbDr
         Sv4CDqpBvNDwLaRgait978sBOZeTl2WQTvlO2yiHOD5GaWx1/33spjRjLm2OIgPCaDpI
         yUnDXHUoeNOkmqauU59V0g9iuOAE46DRkRCegBdswmuBGoP15CLnFUl5U0VmblvpEc8z
         7Atxwk9QtPLYsf7RWym3uamNkd/7Sgi3ZEZKGXLpYvEArTNEDpINp7qI2H/ZSH7xyCn5
         3y3PdhOdKhqHs5KQJuhNZdwM2YTaY5wnBhiUvSL7Jk5KLuQ2KA/IiwLDURI1URYCmXsZ
         Il9Q==
X-Gm-Message-State: AOJu0YxJ+VbV/ajUJ3HWMWnqiidHVQRS8TEGRILMHU0PRP4IwcvD4YO+
	hfI4QPMehmbtfTBhiM3ved4HuigC5OIj2VXNMfr1k0cRVjANc8rCnKz8b5ceceqz0AYkE03VX6y
	rN8v6ljhBGeqBt0QFdnHCab4TvIcq7dEFnr56UoiJXEYPy/gFRLzra7plvpmfOf1OOuIB
X-Gm-Gg: ASbGncvLU+8WwkjSmG6HabJm3r9gkoTEbQGG7INZWc1xpTg8xGkq+Ke3fiPNG/Ya8Aw
	HSqH3UYex7aodprWNIm9q7RFUrpD+JrSOTF3wrU1fAJvii6PV+n5CpuNdl0KvxFgKtCN/TXO/l0
	cxSarWJTcHEqyFFPEv3KcuVqWGyJnh92aoglLUuIyyUO53fwc1h4YfnNqljg9W1I66r/2H0RwwG
	EpNrBZYNfsq0pd6qtw5KJL8MydHcO9V4bO+lBE+IrJL945WbgqJFKif5fF1QxeI3koUemcjSbok
	6R3GopMLHY8u/l2iyJWqBb38RvwM2YjoKpOYpPD8knhjVFNXwJARSakAUvF8KsXQHOQk5QjeY0V
	FOK5zMpg0fXlsTcZROKG7UFRiMEjHSd39WyD+R6xOI4Be8Vc=
X-Received: by 2002:a17:903:fa5:b0:295:1a63:57b0 with SMTP id d9443c01a7336-29d6838352amr17021095ad.23.1764751004976;
        Wed, 03 Dec 2025 00:36:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD1wqNYFIl7/73ihJ4E6qcXulLO0vk7dODBkZ2L9T9AUjr0FfC2yXCyeWxKbKWoj9RugOWzw==
X-Received: by 2002:a17:903:fa5:b0:295:1a63:57b0 with SMTP id d9443c01a7336-29d6838352amr17020915ad.23.1764751004442;
        Wed, 03 Dec 2025 00:36:44 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce41785bsm175707985ad.20.2025.12.03.00.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:36:43 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/3] Add eusb2 repeater squelch detect parameter override
Date: Wed,  3 Dec 2025 14:06:26 +0530
Message-Id: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NyBTYWx0ZWRfXxRxDOd+aagHF
 8twc02qJ8NOgL1psmJZ2FowKI9AsI0vl+X9jRvqX9gG8zB1P5/k4msfrNIutrDhV6uUrxjPpC0k
 qaJ+AS/ywW8pd9n6qxKH2FYSR7+gTZhb+Q+UzCqnXC3Pz4hlWYDflR5HXmhJ6QrfGfBScaPRHEh
 JAHiJyghtb2AkSQTOphiHSrFAgLYbT1SJETZ87p3sWOM8wD8uifDRC4XBG/42GddWuvSF6mLpV6
 LPwIZ3LSEGSC+lSEjlZSDi0+ci/Z+0iSw9e9Yro4SD3PDpRsS3aafGcXCTFRvHNZBrPe5S6AX6y
 DIAebKbf8RLk/outHQxt17GKz1CdKYxPV68zgJyy7dYFEYbE/OSzGSwXMQy9JFRQ1yY9n3XSqku
 zT3/gvHCIoxbZHQZZoz+x1/sLi6Wdg==
X-Proofpoint-ORIG-GUID: PfWi7hwaiaUpkXD31RpWDEDyW5u8gNFJ
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=692ff69d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fJu4ZNkWQRc-xYxwqNwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: PfWi7hwaiaUpkXD31RpWDEDyW5u8gNFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030067

Add support for eusb2 repeater squelch detect parameter override via DT.

Squelch detect parameter adjusts the voltage level for the threshold used
to detect valid high-speed data.

Krishna Kurapati (3):
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
  phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch detect param
    update
  arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters

 .../phy/qcom,snps-eusb2-repeater.yaml         |  7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  4 ++++
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 21 +++++++++++++++++++
 3 files changed, 32 insertions(+)

-- 
2.34.1


