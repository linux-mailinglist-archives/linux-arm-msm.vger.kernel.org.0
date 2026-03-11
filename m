Return-Path: <linux-arm-msm+bounces-96823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH3TFn/dsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:11:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D925B4C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAB8B3019CAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F962620E5;
	Wed, 11 Mar 2026 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrxDAQbt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VByIpMyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4912F3C3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198714; cv=none; b=iq+22PCeEmWcHlZ9h7prLuYW46DVVC3Tpqa2Vjj3r8yYFS6JYT6Cvd+jmNFQY7n/K2v1fjiWaNk5wSYW/p9tcy5ThSd9uI6HtDR6DzZ3HkZ2C6sOzY2FMBxN4PlRp3x4OZFSc7J9qdOav0rxs9QRfXkC0IfujZTQh1NNvHKIJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198714; c=relaxed/simple;
	bh=bZMFnwoMQw/li8/fQDaeq040/6f0tdHgOFSd7Hfm1K8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EgbqpC8xFzz1FQmYYZ+k5CHR3PJNJuIaxR6pe2TgMhdYSiz1iV1ER8vD6cSJ0Br/o7n+FG24t+qvb462qmmQTzDt7hmqJxwJedaWRRgvJwDGPOnye2y7+FNkix4hFoqPPMyIWX4Arvp4ysm+p9m+7wiO8DLgC+X1l2941jnqV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrxDAQbt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VByIpMyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIsCg6303868
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=elMWzm/OVR5
	ib5gP1JeMhaGSui5teeTgdUKGYYmAjHc=; b=NrxDAQbtILIBaqdVRbMtm/QBc+X
	iSWhmZ1PNOcrvLsPNMZtSuDOTuzbPF/bINonGac4as6kxUvqCyz3rbPPZ1zrHgjp
	6Mf8vakD6z+0TUEUpprHUHVK8Wv8qgH5onzxyTESp9lzNojS10JOHDYVPRgUGjEW
	k6xELJiIqitluNK22nvJCRVPov0d4wSOvCgENcnYP4vr9WSJUTZsd9zSguJtgxgH
	EaPXmXcCHcAm2Q+OVzY6KsCDTicEQuEs3A0/k9ROaOgnKtbPDhOZEwv3FNZBbCP5
	mkRRYCSLUlpgchadATt9K6mM2DodFXO1xaD60KjOhlcwLLXFATji69s3ddA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf3dgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:11:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae669a8ff1so412521835ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773198711; x=1773803511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elMWzm/OVR5ib5gP1JeMhaGSui5teeTgdUKGYYmAjHc=;
        b=VByIpMyTy19dC59TnzmPnIaMA7oBH2C5hmUHn2OWctsRkL01ovEieUl1exCUTNZWRR
         pEUfl2/q9p4/gkK5EYMW9dhYvADMU5H2Wle5wtlVn/xhQSLYWqPIaigvqBSaJGxGRr7B
         +k5QAQd0AIvQnYK63J0w2rp9cQhM37/DqeuYRBCpZFBzufmsnHu7meJ9Ive23+Dco2G6
         kd9b6pOcKqg6gA6OYlUnh4Og6elOUSwRB044+4HRg2wxkFdbivSzDEjstB8FZhAcYG2P
         kYifzR7nPjFPR7v7ywtmLxQe/OZnzX1MuoXqY24vesI7Y3rQKvvX9clPq0J8ELySIBsa
         iKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198711; x=1773803511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=elMWzm/OVR5ib5gP1JeMhaGSui5teeTgdUKGYYmAjHc=;
        b=NibBVjs0ORkbCcqwXc8kcZeN8rfHEYaKgOWyajzsXtlczvb8qBwCI2BW+oYfBrq/GJ
         ShzOf2NPQz74Cg3XrzKNG8izKOFJ9AT93kMMxDHjJOTsEQsYbeiRQV8APgXX27ZB1imX
         Urko22phF+XaybMk0HQY0swWlq1fobNT+nqaubDqN9QpQDbxGiLxUpeW8lT1ikGgCNK/
         wYvBRqVvI5YZrVnp5Xe7C6AXLppEGallOIfPOcDkcetvw0MJ2nM9dNSkGMZcH9YJy9XH
         4spdFvdXZbq0C7lqr1VVbJGRVDggwyh02V0qhxBcwHFGQ9CAAno/Y8iqFVQHWqI0QBeP
         ZDkQ==
