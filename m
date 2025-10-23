Return-Path: <linux-arm-msm+bounces-78557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07153C00BCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E698504797
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB3230E0DD;
	Thu, 23 Oct 2025 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXtv2thD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD330E0C8
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218976; cv=none; b=E4e3NJZYLFU3NT4mP+AZMiaAFJobqbIw3F0hTd20DEYYi6ZIVj9baYTUMwb/O3ZkuO4LWk3zupraiSPUYXfFmWYNPhxoMhGc9KJ651FLsOjw01+k0uRom93g5YfTEqAW+tTOzO8YRdgUPxj5c7DwCebNBC/JbVhALZGejb7baMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218976; c=relaxed/simple;
	bh=1jDd8Jo+Lv7AsUUim4V1DT0S98q8LzCRKW9vJCyfXzw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aJi7uCCAeNnTNbtnlgxDGeoFS1kMAAwTZLa15GhR1qwuNYyCBtNq+mHUxxD3pgCZoXHc4sAqbf3sDr4i1aJt6Iw+glNN+yOFgbDHxS4WmQJY5CS0v2oTgezWKTE4nsp3jocjejZYiZDOLQuyCawmg4bEVdlN6/TNDK4MTP3WXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXtv2thD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N75wBN028844
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uIRW+tJ1sHh9tj17uy8X8x7Zj3ryD5FfPGl
	NlKORe+c=; b=iXtv2thDlKf4FPos8+PsKBw1o7i9eT8tarlGQYJLZPDDpLSJt2O
	67pJReCvMkC3KCMNvCwlJUVRgfPywQ4vgGqVdo+YVn7wxd49hj8ZTEx4IEpsIkjE
	hfITtfBCfsDdQHfwv/7kQhJZmTWK6ajcz5bAu6Kvq8FCuuWbjyUQ417YOqTVsSmp
	J58Ff7UiOP37sw8UmD4EBciw+X+ATRE2+fB9o/UAOHb3i5u+UuJzP6TXPeVjpP+W
	+H/G3fccBZPoqa5AQnKV20szz66LBkmbpnYxs/JIemnhy6O+NcSHc2RNSV72PbSh
	vC8M7r294omwJ7osqcR0LVhU0ITcf7BIXGg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdunx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290cda2bebcso1592965ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218973; x=1761823773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIRW+tJ1sHh9tj17uy8X8x7Zj3ryD5FfPGlNlKORe+c=;
        b=ZpNdaF2M1jDwI/KaJppdpJ1yKofL1fSlFO4YMDqZvmydHxeKsc066pzhv8eCRyE7Kz
         HkFsFNMcwWgjYD1faXi7aO5YKRaOgsyL4hnUQR2i5t+1gRctKjQEslaoz4hPoyPIeXYJ
         CmToFM/OmvjfjlSpG4/9vRUdmm96vMGNP9Zltc3nIVprsuyOigu+TFz8cmXiuKtaRul4
         IKPu6BeWwZXKEGmXt+TzJ4qc6g56qlf9BnczDZ8cGz7vUfpC7L1LILNpPwMOelMZoJVX
         mRfYEA9OqHpMYRbFSjRMSgeaS88HzrOfnY6SVYSXX2zGrIQ8pAffIzC2+op/M1ZomLB3
         rbyA==
X-Forwarded-Encrypted: i=1; AJvYcCXyDSVv5/ybiLZlXfgp+Fo5B3CloAd7TrluLes4S0Bq15GLy9lcVhmRYu51lT4kkh9JkPtK/hwotQumrAv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ITtUxLNbCfL7Was6YsnVsA8osjXTaM78dhD2ESksqpF3XV1+
	hzk7TkvFSQ88ezCJV6qLzXGnbFDvCbD6dwBaoM4RzeBxtioJBcRJGus3bjXWfhYcOREICVG2z7H
	Uc6C2oMySluw5AOHyzLT9HHpK3X9EMOOhMJxe5rF4NLwdv4f4TJf12jZJ/USvQCzFV6o=
