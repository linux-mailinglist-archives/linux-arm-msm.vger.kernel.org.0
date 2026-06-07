Return-Path: <linux-arm-msm+bounces-111617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ofFMKa/jJWrSNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:33:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47759651AA7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:33:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hn5CUgbi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IXGTdhG1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111617-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111617-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B13F8300233B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F5A32F742;
	Sun,  7 Jun 2026 21:33:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0849728002B
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868014; cv=none; b=m4cr5wzMY+Vfhn8DsOBKWeCPrRD6nlxfb8eK13I4u/ZzKdhf8/bRAPfox7UL6TBQ3bwC9RPfVjfyodzhFCsBhgGxhgS16Ruj49ZhMBEZMIOTbR+NXlDWBQ+WqvjQNA9m8sr2jnBaDGywXyeyNr2+4GTDJbRZlWtXP4PKO8jGYvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868014; c=relaxed/simple;
	bh=QU1zz0yugX4tikhrrDvaSfvgadApD+nFc1XuyjM+i64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlewyQKgWZ8WKqx/1puIbGkXvdzPjZYIYVM4y+DYEevE9vxDzLWJSJZlq0Ojb2X0V3Np1Jee3vVLFscscd/Ix8Y84fk7HHbRanZTx3HIKW7UhXoFHbIqIafrzk2MivpLF68MvxhIBdnh6wtD2lfgc25qvTzbQyeYtqEHcShSn7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn5CUgbi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXGTdhG1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkSws441251
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=; b=hn5CUgbiAJuLHwDU
	XtFLBR9mpaeAH1nUby7GCEGjmehu4jV6xB59t/z094qPjswb9dx48zPy/HY6rVMW
	0Vml1KTght2Z/yv3jPYj97Mp2AiYhM0S1A1b5TbxkYEbvt52K/V9RlenZMZr5nQi
	R8l5kPczHLiQONmvQP1zKltG46qXolNQAkRCHYIacaeNO9p8//I8cHq70nlaPhqd
	nVGOLO/27EgaoQsTCStJQhIue2tZjfnt87dJ/LOorZg0HK69vQJdNpuUs79Ct3lf
	GHaadiTeIMTosYTqmCassoj+XIiTQ1+gFJliDbhm/rVhREHzCcPnDuFPk/e+XPxn
	2ICmag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cwajv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517878a92c5so85636361cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868011; x=1781472811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=;
        b=IXGTdhG1732s7MNX0C9ekV5JT0fFWX4xdpLt61FPd1ma5tv+s2XrFWcJ3Jomsv1vkF
         DZ3Dg5Eku/FBF2FoD0Le84RKZ/a2Hlz9enMtF6MDMNk44zPRMZshMq2vXi/uUrNs6RNG
         RfUlBOzfWlVVGZ+1FE+XRTRnQzuPhpIednvgqebnSXAtgkNSAOwq7AgTtGyvNQXrM5HJ
         g75K2LQSGJrR2BO7ClusKrvvKMiNOJcPypp7ZWYr27k1u/euFDgkU6xu2f+iq8vLgkCI
         zPnXkmH3IXeliWqCO3Wil+s/GMsdE2s5U5z/kZ+OFUaxfglP9K6HwS7ddKYmKIa5N5MC
         ouyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868011; x=1781472811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzWM1TZRG4fIsuvgrGBJ02mMzsQCiM1GfHgBBstXKAk=;
        b=VH7O54cYvI1ZK4r57PCXlUlHtGBMB6bUl9iHQ9Z3ObmjQEKiXgzfD+h2VGI8jbh4B4
         6uDifDZoLp00bV1ioJos7PiB/ymjFa2+aVqay6x2+53KdfyMemiz2jKNC6ImlKddHawS
         xokoFyhvMU9FPgipeVb1rDBBWSUtCOf18rx4B7ZYTgGPUuSFV964KUdZYpBM+X+9JQHT
         rxt89Jsj9LxitP5spnSnI6kDVszuoWK48hQ6XCOrPxhxzay22QrlhmIbyrr9o3Lw4CDd
         SiSL8lrYVuaYcDK4dFGSwypvePKnCw01FpwWEZ7Fob2sshwRCUOq2l2Hd5kciAhJs8+T
         Dr2w==
X-Forwarded-Encrypted: i=1; AFNElJ+/2w5YKxMtivpdG3d1KbkxVNEIuWtur40Z0CQZrhy94KLLRZzFoAD13BUG9GtTH4fdzLZoRWUodBd7VJ6O@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLTSTnj+Lb0SA8fbVnWOC7fmudOu1KaLKwi1kZ556LWJT6u1m
	mVGETyAE4TKrvrRjrFum4whHMHgURd6jTXMUV99KBj7EisaeUbIK3k0lfM9MiuIJJWh5Ver0OMa
	XMGbjJDNwGhtnO79chWcBbB99IYSWwHjxgn1yVqThBByLRUrqPfQQSmP9FRVCn/0IbJWg
