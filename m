Return-Path: <linux-arm-msm+bounces-90994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAxeC9f3eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:49:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD1A0CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C1EC301BF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D8833D4E4;
	Wed, 28 Jan 2026 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o9qaCDOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A34314D15;
	Wed, 28 Jan 2026 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600971; cv=none; b=flKJeBNd8czK3Bf4TrsgGduV8TlGSru092sxX5QMKDqCYTlh50Mlt04mmwLQKe1GH1qn/HuN8Idhz2LdxTc5lwqg3JxqO/aCUzXDPCGA+eDOx8HyVrFwlaQde3u3757Bh+zaYj37zZyadK2jCROEzVeCAn1CHncF/JiFVcwXMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600971; c=relaxed/simple;
	bh=XalgEYTG79yn+ZEZDyGS/IR03kUFxObW0SVrRF+EZ6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WInAohqBqwdIfxLIokNOf8IFv+VqH1RNCNX2GqzbVewR6r9WNNmmKUFden57tJ22Si2XQQjl1//CMuqo9/TrpeUYSHzL0M5W+F6NEBGO4IIEhVuFudtct5cecVymvL3ctaa8dyS7ZeyZ1g120L9UNrv70g+yWa989WdDeiG/p2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o9qaCDOs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92WoQ254579;
	Wed, 28 Jan 2026 11:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IbRL/MdORU0nV1KmM+0/jPn6yuujtqAOkTm
	0iq6dFWs=; b=o9qaCDOsNalPQsexZB1O7ofYEd3SpsOWir4WSxyvpcmbcvZnbZQ
	fl9jmnD0dgPFDg6s5IK0oUGovY4mpXM6EcktW5zq5RC4hGTdr0FSYlHpxsAsqFfL
	vdgJPtEuMNtB4r9MIL7tfE7qplhPb7aDW5zip0AaNxCEAsA2WU/YcB6v7k9E+cHF
	XTAGJVL0BbyAPg1nxXin+rmiPuaKo3Tanm+rCOrLIaTcGqwwudP3DFRpvo9RUpBT
	VeFPOpGo6TUKoE0hJG1hFl5MsU65uj+pffUx0z/ZPRSBv3RZmTayZ3GqBiLKqCEq
	1HmCH4F3dB8cFVXnnonvXzVMo1KYFEap7IQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y36pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 11:49:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60SBn5Hh004220;
	Wed, 28 Jan 2026 11:49:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5mgsj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 11:49:05 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60SBn5Uo004094;
	Wed, 28 Jan 2026 11:49:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-riteshk-hyd.qualcomm.com [10.213.102.118])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60SBn4ie004089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 11:49:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2314801)
	id 356AB5DF; Wed, 28 Jan 2026 17:19:04 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_mahap@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
        mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: [PATCH v4 0/2] Add edp reference clock for lemans
Date: Wed, 28 Jan 2026 17:18:48 +0530
Message-ID: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xkX8URlhIYmfiYxwg_gGFmygazzvMK_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX14V9n/Aa786j
 JGb/wmODho8qppn/lrc/DupUEh+E+AvcedqRYIOvJskzFnaTq4vtkrWfCNSMgS8Gph+pjb0Qy4E
 5zNOhwRY8bfMLu90qK/pzDAF2A7AykvYbsdushUoP4DxMGApkbBnE7Qwzuoa+qskoxmYb3mJMRa
 rYDjCwpNzP/Unsmb8GBJjvNUxikfy+DJ3gwZSTNfAYq1aUY3gPd9u0Qp5rwBRQb92XlTNy/Hh/s
 GZePvxo7UYuPbeQF1OE7JufdM0IgUpgoBpLyVInaSynQfIrMVe1Cxvvg6q+fgIaGVpDjbC/nita
 NvABlDB0Ke7rsZR2UJDI62/BJi2NjOEdLm1b+/wnuG4IO/VDRpUerktyt6ryJ2Gzzuju5iephjE
 /nr1sFHFUtGciPBqjqp1ze2hTJuYXaabpsQCegszmCcWVfEDfdAyNF82EJaP5OQ12mqhh55uqBs
 JJDfs47XRG+vlFVOgSQ==
X-Proofpoint-GUID: xkX8URlhIYmfiYxwg_gGFmygazzvMK_o
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=6979f7b5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=VVwWfd7dDLNrxvkr-osA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,HansenPartnership.com,oracle.com,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90994-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_riteshk@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d87000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BBD1A0CFA
X-Rspamd-Action: no action

