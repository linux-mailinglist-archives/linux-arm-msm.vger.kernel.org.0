Return-Path: <linux-arm-msm+bounces-58256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB76ABA8A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 09:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B1C4C10A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 07:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF681957FF;
	Sat, 17 May 2025 07:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvd3fKQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64202B9B4
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747466681; cv=none; b=V0dQz92ZcuZ9C3hJHtbYPMoRZkZmni7X7NihZImGZOBoDI1vbq4pL7sGDGV0w7/lT8rvyOXXYtz9gauvuJtBG4HdKi5ohovy5zdtEkqkdclGw4gc3Oxlc+vguCRJz2pIV8WmcpJ9X0pzBxErncayVw35pYpFVy7tst9cRdqvK9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747466681; c=relaxed/simple;
	bh=64MV42yPMyasE/soZx9Lj9q2sYVO0kQCsnB+OejFYGw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nRWOOQZBXkFnJNHmf/TnVCTFYuAOsM24rR4uFxKPlcD6uoGdFIpTesSpervCkLow9JGXI4AgI4KkObZofXieHgQctJssXJeeByh/NMICUj3I97CZxc4iBWd9P2frS5tYKSh3EiWnmQFyZng4F6/8s1uaCiM14QLV9lyjy3oC9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvd3fKQ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H5BHQt011787
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 07:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ateaK2dLn3di3X67T4QDk0Hqoj/IdrKl+Gc
	MTCRfwOY=; b=lvd3fKQ93z/fkFzkqpGK/ORUXu0qLAukvTWKxYt73VBMWBwPnUT
	LaSOBVwrLYwPS0U8gvitONf6RkwAWUCTkqhoOiG10SqJtd/YOtXFUT6CL0ycuXdt
	DZHwkTZnKhc1v5BCta81gKgkutUjo0QEl7hgDZUZRVV8XgGRoyrH7+8+mu9Q+VwC
	Btsm/35cj8EHEf2f9bgVvzvsIhJpC6fVE77xl4wuwC0k2CvuO0NowetqAhmeGfYH
	yJCVvTHw7MZgEpMjUZhKfEm5eE+lDtlgAN58ZNX+snzCbSf9fFANY26ECzuJxUxK
	izt/lbtQq0BLFXYSuiKXz5SjpEkpw4X6DsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4r84f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 07:24:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23209d8ba1bso1162675ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 May 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747466678; x=1748071478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ateaK2dLn3di3X67T4QDk0Hqoj/IdrKl+GcMTCRfwOY=;
        b=qe8a6vfQ8nel6t3hsbl1MfsVO1ONE3E2NX6I6BfGzWBidvTUp+s9aBIYRODTueJKbQ
         KMNAqZnG8FKl1+mes5191LoYvnBOAUD3wbquveg7AzIZvrJp2GcjlE0BzBsNgcOwnh3H
         Ev77d+qTir8yBPB0qOs/bRQ+J6DUBOfAlr/XVXbNzCYWs11V7k/m7Fr3dcbyY0+IBl+7
         EDJGDMr5UcoWztPf5ZESu6JMDOdMJ5GGaw4hqTdHyqF6r8AVxKIHVcVG3H/ew6jD472A
         0vSgIL3EzQp4CUBnOBJXfVH/diBHz1M6uixinKcMrum3KCTvauRmUs4njXl4duzug4wI
         PbsA==
X-Forwarded-Encrypted: i=1; AJvYcCWwEdq9UTCsl0gxZko6HkR4G5y54oP2cqsSK9F6GVscyPpxOhcpOVgg/y+nMu9HEYCrYlUmzp9hhYc+2dNp@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbSi+aXQ8nZE/yPdB3gUV6NiGAFgjlpRcQE7VJ4L57Rj4YA9B
	rxI2xF99eLAnWImRi0fTLebK+0+w7YIIA7GGv/C2yRD3T+13iH6uUoQDixQUoFd6ci7iWrbY2rs
	HytszCYnfRvEb2IqxM+95L4mcaQ5zDOQOOHlsR6AjeVYZF8P9PJn1Zl9FV4RQv8AXuWYj
