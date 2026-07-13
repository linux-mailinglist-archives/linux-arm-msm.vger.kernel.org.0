Return-Path: <linux-arm-msm+bounces-118788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y5/eBPbkVGqrggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:15:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA80174B6B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:15:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bl0Ga2+v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UdfpuhII;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118788-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118788-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 046E330A0AD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C248D416CF2;
	Mon, 13 Jul 2026 13:08:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C2409611
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948130; cv=none; b=kzFnNqkTn0V28MQyd/p9vEBv1E+1kLpIjGKi0COor9+u7JOH/GaLMJcXLRL05K7UvN0pgHtykIvI6px9Jptn9U2qV5kGrAaaRRwvBWY5liaXIAew9bdsruqJ6aJnfbfyFp425Hotj+Wz7/FFa+37el5nQKHYfDApXj2U2uo+rSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948130; c=relaxed/simple;
	bh=UOsIgF6my05LXHOCsgMOLRl0/ijOlWoiUY23cNh3Noo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIovi+FBwWatgnlDiN5grPkhSjr1Fk62NtoDZjmwwuEsueWa348NJ8nXWLbZVusvuzx8TRBBbrGDqeDrJRHuDE1L8YtG/8JIFzefh6P0Rn6Qw31sRwApZ+/84CuzCE/KasmIMOOrW0MRdRXzbK38+SIeSuLJw1eKM614SdnXl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl0Ga2+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdfpuhII; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvwr1494363
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URgzAqKEdxN6silXFEDVaD53BHQnlc9kI+2F4MNt3X4=; b=bl0Ga2+vu8Rx59Mm
	XMNKBXLpF5hY+Syr2pTQ65ieqS/vPN0wgIXStqYxGpx5SNAZGxPwXP78t1ViNOfQ
	HsLg8otIKf9Sq7PRxvn/XLFgqUttYWeRkt6Pkbhx7gQrJPwaIfqmL4snW9VveEH9
	Y6AENQnGChpeTioHkcMQnAXidfICqbAo/soHIZBWSEYLdl5EhO5FjUsSssn8vMJp
	ibjSBVBddtoKNlG3trXqnY9hJEG7sJIbi/jGLwM1VGPdCEFLVbGmnUe60+NJSWfm
	1f7bcvlCmUzYJpB5n0cUFBQP8jQCbYV4R+EAfm5cageW1YF9RvDGKfGoqLiM1Nyo
	8rs/fg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2nqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:08:48 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a18f3aba30so4380286eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948128; x=1784552928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URgzAqKEdxN6silXFEDVaD53BHQnlc9kI+2F4MNt3X4=;
        b=UdfpuhIIItaih3KEQS/Yl8BUs8IlchEz4DXNckQc3yk1XO1lRGuPZMv3CZpnlOkLRv
         gRdcq5kdBwvRiv79JLVyfNZbLT7wHwaArSMjNvbx/2dV7GksyCWljSApAPTjCpEllKod
         lcIlejcdsleYYv45ipO9JZ/OJpoMvojJOkfUAD2yIjTFZauEJyljYmiPac1t31qfdDnq
         WuKHcUfsUI3gj8SYciY790nq9q5PSdKfeiorZmS5IUhWPQ5uvB/VfBEv5D0XYL3oZbJz
         wllI+wf/uXwfX8kg8KkCo69/kzLI9P2fJDwkQ1kAsgf/8o0fugKldASIxU29bhmnYF9w
         +fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948128; x=1784552928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URgzAqKEdxN6silXFEDVaD53BHQnlc9kI+2F4MNt3X4=;
        b=HhkgX+wcbe5mu5ZyVjC12DWzkMbY5sA3o9AWiWKXl+gEnEePyTTD1IHz8M+wQnSk/i
         vKndCsg5v27yq+HvoeIZef5vMvAR+X8fdyQVoaYjQZe+gZSnw/BIdRXIybEgmrC3Uv4G
         V2+zOWLvsRlsaPHlsMwJ6SqMUsBv/r4AzHRNFHNu+LwJ2cL2ZiX63Td6ywfHWHcFTYG6
         2AkIAwqBkaf6JIZ8tt4cyRGxBaG8RXEFrK38CdbGo2wtpOSmr2CAm4CtIj1t+5OTHXPR
         q1Qy+xE1ZRhob8Ddu0qVsSIphjqDWGJjDtY0qqgcOQxy88NCs7DxLElKIlNsaos6hDFd
         fmkA==
X-Gm-Message-State: AOJu0Yxj2nP59RyqeJ5M4huHZpUxnYTw7ZfJTEKOtw7FXzbFjBz44LKE
	ouP9PdE7YzdisAPlnpViqnKdwfjcKOA7/2x2L+MSkOLhCa4zHO0oVcSODuSGGvKD1USlEDMaE7J
	a0IxN7sHPz8kjYJQAjM1R80ExEZq9RFgsRaMc/cR8ahiiHwCDvFAFV6yJT7/cM1sstZdF
