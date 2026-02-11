Return-Path: <linux-arm-msm+bounces-92585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNe1G/ZHjGkHkgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:12:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10517122975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 10:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0031301DF77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1943C355040;
	Wed, 11 Feb 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3J7EYu+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIbaOAfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A735580A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801110; cv=none; b=bo62DbDotMWPdhvFgRYCNKnH9wGwGKrFVKkx1tbfidp1AUt+UTp+vXNEYzCd96gSlU5wopyoJSVroWeYbrKej6IgJDk/tQ/xkyUuOhb8ezjSqzO0pEatA+iUawireDxddJxLHrzgVXzutkN0HWUyKL7JHv3C0FcEk3CWt4sPPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801110; c=relaxed/simple;
	bh=El955TNgfEq+vvMUrMWi658/CEwsO58kNBlEcBMeI40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=br99izJRq6SQReDLARsYSmqlX8eOuSXiCrZqL/S4WbPDHv3zTbia4EEtwItm7y+fy8lDU7sjk6mDRDekAIyeZp6r5ekeCk2/a3VJguY24H7jc7xiSjEfnJDr098mZE3BqrXH7AW4o4h3WxI0lPMuxCDy/kidviuwpiHgXUABcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3J7EYu+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIbaOAfJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B2O5VG2943611
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hQ51JRlPSt5
	s4B9/yYRO3CccNJAWz6AxalLUGQMD9Nk=; b=f3J7EYu+eIK+xYajZp2CO4EKjNu
	HKjKL79xrU7LXj/JQL8GUnd+Zp9qU0QFrXvMoF7V/CAtZPUQuBqlkhqxMcuMbG8e
	7/AlZsO25mUuAxmXzw6pl/vyZTLRxc++Zdlu2IO5J9rx3d7MIVt+6ETa6aMLwEof
	vW4R+QfBt4QdLSs4axzemQmWJOUziON2Kex3TXeJ56tIVcJPxX0lTx+e05KZ+9ne
	5ZruBEEA3YU5CXC67juWuMuw0PyJns3XD780kv5hXx4A9UNTODVhMoXWl8mbE49y
	NgLVh/O07isP4EfZPVA6IXqlGs/tw/dDvGtyaZwoLQNZSxnkZ8Fc/E3qLxA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88r72sbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 09:11:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1d32a128so197617a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770801107; x=1771405907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ51JRlPSt5s4B9/yYRO3CccNJAWz6AxalLUGQMD9Nk=;
        b=gIbaOAfJleEvYlhjxjR1dWB8VTveydPh914vlbNLPi19xgDXnm9WzCWHhme7lmVa0v
         emwASCu0R+Uy/pLi466CLoZZZeNfKUuWZVJnDOe3LaRJ7mfieuFIWY3jZCsMJ0JLMjd3
         uTmqf32eZtZcsszR9uYOpNM4cZEarUKNmK1O1s7FWIXZHk3pvMOw0iGoUXytIpgvFL5A
         wWl/HHwPi0lDCWBY8suCUoG3sZfv3XNjJtsNoOq8kGJUxFmreELsIyIUXG2HLPL9EpjP
         g9SoO/xWeeOggRGO1VQa7EEMnoxecTS8tsXBRTDccggmhz/5MmelOQIMTOsl/cidMm92
         6B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770801107; x=1771405907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQ51JRlPSt5s4B9/yYRO3CccNJAWz6AxalLUGQMD9Nk=;
        b=hiuHO2/DqJywSnj9U09aHHtxCWq3b1KTj7z93w6hGMqXN/Un0wCtCNH2F6fmPwkVS1
         19JzGafvmc62QbF9rNPveoWkzoQ59Zm4s5QXfJleHNo3MMhP3vzykevR6D8kiDdvrI82
         twiiJPD8Rjv9Fy0MhDW/GggJb3FtAsji2U6mCfFESiMDSA/TMAoq5uW0heGJUhi570J1
         jRC0mFE1M2XeRxjgm7kbFRWbLPXnmfW8DKKCu+Xx91Cb9h3BYlEgdJAf8FL7GzJl3j7V
         VfOYwBYjRy2q2IuuyLYHzWxzepyr6zxgeidQhw2tB24Rt0afa4OnWbQBWQrknt2W9viD
         xM8g==
