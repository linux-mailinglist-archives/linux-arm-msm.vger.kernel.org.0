Return-Path: <linux-arm-msm+bounces-116811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hQwNCi2mS2pHXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:57:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE0710E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:57:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pdv8xzeb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YnLo70Kx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116811-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116811-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D9C735D42E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3376F435A91;
	Mon,  6 Jul 2026 12:45:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49B44D035
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:45:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341916; cv=none; b=W4vY3njXidyijlksZOthUzSY4s00EYnQJrwyQccEpCgEZJyyEKRVBG0lueIjm3SjEvRrTNFbCTUQOao3x/Euzsxpx/3S2V7FH6p/HM2WpdBlllt7SGTmMg/qGajcj0+xUKyolzSfAi8kx83f9LrS/TR8s/87+POEAKV/LY8+mLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341916; c=relaxed/simple;
	bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czmHKViAspHrtT27er+HA/Fwo8GZD+M3j33k85wfC5LNRA9cxGMh9Pzd7TrEDsqtYeYasgqR79JIclhWnggU70jQ7xtC+TXSQvttrTfL4tEmWHlchV7EHvHH2wEvdpewK4OQE+wueG1z4UoNVzEJQFkCx3SROo7RSD3w7rOFV4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdv8xzeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnLo70Kx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLfn402098
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=; b=pdv8xzeblN7EO7HG
	FH5xzwmFSqOU2Hgogzz26thWi65+vWdeyuOWD7eOyLyNa29P0b+SaswNqF9kS4FC
	KA1OVnpMYTn/40Nz2pxTYv4trMR0LigFtFqWn5NPzbosdepwcoCO7dLbSdFCU11+
	625Rv+YZ9WtsBt6QnCuBYwmabFKfoYm1Etyt6EIi5GTkcT84WTKLii+0R8U05BkP
	QzADCpTzhPgK8NnvXRccEl/Ux/Y7UZb18sHQKEENYHn17Kvs9gUu8wgAYrYfwdim
	kihEO6nIPf5AxXiTwzdTR5gncp7wXW5IQPREllLfupSbD+sMCFkBnKT21iqYXfA0
	EiG0KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grm0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:45:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso543675085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341906; x=1783946706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=YnLo70KxQ2UYFYxLETNyIFoK895PKLzAd1NFVmtVuG12X/1y3I5x0azE0iM28djmQJ
         bn7bAjuIymq68HSicdGF0lToyVhuWYhK+EhyS0M2nS1z4wPahYimpjV/HtNSKtAqAEnY
         LhA2eGFcykCHOZzii8XF4OWuqhNqiBPzbndJr4uJXPnVEu7PUG0+JXurmNdD4EsVxghl
         jp7Ud0QxMYtBY42gKU54kSF1rE/p7MX95hrVhSeMDf8iv8ridDFKe/aBnFY17lq1U043
         8gvPsuMF9IGsvPLpIUNhTSjO+qf4QJT9wCGo4+SqBWDVZvT9KzWwQbmeFwwMCuzlL9Tt
         8gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341906; x=1783946706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=bk+xeJOgyYhD0rd2u+frjLtBu5eizzRs58nAhrnHkFKrWIJdPVQHoUfQc9tML9dIEM
         qEkjCcQZ7t2iu/TltZATY1m8PnSBTz8ocbZ/uvNi9e1iWHoPNIB2cB5+8QTFKZRUhkZF
         3WJ75SivQCLIB1O6USYqe4Rsa5uY93CqmikUe2y6K6PboATReavOFgnT3JW32tr+2tRT
         FQkCcFHsH5hquna0CZumDc/2Jm0Ok1P5VZVv8gnKOiwwZHDaNSnrtSAk3ddjRCANUqsZ
         gml0GzEJJbBJY3SsytgYwffMGWd4mepYGT5FY3Yip5bf+w82Adod3PH1HI20iGzOSuNq
         o4Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoQYRqaIb9WAsx/Y8woEddRXejKPGNa1Too8kxkMygE20iDU2QLq0AshEwB7JzbeDAZczvSevEJkqS6y8tv@vger.kernel.org
X-Gm-Message-State: AOJu0YzzXW/o90SSlUmvN2H2nha2Cu+am0G5JEPQHXJ3skJSAqAXppe5
	DQkjOyWzb4+EU9986Mo8vQ7LcGS5NRbnudbvI8H2RPYbX5u7corRwtt3lziCttu84+K4BuiSaP0
	yeFS6nseGTWDN7BwS5l8lMRWsXz1BQKwPTrCLJES54k/O0foVsSrWUVD+kxml+UVqvq6I
