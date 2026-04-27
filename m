Return-Path: <linux-arm-msm+bounces-104783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFsXC6qe72kbDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:36:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F91477B74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13B94300D1F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E65F37F8D5;
	Mon, 27 Apr 2026 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIabg0Fw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akNrQzMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09363126D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311378; cv=none; b=sCQagiXyllMDfzHpu/agg8x5LpTgIpXGasU+M8REHjFL7EIOMlRSVI/TT6FB/ROj0JJ2Pf2waz2iooV2uDJCSjYF1BcpwfmQOaCa0bcU0YyxOZt/wpreHIdjfRvmUWhSymtD6uD83/uiKNPpJ80MMAeaJf1FpwlXvI6kx3KPtME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311378; c=relaxed/simple;
	bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pd1snY4QtruoLdSSvkVYdCEgGZvZc8VU+2YJj+RQto+tqHJR5hcXjnJlhBhbatfELEMJxvm39EuV8+tBbjnuwti2oUfAlgfF3E58kK6q6jh3xqW8jvejVrvLbZPf1CifbInTGVhJUtUdYE4FyQSjF2P4grOc4MYq/dkS8Qa8jUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIabg0Fw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akNrQzMb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RFLUlA3760591
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=gIabg0FwLPE9SRzD
	3tRU9MsWqNjMpmEiRRi/3sk83rdVBYVO5cpgUkPZDn87Yr9f4IT3fEMVshLO5U56
	9BKM+gB23Fi4JYl+Z5msoS45PR1WyxNarhcke91MbRu0tRY1IZ0Jq9QJRRX1JZMQ
	G+1MxNiV9OX9MjVo/KLF1wncTKJP2y7ZaqRAWIRhMNvBzpVqgfWWxEKpNmLGX9wg
	slxAeFSw+5trK6XrLkcoDOVLdQSlGy8j41NlGT9NZcT5l21dS9jm3S6DSTSmTO3f
	X5jyMGYUFeFz10iuXd5WdNrzhuXJUKz3Q7OK4V5l4rcluTtswwGen0Z9I49CNEyc
	+IUupQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtacdrgne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:36:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24a00d12cso106647245ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311374; x=1777916174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=akNrQzMbPhD7AX6Vp6RbVcbDEJqPbXRRzDJQ+iHkKs8lvdS6L7EGll2ku2V6aSl6bd
         gfvGSsaveJvkZLtvbxIvH5tO1Fof64nYIEd+/iOxeT484EoNNi21ibeDmtDYnG4qlNwB
         q8LdtsjIES0F0xJKiLeHlGNgLU02iuPQuFfILB+C+S54q3/T4LpU/+XOhwwNekGqAwF0
         XiNmfGDlsIWu1cBW8xlDXm13PCe46tmv6tNd0MPRpwzg1bA/gTCn1wTjW9iUv/17qq4i
         CaUVtxV/iS3KaNESWjQTr0aidTmYdoqu5ev7wNuMqe9BefX1GrnBHjMs6C0uWXs6y4BG
         3TRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311374; x=1777916174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=TGxPwBAtEAegHe+2H+iWZYExLfiwE+O7USPbnsosDmjDEa6qXwuwmrhkFwhsdBT1jC
         ZOd/0TrYpc6XoAPIaLFpVazS8A3+SdAV4KUkJRa6XNJ9Ybfmo6dD5wJipSubfVuSHDPd
         U9l1zn5K+3u7kx8J6g2SpNmPARIyLgtCaFC0gQWiQQD4pA4zNlXQrLDi42ZrJDaM6wTF
         KdEeYCWkk4zKajBBqo1MPTStWLtJJ+M3IGTP0KDfyjGngDxYep9IZIELeSBGF4BoWOGj
         Agg1sayeQSK907l7B2LfqyDTdk1pai7C4cF3mT1ZFVrW2wktMM3nAIOZQ/HeWBObfGdY
         RZLg==
