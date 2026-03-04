Return-Path: <linux-arm-msm+bounces-95423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HI8Aud3qGnpugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:20:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0F2062E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0EC731FE7B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 18:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF76B3D75DA;
	Wed,  4 Mar 2026 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Da9I29IV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c2xediIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB983DFC81
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647451; cv=none; b=eEEsjW/XUKijVdJpw6lXWArPekh4nl2RZkSOzj7Qsgc9wi+oYK1OMMjWABzH/QyLCqXBdM9jd7y7bPCYNuVhb1qqYFVg1gIDxNxKtyAZY1Z219RHQRuZjFDJdH4Gd6L3NuOj4FQv8JYdD0glot6e4u9cOIN4Vka4tpGHdMmLuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647451; c=relaxed/simple;
	bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcGpAYkoVuBfbC6IlZxnA9dapxyHu+pAIWQObM4wacHcFu0HcRtLXz+L2oqkhDjGwFbGKKTS631kShrH04cnHya8FVnqZD3ozmjN+mv/S5zAQIt4AUD1pjR2UWksHuRjhvHYC2o9hmuMpMSusG4xqGMhK0/TD4tzSFnh1nKgLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Da9I29IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2xediIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CNa0l152520
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=Da9I29IVMwGbl9Ea
	c72WmDPOX5rt5CF0pF7Ff1EjoIZ/RQpe64bonHHhQxHdNQx4ThPTmq/Xx8Wi5DjI
	KOQXKwbU/zqDIn/38cd1q8wOH8y4BXd4xTrdBbUrnpb55XHTrYfdFZcfaN+K7LLO
	L6ShCmfOASQeQh3/Kn2fZRVsnSq11UOOuGhOZXOP9+D9E7nHZ7ApV1dagKXA010a
	Vv4j+MV9m9sTQRbP4aU2HzO2wqO0TICpddRZ5oDruTm60HgT2fdgnko9uROAaSIF
	U/dgSDQU4ZKesjhP43MSM+lKVyO+us1TWWRzxy5xENAQn+x5qp5NOrqO9cMrVCDc
	Wyvqmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvmpsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 18:04:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359918118ebso8786695a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647449; x=1773252249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=c2xediILSvnAdd0GcM9ISUl2p5iVmQxeTBHGiNiftBfrXiJqEm0hEE3uCbNfvNPZnh
         4LGr0FEuTTgW+Hkfccxl+X2t6dU7iu4xd9o0pWsp4D4LgVk5ULZcma1xlvn+kdL5Uav7
         oFrw3Z15AUzuGBTj+nPMlsi06MqUwDL8qBENWhY+hizJrYcVW3Xm1ROlRInBpQwuHFvE
         aGscM31tOY3CuZJx6qpm1w3f8SdGoMqxbxTSQjUw2gTOy/CGBMjcKb39c9MJWHjNMnOX
         avhnsBoQ2teNAKcFDZJvSuT1e0YTa4mCY2ohVzsozhHSSMNXxqe6bLzDuROLC+SuUk5T
         JsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647449; x=1773252249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=L0n1XXXDBBP5vk+zpU4m7+r2GCoT+OmErEQW9pnp2ncPL3YILPGDuodfQ50w8oooex
         SkTX0KePyHp2P//PsjvUHxXr1av5q5rLzjTeX044SP6oHKxLjlgHIMYyHwEVukpJk6uO
         bpfA6XDpEynikAcyqOtV5rQbNnSqgm8nKntec68L6TuropbaFkODTtX+kfPmvlFeNpi6
         NsHzwOZ1SPGTNzmeNDHKRtVYNZxQtelcu8UZqFQaTWTfwGd8IGCl/vQAJJIb8t9QAoeK
         LzbMfwWMV8k0zIcYu/hrimAQUsV6ICMrOCS8jmCp+F1v62UxSWkEiBFM6pLkS2u3ukkU
         knZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWii5JUaj/rRJGgRin3d+zYqfW8tl9D8deho+Euv1FWH+WD7KNAU93DPsjPePpYvK3rMn436LjwrlTcEpXL@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7UDcxxXXBdE6oUKoDliKihKD9nNBls2zrUhIy9ynflyLw1tg
	wjAKdkNhhp3YpljD1r7NBkIl5aa9VJgSqeilhw5vxZwNaUDnEODzADyWXV1Ul6SK3M0jMijAnjX
	UCBg/v0Byu7zj3t/UuE0rxmcfD74YWREmdDqplVOYlSLCOuNGUB8xX03oXK/wlEUlzoCl