X-Gm-Gg: Acq92OFeVdW0k2cH00KhMXWbqe+ehVpTC+Ir49EPTtHxrh/flSjZKc45LgtMxGFrEN6
	La3ttrwEka5Hit2uxXRB5VNQW8hJk8LYAryNoV1R/66b9B0PwqdFHW41t+tmOVIiNCs0vMnqwri
	g6sjwcg/wiI4wZ9QaH+uMRQ16yEtuHS3gOtXvbK5Z0sCM1EdAPX2FrceKVOHpJL0jiHMkIvvjuC
	r6/WoEzzH0vWhZJIVPUr14Hhgpdk8nh5Bw6fYMbY+Z0wvkEcVrFHcNz60P1vCpS5XXKI7gSw2Jc
	tvY9b09lJiJeBCj68euUmPyxAof3fPf63wf3YO39glkvc3rr7f8Osfje6dQud6pzaTuemp14aKc
	sYYTSeeB2QVtJxveejtnsXdgZarbRoONKyrOaSLLtY2zJeH7fZTtTNtC3Hw3E6T99wCf/bfYTLl
	857cYcXf1MfCIOHTwPenfM1FAqTqLNjZoo9y62W6LndOl7Nw==
X-Received: by 2002:a05:622a:190e:b0:517:7b6c:4459 with SMTP id d75a77b69052e-51795b8652fmr197936131cf.24.1780868010819;
        Sun, 07 Jun 2026 14:33:30 -0700 (PDT)
X-Received: by 2002:a05:622a:190e:b0:517:7b6c:4459 with SMTP id d75a77b69052e-51795b8652fmr197935631cf.24.1780868010370;
        Sun, 07 Jun 2026 14:33:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:07 +0300
Subject: [PATCH v4 6/8] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QU1zz0yugX4tikhrrDvaSfvgadApD+nFc1XuyjM+i64=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQkeAHjmwgf4TWmB+cq7J3apXFq4vK/4Y/t
 1PsK+1kRv+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1ViTB/9NfpVnjn43UETfojgpSwReE0dmwB3DsDHqHJqEU8ojNNa4kPpaiCJU81lltCqj5XgErdr
 rCaglIXukNpl6RYq2cnOGXZDBFtEgA1NT4vKlAyKuMYlmZz0pWVp+FHDFuLRJ8tRA9L8J190qw8
 BO+hYy1pXLBiA/M32oxz8e8bzTDXNSD3K8dG6Y4JaoJige6+C+SFHd0d05ZNIvHff21WqKgWR8K
 Jhgy/Dnewo698WJFRxsEqUx6F3RzyX08UbeMeFsVfwktU0USS/tH60kTsuxsPpyB5yREqjDzwQ4
 m7VCLAA3vhAoRAt4dZxK3oKdlRp2MTrv7zcL8DXzOeRsT3eX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfX3zgqE2WBVWEH
 CMDgq2pMDx2rEKXAMwpoV4A/c94p062ecnpdQFpaP7HrHfIiUG46pScww3K+lrCZWrSTQeULo3E
 LqmGvELmzRigV7WJrNsR4IEOjW8g3iHlBWCqW+Sp8FP6jPUmFDbBzSSgQG6j6hfolTBjsYF3qLq
 h/F+xmkPILriEdnhRw//ks1yGTw7efJVLQpRI5tNGKin677kAXNYQBQ5Zcei1sn9J4fwCRuFB/h
 jcYGQY3722F7At5RKGw3GG6hf0gXKKGBx02oa2nqLbIoykvEc8vT5vtumG1lp98Ni97OMp+0vXr
 HREsAl7duceMKC6dW39kQLCL5mheZ7vlupuImR5L2PbdlZ/kiMy842r7dNBCT6aKUFbsY59noa6
 cexNmBBSesES6tHtZMlCq2+mJePXJbewrDx7fa5RX4g6WostILK9AcsiaZ4XmV7CJkUvcEyZBbu
 aPhtDyF5FFVtCZXtD6g==
X-Proofpoint-ORIG-GUID: eBLkUjult_sD4BwLpgyM2bfnTMlBEm64
X-Proofpoint-GUID: eBLkUjult_sD4BwLpgyM2bfnTMlBEm64
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25e3ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kFJzCQJ8v3RGWcIHJrMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111617-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,bootlin.com,dolcini.it];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mitltlatltl@gmail.com,m:nikita@trvn.ru,m:yongxing.mou@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:francesco@dolcini.it,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kerne
 l.org,m:linux-usb@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 47759651AA7

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0f6a8ff9b99..743d8fa40dc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1533,11 +1533,12 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		   msm_dp_display->connector_type, hpd_link_status, status);
 
 	if (status == connector_status_connected) {
-		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
+			msm_dp_irq_hpd_handle(dp);
+		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}

-- 
2.47.3


