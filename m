Return-Path: <linux-arm-msm+bounces-115766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 98gPN+5GRWrE9woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:57:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5446F00D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:57:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OVf+vu1K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Aw984FVq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCC11317860E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F8C36A373;
	Wed,  1 Jul 2026 16:51:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDE36C9D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:51:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924671; cv=none; b=D5YD28DAkXqwrgeGtY4cpsz48PEGUIA73hFMMmonFUJxHxhjHzX13AJn67aKQfSGwGLFGogfM0w3Q+RxDC8H+HdkpfmGQuiR0tMkopbmC7WKREiOFC/Y74Kyw6J3Oper8KTKt9naHdwtJSxk3WBW4gjZLpXqJYnea8qx/8Y6U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924671; c=relaxed/simple;
	bh=3fa5RxnLg0h9FzDOxZcJ5txMchAfDC1BiBec04p0mAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=clJs21/xBnJbJuO+BNjCxmGHRcO+mY5qR/PXGsh2fVdGj7+Rdh1gCl3sXCAI/OeYIW22Q0W7ItO7t9ru4z2u+J/DOQZoyZKGMnlcfpnpkfuUB8ZDoNuLU9RA+MCP/cNRunYpfM8q4SeagKEVtzLoNmZhh1Ln9suzdcwjxaOhtZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVf+vu1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aw984FVq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gme901630487
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pLLEkdZGg05RR/kWPl97BFuXcLJ57ADpbeM
	ohFlzEKQ=; b=OVf+vu1KMLMWhmTaAOdmdqHjOjGTw10BCZAUMjFSgDVxKU/VNpt
	rqynSylirdM/apMdUbJiIYL3SwcB0tQyw+jfr9LQjwypkxNZegxwtX59x6WSc9hT
	Nj2RIflfnXDCT8R6gkXM6L/vXjzfDlxVuKcewKMQO1LXwN28+4Ij38BPWx2s0ptr
	Zxbs1x8QSo/Eyvdx8GkC4eWQtf+WDHzROEpaKxFdAfZt6IHlyRh2sgRZD9EPT6Zn
	hEuj3ZlrVOAEPMm4ta/a2/ltI34yQ7/sLwXuIDscBBGlclmBlmFxCKanQbTtWHAV
	VQFfYZL6CkhcKkcJhSb6QEsrLjoIpVdpz3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mg6f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:51:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso701102a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924666; x=1783529466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLLEkdZGg05RR/kWPl97BFuXcLJ57ADpbeMohFlzEKQ=;
        b=Aw984FVq8184CvFE9zEPfxQcTSC9frjmxwfE42ieUDTzCDdnw7T4Z9e+mTC+7OlMv+
         t6iU3mmB1pW68Hegjrq8OMTuJjHVPR3eIqxLK6jEh+uEHqjLal+XzYOh1WzTm2K1KBL1
         LkukXZTYk39MAi+CJhMqIi9qn2tCFmHdQ7+BRSIos8YP8+0LCorVF0z1F1rhqy7JwH1U
         PNzjq8ll7/8Ko46GGpN8aLzMWWW+sjsbLOAZ+4LEJyoQDKEmd7YVWoUrtIri0+AcBv0q
         YGYTXcmufAOo5zEmaQ3S93adC44W1niJ2auGwQFkWcyfJ/SzffZMEWMCcaWan0Mld4uj
         xl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924666; x=1783529466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLLEkdZGg05RR/kWPl97BFuXcLJ57ADpbeMohFlzEKQ=;
        b=UVmLhYsRbKtT7pQxKp0caFaKLNQxmteTvE6Q6VFEG/ytMcIp9EhHG4C3HTTgDNJwKh
         PcEcQsaE05Y87Eo+gfViH/Ozs7hSYccxQ6UAagQDOvO8qqO9rWlQ3M6nhyzSHaODOLBb
         n3lgGrGltMG4SBzWl24uDpLiJvf2ezy4bKRp80MtmpntKUnIaX2sTdyrU+pruSMmQl7c
         JmfRbyz67wsQIK5UwuuwoOzROR3uxrTlMdP4X6i/PjVdes5+4Ey0X6CFzD0Wx9LKTsYv
         jmZoS1d9+u1NmdxNv9wQhw8JR3DISGkGAYUBSgUOdpsCaEBwqKQ3FuHbz6OsziPDPHCi
         nrXg==
X-Gm-Message-State: AOJu0YxizBPRYFtSxDwsjcsdx9j1ExeXbNvMu1Q5Idt/uFn1/SO8hLkR
	O9SFF+FVwM8QSZc4GsHcM2y6wBgfIxkaX0Z28A/CVb0xwJjxGxIQp2NTj2z4LnJQ7k5lXaGxcXN
	WdIRsdmPp08FogZRyJLytIrARJ5IEKWGUwL32vBALW0LXXBnwxIityF7vJxLs/OS0lBKg
