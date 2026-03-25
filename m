Return-Path: <linux-arm-msm+bounces-99961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CSPULS9jxGmBywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:35:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A8C32D119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD0E9302AA55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D001E383C89;
	Wed, 25 Mar 2026 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKftk8ja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3oHiCDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F2370D7E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478108; cv=none; b=OAHw02FH9RD55P0aaGYEKkUk9qKGYL5lRRXYRPik9Kng3tIr0r98NW4Hk1ODfEZ9TojNzeJ4en5WH4clXrX4R3Q4SuvQAAf1Wia4eEgskjTeP1Hyoorgm/goVDhZAP1Q10olNyXvrZ5VdrzhLG5MKg5pPyDyInf47VEsb1emYOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478108; c=relaxed/simple;
	bh=dgCdliq37YYz90XfbNdEwd52bDv0CXIRNuhclztakWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQr4j50bQr8EN+VOp6yyPIIa+BLLrAi1YZOGDs4b5NA1WHc3kt3pBwvd7fr2b9dLydI00Qkfk1altairmeehlsiASXOfTToP2KTi5h8ylZMq8wnHMkAMQlxNwmAm7PEjgQzmC+UspqVo/PHQ6epkYvFkFy2xdRkNBbF29YLm3Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKftk8ja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3oHiCDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRaOs1432763
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4gGzkW+K4kJet3S4JMtU6qOaBEVBs8OPUG/wffDpgA=; b=dKftk8jaiIwVIU6b
	Jsg6yZxrItoDAv5FZXqHvmiSwAzJ8zh4h2rhb8QrwkVn4RgewK2K860+9N/+HEeE
	wnQo1veiJPGp9qUf0C4k4puai0+XY6X0pEGfZi19sxGsdj/T2POzfH2DdbX4VQ8F
	+DU8YL0nxxYiCnk79UnA+1W+860a9mQQKyr5dq+a6SjDji0aHBrHAQXNfZpz5rk6
	rswYA7z4dE7LoXiEgAIHnfD2Z9TnHGhrivY6XEW159Zv+T71uOzmWG97R+IgUtg8
	EFyQClT12nmOSYp1IwZR4wMB4kTBHZQ1DtwJVUfAGeEv187fTHhksAdFaNRgh17M
	igYwMA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc51ff1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:03 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-467e8ec004dso804597b6e.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478103; x=1775082903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4gGzkW+K4kJet3S4JMtU6qOaBEVBs8OPUG/wffDpgA=;
        b=L3oHiCDyPwwadqbMUi8MvsiPbqFqpUhFgdzk8LM0VP8ZyjI49BMf15C12sw1otwv9g
         xV+/Py8nyEXDSpmgtvMV2Lf/vqoHiS7ICn/KoPrWqdu0lkR5uJiRva2vQ3pcDP40IoWP
         P/usCwSSw2D0YfqfkMcvVTuM1Ll5pOpIqMKa3dYeoqzlGlixhHi5k1MBNcZvYQ5YAL9S
         EeSWgQ3NnetoWtvca7qfBhhg0c0BNxMJFGn7BKmiyHsZb4r55wo8065Wjsz5LYML9IAa
         5mq06y8eUN80f2MbpyXHfAVO5trWXhJTfO/R9HAuBEf6+rUDXQDxsHZYFyQI55b7mP1s
         adkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478103; x=1775082903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4gGzkW+K4kJet3S4JMtU6qOaBEVBs8OPUG/wffDpgA=;
        b=irJZ/ylNgLFcaCVTOG84lleURCjZGjv9SQhhNgnDtzdVSDDLcycLW03r/lzyBme2h+
         9sBupsT/SnFgV1DCAWMO0V/xVbmDvCCZJ2nBj8n+OSjaz3NlfSYDuDm7dwo+PKf/NR3+
         955SJrd7BQI5Gl3kynMaeIxIcmi1Vp3XMBQ3un+a05NhZqJ7HgJwD4cGlXhDUJF4/1EC
         3IDrWzgo65tnqe/BNSYl/X+y4ThhofOcTAgbcvrm4i0OPODVl7KYsyGnYABkkZve8Q0q
         lc4O3PCMseSB3Jw0kIAvC8sDuzZnMduj+g/kM9P21Nl0sDDPMnVd+O/ipKnLZZM0x6Jj
         jykg==
