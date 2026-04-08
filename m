Return-Path: <linux-arm-msm+bounces-102294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEPLJfAe1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:25:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 379803B9D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05FA13011160
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA7239B97E;
	Wed,  8 Apr 2026 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtjbBiCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IEu/r/is"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2873B27EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640293; cv=none; b=G32f/izR7TBS11dRcGalPyBJu0FZlsjvx+3QJ/KJQG0qfP88iXwh2XsIndYjveiYv3q1sCvMEXsB6Mx2FxcYNh56CqheGKTOl9uddr8aNZmmfxf5hVBiwtpEtowcj+q4o7IC0pxoXkO4NiPnw2nihlo7hHiE6ZkgRO6L2ZhzjzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640293; c=relaxed/simple;
	bh=ysF7lMnW62Dw8GqPrgjEmc8c/jln9FFb0gpHqDZSArQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVEH0ShbVVaHVdJvk5+MtM6zNkQfAizES1GOXGFdLsI+4cQUaEvEUIQj1A2tZoJeVFV4tPjx7NkJ/98caB+emFVN2xWDyG4stHswPxHa7plGGGIxTa1+4jAEIZVivolXoKtkIZ6Vi/KJYL9PE1jx6fW0JwjZPim+t4yZwPBpvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtjbBiCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEu/r/is; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385tSVl249525
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOIlc/PtWR6rFkaZhdIsYBBjFwDm/X+YdDt7YDt1vJg=; b=BtjbBiCQLnliM9XW
	GVMMHfe02jgneaOhyQVHj8UkN1zqtL0VX9gPFsouFy2zNlqWbnOhyL2TjFSLcZ2A
	teqYSRJ6LeiuI81EAu11HU76hRxvD6h7K5tf5SFb7IdhHEnf56WFo6HAFInIvGJx
	TR55KYgzc+PjlquqOcOjptUeP4PRz2xl4mnCrf7wZRk3DgfoVR2MlbN9UuFXAGFY
	/JXdsjDyK/LILHwY0Mcf4uEroMUBEFinANqXcJ9xAA05hrLBLsuxr3iC1Re0jykP
	dntA0+7KBNwex4IKfua+YNSRo2EWWlMFcS3lMNM88PXB+hsFwSeFUKtBzFoHZeed
	Ax/fAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9abq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:24:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76bd4feb9fso2467363a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640289; x=1776245089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOIlc/PtWR6rFkaZhdIsYBBjFwDm/X+YdDt7YDt1vJg=;
        b=IEu/r/is+5FMGR5YtTdZI1lA7Bo/77UVrOdwh99X+takwkAMa1CHgS2aDawd1TmrLL
         djtAvWSA1zuPKASZXvSZMbaK5GRuXkUhWRWvLEtUvwG8U1zFvYYzi2q+zsYr1sw2lOCY
         pg1zD5ucjMCM3VCCPOjqmDCYZa9tIn2NWVc8PfbT8HO6QHg6AJDRiJEuGc6Y3p49F94h
         H2WjYzL56/FaveGI2I5DgtIW2b5kvp6tXUeE81eukXibFhkUvPiFdgmYrLq5LM//EfGT
         t60CeKLdbnmm+Jnxe0jqDG7pA/IHo2FqcBkAHS18bMvSNfKRRqQxFHZQVIMPgWdOD7G4
         d2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640289; x=1776245089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SOIlc/PtWR6rFkaZhdIsYBBjFwDm/X+YdDt7YDt1vJg=;
        b=J+TaTfnP1QULa2pIDF4w9fuGnjzlbGPVu6kOZg//MaE1Y9c4N2woXEvpAEXjt0efto
         hlStt1XY9tj9YiLG/uwiz5ADEH/6bb9gAZchMnrMFM+WFUtKVZsmVareO+YxpGRXUGFu
         PVFz/eDKPvNVdAB85HCvoMfYQgLUT2ITs8m0gvjxl7kuJRwIasihzTiDwisnens0hRJo
         1cThJVSgZZ1N7ZmTPn8ex3RRQk7pLdN01pJVdBOQThjNKobPizaeDVDMun/KLbH4+kHn
         wuil8iD2nfEggd22zY2LnopN+PYifGlnYWABOld89ST+Q2Ya5oisdUTDviws7WWfnCwu
         9D6A==
X-Gm-Message-State: AOJu0YxzP+U3ry/ir+KNzvZDycXRKiBhzwJyRiBJl7Gf6TF9tVDdvX5p
	PPccIlYq25HnQjhaWS9WwI89Lk1klDGa01HK0nP+/v6phtsYdPghgTzMZzyCQIMlnW74nv2xuCw
	Bip2so5zbzzFjQRCOB7S2+8jhejoZJrTOzcPM7Fc1px5Vs2FTDAGDJAtsqrD45LX3r90p
