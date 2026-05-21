Return-Path: <linux-arm-msm+bounces-109091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE3/MbsLD2omEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:42:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8035A61E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C507B318D642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240B7175A79;
	Thu, 21 May 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKu5zN1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZRNevK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1525B0A1
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369489; cv=none; b=dVUj06VYGc3ehTYg3WOsw/riVxCTx+VbtJJSXYaOWLoptMgqqQ5VCkphw2nf5V7LeC/a/VEYbsESBaeMvF+gbLIKqSnlKzU4bjPG3o1E0bpoVdKWfHHVQW9OFVCNOBkSVotIyqHUfihQHtd/49dGt9Lg6CiB4IF9cJOu18cUCq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369489; c=relaxed/simple;
	bh=CXMPeU2b4u3KDwV+Fif8DPMBH5t/Q1IwFXg+RkJ1uCk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uJLXuO5kUd6PkBaOO9E4c+XUCC9ymrf+zVen9Ox7wioX/9RF/8lMStPjex7IOQCVD/FKYXnEPSS8uwKpj4wrv/cqht3655nJVazgLhcCaaWOFGU4vfXmJK3iIR5fz9tGjuPXo+EAsuJ/t9cuwITFSqVMtdzMoCQfx4V7P8hSyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKu5zN1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZRNevK0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99w132491909
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L8fZGa6Xq+LlaWCk3IUJJU
	Ra8z19KN5KTwoJE6k81ds=; b=LKu5zN1F2lAVDYG2PTysD0goayaWobN3g4akGg
	Zq+47VEvXrLBPBvSqGnt54DZ+FTKODb7mAoKMVo8ZyfZdtwT6iX5CK8DdiloGRKn
	Q58mFGNIKxHDP2kTUvbKvQx4R33RxEpuxCjhBoZ02PnNGSaI/b9Jq7mBgjIV1Hbl
	IZkvAxq2n0WYpPMEtl92W4AK1s6QYv96GHvD2DKoWhem7rz53gbiLbNQMouyFJtc
	xRbdCYt/wNzDuc9AgSyzuJlShZn0B3/o3DzA7usIS7NaKkUVXns95Aw5cxYP91tO
	LYEw8x/0Yc7s0bsAZLqC9gB232HfcA4zZgfTlv8ZY+jUuCeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j54g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:18:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837cc5bc6deso3798022b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779369486; x=1779974286; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L8fZGa6Xq+LlaWCk3IUJJURa8z19KN5KTwoJE6k81ds=;
        b=MZRNevK0Ay07tFI7GOjH7hDUrzqkZrMlG5WdzSNxJdfg/dJNXNR9OwOCovaTLc4Uy9
         FsOdfqeT6HrC7oY6PgL28OFKloBj2acVvaA7hS0wZ6nYZO+nWk8YUCcgx4N+A26506xy
         7uwgQJdK3YuWymwLzGnjqlPJZYwU7MIqk/WvjuA7hzCy+lfR38RarNzT/JH/wF+bfBUk
         Nqel0vMxmEANokDjKciXrjjbcXTZyJKrJpAcOIM+BGlSHmbhnd19jb3GhMJQktNf/Vse
         yT1Vj3zqT/e7E5+z2qwECM6BU7z8BM3iYViSifxxmntuoUa7r/aPKtQl4Ida/7N+HY1K
         xTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369486; x=1779974286;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8fZGa6Xq+LlaWCk3IUJJURa8z19KN5KTwoJE6k81ds=;
        b=CWAXI9ZysLQGwOjj99e1MRuZKTntyEvAi4HB3SOE4YwimEDArsSCT6YqWrAK6bwZpz
         eibVmMAMFrbtuKyv8QC0JlFOyYU53KgtGD2O/f/QIIW/5+4bgST8sqhIhsDnGrYDVh3w
         7gRYSs7f6Kib0iVhGgoWuNjYMiCuVKNNOAV5QupB0ZWXEVIFDZY7EttTULOcKJFkVwgQ
         kf4t6f+xrFqvXsdLykriKY6mP9tk3Mm7fUI6FI0gr5OUdnQeb6H/jY5ogzjQbKa5X8aK
         K1k86lbecMT+0DfIYrEffojqEVnCfKTweTgmIwU/9WDir9RaDXlCaDlEEi7hyfEiafUC
         +Rfg==
X-Forwarded-Encrypted: i=1; AFNElJ+fcvLYblxwW6QgmF060QMMuQ25S7JqhWcgSlCd2Xe3hlv/gHgIWsGGe8dSGeRaZq451EiNxNaXKCeliHSW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw46k4+FHHsJ5bzFwGqqfTUx1zaGwuOFYFRjIuzsHmbwzrpnPmS
	oUNT/gOCYBJNVDPtqOT0g8SHCWNhbG1c40ObhxxZYyhRgsPmh1aX+gTaxYjgZQU4LXJ9kVcuu4o
	bfmtilBqk+TQJrSmei2e7VCHLHxpr4jbYd3pvCebcAKTh/i8s+lY4NjwTI629BOgTwO1D
