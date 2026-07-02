Return-Path: <linux-arm-msm+bounces-116087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uXV5ASKdRmq+aAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:17:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8F6FB324
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 19:17:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="c/qRO7NH";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LPIVY+AO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116087-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116087-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21C1C30B0C65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 17:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED1B352038;
	Thu,  2 Jul 2026 17:09:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC08E347FC8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 17:09:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012172; cv=none; b=Xdj+Mks27dejk7cVB3GMglYUCszFs/+RlNyiBjBkXA4X+us2fmxdEHSs7ymOhz7cu6sEHMvGhLhUvS1bd06dUf1NJ5IyrhOWTPUq4j6I3SSXYOLQfB/5pgssMUhq7mKQNBjst2M4hOJ24GnnDBUlM0HAsBKWy+b0RTn/LnRq7eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012172; c=relaxed/simple;
	bh=5jfNQIA+sr0lIwStBYQTYLDXzNueYIwWb6a7QVn6N8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jL8BcdTnoF5m6aN1K182fEqf0goPrH3TqcYYZuepLd4M/MOJ83wYNxYAmC2BObN3S4fcnT2x2ib/pIYUP0VUSE9BCGwt/+UZrjFBa4sbppoP/b5/wTqHwdR17SqIrhihfkQMPyqxNq8ummuxBN9upOR2p5dshC0nnSg9d7KZ72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/qRO7NH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPIVY+AO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3U4b549160
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 17:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BLK/r0FwMKk3Lno/Mrr3v+g9uejFAiaxZkGkfqvMmdQ=; b=c/qRO7NHYDJz+9M1
	tGpeFJTPH9srkyFiCydZUWNTGs+1fl3mYOX/qf5mnjCXmj70UjUoevTRbPyHi4w4
	dfP4p3gExltYO+yZnScM/UiRkpIcpDHdai8nOQ+Wa/khbrO2XwwiK6oUmg0YLqlg
	WrTnqT2Qhj0ptd02vfkrL4LsHrvhkV8Vv5Gc8K6Wcmetv9I6VZSRFhYvaSOY/wbA
	xpqplB6br1og7kAteHH9A7VDCqUFzdrnqsZv/3PYaIoCgpy3+mVwmkK9v4c3iFkH
	GFkIPfgnpX2v3pF8xucgcPnMcj3nk5IvpW9Q9PqaiAQAujaNVAsarev2FOJ8wn2E
	njgJvw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98jwt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 17:09:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e06c76b59so605613a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012167; x=1783616967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLK/r0FwMKk3Lno/Mrr3v+g9uejFAiaxZkGkfqvMmdQ=;
        b=LPIVY+AOGWiYf9xKeCLm0eN+hGs2ZtFKGR+hPq1CgSKKgAwKK8/CEtnpC3A/TK3iHM
         2rPB08cWz/PYmWrWH1i81zQ2FH9Ym3rF0JgNUft1i4sApkisV+5kWukFEFvuGod9z4c/
         by2FL3Xg0RmJGzGP3IH/r00irfsMfHG5TNrg135oP1XKOIqh9vQKALQkpKw2296AVbp/
         ZF3/lA8+QuImecEGdjiPKIyqYV2DCq2aazeiqZeAalUwAxj5QCTPOMaRpdSDxQIeYR0g
         cqoCBl5sngyJg5oaELRjlgwIOGRPr0A2yQr9EW/jKCr9JOBlYkwFBGpZTNNxqe6OAR9J
         q1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012167; x=1783616967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLK/r0FwMKk3Lno/Mrr3v+g9uejFAiaxZkGkfqvMmdQ=;
        b=pi49fXkArUA0cZfEWeKzCkyBnbiiqilhX+uUYGK0uIPOVmoNpp/+2o2S/9FzqrPSm8
         V/syM8dzdilwEdJd+uXBNEEMsqw0cp9bviz769A5x3l8WWWY/+XmT9mCCGBRcadfJs9j
         RkFzwToVAv6LgrUAEw5ITF9Ruh0H7OVQyfpyRozsjIUrSUlz9NTpIKahl0uXivzW/y8L
         cMAhsfLb3M4/V93GKA018DxVZjURfBjgCE1XflVolcxjNwcC5+cEuMJIvdweTUgurcvu
         0kqMWk2k/ZX+iwfrmBrkH6vAGy2MSGz9W/mQMza/gj45Z/e6VTFssUjfh9deIeeBYUZx
         /8WA==
