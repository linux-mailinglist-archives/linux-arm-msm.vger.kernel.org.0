Return-Path: <linux-arm-msm+bounces-94027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN3yMYeanmkSWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:45:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60833192784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BB80306362C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 06:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3BF2DF13F;
	Wed, 25 Feb 2026 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5nrLXNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnWExHMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4C246788
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001819; cv=none; b=tsRta0iuVO5UkOVwpTeqDxLbdVyjfD1yprWH/pXrOekTH1Jj1idIK9pCN0uZSZHh2VCi1XqtXm3EMub4TayViq+hZFWZQZfstGtQ8p4vivhOExa4VHpOpRsFe8yH1ZHNcusA7l5V6uDv0FnCiz2po2svuPsigl+Dct8OM3QEkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001819; c=relaxed/simple;
	bh=nYJpkitVgYxwVut0tJcCX6ZI2gddIxlTNulWXYIDO9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JiNEhwr3E/RIZ5i+Ig7E/XFyxRAKEZot1Cta3qTzxaBx3BtruLhrHM1X5uUSUjEX/F6B+dqKZohxQp/P3cvUcxsWzRF6E74Po76jEQ6UhWL1h9v2rlDHimqfKKQCMFf/Dl/4rYTNevRuv0r++jgtscEOmUOXbzr/UHIzgCEAaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5nrLXNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnWExHMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2jn2r583472
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ikVWQV/KAATZyZ1G0YbAfoVQ/GAvyE/SSMkfI6F7Sg=; b=E5nrLXNB3HGvkUVt
	lIhNdlB0I9TUfVf/YMeS4kiJeqNXj3YPZB2qJNxAYkqoYv/8aiwlkdwpbN7KrQlz
	vGKiRf5IBXsAuK0ulu+yT0k2ExE7zP/riXVpkkWR2pGS4ZCT8COolHunYHTMhCnh
	MicXv1cDhmw429G42a/XUMFC0uSBgODnK/Q0KKpIGSKPmp0IhhiJYCKTDAgqEiGg
	18wA/ZXvb/V893mdPFE96vl6SmBMtl8jJnulgtcFh+OkPAm/eFPLZwYiWZ1EHEPL
	8zm1RonUQG9PwbQQUE7gp7XKbGcYyf3apAJCMwzwdnD6x+fy4i3X+3pg0QEbIfqs
	dC2/4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gt6qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-824b5637daaso3198167b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 22:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772001816; x=1772606616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ikVWQV/KAATZyZ1G0YbAfoVQ/GAvyE/SSMkfI6F7Sg=;
        b=RnWExHMWnJczz/7aRr5b0GSreVH0MQ4270q6WPQOx6RX4NRgS3ut10rB/2jy+40gpc
         LzF/qp9lHKO69A+tG9zz6RyWhe9AtWXuE7wn+NBEUqSdto44TwOkr4iQF7zkl2CLcQUP
         mBMaP5J+OTfXvFESi6iP11efaWoooidrPZCBhW8RZcwQE3kCe+2wevM55eSoQwC5KHfs
         zMeNDYsML4qYPtuJz5ny0GTCMp7qEHc7baARkauNdaYNwyyhx42minP05Xn4k+TIFWLn
         RoWjotvvaqAmbPMD0TAakMPfqPaBQcQnbZAXOH5q1kByHqBrvsbSavPkB+uhGwifpv2C
         KICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001816; x=1772606616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ikVWQV/KAATZyZ1G0YbAfoVQ/GAvyE/SSMkfI6F7Sg=;
        b=Q3WhwLvfyHQsdMtfhDSPYJnWUOtOjGOluP3eeQIuOp5C9E4sDL/V9ZvcChF6eCpczy
         MEcEXdGnX0IdJRsGv9QK5fgiMCHKh81TqxW6dxiraheVEqCDLgSnzw+3dfk/7R8hJ7Rm
         /PUq144pelMwzgG71yWmSA6w+Dx4lgKZJZxb3AbCOhe0gMlA3oTPTGXCrNE434mKAjBb
         dGLs1YJ2v/U7gspf53QyR3dSIkt6eD2ijjyVKorYqE1kg75fohRhNG3quWsJoLmuHM7D
         KEKv/Rf+oAKp2cNuKpBRWl9SNVZs+pbar+OqnG4BPOq0aIzK2gqDq9TCLWz6Fw9m7HpL
         SV/w==
