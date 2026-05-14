Return-Path: <linux-arm-msm+bounces-107654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBn8IgTfBWr4cwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:41:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 848095434FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B59B309F2FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFBE407583;
	Thu, 14 May 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeFw+1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDnypQ8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71B40245A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768883; cv=none; b=p2Ym8Ymw0X9WzL+F2aaYSfDAAahxdPT0Z1j+EEZK3bCDRL1kXUL0ahcxJ1fGtvZkISLYa4woS1MApJelaT2ZmxZaKr7m6cWsX7dCuchylkHOatdE2ptB63iG7N+cgVQf0PrN985bqkNatU1ouyi2KlLRc+MABJ2PUJfHnDvQnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768883; c=relaxed/simple;
	bh=jyTFGQNuJYDeqEOF9acNm3SghnFKZKEJruoHnHRlxUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YU9I2e0bwVI1J8Pc2EHDb8xbycOPiVi3tEn4RnRfLmJqtzPIfqE0JLZL1bxEm7q6HcDZgJ1rWciqHvpJA0Iqe+qx0jcDGh5YsFzB1+6saC+lXv0ByMlUN6YY+vnLUR+XIg6A7SZ3+dEopuoP/Yid6EgzU0kpcKoEmwl08GH/W3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeFw+1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDnypQ8o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeRUY3951635
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=; b=PPeFw+1iqoK7i4yD
	fpYlsdG3ljxy+3sh4dPRJHCnF1kZZGq0pbTpOg6NpRdQnSQnalBmZl2m4VZwwo1W
	MfzxtHAegc/+9SunKU+Yza9G09LpF1+4WTvkFp276pddt5T/Ffest7Agvw+WrGVK
	Qz/pH7Opwlpwx6PHf7TVBEmoBJiyXGRD+YRmn0crjUbP+XnTIxB3lpheVxqZM7oE
	eBntI/3hF1xM5qoKqAznBEJJKBoHgbh1TQNYfKaO/a9SXzL86zUNhyALPAU6FvYI
	P0CUSed9YbKmaj4JA5KN/+HqBZgNFHcZlK6KOCQg0nu3UFAGQ5BmyxunGVcpTB7T
	9JV9Sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kssxfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:28:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4654f9bb6so83928925ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768880; x=1779373680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=;
        b=TDnypQ8obk5EeBGwP7HCeAc49QoTJIEMYjJspS4+Bpf11VvWhnmIfQ8Yf1Gvlb7llf
         uVakMgSyUeVE/C0HvWlLSn/ccexQbcRVvkr/rwhCBYA8kM9BOfXKWA6TJ7cVzE1HT2rJ
         s/B/1CdAIbvrSWrBsWm1pHQzsf9UkNiUe60rsql6Ki+FWYINK/9j//tbFDZs7GvhpwwI
         aad3NHogekUZaoWqUV7dcd/iXsmXElxMoQcMhzRKPaQPfemHl1KeubwHfowe5I6mkGYL
         dDo3aulxXdrQ0iM8yNjQU+CqVExsfclXBhhAYu122jUoj1ZFqOH7CwiO1sWOOAJj9zqL
         xXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768880; x=1779373680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTI9rMPHkHzypbPrqZDsxdlgYSjaGzo8RGPBYAYLgmI=;
        b=EbKZb883QP5eFmkb5KZ8irNfn5GfDaYhmtRoO/rRJandfEitn2uXwZeC2zl6lOQaQ3
         umOORagRK4uLZiEKLwwe9QQ1ehUCo0DPUqgBcyq06on0PavOI9chF6kf6n+M8qOQVswC
         0VXyuu9vGrX7eGtUC5YcmcG4mB+eEixWlYqwl3sxk4wxr8OD1ecSHFYjr9HbUJg+i4VO
         6AcEUkvNzfyi35GMNycnk2xom144opjAPyYRG+/2zYc2y00CJZ6xnVqVbixvnbF6MYrB
         IXI4zMEJEyrTMqNwJLUMwoSf0Cw5GAGsql1wjnebLdAONOvWLAVoMjwlsKDATWBA0UH0
         JFXw==
