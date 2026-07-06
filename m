Return-Path: <linux-arm-msm+bounces-116807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZpKGAq6S2oXZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:22:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF38711E49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:22:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dx4jTolU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kvYDjmJj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116807-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116807-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C03335028F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF73A43F4D5;
	Mon,  6 Jul 2026 12:45:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C5743C7AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:44:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341900; cv=none; b=tFCHVecsS7g7x2wz5THqJj16y7Rd3lWd8sTcQKcotWzpmgQ0KOU0JNduILGZLpT0hN+GWhp/c0URUOnKfQ4+MnOILzO23PhiQArF7Tq4U5GpEDXLJtrVcQdKJdEh6JRX6HUgHEa2VV/hoAdWnxA8nF9TWaeuxghdLmfJPniIIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341900; c=relaxed/simple;
	bh=aDGbbnz+wzV3twb5feb+QvbOP0I73Nzbv6atplL3wzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gixGy9VJYRC+W4LvfxE6FLmKboHtDRuDqve5OheN7SgSu1uqtpaDS6ep6TCARThpDxbyESlv/pTCVp8DWhz1kKPJoaqizuYeXYFZRkeopG8HILrxnFtNo3H9l3B4KLXyH4s+NpFBqnM3Cwzjg29T+A7oA98eCnDk4cf460pf0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dx4jTolU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvYDjmJj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxCB0238115
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAsGd5ApODao7ya5c+v4THHQP6gUJNMav6AFOuVH/oU=; b=dx4jTolUOG0UpNFm
	MhBn5F9xncEGRrD1T/WbYOIOs3i3znC4K9HgDJ61gDB6xdRp65m00l5wnZldKlsq
	UGKJyHYuRgj2rx1yWFj98+JVTvIWD8D1tW2a7NNrmZD+Omhoi2ZzFx+iTqY3BhlR
	bQmeEoKzIflfUDGPi2qT41yIeKOQOyGQ69C+JZVj7HLmBDYemJKOwPFP4nMySxMW
	pNU+tFMx9q2xdwoKZI//juImwOVohKqTD7WpP3Iz5UKAc32CYWiU4tF5Z6Zs3Ifh
	Us2AaUOVjlI4TsxDMCWcZKl7cPWFLrvNrmcTpAowAidmXbdRF8YY19EhLdn7H4iX
	z+F4rA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88yvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:44:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so34404546d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341894; x=1783946694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAsGd5ApODao7ya5c+v4THHQP6gUJNMav6AFOuVH/oU=;
        b=kvYDjmJjaxgDJXkwx3qIUtuUa9aXBkG6JTXP+e7bKqXYe9hkbB5iM1cD3+pT7dm5p9
         hMC7AMc6w/aOs4n3vzMcccnOZElVSISAB28/FrmypPopDEmLZfkVBiWkFXfFS6vGjQ4p
         b7gPQ48UrXiySJrStfr7wLyuva4ggVpXLAvhKJLehbW/WNFGbHtHnYp55UArQrjdeFQX
         DMgDHR3ze8Hcq6aFq3aiXqr4IGOfCQlVZN5HGJjmGE14X/24ieU2nuTlYZcIpUiwhZZX
         mIk3D7t0BG3+g69xtKrGV6bwuR3zkdKrjIgcMybnJ9ePJJzDampu6VvaE0Kw+bWhOHo6
         791w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341894; x=1783946694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAsGd5ApODao7ya5c+v4THHQP6gUJNMav6AFOuVH/oU=;
        b=WdmkEtJ+cVVAV05h5F0Zm6NaaFkMd8S08Io75LszwHK4WZrNhAapjNsIQt0dXquF0/
         Jpw5tdqnZxGiqpeszGIn4L9Y2EMjEnAOV96XmmIHSGhTFukuBQ2o3JFmCSGjKD7xEpZC
         JXYeVsvvebe+ozINkOW/aJ+17Ykig3ekhEqS0UMeL7ChDxQxiVqA5GpUGcDR1PoGDIxs
         LSKlGpP9UN9fCt5JqF3ow/UzGwtGLDoN6tMOxSg+05fcy2I/zrEQYVqhffYn6zXBilI9
         P3P0m9bwRLIArK4mRzMB4ApJSQlqRraIrMQmOAvKkOmQP5ga1y3Ho9oqe83q1TX+ydQ6
         wHSw==
X-Forwarded-Encrypted: i=1; AHgh+RofRHtYr5Wxl/UPMn8x8W1rov+0rkqZz5rpMlJUJMm3+IgGnCttWnlVszDupKg4DnmcoHTwKVZFmuUtckmi@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8CiHpT68nhjwam+YUco7yj/iGJiaPfB8hks2gFtrkeVK084o
	LOOsYBRu6Cd4t6114Q5PcOaoGo75ikwYtn/JMv6PMJgLobnLypRibjZMfzTFGvwj+aT+ZpZNGqP
	f4KT37W7SKnLbmztZli2dCDi6HPpRn8VUErEz8JIiYnfDwUUlAwS+s1tZmb4/Udvkj5Cr
