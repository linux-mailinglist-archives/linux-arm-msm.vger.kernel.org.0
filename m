Return-Path: <linux-arm-msm+bounces-111977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bzKJA0w6J2pmtgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:55:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759465ACE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:55:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X8jCRgHZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Br35f+n+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111977-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111977-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0B330750B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385C32EBDDE;
	Mon,  8 Jun 2026 21:49:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEAA3AFD16
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:49:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955346; cv=none; b=hJpVC6CBRqTKJ1LWbw6LRTSTnHV9FWYvSbdGvsHwX6+kXlyG+5+ievWCCAeGzvlZKPkSr7VE7rKo+ZOntjSkVlkASLvSB4G8in1He+S9AxgyE2esgEjbo2tH8w8mbEoaaxKrdpwbZ9839xrknB18pRWFu1ywyoJ65RkMeMFNWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955346; c=relaxed/simple;
	bh=HPJrgV/WvcC5J528dV3QG/rkJGKe1vbeM4CVOkeyLQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6nnE7Qzt43zF0rgFW0c165EpleXPsxpDqfWS3N6YSdpVKt0sS0FHizOg83ZTLyl2pVWaNK0fr2tK5ndvfpHaTzru98lqxN9ElL+W9/4tjhoZwhVIRhk2k032P+UCTNlebhEumVMDrApHNAuoLbADehmBwU/I9zXI3LQ4yKQwMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8jCRgHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Br35f+n+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IvMSw4050351
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yZGKQDFpwwqtyl5XA4nQYM3xUM5ByH30DMsiQvsyHU=; b=X8jCRgHZIB8BQlHv
	tsgXVsM4F/b2XgA6J+HCyya8k9fMZY58SltTJcpVAu6St/lCCejq5dN8BlV4fAS2
	S/JRSUoRwfWjwbUQYfhnSL/XlP67jB0I6NN470qo4l/ph9x4A7p7CtWoqvLSooLK
	2xx7+JaO8gp0OvRcQMWKj+S2UTdkRUeyUmUaIMp4rT9IGDRjcfJPH4G+tRZilJPA
	wS1MsU8xxoiJG/UEUJfjs1mLn0mbJYfQgB5ih1FHj8nqx6swUz9DBEJtzmHk8mZq
	5YWPiTgm3T3lebChmoq3GgUm7USfY3JpPAgBqzyjcx1eg3qRuoO0/Y10/IZbAcik
	FeuEpQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunab2tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:49:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2cda4d0so2458911a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955344; x=1781560144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yZGKQDFpwwqtyl5XA4nQYM3xUM5ByH30DMsiQvsyHU=;
        b=Br35f+n+2wqMv6HwBFzFndeXCQHesVKuaXZZ6XuyO/8Wmu+CN8K6Izm0LMtO1bhvJZ
         v6dNuHbR2GSM1mABh21axmkZeH0OvVkXaN1jx0v5XkHljIhBKwnwtMQkWHFMVhPkTn4I
         Dsy9RFUZIh/yJCo8OWwgOJ+6lqw2eQpsVjE6Q4gu+LldA9ffl1rWp7JvBx71fERmf8XL
         GvHk7KXTS6bC0tR+pw+8UwYT790TXAmp6JLfERKaZQjwfTHfPJjgP190X/07aoL4lqCX
         5wIVv1nQR1UOJnp9LKpLhtp93W/wbAxbbrhQ8iBCtvOcQxy0DVOjrIapjn1+yRoCuoFU
         +uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955344; x=1781560144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5yZGKQDFpwwqtyl5XA4nQYM3xUM5ByH30DMsiQvsyHU=;
        b=jQrXbt/zFlxNef0SvMSxkccYkIdSMotDsFOyYoyYLlmJeIB0tP9Mfte8HcZO4+ZVi9
         7gfuOh3VucI1FZBf0sEpOrvhOZYt8KZXexZ+iQZy5vh7HQ5OmIxG7zlzFLSl/WDfnkPK
         WvyWhktHqfV1Q7ev6GWuNLkdv+g0lGxqPq8pIPYEk8ocPgRcAFXr3+bvNpOH6kPCiG1I
         r05Oxois6GBviwTpzQ7aeco0OPQm/7Y18xhjwkjCYtRGvBqvTQA1qBmEd2TUjqQOIdGz
         C9xZnah4fYiuarN763wxQeOE6nDMmG5M1fq/DfbMdcxr5gU9+CWo98xf4tDBKVWSC7PO
         BtBg==