X-Gm-Gg: AfdE7cnOClJpFyO89ZZ5CDSGVI2Vo/CBid65mfi+wnn6By1ZAscygNAnI8xVhyPlrw1
	D1ai3uDfRq6ucAjmFjrcs2ejwFHfIFNePtwawYPkK1mCnnB84ITAEl7wZKQ3/gHgCq493FEy8Ho
	AWKlS4I1LCGiiv4vH5BPVN/Bgw5gFTR3ZfO110iTaim6JchEzk7YmAr3iWQJAvs5/jEmfPVkCmd
	O7C/I+pO7jvBeYNNWsH+yzt6szDPYtUiQz9uOO7itV9MFczPSu8YAz9Ks6WDsdvhw8elqeBnuvl
	XpRLq1EhonoaB1uhiKojziCHSSao8TLxmKIry9A/KKKjZXtlJjT+xJ1/BLu6ozTI/99dQu3GG+I
	dv0nHPJ4a1t/T3Nf2z9X7wtljYKLfdrKiy03w/qfp
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45838485a.55.1783341905924;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45828885a.55.1783341905233;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:17 +0200
Subject: [PATCH v3 05/20] driver core: update kerneldoc for
 platform_device_alloc()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-5-1ff028e33779@oss.qualcomm.com>
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
        Manuel Ebner <manuelebner@mailbox.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6Mye7m4WIbR8PkDTH2c4X+IwaDKU66SIcDpL
 mQAGRuCAsaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMgAKCRAFnS7L/zaE
 w4ZfEAC41Mo4fJZG469yMU0Of0D0DGwRVaKN4uoZLlhdTRAcVxaepoBujUjtupSZqXiayqNHV5U
 gi5UTfW3wn++NDJyYjf09qZKyCOyEnE/UmdnwGURK5nJ+PshyBSYME0avY5FZHKVYTCIXlPzGqF
 UHC6t7eVnwL46lXo0kHJ7EsWs4t3tAPczpks24WUn0sdkVu3uPWOSTcCd94HIBE4WBs5ytMBh/+
 /FrSJqgIth1+QT2DtNBUdqqbCdI8jabVZp3kRhU2DP/pDsdKfBtljH8QRtloSKXSAddgv+vDvmZ
 5KdXc433Hkh/oTWAw8jbFbKHe67pgQKXGKko6LXTH77itBDpywUUWcIk/qEbCKQgqCku3xTgHZP
 H+H4trXem4YILFtiNbwsiQFtaD9iv124/YqQzguOiNSJYYbneWqaJUXkLzRdiHcklMRySNnUQ1Z
 zzlY+2vbp7eQSY7hvbHjthXmH7V3pryL4Y7yDI+OaiYJcYu8ca/YbMP5Lq2mqASntQtP0qTkBwv
 WlH7HQjT0H2v8cocaoPHpRRmZ6FmkINXxIXvK+awAkiCuscSrZeN9lSC36RmTZANo+qHicYPUm3
 0ymNHLd9ZEW7+c55YFCw8msnV5MMfdIaQF6xsNtguNg6ayHTyrtqvt38bkFvNglpZCmrVFxNFQ6
 Ysws8qDm8bTfJYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qDNxIit0XmGrA3a2_LLZ0_iI8gFlyjO8
X-Proofpoint-ORIG-GUID: qDNxIit0XmGrA3a2_LLZ0_iI8gFlyjO8
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba353 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=b3CbU_ItAAAA:8
 a=EUspDBNiAAAA:8 a=1vxtNpAeqxpoFZHZEuYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXzEy1iB+kwGAd
 5339QWjj22FttHOJWG3P+7l2W/2zjTtMFULEvl7F/0f5zTeGVTbIrZTh/aJKXI0qLJQXZW/Cuu+
 uirS3hu3XwMtQmkD8UU7zVAwZKStxp2NHSyrweqtpUxKvHuyCwxv4I4mIyA8pJECfRJJxA9MMC5
 4BPA0EIIBMAU/qbJ1CyhILzQ8XKEFYYgtPI3Wp7oNOArZU/FqXdEbPh/lRFQLByLcI72WA3S+D1
 hvkYhzRzOPZtsvd75Bx8GRrbB14TmcL/ZY4pfwJUo50e2WUTAJ4GSB882hgT7uHBN2b0UHrhINY
 bFxIA3zEGuBisLDufg0ypUZrmHvwMEVleq+bsZkI9YfEWVTUpN/SyowR5YanOZvHYvYynxNEjDC
 rkW7Zeu8C+/CcwDVDIIKhC2Ca90vJI/uRKhJtgKIyYVHRkEXHLL1/+9kI2DZJPZskT6Co/TSTb0
 sHhhBbnOnknswVPl7uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX7EVk6GYVvZZh
 4iqymfJH/Lz+RKuNlFaqupcECTuYi5/FuNWbcOPmTyTCJXd638EMDiUQILTXMvfMq6DO2/SZ+Nk
 mW8+tT7p7JCRgOAWufy/7GIPYtC/Lbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129
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
	TAGGED_FROM(0.00)[bounces-116811-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:manuelebner@mailbox.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mailbox.org:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 69AE0710E05

Users of platform_device_alloc() + platform_device_add() must not modify
certain fields of the dynamically created platform device object. Update
the kernel doc to say which fields are affected and which functions to
use.

Suggested-by: Manuel Ebner <manuelebner@mailbox.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f24a5f406746b53ca9eaab9472f6dd1345e04ad6..9357942d0c79b032645035879b2bed3d53305b9f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -619,6 +619,13 @@ static void platform_device_release_full(struct device *dev)
  *
  * Create a platform device object which can have other objects attached
  * to it, and which will have attached objects freed when it is released.
+ *
+ * The following fields of the dynamically allocated platform device must not
+ * be modified manually: resource, num_resources, dev.platform_data,
+ * dev.of_node and dev.fwnode. Users wishing to do the split platform device
+ * registration with platform_device_alloc() + platform_device_add() are
+ * required to use dedicated helpers for adding resources, platform data or
+ * assigning firmware nodes.
  */
 struct platform_device *platform_device_alloc(const char *name, int id)
 {

-- 
2.47.3


