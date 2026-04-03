Return-Path: <linux-arm-msm+bounces-101671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCO1Lo3Lz2m50gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34446395112
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A357030B2E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C4F3C73EE;
	Fri,  3 Apr 2026 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCobalcM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBXSe5Xr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C83C73D3
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225490; cv=none; b=ZpcS66OPcPGG0c92dTREBmJ6xy68z96tH+8nWbO/yNJ+gz19s2W5QG6YeRSy5KhoAA8XsBz4KpBfy7h3NoL6T2clhTae0c1+xP/2GD8k5ZyEjqSUem6e0b4kDbqtF558wW9zX5l5A3iV9IkK6IK+uvMtbvDm60UAx13Mj8skijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225490; c=relaxed/simple;
	bh=nE9u74KkmH5n6pdqjUMt1ZbSryNhzWX1EoTqyb8eD+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAKTWlQQVVaDGpcDfdDbrMuL194nU4oWSAM42CsuBoKsGZvY63OIeuQGcEuxs4M142qLyHpjiKbA9Ay2tOFPjW6xH+Y2h85sZ24Lu6rxwFOQ/m0yKE0vzsu5SmbYHU3x1ObnOrrPnk7zFJPYpn0P5XpR7gs9pdG1WpdNSpj7BdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCobalcM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBXSe5Xr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1dMW1453174
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 14:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hGcazW21BWeS3FSf2MFm8xujpyLJCPOyqMxtgfv99c=; b=WCobalcM/gQ+/+DP
	iO0JxHrr5KaxYZEWdBCZf4RcRpETjL4/I8emX2Y5ZgUnoZXSYtB8abOpTfNo+IJz
	oeAgaksRdTwEliXxPPcjzFEnziy+f/Ax2tP1yMnAvcme4BNTmAyCpbxztNsX4UXP
	pdp4k2yfMyo274mj3bgEDOZu4hHrOvOYcZyk2auF6XYNh07iE/BLAPWOa2NrNg6t
	4mZDQ+qCzasBEhr25vu64AJ46qPA7otps1APF1WknW1ooV3rLlb3k0ikPTJUfpDC
	6RW+77m0kGjT63p12tr6AmCmvVRmkuT9WPjC24Ucds3XoY33jQ+BfTHIWzChqUFU
	ZIIFgA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam8g85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:11:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60554e770e0so524255137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775225487; x=1775830287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hGcazW21BWeS3FSf2MFm8xujpyLJCPOyqMxtgfv99c=;
        b=OBXSe5Xrw+N4NiV8WcDXYHYj8irJzT3YfveHthUxXhHfLt/lc2ccCvwOd3WTmKeyhu
         6mGoxONRwS5CqhO3IVLx1oaIj38jb3X4Xiy7OWGHL3R39OMxrL9VI27ZppX2efoNSlKo
         DXUtE2QmN/lBrxhYl5mawdmd8D5DK/Tw51WUnrcD5Ob6tysOFa2MIINkE+a0y4deZ1Ew
         Soh1u/XASCUznIQp0DESzV3kjZwgq6q0lSC2usU1vIcQWDKoLb8uyMCbyVuPWtOdiy56
         E19TEEDbHWUV5meYHLNd6+KTqvrtaVcqDzGywHNBLIYt+Y7Mo8MarNLajwyehEyGrCx4
         EHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225487; x=1775830287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6hGcazW21BWeS3FSf2MFm8xujpyLJCPOyqMxtgfv99c=;
        b=m2CIlruuttoSvI4p0X+OVTYqRqvWmdImDBPfdIVnPxYQ/VyFgYxbsbNXqyUnB4LqN6
         Z74YeIpIB0NvWf/bUDjXWGNsqA5ZH9RyxIqIhN7boOC12vILT6mgUGc9umOEayorV8sT
         jBAZgC08lJAtT0hhVOXPUJfebpd/AEZTtxUFDpZqL6cVRopowCFMovwIX77RUyVinSLk
         xuiSMWupmKKzczyU6G9AQ+XC4oSmDV/pctS9QZ45OKxSd3x5Cc1dA2ZZfzVObJ+F0eLS
         QKrSFWpH9WXvWvSVbHOIWibOIEiR4Lgs5GnPh7Z9i5fUcmCxtYt8T9v3rNAHBO+o5oPH
         6foA==
X-Gm-Message-State: AOJu0Yz4jaZpV4QnOAQJrcFxAAnpFJ9BlKdp5xWbk8onx6MGmThH4vwf
	YY7mueHNIYoaq92vewrboCcYOCJKRZ1iA/JZ0IEdU1RZZGAQaTQq5Cu0gncQc5GAazMUUIrYBgQ
	n5IMw3fe1kKIWFY61W/AkdBvn7/ijtTtL9e02gM1tBxB1sjTLrcw9galo/9sg3MGNv8dg
X-Gm-Gg: AeBDieu98OQJlNSX3fWy5JXIh/sYpWKFDWA8u0vKqy2c+i/qamIIV57g3fjjtQzL+Mx
	LBujC4cDSL7+FrbJL58rvv1hYHKC20gxt1YZsDaCL4pqJaGsL/OQtkMDCiF5YmM0vczR60G6JCG
	ptOchbRs+sjNiTRs9pelhEQBZGUd3cSBj9CWne0GPAwgaDRnggMkRxmmwQrg4BKXGJ4/h5gPMuJ
	g0Oi9FDHnn6B0oqGRnGkhmY6Px0HtO1KzNZa4jxqoJ3AlZiZOUtyASWpQL/0z5BLFIBJTx692x/
	3I/QU73i8hOck43IiZhloo7BSLlgIaGdI6qgjL6rk1Ol3J4kMBhab46Hg/E+zlQDZxEnU5DRSjJ
	hZ7WbKdDLMCv7pLv7+xfMOSaqDbDqCGRv0vDDnRK8xFxaTxaF494=
