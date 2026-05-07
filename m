Return-Path: <linux-arm-msm+bounces-106554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GnREpsY/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:56:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43F4F0039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C75C30BC999
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A7F3D5647;
	Thu,  7 May 2026 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQngIrc/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nsma7KOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49C83DA5C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194250; cv=none; b=TgWVKl9TPtnCjXytudHICb7MrL7zK3O21VFc2mrW2S0jqvME9dwKJiq8huVdYa+yI4xam2q9N04fF0n/26XL3Bnw1wcs5cMclMqjcGmskMBpiE0mOYdRA7fQVZq4RSNDWRxh/2AIomNcOo1OSQNaW1MX03xjpBorBTR8g0ZzLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194250; c=relaxed/simple;
	bh=LHNi+12cboraoNbCzpt/W6iWtyjIVws+K21hs0+sClI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kd8FmcCeGj82nPrB/VrTK3OaOrrhcNMh3X/K3q1n3h0yNvIcDp/Sq6AnDwgDq5V8No4l4pZNxGYJPbGzvaoT8Eko3UrnUiH1C1D6Fr+Jclz9jgQdn7CJkfYw0X21E3UunaLgptzbabHwe1AydZqpBU6U1eKwi0nFGDwMZloNYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQngIrc/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nsma7KOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JDAif2183134
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=; b=HQngIrc/io4BeD8i
	ZNTtsFiiaegrguhhJrfqFW/WFVa49f/NvGeqsrpbsYTbpmCKxYkdCluIH7x+mArs
	XW79CSSU67He9YmA3ncj9z9wLpwlNOjeInW4kNjhoUuhrKWXDJmu/croAIaloVf1
	7eRsys2lgrPJKnl5nshK5U7BFY2HJOD8TiuNLoCVDEgoEu4YuypDVH8vob5SFcck
	4+81JYTjha9UUxpamE6UA09JBYIEowvo+r2K1g155KTFaWYhREFB99OB+MpxU/nL
	uTyJXkn7yZmKr/BS2reSCjV//FfEc6fCYUXCCiY4yPXMAW3nOMfHx5Qoq8th6E0r
	isGHNw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10py8m7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so3246552241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194247; x=1778799047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=;
        b=Nsma7KOR+vLrGr+q/CtwlrYtpfX/353EdJlJzhQc6hqFGnu5JSTWQ5stT052Yw0Ovm
         tBWZhEJN6miwbWhLCgUxRMekM8vYU6Ojn8NLQXh8b7BN7c204chtCEaDnjYF5oEZmrQK
         4vtkzDD3EFdQheIOxBIiCawhTdewq6BXg5hyKzmQ5lPkoVZmDwJ3MvEQSvxUXKFfhO3d
         DqSLBKvgbT0lOQo/s2KUGSpwbL4KJI73Ls/a1OFuovFRQZifjCHWcdL+QAexfILsGxSe
         u76imxgcNsNrbGOLVP2TG1LgVMz5lKdsN7OytdU++jqJjip3YH8SnpwVIbxEJrqvEmqH
         ldOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194247; x=1778799047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=;
        b=Dk/tu3iYWBDqBXg9LZr9MadXefacnssHcIaJIhzO+JPRsPjSCZRSIc06KudVFvfODU
         0uA93vF3yNKTcn4MRrVTDF2ouROi/6eeW3Eb6ffpX7KxSyVYaPf0+sv/qvLk86DjgYyv
         XRnpds/0/pfJpNs8ecgtWXykbQvaU0AHogk6bUf+oJt17W8ie4ScouTsr39f+60+ocHK
         PE1lgRuQYFmtL4eNtqZ3oOoMyFzPxqDksW1T0JWZq05Xz2tEGO7RTDnPqhM4ooRdNdNB
         beQLgs2j5O8GjNVTz13ARNpuoBLv2MT69mqbgoyFFBXUhUHTrra7DoR3ALgL8xknsEss
         BE0g==
X-Forwarded-Encrypted: i=1; AFNElJ+6OL+Xah1GCMI93+csSIYv/+SHvpj9/laSKL50C4h9PnpCuCAUGc5dvKxP3feujQml29GbGUHmAylGXZYO@vger.kernel.org
X-Gm-Message-State: AOJu0YxavUmK0xTBpPpe3QVPSa9yGw4ATlNzZrN1WVYbH60fx6RY7FZQ
	uIfxdDWy+krQCXYKJwoq7UvtIS1Jwv9jKLdLfsdlSsQ2ij+tev3SJN+vr7l6BR9YmVKAXUqb1gV
	iQiVZ8zeGFzL1xYFCzhAKNGP4KvZ/tiqUbbiXUVnhsI06DSAx8SjLaLt3rGudWO9uyfOO
