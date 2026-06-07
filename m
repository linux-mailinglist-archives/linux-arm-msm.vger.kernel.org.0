Return-Path: <linux-arm-msm+bounces-111616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1dciK1bkJWoENQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:36:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF8651B1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IfvAqeMh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hXp3uwGl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 364D53045EF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CC83328FC;
	Sun,  7 Jun 2026 21:33:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE69318EE6
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868010; cv=none; b=Ne8mZ+x78QLvR0iTdtm8UR3VzDDLPNKpwvyTgRHyccb1QK6ruzSTt2m4ptTX7e/1ZTKQgQw/+uItCFqbR7DBzn+Ki6zJuIyLdlmOmjPhr8N+4sCI9wQPKmSUK5Zb/1bhk9G864RLar7HSkIGe3MxeqU2ABRkVFSZGH8aTO7YJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868010; c=relaxed/simple;
	bh=5ElUVbocQ0iy2D7k4OSQYGFJA4wuG0p7RdSU3WVG4AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwcwI0T8rX5xXd6vyVGQSQhpxeBn7mhrahSDwNy9dCf0HV1GGX1C7djM0/18GFvtnktBfY3Udkfzp8wy8i8dH8wE03GIrnCUlvzpUe22/v3f4UOdweqllv9JKW/ZoMJTzLAYEjSAwahxNIte2mmbXG7+QouQoD2bW4MGCt5jqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfvAqeMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXp3uwGl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Eku4I827094
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kiGy/JVajFIukktw5owJydRTv8D1sE7z5Bd4+V1lofM=; b=IfvAqeMhQA3w7gsk
	5Alk4DF4N0JH0KwTuB3eXWzoXmzNinLzj0ClsiwjPc+guvwtFneMRSFBh/rc0HlJ
	NvtAmvIguXP4FqYMxKAH/KhnjfxbJggLaeNf/X2q8W7elFkbyNQqoiFhDiDAqlAV
	555LxiXgU/VSbu4ZsUcN/MCLKMnwSd5q/NyBK2Xg/SUW5SVo0q6Z1ubwjivrJkOH
	r/DmXRmt3+4qzF7dtcDoSinzmEyq0TLJvKQ3AtdMjkG8IEOYmYgs37j6PG0aVNY/
	O4tfdbm5fliyVoVh99RpkMAK7MOFKgT9cUbQxL+GnuI/HThJKdGh4sEYzXs7Cgx+
	4au1BQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6cr0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cce4f4634fso118057616d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868007; x=1781472807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiGy/JVajFIukktw5owJydRTv8D1sE7z5Bd4+V1lofM=;
        b=hXp3uwGlxwn3jG66A2iY9JM00sR3h88Hn+qafC2hNrVd2ps0OiNxquxM9tkbHOQ37q
         rAlSmtjEeuUoHlbrsNCrDIVoTPeJrwCRIveVUF2zUljH/8uEZ7PpiiBBYBbJqKxR+4FR
         CxRx6nifBWAy1XkohgTdQTWM13ILIfXF3wi3zJEYfhRMlnUv4pjT6Uvhn8xN04fLL67b
         +/WtxomJvs4Qw5IEt8XxdeK4GRPd21Etfx7M10kz82DDrHlNhJX+e03XeQFegiyXeVSS
         dRJFHM32AeQ7T7pNPu0fekRMes+amBMPFqGtstpKFagMKOD9a76glU0OP8FsHYh4+K9Q
         Sxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868007; x=1781472807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kiGy/JVajFIukktw5owJydRTv8D1sE7z5Bd4+V1lofM=;
        b=iqAyB0MXQmxnWpT4HvYY2AJueti4XHiKNxdDwlzITi0ujCdNj8vWvdVbew6Xe8h7Wo
         pxkZ8QbouYtzM/IbqbGfK+BOe4cxGt37s6k/EctVMDVu8LUD2ED8KVxNuftZTnHSgJES
         aLsLpr95+qOar4+vvqSmA4K+HlA+pn0YMDHMTpzaLaKf4/6lPkuqHxJxl2UagDYV2BFu
         Hs1vEZ6bVnwOPIEOUyyxffZezJTdHhFBoVpuShqXAc1jP2pSfKzfKy8vXQWTwlEkm4Bh
         MFS8Uu3Q6YG1F6tslujB8CNk/oVGXM0hc1vGrRCH2An1JTIylLJa6q5kdSaSu1ljSOOp
         kOEg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y+G+llmHwHDnt+ex2/WCSsKwbvSK97EcN6NP7mhzWEA020oPj2I+HFBmbR8eIWGk8/gmpiaFVkReSlObF@vger.kernel.org
X-Gm-Message-State: AOJu0YyCV9v0z2hx5jg7Cjh8VD5+NVSpCt7WF7yx3TfxKM/1ILYi1vr2
	HMtM6AYLu0tcQcFHkGijoN+83C7HRG59XlWJVZGudu18d6cGbZfAj6xdDzUn7QCEcuH5E5Yx2Oh
	KzOTA1ds2T9rWk87BisGL8IE1N12BYTxF6L3gtuDgFCDZ2xbx5vwcD4S66YVf4pakOf4T
