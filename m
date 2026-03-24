Return-Path: <linux-arm-msm+bounces-99462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBi1G/PYwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:21:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FE2FF93F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E814130EF016
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AA522FF22;
	Tue, 24 Mar 2026 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RG3qecOQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VbZ+JsFG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2046E175A6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311092; cv=none; b=lb/tyWo9YPH55xu6Vk1+s8Ane8g4h6NRlaUo+RggCpoUkTt54Xz8wtUYlAAj6RNlLgja+rXNwSI1LAnc9ItVGlipFPluY9VikUNOXuVwlHc7aQRcW5FCOXh8st1F+m4ZtnE5wDqrtrZ3ErRG6j6xsWtScdZOd/v/9DGMF46GSe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311092; c=relaxed/simple;
	bh=8tSrjSEctrELGYdxKKPYShR4TxJ0d51LBO+dSM9b1Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fN9xU7Cf33divdvn/0BxdSPDj5os7yv5lloeQ7ukPZ3qZhksd+WMhn5QOWecRqVQ7hxTtC/I+8TDNQ9i3jJ4UL+I2P6A872vs0sFaXBwBrqyamHVFWyuo3GcuAVgjxZqpESmisoJda5rG4WSC3gQqEgIgHk0G+Hs3ULs4n7nBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RG3qecOQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VbZ+JsFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqrOl2681734
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcMmeQeTt0vPXYhZkgPaoPSS4C/8s4GILVGqLmRQBys=; b=RG3qecOQkaDTHSL4
	xgp4ZiTS5rrtr5Rz6bHfj0v8xU08DtquU/reYMwmV6yvVHhGI63vk0MNERahhWeJ
	7YZqnSXrscG5bLqyv7nLGls8/HoQsySkP7oOeHetM6GaO0tbczzru0Wc4MaO2ro8
	vDdA0flSyX+d8stjPaOYZPtIrbssdnPC25MRLpJE3nbjS57wroQXtdJ9G0e4Czte
	fYPcn5I41s2sOwFjdg8BL3gPK3Qwlo7Xa2UyQVdHpDxm1uX9aXhWEj8+i4yO5jlb
	3D8BLLoOaIaEG59FKF/8QH9uVLq8QL2J/EogoRSX+fiErL1AsfUcm0BGtx2O64um
	ZlUDiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7b6fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso10976421cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311087; x=1774915887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcMmeQeTt0vPXYhZkgPaoPSS4C/8s4GILVGqLmRQBys=;
        b=VbZ+JsFGwjHYOG937HkN1HLLwohlqADwGexalkzxZU4OQBFwhp0UyBCX+bSQRWF6ys
         +QPN5j+vF93iKrzPjzw2fxvB/1GOJZFVWbtl6dfuy1VmnXUDCfuvnYb+E8/r0xfRkLue
         /4MKt6Qs1DqIXECqjINxVGG8lcI/DGtzNID1E6lKFk53H0lkPI0KGNC++4pMWl6M6/Fy
         00spB6cEtwB3WrcELHYp+Kz1ziVV1a4pLVXJVo0I3X8i0rpFDokSroYIH4qJ2dRCKJEV
         gVodOyZ/3+zebIL59ARNXX1uk5IIfGSMr7V3RqzRoMQsP4X+K/YpZigwrv2buBbilo5l
         0J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311087; x=1774915887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gcMmeQeTt0vPXYhZkgPaoPSS4C/8s4GILVGqLmRQBys=;
        b=qYKjCXnjcV4siXoOCERFb25iqL8dpUSFsixEJ/hETJaG7SejNGtviXeq3oaP3QNNqM
         /kT4c+qOqkmu3lXLYbizU2aaJ1qqb888VSOpA5bNyd/1gWohKTkwJCFL9aIxwxfCfMcj
         9Zexaxsv29LsA8L+RTxicVGA1w6fu79S+PZ9I4Ohnipzm4S77qXfzzfxkKKhhcVtDepR
         UxPPayjYCkRoxxz4s3zLZpoii24tAeIJdSGyvZmSGNO3gjaKtMkU6VPTHcCG/iN+uBvY
         6Hk7DuZpMKF48xosPzoNznf85zKDB8BxaQ748JM3bIL9V6An4o+IJeQ2buMmCjZd0wSs
         8EdQ==
X-Gm-Message-State: AOJu0YwqRI9Ae9djfyotcYxU7jsECnFWGRHH2yowaEP3MQfapA8WtpIv
	CjrCarK5Ov8NRvz/H9n6Jl3lHY+QOBP05mUGU92cdFHF+WeuHbH4NsSrzkBZkjRtGdlhPuIzVF9
	zeNl+wwCcJ7bF7FUPIjDDkAKI/+dThVJBH/H7GNMU1QM0sSZOSNK8bA7kh6EjFXYQiaWV
