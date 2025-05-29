Return-Path: <linux-arm-msm+bounces-59836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEBEAC84EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 01:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FDF31BC5F83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 23:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E9D2586EC;
	Thu, 29 May 2025 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlWWlbeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67489257AF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560531; cv=none; b=BLziITTxecuI5sR/si5R32Oy0gzATf0vg0tFCWoz7cCviir732x+YsiKCUHhW73S4TFAgeb8nQhhqJQ/a1ItIT2md/S66oOqHwKkLP0gLp8imqWtTjeR2fqL8XPi8d1qKCzTO1GcmU75xEQqCAZOtIFLW4FQn3f5Kmh9G5/auPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560531; c=relaxed/simple;
	bh=Qu9dpHlIRB4zOegYzAEmciE3+UoqCif4T5fM30oyon8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFFnJlM0t31gScOOVJmoPYWLcpTLVCSYhgS0l2Z5Nw7acWE4+0Rym7eY8U5Md4X5HM4fEEi1ywUSlxvk9BX401huNSXDCHnx2Sc6RYh1HmUDnY2sZku3AQsRVVNiz0bs1QenPKIZn/hsvJB3injL56C8TFWbadYd8GK30VahBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlWWlbeb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1K6S024519
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=; b=WlWWlbebHQXU7IaB
	t02zhGKFXbemRqNf/kw0uIQ2ao2KMbVnBK4Vp0zi47WsA4reWndY8e7xqQ1hojRB
	J+qGJNVIKrXM6i05AmGI5qhB2FhX27TRfxaoDjqrfZEwOg4LXY/NPfyVxIgfRMYF
	HqW7vcJgbKLWqj4jhP87dYB+Ztkmk4edDm/NOqrWZJqlzS0/ZGj0wzJF9O/5Nz37
	hMYt2VK5NyXch9g8NMglhWP9YjGQdW/KatJnJ6fZPXkz1UZO2Jr5/dx9I8+PxxKE
	zL6nFpON9riyWpNQMTmq1NwpwQEVQ+8v/or1p7451QCXHI6xxJ5GvbEthnxk46ZC
	YJ8sUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mwg19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30a59538b17so1329046a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560528; x=1749165328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vbVMjvU68KSE4FGI+lKVINOGIspYhFfmjickrGZhQg=;
        b=jaLThyBiywHAfHbNHZNSlTrToIcsrM9E8XL2Wm593YlKUAsHp9j9BZFn6mEFxKVl4/
         YhTwKFX52nLilbV5zB+vnTboQlnSer/3gHtipXeQpahWe9WiBKPSp0aNFRfCbsV7w2Ng
         gEANDRKpA3p6EaM+V4SXbFIMVSpJfTep84vZVwKCrigBiDvZWzZLmXQdBb8uvJH93rk6
         ZIyRKe3HrPe4Vgk7OqnLF7Lm0Z6F07PBrlfR27HEfjdLMsOIO9EvkA9pL2Jnxls3xHDn
         dknaSKW28CyEzBCi1t0zPgt1mLxt8o24lQZOj7/XsLaqRZp7mTGsAoJrH371LvsWqZMQ
         fJMw==
X-Gm-Message-State: AOJu0Yw0Ls7KbV0Ibnf+cT41mU1SLRS3xpUg+3WmNfgtt1900VINq3dK
	lY7MYBunPxSa80aPttYRAHQQZElrj4qG/qqITyzrEra1qpFc+eh2YBQhsudTCrE9BBI38xfc7OW
	yxOM5K+f2AcR5Vw7ROHJMHnmrqv3hQXuP6ljPSnetFY4q4e1bnTaolXrKm4EKkoIOAvxK
X-Gm-Gg: ASbGnctgaimehxuYE1zmvfxvjkGkGlzbe2ZNPbQjLVfO5Om6GRgLD7lMeotrPniB0My
	mXYrhym8t2tx+IGnUisujOvygPG8ZdnUE8uRIsU55tksnzfK/VeZ0Ej82s7/kKa5/9JDdi67MzK
	KzVBd620ZVBRZkQZFLxiYOuIvBfucUAq3ZX0O+Bpu+45STeEaOtmUMHII9wjwEdC8zXeF9TVPfo
	rzgjZMNFItwwBmRdNfsX5raSqQ1Kbg+jMz2ABOu2j/vUJTYhkzrXhCR5yX4Ug8iXdSUIPMnNGlz
	V0uXvkutiJFoVLpxP7Q7HBObKBRg3PuJmS5fWmUYfgvNmr9DAQwitBBgZAbRtaI7xDX3xXas
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id 98e67ed59e1d1-31241532ec2mr2226134a91.11.1748560527849;
        Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKS8hP5QDpmvy9MOsu098RPR9jWdEHOkxDAW+2Xf6gU153iGKt6qoNGu8DVdUnTocC11rWTQ==
X-Received: by 2002:a17:90b:47:b0:30e:6a9d:d787 with SMTP id 98e67ed59e1d1-31241532ec2mr2226080a91.11.1748560527405;
        Thu, 29 May 2025 16:15:27 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:27 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:46 -0700
Subject: [PATCH 4/4] drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-4-ce33bac2987c@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
In-Reply-To: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=LQos15gYFKCo04VJZ/As3557mLEuaumxqfi0RxOfo5Y=;
 b=ZyMmKPBhU5YA6EHWCvynOwpmKVsv3ib05zmarBy/e1MwPCLCy3gRO0/VTzFbpLW+pORd1zhqW
 Qr5/lo9J/i2Ci3LD8bTC68qtF6PkoPKgqziVkownWvT+mt52PpUs1pg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: mX_0dX3JWrg9v8zbronG-AU4cryTmmWx
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=6838ea91 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=zUghIR52pHC5fQqyx9gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mX_0dX3JWrg9v8zbronG-AU4cryTmmWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX2RwVmRUN2E+Y
 m80bP5prSy61oXmdukQHxllc/75QNcoOhd9dI0ULS3uK2/2v8cLa8JlCdJb2+3V8bPCb4g+e6RA
 7WB0q3Jo0xOKTXqNJ69OEjuFGkr8ioM+1uJ3m415FYGfklHjw8UPvtZIgbpWPylIM4987njMF4u
 Pzhe0/iY9G/v7WTzQAO4OAZTYYP/f9NrRX895Mkpe5TCD/gOaKt+zsssKcxzGCV+r2FucJcM41Y
 IxDuWmcmji56Mly7TAIQFqbV0igjliOgn04YGVPEm44a4kUJHyhd2pqEJgIO51UFRjz3gefVPPE
 c9d4l2M1J0ZzWiPzj8k1osxfnR3THQ+3a3gnXwSmW2n2e9X0MOY76GrTfAE8q4eN2FutSXy0yPF
 9BJWxCzYFsuLiot0+ytPpj4Hks1a/S8ipL5vNym0DfZ7rKRIKODw0kJ/Zpyu37xMXq4xIq3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290227

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized. This can be replaced with a different check as
it just means the hpd_state was still ST_CONNECTED but without display
being powered on. Replace the ST_DISPLAY_OFF check with a combination
of connected and power_on checks.

Since all consumers of ST_DISPLAY_OFF have now been removed,
drop ST_DISPLAY_OFF from the list of hpd_states as technically
this was never a 'hpd' state anyway.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 785c813d2b31..6f05a939ce9e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -50,7 +50,6 @@ enum {
 	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
-	ST_DISPLAY_OFF,
 };
 
 enum {
@@ -1526,7 +1525,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	hpd_state =  msm_dp_display->hpd_state;
 
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (hpd_state == ST_CONNECTED && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}
@@ -1584,8 +1583,6 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	if (hpd_state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
-	} else {
-		msm_dp_display->hpd_state = ST_DISPLAY_OFF;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);

-- 
2.49.0


