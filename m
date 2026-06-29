Return-Path: <linux-arm-msm+bounces-114909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id obcaNes3Qmor2AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:16:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 150686D7FCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:16:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="NsQ1+L/H";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S4vmaLBG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114909-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114909-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78019301E813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B233FB7EE;
	Mon, 29 Jun 2026 09:13:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A003F9F2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724389; cv=none; b=HfltV9DljTwe6T3nwSOmia3FnDvVPIS9yE6LrKlYCfpFryK/vfnDxpAuHan2QiGqrK37MMebAg+wi9dwnCtXFsn4Etze5VSN2nWOrUDM1itXOOHAisZVN481qz/NaEKGjFXXxzoOnK2JgqSlB8J/niLUnfN/I2zL2GX4Z4cR27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724389; c=relaxed/simple;
	bh=dGc6l0sHyACFM3cxNlrW03xZ13Z1lTT+PlM/FFhNpQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQOqamgFnaVmMKuz+dvr3iRzVb491OpLnqCiI6AwDGAx5BJAgcqrmJ6nY7ddLv+ICeWECwCre9dX5MMcrZAGLKWbeoIbd8WiymNur5eV8zX5S5/Hymd1KCxbchJO7QnkF98vnZFRfKODeh5itzsVTvNP572YKSsbaoMU4Dt8eB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsQ1+L/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4vmaLBG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8waZA2391417
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M5i5ctxLVJhSZjko8lbhXGrG7Lp0ur4VIkT28ZThogg=; b=NsQ1+L/HzzKa/jbr
	PutaRtGLs/lqX0Hjoiy8VwvPfU0EngaJzRmdcnLjON5Ful8r9tnjj0g6HkOQ+3qw
	HUBxYxvfVQTfRrw+ZWuHVRQbsGZYp3AGMD1pI+2iIX0z30CONkJIPssq1xiHkRDQ
	b5yFfU3yxMkivv1ZJgpAd66upGERpF32Prjeof3PT0ZRZ1kzD6Whz22LolmanKDh
	KlnMVQPobtWOdkr+HLUURTTFpK35nsjTQQK2dMHJ+mUORwjHkvSZCCeK4p+yfTaT
	sjebXbTO4fbFiWzDEt8DPRM9X3Xlm3GpOGpiYNZYBhHBVwB8hdSPjW1nDSOAxM3p
	6Z1yow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw820g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92158791d14so378890385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724385; x=1783329185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5i5ctxLVJhSZjko8lbhXGrG7Lp0ur4VIkT28ZThogg=;
        b=S4vmaLBG18FgnXnRhP1gVLvfR8ROro+I1ChhYAb4moJqAG/CM0NSoubAp70iZA3ohi
         qTxN6J/mI8u1f2Nk6fnKeayBPVnbvqaaY8xhv4pn8/GbmmOHGR2RSIrN2r90HgeMr41W
         SIf2xEiLjYoF5IHsQL8UrNQDAecGKa8cBWaoW7pHD87gFWx1ETwvD0ruMDEQwJpfHMRo
         jBbAqW5/ZfNdkpzNyH5jF6byW6tlKZzbfhJ4absP1UjNeoCjegF+pRqoMaQMP04PZsU6
         e6Wku0LLjfmexKlovLSy8DY3v8z4D00HDlP0o4Gc1+SlO5CH2EliiAELjhveTVT1Tk/T
         ylvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724385; x=1783329185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M5i5ctxLVJhSZjko8lbhXGrG7Lp0ur4VIkT28ZThogg=;
        b=pVRJ8mvs5LiBgkORGxnLX/hp2xe6EdKSDaWpsoppNV6D8a+I33RV0iBmYwsf5rgdZm
         mJABoY+AlWd7LYMTiqP1CUrBkBK/nhKxzhVuxY35hVLrAYVc58GggWNe1JgQ/YwxxbBM
         UCTWO3wS5kajCk2LjDJ2m4ytVE69kfrbJflnzoPq8RzDBISYgUNOPDki6g6kbszqlfgk
         K6jMPxI1Iqlg+ZbKZG2hljoaQ5WwxQhBLygi1TJtmZC7Lo6seVgruuZacdVNCpCH6ark
         CYUnqhV2POx/yZurPxUJnK3SuhjlDnBfKGIDqgzDwaZJSE6D9ADOBeje5bH5KizDbT0R
         3REA==
