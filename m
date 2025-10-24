Return-Path: <linux-arm-msm+bounces-78722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49743C05ACA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2908A188B67C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAE1311C2F;
	Fri, 24 Oct 2025 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2yJjS/a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B9D311C37
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303032; cv=none; b=RWfYe3JpyHFId1DYbAE5nqYMklzN8EMxynPjpwfv3RoaKRuT5OhXbyq/2cmhwG1rPKwG6wgw+IJxDpiDC79VZYVLtpvWLeQWymae2iHeMEp/e9826na8Q6PGFYJV909iw4YU8ZCtMpNx5nANUnkAh0mbY3iIkncjHwn22wgIYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303032; c=relaxed/simple;
	bh=hBfpYSbUdnlWTsvr+6iVKoFyAgicRcUZDbA7264mfvw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X5qPkyfZqE9ujhegkC2dUgxSeEVx9+my0jLcBZ9jHShk9xGXfqj9/xLYnSWMeKe3DjjeMt7RsThjRaNd5czXOkUNDVp7czblZhh+HwNOn6O6QahIdOpP91L3L/8hDGw7InxW8/GaYOo5JvlWTa6EQ9cFrn2v7pY3KsBhat+rpQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2yJjS/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FXYt017764
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6NHuX3Ved4jhx9iPo+t4FNZicrm8s8ruSWh
	6+iigvtM=; b=C2yJjS/aDzwyEUl741orozy4cB0q3rg2p8KLC+4y8IEv0K7olM5
	w2mMh12KtMyiyfSTAzHngaVcB51e1iRy65JRJpdDk5fYzXNuPU/73wDYk6nQfowu
	bi3gAfaQkGCeHiav4x57AFVNmzeCWnZlYIEVqKfTlSnYBFII/oYeiextdO9rj1ec
	iNKBHUGdm10k3bCs4Rkf6EW5yaHBLl808EneFkGeHanAhUmb09I4jN45mwKk6x1u
	Kiax7a/Iac/7kpzq8ISS55iBFE3u/EUpZIzyV0TmGzX/uMjO508Jg+xeKXWDDuEo
	JCefEV0dp48BheArBvnHpqqE75Wt2EAQX2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k30k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28bd8b3fa67so19403055ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303027; x=1761907827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NHuX3Ved4jhx9iPo+t4FNZicrm8s8ruSWh6+iigvtM=;
        b=PkAwMQdEqG240t1Vq/nWq4Yip2V42awwOwyw9x4BEN7JgJe75zvLaWgJv89m9/3RAQ
         2P3JehrBsaO7P5yjHZSWdCEluxU2/o9fnIDXKhQ92mtMhtZKOvZzpSoeYKd6ut/Z7cwu
         IqIJRhSjJtjAq9kC68F/DIsWZBwSK07m6dk+Z8JEWu5fPyPP+eaVsJwO5U86G2ezdFxz
         SzTeCVQP0Z2R91fNEAQiDmi2qoNLgTrd9w3C/ATM+HIGjoWNmkRjSj+PP42QHxu9ri1B
         CDpXW3uc/2obtZMyUBkkxo5L7fKjcnlTPj+APiczXf8A9Zwpi6sKvlWW0pHto0xrWTX8
         TOYQ==
X-Gm-Message-State: AOJu0YycpvuZvALmhU6OjAURs9t+8fLhM4S+2YL+tewM4F/60OpSIJJz
	dxB564ds1/AYTSBEBPLPU1GqaSRU3dKujEPthtq9FSAXczM6HLPIu2InL2fDV3snTNjgWcn629W
	8MC7FHG8al+76gJX2Rp2Ck+avNiJHeuDrGp1hWkoOuyfc2rGi9SigsuOL/2excFvevBXz
X-Gm-Gg: ASbGncv8lLZPk09/QwiKFIXCkYocXzgYNc+YCFu0KYE91OBIOIc/oAPP9WqBo5+J9eL
	m18v0kVUtH3Jo85DZ7ncw3D4GViVUwVBfZvdphA7NSlNNZ+FbjALmKghqjA/YsdvmvkJRAVsvn+
	8HJ5THCgQ6HmlTo0PleEpxveGiYNOYgVv/cfABJmRt3aOM08VS52rSNxaKJFZLOv0joLTs6ISXh
	mLXE/QwKl8+dCsnWj+JxTlKAk2VpOJdCRtXzpumbES+6sjUs+CJ7isffwI27x8NM2asBp2XPpbH
	QzXTuvOrcofdFC5tMDd5ERx4q4X4njEorhd9yPlEg5ZvCINQxz6/u0BXIsq/QcmxEUIcxvbiPrM
	rqZrkFufYPEUyKbNeJ1yPCExDq264zFOQcaeE
X-Received: by 2002:a17:902:db0b:b0:24c:cc32:788b with SMTP id d9443c01a7336-290c9c8a77dmr356305695ad.3.1761303027497;
        Fri, 24 Oct 2025 03:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4SSG/itxqgnKdgGyiFrTllLTfNfrUJwGLhCc/khz0u7V03VEfJTQRXCZctfAwDYJoqUrLBg==
X-Received: by 2002:a17:902:db0b:b0:24c:cc32:788b with SMTP id d9443c01a7336-290c9c8a77dmr356305375ad.3.1761303027059;
        Fri, 24 Oct 2025 03:50:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm51236775ad.103.2025.10.24.03.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:50:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Add missing quirk for HS only USB controller
Date: Fri, 24 Oct 2025 16:20:17 +0530
Message-Id: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfX9zAzet1PMnb8
 TL0xj79oX46FKOHu2/ubSnd+vF4djkbzNpe4s1YGDgqPBRdzPNS5fWzp0dTpc9NbdlsoGzxF7ok
 eIjLe1BixaEL8OCIUg4pvTUTMmDBMlWpoi5V7OB6mqqq8a1jD74uyrOYPyD6bDtdwdvkkXA2p0N
 9fH5UhvgVDFimCsL5rb7woQO7pMYBAqtRccw2lB98NAB7zJHIjgXTthTlgpJ4a3XVb2ss2YU9jh
 c0aYLNELNjle4PVMTZssoQToAy8BwbqLFgNFzDbAhdeynrceH7f3yhhrovOAAZIBlI1ClvPSH8z
 h5oSbm/UcGwD9405fCzl+qAUos6zLRyYFVOPC3DqEKOeifRi/43EOGsF6T9aia8kc9eULvK+3iZ
 jK4Qr1SM/iSBo5hVd76/ZnR9BX82Yw==
X-Proofpoint-GUID: Mycetf8zLvYsshMedvefC1Ag_n12O9cp
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fb59f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=d1616NNI0-D16vPRn74A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Mycetf8zLvYsshMedvefC1Ag_n12O9cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131

The PIPE clock is provided by the USB3 PHY, which is predictably not
connected to the HS-only controller. Add "qcom,select-utmi-as-pipe-clk"
quirk to  HS only USB controller to disable pipe clock requirement.

This series has only been compile tested.

Krishna Kurapati (2):
  arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB
    controller
  arm64: dts: qcom: lemans: Add missing quirk for HS only USB controller

 arch/arm64/boot/dts/qcom/lemans.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1


