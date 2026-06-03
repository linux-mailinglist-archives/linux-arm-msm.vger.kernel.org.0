Return-Path: <linux-arm-msm+bounces-110887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T2l5MRCdH2ptnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 05:18:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23365633D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 05:18:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F4542jOQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LkIq4ddq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8272430BAE89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 03:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D04A3E557A;
	Wed,  3 Jun 2026 03:11:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB953E6388
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 03:11:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456307; cv=none; b=j4kqRZ6sl6KYNimLJLKt+Wdajc0dinH/pyOq4/zeSc+W7PC9hKqF86Yzt7pW9LL1tchiJw4/7vqO5wTQCxr2e4giZOFuIny9tHepDxynO7brw4b6BfHuEkvtLT4fIe7NwO4155Bz6KGXxjG2pokEz4Vk8Rc41zhCwhnnUOfFeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456307; c=relaxed/simple;
	bh=JWkMSEdUJC3eIOPoQywgdm6Zs8Dl4vYLdmiv2fnsAQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lerHijI5jw0NDSYpPCcApGEXUxprnuGXUswUxgDjPnuTFJ5bxTUNa4PTw9Fzb2hNz1uG/a5blxzSv/nLsfVPtTQ/uVKx6ayQoVU3QaZ03mrDaSqNfQSJo+d1Y1b21OI+uwh6c1SXJ4XPQ8vZtcG2fWweSM90HSYHmdKVS98rn0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4542jOQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkIq4ddq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652LAxDw2767792
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 03:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mTg/SeZ1Yb69IE/Ax/FKhwDMoiyiFvRNLyas19q7uEg=; b=F4542jOQXrbSGirz
	1QCTZTJBY1CI7vXASr5UamyNclDmq9ncAG6EgMe+q9ZreN5Sm9fH5WtbItqUg7Kr
	IB8EOQNqe6DyjS92mNQEJFwu2QVG1Pc9nLAJYTPJdUGmlcyd6e514PVh7RgeW4cb
	cNOLcEBU2tmYPaW8zQ8Yieti0rqnJooNvr5IlsIuPZ0Wwluu21XvdaNW2OCugINT
	plbrvh8Z2w0Rla+22C07CmTfqFYgh5UtRLLHkCQj3cuxxTQdr+G4DDWzFcoPnhF/
	Km/QRTcnepkj4L62slN8187zWTzoIUdB4bq/0HGN90bP6VNXBy3TB39P3oBz+GvT
	uA2TGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus4v0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:11:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so5539596a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780456305; x=1781061105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTg/SeZ1Yb69IE/Ax/FKhwDMoiyiFvRNLyas19q7uEg=;
        b=LkIq4ddqIAvV55KMSnJTOybeAa2eWmQDg/S02VK5lvd1xBn46egdN/SmRbvx8xZm0w
         0q1p+QwdPgiPQQsXwPrvz3dT8OcIJ40txGWPIHSEDqQKpNXjCMOIhEzFqReKhxxWObNd
         I/SCMvUInh2CWdcnD9Z1SjSuwU2wLKcxpBmcHnU6f8L0PbHG5hrc9Jy+QImvMPeF6sie
         PTtlSqnX9fK4VX5sD4cWlA0P2Zs85pUkcA9yIPi6c8Ob1sf0g+6NxkxvbravUalxpBfE
         MfsUsSqNvjCoOaDmIn4AeIHRbFzGoFHc7N6/fVW7ZaPisunE0YlGNI53FR4WC6qrfUud
         BwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456305; x=1781061105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mTg/SeZ1Yb69IE/Ax/FKhwDMoiyiFvRNLyas19q7uEg=;
        b=A7OpHAfCxFTl3O3+AD5i+oJEEaC/d1+NxwOrYppmfXM3PaOlHCaTfNlpKLvorQxVyN
         7E++vKNy6RqVX5ldM3vH4I/R/aelk7TdrF8sRrahyNlFdI0aJlCqawk6UDBbcPbHeeGo
         GPU0DjJao1cSf94IxHv0E8wi1AuDKelqqYuJMhuMJHJOh2zfbqh2H2GF6AU9ssZtfDSd
         Rlqtw8E4tKW55TgNXnWDQuo0CV2k8OdO7Xct93sFKg0fW3wq4L1XKCXZmaH3F6HGbJYA
         JNoMblPJ3a1ImonHV3RyzrGIqV+o8giR9mEg3LjUCMDhpJBYknjlLJtjZvOK09s8uie2
         xc9A==
X-Gm-Message-State: AOJu0YwRpPAc8X0Er++VHq4JDDw3UUlSW4S9DQYPNPdXKbtfVofK2xM+
	lHeIA+HCI50iwwbJLDJ8DtdK29E1S/7lvwcbL/FJFNJ74FUZconqMjKmdeKyvNJUpwBXGZOahpS
	VKjwcChF9mEOMZbN+jCwZSvAt6TxLTVHwAbzvh1tJdS8VUrabGWYIUkFj1kFr2ND6zmQk
