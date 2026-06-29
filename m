Return-Path: <linux-arm-msm+bounces-114913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8vpuB6k3QmoQ2AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:15:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2FB6D7F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e49x9dge;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fwPdi1Za;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 031173024EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E323FF886;
	Mon, 29 Jun 2026 09:13:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB63FF1AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724401; cv=none; b=pzAL2ZTEXG89LKYcUfsXBhJef7GFy2CmFrXCqYB9z+Xlk+xRHBSYiJypckZbkefpPIHzXKVd4XfTvnNR3yzFHzCwGxnvX0buxzaLwkKR2Y7g2kJUieJcefccNSET6YxA5IRzE3g5IMMbH8y7yCoVbnjNERegGxPMnHTnbxEqxLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724401; c=relaxed/simple;
	bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuXAhL1uJQCPlZBhJWrgTY/uXVbftHsnM9nxyuxXpOsbgc3INdDeXDdr1WFiowsRRE77mFu2Nd8J35K56QIeDAfM4bwM0l0bEdg2P9MaDLFIgpRmZP7CZF1L9vi3DimsxA0ynnG9RYwoKwXyIGZS10mqpfHZ2ke0ab2K5TdsgJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e49x9dge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwPdi1Za; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xfN62431930
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=; b=e49x9dgevQ3cG9iG
	Lkj/IXiDOCjyRPpFLYPYID7dhrpbk+iSA5taIkgY6Mlrk5ptpQhi2PCxrS++NyCr
	j7AIY+DUsDYgCvBLNbDdOX89qLG32+hXZcZDllrLWGMryBTHjnyqgNouP+DK9q8G
	A5+RTn3AlDL3xbGZEV7v4QPykHh9MOpwOzfBeycwCg/AQFQup+OivOuL5T2kudbr
	SR1C8Lsz7aiqSc1djzkUXOrSMEcAJgQgapxM6Hv0zohRVnHKFEus6/p/zWUMd9GZ
	NinwucbDLPW44K0sEoc/+mwMWA/J+LaGL4B5oMe1ojSSmc6BGaRJI4/cAH5OwyD4
	gQ7JYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper21w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92158791d14so378909785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724398; x=1783329198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=fwPdi1ZaUuSxBFtEk6QkOun3qB0mQSIYiacEB+irfueyL3it9mAFZjSeuBHGPRQVsz
         q88FtN8u1AO3lwuV9dvV3vSV76KACTARv/n5s9ST50GMz4R3duu+hnXU8y3t0urUdANx
         pRKVtrA++QInEcq4tKcXfJKKqn4Is4DqZr//ARkDHD6loEVUpPFM1cb/00562vyQxakl
         i9a1tSNTFR7gnP2aoYvrOE/xew0YoPq5sqDD/BeM4cSSpIkHQe5P/SDkXs3sXEXE1RUq
         EOetZgoy4SAIGygUWEmgAX/UVkzVxjGQZzrmAO70MdJRPJIBPmXyypHFOqwznwQiyTK1
         0wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724398; x=1783329198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v+4KHmmud2JbAIr0kznde3AKTH3HBGJUAAvtWZHpIWY=;
        b=MmAh7j/LWProqL2lY/FxpaICOfjJ/J9tGsfx1+0TwnIoJXlYgb5AcVFuCC/A4jfwiD
         b5sxSsB3u74FJ443GDC3/y1+EHJszm638UUi8cRMmANWDLoKK3NrabzgR1t7qgUwR2st
         Eqv1V1XjeHKbHbs5pfopmjNcagExCASnJ39OkPSxiiec5t8rMP3sjdGsxx6ZTLHjoU6v
         6nxg7OvsmZDTtEymKotPIJN+LmTKLQRiIt07c+nfVASwlXCYl9icqPrf50miviMJYi1d
         YbtNPQwsqhvnvYZa6v4xE7isgjjDMMUNJ2968qoQeadHbooVLt/q2BmU7RSn1bGeg1a8
         IXZg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZfXcnsLhbCocyIe6gZzn++VR01FaXhTbu35hXV5T29/6t6h/98QkpyiiRXDv2tWkUFEovBlR7uDlpUJgD@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXi47egRmJBJd0tgX8L11NT8qnQ3lMeKoIV9cQGj89mt1YTr3
	nd8CqkWoTwfamYwV0AFf3+pFdfRdXO41+5lRhKQ/XnRIAZhRbHUrur9hb4sU8NIGQkxO3V4EmLb
	kiAXFfIh8tyih8ddRNX7Jo/5pN+iNM8xWobVIkooIf1+8loK3pMowOFDDNROTa2WmLT8L
