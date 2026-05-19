Return-Path: <linux-arm-msm+bounces-108415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FCghJwwkDGroXAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:49:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72357A7B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B91C303FDE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85F13EF0C3;
	Tue, 19 May 2026 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah+Fyylo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/8sP2Xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA243EEAF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180456; cv=none; b=M7rNfUd1ruv7+4RKi6SNp3ujhKo9gt7E/yc8D5BYOtBD+EgK9gFz9O6TF1MwzMad6vUU0v0iGR+4UgYs+5P+EKpU5lGHR/AKYYXwFbWC9tEADJVUkZQ8QXLoRKtrXzgvvmLmKODqvnMxr1orDwMXlJKR4Yr/LTlpR1Eho8aELh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180456; c=relaxed/simple;
	bh=awu4K4Bs14uU/g+Ooa99QANFRukd+lo481ZTjtFUCoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFNy8MThodTU7J6GRvy4TOky6SYHQ2iRSV6xWj4kwsomSekRRh4h1k7jFP8z/sr4d8RB5XpQWKHqQe3FHedxf2XjS3cifE1uO2GUZKKh5Cy7hww11FiEVaG0RfCwmbk21C5ruBAdVzP5o0o9eVsTkSC/HVw4Uuo17JP92HRZBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah+Fyylo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/8sP2Xx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7hFoM1146425
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmjNenISsu5vkMKrPVIkZ9GWLjHD1Fujb1tp1hK7UKc=; b=Ah+FyylofomzbuiY
	AFE13VtC/DuYRlcdGqG24sO3a5fjK4XrxBTI8OIqs0Td2mtzlreQKXp6uBHNiPRz
	sd3zz97LmJlwuejSHqMX4ppwwQnw+htG7fo1Sa64Xo8h+TL/m1MNYYpdDoD7R//P
	Mm0nCoG4k3GiK61r26nv6M96LqDyleEChAUOliDYq0tagnzb1Kql1Gj4ImDw61tc
	WDf/GyOYhgytNqr9LgrAdBWNU7CdRZ3qtVIxP/jxsGMCDkjusSPDyQOhhPGPLIDk
	sOqI1amVgyvA249M2jQdCRY7vBZmoFCwqBboSkidSpcozSrt4e0sCZ5teAltNHFu
	bT9X6Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ehjhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso1696575b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180453; x=1779785253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmjNenISsu5vkMKrPVIkZ9GWLjHD1Fujb1tp1hK7UKc=;
        b=K/8sP2Xx4Ig/iy+VjSDGncKPvRj3t4NsW2R5MokpNVNk32XvkYKofFV98tJAzam8K+
         EnkIXeKV9wOGCQBw0GZG1R2fet9/s3yeaYAjLbSR35xQJa09/HnWDF1Y8qhiY4DY2Pqd
         kQo+3hyDn4d9erf/30NZIJmWPw7ZhhST2/o7M2nQr2JlutnQoLkSCYzY++jrZBJ7Azvc
         J13P1G4DWVbYy0bdO8lsNv/YraHRDzPZ+Ce+D3HZM7oNPu65jhNTqifYwRQ+rYK2j97g
         lTtWG63S8gBrmNT+/D37Lv3F7oYWznWT8TM5cIbJwhS71Vqm/3AwKkVyz+MK1ZKfnLkB
         fkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180453; x=1779785253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmjNenISsu5vkMKrPVIkZ9GWLjHD1Fujb1tp1hK7UKc=;
        b=oc0OpcGlueV3neS43keted+2xSiGu8Oa+3LaawBuHPEdL9DITPiz2k5hVqep4jBcXf
         qGbilawJ9P/dGEUvIEnEi/BtEOsodPsczkBm/xBjOlZLUsMSvIam9gcp3oRqTb9moD9h
         fTwQmQjN87S5ck904YNWWQeZNg7iRbbrEDSI1Lt2iDpSJ4QeiW9UTeTYjzgwqJLSkHV+
         E3nh2b8krA3QRuPFQ5eYvt14XFStzAHPhogx7QMs4jjOpj1rdKdSI9Y7T4fEf/g0ysJb
         Svg7BffWBcibPf+K108Ocn4z6X5TMv3eLtloyaxrqenP3snx01NAtxsUn/UrXWoc4BPZ
         UNdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LPK1XrmVWsuM5zSJNCscFax7BVpqZNDgrPcsw7O8WiUDdq0AeGGfooVBxM0yxTyreyMZNUZiPV2tdMhZp@vger.kernel.org
