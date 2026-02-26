Return-Path: <linux-arm-msm+bounces-94330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4aB9mJoGlvkgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:58:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BF1AD1FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 18:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B00F31ECC1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 17:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9455036BCC8;
	Thu, 26 Feb 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9vjCa/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcFmJMuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7AC36494F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772125192; cv=none; b=c29VSVMnuAs+zjlZYEBDL4WSsMrYgqGfS+cC+zzWvUYWW0TQq/d7EaqMVmtg2OZvcaT04UVT/xvga8DXgJzAf4qy9NwIr0FZ7ms9U82UrPip4UzB2VqDeMCBlK7yeEAH7DF5/0B8WFsymOO1TpWIZECYIq/sWrtYHaaHajhFQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772125192; c=relaxed/simple;
	bh=1nf9r25JC3wCUmTdDPwcGDmYS5dtLGS8bBXewEOeDV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzWVw1MrfD441rXp6kAKC99dHtExhxEborKYl3gnhxWa3jsaL4fs3a1uoJfTYEVxY2d2lkTfnnDnHre2E6hcoA2hgr2qXDBkjwNczHhP6zJ/zux9Hf4xTd6AazkiW+JRVbdt9NmOqJKr0+UxsFuc/CsdEM3SvHlmtwi9NBJ5pC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9vjCa/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcFmJMuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGiR6b2527973
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ddaq7w6/Dv8LEYsRp+9+T/nebioMANU6ECj+iROzaJs=; b=e9vjCa/AWAtRgvv6
	DBMpjlA/tuPpmQc30WgCRceydmdXcD8WLvNP/M86ghC/PUHPrT7mbem3x4m/thSz
	15YFS3VfW6b04y9PNOpsyKPFTyufBsNkDUvEmIsGDoqmxKDvY/FeMzCxjOlK4PGL
	ME5yiRr8ixwwXyo04qZrzu3MsjlKmw1VOWqClPFEBlqj20wALuYQAxyp/ed03UmM
	D1JnR2NPwphi1fcOxl+7PvII3Cp4n3LJiYAQ7FuhI/Q8fY+hoFIF9RIFZrn0iZSV
	gPiO4PwlIMKM3d7KH8/7URZQnsZllN5y2+Gau66UH9BimzkIn1lxNgfFuENxDX+B
	v2b3sg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350mjb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:59:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70b6a624bfso611749a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 08:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772125190; x=1772729990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ddaq7w6/Dv8LEYsRp+9+T/nebioMANU6ECj+iROzaJs=;
        b=KcFmJMuE8nNawbkjhGfSdCsYEanyXlrFNZ7r1SlA6PiWmXEhhidVxNHYFHLjwoBTQ4
         DcE6lPTECbEgdBLgCF7lNl9mMEUvNMyxz5PHlunC48MTa2doo/yU/2UMLqQZHEgHisCS
         Zdxu3pP/E1FxEajr9THldWpzL8ZvnTjl5A0AeQTjtBQwF4n3F71V1+Wy2DivICi7g2+9
         hAujkEmZ3FhSFFi7fdSi4piKOtrFxGxREHzHKyb2KpeUPkQLjtE8yOsuI7z2PiCVdCr9
         Lj58s83x2louewZx/RR8aLukUREcNuMULHvIPCumZLZMYCufyz/CCMSmBPNMsJctT4Hv
         G4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772125190; x=1772729990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ddaq7w6/Dv8LEYsRp+9+T/nebioMANU6ECj+iROzaJs=;
        b=dAS7yG71rf4HJ+Gre7Fi5FvfhCS2WF6SffnXp7Ff77xJLuSTZFIhfYz3ThFcRHCeWW
         DjmU90xFFbRHBFj3VVD/imBEo4zJxdBTNjoK0MV8TOR/Jnypq1PTh2AGFqpKr10aOEqz
         +saa18MkfsQb8TIZy1+P5UjGKDMOM3zzvL25nMTmig4BrhzdVPd+XvswukKoTQtpUxh+
         5Hp6YPL7BzyDeKDeQbqGKf4WNe+irD2wyD4u/75ars3euCfzht9v/bJScyuMC0KzTMLq
         4BV0hzOt29xQwfq37vuYmbjuK4kSFI3UtLZPQ/6HQycac6r5ez401JM8k2x1k1QB3i15
         cbtw==