X-Gm-Gg: AfdE7cl3//TAQY7qELQxM50G1aiklLLeavU/6FKr0++o5n08LzpS76UNj4z8OiVr1kn
	xgpxHX4x0cbm4n3niQI4TWD3o8VKEv/i3r03lH75N1mxgYY8JlYbVxqG24jI/f0wCQiDaNB4uhS
	vElo8s2cFdjrTOWsUJNmJD68jKQ4qy0Rt0XVnG+TOMNjmbTMJcAmKKdWiW/JNvpe30dZFT62uUi
	nuZ5hqVawKwmjIhj9MAgQZQgw5BRzcew3l9qdv1R8/258wzG1A2MrcQvG5Io8gwv77WYxA5vkSJ
	oEjMoGgNcZKXNV3K24zYLgbqcICy0eI+qDjDCxahOLpb5hCFL9qiZ4xDftBXGvtoQNu3YyZ4h3v
	8ZLgt6G79KKvnAq7pC7QVTJw8f6HSEkG5dloym44w
X-Received: by 2002:a05:620a:2b90:b0:92b:67e6:8ab5 with SMTP id af79cd13be357-92ebb5a355cmr48462985a.63.1783341893723;
        Mon, 06 Jul 2026 05:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2b90:b0:92b:67e6:8ab5 with SMTP id af79cd13be357-92ebb5a355cmr48456285a.63.1783341892757;
        Mon, 06 Jul 2026 05:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:44:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:13 +0200
Subject: [PATCH v3 01/20] powerpc/powermac: fix OF node refcount
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-1-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aDGbbnz+wzV3twb5feb+QvbOP0I73Nzbv6atplL3wzc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MtHvr7AjECn8mAtK9ST5QYxQLH8uISzpy7v
 3pFnQl8r+GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujLQAKCRAFnS7L/zaE
 ww39EACYQC5v8jyh4RLJSmX9+Q2699EIwQw+LmnX2JTHZ37xaKZXSio5WtzBHutNcZGaaogpFoW
 WKEriZZ/dcQFmhZ/Q14nI9ShukRdTjBSVb6URMZkC1nyYuTj0FK0Sz2ESh9uqDHtN1HEUUv43ap
 cFmOY2eE+QXR8J6C5ZBAhBLzsJ9Ho77iM0WbapO+IFoLyWbJF/U41qJeW3ZaDdaFuDjoJdCbnNX
 gMHxWiSQ2aBucXdIz6hl4TU2MG7RWtc9WdKn3gzGFtuJESiaQzDHNAWeBjPRgvXNbcClk4qW2Rs
 FeY8+K5ONOw43nUF4+Tafg7FLvTlNoIHcbDtV7PSYq3pCNj+Z+hruIi8sXud/6W9vYKvPexKYG9
 5kWYO1Gd0GLkI5D4vudHVM74Gzan4Z0qMnQqPsUY3w57ZVVptL+DJDoOPoFTu9yy3tngTcrLrPK
 ZYgBxuAbV9NLePon1E9TCA8u0rQNn5//N6zpmGXBMEBeOBAU5yqkaPPANddk1al+fGPFzWtNGyk
 OP8WpDK8KBzFhXFC+cIDyJWlPptoS7D9Tcv3k6AoN1yq3qRx8ZSAQ6elAkAJ7Oed1RGDyMUTECX
 3wb+Lar7gwItQ0ahNLdLu95tpxenqJRi+oF6ATIp1WJ3NzZhbRCqA4YKV7ztDBsgCxH6Dpk8aa8
 Y07Wc/MmeOsDD3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX22cdhLS+Q1hG
 mUsvm9z+UFsUfLfnbcBhIEmJ4znxD9sfJ7BgHhSDvYsRKqfh/OAxsRX2gDUiHIAtBXg75yJEhaD
 MPVlbLOjFsJ2890NMWZtnEX7cVOOTdE=
X-Proofpoint-GUID: JMLT-9iHX2R0RK5KA34FIyGHOnEDddGG
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba346 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=lFaTzyIiLygvDfm8gxsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: JMLT-9iHX2R0RK5KA34FIyGHOnEDddGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXyh5nml8zWMBQ
 P2gffl779M0J2w1AC6J7xst3EbmN8jPhN6ATsGvUIKDDcfQV50WebrCsRssgneyJXfaX09yd55x
 RFZG4NPqo8asGyaV2pR9qHXceJUVwCrv57Q9r3Yf5eNvErYusOJxinTAIXRwwUJS5TQDGdMcOUT
 1wxDjk5ydgfKK/x3/NLhVfAqEYW80MW+Rr1Mf+YTn6dWgQQV6npvKp9GdMT6Tt55LKye1I3XHuS
 41SKHQfNc/RmnsRbO6Yr0/DdlDiDC1LvzFSj4oJiQqqGXKlS7joLJxWxLEykxLDWa3VvUHQlJrL
 XQJd+2BTvKvDeFCQL9eNy6yQkgjiirFNVh5/QYMp15gLIh5kJdY5MIzggUY9b+V1MVK/m68V7k1
 ftPusDDMauPgG5LG831UyQ45t5PLsF5TqIn8ffGtLgsr4o0PDjmLfDmepX3bOP7S6OmoPpC911P
 bXAcADh6KeGUwpCObAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116807-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADF38711E49

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 81e5d8646ff6 ("i2c/powermac: Register i2c devices from device-tree")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index da72a30ab8657e6dc7e6f3437af612155783d8f9..973f58771d9636605ed5d3e91b45008543b584d3 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = bus->busnode;
+		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3