X-Gm-Gg: ASbGnctnkMOfYh0RseuP7VycfjahV8kLpLNuPnkkw6oPZQdBbjEBCqiltCYPJUk4dvQ
	yfCARHg5u8ggO0yRf4wTLwFHWyifCo8JuqK6iM72XxK38Q6bV1lsiAU6rNQd/TRNIWeR5gbY4Mr
	jG+clb0ojmkBLy9Mu4dB9qpqCB2SzXSIvWfjRZ3hOsQf/5ezjtA8csV0MIAITeQh23HiL5IvF2j
	BJzekNC34BC7a8Q5PN1NQA2ivNlBhmT5XEUNear3sdhFNuWvHT6ZxX73BlNIDqppnWSmfJBRh5/
	jA1pD1pTnaomhQ4TnHaUqhv7arjbjgT8cL3cAqFvXhzn2HrWG+mDgb7G6svvdXU0jZ40tFNEWGR
	5N9NvntHcUtG3Q/yhhnCYeVsePQ7SWQ==
X-Received: by 2002:a17:903:f87:b0:27e:da7d:32d2 with SMTP id d9443c01a7336-292d3fbbf0cmr66008035ad.7.1761218973061;
        Thu, 23 Oct 2025 04:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHL+TU70n2qTyvfs8ktt+I8r3/ZZAeRdKHl1cuECS6O6kimjZqydFi1762GpAmBkKwHt5XsA==
X-Received: by 2002:a17:903:f87:b0:27e:da7d:32d2 with SMTP id d9443c01a7336-292d3fbbf0cmr66007835ad.7.1761218972688;
        Thu, 23 Oct 2025 04:29:32 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm20438815ad.97.2025.10.23.04.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:31 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V2 0/4] Add SD Card support for sm8750 SoC and boards
Date: Thu, 23 Oct 2025 16:59:20 +0530
Message-Id: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s6v7riP22JUQVL7M6AEUXqdyaceBIZXH
X-Proofpoint-GUID: s6v7riP22JUQVL7M6AEUXqdyaceBIZXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX8xFlsPOq7GN/
 H8vq8MGgEbjMCGrY7LriqkBVR4BpwVcpoG7s9TpMZor1XYAwNIVut7efIuyveJ2uLS5G4S50Ohq
 47ND3On8XvdInvVlor58FU70SKHmE2wVsa+tbn/nNbgZtFdim6e5BqWqpYp3qlfakwvl6ZC6x63
 HTambFf7X0KbBDYnSYnKk2sS60C7Bk3yr+WBjD6f5TsH4UogdjvQtSJXA+XFuBXl7OTRKfh9HCc
 DxEW0H5L10zGT+vjRaiHFcD4h2oYZq0pb7JSAVrXTJIGjokaMQNVnnP+7dzEjuCSUgLKX3Z88lY
 uG7wPKlghQEOD00VBhy36IdJs0PPztKSlosjstbD2TDAfkXzF/Yn15nr+EVJHfMp7E1bm1bt5Uo
 adPKnfiex9p/3m58dV13B9SFkZITVw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa119d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=3Kx62KuiyRAImmK_TA0A:9
 a=zgiPjhLxNE0A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Add SD Card support for sm8750 SoC, including MTP and QRD boards.

- Changed from v1
    - As suggested by Konrad Dybcio the patch into separate commits per
      board and did formatting improvements (e.g. aligning < symbols,
      placing each item on a new line).
    - Addressed Konrad Dybcio comment to use SVS_L1 for opp-202000000.

Sarthak Garg (4):
  dt-bindings: mmc: sdhci-msm: Add sm8750 compatible
  arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
  arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
  arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts       | 16 +++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts       | 16 +++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 68 +++++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.34.1


