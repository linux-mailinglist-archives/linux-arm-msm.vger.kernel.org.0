Return-Path: <linux-arm-msm+bounces-104665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KuWDG4v72mb8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:42:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC04700B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 575893016005
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49343B2FF7;
	Mon, 27 Apr 2026 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKlIDAuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSznRXfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7323B2FE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282917; cv=none; b=CCLs6sj/iKDJy5UXeBtbacVO8Jh1FgVkBY8dkrD/zV7ZQ/YduQMr1csV2hrIwkAfcN0dmosg6IlePUrzmG6dbEQAPas8r0W8Lh0t41TcOxgbm09tFVijpP4n4vAUDt5OFokUaBtDCd6RDtOnHcsxKWakpg8HSRb0el/U6ycv2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282917; c=relaxed/simple;
	bh=izdsfwaYNHod3Uu0LgX0CxOmUAvVdemke0KSJpW8pvw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OHrnXdcq/V+Ds2vv3FoPzcTZMb3tztjaFTMDetVMIf22Y3g4Y8ED0o24PFUuWjLEIdouHAvwCOkeCmaCnU45UFHmy1Oqx0DF/ggbZlf1QVWrViuKkEqMe5DaQyjPqgjPIf8DFCxrpdvEKiQrK5BpnAAwdbSBH5iPu+W+cryeu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKlIDAuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSznRXfG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kGod3961981
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ftibmOOd7QH41FOCzUlWyGD+U12IXvCvVbm
	GPc49sJQ=; b=PKlIDAuNlR35d/YCFo2hhu/q4aeE5v9LzmQ7sFa+BxvLnZD0CKp
	001t8vSj6lTvZK1xYPc7cefsYxgOwnLvWgYYxNlSFGCoQPMAoK45RBSWAU6sCoPg
	ZReMndQVEidbRlf7flviiS4jyRQ5oyXrHwZiuMJ9U+d0A6mkBMCaIBt0ymO3g+Uo
	4SAMe/yWWV4SlxxO0fSviHqmxGLuTR2OAA+6NBWrIZ1Gw+lxqPVdWsXS6eRcRpo4
	nQm3JiBbVLEaVfpSm0d4TfiElE1xAbz8xEUI+y/M8M5l1gzAGb4YF1q5ebgDIjPU
	7SPyHbJnk/BcUFHrWBb0kSQ3/n08VUW5Lyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30d26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:41:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f896eb6faso10355707b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777282914; x=1777887714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftibmOOd7QH41FOCzUlWyGD+U12IXvCvVbmGPc49sJQ=;
        b=bSznRXfGo5/j4e1BYLxq/a4XBgwcYd2yup6uZqU3PGRNO5N+2fRfDD4wx8TUZDvVtZ
         wsR62cGfEBkOd0Dmplh1QhDI63FWaiw/y7B1XCCtb6m6vd57Iq5nH5GFnglEY5t1v+D6
         2PGEjZktr9Hi7zn2YBgmKhXJv4TMMJBbqwuhie2RSQPhtsPOTCq1RQc+Wwlvzyc4zv9x
         qhFm9w9FmpIq3X7YPRdFdvm1rNxaoji4FrKYHDDL/yFI9uhqYPIV22UjspkDLnjhA7W1
         w7aOqTPk5IcSiM5XZmaicWH/HdSxci55pLU2m1iJZtVemk5qfjDcbZSqHUN7hgK6kv7T
         tCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282914; x=1777887714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftibmOOd7QH41FOCzUlWyGD+U12IXvCvVbmGPc49sJQ=;
        b=V510H0gYj2BRhE7X55P4xYP0VHKTHR9QE8lswDXBQUs3E1kO7073mc0XqTqJrLiaMS
         JtYal/qQUVAdJwg5Z+hEAKr8jQO4JxvBdo0PazVZL0rmmqhic7/gLm4EkdsUITvHnyH/
         4PWcJhgUTpMi1MeZR0HHY+Xy6xBCAgZbJgFHWQJII+IleKRwLfWkEnMhPlP/E026FVvv
         s30DDpKQpaw+hpcLBmW6kCUdm+7vofnJCmjaW43LmG8bi47poPzsl0Rw/CHndm8HbwgS
         /Y/yoqSGQiAS/QEES2B2cAkOA2KsN41qOM1c13Kid4GKYwGAuT6110w64LYRckrnJn2J
         OmaQ==
