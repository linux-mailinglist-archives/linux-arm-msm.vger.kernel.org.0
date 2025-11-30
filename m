Return-Path: <linux-arm-msm+bounces-83902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D1C9505C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 15:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39FB6342729
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 14:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A312227FD5A;
	Sun, 30 Nov 2025 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqNm+jM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HULdTF4h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569127FD7D
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764513681; cv=none; b=IBUdPCblcIir+M75rJ+Y9up1ZaraKfcwRdcBRACd3Tdr3JBkb+K8hdrkYQr9jjE4RPAz3V/2SV8MkF+fN+iGiIPBqlLgZN4r6Rb9KPpJis6aszjHO0XzCp5bJJONA9yWiAk5tt75umKY7YNCNd39qa3udbt8KLCVHWNrG9KhOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764513681; c=relaxed/simple;
	bh=bMnfCaKOnZ7aTE058jECxi+htUeiLDQ4JeZLEQgIPd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1K2zmSb/TAypnYfNP3QlZ+mdPf8nwhsSKGVj7lGBGfutjT/13T9mUC7e5inpz0OywLDPyggANcGYKZtXixjbjZu/LfH9JNYdnba9EzoSUvAncX1FgNgCu1oxm6A36gyx9ewFSo15MdSQORqL6ZvQWA+jpnECR57Uvh7s3AUt8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqNm+jM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HULdTF4h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUBgUk01236371
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pd+Qv3QALgOY4Zp+I1aRJ5rzM+HK2hYhAaPQwHjRYiA=; b=kqNm+jM7Cso8AI/c
	QUzAnxiCAeXvb4JwaKXpOQml2rvES0yP5C5UepFAJEuzwKrxlLvIkS6UdGec8gYq
	O0cMeLf0qoynP244jCum5OAKOoTnQW1qM08ijkkApzpHllP5eGKXSDOnM/4L0IO+
	RdkO029DtnJbkTkVwLCMiOGe8XPmrjylCqDfmOUd9iyCCe6RM7zXTVWQbXUEUjQd
	+lh5a1dPKbltL8Z0j/F6bL52hM8NDf20BHCB8DAhwl/JuGQ3bLQ/QhbTqeIvUqh2
	yM0gn8cIDh5776PQj8Q7/m+rPsxVoaMKFVE8frCFuQxY0WqBP4o6hvrAbDs3afKi
	I4DD3A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqphfah77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 14:41:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so3097738b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 06:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764513679; x=1765118479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd+Qv3QALgOY4Zp+I1aRJ5rzM+HK2hYhAaPQwHjRYiA=;
        b=HULdTF4h7pMEj8NkX8mLvcFCU85oe84YBHsmVIxmnIsKNjmhTyHwil0gl9RqSjMiqA
         97z2320KIMMNl2yHA/odcd215sUi/Qb1XPLq+dDvL0j8KmuYGUsR/LchaTl7LpxrNFfi
         lZaDhzh4PmiTX6QLc/Y6IftqIbEsSP2RPk6Nz6yc+pKlwdiB/mqJbs0NVdNPeFUOdDux
         OAr5ztAaOcHciJTSPsmMjYf6sWtbcBb11aBavoDPue2ZD7P5CO1saCtftYFqhBA0OThE
         RDP83/X3iaYotMR5UghgWmEEKj60WLn/bMA1TGFvLmJiJqHVHLyQhLkqKMqxjuqLxAYe
         EkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764513679; x=1765118479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pd+Qv3QALgOY4Zp+I1aRJ5rzM+HK2hYhAaPQwHjRYiA=;
        b=FL+MmmRV2kkUZJXS9ki9zDMVZ4eGvIkxzhSyKyWLeus5IdMNC3spedg9ZyUU+zocoP
         FVpv7FBvGSR0ozcGqyU7+RHXmGzWdv5H8eV6J8O8+4szQob+sIODNm27eJa/B7zyvR/r
         s1TtEa4N2sLXnj/fxzZsdqALIMEbpYIHwGl00KU4SBA1KrCZaYn4TZVvrHvI+S9S4YHT
         ecvubDB+5w/ufbw92mZ7rhbGiPTU/6F+/I3mFqIYU6cfR9jhwt+ntN6EvAWpwpQ60OrW
         W4Dpyr0I39u6W9n9fzai27xJRYC/eSceLeTscuXkXfYqqtu51/VKqA7u0rVWEoV0rFTI
         M1hg==
X-Gm-Message-State: AOJu0YwzqaZLzUslOV/uBhaMxRe8GYp2jK3WxsHgtj369hN+pPkx8BJp
	VlbhsfS3lFRF4fzVzsx90SK94OxHdyAN+YshcSFV3GkJsDOffX53WQlRFl/4eWXGVcTlcNUHdW4
	TMu34lbIzD+g+2IZblYL+F/NOGxMr5gf5B6XlwunW6HJ2CAYlCGU0h0db+TkTj/Qlo6jK
