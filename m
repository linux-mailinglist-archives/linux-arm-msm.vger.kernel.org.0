Return-Path: <linux-arm-msm+bounces-117562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +kikFQodTmrmDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:48:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B573A723DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:48:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RPCkH5qF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bs4mCyI7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117562-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117562-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 637AB300A107
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6682F693B;
	Wed,  8 Jul 2026 09:48:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600782EDD70
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:48:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504133; cv=none; b=gCWsdFZR/7P7CECQ5jnvZ2bKaZVpM9aQCAfATjAx67hbWDWS2TR6j0yteY2XavNasmjzRG9sRvCWCJdOVSuC3cvUJMenNyGsT2BRu6nBDGXoOietfOAdVNaTp6P5/bV2pZrxjU3RpGJXVqVAi8PqrsKnBdtvj6dfQnNaRKlqKfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504133; c=relaxed/simple;
	bh=iquhnVX83va+93/Mcr4oasDJq2ojoyyvQIfd/GlAlpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BnZTUPWIXKvf/eFZSa8zlZHzq1qxzbnJd/qDdG0hqsEGn8n4lsbWb9zYFfvfi4frFWRTpooLW5nKG8hvA8KZCXkq7KQjAJNwdH9Qz8dNmjccO0v4f0KAI3X3JFhb4nh3lzgKcJPbifHaXua0sG/x42HqP3jrC9nP6k0vdUprpwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPCkH5qF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bs4mCyI7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668896ss2258453
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bg+Lut/Yb+GhISLgjp4dKi
	W1om4zG/Mga19fYgYPmo4=; b=RPCkH5qFs+pR8L5rXJtY8U934sI542D6zTEOEJ
	w5tpbZMvqZrtOXW1DRbPxOPyK+o46Brgc6yr51As0GlXycFq6ydPM7WFx1GjcuDs
	DqNjf1HE7bI7YUiTYfghgBC1NEc6cy7tCy+zp6yPJt++mKemS+yWpK22zmdnGQeq
	cnvxgUBTYGpONQz8rXHoQ5DsoKfIAjYZCNBaRn9T8JkSs5Pf345Wiu225VF6ht4C
	sV8307Slu0c9KtERsi0loIfFOg1vf1yhva5cIA7xoJDBesl93Fi6dEdOBrV2Kaz5
	fuGg4M0d1rkBZEyb9Clqeg17ze4+5bQ1rGi3h3EtVin5isnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9st9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:48:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso5469491cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504129; x=1784108929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bg+Lut/Yb+GhISLgjp4dKiW1om4zG/Mga19fYgYPmo4=;
        b=Bs4mCyI7ZaBRrWIU3rYprCCWBT/7OwBdrVANkN9W2euc5uove76NrkwRd/ekredUeZ
         yqMEe5s+QGowtKYBlwVwwtVGzcd0XaCe7Pj5Bapm9m6yxbzRIFXydNtbUVtrrNA3GXyM
         kEnQ86zegCFKYIsRfmhPOsZy74PAcFhCJLghyPs0+c3FeI7/eWkmQYhvHLKC1w3vMiun
         D+vQIlRC3LIxbAI1fFUET1gBlIBlbCHqOo/ZsxOQgtfml46qv4vVpCmKksYRafiEg0NP
         MlvdkJIrTpaYAnDmHlolckMaTKylpZidjM69BVxGNjVyMCuT62tRxjdFFDWy6YOHW5nv
         lXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504129; x=1784108929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bg+Lut/Yb+GhISLgjp4dKiW1om4zG/Mga19fYgYPmo4=;
        b=tAxS4s5jjRnLYlMgzfrjm+87nasubae4NvO304B/GHK7TlG6nFeVkfk8LpDyQ6l7ci
         8AV+6mcYfl2kkMFBBplS/oyduYqtDBFOCrTZ6NlSGO7Yl7d6mqXgN7Xvjy5GaKiQ3PVc
         HTlDboM8YaIIzC0UhJa0RJzqHEeXLxT265qy5J474SoRPu54t+QYdVPZJ6RtiC5mPSIL
         0Ze6UTiKFjF2fDfWe9pgLBvJ3pOJPG+w0aDNYE3NkCwmId1hOxeKOPWmv4NOsmbE/XTe
         6lmIqBphyvfWI2xwYSvGd1hws75SVpmLZ22QHoob6avP0zlnzFV6KSZRxAT4B9pFedAa
         L2bg==
X-Gm-Message-State: AOJu0YwKuq10Ddazh4viQUD28ztE/FdRRHnQtr8DuFrVJ9oRHH04vG3z
	9KS3auQ+KOXM84fPdgmc+QtODccfTnMnVOBPDdfoZweO8oYSpSk/vvh3f9/X0/1YoS5kZTHGWou
	RDwxjeSGiKw2V4SUBzV22oyLMtEQxkvUaEP4vLY1bpdqeUXkLDcrptJ/oPDXVHCYhvOcr
X-Gm-Gg: AfdE7cn441ecVS/jhA37XjA/NqsUPp+wBjJBludWWN/WflC/43bn3VY6iHJEHWwefuU
	Ih90gf4LPd9wB8NMbnTxJa4GyV5krQT/MxO4Rke+cyDDB9sgp4fhSXrbe8YxobFKj2jCgAa6uh/
	yFMrk/nOeOAPgyNWpfyOtqnI/J+IEDqntBg6cSnJiQm4nv34DZyU6k0l4YMAJE1tNzdsKHCIyPX
	RTG7QhluceEIKHf7+l8+Eq9+CSwObTwJjyQMSy6IxLgZ8i0Q5BFwGVUxVsoZ6mRmZNfCdTsSsG+
	q1TyyOEm1NLCm7BNmQ2euz97f9pSiSTEP2MqHCOXvpNtI9CEmthtUwOoqdxVGKCFlE0zwLqAiMg
	5VzXK/7czDz3uwdvNHYkNPSWkaLtc2z+hSfE=
