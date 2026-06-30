Return-Path: <linux-arm-msm+bounces-115532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id clrzIt8URGrKoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:11:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F436E7759
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:11:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iQY13eIQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ObgoOiMz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115532-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115532-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 299973188ADA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EE23E3DBE;
	Tue, 30 Jun 2026 19:04:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4C44BC9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846245; cv=none; b=dzO2SBG+ogrr6/llZj7x6h9sw3GrUc1plGs3X8jt083V0ZUWI93SJJMBpMg/gbVRVqveOtjxwAS4+HFypJhY4yhxraGlSw6BFJhy1MSdSEvcWNv/x4TKSduPt9Hpn9uuiQXVdY4PwFciV9jsU1EkB4kQE6VvzujG5eeG/O6EFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846245; c=relaxed/simple;
	bh=i8Jdl2WiUlL3/xlUPB1sMuP/iZyKKJ+dGe+Yk7hYLjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1vbwXH3jOVdh9nNIAoqQk4F5xJV1BhwcxqFco4zNC3MibXDmy0NyVr1mwOIZ5B1ccpJh4RP/vFdgn/CTPzoP5UZBo8uFZ0WQhgo0ciOs0nnAOT2UZq6OIeb4eRju1A8k/TtxKAIa/dzTaBXxlcHnAmw4sK96Sy6O0Y9c4xc6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQY13eIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObgoOiMz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UIS4c12758960
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MJzQYy9NeGXvGWgMiVeRkyydULurB3BuYT/jaTVqZGo=; b=iQY13eIQJj2Swzf6
	lFYC9I9GlAk2Zp6dH7KT9ZqhTVHH77VVJ3ymTGZUvKRwDBEA16hxG/N5ksQ4d8oh
	y/IeUDoaPg5U1VAVxEGXS6Sk7bZtGyBhoe/SHLv4mI0SRsM4cTBIlsVOQ2qIi5fv
	tzgolmi49ksXAzIYR8wNKWtU8nHUmtqscmXPmCqJjPqWd8k9vj5inNh5UR5EtUNo
	drH/Q/3JaSP2EVeu81YQ/cLm3m6+A+yWypW1LuAC+S5dILcysi+/LilIE45/RMkS
	k0DNIXOjAvrViJI/cue35pNLEU4LJPaXBeJhtfkXH+1TY6ZuuEE7qRYEN25dJePJ
	TM6sOA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sg5sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e773699d6so3605868eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846243; x=1783451043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJzQYy9NeGXvGWgMiVeRkyydULurB3BuYT/jaTVqZGo=;
        b=ObgoOiMzKVzzG1PhodgXrJhOqrlKbAeFHHdkIMjyZUIzke+qNvLEi/HT/uHfrD+BNf
         wsK2GPuvy26RgCqP/ggSFAPM3tRNUNF6soEmOETS7FAHYSGz3j/8UdGabMTk9PiCcrFw
         4agrr7r0G8J2BZxeJ/KdJtOFaIgUI68WnP1vrABzpZezRuvJfpraqiraPVNv87+xZWyN
         lM3VwOiu/SXXpLyiEW8UG3AGYXBjzaTs3FjBtGsvfYvwLObP3EtYgIKO9ez+61DCetPi
         AozX84ugaadCB96MlgFuBctt+y6n8u6/BN+oXH6cqEvOBEjvGF3LxaswOL7i0cL4zoL3
         joUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846243; x=1783451043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJzQYy9NeGXvGWgMiVeRkyydULurB3BuYT/jaTVqZGo=;
        b=aE6zphbhizBQGlSJs6zlIvMNVGRNaF93y4TXZBWhIVGYwm0h7ZTcw5sroKP0mEW2rN
         tUFRVW+H9DuYIlSN/7lT6SnuIv2nQLBVIjJnTcPCaXufSs/3zwSUVEkNriHqncyCVDE4
         kO/4HNGfy2blIa3Wj06wXmY0yw7u1Nj6q+7frZXPv3nYpsBd4qZjvkGvn4Ohwu2JgyNA
         1k6RbZjjIeHX0s8YKreTK4nQI4h87JGG1QdmntkyFkN/2kQFxytNFFBYbGhW6nC/MGyU
         njqgTw2j3C9s3EDlxxMbUM4gFfp0ZVG99TsVVT2/xAMskRVn6dd9PYZgqyRowbCL/TcV
         rhJw==
X-Gm-Message-State: AOJu0Yzsa/3xsvkjPgQ9X0kfa1ii5m0v48/E7Ln7WY385WBGjqr/MZd6
	rCH1C/Vk2i/Gmvz+hh4XHnPqU+5w8v/5ILuuYfGLFtTXAvNRWMoB6Xa//ysc9ZnskoPZd1bhTWR
	P2r7RHG1Rce+inU8MvIjZB+BPxkZFae3YWigVRerojN198hC6OArvn+ycGgat1oOVXpqQ
