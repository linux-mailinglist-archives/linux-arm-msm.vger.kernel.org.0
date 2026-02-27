Return-Path: <linux-arm-msm+bounces-94449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN5THqyPoWlZuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:35:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B871B72C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D85930D689B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1633EF0B6;
	Fri, 27 Feb 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZX6FlVEp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ko6PTFlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C653AE6F4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195607; cv=none; b=ikP1lkZikjotffBsCrgXGqu/c0yFGYRkZzUZzxys2zWT8Yf+ttKe3w3BbONwSrz4GMMDKW7AIvWhBJPTfUJ7GIk645iSS07QNJMV+3Yj+Y/GlYuKjZuihqniW4fTL7a/b4rOPWQvIWFCsM6n8tfbvJGV5BNga3bSB3Jvs0KxIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195607; c=relaxed/simple;
	bh=RD5Y18SkvNUxo/kPjIziBJKreqUw9LaBwpbFloIcFfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9aDDdCr3F2IGhDbN+AASDkS3kqf1Nf4Lc4Gl7S5JIeGjkoswlstjnA6QP+YykLfzlIPy+CukDR/EwqgHYwqYCnjeE+t1UbXoEy5Rjiq80QmZomAwK49t+QqHdmSHeuMPQw7dmbkFVtBamGC3vxSexN7GToYEQnRRRIIm3Id6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZX6FlVEp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ko6PTFlJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RBb9OX2663610
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiAy+vCzqXXJ5UW40ZL92600lnjU94FPvHKsBtkb0vU=; b=ZX6FlVEp5jPPQ6Ep
	IFmT0kelZZaTi1uR0MbkcqHLImGq7yqK5sOKRy0yWqPRDFMO7TPEu6hKQ3z+7YZ0
	Zeh+gOjbYXBQXqAsylvNQVXKb1ATui7uVKBWKhSOZPm/F1NJZAb+n/vbqk65aqvj
	4Mje0WIf8ZGf3cWX3TlBW2L5waysRp8yw8mOzymJEVxBTrCokOzoGWVGoagANQXi
	gkxxFe+adF/2xE+Yo5m8HKKilB3nPNhSLh0lSlLi/3RGmfyAvfpkDNFquBp9IOV/
	AuLMwtUK8U0swtChPWhzmBVRetVKrglNtsfgaHFla9pJsxTwEnZWkzaR+zKOXqWp
	f1Nntw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43r9gsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:33:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso11201166a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772195605; x=1772800405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiAy+vCzqXXJ5UW40ZL92600lnjU94FPvHKsBtkb0vU=;
        b=ko6PTFlJ4TD9iaXvn2RSXbmclVP+EkNwtfyk4FHEHC6aKyQh7/1ACVFBBZH39ELmlw
         rngk4RtKqS5/Bm7OEsgvwS1k04WcHSWmhkYjdRoJcyDNGehsy1/W1RZAwz9UOF0yFepQ
         UayJ+Y3KQJG9sFxQVaXg9xd+4cSW/m92aidM8ANSDkUr/xBqmkdSS71ILf3kHU1WhWco
         +rFcq7Rx8zW+6AJXX9Iv3PaK7YvxOBCz5SGNtUY+zHrViplnYsZ2FOodHaX63f3Fz5NR
         QM8keg7rPjn3XF3WsWr8YV3k7TW/q2jnsxKn7J+QyOC5hcFwOS1QUKnT8zdzK3bnYplH
         1uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772195605; x=1772800405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wiAy+vCzqXXJ5UW40ZL92600lnjU94FPvHKsBtkb0vU=;
        b=outQ8Es8lFA5JCg4LqzK3QEWh7Ca6O5+QaxsUN9L3PbY9lEuqkIugLbn9vq/DLzRt0
         J3XFOZUXm04BibKpo5G4/iDsSnwLUMEoi1dJ9eouhaT74ztC04TdvJS0opXgZrxyze3k
         cRB+DSZTwB46ycFhuQKzxrb+eurswedVrTe6ZuPOwmITbxIgpCgV4UGYGWLbC38cxihV
         Htn1FiURTQUFS5T3U/rH20dm2vQyI/ObUDkFRtIjaajNLuFUq2ncuQPouI44lzmcfLr2
         deUaqbTo5d3CR2hOaY+EBsRgdr1/QMmgS2H+eZagLuePpDKjwV78uB7biF6YMmT+g9PI
         tZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeVWlSr+VGq/Qt+Ej7DEFqxDCiyosvVeITfIVAWvXYqsmjC1ZK0x4Uk8980laubVDPzTxLfc6dGIoLFa4w@vger.kernel.org
X-Gm-Message-State: AOJu0YzF/XblMQR+xsO5CWBhtAhSzT7N8JqgUYn0X+GgMKsg9uNp9V0L
	jA1Y9PVN2+TB0lz+iKDmfFnibczMcaYW9l5E7xPUrEL6NW7VtaUpjYSCvRDsN9eO8Yc0yBTOuda
	c/ql7O47yrXytqAWys4nQUAKsAWL/1mTn6cFmC4gxvtbz4oYK/otC3F1K4S2oWsi4rdY=