X-Gm-Message-State: AOJu0Yw8ySFXF3aplh+TqaKHR/tyURQjMeoGDmy2BSBpcDFasiFZoBfg
	IJVON8z+AauXobObZBVEFCOrw7EngijnmKdeDYOAVfEucooe6CrbmGpeM59bIDqoipLrrRFXzbL
	X+XBXuT3lRrYz4P4NOeXSnP0yWpvUGVBFHAPl9l9mKj3c26Ar+JXnCniOhVB4+kv/vdvR
X-Gm-Gg: ATEYQzz3sRrJ/QJHknYVx70CktyI7W61JsItcx+PxfAev3N+OHp3g9wEM0CSt0GN4tt
	9qsg5j/fDxmZrIhp6zkjOsgavXGzCy1kMMn/U8dLyPleoX9huR3cxzU6E/xcCPyy7LMxNv9W9Wy
	KxfexeLCG5MOiJHr96Qja1M6C8sryy5IuC/KI2O2S/BHhUVKad1zeYBE4LSh1Mml0/ODAphNYxN
	8eiNWovwvTMeq+dh2gjien9M6ccHR1gaJgbSCQ1NkTflgRmSI8SI51f7c2uytodRKW75xM7hUrI
	5jw/RfV/CR4fk4zTo9eaYs349ZYx9ln2kUVNnEoA9y5NhvNNYv0rKkQ2u+9ozWv9ERRvfMa0Oqn
	ItOe0yl69oMOvfVtXSVCc29FpPTc7kYdwC6vdO7n7Myk=
X-Received: by 2002:a05:6808:1907:b0:467:1da9:2b14 with SMTP id 5614622812f47-46a5c7c1e8cmr2607981b6e.51.1774478102840;
        Wed, 25 Mar 2026 15:35:02 -0700 (PDT)
X-Received: by 2002:a05:6808:1907:b0:467:1da9:2b14 with SMTP id 5614622812f47-46a5c7c1e8cmr2607957b6e.51.1774478102263;
        Wed, 25 Mar 2026 15:35:02 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70634941sm565790b6e.3.2026.03.25.15.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:34:49 -0500
Subject: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=26510;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=dgCdliq37YYz90XfbNdEwd52bDv0CXIRNuhclztakWQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpxGMS4Swe/8O52DDuqRe7qBXHh+/qhHg5d903V
 +mp9TR8ygaJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacRjEhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUFqQ//a/nTLN/Phdphqk3oJrhvnmvu3gHkCLj7rOpG/hR
 Qj0gR7v35DQH08vIJolhh061raC70tL0GAD3OCVck2+RP8277cczsCc6YxuajHjm7AAvxiKkrdz
 EJfTDkKb994gkZJNf7+Wiu5TEojrAIRfs7HAc9LjAjnmEc61t/ybRCww2G3YOKelW42fDaQnukm
 G+fvUX+PffCK38ACkf0j8qz6rNSvIzWnC4OPnsf/E6borEJwvcnzkZIiTG+cgRVw/Z0ogjF0J+a
 +Kp9+5TQIYCYGqPfP+QtHRDGWEuV8E7Bcp/y8L8vmEJJlI0g8MKBAgT5t5MpJzbyZhrvgpqv+aA
 dofRTEJRDEdMQc5sQ9grfjLTFvazOZlKTuFE3A2iTnU2R/e4jYI00oPTjXHoSHAwTCNkBrJQk4h
 1M/wKZembT/6ahkK9l4yjDxORJ80gMD1R/EBbFquad4Pmz+D6FedKXK37d0P6dYnFJlB278CAqJ
 2lS9gwOatXRKpKeMU8nP9VvvI6u/oe4jh3sIYkNLSJ3LLSZGhOVx3Yc3Txvq7L4ibDp6gngvJN9
 SCsoJ9PkQr4iX2Z79pf0/1rUhEr9Ew6/rhkUdw7+F29HopO3DycqlVJvo4VdPWCX1BocWOJdfj1
 HIczRosLI3LxYyrYa7CDYTZSaP3TncIjt7tzBOalzQKg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: BS27dR1P01APsvQri4KkUh1neLcspNPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX2XZgkbRN3RdW
 GT5ci6klxg9vQcTuBVBOhiEHj55var/JDlTItWOqewC1NKc3zc+4tIeGXJ7pIg56Ub1BcVdgTdR
 fgJO8Jb7kcKl1oJARayDU/xOeMD2EQoiZvPo3UQBoP68s8QhO6gO9zqCXf2MhdY6OgMTaLZ30gp
 Hqd7vGzxqPCAteapmjC4dlKIsaTne3PFn83a/fL+dDVZrddKIdscWI/1BsCSQtmYxyzSIS172LZ
 3lHhQ5MMfvuT7msMxb9MO0JLZrxMplTCGDj+np/e0ONQs7w2vsdteFlq+j1FySEnbzkPXXpdZyA
 7pzmQAY218GDlTQBNRaR0AQHIf/1ZGSUtH38Jp4fPeYq2jx4CkYxmPE+AEf5tM3fqyFCWQE7a6S
 yP0WI4gWvjv2hEe7uiDPzgniO+gAhHdSG9Rr13kbvD5M7wsquh7m/PFto9RefXyfW8OEin4sRZN
 lSU9Og5uWOEABwfqsKg==