X-Gm-Message-State: AOJu0Yw8/9ctBI6XNzr3zwMRGXycn4QI7DcaDygC3dJXLvP+XBOKwY0D
	mxEKRyCk7shBALFtpUQ4F6ZBDG/zu90IZIn9weqh4ewaQP4VND+luFmgRu1qlQyEXbF+oDtWOPs
	alne/UlBl4MARAIy5BVCoeqh/Ymc23ar2WOd5eXTXuSKGBKbmfn9XWqQVO/2k/oiKX1TL
X-Gm-Gg: AfdE7clwiHRv/Di433qmJ8qF9TdBxITB051tBp24961kpUXPE+9BhrdZ5mtGaWAvU2n
	sRbXPmRFHhUm1IMvOq0xiLZGmNtjNz5r+Q2g42Iyy2XYZXPiN2UDuAXsAQrR72i2xwkqqAUsb1x
	YHIngI0zOCcO4JRKGxHFyDJZgzQmVQsLRBHY5qQppPnRhjgWD/AjBz38n8uwb5zTSjkvbhLtY27
	mOseleXYpAMeeT5pLvcEb4U4NN2lA7LRlLb8/G1m3ovv6zSDYgyxAl2vccKAAOFhFU2SBS9a4oh
	naIVfi4x3jPQt1+XUbGgP7Hp5vEANw3j9Wd6i1JwQmwsgWg0UmxeM6981qEFZMEx4posgfX0lms
	u/p61RDtlz+6AVmZh4aQ8/8FOmCNc2TwL+am1VOVrIdfLm8yidaWBtDUmJoA=
X-Received: by 2002:a17:90b:3fcd:b0:380:925:aa38 with SMTP id 98e67ed59e1d1-380aa07bc7dmr4581176a91.1.1783012166515;
        Thu, 02 Jul 2026 10:09:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:380:925:aa38 with SMTP id 98e67ed59e1d1-380aa07bc7dmr4581141a91.1.1783012165882;
        Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 10:08:08 -0700
Subject: [PATCH 2/2] clk: qcom: Add support for VideoCC driver for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hawi-videocc-v1-2-6c1e640b0954@oss.qualcomm.com>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
In-Reply-To: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lin Li <zhuolin.li@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=26479;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=5jfNQIA+sr0lIwStBYQTYLDXzNueYIwWb6a7QVn6N8o=;
 b=K67vt35IqzVeQDXVhj7FrKinPwGCIyTy456FsbXQ9LuNVBWpf1I0FKXJJgpRymvuwwWGymeqX
 2bFYF0QFfmcAXQHRF1WfI5xn/S6uIyxQfFLd8XGAL3byutYVU/vUQTg
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Proofpoint-ORIG-GUID: 1kX_1ABwp_SN-3IQRR8cvNYtvkCUCtYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX+LmzbgScGFTH
 JaDSKMxs4AMjr5E0+5wDh47sNo5uQ0GYOlQ2yeksPtiwceJT5X4fsC2ZX4ILA93VBB3XZp0Q2U9
 NmZiTOcO/GmEC3PjdBh9x3YS7Id0VKwAs9ff0W6dI7o6ZZw9Hc4nMnjyB6kvlEzT3BSOgKsVAZy
 NMtMI8wGTKTPgISF+aqgRLmtRZdyq/UgF6D4tVENOBKEA0Vw7thT+sI/kvsvuoTTkq3hD0R9nMG
 Nrxntu6ytGfElVDXo20oxO56xgvI+cR81IAUNtl81lRYDjSlMj+xqxdLFb0NBUhoaMqPOEzLaiU
 2T3sSHr74yatwzcOR6iJjT+FHh93/Vjq0MOFArjHBMSAjW5OmPEBAtbz4Oeu8vPyLS4Ey9flr4m
 /SoLupvmzkSJKPIPAoT3ztYMYT4wQxoxyMp5NRHCVRs3CX3cr+H/n3sF0zb8sqGVbZNTTh/E9Ri
 zItOa8zLMgfkTtAjkhw==
