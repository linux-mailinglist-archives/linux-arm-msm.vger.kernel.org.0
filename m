Return-Path: <linux-arm-msm+bounces-102437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPg1KkZk12nvNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:33:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7B3C7CD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 044FE303FFBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B493A4F25;
	Thu,  9 Apr 2026 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egGhx2Le";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyoREaPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C803A169A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723532; cv=none; b=V4KIm6f+k6xx+GwK1Z9oO/2T8ZeuBhkReJKhHYb6rZXQtUwBCAOP/ymWxq4ISOGZ4r9aKamVfrIQnomhGiRzn8mVaiYxIpD60T9cmDgYOpg/D36ow1t5sXjGYGTVeKetOMA9+aYlxCsdXESPSmqfRiPcqECC+wJtRmGERcxRBqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723532; c=relaxed/simple;
	bh=xrtaMAHyGzx1nbWuDQHRLPPXAplXgH9ayKrZccGTiEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxYpCPRM+wwOpg8wQVYPpayH7mJxfHwpYt6024IDvrhenwtPsTDtapXLxFiDSJA1xnVK43p5PvNMQrY8S9QiZ0Mu4b6EFGsK6snzrQP1+tXHmqXEWfPDqmXGY2gt/L59a4+UdBJnLmqGfqgnb8spAZOaV9fN8SUUusGrFFvD4BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egGhx2Le; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyoREaPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397Khke1071849
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 08:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zu2dd5IWxy6lICGCUaJMagqjHJpowlfczfRVORxcnas=; b=egGhx2LenclaLQXC
	gRqNtFVYFQ0Zbyys512KWXluMSyhxqmCgI7f54oruShU0Pgvx9gFoXyqQnj9Tna9
	DhJt0CnkYQQtlu4CWadLHFYT+LX4mGNZsVL4ikWUEFfq8gTAOPjNTZ46m0UB2Mvc
	+drDVF+groOSb5L4x7iWP2MP6+0WhbeXFgMNtGhVnXqJZrFjA8JHiQl0cLRcYrmZ
	8rDqCydCQ2H1HoVYJqiyXQB5j5oQQ+Mz9991vAV6HltUKlgl5Q1pG7Xi18a3Ftj5
	2UiKoH39q4pbR0hKrLyQGL+8olo+5CzvwzYIBCZVhqBJlG/szxr9oVXHkApDM4Jn
	OgHp2g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3b51f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 08:32:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cf0130d17so555051b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723529; x=1776328329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu2dd5IWxy6lICGCUaJMagqjHJpowlfczfRVORxcnas=;
        b=MyoREaPIM1XALL+qBZRid2muyvo8WIDt9hLgksMUWlKpCnZst+2+OfbDSoeOn6mf99
         cOD5sb+4v5jJz0JjZWQBcuyWYzbi1xeJpYz+TMPQEq2iFVJbWg4YgSk6uapVZ+KvNIjN
         jTlp4WK/GYW7DaT96Mf8EcQlI46jO1XeZ4OMvNk6qgllm2t/CnNgbGlzvc1DC002yZjF
         ophYoBAaZHpGd/1VEaCgHljrea4r4K+vvTZRUd4d0i3ln9Eu396eRRAsWjLle4B7FMm6
         kizMjTRDZpeK3bliCBQNWmu1QLtkc3tjZIsWJEc7VFmO0svWAsKcXy2DrwmwBbeL1KVY
         O+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723529; x=1776328329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zu2dd5IWxy6lICGCUaJMagqjHJpowlfczfRVORxcnas=;
        b=bn3v0s4ryyZgoSkmEONJXIS8smgLrKiWHpYjimX0ZWG7RnD/IKt4yocCrjHAeUUTb4
         Q5ueFfYaJZ6cT1Bm00AtOakhQ5oMpJMhFKQ31KLjpwlswmows5NGcVTvSUWkP/Uomeyr
         JppICbyUrkwCzGXaePz0QdgglxyuOtNfF+pZ3wlB4nuiqr3FexUJy85xQXKMsTmQFAe/
         vHBmEOTLbgm0cn3NiIHmxmz6S8FdwkcAW7iyPgNbQoh/cURkGtQDRPuD+ole1TDKQEST
         1FQCQi44wPFpymgO6YT2dEbZ7sUfSJFSt1lbZsqowm+jJdxtl+aaucq35JL4Xcnwcfvl
         QSgg==
