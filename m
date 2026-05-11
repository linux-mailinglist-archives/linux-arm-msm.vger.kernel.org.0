Return-Path: <linux-arm-msm+bounces-107011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOlvDZBZAmosrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:34:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F62516F85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 00:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA006303CE0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 22:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F45383309;
	Mon, 11 May 2026 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CG8l9Pkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpkCYn8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D563B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538249; cv=none; b=AfzSPM+D4oLxz5w+tR9Xix5o872S+ndF+UC47j2qPKRxqJnfhvdcVGI6uMM0PeTXHDiBszL7VIHPCyDSv76P+fpFjuT8vsIUk2Ni8vQbzjL7kOyo5s72F874PrlWskpur/r63QOUkAYNJR/12FAJ3S6QapeoCccO7W36Uygt1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538249; c=relaxed/simple;
	bh=97HQIGbf+tNFlTRiyh8gUJ2fs1SWaMmQ0EPBudtudRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxRwxYjKn/04JquGY4fMqHWXwe9PpljDulwkv2iqGZTtjGWfiJheFdLzoiX0NVuaB48dDNukp9QChRwQGZuJAl+X5biQdZ5GzcY01+senIZGtbKjLhKB63TxBCbk2WLXCxHO5yVmYPsXJ/pDDaXIkElE9Fdn5kp5eyC2MtZdnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CG8l9Pkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpkCYn8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6TuD2202230
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=; b=CG8l9Pkvro36Dld4
	N/0dSJ66oyZTv3rClHs/r32KRRKZuk1OnZV5ZHWIsV2e/b3h6q7lxjL6QFcSb2qm
	JLNjdXW9dnssebTUeCvUdRH0M1FRxbFNFoE7FuHhfXMlszdbDO4ezcNvt68vJO5u
	bsml0ZEI7vZYmfsumcc7SPdF1h3RmaLR3AXRCNPi6SR4XfaMT7US/n7uyjMTFGOD
	2UgkFS67Xq2iRPlLmZ7rK+5Mcgf6StSyqBMTS2PMfdAOITQjGencCsLYvgcIcPAk
	/b8WyR+gkEmASOkZQkQH7KOlJScJ3NVm5Lpkyj/B3AvwbKMWqG+gcCln5Sq9peEL
	i8fgog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuygf8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 22:24:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83544d05c5aso2657378b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538247; x=1779143047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=;
        b=dpkCYn8FVf9TNXfqIUGujke4rXrmFbMd9+ervf+7l6HpfxYGDqz0HVnkd70vyqBxBO
         HbIS+RjX1dbkfaWbPm7zZDlkigFAKlM5kJ6j5CbW8zcuCyXemxpxWwR8FciHVnEqkTe3
         9XojrpKSzlhiImPGDPzFob1h1DfRrHuwsGvoC9rpcaMm0q+d5KVJm6sebAKrxxHVn3BJ
         6NTopKFX9rIxKpp/oNwAnUHI4WHxiWePj9SYicZ9zkx4ogu0ASWIjb+e9tguKuA8GSkx
         /OSD2lhAEzYnSPYkhtobzatItbWZBdoAmSUojMwRUfPipl5w3kuxVuVyg0vj5rkm17ue
         Vt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538247; x=1779143047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUPp2c9rAOL29gHVGIJXyIeP9TpBMN1OdAXgD2H+ohc=;
        b=WwwxsQQAeP6KtyO5j7ReA7iLP+md70kcE4azMfqWLx90psJ4YptAVwuoIfGaxYDEzh
         6JW5k90MicPfMTF/sU1DCP6rlwrAG5tbgnMiKsU8eDGDagG3InNVPMWwybrj2vw9kkCr
         gbD0o4PdNhDmtS6+W6A1psvX275Xpc7rrrSL4NaNBM0nGO37z8Wul7CX2vb3sMt4SYfm
         oW0ibOY9KxQfzp4t+PSiEIV4l7lKp3SIt6krg3IB/8CsAhFzlV/qVCxj4wRW/GlWKAcB
         /6crYGLnzMgS2ICxLcCuaL6k3UDQmuMo7kRJQEtszvRBoQ1WnXEakBfvnXXsvo8VblbG
         PWjw==
X-Forwarded-Encrypted: i=1; AFNElJ/e/FDvCvc9FrYaeKPMlMUi/dAQkEd5WbMCj7NWPHz9xuGPZ73C4r5ud3wk5Nv+XKPkdPJHx0h46r6RukY9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4MDjfYpomSKv8auZ7+muoa5iMYmadcXxeEvPUB9d+qwyalkfq
	yKjQnPlDFJq8YbmrpZ0r25YN7OFOX22B6VdULOab9H3Jft5WpsnaIF0FdG/Zj05J6vKDICCcqe5
	Zw4WscsPhSKv52Q432BE+NMe4mckjVc1SWlx+hNlW3pnTXL4Hx0ftsSlXZGln/nMpRGwc
