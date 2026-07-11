Return-Path: <linux-arm-msm+bounces-118483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4cIAIzJ5UmovQQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:11:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D51677425D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="A/aFvggT";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z5jbkUH7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118483-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118483-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D3AE3021EBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A373CCFB2;
	Sat, 11 Jul 2026 17:10:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D23CE4A7
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789810; cv=none; b=CwOGXzurMWy24GgZFl0Ph5ArhdBTS+JceAHZD92bkZ1JFoyjRt6ney0P84fVcM/P6Ne6TE9IYlBIXT4nPiqkFNrRt+4EFtf9OLO2z0ehsH11rXQeE/Si42ssbiIKGwJk7t7f/Lj74QTyyk7dghC0xbLLmUUj2U2kUP5HguQte64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789810; c=relaxed/simple;
	bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBwA8fCOFxhR/ZPAj9RpLmrEGnv3cxLzl4Y3xROGijVIQn5t7wqLzPYbxQ4K0XfwR+IqaDUkmGGT9N/Pa0AEtzs77MXK6O4q6grv8Stx1UqDwNudzism2Ki95ETQPmh/8CNGAJd9tN5nmPaUBt1QpivJFFvhWrQY5WnGULJHguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/aFvggT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5jbkUH7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOQ3A4102484
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=; b=A/aFvggTPSyZZ+sY
	oKtxRYS+2+QAdwfkjNMHkuLwy7CQY++nvZIutK7Tc876rdu7M4pV8vseCgEudYPo
	B3iXGMUCfeWzbzXDiRyovVKYJIyv/winF17BVK3i8Bw0kDteSNz7em7fMZv5WDCd
	TMeJDG4NK1D09vB6Yax612Nm5rlPQNkfEs6bUSyPGjOY/ygnYLnCckKL1cPEZUHa
	8Kg2+DVW5Byw4aI34pL+2i/N1Zs+q8ent0HClJGGt0qNSB7wFBif0brQOCvxMv6M
	IvkuJG0uZejAY6YydYn8V1GkxiTuazk1tQrN+p8wB7BswwENZ2FP0m6msW55uLPp
	8zzGkw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgh9mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc101287aso825378a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 10:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789803; x=1784394603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=Z5jbkUH7yv4eUFhhm2kF7strykUpOjIkeC23pFRtB9P+hVkUvBD4Wt+1UHB1S5ESOv
         SwNmoeyF380g6GFuzFJ7kxgFT4NqZRR9ZtuCTOK/TwHTH6QrTgBdf/GAtjFTpTyHn2ZH
         fA/58+ZbAanVbzNPRMJSezeIaJjj85tpgtX1w+8sAbIAPs4u20mZ4bG+NOmUsPG3eko/
         4yRsc8+/4sDelfT1FCGQ8um722/DIAFdjlk5KmO9zmH4NtywednGFrHH9nyPbQAG2N7L
         ablMJVsycTXHNHZc3jH3LRPZ18Hxaq9UFAT3NbMhTbK+vDFEfAC4kOPEVGVVPdVgx62h
         1FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789803; x=1784394603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oYYmVHCEVxwHI677IftGmw1eu5lSQkq+tVMrat0xLs=;
        b=fPkz9+HiXv94a6PV+2BjW9T06hysqKknyUnOYNEVIfw7FS7wfVZXulkvaqH5NP9KV0
         CshUaf4v4kO6iUXeKl5awthKuS0rfJl8ms1SWl4T00LS7SiBOpRdySozsr0tEVSi/rsB
         XoxZiHapfiGAaLzhsdOcUBIvujGep+VQEylfFhjJQpbeGhLW3NlLyUfoN1X2abZcEnJJ
         cewz7sli7spO6KgNAwvxAg2pNqbe/mMec8mlwG4PWpsxoYeXo0qfhfGyqY6Ek2ltmd9b
         uKuYR+J3tMytfa1jzt8ZPIFC1hJHyiGJaKilfv3Qh9dyNlxRlZkKTx4OQvSYZcR3ZNb+
         aeYA==