X-Gm-Message-State: AOJu0YzQXIb5ijD/bhOe6EOSQ4pZ1Sbh4VWxZ5Z3oy0ME7ZP7NNo/aPy
	ntlfaF6xyaw3R7Ew8qIB6BoBdQQw75cmRaXbEwixPsI7AGPSlPGo+70GiU2jO4r/F/rLajIAm5P
	TuczlQyTlCCdipdcg6lH5ZcHS1nTvMXwTTqMU8Pn4oOqhF7o4SdHI9Ks4i7eLbmGTY33o
X-Gm-Gg: Acq92OESl4N0zA/m1Fk+ZJJTPomRo5FIDvidKofdNcR1ZD2+hsGJvgy3Pmi3FxzcfO9
	/J0p++/QeAKcdB/JCB3hhuL9ZGx/pZ4bGSroxyz68LC21rtpYJu4iOT4IviD+FAOr01kShVVRtV
	15FqyO9QhbXsI4cgDG9WrKhDgSIyf+B4JLRTc8N8+NA6rReEmrusDbJ/e6sOgScPxhQIvn4ugsv
	ATYRNZAm2sBWYTcSKH0PUIhb2EJpBFnlSa6xdJBHlP6C7CxU9ctl61UAAJeAuO4G4YadG9mddDS
	ezLV4BcjWWkCAeAj2pxsbsHx3aXKX2mdQIgsr/EHjleynG5e6Y+0L9QTrCY2xghmdgZQcnIHh/S
	zJb+R6yXjiW9cIV1xtWNFnRAMm9juYO/sVYgN4VDqGuvY9zrr2yRXnpoDBbplLS7ZktNXAw==
X-Received: by 2002:a05:6a00:10c5:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-842b0e661e5mr16882662b3a.18.1780955343665;
        Mon, 08 Jun 2026 14:49:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:10c5:b0:842:3aee:12c2 with SMTP id d2e1a72fcca58-842b0e661e5mr16882639b3a.18.1780955343219;
        Mon, 08 Jun 2026 14:49:03 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:49:02 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 03:17:28 +0530
Subject: [PATCH v11 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-enable-ice-clock-scaling-v11-6-1cebc8b3275b@oss.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfX5Rdq4j0YEVwb
 PaBTMp/VIaN8Iq63AFsNlLe65QRJ2qqPztitD26FCiCdLmggLdftcizguHBITjKRhOpJ1+aabRe
 lSe6TqRNS13r/KwHnMrbWQ/zyEkcL3xs23D31loyBsdBdYSf56o2uqD45PmKQgvbXL+X3VtIK3L
 tYmYmYGTrHg8FTt7K+SX24a5aO4sBTKNCOnz6b+TcFnHvdlUWaiAfv6sJn5K2TsA1FoP2AMu2mH
 sitpowGGGGlX3cdoDsg6JbA360U1fM3TiPsGDtxPsPNJW6XkEDOLmFqq5EiHplfNmwXgLP7Ri0V
 FvCadlbLjvbrWMwQUotpft5jGyAB8aFnzyJOB/SYVqXs0gXTlb3/HW7RugwPLCVmCifjtm0LAoL
 Rxl842153j/Uxlo2bhj8tIArVgR80op9eLgmHBGQPnrlI80HyPNtsmQl4+TMXxVMt/IIH7CJzJ+
 BmBPFg6P93VtmopSLyg==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a2738d0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ASeq7m8wwX9lxpDCPrQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: DtxEWDvl4bUrbjw8BzzpRmjhOKy-sCS1
X-Proofpoint-GUID: DtxEWDvl4bUrbjw8BzzpRmjhOKy-sCS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080199
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
	TAGGED_FROM(0.00)[bounces-111977-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5759465ACE3

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3acb22ef228bee340212b8b2c300957..f100d706edde465730873702f0b0a00b44050c23 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