X-Gm-Gg: Acq92OFDMB/W0tjMxw4q2q1Cgt7N+TNPJsRxBRXpqIAYxhKJjuz14ngOugAz1luPw3z
	xmuMLxfRm6TbK2zF6TRuVxrwD7jLl+YsFvH3tjgF2aU8ovVyCR2KYLMrBDW2Hg03NEx+eYV+fnF
	Os4Lt+WiMFQiN9DbkfDwKQx/TfAl08hfzLmKdRuXn5GP8ZOo+9Tuf+jjuOWBn5MpZK6QW1BAiao
	fevUB1/QOfG3mkYEh5nauh9eE+EZ21qanvk2wbDCZYOVPgbO2gKGhOZr7tqWCWYSAhFZ9Zh4xhp
	aTD/NjNbigJ/O4QNz4OirByRyhJtxAmAToBTsZ8/AFMZNI4bh5z9pTk7QEUVH2RFKiIeUoWg/f0
	agDDIJAdDzsIGUAC6IQoVu6rwmxF0jE9ojVdJ6n3ZwOzfnA==
X-Received: by 2002:a05:6a00:a90f:b0:838:af72:fb44 with SMTP id d2e1a72fcca58-83cf4f760e7mr18257627b3a.2.1778538246800;
        Mon, 11 May 2026 15:24:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:a90f:b0:838:af72:fb44 with SMTP id d2e1a72fcca58-83cf4f760e7mr18257605b3a.2.1778538246344;
        Mon, 11 May 2026 15:24:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:18 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: kaanapali: Add qfprom node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-4-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=1012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qA59djGG78P3MNRfB1Y8EMktq/ELkcaIx0EmOPVu47I=;
 b=9OvPBcF1MZb4Ksy60cJdP9QxS6+kk6zi2B0H2ygRxmneK9+uTtViTgI5ljZCjPD/i/sq+fEEV
 0s0G6D2JEOpDKJB6PzrAU5NDlmvdjlzdEQD3pg3eLjw+GXlyZfoTeaD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX3LZItNuW+xTN
 i6P16B8M6sKvD7jDjOQoXuHuPN2mMv5B88pk3IjNUr4riXMuOnMLd4AYt3mpkDowNa1oUhuvJ3+
 8OxBChTmsmhRkwj4g+ny0ho+3579HK3g8ZEdfQ72wOttWK34lWgH0jVYDwnlEhB7T0HbMhHcjQ6
 /pupssi9Z98ie4V4I/MMwHs1IqRchu4pq3sS7KGyiDP9Lab2F37spOg0rV+37yia3TeT+XMpfwK
 sDp0QfBd5seD/bOCW0xARnvqxWkURa9x9/B74JmjPBm5U3gvemRlQ7CAAkYSavUhhY+ndwcIFFo
 IeWNNtZfuCYnKamIvZHePozlTEgRbgpWyTM2+30UbDA57udrqk1t4kuH+0VDOUmDnrREG833YHK
 rKfcP37t2uB3drErkEanIcgi7NlgydjGfX/WODj12gbSva6DXAwk03scFsbr6Rtp0+z/ngVQQR9
 ZWvWzmQVcraZSBUVsTQ==
X-Proofpoint-GUID: qvqnCSxfNmRMb5PnVKW7lcCm0xanfOE1
X-Proofpoint-ORIG-GUID: qvqnCSxfNmRMb5PnVKW7lcCm0xanfOE1
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a025707 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-Rspamd-Queue-Id: 86F62516F85
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
	TAGGED_FROM(0.00)[bounces-107011-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,221c8000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.142:email,260c0000:email];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Add the qfprom node and gpu related subnodes on Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 26a4de9c8d45..0211fc9f8c88 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5868,6 +5868,18 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
 			};
 		};
 
+		efuse@221c8000 {
+			compatible = "qcom,kaanapali-qfprom", "qcom,qfprom";
+			reg = <0x0 0x221c8000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu-speed-bin@142 {
+				reg = <0x142 0x2>;
+				bits = <3 9>;
+			};
+		};
+
 		nsp_noc: interconnect@260c0000 {
 			compatible = "qcom,kaanapali-nsp-noc";
 			reg = <0x0 0x260c0000 0x0 0x21280>;

-- 
2.51.0


