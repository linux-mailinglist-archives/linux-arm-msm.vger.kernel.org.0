Return-Path: <linux-arm-msm+bounces-107516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIxMMKxIBWpDUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:59:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE453D78B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C32C030648AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 03:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB543AD524;
	Thu, 14 May 2026 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeNdQYfH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TP88H/Yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BF43ACA50
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731121; cv=none; b=QrBwusySH4F/ArwHc5M8SEDdj1fvPyAk/+0829zvL1jmjmXmXW7Jt2c+94xXbtXFDtCYw+sBKwT1Cyw9CnfwMxY73CpIExW4rCMZ0ux8gwNQnafhvJ3kZ/GXjY0/9QBPMXNY0+naaXAF2SMep4OXfl6cfIzdmjw8+CEQHPoksqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731121; c=relaxed/simple;
	bh=5mGI/C1XCwPCgCpPLbLr14Z+oFs1VIpMUnI/MAsiqSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgfuEFIkMksngXsnbjTKnGay7e5g4CR1pvfvC9crvO031ZNVY/Yrd43np5TQ1e8GBBzkHB0vgoLLGjQV3bXI3Vkbd3iEj/woJ4yVBb+haauQJtMq3vLu4yD0jILoXIInYuD+cEzwK81kQNNEkF6RiDmscU/okVRbU4dak+vTMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeNdQYfH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TP88H/Yg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DLHuEE359453
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2Dj87Y4whUJaBzEehE1Tqbo9ydbz/EdWzB0LJkcrAA=; b=jeNdQYfH0Dr6aosI
	w+8eq5kvhizZMj6dBuALXQFIVHUgfB25O4pZfwLuEUHxBKLQAdPGUvUnvxOT9scd
	y91vUhcpPvKBwA7fNd9ryfmEIoi0ADH2kL4fLzSkUKFZduH+vKOdwIR235DbElMr
	53AY0zCHEfWyQjz3tR50Tb0L3dbVPIRNGJfVZP5YNT065kJ9D86fugKJG7HQr6XY
	Wei4AZmrt/hfEf9trg8FWX3VdSET0c76JHhwe04ILCQONC1KVIpLnCaf1X8K0yIi
	E5DObtuM1SCa+oTcfM4aAPHJMo3Od9dYluNa0cEvKvGrgkmav0OKkum3jzNyb5TF
	5DpE8w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513g8yfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso50187535ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731119; x=1779335919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2Dj87Y4whUJaBzEehE1Tqbo9ydbz/EdWzB0LJkcrAA=;
        b=TP88H/YgQ4W6PQlSrVq97iZJgUG4/0Ql9/UQzliMtAeZv9EhNPm1tjzaQRBx+YedIA
         UO/XI5G8gL4MnelAXsOD5U/M1lk88hsfN3RWjz/0yn42+c1ycqSUYZbt+3e7GuXFPn8H
         mkADyMaxkxgHkC4MgJKPzNZWeKAtJ66AJQ9d9zkK8vCtzwO4pH+VyVS6F09hyB7G8Nug
         LnJA4eSVOYmQRY7F6OV+L5VD1PSF0xrmmvrwV67M7BFCcp2/0rSKmFZT9SFs1lsyvkwb
         XILayk7uNdo8JS5mg/8eqnG6L32Bc4kv7Hsb1r4/zMQuGlsCEx+DXN3LDOKySPgerP02
         gYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731119; x=1779335919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2Dj87Y4whUJaBzEehE1Tqbo9ydbz/EdWzB0LJkcrAA=;
        b=IgS4lyyU/M21w49fmyEv+/Q4hyovYc1/88mvhbwYX4BO1z1CnVdPNZmv7yXZAfpw0S
         4tkCcIsr1pR5eT5VgBXAKMsiL7z5eM4Xn8jo60YhsIBBOhVnSmy3JuIUcGEuBq3CtCJH
         uIZrgoo/WZ4ZCgU0VCFXvIoWHvd1xpKvCAMBUSGb9w1R48lrOOsfivRExS6DrzhYqSuJ
         TDJn1E02qJw8kTR8W32LjVvZn4FzuhDL/SqryZbsRL09ehTt2iCCMEj1EEWsh6f13DnD
         1XOOCSbiTxaXFEN1x658B30amDS2lyMPLfz8nPsEBvGZKeNh8z/fSZv2/alAZkEe8eDG
         qQbg==
