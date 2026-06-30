Return-Path: <linux-arm-msm+bounces-115527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPCeJPATRGptoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:07:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E456E76B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:07:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hzjq5bAz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G5i3qmvB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115527-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115527-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E61531142D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE77367B63;
	Tue, 30 Jun 2026 19:03:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378443B9D99
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846213; cv=none; b=ktVhhZPFuhEUPRsF140XLmkP2iDQYwDpDkwKzmp8kBmfqMcUNnI635g3P+yN5u9+zqLE3rGK2CDKYJMUhddcQ6iIfGmDKwdKcA2nU9yxDUMOxYqddWrb+R5z72V0iSRdBBI60epRDEByn5TxUVASKxP8IASCCtoVhh6E3jxRBME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846213; c=relaxed/simple;
	bh=geHLVr+nILiCC557oY7YgLUcDXfcErycdPqITDrz7hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bii9Bnse/lJKmYz8Spz5+gmoRnaXt10kakJFNYmDCbhcSFZQ0rDvSUg20Iha0O76nlJ9EcMaISwqYB7es/g+HgwhpysVtOG9GnDgVBC2a/yB+NGV+oj7/QWmOkDS6S+//f9ClwSRCRX4c7YktD40Iq5vufYf9KnFa/rL/XZkh8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzjq5bAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5i3qmvB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UIRrxE2758542
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjqeAhRBoZ9HG0dHOxqJQXUNIr5LEtmFHVvdOPVc0eY=; b=hzjq5bAzigzpr6Xa
	zMLKCfhMBdWAm2j7rL2skPLwdtXyPYN9f5aMnXlka17HXXfBTepCdO/Af9cA0zig
	Dw37VCUrW3QbYzx/hGZfVz8sGDqkrMmDR5qjqq2/Qjb0w1qFdgJ+vNC2zs5g3r+y
	vya2NMWPg/l3+iWjAuO72b+SpydTCF/VR+zqyswFczP5thr5OxBngnqyOvDp3gvx
	V3Kri9263hQbnMy5o3RINfZ/k1YRP3tBTou1xf3ZX9dZ6kWABsTo0P04DDHJdgpp
	JPIfSdBfM2xSdRqvPQ+5TdRVUHHBFvMko7pknb30BMGsAFPrN8NhyHIENMehbVOJ
	ScKGFQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sg5p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ed664e368so857198eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846211; x=1783451011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjqeAhRBoZ9HG0dHOxqJQXUNIr5LEtmFHVvdOPVc0eY=;
        b=G5i3qmvB1uNCZ2bTNVWEL3SOc5eIcH966WB69tJifr8ntFV7Xxux8rMMTrJYNLuZBe
         K8yx44BqwiuzXmVRt7dOYa4AJJuoq+zFQywkGRo10sC9+1GeRnA8kKcR/pjDrp9QlRYd
         KM7i1Sud2TgPG4y8cwASZNVK6OH7zAoM3uOUhQwZZNOaCs12OhjfZu6uiTo9zRyfjH4V
         LCIUwGsPEzDOaFpqag2UulF0UaKq4SHs7GGID5DNibsjjX/TcSikoeMSOtnTWoRP9eiS
         8RBMh1DY1f/bE4OQfx25OhnUy9KgnNTzteLgEZ+GdFJPTEPBXLKlEtWOte3GYmxf2WJN
         K+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846211; x=1783451011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DjqeAhRBoZ9HG0dHOxqJQXUNIr5LEtmFHVvdOPVc0eY=;
        b=b1xjFb/yg4y2E/Q+1CASA6vgBQGSnhhsVcYh2wnJG+w6SR/2yHqScvlNR4IJU9Gjmz
         XvF4ojPBMcn5GOt2KHuWCwLYjfq88kMn+jipMc6XMfYeWdwKDK8HgO1ayeTZ7GVEf5Yp
         qdhCVOikwHN9kVj/+z9kiogmIKmqqgoX3O2QMWt8h1SAei41zUyfYmb20gTw4RmKElta
         edb6OdXNcfnI3h3mZEjzKGuPrGM5ejpVegMG0KRfFjN1e1hdFKD6SuxoOH2EP1YM+jDC
         cmTiMRLno7GvO5YuNet1pftJTBzaJLz/GnmLtMmKoXtUJD/JBvyQmyBookypigFreVtp
         4ISw==
