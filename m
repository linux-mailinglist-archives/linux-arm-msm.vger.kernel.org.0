Return-Path: <linux-arm-msm+bounces-108941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDucAY/FDmqzCAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:42:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD95A14CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81BC30B0C30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFC9363C64;
	Thu, 21 May 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Trw38hpF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E22Sb3nb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC5355F53
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352631; cv=none; b=cNVJgkV49LFYQkU9uhAoaPLEFiHDIw8DipI0y43riwN2amcYD/fKOjOm4sJBS9+xUjusoCPr89ASrGFjYw7hEc/m/YTneq40SIDqfliGme+JuGZnRX5vs0ej0XYFdI++CxtyhIjCu9U+ygIBJtI6lVWnoaci5FaBIogYQLp0uNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352631; c=relaxed/simple;
	bh=D3r2n74KWxEYfDl8rWFGKV6Wr7M1gfnVPwg1g1CrN84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qibsM4sSYZbGUakqzPLir8vYo4vuhg+yHx5e5SXgc6iPdeT5bTgpTGyjn8NFHaey7776KZb3DhoW8zfmG6heot09YnJKH3W8EOGK3keI39swcmsFI/Cnjf6BiniKyJWNNFcn9otCDvWAcyL8jC49y2H9ojqNYoaOVowNHmCs4Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Trw38hpF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E22Sb3nb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6x9sE118975
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=El4wNMt9BXL9CxxtRdtqTV
	x+E6o7UHeoj7av7h+WfcI=; b=Trw38hpFc3Uxmsxjfu7cVuCmyXS6WZ39nWg0SE
	akyGensBif0/ULxQcPPBG9D7sac9jKuydsTJ4IaHQocxwctnByVKYnVB4mI0toNE
	SdpfJT9vOELGFzPNl9Az6o/kqZ08mXro8GaeDySwzyoNKFVZCLVkIYOnFsEo6KEF
	bJmt1M7ivhKwT6Vb+fDulepmbjEGwXUo82NblLrvbrDD/5b0quMl/RUmd/yH53xR
	P155WhEBw0FDk+ct73qt9Z1seTGTUP5Y4mlWPMO5mjtd4NasLjoDXfKeTfgsUzjo
	9Obr2KNaswV3iLrbA/+wijZcq69LTkyX7fshpsA/vGZdUnnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c158-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5d6bb45so79652471cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352627; x=1779957427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=El4wNMt9BXL9CxxtRdtqTVx+E6o7UHeoj7av7h+WfcI=;
        b=E22Sb3nb4aDLac31OyOASlTXBUf8mjO1coxt5+pTCdyR1scRp/lKA1XQCa8IzAR/1b
         71CA0Vdmwrpxel9udOeCjvLzd15TXx3+Vs+OkwRqvg1VBn58jVur+y/qFE/zqv83Fs+6
         uiW/evDa7/VJwHXXR0G8ebEgQRC3Z+5z3WQsKQEeOSdLlnfwvnt7xCQHKO6gtF5Au0nk
         bF2hojYISxd4ZmO12W6ql11SwIVqUQ8poHWbFIU77m1jYSFK0a1Dg3LPOY/IaySxz0Q3
         YmyrHql5Rgvag6MksUEscT5Sr+wrKJny/7s4JqD05KgtxjWAfiHASvRxgwXF+jQSG3CN
         NeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352627; x=1779957427;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=El4wNMt9BXL9CxxtRdtqTVx+E6o7UHeoj7av7h+WfcI=;
        b=jS1WlZa7r1tSbtkbWDHg2xaSZ0Wkf4d+59OObaiKtb628pT+qbjmrKIQlP2e9wunBa
         gd54j+/uT+0gveYYFBCZru8Ovn+NqOxohz+FzhDZL7goTYXXyHtKFhiEwT+7uXGk+kgm
         QEMekV0BpoZxld7zt0Y7yNniNWsH4qbgNYP1/DEOWly1Yt/OLhQkGu2UIQGJd5ADo1fL
         wk47315kddzsWVEQcCBEKZzw0mjMOgJmTSeEP7j+CsYVeUlVN0lBEZx1WNsLoKYPLs4C
         JzOke4esH0YzJSo4x7mPwAnREqMwd8CtuRRvLrxy6bVSyTZl2CXZl0gGflkycSokBfGq
         g47Q==
X-Forwarded-Encrypted: i=1; AFNElJ8UXt1OzRWxlTpMlFr/UZpIyACEmLhhX18RPx8r+KlFjwQ4UJoC4UvgTcox9NGNwwh+EtgXSNgGPLosCkBk@vger.kernel.org
X-Gm-Message-State: AOJu0YzcHZ/74oUiB9SCl54kPdgBpkljUto2wUowauS0I2azPu71WAvr
	E2rasBPX6BDytYV1Lw82Wkblt4XjxrlU4s6KmPUt0nnpsT1/QD0pKgQ7EihL9D1vtOaX3S6Hq2W
	KswwOJ1pX/xhaq0Y2eSeutfkOjFF+4bhsNsMzW3d36JNPf4xEYoOCsw+0jgGiKWAC19fA
