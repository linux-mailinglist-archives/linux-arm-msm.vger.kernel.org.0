Return-Path: <linux-arm-msm+bounces-103797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDqKABdf5mndvQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:15:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FA5430D02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2543434447CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FFC30F533;
	Mon, 20 Apr 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dc56aiY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQ4WrYdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7B7330B01
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699114; cv=none; b=lgsusXoi5BCBpAPBihPfqBUi4GgSINOjDV8dvoPF+I2Lo5+lgONVPWgatR6urfR6gbcbQzotf7CqwW//ZdhrHrUkICikwLnfj3ManCAoskWoDkXL/Y4pXE2wHUfmsq1MHP5KhYiPgmNqnY/VMRbql5x5C+hdPIdmYbomMMlkYQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699114; c=relaxed/simple;
	bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQ2io351f9i+UCRTh8Dh24SSWSOqOuVTC5rvZvWrzt/NUF5bbKD84JEseptZi4bMPRJuvwJVC3Oas68YP8tQ0hHH4xvykTd5J+uDDlZnolHA/iimOVDk1GAxIzQ5+SV5zS0FQvZ9/LprSaDev/o7ZEFP58d+pRQXZJ72I1FkJP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dc56aiY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQ4WrYdz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvOHD3015211
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=dc56aiY0njf5+Kcz
	oFQPOQ91h2MpZ8CmCMDVtHY8m9nILsnRIaA/Vx977nx91Wmc8Sdbby+vw1yXj+ZQ
	wHQWbax935GdSPuPHBXrU7rOGk5pDGViPAHaLifUl8/AjILEK4gEhxvQJmOE4LIX
	QClHAFk3ltJ169TzNbTg/NDqkcItxlv0F8BcrghValOaZ7evTLLUVERglK60GuEI
	zCiFsyLirNRvOpbp/ho78zveMutmMh0tUrft3roSURDYxz0vLR7pi8YwA1qDJmG+
	h1Nxyq08VVabWRbbumHVDd2G//ZFhDUBpkbFqfsZLNZx9PBNyqVqE5TfE8GMnPvk
	a9aecA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuks028-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:31:51 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-41c08879ba3so7495198fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699111; x=1777303911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=KQ4WrYdz9XgXG0BX+UVJs38eUVyQs2/yqV1fQ0nOn02o553Z2z0no4lFx/JIAWcdrW
         bHtGAsr/1ID8i/v7xOPsot+ortlfWALzW82m44nlThuQYa5I8vK7lwPrFOruwgb8yfEp
         mvQHW3eYzHXiFTfG52qBgxOTuFF+bFdS4x4KF4R4lZOfiWUltqPUNa11lZdg5/Vt9X05
         o3MU6zpf6F2Deiv66ue5viqe3qItzK03DXciI1QAG9nqYYmRz3Izdg/EwvCVYdPD+PdS
         OY5QXaCsAwSYkz8bHJ4V4fpi9YW4jH+faxjDnQFg9CbQQeXcsscw4tBIq0LLZ7E8mMOp
         SmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699111; x=1777303911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=YbbRyiuIRC5eTiYUmDtROYhDnbi6MglO/qO+XyYVbXNIDzW6LbDp5Vle8BMin+fIlW
         FRSXB3zfnhMK/+VyRBVgnQWtFRzIyJP/3P4NvLR0G35izaEZFwVV37y/02e3Jq1XXSDM
         uvBQOMM9kUN02yKsenxlD61wcNodDaMQlMCFRg+MRwu1KKEk67Vjd7I3FQYcToI6+D/k
         5vBhYB+2jxFdr5KPTXsJswdqbl92zbprRap5GoeJCIonXrGobJ80E+gTdv4t3zqFbLRc
         3z5Y15xKgkqRjIi0vHZ5qhRAGTpcu7K+T7qT/c8AmUgjoH1LjXTBgnI8wa9UAp7xmqKR
         b8Kg==
X-Forwarded-Encrypted: i=1; AFNElJ94vro+9+/wSOHZNrjvuRRsBjh1omuCjiO8A6oZ7JdovH4op13EbGvEdWYqKwrFKS09NefmG410sdEPx55W@vger.kernel.org
X-Gm-Message-State: AOJu0YyalpR0mSC5LHI+U8/58ykmniSLZ8Y1Atlqqb2efspX2tTD5Te2
	UjR7W3D22nU5AGk+3i7P7H2sa8h3Wiyt4YBZqpIOMUiHQxnjSm31WPAtz1fwqE/4ebQ97s8jRiI
	HQsTN7TwnjdFpcJxxRpPX7hmmAl3xwJ3HSJQ2pzHgC4wqLlBeo/WvhDk7x+YQuNGxbiwb
