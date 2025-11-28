Return-Path: <linux-arm-msm+bounces-83686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA1C90DE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 06:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CBB5434D161
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71722D0C98;
	Fri, 28 Nov 2025 05:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ln56N1Vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1/MPn/y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2260A2D0622
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306353; cv=none; b=IjIfVoTbie5mB0ixCCOj+aIjTV0GRLJIH3Qttpc+Wx/h6WSNPomkMEoAlM0rmhL3eAMytfkADprVmhEuJecp20CcpH+wc5PrWpQ5rzedIKTHL/2dfRG2vmwCv8mEmSTuWXQ5RszhnM9lSft2WnNKtfGG6cEFG3qSyWqpjT4n/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306353; c=relaxed/simple;
	bh=799JKmMxCZfstgdgvJldNL7XrhQ7fKae0ffYtfrqUh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q5xNbI/f8t1ylvmWDLyoW2D/OnHgS1n2NOLkzoXFnSgSglLZD/XJPkeAd4qPp+UwSQZHSMDnbtcQsG1YlfkU7aRLZT+wiQdqe60DH5HdHCdLQfLyBwjCfgtbr01qlVdfbnQLVGZu7IFCcDpeHoCE9zH5YLtuCK7Xof/7aUqsahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ln56N1Vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1/MPn/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMsM9C2227695
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hu64amW9A5E
	UX9Pnd9zYE8WBf7r6f1Os8itmx4PIfI4=; b=ln56N1Vlnp0qbxqXBTRX0VQLx/b
	dPkeEpeLCuamqXnIGjWgly5bImd5S7g1HzlCTeoPAx9onS6NFWu7///bL1QpE7uk
	HXdsLfWgitXzlqZcx8hxiymTuYIYptVGUlMMnKi95XnDUtxyeaSoOHn2X/imrXmq
	3j4recWWflpwkKzalHsluJ/NHMrCCFGSLx/koTlJgHNVgqF7l0u+ha9alTPGRdR4
	eSdnDSKGXEG4oynDD0Kz+IQ02+xVHk1TFgIxMZuOPKkJPnDxnNSMVYZEFF/xYKby
	mf+rep1T3NubnQ1eCei5DzdM/U4utErSCz9CwOO00wS0zqzSjs+l3UnTnqQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66hqjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 05:05:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f48e81b8so20586345ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 21:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764306350; x=1764911150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hu64amW9A5EUX9Pnd9zYE8WBf7r6f1Os8itmx4PIfI4=;
        b=A1/MPn/ynDZDDc4PtYM6PpE6ilCFN35pNtIlRDkXwlWZ+wjbgwQpqsxIkOhGrBNLbQ
         LlODZWYULUQt53dE64HvMNdcB36qYVOk29UkmtXfU98tVZkAwor3kRazsNtZmZAQOEoc
         fUNRLLS+j1nqkjVrIwW+9qN5TmF5cDfB41NXxlvnY+YJTYmnom0hqrHz9QWSVcGaxSii
         cy+qt/1WGhX8EQu5kEbwXp3kWyXp4EOQMBlQyXqZDDV9v/Z7aIepzoWW1EbbwcZarLFN
         ubRC7mVGADGzmARsksD1dKbTRUPLqDeoyQVKf/EHWyUGqtIlVoP04ixl21vKgQizLkoT
         jFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764306350; x=1764911150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hu64amW9A5EUX9Pnd9zYE8WBf7r6f1Os8itmx4PIfI4=;
        b=J7PCGEdEDy1x89xaiQaoaOcdDrHxUQJyaVF3sF30A/FXNKOVv4MYCtj04oCKGk5xyJ
         SQ66MbQfa+TeTsv/mpU2Y1CMdIeNGHExE6hSv94s0WmI2jAt3pV0I+259y4rnqpd6MV5
         4t9/M4x7r+2Oobml5xdMCRDLS1XCvRxmwcRf8Mvjvp1fQvqLf8O+v9gfWmWBSCzOOwnL
         Qi9+peYyZwYjj0fMsgejXifT6i5n17JXFjVYMGIup9FmNEyVVZ05dM6vgn+bnjtJEHa3
         IvYahP9bLvVkmx0yiNwVJ0fJNHB8l8cP6YCB1yx/bkORYAnJggKR0KifkTiDpZwILoh2
         2HqA==
