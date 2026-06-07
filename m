Return-Path: <linux-arm-msm+bounces-111615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qTPLEizkJWr5NAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:35:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C89651B18
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VZFyBLWN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A09lQJ6r;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE03D303DD3F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43FF33262B;
	Sun,  7 Jun 2026 21:33:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9631815D
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868007; cv=none; b=axa28RcJuZM/gOJcqycOR0OgQu0SW4LVyZSHMKCAt3hHbVa2pxAeL6uy32W+q5Ft31HFMUOuI0szVeHLpVR6h8CqXzKYzpQrnwY7sYJLIYfILkwq2W8chZu+KMYU/A2emeMdAkCZcFdmxa+m/SEGvqTDEL/vya0V62dJsdNYpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868007; c=relaxed/simple;
	bh=Xv8OK5b4aegzohrbDrEYK2LgkMwGQ21VRNuRHpj/5us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmtnS49UyB7/u+8g78U+KYE1i42J7cwfxpKWjVVCVTpsI6QeCz+7tsa1QT/fvwPHuw4Ysbg+g2hI3QKAgmldacWJWhL4RmUSDJNFN9zAi7fZ8jPVAVfjH4VuFAntT5fTYBpCwSX/Qw8rLmstQwJky5rGEexndNvKKnhhzL0PudI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZFyBLWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A09lQJ6r; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjZhb440015
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=; b=VZFyBLWNd/Q1/Gt2
	R/3Q0qddH8uIz4xr/Vi2dwaYYKBDTMYdvFLyKqfGmTVm+n7b3jJH2ZVadg9w37v6
	oh2t2/rZ/7+YtF+E67j3kAzm5mA+HdMmCv3vcKCY3oIFyZWYWuvQpoiDSa0h4Q5w
	CGj5YXzNnx3ltVgeypqCiTOMGXalehNIEhlnCzrP6Q/AOo5sHwwXvugiEY0+hbP1
	yBdyPbQX3JxgQoNIecF4tfvIBjtiKMFIE0mO34kHVtmPczqZcOweNY7XCAUDMwUG
	69UrqAZRwMiS9Oovk3Q+8cAfzjbDKul8OzF29C0OQPtMLOKc1QVnUATkfA/zCiYf
	x0rK7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwaj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51772325a64so50268941cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868004; x=1781472804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=A09lQJ6rb9bGZ9zu3xTQtIPWOY9TzXLZr2m3eJ0d3HDjpFZSxepEylsZC10vJvUNjM
         2K6qKej71+8X3gVxJxnF8zNImPDXEr5l8D4el5bbIwTXJm7qeImYj3EQOMqi2jRPYQ/K
         I0ChsUu+1yJwRZV5AptAHu8qm++obfiA89lq1BUJoDXc8P1sQ8WkPctyhliiIjran6I1
         pVkJ3r92yjvRQ6rv34cdse47fsFur6CUHogMC13wO1WX6NHaNEFABAqMGXYqot6w565B
         +buL1l+dUtmHJgei688cooXmMDw7UTAWjhcSBqDq/w76TnYFUay2iAUrFYsSS3o7yMgo
         zUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868004; x=1781472804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aqwCeGiS55Vf9HMiIq5R7znG8Y1OhJ6NDQ7vMB6NUdU=;
        b=NNVElATrI03+ouoaI2jxbu9aCkU4JcmjAeCmZMfeTBBVMvbIt/j5yA1nErLNCT+oTz
         lZlJh33Gxy7wTmG6cApnD+S+F7zsDhJZNj3sY6jwb7S8eHw7WvJeRkN6HYLXtHJe2hMV
         HulKBITIfXDtBDJL3KsGNwHTy8f5UySiLG7rWhGAgmjx9hUF8OwAD9hoxIPL3mR33o1Z
         3Yigu8sxwHiZ0EZtACdALPXqGzlqKSLeY1Uk7vhmuEtUJqNErseHOCYX0zQk0PSEJB3o
         1ko4BaM1nFJdqR1LmkLdFdw55GF8yieGaxS6FONh7qqvzSvswOeG7MeEiKE2A4BgpOeC
         GSkA==
X-Forwarded-Encrypted: i=1; AFNElJ/ADwpntbIXhoPrZGhuroU2PFFtcEqW3i+Y/lEVjruqHj+LZxJKNB83dcgu6PNk25wojotHM629lb9tAlmD@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkFLk6Dgxo2U66+m7gefWKbl5hrdcmmS/eT4olvp8+utwWD7O
	ov1q3MSeYn9ypcv2ecmj6v4TCsTYk7LBtT5cGd2ShFzTeRJU7ShTf+buyR1mrlPRVu0i8TFdPPr
	oyP69QV/6jnDti/9PtGcgVkSlVMt0NY/rk4cSGvNOqNHO4gHyQZEldQItwEqeo+S4SSAU
