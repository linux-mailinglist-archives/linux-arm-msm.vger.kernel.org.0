Return-Path: <linux-arm-msm+bounces-116814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hdMnMI+uS2rMYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:33:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B14711509
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:33:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ebOZdHAw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="AzSZlM3/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116814-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116814-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D084311BA62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709CA430306;
	Mon,  6 Jul 2026 12:45:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB498430CE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:45:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341922; cv=none; b=NuULmHHWb+jxE4ntWK9APkgBuVNbqyBjk76unhE5Fqk4ODgx13FMl/sKtvd62BgDNsgCiw2f1RzH+66JCt/8JN3dDC76iQG1K37UJiqMvoiKYbfQOuEF4dZOq8VgzaTW3mkBChngPaBb1gnp8sMsQ2UhDzQrsAkeG3mQqFewa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341922; c=relaxed/simple;
	bh=zNlCSBzaa8h9eLrFPJ4Rsk88by0DY6qHl2V8PSoqi0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0CVrzfcyyHrF3OQITK1KdVtcFzhepazoYJEA2ySqVWvHiXpZJb5XD3XzhMl9p+Ud1JxTaQygRZ5J13yutNfXP3Ca1pSGKgyZtvem97ks3dfNr+qMdaq0MgZx7o3XSHqjUecxLMGR44u60ulNejqtiY1de1Ntx5x8VqYELpFKY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebOZdHAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzSZlM3/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxI46391309
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bXtMmPvMuVC61lphaB+WyfPoNQ88yrVKYbnm8jwg/Y=; b=ebOZdHAw+6pvz8U5
	guxfBlryTpeglXytQIMDf3qb70gs8OqD+lwFTn+TG66rcgy2RCviTEWtn/ydL5zH
	0LGJgBOBodFF1ycxr4uJ9xW/IQPIkl/yCJQb2iZGsHVpG8AmRZ81E+/eHhWqc1OV
	1HwR4fjhtQkotKRlcShLfUG9IqvbsF/ryqc1sesHzvoZx/JZL/x5Gn/9mRbf5+29
	hitgZGkTaIO/Fvo6JuKOHb89bpnOvrPgF9j7YL6C8VxFb9Id0iA9jcsSgdLMlxVo
	bcDiq1L7xnn3E/Z7cJ3JFI9rteqpICWlCsAbGItPxIo0ZrHZcqb3kqSxbDlCgqHf
	4ZP8xA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrrft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:45:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55f0613cso231567285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341915; x=1783946715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bXtMmPvMuVC61lphaB+WyfPoNQ88yrVKYbnm8jwg/Y=;
        b=AzSZlM3/RAZyFIztzMKyPLBOnhhiAazN9lpnEPhVgmYLhoXNVRVRhYvxa02IpO6+yx
         BXeeetBvCicjSt5AmsaLep0j+7cxPQlC2zSTxCrpF4e1e82AwPnhf953L7whmQF2V0DX
         LWie24XKilgN/ZEbfWXEtAHeTFQ5y5wKv+lOteQUlPpDzLNKlE8k1txYchGpz+EPj+/c
         NEV24WLZdyt/rg5V+ECFIszvlEh9cv9d38x8b5ge9zauLzrtDguYUTcHfbuduLaOVjdy
         dtdixGJzvG8oWSE/61BwyrrOT6BjAKCWEd8BD/84zSOMZkGw0u/fxM+lL9F/UUQTJVgL
         GDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341915; x=1783946715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bXtMmPvMuVC61lphaB+WyfPoNQ88yrVKYbnm8jwg/Y=;
        b=b0tGHMaZLS55juyAcf+PpzNRpN0YOdj6PjeOVyn2LJB1qysD328eRyuI9hbujxODNw
         CNaRP476nucKG1c3HRxPj2N1BFc0z41ruG7bSs+gnxMOVxUsWn5nw/ng5lVgA51l1c0I
         ex6Ir9BAkMue4lT3lkdbnXJleNpyfi3kTkr4LmKQMds6D8K4OKyPeejmU3aftIGUBEvS
         ue2UJG9jaq0mqdEmR9kyYIX3C6Xx/qRPpzcErTOEWZ9PCxXZbav+ij2C6XA9rLNuErYo
         g9XxpmkN2HSzZmUNq4olKkytMKfJdbtKGL9AtiVWcedYynJKul6xWJkjVz3P/pe6Ka4M
         xWeg==
X-Forwarded-Encrypted: i=1; AHgh+Rpt0ucJpBdeZ3fVeF233rC3A7urMg44BBUtCehLgM788j1CaZnVH2b3iRZuaN1LSZwlS9uEHXrCH7RR6H1k@vger.kernel.org
X-Gm-Message-State: AOJu0YyWgNGn/xq/E3V+pIqEKUceC0tpibBhc3ARSJq2X5GPZBCChDQu
	LMfisFfCe/LmgxAlUzX+5BI9qDpxV1dPIvrnw+jwDjcNXYRu3GKAZdCLXsQW2hOLAnvXSc5vk3Y
	dzV5agt1Fd7HDJ9EAW+lKzOlvx9LknTyBx08TwEBIflJmAmaSUSLowknPJyapz2dwSv2p