X-Gm-Gg: Acq92OEpyeAMhpFZ2qfCkahn4ZnjOaWalIPIIIbk3L9SaGS2plpSFFdAg8O/nvphO87
	VBNkGZpkyFulz04CsAKY7SeUeVI3+DrqWx8lQL7WYtTsP7hJ8K6N3MC+8d3r6a8gGkKtDlv8K32
	0JS5uOkTJzIs0DNGVqaB6k+Upa71dPB93oupREDxOaLpSbDEsCN5+giIOhjPNAxKuZ5pb5Mth8w
	QsoF04Oybht0zihH5p3SYNXk4mxkEFeKvXF5alzxxSAqDbp2XBTgFj6vhl4/rsovZ8+LhnINVMH
	BL6fxfFt3Mnlmb0J+IZO0LkbNFZQ0n1HyVfMjC/i7mX3ffxehqa4vyiun+tFkGcbW89vpnWqblc
	LmuaRhXKyf/ri1uynWJ4lkuxBjluvpNTHw15n2anRhVHH8NElUFePSVKKtf+bXw==
X-Received: by 2002:a05:622a:514:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-516c5484841mr24415811cf.7.1779352627431;
        Thu, 21 May 2026 01:37:07 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-516c5484841mr24415481cf.7.1779352626922;
        Thu, 21 May 2026 01:37:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/23] driver core: count references of the platform
 device's fwnode, not OF node
Date: Thu, 21 May 2026 10:36:23 +0200
Message-Id: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfEDmoC/x2MQQqAIBAAvyJ7bkGNzPpKdKjcai8qChZEf086z
 sDMA5kSU4ZRPJCocObgK6hGwHYu/iBkVxm01EZ2WmJ0VHC/fHCEiXZ01vS2NUOvaIVaxSr5/o/
 T/L4fVuIfJWEAAAA=
X-Change-ID: 20260520-pdev-fwnode-ref-d867836971eb
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D3r2n74KWxEYfDl8rWFGKV6Wr7M1gfnVPwg1g1CrN84=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQZF3+Wnnqse1OrX9tW8YslypJ8/2vlajEr3
 JD2ATbv3b6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EGQAKCRAFnS7L/zaE
 w8EKD/9dgPJ3F9RbNULXnoMj4pWPfWo/PfTbl87hUlFmLRa5e+BZbCj7lym0G7cDSCBBxhP1m38
 XDMPAP0b7y/NNBM5+VFFKiHSXL2ftnoZYhTiPCXqAg8yXpg2s9DUQx7N9NbBTjBZDPFloWIKRq+
 KlrMHuxSs7HgG8kOBSK5eW4l+mXcdX07ZoH1zm3uq+BtSWd3lpPf2/lLKF+k5Cc1lpzbfNDEq7Z
 Ykm7Kfr1bDflSUQG/fhL8ilD15sZF0ffqDCywGL+UWcM5riCnkN5/v/BOF94pxi6LYD1XBlKs9t
 9gnTDKdlCmzmuhXIMsvOdZbSYYaJdad0De3ClLQ1TJN9KZXrqkxtJmLL2WUv2kI+YgHoNhRxM/d
 DoZ7lw/sbJRbjlusrb2aLa4FDl776mKWYhsIxGgIm/BEQk8ttADCJ+lCw5QMO0KC5BvtqRFoazO
 pG82IvBTgo1DqWURzhU8JiJIsRJMdzSm/fNAHAdK3htZj4WBovzhar44MI2zYLwsIEOTWII1a/C
 zWJCChwoCsQXVVI4H2ICRncw83pF/8yG5ToHIO30PdXPpkq36sYUdxvG/qk/pmu07MX2Gz3GGPd
 4HA7SKpoUAI1k/yCQzarBy1I3uysZITHV1i0mIHh5wtU/1mmf90cnXhXSuAnrIq3vTxq48wjVLg
 wrYHri/y1wYzsQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: _vPsyOEDur0DRQ14M6AdG4HQb13l28c4
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec434 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=x7ldU9BvHY0adF9BoRAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX/w5nl12kDA6S
 S2exv9UgBKCR8odZNvpu2zkl7in1EcdhJbcttUhTns2ulfB71DsrRQitMhhh8bYp6sMeSAp5hs0
 /CIp67pY8MiucVwlzfjuSLItJDyqb6V5OX17s64uOiumRdCQGj/cRq/+KwARN4oxdliqwCbUvFf
 CWZGGv9FWEAP3n+GW11nN63W0wQt547tq/Q2gW6Xu3UCPNIhsDaxI6TCYYerRMqWWWhUU0K26Cg
 1NzVhF4T2NAR8D+vciCBFA0wF3PlUKoPHB+8VKdsoCWr/vkBu0ig0p8xN5cG0c7jOrl2hLz4n+3
 rTyEMLkYJ0RaN8Jyq0hQbSufFoEjTV8/r068LSsEAtEaxLBVu6c4LZEUPiO6gCHkMEb7x+dbcH1
 LyCjpSstjf0Kufklz8EfkUXUI1EUHaLdysr0pEiVprEBg8UqQ7v5M77vBOJ73Cl43L34qX9XUd9
 ixfvwL9XJBlJsx97GnQ==
