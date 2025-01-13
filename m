Return-Path: <linux-arm-msm+bounces-44894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95CA0BEC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 18:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F5B3A7C6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 17:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6641AAA1C;
	Mon, 13 Jan 2025 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oZv/d+3i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A621990CD;
	Mon, 13 Jan 2025 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789238; cv=none; b=IjQ4IQZ9Y/SHPqeX08scIXON1eoIJzOZDmJZTKY7cun9e2OemYugYddK/TlsyDNMXKshW5Ltz6j2qFRIpvmAr3BzVhpifUv4QA1zd5PzbTI0UYAyDAAzWWZnVQh6vFwQSlAqExJr/kslSTCO/oN9TdNffm0Njln0OsyoxL24Ndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789238; c=relaxed/simple;
	bh=FRNr0PCo+pkhVbnYdI6mZRFEbrHP6OlUrnbnKDfxDSg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nedVFwUd3lycU2p7v44FxaANc4Rm5z01gEdrh57CDay/+28PWGTGzIb2yCaSzVzY1hA9NatoshtfzlPjUW0jWT+02cr4RpymlwMs+aMtLu1Zv9XugASyK5JBF/3PHUozcg55pOqfiUULosd2ELzEhSanYMc0Rgw7rcj4G4LYMBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oZv/d+3i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFS4QC023227;
	Mon, 13 Jan 2025 17:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G0qT1yEfnrWRnpYJJiOgBP
	rSnlc+2vusWMcHvrqP2FI=; b=oZv/d+3iTMN+dGDU+JWOkwnFVJzJSbKgER5CYk
	aPgplYADn8MdcnajylJlZWFhHRqOEl6jodk10hHLmQ+k+9Lu/lJqeXlGwxwv1Nd2
	MHTnZp03zNsdy4YaNmjeha9a6CTYvNHeSZPiGjEhnpWU5Y4osjTM+OmyX7QdWEj6
	kLWH8KRQM0afFnYjGgOczrKUiJm6Exu9/harsWokQXWSjZSBYhrPxx2a05dvzv4z
	du+0MNKl5lT+8aW7+y4IDVjgTZ/S8soRIkJop9kOw8Lo2DMw3BYcg43t0KIsTZrE
	KrXfJ6qoYqW+OQRuWmAQAFzhBcS6vzByLmdJvzSgr5zwmndw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4455gfr9t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DHRCBm005172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:12 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 09:27:09 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/3] Add support to reconfigure PLL
Date: Mon, 13 Jan 2025 22:57:03 +0530
Message-ID: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOdMhWcC/x3MTQqAIBBA4avErBvQfhZ2lWihNtVAqIwVQXT3p
 OW3eO+BTMKUYageELo4cwwFuq7AbzashDwXQ6OaXmndYj5TinJg2ncU8jEsvJ5CaKzxznWtNcp
 BqZPQwvd/Hqf3/QCeBKO3aQAAAA==
X-Change-ID: 20250113-support-pll-reconfigure-9a9cbb43a90b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _1wn0C6da59LsfoiIdYwdHfxy22F0meJ
X-Proofpoint-GUID: _1wn0C6da59LsfoiIdYwdHfxy22F0meJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=925 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130141

During boot-up, there is a possibility that the PLL configuration might
be missed even after invoking pll_configure() from the clock controller
probe. This is often due to the PLL being connected to rail or rails
that are in an OFF state and current clock controller also cannot vote
on multiple rails. As a result, the PLL may be enabled with suboptimal
settings, leading to functional issues.

The PLL configuration, now part of clk_alpha_pll, can be reused to
reconfigure the PLL to a known good state before scaling for frequency.
The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
in future.

The IRIS driver support added
https://lore.kernel.org/all/20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com/
observes the pll latch warning during boot up due to the dependency of
the PLL not in good state, thus add config support for SM8550 Video
clock controller PLLs.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: Integrate PLL configuration into PLL structure
      clk: qcom: clk-alpha-pll: Add support to reconfigure PLL
      clk: qcom: videocc-sm8550: Update the pll config for Video PLLs

 drivers/clk/qcom/clk-alpha-pll.c  | 30 ++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h  |  2 ++
 drivers/clk/qcom/videocc-sm8550.c |  2 ++
 3 files changed, 34 insertions(+)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-support-pll-reconfigure-9a9cbb43a90b

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


