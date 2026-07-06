Return-Path: <linux-arm-msm+bounces-116970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wvhNBl7gS2qSbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:05:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F93713A9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:05:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NIwo0nFg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gOJVmU9Q;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9CBD3086828
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC3443847D;
	Mon,  6 Jul 2026 16:57:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7F436BEC
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:57:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357040; cv=none; b=C9wtug4OGNNy06PqQAr8FAjwNWw5Aw4WIZ4Ain+X3s0DiIF/qT/QbjA50MYuBj5ItYw/jAdTnAAHeIMo1w1H14vSTZ7RJer9bV9d/a6pQQbRlMgVPS4OcnrFN0SZaVuBzJkvjFZwMww50vyVFxl+nUUNhvS1kkKMXnnJlF23u5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357040; c=relaxed/simple;
	bh=08vr6cxy5ZZ+9RWNCtExcFI/JcQWlwcxowK+x8XsFaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KyxePbF9Nx1EpJfh1sa326A+FZ0wV/ub0RBsaGvOyw556jRRnBINp/6/nEgSzMwt0JnHyJurhmE4/LBhuLiXsmsRnRU8WzBbqQ1Wt8U7uDzInHbOlY2iPIXAwxCucfBN22/V0O6c1E81GRx1ffTMQpoZkHzA8rqOrC//YP8j4M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIwo0nFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOJVmU9Q; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFEiX990343
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=; b=NIwo0nFgjVYs78GI
	/xbEprZ2h/6NoCvaGe+APXZxcYLiTxHwSc9U84Y9vleZ0Q3wUIyckLMPG13KlSNP
	GRdJS8f+Uh8m/qV0Ucjboql6keAxSsL2OmRAGSEqUUsYHDC0ixqAaam6UH+2DWoH
	tzr9zq46NZoMilu4w6yUCLgbvGbV2/sKkjGGZEbJq9MQed9KKDmXVbj/WdNqfb9h
	ii4tG/UQwvukIeLJ2VACNXk0B8rtSIJQ+QIrHn8JlwGPZ+CS3/ItwEBGgl3MqMSE
	zK4u99GOFBZwUShmxllvKDVoM1x7doYcPSjnNem9iD1FmOkoJZ9K2j7ea9v8TDDH
	1VxIaA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsyq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:57:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845317fa7e6so4974848b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357034; x=1783961834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=;
        b=gOJVmU9QZCyuKe5y//ROiSlfZ1c7Og6Thubj/4MxcvllaMqKTp2zJtbIA0yBYefzpD
         5eAMiphcZnmkm1gqXhzFG1o5uUTne7EZJJFSOFUcog6gyUfFOs0JXgfoGHP2GGOpkAmf
         zaXYWlqsL79Vnv83g/XJR9VMcPIEhxs+G8eA1EycP1P876qnE0KoWDth09zGUQT8+cb0
         b0GKDs5wkLesmwoWIMGfsV3H3rmWOjBL0Bv2SS7Z8z6R40r42WBF7o2MPtbVYXfLMqxp
         cESe/wAx1Y34eSYSf5QgrPTdv39TOCB7bGWMT82DoJjsgw6dWL5aNIUqGzOZkaN0upi4
         6Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357034; x=1783961834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvXc0//BOtPwrceNXqPLWm6VM7eQI+cAM0eRpWoytQs=;
        b=Nqanb+y+beTrRuv51/lDfdprfx8W0iFeHVuyW9d/gkbXv/MQ2ld+XPNBpLu4KKqueS
         Vwr6XCvkR3qzNa6bPsXB+JxK999eRh9Nauz4PD6An5W8mfhjlo9VlhsUSlwcZX18JRgQ
         OAXgFShYPVMPkLvn+zG8bk6dqx4V8wxXG+yoa8UA55fTucp1X5hV49pimLcIL5t6JzTG
         m9lHtWhv7oCCVyngLMjLuO+6n8LK/XJOjJ6XfEYb+KoMWjqkD8LGE55Zz/dYDmlt0GFi
         4UDoOPJkofPyFXve8xw82YLu2lU7rCgxLjv2nh48Zj+iwvCnbNdWtSI9Ifxa54BnsAuH
         ylXg==
