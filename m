Return-Path: <linux-arm-msm+bounces-115531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qfyeMNYURGrHoAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:11:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D17F6E774D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 21:11:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hCyjYy40;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MGTGO+Mj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115531-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115531-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846693184859
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3B74779B3;
	Tue, 30 Jun 2026 19:04:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE847277F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846240; cv=none; b=G8zQgAPH2XH/Dc9tUUb0LJNIzfxczedS/B8lQFqMPxM64do/Ple/e2HEwTYzFa6ZiqKKq1myMLwr00ncijtWNnCmLt+zRmliOj9daDFnqAo/rc/vpticVuZLhSk3BrHlzwg/NS6cIILcNA+h5mnD1sKxQqk07wX0BaaAHDbjLNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846240; c=relaxed/simple;
	bh=t3qExvvehHne3DGPiTuwj1nj3sEKbHg7NRpHscaXsag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVwSI2ralz4rV0kKKFFgVwjYSuEVQM6pkKcCo6EeVOtnWXVfeScbkbiuw+rcfNkOs9sYt171aYvBGcVZwlgtNYkn9QAvRrR5FwPVVYnprtIEHS7rXiTseXIwGeBHOTjZOl+YO+XlSItIgjefT7MlgtsFRkO9oJWX92wTwMSlD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCyjYy40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGTGO+Mj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UHrlQe2747895
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoAFJhDFaoYNFe6KuyZHoEL7dGndbuJXxfS0b/1jpj0=; b=hCyjYy40zc/VSfH4
	KaddSYfOljjRIVy41oBDdSDdrQKYC38VeGR4ByBa5tAq+Ju5Ay1IzmMHNlpTTeoP
	6W7uJXIqb7OHwnveefHTOqgHUb913NR7bvFR/0EgXIuviy1f5ufFkSTJ9nqeVr5O
	sdETUcihsnC35xyvmWngYmXQCX8Kjcnid19suCLZYP4DHCB2TjOcCnk2zPrZ2XKe
	rpPKIYYbwuvyWB3OFhdhYIk/jZ+KAQRsYZmucKsg0PKYbSvjlaCI9utuU7DTBUA5
	/25wxMNcNCq3bjoRh1gOSzBSP6vyb9UHKrNVtCMgW7LE5EeoZLFRGf/6s+BbWN0j
	iPvxTg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jkt8bct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 19:03:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30ba395b047so2545568eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782846236; x=1783451036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoAFJhDFaoYNFe6KuyZHoEL7dGndbuJXxfS0b/1jpj0=;
        b=MGTGO+MjWt7Cdz9jt/HU7Ejq4HfIMmTWOvBUOX96zo2ZjMX51ytF7i9JHPf9gCQ4t1
         yIL70JNtR8zwTy5DZ9S9P+iGzwXaz5aQQrheWH9OtRSL2KexM1EbArsog2JmBSvFAwGe
         dEkLZ/88FBINq3WTfng/Z+igQ+Cfit2C50SVYlEonMBjvyuPlSghkuGWQ73wmChfjXSy
         bMB64MSlGyL6tKznICCfTN3UJrinRlHrU3q6CLfzLTxcLPS+REvJLOiDiT6+yZkauaJL
         j3+7Xhisj1R/4zVAjvIZeD+ljx/stX/2pcm2FpoSKRt2DYjcafE4GPXm2in43V5FIFAG
         6ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846236; x=1783451036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hoAFJhDFaoYNFe6KuyZHoEL7dGndbuJXxfS0b/1jpj0=;
        b=D1P9EPuq+neKyX7/TmZfGFniEWbQo2TUX54IQdkaVtXIOEoMa+fwnz+FVv94tLVBh5
         +eVrnR7G/rCMLs+NxBJbljWjaivdv41UZLrXhk/7jSEx/D7iDfiEkA82N1aeEKHWnDVg
         u2G5HqaS5j+NMfcLj76LlGF0pI3iBVmXXsmnSPU4LvN4EI725xJClZLdrLNviMNoDYQR
         UR+sC+wbLEPWdxasd1L30kMmkxGnVCys94k99xETjsyavmMXJ4VrpCJ9788aQYqUVBy+
         6VDXGWPis4pMRjtz3AxIX7C+OMUQCvkmC6GQtdNn8/d4cBkZQZiVsR+icV+5njl2PN/w
         yTtA==