X-Gm-Gg: Acq92OEx5vkIvj1M69xFWiqGtXLNMhXY2sDBtmGtjPEJyWEcmgudwxuU1WC78/lA4vv
	W7h1guuI7aiuXOFlG9ysYRa9rTZGwUjqgcmDlk6Jia8+9d7Uje0FQIAlNZGabzvQ67cQZ/MNA0U
	2nf+owtaC1RQ3tLQligpgvmfhDGp8JghivWNjXCMh0NGFfyYmtPmvrvGVL+9eUJg+dNGOCnsdw4
	TCXGbex6XDciCEIUzr+09qnb3CLuiH7C6hKooryThUxtJGdWEd7YEGS1yDLLkW9+eRa/2NznP4n
	yQVuLLf7jp/aHzhM4qvjfIeBkTTu4Pp1dL6KS4PNgHKnUfXGuQMSqVJcczaXkO1uOyyG2xM4CBe
	ISCDhsXw5Vm6X2aQ9Oi2DLPYirdCoMC3LGsa8ei5LlIwH4pMm
X-Received: by 2002:a17:90a:f947:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-36e2eee0c89mr1476645a91.6.1780456305391;
        Tue, 02 Jun 2026 20:11:45 -0700 (PDT)
X-Received: by 2002:a17:90a:f947:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-36e2eee0c89mr1476615a91.6.1780456304989;
        Tue, 02 Jun 2026 20:11:44 -0700 (PDT)
Received: from [10.213.96.151] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a276892sm1269420a91.12.2026.06.02.20.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:11:44 -0700 (PDT)
From: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 08:41:19 +0530
Subject: [PATCH v3 1/2] dt-bindings: input: focaltech,ft8112: Add
 focaltech,ft3d81 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-1-3453ef577bcf@oss.qualcomm.com>
References: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
In-Reply-To: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780456295; l=1099;
 i=pradyot.nayak@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=JWkMSEdUJC3eIOPoQywgdm6Zs8Dl4vYLdmiv2fnsAQo=;
 b=cw2uKjwvqFL5f10qoh/zoW5te6N7Ap1mEA8Pi5I4DlkRTSmmb1on3/IMFr7tiOv7eHmoL3/rs
 zGV1lldDeM7CnqZPZlZEeL22ePA7cbzm8IPU8NvNZ88r2jDN4zqjSvl
X-Developer-Key: i=pradyot.nayak@oss.qualcomm.com; a=ed25519;
 pk=ZAwwH8thDSb6bq4dCgFHWr80BqB7MmUAKogkd9BsiXM=
X-Proofpoint-ORIG-GUID: IYhibCgPL7NuZvMB-r-XwjTJ_55_ewph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAyNiBTYWx0ZWRfX8NDYj74QuFtu
 ou+24Ao1P7HJiDOq/bm3YQgEjfyChaiL/eBG/JzQuhsPHXU9qK2uaGePPGjagQ6J3Tp61TLsgQJ
 Jf7MB9jtFXVeC6nk1+5rvsgup3VKDhTfT4xEyCmjFj6Cqa/tH3cwhFT7+abLx9wukp9piA8ky6H
 fPFOXrjQ+62XksqDibx412dnXgah4O7viypgHpFGvjekeVXTNqiJdl6TZSUBTru5OZUMeEQMRqS
 MU4pnxMtenmKDqjEQtDd6JujkE530On8kszHGZQJ3QkTwgi5LoMCu4p/g0/gR2fzRERTnPIjof8
 OYLJCEiozGYhhuRiRcsvDLL2X/lfKvpEOe3B1AmTl12+qJNHJGu+Z3rcmbxchHU1jhr9po82KOH
 Fdu33HR+tzEm4R00HFIksIU6FpXbxGlxIVqqoCSpvDp2ZgKzpUf0OFnIclzzVZRMhzH57aMQQ5L
 yjCcRlyMZstOjl3en/g==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1f9b72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dn7p_KMudBFJuDJgD_8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IYhibCgPL7NuZvMB-r-XwjTJ_55_ewph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110887-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Daniel_Peng@pegatron.corp-partner.google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:pradyot.nayak@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pegatron.corp-partner.google.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pradyot.nayak@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23365633D34

The Focaltech ft3d81 is fully compatible with the ft8112 i.e.
it uses the same I2C-HID protocol and the same power-on/reset sequencing,
DT nodes for boards carrying an ft3d81,can therefore bind to the existing
ft8112 driver without any additional changes.

Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
index 197f30b14d45..5ffa1246aba1 100644
--- a/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
+++ b/Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
@@ -18,8 +18,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - focaltech,ft8112
+    oneOf:
+      - items:
+          - enum:
+              - focaltech,ft3d81
+          - const: focaltech,ft8112
+      - enum:
+          - focaltech,ft8112
 
   reg:
     maxItems: 1

-- 
2.43.0