X-Gm-Gg: Acq92OHU+ddBYqbRXhOKP/LlbsZbMFydTFtLhutpWrYHW0VWzUEyZEyaylc+KSAwvAH
	0da6fkjrmUUuk5WbpE6tCn+SAYlJqcgfEeJNFnrKvfJM5eXvEwUyiZxSdKY6EDtLaMXB2sp3+z+
	5POwIC5+rnOepCkOc7kSyK4IB7lFTr9qP6IgZzf+MiIOQ6mgzJcjEVfanwpK5UaRml7abRbaUUU
	ecTPb+z57PIFETsmzkdPo15C4Xn7JxZDRH2rtujHwUkOs7EvVzO2EvghtvkojE130YjPSVtWGTH
	cRQGWtc3Mvqe71ocodiBBdqFN8a6bAp/TQ7h4K+4mVoCuR28bCAwfGe0zUMUkGTr4/Mpfg+mfWl
	Pl8JHPaVme4SMDeMKfYtfQYcOy8as162SOxR60CumFff7Suf+OCpPmOY=
X-Received: by 2002:a05:6a00:a229:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8414ae01396mr2913138b3a.30.1779369486062;
        Thu, 21 May 2026 06:18:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:a229:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-8414ae01396mr2913090b3a.30.1779369485411;
        Thu, 21 May 2026 06:18:05 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm1687731b3a.47.2026.05.21.06.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:18:04 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/5] Shikra: Add DT support for ice, rng and qce
Date: Thu, 21 May 2026 18:47:07 +0530
Message-Id: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQFD2oC/0WN7Q6CIBhGb8W9v2MDUlBvxTWH8JbU/AjQ1Zz3H
 mqtn892nnMW8OgseiiTBRzO1tuhj4OdEtCt6m9IrIkbOOWCZpwR39qHU7V27zEM9c54JFQXUmg
 mpTg3EL+jw6t97d7qcmw/NXfUYZN9CYfPKQbDgf17ZXLU2K9GTCBGZqaQaZaKVJQzh83aqJjWQ
 9fZXStyaZTIC0q1gXX9AHgtk67cAAAA
X-Change-ID: 20260521-shikra_crypto_changse-0c976c17763b
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0f060e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dtPyI5Z5uvIguI3gzx8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rPDShyYSW3xOqYpTH6EhMuvo5OqM1Qv-
X-Proofpoint-ORIG-GUID: rPDShyYSW3xOqYpTH6EhMuvo5OqM1Qv-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMyBTYWx0ZWRfX3/gAXQ0licS6
 CKbhpxv3Y0JjHIR/86b7eTdCAzi7or0R9wF9lOlShWS3zXOhJMeuZFhIoRe23khI5H+is6lyChH
 MI2P39eaLVLaKyFSg7LrZoZ+5qV+FqcHxBu1qkK0RVtLKWG/ySHG665KmNI1DF76LNo0lQFls/Q
 yXSgdhywaIhbEYWMKGKPik6ubvkn+BvNnbSqtshSjp/wiwS5JF+Yup85yb5BZlD4YjhBb5U9Aju
 Jm9QPqv4uLpaaGZhIzkL+MM+zjl4MAEsCr9VSNLuhky8Jgq371ntgo6Ylhzmd8bLAq7gcAVHSmc
 xmbBGlMjXmYHlobM3VEPreeI9QlYSMWGkEuLRN1HbmXFPkLjftOInvYIIEvw4BtXjn65Ca0TepX
 74Q/tE3uaMsJJcG8tZLAt0YuD+JLHL+Ke/7PY+9EWruerHerYFjQSLQ43d9Qh1daXJ4SRqs6EGT
 xJRuY9BUt/Tf8r9nvTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210133
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109091-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E8035A61E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patchseries attempt to enable sdhc-ice, rng and qce on shikra
platform similar to other platforms.

Previously, the 3 dt-bindigs/DT changes were sent as individual series
and with feedback received, clubbed them together as all belong to same
crypto subsystem.

Here's link to old patchsets.
QCE: https://lore.kernel.org/lkml/20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com/
RNG: https://lore.kernel.org/lkml/20260514-shikra_rng-v1-0-4ea721a1429a@oss.qualcomm.com/
ICE: https://lore.kernel.org/lkml/20260515-shikra_ice_ufs-v2-0-2724a54339db@oss.qualcomm.com/

The patchseries require below as prerequisite:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Validations:
- Ice: driver probe on bootup.
- Qce: kcapi test alongwith driver probe
- Rng: validated with rngutils package.
- Validate shikra-cqs-evk.dtb with dt_bindings_check and CHECK_DTBS=y
  with all yamls.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (5):
      dt-bindings: crypto: qcom,inline-crypto-engine: Document Shikra ICE
      dt-bindings: crypto: qcom,prng: Document Shikra TRNG
      dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine
      dt-bindings: dma: qcom,bam-dma: Increase iommus maxItems to seven
      arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes

 .../bindings/crypto/qcom,inline-crypto-engine.yaml |  1 +
 .../devicetree/bindings/crypto/qcom,prng.yaml      |  1 +
 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 52 ++++++++++++++++++++++
 5 files changed, 56 insertions(+), 1 deletion(-)
---
base-commit: bbf247cdb7ea162afb0c9548e2cd1354abb6462f
change-id: 20260521-shikra_crypto_changse-0c976c17763b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v2
prerequisite-patch-id: e6edea1ef76fc1f3a9ad944684bee330c9ad7e59
prerequisite-patch-id: acae1549863061f0fdd7221f0a924b0892f15acf
prerequisite-patch-id: d145c1bd01622f50c69e5c1f13dee469ee4d1fe4
prerequisite-patch-id: 1b0da59c3859cba8c5f4f1e6bf08429988134c46
prerequisite-patch-id: fac2b512a679e1507debab6fc279b292fe4048cd

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