X-Gm-Gg: AeBDievs9c/SxjL58oUX1J59P60aN8A0q5rKwnZGD9FufCtnToLAlTJ2QodOldadO+U
	A4D4iQNzHpKeYJC/c98Hkk5g9pImYHq9JwEF8v5eKf8UrUsTcShNm36ucC4+iLgprQQVphlYemB
	hnqf1k6fQwDgqpMStRt1TbPqSmO/lywD0vfJaybo3JM3PIOw1izoVP+vuRFHE7EpsMfCvC5Oi1L
	2MRpyGyL/k8gKjDDEIMVI9qZ87C8r8Cnol2KnnrnNWWDZYOmqIHFL3fwvItCeYmAXbAVV6g25Ad
	5NwBgFDr1ecthORee5TbPEGa5JylHyPx9HoUZilrrV5uCGGJYiAS/FX9afBNmh+U+K4Ifu3Pf/4
	PIhQkP/Lh2Souq28o+XQ8kehlJiKss6mAj25iGwgRMISHXM3sij/Ge4rspYXNN+VFFACLKkmw3Z
	em3iDRGJgfVa/CGte1eyjmLzeKwt98zUarWOKmFbUr17bq/Xc4w4HEE9wo
X-Received: by 2002:a05:6a20:7346:b0:398:aaac:a079 with SMTP id adf61e73a8af0-39f2f215352mr20749064637.45.1775640288858;
        Wed, 08 Apr 2026 02:24:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:7346:b0:398:aaac:a079 with SMTP id adf61e73a8af0-39f2f215352mr20749042637.45.1775640288393;
        Wed, 08 Apr 2026 02:24:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18274413a12.31.2026.04.08.02.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:48 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 14:54:37 +0530
Subject: [PATCH v10 1/2] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-wdt_reset_reason-v10-1-caf66786329f@oss.qualcomm.com>
References: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
In-Reply-To: <20260408-wdt_reset_reason-v10-0-caf66786329f@oss.qualcomm.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775640279; l=1576;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=ysF7lMnW62Dw8GqPrgjEmc8c/jln9FFb0gpHqDZSArQ=;
 b=bBzR0mJkOQv8UsfpR8e2VEDPLF/CyO69j4fLRNMOihyoxdjx2WE3VTh2pEA/ACC9uUikNZ9oh
 tzPFp1lh7IdDdLADvjzls6r/CyD+Z2j6Dj4cIUkuWHL5SkUtzLTjaK0
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d61ee1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RpRSbNz5O0cLrIcFx98A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX+c70oGB/Xyio
 WzCGrEw6IuuMLdsylZmmpqGx97TfQPgL0gMryK8m+7jnCcjYmMhtjRTF2sphc0UqU/UTyKp6FZS
 /27+coJjW8QZvAjyjOdZYZZrWK36lMq1Cc0nfPXWdz30Bezv6EfFpoRkiQeMufgKKdOFhNen2oF
 0qH/QtgzKSDVCVO2BNQtEZ7UFeBX5sInSW9hXAeeCyUTC6tsf+8Fa8FePkaTwb3N6Mcc0q57Trj
 CWLTpZGU9+Ht30wesDIxw/6xKVaMN/nSN7afys0q1KR2yJWN9VTOU0O8fGHL5rj+L8AKYPIAllM
 In7Pc85JdCNiESYwEZKSdL4UEgGQSNdZhcFVVnGqAeGX3XPsI8MYk9MdPMQuCox38g71OJJvFUq
 4SPiQ7IGBZi87lCs2x3PpN9p9RW8SNaYfy9B/A0a1+1u0pSh0MxFDyZ3unoF2yiIoU8znk/jwkk
 MnPlRE3MOeFH2M2meOw==
X-Proofpoint-ORIG-GUID: yIiiy1Ch4eWwVI272AZbnY5HiO-mwjUL
X-Proofpoint-GUID: yIiiy1Ch4eWwVI272AZbnY5HiO-mwjUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102294-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 379803B9D65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v10:
	- no changes
Changes in v9:
	- no changes
Changes in v8:
	- no changes
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..3ead00da3cd6 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -84,6 +84,12 @@ properties:
     minItems: 1
     maxItems: 5
 
+  sram:
+    maxItems: 1
+    description:
+      A reference to an region residing in IMEM(on-chip SRAM), which contains
+      the system restart reason value populated by the bootloader.
+
 required:
   - compatible
   - reg

-- 
2.34.1


