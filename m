Return-Path: <linux-arm-msm+bounces-115533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C7sMEO4URGrToAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:11:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF0A6E7763
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:11:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VAPeCEuZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H0lnVqHv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115533-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115533-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9781318C9BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D12F4611E8;
	Tue, 30 Jun 2026 19:04:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842A147A0B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846251; cv=none; b=F1NfstLuTwasjF73IRFVc0k1oWlzexnbXJWVy9rVTYdqwFQj4NBquC/YTwlndEzRtI+Q1jKKy3Bb8fNP20un6HVEZspKpN2DYndwXMQ0zCC1lyRkZkIqOjMk+FcBcH18mcAL7LPoK3CQwuNrYHDEGtCdBwSt+9H46ePr3togavo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846251; c=relaxed/simple;
	bh=rfLV9qzeyVEE+pk1IMc0Mp1Nf/yReQZxa7tuJDB2tSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWNBVW0E/0vKypoTzZg2b1sxoHM//Reb72nKkHPtUdPMApgGEG6i0tCjmwVhQDlG+uwSZwFJtZG0ZLzYnFmbbXMh+cpHj4KGj+nHaT/uPLvl8ETRW7TaoRwtuIoxIKw4bLdbeTmSAZFWgrbv+/yIUUyRXVEbU6ZW1fbdBoPkbNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAPeCEuZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0lnVqHv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHklPf2730555
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inDMt4BB+yC6qDtrqFEdv5l0i8CEnUCXJaD4ATQQ6os=; b=VAPeCEuZ0DgCgCB1
	oN1lwiiTSxCbDKQFWRJ/WKu1qPmhwogCN2gcXw2jfsmgIe4oybqlMNp/zhz+IUn3
	O3niKUhme/m9MDLOpOqDy1DJKgxYkP3juNG0gzHSL4z1RYrtPUG98pxgQlUjK+Qt
	3l9X2xDMWwSdlauu46MB7uBuLaMeSkc4XdpRznbZ1wL9VslpmcUkfe6RCefJsNIy
	iP2yp4ClV2HeXPlKb1VtGmoGBHbLKJA8m+13EtDajVi+n7T+NSZXA2eDIaSZcbEA
	HaA80zubri5+8ip3m6FGcvt+n7v+J6njS0WWGrNkJt1akawRsltppFVxcT5QZWV+
	gXNC7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99gf5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:04:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so283151eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846249; x=1783451049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inDMt4BB+yC6qDtrqFEdv5l0i8CEnUCXJaD4ATQQ6os=;
        b=H0lnVqHvj/KLcDrzxwyMiyXMl8Fe4DIqMz9OzQHJlnC7qlEHWfRkiIT2rkIRPVBFRz
         komJmx/15PZ0X1XWRlA262NAEUNpdw+eux6e0d/V5kGvQV6EF2JYB0S3pHBrjFKyETls
         +HDCjflA/xIq+uS9G5D/8hp26q9NT5f2Pdp9Q9VEOzlCfWxr+0ybzdCL6ehX/hvm+RI0
         91oh2z6rusCwv5dFz42yI9aDBWAscB8EMibseqrr2rW9Deruj2cbb7C97vqYbEWEYkci
         gDyDMW/PoZ1cfmKuBzUAiS1lVyKXkMlJBRz7oCsW+pTFFWD2/abh9mKXnauN/I1RmVbQ
         nHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846249; x=1783451049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inDMt4BB+yC6qDtrqFEdv5l0i8CEnUCXJaD4ATQQ6os=;
        b=C3bzw4s5AkKosgRLDlwFLrgU3f0qpnTVyWcyD5ep0TZ6dTihmKbtjj1FIT18f26Dvg
         78cGu9PVTI/dC29ifE3cbWA5TgnTKcNvqbUbcJbrZvAMPSQxt3213sUTZQ34wb03D5Bp
         JNK/D8ffHOyjDbdFuHCsW1P1GMUIIlz9H2ELvVeBjZt6PrV1UniqxneR9pqqevOVmlql
         irt9iLKZELDndHjpOU1vu9GS4VXnYPC0dNjSKOYzoeeuKVD+ynt2OfQRbLqR7cc1mTw1
         Nrwr0XEwZksrN+VWR7J+f6qpEt0Bg1GwYxlDCEkLLMYW/zZqxTOQOnajA6Ih8fI/foIo
         LIJg==
X-Gm-Message-State: AOJu0YxpwFK8wsuzNCzPjry240NejrKUK4Rw4disiBqwDE6jKo9MUdd5
	Y4DeESzRRYvEN2E0wrVcU6MErE1nTReqZ2qVxM8+k6rVFt15VhvS0o2Z6RVo90SD3LJbbYHzwxE
	sOjHdzVzggIFXP4cRImK3/JNPT+MOsB57NSFcSwiOSZL9fk5DfJuh3aPgQdLR9APbg73i
