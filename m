Return-Path: <linux-arm-msm+bounces-111618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dzmJOorkJWoQNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:37:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAFB651B3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 23:37:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ed2MZhcP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OfpXRdol;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111618-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111618-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FAEB3051ABC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 21:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC33033262B;
	Sun,  7 Jun 2026 21:33:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61F2ED872
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 21:33:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868016; cv=none; b=NyFTbqpakKlAdBEr87sdD2EFSQ4lMYZ4NJD5n7MMyUQcSoKPcAeOgk8nDeGOvHrXUWSge+iYujhaIE4W61l+2wYP3NtQH74EHgdBSapSsmIpMlTwIErp/Sh5ZZb8WNV2ZwOyXlUqF3BcfErW38MZS7zxEdlapUemc7zEBXpLUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868016; c=relaxed/simple;
	bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQGxVhxcfYuCUaB4/rBo7Ngx2Y1DjYhqZIe06nnbI7VMa2FnzOdYWFuFDr2WvZSTMxyBOxWNh3Hv7d1arzfX/9O/Eqjn6KpqxK5OYszuSGReFZqknz3L19vYLIZcw5S6bN4GNUE206EvGi9i6i7P3ov5DV2l0U7r2ckRXBnPBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed2MZhcP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfpXRdol; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657ElB2q797551
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 21:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=; b=ed2MZhcPR3ZJGhm5
	+YO16MmNxuN+dCsrIyoX0dbNtKYdE+mXIeUFaI5m4tL/8sC4JDvTHIF+iI/ZKfTy
	5tuPR0kjUDFAN4M/bj01EFAbZmD1vXgW33IHtqdLaKD8+Og9HFpTiEPk6p2rhC3e
	k2QsiU8LYLCa3Uh52T1+5W09iLZykr+H/ckInlthHNkXhnAD7TMu95/MsU7TO+2H
	ka6I5kIsqe4BprbPkA3vl05DmALsf5IyHe1zEyVd6pK1cyEgQY1P1P2Obs57PNDE
	f0NkV/UYxpwp29Ibe4Qt7TgTH/q1wyqQb7nmlqPwWrefKljAe2zwI+rDAhy4Fzcl
	VjPJvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf5098-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:33:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517582695d7so88116671cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868014; x=1781472814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=OfpXRdolAC9WJsUqCXaF0Lw/fTzqZQ6NnIqtI0JpMkvfeemEOCnMHwVh4msFK5N3Cg
         7pcaZY4IxxYuiM0j4A6PE3uce+/ze6QPriBMb6wrxkaY+UUjAjgnbH9I8IPvWyfz6s/W
         olKC1u5tes6bqmTNlDEShJyVq+hzaV9k5mHT03H3OKNgzCwYbeEvTav1ImZfbgqmquCl
         8r9Q5YHLIsZjqZ40wOldbIm60zrWnJ8E2vLQIU5vyAgaWM4Er2UOcwHic1UjfsfvAyxt
         7krpojNC7ZbdbecU+TiX2oNFKVMO5S2UlTszvmuGvfV38uAX2FfTaOCM66FnysOhSSAX
         VuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868014; x=1781472814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HhevlY6dk/ftxvio6CBL6QbAFSSp/a5ngu9s7xr+zgc=;
        b=rhmjr6+CEX262DU6LzG4Z5raPNaMTYKxADUT/RlllngLP9wShhCesulDc89WiVcnbv
         BDJDzJRN0Fd8ovCC/LSBgkDKUc6U4KfxH8j1Gm51yTYKGDi1MyHydXk9D72zikda6Oor
         Lvv0SbZ8ws6g/csrRFC3zaPAogCnG+kVyIFx+N59irVinZyJrpfo0QKxiUDkN7zzEV3Q
         KSRc3lr6auTaCzCVVfRU83riPDhaeKAGHWkQXEQUw4pINaDVSCBR8c89xNk0EA+w7lsB
         WC4YRcNuzwKv9bVFzrXpIQ6jmu5LGW0joo9VZg6kL4wmdoP6HiqWKxJQACvVo0qQB4Ds
         Uu5w==
X-Forwarded-Encrypted: i=1; AFNElJ88fh/fGPydxXbuKBHSMEd8jFpeKWTMwBsrVfy8KrQtMpfCr80CMWlRUW5uUGa+J/qDtmBysN2rHOO6C3kV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkq7ICOrO2bLXeAW8CbMbUuhTJT7pL2kmIogyuMGn3n4Afe5Ri
	NOM0bL8fmDtwBEor9LOW69tm2QSZeEb1rxVNRKIcqJTTxby3Vd2OleBvfY+GxcoBLlOC413JwVO
	h36ZCYFUTdGY0mw9qjkmr8Qcs05ryq62hF/c4zHe8wivRQWGPir8Tu/ElnvzIWarNfAwR