X-Gm-Message-State: AOJu0Yy4fEzE8HT0De1zc+A46udLLwQuQYl1qp7IW3N7buiBksBQ3Pf7
	GGuF5tvp/c/QRKl6STEX+vpTxjP8ectatXvN7caeurDbDImfFRMA2gIg4ydp3/t4ycUQqHbgczd
	D/9w4V/a6WnldELtXGrbMCPdCzipd6/+f8QpuocPBv1lDdN+6Ht3Zn+M2YsPCRDMLljfJ
X-Gm-Gg: AeBDieuTS/HNfyJ74PLhe+AxVW8r0QoctIXijwSAX2IaNy0TuNI84y5Dxx7kLeYtfYg
	5iy7gS+IyOWcyRYSu5jlVpRhhCBZ11pOCQy936E9mvd2KdPLj1wttmU3BcLKvIwuH4RyWB8BJqO
	9Bb3/MBnm5k2pdXSQXVsdPqKOUwNGoe3tkLKStkKcUkBp+nVqLx4ZdbLH7V+t9SQOphUmtX8/h3
	9GcDyi60MY7sowCiCgmAvFqvuipj3DPBjt1IRI0Kw7sEtA5NLoblgI8p/4BAm4DK42vzRMnpEzb
	OZLAMnAk6xzCFfqn6d+EPqTCT2G7i0a5B+fKwWz8oL3d9RQaiWlV/I3zmof5ujPfbjsI7ikznkC
	SKtWmMCDI+irHdyQQHz/xMgjc5v4LKRGQsZIrZ46QllKeUDHMhd/M5Zw=
X-Received: by 2002:a05:6a00:3e12:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82dd89da5e7mr3214340b3a.24.1775723529000;
        Thu, 09 Apr 2026 01:32:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82dd89da5e7mr3214311b3a.24.1775723528461;
        Thu, 09 Apr 2026 01:32:08 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm29741277b3a.26.2026.04.09.01.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:32:08 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:01:51 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: monaco: Add iface clock and power
 domain for ice sdhc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ice_emmc_clock_addition-v2-2-90bbcc057361@oss.qualcomm.com>
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfXwPEyCjxeSTny
 c3EqhsQd427Ch45RUjGThNrdwQgFKy3FG328xiT1zBFWvRYleexvKeczYyDC+ESfuRs/WxRF+de
 bZQwIfWJS+gmArIg8W9RB6z18qUswLUhlyLK9jH1FOzxGrBK/U2yRVlYIE72ZGlDdFrVMlV/jTZ
 fxNfOUoZICktrpEn5Es1lPEMYtOF84NPsPJSC3LH0di2rbMpWJjHnM9Mv4GZbDG6xj4yR5SuZxS
 mV+NMdzTQtZTpY0HVDSWKK+PTzojLzc7S8bo6IfQu1XpCIVV6y8xWz6cC7zL55LNQmP0tunmEKS
 yZPjevNZ4NEp/CWOzOgbyFB1dHWh4jomQeunEOKSv2sw1afpulnFlXM68c4IGrMMeUBtUZfzENL
 g+Nix53x0UeeSm7q4cLIPFlRNN5UhkKgvC3c9QC5XKx466upkQpP2ukigIonWaYYRXJhAiYSiA/
 8+PNsKIYU1DXm+xym7A==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d7640a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zChIi_bjjUXeECqr7xMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nUT4joVWFeS-usgZJ4Dt1L3IFAysSWPT
X-Proofpoint-ORIG-GUID: nUT4joVWFeS-usgZJ4Dt1L3IFAysSWPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090075
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,87c8000:email,0.135.221.64:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102437-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04B7B3C7CD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver. This can
only be done if power domain is enabled.

Specify both power domain and the iface clock.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5fd289669353..8192d6b94305 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4873,7 +4873,11 @@ sdhc_ice: crypto@87c8000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x087c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1