X-Gm-Message-State: AOJu0Ywr0+w10nHMkHJ//rerzbfxh04XISPfMumloDwKhLU4kPkp5yOh
	AjyO5n3gjVAgaJvD5X6iwlpXzGrl2XNd3u402dxOekfbFjFfwQvNHSrW4L+HyJw8/L6V1miDzQ0
	4wLBQkgNOLZGTkgfW6DStlFDQwjXRSUkxyTMHWjZplyWGsSyrN0KVQGLrAqHI8ySiYLWj
X-Gm-Gg: Acq92OFv3Wz/Y33HL3BMMWZmgUsZLZs0s8nKKwbdlOYcw+23XJWQxpPzmFVF5Avu7dO
	5DsNiuIE08r/I6crTIGCsHnV3N9FSn2ClVlaYBd6UiJ+L15NqgJCqEaT0EaEB/snM1CqGpTrPov
	J90u2KP5k6zL4Wt63VSIBw1AArgTmWHpf9jMpqq4QHftwjjw7BW+yKgIGPP6i0N/9i8E/pLYtk/
	WaZNI3vRyP+swZla/kaFFaz83BunbrGdoCmEPkncgMMZto9Dd/QlNpipmyycVKzL3TzZhCLYuqM
	cMawHiqtsIl+EdIfFS70Q5CWWduXm79DNyze6CwosBaW7DaTQFNoRPDYh8lwXebuGFBT5eCtFvi
	NZbntDl/1f2W0seC87mPrJ52IACBs7gtaW8biHE5KLDIXSGMRX2jRqFu1kMNqS6aNFWCK66Ixs/
	zlxuHp1C+ZKnOIqX9AxvFd/W114FF0DEJ+dm3pXXI+OtcfV31LEwITzuLBxyp2CQ==
X-Received: by 2002:a17:903:2284:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2bd2f4f700amr59619895ad.1.1778731119196;
        Wed, 13 May 2026 20:58:39 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2bd2f4f700amr59619695ad.1.1778731118741;
        Wed, 13 May 2026 20:58:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe44sm8313965ad.11.2026.05.13.20.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:58:38 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:28:28 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the
 ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
References: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
In-Reply-To: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNiBTYWx0ZWRfX4CBOp45JXMlZ
 1A8NEO8A3zz4qrz+ZEvYKrvjYcDnVX9ONRzpEwGdseJtkc7pHkRdxQDZ6qEHw+bON87b/GmZPCt
 bTJ0ht0xfhu2kUW2RS2CplLoAk3ELHrsn+u6sZ8EyUeiXVhHLRo+ya8upClrsFy4kmWrK7TNoAY
 dIC6wiexm7pL4vdxHd8zpKo27W+pZXRmFf9jyWE71refazVDw069yytzVX2XGGmpT7tkuMuh+Bu
 4yyZLCzpEn3bZ9bozX6HefbSY3WVv9dtOn2edBQRsHFIF1lKVN9j/JYIW3HaYi+Q1180jLsEh7l
 jXkwihAoa95FgXOlpoTZ0nR7oWFXjrHppnkv3H2ugSReiHxr9ZHL1ReGJ18ldc49GTe+EOZ0gU3
 j4NJMcLmY0VUFQ0RW/VNmX0OgTDvPNXCe1lYNexVfbIXjxN8IWnGp/9CXRTJAD+Dj5b59DkbRKH
 qMHlDDuJNPyuCTfHcYQ==
X-Proofpoint-ORIG-GUID: PImY3j_ODRNS9kQcrpl7XW9-w2B2Nz25
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a054870 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WUYZBL7PiKyslTlvAlEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: PImY3j_ODRNS9kQcrpl7XW9-w2B2Nz25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140036
X-Rspamd-Queue-Id: 56BE453D78B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107516-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the PCIe phy on the ipq5210 platform using the ipq9574 bindings
as a fallback, since the PCIe phy on the ipq5210 is similar to ipq9574.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..1ac31439c20a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -24,10 +25,12 @@ properties:
           - qcom,ipq9574-qmp-gen3x2-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x1-pcie-phy
               - qcom,ipq5424-qmp-gen3x1-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1


