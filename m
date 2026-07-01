Return-Path: <linux-arm-msm+bounces-115696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FrBBKvgCRWoL5AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:07:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F284F6ED0E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mOpA4QjW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hQ0V9bkE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115696-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115696-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FB0A3031112
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CF4480954;
	Wed,  1 Jul 2026 12:06:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5701F478E2C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 12:06:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907561; cv=none; b=MdXrJiczq9UnWAkVMHWc7u7JymNo4xth1YzujjpRkEOi1sJTnkIXMwH43i/fusiFQ2ezcSY8sLoylUAZhuJ3YnCicP930zTwihQM1HyRWGEcZe61jJwRAjfbgCatNg6vJLa0alqBvI3c8EJOu2j0zhRmC+mz8pd+u5G9KMpRigs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907561; c=relaxed/simple;
	bh=5Fpg+lE2dS1+9fTLofM32JUk5LZPQhgZ9xjeo1iWWzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EKIlId7jBcTvJNFy8jIj3TWm7NYtNAAjeOWzZ6+IpVp66LVUENzLO8FBfJqxMJvdr9GXBDmo2uRG1rOY6BD182yjGsgtofXSqpGDDDr4DzmsLcsix/uFu0pgB6YHeMpIiEoOitm8VKNS2b81X8EeoktJKoG0w5MZ+IRUi4ST86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOpA4QjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ0V9bkE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8xH9753602
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 12:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9oPQJDeRVnr9zhIkIVazOc
	q2QmQHV7BINRDOq1LqIgI=; b=mOpA4QjWdsSSTXcmQ36N6wWsLrnt8THvKtffpo
	ooR2s32ztaYROtbotisB/mO4ztisFmMVPhovZ2nrhCacvBWzuiP1K5LlUd5j2NOj
	Pynkck18yhY3LywJVRVdkoVlFtFR4ZqWWFvZt71Woh2LGRaHl5VMudi4fHuzMzAY
	+D0P4V9iVB+FuI8DUXwqAbXf46w3FLzv6x4U/4jKfZ9PIUpF3w0IGrFkZ4AJcE1C
	ue5tIbbtUKvfumODSAFjNhRzslhhUMs6+Cla4zph4E5G2H4+rr/G305BxJA1GlI+
	k7ndcKOD5Ht+NS09G5ZtPdTYlXAHvQoZUeVslE/XsxqBTTKQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2kp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:05:59 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd79bf6152so542356e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782907558; x=1783512358; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9oPQJDeRVnr9zhIkIVazOcq2QmQHV7BINRDOq1LqIgI=;
        b=hQ0V9bkEmePvwmutKRpo5uaQalpA3g+pMBDDQLOf/RNqD8aEO51F/0ScAMGeZQOL/5
         Hfp1RBdc1SDIYtdh+9FrsX4WkWe459Wnx70+vnhkAVMsqTcPOY4a9F27KIRciLbnxTPs
         IylCKK3Cb6p6a2O6spSrKnBC96CjFOx9liy9AjQOWqUbFdm4ISed5ERnBsmrobC5dDNZ
         GHJy2J6/aenNKfY4fv2m4+la6xKdVIZxY6TnzQcGnmAMKN9rFtHCfDVLA15VkxloCK1i
         A6nEQnAoegng5XJTBdsKrdWA4FSceRMA09T/m80gUb2REpN3lvMG2evxNrCCTfz3XRhG
         wB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907558; x=1783512358;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9oPQJDeRVnr9zhIkIVazOcq2QmQHV7BINRDOq1LqIgI=;
        b=SdZErYwZLnf50I7b+vJwZZ2DbKmdwuvQnGOYnzvAKIVAFkvcv/txQv4B3nC5vnzLFt
         U+NqSitsX5/M9BQVhlQ4nT56GjIC20wS7mvX5pteBfSD/5btizQkdvxvoQEbe99yCmD5
         mK+K1hxHTw/EQcLy7VAR+dnjpvJwljtJrOgo8okoLlNaUTgySuULIXohHeIWXzl6B1jC
         v2GDedu2KrblCR1MP2HV8lqGMTb8TqGE5/giui5ZH2P6xX9hurwER4p3PQXacEnu3nUi
         SfhOe6b0arOxnR7j/W5WZgSBo/dbHeivhtDnpcCwEj8LyI1zkwfX5d5pMsl/AGb7WwGg
         8sWA==
X-Gm-Message-State: AOJu0YyW6dD9XuKI4GJSxR87phVpUFH1inajzzInRCf1rdf91O6/F7AC
	AFwX144hwT9RbD8CwvHdq0/47b2FXCZGKyjM+kt4RDiUbKbZgrhn10+HH+HEHqnACVhFwt/IOEZ
	NmTAk7H1Tka+vg6yW1OudjPqrvrEMWT9wCg7Q8flkEjvuiUodiL11B7r6bvmdabYnCXfs
X-Gm-Gg: AfdE7ckQnE5xv43lcbBm+5104WWBGTaOsZoNuT/BK+8Ae4BApvImy4hp/votFr+6I8Q
	zaA7wis4HOJFJMmDzMeUsJe6h4Aunxr169yG7EnTC0Uv5RQ5rIqOIU+/KEpUENdxQxYVEl9bX0T
	qxqPzjQUwHPnxODzRq4m56O40p4zJvmZ0EzFQ9sZs9tPfPSfLWiNaW1btaqxhz+os7fLB3Dpe6U
	chJVlWQuTnjLICJBC9YHY/1leKxV49FAfedQM/c3q2TIhWkKvpzApbmBQM2VZORHTKKt1UtJSk/
	oV6Qhumv0Q8mfNh1/+P7sDP30D7TXi3LpyPRprF2ZY5Ev8ElnVitvVLLI2Grfsvj5gnWoOgwrYT
	G2RNTFXG0XGh4Hwg=