X-Forwarded-Encrypted: i=1; AJvYcCUR479ZXEwYhNNtzjCZGyDkVpQWChiJQom2rNJgUfRw3sFfByFmDzlaCGa6gY9PAmje7M+oFeouRvBu3Dq7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPdAnkWAEtMYfASHdm9BKYDWdMkiw8DhAoa2LwuuLJrE4BD7PE
	oJ3xbA+dLvxzMa+fKZmIxOxgnkaqzXKQMdlUuPOqtAAHzPRuEAQtUzX88T+CH1RfSt6Vqe/FCd8
	3QbTKrIBgM1KjDz7fnMnZzE3rtsclwvko39kkbGTC2kgo91C0Vm2Bz20sW/Y4SUFQ2DSd
X-Gm-Gg: ASbGncuU73LTDXrafEbk7holbacRc5m6nkmrbO3De8gJHL1y/SawlWdXEFQeB8fxZTb
	Xk/pCg1AwhUnmUYvRVffvuBND3z4Ux/Urg/ef5+XjVDtWDZ2g9ejCb/ZTiZFRAK6IF6FCTYcM6y
	+AASSvvJFjukX/0QUzNJ+eSSM8O6VjQBhGVdcW/4vMUqLg4VbAe3PBI9Ym+usLnQSmebmbHelGy
	w7sVdGJLLhJ6GRxzDDovlx2w+/qqCB+eMgmcfLecxtspVTF95TE3wR4OEP09ypBfeoaE53vDPG3
	kCzQyWzi3MpD53HJnwZBcFmzTQzXcCNTT+1lpRQ325gZ6UVajEkk9oG/o2jmvJvcHxMoDNLu8Pe
	GFATF7WLJ+TUHiyb7sMYgd0tZ1ycWw3ZBS9T4kf4p1w==
X-Received: by 2002:a17:903:166e:b0:299:dc97:a6c9 with SMTP id d9443c01a7336-29b5e3b6b04mr292120625ad.20.1764306350186;
        Thu, 27 Nov 2025 21:05:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnZPuuDoNqGww8zARhrgAh0/9U9koXPe5CLxH+oUCH41mNlEOVmh+iC6IejsR9qbfAwOOBrw==
X-Received: by 2002:a17:903:166e:b0:299:dc97:a6c9 with SMTP id d9443c01a7336-29b5e3b6b04mr292120265ad.20.1764306349517;
        Thu, 27 Nov 2025 21:05:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm31952075ad.73.2025.11.27.21.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 21:05:49 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
Date: Fri, 28 Nov 2025 10:35:33 +0530
Message-Id: <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YNrg1l2_lpJbtArnLxvOIgHiSGrl8PPZ
X-Proofpoint-ORIG-GUID: YNrg1l2_lpJbtArnLxvOIgHiSGrl8PPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzNSBTYWx0ZWRfX0w5YN317ViGF
 ZFxuckN5zvHaXuXoP3sLg7gh0d7/HFPm+0xjxgfpmaXRiC1aWB4P9nxmLyFSdA3I0JZU9aW4/uP
 i+qIFc8EU2BzzAB2yoj5LYMFckUDa5gxA35LKeF7PNQ2bDHPe+fhzGq5Pu1/QuFTYqLFd/Py5GE
 F4k3HFfxXi41oqCkEAB9AM9N1qPFnfD14Cd2XGxIqPm07euMQMpKHdBi8fTAb9p+M2haLXVzMaE
 MukJ4NHsSeygdZ1f5kVyuV/L8d6exvp95PAVMp5CxTzSSDV0L8/qk4zEpIjVxfNUZbUD5wQKq+U
 NHhe0JslAxkO7BNFs+nn3qD3YEcZdSNUI6vN09geOy6SMgnCTIjU1jC/S14YSaZsYCjqVFU9eYy
 ea48t8GUi42Uds07IBUoQV9c95lDog==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=69292daf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ou9iVbgrfxuWbo8UQ_4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280035

Current FastRPC message context uses a 12-bit mask where the upper
8 bits represent the context ID from idr_alloc_cyclic and the lower
4 bits represent the PD type. This layout works for normal FastRPC
calls but fails for polling mode because DSP expects a 16-bit context
with an additional async mode bit. To enable polling mode support
from DSP(DSP writes to poll memory), DSP expects a 16-bit context
where the upper 8 bits are context ID, the lower 4 bits are PD type
and the 5th bit from the end denotes async mode(not yet upstreamed).
If this bit is set, DSP disables polling. With the current design,
odd context IDs set this bit, causing DSP to skip poll memory updates.
Update the context mask to ensure a hole which won't get populated,
ensuring polling mode works as expected. This is not a bug and the
change is added to support polling mode.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f7fb44a8e9c0..222ff15e04bd 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -38,7 +38,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1


