Return-Path: <linux-arm-msm+bounces-108953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGW3BHXJDmoACQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:59:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF95A1B05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0A5A3096A13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A4D3A5E98;
	Thu, 21 May 2026 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8AqoLjg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acXJyXKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E023B9929
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352680; cv=none; b=g02FO3XagXL05bq+8XZkTJPXujoUVyW0gxdxwwfxZqGUa2aTbagjlFU+QVNnQSHyUfnMs1vfd0yUNPiW13ehQp31mABO36QtxYSNXzELepiE1o7DN1rZ/00902wJVb17eVZA3kdBAMED9ShNYFL2hCw/fRHADj4CvQyup3Q0K+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352680; c=relaxed/simple;
	bh=6OXt4TN+oyzNJeMucuDRbXfo0ddns7kCLrcZYoYbhVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSTOq9Tm4j3y9+t4WI4ny+TfOTI+wV0vqpszP09qt7/6xmy3mw/WXPVuyCuGbkWgCDtXpFhbkdUjAeLrxXuuwUB5z28rlECdlif8Oufht0i6oiNFWN6M2XKoyATJmP/TBvT7GB1aLM0p5vqRvFaEe0V/UAsToTtl0L6xNRB65b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8AqoLjg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acXJyXKQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6mIQM1798612
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=; b=i8AqoLjgiIkq7GcJ
	lsjiR0I4WtIojYGqtVtwF52fR6iHWOrGT+oCUty/GufZbKg1DhFJDfWVn0vJe+k2
	ofk30wp/PmTLE2YxNMSy+M499peRN3Ix32hLCyKX2PqL54mJ4UQ4B7BapeUCkf3u
	oQWGLbTVnQaQhCzmq+IXJuEIC+nlDoW9US9uoJvmozj3/boYnXNd83U+R7S/w8eu
	SKRCBNmW1k206+0pxOW21bjP2ZUCfreImjrKLvY1IEZhxLn+IDe+EL44FFAr/BDX
	Q/yvzzbeIQnIWmRf5SYA6WD8oIjvbPeAEmAhwYIQBtz5Y+zD0dr4ThCpzw+Msqui
	9un7Tg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4220-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:37:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5d6bb45so79661311cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352667; x=1779957467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=;
        b=acXJyXKQ2Lz6rVm8wyMN4C0idqEQ5xDkG7Y46Yg9mBY6Lq4RkS3OAjmQw51CuOTbgJ
         T6s5wj+fNr7eFcORoTvUhg01ySKxlO9QK+nA+Rsmr6WRihyb/U6G8Wr+UbpHFS7aPl6c
         ZjoHIli9W/fAn0c//Y77dsqwNSTYppvTBCRoMZjA24qZiy+OudP74GrOtekwYNp1eDlD
         oIhQK26/TDkMEL8yTeIYj8Mq6BNd1OBjerIbbQYiq/29eYUCR2YtSORYXWj/GwDnf3qW
         F1g/iRZjEGcK6bbqSoJYWIDTSrp9Sy0UQ/1kIKIJRbI80+jJ3Y3ZJlsiu7u0gUUa5G5L
         YuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352667; x=1779957467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RXAOBdXd+1ffOftB4RMKqDkV2t2QAsqWzgaXmcfa9Sc=;
        b=iFQh7tEAFVldoGMN8GrEmdPQGQtHKftbpEkfOyc2mftPbgV4fUUOAJFo0h4CSykB8I
         aG2QFH9tYNYmLuAppnTA1NGaR6wbrl/56fLwdi1fVHrghhuhRFQ0wmCydGhVk3WViPjx
         JVJgZh4095Vgiwz7lljJP1FFDt61jQHbnQhiEtd0puK69KfIAmsw0seP/JpOKKNVSg+v
         i6Gyr+pPxrc0A5cYekRYYD0/vZQcDvDcJghZQu9+SI1nksJu2L4BqvvbS9eWrXNGe+b7
         yDnG/tcD2fi1vpp1MARKUB3XryX5vMRRTPwpiXnC5/ZDn8sr5Asoq1FA1CAaQBr8vY0I
         YqQg==
X-Forwarded-Encrypted: i=1; AFNElJ83lvoZQN2Zc6XpM2kZeDrl87NKvAqYrtlKpJvHl8NN4fd5B/xe7JRXS3G8xaw5jz33CQO6C69VR+nLZ0jG@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQhQD2dHKj74uUUTRgK/+VrMr+H5cmQEmmbNNDa+LJbxhuJoo
	5lEeI8ULvHMrXZ8DpHd3CxhKaRE9QVFF4nIsrW6P5J8UuggnVUIgJ+XahnCdkTVib1Au+rjkrvH
	ot3G5eLvJbMfm02BYJgJnBudLV4TBhBKxzvwRlezj6RaA9xm9ZIlo1rBhIVywPPeK8jm6