X-Forwarded-Encrypted: i=1; AFNElJ8Hl2Aw1Hi03uyWE+xC8PC2Nz5v7uBJtKnh/oDN3VIU+lAj/uMhJryMf3LmxQzmeu0moifwBhFWgsqasByL@vger.kernel.org
X-Gm-Message-State: AOJu0YzgPb3zVUZxIUUHRpogHVGF/E3DqxXih8HI5Q0J5Z6qJgbWJbPB
	yvGS3k6j5Uf3rpGhgzkp/FP+L3CP+DTCV9pnY1lteQSWsmXx3AKyh/N2WpU9i0NGddCQkAg1Ha9
	QE31799c6zFisAtVXiGsWKBIf4JoFxzzNFiav/mE6hJuYW0c8ipY71J0JWDnN166u603s
X-Gm-Gg: Acq92OGS1+6lqNHsVXLP2mGMZu7zAOS92EXMYYO1wwpBDIfrirjxtrkLNTMh7GJCyfz
	KQY351tAryD3anLhtDx3Py4LL6WaXJPKXB4/GokFZZ6H1LlTRotf0Gajxa6b3dPmcPdyWzndx+k
	SOBE85aFO4Sbn9ElxvaWbyq41ZeI/ffNZSxJsOAm32qzS6D4NOg8TXQvsx5kX0FzPXLUKuxGLCP
	8Oaev4TPZbkiiVgeVht2lhVe4t3kZZdlpyYiuG0X4MAC96vi9WLZo6vB94nYfVbTMJ6X4tRit9m
	q6bV7gKBcavjK9fiWmtu23/UIAjM/0B0kCDs/q8UewlXMOEes3vQccua2Yr2wqQYuYNo3tR8bkg
	BWl+FGR/f63UVrKNpZ8riw6Mgf9prBU/rLpHISSBqfrR80ingFiV9GOoaog==
X-Received: by 2002:a17:903:2b0e:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bd275c658bmr90014325ad.22.1778768879600;
        Thu, 14 May 2026 07:27:59 -0700 (PDT)
X-Received: by 2002:a17:903:2b0e:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bd275c658bmr90013575ad.22.1778768878890;
        Thu, 14 May 2026 07:27:58 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:47 +0530
Subject: [PATCH v22 06/13] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-6-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=2550;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jyTFGQNuJYDeqEOF9acNm3SghnFKZKEJruoHnHRlxUU=;
 b=nou4cMkQGTWvLWiMi0xLAiR5Ug05Cqvd2yNDa5Czcy0sg0oQS4mbWoXgsTyUQkZGu/yUH68ck
 NEZsvAztiXxCcsCVfzuUP+ujvrxuvi6T/yc1+H1QmvujhSyFKS83E8u
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: VB3UAz2U4HzxkovWEFj8-c4ag3bTY3H5
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05dbf0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXxhzOAvZpC+ZC
 beq9wxC8xQc90VrqndJis8LpzSIIeFSSa8V3gqTOVTPJ5o6W40Hr2Sd+11YKpT4RSd+jIF6WVF5
 F24+Z8DbU0/BOgE4+OwgYOeZDqeUDZJNL4TqoXRaEvvusZ/GIitSOUqV7NuLlWBrPUY7tyHlHTv
 1MobT5BfqxD2j7FKWt3ueVyZLXQV+lXZiCoFXzr7LcSqd6M/C+SYobVs0MsbLTflvhokUzTYNso
 6OpEmUrADHeVCuzx8vxWM/M39m4Ahy4673Br4m/lX7tt28anNoFRcnER5wZ0DSnpCo8k7XnEWpX
 P/3+wFCmrQSd5uHu/HdmAH6JXdgtscQvapA3x9/1Fl827beJGKxE0PxDvJgAPPvXhnkixAPTM4J
 7xrQygWZ0EdDgj//1s+Qcgps0Jxh5gobyWtcJJs4SXxtKmnUneYKuSDddlTy5JweANXtLZsvy0/
 U9gsNO4zWmG5w5Zlubg==
X-Proofpoint-ORIG-GUID: VB3UAz2U4HzxkovWEFj8-c4ag3bTY3H5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-Rspamd-Queue-Id: 848095434FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107654-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841111fbb0aa8c0951dca411b94035c..5fdcbf331ea5620363638feb6f8105427a87c00f 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,26 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx is the
+          name of the magic reboot mode, type corresponds to the reset_type
+          and the values should be provided as per the PSCI SYSTEM_RESET2
+          specs. The cookie value is optional and defaulted to zero.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +157,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +289,17 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 1>;
+        mode-bootloader = <0x80010001 2>;
+      };
+    };
 ...

-- 
2.34.1