X-Gm-Gg: Acq92OF+4tYzWHURr8e/CbXnfW0mPCjYgNzhdegUBWQkbaMmeDjQEGzE4IQKsQGzhEI
	/lsdFooOu50u0PLKVtF+41+SKvDDm+BLiFR7xjDX5MlQ8p8u3eQZKoPIo97vaSewQDxLQZfd4O9
	Oy1cmi/L2LG7rxpvdEt1/JPf9Kfvluzl5u1P0nIlNV4tDtk9hNjqF64UhKvIuID/FfB6/9TL5Zh
	yAWeWkwlpOO6AmsSzEFfM/XLdWwe2gLeM6m+IYsf1VrSsvDzz3SIPrtC3snCwdYnJgYFHC2X4dB
	0VwVMEtFi0ofRtqpvB1dxy8pQ6IQGumilKPtM0BNWKEFh7r4Yi/CcCZcemCimkOgA3E/Nd4c2Kj
	c+7kXiKgiazbVNoufZSybVdE+SMELt6Y/boNUTu0GQwnMNf0lFY5FNXcGUPC/Qt6v+aUaVh0pmE
	C0xoGoGiFpozSP+1zrsEX2AY/+qr6zM/kN1k55mO97U8Zo7w==
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193812481cf.36.1780868004031;
        Sun, 07 Jun 2026 14:33:24 -0700 (PDT)
X-Received: by 2002:a05:622a:20e:b0:517:9157:ecf3 with SMTP id d75a77b69052e-51795be129emr193811791cf.36.1780868003426;
        Sun, 07 Jun 2026 14:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:05 +0300
Subject: [PATCH v4 4/8] drm/bridge: pass extra events to the HPD callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-4-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
In-Reply-To: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xv8OK5b4aegzohrbDrEYK2LgkMwGQ21VRNuRHpj/5us=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQTkKDpqt97cyPjjeSFT2syRbXebSWwlKv3
 9mydw2N4yiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1QKhB/0bt9RHhoBHoeWzG982WH5dV54vogSpgf/IUDHcvtgk9lubK9mayJlYBeFGJ0ZIBUpzcs3
 jSDS3jSHxob1NPQdfrE4CuJxL1ttAWQ2ltEvFK8DPvdxL3rlQbWb+3vJ2wBhU7qo/SpXd5LyLzX
 z3dy6ikv1Xe0oxmdeOoeE1pztaMX9L2npVlthrH8PJeArW3Ge2WMtvQkWZiPzykgD2tNH67fE1F
 Zv6WdqrGj1pz42HnAvlRjEQ55aEtrGQjtIoM3K6dDw8hDMs1LUS+1536p77CDkRB/FUNi2mmaXy
 YqZSic4Y4eDW+mUWyoxgu1gPNfex2LX4ve6q7jqYnwxwmFhU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX6CelGwFHyI2G
 bFy0y0tB4fCdsA+3hYhM6vUUrPqyN7WGp/QPKfAQB9dJJccBv96szc6CNG0Opc5h5Cuzr4q5dQd
 f7Xxn4YXAb8xjPxDI6m/Go2lTWwDArvPd24uEiL2BVYu+ebStVGmXSWVQUd7uovZo/s174E/b/H
 +waiUVxgbAQWwCSiUgkHXf8t50fykgs7xGub1kUR0LPSII3375VoXj7yl6hqhtapt1WqlI/eYu4
 L7+BGU54AhJpjAs3ECrXs8zBXTgBAga6H3fjbsrUch9Gz2AHA3xpn443CDogGMBP0B6vyAmQavg
 vsChHiAdKC1KD64VdPOtc1o82ActeF/m2E5JuiP1e92qVj143c5bMu0I9CxIwA2fOgapF20DU5q
 oo7qlgZp503jvdu8WPZSFcf22jQiNbHgmGJsuRKvY7BEqSvnLwhiIHT0lVnG5n8cIwgpe0ObRnj
 MbWZBjGOdvvIrQM7TYg==
X-Proofpoint-ORIG-GUID: FWVo0iqAmvxqQmqO_8eY0-lgJeCCXUyG
X-Proofpoint-GUID: FWVo0iqAmvxqQmqO_8eY0-lgJeCCXUyG
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e3a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=x0urvBsf9yKnxdYdiaoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111615-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,bootlin.com,dolcini.it];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mitltlatltl@gmail.com,m:nikita@trvn.ru,m:yongxing.mou@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:francesco@dolcini.it,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kerne
 l.org,m:linux-usb@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B4C89651B18

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index a237c65ebd69..35df99b02c9c 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_status_extra extra_status)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 729b12b67470..b8e643cf1d4d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -505,7 +505,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index bf4ab4eaf269..e2eedaaa3552 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_status_extra extra_status)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 046efd913064..a34643d3ddef 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_status_extra extra_status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, extra_status);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 84e55db5c1fe..3fd3e7bac588 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1445,7 +1445,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1513,7 +1514,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 78b0d83ef2aa..6a5edfda2ddd 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1260,7 +1260,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_status_extra extra_status);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1578,7 +1579,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3


