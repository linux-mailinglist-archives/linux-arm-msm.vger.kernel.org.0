Return-Path: <linux-arm-msm+bounces-112076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dqsoI/nZJ2pw3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:16:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5E65E338
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:16:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MIjSWwO7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A+JsuA9u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112076-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112076-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C44E316275C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1942E3F410F;
	Tue,  9 Jun 2026 09:09:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30323F39C1
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996157; cv=none; b=WFK2QEOH0eVX8ZaLYoZMOJ3YSh4SsIbB7OfC6781zkxOCVx0ojrq7KdzSMKC2b45SUFhBwgLg0ZnXm3wG49UNaq5fqHS95zPoZzASdeY80LsLO/pMpcNWxJzk9g7XrJObwLWqdGHjKCagstmE7PER9p626H7b1LBKxK+n7QFniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996157; c=relaxed/simple;
	bh=7nycLbB5N/ANW+yrShxOF4HkSLHBeldWJv9RE6+5o6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f14zpdZIS0cBG+qJClBrPUbOhRcsePne/s/An4LUyM4L/UmJk2Sy+5pMLQj6tv5nIrQSIvXXR2cDcC4f/bmCNybrCBL30KrYjT0AevTqPVqfM23h8XJwi/rSYS0C9ZBB45O/WR3ZCKiDK+lQgpOY0RW5JKE58C0uVx3q6cttDjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIjSWwO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+JsuA9u; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rTLG1517810
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+sjoZKS/O+bXIcNGVmUA+iLQ9nqB+G1aJChkyTGPl5U=; b=MIjSWwO7YL8EFDHi
	m5z3otatOHq+eJP16zDiQ4eEb+BM9On/cx0LkZjM/XOvgEPb6DX3J7+v6ZYx3OSX
	eHKGxQfhP/S2GgGJSRBtnloOpu7jD8gIiTDJHPYnP91hj6MRxWGuXt1vBzWXlpmM
	2xbW4oRKofad/TGaTNfJ/ayeii5OQIeRiPg3w3erq4KN82C0Xv4IQJflm8iFqnrk
	PMInjmJZnIhN9m/ah/Qf6dPB/GuOhP1l+SUdCsUh3E9frgN5JkvZMF+Mtj8gzinu
	tiGLEl5ufVNqjNjDi2e2dz5/oWSBPIv0lzj9a1l54x+VO9rAkDXlB1lgufCjsB9Z
	tKyOyQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8bmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:09:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304b8d0ee63so7409070eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996154; x=1781600954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+sjoZKS/O+bXIcNGVmUA+iLQ9nqB+G1aJChkyTGPl5U=;
        b=A+JsuA9uyd6TQsFQBGaDZbl9fYOafeqqUwf6xQAHNqkmVusX34/fxgTqblMmGfOWC7
         DVFt/wNRkelEILUqi98TCetk3TGyccN/QMvfigIMfm6fSWhgM6/IQJfYLU7TNXNCbpk3
         6QSHDwWkstktaV1K4B8BmMLbtEYpW7m2qnRXQiPHOJZYyX2HLCFXHxSCUsxIoBrWHXN9
         KnVuz5PEe+Wyn9MbiQEvXqLt/uDQBgKL5f9mpEP4HQT91sRInp/h8vzu4mofQYfH28zJ
         V+2NhPFVFkAEWVqCFrklbwZMenxH/iWD7ApSQinJdmofOWWTDmgfxdQSP9FUkaeYsXG2
         AJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996154; x=1781600954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sjoZKS/O+bXIcNGVmUA+iLQ9nqB+G1aJChkyTGPl5U=;
        b=ahmbcj7nqBKcNEo8loJ7b3bmFA5RxhV7oV9ieom0jZaLYxtU4rGWx+TlDbvvaTLsHK
         mMXNZtNuacRVy+QwgRPbZ114DblPyv9KvCP8bGAtj93KHp0lpe1DwUefqDleylH5Ygsr
         bTU7bqLuoIrzFPtgF+O2xcIh/gXue5uymtr1e1qriUHoc4FbbtV3ply8+IjTr8cVYOwv
         xbAksc+fNVDoGjADT+lslsJUQMLlFA2b9lJA73sy1eOffWr3AuxCFTDWc5Pd/ivnRtPK
         RZNMorijGnIaMP4DByCPD5Ws47+rY5c9DWhI8og0XL4hlaWcLO5MXGXAC15OANI8Crrl
         5c4A==