X-Gm-Message-State: AOJu0Yx9R7JfAcLRHwifQw8ng2EklPeH7o6BYxgnBZkaX+I4G0fd2VU7
	sCJSLkuzCADxSRgRL9yRgbZv4zLJp22KxJ2QCsX8offQbDSXofB+QBNzLN2Dz4nmnNcARN+tQV2
	nLInBecdVCkceAWP9jta1rDnVM5LbMreLxaAmx2PRFFT5kMKoVBr3oMe7YOAtbuT8uZGz
X-Gm-Gg: AfdE7cmm/62G1aHfY0FYr8WzfFnJYqWOicb0/j9qJPF3BD0flri9YdmJjo5vfOXwJdR
	FvSiPOVwOyCnRK1/of9uJci3/gqTtkLYSSHe2GMmjJT/7U5PgGaDN0lkAf5Ms0Bjg2FTKxNfSUA
	6IQ7TnB6sU2uOpN8aUBbPwKWyVQSXgFZVqk5BqlMNwu4DtIZFQuysd9etQQIqrg1/u0lW5X/jRV
	s6vtYNsVg7XoZtyePAhdiEp/7lPGGINOCVpGCHuEb0GuzW0jAww99iR5QmAatzXfi4F89lIlw5P
	WE9tvpvyroMfG8pOqWfgKGWeTY/2CIVAGdeZp8bppx7f67KWT+xwaaCeb+6yl37gwuGk+vUHx5V
	F1xHIdi/Hxr1oftk17xm1BmGK+QBb7SosfonVjUtILYB60rQ=
X-Received: by 2002:a05:7300:dc10:b0:30b:eb75:8a5a with SMTP id 5a478bee46e88-30ef0929c37mr1293385eec.25.1782846236297;
        Tue, 30 Jun 2026 12:03:56 -0700 (PDT)
X-Received: by 2002:a05:7300:dc10:b0:30b:eb75:8a5a with SMTP id 5a478bee46e88-30ef0929c37mr1293352eec.25.1782846235694;
        Tue, 30 Jun 2026 12:03:55 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm14963815eec.15.2026.06.30.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 12:03:55 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 00:32:48 +0530
Subject: [PATCH 6/9] PCI/pwrctrl: tc9563: Add API to control endpoint power
 and reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-shikra-upstream-v1-6-e1a721eb8943@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782846191; l=7032;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=t3qExvvehHne3DGPiTuwj1nj3sEKbHg7NRpHscaXsag=;
 b=P3CTnGwYJ+buMH2sHYEhz9nGYIDn5Yv1am9Vm73vD9wBO3z2k0en4IeOHe1HtqpW7+0hfc6Ou
 fe5OHRk9timDAw7nZq4NGYufhQQC+SnoycknfDSOly6itHJiSfQaN7d
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfXxTH4KfEr1tSQ
 R5jLFIGDm4SnixtMzt7dnm/lQiGKYcUwDlmGvRKMW2KrVcRLUREOYSnKFSOaXqp1z9kygpHBIXD
 5nkSXKep0rKgIvmcb7u8rGCsj0rTstc=
X-Proofpoint-GUID: AWkwFLVwaDFYehj4B3yig0pfhot9E0rl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MiBTYWx0ZWRfX9v9MM749W49X
 GtyIEl01AoSP7LDGp6GRRAJeQqqsx+2+gLo+iCFavhz18Yxkd/bYLlbdd9HrIcZFc/72nBmvGOA
 1lQBIsd4K5PoXq+G7JiUbou5q/iIq7KiyOnzWOPvSnPMHjkXyZzP2LN3e/M5uWTp2QXPf1N4c+B
 GT0Iq7weTaefl+AGLFHFBZQn8Pe1T1eGpjH09b+0/3whWwa+01FLX++GFSrQ9nKDXXfsrJHxIiJ
 mycQoZy1ajz20kQmpYdcJlZaav9+PsFn7ceBTXmLIYIKiFXCMzQAtkyU8ePgoV/B5KzBaLKlAsj
 HKpZQbi+JYmc03Yu6IQPZYZIs6ZfTTxhfT7UAlC5OlH6C8Vgyzg7xmMeKSVSdElKlcnuiLYwO26
 IszomWVOI2TVbBBpHgIbFZhgoMiG6eonP7/Dgy0Ks6ASGdpd9HUhfkKs7H/U/JgzB4aTXIHsv3p
 mJ57EBVu+dIzAicqEUg==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44131d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0i6Wl48qgBbC6S7HcagA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: AWkwFLVwaDFYehj4B3yig0pfhot9E0rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-115531-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 1D17F6E774D