X-Proofpoint-ORIG-GUID: BS27dR1P01APsvQri4KkUh1neLcspNPJ
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c46317 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Xx-e167DirpOrJq_27oA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99961-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,4f:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55A8C32D119
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
headphone jack, WiFi, and Bluetooth.

Introduce a DeviceTree describing this device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1199 ++++++++++++++++++++
 2 files changed, 1200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d69e5f3132c4fd3fbf1ac90e83adf6af6b104a93..fbbec696ac161af42c18acc344a228ba461f65a7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
new file mode 100644
index 0000000000000000000000000000000000000000..cc90cb58a9c17ad166dd641d9bbc03b7df5686a6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -0,0 +1,1199 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "hamoa.dtsi"
+#include "hamoa-pmics.dtsi"
+
+/ {
+	model = "Lenovo IdeaCentre Mini 01Q8X10";
+	compatible = "lenovo,ideacentre-mini-01q8x10", "qcom,x1e80100";
+	chassis-type = "desktop";
+
+	aliases {
+		serial0 = &uart14;
+	};
+
+	wcd938x: audio-codec {
+		compatible = "qcom,wcd9385-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		mux-controls = <&us_euro_mux_ctrl>;
+
+		vdd-buck-supply = <&vreg_l15b>;
+		vdd-rxtx-supply = <&vreg_l15b>;
+		vdd-io-supply = <&vreg_l15b>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
+	dp-connector {
+		compatible = "dp-connector";
+		type = "full-size";
+
+		pinctrl-0 = <&usb1_dp_hot_plug_detect>;
+		pinctrl-names = "default";
+
+		port {
+			dp_port_in: endpoint {
+				remote-endpoint = <&usb_1_ss1_qmpphy_out_dp>;
+			};
+		};
+	};
+
+	hdmi-bridge {
+		compatible = "parade,ps185hdm";
+
+		pinctrl-0 = <&usb2_dp_hot_plug_detect>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_1_ss2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	us_euro_mux_ctrl: mux-controller {
+		compatible = "gpio-mux";
+		pinctrl-0 = <&us_euro_hs_sel>;
+		pinctrl-names = "default";
+		mux-supply = <&vreg_l16b>;
+		#mux-control-cells = <0>;
+		mux-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+	};
+
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_port0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_port0_ss_in: endpoint {
+						remote-endpoint = <&usb0_retimer_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_port0_sbu_in: endpoint {
+						remote-endpoint = <&usb0_retimer_sbu_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_nvme1_3p3: regulator-nvme1-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME1_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_nvme2_3p3: regulator-nvme2-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME2_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_v0p9: regulator-v0p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "V0P9";
+		regulator-min-microvolt = <906000>;
+		regulator-max-microvolt = <906000>;
+
+		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vdd1v8: regulator-vdd1v8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_l15b>;
+
+		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vdd33_rtmr: regulator-vdd33-rtmr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VDD33_RTMR";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wifi_3v3>;
+	};
+
+	vreg_wifi_3v3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "WIFI_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_wifi_1v8: regulator-wifi-1v8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "WIFI_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_l15b>;
+	};
+
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-LENOVO-IdeaCentre-Mini";
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wifi_1v8>;
+		vddrfa1p8-supply = <&vreg_wifi_1v8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "VREG_L2B";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "VREG_L4B";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "VREG_L13B";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "VREG_L15B";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "VREG_L16B";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l3c: ldo3 {
+			regulator-name = "VREG_L3C";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "VREG_L1D";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d: ldo2 {
+			regulator-name = "VREG_L2D";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d: ldo3 {
+			regulator-name = "VREG_L3D";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_l2e: ldo2 {
+			regulator-name = "VREG_L2E";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e: ldo3 {
+			regulator-name = "VREG_L3E";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "i";
+
+		vreg_l3i: ldo3 {
+			regulator-name = "VREG_L3I";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "j";
+
+		vreg_l1j: ldo1 {
+			regulator-name = "VREG_L1J";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j: ldo2 {
+			regulator-name = "VREG_L2J";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3j: ldo3 {
+			regulator-name = "VREG_L3J";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8833", "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+
+		vdd-supply = <&vreg_v0p9>;
+		vdd33-supply = <&vreg_vdd33_rtmr>;
+		vdd33-cap-supply = <&vreg_vdd33_rtmr>;
+		vddar-supply = <&vreg_v0p9>;
+		vddat-supply = <&vreg_v0p9>;
+		vddio-supply = <&vreg_vdd1v8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&usb0_reset_n>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb0_retimer_out: endpoint {
+					remote-endpoint = <&pmic_glink_port0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb0_retimer_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb0_retimer_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_port0_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	eusb3_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b>;
+		vdd1v8-supply = <&vreg_l4b>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb3_reset_n>;
+		pinctrl-names = "default";
+	};
+
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b>;
+		vdd1v8-supply = <&vreg_l4b>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
+	};
+};
+
+&iris {
+	firmware-name = "qcom/x1e80100/LENOVO/91B6/qcvss8380.mbn";
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/LENOVO/91B6/qcdxkmsuc8380.mbn";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&pcie3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_default>;
+
+	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme2_3p3>;
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c>;
+	vdda-pll-supply = <&vreg_l3e>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3i>;
+	vdda-pll-supply = <&vreg_l3e>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie5 {
+	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l3i>;
+	vdda-pll-supply = <&vreg_l3e>;
+
+	status = "okay";
+};
+
+&pcie6a {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme1_3p3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie6a_default>;
+
+	status = "okay";
+};
+
+&pcie6a_phy {
+	vdda-phy-supply = <&vreg_l1d>;
+	vdda-pll-supply = <&vreg_l2j>;
+
+	status = "okay";
+};
+
+&pmc8380_5_gpios {
+	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550_gpios {
+	usb0_reset_n: usb0-reset-n-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
+	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550ve_9_gpios {
+	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/LENOVO/91B6/qcadsp8380.mbn",
+			"qcom/x1e80100/LENOVO/91B6/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/LENOVO/91B6/qccdsp8380.mbn",
+			"qcom/x1e80100/LENOVO/91B6/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&smb2360_0 {
+	status = "okay";
+};
+
+&smb2360_0 {
+	status = "okay";
+};
+
+&smb2360_0_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d>;
+	vdd3-supply = <&vreg_l2b>;
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9385 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9385 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <238 1>; /* UFS Reset */
+
+	eusb3_reset_n: eusb3-reset-n-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	us_euro_hs_sel: us-euro-hs-sel-state {
+		pins = "gpio68";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb1_dp_hot_plug_detect: ub1-dp-hot-plug-detect-state {
+		pins = "gpio124";
+		function = "usb1_dp";
+		bias-disable;
+	};
+
+	usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
+	pcie3_default: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio150";
+			function = "pcie5_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio149";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6a_default: pcie6a-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie6a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
+&usb_1_ss0 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_port0_hs_in>;
+};
+
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l3j>;
+	vdda12-supply = <&vreg_l2j>;
+
+	phys = <&smb2360_0_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l2j>;
+	vdda-pll-supply = <&vreg_l1j>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&usb0_retimer_in>;
+};
+
+&usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l2j>;
+	vdda-pll-supply = <&vreg_l2d>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			/* XXX: why @0? */
+			usb_1_ss1_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp_port_in>;
+			};
+		};
+	};
+};
+
+&usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l2j>;
+	vdda-pll-supply = <&vreg_l2d>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			/* XXX: why @0? */
+			usb_1_ss2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+		};
+	};
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e>;
+	vdda12-supply = <&vreg_l3e>;
+
+	phys = <&eusb3_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e>;
+	vdda12-supply = <&vreg_l3e>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e>;
+	vdda-pll-supply = <&vreg_l3c>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e>;
+	vdda-pll-supply = <&vreg_l3c>;
+
+	status = "okay";
+};

-- 
2.51.0


