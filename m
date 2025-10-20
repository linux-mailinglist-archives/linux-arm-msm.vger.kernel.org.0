Return-Path: <linux-arm-msm+bounces-77961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC679BF0179
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F523E555C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC912ED144;
	Mon, 20 Oct 2025 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0bJxmuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174D2EC0AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760951260; cv=none; b=Fn7SJUNP2P7OkWu6rMnQW6Wefm7r5DEIS806yGz5bC5ENKwk2UJRWKjshG24eXa203YeiUTFbfrVaF2r6ubdEkqQjHjCNA69c3FPua2rfNroMwUuGIcwTWPhCdc572vP3Ire2wTjmTcgFdJPoJToirHsiPPgp0hXdFEJr3D/EfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760951260; c=relaxed/simple;
	bh=hVm1R7ia9T20tyT/Jyi2XcWRljw8bltMueR2LDH2CBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rcD723v6SGIjR5hSwx0StU1rf3txA7iudXuDfRuZTFawLjwht+Q/St/tZVqXDO1IgVoVW02K90I/14Op5+am0i5YsAI1kh8dTzbw9BT/DrXMGtHbZZ74K/WIA0QuvAntOXfZq02uWOlw3P4EUntNSM5Gjiq0UUnzfaZEo4uxXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0bJxmuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JM2EMh022434
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RgZkL/O5r39Ejg7wxsPlka
	6AUERHa48vlx4Rj2dD/t4=; b=n0bJxmuG5yQ348/N0RTNO0DItkZ9528dA1D4ny
	pi5nh4DNyHr0v/YuCVL6aro/1AaCj0JzJjDa9LZNuucL6kOG+bTvqEkyVW76EdCI
	AkM7gvAlnYI6UPFi+4gji3I+mWtoBayqF85WBSIZXL1vPCEb5fjsmydmPGKzIAei
	EqdGme0U+GwPlIHQ0EWY3DRiSuvajxUV9EC/QksUkEGAfR1swt2uyx/NNmkRUgDX
	/M52TJ8Cx9Jvz7VtdoehLdsid/hqsC1vlX9JX1JNSob4o356LUKIiTHmc8TvEjUY
	C1AifiwWo8cGx/imizBYR7UqVl6fjs2/yQq0a2EZoT2xuygQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdv82e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 09:07:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso8329590b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 02:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760951256; x=1761556056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgZkL/O5r39Ejg7wxsPlka6AUERHa48vlx4Rj2dD/t4=;
        b=MJCxK+UpkqoaZyXZrHjZnROUSLyxMkhopdh+w7SGsJ0ndvbUqTG8jur+5lw7uQeLkj
         LnUJHXDjnVqOpt5jfUtR1mTeMJX9oKqQgbZp33Q0d7orcrQ9/WPjpq9I7KzPw31S9QEK
         fOLlWoh/CbPvOxXE0Mn7rsTwxPUMGpJBS7V+BuRQbl7+hwSxbm5S/2L/g437jOliPR1z
         oJisWOBL2gYzU2zMoC6Nzai8b2p5EEPbpsAbt6RqtPS5sFcIpPLaY7Y4dygxbtjYL2xr
         vi2jaMzII3lSdKEoOrIBaUdN64Q//2TEIyZzNXk/PFOr5QiKwKVMjb5JGO7yVWWlr/QT
         Y7gg==
X-Forwarded-Encrypted: i=1; AJvYcCW0/L3DZSAEa7gjHUvILjaTF9wpG8Bd0DBzcwPwbuQNet0b+LtFLV0pXb6xfHFJ5RS4sDNYB5wfB52v0IVh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1i1KrihB+mJ7WHRgsmmMAcmwXCh9bKia97eb4/si18002EsY
	NaahNSRH085FKUOZRgU2ziK7k/YWWL1lzRzjueifUg2J9g7F7bZ2+4v5IO33ZSSIj4uLUkJf2fB
	A+DHjmQLiB41IxBm3iAcyyR5SxFRn+oPLUqM67smhSGC7SIwYwDWeoLcSnTRUjKsnm6wB
X-Gm-Gg: ASbGnctRzPiVjbas0P1bS5OYYdMPbbQZ/PsBuxda4hJJ/7QYtQRCaWa6ULTSwCgAx/N
	If7OP820kKzj7uTw/Z1IfRrSZJhHo0XM5qoidafiH6l8dll3CNmlqibQPXFhCgtyXSsp9/d1u78
	9aFn+Dh0Fx34j4dydFssmH6JaIpcodtPzQaXmlwgiCArOA+1LHee7P5EzT4EoiAiXT97LEKb5MZ
	FQpPPtAxafS6FotplO6IA9R17vOxREryiLOODLjIcDNhsKXQbeQx2WG9a5RL+brbZSgjekkX6QJ
	kfbRTwXx6m1Hs+PxWrW4pm6XtmJWgA4kFIsLxPcKFbQS/UWKf0IBCI8d7LkHFllBRB4LowMxtmp
	IF/+6xoFlbsGkYsLC/7xfvq2aSY0arvPkVYP8gE4i5R+Ewno10MiWVYW1PEPv4k6FO6vdUEtc
