Return-Path: <linux-arm-msm+bounces-116801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aJmPO+igS2o8XQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDB710955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:34:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iQsvuEzR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ePIYgzJm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116801-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116801-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13792303CF36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD6E4302E6;
	Mon,  6 Jul 2026 12:32:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D342E8C9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:31:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341120; cv=none; b=cbF98krwiDxt80CEDm/bTsxP74n0inRI4HswYglLNsGIomonhJYlDbRQu9RyFV3XcM5FOAyetGs2un1qwS1iIUM9KCwCGas08mh+/HwJZd1/78E9eX2Ks6LEhSXsHqLfav5/OnYBofLmoyNgpEzWEsW5pDJFuCuJ3yIycwpPUf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341120; c=relaxed/simple;
	bh=1XYwDRGVJPSrDbmhaPWd3Agn7+i5qwXTVHRjNgb7CHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqIAwW8Wk/LT5gmBM/3hNwvFHbuR6qhD/mi/42cyCvKS/LWk3u8rw0rlXOynz6uFEsVncNO5DZsmyvSFX4N4aGlJP3Z6FWEY/m2FdJvMVsAktQD5O40fjrflJ14hj4iQBImSve+k3UwzNne7/VN5W1RmWcUU3Y7G2jbLJzQA6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQsvuEzR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePIYgzJm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHKW174778
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTZ2SH3u+rNbOJjVHcn+c0PRrIb97kDFe5LXVZxXChc=; b=iQsvuEzRtpp2hTG4
	+qACd6HKuA8SDVCnBrJeSaFAyI7tGAdHGIRtx1dlyvY1cmlsm4w1gowlh3x/47XB
	u+TlgPVv/xarJEiNZIjQgoEv5UL45qeGhcIy7qAXKGd96Htfo8n0KBFwhYZAA2NN
	XTW6RV0ykY39ntTQNJiQ88fMNlaQ9gxEZfc5mVAEkFruiZQ11gjRBjJNN6NQrANL
	uNDnvnQl6WrDeNplgF4z6T/Eqf6+1UHow0RMDyioesPcvmWNx1kYoThck9ih9i/g
	0Ak1s5gSaRsN7J7YmAqaAeJFZPIDfj/X+Hj2Kz6kUz3tVcV8SJxvOngJIN6svZ/A
	zZgz0A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs7ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:31:54 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73760a7cd83so3303553137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341114; x=1783945914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTZ2SH3u+rNbOJjVHcn+c0PRrIb97kDFe5LXVZxXChc=;
        b=ePIYgzJmIy9TvaT33sq/5O+1kM9OmYZhc2Zqwk018sISAKGkAVm5RCGxSJ8TkiSq9g
         +WHQfQizkT9luk61YONGdSyrZ6Lrr14cOwosbsXcxfuyoIvx+b7A6Gx7OFTEWbhZEaUH
         uapr/mxjGta47yffq4EYGvK2qVaZKgyQPSYWw2eDxwLV+UvuirK6UxLUNNwtrlPD0th7
         CY888U1pLz1sQFy8gRc5zxvsHwWSH/V7NklXigwm13Zo4KDWwJmcDk4avaJ7TJNvMMZ8
         HamrwZvsgAy756F73zoerCTLbs7QN4nXGm/r1sO5GU2hnmP6kB0H0Mnz7g3NwMan25yV
         KjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341114; x=1783945914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTZ2SH3u+rNbOJjVHcn+c0PRrIb97kDFe5LXVZxXChc=;
        b=GJPYucuKG/BreDIJyHl4OPUA9n6xgWY8Fp59zPFOPkFGkn38LzYAeKQ60vQ5h+HNnn
         2qB5wgr865JSMXiDigb4zGcv4UWI73V0e3mcgYy8iPfCNgWiNBUGThZAnri3B9Jib4iq
         nqpzYIuXPYe+wUKXpwJ6vNv9TOy+jMdTrCfyUlBbFl/INfIVqM5b6CfmH5gqsNvX1Ba8
         m3VXEVn4loe06yf5lk4cUiyUMMDPRa4Irg4tOG90lb48Z2OSm2e2nfpZBdP0B2Z6hwI4
         014N3BlLEz57zpe4SkdD+q2QYTN6+t0d524WfDrWKv2ae+aIsnQip9Q3edCz8buoFMxG
         7BdQ==
X-Gm-Message-State: AOJu0Yyx2du7YnMlLDof43QXTn0C6QrtLOgOthmk1chFKrOIXy2iObPt
	kRDqxy8eFl7r+2q1T6cUVlHlV/JlehwP9FAekoCJ/rXP7qgKcGqUNVQkVNWKtRsyQUSysPUKIgX
	5P3yhnQ+tr8iitxDVdbE48CaqmfZKi9lPqYVF2w6NR6r87HxOJULoV82WzbyK6y0imHk=