X-Forwarded-Encrypted: i=1; AFNElJ/G15GR737elQONBRfoyjnsxjlWkBK4AgzeX+/lyfAtU/BMYfxu+S1/bxE69u3AAshT4pYvwNZwfCgqq7wk@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIOwYvvL7qbe35Fqh7JZVg4CBf/tG06uHPIMn4tLbAAl9IHec
	9fn2tOF/b6QM1AIUOY986vEcX+jD03/NHL9b1f87/5gI7cMUchL6vExwKUArixxH1tKJaWBaZIl
	glhNvWqd9Dy2Cm8CkVwVYWw/HpNAmFs+k4Ky3wWbG/xNwvGApXSjFO9smPPngLP/oEvYF
X-Gm-Gg: AeBDietlrYjp62CZUWiRsGqXqz2CHiMWhYx/NUzs0q6Fj3+xsPpdsBEJyVqUy9xoJeD
	j6d7trfrbthaRuppobHKNt3UP20bGJ9uGQbgry2ph4t6s6YHqA9QUzAptilOolulZWlVYXIjjqh
	diAQC5IPATLkuYi5vD9UpUEWz1DMzCuK4ER/4442YLUNNi7ZQf8hkhsQvLxkGRSQ0Hd8VyXbGM0
	xJwqB28gXY0fc497HcRHIfCKGYaAa4vWtseDHYsjpsvdAVjo7TK4EEO+7zUo065tBWKA0KpJRhm
	5arG3pDjrAdSXSunYyfCdqhYr+iybo+fc3y6UM3FmDl6VEPyw3jisI5a8oQsPvOYv5S2mZvgrt0
	o6ayw/kGa1PlBqjn1Q/QTY7LRz7znWU5S625fm4cL/r0AhxMrPq0NMliM3kt5XylfJeny
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1695435ad.35.1777311374221;
        Mon, 27 Apr 2026 10:36:14 -0700 (PDT)
X-Received: by 2002:a17:902:c40a:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b97a951600mr1695025ad.35.1777311373686;
        Mon, 27 Apr 2026 10:36:13 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:36:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:46 +0530
Subject: [PATCH v21 06/13] dt-bindings: arm: Document reboot mode magic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=lmkiWsLFoZiVy+q+yRqg9SpaKjLQxt8Mmp5CQJoF/Ii4uoBHHfeoTnxYq/6ce9i3yob3pcaPr
 anKDkGgjULpBrTuJ097A+tFD1/IfB8Cv6S2JKHq6y8M7Wxpx75aljAe
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfXylT76+FYqOn9
 RbsZn/vlBUaGlWJMz/sbS3ZDXGByHuqaY5ZhSzAb0EipJU3a5O2MfDSocpOog8x+WaqhCAlDaEB
 nztx+JYul3paxOa7rUlY5z98IZ7VkreF1xBN0DqTEoN6K+mktSvawl79q4ALCT1tauuwztIL8No
 kquvZukSiogUfjw9cdl2zK3zVPVT9mP8c9nvsB1Gwv0qQm6Jm7j74wfksjbEBHyROrr/TNk8tgw
 eTfgvuUxKkhKONKvgUU3QB2BgdOQ9E5b1qLHu0VwqOR88H8vFeo7uIS0Gl28SosOJh7Js5VHeI5
 RUw4lQ25Vz8nZtkpaAkOJBUn3SbtSpXAcUzAW9L+1zGuHEO0G2FGbIBFSu0FGa5c0aYAYbygxJ9
 P8mlABGhUS5qzrStZmqJ3TtqFDfc5NuoLS4AmyZH9+BVlyeit3WrPebbQ8wJr5Oj63dDSaahgkh
 dhalv3x8/mp3HDJVMNg==
X-Authority-Analysis: v=2.4 cv=QsduG1yd c=1 sm=1 tr=0 ts=69ef9e8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6ZklWS9h6JC-KUtcws_VRJKneXRMeJoo
X-Proofpoint-ORIG-GUID: 6ZklWS9h6JC-KUtcws_VRJKneXRMeJoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270187
X-Rspamd-Queue-Id: E9F91477B74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104783-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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


