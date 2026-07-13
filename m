Return-Path: <linux-arm-msm+bounces-118645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VeFZMYGHVGrOmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:36:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BE747912
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 08:36:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EzfsScn5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g7C39Moz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118645-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118645-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B444A301877D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 06:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFF9381E8B;
	Mon, 13 Jul 2026 06:34:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFAD37F75B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:34:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924495; cv=none; b=bOz2aAgMxD75QBipWBFuNz5TW6p4zbtEAiV3X0gmox8cIcfb9vfftHtaCLB9oRoiR1NuHb3q02ZIam7TVf+WMytjpaOejLRvjMD0Tc+JgSyQ5W6Htj+YkyD4sopa2XGEOObpAt7U4xdLScJE2EnDcNpLtA06WKNX3GkKY48oSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924495; c=relaxed/simple;
	bh=mYzkB9ThUQ+do9DM4Df/BqKYcIPRCl8M++baQRJ3Pc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxLibjvke4yYKb7Wn54/yont7zv1u+9YTVrVKiuPhyUtpl6D5rnHhzfZzYPt1IsBYiviLaCQm5dve3sYuL0pjbjVreF56hCAwZ3uzhQQOOOU2cr7mMjzBEJYJtnYrWQVwdcrD3YWsuJqvXHr8gA/R1aKoKjEDK3y2c5YmiEcG1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzfsScn5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7C39Moz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nf51731613
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=; b=EzfsScn58eUWByI5
	que33sg0iKZQ1aW3SJzR6uPMrNmhqUocB0zSLM2PDdLlV8d1PU8rG/hGPoNcDXHi
	lrEnSexIZ5G6tYzGTt1zHa5JSzKRqbsU1OZX49JwXNJdnptRsL9dCBSxLKkyXqDh
	95SFBltmiWEQjXOTm6l7vH0VEPCeulDVKCkUQ14cv7U9cD9sQOpks6rJESgdOSEC
	f2ED5nDcl7xDuxjthWMYC1FDDOmEVSVEt0S7IeqnYU4NjkOeEb41KzAq2BtiBAVu
	N7YrMtKeaTBM+unDGa5X1wU++p0qd8jeM5wZlmAJ9ewF4H10BJDrGdxcMCLndLX9
	3KMSEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3954s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:34:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2535054a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924382; x=1784529182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=;
        b=g7C39MozYhx+2FoetQ5p6RHIidzKvx/9UQhi7M1RwN213hZJ887ic3dD/xlqWvmOLx
         u5WPFQao38yLPw5wklEkuAvO+lahueTWErPQIsS84TWnc4jIshwFDQTJxkv0AT68V8vB
         ihAIgFfJ0cxQCeziORenDZ+T4PrDOMLbtOJhwM7+D9F5hqNsoO/Te1SwrixLp3P9uCJc
         5t1L8jP6sOKV3+7wALnwiYPqlQEbnlaoVousxmo0kN8OvRYbbXgeOvs4tO9cYcArc3An
         mTvLhBHiJzeEy51yjviemWpx2YDKDhF4jsCPeYNkW74RC+o9YGIZL9SEuIYsOtXBRRE0
         LXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924382; x=1784529182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3/2eZczxLloyZtkKdFVIAM5FE/UO6ThitApnKOp3+c=;
        b=B29Iypn2q86R/9/j+dQCb0I9RToyoNEGOy6tfO6/EH8Zm3XuDAHOfRmeGpmbsUkw9H
         Lgw20SFfm2PARhUWhWXNK0ehA/gj9vDlcQ5yERTHQvWOdLJkv71zp6E5TYuGLuzrkBBE
         85wN75eG9Xfwaccs+3i+StYVMslCA0365s83QJfC0UnviocMnEP4/37CsANhcWBJWuYe
         j6aXrZw9wK4P/u7mokrt5NXncmbm/ADEs7VozHZYR00e42kpsTfbkbx5N6dUySYuO9t/
         gxYtT/277LPI89sEOqKhe6pGfCdOl1EFHTe6IGSY6LKTFSYGoIHzRjmlymlFjb8nHRqE
         3mWA==