X-Forwarded-Encrypted: i=1; AHgh+RqVMmIsOAzDhOtzukf2jkj4pQkPmSy6YOhAxfFpUZyfZ/huOULEDPe7e0/n1nSReeEtKVSKvm2gOB/q/R+T@vger.kernel.org
X-Gm-Message-State: AOJu0YytuVJ2ykoQaY3XgBsnOxD+qeHyUehDidPneLfKmZ7YXIYDRWU4
	Q+EWmZz1C0YFpOBZBXUZFBkMKXnlSAltcJRZgcPNJB/TixWZnilCea+LAsV0pWKCMm38a8oaOeS
	QJlg4bexB6tBvCorONWUun94T6PIjoMEobO5VbEJPoCeLAl77C8Lpgm6TpNe5lx9Jp0EU
X-Gm-Gg: AfdE7cmzdnxP1w0HWNEoeB4MQdhsJkOqR3qFhWz10vYj8vNJ0sKC8ZYPdclhYOlV5uw
	VlGuy1hQujEuvVGT1uTJdg7cZIvOMMjSLrcgwPAI8bVX5KXOMxvk6d7ndlSHQDU0sR5CwjEDelS
	wY9pBhI+e4pGiAGZaRgfp22sW2r4yvGrnUj7aLJXbJ13C8vu+RqqITuHggGF2ENh/iJnbPd5xh5
	Llk1sr02nd9ETR+M4AyLeGRNskx5kDiK3z3+tZ/8cWctqq/20I9gzAMQIGcoDaGl86P3YjXmLlX
	ZlXqr7mmKsPT5/VaUAPlTvhZJKXW2oxiGYFqwB6zGyj8PHAc+DnsLVdX3ScsZM8QXfa/tezsyI7
	kYyu+ik++k7XBtxTuumjgwsR+/Rb/2mQ+ar6ZnWziLA==
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr1409291b3a.4.1783357034002;
        Mon, 06 Jul 2026 09:57:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr1409261b3a.4.1783357033583;
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:13 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:38 +0530
Subject: [PATCH v3 5/6] arm64: dts: qcom: monaco: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-5-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=08vr6cxy5ZZ+9RWNCtExcFI/JcQWlwcxowK+x8XsFaM=;
 b=xbqyKoHGYi2uTsIV/EYwj/ozpnriCZVKxtUa+xnUuWnwLuW5YiEE5ZRyyGolLyLSafYzSELC/
 dnYQyfyM39DD93cT2B+RyV3GBdtoOFIAmn2dbH9tad4yH++VMXsVxlp
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-GUID: -BjI2ctgtoiuoTWqeL798KIdp-CQyszC
X-Proofpoint-ORIG-GUID: -BjI2ctgtoiuoTWqeL798KIdp-CQyszC
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bde6a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX2RDBe3lYEg4O
 x5dSzsEqbAk7rVYz6T66wAGH+cJG20TNtEUM+7jC/9esw7lsI6sUpwl508Ti2qEzRA3+4mD2AgW
 HCcj7BlLyDJaWgCWjL1fuE+XmfCWX2GfBs8Tzo9BvT1SSQLg01uySVDaoet6hE8IhS1LIu6gVNg
 +R8mHLWqH0O6EYEhrW61aJPHvDLpsIyxkD86uqDVKiiRaHsgZYB2Pm8VoFRXd04N7tyYgsMoGr+
 U28FUAqNwXs1dGnV9uTD80VROisLSvUCuLvErTIC7SWvNFgPZ6oe/nKfsmdnA6Lvmw5UnJjutbI
 f5CPYc6FqfnMn+l8eQXDclQUHiHOouBxVAg0VWLG0PhgP9cJnpCOAD54zKfDyCZKOflK8NL2dEA
 UaGqcvcVyWGTfEuIRlfgmLPalz2CX+e254MXSdy4ZcoPNLo9JXc6imK8VBCk+q3FWdcbwkcVQu1
 bw2fSTWKZRBfbYoypqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX9sda2VhQdTua
 9WeLH2r5bRKudertIKhLscbH4OqgckktBVHVDbAtJcIef+NKsxZjk6Q1vHz8mEx/exUabmuLxxH
 9MJG9FQrl1OikKNttsTj/wvghf81XTc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
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
	TAGGED_FROM(0.00)[bounces-116970-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:bibek.patro@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83F93713A9E

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 400c75437978..e3713c2b6236 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5117,6 +5117,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1