X-Gm-Gg: ASbGncuzshkpT+KXU2RZl9QYgkHJsIwmf01qoDF5158j/qm/NPZrc+zyykRzlmC6dXv
	2TYQ1o7hadUCDM//U3/OMsaVrcshW5ZVd3c70DxHh/ElFEUWTp5X2xbKULRCVSCaCrHeJMCu4T+
	qtOUgUTQlYDpz2x3GuJO/53DiDdd3XNHxepJ8wxtU9+iawhBaBtj9E8c58G+Xhq/z1YTMMXtnG+
	4+ZK54N/BPIs5UVlHNcAgmrOv9C4rU2QuEljTy6GIDBLgScvQK4ENK2OzRoPQOaQi02aQfWwDsJ
	pK2X1+8klWBt+1exgODiuGwot+9reEoSZzfuCnE5Zdbq6q60rAYELGcbk5sjQ98DzCrfnTJZJV6
	Om2WYzgPXs03ytIrbKkWsKUSEq+dPVTbqEhu6n/uzszx15w==
X-Received: by 2002:a05:6a00:c83:b0:7b9:7f18:c716 with SMTP id d2e1a72fcca58-7ca8740ef7emr23213449b3a.1.1764513678616;
        Sun, 30 Nov 2025 06:41:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFooBrUHCXJXNh+hn4uuPyswxa69aKTdQI+xOphSuu/WoXXu0NsiSxAPQs59VloxTZP1PV1A==
X-Received: by 2002:a05:6a00:c83:b0:7b9:7f18:c716 with SMTP id d2e1a72fcca58-7ca8740ef7emr23213429b3a.1.1764513678137;
        Sun, 30 Nov 2025 06:41:18 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d54b003177sm5240065b3a.14.2025.11.30.06.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 06:41:17 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 20:11:04 +0530
Subject: [PATCH v10 3/3] firmware: qcom_scm: Use TASK_IDLE state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-multi_waitq_scm-v10-3-5a5f2f05a417@oss.qualcomm.com>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
In-Reply-To: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764513668; l=1395;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BmZ+WZn7jFHc45jlpLN3qi+ps/EFYUnGc0cv93TboQw=;
 b=1qa1ANAMPVU9NXxrmmx/zv0uZyl6UqzGMceDsVIO9uT49X04mshK+q+yrCPiZkstDhXCUzg6J
 s0XtSROXn4jAgdrUoXL9bp5BrtMN2uurOQKtcexU9etwNLm9Q2CtIOM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: Qb8p3nC_VfKMioRUckyaN5SnoZddiBwO
X-Authority-Analysis: v=2.4 cv=FvwIPmrq c=1 sm=1 tr=0 ts=692c578f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CXMSIrXqJIVyGMYrj-4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEyNiBTYWx0ZWRfX7Fmx5ZWHqgrk
 l5vVpZa5O5psLArXAFnBKBeHCL9iXjo/zydgiJMM+j85cFawpkeqkMWGHM5g5tA1enHfTVUFVW4
 8QfBp0AUCrxqShBRrOiqMZeR2xoJnpz+1GHHxe10VH4gLaxKNK/Cwf1UFajNMy6svjFDfkiQixo
 w01wO3yuoyO46o67UIR0z0zYFrMyMEBS55Qr/6JbSu3DBDrwIl06TpNkDogSo/fnaZV5ggTvmhq
 PiPxUmf9ANlOvSOCeU7N+lYQgLtX+ubGqvj2DEq7hJ/0ZagQOaLAPVJQOBJgTX4AQSUnjG8t3Pn
 Mgt60mMsVFGO7THwblSBiw3ur9Ik+a4KxepDlyoWZX8gfmDpIrGWqhG16puvwzH1M7BjeLwWafy
 uPn+a3qWmPK3eYmjQPIPuHte7CSweA==
X-Proofpoint-GUID: Qb8p3nC_VfKMioRUckyaN5SnoZddiBwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300126

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

When the kernel issues an SMC (Secure Monitor Call) and the firmware
requests the kernel to wait, the waiting thread enters an
uninterruptible (D) state. In case of an extended wait request by the
firmware, any device suspend request, cannot proceed because of the
thread stuck in D state. This blocks the device suspend.

Replace wait_for_completion() with wait_for_completion_state(...,
TASK_IDLE), so that the waiting thread, show up in TASK_IDLE state,
instead of TASK_UNINTERRUPTIBLE (D state). This allows the thread to
block until completion, without blocking the device suspend.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index ef3d81a5340512a79c252430db5f09cd8c253173..45951c04f377b725cdde4696d834435abd92f015 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2316,7 +2316,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1


