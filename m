Return-Path: <linux-arm-msm+bounces-111612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LWWrK8bjJWreNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:33:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB17651AE2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:33:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WHdctld3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W22PYYbR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CD3E3019506
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582EA3128A3;
	Sun,  7 Jun 2026 21:33:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29EE2F7F1B
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780867996; cv=none; b=BkDqM18n2g/NPtNlfIdn+eo2Oc6OBcxCERJJU/kz64FzJxwtZ9ZUo2ytM8Iz/cl6hQBsMhk41ebSjdvyprYTzhKLMJFR0jaOPokzfsJWjAqs1wuJs8S9v0mK9cg3bXVPXIUtgZT1yyGxw9R1lWo1D+cqYvR44Js08Vyi3F9UY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780867996; c=relaxed/simple;
	bh=xbTDhi2tp6aIbxxzE2FCVTK2nYgOD8sjf8SKhUk27v0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/tceGVNfKlgaZbIuKCUPIR7ZSK9IsSeJbUhrZTim4USmU0VNcF6UR7dw5rEXf7hnWqWlOasGFxY54Wplnj4Q/l0KQ4dfKeVY1vtNEIHZM6pld5WmUIP+edhAXV2WN1E5oJTH5qgPpULss76l5W27EopbfqO3PQmfFf9w4YcdGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHdctld3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W22PYYbR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Jr5BY1051249
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nPk71TxUUS622Q42M+kOUQRMtPhEpU+4iMVusC4zd94=; b=WHdctld3N1fGm8EG
	mZ77MjfOxyfU5m6Xxu/TTYA61rf26sZ6xM8Wse22MDmtlbt4BlCk0DseZXo+ARvb
	AVN9QYUlNv+efr3KVnJ4tSnx0u2+19cMHTTewq+VRDVd3BDxT5ih7SD1s6agtQZZ
	96tkNd/f/LCBEJrkBDDCPz9j+n6kde5hd70Zjql90Y+zBBjzGZrAjywmcgoNp6RF
	8gFykOT980t+QyTtonKFzOS4G35hEK5x8QWf7jKdGWOsNKL6AtFdTvRg56NXMzpy
	e6J45vR5d1w/Juqmwq7KZyD8KKA2/YbyEdM8OsZrObgE9A717/2jPMCcfXcfewQP
	UFE/ig==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8vjfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cce1c3c26bso118984116d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780867993; x=1781472793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPk71TxUUS622Q42M+kOUQRMtPhEpU+4iMVusC4zd94=;
        b=W22PYYbRPWmeqh096rKyuOubpMpzwlsgYfCmapeywHr8B2AVpkTTtHog7LZqs+vmOx
         S1uXhW8OuTZv6RY5bXNWZzvSrnytGa6MuWP4qjYKNDPmuS7Kp9YT8POZHIy9j3/tUuU1
         vPHNt3/l9ySFR/88iPS+f4iCtUhODt3HgnRSHc7kq3xZ4iWHuGbmJnB30lkkqOu3rhNm
         LnQf+lyGccifWMyV+G94c8ua7sHFsQJe0JQSlWJcLrdDeDTgDzmasOg5hdVCeExQGuxH
         Z6Jol0iITDWG7v4AQgVici++z8ukgzuYd62XJ8SW82NLwo1H4NqfIo3OQONyy7Yj7zrO
         iNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780867993; x=1781472793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nPk71TxUUS622Q42M+kOUQRMtPhEpU+4iMVusC4zd94=;
        b=Y6jxgJCH1lajRXhElYL1zyLpdWtJgczHgAuNzRCDpKectb2KGpeMXv2NRsm6h7tkyN
         j9yr+RYaKz6gaIxXvOieJtn4uAqGPWT66Z77KoI+FGI2afp/HBERy5cKvNfeb3jBjdBz
         PuXRJy2Kgj/lZ7gRDwayGDKoKRtCxGlLhjodEwA3DndOElMS7jZ1Jsq2lqdFmRPzfMeO
         gAr74z8PCYPYhIIs7jcXkye1b6MYDcYqiGiLiVjJHKZy13feB2FAdTn3m3Y/n92JysVh
         e7W/NvB2DI4QRMKrtXFdKKLw8sRm6vIUO0lYJWOkxwW29MzAd7d6isoHG8r196fc8CFf
         CbHA==
X-Forwarded-Encrypted: i=1; AFNElJ86UOtQexosiSY7Uswtc9c63u//ri0M1nfMT8AkDZ5A3LA4fZVR7OoPTeku112Y/b+CvRSZOqq4y89sEaER@vger.kernel.org
X-Gm-Message-State: AOJu0YwutBby0wTZtQy6Y95dvRRJjWQCJbf7z+yEXhvglbFLUj7BsHM9
	Un4MAlf2GxrhCSvpa6xwz89RYony9LTtDS/amMU4Lsy0EMGG6NzyoVFU6MWZ+c4hsDb0LQdfDxs
	zC4ufBmZ9ZpX72Sqpm3DFcxw4MiAPMVmL4U4zKuIbuerQW8OrxR7wEBbxifa29WdCgq8v
