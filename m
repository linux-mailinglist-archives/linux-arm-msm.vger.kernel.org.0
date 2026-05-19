Return-Path: <linux-arm-msm+bounces-108450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAieGBZCDGq4bwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0ED57CFFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E00EB32B4ABA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6654932B13B;
	Tue, 19 May 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvzVjYFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLgPnZT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8132B120
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187693; cv=none; b=L9OJ40XhkSrCTsYSzhlyzcJoWOMY3rlailGnIRQT7LFOp+tZVGxj8M8IsIjNkEhM6yXQ0bZSeSFyCcn8+1GelXEntYl1wjF87bLR50hkJHIHXxlvOLnC6a368C5qPoHRl3asMRkrTav5yB5kAmDgxza6WCzhD9eMGa3pivSNlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187693; c=relaxed/simple;
	bh=4fWwIr7NvRH0x6FmEzFYjJm0PsCxwUfiJxfBSBAF93k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bK6AP4iJelP6+7ZjX6c33kogM0pT9GpkWH+OdJIyn4kbEkoekpkGvUIv9RiBONPkT4T/1UHN7uLcWYtz2d5DYqO+2ir998CICZ9ImvfOxdUhNet/GGxZmk0csg+ZauotkcWdkcf5EsQL/CKMfoPPDVELD8e8hKRXo2FYL9qoYSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvzVjYFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLgPnZT0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6gnTY1737124
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=; b=CvzVjYFRfE6ul9mG
	yP8OXxNOsI2nmmhFKzZs44CIsDWEM2Mu9/mVTJ7KTg3tsLnikkv7ZD/XoIpuoCr1
	CPat8/Z8o6i1rFsLTmsIcDETmZ2Ih1MQSmJB7gfj2dEkuwQrIqVgOX2VxXJe8GTH
	IVD2TQIc1Gn9DWReDotAyd8mzbeniXkueZXmNvY7nZv2RB8GhT8wB9GF0m38tvAX
	m6oW/v9yuPp2+OQusk96znYiu6CD+sGdrKEfnfbuteHMcu/82SN5+0HZIb0VCpOx
	pZs9/ROseewOfSsSDSBISpm6FnuC8p/8CmX5aRNLoLgldWtQWKmFOPRaQpy2s/7X
	2a1MsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ju9119e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so115740171cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187690; x=1779792490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=;
        b=hLgPnZT0tXJNcPoqlJgtseF/LDtapK/9yEebR7/ulkIz/7F9yuUttAC8pSRy2rda15
         eEQBN0Ri84JMcZp7l1BUsABV8Meyc89DYRGicNfSUq/ct4HRFaufKhZC9jxmluEeI+Y5
         f1i75UOqkaRdF1vBrQeosKmcW17aPw9iaVQhSoUyP0yoW8bZYgXBiUe6DX3U2IiVqJuz
         Zjrp0Kyrnohe/M9/+AWk5D0Lb3OyaumLF7DVy2QFWBdvEuaPmrOSmmZgaNO0XAUOvbMP
         b0GdNds2DTB1MQ/nrxMxaEwtTgk4idq7G9LzBNk3LV1sHyhe9mqTQBp2kki+PIcxErOg
         B5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187690; x=1779792490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tv1d8PFp+G+OAAG44DAFTPIFms3boK9ZgzhCBxGWI+8=;
        b=gy/HFlGVK0FP3QNzTXNqd+8UtY9H3rYUhaFEvOrPRLlt+Q8cugYChJYOSqGqOhcMZl
         aNrTN96GRZw/I5I2Ix9Qw9AiTWFMAoB2ivvJo/cILk4d/gKnymzN8mua/8ylQC2jwuch
         5PWdwO9ira3wPuykpHg26AkMGfic9ULEd8K2rg0kGdudfHrhW4nXpv3m0KU6IK0Drolx
         tjnHMsFlygrhVBg201q7TUvY8gJcrJpM10A8+1/463NSDFsDc96Z5VvXp5vJMpo+E+Az
         h6tlSuvs7J3QXtDfMUA6tnvAzmjCfXGxV7TNuchzEo4p4VvmEaQDkSVqsZ+tZHDrzAcw
         RKjw==
X-Gm-Message-State: AOJu0Yz6urL3oQDIYvkkCmD8hhj9tbyPj/j4K/gI55gAmA6jam8onfaU
	gu4skiSiBZaUi1ZWg54DJQYfHZIERwk0Zlg7vwUUDbL+ztsjMZQ7xVK5LdDh1j57mvIdaRQHMdI
	1lzbWh0p9SAbdrAR/nwJNj6damf5GbGL8kFTZVxxvfb3b83B+SClTP88+sSuamVJZPPnW
