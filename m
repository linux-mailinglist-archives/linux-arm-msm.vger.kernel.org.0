Return-Path: <linux-arm-msm+bounces-101516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFxyL5o9zmkImQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:57:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E63874D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FA8E30DD2F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A271E3E63B6;
	Thu,  2 Apr 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b3fqVzCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593EA3E51CB;
	Thu,  2 Apr 2026 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123451; cv=none; b=sbuF8+0LXds6+0o0VD2J/WY3sY9rX/0ff+qUUg9ICt6MtctS7ikKbzuiA2mix9aVe0b1pnkUvGf5wwFO038vOQMy2hoN1N+92+eP93BRnHeqFgB4PJ+nGefUeKEo+Bm3ngMIqOmVsFxY+XX+LZZBbjfeQ7jd60cikaKvKvBibrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123451; c=relaxed/simple;
	bh=aTJtw+gTSSwZda3cnVzFIA16Y2ThY2RkBpnuHg5et5U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LhMEsu3NyogAg/pw9ieurxWRugIp1iCtmWU7DKAtjN6oiYUrTD9DyYHi1qk0iulhAVMn4oSZAp7VikurNsjzMKnsRMBQk5682M81TNqi3qY/WDMskDdBUSlnfmbY/FIpX4MkI6iuDffDKSGcodO1jn0LyD1oiIe7ofultqR6Zt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b3fqVzCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63277ier3044208;
	Thu, 2 Apr 2026 09:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O8f/+miE3jil4DGaMUWbI1gUjHJGqg6T+HZ
	U+N1NLIo=; b=b3fqVzCa2pjxbNmb+PV/IjBB3X30+qlipBw30evNccbmM7r9OuD
	AbHAZ3DA4JNyame0ZQJQKeLuuQmk+/YlVBPze9RXQYUGi+8X5CQc6GlLm3Aj1jw0
	FFuDvdLRT0iABB7KKZ/eyqK1glJbRt8TX38xXYMw5DsZWsfp9IBxHPsXXsuSuRgt
	54o8umCHu7ta7hMcJ72YeBnHFj3/fc2n8gLPDNxQ0p99qphu6F4Pf26J4UI6fDpq
	yWuuQYcbG0v35u+DVXDUWNG+FjBs24iTK6BHoIjb3/Glmtt1BCvZ/cBDHdl3osFo
	N9ycs2ZirmPNWi28Z0YXlCprhZjOmhonsYg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483v8fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6329oGQL004380;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d6qk2m86m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6329oGNt004363;
	Thu, 2 Apr 2026 09:50:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6329oGgH004355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Apr 2026 09:50:16 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id A5DD3465; Thu,  2 Apr 2026 15:20:15 +0530 (+0530)
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
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
Subject: [PATCH v5 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu,  2 Apr 2026 15:20:00 +0530
Message-Id: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce3bdc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e5mUnYsNAAAA:8 a=kyufpZre07lEBfj0WjwA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4OCBTYWx0ZWRfX9GswskdlKLhD
 FLWAJhUJ44ea63EfEMZUCtQ0pBof1MmR2xUktaLB1dPqrY211BhGEqnAMKFJAoQIgaaT4gZTfO6
 e+E4l2CizIfXcuLEONQr0ANuHAW/oEFVrs+Qg8qIEfXoQsxfVka8m+pDe6X/KH5MxAvGcExQNyj
 t/pVmAwNfm7wEL6+yIFYE46a/9DvC69eqGpSfOIiBhhCvyfqAr4wQo1srFAsC3dcz7ia6IcrOu7
 ev+3zunYYJyX1sNIwVHI6QtF46egoXP7+iS71iVVsRR8DNBcl9FssoV1qeVbPNZViCkWggSLaxY
 0Bc0LIMSZSmGmaRqSatt4zukI2uTdK9J1RNDbIzBZbEG0FQ3rR84Pcxk+gMmZ8BDg5cK8a3jfpT
 5MddmhY5M4ok3A4bs+duoY3vUt5TKmENLJgGL5t/UpJ9TOT4hiC2jmhyaD4NHkyk8WOndRwpNlm
 ubyME31bKl1Vrukp/xw==
X-Proofpoint-ORIG-GUID: WPRj92rFS_u_oeE-0OpxDhrsZBumql4_
X-Proofpoint-GUID: WPRj92rFS_u_oeE-0OpxDhrsZBumql4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020088
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101516-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mkuntuma@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:dkim,quicinc.com:mid,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC1E63874D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride and lemans-evk-ifp-mezzanine platforms.

---
This series is dependent on below series:
https://lore.kernel.org/all/20260128114853.2543416-1-quic_riteshk@quicinc.com/

Change in v5:
- Moved OPP tables inside the mdss0 and mdss0_dp0 nodes and reused them for other nodes. [Konrad]
- Added newline before subnode. [Konrad]
- Included lemans-evk-ifp-mezzanine patch: https://lore.kernel.org/lkml/20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com/ [Konrad]
- Link to v4: https://lore.kernel.org/all/20260226111322.250176-1-quic_mkuntuma@quicinc.com/

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

Vishnu Saini (1):
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable mdss1 display Port

 .../dts/qcom/lemans-evk-ifp-mezzanine.dtso    |  74 +++++
 .../boot/dts/qcom/lemans-ride-common.dtsi     |  80 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 289 ++++++++++++++++--
 3 files changed, 416 insertions(+), 27 deletions(-)

-- 
2.34.1


