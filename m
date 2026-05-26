Return-Path: <linux-arm-msm+bounces-109850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOMeOx6zFWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:50:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE55D7EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86E23304AE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECF93FFADB;
	Tue, 26 May 2026 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXlAaWIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6TdwSPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE343FFAC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806540; cv=none; b=S9upcU4fRK7Ch7HOIFIZK2bcMB8IhoLC4lA8Kj0vsVtdG8qf6Mz9Mv78sKwhZqe8SOsJ8am3CDbMDgH8/CMjWgHJpZHgPBITALS+QPCtc0A0ShqnDZgy4pbAZY+epYsFOQihCgbNOOibn+FpeP2Gb280LR6Voq5YRb9No7DewyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806540; c=relaxed/simple;
	bh=hEmrpLF0MW67gYArKBeGVtgmYcIX/5PJzRk7wSNO0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iziXotLOeGNdTfCXiYD8I2p+297G8wNO0fP/eJITQKtaBlxinJa6nIgURUTxk4nbIN8pgWHQy9XZSO+xExmeNFw6ljupqIis988ffk8XREl8ABwpQVZwW6TnedpvaoSKkF3TXXhQ40wcvqBbAlnWJHtnkwd2UPPvSHhvVj3mToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXlAaWIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6TdwSPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNXB2705401
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=; b=VXlAaWIwmJK5EYUI
	UkNs+7BBkpbO1UL0oXq+c0lLegdgaJC9cDD9iveZQAs9x6GLbsP5WmM2BPtNjjXy
	5qT+hqq/dxwDAMLR1hapv6QISvpJfbyEqH/IWvx0Bhs1UcvyKfDvUwhnONr5tTBe
	dRsll0eVDUw/4IJ6v6MB1l9TpZ1mKvTi4YLholuJbaP+Od02RhQB5H156G844wWh
	gF4H/8Xtbe1YlMIgtBzaArJFbdiYcq0AQ/1qLdJ+j4EGd0JOuaROltR/+NufQlFC
	XfsOQV3/aZ/IS1FhlxFbnEjXBjgxJKqCRAlF38KVdGgZr9frKMiGuH2esQksf5wS
	zL5GQw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vgjc8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8292a9605aso5066616a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806536; x=1780411336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=;
        b=Z6TdwSPfSdb7+NHSSQYN6/4UyvafeCcKPiLgmkQXdYTrVn/UNyhEuuL9V4h+lLd4SQ
         y4I4ieIDvjJieC070FTc4ycH3eJKa4rSM6G1m1P6rbUziJ4Ih8ZRruPAmxWt+B8u5U4D
         9o7+oqQ559+Vo+3rP8h64hPhEzjW43Y0asvvwZsk0bntf/cGiiIONWndwhvI048zyrJB
         CPm3WYmkxJXXWkG3vzpJfoVr4ZVQjWXXSQNBITLMf/N/3Afgy23gfMVXlFx/ezs6PVkZ
         Of15gbJLb0c+8+i9eOO+SfY6/nod+JtHdfvrYXuQ/0L3ptOWKxb3oQNmO1EacJP6I+Ba
         Is4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806536; x=1780411336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjfO9SOxMjcqAbIgumxNQ0k4LXx/d2l2hM63+y8xMpo=;
        b=agOAeBbgvva5NN3G8aRl2Ad4PNhkTuG38V+w1sMaYXabfzf86ImPPDySHF7kZ00/C4
         fxoRhn5aK+uS+5fuamQpxe7bznbPs/Sjqnf531U9HMf9GY4Uo9p5Q2enh49+9nRQDQjW
         fztRH385LwaoPO2rS90qur1+uJOTc3gholP8VgwxYv19Az5XhpZVBctChxZ6ePQT/ELZ
         mkKbbXbVbPQxT8KB3OU7QyCECgOXXw9jr9rpLlDb2B46hNV4NhTQIqfpMH8y2UC2l0fg
         frYArDre0x09MbxVOrdzpqJqXN1R9CEe9NfLDUTDz4q0SUL3ojFnVQxEho+tBkSCWjtn
         iDrg==
