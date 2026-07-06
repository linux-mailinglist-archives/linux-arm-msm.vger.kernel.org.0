Return-Path: <linux-arm-msm+bounces-116889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lmc6AmXCS2o6ZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:57:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36871245D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:57:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NSXQqISS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YyUnQoCU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81988313638D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCF6385D70;
	Mon,  6 Jul 2026 14:13:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72737F738
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:13:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347239; cv=none; b=FZz/WidWQ8386WarVK3dKkSLtuiknQd4Qg2Cx6HxNDBartYEebxrct4PEUBVNiKxMZDs+2N4BTJ4FoaYwXKEyqBE2XKwcQ5gtjuNiIaZ1F4BrNZe2QHMUqLL3yu6eVW7CtTjZI8d0Q22Vu2SKoOMN+bKGI2FPFxFSPy8nV6zYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347239; c=relaxed/simple;
	bh=3lbgfXvd81xS1Ka4NSEHJrrRihwri5ozqY5Mf1Rx0zM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CyvZg94ALtHuS4iGKlmdqn+vaq4b58BlYdx2k6oDyeInomSlQEbSYk+so/UzU5ODEqytYf6d+pNrfXW6ZYFLvlJVMl17zzAzvOjBkV15U/9JOkQlQDO576o1H/vuxNtbqEbyaRydBU/4UbXwJ1PXztkMxin5DKDtfF/dNixRZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSXQqISS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyUnQoCU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTwE387522
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u8Zse1MgBFC+PNjhgtO3sc6p+9GqKsHnq9h
	MZGcm688=; b=NSXQqISScWttrlHn/LAyBSHs8Mc7PGHk2hkeUi4VZ7C8Zjq3xRx
	DQ5yCplrAaZC2m3NW/1I4QzHQngAigiVL8WwPQm2p+fZaLEd/koAO4Dj34dVDibd
	cRcjEnR/Puw+jQVSpuV76HWQyt5cec2t1xSQkHBQ4tNWHIdtl387PvgboLHfBlFQ
	DPGsjXTZx9BiN3V5xPiGxjSCc2GEEziILFBSP9zXmX7mPdG59Cvcqkp0MJdeJGbS
	Bf+9yp3Bj3cr2Ac4PrF59Pk2rsoNZWf8zbwmbG+AB6JY8r7/0xaVV26pIySYUJPM
	M0bMgnwPGUVHz9FECVxANEaNVfAkLNO6niA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r11qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:13:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so4531250a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347235; x=1783952035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8Zse1MgBFC+PNjhgtO3sc6p+9GqKsHnq9hMZGcm688=;
        b=YyUnQoCUFlcNC7+0Nf+ZDvcX/RZlo+dwIZGB0Cb/mIp/hqW9Mfu0IV5N0lz8lCMll/
         mpvwlVEoQ90K6005xGDXx7HdMoi/hGSQWcnkTkGw+FhNOVN3BmckdYzGyDmSENk8oZVs
         v2gUyFdCykJuYdQ5oiTH7Nkar3h7ENrTOsvwbVJ6Rk00L2UmJChiNwewghWBMn51936o
         RqV6kuTFgcrYeo72GJ69MmIWzUemsdf8OZs2rbKB8c2Y0p3kTV7ktp/Q3KwI+Jr16kwy
         /t59oKdeg9paEESbr+nz1nJu7Lr3OSTtV1lhXf5JLSDYVLvvkxeN0OKRx9NBQeYsXx5l
         OPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347235; x=1783952035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8Zse1MgBFC+PNjhgtO3sc6p+9GqKsHnq9hMZGcm688=;
        b=bEcVnfvvmO3Mrgq2RUxPaVKOH2rXI5L361D3baOCd5uLAro+q1opv76UA/oV7bI5lf
         dqWRa/S8iTmh53/98wwR7X6wpkWtw9pOibUCo+JsiznRQvcFpaWGaeC+ELaXuAbX96za
         Inf7sEBUS2y97kvdy5Jt9ST7QW6EHlwhceV9jMMsjOVv9XDaxgYZs9mbwoz7BdjfWbqZ
         BjJ2vgn7LmmRXcZnDfG/cI8CdfxdCHoFhuDPRv2G1nGo+PB6PopDmpOMzH9lFu5v40Ml
         zY7ESvJNx2viCi6KBY201IMBidQ8q7XCM+gmzIMhAo5a+J+xWnJC9rcSeto2Wma7QVME
         jlPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqlAi8IKdGzOQkwibPw7NsgKcnBoYPYH6ipPhUTCzOjCJgvCdLpFpfGjGDCzhe20W1419BhtN1o1zUKjIM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdib0kKWn+tIaC11SdBQc5p4B/12gaKUwaeDV6WZ8m9lpbGhyH
	T6Q+pP6v92jjtg/sTTuMal7sf6FkEpK+0K77Z61Kk+WoQ8BEMAnU25cI93iuSjhGpa4krJc3++x
	1wrQLMW4Ij0R0Iquar5EuQLF4sZyb3SgWlRMhiQ7xSbUkZ9Q5Snrvh+LeF/ft61rRkaFM
