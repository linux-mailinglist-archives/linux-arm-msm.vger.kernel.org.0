Return-Path: <linux-arm-msm+bounces-94284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAjhDxIroGmKfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:14:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E912A1A4ECD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B89AB303EFA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E6233C1A5;
	Thu, 26 Feb 2026 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A5eA5z28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87933A71C;
	Thu, 26 Feb 2026 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104434; cv=none; b=Hte2rpC2sNonNvM+L5rH4WOAMoM8wXOYywW/Ak6vp02DaBy8ycVH/4+i68Q9IKekfaER8pl6UGD+nV97hYpOQehxcGQenFNF+vmv9VxX5JigVhcHHt1dz0As2ftHJARMLnU7E5YQRNQsgbzRjzot2WZypr675qk+ZA9WfCw8RPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104434; c=relaxed/simple;
	bh=TcV75M7San5/fFIL2ZKehzOPCnUk55vHsgagXVTqqKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pCgy8CevFRj0VkAeS/6CB2ae2L1IHEVVKSjg+1koS4weQYR3ZAPRmL4MVRuEXchAYDYF1VEaYEzivablGW/C6sOscHvz9BkQFfJUEqCVn9R1vGmuAAHLpQ8FfMpnnp5WLh2WFuaGIuyh1nP3SevJxr7Tg6ZL7/vCgI/e7moarWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A5eA5z28; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL94d3987275;
	Thu, 26 Feb 2026 11:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vyCjDttZvxTI4S5YWExOUDFcYcJ4KPW/6yB
	4+jJFAkY=; b=A5eA5z28DK1vQBUZ/ePNn3tzJOADGItJQbLhaomftiSRqv0cddP
	iXHeQ/9SYs9sYvkHdcq9VH6aHSav4M6VZklwZI4a/REsf5EeDFldyY3rXl1r+zMe
	ZqL+A9fULS70i7AlFGQTD3fysi1JkAOI/sC6jlShW28S64od7VyyT9m2DEw4VrxE
	HkiOVWmbur6licwjQH4/fLfxbs7JmxECygHG+43Vdd2qq59noWPgKUXhhLoA+MXY
	bhmevD+JSWStZ/4uTVdEHhBYtShV2c0W82McclSfF5BBR76gTn3ZIZQjKw4KbVPJ
	Ba1oKotMjXCPkCa7SOgeGB26ol/RQXdMmCA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph1egk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QBDUvL017511;
	Thu, 26 Feb 2026 11:13:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5smjsf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61QBDTFC017497;
	Thu, 26 Feb 2026 11:13:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61QBDTos017493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:29 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id ADF29465; Thu, 26 Feb 2026 16:43:28 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
Subject: [PATCH v4 0/2] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu, 26 Feb 2026 16:43:20 +0530
Message-Id: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: pzIYVdHdXBHsc1s0MPZS3old0-z_DXxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwMSBTYWx0ZWRfX8nldqkpOnbTr
 4EDBSPvyy+Wjk10uG/NBD7Iuuobs54lj/RfnLnaMnf0/0i1q5/UnAmK07xkkHMhKPZaNpvqYQbR
 kOivVrJ97H8HJ0ihaCKgJjnWwXD+VV1kXu8d2sIBiZSYl3uuTvJcbO5JunJ41LpJoC/UBlpDqvq
 K09hCXmPAZ2IXx9H3rf1vVE8uRwpJPymbm2KDvJMxFkkABBLw/je6PI5mN8EIx9iGjzlOukmZLv
 5/Sk6WVse7QydVMfexCcxD+euYUMW5MfNU0vyUNWd8CGqO+uhpG2y8CVKqIeUnRG68ahN7c4Eih
 374PauqvN7fVjC273rp70Kn3SeOW8tXTI5KUTV8ecsu6WSdqP3EOTC9bvUGzhe5I2p0eYuP2J4s
 Wwds038k7Bw85Fb+8ZFG+fJ6IBkLgXQ1v6YPmZ6/cuRv6nDfYy6moL7xFrT0uuA7YZfmAJDSa3s
 U3/5zBF1rg9XAI81yJA==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69a02ae2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e5mUnYsNAAAA:8 a=0IT7fpZdUoEMrN4OoH4A:9 a=TjNXssC_j7lpFel5tvFf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: pzIYVdHdXBHsc1s0MPZS3old0-z_DXxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94284-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mkuntuma@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E912A1A4ECD
X-Rspamd-Action: no action

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride platform.

---
This series is dependent on below series:
https://lore.kernel.org/all/20260128114853.2543416-1-quic_riteshk@quicinc.com/

Change in v4:
- Moved the OPP tables for DP and MDP one level up to make them common for both nodes. [Dmitry]
- Added an explanation for enabling dispcc1 in the commit message. [Dmitry]
- Removed unnecessary blank lines preceding 'reg'. [Konrad]
- Link to v3: https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/

Change in v3:
- Patchset v2 [1/3] got merged
  https://gitlab.freedesktop.org/lumag/msm/-/commit/1338e8ae4084
- Rebased on top of linux-next and picked the latest patch from the dependent series.
- Removed additional instance of opp table [Dmitry]
- Link to v2: https://lore.kernel.org/all/20251125105622.1755651-1-quic_mkuntuma@quicinc.com/

Change in v2:
- Added fixes tag for the DP driver patch [Dmitry]
- Included below patch in this series after addressing comments [Dmitry and Konrad]
  https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
	- Removed the misleading comment: "same path used twice" [Konrad]
	- Removed unused label in 'display-controller' [Dmitry]
- Removed extra zeroes in dispcc1 node [Konrad]
- Enbaled dispcc1 by default in main dtsi file [Dmitry]
- Added EDP ref clock and updated dependency series.
- Link to v1: https://lore.kernel.org/all/20250926085956.2346179-1-quic_mkuntuma@quicinc.com/

---
Mani Chandana Ballary Kuntumalla (2):
  arm64: dts: qcom: lemans: add mdss1 display device nodes
  arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

 .../boot/dts/qcom/lemans-ride-common.dtsi     |  80 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 381 ++++++++++++++----
 2 files changed, 385 insertions(+), 76 deletions(-)

-- 
2.34.1


