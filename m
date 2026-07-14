Return-Path: <linux-arm-msm+bounces-118915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /me8ETq+VWpKsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:42:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07B750EBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:42:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q9+UH06q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G7JTNNkk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118915-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118915-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70CE230A7DD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFFE2C08DC;
	Tue, 14 Jul 2026 04:41:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B91285CA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004104; cv=none; b=hm7PmMCChdmNqFqhCTB86d0rnfLvCyTS7J0HCL3+BDohQOmN0AsssYXyV3famIuSrpHIMTsPVPEHCSM3EcfbS7j+tzJxuoID7N+a6Xq64llGLh6TJXijl7L/6UzZssIrAezDSa2Amsv2jB33puztzZHDUoc6vgemH3/LPt7yWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004104; c=relaxed/simple;
	bh=CIzFmI4snm9JtwJh6lQwJzt22lqUvhjpWuKOq38+wBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fd7qsMaLiAA73AC8MYVLAO6DAtzmQyS32du7mx54qo5wGt4gebhLwRUWRv9MaO9lpwWsS4rWBliqJAbnKgq2NX1ZNC6enCa9QmIrX+2A5dUoWQGg87mxbV2thF/wdQIIIh0zskRCBN5MfqGsh7YO6/OjhVO81OxgAkVL0B83tMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9+UH06q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7JTNNkk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38BDx3482918
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+E3y6K9Q+tF2khG2LMkp+r/bwrotdOaQDNhjPMU9or0=; b=Q9+UH06q+/ovvuyz
	0I+wMQREL+116VIn4tIcvdD8ytOBeUOR1u3PbQFOy0mcakUmvi0V0VVTF36UkPHI
	+DuTauu9NbAPV4ElpJd2HrRgTyhjJAP8Mclp1eBuOIUNeu7g/ZPhT5KHpEb4nQq0
	fQFnh/AABjpLdQ9nDtzj0RxswpztKw0ICjpRBaBure7HAq7Vm3zvika2UEKGFtS5
	tvfEvkZgGQ2bqAYJt4BiAMF+B+X8dH4o3ejY2Gld0s4qn8nYP/vOnMidlLAfupeR
	2RtvaNnyHO/1q/kmCLlZlMlzyBppeQikr4TOwvMImdPyYGPRxSqyZ+3EHMro5Ien
	eDlCRg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xa7qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c891ed872ddso6845530a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004100; x=1784608900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+E3y6K9Q+tF2khG2LMkp+r/bwrotdOaQDNhjPMU9or0=;
        b=G7JTNNkk6LjWDTjiUbS0sMDWA8O2MqAlFpWsIykBVoNmnJP4n4CjyI6z0QZxiXsXAk
         4P9aTzP4NfDe2ghbfHvIYu/Vlv8wA3ZTH3N3HKNIaeBWfWaZkc+hFZDgiTJxZBWsTzhi
         DJAts23ysXoAz2tNPXb9ZOz4vtqs2OPV2EcjHEav8vlvaqMwT0NZGFWgTXp5F3BHZKMx
         MJe4c/MFOasOAiNA6ORodSqUjJIVuiGWeOl8wQY5Kp3aFOGb0BUBYXsh4s4nrI2Se8uP
         iTBHA5IO12DmqWqQnxAZijOXtGGAOuR1qJ32862hjiUpfbdr5HwqV28iNqBR5LGrO4H1
         TJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004100; x=1784608900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+E3y6K9Q+tF2khG2LMkp+r/bwrotdOaQDNhjPMU9or0=;
        b=odlljaidanCy2DuXjPGqwp1b2r1DjPsDdrZauRRAIrgu9xyxicdgWxUv2W+qJBlRnm
         AwLC1pxFKLX7sBylmYKx9KXOH3qL2xcv9I3JbldVf7fi2kpGfme24z5Efl7F9GT5ruyK
         26uUjRpy/g1WPsnr+AHbB9hPIxUxuOjazVVMJjCiT5T8Z9+LjwkLvT0zWEEZGaiSWQGW
         K7QhjjM1RLyvtHxz7FSBeTLweAuoqQxeceR9y+Mk+4mynCxxYxgM66Tq45n1e8iZNFWc
         U+TMLz/oYhb8HtnsHLu+VBLRYnlMIlrA6MCPEQAcNH/x0edgzU/mbfRiAh4OKCa2Jk4X
         ThHw==