X-Gm-Gg: ATEYQzwLGsfIhtwlUnxLYN0szPKRB8tK4O2jFvosRZoYnImjDZG7Ao3u60qUMJqeODV
	i5v5Rae2gUiCtGz8+PbDbt7rD1E1uberqdJch47oq5n+xVWfWBnYUCGsULrMTGz/kmN4ZEj7Vj5
	Jrj9LdP3HHdnVXhJkI9utnO9PnSYXdl+rdgZ6C5IL525MC26P3oVSmWwS3WENLce6WVXOi1ihsK
	Q4Q3gd5DHAQh1feZTAIZVgDqn3BN1ovwVd+WRRxxTXouwTT0alEqCjQ2hsD1THmxQ57NiNrma0Z
	MhwBbxwtlrKSXouhAyWksnTb3wkWrGCYLipC9B0sFxif5kH/D0WBkCBUqCTb/0zBwgR/OTTNe0U
	sDkzEhvC/Qxy8Edr11+WJnWOxI9SCOKiQNjfWtXVV2pMNgvuQzkJZihroAQ==
X-Received: by 2002:a17:90a:d604:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-359a6a661c2mr2569396a91.23.1772647449514;
        Wed, 04 Mar 2026 10:04:09 -0800 (PST)
X-Received: by 2002:a17:90a:d604:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-359a6a661c2mr2569368a91.23.1772647449023;
        Wed, 04 Mar 2026 10:04:09 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:08 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:05 +0530
Subject: [PATCH v20 05/10] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-5-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=OZx6ByiWkGv3E+6If5hWQp0cKX8PXq1wNtaOeIuzjnr5JeFhAImHn/a0+xFkU8UG/ps5TFj2n
 9Jc3aA3+ZH0BjMvyvVjj4Darm9xBnR8dtDsVx+MXkx4rc34mEfbRabt
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX82UM5ha4LhxZ
 qeJFkdym5UPJ6MSs1A66G5sSEV4SQw/0uBc6kBMR1dfhon5CArOLod7kCy6PpOnWE8O5C1d1U1s
 k6Onv5+Xv2RE4mEZSgarLH4RisbjIxvp00FIirMssul8MB6Tg8aWOGZxYMumCB+c3odbLc/ILgU
 uTxUtYVn06WP2axPxlVcDLsrT+pEqbFQ+ICigRtNe7xUcjB20+OnnPZy83vhlXFKhJ0jRrXCiTH
 /m6NvGNX7segieQgtKuH85CFgub3S66q0j8yAev0h7KNJgHa70hVnuG/lbrJwuEAZh5vcbLnD1J
 MZwv0lTYbLM1YBzS3Kv97Yg1XvflIXnEuKNa3n8JBQ4ew0nd1rKucOBD3UEGeh4IAOY4qljPfYj
 6GcgAbctGU8O/2yxtvf2dXfaIdMiNyH/ggbnqGinomg/pJmYOOQuQGATsXXDVG8hxrokutQbO7x
 5LjI1jMRhiolWJe7YCg==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a8741a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: jT-vLFY7XmI27NjZwC_6MQngqWsyksDS
X-Proofpoint-ORIG-GUID: jT-vLFY7XmI27NjZwC_6MQngqWsyksDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040147
X-Rspamd-Queue-Id: 7BB0F2062E9
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
	TAGGED_FROM(0.00)[bounces-95423-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

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