X-Gm-Message-State: AOJu0Ywjs8K1xUdonaGRm4G9v03LDes867bXRXl0nOfj/ba6gMt43rUv
	OBwHBWk8JkAGtoTJbrTVNdUnGUOStZyEQkSyUPRZ4nISxfF4t289SoQ+jpNzA0yNJNehts/Uqd9
	AvEw+NClBAInevG7xhR7YamrZgVYDn+TlIGEsRMSXPC8XrDqB7cpkcdIRDAerBsEevuhb
X-Gm-Gg: AfdE7cmxqssUOtYcPHLMjkMxURIMHoj5HNXyCFvrrm3rwPXa1xTy7HLOk5FfDRUnvE6
	TPjgMTMI0i8UPlu3s2wwQ9qIdKegmrBHP8wFIIAoiw6U2+GcbSN3dzaoLt3tnaICnDmauJFdEt5
	Wd3dOaN9yRfTaaZhFSLPyXXP4ZjBSLteS//339TpbKYFhUY28c35N0dv1CZvv2xTjwPBOvztCdm
	zPG2VT/S4UmQ8CQ2gawfr4EOYS9EaFGJ5xOUbnBuoudsNaDH/3twKo2AGf+AHQE4HL0rhz2OWir
	Gwn8i37Oq4FA/9P4vr617F2b7Et+0+fSmG8xTXBXKxCWj759V1VWvHpPwRAqu2N+pTeZ+34Wp0s
	TXSGNQoJ96KO41N4Ho3F6JH1irobLODWzrXSRlf0QAcmYXLd9cP9vch0yGNzs+KJ5c4oarqqIdJ
	x/WQQM29jqWdCN8/mW02llcCsNWaK7huvXYd03C19/
X-Received: by 2002:a05:6a21:1f87:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c110adf5a9mr8471430637.58.1783924382513;
        Sun, 12 Jul 2026 23:33:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c110adf5a9mr8471403637.58.1783924382048;
        Sun, 12 Jul 2026 23:33:02 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:20 +0530
Subject: [PATCH v13 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-4-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX5V22TPB8SerG
 +zDZOhEte27IRpwe/UuN+WUOaIzYA4AdD8v1nEdhxhfLhXCn/Q0hRg+4QCieI6Ka6zLOseEQuEo
 Xd+FUgitnQ00WFjYzKSuU+pkc2VElyWuX8y2tv4EYLbbidPHK64uOmrYnwIruMc0Wky4U1Lm0U+
 0Tf+oAq/PrdV9+p9WRsCtreufllIk7tkhF731qxc8tFwwf1hS5V7b3Q5ZACLLcluiEJmiuhv9OE
 jkmlZpWt3ssww4aPV+pRIM8827nWZgPyg7bjmXLEZ0usxluVbMTHL8kKuhc5b6iO5ghOCHP1xUu
 vmphJ6w5N5IGRJ3rV8PJhkBqrQt8u3pZZ6zNh47DN5UwmM32hqBslbGhnPqWufWXDUDfhhDFvvN
 XZxUiS+8FOMwlbQGF3IxkMDhK8iQ8Bvq4J9u/tzETqZ5J8E4jNbzisGbIY5ezA1h+dBHm+8so+0
 Me4LnXgfWP9m8CkYWIw==
X-Proofpoint-ORIG-GUID: rAZPEZ62pCikv0huQJJQpbxGSojHjuxo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX9j99rGzIHNku
 j8JlDPwEvxJeEuGgUqGNTOSI9usXBM8nmIo48KduXD0QGrPXerZ9+bIkDcpGCCR8QKMmwn/pxZq
 8ShZ+rzsJWtnctbYjvDyhuBp88vpAvo=
X-Proofpoint-GUID: rAZPEZ62pCikv0huQJJQpbxGSojHjuxo
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54870d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-118645-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:george.moussalem@outlook.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 255BE747912

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index edff89257468..86e8f837bb09 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -731,6 +760,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,

-- 
2.34.1


