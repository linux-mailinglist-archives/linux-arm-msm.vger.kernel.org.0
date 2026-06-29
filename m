Return-Path: <linux-arm-msm+bounces-114910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GyidIRw4Qmo32AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:17:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7016D8004
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:17:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gYI/y+G9";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IYMckkAr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114910-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114910-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF66E3022556
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFA33FC5A1;
	Mon, 29 Jun 2026 09:13:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86033F9F2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724392; cv=none; b=JJmWzJ1EFVkwj9zqVmue79CCbfqwfi98aCyKjWp6WEd/nAZgGlbKSSrwF60qWG7CGkccr5oaSlyKVQytChLxEa8aA3JPptD1NVSDsnvfHMnumcEk1E3BOaX9RfppjQwfay7JSvu+8scqHU8tH+k6pbgnc/GEvzjuhlbTj8BmkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724392; c=relaxed/simple;
	bh=rUG0oEwArOQI4stC68CYhz65UwovfxaACRw43q5Ey5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3H01WMBZDsLVNXWkwQrLtQ8EkYtWWQUHEMOFKhG8S1mUCRVPSdmqpc3Feoo6xQjUxF3uM2CFJpNbcXntAzEth6c+4qEtEtgC0jv+x/5Dz0CFPKEcPGj45exvVuU06bZEX02z6YNwlJh44udIAV4noM37BaWVCFdpcyaSFTjLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gYI/y+G9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYMckkAr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8O7ef2348330
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMPTZOeccy6sNIaJUkTJ6IS2ml8UYa40KAi/6XzhKnI=; b=gYI/y+G95VumA8SD
	/R59cVJHGOIt5pSimIFypsAqavIeXQaZcfb3WjkwbUJYNFoo8aH/QBp7uGVD3eas
	Lr0atSwt6c7aq+ikROGmESkAzTzl0B1g4uTb77HhpcqieTQm0wPBXwPKilg4xTkY
	jKJbM3mLi+mkc48JWb30vOO10hxR9PhSkbP+KDz4UwMdvnwcUOEjVvKfwoAQYkgl
	gPMxOE/72VwvH8eXJKtTUPAapgu/txpGKnhD2UhCN+tCgnfm44W6g9Vf1hZWU5DW
	GhGs2PAeNFj88H/XEA9LXtyNYAR7ScpzMO05COuPAUZcc0NULXwA7b1clvWReCcn
	LCXaKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s07a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso110617385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724388; x=1783329188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMPTZOeccy6sNIaJUkTJ6IS2ml8UYa40KAi/6XzhKnI=;
        b=IYMckkArBUYXSgTADwqkDRAE/Wk8SSACI5QP6Fp3gnhU3wKrLNQGWj2QvT7Z6ofF8V
         2UObyMgyU5b9oJGBCXFdy+JGJMm3Nijn5hUQNcHtrFuw66qla9jVjAZbiXKjJN71vUeV
         nUbYGPbba8gtvAKu4jBnvkoyIxbTreirv5MsJ6XSJYByZJJJBnrk3iZXxsNKxvglKARR
         U8eiN4hm50xxYMumWpHdAkaOQq9AxzHH0k3vV8IUjzrsfWlIbcg54ysS7dB4fGPl3wDk
         5NIcPvEsBCaLLX/j1HnEpAO6Hk2A4lxvdxjJpmQeu8+69AS4cvlu8PsebeTKJdQHr8vn
         EL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724388; x=1783329188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMPTZOeccy6sNIaJUkTJ6IS2ml8UYa40KAi/6XzhKnI=;
        b=c8vuOnsP1X/xUs7vkEfNxxdh09Yd/xSXR3Z2fppalEr1pwsatrzGpwtZTmPO9nDWqH
         PmJV2Kb7V4VGjaPMIf36Yo2dXEt4Y6oRdqEwJ8U1T6ZZn6txRDLV1STsdDH3HQ8qDUTf
         IxaUfSa0XCxa2qXDeLHYJa99vNYAIShckrkknATeYUvfSg0xI3KaxnEhu5tOuHh1r+Zn
         Hv54J+6e5LnBqspanCkSKvLyjtl/2PF6u8r+/p40MfMTRmyybqFHWoIZrCxJk5HI5XYe
         EBZWV7EdNaNxd9V2Zm5mR7XiQ27L1p1H+nDDG/nV4T+PZ1ejyJpZUhhP5J9S31w6ARmH
         FTcw==
