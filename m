Return-Path: <linux-arm-msm+bounces-107433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAbsG2fHBGrdNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:48:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4215393D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F3DC300E29E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB693ACF15;
	Wed, 13 May 2026 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsbOV5PX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpmw+xZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462F3AD53B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698071; cv=none; b=oUEJkZhcK8Swbr3raBXy9Y+xWtg1FJxIskY6p+5XpCfTCXInuTTObDYXPnk5ThPQI/d5DiXcYBFkXrUsh7QLFpZA0yq9+wTAMdtWGeiz6EiB1G410o8E6vLyDdvKr1mI6Jc4jjUD00BwqG9u6RRAV3UUZ1g+wg6ydA0EvKI8pS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698071; c=relaxed/simple;
	bh=LtUnlS37mileuNvhw0Ltj7yuT0WLMzihj/yzlAEi82M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcKmk19HzhR7pAIEibxM1HT6PN7CW/mYSRxlFV7281h8vir7q9vX6xbEtF6zLxak6hJdS5cDIf9J35+i+dFYfqFrwlryYAN4iVDi4dTcZOROwg99otueEnUtcNEhIuAEEaMHXx2He9E0x5g8YPo9qZH+RLf47PO+9bY2cTIVmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsbOV5PX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpmw+xZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGuPOa3995764
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4dgZBrB1iDAkXVvKToJvJb6UD0e3VrVrBnl7i04EHE=; b=XsbOV5PXHnYyXVAR
	0n+vuVvat/nf/1vk6vxLOARz+yK3DnpwaGZmnaTTBzR9OO94sM2xhCZpjNea3qgA
	k4p5nrAwdmoZ3FNYKb1rwG1GQp1jdH1MhMrS5tSbSecWuoU5tDN93s7v3gOUbIb4
	Y1gyilmUOUU+7mXeeAuVMetDUj/j5XPvvAYZIN906cyl7wvWcZPDBO3U7Iqcce6Q
	loMbKsMATW6c52nhokqE9NlGgZVobEVUfqCdXBEWEEqy6VgkisW5owGXR61R6eig
	DOz9WC51Mojcl3ZgSk8JJND/kRRD/jvYGaMMBSBgz43G1tSBuxcYqVuJ6QlOfRvi
	gusatQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4w8urg0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:47:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso14508153a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698068; x=1779302868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4dgZBrB1iDAkXVvKToJvJb6UD0e3VrVrBnl7i04EHE=;
        b=cpmw+xZvBcwWCfkjqHKoG52uw27z57CkYwTpWpETjmNFlzFH2bZO2bfC8rM3ks4pS/
         DohRaBE1reyzvbGCAzAYAsRkjkgJdk4/Pk3QXY7U1Rp0dK5PFmTUn2u5Cm10vmQKQ+fI
         0HfvYLgj9NLA98Q9nIJ/Eisf06pwjuV0rVaVJRwhXbLXXmr1KCJG+OZIxJqoTH9jhP8/
         AlSJb1XMgmftzV6IVBYXWPNXaFtJU4R84Eg3YuQNAZ8OK97P7SES2r87RslZ95nDQcoz
         c2PajFoMNDfCXUUMZhIrsDkHoiB0cnM4BERNhPPpnYTefSAXNTi4oFI8om2BGoY1lCy2
         /UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698068; x=1779302868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4dgZBrB1iDAkXVvKToJvJb6UD0e3VrVrBnl7i04EHE=;
        b=LKio3FVpYPf8bNTgEsCQLlXJbMjCiMeKhNLmmAEn7UgI4SDhIYeQSJJbh52w6nhXEq
         /W7nYDxEmikS+GIZH8ZzYHMMQOfPveCLdnKA7bL+zYKy5M4bX2wt+29V3GJNmMqFW8WC
         T2zNSlgwcSl2tkKSr2DbOT2wm3xH6HWb8HhkOl4N2405rgGCjHY5qaaJxW8Hp5nYxbqi
         r1MTMszyUaRJqiRS7Q0QCd1lt5xCMXm80pS97htEvq+AfO7BeA5eBiPiOWyezd1KcD6Y
         b8V1mtHJJJn7Q4uPf/3kCoQM/CX1zWn9TseQ4Etvzc4fHHxQZQC6YXT72TVgUenCRrAp
         hObg==
X-Gm-Message-State: AOJu0YwJbxs0C7aCs/DUNnml6E39PHc1aBtNzsIW20BgLV8X/yFCWs1W
	lUy2rle/PvNgOVHyadgM+//FYfefL8x/UOdw/VyEHymm8RpajRJIOVEhQ4HP7ACvr5icBK5VVoA
	QefuCJIMOm+BSAFlxLGn+K26VkcEzXyLWCiUepP29kQO2yARQC6r/c+Mkmzss5BaoH3g2