X-Gm-Gg: AfdE7cntqJ+lLEE6lbEIU0Q2/HLmOR1qxpnCaOj0fi1gpSo1WZU9TCs56UZaCa6l277
	facb22TDr+9jArS5zCGZX8dSc/i7SQt0a/7G5ReX5SppbCQo+jcHZdvYb9rphhOy0C5exnbitng
	h7HxO7SQeMrtd3f6tGSnmFhiHSr53xueQfVzzkgUU6UAhmvY8SMO9FJoL2NVYcoFLTBS1IxYggR
	dhFB3BdV1AdRdU16aNqYKLugzPOkgFBWGdAvspjLUlXpSOmGdcUaR5fQwpX9+1EdNCRN6SfQi/k
	D3Rfk2TSTGOvrG9xXQRGmwKZjBzqCrsuY5pFKAXHYZUtnzLb4Elp/Qz3Ll8WuuZmdf6VwTbdooY
	LjJA5ezsnTcDL4OXs0WJQYPQHzKZ1yfnMtIshV7yN
X-Received: by 2002:a05:6102:1614:b0:738:5e0:b40c with SMTP id ada2fe7eead31-744b7d36aeamr133210137.24.1783341113072;
        Mon, 06 Jul 2026 05:31:53 -0700 (PDT)
X-Received: by 2002:a05:6102:1614:b0:738:5e0:b40c with SMTP id ada2fe7eead31-744b7d36aeamr133179137.24.1783341112636;
        Mon, 06 Jul 2026 05:31:52 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838e1980sm5252990241.7.2026.07.06.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:31:52 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 18:01:08 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783341082; l=2118;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=1XYwDRGVJPSrDbmhaPWd3Agn7+i5qwXTVHRjNgb7CHQ=;
 b=4F6hy2mC+H0vqdT33yY+VFdV0UOGUiLJADBSouIW86vWGqgY6niPJHnISHFHbaNTPq39roleZ
 SYIzUYXH+VeDTt4Leww9B0Q2v7kqK6shy7s71w7AEkoKtY0K4/AXmTs
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: 0_D0kDZeZDmq9N2iTxzL4xyJbGTqcw_U
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba03a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MBrZzK6-3DAqsS7rxpgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX57m61oB5par0
 IWBPPjNMBgsH0ar/WT4a14ClGUOLpdj1yeahnb6Mbco6nfxqZvVgkMw52Dx6Edisl8UJzMNEmEp
 yUtOWPIII3nOCbXxe7dmikovPV02kIU=
X-Proofpoint-GUID: 0_D0kDZeZDmq9N2iTxzL4xyJbGTqcw_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNyBTYWx0ZWRfX19NGRqZPmDRm
 piETym7RBCz8kb+tTJ7YCPlXYKM2grvvEMU63IKovvUE5yBBcK9A9xuxmvp6bV0bXB/lO4cRq6d
 2hTLGwv1HdA4T4c0HgFdCqnsKS+G2Ta6h/JUswniKv7KUa88xBbi6NfwPpDOmny5+UdI5saKcDW
 Ggz461juJQvgflpccjmg1kjeM6jRKyt6xTxASEYWae9A5hYgV4CYuDQcxwb6uoTUEmIp2wObp66
 W2C3hA07ajJbgsEfh734EIRVKIAMMcpk3OJR6Wdw7DvHmTHTCh4VhAYgrhH4cpMwLzwe+k3iXSX
 5pi49fPCgT+qo0bf50vo9+TG1awh1IYyO/qSvGNjVqvHErZPRqFSKI0SRveyPFEFvaaBVKA7Jd/
 7LCpklGjL/hLV9/O+KZQxRHXq0DgK51O40RLt/JsD8Ico5bGur5e2tyIcKXMbxRDNM1U53aNTFH
 IkU7AOof0qBa4xSggxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 69EDB710955

Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
constraints in qrb2210 DTS files to use microvolt instead of
microamp.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 542e8fe030da40dfefc7b744dcc30133fdb35e74..3dc8d667d091ceb4267081d32b7aae983fc25071 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -37,7 +37,7 @@ pm4125_resin: resin {
 		};
 
 		pm4125_vbus: usb-vbus-regulator@1100 {
-			compatible = "qcom,pm4125-vbus-reg", "qcom,pm8150b-vbus-reg";
+			compatible = "qcom,pm4125-vbus-reg";
 			reg = <0x1100>;
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..c472e13fceca4eb882a59af3be9f45022a923ead 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -235,8 +235,8 @@ &mdss_dsi0_phy {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 4ace2d6c06ceee74ced7c8cf9b341089b689f703..bf6fb12ad9906f21408002a2360ef61e8a4684ce 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -433,8 +433,8 @@ pm4125_ss_in: endpoint {
 };
 
 &pm4125_vbus {
-	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <500000>;
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
 	status = "okay";
 };
 

-- 
2.34.1