X-Gm-Message-State: AOJu0YxzU02RHU9RdsyU1DOhEXqbGq9ewIdxbZGlWWFC5y7RN1uFXZM7
	wL6zcfbzGojO5fyUs4Y8JgF3Pwyh1ArgGhX2iivInwb3OLYODEblEm8U4g7o+F4/FV1BGU3WLmF
	cGuShXbPU3VbJGlShW8sh4Tt8oCu1hgpDp/YwrioNAj6QSPPrQqFBhWhSAJn+C6Uig6EecmQpjj
	qZ
X-Gm-Gg: ATEYQzx08ctmDqIbpNYt0r+IGTUw8t3GkFPH7TRxfHmuJEGkYlqfiyXKgWMUQmrmzmE
	USm0usCC3AUTv+hkzP86EhSr5yO/QApTXzP7c/5TqCGxf22CBliXZOCaj2mrQUeY1Z4prMYpDgh
	QpcFmvS5vPDPgAbNLsk8qhU4aPoMRuUztghcEqbJMBwbxCu0qhRMb7kJlsBJc6GmYMlW789nO0A
	X690Vnmx3URtz5d2aPSd4tAlMaZyeFfV20UWINZPomWRK0IyqwOuMI66HGz2O6fnj2ad5nDpCLq
	cltX9Hzppi+K6FRLq4Dn3QPJPPD8edwERkV6Zgl65nnZqDf41amQNQpTLylndNsI8dOP7Vn8KVJ
	W4rJ4GDWoj57rUcxWkVdja7Pw6M6QBUeAMRu/sSZ5V9b4+6Khp2YoJ3SYqzLJ4lBtv+nxSf+MHh
	N7xjxBa6DoRJhQAF7PQK3vZ5E8I9/TYGBeL1B8oJU/ZkkZTiZd8+DKTcM0
X-Received: by 2002:a05:6a00:3a22:b0:81a:7d1e:8132 with SMTP id d2e1a72fcca58-826da906fe6mr12663154b3a.21.1772001816016;
        Tue, 24 Feb 2026 22:43:36 -0800 (PST)
X-Received: by 2002:a05:6a00:3a22:b0:81a:7d1e:8132 with SMTP id d2e1a72fcca58-826da906fe6mr12663101b3a.21.1772001814749;
        Tue, 24 Feb 2026 22:43:34 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd692b99sm12856570b3a.24.2026.02.24.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:34 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:13:10 +0530
Subject: [PATCH v7 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-wdt_reset_reason-v7-1-65d5b7e3e1eb@oss.qualcomm.com>
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
In-Reply-To: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772001806; l=1814;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=nYJpkitVgYxwVut0tJcCX6ZI2gddIxlTNulWXYIDO9k=;
 b=PKlwEknRXdAzx8wrH2+KNwwUmsFL1OE8JLbSlTUKfTAGAQ1hqdNoRuTf7/WkCzDRlqHa0p01h
 +HZEx7VaW4SA2b4SwCpImIfSl1AEXdU/Yg2cFv33D1F1bgDKCGSyxr5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: ZixN8YDZJaURFvbLF2XbuijPJ01SudrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2MiBTYWx0ZWRfXxFUV1t/tysuN
 9Nxk8qerskylw1/vyRYdOoD6JzxjnxIgk8eVvtO+51gtddQMrOAowldKKi34pwePe2X65hjnvJx
 OR9s1jXig7S10Z9XjlXIis5ROnQeEotaevQfdX5/8y0wt912Io2G6c9bhmtLQtGUk3SIvTS3XVf
 aUT58V0qa71EVKI8VotPNmv1iM8/sWNZVPikL50S0El0DzwmTETH3zO74gH5QYDCkN38UrLiF16
 vPvEMfBJ4eDMUynd9QAuO840SP+S770QUGL05qWPbLLj8jAbcUgh/kQSegIAj1aY3VkhCZQVF29
 z/V4EDeMSZRPcgutHMMvSnJpu6cPMefuFgwqiyBw1PE+lHHoUFklzlG/Vvs+d7dEGSKj2OTSdbs
 fCUPp1JwpcGVAcGOTsGT5J2bIH3lf295VYAHJ6DYuWKGi0T33p/mv1JcxPLWYBGqpJ4ASukQjWv
 HYqQJfPhdzXOJnviE7w==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699e9a19 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ZixN8YDZJaURFvbLF2XbuijPJ01SudrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94027-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60833192784
X-Rspamd-Action: no action

Based on the discussion in the linux-arm-msm list[1], it is not
appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.

So drop the compatible from qcom,imem.yaml and add it in sram.yaml
binding.

[1] https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---

Changes in v7:
	* Added the reference link
Changes in v6:
	* New patch
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..72d35e30c439ccf4901d937f838fe7c7a81f33b1 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1


