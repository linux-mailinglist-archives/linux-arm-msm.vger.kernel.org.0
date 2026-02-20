Return-Path: <linux-arm-msm+bounces-93484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CZNFk03mGl4DAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:28:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5F166D34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FF093018763
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F060337B95;
	Fri, 20 Feb 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhjehMkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8tcnAns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9FA322B8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583296; cv=none; b=GcefTMyvSBaXcG5zyuP68qlD97fLu7FTJpjMnvNLCrBkjId1fpTOoZvZTSS11IMY3/5jPhl7sop7R2mPZff5eKpYPc/vEcEQ+oHcITSyuDiyLkj9L1XFAizPmPJTvOyWXyhkTvSvX4V703fKxKrE7UVhbmU58E495N3ScniICPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583296; c=relaxed/simple;
	bh=cBciamsnZd3KkSlYbrsDAQh0R7GbghrvkBhg7gyq4dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dugjd2Vf4zyoXo7/w+ftleXJ94t2YPo1PES8pzToW2AU/1Eniuxbl8AIWMFhYQvMzqQ1zKtGv4mf3EM/dumgqwbVWFWpHlj6IJ92Xzd8MG9NHccwNFZ/VoDPRky3Yio8HZNiaZM6o7w9oi83u7GsgmUhysLfKUuavrZmRYssJGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhjehMkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8tcnAns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5S8l62553698
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9LWk2TOkd9yBcJrWQVxVKZ
	a87Ucz25ImWsGz4goXwuE=; b=IhjehMkDKLizhTblNrlHM7HGALdq9QNXzyv7E0
	eWx6iZzN0PoU35TgelvNglrpaD2IN6qny2tHAChfqxYzv5TPzI9cwUqIeJsHuvGQ
	dJkbA7x0VuJsUiqyOh9wXGkipPWLKoy7gj2erW0S5t4B8x8q5ki9OQx/ZuXLJX+e
	Wx+ZJ6f5A0ktrXReeZZFra+rXYok5CUMtu90dde48er52ygs+gvSAQTUFSwanwSU
	6KV9Mjjg0sUAnUYdDZ5DTctcq7HQHEnGh+6sO7ed8y7SxLwOGNsHnqq90/pXs/aa
	YdCnW0qpK/EoQ0HUUNstDdS0fR9I4IFPM2yinGbLBg7zNIkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7t0qn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:28:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso1875055a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771583294; x=1772188094; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LWk2TOkd9yBcJrWQVxVKZa87Ucz25ImWsGz4goXwuE=;
        b=A8tcnAnsNcs9No3cDNl4ZdTB+mAM2W2KHM0WGXlYNpWzHt22GNeJwML/OTycigsdym
         T58C4OIyDhhER4JfQSo/Z2VvuIqycTOLJujKg3UPOSOwoKiVWDdHVyd8sq4ixn4hvHib
         r0RA4KYzXB8lfAgHsU8I+QngmYkPG2FVuoy3XIgca/22lY30yLkbTN4o+TbpjQJVhPzy
         YOFcUJ3Mz4iTqxH1UwTDFFkc4Yb4WXDar33Vz75p30iCsJqhEe+DqJZGTUon0o/Yrd6a
         UpPXwjZi9cw7/UqKxiVr5YkgRmDPvp6Tymmok72xoAADvUBOjBVOMGz3TUM1JbCip8XL
         MKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583294; x=1772188094;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LWk2TOkd9yBcJrWQVxVKZa87Ucz25ImWsGz4goXwuE=;
        b=uoRo4sbVQ6hJ16jnyJ5RnxO7CRZ0L0niygNdAPRtffI45LbjY37zoKL3HUnGIt9bcV
         LPzdS4PbHDeTqh5T8uQxy2SAuzK4NA7lPeabexVHXs6x0xViQKoyyKzTEowUqatIMqE/
         f3aOn8tZWbjvzSr++sbNwRUxUTvpK4dA9W2fBuuYvjPMpUUDMNImrXDtM3DvvdsKpS7Z
         xcCUyKiEwsVMIMBvwwIjh/iOJjH1PA07aUfBUUWs7DgLEyINgykujJzWt9EqNcWbg08k
         UiuoF/o3UEbe4LFu97ZyLnGTm4j1c87OU8k9pyxfF/UVtj5VJrp87/t1AdiLKbfGJxfx
         WgbA==
X-Forwarded-Encrypted: i=1; AJvYcCV8skwMvU8b/VDRNaLWMn4yNmDscwh95ha4dU1VWl48Hab69B6O4THePkOiNW5Bi4Qo6pR21QPW0FdjG+9L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3NAO0UepbVAMrPVWl6rDej0FCn9Qy7yPG8SsxB4ugL+QP/ERs
	Y5xpkJUYaEJpnzQykt4BfzS1DibV3q0KyOZujamInc242IaA8g2sE19S6m70VXTuuUW/n/fP3AN
	N0b6TQMf/Jz5zi8rho6sA5cg3KWDUbf2ZUkoq1ZGdzbbru0XtomLLKbqNbNGyOnIheLZq