X-Received: by 2002:a05:6a00:929f:b0:77f:620f:45ac with SMTP id d2e1a72fcca58-7a220a43630mr15859218b3a.2.1760951255611;
        Mon, 20 Oct 2025 02:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRpK7inrjbHzeDY+riy4KtgH1OnfykJvAHgUiLsEci+dm+CxA5GBz2hSl8e007SY4h4SVHyA==
X-Received: by 2002:a05:6a00:929f:b0:77f:620f:45ac with SMTP id d2e1a72fcca58-7a220a43630mr15859186b3a.2.1760951255199;
        Mon, 20 Oct 2025 02:07:35 -0700 (PDT)
Received: from xiaozhua-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f25b0sm7742999b3a.49.2025.10.20.02.07.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:07:34 -0700 (PDT)
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 17:06:46 +0800
Subject: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKb79WgC/x2MWwqAIBAArxL7nbAJPewqEVK61f5YuBWBdPekz
 4GZSSAUmQT6IkGkm4X3kKEqC3DbFFZS7DODRl1XqFEt/Fg6o2WRixRq12LjZ9cZA7k5ImXh/w3
 j+37Q5yEPXwAAAA==
X-Change-ID: 20251020-fix_etr_issue-02c706dbc899
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760951252; l=1599;
 i=xiaoqi.zhuang@oss.qualcomm.com; s=20251020; h=from:subject:message-id;
 bh=hVm1R7ia9T20tyT/Jyi2XcWRljw8bltMueR2LDH2CBs=;
 b=c8mtVKvbPgSvvbkWfaxGoLkGyv4LzvBRAZR8R4pm59YaQ/8wH+igbBq5YqHGTcBsosR1fbi+p
 oqIflqpxmHPA09itaBiXyWa9znBvCi4SvqEf1ktMCIQeGiMcheY+qlE
X-Developer-Key: i=xiaoqi.zhuang@oss.qualcomm.com; a=ed25519;
 pk=zuq+lkjngHYEDk6qmD41kiqDaQuURxgU/sjQuARnCrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX308FBwYZ6X2u
 1grKj+GiKtoGHd8TteE3zXRfnYxQP4XOOYjHGqyJB/bG8lsZxJP59OC7JuxO6joXc08i/xhCVHA
 7c4sw0y/FujFbWIq/I1zP+YHttClnI1G3h40nGeldXOzz4XB5RYZT3oGCJA8Q+jZ4ULtmJrxzVh
 Wa3oGlVCPd6Vr4yk3B+TuKG19KaMsbHXhZuchGpaUqVdr+vRTVNGY00cvNj8M4isLWz16lJ8fQb
 bDwbAWvP47FWejiRCIriyj4wJNY0oxUaNQ5S4IuEr+lOrITn3LCSmqBdDBqKGZShYLRCL9WFnZf
 tsckxWaMECqhSfYpX+qRQis3w8MvGVyRJOlGdWfOlF3IvBsT5XsCF5U2iZkbkhBZhL7R7CHd3LR
 oqBZALj7x+gv4QXElSdmZ6aWomMEfg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f5fbd8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oKJ9ntOD2-YCvPZDK-EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: T8WYBwMWSV_wsPvdADFRd4lXuP6DjKwE
X-Proofpoint-ORIG-GUID: T8WYBwMWSV_wsPvdADFRd4lXuP6DjKwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
and enabled again, currently sysfs_buf will point to the newly
allocated memory(buf_new) and free the old memory(buf_old). But the
etr_buf that is being used by the ETR remains pointed to buf_old, not
updated to buf_new. In this case, it will result in a memory
use-after-free issue.

Fix this by checking ETR's mode before updating and releasing buf_old,
if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..3e73cf2c38a3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,6 +1268,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		goto out;
 	}
 
+	/*
+	 * Since this sink is already enabled, the existing buffer should not
+	 * be released even if the buffer size has changed.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		goto out;
+
 	/*
 	 * If we don't have a buffer or it doesn't match the requested size,
 	 * use the buffer allocated above. Otherwise reuse the existing buffer.

---
base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
change-id: 20251020-fix_etr_issue-02c706dbc899

Best regards,
-- 
Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>


