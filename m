Return-Path: <linux-arm-msm+bounces-59835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49881AC84EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 01:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC244A2816F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 23:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47C42571DA;
	Thu, 29 May 2025 23:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSXkEdKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4BC254B18
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560529; cv=none; b=HxgdwrIaTuCLLSiWdYLwWAAhbvkBxpRkhEKHlCtX0CyUAyroa4RjVsfDRjR6fn0kwzS397VX+3+a7H34IHtOctPREH3Cvlzb8WaKhZVUCYowEFNmuTdU1qjqu4WtUoWTSIfhL9cgVFDaWTgQNb4/8kLTrbhWzSndJ7OHk9nT+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560529; c=relaxed/simple;
	bh=ZAGZk4Y8vogmDbZftZ++ijHWg2vj1zOvE7SDTgM361I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ew1BvPn0dBIyfugy958Ge9UvC35qJQ3Q6DLSVxiKq8LfugPngFCBH/ytuJadp6pZXl3w4TW3F95T3sDPLj3pMjJMCGnBff96Q4MsWu9lTsof+sxVcDI2Licof+XlvH6YCYGMHxakrOB/LqY/uwIbUuNhz1cH54JsiW0/mX+08ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSXkEdKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC2As1032767
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=; b=eSXkEdKVaeU3v7Pp
	x5jGtq5KlfskOfsXmQ7UPlUErWjQ01zFJI7mP8oORmLZy96DYDA82kap14XFkI/L
	aQu4KaGOxcTdrv+pXUUhu//ti77g2G+ycy7kuf4vYY+39FtQJYjfAgWiA6dqEzgn
	Sw1k0vcUYUmUqC5ibN8c7LUdjlaO1SbX9k5ezZZgHLGnmN7RPSG4K9FYyVXzQn/P
	59qICEAD6zD0y+Z1zu3U6XG1iwBNkErExbcjdVYup85kqGYN/YAsHE7wsYW5syRV
	h7in1HuTZqol5BkLTKANsLL3EL4UKQV5B/QNU3N7to7Vw/ie3LvFjco7HnqY0VKo
	X7bk1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjy7jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 23:15:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e73d375aso1542122a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 16:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560526; x=1749165326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX7efsc+IS2/784jVqW415KcZ7V01+TYXKPRgFgJmG8=;
        b=tiNsZ9vL9YYQ+lMNwJKVv4RBJD9XyxtvNgCzZmTHOhpWjQa2NzxZb3ImE1wsK0EXxo
         yOitZuXp+rvcFCJVvv1FfDQqs3sPsY+MWKTkjTXUr9uJpOsUp8Toz5+djZKREmpTQ/DN
         G5p6Mln1aHLFeD10Xki8W5M4qMnppNGO1FRfkjNQFxChC37cMMamMdV8GVCqszBR/SHT
         yZxmlf7GTd2x1Kt0my/Gq53kDF5HGG7XRxajj/vXn9v/3chriUMa0p7xN8BMvDOYa8vB
         mpqzutVxqjz2XUqvvHrYT++TCKR5UNgKBgfT95685E0+gkJkWdKuJRRNOJ/n/gYJB4xN
         BBow==
X-Gm-Message-State: AOJu0Yw1rUnocYs+PX/V+cuRlBal2SjbZuKR9lP5t06uy4klzBwdBa+r
	kHdek5cObGxvEupMqPexVBqsEc0qBOHbHA/Gi+8jMQoRgNdvn0KXxEl12YZip/w6jOjv0dEBZe4
	3YnX6l+JyFyT/+2Ho342OuRn5Qz3euJ3nmzgz/yamr7BcCZuoi14HQL8OInWFe9R5RCQr
X-Gm-Gg: ASbGncurAdbjOrQkOjlJYC6Q3RqSHloJSOzFELqajYjUW+uMBIwYYX0hKIPpVLf3Pvv
	Vp7J+zW09/sWfTQ9EK8qHLDUqPPZJ62NSPr0g3+BS3zGaLvIXXtnCfJ5tJjU5fpPu0FAalfleVS
	bu2Ir3/gEw/8EzqFlFtpgsyLhEf8VoGzuoXqCPm7OEhxIuXHWxPNFfdGybdBUxShIr2WNlGUrL1
	hAIJgoZbvrEcE5rklFF1Ts47/Bim5QewXwiOgNvIk1SoJ9JTXAP5qoLMppiy3QXh94EXTspPFHC
	vNzi7Nnf5Fw5xd0RScEjJAdlPBXg7MHRI+nEmOU43L19Btn07WRao6GkWPxjBQH5rqYzMj7V
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-31241ea0309mr1550073a91.34.1748560526418;
        Thu, 29 May 2025 16:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3THCormTux9QWIgYTb/ZoeNKtEa6RR3lUUxnW6L7Kha6SEXPkeVkPdWWJIZrBpa4PAFunQ==
X-Received: by 2002:a17:90b:3a85:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-31241ea0309mr1550058a91.34.1748560526083;
        Thu, 29 May 2025 16:15:26 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e1f3f22sm73581a91.0.2025.05.29.16.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:15:25 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:13:45 -0700
Subject: [PATCH 3/4] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-hpd_display_off-v1-3-ce33bac2987c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748560520; l=1160;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=fcV0U0JSd2Lf4fDNNX9R4rq8oAhewquvTnMKQsk4vw4=;
 b=L/EjQFUOVbqSjowt+2F3fUU1pQgDZXxeNd7PyBfGd52nFzJc3fw8rhldR4/xN61sS8wqJ+6KR
 nwQbP8lg2FaDS8cHgMf5lKPSyxMS6ZmgZItPDqtcoKXmLuD3U5u95KC
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6838ea8f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8oAJioj0-2SxPtK92HsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wnrqMM7ykQMRVRlIEwqRlYv4XoNB8tE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDIyNyBTYWx0ZWRfX3cRr4LuA/CNb
 3TRVMunecEqD3mWVh43lX080tVxOX6ct1hkgEtgx+tFxW0P7l91awh+YibtiPAXLk2uyPXpI6vk
 Kw1HR81XwZZ4JYKuPZLcMaWvCWaTjGPOS4wSmCPil/dzRFWQxQLVoMpPg36o0tLdEQUnuBHkV1i
 9QN7btU3TGHjUXL1pBGWqn2tDABHG32HYD4x8/HQvctwJkOEm//3QvI2yeyzlLxAUWIz6RTTikS
 MmSpEFzR/0NapOst5+8mXa4j/GHB/ze/Sn/YYUIlg5bL9xuc7miZRdZgM+2pIl8XXfh0pOPCxI3
 3q7sEnr5dZCL6pvCSpzd8cngODXAJM7HaXENUJgjEEIhBTqXHjW/I61g7gBUT0nBRparx+v8124
 x4jZ3S/Ip0AJFIjJPHcV4qK/9Mt5A8DqBT2vtb0WmlPDrJ59V8q+lycCgXUF0/sE0rRdpE9/
X-Proofpoint-GUID: wnrqMM7ykQMRVRlIEwqRlYv4XoNB8tE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_10,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=766 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290227

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_hpd_unplug_handle() checks if the display was already disabled and
if so does not transition to ST_DISCONNECT_PENDING state and goes directly
to ST_DISCONNECTED. The same result can be achieved with the !power_on
check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f2820f06f5dc..785c813d2b31 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -672,7 +672,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.49.0