X-Forwarded-Encrypted: i=1; AFNElJ8DqJY+GqSVLS4QsgL0T8H8Md38bK9hzB5yHfWmn4CSF1r6qBLzXbGqcwPm6/sj19n24BbDB4ViasBT5X/L@vger.kernel.org
X-Gm-Message-State: AOJu0YwVtbn5otd0lH99ktfN0mbfKyV/ZFUkGRvOVqO7dqVoubsa7ERW
	zk1sgXPdnrByxraJXL8OBnHeAFKoJVmz4RSubUh3AdwmwsctzJPJfpEURGkR3Tco7ISRtjgw668
	jNKVbJwat3AkSxrWAL4aYRidJsVrxIxY1dxkVUcA+xR7Xk/H7xKpaqxIDAMLDBs8IE9b4
X-Gm-Gg: Acq92OGQHzAtbDKVMBcD+vt94F1TXx+vlGN4R1ByLZXotq7qtzbGyGkNxzs/dAB11v2
	r/p/8AhFMsblJ4G3SVauaWE3PYliGpjjaQPshPeIKz0pF+eExir2h/vpHtUiS8LCkhXX3bgvTD5
	Ax/t1A4XC5bQFXbL9lFI08njMMDQdLWqnO74ZZVkWDDFl/trCvKc9cK9czptcUb/O9VGHSvbudF
	tXu4DUPTm+AleJczXBsdoeVLxj/SCjRglo7ghdfTcLyaRm1IgiX0tsBgC6gw0xuCWZb+aOUD+CP
	7MAhiC5U01WLFGOtfGwuoDcrCeZLlk4V3BnNNLzcDbUAqzEi/msFbzI80vKDaHj+l4dn0WX/vMr
	4BfhCeOyovBGZoQpsKgA0kueH3F0U3tKPkdKG5o+fyoWBoE1pq9Vq
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr19004462b3a.27.1779806536444;
        Tue, 26 May 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr19004412b3a.27.1779806535918;
        Tue, 26 May 2026 07:42:15 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:15 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:02 +0530
Subject: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806526; l=1894;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=hEmrpLF0MW67gYArKBeGVtgmYcIX/5PJzRk7wSNO0Vc=;
 b=gaaHTeaT5YX7h0T0xeiCVH4zAimV20AfMBwiZOwwyrQIHqghXmhre0IZwn4uUza43qcyBi++z
 8neeKvagCaEDa8iau4fEqoE+egqDn/IUaoJFNmaGYUy3FbRK4uKdxQq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15b149 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VXyHqjDP48ZKitUYIq3DytavDgyzaRJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX/LVLYHJJGvB5
 Q5wRUptfdNagHighUIhaaX+7o8i09/HzXtRNu5VqYNJ8ie5+Qh6K7idAc1C6m2Vw8io7TsD1VuV
 IuSrWVYPzj+Ic0aROSbu0zdYHRbRROugrw7po1xkh/Urd65p41wunUwPQhxqOTZ7pauACnTppso
 DTwuql5f20im9ZqgtJMwGfuXiD1Smuu+4C5RjJvRs7TbK7ezMPJoK7nI0cMKDtlRemIFxXbOLkP
 nYt8iG8Pia9yugRjQ1ON38yTGssBPT9gH8bT3OtRbDS4QujwUh7FXpzOfKF3DorPCJB7fJJ+Sd0
 uzaqccGU9V+jEI0YIVXcUUw2nMYlL9nnFPfU1Yu+WJgYatpqsGtwatlIfoAFjDae8tYU1jHybqZ
 9En1U7Seo2F487bwjNe6EQg1dI8xJn5k2+eIGdi4W354IhWzoyfUZStN761+YgkeONwdSQBvxlK
 qzr5kXY5vy0o88a98nQ==
X-Proofpoint-GUID: VXyHqjDP48ZKitUYIq3DytavDgyzaRJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109850-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CBE55D7EC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -243,6 +243,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -602,6 +609,26 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sc7280-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1