On lemans chipset, edp reference clock is being voted by ufs mem phy
(ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a945
("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
clock is getting turned off, leading to below phy poweron failure on
lemans edp phy.

[   19.830220] phy phy-aec2a00.phy.10: phy poweron failed --> -110
[   19.842112] mdss_0_disp_cc_mdss_dptx0_link_clk status stuck at 'off'
[   19.842131] WARNING: CPU: 2 PID: 371 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x174/0x18c
[   19.984356] Hardware name: Qualcomm QCS9100 Ride (DT)
[   19.989548] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   19.996697] pc : clk_branch_toggle+0x174/0x18c
[   20.001267] lr : clk_branch_toggle+0x174/0x18c
[   20.005833] sp : ffff8000863ebbc0
[   20.009251] x29: ffff8000863ebbd0 x28: 0000000000000000 x27: 0000000000000000
[   20.016579] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000001
[   20.023915] x23: ffff0000c53de980 x22: 0000000000000001 x21: ffffb4b57fd8d710
[   20.031245] x20: ffffb4b5bb238b88 x19: 0000000000000000 x18: ffffffffffff7198
[   20.038584] x17: 0000000000000014 x16: ffffb4b5bb1e2330 x15: 0000000000000048
[   20.045926] x14: 0000000000000000 x13: ffffb4b5bd386a48 x12: 0000000000000dfb
[   20.053263] x11: 00000000000004a9 x10: ffffb4b5bd3e5a20 x9 : ffffb4b5bd386a48
[   20.060600] x8 : 00000000ffffefff x7 : ffffb4b5bd3dea48 x6 : 00000000000004a9
[   20.067934] x5 : ffff000eb7d38408 x4 : 40000000fffff4a9 x3 : ffff4b58fb2b7000
[   20.075269] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000ec4fc3480
[   20.082601] Call trace:
[   20.085127]  clk_branch_toggle+0x174/0x18c (P)
[   20.089705]  clk_branch2_enable+0x1c/0x28
[   20.093829]  clk_core_enable+0x6c/0xac
[   20.097687]  clk_enable+0x2c/0x4c
[   20.101104]  clk_bulk_enable+0x4c/0xd8
[   20.104964]  msm_dp_ctrl_enable_mainlink_clocks+0x184/0x24c [msm]
[   20.111294]  msm_dp_ctrl_on_link+0xb0/0x400 [msm]
[   20.116178]  msm_dp_display_process_hpd_high+0x110/0x190 [msm]
[   20.122209]  msm_dp_hpd_plug_handle.isra.0+0xac/0x1c4 [msm]
[   20.127983]  hpd_event_thread+0x320/0x5cc [msm]
[   20.132680]  kthread+0x12c/0x204
[   20.136011]  ret_from_fork+0x10/0x20
[   20.139699] ---[ end trace 0000000000000000 ]---
[   20.144489] Failed to enable clk 'ctrl_link': -16
[   20.149340] [drm:msm_dp_ctrl_enable_mainlink_clocks [msm]] *ERROR* Unable to start link clocks. ret=-16

This series adds support for voting the clock from lemans edp phy driver.

---

Change in v4:
- The dependent series is merged. Rebased to latest linux-next. Removed dependency in cover letter.
- Update commit message of dt-bindings patch. [Krzysztof]
- Update commit message of devicetree patch to give more detail. [Abel Vesa]
- Link to v3: https://lore.kernel.org/all/20251104114327.27842-1-riteshk@qti.qualcomm.com/

Change in v3:
- Rebase to latest linux-next and latest version 5 of dependency.
- Squash both DT binding patches together. [Dmitry, Rob]
- Add dt-binding change in sorted order. [Dmitry]
- Update commit message of bindings patch to give more detail of the problem. [Bjorn]
- Update commit message of devicetree patch and add Fixes tag. [Dmitry]
- Link to v2: https://lore.kernel.org/all/20251013104806.6599-1-quic_riteshk@quicinc.com/

Change in v2:
- Rebase on top of dependent series. [Krzysztof]
- Remove duplicate patches and make changes limited to lemans.
- Link to v1: https://lore.kernel.org/all/20251009071127.26026-1-quic_riteshk@quicinc.com/

---
Ritesh Kumar (2):
  dt-bindings: phy: qcom-edp: Add reference clock for sa8775p eDP PHY
  arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs

 .../bindings/display/msm/qcom,sa8775p-mdss.yaml      |  6 ++++--
 .../devicetree/bindings/phy/qcom,edp-phy.yaml        |  1 +
 arch/arm64/boot/dts/qcom/lemans.dtsi                 | 12 ++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.34.1


