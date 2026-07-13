Return-Path: <linux-arm-msm+bounces-118725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QGMwLuS9VGrdqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:28:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C14749D32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:28:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G+FSV2Oh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X9+Ygz90;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118725-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118725-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 067D830233E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661743ED5A6;
	Mon, 13 Jul 2026 10:26:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FFA3EC2E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938393; cv=none; b=GBUUdvP1WzzsE0CbHrgalCizHpMxNcpIORvkX3W9hgNJI2Aci1S9b6DnJD9MH0eEtBGjyY1r9hNQxNfue7saMwOG9E9a7yMGL332EAjLCSVAYwAyAb40Ajmh9UJnJtyNGh0b2GOmEvWGhQefaEI+jzPmeBcb9ukXFwkAc6MTALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938393; c=relaxed/simple;
	bh=PruCi31uA17l3xQol8AUA2PleZ00UnpifNiX6T9xPHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAtapAgDHoZ+zGBMA5Ng//EkJUe8jkCoZjSn++RjAug7rdw59hDI2omNoGKERExQXgUq20QtF241uxasu4AHJ3NIHje08WOBbU/Z6BovqPMDGRhmn0RmyybS2BcacRD+ZEsG7mhtKUK8fjJOy4qRPjoHMvCi4u1SzPG4MmDAjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+FSV2Oh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9+Ygz90; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98st2793144
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0Xc7w9lfMqsNL2Y6hj+RfUFKDCR0u+BKdnSNLRY+wo=; b=G+FSV2OhRDaOlI8+
	p8wYUL6KJ6b5y9lJG8udG/9boNriv1qLUqCzqD/rQHRPjYzZXA0e63lNWX5k/z/w
	QrCwLDcxaMej9M9fGjxnCJvR6NTPHDgmhaQvFrTTQpz6BZZNRy2WKK9l00ftdQoc
	YjQcrLMw4+WQeasvHnf3UJsqPni9ZseRE3NsMjzNe845kwdC9khahtuBjYxaLHMS
	Co9CRgZFXvBAy58HFwnI7V1gIIhvZCFGuLGjQfZyCU4sQVCABpd5yoRHNK5iWN41
	VfPSVuBR+U2s8EBeC9ZdB1g14Hc75ERZxphyCo7t4q0ZvTn2Hsbz/P8131s6647Z
	DW1woA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr8sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84885a4fcabso2321496b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938386; x=1784543186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0Xc7w9lfMqsNL2Y6hj+RfUFKDCR0u+BKdnSNLRY+wo=;
        b=X9+Ygz90YYUUDXNFDKFNFjfmaRgGBWnAtotqQKXkQKaKB6pZHWYE4h7ZXrEIso3YHc
         b64MH3R+vI32oyqV9AXfteSIaYrkn2aik5Bg5yjhRPyHg57l0/3cSwabHZSKNZLLhUuM
         HJLh4iooFdXE10+dKE+UKxABoEItPcmA3US7w4f6e+7KHjXUV/sDSPRuAQoXjZ82eLiE
         Xw0W1n2mO/0rDPo+IHNYu6J8OY5g0u766FPayb/crHXihvXu60WcB66WZob8cnoyYGWZ
         3HlED8SlZl1qq99ejsZZPwbhx0nHfz+nGgpkpyVeitOfHQqN3UNByIB/L+w2dC8Ki2cI
         HJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938386; x=1784543186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Xc7w9lfMqsNL2Y6hj+RfUFKDCR0u+BKdnSNLRY+wo=;
        b=kk9RoJBykYOdHZrAgx18QbC8yiO5HQOAYWalE0If+b8/t8KJyO8tovsxEdYmfxhhDU
         8K9S8vdIL8RcEcMRR11Y8ZLGyGeSiNFTnWnou3Y3JyB8foMjEmF9C5hBDi4yX7lwxfYJ
         gNJguoP8323iSmcywxe8m8DJI7ZWF3N2QeHnC4zPcpML4wAluduT4q+Bomui6HBppEWR
         ReS9nzHX//i6XgTASBQ6qEnJK3vODgZlQ5ZS7Lv4Ky4WLf3CAkkBG4RIKThWPVLZjaV/
         3/HlwV/HTK6EaSRMAlG4iDKQ53C3bSlCPNNQ3gCuojEfneCsw6HlHaYGt2hgvRg1Xou1
         jxPw==
X-Gm-Message-State: AOJu0YzhZ8XXoCoiI9xjhNAHsOIu2iSzvmNkPsqKN5JgahvJfR1RBDlC
	XeBQz78pPVEqamfWcqXw/ooyVw+Vgt6h0LT7GpLK3xscS74EmhWoGfpeWPXwNSYhb+NYPvLe0vZ
	ezMWHdzyYpbA0sHesUztg551mKvaSpoaVtO2y7IMxm2Fu8cQW18ukkPJi45J53/gn3bho