X-Gm-Gg: AeBDievW3gloTGumb8Vm/qoBBG2uCNIj2LW/AXvglPaIcBr7p4xPcVRWm1U4vyiVKUL
	cVl8JGKZXpJ9o+3QWom3gEImEUEd5e9F/P5MHKYr1oXQXSqGItyfwsGFGyAfcnzb8Aih51/4KZ/
	QUhIWfKtmWh+BBqJEn4O57Uf5m5IxFMG2C3kem7F05IRZlgDxnOIPdKR7fvEiGEz8fXw4vOMBKT
	oeEpO4nL/MAZUaZKci3huGug5eKN0cnRFSlz+xv84QQoXfrj69V0kfrw4B8MoWVw5EMqsN+dGU6
	N1YoGn++cEqkGV3Rzm4J20YmHGa3i5ShiIb6P1FhGNfxkiBIxQ4dJrqeqaIs66SzNK+jxBAgp4x
	JWuEiTmpmk0LRd/pgft5/+2tD3ruRnwqCDgEz1kY/J4Kko0kWRrwyG20TQQnuzl0vMdUHR6j6du
	G30ggmtuxCBDGQqZsqt71ePkmvJNpfNSpm2zgMIpw1ylzn1w==
X-Received: by 2002:a05:6808:1a19:b0:475:be2f:c56b with SMTP id 5614622812f47-4799bc82da9mr6189621b6e.3.1776699110574;
        Mon, 20 Apr 2026 08:31:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1a19:b0:475:be2f:c56b with SMTP id 5614622812f47-4799bc82da9mr6189564b6e.3.1776699109639;
        Mon, 20 Apr 2026 08:31:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:42 +0300
Subject: [PATCH v2 4/6] drm/msm: dp: handle the IRQ_HPD events reported by
 USB-C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-4-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+Yztzu7z9UUln2K6NOXnBhWfvkJW3tKzoWyB3ecY64yK
 JZ9Obmtk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+aHLwdApKn4j4vk80fWZ
 Xe+zpj3i6mhbFtPpIdHZ5N7Y3qwa9r9B6Frgrrvy7z8e6hBpLvy1VO76FYfvd069TuoIK+W8Mi1
 C7imLUXYezym3QgPjmdMmCdrf2+1brvbBtF9aaosZ26HHZgkXriZoVZ3IFd4umhkVfU95gt3C/4
 X55x7+2t63sdfz2bQvyuvO1yRnOAV/W9bnzzAvxDgr+7Xuh7Jknnbh2lPb7tk8K83VDZrozMHGU
 vSmev/TY8u2ful4dbbeWppBOU63bDq3c/Lul4ndC6qLG1ammn3a/sPVYufDX/yWdl+/SvaV6R2b
 7tG0MJs3eMqbuEjW/yvDTjz41seRtS3t8yFdM+7VJosYAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KI7oUFwhzDV9KiwU8mK_gxAFwF2p3sXN
X-Proofpoint-ORIG-GUID: KI7oUFwhzDV9KiwU8mK_gxAFwF2p3sXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX3nmcrW7psESC
 eUroa2rcK1fiFPWFK5Vk9tN6rQJd2obui8MNg7eg1P6qraE6rrGirtALCASbXy1PXUoclXOKa9Y
 4WqpNAVVH85zRnUWJf0S+SX/svS/KJZrl1zuv3cDjmf+XnilFwOMlH20Hwo8clMFoQZAt0M7xk8
 8wMTehPqnd8RpnthMCNA4swxBA5r1DccN++qm8NBpP3K80Xav/O+CtZAleoL/HdLTcHxlJiNHJB
 DFH5T5FoF38Bm6AncH6Ytf5b7PT1DyaHiEpyaZY3ycZ/tDov+iwfqoxs9s1qAJYfAuhVtXtT6bT
 Cue+Jh00v02gv4mNEWy5QomHLeoB9xd/EeF0DsGM3mRp5FAqMDenzepIEs9MVv4AHDO4fwv8MAK
 Mcvoz3MHV30nANcOHwRY/ulVk86eDpuSpBFZhPwUZoExwL9UK/i9crjCEudqpVkuo8St722KwYs
 o/bXn4uMfFwMHDOqUcg==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e646e7 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103797-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93FA5430D02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3