X-Gm-Gg: AZuq6aIvGwsTH1jTgft0DNwnsyUVQ7Zrp4YtA8oFMgkTeRPCjvPJS2StBceFlyC6SG1
	XI5vaiN0XZXe7kWCPNFWjIDmMbYir55kNVq2+vb2r21E0ktUSVr/GOMCNxfScAWVCQOz4TrwUn+
	/qoYkTC+iEEp0xJ/GzgcZofqwswtJ4RjQ2tsv6kcYjWSXs+R2b9aLhH4JzKkEfrftnL3OnehETo
	4i+bmWl2ZaaPgu8KqfTrm4r1gNYmwY1EZNyzUb5+EfnKHsgL2iArrp2gbMew/IDp1QjZ5o+sr7W
	GaSwUtmhZDggGPY/pA1QI23B7aQ0XFb/KBydLI+nc71Jq3jK0xjiUy7k2NVXzr4tDkzX5Lv4ChE
	k+cNqm+1hnRN3FWPHY9d0B8OyjdPm3M/g4J3hvt8DsJcH0Q==
X-Received: by 2002:a17:90b:5644:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-3584481e55bmr15644694a91.1.1771583293438;
        Fri, 20 Feb 2026 02:28:13 -0800 (PST)
X-Received: by 2002:a17:90b:5644:b0:356:24f0:af08 with SMTP id 98e67ed59e1d1-3584481e55bmr15644671a91.1.1771583292930;
        Fri, 20 Feb 2026 02:28:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1b1f84fsm939084a91.2.2026.02.20.02.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:28:12 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 15:58:04 +0530
Subject: [PATCH v2] arm64: dts: qcom: sm8750: Add camera clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADM3mGkC/3WNywqDMBREf0XuupE8jIau+h9FJMTbGmiMzbWhR
 fz3pu67GTgDc2YDwuSR4FxtkDB78nEuIE8VuMnOd2R+LAySSy0kV4yC6TQfnA3ODePKlObWjFJ
 0qmuhrJaEN/8+jNe+8ORpjelzHGTxa/+7smCCNcJgq5Fjg+YSiernyz5cDKEuAf2+71+3tKrOt
 QAAAA==
X-Change-ID: 20251203-sm8750_camcc_dt-350a8d217376
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: duDlTmgLPQTBNgSV9LH5OFN7ljtj_cKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5MSBTYWx0ZWRfX4lLa5J9qo6N+
 Xg55dnDaIfclHTJ4K5pcN1dhOdmQKHSUMMVmEjWM7TDXcwmHoeTjsFwBXgMZHqxoDlgSKg7VWt5
 or7Mc0Jmw72nO7JmXXHQlI3bi29qLdhrELGaBX46Vtw2Q9WfX3C9HBZVcCKaVY3wxw+v7+8DM+D
 YCWZDJueLj+m5ydrLT+PtcKN0Zxoxso5xFkL10nDBoGFmCYR0nMbbX8Ae8diC+yY0xNZ5Y1MfiO
 H8xox/60tIjHvTRTyED99O+2v+SlXH567nlIspHZzOXPpGIP7c9+QEBHt1kSNmur/nBFfksstFE
 FpNpzdxI9rgMACBOjGTH8kyhnzV0GMwyp695Yg4fTHqwbpvRZasgWxcHTvz+anU0hmbMUaShjkQ
 TNa37OKFX7T6F6icScI+gn4bE82h44fGiGScb3bb+KdruVU+qsVV9+/PyiUp0prvpgXN+TLPet1
 4hBf5QCjSE0wIYQNlCQ==
X-Authority-Analysis: v=2.4 cv=PcTyRyhd c=1 sm=1 tr=0 ts=6998373e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MaR1rDPHEXExjTPKk_gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: duDlTmgLPQTBNgSV9LH5OFN7ljtj_cKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93484-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.25.240.160:email,qualcomm.com:email,qualcomm.com:dkim,0.27.41.32:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.26.219.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7E5F166D34
X-Rspamd-Action: no action

The camera clock controller is split into cambistmclk and camcc. The
cambist clock controller handles the mclks and the rest of the clocks of
camera are part of the camcc clock controller.
Add the camcc clock controller device node for SM8750 SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Changes in v2:
- Update the MxC phandle to use MX for camcc node.
- Add RB tag [Abel Vesa] and update the commit message.
- Link to v1: https://lore.kernel.org/r/20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..740277b34427a07bc89ced99c80cd717466d6fc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2,7 +2,8 @@
 /*
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
-
+#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,sm8750-camcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
@@ -2046,6 +2047,23 @@ aggre2_noc: interconnect@1700000 {
 			clocks = <&rpmhcc RPMH_IPA_CLK>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+		       compatible = "qcom,sm8750-cambistmclkcc";
+		       reg = <0x0 0x1760000 0x0 0x6000>;
+		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK> ,
+				<&bi_tcxo_div2>,
+				<&bi_tcxo_ao_div2>,
+				<&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,sm8750-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x5b800>;
@@ -2740,6 +2758,23 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8750-camcc";
+			reg = <0x0 0xade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

---
base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
change-id: 20251203-sm8750_camcc_dt-350a8d217376

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