Some platform utilise TC9563 GPIOs to enable power and
control reset of endpoints.

This patch adds support to parse endpoint reset and power enable
gpios from each TC9563 port node in the devicetree. To configure
these GPIO's during the POWER ON sequence, two new API's are
introduced: tc9563_ep_pwr_en() and tc9563_ep_assert_deassert_reset().

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 152 ++++++++++++++++++++++++++-----
 1 file changed, 129 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 1555e8a9b3ca..de68b9836645 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -62,6 +62,8 @@
 
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
+#define TC9563_GPIO_NONE		(-1)
+
 /*
  * From TC9563 PORSYS rev 0.2, figure 1.1 POR boot sequence
  * wait for 10ms for the internal osc frequency to stabilize.
@@ -91,6 +93,10 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+
+	int ep_reset_gpio;
+	int ep_pwr_en_gpio;
+
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -256,6 +262,89 @@ static int tc9563_pwrctrl_disable_port(struct tc9563_pwrctrl *tc9563,
 					     ARRAY_SIZE(common_pwroff_seq));
 }
 
+static int tc9563_pwrctrl_ep_pwr_en(struct tc9563_pwrctrl *tc9563,
+				    enum tc9563_pwrctrl_ports port,
+				    bool enable, int ep_pwr_en_gpio)
+{
+	u32 ep_pwr_en_gpio_mask, val;
+	int ret;
+
+	if (ep_pwr_en_gpio == TC9563_GPIO_NONE)
+		return 0;
+
+	ep_pwr_en_gpio_mask = BIT(ep_pwr_en_gpio);
+
+	/* Set TC9563 GPIO as output */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_GPIO_CONFIG,
+				      &val);
+	if (ret)
+		return ret;
+
+	val &= ~ep_pwr_en_gpio_mask;
+
+	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_GPIO_CONFIG,
+				       val);
+	if (ret)
+		return ret;
+
+	/* Toggle 0->1 to enable power */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_RESET_GPIO,
+				      &val);
+	if (ret)
+		return ret;
+
+	val = enable ? (val | ep_pwr_en_gpio_mask) : (val & ~ep_pwr_en_gpio_mask);
+
+	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
+
+}
+
+static int tc9563_pwrctrl_ep_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
+						   enum tc9563_pwrctrl_ports port,
+						   bool deassert, int ep_reset_gpio)
+{
+	u32 ep_reset_gpio_mask, val;
+	int ret;
+
+	if (ep_reset_gpio == TC9563_GPIO_NONE) {
+		switch (port) {
+		case TC9563_DSP1:
+			ep_reset_gpio = 0x2;
+			break;
+		case TC9563_DSP2:
+			ep_reset_gpio = 0x3;
+			break;
+		default:
+			return 0;
+		}
+	}
+
+	ep_reset_gpio_mask = BIT(ep_reset_gpio);
+
+	/* Set TC9563 GPIO as output */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_GPIO_CONFIG,
+				      &val);
+	if (ret)
+		return ret;
+
+	val &= ~ep_reset_gpio_mask;
+
+	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_GPIO_CONFIG,
+				       val);
+	if (ret)
+		return ret;
+
+	/* Assert-deassert endpoint reset */
+	ret = tc9563_pwrctrl_i2c_read(tc9563->client, TC9563_RESET_GPIO,
+				      &val);
+	if (ret)
+		return ret;
+
+	val = deassert ? (val | ep_reset_gpio_mask) : (val & ~ep_reset_gpio_mask);
+
+	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
+}
+
 static int tc9563_pwrctrl_set_l0s_l1_entry_delay(struct tc9563_pwrctrl *tc9563,
 						 enum tc9563_pwrctrl_ports port,
 						 bool is_l1, u32 ns)
