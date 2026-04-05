Return-Path: <linux-arm-msm+bounces-101861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM1rL/1y0mkVYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:34:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9C39EB03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 16:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42E3300EFA5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 14:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A7F2F6904;
	Sun,  5 Apr 2026 14:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+RyREqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyCau1Br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E10C2C3757
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399654; cv=none; b=UOAQWYmMsTitjSoswECiheREmGUwvmqwJeiRTm4wsqDO+5gv/Pk3p+3arcQT4lWfJWoiuY6I7DwGpt3MWJxM6ItYjrMIcCTSzexLpUq7b7xNnY0AQFN2nbql1BKqkTJktaIFxRwFT1a5D+tfh0glkcZkrtvuHtGqhgzNr0BzobQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399654; c=relaxed/simple;
	bh=T6igVgCi17Y30yaXK03+ftYDUSOYqPbFkDI3RkUHhzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBWrSG80JgsZahnvoxkbO/mAD987Ws7KyBOeRwYY+A5DPyCQ74wg1Qv5pp42DvYReUuiVO8S5/zX/KQkFWCJ166IhliEK8nYUOrZN+UEkBLys0114NaTLVo1aXMtlAe5+mh2MScknvKcWQwHE647I7fQ09MQRUR//ccLjhawAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+RyREqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyCau1Br; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635AV3xv2365047
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 14:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEgiRRNXVBNBCFK41iccbVB+NEAUjWWt1W4xiJ6K27c=; b=o+RyREqTDr2HCPa6
	e3vUYlyXBeZPxh9bR6fTb6GF3/cMw5NSSYzz43PChpV00l2M+HyT+n7o5lnBfb9J
	1dJkB6l5/teNpKtS2DI5CsAl7I7J57ceCPi44MCQbauPQZrATTpF1qUDRbDk9MpB
	X2wAA/4IcqA9Md7JhykuvGEBZY7W0cUAuxqmm8eX8XZ3F2cVWXFnfMRywPOybVS7
	ZSk7s1AHlH4w/5Zcby6DoPD3PUcZXJhR1RTT7MMh7VdPCc1HfvtnjwPPq1qn2lvg
	R5jbDRhaGmxKwRY/gQbHXOqQ3aZAZ0sLNgwArggjDHDF+LnljRg28uo69WizfY04
	kshuAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14tk5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 14:34:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d68dbb77bso15675861cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399652; x=1776004452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEgiRRNXVBNBCFK41iccbVB+NEAUjWWt1W4xiJ6K27c=;
        b=hyCau1BrnW9hywLBpi6lNPNDqHoZtd1Dn3UXzQYi8SBIBQdSsLFvq32IoVsxHdHywZ
         cpTbiMZ1oD7JpTZtlAsA12JHgvJlyc2R0AkBXEPf0+mDI7Wyvc700vj8hsimvSqB1m5g
         5XhVn42eUAW4el/Mc+SQYyfEP/c+iQ8OtGF6HUQqgi+EcuuF8jlRrzZZjJ7dJ1Ojqowm
         I5rxunf0h5bTSPjTSl60UQzx+ih+TCmTLGGvqPFlPWiJO+Mak5HyCn5zaPIoGce68xJH
         d0043A4dyZ/IJLojanHc+mknikiVqr6/2e80Ve3AyFWjl7pJuQZemkfKnaabcNqd9sjB
         dl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399652; x=1776004452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mEgiRRNXVBNBCFK41iccbVB+NEAUjWWt1W4xiJ6K27c=;
        b=d2tQ+/bmGZQLfI5P4OiZmFjetrfsGnrUd+46y2Mz+GjLmwwpfTxb9MDssELaNVF7RR
         HKE6LUi09aBnXs+HXu8UhmvO8H1oDZbPT/wV53MoFdV53bjW+terTIHELK/8qjyxRERV
         ueQD8y+ThzzahSdoAbsMKTtCT2UCIgRrCwodL+LAVfOpVRnzzzYP/QvCs0Wg5Z3HwNNF
         Venep0lM5yJ1/wAXey2p5FhwGC1doPDq8e2tg7+o3m9lxUjpC+WnXW/Iq+jU1MSnir02
         YqIaxlEQEevM5Ii8xrYelKJfm/aUq/DBzSvOZ+2H2L1eZMjJdvKaXHfxtVkSX/I/RhkL
         OEXA==
X-Gm-Message-State: AOJu0Yz9RTC13DVu96+r4UH9eDFWaYvwjj771rTSreDxCz45cPVIwYYO
	VZPo+lWlmk8DMPGTLu5db2z99n5dlSux5vquDl7vJcNYzo1Hg7S9kxgE7Oh1XSZ0eEYxNa5kHVq
	LzkgK2l3JEVYuWlBpw1w/2ftkaKXJLCTO2S9luuY38fz6yR+oooIHXDzanMaI2kunebb9
