Return-Path: <linux-arm-msm+bounces-105859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPEJNe6e+Wmj+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:40:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 378704C81E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBC50300C595
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3CC3CF032;
	Tue,  5 May 2026 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnO8C7/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4Q5c1QY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25F13DE425
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966822; cv=none; b=MtgATE8ZFoC2aNFXcg+nG6U7c3jd9Sf9fI65mdfp+naxBGKwOLy+ITEG4KFvmLcGkfB/x1wrpVqAS2TeMFWZGRmr58CyMioOivBh6SCiLy9oOLcDXRt1EfvtRGmc6s6rUANTZku/siukx68ApidM+J7SoxQHti0KWTgdwPNIu7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966822; c=relaxed/simple;
	bh=9E3OacHmTVB8D7ux+zDqkIeotO8TVKvO/ccUe2RipBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MdUhFGKUlQ767usirQnwyCNh4dWKjPoNKOa7QGLSLiPpFSDYeZQI3aM1FMK10doLhRgR14zvjs9LiyZXHJj1gd2a80l1YwvsVG6OagUzsBAbXy0ZpqXgGl6ct1j5KLsHnpYgVBXecynNCv4YyPzIAx3A+LCCDpkw5LDq2zcR8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnO8C7/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4Q5c1QY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454hXo0749077
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/gzyaxfWTLtOuS6e3Kze5F
	roF+EEMqB53OgKWTH9cqU=; b=CnO8C7/lTNCWdt4VeUZBwdIR1Oew602qf3Iefy
	UC7eySqUD1Uyot7J+0XOjg9WZP2BI/x99KC9hXXr0ZytiXHdA2QGnVVaihxm0GS4
	msgSf87ZLLEO2REkhP7TpQ6jrG4nh6xJXe9ux9nio7kGPIXx1DX5pO8Z9HTykfUB
	dI/8RHhsPgqjYTYccZCI5SWpIoaE/yv8Wyjb5Mf5auB80U0VL8yzIMPFA50oT7Qg
	+INQ5c/UuuBaquQIRcu+GC4hDcycZRygt2pj2X4bLUreWl06cBR4T3pggz5evugw
	NgwVi654hv+g0cnz6O9dVPdxCHi2jXdp+t4M4syYewZ8NcHg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf3x4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:40:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7c2ee830aso107542515ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777966817; x=1778571617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gzyaxfWTLtOuS6e3Kze5FroF+EEMqB53OgKWTH9cqU=;
        b=j4Q5c1QY4Wek9fLMDe6LhIJQvvfHAXxygCcYKgTRRiOQKE1imJv4o187wck92Etu2c
         KoUgAFtEyG3er2Ipt/ckw13b8nSABkkkZJjlCGLU7WQPfkEQhT/xCW1gstTLsVfCx4op
         gD0PzoWTbIG21cTnEDnkepWTzG+Pvtb7zMIBQrPjHFB7uFmv0EObP0NO9AzrTVvSQpde
         rRFynhcoTf8SP1pupIZjvE1gAsLtDsO4dcPgUxh9QLXGoK0UJlhEXTt9yqSQdnQqr69n
         batIdrSQeVg7rY0fOhZGUpfoW6Gsx0WcHVuae5g1jM902lLSlf4rIMSIyrsYLVLHkNUP
         dKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966817; x=1778571617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gzyaxfWTLtOuS6e3Kze5FroF+EEMqB53OgKWTH9cqU=;
        b=WxCqzEl3WHZTIJg39QK79U2wSgYAsGGg17gYZyWVY8nxM78lEKJgaD/9GuFUirOGpT
         oAcgQJrrB3E+4rm9Y5Os24m53Lu7RjnaYzDu36M9jRe2p9KTO/G5OIdyhuIouz9zsnsf
         RWXKT72hMLvblew7sjd56cFnJ3OPsPVUEvZkoGjpzlHdTHO6TCvmUdA4At6vB9PCX0MQ
         /djzlB3nEbQnjEB12sldynmm3t0tp5ZfDdn4uk2NU8f5p6KsHAo79sh+V3WMZ0XKI9VS
         s9kdX8lfLKgim2LkVWOO+qq/wRjdB82qgV93li1a+oa4Ddx/i8jZAnX47Xf69Hd3E7d9
         ZBig==
X-Forwarded-Encrypted: i=1; AFNElJ/mTnILEwHS8ThAwhxg3nClflvfFDIzLjM595xLqXi+kgaY2CZHIx0eLSlIJe9NznXt4AeOF2vz7XkZ+KdW@vger.kernel.org
X-Gm-Message-State: AOJu0YyycQ3Du9iEJTpGTFv86KVrXM90DYa4sabTsFMokiUlLX7RXG4C
	hE4bTuyfoNXkmfuiMnNhfPKPNReNtgCArkgR67YpwLQsTR010n6RnGVuJyTfVfvOu2te6TkVNNQ
	0KOkdUj0EPj0u7amWXSfTKU7JnQEMWEXQoRLxOYC9XaIZ1s0LyIPrr58kDufp4KFbYPnK