X-Gm-Gg: ASbGncvctTYCWh6cE2jRGF6rHzM4hYN0nE0PTye7Fxd7jFjyR14EqDLEJFq2HMGNWiO
	k6rz/bAdimIXAiL+Scy6GIJ46IlAu5ubApbwzZCL4UPhTLy4KXhI2aRabRhfSxtyx2NyEfyumTM
	SJFCqG5KPdPR84i6yjVZ8Z4X+Mg5xc+lYf2XBPfQUvFjgNyvb2UOImIFUDaJTr2TGDOykZVe+Z0
	pf3ri23aBJPdJyNVpEe/fNJaoSYhLsludHQ5wRZ03QcPLGs++9FzEX5ZEF/vKvtyA2WzhASxD/V
	qgnfgs5mzzFfSpFoYyBcHgPLXeu9LVukeNjVTHkIJFwM
X-Received: by 2002:a17:903:1acf:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-231d4596902mr100791515ad.38.1747466677680;
        Sat, 17 May 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFokspCYygX8RNukSar0XI/2+pvDnDJIQBo2sU96XiQL1vom3EPheBI15+XDMJWNISAqmBkhA==
X-Received: by 2002:a17:903:1acf:b0:22d:e5ab:5525 with SMTP id d9443c01a7336-231d4596902mr100791305ad.38.1747466677279;
        Sat, 17 May 2025 00:24:37 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac959esm25185225ad.33.2025.05.17.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 00:24:36 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: Fix channel resource access in device_open
Date: Sat, 17 May 2025 12:54:32 +0530
Message-Id: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682839b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9DS800j8OOefGsPzyAsA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vw5h8k1ATPfkyts8g47BjCKBYctQpFYK
X-Proofpoint-GUID: vw5h8k1ATPfkyts8g47BjCKBYctQpFYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDA3MCBTYWx0ZWRfX3vOxROFeSKVA
 j9ehj0WezPj/G3lsJM+oCAcqlHRs7e5Vf8qhsZmiT/3WIoraOf13duAMMzccRGQpyc0lyDxHf2k
 sCKEXs1GcYspPdusag/q+h0WODSuYZ3SXSy9x61NcEsg6eJhKgDUXDN5Zijr/3DdiDtopS0Ylmv
 BphSafA7Ua3LUr7uFtK5gKOxJQvkHIyCL8pF4GaZ8fxHLgscQiJafOGg2fYcDpMjB4HorIgtXs3
 EiE42D992ST9L0+nZSgjcTmd3Lh6gFtXh2l7NZWmlSlVJ6pfPoJf02oBhJVQEOEesGV46vzeucD
 JaeuGgwwtoqudtaKgTDKoXgUGaTA3GgPJ3rVAwTX2z1qNI9JEgmi4rW0TKJm4GkvRjYtzzLklXu
 Ey9XIkdjovOG5PK+cPtvIICEMX3/gn+BBeUfQsWxTp7FPpewGe3YiAeBR7YqyIDimqfPsDxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170070

During rpmsg_probe, fastrpc device nodes are created first, then
channel specific resources are initialized, followed by
of_platform_populate, which triggers context bank probing. This
sequence can cause issues as applications might open the device
node before channel resources are initialized or the session is
available, leading to problems. For example, spin_lock is initialized
after the device node creation, but it is used in device_open,
potentially before initialization. Add a check in device_open for
rpdev and update rpdev at the end of rpmsg_probe to resources are
available before applications allocate sessions.

Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..40c7fa048ba7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fdevice = miscdev_to_fdevice(filp->private_data);
 	cctx = fdevice->cctx;
 
+	if (!cctx->rpdev)
+		return -ENODEV;
+
 	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
@@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
-	data->rpdev = rpdev;
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
 		goto populate_error;
 
+	data->rpdev = rpdev;
+
 	return 0;
 
 populate_error:
-- 
2.34.1


