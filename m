Return-Path: <linux-arm-msm+bounces-103393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM13LX/P4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:01:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDF40DBF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DEF0303537F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831DE33EB1B;
	Thu, 16 Apr 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZfn+elt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SM4ALTuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B173B27D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340816; cv=none; b=iEruHkacgjB5RVQOI8cGmjrXVmYLP01oO7xapEBZKKvk2+wTIk+Kx8uN8M7MV45/RIPl0ZQ0jRGd3/TZe3tYsbfv6EuhQFRmjL8FORzhHNilS/Q2gQvv4zJHThm9tfMQ8lo0HPh4pIznUEdmT9U4h8CrgYyNs4dnrOyJrkwFQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340816; c=relaxed/simple;
	bh=QE8CNKbUxHV06s503gk28Y3re8Qm1iszOwW9njMEFI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arblgZuGQbHM7iiMlSOiOW5J2U6WB5jPDYTsU1AvkIltsSGpB4QBdi9AiZTGaTAMpWnk478cmkEk8hWc8V+1qBRjP8IkHrzXB7vPCf1DeNJWYZIL+RzV0DR/KIcMfIDes21k5iDPqaEjmUa/tR735etoGr7+eH1IzNRWPK+YV4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZfn+elt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SM4ALTuM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6PGej2653725
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yc98Heos262Glwo4M0c+bKKH3aIaHhX/ZC3SOXWuFWQ=; b=MZfn+eltiMvFlBuq
	uUtyZjGsVMXw46hZKEbgobU3pTBhj/OjtKW3i1GCROscmP2R8LAFGVNIUobvH3UP
	B9miZ1Qt1StMQFqkn8qZstLUdbZTsV4Q5vAtbekk2UxJmgTCMExkDJFzNnv5npW0
	haO1QxdKgh4o9xWDRvT5DWdgUaZGFiEWmSKGowhVcK8Rv5PSxbyVBJT+HK6Uj1iU
	Rh8yJe1gtQrtwI6sig8nSWT157BmZ0lOSdKcto1HsMVWhdGbwuNSGByMS4ivv5KQ
	rol5kY2u3kFgjWunRhM1S1OPQzSRanrf4MkmKa6l4uWGIcZ3Xhh8TpvJvBfApC/9
	IvY4og==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfuh5nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b0e04285so3511157a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340813; x=1776945613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc98Heos262Glwo4M0c+bKKH3aIaHhX/ZC3SOXWuFWQ=;
        b=SM4ALTuMcAF85FZcuDH/ID+yG7lwhIdCqMWR6tv546wfrPLwC0PsiZsmgkzxeRY6gk
         c1axYYpP5qxS5uA/AFpWxbTglGDHX/YhThzYEXMzggqHI9o/ag3QPtn5Jpd/jslgCpAs
         yka6h+t2uiTnxkQYianYlip8sfeRIl7Izay4tEYUSASPAoAIVTH1iqbF7YJqqqGzBW4M
         Ov/55E5pdevZF8zrDlfBsxBHw5/GTtH+w42N6NJGWVmQEj9ALFjQS3Zk5qT7P2Z21k+T
         XAGJHtwKZyGXzCVtvwDtQmbu2EgETrqK4IFvLEBdVCiVrML7DTgbOUDKGsgtInE7jJbQ
         nTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340813; x=1776945613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yc98Heos262Glwo4M0c+bKKH3aIaHhX/ZC3SOXWuFWQ=;
        b=Vcfqrfmk8lM0LKXU6/GJ5auOZk6EWxGbhmmzCOYvqWW/Q9yYKgmFR99w1IeyxN+Gqb
         eAJ4LvnPY5M2O3sXTFvhKsrZIe4x++8wXekyZhrrGWBKRIdxDddoTY64nJ1lZ163Yhzu
         kuuqLw1ksVZwqGWWui8SGrTlQHrz2Z5hU6IDdIfOv1X1ztE8tucnrV2t5lQSaHdm1gK3
         EAT7dr4NANqPrVjBaTNrw5H82jDx+CuttEPGVghXXLuBQ5V4cyul1s2yB4vLSnK9HP9n
         nXWg66DjV8UAKzllA0kYpYjilFZVnUf+RhlJVuxc7ej4etmZGW26gBx+AKCR/J4jxd+v
         LmXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f7fPU9zfL13yz1Lsy+HMwK1WqUVu2V3nxT6tp7DM7o9p2bFt/iW9xtRFX3usCTm+qFHsR+VRSPo4cxDj9@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8YSCzfQWIB/9zTLJaZANG1Gt1OihJJVrVCBwaTc7LaMFO4Fm
	KRBtw+VZn7dslcdvjGpJPmPF5506wLjAtJ+ogHdBXSLLNBLO32DdcfdyigvKUQNBnRGDeSbNjAE
	WWsYpZ4tOfRgCTJjplaqKZHDtZtznoHBn2vdKaZfbWswujLqZqSGcGXypWVvW3TwDMq5t
