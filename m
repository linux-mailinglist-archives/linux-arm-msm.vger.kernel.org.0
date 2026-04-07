Return-Path: <linux-arm-msm+bounces-102177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFqyFRcM1WlQzwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:52:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F43AF809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E521D30131C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC463B895B;
	Tue,  7 Apr 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pwy2/zcS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0g/rxvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC493B7B99
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569919; cv=none; b=omOZKxqYFtIM0LXLs7TWnsh7Og6BZl+4sybk3DbyNwaHPdDzMtqC1dPYxQ7CkKKsfIJkWpjsXZZd2ZXFAqm/a8+5nAYiR8N1YiOkjCQlMlInjmZ1M9bOd1XhwWzJksY3z6g6yxEnk8dK9IRSiD5ba59kVpqNfm64B+JK730U0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569919; c=relaxed/simple;
	bh=VKT6Lv6NbB7E+1kObG5zp/SNkC85+ekmkpxBJAl2+Ww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mXW8C7x2bcpToWGRutjBia7eDRDFLkW1txhcvXQZPkzt4mUhSKDCj7mjuuKXBTWw0dbV0C55uZfl6tGmrZ5dcCLFsSiYg5vImxCqi7VAY1LwJdTjAHtT70iq2dASkllRDxYuzFGyE1LzChT7hCPvQ70eTVLszrbR6ebNtE2m7b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pwy2/zcS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0g/rxvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D7HhQ2550321
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZZgjNY3tcHCvGFXadvGPUU
	gyvBksPRO94RQTSAaKYmg=; b=Pwy2/zcSIMkd/gleQI+VNeIu3Y/Y3bBSWQx3z0
	jWFDd8/P0ktTn7KSs8XEZkz0kZLxwVIohFwdTsdrPsFRG/rlhl5TE/MDP69/b3wE
	R7pqVC9HSHrQ5J3GnlmYVj7CnVzWXQr+hka3X+EiQSW/5wr1JQ2/fRIbxxGfrhKn
	oqNwOatSYy4xwFzlwQaYHCyciHqyjKjne+3Aka3Swvdcdqz+q8MuJkLrHd+xDhEY
	8shuIv37pj3YDe6Xsl67vAitk80P93/pCZMRCO1fbuU6QoonxnwWw3ROgLUaldD5
	lmwo6cAYX53ME5TyLo+ojDLxNnM6ptTtUnUXTk2WNO5A/q8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreb04x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:51:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so137960451cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775569917; x=1776174717; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZgjNY3tcHCvGFXadvGPUUgyvBksPRO94RQTSAaKYmg=;
        b=L0g/rxvZ4VOl3fqoby4HVWgHkyULV4gGXVPaYQTmYALI1kIS7BjCUWRDVy10g1XyNb
         ZWqD9H2Fuba4rb9h/pIYU78128fGO3S+kERCT+9a4XVUMtSrmDny2+Uybolhr+chRwH2
         /KmKN919204ppLmySZb8KL26iswDs61rpC6blEicdvn5ZnFw5akhNo/Hx7XuA53hwuPW
         Lx1XoCVUO5d84jy5T4d/nVMgF6Eh4vZKr8f+QL/7wLQM884KeCtpkMr5Fh9Yffy2gNZK
         UvcduiqAtrIsHSBUO2of96vUeiKyFWJIPSVG+UZtbMfaiTeh/J6PRTfwvOAE+En6oOag
         eb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569917; x=1776174717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZgjNY3tcHCvGFXadvGPUUgyvBksPRO94RQTSAaKYmg=;
        b=ILqPDlkPbHM8HGE84leEb4BpqFASqlztu9csoAM+aVKftXvhEeLnLKz0nIXdqZhk0l
         zBEkMungZtXrQ7qhZD+1l2uvnjfcfhvWr+f66fNbKbumQs09MQsmUAcqXfatj1wkaLId
         CnvHFT8Pep0hdJ2Knprk0LWCPyHDvy9+GMQyCC2FuN75Q+HmEUP/rxyXF3iEjOhU3e4A
         Hnik9jVrZdgyzSxwt5mUvw20VX9+MRenR9wGlaypocF3xZ7z/V7N79jWh6VGU5awm10M
         QpSr/OLIwEGTG1DqjL4rNWpmMKBEGVcoZCAaJNq1KJUwv02kE/TaIcC2UWyON5b5hhMr
         D3DQ==
X-Gm-Message-State: AOJu0Ywgp50YFTneqrEMQTKUXAOXOccYas3G7QRTxOOnGUEwzGnpTleQ
	36BOYhEIKJH33aNx9NkBPpj5iDq5FI/opK8Yhnj7LOTT+4btEUm965N4egO9ypWjbxjyIHQnOX6
	kOLLo0okfvYl+CU8i8DPiEA/0JvAp0ymq/DHtMPafsHGLDYLSCRxpHS1uaSwIGVzY8J18