X-Proofpoint-GUID: _vPsyOEDur0DRQ14M6AdG4HQb13l28c4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108941-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 60FD95A14CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I'd like to first apologize for the long, treewide series and an
extensive Cc list but I think it's important to show the big picture and
the end result of this rework.

Platform device core provides helper interfaces for dealing with
dynamically created platform devices. Most users should use
platform_device_register_full() which encapsulates most of the
operations but some modules will want to use the split approach of
calling platform_device_alloc() + platform_device_add() separately for
various reasons.

With many platform devices now using dynamic software nodes as their
primary firmware nodes and with the platform device interface being
extended to also better cover the use-cases of secondary software nodes,
I believe it makes sense to switch to counting the references of all
kinds of firmware nodes.

To that end, I identified all users of platform_device_alloc() that also
assign dev.of_node or dev.fwnode manually. I noticed five cases where
the references are not increased as they should (patches 1-5 fix these
users) and provided three new functions in platform_device.h that now
become the preferred interfaces for assigning firmware nodes to dynamic
platform devices (in line with platform_device_add_data(),
platform_device_add_resources(), etc.). The bulk of the patches in this
series are small driver conversions to port all users to going through
the new functions that now encapsulate the refcount logic. With that
done, the final patch seamlessly switches to counting the references of
all firmware node types.

This effort is prerequisite of removing platform_device_release_full()
and unifying the release path for dynamic platform devices using
unmanaged software nodes.

Merging strategy: First tree patches should go directly into individual
maintainers' trees and land in v7.1 and stable as bug fixes. The
remaining patches touch lots of drivers but the changes are minimal and
unlikely to cause any conflicts. I believe they should be queued in the
driver core tree for v7.2 (possibly on an immutable branch for others to
merge into their trees). If the subsystem maintainers object, the
alternative is to queue the three new helpers for platform devices via
the driver core tree. After v7.2-rc1, I'd resend individual driver
patches to appropriate maintainers and once they're upstream, we can
apply the final platform device change. However this would take three
cycles to complete so my preference is the former solution.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (23):
      mfd: tps6586x: fix OF node refcount
      net: mv643xx: fix OF node refcount
      slimbus: qcom-ngd-ctrl: fix OF node refcount
      pmdomain: imx: fix OF node refcount
      powerpc/powermac: fix OF node refcount
      driver core: platform: provide platform_device_set_of_node()
      driver core: platform: provide platform_device_set_fwnode()
      driver core: platform: provide platform_device_set_of_node_from_dev()
      of: platform: use platform_device_set_of_node()
      powerpc/powermac: use platform_device_set_of_node()
      i2c: pxa-pci: use platform_device_set_of_node()
      iommu/fsl: use platform_device_set_of_node()
      net: bcmgenet: use platform_device_set_of_node()
      pmdomain: imx: use platform_device_set_of_node()
      mfd: tps6586: use platform_device_set_of_node()
      slimbus: qcom-ngd-ctrl: use platform_device_set_of_node()
      net: mv643xx: use platform_device_set_of_node()
      drm/xe/i2c: use platform_device_set_fwnode()
      platform/surface: gpe: use platform_device_set_fwnode()
      usb: chipidea: use platform_device_set_of_node_from_dev()
      usb: musb: use platform_device_set_of_node_from_dev()
      reset: rzg2l: use platform_device_set_of_node_from_dev()
      driver core: platform: count references to all kinds of firmware nodes

 arch/powerpc/platforms/powermac/low_i2c.c    |  2 +-
 drivers/base/platform.c                      | 56 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_i2c.c                  |  2 +-
 drivers/i2c/busses/i2c-pxa-pci.c             |  3 +-
 drivers/iommu/fsl_pamu.c                     |  7 ++--
 drivers/mfd/tps6586x.c                       |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 10 +++--
 drivers/net/ethernet/marvell/mv643xx_eth.c   |  2 +-
 drivers/of/platform.c                        |  2 +-
 drivers/platform/surface/surface_gpe.c       |  2 +-
 drivers/pmdomain/imx/gpc.c                   |  3 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c      |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c              |  2 +-
 drivers/usb/chipidea/core.c                  |  2 +-
 drivers/usb/musb/jz4740.c                    |  2 +-
 include/linux/platform_device.h              |  8 ++++
 16 files changed, 84 insertions(+), 23 deletions(-)
---
base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
change-id: 20260520-pdev-fwnode-ref-d867836971eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