X-Gm-Gg: AfdE7cl/MoH1SfgpqROyqlXsLY8VxhgnmwDC1uL17qkqf1LkUDCiZ7VC/QMJ7kNklgT
	TKTanCdPxFEHSCLeKaYlcg9F8TrVYrFCD5p5cPPEFRjZcUXxelj7ANJlwGfLtcBqpIMQOV36FWN
	8ylpISEnt6S4U2xQIjbrtA8AbwSmYmkMpFNO3hsqWznQJ1jbXTG1+P911cLkUpdt2LJMjpn33Cm
	CSGMNkwO4i+s6lI3IaRk41dNjhbnec2RCmYCchk4B5czgg+H3OgggOoQ1ZYMeOSjYJPAkgNaP5u
	h3ghTzP763A9nIhQpX6BhS2FOJAAGpkIjN7iadhRaSBwMm+J5YJjlW19HnIbAYT3tSmqOOBIcFE
	4XoXOOq0/HGKeA877YVj3AJsgiwLS8CKPAfubbCFU
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398877985a.54.1782724397506;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:915:fad5:90a5 with SMTP id af79cd13be357-9293e5df82cmr2398869885a.54.1782724397008;
        Mon, 29 Jun 2026 02:13:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:29 +0200
Subject: [PATCH v2 06/19] powerpc/powermac: use
 platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-6-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ig8bPnwIF/mjSMvpWWcGdfQJeYqm2NUWFW1h+WHRo94=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcMDhYRt4vSVXRm8SXMUBqWTN4fu9NU0CYjk
 RvsANfN67iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DAAKCRAFnS7L/zaE
 w2NXD/9lRtVJg19v8VXQmSDry17OwgjxIADNStd90IU3BJymBaFn6uKZlSDyZNAN61Sv1vUpYbt
 gBiZxsoOwplweM8GutmD/BJ4zH6IEJMTok8pVeRaVr95QvimqKpAltLt7gILbF61IqVety3vnd1
 ij3JBKhpmDwxAakI65pteui/qIS4c+gzd4hTRcSMc6FP6wrIWgiA8PU4iQRn1O8jrO2fwKeIl0G
 g1X+9ujm60pPVnP2M0Hyk4UOS959i0RZuvrm5p6C6bsrc13KQmbqakL75sPmziGIKPRumLqWUCc
 ppKaIrOem114J+vdybIf2FJZbNg1RE4C+ZWaCjRdpimkp39y0fLLliI2lv7zGYEBvBnGgHglZ0H
 mE2dakd3ROg3q5D7/wKq7kzPGL9CuaHiniuR6jmAjxDDb/uLkQ2gSzR4LmrwyOrh2gMcRACavuO
 cAI/1JjBnuWS1rfCL3Av1cRlzGu7kl49WviXJV+CuP2Jt8roh9+0MyDDotAzxC6TP6k9C0iGw/Q
 HeTDr2r1C6sTpUzIoWxW0F2LlnG7VPkEfDmf/M09bcfa27HdRql+A54QzgbdrR3Y9gHdrDMQL9X
 Rdbqm4kG80vtQFKa8yhYV4YHJkNd+sPtTieuhhmR+XGDVwv15BymMtt4OytoRz6kns0PQy+M5Sm
 K9bZdIkgQUPvSxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX0Vvj7ckfVpvm
 PuXrU4Qh3fuKuJysT5wUjchP8d8GXToy4HECqTaeScCIf+HB5nYr3wJU9ruJD/jPnJUCpaLUp9j
 BmaBHmk2z4QR0EE0/UGHVJhg0g5Yzc1OEuP0XilpJem9gqqScxCKzcOEyJ+8ehQGmdAHMkuDxMi
 UjU0DlJ3QXWPFd4fMwKHx71j1Z3pjsRLih3fsGh4yeOwMyzsUNHPSsMhEOfWlJJamJYen+tGX+l
 Xjs0gUzCTJwrx/boIcU408W3zWY8c1TY06PEEWznuOJUqGfUDYhWoTBsyKeIdmJu1Aro5RG7X/L
 +BFMax4xWtXJaHF6ZeQ7xjfzV5fL46+H7hdTb3dqpInLoNhS+W1bASllE1rRH7r+nIpmHkGAJGv
 apXMV+uLfnLMTdqLxvFQLtQ+2jCQjLYKyrV7wqG6y5D2TlU7gB7mdcHIKDwZ9dv3ydvF+0Y2ilE
 iS5yqmWNGXuJXw4mm6g==
X-Proofpoint-ORIG-GUID: W_xS3CLu45ojMnZrSh1P39V21xaAEqkF
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42372f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kq0kPlqncbyAjjsh9XUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6KTVZSD8EDUV
 yZBEmfJjGmm5u6IwYJUM3F5JFvhprV2O8snJodq9vvF5kE+LtVGcIrgoHYf/BttDaAXEbAoX/qB
 YHybOx0Ji1q5/BnM4+5ORKEHJIIYeEc=
X-Proofpoint-GUID: W_xS3CLu45ojMnZrSh1P39V21xaAEqkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
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
	TAGGED_FROM(0.00)[bounces-114913-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF2FB6D7F7F

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 973f58771d9636605ed5d3e91b45008543b584d3..a175a32a222bab4cc7400f6ab6071f5630db2cb8 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
+		platform_device_set_of_node(bus->platform_dev, bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3