X-Gm-Message-State: AOJu0YydxKWtAaMy6Zmz0NEGKD2YcDZw271c6liXBEjERWDMdRXxc8UO
	5R6MB2VX7vwweOBUO1OKR97+SMC6c45/s0kfgOdMyLW85/gIdw5OLAItR9qCPX+1XKtotgu8O3k
	mT2JdLS1j0iGSLg/bswReaGze/LTgEkCwMmN/DHGeqoX+HlDE9JKfiZJPDyE7G5CjH+G0
X-Gm-Gg: ATEYQzwGQvW5BNZlFV6kGW2nvqPD6+EF/cRQnNY7d2gmrraieI2i1YQgUb4iQviDcY3
	+jJG1Lpg50KkNzi00HD/ysnXoJR9AaLzeQGupRT/tSreIoVQnkDQU/FDYKJ+dzZcBqgfCFwVzai
	Ah2vTb+EZOKFRWrd41sVojheGUCxjFC/4ZzeoGq3DApMSqboXrinupmHPko4W/DCo2oxrAnI5aU
	yz0MxZg4RY/ZYy2sBBcFcEOWb3Hv1fuCq64ObvlghAZq0mjd4z7GycjcwByxL0vb00t+zMYAEci
	FWNL+XMucMX8Ro193SWfsaXcAF4jNMlj5nk2Z7CWoW/nEKLA5j8MNeoF1Cqn7wXLaQl67IUVXNv
	aHN8alW6BZC1Wl76cRm43VpeTN9HBhMlnRu73g5keMO75CB2joTMh+7vsWw==
X-Received: by 2002:a17:902:d588:b0:2ad:ca3a:ecb0 with SMTP id d9443c01a7336-2aeae7e0a72mr12599225ad.25.1773198711043;
        Tue, 10 Mar 2026 20:11:51 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2ad:ca3a:ecb0 with SMTP id d9443c01a7336-2aeae7e0a72mr12598895ad.25.1773198710528;
        Tue, 10 Mar 2026 20:11:50 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae246ff0sm8106635ad.27.2026.03.10.20.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:11:50 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Date: Wed, 11 Mar 2026 11:11:45 +0800
Message-Id: <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7gp9eCpkBU5henOU1Y_8hfQfew6u9sAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNCBTYWx0ZWRfXwSkDQokSTvuW
 ASNxqfJ+SUf6W1pxhsGmuvUhkCEkIHvkCFUbiUuFS3NYFK9QWC2G7S5amlneQsibIWJ6r8p6Y7M
 0E0eaeL9jiFxGEKEVrWbPauNN+SwY716WjkDYpXWFpfB+v5Na95Sihc8oGSZKZn0KYoopOYyvMG
 4Wb4w1qZWo44xgqPns5xS6ZcK+1tp36kkPtn3oeYcT2UCaG24XrUsreoclZ98DwQKNcXJR4Z7Ul
 yh3gH0MLmMrI+fmVYxZN/MtqEWXk2u5KbdVNRcch2vIQ10aR7fHZwJfkIiAlGOYRU3Sp2jdYQK9
 uxncnNRejVlDhu1+JkXkfvuXEwG7Xl9popJ2K7FjIaX5joLEUwdfxNaG5D6GYC3ifCdhzyz7LJN
 4Ia5u32/63s8Wpe5Hr7L3OZ1XgsmtmS9H21Bm2kbSC5X2nP9txnsGKD+mc2d04cXfIhLQXCLfhG
 yqN4vPDFH17xHnGBqdg==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b0dd77 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H9-LGvTQc6I73mOXZpQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7gp9eCpkBU5henOU1Y_8hfQfew6u9sAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110024
X-Rspamd-Queue-Id: C91D925B4C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96823-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Hangtian Zhu <hangtian@oss.qualcomm.com>

Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
mezzanine platform, pcie0 lines are moved from WCN6750 to QPS615 pcie
bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
platform.

Depends-on: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/

Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
---
 .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 2a2b7c2f9210..6594c7e1ea93 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -32,6 +32,10 @@ vreg_1p8: regulator-vreg-1p8 {
 	};
 };
 
+&remoteproc_wpss {
+       status = "disabled";
+};
+
 &spi11 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -280,3 +284,7 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 	};
 
 };
+
+&wifi {
+       status = "disabled";
+};
-- 
2.25.1