X-Proofpoint-GUID: 1kX_1ABwp_SN-3IQRR8cvNYtvkCUCtYq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX1M4gF7ZS9Ibb
 bnOChYxe404sqBFW2LaNAQeEyR2iA+0CkMNXEPSLX7QvBabjLZw5ZbN3aY2H6NbjI5dkH0uoi9J
 JZCJOvmoKV18x4nu3HI7cDDyLSqYy2k=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a469b47 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jJenomrPVOg-5lC4ZMQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[zhuolin.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zhuolin.li@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhuolin.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99D8F6FB324

Enable Hawi video clock driver for video SW to be able to control
the clocks from the Video SW driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |   9 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/videocc-hawi.c | 840 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 850 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..6b7905c6741a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -334,6 +334,15 @@ config CLK_HAWI_TCSRCC
 	  Support for the TCSR clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
 
+config CLK_HAWI_VIDEOCC
+	tristate "Hawi Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_HAWI_GCC
+	help
+	  Support for the video clock controller on Hawi devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7..31d310fe2445 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_GLYMUR_TCSRCC) += tcsrcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_VIDEOCC) += videocc-glymur.o
 obj-$(CONFIG_CLK_HAWI_GCC) += gcc-hawi.o
 obj-$(CONFIG_CLK_HAWI_TCSRCC) += tcsrcc-hawi.o
+obj-$(CONFIG_CLK_HAWI_VIDEOCC) += videocc-hawi.o
 obj-$(CONFIG_CLK_KAANAPALI_CAMCC) += cambistmclkcc-kaanapali.o camcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_DISPCC) += dispcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