X-Gm-Gg: Acq92OE5eTfIQ7iIcBHZGhWyf9x17ObL69Wmxu7eGgqQVbCMM9mNVBm56asn7t1SG0s
	i/Qa21tItoPATdqA+Yny0/wEw3934ZW3bjlHsT0MM8iBxy8izOXKLOHqIh3f1PbSSC1lDmviZxo
	6vnkJB61BjcWfYpTb0znUjWXUewgqShQHabTGYPbRDuEwF7enlHRpSWEp5CTvtzwTYSoz2/dvoK
	eBPxdtmgDtqQcveMMkpfJndDV1EwAvYSA9W2LWIBje8xaCBFAN4DI+k/JGR4DWmgE9GaIkj4Rrl
	mtWbtmEwCdNvh+XIZ83ylCTfsdqwUkI7hA2CVPxQ1nfToOwXsOzprIpTn1YjKxxWfZomNJIFw7W
	dNlZuW5fASAr/1Z8Aw7HJ7WfelwoKPt/tXP9eFmnTtioqifkOVX4N77cRxJa8amUcmNhiQlug+L
	fO4jnZ7Y4yfQLNStAkWzqHQFvfvOIV+/IBNTyvfLriri9SKA==
X-Received: by 2002:ac8:5986:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5179f434867mr149873481cf.11.1780867993204;
        Sun, 07 Jun 2026 14:33:13 -0700 (PDT)
X-Received: by 2002:ac8:5986:0:b0:517:9f43:4732 with SMTP id d75a77b69052e-5179f434867mr149872941cf.11.1780867992778;
        Sun, 07 Jun 2026 14:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:02 +0300
Subject: [PATCH v4 1/8] drm/connector: report out-of-band IRQ_HPD events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-1-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xbTDhi2tp6aIbxxzE2FCVTK2nYgOD8sjf8SKhUk27v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOPemWBxW+eP+MfHReYGxm2pBOMLLACcpqbh
 a+bnF4n5pyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjjwAKCRCLPIo+Aiko
 1VzPB/0cO0/y6RIZKyhdFY9GpP8e3L7D6nujrtjidCfu3o4XzwLnmrs1tMT0xKo9Tj4+zNlLtwh
 kmPvx0BwUsvO+YGd24mrwjlbLOrPIWlIcU6Ecew9+pKZhpdB/lE4I3dRkJAxkvntXeBy6wfyo/n
 g/cr9AegIwEsVDEXzAjz+ZU8bfZ3BZA35aYuHc68wKsjvNGU1VP9fRi8dTlu+3cUXBjc3mRoWHj
 J9ly8vXi/+sHqkb3wwVlLoHUX4+7AR1fmQNh+oGMXiE3JP8wctqmE5kw0cVaXSGRoK0rCHkGMuG
 0gvgm8tN3i823dYQp6fD8IcGt/EwdmMIPpTDIlbPNdeAl/JR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: J5yK7hD2iiEeQGv_W8hPHEX7SSqoozKJ
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a25e39a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=m8VRbRV2F-575zZTFkcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX2OrMrTLC1G/F
 tup+2FiD269aANKg9SDBF7vKGjNPA/lHAZ750wmjKcsokZKFmbfHk/wI+ik7lpXvTQ2RbH6UePg
 k2t5nZOf1s2etqVUKCoWrZN2jrZ1Rcy3a3HgqqPOvoK1RCIi05w8IIUOao+ETYV/aWnbl4VcJfG
 IhqrOsjOnXBfGQFAErmriJKQTqCeM4ZDTBBydxumBmHPAmmsy6k4cLTsOSrQdkLyYS6ZzDqGMB0
 znZAohO3CqZLLlR6RdW8ImJomaAzAD0kZfdaeHlOvtjrtu8u0OUnB0TAELiwzdsRztqDG4+7iyg
 gnTCpJ41GpbMycJP02UfIFN24T3TTSmWJwFhnrI+OqgnJtvFGytd0nfcUysPOgN9Ae1+P4uYsdC
 8rGEq0aQLGvw099G1R/KKnhD/lnW97O0+DAQqEbG+sWuQmUMWfLs+Z3w8l+h+VqXgopAu2swUzb
 HibpMGkJyZOJgKXom9w==
X-Proofpoint-GUID: J5yK7hD2iiEeQGv_W8hPHEX7SSqoozKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,bootlin.com,dolcini.it];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mitltlatltl@gmail.com,m:nikita@trvn.ru,m:yongxing.mou@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:francesco@dolcini.it,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kerne
 l.org,m:linux-usb@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,intel.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 0BB17651AE2

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3fa4d2082cd7..bb128dd0263a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3502,20 +3502,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @extra_status: additional information provided by the sink without changing
+ * the HPD state (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	struct drm_connector *connector;
 
@@ -3528,7 +3532,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 
 /**
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 263a89c5f324..ff3659b8f5a2 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
+		drm_connector_dp_oob_status(dp->connector_fwnode,
 						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+						      connector_status_disconnected,
+						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+								   DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+								connector_status_disconnected,
+								DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -828,8 +834,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+						connector_status_disconnected,
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5ad62c207d00..105da7c94910 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -91,6 +91,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_status_extra - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_status_extra {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2520,8 +2536,9 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);

-- 
2.47.3