X-Gm-Message-State: AOJu0Yw+cg/26YYNcfFtb98L3mTdWdE8dl7uxyabdmuZNxE0EppbMAPx
	H9X2pNNGTlCaFrBPwe4DQrNv1tGJz794XelNqzCAoogMV7mNQcGHuGzMNw4Y2WtDHG8hmMJLzyq
	AXIIBaFq8c5P6hbYtmBn+QlyOkCok/hFlW7EGbURcC8Bj8ziS9kt8PzXwQTvWso2uVIQr
X-Gm-Gg: AfdE7ckE9J2bAAmyxnASy2DuGzWSzhahUVCvy70g4Eg1uQpLy39SPfdBryNPAbxZajc
	lH1E3DhHFRQx0cSmr8uM1sbwQm2OTMkhdfQlYicmXte66X6V9Io2SrGLRbqWva7+e4hiG39eh7N
	hJLkUfOyy6lMXUGd+4V+BbNqZawZFpOLXnO67NhkZfi22O6CGZwUA+WFrA45RKNSti6+4W2gWqJ
	wSk0kPMEx8qQZMQJijcRZSoyul04UDsfRfoo3LRAVtZbIYmfGwyMVO74fbYnFlQ95JXviBpERxy
	PF42MSrx1BQRUeYS3Y0ObjcsDubafPvmk/+DMZ9n8uUxKLRT9m8I2KXV47rFFujKg79UEnKcPd9
	aqJD7oeRqtGu5bclSF76X4G2MZ/MjSgW6YvfdhdeqqNgK2AgDo/PRlbUsemB+wTXBPavoo3jmy8
	DtbzDL
X-Received: by 2002:a17:90b:3bd0:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38dc77f1987mr3410727a91.27.1783789803135;
        Sat, 11 Jul 2026 10:10:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3bd0:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-38dc77f1987mr3410701a91.27.1783789802710;
        Sat, 11 Jul 2026 10:10:02 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:02 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:50 +0530
Subject: [PATCH v5 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy
 for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-1-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=953;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=n32F+WQzySrIX5iVbHz5HeXrQoNod4+w3vtYMUcs8Ls=;
 b=07VqDUcV/spGZceZHaIll7lGdggV4+6c7o9rA4r2mRUlCFjAV72hmp3YJR7KCOFTBBAQM81y6
 A+69tU4wMQiBdK/WMLQChZZ0ata3wDYUuWRYPpk2jjqm7/2595C6kVh
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX1kl+Kdj1wg2v
 EbULlaVybwwLJHukkWEZ2MDGcutw/SwyaYL1SxWygZfNm+1NYHVwis2E2ThHYMKfmla4TOobNkD
 NC0Y1iQMeogQDY9QCD2dTOsdTRi1mR0=
X-Proofpoint-ORIG-GUID: RY-afAK2MjMqCHB-SC_ez7dBL482QuyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX/kWiKDBwrD6K
 Uf/z+dilU68mbbyXFE8xsCdo147c4VIhw/dPPFxNLkqTUDYEKS5FyYcKsRwVtWuJ++jBXhXjrto
 P0Z1Q6wKJehCVfawxFWok4Rqw12b9FtqiWiivBFH5FvQ1xSU2CRPMxHrZsd6Ugx8djSKrgQdq4m
 mMbFzPGrdNGG7Jow00JpSPnhbbBlWLybRXOAJDMxQuBdcEVvkMeNseXGkZgl3Cj2fiHlIMJF8nF
 OOzDb+vTZ+aU3n5xi+LKSu+ZMyJbwSA9TdGs9QOjgmqCymh96EHsxTcLcTtYpJd3R/id3wcSt0u
 rSiltCjHDT75oAhnrEHiTdoVR97NkRwaiSX4nT+PKI6dL2UWhwP49Mv+6XUnrh2Fv1+b4Ek4vPq
 INcSprozFMRko2Czv2MBZtfbqxvuNuZGSheayhDbKL8A1XQiIsdnP9oSFJB0uGGk/Ik8TejOO6L
 +fjVWpGCJg2L8r/r5HQ==
X-Proofpoint-GUID: RY-afAK2MjMqCHB-SC_ez7dBL482QuyD
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5278ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ybcDLLt5cEg1GZjoCqQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118483-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D51677425D2

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 449c2a7e5fec..001fd0ccc985 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1