X-Gm-Message-State: AOJu0Yx4FACl5BXneZiwXjK2xJovL6Y6HnVzrM1zbJEyacsgwLbwIf0M
	8klkk+A1jgeSWCp4+Q2bU7E0SDMGLogMalCbTeYHV2jOzP+TQv3/XUM8bZX4Qtug56XrkLdDkH8
	fTDBIN9d4JqiaacWVp1Uebtzb8PNkK6uCmxumDyyR2WnKl0TF5O9oHbvffUallgVPqBi8Nw3dJ3
	jE
X-Gm-Gg: ATEYQzxMzv8Czwf+MKG4NR3AuEqq+7jWacxBuL+sqWs6dDS8RPTr+PULe293ZFPfDaX
	P4pZ0vQi7afwYa7X4sQFxBNEz9s1ZmYtnZGEAROw1+SDfHiUBskVJFqAHVyo/vyVLwCGVZp0oO1
	1OhJ+tPfcHO2JfvSaH+JpynduEJ2/hCD1gzE8JLPt0okZiAPumx5pta2fKtfe1uD6g/trY5S3Lm
	/FvFte9qRBIpFAtMmHJo4ouSO4XLF2OCyEiK/ZBZZ4booFScH+kevcL4yq+k+bFgnnkgggQbgyS
	8OlUPtnE63FNomCN2CuBQ1qktmPDj9Vr2sav3wpFDN5FR1efGO1mvuLSTr05QufenoxmZlX2nbi
	ArqdUG6uAck37gAfYovPZvkOC3sWe6fkVqDH0i4vdisiBQF4kZQQFFuFbTH5vsbsOFG8DebbleH
	Ac6FHn5Zj8X6IlbTqLlAq32T3WjLoB+aNUGhwjV/ZB8QQKfh1yPKBN/iH+
X-Received: by 2002:a05:6a00:4217:b0:824:ad25:6477 with SMTP id d2e1a72fcca58-8273984fd38mr2629850b3a.30.1772125189654;
        Thu, 26 Feb 2026 08:59:49 -0800 (PST)
X-Received: by 2002:a05:6a00:4217:b0:824:ad25:6477 with SMTP id d2e1a72fcca58-8273984fd38mr2629827b3a.30.1772125189176;
        Thu, 26 Feb 2026 08:59:49 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01054dsm3626286b3a.43.2026.02.26.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:59:48 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 22:29:36 +0530
Subject: [PATCH v8 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-wdt_reset_reason-v8-1-011c3a8cb6ff@oss.qualcomm.com>
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
In-Reply-To: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772125179; l=1877;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=1nf9r25JC3wCUmTdDPwcGDmYS5dtLGS8bBXewEOeDV0=;
 b=zW5WiPOVPgHzXOUGHuSmdWaApnGjbJoQT0LPXl1r7SamrdHyzLkM7SzOdO3sLTKRVegetwyeB
 SkVTmYYbqQEB/EwFRUAjs0DE1c+QPHjAZrwuY1JgApnke1opVlcEtuY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: gYcoYDFZCfxBboX_8fo8UQzBhD8E-__l
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=69a07c06 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MyBTYWx0ZWRfX/L9JgA44IkcL
 I/3tz8IZ6hWUXQjckbqrhZcl+A2mVm+D5BjzRGjCYNWWrmxc7THAcn6FEKC+2KsW71QtjfVAP4Q
 I5ZghbqLM4TrULRsyN7QKRwmfpUmH/zUaJZzW1C58XIXDWyNmMNN8wyyzFxmZ21S/haJOqwbDI4
 wvPk8boOEwtqEJgwVVAJq3JjGSNzqZhZ9OGDdfzhXmRY9WISwseafLJTUfN8qXMV/N8TctLasEv
 aLSw3bfH7ioKzQpYAa2nuAGPy/5O1Yhav/wb+hCHAs7TNjUoPWqixiaQ4e83w6DYk92O5hP7hgX
 EJjxp9KUsVc8BmdpOaVPvftaaZ+SgGwItWEuHYxCPBoHyz5Z9rnqVE1WRy+7+Ic8/zfLaahgBxE
 nejumgN7hFdsvcFcBiRYIU18k8U1Tx5yvtildQP+nUpIlUcCdNlQfzGgjqaLifMfs4Ffs8SlCB0
 Je0DDIs6xhNrJLtRBGA==
X-Proofpoint-ORIG-GUID: gYcoYDFZCfxBboX_8fo8UQzBhD8E-__l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94330-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 437BF1AD1FE
X-Rspamd-Action: no action

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v8:
	* Updated the commit with the reasoning to move to mmio-sram
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