X-Gm-Gg: Acq92OHk7e0TtGtimYed7Tht4lQZylEMWZE48CF7Xb3qvbnVRrx8M6TE8+di3Dxm0qb
	D0DNXBG/Y9BPxtej/Kcyv/hbjHh+g4yd/qZZzpXRPR3cYG1pO2L9TJgW2bI5KsdLNQJESdGsWmL
	kLTkEdpFMUvaI7a+jeeHlgc+SFHc1TQ3qqmZoufSATqwGUKJgDbtG7kGBbwwBqbABH2aaAGGAeM
	UsPCXMyVWKai+RYlq6TuhNmRb5oVFTI6hSW/P7VGfTZgOivnCDf633JbQAlqZ8Gdm6CjEJp/j9M
	9F17YlexfcbyVgY7nYYl9Ac9KR2kFqzqvrADIlZ2Kq4XVk3Y625D6kj29Inol4TZpD04I/4ZW+l
	K2M+70hKrbPzKTVtEmJM+GRB2Dr7/RTX+ycLIUisGZdSycp+XjE+uR2BKFz8/gJTrOEIjB18io8
	iiEmkvPRk8NvJzsdV3HNYCSvvfz59X/enPEp3NJeoF0ngOEQ==
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694881cf.27.1780868014048;
        Sun, 07 Jun 2026 14:33:34 -0700 (PDT)
X-Received: by 2002:ac8:5d8d:0:b0:517:5879:1e2f with SMTP id d75a77b69052e-517987df585mr128694481cf.27.1780868013602;
        Sun, 07 Jun 2026 14:33:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm40374041fa.32.2026.06.07.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 00:33:08 +0300
Subject: [PATCH v4 7/8] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-hpd-irq-events-v4-7-30b62b335487@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMohNnP615sOpE6ZWKg1trb/KrvgErHGs2zP2ZkYPtM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJeOQI5tl/0XcA3tgWGBDfparpRR7p6oX7Tvus
 qwjrqzb+oOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiXjkAAKCRCLPIo+Aiko
 1XWXCACmNj3CHr4O+YRbKUG+T11qRjlO3v5XH4k0gj9GScSSKB/i++PNRfIVaB3JOvEoD/AYHrm
 YFUwGw2fBFT2Jv2Fhyilg176SDLOp8RsHVt0LQrKTd3iVzD84bkfPw5YQRsnoC0q2NNOeteuu4P
 oNZgIAB39IsrY1AUoXDu87QaI9/TPgg/T4uL/reYnY2d84fLwma0S1+Jh2/lbnZ1SDxBsBxpeSE
 e6BfBudjneZilPPKvQDNmThuUz1M8q6khvqmx+48G+tdedZN45pveTW7QE0GhFJ4QlRiFxRstqG
 Gz/WYDvc1HTnwPXv2iuBiwsSXHMYqAaiEHZoR0/q/qODETsN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a25e3ae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: K9VFsumLIrwqOfOQFU-oS9hz4Hlx5Oy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxNyBTYWx0ZWRfXzf7dG/enuG0j
 3VyTbFZCAf9S8FsLIiNHwnO1JZrOW4bvLQ5xYPQ63LB8rRsJrIxq2e/SkoK9j4QeZf7QfMwqCzG
 DWYcx55OfOMRsAQSKvxRuAoKTH1ju39HhJ1D2DIka78G5rf2nn+jpJ/8hQeydS0QTRCnzb3fJhH
 W+KWsjUSoz1VgJIrxB68C9gKPpOwKLRRflxdTvUigWyNvOTlbxfd8tohYxvGrAlRoVQP7b20UgJ
 oq01ooe4EECZ4/zEJVkmwX4+rvk9fcAfCQ8dNEzdSKuCZfgJTZLAGvL1wXhTlYDd3tPKEnWcUZD
 ivqF2BC2BDsdnxlYI2r6vEuGTs6dbpp+yVYo2LYKTINWK3kyyj3BWW039z9KdoMYhNWvbR6tCkB
 wSpio/q7l9ABFrqaWginkOE3tl9VrcIGXuOjwv/tGkBQsdjk2il41c7KC7VqmUM9sDXUM1+m/2o
 xwi06UejhGpnfn2EH0Q==
X-Proofpoint-GUID: K9VFsumLIrwqOfOQFU-oS9hz4Hlx5Oy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-111618-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,bootlin.com,dolcini.it];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:adrien.grassein@gmail.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mitltlatltl@gmail.com,m:nikita@trvn.ru,m:yongxing.mou@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:francesco@dolcini.it,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kerne
 l.org,m:linux-usb@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:konrad.dybcio@oss.qualcomm.com,m:jernejskrabec@gmail.com,m:adriengrassein@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 4DAFB651B3D

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3