X-Gm-Gg: AfdE7cnJhgaUDhnz7LYkqB5mfi+hr5lSBBofl2gnqRYdzfLLkqfbLqRjQuCZWlibIhP
	Y2QNkBVXXjCZIW9fneZRSvLSucd/GuQQhZnzVs8ZoE5plmjoBpjcUpnH9QVajo+WiQoMFw3dqiu
	GOq83a7pSvjOHO92lnewo/L7eEI7gl8gHUoN/ADn5gFPioBhu6u1hIeV9RB8XPGlwhmtuDNrGPQ
	T2arP75qZWacqC8CJYuVUja90grgzbSMA+Xbg45/lQqJw3/fIIDBcY5JF0NlqG+7nxmjzgRWHm0
	0531ukVWc6rMFLe90ub67+5P/VZozdFrKGJMx9e2PdvDzh+EQH0Q2/Vp76VMWTVBUkKTX99LGLe
	yQFbQ6pQlIIeyZcn/FyLSJAenL4SU/IlBOxvHF84g5R+7xEuAM0ehsGtiAX8L/ZlrEQDWMlKFoX
	EGr7Qz
X-Received: by 2002:a05:6820:2d05:b0:6a3:8093:a171 with SMTP id 006d021491bc7-6a39a82f11amr5648105eaf.50.1783948127873;
        Mon, 13 Jul 2026 06:08:47 -0700 (PDT)
X-Received: by 2002:a05:6820:2d05:b0:6a3:8093:a171 with SMTP id 006d021491bc7-6a39a82f11amr5648092eaf.50.1783948127472;
        Mon, 13 Jul 2026 06:08:47 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm6415913eaf.9.2026.07.13.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:08:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:38:29 +0530
Subject: [PATCH 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Maili QMP Phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili-usb-phy-v1-2-3285da11f148@oss.qualcomm.com>
References: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
In-Reply-To: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783948113; l=1096;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=UOsIgF6my05LXHOCsgMOLRl0/ijOlWoiUY23cNh3Noo=;
 b=gLotHIuTQWD/8ME1hzzYrtw2qcDrZhzaTUhRFRsCnP5LAWHJIhK2furLgN2+F/K225spvZJCJ
 BVsc0pZrkqUC5WmQ8+JSioPJxYwovxG5auFs8jX0xZCq7820vp1T6bt
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: YFVpihOlDQUe0JccoDyIZ4JgZbnLqCIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfXxrV0QZkJlBF4
 BJbVyC9kZbn1lgRKBTmqGKdpCUt2xzl1p/FELbNPmpY2fge99NQKslpSb17/Mp42e5wHnI967Di
 Ojj09I0JrQoV6y19Y+PBoud3J0fiQqkeOUxJgPA+SQIjIuYH9kfQm30HNFNqypwUSVNNuW3Cro3
 h/+MQoJrhmMohpwWllkJa6ZBKhxoaM32h5G62zYKPRJJ9NSS94Gfr39JLWgjDOXueQhY8c0h5EZ
 VU/f8IkdHG2xcp4oVu1AnF3EI1GNEwmYUpmACDPl7R5v0CMs8Q4uBZd4+042QX7XMVbuxxzNxbj
 wcYYX2nCgFkRneyXm4Aw75JAIlmeT3VMlSG8QitULsdEkew1e8nPwXQYjmaJNBTZgdZvpH7Ab6S
 4qTM+2HdxfipFs6lDTpKRgJciPQJgNX1jQ5Jc1t2TSV39e6cUXVe6RK6VDPIKN43zgd2YJEcYOJ
 Ek0qoIKfpQGiVO2orLg==
X-Proofpoint-GUID: YFVpihOlDQUe0JccoDyIZ4JgZbnLqCIr
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e360 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c48FE4Zzs7BoiMeBshYA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX1IUuekvIF/+x
 Kq/DCTGr9cNh8sz/66wMrsWea3o3OaWmtb0Vvs0vZMZKIGEbB41BHVY+MO1+tCisqpLZkD2qVuj
 Wq1Cwm+Z0Vh8YO60i5RX9AZQ3I+AiH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118788-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA80174B6B9

Document the QMP PHY for Maili which handles the USB3 path. Use fallback
to indicate the compatibility of the QMP PHY on Maili with that on Hawi.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index ea3f1699eee8..f1bad6b1739d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - qcom,kaanapali-qmp-usb3-dp-phy
           - const: qcom,sm8750-qmp-usb3-dp-phy
+      - items:
+          - enum:
+              - qcom,maili-qmp-usb3-dp-phy
+          - const: qcom,hawi-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy

-- 
2.34.1


