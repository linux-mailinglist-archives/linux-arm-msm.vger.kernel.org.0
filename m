Return-Path: <linux-arm-msm+bounces-108208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHXDB2oZC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:51:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1456E05A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CA71300E336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC8848A2A0;
	Mon, 18 May 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTpu+gJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMFcOeIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D28481FAE
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112209; cv=none; b=Rg+A/bjlV4lqHrwZT97oTFY0issxLidT68D9nYtAL6nJQ106Jt5xnEERZU36efI9S1FFYueJNpHv8TX812ybir93EnIclQag4rLqMU5bs8ia5xF/+mFxeEX5eS50PeQwtB9RWWzqXlN8IFNlBWjevQpFbNdsjzTBZm+chH+UDvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112209; c=relaxed/simple;
	bh=fpyfAuxqXVVXVUx6y23m8FTqtbLsqhHyF/u3USHTtCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPblKSLFqWBuADVn+ny3xj5P+f7gcwnumRZIQF8fEIsJpwdb9ySlyI1QfuOt+jdf0uIusYFhv9wtZZQeIv4F+CldQqJ/wX2N/Ab908/lzRyDuWVZTyBTN0nrJ/1cfMhYPWHpbci+s4pntO2Zfzgp3ufFLUs7Rg70Swo/ou6cNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTpu+gJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMFcOeIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHtfc2483772
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDqU1NSm48bX3qmgDYOZxIl1cMDyhT8rkY31oVrqSN8=; b=bTpu+gJafC/Md5Ay
	gqy4VZDNHJAD9K2NARbW4QAZ7U3yD1+hrSe8Vvqp/eczGsBKBP6FnzJUcXlEL+HC
	qzqAIl+QfXH1XFQB32V1XIHNIvY5+5qxI8VpnyefOR+Udzm3iWVQpwkWvEEG4pZn
	EeknNQLNNuKF8sKiSuimQPVdDpx+TR8s0gQClSBQKPLeBGENZzcdXisQXV5W1J3J
	CHf61FRZjzTY5DCu3QjQvhvjjMJo32DEsuSTEor5bfg9c3p+8Epv9nkWKQEnPVpX
	jHG6OKFSOutBD7NQdpwBIzkRgF5Z4vVo5zlQgJbj6MquoWmHIdovValZ3utEaA3r
	gbr5Pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvghx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:50:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc763c7256so54000195ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112205; x=1779717005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDqU1NSm48bX3qmgDYOZxIl1cMDyhT8rkY31oVrqSN8=;
        b=iMFcOeIpoVkmHzEoKcPovGNt8WPqgvMpHpFZExtM/ljWi0pJHRKrr98+rZp6I/Dth0
         pAetuH4WSVxadphiUdYijNKIsR4IboihBTYWd2/UocQI8aPuEajiujRFZc1Cml0yOcwv
         F1r5AmMVJVwYoCZUhDsymsTkFT6pUrR42W40a9wY98DTu1sU+MKg9ERa+riZU/cfbojv
         O++23oky5j+PtkwD2E8ltDeeh0YsT3d8aEOYnTA1P//nlWMz81H2JDv+omW0cEhB2boY
         OhqHKYY/2ao9tjWsnJnPLBe9PaKKlqQbazcttexq4AtAZlzC4K+AMI62KensKCBkLH5R
         9K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112205; x=1779717005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lDqU1NSm48bX3qmgDYOZxIl1cMDyhT8rkY31oVrqSN8=;
        b=R1hqPikRrhBYakwh1M9jjRDIKceG0PRjkDlVBLWL+L2YR6YKk59EfUFwqtO763mR/8
         IMOHkrIxpYDbdM6TzVZEi50aaXLqCQyddtxJm8lIO/bDXCNfh97qlJkNZx+G18G3zF7g
         6GrnN00N8G7MgPyg3gSCvvmnoelnjFSUBY7peqkg8vSA6pVhhknBWJfxKjTLYWf1DFlm
         6iTOikPVFtJmY2fcAAv4TsxnmWvH9C5Z2yFIw/vBihLK0ADfMm/qF+OwJg24gHfxZk1r
         Jhp124AmVCcvOvDKJJXAAZV5ahz8AilPsanaGnDWW1tOAjmiKmA3TyEgLhF0KOPfm+oa
         OPDQ==
X-Gm-Message-State: AOJu0YxfMbhoFTPYFsk2zJCHkJu4+NMmgSyYdr82Hzt3rLfsPbKCbVAq
	6JwMZwHrTwrGk4bjSMXRTQZKgw/ERM2YxYrRDozyPDkJcC9ksA+doqwS1GPxF1rOz4cpv9Cevo8
	qwHIjrWjd56zMW6pqNUas4WqLIgidneaHUSmV1IG6PDo/UYu9/q3MZM34jg/5koWjx/+TTxGpEK
	E=