X-Gm-Message-State: AOJu0Yx3ZbQHdNUzTza7Q1AjGyMuPMcoFHwUlyjm5WpB1HoEd0HPW+NG
	SoEeq1mCEppmR3SKmHIiCMVWE3Eo8E5qIuKyuBQHCz8tlsqtsKyPYA+3beIKboPxwM48lDhJzs4
	Lm20dOJIprkJpXPX5yHf8EaK4judntC65Lj1Iq/Lr3Xni21GaH3MfI7GQOZ58ps+B6GN1
X-Gm-Gg: AfdE7ckzK/d1Qb5zYsEHCslFXV5qVN2w/WDNS7h1cwN47MO8e3B2g6a2DHJdGt3rKrl
	2Kdbjm9KBZitjEw8Lg2iT24cuWLtooccnhNv3AvE9m+kD4WaYCKIejHsCrQ8iEQJ7aQ8p9NUJuw
	wJKQYPvCs98bxII8cYcjM/VdL1ywx0dyk41p8yEwx3MwRW24elm0tFdfAAEm/QfIVEjst1Z1545
	+WTAg0B/v+7boLs55jPa0QLN3ZKDIVkOag3byJzof5tGyyYRH2oxh5yW97Hy+MeY10NJCE2f1/a
	NOFIWbhVX3ExePBotztzjr+FantSJjXBYiOLyezFiz3UEyqXXoxojxBBjpjZHMc5mpMc+8hhafB
	WLHBGmxgzhuJ/9xoWZRN0wzE9I5fwOAFUkj07LPOBz/tk1tJ9vMMXg2EimBIDNpThtK+S+qs7jh
	ZB5JTUHArWnOymykX2b1/NVRuuFfYgaM+KmoOgdxht7lQzNA==
X-Received: by 2002:a05:6a20:c6cb:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c34d719d22mr2354708637.45.1784004100514;
        Mon, 13 Jul 2026 21:41:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:c6cb:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c34d719d22mr2354686637.45.1784004100105;
        Mon, 13 Jul 2026 21:41:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:39 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:21 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: ipq6018: move PCIe phys to port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-2-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX0tRgMPFUFJ0F
 25rPqo1fneyv16ryv06uqlbBr1M9SeMVzQNowBv/uPNU83y/aVose3Y1QmE8XhVyky3Xz/VDpVj
 97iQEH9yboUWg0nMe5AtCMAhz6P4df+bI3r0bf+eN6oeP0uBvLscxw+V8VhGcbWzY6uc1w95ArE
 iui9LtiZ0YAe4cskCrWkqpolJnMIFpihd07wTRjOCR5+2N+HA3nSnRLRviD3Q2tewaZCe2d3hwZ
 qhoiEcJOSNId9VYF3lWXuaGEwYH+NtSpMNkk00ta9UP488UVgX527tuCxuLAtTtgHPzWToQ75Dn
 HKdphN4F0ramt64ho8ka2nGA+eZj47u3oHb8+b3YiA1KGZR4pTU91GSfOu0zRduxn/QZhpA29qc
 L4+Ld8BCqMrTBzfGoj5q+GbASyMD//gI5Z1H0vwCBdzuTm60cjpUwdIvRpR82uQ6w6dCgkXHIye
 pE5XK6PQcLzHsBO0nsg==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55be05 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3jor3s9Nvc-YBp2SpwgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 4Pj4HbqOHFyYE3iUjIiTQ38aG3bF78hT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX3zrA/ldiDeVK
 WfgucdVdfr0LASgvQ38M1h2dtS/d5Ef2Oaek6F3kr+WRmqdZCwQZEw8v7zxKaSA5SxP9uA+qFCj
 cRjyRR1AXXUVUgCaeA3LR3xSQRGmK8Q=
X-Proofpoint-GUID: 4Pj4HbqOHFyYE3iUjIiTQ38aG3bF78hT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118915-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB07B750EBB

To align with the newer style of binding, move the phys property to the
port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 7866844cc09f..0701517275d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -889,9 +889,6 @@ pcie0: pcie@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
 				 <0x82000000 0x0 0x20220000 0x0 0x20220000 0x0 0xfde0000>;
 
@@ -956,6 +953,8 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1