X-Received: by 2002:a05:6102:801a:b0:5fd:ff75:f41d with SMTP id ada2fe7eead31-605a5050f2fmr911318137.24.1775225486907;
        Fri, 03 Apr 2026 07:11:26 -0700 (PDT)
X-Received: by 2002:a05:6102:801a:b0:5fd:ff75:f41d with SMTP id ada2fe7eead31-605a5050f2fmr911300137.24.1775225486409;
        Fri, 03 Apr 2026 07:11:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1b19esm30127315e9.6.2026.04.03.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:11:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 16:10:53 +0200
Subject: [PATCH 5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
In-Reply-To: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Prasanna Tolety <quic_ptolety@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6AgLXvAISIyW6in+U+z6mG4Nhwb+ZCXvmVlquL4ABac=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8p/q698ZRjWuoLNz7kWT17UNDJTidGyMNybo
 V77QAK9lueJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/KfwAKCRAFnS7L/zaE
 wxecEAC8scsQvjDTp6NBJqfxvYRBB3/2t6BLwbBTJkdULIe/Vl8GSv7yiRUijPLaz76ReHdSUPQ
 9AlNv727udHqhz5527c5QEOq3whQnt1kriI2D9GafGu+GXRpUaVAqMzF9uwy9qAXWzz2GyaHgo3
 GtXttuCb5+1pAFE6bwkIxidF4A4u2h1L2PZKn/P/KlXnmkHWwlLypT7a5qJ/qRwlQ1zpJqHRVYm
 vqvcq5OxeBJ/qA+si2BFAsG7ZUc9g3ov//U0l8Lr0mJvwjHJZeDP1c1yleBTAo/HmOcJGrMACZy
 nga3OvAuE1W3aCHGj6brHo5Q8ILA2HatiW9xCs4MfHdoc7zHGpIg1mgxWL/cbee5y3ywo5Cgak/
 /HJXzbKyl9pLs2foTbLajUJX4he8qckDJQA8BzlWWUjxShxL3BefiJiPhcuVvmcTuiIHpCvNjkg
 YbhO7M2DJmb7Uzyg1guNDtd/olGnYfZbXHBSy7a9ouyHqZB6CjDpohReXFnja04Xw6MmAcF0taw
 xOzbVOdlKfHvwYgAAoPKWHF5O4TFA06r1C26igHF6n4jpXTkD/PUfx5gVjsIhICmSvD44h4p7GJ
 5bLkijUw6Rs/G5HajguwourDoaboIlK1ODhyIdmMSaIOZ9z9DJ/FH4CBowZNxrtOMg5xi6iKsTy
 hX9y0i3CNDHkI3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: AnDzB0v3EWgnYG0dJb0GOjnoJJqT0SiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyNiBTYWx0ZWRfX/DXO9YEFB8os
 JMTMmZZNfNb76LM+O2d0MPIxD0thIjJQlgVIYBgx2EnjOLBfO6xrEwLVi8JTX6s9EqIchbmp/Mr
 5GSYaDU22F8HoZiLseSnWHg3HvpA6OGPUYqLQxI6Z+zwZSsJSOIh0G+Zz+mMRTtk/uAXHTuP30q
 ZAMxKRLXrQy7jkF4PleKez6MvsIpk86pcp9NxpLobwQqVvDCzYjaMsCd/4lWCKsnHdVuj2K8V6o
 4k8r5jpCpOzp6nQymGfmGU7TnnGexfy88iZK/wUNRK29RtlLU/N1SWgytauPCsmIzxoTvCfpT32
 +smFX2Am2HFfPKsfnTiwxARVcRPKN2gZzgZYVyQz9wCpjySfBYcws2yndgOT+rCDvm93hQfsUVr
 mIFRPQhSATOo/wdgz03u3Mt1bnuWIvORJsg4XdPN2EMQAVeeGvRtFjWrluk3i0dmtQbevXbCNUB
 +dF++/HV/zxXblTHKVQ==
X-Proofpoint-ORIG-GUID: AnDzB0v3EWgnYG0dJb0GOjnoJJqT0SiZ
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cfca8f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=OFBLpw226W5Idz0Qps8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101671-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,quicinc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34446395112
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prasanna Tolety <quic_ptolety@quicinc.com>

Add RPMH clock support for the Nord SoC to allow enable/disable of the
clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae175b8238117eefb4f38af0ec40a4..0c423a72662ede52a3ec93679859ae5697a9d7c4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -349,6 +349,10 @@ DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
 DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
 DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
 
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a1, "lnbclka1", 1);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a1, "lnbclka2", 1);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a1, "lnbclka3", 1);
+
 DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
 DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
@@ -965,6 +969,21 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *nord_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div1_ao.hw,
+	[RPMH_LN_BB_CLK2]       = &clk_rpmh_ln_bb_clk2_a1.hw,
+	[RPMH_LN_BB_CLK2_A]     = &clk_rpmh_ln_bb_clk2_a1_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_a1.hw,
+	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_nord = {
+	.clks = nord_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1054,6 +1073,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},

-- 
2.47.3


