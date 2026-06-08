Return-Path: <linux-arm-msm+bounces-111759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0gmALV+FJmr/XwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:03:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71974654582
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:03:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UzFUuDSH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="J/xiUZie";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B3C030CCE41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0063B1014;
	Mon,  8 Jun 2026 08:48:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD13B3890
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:48:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908515; cv=none; b=TRgNgF8tbSVnHhqY7i05o/mC6/EDI2Q62BuhwPVIyQa812fUSj7Bz9Lu77/I2Usoc6UvfCJ6np886e2t4Dsd5KaKuTI+hvTKzT+cAvu1oGKABzMGfDAGmGsIUBQw4muK2fsd22wM9iB93mkPHiWFXrfjzrh3Wy0nCkhuejeN+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908515; c=relaxed/simple;
	bh=yBHjoToyEmvpw9ZOHDr7MPJDwbB2Fu203G+gPC/yC/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2QRLy87ESqsxjS4CE2xQa9HHdH0ZoIuMYpn3m9M/mfZ5MpdReoWfYVDO8XKTxOvo45q7BkB5rM+zpUtKsZ47O+J1pdAWrmD+K7Rd2i8xCxbrdD7nGn3ULDc+/AUBH8SunntNmzAiNzuwu1D7kDn7McE/bYzt/+b7uOVHIdDZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzFUuDSH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/xiUZie; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OmmI2317615
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxRVdQ5578eayqXtMEmKyb3yUdHj+2MNMKPNvNzYGdA=; b=UzFUuDSHOKVTAHEX
	C3MQLfRoKXwN7wPbIUalvwzdpcV7Qo0tw3uzdOCRwgkUR/LCZMn1kWatXYEm9IhT
	4+0sxzeEhhrCRasemxBli/kPa5KnC6IjXByVMsVoAaKMe/Psyi0jUMXuCM6frzvE
	C598hFKYqkeytwU7cySJegBfVXziE8x8SUf90Xe074Vw7wH5UdsJnhNbY3ac76bN
	Gu4pf75slYDWpGPrnkQ1WuvzP4h4RAjPO23mcYCJrvQWw7u21zrxGFDWVldfc1Dz
	/yQB+DGqF6OisBAlUZtmbb8CwcKmpJNKPFTDGg6QduAHx2VgpFk8yR4uVSIO4s4A
	RA7Kcg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadxmuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:48:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so4727334a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780908513; x=1781513313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxRVdQ5578eayqXtMEmKyb3yUdHj+2MNMKPNvNzYGdA=;
        b=J/xiUZiedk0BTeI6G+FhafGAXffPWv8mlEJyCnwctnRJxrfAFA2AAPbOrsaPazUJXb
         NLvG6xgsbc/JqAiWtRuCOHjHgXt5UGKuOohAtmw4gq2lfccErDzWKO1Nb7t+4obEH6bT
         GW7T3CorRx7ZbZ/NRQYaDs0F/Du/bMeNjtwp0n4u1UXocumkHqRd4CJUF428GBeEUoHX
         wj4z9hRhKZULDq2n6cF+qieB4sxC3TLIu/pz/fGjofQmULfLvyJlG8R9bg1zci8UsP6C
         36wz2nL+y5Ov4rF2leb/ossYCCDB/EEPIxXvtA9aQ6/1ewWvHopChU3CEAWvjc62Fpja
         6tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908513; x=1781513313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxRVdQ5578eayqXtMEmKyb3yUdHj+2MNMKPNvNzYGdA=;
        b=s1tXP/k0+r0Lq6R3iXOk03s3KQXlBYbn08st18tcNEk0C2zSATqfoF2k2RzSyHHhpZ
         zZ1FdbrUSLPRDdxg6BiLvCZKvAt220dCgBGcxd4gFNOuI8dZjSQAj2xCqacmh9xjGwCr
         dO76bIxChsQpvnI3ZfB/otZWDjG+9f5D+vfqSio/uoEHPg8n1035sJ/gklz9ZaSfeuR8
         7Jy4whPiGwRNrQ6GCIxU/+OmTeWcgwVjndj4fSpMMQoFrDXwPenM5DBIAmXK9exHcIyE
         1YtQxWFNSQBLWPUCKD294kcDLUdwzOMgFkGE6Zn7unxy2C6+sZ7n0H+bZl5D08YOQ+N5
         sVyg==
