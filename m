Return-Path: <linux-arm-msm+bounces-100378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDe4CqSvxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:26:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C94347669
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEBC73077DF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343DD34D90C;
	Fri, 27 Mar 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJoWHilW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ja4co797"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA1334AAEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628338; cv=none; b=vFf/G8P29SvWosds08Rv6pVrHrZPNR4D2bdwWLLeK028ul/h3+4wyvFOsowZgqG+1Y4dh4Z1N1pWpsS09bBTMW2TitU60zM1hHOfuPRiAjUpxGChENLqzU7JhhhfHWx5vYlGcztxob7HcD5NtD23EE91fTEAu0rvrnhk4PDrAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628338; c=relaxed/simple;
	bh=OhWzLg1N7VUw75FT4ySNKXzuT95zElcSAuaBm0lVpVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZbR2Mpn7sxY04tNHBAYkSc4OJpNq/XdhaPiD+z+klovyZ+JsPGsRm8eWFsBb6AQr5gAdEzQd1GsnbmTOQ16jeT3M2nOUpbBFRISONyxCF/fZm1ddssIQiPZEnAzxYhLnfVLgZSal2KBXtvtCW1r2JSLOv43lULoLgKldSmCA5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJoWHilW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ja4co797; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhrbg430680
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=; b=jJoWHilWsVWLf9gP
	NIuWc85VZOtrRRvzQxmZ6STAtYqIkib8JjFlJ8Lo2uVfxOrbxR5RF24QhpdnmtKJ
	BuZAJNgtOd3z34R50rZ2NhLX8Um2lnty9d0+3HWDlh4YrAi7g5NGfYxHkA+nzlUg
	LX13/gPa/HVGh3VBpLaWmp9WMbXQcFB1vqdFrCfNsoMNnhJjoWzYIK49xI4euBdc
	ioOrSB4eAIpisglZ3ITXz/JIGEUY3xuHwyGgOsAbYWgpk6L8PE2Wqd1h35ZrlZMR
	Ke4GjQjyHv3F+lz0tZiytSgKm0A9WGNqskFwEYK7a0CwNbRsvUdrbLgR+vmOMSHJ
	M5dwEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5haptv9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:18:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so62993741cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628335; x=1775233135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=;
        b=Ja4co7975Ia/aXkRCL9W9kr2jXtG9+YWWulfk6QtCgFQe3LTjJQyrdzClnDBzJuZ4Z
         FZjsiEK7nGhGQ/kMGpjMkfnFpe68JKKLBdpL6WwI8fj6+CA9uyyF4YjIJbEcbmjkPal7
         GuGwEu/7O5aHrZ9vJIMBqv4Dk9Yz4K4gL/pxvUnrLs7o7QpaF5WZy4U2vrPmyRb9J6Gx
         +Qthtja+7AYs40GNct41Pao17pMAj3JaJTUokKYt/5LfsvuYpLx/ogKy97pbdpSwFzJN
         xbL7oeg2u4bNBSnUIn5tnVll9mHqgj0n6pC8VoSbQZsDvxA3rsdzyD9UzXhNXZRNDCPC
         cw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628335; x=1775233135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ho3xlrBEbvhY8MfpTCeMC8S7S66WXzIKBaHg4DQWXjI=;
        b=AG5d0lCMf0nGMLeyAGa7hQ8DAKXiThvnxJl0K09ClPjun2qBgqbDA1WqGi63hXyzEF
         9L+J6RCWZJevnJxIIzkjzfbxuYWzJSIiGyNhDKP7PDL0yhvFN+D9hiuSJcnPcHSyDT26
         P5cYSa265oUQnCVxeTzwXtkDZqvTi5nIVqU3SWgh54unD9W4W0uy2pCOmxtrC/oc9d+1
         7YWurv3neyXaOe5u4DmcEdhPuDs9LdtKP+aq/O33vS/MOIXptQ2ovnnMjKbBKa1J1iVo
         Patkc54EgrAF4ABd/Tbm7X97uzvEofeNfC6pbbz/5ZHjasMFFr+ykaSpqgayxOY6MjbM
         SvIg==
X-Gm-Message-State: AOJu0YzMZNXBdjVdX0jrGfUng7EEwnktnLxKjJKnw3GrXBqKivPMQh9O
	zcrwEaefqEUVvvB0KNKyztmesSNeW94nKFcBauooqsAc5Q8lsPRaAkLQ3YHNh6TRGSp6CXM+uP2
	U4iDpTPuFzcGGjakKBAniLZxn8cjX0s/32mjX7gwrLrTOcOITHI511BRecs52dD+6Rd+B
