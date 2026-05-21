Return-Path: <linux-arm-msm+bounces-108943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOs8KNrFDmqzCAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:44:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754D5A1522
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FBE730DC4B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32D73A7189;
	Thu, 21 May 2026 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6wMyh9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/1J1mnM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929C3A4F5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352638; cv=none; b=mnr48lmc9NGIuzup8zbJJL0QcS3OBrfEVcURx0RgCCFo+CYYRxwrIbTr4CIFnGCL6ZTv7eKnxeUxinwgbYcFpiTxAV4LHc5oucH1XXHsm5K3D65vx8q3n3KVglgjFBDFEFnFL4TYtRqtJVD2BVZbfiNAebedB2n1/CUDWBPtC+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352638; c=relaxed/simple;
	bh=Vq0LogXtRhRUgP5LIHiwXCljDYw8Y78nK8IIxKqwPs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMkG26IugQE1EfsV6bEcRmv32NL2DFMiqg5WLzO9j8sabZ5kOQNxKO9N+umYP85/HYiQ0watzlb4JGdvos1GaTBK+33LZfEOTwxGQXuyKxHmppVUDYguZ4w9t0LC/F+hGBneNEgB8Vru7OFKydfuYMj2LowLot7qNqRrBqZmT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6wMyh9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/1J1mnM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L62Qpk119071
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=; b=D6wMyh9GV2fJQ0Zx
	f4KBiA4rm8ahVwft1szX4Pu9Nvj+9vf727ddYumyeLD0bzMfrAE0KZ6oHgtfqiSc
	R/Z06LkiMRARLiTkVZikUVyqsKOmr9dYD61LxYNfvUzMQJF4/TSfkh+8Anc6UMkV
	HLqDvBgreugoJt7iZIgoc+bYNdvsOfM7F0O7wQra+ECBQo6ps2B/n9dILSJaBJqW
	p9EhZ5DCZ3JyhQ3ALihI8Wq49SQxDUpWP43KWy0dtQQSSDgN6tWae6KgXXih3U31
	TgBtZjBrQOT4elKE4UaqnfddJYpqylEtpJQzRFXRHCI4S6eoz2u+MlPmc7GZCH+M
	ehUt7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c16v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cdd89225so286061cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352633; x=1779957433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=;
        b=O/1J1mnMmvTk2Mx1H9Uogr4rgM21EiM54w1AToZXKNQaV+8SlFIoqiRBtN7vxJWe+A
         ZMCOhiT+OB/Rco9kS1Er6nlyD+eLpWvTxq8pEk91u0woybwSoTZMIHoRhjLfCnILbKUz
         2JJhK/t8kBdQTNRNjnXmM29gt/d6gXXjCtLuX6lhqVWj/I3huc+jR6j49K7dlUBU4zhs
         aXftcrsSwSI9z6Cz+2GWDar/0lQ8jPLuqftOVFoRL2j4NGGin7OJ/Zzyd8bt6jH953q2
         6AGuiYwjUmnjd7PSnUcH+VpKQcnIgeB4zvr/I5yoVmXUoEjCrEMQPBxpJdtQEW7TTuAP
         /4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352633; x=1779957433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=;
        b=Jh6SJHO/LZ1YONo8qxy2go6FU6GxuITWAfuhmkRzXHm+2I5KmYBHFTDdZ/n+pELcbx
         QImiD9ixQVed2iS30ijpqdD+GTJFI+T1MPuztId8W8lNNEOLFYs2qEk4CF0Ee62usjI5
         +OC+1HRXUbBkfwz3E+1mI/+GaauShnMfXHPi4qUKQ0x2ej7tctF+JOK4gZUhtlifZgPe
         f0QLs6WjiV5lrrryM3n91UQml3oxx282WFqy+M3QQwa92dfVkumC7VNpfMg00K+sP2LV
         ms5TzvaDrniW3uik7GbUmBfv4HJlKUJtVpwRJEQL11J1EatKNBon+77lwuL9rouNC14P
         PsjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Oj+a0ZUBPHtKONuzeoulx7egrXCh4AeZulYzcadpx/vtPy/+kCw60xRSKbEPBQHydnsIWnHqpjbXiRyU9@vger.kernel.org
X-Gm-Message-State: AOJu0YxBb/dLuLOtnDaViPLDiSAuqCq4OQmNOa69kfitAh8elWjLsIHN
	DnLFmnv5ElDJDzdHeeOzU5lAnRYXT9ug0hooFndt11YXu0tJQYdGNYyEUQj2nWTpHU33aZB12ki
	ckc1o+Mrr4UucosmJOO/GtiO9aS3+35p6hgr99cUcZg4B60MLGAnj8g9RoAUuBlTRfutD