diff --git a/drivers/clk/qcom/videocc-hawi.c b/drivers/clk/qcom/videocc-hawi.c
new file mode 100644
index 000000000000..ac3ff7202fa0
--- /dev/null
+++ b/drivers/clk/qcom/videocc-hawi.c
@@ -0,0 +1,840 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,hawi-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_VIDEO_CC_PLL0_OUT_EVEN,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+	P_VIDEO_CC_PLL1_OUT_MAIN,
+	P_VIDEO_CC_PLL2_OUT_MAIN,
+	P_VIDEO_CC_PLL3_OUT_MAIN,
+};
+
+static const struct pll_vco taycan_eha_t_vco[] = {
+	{ 249600000, 2500000000, 0 },
+};
+
+/* 360.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x12,
+	.cal_l = 0x48,
+	.alpha = 0xc000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_video_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv video_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_video_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_video_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_taycan_eha_t_ops,
+	},
+};
+
+/* 300.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll1_config = {
+	.l = 0xf,
+	.cal_l = 0x48,
+	.alpha = 0xa000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll1 = {
+	.offset = 0x1000,
+	.config = &video_cc_pll1_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 300.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll2_config = {
+	.l = 0xf,
+	.cal_l = 0x48,
+	.alpha = 0xa000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &video_cc_pll2_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+/* 300.0 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll3_config = {
+	.l = 0xf,
+	.cal_l = 0x48,
+	.alpha = 0xa000,
+	.config_ctl_val = 0xa5c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000002,
+};
+
+static struct clk_alpha_pll video_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &video_cc_pll3_config,
+	.vco_table = taycan_eha_t_vco,
+	.num_vco = ARRAY_SIZE(taycan_eha_t_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_taycan_eha_t_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll1.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL3_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll3.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL2_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll2.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+	{ P_VIDEO_CC_PLL0_OUT_EVEN, 2 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+	{ .hw = &video_cc_pll0_out_even.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8060,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(150000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(240000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(285000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(311000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	F(714000000, P_VIDEO_CC_PLL1_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0a_clk_src[] = {
+	F(150000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(240000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(338000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	F(710000000, P_VIDEO_CC_PLL3_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0a_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_mvs0a_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0a_clk_src",
+		.parent_data = video_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0b_clk_src[] = {
+	F(150000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(240000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(311000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(420000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(444000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(533000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(630000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	F(667000000, P_VIDEO_CC_PLL2_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0b_clk_src = {
+	.cmd_rcgr = 0x8018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_3,
+	.freq_tbl = ftbl_video_cc_mvs0b_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0b_clk_src",
+		.parent_data = video_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0c_clk_src[] = {
+	F(225000000, P_VIDEO_CC_PLL0_OUT_EVEN, 1, 0, 0),
+	F(360000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(430000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(557000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(634000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(782000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(928000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1060000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0c_clk_src = {
+	.cmd_rcgr = 0x8048,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_4,
+	.freq_tbl = ftbl_video_cc_mvs0c_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_clk_src",
+		.parent_data = video_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x8180,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch video_cc_cx_axi0_clk = {
+	.halt_reg = 0x81e8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81e8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_cx_axi0_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80cc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80cc,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x81a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81a4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_clk = {
+	.halt_reg = 0x811c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x811c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x811c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp0_vpp1_gating_clk = {
+	.halt_reg = 0x80c8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80c8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp0_vpp1_gating_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_vpp1_clk = {
+	.halt_reg = 0x80f4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80f4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_vpp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0a_clk = {
+	.halt_reg = 0x8090,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8090,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0a_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0a_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0b_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0b_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0b_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x814c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x814c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x814c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_ctl_freerun_clk = {
+	.halt_reg = 0x8160,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8160,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_ctl_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_debug_clk = {
+	.halt_reg = 0x8148,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_freerun_clk = {
+	.halt_reg = 0x815c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x815c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_freerun_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x81a8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x81a8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x81a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x8130,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_axi0_cx_int_gdsc = {
+	.gdscr = 0x81cc,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_axi0_cx_int_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mm_int_gdsc = {
+	.gdscr = 0x81b4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
+	.pd = {
+		.name = "video_cc_mm_int_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_axi0_cx_int_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mm_int_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_vpp0_gdsc = {
+	.gdscr = 0x8108,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_vpp1_gdsc = {
+	.gdscr = 0x80e0,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0_vpp1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0a_gdsc = {
+	.gdscr = 0x807c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "video_cc_mvs0a_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mm_int_gdsc.pd,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *video_cc_hawi_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_CX_AXI0_CLK] = &video_cc_cx_axi0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_CLK] = &video_cc_mvs0_vpp0_clk.clkr,
+	[VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK] = &video_cc_mvs0_vpp0_vpp1_gating_clk.clkr,
+	[VIDEO_CC_MVS0_VPP1_CLK] = &video_cc_mvs0_vpp1_clk.clkr,
+	[VIDEO_CC_MVS0A_CLK] = &video_cc_mvs0a_clk.clkr,
+	[VIDEO_CC_MVS0A_CLK_SRC] = &video_cc_mvs0a_clk_src.clkr,
+	[VIDEO_CC_MVS0B_CLK] = &video_cc_mvs0b_clk.clkr,
+	[VIDEO_CC_MVS0B_CLK_SRC] = &video_cc_mvs0b_clk_src.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK_SRC] = &video_cc_mvs0c_clk_src.clkr,
+	[VIDEO_CC_MVS0C_CTL_FREERUN_CLK] = &video_cc_mvs0c_ctl_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_DEBUG_CLK] = &video_cc_mvs0c_debug_clk.clkr,
+	[VIDEO_CC_MVS0C_FREERUN_CLK] = &video_cc_mvs0c_freerun_clk.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_PLL0_OUT_EVEN] = &video_cc_pll0_out_even.clkr,
+	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
+	[VIDEO_CC_PLL2] = &video_cc_pll2.clkr,
+	[VIDEO_CC_PLL3] = &video_cc_pll3.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_hawi_gdscs[] = {
+	[VIDEO_CC_AXI0_CX_INT_GDSC] = &video_cc_axi0_cx_int_gdsc,
+	[VIDEO_CC_MM_INT_GDSC] = &video_cc_mm_int_gdsc,
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+	[VIDEO_CC_MVS0_VPP0_GDSC] = &video_cc_mvs0_vpp0_gdsc,
+	[VIDEO_CC_MVS0_VPP1_GDSC] = &video_cc_mvs0_vpp1_gdsc,
+	[VIDEO_CC_MVS0A_GDSC] = &video_cc_mvs0a_gdsc,
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_hawi_resets[] = {
+	[VIDEO_CC_AXI0_CX_INT_BCR] = { 0x81c8 },
+	[VIDEO_CC_INTERFACE_BCR] = { 0x8164 },
+	[VIDEO_CC_MM_INT_BCR] = { 0x81b0 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[VIDEO_CC_MVS0_VPP0_BCR] = { 0x8104 },
+	[VIDEO_CC_MVS0_VPP1_BCR] = { 0x80dc },
+	[VIDEO_CC_MVS0A_BCR] = { 0x8078 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x814c, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x812c },
+	[VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES] = { 0x8160, 2 },
+	[VIDEO_CC_MVS0C_FREERUN_CLK_ARES] = { 0x815c, 2 },
+	[VIDEO_CC_XO_CLK_ARES] = { 0x8198, 2 },
+};
+
+static struct clk_alpha_pll *video_cc_hawi_plls[] = {
+	&video_cc_pll0,
+	&video_cc_pll1,
+	&video_cc_pll2,
+	&video_cc_pll3,
+};
+
+static const u32 video_cc_hawi_critical_cbcrs[] = {
+	0x8168, /* VIDEO_CC_AHB_CLK */
+	0x81e4, /* VIDEO_CC_CX_DBGCH_XO_CLK */
+	0x81e0, /* VIDEO_CC_CX_XO_CLK */
+	0x81a0, /* VIDEO_CC_DBGCH_XO_CLK */
+	0x81ac, /* VIDEO_CC_SLEEP_CLK */
+	0x819c, /* VIDEO_CC_TS_XO_CLK */
+	0x8198, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_hawi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xa018,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_hawi_driver_data = {
+	.alpha_plls = video_cc_hawi_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_hawi_plls),
+	.clk_cbcrs = video_cc_hawi_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_hawi_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc video_cc_hawi_desc = {
+	.config = &video_cc_hawi_regmap_config,
+	.clks = video_cc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_hawi_clocks),
+	.resets = video_cc_hawi_resets,
+	.num_resets = ARRAY_SIZE(video_cc_hawi_resets),
+	.gdscs = video_cc_hawi_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_hawi_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_hawi_driver_data,
+};
+
+static const struct of_device_id video_cc_hawi_match_table[] = {
+	{ .compatible = "qcom,hawi-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_hawi_match_table);
+
+static int video_cc_hawi_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_hawi_desc);
+}
+
+static struct platform_driver video_cc_hawi_driver = {
+	.probe = video_cc_hawi_probe,
+	.driver = {
+		.name = "videocc-hawi",
+		.of_match_table = video_cc_hawi_match_table,
+	},
+};
+
+module_platform_driver(video_cc_hawi_driver);
+
+MODULE_DESCRIPTION("QTI VIDEOCC Hawi Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