X-Gm-Gg: AfdE7cmqB/sfbZoMGk1FztfF4m7xboLwmjKNEOP4Pd7DPNhIfJwdJWYzGgnii7RNG7D
	CSe4dH1xIbZ/ELzqIV+PWLdQ4+2T6jmWsUrw74e2hsWHkqB1V7VM+HBqmx8flOUNx2Mtyl3CCbI
	m9ud5AtGchKMY2mwLMcn5Bc6XqlP92Zi7VT6wUzS8MgIUO9/Prdkd80EKcHeRCStUucO7YHGgxI
	vy7hSXeNe3ej5jkiWTC0yP0+TRog+AQI5Vf8KYiOSeg/mkxJ8bpWk8X93Qo4e4wh/reZeoS+Bm3
	JoJg0jqXSQALWqnR2hu4yXvZ8LCY/fSvOEB8OMrJlR81P1pzEZWDGGz0jDwa2dWD8HTMTfUh/Wi
	kLQSNsWpRsJPmWGNXbb555RHUTG0Jm3ZZnRzuyA==
X-Received: by 2002:a17:90b:2709:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38758260ad3mr660421a91.20.1783347235434;
        Mon, 06 Jul 2026 07:13:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38758260ad3mr660380a91.20.1783347234943;
        Mon, 06 Jul 2026 07:13:54 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:13:54 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V3 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Mon,  6 Jul 2026 19:43:42 +0530
Message-Id: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX8iBtrcjDJz+E
 DaOdDSTihUwCUDqo0YYqIwFR5IlEUbAoXWQIckcg0mBOCXhiq+2+HUftWkg/Ra3Lb2ppr8iUykY
 8usIcGK0rnXnDOLbch86A35LeaseSlojNuvEzpaVJ0Yy+3fefYVEIoGS0LLWrOzCvkCFc4eh8VR
 1/VQaK3I8pSPVYRy0J2fGbjx3IS0EzQKtlqNt9dElPthyg9TN/wP9UYwN5qH8hrjZCq8NDm2M7c
 AmIkSm5wWxgqPl++kpwopl/W5sq9NaLz5qXyki2JYc6xsG7NI2L6LpXPGsPTlKtdnUvKQiR6bVz
 7hXTLWsylVuUoOMb4Y/4Eoha1jsibe9qlz56YA5sh07+jsekyL76vUN00K+s/AW6gvZCC94Ku4p
 lWf7PPY96SM+RxIz+G3X4X0u+/zcA8iEdUY8rsh7sMD6xzwOZQfQAND9OQ1xcjsRbirA09A324X
 dOIgX0xMm6pbJIZYp/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfXxbSYen8hZaX6
 vgc36PJzV0F3dktQ4ZK+wzd2hf2cK2CN8eIGMBii1qjx9RAshrc7wJsOOYgR9Jn2p70DzMaklbw
 Q1SotKRMb7fNt3GTVSkpuEFX26Xctp8=
X-Proofpoint-GUID: 0q2O7iNBHNWyytfjfS9dDbKfSdbzfS1E
X-Proofpoint-ORIG-GUID: 0q2O7iNBHNWyytfjfS9dDbKfSdbzfS1E
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb824 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vifq4xLP3jNeXsT3PTkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-116889-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D36871245D

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Respected Maintainers,

This is v3 of the series to add SD card support for Glymur.

This series adds SD card support for the Qualcomm Glymur SoC and the
Glymur CRD (Customer Reference Design) platform. The changes include
updating voltage regulators to meet SD card requirements, documenting
the new compatible string in device tree bindings, and enabling the SDHC
controller at both the SoC and board levels.

Changes in v2:
- Collect Reviewed-by tags (Konrad, Dmitry)
- Update the commit message for dt-bindings change to reflect the
  purpose for the update (Krzysztof)
- Link to v2: https://lore.kernel.org/all/20260702094056.3755467-1-mchunara@oss.qualcomm.com

Changes in v2:
- Rectified the iommu sid mask notation to hexadecimal format
- Updated the power-domain corner for 202 MHz frequency as per the clocks plan
- Added the BCR reset capability for hardware reset as required during the init
  sequence
- Reorganized the DT nodes as per the DT coding standards
- Link to v1: https://lore.kernel.org/all/20260610111508.3941207-1-mchunara@oss.qualcomm.com

Summary of changes:

Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
the Glymur CRD. Specifically, it reduces the minimum voltage for the
VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
increases the VDD supply (l9b) for stability.

Patch 2: Documents the Glymur-specific SDHCI compatible string
(qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
as the fallback.

Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
configurations to the base Glymur SoC device tree.

Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
regulators and GPIO-based card detection.

Testing: Verified on Glymur CRD hardware.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Kamal Wadhwa (1):
  arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
    for SD-card

Monish Chunara (3):
  dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
  arm64: dts: qcom: Add SD Card support for Glymur SoC
  arm64: dts: qcom: Enable SD card for Glymur CRD

 .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 24 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 10 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
 4 files changed, 121 insertions(+), 5 deletions(-)

-- 
2.34.1