X-Gm-Gg: Acq92OH27EZ3rYZUXqRfL6806WZWfa89lvKyV9OP94Rmdtgow6Gp5AYEeJTuWsT+tjx
	ASFEtNaCTaPlb5y9I2694GLHckKTQkrX2XhEzsMYVIHoUJfvcxfLhNUflTY1krPj84MEgBUwumc
	sB26ex4L7yfOx9JZG1WxX/MKBZSaPxWela4Pu1O4P/kVmxWfJEHxdiPxWXYKZY89EkKbwd6l8Ft
	r9ud6+vOWB5v5TEs23ToQBtjb4yhOevphw5nZ8AyrVuiENoUiAradBFGiQDptZO2E4YDkM1Dj+4
	3aeV0xQxvl+OtWy/iPLlYDxPzMr3aXlpQCht706t/7r8LVcAWVaXJRvJE+q62oYCX44ieSWUlJK
	hoDGimHzqD91kb67f2YEY1CtYLiiHY0LDtanup3VYdqae9swpLd0=
X-Received: by 2002:a05:622a:342:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-516c544afb5mr24558471cf.10.1779352633336;
        Thu, 21 May 2026 01:37:13 -0700 (PDT)
X-Received: by 2002:a05:622a:342:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-516c544afb5mr24558211cf.10.1779352632852;
        Thu, 21 May 2026 01:37:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:25 +0200
Subject: [PATCH 02/23] net: mv643xx: fix OF node refcount
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-2-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vq0LogXtRhRUgP5LIHiwXCljDYw8Y78nK8IIxKqwPs0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQeyipWeVwe1gZ+CShmDvyxkCw/2ac+wigtc
 yDfWrx9B7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EHgAKCRAFnS7L/zaE
 wyD4D/96Sc4XMe6BqcGdeU5XMrq255mM+2Q9i1CnFxUGJYNsHRGALjwq4agMpWWID3Xz0IFWadP
 f9cYo4zSx5YrZJ3NC8aBSnDFEgSpaoPv3vd9dR2i8safu4aQx7wG82O3RVcGqAtL3shTrfG+ziV
 24wzbVP4UKjc4kcw0m4sVpF7kpzz7f5uypJ40k4tC22VMdLsN48F2nNloAOonMA1CRtVwaegwPS
 +LUzSr8fUVE+Cxwfhm9M9QMbPPQV+Xz+9D2lIV7JibUmMSyMlUkkC6W1WGY+EE+y164ZvEPQUQ8
 pTOt0/CtDCCs881XvieaOneXcOv3CZKeJfbv1pyGp4onPZPod1ja8YYi3oKqQoKx/gipqSIa+KZ
 Q/NIA268QzWCrxR8+M+BFyghvPzKE3QrjxrAPc3rcoL21lH4E0UT10PFSpkt6UoABVUDQdVTK8R
 RrccYHir46M0LNRd0CQvLxeHCuup/uV62AYyq1es4haCqR+Sd8PD0hE4YjipqixdOX1d7vlbeSE
 rgk90YNfpnJQ3q+VJCtHjTCKFzSuzfumxnfLZNPUSMSvUO20eJ4PT3Lo1yq4VTiixwQqm6Ev6wg
 dUzkMbEHmGi4j5dxcRVozkGO2hBgM1870hwtdEda5YSqgm33yqUq5FDx8pa0vrhMYxaI4X/Iwcc
 +Nh8Ur4nvc/+Ing==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wrIGbDQY4LRIeOalV9Mkf9TGOjCFDpDM
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec43a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2glh-Q7MoEu8omcI7JcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX5nlsjZexWWPP
 YlWs94XFfvaU54hjSOiCRNBqJdxP7URsvwsscIK7pJQR4/QXrwESQXqho1jF9Vzhnf1pAUWgWMq
 cCiJT8D/T78mb/H9rEBFl6mK7yECVKiuAOL2EUYcYopWEDDwGes+XvbG1YDzowWOVFYywnPSE6u
 ZrT7vTz/1rKqs8o8QNNFsbz8mDJsd/bwayg6liuY5s1DC+zvSIdXqRI8HprYP+3pwjmDlNZ43ph
 sJzKERJUyYlTgPwawCmlyycdLwlUixoR9DLhMQUP16k0sQW+PFK39cXCJt0c514T9wzdc9UPOej
 3+mvkdW6Uqhf0Kv8L0pJcl9GgZCFuTRtEX3z0Yq0T0outQHo0gK0o7/1n/zkgxxBXcfb3TDx+iG
 EU0lSkCxMp3s326lMJjv35cl++ViWptob+WTNFvBW1assh+yMoql1XvB6lxh9maSan6mmdJ2uty
 dOqr1WSGPlCBS5pMYCA==
X-Proofpoint-GUID: wrIGbDQY4LRIeOalV9Mkf9TGOjCFDpDM
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108943-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5754D5A1522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 76723bca2802 ("net: mv643xx_eth: add DT parsing support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index f9055b3d6fb102ebc695dce9c6c8321889a78dfa..1881583be5ce2e972fceb14c2b8348280c49ad1d 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = pnp;
+	ppdev->dev.of_node = of_node_get(pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3