X-Forwarded-Encrypted: i=1; AFNElJ/c0Sf4KqBItcfo5Vi0uAY07Pfy9G4Va3RBWbwqbjchY+/05TEyf4DC2exEWDFCMOzZeJ6otTobGp+/Wmx3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1YWKMQ6e3v/bDRtseIDQFIiNyAglaR+SSqMn1cgsqX/B4UVNf
	j6jiSOdAO50LLRLc2MHKTycAV1ePGvHnILkV/XXGdmTx/I6+4CAw0NoRhy6EB2qFOJJdulTWnjx
	iP4pXdQu/kCvgLgjrZ0x6/CtAiL1P/GiF2Jy3KHJyXSMCJu+QNS8ERAOAKRUs7axs9F3d
X-Gm-Gg: AfdE7clYPJ0rDp7vDuLz8rABiVCJwyFJvRQbptbhVh/n0npNhiVa4toRVtjFfBwtB9y
	ouvllvKbgILj2i7OZlTMJmmoOFQoEgc+pRqbRj9D+WrQgh983sK+8KkACqJwbX6MPomEKsNWIqT
	hbpoanMUS5rv2ouFjgFWfLf46tyIo8sbdxgnNrMhTnSdP5WDCrMzwqMEOq13yrcQ6uW/+cyG3AM
	pB1fBkGVMG5NMP5g8DyqeFcbVudScaMo7L04LggyrJLpDvSrzhmWmD1CXCl7uNqPEd6EepKqHiX
	SzPv8EhMpCZ+Y7/FaY0OzhU5ijT0gKfDTFreXVILYOlhpwzXr6Uz5/XuJkSdrF/oR+ZNe8kEQFU
	icW7vaFgSjB4osSBQ+zPAmXuwyH9oYm1zVoEcGB4j
X-Received: by 2002:a05:620a:17a0:b0:921:9d7a:ea38 with SMTP id af79cd13be357-92b3e46fe04mr1387192585a.45.1782724387834;
        Mon, 29 Jun 2026 02:13:07 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:921:9d7a:ea38 with SMTP id af79cd13be357-92b3e46fe04mr1387179685a.45.1782724386772;
        Mon, 29 Jun 2026 02:13:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:26 +0200
Subject: [PATCH v2 03/19] driver core: platform: provide
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-3-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rUG0oEwArOQI4stC68CYhz65UwovfxaACRw43q5Ey5U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcJjPh5mDVUknauSD999iEJoQhOldHh2+5sY
 Ww2SlGyFmmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3CQAKCRAFnS7L/zaE
 w+y1D/9MES2KbtS+PRc7JBKv67xJ1ZbKe/n9QDkmQW3Fo3GeBTca3T3dkyrF9AKSM24U+GvjZou
 /krTxMLjjLMEIK62SRmS1xLxWyc/DISbLyTE4c8AUYfVuqTPy48X8A8meGPg7hfWc/Ytl7U/+ZF
 4Bmcnc+qhSS0WdcwRcXJ5r+5q2BohvzW2Hg4yNk44DxQSqgd6xy7d4TlVAG3fUIp+2zCbPXx8ed
 G++O4czOLSbEsEPM2pI/bGPJJkM9C+gjbqN1NdLtds8PfL+Ltr3Mo5cyRY5wmITnuQKrzc2SB6Y
 eXCHjkdukHWRc47AD5Jtd4Bo5YH0p/lHVPY+Y4L6wu7fGGpE9s7k6g02v0N/ZSjgRV2Dwy/YFwv
 8ptXzAdQR1sRag8biXf8XwCe2qpjEt32eLjWBFS/NhEBaIexc2Vlko8t+s/nKh//af4WWWzIK6f
 hBhFvGPMc2xX6Hfhm8xtpnkklUakjwvXa/hHr2ZS2XT9JKTn/uggmbE5kAKCV737iom/G6SvIQ+
 mHSlz08g8XpkXmumGsmvIS5r1YW/yZ7Nr3Jjnz1TpKl/Xw9ZtYTjk8gnDfkRCTryOZiSqWELkGs
 h31XwoK+zijgOwVnaDmYXxrSzbtnAJQxBHMA+AwMll8KTyhe4jcz9NiWNumn+m6m1nP4HPGAhgo
 7evHEDzQbm0hLcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2MzQRLSlyKB9
 nGVM2AvyKoC4pvALJnr1YIYCaEP1BdLw+G+lrQAN77XjrDtbS+phfrw8lYEaKPfKyKNENh8eNjF
 qL6Uoo4Lu1mq6BuYgvfUkwxU4yRJIUI=
