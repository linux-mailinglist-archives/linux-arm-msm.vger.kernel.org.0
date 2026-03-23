Return-Path: <linux-arm-msm+bounces-99200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIaNE5QbwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA632F08FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C402304C2D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74422390998;
	Mon, 23 Mar 2026 10:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTd/gwOO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGQPDJFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14668390CA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262756; cv=none; b=rmgAjgse9ip3M1391FZPpOklROeTrr3DwzQOuqaAuMpwPD/czdACYYkSUSuDxVHyvILeJLiqEpspRVQCWP2jxGQsBX8nkjiCJl5yaUb+/G7dDhxMqapV84kqzjbgZbteroPzxUFbADGk/ycWITFbmuUpjz5rqFWmwSUzZjpAkd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262756; c=relaxed/simple;
	bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SinD4x2DbDQymAjuGDoV/7qHx2KFj/ZaqJ47Od+mTQE9ISIIxZrtKuIz71WMlCdjmQOxSMZXLb68AfTRmcWuLPRfFW4XcirZjTXq1E8r4Ulo1VInHTs0VpWf4bo+6eBj2EW4f0xIiV/6l7UjRNkuUXS9o8VbfeUUdNwfy9ElpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTd/gwOO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGQPDJFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7VC121493622
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=; b=KTd/gwOOf/EbbgJo
	KxFuHjd/VrzWTBrgK8XsL2VryXdmHIbzRosiY8lLFhGaVBdMZsqgNev+0Tkw3Hek
	9j9aAUZNnXxPR9H5XkEvnNeKmNwMhrug9nZ8LYwVc3CQaDFWpbfB9EoVETmaMTJ5
	ntWzCoHUp+5IqgXCCuZMj3wEsLC98tTHY87DmgfwhD+IO5Ec+QEj6E2LGI7OdDFv
	bnyPLSfPSQsBWnFWwb/8GBOFs+KcGv3anOEXpYc35Tui5Q+nYLT4kC7E9+GHIhZP
	wct3scZPldZx0s4hQZnTYJsSBP1dKoLhQvDKkU6xSUMan2PpRcsJNXT/kTPynRCD
	ERooyQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5w0d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:45:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aec07e8aafso5220335ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262753; x=1774867553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=KGQPDJFGyWEZmrjNV/sZ+sVX7h6BoCPR8V73Ui/ndfnPIKFacG3qlOyVNUh0JRA/ID
         B85r20/A8BU7epeLw2FIl0JvYLAB4JAhl287OKc6cT3jRWCao18JpHbzEbh2VFfpaXXg
         fZJ9OrCTyceDq6danJMsuxBSHJJuHnsyVYdJW65FzE3A7thieCO7ZCELJ8UwDCNt72R6
         Rnwv2jOy0veCFaaNbbP06L5r97V0BgdwGzuk7LwV61eHf/4TZ6Xqhnigc0UK/22TNI9e
         8crgAYQ89bI5y513xmAMB3sTJipiATkqyhgBW0Pmle/wKnvdLlhCv5Agfifyn7ChhI5w
         L1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262753; x=1774867553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=jNgx1bkG2zCgMQizQVfV56QYQ60GcxVBeeMby6j6z37DvfMkyt1p7LD3sAUsJ1nBmB
         CiPQo0GboWOo659uB3cySnECU6/OWbvWyaD3R7vTDigJiV6aYL0m/Pb25aOhqNWVr8dH
         oAdBQmpB86dfpi7ha22hIYDHvRoBx4tDpDnwg754YQp1aAJwSh9j2PJQtitDm/u5iZmX
         oFv+U3xWgD2Wk6RNjjINsqGplgYNdesUwnmXhOv3e4U12d5kUwPENO5UyAdLDnGQLJGL
         VVRj5NehLSeEwNDTe0hBko0f8vfTCcXnwDpqylhyPnHpPfhDjBHm78HPW5syUhlhTPWi
         Zokg==