X-Gm-Gg: Acq92OF+2SP4+7Dpz6tbSRguhPQgC29LPJckqw0XnTm0ki/7hTjEhJpZ701jeDnOcj3
	GXA38UZPIyNqTRUeDKYpx+br/1Gq77e9q+7ckKZc7e4gS2Fj76K8uh/RPZwiO3Q0aVpcpr/a9zE
	o1ASGu01INxq+3GBwM/38C/bd/giq8VBKrn4xCnJbndU3Z7E29tIG7SWV0C34KKeCNm8rAMYM7K
	X33FeSUlj2CwLnZKm0wXphwd/fs3XU9EltJJYOWCfAfK4yAqBJKt4nLw8aCMiGq1idycnKZQsTR
	Mu2jguk95qIQcZXVpqaSSbd9HhO+16pJf1chwFhPEg0IIFmsu/u7fH+t1C+aFhCskbWRLvIDg4B
	523i2XfjZoLHUIKbxILKPYKyfFzCJXDoaX128x1Jrj8TWRaFsQM8=
X-Received: by 2002:a17:903:1b65:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2bd7e7bdd94mr167994695ad.10.1779112205576;
        Mon, 18 May 2026 06:50:05 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2bd7e7bdd94mr167994375ad.10.1779112205060;
        Mon, 18 May 2026 06:50:05 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm185411275ad.21.2026.05.18.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:50:04 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 18 May 2026 19:19:39 +0530
Subject: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
In-Reply-To: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779112197; l=1556;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=fpyfAuxqXVVXVUx6y23m8FTqtbLsqhHyF/u3USHTtCs=;
 b=a433+0G5gAjzs/fjzv/ee4VIv5e8wLfIG3YETXZBCngvo7LDy2S4jbgYYUlm3abtaqzLO5dW8
 YvLxWXvlnJDDuc5sMFwGzndvlROvj73H3Wxb92lYhYXgVPQWSBLTUwn
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX2RJK05Y3ROkK
 Wnc4C1VcWUw6teoD+IPgGtC3KJY0g2AWtcMBkFtBmVxozsGKOcoyGyHxDgrq45jvXeNG59Y2XAA
 +YPSRF3t3A2UVxqT7BNHk81IYE3Z6ilvvWI4DNSI1A7onJEQoMnfIyw2q+vEbWLX7+K1DW7RevJ
 DvxtEiLiP+1SoNytBvxNHHFduudWyava+oqc/Wr0uezYlVXUlBzKBHI8jGRlp96L7XAsk23JZz5
 5NhMyvv6DZjsyfat8oLXGpvlEQjhqT7amW3BlrkmGjzz46Peomj/0alC06N9OF9O6u7M9tjCYP+
 zvmpCY6kzElFgTMiD1XgFZAcBsa9fee9tBvGNXngmU1o98kvisoqjmIT4lDP/VtqsW2UX3ueXgh
 gllt8cdNeFXF3e1ToJVj6gLJqvxDyf8iHsmKop5IBZBAAAZUWiifGuBzavD9pJX+yYRuJ6rRtIV
 BX3Hm6HgUSTTALMjtHQ==
X-Proofpoint-GUID: zRPv5ndfonPRtUY_DBUHvAiOiMDaVLND
X-Proofpoint-ORIG-GUID: zRPv5ndfonPRtUY_DBUHvAiOiMDaVLND
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b190e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Lbdm12_SwBOpIOl6TaEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108208-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18B1456E05A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the "qcom,batteryless" boolean device tree property
for the PMIC Glink battery manager node.

When this property is present, the battery manager driver registers
the power supply as POWER_SUPPLY_TYPE_MAINS instead of BATTERY.
This is intended for 12V DC adapters, where presenting the supply
as a battery would cause userspace to incorrectly trigger battery
power-saving sequences.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5be18e404591e3f0382ff2b3f7d168..5f7b90d37ea09d9aacff463b2ff4b76d218bbeac 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -72,6 +72,14 @@ properties:
       - const: charge_limit_end
       - const: charge_limit_delta
 
+  qcom,batteryless:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When present, the battery manager registers the power supply as
+      POWER_SUPPLY_TYPE_MAINS instead of BATTERY. This is intended for
+      12V DC adapters, where exposing the supply as a battery would
+      incorrectly trigger userspace battery power-saving sequences.
+
 patternProperties:
   '^connector@\d$':
     $ref: /schemas/connector/usb-connector.yaml#

-- 
2.34.1