X-Forwarded-Encrypted: i=1; AFNElJ/bhmHZx6GL4qdCSm3zoHiGVA2sdvrA59z+qTAAa+Djyt51u3OC7RlSTQATjAx4+4+12ZQwDIGuZeIvlbI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx47UjmULXuv457advol05bH/Hg7WeDY0n+wHYSK6MJ2onDXXM
	OFPmXgq9SoBkxnL6/V8q+nnamNi8cEZiWaKREd3VxxIzBlm08u2opZcLNkiRRX56Zm0Ncc5eZt+
	Ih4B9rfPhpg7M3yyfxUWwFwEljbPOIWA6WzVsBLq4Sesnnrkm/OtMLrHxpCW639eOq5f8
X-Gm-Gg: Acq92OFT2KgW+QBwpK3iBDOGmkhvZgkhUT67mns14/dr+KXeiytUI6ntEtOlU30rlL5
	qJtFbfs9lPoUpRWGvxJ8vbUkjlkyn63QN5XZm7wdre//BMh6N8clU+UthVdr8MEJNkbJGZ9YWDT
	5v8f3g0zVGUsoMY0sMfp3rUSeqpyAaLMEu2G/UZN3pr1xbMb0Y4mhRB8o1O+s9/mtS6Vu5K4xAu
	AJrAtNLOt1alVn9LRiwS6GEEYNvXXennDst4n5+pblrWfadd+a14i/iG5IS9l6eAewbH8YoKwE+
	1OQXtLNlWrq3PlA5zSgPqVdJD7oITKk8RM2+PZr1XjtbhQsu1YIJ4f84XPw0Fs9r0D9O3vuj5L+
	Ywk6ir7x4cOo+l2J8HJyppr9nqRC44k1Cd1Fzco1TPr2XVNRTvB4KHsMkZrs+tDnJv2/Y8+VZ/D
	CMpGdhaks=
X-Received: by 2002:a05:7300:5b88:b0:304:9b48:53d8 with SMTP id 5a478bee46e88-3077b0689demr10301697eec.10.1780996154377;
        Tue, 09 Jun 2026 02:09:14 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:304:9b48:53d8 with SMTP id 5a478bee46e88-3077b0689demr10301653eec.10.1780996153872;
        Tue, 09 Jun 2026 02:09:13 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm19356606eec.20.2026.06.09.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:09:12 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 02:08:57 -0700
Subject: [PATCH 2/2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-crypto-v1-2-0f577df56a61@oss.qualcomm.com>
References: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
In-Reply-To: <20260609-maili-crypto-v1-0-0f577df56a61@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780996150; l=1073;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7nycLbB5N/ANW+yrShxOF4HkSLHBeldWJv9RE6+5o6s=;
 b=Qyaa6xPHtPHijQ6yZkM8EQIl9+4tNBo5rCOLMOeRWhBqlpPMXcpqKT5KDARaIOHjuQp31rGbI
 w+E8ajPqWirBswLJwa5XPbteTLp7ru85UZlctwPderqzAqb/9xWAWmc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: YXZiPWKw_qoHLT6nG_c9uG3zL0flQjgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX/KUHCzzM4vsc
 BuNKC40YPehmg5vbloGpETayT0Gqtakr/xKtKqAfx8c15QV1nOZ9rMMrvLS9wfBp7yBWi4YSEzY
 AqTMj0NsRdkuhowJxEEUfwa2c1+zY3mqa7Kni32yy+D6hvWIT/Y53SQHJiRKEpviV0jgZP1svzh
 8xuvhqJj1mmHp69uvzufJK39TEfP4ufFYfXrgZ9hAvAl2lHBhqmQz0/dGRx3CV7d5qVD82PFJ5x
 WJV6wW7kjeV/UIyabvQw3NiQM5vsPOQRoB2EBZggutKQJhy7Qf5+Y6rtChug6uGLwoXI2iuLNjz
 I2doEnzy2U+EBkEBAUHACj3jpsRwNrYHpz47jDMck7b4jU7MdaiJiVdkoMvY28kHtZcDz6Q7D7E
 BpvLxUpIJD37K1/RyZObIga3Xm+4Zn7gqefTxO3N1U51zBXiaJasebte1vx3qj1ntcWrJAUDD9E
 Rjkajii4ShvWMIvT4ng==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27d83b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NmGC_Fbkji3YBVCvtbwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: YXZiPWKw_qoHLT6nG_c9uG3zL0flQjgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112076-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3F5E65E338

The Inline Crypto Engine found on Maili SoC is compatible with the common
baseline IP 'qcom,inline-crypto-engine'. Hence, document the compatible as
such.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..c9489f6b8081 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
+          - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine

-- 
2.34.1