X-Gm-Gg: AeBDies8o7qNILhvXgl1fhAHOcdYvx52lWKOD66olAre9701XqNcOQ/Hx6d+1uCxBPx
	hZvFytcsAjd87cJAzon7yOqWQggV0lYGY6iPDG8dvZjIRZAZQujjZhAGkEoZswWxmhmSJzgDvVG
	w0dX2RbGr801X8aD/Hu4W8M/o3xNmSOD1J3/x6Z/8p5OdOY8BEXdfU4MJk+0GOJPnSLUtV2sOWV
	jWn0qVKc2SbbewvsEdKxJeMYyGykAbHkJRNAuCmIItsBaZhvHBe1aZkLf729B9N1rk4/f+aGvtn
	JW06DsLRJygdOxeQmPzc/K/ngjTFG1VSF08w4Bp5UF1zXQ1HR/kxuEZh1Yu+UqSKQCvsMfh1Yxn
	S5wvGlrpv2wdQ2Iu/r9c93P/iA2NnA0SBXI9Yy+9HgbRi
X-Received: by 2002:a05:622a:2cb:b0:50d:987c:8174 with SMTP id d75a77b69052e-50d987c868emr68291401cf.4.1775569916649;
        Tue, 07 Apr 2026 06:51:56 -0700 (PDT)
X-Received: by 2002:a05:622a:2cb:b0:50d:987c:8174 with SMTP id d75a77b69052e-50d987c868emr68291131cf.4.1775569916187;
        Tue, 07 Apr 2026 06:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm49788420f8f.22.2026.04.07.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:51:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/2] crypto: qcom: Add QCE for Eliza SoC
Date: Tue, 07 Apr 2026 15:51:41 +0200
Message-Id: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0L1WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNz3eSiyoKSfN3C5Pxc3dSczKpEXcO0NENLY0sLc2MzcyWgvoKi1LT
 MCrCZ0bEQfnFpUlZqcgnIIKXaWgBdO7hZdQAAAA==
X-Change-ID: 20260407-crypto-qcom-eliza-1ff193987367
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=605;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VKT6Lv6NbB7E+1kObG5zp/SNkC85+ekmkpxBJAl2+Ww=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1Qv1jJgjplYb7TmTJtxJiQtsNpX7WcgDH6jRl
 GSchI0Sm0iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadUL9QAKCRDBN2bmhouD
 1w8hD/sH2Oa6/pY06iBdTJBp/Dig2EFC3lTjVQ5XgVdWWvg+285IE5K1h3X/UPq9w84LrxiZyAC
 BDzIyYQO+ntjkq0lqQRq8uJ9JfNxQtzi2LY+Ud3TTrzeOKlNVajjPPyXUvoCAmtOwFjI9Tvlx6k
 WLGoKitsS4/FQJFTXuinlRrFypSLojaUSNIeXgNBB5E6d+EaCzGOR0Qik0cYIVDn18jQ2eFP2F4
 7hpwhYXMlk9vvgWUvYHhmf+VqJ8+3Iv4H7MkPye57QSVG8z0yitM7hetlXpml67mwYaAj/U9rZr
 Bi5fMMAjQ2xzMUyUqk4/vikRWHWmw2zsu5y1Rcg9ndO+Khi+QuXFh0t3rerN3q/BC/SOmAv/KYH
 FNFqv6kvBbjnVbKtDuxmS3+6L+nd+f2Yx6+7BeYEbw52Dz8BSFSWkLTzh43WKw6sKD3kY6XyEYJ
 +919D2RlWRT6bjg2Z7ZKMBJ3L06lEinwiY026jQYQV1mCnkRUOmxJEByRFAEy4GlIuyna/bDYaq
 NlKOtwg7BVUkWJg2WAmQiDiXyWCdD/sO8E6jgYQPswTL2mzQ+7bR+jHvEUXwKh1Tkh547IKpjEH
 ovd1n7Kp1HWNKeo8t8dMNb5gpL95c9GHill0i9awwV1HVxgBnSJLqKkYeD7t4tGQn1Cnjt9WXhV
 PyS+3HfRRQQeCBg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d50bfd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5M5WBOUQrjO2H3lggUIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: iJCuOJJv2tU883xx8J4gk-AjB_B2Zv5N
X-Proofpoint-ORIG-GUID: iJCuOJJv2tU883xx8J4gk-AjB_B2Zv5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyOCBTYWx0ZWRfX28pJwzJp/04X
 QF5gUHo6dS9XwoH7lyJSGiNoJ39RdhcoOh3i4QhNrsR8zjFYAGt6xXNq8Hiy5Ac4CUglkRUd2Kx
 FKlFKfAt8JCq+RbDuXnRJeqqJEi5WCQwZOpvRVJR2VNoWgbbj/802wzashPPa9cuFhGdpxZ5yxy
 gFniDuyNdwVzsbVo2prPbH+UCenHW8BnlzYB6lxApX9FNrpAwrEPauK13bivDsjUtN5LdrM8U3B
 H2ffEvTuoTfZksQpeDesfUnOy9KDj801T7bxlQ0BuByaRxmNu2MfemMvjRu2XdRWxMPq8NwgkUS
 /vc0H0GjFqfphAn76vRF210way351Qp7R0w8/sh5FPWqML3J3KB3BB8lZYqGarW6pRfT+10JuQ9
 In+uOQzhkNSLca3ClmWYJQBiIquZXXiHATsoqacVdu6s+dbqEIHaMzjiebuB+RERrCYydpIgnff
 L8mHWWZO4EuoJXGRHzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070128
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102177-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 578F43AF809
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bindings for Qualcomm Eliza SoC crypto engine and DTS patch.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
      arm64: dts: qcom: eliza: Add QCE crypto

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260407-crypto-qcom-eliza-1ff193987367

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


