Return-Path: <linux-arm-msm+bounces-104396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPdLOnMr62keJgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:36:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C80C45B913
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50B753016D29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93EF37C0ED;
	Fri, 24 Apr 2026 08:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYsxF/M2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ni2XP+U5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AAF344DA2
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019737; cv=none; b=ImvNK6cTYN+E9x/fWz3bqskorpUe8dkR87FkFCijAkiqEIXrC04gkWNEHmS2VITxMKOmAu3JmBPddzMg00pxxlcpGd7QedbUqXRDb5ty44Hr6GDUpb9TOjYw6qc+5bOmF1dYltdXcltV4TFLkNhIuISJwu0l9db38kcbuyJKkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019737; c=relaxed/simple;
	bh=dtdz/yukTGy3rf+mwTbyo7Nqf64WPlvGCi80RhNRT1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nT5U/D5nRocKINYw4GikOEG1o7RDR8hGtxgXV+PcAUsyKkrADIbceqFgqBCg4RXLPMWi5S6GzlCuYgSiBB9m28/XAmFwhV1lAhDtxD6zvPzHu2PaR0md3rlhJPbuHcriobM1K452977DS/w8/7uN+xlgYBUIoHkud6L6r4OukxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYsxF/M2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ni2XP+U5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7eiUd1888426
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11xqZkhDlvKiZpuCn2yF3jv/fK0mKPjC429JFqQj6RA=; b=WYsxF/M2c6N8Y9pB
	VNWsgujJt0lda4ZJlNLhxqAdM8r4f3uNegF9LsisficnkDhp+1SusKyo37A7TQoj
	4sJ8Po9EerVHPlYm0ulnIItVNvfid8EwzJ7qCJ9lPJtwDF2l4nCfnYgeqF7/+Dgk
	d2Zfu2x83KrxaJZic2C3072no9LIRHrkdBiks5DV3OC+Fcur2pvL2hvcjFL4J84D
	UfiOHa/q3XGnZwdhDsSKyNk9cD19sDax/cUttYfl3hKtrvJM3HqjzTvAJYWKfUix
	ny9DsP/Kg+EAyo7hbJ/yD1CvhNmc+cwT3IEP/UqEPHSeHk2g2pwQOEVwJlQwI4Nf
	Q1oG0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dummx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:35:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7c904d476so3007225ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777019732; x=1777624532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11xqZkhDlvKiZpuCn2yF3jv/fK0mKPjC429JFqQj6RA=;
        b=Ni2XP+U53HM2lpO1HC7LaEprqJGmoZkBJdLYmqBeKFSv5DGuZiaYQ4LNZ9yJE9ADXv
         8E+6b4c9dmYGpLztvKTXzWpOMd6cmOhMgGoPen1fqvYGALzXz8oF5PguQMvEMGtLbq6T
         AIxfYWm3AZU0QMqt4+HGY+aYSUd0UczPtJ704P8Me42F7kZEudnKRk466ppBwb9d+pGJ
         KtkfMG/5OsN+bF5UzXbM4GQdqmcOuScljhvzAr4Nm2QTmf3BZFzAClGAm4/0k5ME1GBj
         2ILxZKLN3bTSAQk3LA5LKdhlIFhwJGcIF00JfHmrz7aIESEuM0WbCAu1Myxr8L8eUrbm
         tKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019732; x=1777624532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11xqZkhDlvKiZpuCn2yF3jv/fK0mKPjC429JFqQj6RA=;
        b=iNaFSd+pjIySvbcSGm5mOz//+22GV1gQ4kzCJ1GXLSp14gbNC0YTcNjHGdjEHRISkK
         B6CJQQ+U8m8GjlBmlQS3A112WilpcaB5EWhzXFSRYOIE4V+H+cMEp+lNdVdrSzyulamw
         digZrh2mVZd4/GTm42/gthXwQOWvDW4doGc0wIKu9qGxJjkmqYEonRso2uuLPGpiXq5c
         IBr+kfNvUJBfBJB+fuVxMq1MhUrpK8zu/Uw7DGoU4+in2xdBLlM5p7SoCOQ4esjFzZXa
         gj8Ph+x9a8x1kHF32pb+oHEh0SV2rsnFsPQxliAOpF9pobasgo8AV01xm2bMBppRTd6x
         F0pg==