X-Gm-Message-State: AOJu0YyLUwP0mCfiTPgKfQsnKNfoNlBE3ZvK1sK7L7FzyITDC2HUu3P/
	2Ws9hybzZhOhzhTDzzIUDXdVGBWWopr1B5XZ2+2OGgWvk1q+AXPls5T42h97qcHy4ohI50MKbJA
	TIBcWHfQEh+vjp/F0IfZr+ZtIzSewy10pKaB1SS4SXouBJ5T/4Kj0pegx+CNj6c3NsSwU
X-Gm-Gg: AfdE7clEc9u/vNDca9JHyRk0TML4cUZ40KXAnKBsbBtdGSLQ+VkV82Dw36QZBSHNaLh
	8goqvTVQEYR22UG07iqqF1Q9oZG6g1TjdAns595tE9pKHUfcuaIKmkkdDKGviVJw6gQujiH6DoU
	tqrjxklRUEOtScXpyRQJfAG3PWe1q1n3i+ARFDYGsoY4OyaTauOLcAwXCpVaiO+zhXUcMuROk9w
	oyO+ZpkIehqHLLgLwomM2+p9+WqBUDYuYZ6/UIzCWtdPnr5ipakdQ+8IxM36dzHHX3s8SobHdXw
	kchYqdm6HFbGfdCig2xAdg5uuFjF1VxZYkDD2rvrpi9G6QEoSLXdBH1pVldJn8UWamBeuVaJPjv
	1IJJLeMLtkcYAId4OjrFgUQvtwD84vZJvQ98CwELbtBPMPcI=
X-Received: by 2002:a05:7300:fd04:b0:30e:d8ae:3080 with SMTP id 5a478bee46e88-30ee9fe6456mr2192511eec.9.1782846210614;
        Tue, 30 Jun 2026 12:03:30 -0700 (PDT)
X-Received: by 2002:a05:7300:fd04:b0:30e:d8ae:3080 with SMTP id 5a478bee46e88-30ee9fe6456mr2192475eec.9.1782846209983;
        Tue, 30 Jun 2026 12:03:29 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:29 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:44 +0530
Subject: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=7567;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=geHLVr+nILiCC557oY7YgLUcDXfcErycdPqITDrz7hM=;
 b=QxDfiE8kq6tR17FWr4nwRroqas/N8p1A0hWqY9tO0J/ZhVsjY/WkH37Un7BLmJxNhKmqtXrUR
 MHYgl7A3n/ZCeS9FGipb3XCUfU3Y1QXqpcPV/7s53HnL1DRfZsLbljd
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-GUID: 1Dvb2dbNUqEPLr8aP7Vo9630GUAwlCQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX8F+904VWzPbJ
 Nj9DRMTfJ14+B2VBUnRsXoR/ufVWVOLmPe/oTxjOb9xYtEa5Iw/bustwrbxwYmdX4R+/toIatUh
 jzN6IYdtO6UC1vDltpdSfLIXWuKxen8TDAUwpQHHhmKwjZDXZGdpGG4EA/oxiwkJGRcH17lDq5V
 6LZdJDw7fEGMbgOK7VnaKynswvJ437oLZUwSKcdyaMabuHajIJUb/hQfVEE4UXweTWA+ToqWoN2
 7EE78RsLhBWvDf2pLuG9vze6Orh+y16gkO5LtORtjA5FnUc7+BCuhse+kIKuHd6Rt4FH2rt5dTv
 sfMf1i6YEoRoFe4DvIRBt2bJdR12VhjYok9swgFAXQ1LCRy6i87pCxQh9fNmHfmXPShvPAi0NK0
 36acR40foFsQ7N/pm3drUhKQbaOUj+TnYNDDWoJLRO4RH3B8RuAxXcggyJKappoVjajFGKRSgyk
 B3+0wtXx1qWwlmBjrjQ==
X-Proofpoint-ORIG-GUID: 1Dvb2dbNUqEPLr8aP7Vo9630GUAwlCQH
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a441303 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=qzLpS6MJIjkm2LRF5K8A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX4a1FXldTykl8
 xvd8lbzfgMDMqNbG1yayFPf6pXs/UwatFev7u3gB/vFRyvF7gulZU5yklWHzgDfHWsQqjadEJgQ
 4OVroOvz1tFi74HFZqxLU6NdR0d2WTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: D8E456E76B3