X-Gm-Message-State: AOJu0YzxzBa62iFvFy/kLWgf3mElfbPDOi3NCq/jAGtVFOv9GYDHQ5LY
	7O099f5lB6ZL7A6KbZloW4KvAMYK/atUVK8kJa1BWHnkpB3QXPcRGPZPyj+IUSd44CypviQq4e+
	3Nps9JPG0FbIp66DmWFeR5EIzLRkKyG1EmEUyqX8HQgj19OMagiXyR23km4RGXd64GfQ0
X-Gm-Gg: Acq92OEQNDFdog70buWgEdzwsHbt7gqqCfTiPL18iT2DZPk+TJ4mlDkhRA4BEtnowPW
	/qXIIiuBtTjjXzI6IgtwGbKVzVybHrpWJ9xdlmlEp3P05IKXIFpTMJv9Jnj36AjI2l3epiGIUX0
	Pc09VZQM7NHR6ttNJur/ilrnMXryReO1J7EdEovxWAGDG8Y+w9r41F4hDhc+BOkPyeGrks4Sa1l
	gUGGqufqvP4cQMnxgzJFJw240e96TYbM+P8tjEnnzbZHaDvTWP6sqqnsF2lCc+Dsn3RLAbnDaM0
	Xo/y0/ipsug0qEv+L9zisTQ0zpS+MrzxN4S6zpwQzlhqf1Ixh7AmACBFuu+X5ALqTYKvZJ4ijgW
	AlQjPVhkw1hgR6YMNk3OiNdJrahf8Xnk6/iS+mbvMvdrg74vqmOBJCXds/373ZNxPeLucd5EOV2
	wLHG5V2kwmHujayF+3pWLDhZsZwNWNTK8HUcauHF59AQrrAwMcnSaPJxMh
X-Received: by 2002:a05:6a00:a221:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-83f33d39e74mr17617265b3a.24.1779180452718;
        Tue, 19 May 2026 01:47:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:a221:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-83f33d39e74mr17617228b3a.24.1779180452217;
        Tue, 19 May 2026 01:47:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:17:07 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: ipq9650: add interconnect-cells to
 GCC node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ipq9650_icc-v1-3-4d3554c94257@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=803;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=awu4K4Bs14uU/g+Ooa99QANFRukd+lo481ZTjtFUCoU=;
 b=7ZMNxdyViPnNTHymAwSaF0IL1IQjiaFvVsHJhxVSzfHAVVcwNaoQPYyjjgqSG6KGULhNCoP56
 mOp3b0/r3mGDMn/YLmAwFBosyuDyEBFLIRCUCUStmPnreBKn/EaAtDP
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c23a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=reN9DiWUbCtN1Y_qNI4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: du_iPMXWKfUOlOND2fLQ9B3QqgjBnUDP
X-Proofpoint-GUID: du_iPMXWKfUOlOND2fLQ9B3QqgjBnUDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX1yg4bcF82ZoZ
 d/lTFOGa6pIeN1ErKUsUw6sfbL9MKsZ3SQWDguHwwzl7QlupMG3rWhhtN56wb5IvK0tm9R+gvoo
 3wBEnUInWUDKizFQ5LC93IKURpGz5gRXnec+4ud/oBjiGjuu0D0qo39/odVmTbfkL4nloXZ8WcD
 PU12TDL9ePMLc/wPdu12MgGYNyGE0XQPv+QE6uS42mvUX2jMZEEw37JjxLUCz7VU/TsdlAsXljT
 w349iCJfXROMBU+b+qDAZ6ZXtVGMkTJIr97qf0wUUh1RMeUk407TyegDkzGFvpCqPNtFjgmHZ+U
 hPDwa5hZnJ/QVxcQSqreuC5c+y19jJDL1qMdNuALq3llt7EsnxnpiR34D3ZrGoRNJRNB6VT6gT9
 MZmNMsgk5ipGOY9ZEdqUECX5hJ9YSPNBDpD41yEbY0Wqf2pVBy+vbM7d/zcD/DMecuJIJlTcgGZ
 aqQaQOlfgzNDSywsQBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108415-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.27.119.64:email,0.29.64.72:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C72357A7B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the '#interconnect-cells' property to the GCC clock controller node
to allow NOC-related clocks to be managed via the icc-clk framework.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 3d3b317c6a3c..4c442773de53 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -225,6 +225,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1917000 {

-- 
2.34.1