X-Received: by 2002:ac8:5c94:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c8b2dcc55mr19608961cf.33.1783504129653;
        Wed, 08 Jul 2026 02:48:49 -0700 (PDT)
X-Received: by 2002:ac8:5c94:0:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51c8b2dcc55mr19608831cf.33.1783504129280;
        Wed, 08 Jul 2026 02:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: clock: qcom: camcc and videocc
 improvements
Date: Wed, 08 Jul 2026 11:48:38 +0200
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORuoHczpq4iHpokzgl1tNhHG3
 n2dHr/L/y9gUlQMLs0CRT5qOqaK46GB+AhpEFSuBu98506uR56QNLGmwTCGV4xY5D1rEcYxZ0O
 icOZAvu3aHmolF7nr93e43v62mZ4Spz0L67oBrxh0B4MAAAA=
X-Change-ID: 20260708-dt-bindings-camcc-required-opps-bba9dab23638
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iquhnVX83va+93/Mcr4oasDJq2ojoyyvQIfd/GlAlpY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz4Wh0klLWrSZ04yZNrXrg9VdmMik51Ayh/+
 iHOlV+5zZ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c+AAKCRDBN2bmhouD
 1x3WD/0d7wgVy5SI1+gUM+2P6bGDR7DlABiIIMl0dEbWlyXg0ppYOMiePNVz/KrOYEXMd3tOj4h
 CbeK0zY0knnAxyaWFNSTKj4bdWqzJcm+AAXCp6zht2GPc8ba8Y2qqBiaNrCa+OBbuBWWCg4Vhye
 gAqMHvJeqgWdDzO0VYHXGRrFR1RM1DRJPF/RBIaai6Vw4dsJS/hzFNQuWqFAN+QPmZTofKe1j2K
 byZHt4bz8kIYIZf7tH6tMyCBYYmbkO8CyWY1zJsGurD9jrppj/MC8VaUOq4w6SeHy7iVukmj4kV
 axIgPayiKI15MIvr7D5xjZPP33IR92rNFbwU4T+drSYdSPNygCtX7RF42dV9Z3oUhhIbbyb3mn9
 EHNdPzDieJDAepjiOJY4dbSAgGe18ECZ+RX0pSwbgnES/Jgip5sEq16HeNdHyUJdXTnnXcecfFW
 ATWhUjgMTduDmVQlF6tW6TEm0cEFoMdK3NvdaUiZh8nA7zJiJN0gJzjxIoCyBy5xBsENoEBcphe
 4EBUyoiyHbjnxWf1sQuCED/R9JToBU5n5gbm4xTg/gtT56V2Kb9FimK1eYpcPSUxmd0I8ZeWbar
 34SA5cHTJrYVTSGjMwizgObouixr/Mpol7JCYjiOPDdrzjcuR7qaADTthcVwClsHTiVPToCR64z
 tSjt5HhS37iJkGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: SnaO9Mvbh4SBH16ah1bNGWEBsVAgzdTT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX/klPaifBn75R
 cAHhWV0rgTt4uGw8rXrjWnGh/8BrsXsHufe8NUxSw9dgV15fakWgZHlqkb6uF3YI5cuGG7fq1s6
 VkJses74FB2lz7/BTlqVVhGcNUyKL1c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX6flCTwYRNnM5
 +jdZSV2OIS5Qjn0WgKZOjNTt6lf9CqIIfKSpjW3gdfr6Lk3SMIsZEgpRxxd16yhwkzlkQ1rb2Jb
 SxXCMZqGdhXSSI2gTnwra1ggQ2hjQ9Ga+222dBtaLlcplMNDFU0AQdJSUpp3ydC2XrVeVPVMAfl
 qs9I4x8McRIaino6n0tEFHt5gt4UKSJ+C20V/BcqL6CKOzpoeeHTxE60m3VLiyE4PRUJ7vYWhVD
 i78SrglTFrEGflAuzYHr+wZwP6WCmUW7crjliceihyTr3IzWaFvfUPGKy1A6sUS3Qk+0VwrJ6pi
 5s01BT7gQI+5Pp9M51BGxGhZSLigKl2Y/eYbT7E46MGSF1RBnP8Vv3s2NZJFWOstZjxfM26DVpx
 rZYLeSzMHNwKkRrXoqrMerhBWB15J8PLpqnsyDTcFE6IvF6eOptfNjj/v5x1pKwPPwqWgq91Tu+
 3gb6RZ5CS9j5WYs7tfA==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e1d02 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FyscYusVtPSbMHA5wp0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SnaO9Mvbh4SBH16ah1bNGWEBsVAgzdTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117562-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:quic_jkona@quicinc.com,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B573A723DE7

Hardware needs certain levels on rails, thus document it.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,sm8450-camcc: Drop qcom,sc8280xp-camcc from "if" block
      dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8750
      dt-bindings: clock: qcom,sm8450-video: Require required-opps on X1E80100

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml        | 12 +++++-------
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml      | 13 +++++--------
 2 files changed, 10 insertions(+), 15 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260708-dt-bindings-camcc-required-opps-bba9dab23638

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