X-Gm-Gg: Acq92OEIyyf8szk238163mO73chu0oMw7JONLkWAQAwuFyS24OmcZ/j0NlvASaFq+t/
	M5/6EpJ1FFAGR/u6j26D/ktTm7GWyaa1x+fpLPT8j3lMqV2Rla5j1iVgUX1gsqIn1U/4ig+bc1M
	v5XElimRe5b9X/dDm8tcuqglQ5e9ADeoCeYuc170g8l7XEtK58eCXqJ312LwKKHonXOypC2E83L
	xRJpgJ9euMyXa3WQLLu04o6CSvlqByNFW4GAN3z68YxhSpSVLlqnoNCdKWonN5lQ7mAX/iaCzWZ
	fMKT/NUoUEiMBAeqiBYrRBQJnqGWDgNC+wQ/3ABs8uiI1etjx7pQQyvjO66tjpxujmSM24YzSP0
	RnuQ/p8G9a21xAEMhaN6DncHibGepkqjIgXagpTe61NTphikvOjg=
X-Received: by 2002:ac8:5a95:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-516c5489cadmr25663871cf.10.1779352667096;
        Thu, 21 May 2026 01:37:47 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:50b:4b3c:7554 with SMTP id d75a77b69052e-516c5489cadmr25663371cf.10.1779352666534;
        Thu, 21 May 2026 01:37:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:36 +0200
Subject: [PATCH 13/23] net: bcmgenet: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-13-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6OXt4TN+oyzNJeMucuDRbXfo0ddns7kCLrcZYoYbhVE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQptve0VPcHpfn+e8CyDZ9KcfXURx6hUsS4v
 XFGh941uXeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKQAKCRAFnS7L/zaE
 wyw5D/42tCVAUl2uN4fynwbhyfyAyJgpscqW776mT+6TzShiQ1UGxlOeIgCoWTORPdoxwAORBgi
 PPFLgP8bYFnocTq4h5weZ5vNP/hv2g/J9Lmb/zt927UW8vXxtOottjnSBfTm0u0U/GJ8rgc88T9
 mpUOe+BfoixY7hzEMo1fIyF3WIaT+57oPDmyTNSED0/c4zBG0NtfjvfR+gbfyw+PuIfqaYcqeJk
 tuNS1ok36qM3GOUcpctRgzg3Gcj1c+Iom9FxP0Bxk1yxox6RfTH4YztKKst7Mak64vyUiHCbs8M
 cE6y1P6VvOYN9ijA/4JECYo7OgRJXtVQi1bQi2sofdLn4SkbV9PZe5fLALG3ChG2z+5CM6DLxnM
 ZTA0eltoOvmsMrE2KZKeX1cvWCqDNo1HP2xCCVBojp0pJ8mz7D3yTBHU0hPu6gxae8kQbUK/6PH
 xu98r6TPU4z+Rqt99oM/SiN9eDH0DJrtNLwXfnG3TvI60P81jYDEL0d3DAeVHomaowjoVNIef+L
 drTrKdaF+coQ6GqegTUdvOp7QizyZZfUuFufo6Io50ykK1jKebxa6rHDPedMyGM5//lsygsV7ZP
 qrz3VtMmHLMLX+azIV7Z/k3f6O6HZOx+2rpYF+AVt8E7wZbqRkNX3nvyQt+iEqoBKw3npAZOhCa
 vgpklhyoZwDkrzw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX9UazfDXmLBEm
 ZrViVIYcri/+qadT695fT3AICljFhtaTutrCByWKI8aIWwU+ydV2X5Jjd1+3bhsgQqe4kt8fGck
 9At2bsZldFaGoM+lvB6nh4unHng7SXpMYWyR53tqQqQ2UTemdQEij1FYu2ASHQ5CVKS0k6+rNcg
 4rL/bnP7gFGGgdUNhXSkr9hOxqKuNRnjJ/emKfKKjezBqiA4mBnTSCD/4gPkXVlrj2sIjuGugd+
 qGkDZtfGK/rErno71QJKvUP115LqVw4o0zFXU0HWv2aMDbXEIS194Znt7QaG5p3RpVB6zdEC7Pa
 qkCfb0uudIfurH+2JlhpmxniaGgkI1SimsbJZoJLHLFmVEPFJEtLWU+lO+WuH7wzUfh9kqln8jh
 ry39fhFxFj/ajlpyCNvxCjk0CeaoVLdbcZ0xAlNTMg1/d4Y1hKE2qRNJdOePuCPPXERlPC4Qk0+
 JQPvl2Nc3xLZkqsww4w==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec45c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=_l4veLwUkFW-k-pZneUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Jw2WwoJ36WAyq-N69CSH-K_iY7VhgiS3
X-Proofpoint-ORIG-GUID: Jw2WwoJ36WAyq-N69CSH-K_iY7VhgiS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-108953-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81BF95A1B05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index a4e0d5a682687533a1b034ccf56cdb363d6b7786..451b23a039cebb777f356f64924838230052dc45 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -490,10 +490,14 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	/* Retain this platform_device pointer for later cleanup */
 	priv->mii_pdev = ppdev;
 	ppdev->dev.parent = &pdev->dev;
-	if (dn)
-		ppdev->dev.of_node = bcmgenet_mii_of_find_mdio(priv);
-	else
+
+	if (dn) {
+		struct device_node *np __free(device_node) = bcmgenet_mii_of_find_mdio(priv);
+
+		platform_device_set_of_node(ppdev, np);
+	} else {
 		ppd.phy_mask = ~0;
+	}
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3