X-Gm-Gg: ATEYQzzFAe62vDFmPLFWtvR/c+4O32RsXo7OWam5uj1KhxXHy5lsDohMT3fPrGtQbCX
	ZAfqr8RQkLCpvZ8p6uAGUEdmnDBsKiLH8O+Fsq2xVZbpSIp3MFhZRG7WuBBuBg2RtkAgpYctqnX
	147koe3ymrerIt02gePoLhdaIyDJK73a+3qrtfZDATVX/yobLGEmgxMzADw0muujsG2LlZoE5gx
	jowuCLTSc+a0dflOTDVL+YlGq5RWvSQlsYH0NM97AuIioZKEoh4CALXTnkSw/djKa2gCPjjWiOL
	u5gQwK4rhL62Ojj+ieHNbV1lpOJ0z7bbwp/xQsqurC/oeWdVLgAo45r953VEjDrBUKss5yB57zz
	dmWpXCxK1zo31JrvzTu11A2w3gLE=
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr73261331cf.17.1774628335103;
        Fri, 27 Mar 2026 09:18:55 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr73260801cf.17.1774628334502;
        Fri, 27 Mar 2026 09:18:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:18:38 +0200
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 Eliza ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-remoteproc-adsp-v1-1-1c46c5e5f809@oss.qualcomm.com>
References: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OhWzLg1N7VUw75FT4ySNKXzuT95zElcSAuaBm0lVpVg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3oaZ/QetAeynWbZB3KbmQq4OjLboaqinfN1
 5ZpNgyuXVmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat6AAKCRAbX0TJAJUV
 Vo1JD/9eV3rwqakfe2vzvi++o7rrdNxvW3QYoN3batkYXXHvbjGYzFw0cuVgOBuRnwyNyZFaW6S
 S13JgZOuhnzAl/GVxH0f1gfdGGcwWLkbgLtSotPJyhDaWgAdWlJOqNjCbJibOdlgDbxzA5gZzPS
 0fqtRfHo+lNojMnkGcKJrmyG99GoneZFNsDuyFkqXGMjsPWI0fjXOkInyRxKMx8frn50WmoWBNc
 SvmWAwFBhWZaCoIdsHAPtyag2tV7VPfDM9znFF78DQ8CHiJObxKT3QF7dSHGA2Vk0UCn71kH2aQ
 bLNr9MbSsflccsWLX9clKBQpXnmVzGXEvMzWlOlKDGMg9Sx3GbyeAtwF0JJP1WIlLL8XCTKEFVC
 Whe0Get9dzHfvYHI1cifE8uHV1JEQQfvH6afwjV/6J6j45JnG5Ib+gkMdS71CBeJVPSktV75Xuq
 +S+vxWhg7XTDb2vb3OFNfMn4yiCc1Qbf1Ln+tYDpwJb9zxQMzktuo7e4GR1xm8Y3hVUyRSomWlS
 bsadWAjjpoe/Oj9VTaCAu0C85VOuE30yyb3b4w1GcEKQoCf2qQ8IpadTiXtZUKJE+7lIqfVh49B
 PLOtaoAPciOz89fGUIG1J384wzpbhlbqdyHEfvutEZ8WI5HvKoM5mN88opRsRLzm87vlciUp3DB
 WiV+HrjRZrU37LA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6adf0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XKsGtxyC0ZlOnUANqVcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX6i7RN2hzwIEn
 p+O05p/r25klWgbOaJqk1CdEPAB/6bb5Uk48o3yIdxKJkAAYOYQ5RN+h88QNjUBAll/MHexEate
 DYjVU7Y6sNwhJLkqVokBQGa7NSgQoM6GvGHKXRWJGyGqJVwoWmDPXA6xYyIrqmguIgzyVHFdN6T
 zvW4dcIoILBrXSWnUWRS/p9xA3+4tqE8QG+eRMuXhVzZFPcDtks0jC8WwXlwaRnlg7oT1CcNHyU
 vFA1RNuyo7hGLdX38HWYC10b+qNcZY7G5TsVs1ZtG8U+j8zZbHka4smV+/8ekEVeT5gEJJCxU2I
 hYNvnsIHBdv3ZS2YQapcBQXFrHtC6czP+YHqi8tL73qfAE6W1BaObNe2Crc/FAjw4xz7cQZIDvH
 /IQ9uiOFsVAACAF+X9iIm8lEvic6FFkC1tQ0oxXNhW3InqEOv+fqlTeDTMpEhUOdoP3m7durMTv
 FTift1oIOrXBTV5OefA==
X-Proofpoint-GUID: faLzp4eMXMlH4wmELAXMh4mIpAMnJI8k
X-Proofpoint-ORIG-GUID: faLzp4eMXMlH4wmELAXMh4mIpAMnJI8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100378-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95C94347669
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since the devicetree bindings are exactly the same between Eliza ADSP and
Milos ADSP, reuse the existing Milos schema, just add the Eliza specific
ADSP compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index c47d97004b33..e5cce0d05fc6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,eliza-adsp-pas
       - qcom,milos-adsp-pas
       - qcom,milos-cdsp-pas
       - qcom,milos-mpss-pas
@@ -69,6 +70,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-adsp-pas
             - qcom,milos-adsp-pas
             - qcom,milos-cdsp-pas
     then:
@@ -89,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-adsp-pas
               - qcom,milos-adsp-pas
     then:
       properties:

-- 
2.48.1