X-Gm-Gg: AeBDieu1iXIR9a6V0zfdU7X6zXe10m02i9WkIMjKbgjHYntvHbMASfok8hSu6+WEoWY
	XnypaAKMZ5tpb3a+mkdoTplLnqOKTya/BNsxj7YhYUHqq/1m4QzuJuylzny0xeFHa+7IH66P+J9
	xZ+yYwI4Tw1SPd0ACMf9571eIA5jbOIeawe5ToekYaE1PgwuZYQcApMhZ+7jfYTaqQ65kvR/anR
	TElKN/6b22h+vWJxcm8B0KqlyaG26e3OmXOsLsqKPXbH1He3OdiWhgVpMnlsh3fU2/2m59V+NoA
	Py4M39UOjed6xpJFh8n0KWRQSV08vAgUvpJ+zfy7WH+6Ux3DpQDWizT+6JGtph77OtEoWVqm1tG
	/8+/KHHg4bylYHHRLxA4SHdewDGE1F+VJ3XW030SGW5Ab
X-Received: by 2002:a05:622a:228d:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50d62e5409fmr153503971cf.59.1775399651858;
        Sun, 05 Apr 2026 07:34:11 -0700 (PDT)
X-Received: by 2002:a05:622a:228d:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50d62e5409fmr153503441cf.59.1775399651463;
        Sun, 05 Apr 2026 07:34:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:33:57 +0200
Subject: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-1-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T6igVgCi17Y30yaXK03+ftYDUSOYqPbFkDI3RkUHhzc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLXg4arhCnf29Y/cl21C0sPWg82UckPf01be
 pfCjsB15e+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy1wAKCRDBN2bmhouD
 1xWFD/wJ9pCf5rqy3LgjmpkHPUsWmp9STdD6vWbwMf+kFVr9j/cYa47bH1dRMwF3/7jLK7X42/3
 /1U19KcW6V+c1hE/J5N8jdg1EW9r1x0sxN1XLwTt0D14i/qlQz3NWmGNfmhQZtANpLWlVnQzonv
 NkJeavpkAjPKxVOy21CB6wGY+CeecjLbNvBf6BWjeW7IowxZfmOEX9ZPWrYbY5DiOy+BccHzsdw
 nvE8dAKv9Sa+1POXq8q9rzy5L8evgPWyJMw/yraOBbR6kBOXtON5CU4uR/ZtmsWaYj5L/883ISU
 +PwFvdXWs9Kkm6np1Ky7Bf/5ZfzTKOuV8zZfqVLuq9DR+Uq8j/c40v4GAtZyW9phQdl/Vn0terH
 AbiDWATZ3fMboTDV78QeTSc1TDOli44NT/o8zKFL0sugCGHIZs9hDC+OSgqgNDv3HUzYn40Aw7f
 b7KGJsdOnriuaWpTqS9JTkJ1iS2MOxAYgypC6MRfXxwhwRkEJ6JvDoO7vqCi3Lxf7/ujGbkkCOi
 SjDRAiX6Cd4NgHVUnnMY6qZxbnyOxEpKdBB9QY1yzXo7Cd0zb1NG09xC4WiZ0CufuoPs15ZJj2w
 K0FNuf8P4b+KfqjMZVOah80G29PrnRPIGM2BHB1fyD7DJmeLagIv7w/1XUVHr+xxHXpxPBIx1wl
 c3qY/B3pZnTXU+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX+J6Stfla4iCw
 GAYNMYEY3cQN1vJBfKpJ2/v1L1Z49raV15a0cIZWsghvJrYf+g9W8N/XCw/olZuVmHDX7aAsFxQ
 qsBZnqu4fvYjHTO8y4Ao+fwaXDC/r+KUhDONyiyaDmBR7xSqXTjhklZ13QcdZ6u96rMN1m+e/Qf
 eov/xPjZh7pJbQj4XPzaBHmNt0daJCkVpXZg+oICfobT1qmcuNiA+mAFWEOBh+qo/Jqi0tDrGMo
 Ztt2SKaSVD/ehAqJBjVz9st2FeJG4JFeT+KcN5OpmKVJS/4lEco9zJJ2KhAiOmVC75NZX7Ibue0
 a69HKaUle4ivH18ySxIu3HDVFiZvqEIC/VyZm2TnTXASZ5KqrQwWdc29FjYZ+8V3wSTbvupfNh+
 oIGC/1+7DJIrHqYUlhgEbaFEjXwK5zeFrSArAUWFVNNdoMZbz7d5Q6skM1k80mLGRpz+npgF8/5
 gs6r08r8Qjgea53gf0w==
X-Proofpoint-ORIG-GUID: D0RbM8mpX_TariH4LRzPgnmWC0LOn8Li
X-Proofpoint-GUID: D0RbM8mpX_TariH4LRzPgnmWC0LOn8Li
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d272e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LQzgrBLVQjxtG0neiToA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101861-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57B9C39EB03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DP on Qualcomm SM8650 come with nine address ranges, so describe the
remaining ones as optional to keep ABI backwards compatible.  Driver
also does not need them to operate correctly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8239adb7f7d3..e4f17d29343b 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -277,7 +277,6 @@ allOf:
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
               - qcom,sm8350-dp
-              - qcom,sm8650-dp
     then:
       properties:
         reg:
@@ -290,6 +289,24 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8650-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 9
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clocks-names:
+          minItems: 6
+          maxItems: 6
+
   - if:
       properties:
         compatible:

-- 
2.51.0