X-Gm-Gg: Acq92OGOF05p+Rm0oh3soKJzSDcNKCHDQUNg3wBj11Ct0VbJHzfn1AUt47Do4iHSLA0
	2Dwhj7scOFEsZBqmhZWtVsxSe+3KJQw2Le0vI0GkndhqCa2eQ/HPzFkWiKOotXvzfN7MC1eKcw9
	/OTNjZIhVa9zkh1BnvQSladenUH7dY6ss4P/9abI0sFRXkfjlOJA1thJX0fw3a8lNcLLcjvi39Q
	HoesLkNNB8HI4ca4c8D0xfflC39Q5KdIt25h4wHmuZVuFNcpPHtU0o886QG1hdBCWtXw/fWPODq
	9Yt2+7tZj4IGduJDJHSiK9WctHj+W31RVmSTdTB1I5fB9FNySlBVSYYNHMaPgFDMu4oJMQo+GJ4
	fc/nwDWooDk3cgascDd6A+70kf/pGDcdP9780/TDK5PpFJbXthMOjVRtrqF8C3gl/lEqiKnOmnu
	po1eYYjBXni3gHpcEFgdDvT6ID21H3EbbD6Mk=
X-Received: by 2002:a05:622a:1e89:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5165a26c6f4mr257681571cf.57.1779187690359;
        Tue, 19 May 2026 03:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:50e:5de8:6458 with SMTP id d75a77b69052e-5165a26c6f4mr257681321cf.57.1779187689930;
        Tue, 19 May 2026 03:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:03 +0300
Subject: [PATCH 1/6] dt-bindings: usb: qcom,pmic-typec: deprecate
 device-specific VBUS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-1-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4fWwIr7NvRH0x6FmEzFYjJm0PsCxwUfiJxfBSBAF93k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mDo/9hF9YmNtf22Hh0vmjASmvXnXTPgK0e
 IuG3QEymNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1V9oB/9pNJFUqdVJq025KehmqUU8Fg75+ChcgiP/zBpiv6i7H/kt7vrPuUn3xRMtQSasoZbHYvW
 7zuIFbTgpj1gVBS/usCI+GdbChO2YI6/Jm1aCHStYBPRVIfHY00GUXfvcb7IpJIC5RYCC8ootxu
 1n3p+7NnxH3OCFC0uEfyezt1NeXj1BcsVOLV7VzNv6RtC9zAlLOsPOvWmY7AjnQ2RueK1VHM7Gk
 XC+bMZT7Z8V1KnQ09qX7niKQs3J1F5yV9eAFCA5Yf/1OKV9C5HEFk05YNYW4RGqb+SdTDG8AVmH
 Ci8UB3fiJk1FWmC2c41K+A0/McTf6lMsS7xSXelzfdqI4r30
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NtOM-7GfohANiVZq8CeWrX1Sx2NoQmB0
X-Authority-Analysis: v=2.4 cv=eeUNubEH c=1 sm=1 tr=0 ts=6a0c3feb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=NGvXnOm9UF3A347_PzYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX5EqR1x5bfPEc
 RWlo+JOiYQUXd8dWpbViOGFUXcO+dyoVcAJq11xNKmqF0f9pwX6+65lCBbNs4KIWaydPgxpxsoQ
 iW0cJfyseR6RcIFLEL98ze0eq8oPMEg4tohmZr3zLo9QPsw8b2fUoFLqJawxzYWCX7rRMnF3MBM
 JGVOmxVyVNym3VbSFhS/xxqV99j/epOd1/f0oHAlfTOcRrhV42/jZKBRxia2vVi21JIXTUMBiKn
 srLMLKldPq+Fi8oG8bhhfIAqh2hHMU6ZNEF0gI4qct1FQz0iWu1BQgC73yx5PySp+nmQ3ZrWsb1
 nkCk1Oydguom5IWVNeJf9co14ivpRJT82s//JzOw67b+GbgzoDT/Pm8kLF2woI6XaB5RhTEy/l0
 LIMMxFvMmh0U3HpoblQKvYonTDKj00IBMTuMtEQgytip1DCxb4HH5f6UUAu0bKyHVIDLEushsyF
 kYHN7wY4sgkwh/FwL0A==
X-Proofpoint-ORIG-GUID: NtOM-7GfohANiVZq8CeWrX1Sx2NoQmB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108450-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE0ED57CFFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm PMIC Type-C devices historically provided their own way of
specifying the VBUS regulator, via the device's vdd-vbus-supply node.
This is not ideal as the VBUS is supplied to the connector and not to
the Type-C block in the PMIC. Deprecate this property in favour of the
standard way of specifying it (via the connector's vbus-supply
property).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3fa2bc9cee..7a68423fb97c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -79,7 +79,8 @@ properties:
       - const: fr-swap
 
   vdd-vbus-supply:
-    description: VBUS power supply.
+    deprecated: true
+    description: use connector/vbus-supply instead.
 
   vdd-pdphy-supply:
     description: VDD regulator supply to the PDPHY.
@@ -94,7 +95,6 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - vdd-vbus-supply
 
 allOf:
   - if:

-- 
2.47.3