X-Forwarded-Encrypted: i=1; AFNElJ8HY/juat3BLl70WUqHgoNPKxL2kd5tm30/+4Alowa69UXw/AeLTE5mTQCpve3PPsorx1UzpUetHl2HD83a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/7MLZ3ElD2bD1OL8NO8rjLxxHjjhwE8d5C/CK1vPFoKG48tg
	lShzibLk6JPx30uT+MKBYp6BvHRDSZUOQVTt2GosQ8bFbFIwOegVvRIy46yDsXy+mpn+nKp2X9J
	cXRKJXj+Uxwf5h+/UqPbl9SSYC2TTY1paevdGtYyvrkzgkBOP+7z1iWFteY9TeaTAljso
X-Gm-Gg: AfdE7ck/ROEDG03hZIlQ2f1jdVMUP+K0jsTA+gc/XEnPEgcZF5al9RxS5QeBiq5KgTW
	q4YsmwwXXCUFG3TwdhEIV3/OvlRzAXCbJiOdkN97xY5cNFacPEErC7b38WA50l2pSMY2eWlxk0w
	jDwUTfLnJzqbgB9eFGn6pKmrFayWLg88sqt+0POGfzjCOUTIl6nnFt6VmbxxP9nM3cGNqZFpecU
	vaScY6mc7q9vMW8nstsc13uC4/vBDY4oaD5QcZNqr75ThNdq66jPtwALj9M6Z83zNsBIlfnTu0I
	iMWSrcnyTgqIFvZUE6dXerrGH27jMUrALsMNhULSBK/z8CemZI2q+l4UaLcF5L1WitR8cAXmXnN
	v+qmoihh83YRIWXoRPUmjQI2TRCuCvu9EVAUur74O
X-Received: by 2002:a05:620a:f0b:b0:915:87ad:d5b1 with SMTP id af79cd13be357-9293bb44956mr2587312285a.15.1782724384268;
        Mon, 29 Jun 2026 02:13:04 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:915:87ad:d5b1 with SMTP id af79cd13be357-9293bb44956mr2587304685a.15.1782724383600;
        Mon, 29 Jun 2026 02:13:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:25 +0200
