Return-Path: <linux-arm-msm+bounces-102919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON3KOEy13GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4913E9BF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 894D7301AAA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5F13B2FDC;
	Mon, 13 Apr 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUMzKCJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679263B27D0;
	Mon, 13 Apr 2026 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071994; cv=none; b=N3V3i00iVYqnvjFYj/EqIsm6c6aWUbW+icU8LOucIpf2WSmd2JXyRCCDrX/fZQaor01MN3FoKqclauwYsSzMgAimlwRZX+x+LiP08MqvrMpQ4CM/EiMoO/q0TQ9D0pae8++05Ioo2iFJzvB80qNJTngm5+3eMMGfzxzcFD0Levs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071994; c=relaxed/simple;
	bh=uVLLy2lAt7Jtbb8wRAjcsVi4wWEKOnkCvXQd9sj44BY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SPOrudz9MKezfNUzguaoMYe31cjTa3fKpS9nSp4MohujEvOCo6vN9a0KXI8Xvd907OPK4YjQpRNvv9gmTIq9pbZZfq4BkK5ClnCUhUkOBoMBKcmtgBC5REku2pm27j8UTIwYxpFj1C7V8QNhvnAzhijdGFKT7bBlYxGyGEsdiW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUMzKCJY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7aUGZ2043988;
	Mon, 13 Apr 2026 09:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jz5JtUuoahY5KKfLUZ6zNF6b/+a0ft74O2R
	jJaHIQ4g=; b=OUMzKCJYQcQ70L7OmpvjSRQ4XrqaVdbzMSjoj0sZxroeMnGwk1d
	uUS/PmzifanZyPN4DteYXzkT1dQSiDbl6RuCdRqOdG5316EQMnBh/v9Eo5B0D6T7
	vPdtgmzuTT7/nttm+hPSE0PuMNUdFsBDVZ1Kgf1wG5TGd/L6iuSE/tDVwRyjXqNP
	OakLlxJTP9Nq2kvyjrwBz8E40SJ/FEBMf9Qwck9f3fJxR7C5rQwLsofUmI92GnqI
	7rq0EO6KQESeeh2V0ZZaulg5O49zSxVnpi7NCw2bSYmyvxuUz39r/P7HJz5Sp8nQ
	oh6LCj6v8vOOX87nO/9Ibw3nRVeFbika6tQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvjse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:41 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63D9Ev5T031665;
	Mon, 13 Apr 2026 09:19:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4dgmy2mwyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:40 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63D9Evs0031659;
	Mon, 13 Apr 2026 09:19:40 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 63D9JeuU010512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:40 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id 0367A6B0; Mon, 13 Apr 2026 02:19:39 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v1 0/4] Enable audio over HDMI and 
Date: Mon, 13 Apr 2026 02:19:33 -0700
Message-Id: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX08LfkHs5xEKk
 CmhCb+5RyI3ADEaaRD9EHguBP7mKm63Zkm9TNIUV61nPDoNgXrX4xhOfmb813Er+suHT286S6uL
 r8SA64duXViMeTbxjXGlHpcWL0sCJpgpf02MFyAyd50GGx5L0GsEB6nRlq0OCF4UwxArPY+WhPG
 CPLcOueHd7fW8TLT5N40gcoDzLX0UV0PFTXefAJjUgwGtBph1xBfnPo9J3ZQ4T8dw6kZI56kOzg
 kH0ooRouVR2huLxzBAy+dTyHuNcBbyP6aKONXUGfW4v8wFl4HE+42JA+ZtDAkdpD3RS4KbuDn3q
 SBG0TrHxju0Xf/4y1ek3f8+DKySWobt7+GVbEOyKeZHgIDyTFFZWCt96sbZL6VPEc9Rb9LcecLd
 2TpN016ii9AVvQTX2By/t2/3GJdP2FmsInkO1NoKUEl4XN4K3Qbq9kyuiaEphioYalgC+4WLa2i
 ZISImdtoyrZfylH9VvQ==
X-Proofpoint-ORIG-GUID: ENSOznw9VpYk1OKVwC1NK8YCtlbsZWOY
X-Proofpoint-GUID: ENSOznw9VpYk1OKVwC1NK8YCtlbsZWOY
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb52d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=0tr3pMq46wCAcQ8op0oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-102919-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D4913E9BF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the dt and driver changes for enabling 
audio over HDMI and Displayport. 

Kumar Anurag (4):
  arm64: dts: qcom: Enable secondary mi2s
  arm64: dts: qcom: qcs6490: Enable DP audio
  ASoC: qcom: q6dsp: Update bit format support for secondary i2s
  ASoC: qcom: sc8280xp: don't force S16_LE in hw_params fixup

 arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 59 ++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |  7 ++-
 sound/soc/qcom/sc8280xp.c                    |  2 -
 4 files changed, 69 insertions(+), 4 deletions(-)

-- 
2.34.1


