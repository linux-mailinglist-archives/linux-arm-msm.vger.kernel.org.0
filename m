Return-Path: <linux-arm-msm+bounces-100915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFUyD8cWy2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:35:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB097362AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B251630358AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F2C280329;
	Tue, 31 Mar 2026 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnlR/aHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHIJwjzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032840DFD9
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917315; cv=none; b=R996Z8saf/z8tMn/X4IfxBkldY387GtiSoHrBg+DOmnf6TsHbPjS+JljmqASwkWRyiOA0nRlEPm4boMA9gll4kPicDYFpYbIbkWM2vhbWJ0x+ahl7rmVhDum0fXqAC4MQOJBgUNiDEAKnrjGM5MOzKq+zT/TETAV5NKLEwzb0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917315; c=relaxed/simple;
	bh=OxmTEsU6yPIvA9JFvpyrJOrSETzVU0VLbsVYljlqaU4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pQ99XVG7YHWj/MWt00y5On0zueQdhg5Iimf0i9HJLKMO/1B/Pz4ieL46yzgo5y0PobA3M3+sz1tQoF8Vb1M9A4ClGlPCtAhLwngUf7VJaVsuTmZwVx/rSNkGKFSS6qX4yiTaRz+iABWGahigFxhgHzHahv7/zhybpiHPFZrbiqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnlR/aHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHIJwjzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGYNkE4013777
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XxOdSYsl3fecO0oeoW1Y9y
	XUtWQGqOKVZLqUNQjrjcs=; b=XnlR/aHAt2QDBTmvO04+DyTONKUNTC83UWR5XL
	PpdqO4kM95oPHAlmCETkr1GazRTphzC/IbFk9hzD4FFwjwrYt19EDbpDjRUF+2PD
	HmyOqLYL4oHuHvUSnH4d/VHpUcfHT9Rf3K4W5V2qEAxJOfk5MNuQ8UdzzPgSXDCO
	3Him7TgCzjlXHFfN2XMP72spfwOG+aqIzVjD1jz7QBXl1PRYuGXLYqNaJWDvdOKY
	qjrdb87hi8JA1Mp/dNGBz2GHvpUcCzrWgMT+uj13sRI5JBjQoz8KtNASEdleXpCh
	U6GEWbc5K5m4QwXgPalz1/zp+eDk79s0UnWw4A9MjhQ4eHEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regtqn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:35:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so15449994eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 17:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917312; x=1775522112; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XxOdSYsl3fecO0oeoW1Y9yXUtWQGqOKVZLqUNQjrjcs=;
        b=EHIJwjzdCQdUgb9ns7dxz1otpLWzdCK8BPGS8AdfkGgiHKK0+D9gvdVw4ByUEweqeL
         fqAaeoi4q3HRkHjcx9OmAXA8FstZD3zkpNwRctb8oqoSKAm3rr46h/FFqv6dYe8/Iije
         styhvP9Sy7ir0NK88/z/MvzKBrjtjLAqHHPUheMgLkx+ijAaDP+MZXtf/fQuXzgJELAx
         fWs1iGIKM4NhzE4Q24NfM0ZlEI53bLhg9V9TLth2jbAfUVySOi5hLSCDhYP3y7Ry8hoj
         jh4DaX7lLk0jmOagtOmljFb1muzF5rdpMIJrUf2zhMK03/h8/NvCnrKhdGfWrdQ2yhQ6
         L7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917312; x=1775522112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxOdSYsl3fecO0oeoW1Y9yXUtWQGqOKVZLqUNQjrjcs=;
        b=Kw3xOJ/UXO3kwTix06CM5G4ENQq0DWhj1JHFOEjsgqzsD7ZiBGIh6U2/xo07vg3oEB
         lABIXgm7FUAt0SgarDfy3txMA8TIRTo2TnZ5e/nTEHQFBnUa7/QmG8atGA8mj3dyT4/e
         eLBeW0P60xQvalYVIkSPwi+Inn2XEU8AHfIhFFEMSw6gewVzI1MIz55xjHFHZ/TRbwmU
         6PLWdKRtGehqZe10/NpNgCYaQQ5+7krWVCmZFoFmO6ahD/8C4GTUA6KpPBT7bZWuh53O
         pJmyYZc+9kQp+OGX747q0fIoZibzU41wkhSOjtfr7SrQ/p2qArAVg4gZJbKu50+YKi9g
         dxoA==
X-Gm-Message-State: AOJu0YyokHrQKqP3Rz8gvGuxiPohDhcU7bVamydi8btBQdLcr6+VUK3y
	3qu7S8Vs/sz5aP5J8QnZcCjhqyD3vYHYV4PvJc3kH8ufVbB2x5E4QPFO/XTsElXytm3dr6gyi3l
	lL4RCozcDFNeof4lgSG8uWok93KfMMxvfsE/MHpJ0jardrym3r31QgFCNJMpoKJFqmJOmHfJj1t
	kb
