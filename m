Return-Path: <linux-arm-msm+bounces-116839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GYKlEhWqS2qzYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:13:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F355C7111A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:13:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JFClRWJO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fj4seuqC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116839-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116839-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 817C93024EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DF942088E;
	Mon,  6 Jul 2026 13:11:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F983DDB12
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:11:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343519; cv=none; b=jDeRCWPhRWeh3Q8bFcWWMCGq5rnVXFKxJvm0PkPDnAhMEPhVFg1Dsc6rpOzt4o1PveziQ0JqUU4VB5NYdrOUxBvFsULvn58E6hHFRgOJAq9x/6GIY8UreIWmewLXkgrEisoQhGPAlN1NDZjc646wDktX8OQ1KTLsItbMzMC1vi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343519; c=relaxed/simple;
	bh=HEn5owEzeJIUYkdvn4DQSoUKQdn9M8eLHqPgfVbyGMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SX9L2BVs6deSjvuRtSDCJzvS6lOluIHK2nch6ooxmDuUG4cOPrkeB+LRtJVPCkJjbQaF8LYijiAeFbUYeBRJ/IHVhnmzuE1BhrlimBi3uzzAQ1vIyHeBYAZTEfa2/Ys8QU2o125O9k2m5e7npDF7ZiMOMEDY6ydWBNty51+BNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFClRWJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fj4seuqC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxCxe238124
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yNrkEZw0kMBOjM8rF7wKaiZMIgE91+zaRIL+Y+aqlVA=; b=JFClRWJO/YlvKXxt
	EPTan7Bb2wCcvP3ljtvtZjzTtxn9X/oJo2TEJ/HAmb+pQSKwSEV/Z0gNUsAg+HGp
	w6HgyrZUxnRD3q+7IWfDH5X62RGexHSNLTGzOUeq2dL2LoPSNk6QlXIjpQSF+Md5
	flrFBt6s2fKpQdszOkYGsCYuJQ5ovRF9aZdMY9Ly4KS9iJsfekBq0woUOh8k3cMV
	/RkmkqR4WcSAqZVtsYNjEqAk0a4iS4q0boV4t8SF1Q5kKlnTaNhLXh+6stEhQhqA
	eEHt6s2fdNhYEpAikHChcGddJF0Bgf8WoJVvm1/XIKUhDGVcw0Vt2kksgIYSgQFG
	fOJZIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8903n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:45:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so311803085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341948; x=1783946748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNrkEZw0kMBOjM8rF7wKaiZMIgE91+zaRIL+Y+aqlVA=;
        b=fj4seuqC9Whszr1a1fXgwkaNf9JdZF2tvZeiOfWvS4JnE/t4kqtMo83ifD/kH01yqT
         x9QozejAvHigxSv0mqW/pChAg4m02encxUg68gci4k2yQ0SWkg8PS3a4dqXxRFurCqEK
         tXNgNjBKPIL+v0vjSB+LuCH+FW91USe43RpoeLahAOz9pHTb2s9zGMu6HjOHVKxhqlbd
         CPNN0vSO3y9qThtDDLAefAV7mUky0hVNQmmfSVR27eUVuyI0uPHCzNIkrQZxiDI0Htde
         +wPZrfH+r3e5mW+koN3F8NfYDB3rH9UZZgF7hHgr9PwzOVocIf9TCQikfc0nM/onCEeU
         G8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341948; x=1783946748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yNrkEZw0kMBOjM8rF7wKaiZMIgE91+zaRIL+Y+aqlVA=;
        b=fCgkY+lh4pkAdF2AJ2FrfnzE4xFAnnLqpyd6vSv8zJE/sJXN7hJ4HCCoWG0S6IH8Zn
         H8HXbT0G0oo3hEX2QGe/K8VTpQDu1jpwvv2QSl/kzqqTRE2g69xE+9+Rs7LRovhh8VPQ
         gUD+sNu4+EJ/5hyMTn/1miFHTY3ysJ1Kk3MBvhIfrcoPcy3/cUlAU52ubFD5sJvxwY+c
         gRaHJd5CjfMmwUViFP6lzyxDyg6IJ5T1o/v+KF79YIRyUwwOyMLAOEeaEBQYKacvTDvB
         ZFhYM0BHYdmYnnGPhONz4JhZcZaMQomYlwu3vldhTsiyRzI+q6d8idB9b2lO7TlQBzBA
         CudA==
X-Forwarded-Encrypted: i=1; AHgh+RpQuQm1LkFfOtRSpLVRm4XhmNUE9WFhfHRNdiTggZi6IBbxWz/iaaL0ufVbD4t77LPQ8PfnGdvSPH9pXEo8@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbhn4xQEd6sy2EsrUEFLJu8mjEKbs/fn9Yj5aqJZnnE5pNfrp
	6DVwcfVE2aFORERvq7EeD4TDCn9AUqo/mp7Riy/LyUBZyxTnKaJCmDJ0lhn5UiF97kXhthjvzGw
	AAFQghw5lngI9xajz//UJg306t6OtRfFu937mBMTjf6ZAFmXIMYkZUqfPamNn3EjyJ2K+
