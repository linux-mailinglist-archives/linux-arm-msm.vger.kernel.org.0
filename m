Return-Path: <linux-arm-msm+bounces-111611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dQaZNJvjJWq0NAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:33:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FCB651A53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:33:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L2LfIuzb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MJbEVsNf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111611-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111611-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C96FB3007F6D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFD6248F57;
	Sun,  7 Jun 2026 21:33:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232164A8C
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867993; cv=none; b=OavRU4g2iQK3bkPlX4YQO2XHZtQVgUHNSpsLOXS46/ARHrUfcjGdddUlhhqk8mtwpAVjBxdPYONcWUqnWGB9Zp9r4YnkWxyT5XWi2pU7KJMwM0JSnbE3R6K+ADC9Lbue0Ma7mBNya0CplSQUBPs+IMR0prrGemuKJoHHhha5oaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867993; c=relaxed/simple;
	bh=j+CeXz78taySpKFMgaVaZqhcJr+l+n1DMDxWadehxu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eGEhVkcA11H9bvQO3P2lZ2pwGXij2bGQIu2PNYMP12NxBiDYGmL0wgQnFx7P69Urtta/8nNMub4N+M0KuFsMoqJ2NqzMThbxPjiZC3zDF7D41m9pEHMzNxl8iL5ghUFc5mLHz9YFs3AVlYhYL0l3hw5XTQBnhF3udmrtHUl43vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2LfIuzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJbEVsNf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657HKI2f707678
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jblTWUHfA/HboctDjWft8F
	Ef3F/d0UhRTWL81VYIHP8=; b=L2LfIuzbnOz501Gk+Rk8aeBP68DsRrjFU3/BHl
	4iwIYq7RaKcvKKSA30BslfGIzkS0M8xL/5FYT86z9dQyCZ+S8ap2iJAD2DDCjehp
	unoFu8KeNWmwpVa4TZwPfT8bapDBSF6UVaU/6ic8RiriVb0UC6pc/G7+sJvi0ifx
	4wkI2UwyiXgG++GschL1OPccAmz9/h0o/WJihafTyzREFXGT13PdGVO6rcB0G/j2
	FX8wr3VXJFzWwmgItRk6bgjmJEvvHn6rBm/0LAi+Dgv20YqDyTSpLWlk8TTIaId0
	+ccaDAjWL0anasc8mq7ULrQdAeRb/U63J+guhNizAJ5pfGXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrd402-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so71499511cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867990; x=1781472790; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jblTWUHfA/HboctDjWft8FEf3F/d0UhRTWL81VYIHP8=;
        b=MJbEVsNf7TUj9ZhTwEjy7uZlunMssLhU1jOaVCv9sg61MOM8tLSO/2rbCS1Xp1SpQK
         b/TLejJY+CMtc/DzI2p5AknLBTcBdXp+ugOXeAd3P+jMJ/8p/ZfMJoXU5PVhCVqzwPWA
         64lzv3OI1XdTtN5hFNfjHNS7eC6ul1Z/xk/aRuOpsxg2kIndMwMcGQI9VesRplb9SRSU
         UDKf+aQhtQe/3SSkH3YOZ1OrQkp5Hi9ekPSlJlgbhE0qlZ63JK9ofprlFJ1yqnlsBydZ
         Nvx1j4FFBLqkhHuoIBziEXZxinDW9f6uDnn38fbMv5mLER3FA3tYkeS6k6o15v4q28jT
         QB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867990; x=1781472790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jblTWUHfA/HboctDjWft8FEf3F/d0UhRTWL81VYIHP8=;
        b=a4QexQp3VD8k5GvAQZRzj9MPqhiyUc0uH/6axetV7DkyFfkN6KC6Fj+Zqhtddt2Rlo
         lCtA9iQduK+q2x9v3KAQl8qt26SNQm2bRHq4sV7EqfyETHBjPFrPvkfa9kIn5g2XQs+7
         xl/PthQjBzbhfTkYMzBKhCHXv2gfFcpVu2XfyyiEfbHLIyZYnuX0spYo+vjHWZbb9DfM
         Rw12gOBW/v1g9OkCS3cJtXeWFfgsGzvoeYDRVSyPdsE3uOOQyCwjiKPAi1daKawCHcVf
         3sLe1Vuz5E2aw2vlP/R8sLoRCDem3c4sZo6ULpAF5r4hxyHBKd4wPld99JVxqOlEsscq
         D31Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ng/nWtBzYOb75FBoOcJFAimU78IQGlBwxtxPUvUE8k5OznuI/H2V4lOtaLQi2F6BB5RD0bYv/8VmJL2B/@vger.kernel.org
X-Gm-Message-State: AOJu0YwMA6WYJ4wjZhGqsUJtdoVJl32PVMnBV1iGuLB2AnRxlCsCVW9Y
	2rjisO/tDSZ9mj4YqksYPMymSvxoZk2Nt8bCtBK+yzMd6az4zsQfvzP0twtVE8JX43tct8a0Wvy
	FwUgQdEEM2bkUcGMtSkRWJEXZtM/xBSyTyxEncZEeRFiK+GslN+cIn3jFQ1j8ypNIl3FC