X-Gm-Gg: AfdE7cmK+sHtQj2ZFfqaxxeAMLYNSNdsCSoHbnsrlgkrts3kikv2i5sXxAsIFFq+DVR
	EChIG2/Dnl+tiazeZr1RxKNJ4idlVYy6c5OOVp+iuMA9M1H0JQvps7V5e4zmHDfbzS8gRau84V+
	P8Q6gppDyOZPUcYY8PJHocQOoHqYVZbYbjSFYMkjgCpl8YbwkuAOU8M6FW+0Jk3YCNUCXqaC3El
	0q461MM7W95XWdA0sft1BE7sW0Z5e7O7Ka+YD1zvfANJUOpYnKu1yD35dw4B+kPZq5P2RqS1lqj
	Vm8V66vmU84UivN/6utFPTIUdC1QxzVYCbFbt8SmaFn7THUcw/HBpq/r27GNvkJIburzrkUJxjx
	gr2D6rRLevSAdR/itb+spiN5ffYvaPmJuMqn71khJ3lQ87qg=
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr4071307eec.16.1782846248965;
        Tue, 30 Jun 2026 12:04:08 -0700 (PDT)
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr4071262eec.16.1782846248249;
        Tue, 30 Jun 2026 12:04:08 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:04:07 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:50 +0530
Subject: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=4426;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=rfLV9qzeyVEE+pk1IMc0Mp1Nf/yReQZxa7tuJDB2tSY=;
 b=oUob7v7F28cUABDjOIOLA72w6G9oYBt8/wFYAIKsm4HoxHeUpYSDtkdHE8WaX7HJnWbUSkZYJ
 BDLhUPg4TBMCh7vNBRyUe8nK6MzscrovApSt9l4cyqO68PE/k3GKCzj
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXzYkDrXpNIkd2
 vgACWWMlOCc0W/mXTFVuAEMPMEUXJqqYKL+xHH0OXmULcYLKs1szTarVMo2TH1+9xNTuyyK0wPZ
 u7mnmLXfL0cTp9zV6ri8YzvRhOZM0Qo=
X-Proofpoint-ORIG-GUID: l0iRsza5bQj9Se6SdThz9bM0jDU3_xSx
X-Proofpoint-GUID: l0iRsza5bQj9Se6SdThz9bM0jDU3_xSx
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a441329 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RBLAtJqH_bkH6XPhXP4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX21WjDKdU3aw1
 K3und88vASK9Z8QrrY6EmTyw8g9lMXAZTajI/tY/U1kkwGfza23NwVeebeYN5/dvFAjDxTuMYWx
 4YfiHySa3g1EN2x5H0m/wXKBZNkkJa4O2I8G0qGFOyMJfeS7b6J48nDHfR505VRTh1DzR+Lj1W6
 Qv2JOUMXSgQUaWqlS6IFiwzqhWPGwI+nE8VjhT1FHVNbvuEwK3kjNb2wbhsH9ALa5Z+RhmB24Oa
 sg9o00AENeWzU3Do0gRsua131gg+qPZ6Iw9nyynNaR6XHj0pCdIV29EioMS8WIAukJaOWfrfSU8
 jELK7T75zirJZX+42blWa3O1sq1xNApsdyRGPuveyzzOaPI1UsMcQ/kZnd/+7hlQB/rg7xmnvzT
 iQmPOJ+HVlln/jV2+n4Urd6OWRYchaA0UN43RW3X8WLw+Wnc9y6R7CvyAXB/LEEQE5v8nTheSLl
 M0nKqm6JkreZTfoNDNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115533-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:sushrut.trivedi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EF0A6E7763

Add a node for the TC9563 PCIe switch connected to PCIe. The switch
has three downstream ports.Two embedded Ethernet devices are present
on one of the downstream ports. All the ports present in the
node represent the downstream ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, which
are on by default and are added as fixed regulators. TC9563 can be
configured through I2C.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 152 +++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 5411f22426b7..b6d24fe5fb61 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,136 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+/ {
+	aliases {
+		i2c3 = &i2c3;
+	};
+
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&pcie {
+	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+
+	iommu-map = <0x0 &apps_smmu 0x0800 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x1>,
+		    <0x208 &apps_smmu 0x0802 0x1>,
+		    <0x210 &apps_smmu 0x0803 0x1>,
+		    <0x218 &apps_smmu 0x0804 0x1>,
+		    <0x300 &apps_smmu 0x0805 0x1>,
+		    <0x400 &apps_smmu 0x0806 0x1>,
+		    <0x500 &apps_smmu 0x0807 0x1>,
+		    <0x501 &apps_smmu 0x0808 0x1>;
+
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie_port0 {
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c3 0x77>;
+
+		resx-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+
+			ep-pwr-en-gpios = <&tc9563 2 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&tc9563 5 GPIO_ACTIVE_LOW>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+
+			ep-pwr-en-gpios = <&tc9563 4 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 
@@ -10,11 +140,33 @@ &qupv3_0 {
 };
 
 &tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio117";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio119";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	sw_ctrl_default: sw-ctrl-default-state {
 		pins = "gpio88";
 		function = "gpio";
 		bias-pull-down;
 	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio118";
+		function = "gpio";
+		bias-disable;
+	};
 };
 
 &uart0 {

-- 
2.43.0