X-Gm-Gg: Acq92OFan/TyVR/FIYlFpxTQZPGUZ/1lC0Jxb8fubSnao/fwYRYvdvXatM3WD8eBXIT
	UUKxa7drHCFPeJm1dJC3nZoIZPvxyjI+AAmgkihoCQrlaQJRBcOVfknzQeCDCrT9n5QQzzkif69
	Ht4PR2/AefGMonHRfVAABAkvLrDn3iLo6NE0OgEohwQAboeP7swTSKfCmBFJxdsBNJvdAmYdxDM
	ZEhK8k+DDItJPnGYs8IUUWGYx2b8oYo5PjCYIAym+uwpvSUHE+WJHjtNQfbHvcYfhWbmliZE81Y
	E1FmSI1QZx2y8rlXECROfTKgeiFHqdqLbbjceRcc0ZW86gjuzUKaQSI977mTH0ltunjHrBK3akJ
	57sPruxEcixzb4+5A2sxMpAKUJhuhjjogQCKI
X-Received: by 2002:a17:90b:3e84:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-368f3d18271mr5015584a91.14.1778698068227;
        Wed, 13 May 2026 11:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3e84:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-368f3d18271mr5015555a91.14.1778698067750;
        Wed, 13 May 2026 11:47:47 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bb9sm187438405ad.52.2026.05.13.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:47:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:17:30 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
In-Reply-To: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778698059; l=4634;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LtUnlS37mileuNvhw0Ltj7yuT0WLMzihj/yzlAEi82M=;
 b=wzWUj1SHqDXUar1TpV0sBaNdl6wROduV0IqRdColFSzlqo7W13RNjkBtgMO/NUa/DOC6KBLkG
 00Mo7gBrzoYD48fJSGtaazVFjVGmHO2cwb4a1QYGicf43ANl6zEwJHX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=WP1PmHsR c=1 sm=1 tr=0 ts=6a04c755 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=S-WjIMExaCF90Us_d_cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: gDUpEMEKS1Cr-qS2kE2rsJGbDLC06qYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX75yZy4DjX/ug
 mqN4KInVDdaBtef543vPZNU5i4Mea2A13DZ+KPrvPggwckIl2zNA7sKZNjlKXAYEP9FZWG7GORr
 C+E0In/qwxJx/zGP9mCeDs5rkdxEtT5oBbP6glD8plBafBGiyRqQvbcH0EWrRDuljuCwNNIDuuz
 fVW0VatsKo2UEIt+0aCNaamv6I5ibVAf204CkOg0iUIAeSeLa79TRTeDg9ykbF7FcZpbXAxyO/q
 WmnDkAkg7U5JcNS0ZqHzeTQS+5KKKOd1gsmbHHMIc1JpRxfkwxQS84IMO9v4qD5GUS5VhWcsptB
 mn6+okr8BljdpHXTujkSImeHOEkfX4oB1LOccvw5kp6x61RK7M57vf4uA1KHJmF4qIKnMBXwEpa
 MXvZ1J02bWNxY/CIEb22nuYrq5DOTyUwge7/U1oi9DMIDnowdV/boRFXK1mVnHjU7RjevgOlENY
 DgC2qs90i71FtvnH2NQ==
X-Proofpoint-ORIG-GUID: gDUpEMEKS1Cr-qS2kE2rsJGbDLC06qYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186
X-Rspamd-Queue-Id: 0E4215393D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107433-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the bindings for the CDSP, LPAICP and MPSS PAS on
the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 141 +++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
new file mode 100644
index 000000000000..f4ec101a3589
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,shikra-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Shikra SoC Peripheral Authentication Service
+
+maintainers:
+  - Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
+  - Komal Bajaj <komal.bajaj@oss.qualcomm.com>
+
+description:
+  Qualcomm Shikra SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,shikra-cdsp-pas
+      - qcom,shikra-lpaicp-pas
+      - qcom,shikra-mpss-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  smd-edge: false
+
+  firmware-name:
+    minItems: 1
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+required:
+  - compatible
+  - reg
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+        memory-region:
+          maxItems: 1
+        firmware-name:
+          maxItems: 1
+        power-domains:
+          items:
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpaicp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        memory-region:
+          minItems: 2
+        firmware-name:
+          minItems: 2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interconnect/qcom,shikra.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@b300000 {
+        compatible = "qcom,shikra-cdsp-pas";
+        reg = <0x0b300000 0x100000>;
+
+        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack", "shutdown-ack";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+        clock-names = "xo";
+
+        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+                        <&system_noc MASTER_CRYPTO_CORE0 RPM_ALWAYS_TAG
+                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+        power-domains = <&rpmpd RPMHPD_CX>;
+        power-domain-names = "cx";
+
+        memory-region = <&cdsp_mem>;
+
+        qcom,smem-states = <&cdsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&apcs_glb 4>;
+            qcom,remote-pid = <5>;
+            label = "cdsp";
+        };
+    };

-- 
2.34.1


