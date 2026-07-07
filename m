Return-Path: <linux-arm-msm+bounces-117329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ff9AdYCTWrdtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:44:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295171C131
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:44:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GZTB9GyL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BtTOcZr8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117329-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117329-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C68963025D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B39241D4D7;
	Tue,  7 Jul 2026 13:36:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB63F23C5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:36:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431377; cv=none; b=o9EG9fa/9hnVWoYqVolEvWjh246/gSJ1+taqrz4AZt85OWPH6D2F1fphuGyp/B2/tue0WNR6U2vz4eICsAvzKXesGJWmAVAatBVvBJR7yk6W34MHQdeoSpdHC0kzrDaFdgSw9hUdtBgl1ec6B/0S7py7EXkSTILrRmsHoEfABe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431377; c=relaxed/simple;
	bh=TpjG8KBXL/ETwfRcMIxT4R3UQ2qbf18XqfUNh6z06Eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PeJU/q31WvYS/fxqFM5VMAPQ9imqm+hbdU0ms4zJ0Q+dqRYeHq4otaHAxsIofUR/WzJ9J2X8NWoo2o+3kzVxPaUR+WjUIDdjicGDZmpWiADi7WbZF8HjBGwIujFa6ZqWDZ7eTKfSSi3LjU0K0SI+MZkVUawhXSjvLhfTUNXOMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZTB9GyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtTOcZr8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8tAU3768570
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=74nHb71VF2iGnRp45BZ+d3
	QgW57Sz5Tbh032OKc9l4c=; b=GZTB9GyLvty6RDtGJE3rx8h1FPvEY3SbH/DPw+
	xnb2axe1iaoqZUT0k0OEeu7xIU1FZnxOqAKwKwHK9z45SN5WgATq4vjPWA/2e2eG
	0R11ZBOvhKCnyclyOePE6y+/4j0ANQ9iLSf1wXi2Jde84tgsTxMaIYlHLetQdQiE
	YWOGMQDGdcrVPWMjXt7WmsF+ALtoxaLGEwCdZr+v5uBV5XL+11In2984CaocvhqT
	yJUHxOQzp22K8MukOKHyqnkvYvVNXzuskKl7mpmJ5fNH27bBR1Xcdf51jYKSpc1A
	TxDQKIC3QCFg6fFB/h+5zjsczqavSjaF870P9ZuZyDAyP/3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj7anu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:36:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so51972061cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431374; x=1784036174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74nHb71VF2iGnRp45BZ+d3QgW57Sz5Tbh032OKc9l4c=;
        b=BtTOcZr8Udn1Tf4OHjiV4vx4wkUqxuXHP4VQ8HXXOI4B4QPIK+06nUq8HvKom+Tg8o
         LQ1gR1m7Qp9zRFWywLo3LPESvuH3dp/adxp0VYP39/QJeJwkxK5gk5jhUlEw2Vk+oYVZ
         bAOkVVjnEw9tAGA8D4FLWTbYbYALOH65RUBnaEXl1nmz+OhTkZEF1OBOtJCQ0PiVpAHU
         qZQavtGMEa2tJ8v502d2stgr79vwUPxmS9sE2K40NkM05+ErCy5RynpaYyQ1ez5sQjJR
         Y7cw9c4HrDnAMSqk8+h3lxGEbTPpbq9mtsor4QWotpD9DwA5EdBXONnyjMgrnFyMlrg0
         u+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431374; x=1784036174;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74nHb71VF2iGnRp45BZ+d3QgW57Sz5Tbh032OKc9l4c=;
        b=grSowXLk+96cVt/GhDD7jkbTx12L/kW8T/kx52+X1+FWIyy4OHtmGdTjnlli51ppzT
         DZaVFIYjApVN6dNPVH5q3cpbtNJOfcyDbjHSf1hmtrIkysMLowQcIR5bgOhbPlHuX3UP
         A/KArZQSN9OLmMlpKXVMfm1Veiu/I7K6KjqC3fGfWl+esPXHIpml1P2o1FHiFTNN9Klo
         gvkKv9nH2GDYexK+WpDa84GOgFbxIk6LhdXHdSpREBcQ6ivn01IullDjuOWspTq/YOVy
         5PfoD2HrPorDfU/V8ymS4lzRskz4Q49gNxS/3YCCtIH39/iXFxXk26yX9jLP+jpw/3uw
         ac3g==