X-Gm-Message-State: AOJu0YzdnSLENpprx6MEF1y+xMKPKz69JEJEqADE/NnrRJ5lPuLVDiK3
	RBTJEigHWcO4VZ3GK80EyFG+RfCiHYiABGgtJ5PIEB7NLwMsYqZ5DpfTFO5NV1YQkuezB8n4asG
	6Ky80x3J8/0RIySEkZp21j/52WvmXxcJNCM1GFTbHAf1TOaigDbCg/+UIi867SkTpsqVw
X-Gm-Gg: AeBDiet1axCoCth00wi9pgqoWh761pjxYoxqed6I24L06lCcXeho5NlSHIK6BLpdbyQ
	LHk+0RpESwhhXrCoKTSq+Ozf3GFPD9vIqoxyTIVgcSmrRbs4InTQu6hFgLy7jXW0a1YV7VCB+V3
	c1VHrnw60EnQ1UmJ4/zvaovdtgEvFD8rXRbe1OeSyMYSAKCV86lfaAeyBK9mio22E7q+kdg64Ms
	i+jVRepYZiGgHhDQg/6gcVYs/Yxg7WIu0KFJk8LBjKRi5EzMayE50D3BKwZZHWKKV43QcYUNikx
	dxirIAKa1qSIqCJaPwtr2AhEWXMT+rgdL2VmYT9Lz8lBLZ1bQSg9jpcqL7wl611FwYYCIfHjRf1
	ti2hGKdMa7H6B/qkb9v19Ot3cZtVSNtLn094tbGnKqJtc21gwWG9yu/HMEhGD3Q==
X-Received: by 2002:a05:6a00:1acc:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-82f8c8c2f8fmr46796208b3a.28.1777282914042;
        Mon, 27 Apr 2026 02:41:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:1acc:b0:82f:4a4d:377e with SMTP id d2e1a72fcca58-82f8c8c2f8fmr46796171b3a.28.1777282913607;
        Mon, 27 Apr 2026 02:41:53 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3f31sm39298342b3a.37.2026.04.27.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:41:53 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, krzk@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND PATCH v2] arm64: defconfig: Enable Sound DMIC driver
Date: Mon, 27 Apr 2026 15:11:31 +0530
Message-Id: <20260427094131.607583-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwMiBTYWx0ZWRfX6JtwelRDl7O6
 lfkHPbhsJQtghZTsufUl0k+SPeq5R3sfKOP0NfACpbDZ+RJ1DXGOGK8GZKPWHvVDl97I+2bN0+U
 1Uuo0MKV1c2XtWCFhyBk+KW9FpQzJlOecbYAVxC9fcUgnlt0j00Rxj4cT8rRwIJJzP4CQueA7sU
 3wU6dALkPimZYZFN93VFabbWbDQRZ4S1pTMf3+VmxYDJg4DNyezrPIUGxmfIOW2875t1fDuaLfA
 +UDuqqsb5SQm+NFwzSUsSlqU8Nsd7KHRuSXwB7r1OA4jd3ffd6RWK9bkVcMU4pqvu5ZXB0l7RtM
 DgQRYFA3npifAbKncmwC4iDxeSBP4je3IPwPVTWwW8oTMwPFNOwHvmSOstK6UgFaOnqSnPJ1RAB
 lw7Z+qsCg3uV1OROfIeDofh8k8vUHwry4QlS3KKZa+evPNzAQjqJC9HS91obsRwEhOXme7tX0U4
 ln3itcPrCy1mPRHLPzw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef2f62 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1C8vAfoZrHBgNeZmfoYA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: kcXD8vPUTVQQF9bfFzH2-jxIbZlOw2fx
X-Proofpoint-ORIG-GUID: kcXD8vPUTVQQF9bfFzH2-jxIbZlOw2fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270102
X-Rspamd-Queue-Id: A1CC04700B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104665-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Enable CONFIG_SND_SOC_DMIC as a module in the arm64 defconfig
to support digital microphone functionality on Qualcomm's
Monaco and Lemans platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

---
Changes in v2:
	- Resent the patch with an updated CC list.
	- Link to v1: https://lore.kernel.org/all/20251203044217.171598-1-ravi.hothi@oss.qualcomm.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee..b86717943 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1151,6 +1151,7 @@ CONFIG_SND_SOC_TEGRA210_ADX=m
 CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
+CONFIG_SND_SOC_DMIC=m
 CONFIG_SND_SOC_J721E_EVM=m
 CONFIG_SND_SOC_XILINX_I2S=m
 CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
-- 
2.34.1