X-Gm-Gg: ATEYQzzH5Q0R1DAN9SWs1myi5oHShHgSBnt/RhdCpTIChsn7oa7Cz40P4C8UU/FWOyC
	ShlTUJ6BJzFqxJiMjRju2WeYZm3RGTynVypy9VoXZG7+TP0I9ZQWHHWHwWLvZfCklMj9/9aIW00
	Mq6nl75M9ir/jpS9E2vV4BewnMwNVGqdy0LfOfyKArCazKw4z5Jl/nCBkHY3fmLARrSbB0+G8S/
	WnQu20d2aG333i7r0dvoxCE8NcDK0AhVoJEmOiAd2cd+FeqTKmJKhbqgcFoXFSU00YEjPfJjp92
	TgWMCmigDA+KkMSD7II37DZHwBHNuQumnd5pLms1bsY/VpS7WBXHv+/pabI+8fIE/R7bMAvRoun
	xBK3FbJu15AfoQ0PQ8lA/a1BZAUTqd6WXYsZ3UtGLDqdpib8U8dUUq6YyEXgR32uONYtVeswYxs
	aygsFY396/ejZsAM+0fq0f3zNPMbnCSL35hP4=
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr197436891cf.1.1774311087346;
        Mon, 23 Mar 2026 17:11:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:50b:4435:5dfd with SMTP id d75a77b69052e-50b4435710bmr197436641cf.1.1774311086912;
        Mon, 23 Mar 2026 17:11:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:11:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:45 +0200
Subject: [PATCH v2 9/9] ARM: dts: qcom: msm8974: Drop RPM bus clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-9-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8tSrjSEctrELGYdxKKPYShR4TxJ0d51LBO+dSM9b1Kw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaIRnJghTI7Tp6JqqPF+fMO4Ob3Szr/vaac/
 QSs+5tRH5yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWiAAKCRCLPIo+Aiko
 1clIB/9XPkTyJ4KuDtlJiZENLt+iFlaFmToPS8SnTFbZ5gEbQ5a3EJqooOzwp8+aPMiBRkdVVmC
 tsJq8pS12CWhBCfuPPiMvo7MR+5z2OlY562s5pZlwAUk12BIUzMbuRy4C3LkSTdwBV4itBEd7lC
 qvX9yyF8HE3S1Qa4XUfufl1D13Bnh9GeDPBh32vOjBUnPqOIAqm9PQ+4DEum6g2Kk+l3Vf8AQrp
 dvAGgMzr220a22Pam6BnjSwyg8Jio/lLWDVL1zPDcmFzSo/W1OYXh8dcDV0m7XLkpfqyWRLsb+h
 ruRwPgFg20qCvR68ePYu8hk1qkzCuxx+vfBAHRoHp+dsR3q1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1d6b0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=h6rqPeke2OkJn0bzelEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: kKQmeaG29pNpZp7XrtMrbTduz9c9cLU4
X-Proofpoint-GUID: kKQmeaG29pNpZp7XrtMrbTduz9c9cLU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX6AGawP6VqswS
 2vKjqonR/ewjXuY1lvjjG0LCxebqMBps8XC2MiXGaKCThEblUzDFr+ewUnfzpRaLw4TdP99GIQr
 ADxEKpaIQzHllHJSYQ3CxlGhkknzt53mG2wlViuPrZpYUN8RqnSGV+P87J6v+IZuyW1EOT39T4I
 MbWtWWdtF6Z+OjEpROrAoRmZXpwXMb/QN7N/5laLM0nOmi9cAsBb7ROtNmMQbTgcnxhYeTAWXnv
 t+KVU6vibxw7ZLFfEAdPNaCYcoTCjqy3LSo30yN2lOU4qyIaMpVawFO2V9B8drjkWYvKkz8u2Fr
 BMvEGwp1sUlyvODi7KTipTHdxYamlsJFY3t/UePOs8HEZs3az8vnO71hSgmJnDWDrVJAGGvTeHw
 MUnc7pJm1aLcE0dg5V77pTqPJUQe2lxfnDG3GehHBYnShpHQVo1ThjbTsrmIDk4n72e0AO80iPc
 XHHqLJp2pzqcsqsM2xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99462-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C13FE2FF93F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some nodes are abusingly referencing some of the internal bus clocks,
that were recently removed in Linux (because the original implementation
did not make much sense), managing them as if they were the only devices
on an NoC bus.

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 2a82ddce94a2..95be1d2e214f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1115,9 +1115,6 @@ bimc: interconnect@fc380000 {
 			reg = <0xfc380000 0x6a000>;
 			compatible = "qcom,msm8974-bimc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		gcc: clock-controller@fc400000 {
@@ -1162,45 +1159,32 @@ snoc: interconnect@fc460000 {
 			reg = <0xfc460000 0x4000>;
 			compatible = "qcom,msm8974-snoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		pnoc: interconnect@fc468000 {
 			reg = <0xfc468000 0x4000>;
 			compatible = "qcom,msm8974-pnoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
-				 <&rpmcc RPM_SMD_PNOC_A_CLK>;
 		};
 
 		ocmemnoc: interconnect@fc470000 {
 			reg = <0xfc470000 0x4000>;
 			compatible = "qcom,msm8974-ocmemnoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
-				 <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
 		};
 
 		mmssnoc: interconnect@fc478000 {
 			reg = <0xfc478000 0x4000>;
 			compatible = "qcom,msm8974-mmssnoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&mmcc MMSS_S0_AXI_CLK>,
-				 <&mmcc MMSS_S0_AXI_CLK>;
+			clocks = <&mmcc MMSS_S0_AXI_CLK>;
+			clock-names = "bus";
 		};
 
 		cnoc: interconnect@fc480000 {
 			reg = <0xfc480000 0x4000>;
 			compatible = "qcom,msm8974-cnoc";
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
-				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
 		};
 
 		tsens: thermal-sensor@fc4a9000 {
@@ -2223,6 +2207,7 @@ sram@fdd00000 {
 			      <0xfec00000 0x180000>;
 			reg-names = "ctrl", "mem";
 			ranges = <0 0xfec00000 0x180000>;
+			/* core clock doesn't exist anymore, kept for ABI compliance */
 			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
 				 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
 			clock-names = "core", "iface";

-- 
2.47.3