@@ -400,28 +489,17 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
 					     ARRAY_SIZE(nfts_seq));
 }
 
-static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
-						bool deassert)
-{
-	int ret, val;
-
-	ret = tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_GPIO_CONFIG,
-				       TC9563_GPIO_MASK);
-	if (ret)
-		return ret;
-
-	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
-
-	return tc9563_pwrctrl_i2c_write(tc9563->client, TC9563_RESET_GPIO, val);
-}
-
 static int tc9563_pwrctrl_parse_device_dt(struct tc9563_pwrctrl *tc9563,
 					  struct device_node *node,
 					  enum tc9563_pwrctrl_ports port)
 {
 	struct tc9563_pwrctrl_cfg *cfg = &tc9563->cfg[port];
+	struct of_phandle_args args;
 	int ret;
 
+	cfg->ep_reset_gpio = TC9563_GPIO_NONE;
+	cfg->ep_pwr_en_gpio = TC9563_GPIO_NONE;
+
 	/* Disable port if the status of the port is disabled. */
 	if (!of_device_is_available(node)) {
 		cfg->disable_port = true;
@@ -436,6 +514,18 @@ static int tc9563_pwrctrl_parse_device_dt(struct tc9563_pwrctrl *tc9563,
 	if (ret && ret != -EINVAL)
 		return ret;
 
+	ret = of_parse_phandle_with_fixed_args(node, "ep-pwr-en-gpios", 2, 0, &args);
+	if (ret && ret != -ENOENT)
+		return ret;
+	else if (!ret)
+		cfg->ep_pwr_en_gpio = args.args[0];
+
+	ret = of_parse_phandle_with_fixed_args(node, "reset-gpios", 2, 0, &args);
+	if (ret && ret != -ENOENT)
+		return ret;
+	else if (!ret)
+		cfg->ep_reset_gpio = args.args[0];
+
 	ret = of_property_read_u32(node, "toshiba,tx-amplitude-microvolt", &cfg->tx_amp);
 	if (ret && ret != -EINVAL)
 		return ret;
@@ -478,18 +568,28 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 
 	fsleep(TC9563_OSC_STAB_DELAY_US);
 
-	ret = tc9563_pwrctrl_assert_deassert_reset(tc9563, false);
-	if (ret)
-		goto power_off;
-
 	for (i = 0; i < TC9563_MAX; i++) {
 		cfg = &tc9563->cfg[i];
+
 		ret = tc9563_pwrctrl_disable_port(tc9563, i);
 		if (ret) {
 			dev_err(dev, "Disabling port failed\n");
 			goto power_off;
 		}
 
+		ret = tc9563_pwrctrl_ep_assert_deassert_reset(tc9563, i, false,
+							      cfg->ep_reset_gpio);
+		if (ret) {
+			dev_err(dev, "Assert EP reset failed\n");
+			goto power_off;
+		}
+
+		ret = tc9563_pwrctrl_ep_pwr_en(tc9563, i, true, cfg->ep_pwr_en_gpio);
+		if (ret) {
+			dev_err(dev, "Enabling EP Power failed\n");
+			goto power_off;
+		}
+
 		ret = tc9563_pwrctrl_set_l0s_l1_entry_delay(tc9563, i, false, cfg->l0s_delay);
 		if (ret) {
 			dev_err(dev, "Setting L0s entry delay failed\n");
@@ -519,11 +619,17 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 			dev_err(dev, "Disabling DFE failed\n");
 			goto power_off;
 		}
+
+		ret = tc9563_pwrctrl_ep_assert_deassert_reset(tc9563, i, true,
+							      cfg->ep_reset_gpio);
+		if (ret) {
+			dev_err(dev, "De-assert EP reset failed\n");
+			goto power_off;
+		}
+
 	}
 
-	ret = tc9563_pwrctrl_assert_deassert_reset(tc9563, true);
-	if (!ret)
-		return 0;
+	return 0;
 
 power_off:
 	tc9563_pwrctrl_power_off(&tc9563->pwrctrl);
@@ -601,7 +707,7 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
 				port++;
 				ret = tc9563_pwrctrl_parse_device_dt(tc9563,
 								child1, port);
-				if (ret)
+				if (port + 1 >= TC9563_MAX || ret)
 					break;
 			}
 		}

-- 
2.43.0