X-Gm-Gg: AeBDieuE0Ct0lBwGWjKMfi1lwx0Ql/8WnEhjlO9BvmyPI+KcWDhLP7eHnFGpcyJCcsS
	k1GgkUv+rggnU635YtyTrBAHzIlHnaK/p/oni65mqFgOKngh6MGzIfuzVr8JB1y0qmro+apRzf8
	2I3MqWNLfwoUY1Td1kiaGjaKlgtuOraG/LPr3iPnfTAM5l16JsGiNOrTqb8fVAxOH4Rn6YFTHiW
	fWAFwOM5gLrPKRpVZBojjw3r17r/JVF4PN7VnMlJzSumRtLRda72QcUwRnHIwhTS3EKQk5RowDx
	zvTN2xkXJbBbAPfCRnTlbU3fuaOLmqOxNoGj1YiHN/Aue5BQ2NDGLbJh1GQT6yk+t8tLm0thG0y
	DcZD8On2Oz+OdN7sB5R8IoRpIPFRkxkvd2JvNL9Jl4j6WhIOLs9oiDRbsqwwVCxccxW3dGr4VfR
	GC9Sd9JOjVJF3nCe0U
X-Received: by 2002:a05:6102:54a7:b0:607:f4e7:d2e8 with SMTP id ada2fe7eead31-63115d82c8emr2076953137.4.1778194247142;
        Thu, 07 May 2026 15:50:47 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:607:f4e7:d2e8 with SMTP id ada2fe7eead31-63115d82c8emr2076938137.4.1778194246707;
        Thu, 07 May 2026 15:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:29 +0200
Subject: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate for
 CAMSS AXI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fd1747 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: W6elW_vK1HanWgkBzqjrVvvZs1x7QMYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX2hUWqOCSiLFB
 wwZbJX7VNhiyaTZdZfIOfh7A2eWJobMZYXiWd7+4/OYD1BGLVmks9spH69rCS76Iu7+CDMpuv+b
 ingcs5Nk9pgXr+fyHf/8svT5xHMcuhTuxwnIoXLlyoYiWtafGUCF6nP9ahtpeeTGO7EoAMODpIy
 TvwtQ+iDVXCqW0zmIcJereQa9RMqTERSQGU6sNVwA1K9Q/hKBAirxbAMNmNLaKa05sTfRjzcogO
 BjW/UTzYwoeOfjLMi3JCdbXfa2VvdI02OvNU5zyhhW19L4d9+JKZaeFPQD27EL4KbTUB6UAasNx
 0BiS110L50W9N6d8/k64oCzjJAFVCF7g/7hMwaudYue8nfWiLkdjlCSNxfZQ7iYmBzLZAfB/ATg
 GMvsTU3dqbUUIGnb8Ji4rjTJKNREySpzdqC6J+1d8GEO65Jy6rIM8DHO0gWknQaB+lz3Kmy3GN/
 Gc41LknOUERtcdffNmw==
X-Proofpoint-ORIG-GUID: W6elW_vK1HanWgkBzqjrVvvZs1x7QMYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: 9F43F4F0039
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106554-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,5c11000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Agatti, the CAMSS AXI clock is not managed by the interconnect
and defaults to its lowest rate (19.2 MHz), which is insufficient
and leads to throttling of CAMSS-related traffic.

Set the CAMSS AXI clock to a suitable operating point by assigning
it to its nominal frequency (300 MHz) as defined by the specification.
This ensures correct and stable operation while leaving room for
future dynamic scaling support in the driver.

Avoid relying on boot default by explicitly specifying the expected
initial clock rate in the device tree.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..6a6ab3f15c49eb1e8150f57198ffe2515fa9ae52 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1884,6 +1884,8 @@ camss: camss@5c11000 {
 				      "vfe0_cphy_rx",
 				      "vfe1",
 				      "vfe1_cphy_rx";
+			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
+			assigned-clock-rates = <300000000>;
 
 			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,

-- 
2.34.1


