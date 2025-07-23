Return-Path: <linux-arm-msm+bounces-66345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB1B0FAC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95DD6567AF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A0E22D795;
	Wed, 23 Jul 2025 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY9FdImd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AA82222BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297738; cv=none; b=qC0nJuqpXI0zNocWyGKxI7BzMoK6Fktj6ncZxeyXBxAJRfSiQLb1xuHCsx4O4g+uajLGAbkZ8FGv0hiTV3FTLRmSZRTJlvbqeBtc8qgxJbij7u/v0IADWJhsYPiCy5Ql341/aYeu+Ax5TJerEyxdqhnhfB0vbwBQwgoFUpILZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297738; c=relaxed/simple;
	bh=acgo5G7ZdqTzyYB04nooD5h9TSK7dGPPQPyvW67Wy/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=itlDmIcaqYTo7V50IDwWj7tiaasOcii/iofY2I2JalJWgYZOlx+4OAaoFCC7xm/9h0xV3sLkzKAJvQjYuhTWRdot4/UZGNZ7DMFSqIPJlZYz5G3m0CrYlKdeFyJRfYW332fcX2KzmS3wz8c82zTflp0POPnOujdL0eN5ye/mfdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY9FdImd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH0HhT001899
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mASOgsCi7NBq5T98FPC/x55U6eCvkphaYtG
	YjqMVya8=; b=dY9FdImdDR9/7eLvB5z/muueEDREJzyboWBxSOLntKGdkenKupL
	19gbBWE4IN96sEDEKmNnsOorRLY3yOZ+ScfhLcoIaJknbgmpeM6GhRtjl47DnT21
	0Pf8v6kEfnLz2upXp/AV9L84pvK+0z7fIakSAwmSpI4RrPdV7s/0xIpP3BIvNmdD
	bCGYaMDGJR+9X/p5PTONCcTrvic+qz0zipnngxozjzjntjyH/YAjujokB6OtqjNy
	8fiea5orKNWNkTp3mnlaJYDJBkiCe+Ev/Bzfuf0OLl4CeL0YkimmGhv88mHszUYQ
	aR7BOf9iBfUkoKvEd34q6MAiC+oZUcgcQ5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w7f2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:08:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2382607509fso865555ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297735; x=1753902535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mASOgsCi7NBq5T98FPC/x55U6eCvkphaYtGYjqMVya8=;
        b=Pjhr2XXS2Mxs83RSmdepSakela0t1hsqgCD3pnJq8mbBMosyLE1y5TpY/VuKJ3nQA2
         YbdLpY5YukiY0RjlBHh+46qs28sDAOxyd39NzSG98ijwEIzWgrFsJSivQozLfeAHsxpo
         +FRw8PnWpKdMnuyVIk5IONhcFjVqyXt4JSHFeagCRzugdtu1VJxajjrPYEDUkQciXXzP
         pMw4TA1p1nifzosH97XUybaL4kGbbtJz6FySdOODUmT9crdcgZno2hwqXD8QcCGd3E0t
         GZIx9f8BuS3XDeNr+vCNXvuN6UQbkq+TqkN4gDaNW3MovbEIxEgreDyS1OCa8E3hXGmc
         xqjg==
X-Gm-Message-State: AOJu0YxJEml191qqwLq2M1sdZD9kwk1MVMk9z++OgpjwL0Y6uvAfaDKa
	W59OOqwQWhE7gWXDhskQRRFIbAColGXHlvvU3Rrxfy6s7MqmasY6aqMuMn1nmzYFXTfJ99B0kSk
	wEXOVbecPP93mnU3t5s6AeTo2DI3oLnrfscaamHhXTdQNDfsZcDJ5tRH7a2Ju5XJMLiZ/
X-Gm-Gg: ASbGncvKkeOjh2geoaqpbLv6QfX6apEAlUq4l1TB8eaOZA6nWvg27rtG0XcIs0jPRvT
	aiLF6ZGMsV3b1yGDSLZOv/M7029JAYYazP73A73SpLrncRLwLtqax5kTgNzHZ9oX9JEwryPir5a
	CKzsT3GBcFM26qnPFfDL5MM5betj+NI+jHlZoZKQaI4ZSphz1owaqmR7d4mOOdQASf1UHIcIXvx
	MMkDAAOUzaG7XOe3UHBoS4l+VWYrmdi81ngo/F4v+TtERmB2ZQ24bHI826VAx/vlgK6RRxUNkf5
	eLxgJk0JYW9rIU8BIpVp/AHz3/o8vcW/gruYHIQY0pjstmMeGOU=
X-Received: by 2002:a17:903:1109:b0:235:c973:ba20 with SMTP id d9443c01a7336-23f9820283dmr69182865ad.49.1753297735510;
        Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhVi/6gfyiJ69GTvshRkz/NQIrNp1El4Pbp2UDbBc4h/tVujCiVC1TqjgOnUvKlvGS+Ua0kA==
X-Received: by 2002:a17:903:1109:b0:235:c973:ba20 with SMTP id d9443c01a7336-23f9820283dmr69182405ad.49.1753297735019;
        Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef9aesm101308975ad.211.2025.07.23.12.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:08:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Error path fixes
Date: Wed, 23 Jul 2025 12:08:48 -0700
Message-ID: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=68813348 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=eljiBBwz-SQjAQrFlygA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX6XjYck4hxs7r
 TB59KIgE/KpuZ2mQ4bcBlFUuwLMXq20UChIZZC3bIlEcPXFDTMSwqPtCJQAOWjRVWSDTANO1Po6
 qzmuoLoV3yuLLNneGvGKqZ0/Xum1ol7gzYyu5XVAC82T1MwDwE1zs4Q2UosfLcDD6rs3IJSO1tW
 Jaco6O+ZnuAzgijXIqlLLWcrly9PAlKGlE7ItnQW2vCbZwwf6izSMudftHKYSfCUehE31qqyQqN
 J0C58VKK2z3lBsGgGXdAuleFpjqOUxj+8TYOvZ1YO3Pn4maXyleHk9Bym2fd4EZ4yvOQtSCXg63
 2vt85lxdNLT22lGPRTlY/jWkU0zYgKvK4GIAxaozXoWY3LWYsoECZj4DbGSaxDyHaPJIrPDFvF/
 SlhQbYTqSQCDCyYXmMdO67Ze0YChh2W+yqh9OVH1Y5+hM73/UJFtloiaAvkqYzXT0KwYGNSo
X-Proofpoint-ORIG-GUID: BxlB0A5dfRKDX95bCxrw23Y113AFEaue
X-Proofpoint-GUID: BxlB0A5dfRKDX95bCxrw23Y113AFEaue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=988 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230162

For reasons unknown to me, systemd-udev recently started limiting
max-files to 64k (at least in f42), which exposed some problematic
allocation related error paths.

Rob Clark (2):
  drm/msm: Fix refcnt underflow in error path
  drm/msm: Fix submit error path cleanup

 drivers/gpu/drm/msm/msm_gem.c        | 4 +++-
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.50.1