X-Gm-Message-State: AOJu0YweTx7f/C2AEY9AblmzHDN/wUF0ROsMjzYa1M63tnmBf9wzZ+w+
	rqiVo3eVqhfDFcfd+8Tk0ZRv3nPp0+bV6Cvte58ObVX40vYRaGBgrHKcJdOOkuQ8Ip0+xsD1eVd
	aV7DhZNHescJMBhKZIXTF2QwO2IiE3yZo7vmWrtUaMP77ZZA/8eQmfNvGfYe1Re89ulJq
X-Gm-Gg: AfdE7cnfbUOdJ/XrsmlI1TIpMp8Lrur+zC/n43pywHdaWRoQauk5eTpYfIjs1ewqdyb
	YxtuukAu0pQ/nBiILBhuWJUikt4pG33OaMftUL4SSHvdu+fWNsOtu70V6V4WEBo0LzoIKG0CeQL
	1L8op1meZYZ5nhRDfsGPaiXS28vr+1e14Jz7/UZ8a/EKikPIG0zw/vbSw8uK7PLnzld5I2J+3W7
	xbvG/4699oWFAA5QuscVC0Aiih9zMmon7soAnvvxcKW0YxQR+RwapYhtI0WPxYTBsX2xRJ5Uvnr
	gHzZePWg/fooaZx214GEOIO8uHYMp7ssQaozv5Fzr9RYQESQaVRDj50tndSdVSPXr/bOm96UnKY
	qpP+neJewE3SJEkVtb4h3zwv1p8Tm6TfC2oU=
X-Received: by 2002:ac8:580a:0:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c747be19dmr57076081cf.27.1783431374016;
        Tue, 07 Jul 2026 06:36:14 -0700 (PDT)
X-Received: by 2002:ac8:580a:0:b0:51c:14f5:8f9c with SMTP id d75a77b69052e-51c747be19dmr57075691cf.27.1783431373546;
        Tue, 07 Jul 2026 06:36:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/4] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
Date: Tue, 07 Jul 2026 15:35:58 +0200
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkhbAVNX3sOwKO0ANdJKB4iGc
 HcLXsDNJG/y8v7KCKNDYtdsZREXRy74BPKUMdNr3yE4m5hJLiteCgV2gsZ563xHMJowAAUDXg/
 pAUWrLhZNWYizYqnwiti691G/1z+muXmgmfbkbvSOphA/x/widu+/pUUAB85LK5WVldB4C0T5O
 OtnEoc8HVZv2/YF4+qlPN8AAAA=