X-Gm-Gg: AfdE7ckGyFgb0IrG5oBN5FCN2+qj5sFWNuem/Vx7UWRZ2ZN3Hv4ml2NbTZliBpxrMI8
	lwGODV+z0pvGTL1sm0XoHR3BkJVuOTPWAguJLAlthLDqMFx6+C0/3bhSWq6OaO2HwpQ6qQLoJwL
	Y8iXjCvQzzwyBEhCVT+z/h7EC0LfZg+BY1mPERB3BfMSmpaKXBTiNzBx/oHG+v6FaBEyKwMoi7d
	gmbbgzD5w8rIUphYNUigx8n/h86DI/i+HEq30i78jc3QnVIn2qOJvxW81JZlsgGTB1DemQzHD4C
	OQSCthCORBL36HpAf3nK4TE4nIZTcbH8ZYGZJ00yYK9EIIU114X6c2IF8AUSTR/ZprLQPeR4CK1
	5WT/4Gsj7mV2yrPKD4tgHhVxTRTD+bgZc1Wwg7ZSJ
X-Received: by 2002:a05:6a20:431b:b0:3bf:6c08:2b2f with SMTP id adf61e73a8af0-3c110b6e102mr9319633637.55.1783938386344;
        Mon, 13 Jul 2026 03:26:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:431b:b0:3bf:6c08:2b2f with SMTP id adf61e73a8af0-3c110b6e102mr9319593637.55.1783938385892;
        Mon, 13 Jul 2026 03:26:25 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:24 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:45 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: sm6375: Make MPM device as part of
 CPU cluster domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-5-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=1261;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=PruCi31uA17l3xQol8AUA2PleZ00UnpifNiX6T9xPHI=;
 b=5mmmotH62/6J0JYURi2Dt3wdRp8JL8Eg85LUWFPhuLP2HFgj/JyJEORngwlnRkJ2XQIvnN9po
 wCE5laL3qnoAi2lelX+z548YSJ+fn+k7U/hvvshlilQiBHh7+Zl9X/l
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX1Hmd09GlthKM
 EcZp3A+8PO3URRxqzxH4Ta/+fWfpCHyQ4daYsRWpHWbbVd2PWfNXYDd3FVm1SJg5xRDbumc+Yr8
 xWYuDpgKNkhTUYUGwd3B9sqAODXgOkLSmBj3mG6YbC9m9zo8xLSmBQ23rQPug0Sd0JTo01JfTzp
 y8ZlM7Nhynr1x8hMSeYkIXJayo29fN2rEloLdMCG2DA6GCaLo3no6mAI8eWhLh6MMJltr8kZfIW
 rgVWmJIFMVMmBjdS1LuSYTqWTrOlF2FWlQE/YwWKrxsgn9VEXO35zJfIbVx7x1kbO2FfSEagCrV
 SKBKFdDZaxtiU7cwtjP/mZ9BX0wjaLVKs9dPV8DiTpTG/mZ+BqdRG1Myr/NqtiaCce6wTvueRbW
 p+nhTTMvEW+4PjRFZobBk3yr7RiWjBSGOnUfkSl4aMXfTUUd1TDaQkVUV75HVS1Zc1/O5HGPMBC
 1EIO0wUgpUJi5Oo10Lg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54bd52 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OikB9Wl6BtP9lw8g0jQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: dhKnEoHz7bZpSZ_zo1A5CqaVxl7RfWc9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX22VErQvevpQk
 3Ol8FU4HEl4lIcE//RtH+6J5BvVMlEDKPzTcVxxtUcfVZQ+3DxjqaHHoBI6nwA1+UZYeFYuQpG8
 HjxmSdhA+Ht41pYHyLm5Wblbwiedt58=
X-Proofpoint-ORIG-GUID: dhKnEoHz7bZpSZ_zo1A5CqaVxl7RfWc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74C14749D32

Do not mark MPM device as power domain since it leads to idle-states init
failure because of probe dependencies.

Instead make it as part of CPU cluster power domain to allow RPM
notification when CPU cluster goes to power collapse.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ccf572bb1549bf6b86b5232be216c9dfd51bb22d..5f729634e1d9b21deac42f9d55d966e528473202 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -318,7 +318,7 @@ mpm: interrupt-controller {
 		mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_SMP2P>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		#power-domain-cells = <0>;
+		power-domains = <&cluster_pd>;
 		interrupt-parent = <&intc>;
 		qcom,mpm-pin-count = <96>;
 		qcom,mpm-pin-map = <5 296>,  /* Soundwire wake_irq */
@@ -505,7 +505,6 @@ cpu_pd7: power-domain-cpu7 {
 
 		cluster_pd: power-domain-cpu-cluster0 {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep_0>;
 		};
 	};

-- 
2.34.1