Add a dedicated schema for the PCIe controller found on the Shikra
platform.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 211 +++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
new file mode 100644
index 000000000000..f9d1dba9dd2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,shikra-pcie.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,shikra-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm Shikra SoC (and compatible) PCIe root complex controller is based on
+  the Synopsys DesignWare PCIe IP.
+
+properties:
+  compatible:
+    const: qcom,shikra-pcie
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf # Qualcomm specific registers
+      - const: dbi # DesignWare PCIe registers
+      - const: elbi # External local bus interface registers
+      - const: atu # ATU address space
+      - const: config # PCIe configuration space
+      - const: mhi # MHI registers
+
+  clocks:
+    minItems: 7
+    maxItems: 9
+
+  clock-names:
+    minItems: 7
+    items:
+      - const: aux # Auxiliary clock
+      - const: cfg # Configuration clock
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a # Slave Q2A clock
+      - const: ddrss_memnoc_pcie # PCIe SF MEMNOC clock
+      - const: tile # PCIe tile SYS NoC clock
+      - const: qmip_pcie_ahb # QMIP PCIe AHB clock
+
+  interrupts:
+    minItems: 8
+    maxItems: 9
+
+  interrupt-names:
+    minItems: 8
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: pci # PCIe core reset
+      - const: link_down # PCIe link down reset
+
+required:
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+    #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@45e8000 {
+          device_type = "pci";
+          compatible = "qcom,shikra-pcie";
+          reg = <0x0 0x045e8000 0x0 0x3000>,
+                <0x0 0x60000000 0x0 0xf1d>,
+                <0x0 0x60000f20 0x0 0xa8>,
+                <0x0 0x60001000 0x0 0x1000>,
+                <0x0 0x60100000 0x0 0x100000>,
+                <0x0 0x045eb000 0x0 0x1000>;
+          reg-names = "parf",
+                      "dbi",
+                      "elbi",
+                      "atu",
+                      "config",
+                      "mhi";
+          #address-cells = <3>;
+          #size-cells = <2>;
+          ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+                   <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
+                   <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
+          bus-range = <0x00 0xff>;
+
+          linux,pci-domain = <0>;
+          num-lanes = <1>;
+
+          interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+          interrupt-names = "msi0",
+                            "msi1",
+                            "msi2",
+                            "msi3",
+                            "msi4",
+                            "msi5",
+                            "msi6",
+                            "msi7",
+                            "global";
+
+          interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
+                          <0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
+                          <0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
+                          <0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
+          interrupt-map-mask = <0 0 0 0x7>;
+          #interrupt-cells = <1>;
+
+          clocks = <&gcc GCC_PCIE_AUX_CLK>,
+                   <&gcc GCC_PCIE_CFG_AHB_CLK>,
+                   <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+                   <&gcc GCC_PCIE_SLV_AXI_CLK>,
+                   <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+                   <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+                   <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
+                   <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
+          clock-names = "aux",
+                        "cfg",
+                        "bus_master",
+                        "bus_slave",
+                        "slave_q2a",
+                        "ddrss_memnoc_pcie",
+                        "tile",
+                        "qmip_pcie_ahb";
+
+          assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+          assigned-clock-rates = <19200000>;
+
+          interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
+                          &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+                          <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+                          &config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
+
+          interconnect-names = "pcie-mem",
+                               "cpu-pcie";
+
+          iommu-map = <0x0 &apps_smmu 0x800 0x1>,
+                      <0x100 &apps_smmu 0x801 0x1>;
+
+          resets = <&gcc GCC_PCIE_BCR>;
+          reset-names = "pci";
+
+          power-domains = <&gcc GCC_PCIE_GDSC>;
+
+          max-link-speed = <2>;
+
+          operating-points-v2 = <&pcie_opp_table>;
+
+          status = "disabled";
+
+          pcie_opp_table: opp-table {
+                  compatible = "operating-points-v2";
+
+                  /* GEN 1 x1 */
+                  opp-2500000 {
+                          opp-hz = /bits/ 64 <2500000>;
+                          required-opps = <&rpmpd_opp_nom>;
+                          opp-peak-kBps = <250000 1>;
+                          opp-level = <1>;
+                  };
+
+                  /* GEN 2 x1 */
+                  opp-5000000 {
+                          opp-hz = /bits/ 64 <5000000>;
+                          required-opps = <&rpmpd_opp_nom>;
+                          opp-peak-kBps = <500000 1>;
+                          opp-level = <2>;
+                  };
+          };
+        };
+    };

-- 
2.43.0