X-Change-ID: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TpjG8KBXL/ETwfRcMIxT4R3UQ2qbf18XqfUNh6z06Eg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDEV0YwrlDwQCNGrvVuuYXdBFug+wcWutk/8
 jgETanCVg2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AxAAKCRDBN2bmhouD
 116BD/40yQkohCmeAv7WFXDDCmpRoGFDjRGCRMOINOYYQWWZjCfkaFXn75R7OaLYG9UOXoZWL1q
 had4ErlrIaRmXT97WWnd9apoRrREHTq3POuFV1wwLIt8OOucoj4wNDjO71Kdqc9ZDyF/Tkdzdub
 PZVwFMVPexNASEALr+ZHIwqwBz0aDBk4uE2xREsydIfzC93qMfOTpBWFWBe2BVvOx0xegQbpSaT
 xko/h2AC3w+rNg3LC+rPDtJBrPFd8bksarzMt1Rt9FpMcbyvQj/ebiYKLKJFmR45OvA99J2DgUJ
 RX9GxnuZwESKRtRtSuUw5nAFKMTtqW+Ct0H6nD0YTyfMgg0AD9FNuhplr+N1BqmQs0IbFcBxqkR
 XWLRkMCGWnyKWTXHcDO3D0P7l3r2F+BFKnJgTIXbEIjt7aioIeHxvqjXc+raFfWVPfznmqjFVAa
 E41Hzly7RfP0v0q1BejkfxIggsu/LQG8CW4XoTXGX1bmHMIL4nZ2wlzeLw9d9ZZTCqTGLxT6Zmx
 PUhTyisXKYHgOYGOeiesInI5lvhFJH5fTCH7NOCRC1uadJS3QZ9BA+d8tHCPeEYMfF6gVysAgzp
 am98vA+5IADH2xSVpkmwGnS7H/0PkF/gdjAhv7IaoYf3n+SJtL5CyrQg4q98DFc/NE2TrtiOT2m
 bA98kIUcuYuMDFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: O_sC3FK5shhVXTIMYqpOsOw7N2KxcYtj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX3YlTLc9gMJFF
 z/zscMyXPjK8KhYPgeWEspJNxpePzkzP+J7CjockplB35xAnwpp1/j2r12mIoi6CmtvJLuEk0dC
 zU5g1/wRdcMS9M5CRPAiVITA1ezLEUZ9HYg3kp5YMkAwtxj2DYFx6I8rpVV+77Kma9cuGPN1Oln
 jXI/KvrabHbwr4+Tc4TcrAZkKB08wFi0+AlnGrOy279zJ2ett8k5TTjomBnkaA3Pxlw7aHS2ysC
 ggIWHlsP8180+Nf+QbtS3acMHXFzixhqO/Q3/HEpb+syHiPG6hnkKNJnjJn2jQMs83xap2NUADO
 4hJV9gtUTqimlWVLILDtzfAoc+AMc2f/ZRjKIvgc66SYEhSbOOXJ8iN0w2jFOGYBPKUsRGzSULf
 GFPq8zPxXbfJe0moM2loBPhpWTfGOhNAtLUQ+55qhG8/l9vjj4l2U0rfG2uWH0+Aw7fTdgf0gRt
 ld3BGu8P4Dtzuc/RJOQ==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4d00ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pnvqO8KSa4PCI4MgiNQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXxGezXOJv/577
 CS1of5NPiiPclwkcs35BW81o14YLF4Hh0gkKmrn/4BBUKC7sfVQyQgMWzD6HXY94BmkrJnGjPk+
 YZ8okW4GIroqebR4G/1OceMOmiI5EAc=
X-Proofpoint-GUID: O_sC3FK5shhVXTIMYqpOsOw7N2KxcYtj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
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
	TAGGED_FROM(0.00)[bounces-117329-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6295171C131

Changes in v2:
- New patch #4 for WSA speakers
- Add qcom,usb-hsic-phy-mdm9615, qcom,usb-hsic-phy-msm8974, qcom,hamoa-crd-ec
- Add SoC codenames used: maili and nord
- Link to v1: https://patch.msgid.link/20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com

The schema checking for expected naming patterns for SoC IP block nodes
was really incomplete and was checking only nodes with single
compatible.  Improve that because questions about expected compatibles
still appear, e.g. we have
Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:

- qcom,pcie-x1e80100 (expected old legacy style)
- qcom,glymur-pcie (change to new style, ok fine, let's switch to new
  style... but...)

I am afraid that a new SoC will revert that back to old style, e.g.:
qcom,pcie-whatever-new-soc

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: arm: qcom-soc: Include Eliza, Kaanapali and others in SoC names
      dt-bindings: arm: qcom-soc: Document more of existing legacy style compatibles
      dt-bindings: arm: qcom-soc: Validate nodes with fallbacks
      dt-bindings: arm: qcom-soc: Allow WSA88xx speaker compatible

 .../devicetree/bindings/arm/qcom-soc.yaml          | 183 +++++++++++++++++----
 1 file changed, 147 insertions(+), 36 deletions(-)
---
base-commit: 5b1fee48f42ff6563e3512c6ec661bd6685e4e10
change-id: 20260519-dt-bindings-qcom-soc-naming-4f97dec54139

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