X-Forwarded-Encrypted: i=1; AJvYcCWXKao2Lb7gnxxD7RDnGXnA0QCOgaUiNnPXbfxzcO9ZbhQboTknRFHYiPcWx8Bl7ljoDmZg3LbAtURyAWpT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YUkPqWtavGoIxf7k1NYdKm7bhKcuw+hdlvqMBETOXOHQDE0L
	UTqrP9V081u3WDG/fiTA3qwj1wPCBX64ITLR9vPffjp+eIeurH3+SE5ascsYhwrpDtk3II7s5zP
	nipnRmOuzJV/mvyRyFacFHZbqXJRZhaE30YDnoKfHnb0irOp9J1DAbNXXQJWWhkYhNg3Or5beEf
	fA
X-Gm-Gg: AZuq6aKig+PCWKLjLrw5a4QEgI0s3lJAwH9Dwu5Gu1sXLLnrhjOHnC8DF+0Lo2p5JFU
	PEg8pHG0i5oNuaunDSPWQ/mXCRjScVAxxM6V7crW7Af3bIOxlggB+LNV/L04uLJ1jGlo3WoLPNn
	G3wSikVbqtttAOZMXHvgmdFvZYn1gE0HkkFjrtTBiodA0JrLbNp9HGf1tnWBeWnCYmP/uHoS0Jr
	ohtdBY69XTeM773RSktWvyRUkPifZm8yxhlCeCG5TSw4ZhLewWTpPoz56O21PUhGADDC9iLlIeF
	GTWrw4SXikYXGTqcOkqxD8bRzyXbAdI06BF7ZsOmUZYzLdoJ6a+oTCv6o0Qndn31lSMZKHQMaDA
	/d2u4BtBUywvO4Vgc9kSvm1jRVsNSxH1zHlMGnswPzaJj7da0mcI9ptM=
X-Received: by 2002:a05:6a21:6f0a:b0:392:e5eb:f0e with SMTP id adf61e73a8af0-39417fb11e3mr5175933637.65.1770801107365;
        Wed, 11 Feb 2026 01:11:47 -0800 (PST)
X-Received: by 2002:a05:6a21:6f0a:b0:392:e5eb:f0e with SMTP id adf61e73a8af0-39417fb11e3mr5175913637.65.1770801106936;
        Wed, 11 Feb 2026 01:11:46 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1981512bsm1521481a12.31.2026.02.11.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 01:11:46 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: talos: Add clocks for QoS configuration
Date: Wed, 11 Feb 2026 14:41:12 +0530
Message-ID: <20260211091112.3285626-4-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211091112.3285626-1-odelu.kukatla@oss.qualcomm.com>
References: <20260211091112.3285626-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 147Os29sizrcCXCX2_g0wVXgXFhjSWOZ
X-Authority-Analysis: v=2.4 cv=YaywJgRf c=1 sm=1 tr=0 ts=698c47d4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=7s_9-EB0MOrke_GCL94A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3NCBTYWx0ZWRfX7a4KVSd59V79
 TxylsIi7jtFWswb/HSFvigJA2jaGiAW0stKCRd/9ffSLKZMkPYgtHEq0wOSkGWEeBHZzvlCAi5F
 Jr9OYSxCgP4GluwTYc3PIL5f42ghjP6pYbNcyd/w0ZcyWsHN5fz3c26wIOUpnNR8zVFTBLjxFw2
 6cQ5Sp2QsluYTJxivjb2pQPCGsGbUWT+sVPFVyeh+LBS/Gby0cYI/j7qJoZas6sRU/tz00cyIuV
 W7LKq3VBGuTj75jxdP2YK2JDBsdu6dxZ75vzogcWOnXU8PE4pm17KxJkKz80x9Xl+hKV60njEZ5
 XPn++zNuStKXILM6PeYTPptELT+RmzlQBkHhbIiuq0W7XUrxZLB83c+TBWZKW/P0Gf2VIAePx/B
 xDosvS0IlVd6atI1bYlW2HNm4ZquodrEzLZCDZGAKq3FJGOZVoFENr2OQPC7Ytva1d6rMCu/0YI
 Ly/1J96Gj51AOnP+X0g==
X-Proofpoint-GUID: 147Os29sizrcCXCX2_g0wVXgXFhjSWOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92585-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.25.240.160:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[odelu.kukatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.26.140.224:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10517122975
X-Rspamd-Action: no action

Add clocks which need to be enabled for configuring QoS on
talos SoC.

Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..232232b02265 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1234,6 +1234,10 @@ aggre1_noc: interconnect@1700000 {
 			compatible = "qcom,qcs615-aggre1-noc";
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
+			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB2_SEC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&rpmhcc RPMH_IPA_CLK>;
 		};
 
 		mmss_noc: interconnect@1740000 {
-- 
2.43.0