X-Gm-Gg: AfdE7cmTBn3d5tMyMOVtgVa/jtQ2r1j15GzSNjrDQE9xGUyfJ4pi852wmHUO6Vh8rNE
	fIfdiOG5hrKB3T90gRSmDHX7qRDWO8CgA9F+6YABNpvBihGppMF/+Uq2p1PD9E8XTsuEHsouCVz
	FQltj6CGUITD5W4ZcuPwqSyLiLbNUoN3Pnn/0AR/55dJ+EGMnLalELPmNzEnZoTZR+M/4EOPz16
	LOMmJekpHqoxtcbFukdPFkjLMpcPgue7dz7n/6fqLsZ6bPI0TRv5I7dNbn4dJ/sBU+fTBfUa32W
	tQeYm/UF+jNCOmcE31v37i45U8kGy6SmDw4TFBSOu3vaqbKCUcrlN0eJd6gIeAVFPy/7+kjNCif
	jwSMNsY4/NOuGl1FJsdoNH8H1BKpo1Xb9HSNqpub0n7+x//U6s9A+t8vTEk7j2MqX8CN5p7EeN3
	QmNdFB
X-Received: by 2002:a17:90a:d610:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-380aa21f0eemr2164254a91.30.1782924665470;
        Wed, 01 Jul 2026 09:51:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d610:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-380aa21f0eemr2164211a91.30.1782924664973;
        Wed, 01 Jul 2026 09:51:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Add USB Phy driver and binding changes for Qualcomm Shikra SoC
Date: Wed,  1 Jul 2026 22:20:47 +0530
Message-Id: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AtjdOEOFiqUxHZd3HvBBDChTUrjN_j9w
X-Proofpoint-ORIG-GUID: AtjdOEOFiqUxHZd3HvBBDChTUrjN_j9w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX9X8oXVQsHzzI
 h5+xgbIuBsuFuEQRXQsAk2vhfvs2fB730ma8eklp9xmnjm7KdJITYqLmBeAZPTtVxvwdxUfnodV
 INrbuM86ALaXH1p1HQaia0Guq/uAqIS8Ucd19bskO83GEhGMVLPoXzUdzhFowaMXDYnDitz5jOK
 PEBbUPBcspeH6K86p9BkQYzs/OlXDDo7dcnnFJn/pVjngnOOWwtRw0aGCNPpEHX7PLtD4M7DO0A
 il+lzWSL5fdBmjvfePvkYq0aLFuCY8asbyHpKtRQyY8O0ixYX5IQJkcCT3sMajwWUb3fn8zj/p5
 bUxMHtkFbRrZTB8dfyrCUC/tkB6GBltSMe22fHP6KAZnIvqjxSxK1zUWD1i8jtS7CN43alXwcnt
 nSXIdY6c5AX+BQiDKOYq8r1gjyy7RehuHp17qQWkyXIaeiikMhFTtjJKoD/x25zuC9atBAN4uPh
 82J5Zt0EIlUB3dPeygg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX8frfDERLSoZK
 gH/Gb5QbqbCHMsSjykY/k4l6Qk9CTKIHeWZRhY77g5uRYmICY4B1DsFpwuHv21UX17t1ysvLNjH
 FjtJ4tYDnd7rJmNNS8fH4PQJgEDjT6g=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a45457a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mO9Zq68peapftSoldg4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115766-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F5446F00D8

This series adds Driver and binding changes for USB Phys on Shikra.
There are two USB controllers - One of them is SS capable and other is
highspeed only capable.

Changes in v4:
- Moved to using qcs615-usb3-dp-phy and added resets specific to shikra
- Updated bindings to reflect that there are 3 resets used in qmp phy
- Add remote endpoints and orientation-switch for Type-c handling

Link to v3:
https://lore.kernel.org/all/20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com/

Changes in v3:
- Moved to using qcs615-usb3-dp-phy since the DP Phy is present although
not operational.
- Using Talos as a fallback for shikra in qmp driver
- Add required "phy" reset in qmp usbc driver since its needed on Shikra
      
Link to v2:
https://lore.kernel.org/all/20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com/
       
Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.
        
Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com/

Krishna Kurapati (4):
  dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
  dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
  phy: qcom-qusb2: Add support for Shikra
  phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../phy/qcom,qcs615-qmp-usb3dp-phy.yaml       | 54 ++++++++++++++++++-
 .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 53 ++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 16 ++++++
 4 files changed, 120 insertions(+), 4 deletions(-)

-- 
2.34.1