X-Gm-Message-State: AOJu0YxCU002QKfzHQy7r9Pea0nUfByebNCsXJ3MiDgTjwBzuDP7b+Jl
	HGgzixmCtL7/G6w2CmhdLrhblvJXb2Y1Hz7pJHteN5XrWipYqhiEb9wqUQYtMCAPqCrxlF3+R2p
	nFKDXohmKeYsH6FDPhk63e7S2Loxhh1jk/QVfhulBSa60vI7DfOXWtg5VK42GIPoAqEZ9
X-Gm-Gg: Acq92OFNKUfNbLsioXSBnqe3gft9bbp3Kcjo8W+hjeZE+d07GTGE+REA57Pl3Dvuxnk
	lvCgHkZAgKTabDmWJx0S9aaA8l0Bc3CLEdWupCEPBmaoP9xKy2ZDG/2OjFnIXsZpIIRNSgoFynU
	yt/S55pB7awRVCu1Wn9JlNcE5R4TrdT7p+PhTEcMFfaEhmN+9CCLVBDssR0unrC3FWfqzslyN8h
	smrNR91zyoh1coG93VgyV6vi/apjXHlBUoYPVxKeC2B04urtpUzt3xBpWOXQmPapevMbc3iyBuP
	fZCHjjTx3VHiVg0O/+AJM21NdkyrDFeCTNX7IhMb9BGKk9W77UMViVdxX+RdP/NlP8FZkEXzUys
	9t9/WYOrTePHOaYMi5hGSUEp1SCJtppqx4cc7rsZX6xV7boXBw6fi1lDlimbCb/KVjPY=
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr17913280a91.19.1780908513529;
        Mon, 08 Jun 2026 01:48:33 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr17913246a91.19.1780908513113;
        Mon, 08 Jun 2026 01:48:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm15070198a91.16.2026.06.08.01.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:48:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 14:18:14 +0530
Subject: [PATCH v3 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-eliza-v3-2-9bdeb7434b28@oss.qualcomm.com>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
In-Reply-To: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780908496; l=2136;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yBHjoToyEmvpw9ZOHDr7MPJDwbB2Fu203G+gPC/yC/U=;
 b=ja/5LGBZqLE+1Wu1sWlNlGqoDr6Lswt20oAcZyryoiw0HvM5vhjXHVza1wvnRC82kNBi3B9tV
 2OVNAra8hVGBs8SJerwHkz3+2x1CyINSKLNh7WzLfrR18UDw5xxuDYQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a2681e2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FC_8z62UfPBbNpSbB3cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ILaKQu9dGe6FycmaeeyDjwkqv365gQ_A
X-Proofpoint-ORIG-GUID: ILaKQu9dGe6FycmaeeyDjwkqv365gQ_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MSBTYWx0ZWRfXxUNcZZljmWYk
 onxApO0dDCK5XdeAxVfOrpzNgEhQTUyVAeIwXreDmdM9uCc7scimT0vgemUTPUk4/XVltj4A6LO
 wAsz21fSGH4yqJoWTzw4vBK8qqZQxnt3Kmmn4xJwkrKf2ax85xCJTpzEAMaa53Gec4cdqGQAVT1
 7ZWG9Nd0BLqVqMxm51sDuC4tqti/ECubs4BoIYrH/5PA9ssnaFPWxGAvAQ1dB/WmOdWe2a1/3B4
 VkCpZAFQipD+8aniZBLnzsa3LIiHIokMkNek/kkJb3lzly9E3/tcQByeD9BZnxqHU4YUVe2yarC
 KmyQWh2iiMOOBodx0VKP+88RB1Tkb0SP2jXMe8OwZKFoVluRpyJi80Vf+gu0OgLjjXz3P7ZU/Oq
 hOuLbP7KJE3mX0CAjDGqcEDR4njfvOwGmaI0vMQdTjBVA55jpN5SlyG+Ekp/aNBMbYB0xofzghD
 aqvAOy+Y7XVViQON3aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71974654582

PCIe controller present in Eliza SoC is backwards compatible with the
controller present in SM8550 SoC. Hence, add the compatible with SM8550
fallback.

Eliza requires 6 reg entries, 8 clocks and 9 interrupts, so add the
corresponding allOf constraints.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-sm8550.yaml  | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 3a94a9c1bb15..fb706b1397a3 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,eliza-pcie
               - qcom,kaanapali-pcie
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
@@ -91,6 +92,55 @@ required:
 
 allOf:
   - $ref: qcom,pcie-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        reg:
+          minItems: 6
+        reg-names:
+          minItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          minItems: 8
+          maxItems: 8
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        interrupts:
+          minItems: 9
+        interrupt-names:
+          minItems: 9
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,eliza-pcie
+    then:
+      properties:
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
 
 unevaluatedProperties: false
 

-- 
2.34.1