X-Gm-Gg: Acq92OGaqun74hV5AcGllLzcQd5ll/e96BFfAKTdEi5ISSjqAKh/YJtQ4sckiZ7y4pH
	gy83rX8cRDbpU53QypTo9CGx2TnRSjFjiLNrqKQ2k+HpcsYPw+Q0YGuKXtw2dejtUtSucVaRR5m
	VrbSJpDFvEl0sIamWAeEttdAEYu9wrM+aEokWOF6Jbm6eKfTwfEafJJdKfxyxQ8h53/CnrS6XQk
	vqJspV2iv8a7wGHOaIkUeP3uzByHkH088CRyASy85758+NRjn6GHamYfjqvlYherjzU293X4YqN
	yU00mNYQZMcQ8byAOTj/hBaPdh2m3Vr1Fcr7glYqwyUfNfAmE0KB68ostbOlD04d8segegYdDQ1
	Nla3cqhDtEn0XV/omi8eItedeP9T8zk4AgRYu3kcIT8kBNDyGad+6kwuDJDLAOEbq/2iiVUeFcb
	CA6H0QRddVwcOgyYN1n/JjyKs2+A/K4eqHKYFNmbJuFctSuA==
X-Received: by 2002:ad4:53c6:0:b0:8cc:f135:52af with SMTP id 6a1803df08f44-8cee6134a06mr166005646d6.24.1780868007526;
        Sun, 07 Jun 2026 14:33:27 -0700 (PDT)
X-Received: by 2002:ad4:53c6:0:b0:8cc:f135:52af with SMTP id 6a1803df08f44-8cee6134a06mr166005386d6.24.1780868007134;
        Sun, 07 Jun 2026 14:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:06 +0300
Subject: [PATCH v4 5/8] drm/bridge: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-5-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ElUVbocQ0iy2D7k4OSQYGFJA4wuG0p7RdSU3WVG4AY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQyj+mOsk53KpLOI7BgWch0S1P0qlexQHVj
 QyBxAnUhaSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1bHPCACpzwkqWwBmlm3hEBRQEaLNtjJ4ixNpHz+KFuG2tLcPBqwnOTCnIWKTokmxQIPcwM6Yp2W
 FWCul8g8831IzUI986tYlkGuykff9QCUSRsIsPrCTqy+ysd2/VPkR3DdSx+f6tdj8fKuZBV4Kaf
 9slQ7JyOtsR6OGKVXoUA1eDX24qdqR0dou+URi7qC3Wb9svooTtqeJzkyq7+ZJIAm2/uA2GGUZS
 gD7AVEXZmhxRv5AxbmsrRsafVW+M+NDNDVuU9ThbFwFnopPm+INKpB6YWtHza1daXidoGdVeEbU
 C0VC3M7JQ+P81XsZRBqgXmDKlXRIeW0Qoxh5bOs3chXnxWV5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a25e3a8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNiBTYWx0ZWRfX5vtoDIH0r5oY
 px6Yq58JzkZ9/QOU5QGUSE8nsnordtw76JJSabyCK/Rgt9Z4XGZOfCTIg8duVZHeTXKB+1L84QU
 fPv9EfAu+ZB8vU/C06WdFU0Q+nIuF8NMtd4tD0F5YGu0lM3V/fRLUSKhr/MwuzPK16nuYLV2CT6
 HVEg9YQlx+PojOQNd16Q78Xf5KM0t7ig2MUZstOeHpgr4Ae+J5F+kuFnmSbzvNdCanX7KkoOmOZ
 v/lT7Bs/a8T9xIgXJfNu6L5OALa2D+l2wQzhs3oZtJdak2/XHLV5e4Lmw3mPGB71pYKX9Dm+JaQ
 JQwx5YPTjIAeSKKgAIMR1Doyvtdjyqyin7UTYkJIL1x9F/qb+K7Tvv7TKXn9LJntzb6vLhbr40x
 1h/q+HiCySqe7MNQJlKLCztuldn3+WFIXX3UDj3K7LLvUQvxGsAJ9T9w9G43jbwPjKMypm5vdwv
 Jjrje+gALH3SMZIR5rA==
X-Proofpoint-GUID: 5rLW-U1nacn90V2ULR4mbDxxbWG4-R3k
X-Proofpoint-ORIG-GUID: 5rLW-U1nacn90V2ULR4mbDxxbWG4-R3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070216
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
	TAGGED_FROM(0.00)[bounces-111616-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 10DF8651B1F

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 9427cc2358ae..8cb17bd0e238 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_status_extra extra_status)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a34643d3ddef..8f7075fd2aa5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -150,7 +150,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, extra_status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 55c0601df3c6..4aecf0ffcf75 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_status_extra extra_status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dc6f33809ca5..c0f6a8ff9b99 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1514,7 +1514,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_status_extra extra_status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 041aa026ae2e..4d98e04bb511 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -43,6 +43,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_status_extra extra_status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e306247ed8a0..d02d432abde4 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_status_extra extra_status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 6a5edfda2ddd..9c4c88024cc5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -615,7 +615,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_status_extra extra_status);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3