X-Gm-Gg: AfdE7ckfaWaKDXsV/gjGCYFM0jfiyIeQ/7OqilotxfMELRD3DzPOOKp1Dv2QT3NDpZC
	NqQe1NR5ggLQNcscxICX2FRd1ZLCuL+n/j2unPvaPq8W2Ngw764w1ZzRZw7xJ+tQAVcRy2HcJ8g
	ZvHJAyYLREVHgdkT0Ly+oNv5XLD1VjGNMjftPaogl7LdaFfHPyGnzPpOSMUQp4Cwq2MF8SJz4vF
	tn8LpWFXnwmOmXRMQGxuR++ua+ug1plTnoIO8vNFOt27gDi+9VWxVUwGJAXWL12KxG1k70uCDmr
	zf7lyWYyCf+EYLkpnWDU58rAxQs4qdgAvMnQO6xhRegso2iR1jbE+uoU2s3EQVT7JNYirFt285D
	/YzPaXUAUd+TbSAUH0ByU3M31C+8NJvtVBIj0YcIG2UH0IlM=
X-Received: by 2002:a05:7300:80d0:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-30ee1365bc8mr4242303eec.17.1782846242540;
        Tue, 30 Jun 2026 12:04:02 -0700 (PDT)
X-Received: by 2002:a05:7300:80d0:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-30ee1365bc8mr4242260eec.17.1782846241987;
        Tue, 30 Jun 2026 12:04:01 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:04:01 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:49 +0530
Subject: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=5080;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=i8Jdl2WiUlL3/xlUPB1sMuP/iZyKKJ+dGe+Yk7hYLjk=;
 b=nKH00pm4XpSnA2IJzI2OB1m4FymqWLvziEtBlUCtRFRQ9VBgdgOGj9I4PShoQVqJU0i5RY2g6
 gi08NEv65s2Bg23ei43Nw828LsVorLAzxpAT1DeP0873ocGlzBuiQTq
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: L33riVkOXREoy8GhZmnsVJ8MgnXwb4Y1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX99SPfIP7pNVo
 oNnUkDBIQsoCUeAdThggaGoQrno9+h2hAq+Z0cz8tbIzvOfP93z7eV6fmzuPekmUKybH8WFnuvp
 M3/8oVEY9oFEminbZvrf7DMujWfSLVkcotvS21WywHNofgJkUw59STb0y4t6MyB7IW33TDn1vMu
 Ha9BZeEZT3UNkIT8kYSDPgjLdgo7iOJ16V6Y3u5zh0HCFgzqdzXijUO5ywYC4SwSaBH2S9AptIA
 ZCHG0qUgLS2L2lkDXCdyYqblTfNLl+orSFBFpb8yTpuCxO+jCoNKjHtBbubvDyHSiPVdzu/RsKZ
 85wNvbUj7zEpQcQg/6EdJCB46JgjDczRzFVvpMvJxe3E8GrYwj4RpzdnwfHH30G6pXYQ04dWaD5
 UAzO5dSKhQJfH6QQtUSktKjT/YajzfrCvZWYuKFxpIU8WLmLBXp8DVTsWf2PPCJZ+hgsIGi4AaT
 MvSynYTrbqoFVbpDR0g==
X-Proofpoint-ORIG-GUID: L33riVkOXREoy8GhZmnsVJ8MgnXwb4Y1
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a441323 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CK1i0O_xw7d_XAuQu4wA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX1Oeig7aHNMtj
 8LXQ5jzIrtetQLacufAuT+EJXZWn7RqbvNaKkZtQPvChbeCAx7E8TwuHR4E0oUGhspYe3VU55+w
 QvQ9xT5J1p9roCDLuFdK1M2pfwn7yLg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115532-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24F436E7759

Shikra supports single PCIe instance with  5GT/s x1 lane.
Add PCIe controller and PHY node for this single instance.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 154 +++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..74d51ba5bde3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -998,6 +998,160 @@ tsens0: thermal-sensor@4411000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		pcie: pcie@45e8000 {
+			device_type = "pci";
+			compatible = "qcom,shikra-pcie";
+			reg = <0x0 0x045e8000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf1d>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x1000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x045eb000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
+				 <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
+			bus-range = <0x00 0xff>;
+
+			linux,pci-domain = <0>;
+			num-lanes = <1>;
+
+			interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
+				 <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ddrss_memnoc_pcie",
+				      "tile",
+				      "qmip_pcie_ahb";
+
+			assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
+					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					&config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
+
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			iommu-map = <0x0 &apps_smmu 0x800 0x1>,
+				    <0x100 &apps_smmu 0x801 0x1>;
+
+			resets = <&gcc GCC_PCIE_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc GCC_PCIE_GDSC>;
+
+			max-link-speed = <2>;
+
+			operating-points-v2 = <&pcie_opp_table>;
+
+			status = "disabled";
+
+			pcie_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0x8>;
+
+				phys = <&pcie_phy>;
+			};
+		};
+
+		pcie_phy: phy@45ee000 {
+			compatible = "qcom,shikra-qmp-gen2x1-pcie-phy";
+			reg = <0x0 0x045ee000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>,
+				 <&gcc GCC_PCIE_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+
+			resets = <&gcc GCC_PCIE_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_RCHNG_PHY_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;

-- 
2.43.0