X-Gm-Gg: AfdE7ck4p2/4QHdNsfXTN2mvRXGe6Xw66Wv20RwG4AocOGM7VUSl6OOP8xq0GlLuPqO
	byzcR3pm+bzBroYIorg+FxiUwh/PxdcH6yKPZCv3JmsFRo8f+LuNNWWNy7Swn/vZcBtxLS23bsV
	bUh2gqI18guuvce5+xtbpmFFp7x5XtaiWuBNC2q4D29Z/CfRB4k/L+O43Twg4uTRhQKOFKGms6n
	mrx1lYvdjKocM92lxgJpNI1Gg9L3B4ORslvS3J9fGyEzrUy1zP7gwbljbTIARWJN/O87EFgRCqK
	pBVt0INBGwe/BsE7WWmSBgFs2vKlzGSQ8iJQBfRmUfCNWJIAjmZXh5HGMrd6mpR1M40+aDB232Z
	Z0J+f+YXSiGvOO15bD4AtXIgKOfVpavvSb8ynR/rk
X-Received: by 2002:a05:620a:2911:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92ebb49ac6fmr50866185a.13.1783341915034;
        Mon, 06 Jul 2026 05:45:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92ebb49ac6fmr50855685a.13.1783341914299;
        Mon, 06 Jul 2026 05:45:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:20 +0200
Subject: [PATCH v3 08/20] i2c: pxa-pci: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-8-1ff028e33779@oss.qualcomm.com>
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
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zNlCSBzaa8h9eLrFPJ4Rsk88by0DY6qHl2V8PSoqi0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M26fTgmFzEcwV6TgLmONhrXHSg1JSo5rARQ
 cIEm8brQ2iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNgAKCRAFnS7L/zaE
 w4FQD/4xlrZKVrDsxMxMDylskkXcnlp/TO8AFqhtcIAfJPLix//8WtkgYU8BoNMp1g9Xn0gqxcf
 Mqf4MoSZUM/9N4F6rrhsUS/fyZ8JjetftBgldbi42hSBBzlfigoXf7c7XsBd9RGYeEc6bF6Tvuk
 BeJBj7nTA7F/4P00u7JX8G1/EeAtOw+bRQp/bw49wlB2BMUcu7ymW7ZraPoAKhBLVQ3rfni2ggd
 v7fQ91AkgPqnXxlC03UumTZYRoodacvcu3K2/OHWjJ0tNZDijDmUhbLuEo5YxD2+r6fe9V7u6S0
 1AIHBEWJKLNycrCiocP2fSza0iVf1XHu6s3E0WBNJBpHEngK+P+XhEETCzEVV5hM/s+NO28XuUL
 BwdgBkheFv01xR0OIIv2htjsf/BOvFDkVUAE4mRwAAeBbUIlO3d1Gc/xIBw3P5sIyC/K1IP6Mpa
 29UAXyfBBm/QY0Eka/LOQnWf1rHBt/qWrcr+P5wHlLfPBPVvN7hFRXyJSSRrT3ZERQqDvupO8Qj
 ptCFfm9nvHLamnlGUxzUrLNpAP0Oxg4KP9I1Ee5OxwE6+tf7mtUlBPB89eKW+UNWpBN9GIYK0ZA
 yeTbyImJwaYxdcjvOhmsd7QN3u8NfTNp2Q6n3JTwHbo5apELLjJoObnNQc0x01jWKh0+xRyswe/
 xFrtfFeb09kS2tg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: SAHYHPuiJyb_LBKJUO3jiNSrpyGlqjb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX4jmfOkobQgNl
 0zpIrsbBdaa5gIh8s0i/OPHl63jZNhIY+askI9UfcOy1OVSXwBBBEn9q5+Ubt3Ddyhz5f9NIM41
 feHytsiIECJ/C5BawlwKpFiTKzgav4uM51D3x+zFRDnyYSPFhDRfQpj23Dj3Isc+cEXYuci7DBk
 G69ch9AdsFukUuc5GytA7BDM4mTpYTEbTsWzN1PHppcnkZt5jg9d8QxzjxdCW+irz0IdY50R5ET
 3vfmt4iUmUdnnmVSNXUl5DT+oEEBBHMRQIaQedi7XS1eFySeAtVLwXqqp4KUAb5x6zBXtug8CUB
 ttDQoz6zxcj3uAbA6DOMIGWz/lQaNxc42pr+2o9gCw/pKEBYZcPn402AnKz8+J4j5HzU2H6DidG
 Zt2GO0QXmS76K8xzeOVzb4aElSwoXcwRCYhw2elcN0D/unK9CPY8pTBh4fcKaP6T5GVLHtLcYhr
 2VHQxKAP5zALmsu+oDQ==
X-Proofpoint-ORIG-GUID: SAHYHPuiJyb_LBKJUO3jiNSrpyGlqjb5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX7DLu7hE8K231
 coiOQlTM9/gCAwlwQBX8bFComHT5B14IFswvH7voNcs96oBUn+rfWkUJF6pBS9as23r3UmK3iMt
 P4GSjEDMiEBg3nKUcNoxTs+iH3cVyb8=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba35c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=LDBv8-xUAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=OZ2e4d8rXakbCkRG61MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116814-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3B14711509

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index dbd542300f80043c6bc65a69fa27ca7b3d5fe787..92a0647f08c69f841ca99caca757c1728b3f6fce 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -76,7 +76,8 @@ static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
 		goto out;
 	}
 	pdev->dev.parent = &dev->dev;
-	pdev->dev.of_node = child;
+
+	platform_device_set_of_node(pdev, child);
 
 	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
 	if (ret)

-- 
2.47.3