X-Gm-Gg: Acq92OGVLsf9JPVWsrdMuQKeJVJPVPuIV7Ztk+5lrmX0jXJAuOFnwFzpXg5W/xSvpN/
	x2dPIVH+9W7XIiJ/HWl69l2wV9CMB3QYIN4tr69n17sXbamMwhujbizQuQT4gxNFUPqFoPKjT8J
	Y8SwnuYfzH+eqWaAJxfOioGIhdSTmoNQlqJw/+HwzL8AKgU6hO5RJrtevUkwozCfeZ2qnJd3NbP
	AC8W5k1difk24a4+c6s+TgEq8jeMVFFceDSZGTCQ/K/uzguUkMDBDUJWLVHJlEFNBU9+F793Wu0
	j0J/moqDs2dZCx0xiRdHBnFKk3foJvpGymM2366Lp3SffEh7yNS5uPGzxorrtGmz+QWzuAVNXa+
	LZHKbiXh+SB3iccWY7FmFhVLBiiKJlfF1K0UsMcQ3LxSGnKMhZzSm4L0Gc7VHf1Qf0OAacK0ZS2
	qRPYnWke28ZafezUot4prsD6qZbL3V5VqtVf86E5NoIJQnDg==
X-Received: by 2002:a05:622a:5b9b:b0:517:8011:3a4b with SMTP id d75a77b69052e-51795afce80mr169960941cf.21.1780867989978;
        Sun, 07 Jun 2026 14:33:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5b9b:b0:517:8011:3a4b with SMTP id d75a77b69052e-51795afce80mr169960641cf.21.1780867989510;
        Sun, 07 Jun 2026 14:33:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] drm: handle IRQ_HPD events correctly
Date: Mon, 08 Jun 2026 00:33:01 +0300
Message-Id: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3jJWoC/3XOywrCMBAF0F+RrE1JxtiiK/9DXOQxsRFta9IGp
 fTfTSqC+NgMXLhzZkYS0DsMZLsYicfogmubFMRyQXQtmyNSZ1ImwKBkggtad4Y6f6UYsekDxQq
 UZlUp15aTtNR5tO42g/vDM4dBnVD3WcmN2oW+9ff5YuS598LLTzxyyiiXiluurQIFuzaE4jrIs
 24vlyINkm9EeFOAfSmQFMHAWoQKN7j5o6zeFf6lrLIiDCgrmLH61y/TND0AV+Iri1EBAAA=
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j+CeXz78taySpKFMgaVaZqhcJr+l+n1DMDxWadehxu8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOPB+d8F5P2SnIo0A5TZpKhUphLa8Cf8JZks
 hO1jgGRu36JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjjwAKCRCLPIo+Aiko
 1RZXB/wM5Cz36duGVcpFpTg+7AChBnPfRCnS3e35NCwMw9V387AvmW80xExOATKDWQTOqT2RkHP
 FucdJGus1gNVFo6zeGGfrMkBw4QdH39zFlJur4zEvOohIq1q8lILqnD2IZIkk+n8BuweDqcvdIk
 bOpJgB4TQIng0KRTMbmFhEv19wfYDufGVnyATZfRUxJxSYCEI836vRuLGaC3x304UI68T+ZGf39
 FWT0yfI2wKDWeYX1XWZx2XOGrJkmh+MawQeR2r7Ot6rsGUph5B6vl4NPo9C7n8ahkRaixUrpBiI
 9j/i/VYwNLYSnamL2KE0gQlOPviFkgkRwVzWh7lXn/04XAcc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX68Saj5pd1BU/
 5v2XUFKyYXde6TOdYojhRXI/aUNUaqwSKLJFS1QIVaCGVnY2f4qj0P+6Fxb6uLylbf0pBG+sAo5
 kHm7XeYxq70NW1eYSneVknp0JvsTyYRWSAF2s5NQ3+OhWiBWFGO4m1fZfysDtqbdHNoY5I7vEiZ
 By0g1hFL62dekC4sq91zZOnr7ZW5oYmzqE/nweBURQm/kUmrMEoDhICmds+OjWu9+Ubuhltlfwp
 zbn0qkZsJozuNN1zf2nnhoJNy9p4eLXz27I4TbLCAYOwNGkTQ3NA4qHn76rT+01GrijJ2wXgrkr
 tz4JpuLZHsJP932sCIUo1BzrmBTv5BUhdAaQhA4o/reHg72VFlglrHVM39hsBvso+qlBT+CZJwE
 voWzUBZyWEXiXUAx6/D0U+GL/jZmfB/ByR6gk7vuBlpHUDdEbKLCeBRoI0USb7NrkJV7hUjrWQt
 msw/5Ig/Pj6LsKljeTg==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a25e397 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=eKQTCwoLd85be8zhlTQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: KF23z4Sx76Pk0PheR7zEIEz0_oRl1Xg0
X-Proofpoint-GUID: KF23z4Sx76Pk0PheR7zEIEz0_oRl1Xg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111611-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,bootlin.com,dolcini.it];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mitltlatltl@gmail.com,m:nikita@trvn.ru,m:yongxing.mou@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:francesco@dolcini.it,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kerne
 l.org,m:linux-usb@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:konrad.dybcio@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27FCB651A53

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (8):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/msm: dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 10 +++++----
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 23 ++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 19 files changed, 152 insertions(+), 65 deletions(-)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry


