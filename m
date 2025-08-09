Return-Path: <linux-arm-msm+bounces-68146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED27B1F1A7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CBB87B79F0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 00:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B596E25BF00;
	Sat,  9 Aug 2025 00:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV0hx5sa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E1253F2C
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 00:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699753; cv=none; b=QBo4WMs5qfw2+BpalYcN9I1r4QyGWJOVCtNpacdxCCzlFCkjWIm7HtGVtGriLKAE8PcyXhZRBdaceomDkaDImqZ/ViOGRjDX41NbHsBpGaKrZuPxaBFI3MnMftKh9n1jka7q0UOs3ctcHSmcjLRuqPEwxNLoIfW4RIWtsc7/keY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699753; c=relaxed/simple;
	bh=4NtupbLbHXZJKW3LGWuziF6T3O+S2Clq0/ZFSk/f48A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYwgyvatg9eKfxaIvT+4bv6rYpePUG7RGVPEN4OuGBsA0mJtK60Ed7KO5JSBYfqcpgdIr3x4Mgkz+ax02tGZSgidZJRR+byzuFYIcMjTQPcorTPXMIdEt+TRfdcIQpXh3yEXJ0HhDRQAgD+mMrUPvfEAFru0RphqRJ3u35M5aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV0hx5sa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FSHFn012665
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 00:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiZ22avjMQ6yPSDZ6+PmnqKblqG/QInLtG55ppMw6bc=; b=LV0hx5sa7UOFHmvt
	K4N5be3m9douJyU9YeYoEbgSBnU50CLRN5ntDb/xiGsPfn8yJUGFBGERALz3hXDu
	IGN2WkM5Xum8J11P/Nrs/3PSjpOjNA2BSBi3RXmYsVqeM9p/CWd4gcoOGLAjTrF2
	2gFoRFtMx3nq1w+dzF7KRKwjhnzcwnViqADzwglvcdViQTZrko6SZvCcMIJVoIfU
	6FS/hbVwxSKUWuQlmlmbl79+IrcDP0vHoEpzVtr4hN3uvtFB5uE7XJ5mH6KwOoyY
	xw79v6+7V9wPXwP98nkt4cGc2e+lPJmhTNMJaEgJ4y/qTme13nhG8rkcznFptBGI
	ObMVHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybkm6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:35:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-242a1390e9eso55469845ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 17:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754699749; x=1755304549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiZ22avjMQ6yPSDZ6+PmnqKblqG/QInLtG55ppMw6bc=;
        b=CmArqTSwVZarLYizEw5okBrdPoRuJvV2J/kl3VloqT2zYW7C+OmL6eO9vntTM0uqFK
         eZdgrhW0g63WZxyS5g6rVbFxqVvOqiqNEvV8tYIRCrmRNdwNBqz4R5I+2EJtmYAgludG
         DBZBoI55qLuhnBuY9Rl+hXXWvJ/oY7x0ThSrLs6Fgft34bGYPBirlDbU+/ege1JAbByJ
         su+NExGAIAeaRdbHHF5lLtHIhb/BrjSyjpSuDVteMtDnSyZq+nXzbTWEYVPjtVupebRk
         m/v4qBmy2/zJVqSIByQV2FKPEwOy0E5imnm7vLHTD0rc86oAYqR3H76iq8HBPTJUOkof
         8LCQ==
X-Gm-Message-State: AOJu0YwWPc6mwbux6FT/efrRKsDkprS/I6jddWsHq+F+8lOhhzdLYbxx
	9STkgriu9lYOQLsypZ5O8H0UV+V9VoihIm/UC1TfjXsHewvmmaMu0iXoz2Qm2cMBp4o3VanuP/L
	DqGx5s7FAsDXcCyXzRB54/YefAa78wAFKpc9lUzOKAStda3c79buujI2mulyR0O4re8tvM1NSrK
	HE
X-Gm-Gg: ASbGncsKCm+KqAxzXMd1LbBWS2CuZKoNqPakbLb+gw40EO3i3Vu851hJwlwMIOGGN4k
	ARE6nQHnrUzKuyMMYu1t1we/BB4QsnDmUVQk0eYIJrgPUqY0k5exxzaq76g7UEUjZBuVrHyfyfu
	l4zA5AoBaMG5GeJcXiODxM5kFRKqYU/86ObWxjUatGy54sbABX2syLB9gjegOXDOdOKSWKod3sZ
	d/RaJ8W8JoNqPmdqYOKKtLZLuOiGpsx+FWtsfShCL8ByqT8STVA7UlL1ICTa/LenUumOWwPL3F6
	XWrGr+5AXI6OfzgAE+w0uqqIO/qe+TLgwhZ07qF8a4xHMtXUeL8cHHCdf9enQXO3E+LHvwmYJbz
	iA+XMV3eUtyy1GTtk5vilvmoh
X-Received: by 2002:a17:902:cec8:b0:242:9bbc:6018 with SMTP id d9443c01a7336-242c2277f70mr67504785ad.56.1754699749323;
        Fri, 08 Aug 2025 17:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRcmkdoPKn0Y/gtVgwKawEtn3XJx+wDXdjs6KbTeVW7Zyo7yLwrrGGpLbIydsVcXp/EeUE5w==
X-Received: by 2002:a17:902:cec8:b0:242:9bbc:6018 with SMTP id d9443c01a7336-242c2277f70mr67504525ad.56.1754699748876;
        Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 17:35:48 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:22 -0700
Subject: [PATCH v2 10/12] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-10-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=1258;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=4NtupbLbHXZJKW3LGWuziF6T3O+S2Clq0/ZFSk/f48A=;
 b=pzZTjzYITZ80tgTHFP+3PXCECEW+ccVzZNuZooIm+CrqIvDUL9LgrFJnwSPGcSTtpuU2/mngE
 3yJTVSVx8BHCAAqhjaPQm2i2nj4ByCXG0skte9RwSkKuNRukmpO0gIp
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+KuWAbxfq+6y
 IYeu/2Oho7Y6kQDtPp2bBaJ5vh78q+HFGZIKKvTYzJaf0MQqgbAZhwpC4rm5XiChCvr0b+mVxeV
 xs42MJh3IxjKZwCVAtup+agW64ftj1zYTHA3fvnuzylnStriOpsC5iQ9Dd2vsWjdPfDcPt9u+d1
 p49GtfVK4liwD6/TVV7+V+GnvMDztY4M1PF9hLv9cPkFgUy5OJ6iawd9640DS2ECYzxwuw4pa6U
 Z1BA3bXUYLj96lFuSamuRX66vRWEgn6NXP6dAIitp4AYFE+0NYEOsU/jvdWj2rSbs5QX3K5cymk
 TE1BKOj+zJfFPm8CvzR6vri254QodS8qQX4qcTcLissiD7bNLZZSUviK5GoyU2p8Dk+od23gabU
 wh+HaG30
X-Proofpoint-GUID: JUBM05ph4nJTf8_uWtYVKP-ag2WLeLRo
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=689697e6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=C9iwNz8zScVtocZF6eoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JUBM05ph4nJTf8_uWtYVKP-ag2WLeLRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Replace the ST_MAINLINK_READY check here with a check for sink count.

Since atomic_check() fails if the link isn't ready, we technically don't
need a check against ST_MAINLINK_READY. The hpd_state should also never
really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
twice in a row without an atomic_disable() in between.

That being said, it is possible for the cable to be disconnected after
atomic_check() but before atomic_enable(). So let's change this check to
guard against sink_count instead.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dd3fdeaacc91..82f0b6bdbf39 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1444,7 +1444,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	}
 
 	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY)
+	if (msm_dp_display->link->sink_count == 0)
 		return;
 
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);

-- 
2.50.1