Subject: [PATCH v2 02/19] driver core: platform: provide
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-2-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dGc6l0sHyACFM3cxNlrW03xZ13Z1lTT+PlM/FFhNpQk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcH6bhLnzENX1KDtInjn8wNXEVpMzGG3K0/Y
 VfF5Qbu/KqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3BwAKCRAFnS7L/zaE
 w4YzD/4oZ/19j0EElAZKwXbz2OGnGHF3kpDRVJlSY4nTjKIU/q/5g4kAa7g7HgqD5/wTjxILTIW
 sQAeorU9mn+9EOVvNwHtxzokSU8k5EdcBHrnhZzLTnTiBB9JQPU8R4V0i4MpGDeIHmxDSzMQbKm
 1qvG48V6xMQvrq9cWgpJBLCcEgKgIbh2vT6IIGlWvQdjeXmMN4wjap6L+/BqoLyLPzFUEiK0NUz
 8rZFF3XmWxzgB/COKFdLQ+l1mfFdwqETFxCfKl7m/wlALdCPiZqlBan1LYtlxBacT16ZhkxcnWM
 n4DtiyUZW2YeD2ic8XqiqdXEIEdisXT2qT9CgrKqvFu9IHg3B2DkgC4nGN3lIdSJKeAQtnXNaQM
 bDQa2In+ALslR5euQObzgt4MUsT1uB7S+qcZwLK96ljTrOrdfJ5dPQLki/Di/npkZ7yHPwBblMy
 nu0OYE3AxVeX3Oe3klNK8TgKJ/ek6EsoOx2xGm9m/oNoMyZHZyN6rsJgnMYdDsqo+KsryX8cMGs
 MM081TDD+/Gt9QQtKLej1rmD3sbjoMMijsRWkX0PPZr8SVPUYTfi25heFzCCg3p0n6WDTVOoMdc
 xsZC4MFCIiH/aRsCNyUoEd1H3nEYdGmx1lbKlX5RztoZdgA+SPn1tasURA4uiJrB6mgL4GIJjpo
 Um6GSc3yn04pyLA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6X9cYpkkfrem
 hTysQOgKZ9N+ypoIr77sh4bvl5i5K/lRUyGzck8pxXT4EAQW64AipOZYqLZPPiSNg7ErNjm/ipz
 1jmhWa9nCZ8YiwoKG/B9uyNTSPGmrjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXyu/rd9HOVtL5
 mwvoLwGX6zZ9j95F2vTYN0fTPrMEpYSMaFEjQbX+aRM3m9KTLB7Y8hZZkopz6LAs3gPvjJiNVJc
 D0yFjrJmkzbUS3dcUX1kV5A2W7fL8ZVuQg4llxPGd4TD4xQPR09XjsqeesLQ2fLf2R2/h6+wOzA
 4FvlngQtOz+a5dxcbJQ4+1kPgLzpUe3+45mAp4YTT60WzSnzn6UiO2A+2Ep7xMsJbJi843MRFAQ
 lnMz6ihSjlPmth5poauEZiV/DGyQC5mnxj5OS+ujkejnquw5fr+5afWLZYdjj504NZ80p5r+lgp
 icHJOWQYzKZPibRSw6ZuM7ebtZdOkT/Tt6Ip4rmS98Wv26VCmcJT0+OUpe7ymaETXjVLLIH9f0Q
 buSXMQgMpDgBpLRV0Wy9vdXQ+qSdNJ9n5ZM0EGBPk4pppG7RWlqjHqbYu6bIZVh3C439FhOe1kj
 B6kJWY94/bdWVxEkszw==
X-Proofpoint-GUID: PPI_ld4vfxrECzWLk1AZS66szhP_spXo
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a423721 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Q8RKEeUEMY9O-VPP2I0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PPI_ld4vfxrECzWLk1AZS66szhP_spXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114909-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 150686D7FCF

Encapsulate the reference counting logic for OF nodes assigned to
platform devices created with platform_device_alloc() in a helper
function. Make the kerneldoc state that this is the proper interface for
assigning OF nodes to dynamically allocated platform devices. This will
allow us to switch to counting the references of the device's firmware
nodes, not only the OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 18 ++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index fb9120b0bcfe0e7dd9dfc0d29b91e0ad40a01440..3188d5aba5f90622f821c695049cacda030204fb 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -693,6 +693,24 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
 }
 EXPORT_SYMBOL_GPL(platform_device_add_data);
 
+/**
+ * platform_device_set_of_node - assign an OF node to device
+ * @pdev: platform device to add the node for
+ * @np: new device node
+ *
+ * Assign an OF node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_of_node(struct platform_device *pdev,
+				 struct device_node *np)
+{
+	of_node_put(pdev->dev.of_node);
+	pdev->dev.of_node = of_node_get(np);
+	pdev->dev.fwnode = of_fwnode_handle(np);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 26e6a43358e25cce2e2c38245dc0f0fc43923bf5..870d168aeff8558749eae71723e657ab150ce0be 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -19,6 +19,7 @@ struct irq_affinity;
 struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
+struct device_node;
 
 struct platform_device {
 	const char	*name;
@@ -262,6 +263,8 @@ extern int platform_device_add_resources(struct platform_device *pdev,
 					 unsigned int num);
 extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
+void platform_device_set_of_node(struct platform_device *pdev,
+				 struct device_node *np);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3