X-Received: by 2002:a05:6122:16a2:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5bde3a39034mr169126e0c.2.1782907558215;
        Wed, 01 Jul 2026 05:05:58 -0700 (PDT)
X-Received: by 2002:a05:6122:16a2:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5bde3a39034mr169098e0c.2.1782907557598;
        Wed, 01 Jul 2026 05:05:57 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475643ce016sm16768744f8f.16.2026.07.01.05.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:05:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:05:49 +0300
Subject: [PATCH] arm64: dts: qcom: eliza: Describe the ADSP GPR node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJwCRWoC/yXMQQ6CMBBA0auQWTtJS4kNXsW4qJ0BhiBgB42Bc
 HerLN/i/w2Uk7DCpdgg8VtUpjHDngqIXRhbRqFsKE15Nt5YpEXxGacH8iBrwECE7Zyw8d5W5Oq
 anYMcz4kb+fzH19thfd17jsvvBvv+Bal6dCh6AAAA
X-Change-ID: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Fpg+lE2dS1+9fTLofM32JUk5LZPQhgZ9xjeo1iWWzY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqRQKeJtJq6yMQF7kJgQl6iEJ2xvj0T25sV0Tr1
 8TiQjQogHyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakUCngAKCRAbX0TJAJUV
 Vn+lD/4n4l9MVZR2FuK/LRwk4bj/zRkKwui0lELH4f7+STZkbLMTXsGnVJn7yl+QgJysWJ7THoH
 dQqYpscxTUaS8q3ZnF+LUs80pcRxM3gZ8yMD3rRQufu/gWbQoPCklGjoTBnzJF4JQ0dempQIRil
 xRmtlkI7HLRbXB0NjedGaaJcsLgIrQHEjH0RCyUGqbQ00nX8ScmAZc+QO00Gsbei3wceHlYRtsA
 wEQDaTD1BVTvT0tmUENovOdJ8L3DDKEdhcnOMMAzrnK+/3VTSNnfQCHrKPI60Uc5GO7lb/PP2IN
 CdeZxdlDOyJV6gZKexni/88HyDEZBkTJ21pvqJpTAbAe31hz3pTD6ajl9ELWkBrKpLAJLcdZTfZ
 cz/DvbMJUh5kc5Gk1vGnl4U6I/GvuicvkY/XDXnxIHRP1BhN5l8D1aqPxePKUo0PDLLD7u70NoH
 8AZraCOtheEOk0u9+eFOTlclk9XC2D9ouqCC4JX9+5pGih0fNZ9jYjiNlLPUO4Xnl5sfAdDPXKS
 BioFwybeQHW8IVpubEW+7Otk51ytOlYJ/agtuXfSN+8nbFcnOplCQMNmGSQAlYCDU/F1N81d3Pm
 DDorzob8vZEMVR8iZZCVFOieOO8ULWttlLEOZWJO0aXRXd3qUexuqihnqIH6+rp2YayQq22bi2F
 Y6NXoVrR7c5fjLg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: q53SZu_aAgMOiVYaSZ98Loz4WAs3rBPm
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a4502a7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qrSFy22aXZ2qLtEdJKwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyNyBTYWx0ZWRfX6mgrrEf/uCsm
 2/h2TFJIqKXHNMqwOsP51YQbsNbV2hMNvw1Z5WIAif5vI7PMl2bNZOyBfW/2axWSJDyrb0oSizZ
 7oggb8lBsE0gfEa5hpdh6Z68jRj4NF24hOvkqTq58rquT4Dy1RS36b3V01YQwnRver9rWfFbRwK
 Q3ohE3KvMCWd34Qpk38E9W7E3P117ZlKGNDd4wBYbmYQ4ltrlz+UhOuf3w0yIccc42WK6Uofkaj
 HksRjn4K4Slp5omBrOgdSEsGvhSk+mIIrbodcq++tDwSNPPRHmxpX6+p7qMwPGAVEXPNoeuN0F3
 rUAwskF4bsGqbxrRmwqyhKZN2IcnJCt6S/qam76iCFPzm8ty9I0gccjfJMAHBkRlhHhbNh4Kf0W
 h3nx5/q/qIPlbWXXLVbKotSZ7Ne5gER1ye9gjJxv7JXaDEr0Jc3IubhJGrvZGrULCVfB5U/Eo/U
 JETxsZUVGCUSpMUoAig==
X-Proofpoint-ORIG-GUID: q53SZu_aAgMOiVYaSZ98Loz4WAs3rBPm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyNyBTYWx0ZWRfX4hER2Q7dTPP2
 iTij13Qqv3bdTVaDnk9XrSvXIvkloqwLnkjpBbE540hkT9p6kS9q46fAWvBOhaL+ikb291DNA0e
 qzcVYbiZFtnebuZMH1tgj41oPBZzMKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F284F6ED0E2

Describe the ADSP Generic Packet Router (GPR) devicetree node as
part of audio subsystem on Qualcomm Eliza SoC.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e..8dbfd0504598 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -2014,6 +2015,46 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