X-Gm-Gg: ATEYQzyEuzWQYy49huDy4xe4HHkXaOuaXLOh0URIo1aaPo0mVn0SajmFWoRpQLCVyaV
	mWKATF4UwRGnyTpU9gaDpcrvWFzT/TDs/5o9srh5U04j607po+qO8Rc1BCD8yZLg71ieXUZPC7p
	FtTg/wd0ZzyLp5v5Mo6nVl0wfVYLtdCIkq4uNu9mWLb0aUXQ91ZH2f9BO8ozYhZ38nykyPHBRV8
	gEjUIqIU/rbqGGoJR0Qt+l6uT3i2tuVGV5nD7/4uEmZTiMBvWnwbTf5pIefST1Qk9aKcG1tctgw
	ISQGn5/bzu+7mBt1X7LToFwzWp5wF+hSYTo1Cxwi0dWVTP/8O6H2epvDeUrr4FMu52tefmipeGi
	hF6HOuBmhRjfc8MixPUn6CPtjUrdMVLy3xu/ah2CxRzMxkL1H6Y4=
X-Received: by 2002:a17:90a:fc4d:b0:34c:9cf7:60a0 with SMTP id 98e67ed59e1d1-35965c3b021mr2127264a91.5.1772195604681;
        Fri, 27 Feb 2026 04:33:24 -0800 (PST)
X-Received: by 2002:a17:90a:fc4d:b0:34c:9cf7:60a0 with SMTP id 98e67ed59e1d1-35965c3b021mr2127236a91.5.1772195604217;
        Fri, 27 Feb 2026 04:33:24 -0800 (PST)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593ddd103asm5005008a91.14.2026.02.27.04.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:33:23 -0800 (PST)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 18:02:28 +0530
Subject: [PATCH v3 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-b4-add_pwrkey_and_resin-v3-1-61c5bb2cdda9@oss.qualcomm.com>
References: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
In-Reply-To: <20260227-b4-add_pwrkey_and_resin-v3-0-61c5bb2cdda9@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772195595; l=1792;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=RD5Y18SkvNUxo/kPjIziBJKreqUw9LaBwpbFloIcFfs=;
 b=XSStU41aXjAVDPFIShYdT3Wiw+GPmLDQl5ay0lTvDbGZM1ki9sccwSSKGfk9/UxG0wtJ7czM9
 p+WnCOsfOahDoRT8Wf+5wpqmv6k/99dE1zmFfC9uewAsMGOn1nxdVRW
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: jACK1c1ei3yRCLKh2Achp_I4afiI65Mu
X-Proofpoint-GUID: jACK1c1ei3yRCLKh2Achp_I4afiI65Mu
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a18f15 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_AAIsZwEcCVD3kIwM0oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExMCBTYWx0ZWRfX+GE9L3oe8WYP
 N4po1QqOuGr7hsvvl+IiATXThsUYDGeGsPARW/yguxA6mOoOFIpZIGfIpm4A5Ld4KoFo3qtKaOR
 lHF85ZyQQO7MWueRj6y8TQ6Z72KN+T7QjnmJpPQFHpU+OG7Nh5KXRz/LjuIfVTt/OwOcnCWK4YG
 VvLQO4hC/uwJS7heRuzXeaeSwq+STn8oWJSM+iVpOiplJ1UThqh3gZP3cUML/bBEyWFAJ5kMSU+
 lN2XwWrHC3potH1L8GroKpd41wIw9+aIueYO5IewpEsCX1Sb/3QfJPdMiFlHl5+Z638M7aV1knS
 E/vgR8Ya1CAJq1MLxiV69FPxQNrGkQnf4nfQNjH3O6YYoeLLRMtuw2N5LMJ732odl3JWB7LkBVM
 NzzJMoScsYPszmrd+NumWZvSqdkmjPvbYHjft8DAjy8b9Vz3sRkWDmyEVVqGhLUb2tP4+VAvMRS
 WMw6y2+nNVBWU/w81Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-94449-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2B871B72C8
X-Rspamd-Action: no action

PMM8654AU is a different PMIC from PMM8650AU, even though both share
the same PMIC subtype. Add PON compatible string for PMM8654AU PMIC
variant.

The PMM8654AU PON block is compatible with the PMK8350 PON
implementation, but PMM8654AU also implements additional PON registers
beyond the baseline. Use the PMM8654AU naming to match the compatible
string already present in the upstream pinctrl-spmi-gpio driver, keeping
device tree and kernel driver naming consistent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Update the commit message.

Changes in v2:
 - Introduces PMM8654AU compatible strings as suggested by Konrad Dybcio.
---
 .../devicetree/bindings/power/reset/qcom,pon.yaml        | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 979a377cb4ffd577bfa51b9a3cd089acc202de0c..14b85b0d97da12c756cfe2ce33853501ba4ca46c 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -17,12 +17,16 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-pon
-      - qcom,pm8941-pon
-      - qcom,pms405-pon
-      - qcom,pm8998-pon
-      - qcom,pmk8350-pon
+    oneOf:
+      - enum:
+          - qcom,pm8916-pon
+          - qcom,pm8941-pon
+          - qcom,pms405-pon
+          - qcom,pm8998-pon
+          - qcom,pmk8350-pon
+      - items:
+          - const: qcom,pmm8654au-pon
+          - const: qcom,pmk8350-pon
 
   reg:
     description: |

-- 
2.34.1


