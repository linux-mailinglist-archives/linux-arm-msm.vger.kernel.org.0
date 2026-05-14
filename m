Return-Path: <linux-arm-msm+bounces-107685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNGRDGkhBmodfgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 21:24:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1E54654C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 21:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECA8A304EA3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 19:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98163A2E0C;
	Thu, 14 May 2026 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pabTrzxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwCJIt1Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD33AA1AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786636; cv=none; b=fixayiVcUVjgM03xwK93X72aA25zownlFqmvGm8i5+VgPBPd3dCm7ZhCTZk4QiABPXBUHapdmNilsciVMppW7hNstXMbryUXBkytJUw55uYmEz1ll4omZJ/mosH+20gohp/bVYVBmB8e3e0+WDEg1vaYm5OruABmWKzLYVy1ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786636; c=relaxed/simple;
	bh=DxqT2cvoH6Wzau5SQ2ljRCq3jMDOB/VO0j9w7wJrsgs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lhT//mKVoESA8iW3cos3IwxpnQfX6alANhfcTiP6d/KqGOowr/L/bJDatz4hlZ6arwUT/dpCydP8HFZDIB2GmHmoFIlCzyvPVWQdfIjyAhlZqTCt8crg8KqLG7c3neSDOQx245QfOgm0Gs+fkQp2dnRz2YyEDnayuRxJSPKjrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pabTrzxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwCJIt1Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpIbK4020769
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9vZ4RhN48Kw7Wcf5kxfM7+
	mj8r3upSAqu9EEnlAYB/0=; b=pabTrzxTe2gE0SOae+152E2T8v/2gWAufTdJZW
	+nWwvGMSEOkTbDxaCglm1BvDpMKeGZezKA+ZKRzwRRJClS9h8Xurhr5gHh1d/05r
	lBecHTbm52BiQ9qE+ijf74dbK3T+1sPh3n/M8XIr5vR0T+S3x+UglrAOvNeJsBTt
	HrEB9ybkqdBcHRilD0AjEzEGKsynIoCLEAFZBnULfV+/y/JGCcf5a0a/qm2YfT1w
	eBSj0AfyQyt/D8ZNSLiGt5h7hYpwUbXjpkVA8WLoHzz01wgKp90+dKooC6jzDXYo
	+JmAZP/Eu3SEVHdByvXdYMG8/G2/PB730Oud/Tv+nJ/1hO0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rr3p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:23:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so129660055ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778786634; x=1779391434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vZ4RhN48Kw7Wcf5kxfM7+mj8r3upSAqu9EEnlAYB/0=;
        b=FwCJIt1Qpy1Hh1SMf+x2wBXc7vInNLvici50gCRa1W4JRGqZGKro1MWl16PifKIkZw
         C2pSl7KPYzwo1qVnQbbu+YXsAHJyYcf7A7Lp5Hw6j0tMgPj5+WtP4iTg7Gb1vddI5Td7
         /fPv7vWZj8W6Rw62BhaDLDTm1OFh31/dbjPNnvRHbZPR5Eg33Lj+yMD8QCGXhJ3p+Pud
         cdnjBJbVy5fQ8SOB5VKufdozOVjdGQif/iWtACoA+UuUFWlSXwWmF2hb6gpugq7uqbPT
         7kmGx7S4Hb6O6G8L7UWn4bkwFBUJi0JoiWxna1/zqFbeY/KAjAmHmNtAfqN3BrsGuN5o
         yPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778786634; x=1779391434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vZ4RhN48Kw7Wcf5kxfM7+mj8r3upSAqu9EEnlAYB/0=;
        b=iJWOmyrtyi0Pv81jvptEO84G3IAoJkBiOV6HXh3UeT3cXJYd7ICIdZSoAfyGFpmiok
         ZfLxHeCZCS2p0ar/mzAJU3J8LhPRKOvE7v63acki1d6LTQhADeS5kBAsVhGZYn9LZzUO
         F4yyqUObABQaeVp8e6dXp6Mj/R2YWu7mCTJlsiTO4Kp1eF8dlBqXxUnjhl+kljIBTpMk
         NChH3pvMiVz5NUc9R4iSdmYwDOc9uaTGbMP3BzFIUuuY8wAHIJrRnWym3v1PDDZjxR5+
         DZRyf6/Q0OIFCONldkHLJMGvfizrrbwB7TFjPXepcpxf9ltB2y7OpBA0IL2iZTtU7vQZ
         40vQ==