X-Gm-Gg: AeBDietg1ZaaADqR1T+xofAye29T0vPD4str4P+cBGJqIxoAdb5QfU6GeQUZC3GhVkU
	/qVtSUCjii4JV2GLUp8Hy8PolCMTAW62Qn1FbIgy2iVk8GH4N3vub8kUOr0zeYGuFIfJOmemPAR
	t/vVmRih0EHEjOW7JRTqOdtTdLH20ERrkcaJ/pk2oCLy5AB6QJgzKSTTiyqlKViN1PTMBx8Gkvj
	gFhvrIiW9oImWGnxhdQH+uKjk6eldN8wiAfg9FOxxJGQUNJalBfOggO8JAvxk65384/Z9l/dYHv
	/u/LAIe4SzqbTF21Bd6xxPHrxFBHYOtUyhiP93eDD1wvVwQ1327H3j8+qJ13qqf5CKZcwcBYzJG
	VjwDP0MQGOCituSPTxOAhQzdkglkJ8ULBoJD+oBib7TxnOVFqePOrYPrKqg==
X-Received: by 2002:a17:902:c942:b0:2b9:a5be:d2f6 with SMTP id d9443c01a7336-2ba531a057fmr18912605ad.0.1777966817326;
        Tue, 05 May 2026 00:40:17 -0700 (PDT)
X-Received: by 2002:a17:902:c942:b0:2b9:a5be:d2f6 with SMTP id d9443c01a7336-2ba531a057fmr18912335ad.0.1777966816872;
        Tue, 05 May 2026 00:40:16 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm132663405ad.20.2026.05.05.00.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:40:16 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add Crypto Engine support for the Glymur SoC
Date: Tue, 05 May 2026 13:10:02 +0530
Message-Id: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANKe+WkC/42NQQqDMBREryJ/3Ujysdp25T2KiKZfDZjEJhoqk
 rs39QTdDLyBeXOAJ6fIwyM7wFFQXlmTAC8ZyKkzIzH1SgzIseSFKNk473pzrXT7stqWTNfPpMm
 srCccBo7YF3iHNF8cDepzqp9N4kn51br9fAri1/4hDYJxVl2pKm9SFKKStfU+f2/dLK3WeQpoY
 oxfO7z0hscAAAA=
X-Change-ID: 20260416-glymur_crypto_enablement-be2ff022b429
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777966811; l=1011;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=9E3OacHmTVB8D7ux+zDqkIeotO8TVKvO/ccUe2RipBo=;
 b=mk9NIiydb414qnGS6cWhu6nl5OJH6Z6WXQubHyeO51mgF+NJSZFXkEMpRME2zUUe+Pjs4Tpyd
 NXwiTNh4E6BAyWsPuJPamfDFfq/8KNj8usVU8fa7UhEE/z6sw2zNSfQ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f99ee2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RuLhemBIKpjh240wRt4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2OSBTYWx0ZWRfX8dOZvnX/F1zd
 Am+wprbP2M5tct/ava4pZ4UKK9n3qV+4Mfu+C2iy/AhyUaDypJFhsJPDGCXUNm39GZe5zP7HJEo
 Z5i30cfy2R9aNS36MacC5tdwpZ7vY05js7n03x6p5kqkE3JF0rcWPB/zMKQ14jAD0hywdkaHtVy
 zaMlGhMr6OJZPPcOy5Ug8zjFOFgQDPM5n8GZsEoaAsETWaPWyOJN0yajh0wUKz3n4FfuoywZ8Ep
 6nTsYyNGOw7+tidxTI97Cekg45up4NTjyX2m9D2ESM6+7wvZyfecv2oJThPqZqAFO9PB8+IhdE/
 Z510qel6s3K8xU18BrE5y/o7H92n2HBqearK9BXbdlnDpgBoXuOLoCZR5fAHp0YhEV8hAy0r0xo
 23eTnJnb3DB1a5YJPGvOyBSLT5349k6FEVdbWeS/Y0Pi6DJZTukigWNyKQiNx4UWW/JXbJdeE/i
 9/fW4rD9rUkUFfhpqtg==
X-Proofpoint-ORIG-GUID: NILCPNMq9Ska4OVf4Q9jJucEYpfLwXNh
X-Proofpoint-GUID: NILCPNMq9Ska4OVf4Q9jJucEYpfLwXNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050069
X-Rspamd-Queue-Id: 378704C81E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105859-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document and add the device-tree nodes to enable the Crypto Engine
and its BAM for Glymur.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
Changes in v2:
- Fix the incorrect SID pairs from <0x480 0x0> and <0x481 0x0> to
  <0x80 0x0> and <0x81 0x0>.
- Improve the commit message of patch 2 to describe the purpose of
  the Crypto engine and its BAM module.
- Link to v1: https://lore.kernel.org/r/20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com

---
Harshal Dev (2):
      dt-bindings: crypto: qcom-qce: Document the Glymur crypto engine
      arm64: dts: qcom: glymur: Add crypto engine and BAM

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260416-glymur_crypto_enablement-be2ff022b429

Best regards,
-- 
Harshal Dev <harshal.dev@oss.qualcomm.com>