X-Gm-Gg: AfdE7cl3+ichqBRSXtxs44c2FEB2ve3Rnlx/SDKHytI1degv5Gns8OCT97hVcc3XuCK
	aGElujw01358NT4tl1cYkweUdr4FBJ3xtvtx62vb3niibYFLgU6gkteK6CPtcNcQ54bekfla1mh
	Luu5j7r7ZbCHidXP/qXGh+S8+a4mjfGMCxLXApCPlRqJnx1KB3kBC92b4hMMA8IhcF7QG5lYnpI
	WHohiFb8mU1QkOk+v5JmPHJeQ9QV2RfS5Pa/Gt0fqEWIXd3K8MjvzgtAoPPYtJGvXSvNdKRsx5W
	6WMVwBv+9wymJUvMamLkURKqKhlSMPngUvGg61hVhj5IJBaQtnU5UbGYe3vLCl49jhmK0NP1Q68
	urGltuKvXKsdnamq+nnVrsONoI6uJdslA9zfVqSGJ
X-Received: by 2002:a05:620a:4554:b0:92a:f74f:904 with SMTP id af79cd13be357-92e8b25f4aemr1773305985a.1.1783341947861;
        Mon, 06 Jul 2026 05:45:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:92a:f74f:904 with SMTP id af79cd13be357-92e8b25f4aemr1773301685a.1.1783341947497;
        Mon, 06 Jul 2026 05:45:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:31 +0200
Subject: [PATCH v3 19/20] reset: rzg2l: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-19-1ff028e33779@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HEn5owEzeJIUYkdvn4DQSoUKQdn9M8eLHqPgfVbyGMo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M9kHSk63/qP+xgNz2Y9PQyDSmFph3tQ8AC4
 5AtD4YK+kuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPQAKCRAFnS7L/zaE
 w8S6D/wMyo30+5v8CLZilNJ79Z7wMDPBUG9sj14/UZP5eZoRp91qLsVzwolPCsq5U/qTKR3y/WF
 pZFakCrbpsJGqVqsKttIhxt2XpF4S1KfN1qC8pASBve+FNz8ZyKWhKOa9yoA01qpm32vrU5UPS/
 6u2lJxL4o4/rLQx8CT4xqgdtrSqHYMAonkNf5DACLGhTdz4ZNLZuCIo8GsF2zwWIH+cAxzjYd3E
 qqZHOI8wr8R2KnXC7H+MD0fJGcu5uQ+1j45nmYvg5cX3ElUN9riw6pLBLgO57aJVoCo/ucH6xOK
 GI4rJ/08Hr3PNBYdbcQEJMNE9yYMkjxiudHvOq8R4g0BwEVtdO1A8jbTcho0IUz53pA59iFnjyM
 ttMlMjXQhKSGu1dFNK6/elGJLMXC6E4nbUKvbby/LEHyHwLU0algPpHe9UPUYh3l/DrQAUt0udl
 +zNN2SMUOdAze/pIW2+l5sftft9+laItqGcD5M5bJTp7tPjVFcDskDf/PioUl0vtokzCPuP1F3s
 zP1G38H9ILdgjRhYpMdqqolRWhSDfehH//GwZSZfc6zSynuMNLzcAlJbgXUXpTthmlBlksAjYqr
 pTM9O9ZbxdBxzavLzPTTt8/695EpXxnwsMZ87oi6uApZGTqb0upieRcXVikiyju4bpSHudD6VYO
 /G0MaTqKJntCfNg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX1nIsnCA1txU6
 kOREbG6aUFySzPJ8dR1+VJpIGpZXPcIgU0e7fpeYtq6qJA1BZ4HyL0/6sEUXUt6e1EYmWx1QSA3
 8mhDSbyK691GaMt0C1otF9PtKk6sskM=
X-Proofpoint-GUID: rmX4aKl3D5yTlKHbKHdTK61Fiws0HO-T
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4ba37c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rmX4aKl3D5yTlKHbKHdTK61Fiws0HO-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/ajARVQiiPsD
 Q1mfdM/mKkE8xafHeH6bxY9oeasyX3xS5/OpvobsZkYYv0IIn8dqPtj7Qti/rAeGGKKcFarMLu/
 jrffV2GvPEULdeeoR+HJ0Fm5kO+Bop3jy53fpl+cL0kIpE+tNvanFSzQ/B2xD0zBLdSWrxjBsXK
 QU3A6EXczCxUGrU31cNBd5SyAbkl9FrSDiG5fid3s/cYbyecCntoP3zLRwbUCpblX6/u5n9JzZA
 vSOOEITk0a2beP7hBNLuIH7GFyJe05PF6qEhVhUc/An14H4AZkPQJo+2HOz+u0oAFs/Gp8zBEbP
 gecFfOxQiWQl+JyApjr9RrFZwXDbcliqiGtmc4bbp+EXuPXjNlrzST03qTvvXdvRKigwX+aYGxj
 ZXWe3IWLt9ysm9h1BR/FUNK/42aNpd1P+71TxNphW+gGmt2kuZ3TyXSZ/sV9OwR1U/mPllgXJ3A
 /2Lpjmyjy9WGPRlP20w==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116839-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,pengutronix.de:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F355C7111A5

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3bfde7b7e3f6db287ec8c5c45a20ab..f003b360629c90bb37ed0ade7a675b5b0f28fa7e 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -249,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	vdev->dev.parent = dev;
 	priv->vdev = vdev;
 
-	device_set_of_node_from_dev(&vdev->dev, dev);
+	platform_device_set_of_node_from_dev(vdev, dev);
 	error = platform_device_add(vdev);
 	if (error)
 		goto err_device_put;

-- 
2.47.3