X-Gm-Message-State: AOJu0Yz04a+/PJCQUOYHBS7751+vvBqHJKcBzY3z+z7vQb5RNPEYLcTe
	TfIldZWDVYxTk2fTjtkUY5J6dUQmhxnFr4ZjBEpbtZJ34lT18K9eXOBS9r1lmeB6gfgIWZtUckk
	eebi0lep9hSwKpk0TanMpKoo3kfMYeR53CfmrV6Z2RwCMssAjS2jzkx8EzkUU8aWTDjWa
X-Gm-Gg: Acq92OHrKi3Z1ZTqwfotgMvUqCRbNtexynUOBZ7uXSQoxpTzcKASNBl0Gzq/dF5SAl7
	CJR/WRmD28IHkSjfyrbe5g6rgi5XugX9hC4+5CE1OPMdu+Unbx+cU3+JK8gjBMinX4yWSZzMlr7
	xs3BYmHNrUhH/dHDwrfmBDCsFc0s+RZSG+7Ln8kEBTfeo2EGfd61/M1x0BBr8JJRUj+kgx32FeH
	AE45Lasa+fALlfDnAl/sL43FrREHDxzrY2c/aNvOZyuEqPniWdAWTWrxbJMihNwnOP1h1ZW4bBL
	ts8ltnlxu8/4R8TCvqeIGz7IJom4/Pvteyi78D1YT2dbJsgC5IZ79EhV4S82UIYauFZ0wrU6vws
	OeyL8rSaulXJqyE+1za9sRFYDex63Qc0YHjF4tFHzEGlxZLXE8g9ke+k=
X-Received: by 2002:a17:902:d505:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2bd7e8f0ff3mr8554675ad.28.1778786633914;
        Thu, 14 May 2026 12:23:53 -0700 (PDT)
X-Received: by 2002:a17:902:d505:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2bd7e8f0ff3mr8554455ad.28.1778786633362;
        Thu, 14 May 2026 12:23:53 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f291sm35506535ad.15.2026.05.14.12.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:23:52 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/3] Add support for qcrypto on shikra
Date: Fri, 15 May 2026 00:53:35 +0530
Message-Id: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADchBmoC/yXMSQqEMBBA0atIrTtgHLLoq4g0MVa0bHCoUlHEu
 xt1+Rb/HyDIhALf6ADGlYSGPkB/InCt7RtUVAdDEicmznWmpKU/29/keB/nQXmjfVanJkWDEKK
 R0dP2DIvytSxVh26+L3CeF3Nw12VyAAAA
X-Change-ID: 20260514-shikra_qcrypto-f61f4d363e6e
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: a6qPIodxhjP_gOH8fm0eRnQ3WMVnledo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE5MyBTYWx0ZWRfX1/Un4p5b96Ac
 kuVNmI85kQ6OkOT+47z+7maygcUMZU4CV6+OzA6DcA7gjW18xlRBjNqKNGnesg6o1K17CfhBYyl
 uucaTQ8UZ12XI1eEf1hK1Zus/j4r547I8DkXIg4Y8Vw1vGaAlOlJFC5oHyfAJqgEylWl4ofK6y+
 1G9BdxeSqoDt2lHvR0ow0aLoA2XztNa2oQH9JHHzZP1tJA/SppOb6Vu44docqPUawB5w5Xw3SB5
 uOOzZatwYo2hTPL4a8CO+LW9PoLOsLGrkAQspOsq4wI84C+Fy21+alAC4/maa4BQkPZysfiSkY5
 ho991o6t+fhoDXUKwPNPJhwnxJ0qpHkpabQdBfzM7Ki0ExffgNZ0ufphfqzOZ8enzE7Rr/pEAXo
 pbtQsc7iAuwmqP0GUuQ4gjItZSZWsVVuLZlUV0qFp2FHVcE3Wx8qAECOvrgT6smm6eMARbIfA9p
 4tll9VTli1B49PlL2Ig==
X-Proofpoint-ORIG-GUID: a6qPIodxhjP_gOH8fm0eRnQ3WMVnledo
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06214a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lj5ddwVos5PUyyIFQj0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140193
X-Rspamd-Queue-Id: 7EE1E54654C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107685-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
Shikra bam dma supports 7 iommus so update dt-bindings accordingly.

The patchset depends on below. There's recursive dependency so referred
to base DT patch here.
- https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Validations:
- make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
- make ARCH=arm64 qcom/shikra-cqs-evk.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
- cryptobam and crypto driver probe
- kcapi test

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (3):
      dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine
      dt-bindings: bam-dma: Increase maxItems to seven for iommus
      arm64: dts: qcom: shikra: Add qcrypto node support

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 .../devicetree/bindings/dma/qcom,bam-dma.yaml      |  2 +-
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 35 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: 33c8e3305b65a2e757e68b10af521ad54ea051a6
change-id: 20260514-shikra_qcrypto-f61f4d363e6e

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