X-Forwarded-Encrypted: i=1; AFNElJ/OlLQRSmUk9C0vHwhYXpcgzrfoy1PmTgOO3rLRWlRhAomJNSQDs84xcTwLZxfoFRNMLctkaoIQmha7k6Yq@vger.kernel.org
X-Gm-Message-State: AOJu0YyUf9/9xVnLeF2Y2VH5OpQ3Rc8iUmsya7Jtm7q86KXdtdjbdeVA
	m9fkcSgN8dmXZU470yUNt3HglqMCSmQbp7UuYQB9Ol6d7iuvq1ErcPLH5nttyDdgDGaCRk4aBZt
	rSTJtKwTMKWgcrItEeH/YQnftTq5FqAx67+zObYnZClZ35AyitcDlx4GE/iyb6qAKWJmC
X-Gm-Gg: AeBDieuqQP9SmRS6qegYBfi/pulUcWn3dfr67H07CrHLMXoHaWVtPoyme6EoW71iAFl
	tsGBULz4PgW4IQEaXaRKTbJWl70dFerfYrfuqlMJqIUxcSCBJyMRfddnwnjhQdBqQaVFe5XOV6v
	/yB6h5/1cv/b0paZlsVtNof1xeonsWVRT23+yc026mHiqOGmITlGoCMW24Fv0bCSg7g2sph4YYI
	rZjiaECFUdhmRTCTV61cnxe+npdZQR3kIUCD6rC4mW6Qz+BgRlyKN6Qkomql6h2Iomyrlwn/Bli
	FZH1qE+yr6faipcqpR53rpitjH9xLNJ8N+crpLRBMGX5fgN7t9X7smXK6Rk5BSq5ol5QpHXD3wE
	2W/g/c4mQv3ZkBypDdJH5IK2FPgDYZ+9t8vRzIZafiNTBd2HbnZaK8MbK8Q==
X-Received: by 2002:a17:903:3905:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b5f9ffe73amr295732915ad.41.1777019732388;
        Fri, 24 Apr 2026 01:35:32 -0700 (PDT)
X-Received: by 2002:a17:903:3905:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b5f9ffe73amr295732405ad.41.1777019731856;
        Fri, 24 Apr 2026 01:35:31 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm211389495ad.72.2026.04.24.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:35:31 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:05:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,prng: Document Glymur
 TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-glymur_trng_enablement-v2-1-0603cbe68440@oss.qualcomm.com>
References: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
In-Reply-To: <20260424-glymur_trng_enablement-v2-0-0603cbe68440@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777019721; l=879;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=dtdz/yukTGy3rf+mwTbyo7Nqf64WPlvGCi80RhNRT1c=;
 b=o3+GM87zYpuFf61xL2hYMWP1IKf/7pTwrji9hnNyymjO+JR2f+AkbEVLwXKnn8XobOSqGTrQ6
 YWe/xKzaH1dB8dX+xAEPGJrl/4vfUapk1BWIFKyM31dWhLWcJlf6PpE
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: ktUbZXuE4csCK0ZBehHd_53H7uRYFqHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3OSBTYWx0ZWRfXy+/owItFdGqO
 UxMFcYw2Gjnd7YUkHHd5FiQbLVyvFlM9nRDADOyJhZC01tQ8+H8S6fUrvtTtvBBaLXeuVHVzVHT
 wRJJd/U9YFP8Y0eEQ6p5LPujjF/Dh1JEI3c0dTzNXvmnzoO4I6CTVYl02rGBhSFQGsHZBJBeRZV
 hy8Gn33fMBSy/LVyvoveOQYWRwxmpeo1mYqbe+igtvdBLj40yboWkHxcTDISJKQOZX7kE7htXgv
 fPBV2qgQz2P2j7aEYhiL7D5R8Cha6zou2jLmkLa0fMPkphRDKLoeo/22ceK8OeeojWm9yp4PDJ4
 TCydyk5mB4P2CraYoUG5yASk9ADwLRhiSVREiF9VgdvK1cs1Ti4AkBDrzO+UDsZoSMxz3u5LxLN
 I7eSAAiHs2gARD7Jr3VlKT4q7wHTXDIaxRmP8iHIVIGDsIw+HlWFXIAFk4D6/kA8ghnJXyDVJF/
 AjIsmTllB5QZcSQ9GvQ==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb2b55 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2IqcgDMfN6YEDlzvvDkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ktUbZXuE4csCK0ZBehHd_53H7uRYFqHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240079
X-Rspamd-Queue-Id: 1C80C45B913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104396-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document glymur compatible for the True Random Number Generator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..498d6914135e 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,glymur-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

-- 
2.34.1