X-Gm-Gg: ATEYQzzgef7rHWs6CiAeETGkmgdlrn2h1yU8nBfWTl+fI/7xiH7nsN4HMyrSsVy/12a
	Fca6Tp7OFjVKa4bMYikiETZC0En93azEYrWYwykyLLDZYRX+VvCEitR+/PXKuDptzHLZ/9yKBNV
	VD+/KVUnaMjtcsobI7PnRp08iFIAHy5hEUmiwhQSqmCd4GbuwDW9x7dR7E8EiSYyg2TPRB1ittD
	t03DdiN+56HS/In0UyylEyJ5c5pSSkb/jm1f+ezkUiOhdPBNOCZOQe/HQXiJQ2EO2ZUxJC2DyBM
	S5FJrBlBM/K6Hp0UuSCtKuETFz808sgeQFTiAa31RXRHA/+lV51a5s1Mnc6ws1qhwugQD/ngh3v
	QZv00XVqH1VY0/BJEDnQ7kpVHSkOys6QGt8BKHLLJzSzzRZN06jVKtHGWbEh6i2XBWW9MIBzuIb
	DJ
X-Received: by 2002:a05:7301:1298:b0:2c7:11f2:d081 with SMTP id 5a478bee46e88-2c711f31321mr2311288eec.14.1774917311781;
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
X-Received: by 2002:a05:7301:1298:b0:2c7:11f2:d081 with SMTP id 5a478bee46e88-2c711f31321mr2311253eec.14.1774917311215;
        Mon, 30 Mar 2026 17:35:11 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:10 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Subject: [PATCH 0/7] clk: qcom: Add initial clock controllers for the
 upcoming Hawi SoC
Date: Mon, 30 Mar 2026 17:34:55 -0700
Message-Id: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8Wy2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mz3eScbN2MxPJMXcPEFJPkxBRjsxSzRCWg8oKi1LTMCrBR0bG1tQA
 aW78dWgAAAA==
X-Change-ID: 20260316-clk-hawi-1ad4cad36d6a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=1758;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=OxmTEsU6yPIvA9JFvpyrJOrSETzVU0VLbsVYljlqaU4=;
 b=03RbKNT3HIjRENWAS08w++Bz8qNif54rsAGZizhRTonDIoenKuxuIIhcT7pQrAuNclrEjWQKl
 nmDiaHysXmsBUvtK06l6Z6MtIgZnh3aIqezZCgw9DE1G5UO6fqgODHO
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69cb16c0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jia197ti5a5XF4lDde8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfXwixZiUEm4+GS
 rFXz6QCcWvPsPbqu5gv5eiZwEeRur1PTjFv7G8RWHhU2oCLy6mOjFE+wM7m7YqNDr5dn4tOz2U8
 zy+EWdbWa7B1kfjcg7wu97L7qWLi0s0d0iCwdj0w5Dm6aR9PaLG0WWBYBE/gklpTt1hhFGYo2Ud
 OekjsQ2MhJER+9e8leshNMUfBS5tdSbs+7eDcUKnFUPjtvbMGC36KDTQ6DIh9/FPLTiHMmJNG1L
 pXhknadNYNpNaJtuBABAsowbewyKOyApqKr/B3lDZHeR4JNpLnvp7+DFtsbyUlq8/mUF0N9iya6
 pzFEwYVQwO9fIrLcRfH2rEvWxBwDCdG5xmLTLWgEU0jrmJYt1VHjmkIZAWa2Ogiax80SQ8Rf/N+
 Zej3mLlo7jyMo8qW402g/OVGQY4AnPRDFmOR7nWSZ02ytF2qHJKp85xCESNEKicq0AWB/lIZT6N
 t33pdwwFvvnx8QJ/xfQ==
X-Proofpoint-ORIG-GUID: ZES7ROlypG8gJNkEX69Y3Zs1UBMZL0fx
X-Proofpoint-GUID: ZES7ROlypG8gJNkEX69Y3Zs1UBMZL0fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100915-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB097362AFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the initial clock controllers required
by the upcoming Qualcomm Hawi SoC. These include the Global Clock
Controller (GCC), TCSR clocks, and RPMH-managed clocks. It also adds
the PLL support required by Hawi.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   16 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   33 +
 drivers/clk/qcom/gcc-hawi.c                        | 3656 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 12 files changed, 4208 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260316-clk-hawi-1ad4cad36d6a

Best regards,
-- 
Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>