X-Forwarded-Encrypted: i=1; AJvYcCVd5LNqpEs94vZBrZ5CKtZAPezVs2mO1YR7fQysnZ53WKgr9aLCkoBkpP8HaH3LPIjbbVXMY2c0xG5fDEca@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7u6vdqV5LFTuvi79UK4FI/conPdM1q/CfMl4uT+dRBZ847kNj
	UImdgH80inWTDuc9ZaEFOVRlAJw53DSAn58PXFyyngyRWgh7kSZSiaCqBANU7qINIX0uaLB0byR
	UgU5PuVczVPb3JW0jfHEzS9dlzzof0N1A+jY3lYjqyQ+bRAwqUyhSXyuE0ZJl3VQmLS8=
X-Gm-Gg: ATEYQzw7NSbGflOpJT56dL9wTJBZ7jA48zehL9fU42+RIIau3qQpvyeNKzGjdcaaGUS
	5bhAf6e6BZfICKFvCnPFxdCEA40cTqgJSkGHvdF9Uv2gM7xcTxLjafciJvLjcQAtcPXOf4AB2fH
	G+h6QWpS+bEHZV0zyiFOWdYQi+9/v679fLcPu/F0uHBFOHC55MDnVeDejqLG3tpFZAzzDIrLjeO
	yzRI2lkK6IisySpOTNwi2at3voh6xJmH2H1FBQUSF2nuVZCMSz+qGCUCs0fNhOQeFeWjgYjTeR3
	pc+r/PWCLAXEimyXpCYpZN5Qrr0QgseboGXkBdfv06YoLQeofAE8Q5EGZRNch8ki+++APLKxEhp
	A/fPPjVDIKdXWRXH12X3wM/QGHGxAp7iJ1u+tjg8HuxvBJFvFoUk=
X-Received: by 2002:a17:903:191:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b0826ffc53mr106427675ad.9.1774262753164;
        Mon, 23 Mar 2026 03:45:53 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b0826ffc53mr106427395ad.9.1774262752623;
        Mon, 23 Mar 2026 03:45:52 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08340c2edsm123454225ad.0.2026.03.23.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:45:52 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:15:16 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-add_pwrkey_and_resin-v4-2-abef4e4dcc3d@oss.qualcomm.com>
References: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
In-Reply-To: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774262738; l=1670;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
 b=Svn6C5I/dHV9C4ehkYF7aQh8OUHsKtYahZmSzLguhV9MsNFMH2T4+nmhaTRLEo+Sj0SCRDHiH
 LdWDSKM+tamDfjCSFmmsmLEUwxub/1iaEfJ6RSIRWZCNGhUtriOqFQa
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c119e2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=f3aK1VMAgMfWcFvZUCoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfX3LNfdLtOdzoQ
 zeniaPE/Jf9J36C7hFPERTuQ3JfKYhGadGxAgSSV4nEf+xES7Q5AlCM472ijVkq1QaT0Sx2B/p1
 6UyTX4gmdseAgVLaT70LeeVijC69FLBn8e/abbCOUxuwItIjxQKn49IZxhN90yFiUCpdBCJrBQm
 9UkLmMIzxP4o8v2ftTg4FAeoGGSSwg1kQG9zOiIQM9LgGXWGDrJZMWfWDAcgsIRc2lc4KS0nJ2p
 yI/4bWHY0yDUjwUyoG7AQM3834OUPXjrNwfBlhslrI8+zJVvw8v17oN9pALOj/xQOrihjbiTnDp
 hbh2kd5v8ad+E1X2eVNYUBY1+k2JFP2g39g3xABPeXwY33jEXHC9Tow4PApJWwoNVv+5qWExqDu
 g0dIypSlDtalFT8jsDeiV7eIyd1vtem0+KZo2gJT4vtZ+WWwFQrOMQ9kKYyHPoig6vRNASPlrDh
 L3N67qdt1F0iP6E7wlw==
X-Proofpoint-ORIG-GUID: XLTV7ot435pv73N7pPupxnrV10wjSWKK
X-Proofpoint-GUID: XLTV7ot435pv73N7pPupxnrV10wjSWKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230083
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-99200-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.23.212:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.4.176:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BAA632F08FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Disable the resin as suggested by the Konrad.

Changes in v2:
 - Add new PMM8654AU compatible strings as suggested by the Konrad.
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..af4c38309efae89479f9a11fcb970a4c18f03a91 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