X-Gm-Gg: AeBDiesS2nZ9Eq8KVdnls7GTGJVyjb3e0F0l9eJxwgP8kr5fEaYr7Gq7AUf/M2f9wuG
	BTcbUVpAmeG1hVfCQ/8XUfm5WgE+hW3asgaYsEm7Fbd0wmeGoUdYY3h00yaROXr473fp9jMOt4M
	N9hmMkNgyXeaxT44TlUkudmVhFvVj24978Beg35uL+66RJpGYlMpOl5b/bdoKJEbu9017kuomd2
	lQPvNtK2gPudX1qBNn7h92EQ+q3C38dFUaFjj3CWvkXBMxe7NMgGJlvKWJTTELW1uJxHDwmQ1An
	XrQhxueCXxOqPciho3999xxAmSkhz4qIBUtBxQs2F3pWYev1nIX8wq4lxdTfFLVVVvD1kKQqDA8
	L+qm0U/vPWu81zAGLolN6gIywdwXDWtHhIotjUzyb+jQvt3P2mUpwohtgHA==
X-Received: by 2002:a05:6a20:7294:b0:39b:d9f1:6d05 with SMTP id adf61e73a8af0-39fe40e0678mr28808078637.53.1776340812757;
        Thu, 16 Apr 2026 05:00:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:7294:b0:39b:d9f1:6d05 with SMTP id adf61e73a8af0-39fe40e0678mr28808003637.53.1776340812212;
        Thu, 16 Apr 2026 05:00:12 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:11 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:20 +0530
Subject: [PATCH v5 03/13] arm64: dts: qcom: kaanapali: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-3-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1530;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=QE8CNKbUxHV06s503gk28Y3re8Qm1iszOwW9njMEFI4=;
 b=hlZbO11yX1CFG/dQ6xbqMmRTnRitXdbCOfRoswT0t1xEnqyCIZLpK8N2n0TW2y+WtS56ObNhK
 eGSNi1JM7w7DoSyjo9zJ9BFbbavE8M093eC954b+M58KXu1UhHJ2bJh
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: jBnoVmRVnASq2UfH0-0AYUnHTGQvR-D-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX7OrR9RIoJoJ3
 8GBkhHaIEJURkvn58nQe3k+AT+Jx419SZ32G7RK6X3LYv9YT+YrfeP7vZVVxA4xWrpdb+7MLTUK
 y8SnJ3OpCv0LkZSmInxs1vRddArEQdSI7iHCGFbvrK8UdR1jOsl/g5BFJc1A2IWlu1/hCADg2oG
 o3hdL/84oZN6kcQL1RSTP9e6X49mfhScTj2jOP9f/eimhbFa0GjJbY5+8/AXgDjXrGEE9GtUOB0
 DHBtdJAI075rHS0bAlakmkN2aB2Wq3g96WsbZKpyKss4rR0Ph2BM7EWE6XCh/QDH3+hdPWyFoCm
 610B4TYib1VTZBrC0/2N5ZXiU4OzSpw4E09RlBWCGRccSElaNfRqZQ8IYvV5eUWG25GrIZ6WOJ9
 9kgd/2WmX61J07uwHptNNC4nwc041400ZMhubDmyEp6McmNi2ANXl1UVVdpvox5OgPgppDNtZJq
 b1Cj5s7qFc9N0qFbATA==
X-Proofpoint-GUID: jBnoVmRVnASq2UfH0-0AYUnHTGQvR-D-
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0cf4d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103393-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,1d88000:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[1f40000:query timed out];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[hwlock.1f40000:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43DDF40DBF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
kaanapali.

Fixes: 2eeb5767d53f4 ("arm64: dts: qcom: Introduce Kaanapali SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..14e362a4899b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2538,7 +2538,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