X-Proofpoint-ORIG-GUID: U3tu8gjnjxKif77CWRdecgL5IyxbZ7IL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXzQUJyFSfiQdU
 eoQAXVTbj39ZJ23LJslPznSUoHZQcTqn5aVYZ9DnrixJlLyKLuEiNRhYG/fx8mgVr0vF7jeVKLH
 X+JpEcZ9uha4m7PBizCAPXSrZAMO8sn31oYMvsJyFLmChMnxVqaWDalGO+8V9iTL9P55I1G/0YP
 MF9TvNrHz1bh5pxiOGVdAz9AxceOA6J7NEqVSbz5GGoqtAWPTiWkiwyNgmY7fSJ9u3W8E0D6MDE
 +hmnfP0x54wEcbwugsUA//YcCsUqS/J0tew5Lq0XLgdFflnT74XSyH4ocjGxSwHZRbEA92lS83J
 ie6kcpDT5I3eJtUH3Ggl7XP1KMVV13F0pi6F+yxEawiTV9u6Yhn5QiUi8lFUHBGe8NzYobCKHNL
 qup+3j3yBoZyXwo1SpkKo7JOzYx6SN3oa/A0v03ZbuVbXVKYMY6ZQRzMnetWVSO7Tn2VYiU8GNv
 pDKi6DAowjcwZaKEWcg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423725 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7s1i5lxVbzGmBzMXG7QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: U3tu8gjnjxKif77CWRdecgL5IyxbZ7IL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074
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
	TAGGED_FROM(0.00)[bounces-114910-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 7E7016D8004

Provide a helper function encapsulating the logic of assigning firmware
nodes to platform devices created with platform_device_alloc(). Make the
kerneldoc state that this is the proper interface for assigning firmware
nodes to dynamically allocated platform devices. This will allow us to
switch to counting the references of the device's firmware nodes in the
future, not only the OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 19 +++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 3188d5aba5f90622f821c695049cacda030204fb..6520b70cf3052d683a2ecb1a0dd7227575546ba0 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -711,6 +711,25 @@ void platform_device_set_of_node(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
+/**
+ * platform_device_set_fwnode - assign a firmware node to device
+ * @pdev: platform device to set the node for
+ * @fwnode: new firmware node
+ *
+ * Assign a firmware node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode)
+{
+	if (is_of_node(fwnode))
+		platform_device_set_of_node(pdev, to_of_node(fwnode));
+	else
+		pdev->dev.fwnode = fwnode;
+}
+EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 870d168aeff8558749eae71723e657ab150ce0be..c463d46b7b9ab6b891df1ca9f0c98608d2bb140f 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -20,6 +20,7 @@ struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
 struct device_node;
+struct fwnode_handle;
 
 struct platform_device {
 	const char	*name;
@@ -265,6 +266,8 @@ extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3


