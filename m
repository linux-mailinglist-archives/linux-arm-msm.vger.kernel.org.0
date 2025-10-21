Return-Path: <linux-arm-msm+bounces-78145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BBBF5F3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 13:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C3C64E6D68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898BA2F3622;
	Tue, 21 Oct 2025 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ndahmqtw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA72F3618
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761044896; cv=none; b=HBd/jPQyz4ndZlZ/CPJwix6QpxCOagltwDe2n2wtCNNu5xIaxKVY/7KsUzsU1jez5WXLNs3PCZDVU960bzsImgABmWWdv4UT3ISw/2GakA7HVxG7T+LklN4fT/6XS7M5wo6r57fLetK9peS901y2KipZ9BKsRB/f5dYBgjQjuqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761044896; c=relaxed/simple;
	bh=UVetEv7dc6qihnycViKp+IETEpl1ulKaq7ZGfb1R8FA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e8oJw4mBW/ZDTUBZOGCbCc8HjK0XoJqPrkFLBUGWux2K/rr7ANRPV/8g33dl9dRHnV4GoeRM2xaflBp+R/AXyvN17HR65561N08NN2w3WbxaLZa+dl9Um4iLPPAk6zhJM0ij37YFb69w0mXJwLsp5wB2nyDlZ+XyscQkDQCo0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ndahmqtw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L86M9v004443
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3l5wVw7h7ylz9wNIp6CE9w
	dtrkbAP3+wCVWYI2nSXCM=; b=NdahmqtwjblekxRkqHW7183Km/jykVarFC1wrQ
	rpL1OyI+Klk2mm/NzRaGWKp6JbYyH/m/QieGIDJO1BajPmDHg2l2QEkOQ7JIYvt4
	lp5OWtf+SdDkhR6E+khwz3Vfd+wrbFPgZarKjXm6sLJVbcgfFra0f8EomxXrX1xs
	bNVprTcz2gEUo02K1AVOhhytqTtRtsyFJkoAfdaV4sYcvSGH963JSdG5put1dCdr
	Z/zTyOO68MYcW96eqVsKCbf6yDqMBpS3z+SUklBQwVEnelCLhWeoK4u1PHaXKJi2
	IVYdQUuXOCSg09heJCes+dNgU+jDUZ+SNnKOyZGc/RMFeBqg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfgd5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 11:08:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781171fe1c5so5247047b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 04:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761044893; x=1761649693;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3l5wVw7h7ylz9wNIp6CE9wdtrkbAP3+wCVWYI2nSXCM=;
        b=ueWaaJRJxKKwVq66HNV6JuQc8M6S+exOkZM4cIxthFSb2eB880u69XuHd3SzWo0NID
         rv0283zp0okSlbjlYAzMG8lm/xd/anidQ6KCtpMP7d1xBm88ZHl+fDQqVPO14mFMqHiu
         fxEXn2TX0NasfhKdoXmAoq7pCIc287kh5oTkZFqBTpoZ4YZJ+65Mf6tpyH6qjNFIzMP4
         m9Ros2d0lnKz1y9BdeOS61ztdM2rdu1rJ/m4nx260dTmXM+A4jIh+LgaPw1a7bhIwWAz
         9B7GaCqITvJWujwLYbh4jOlcUnQupw/WIYktI9fIc0mPqprEcwXWijdwBYfuQIcPpghE
         Vl3g==
X-Gm-Message-State: AOJu0YwCwCNQqFUqnWQ5iO+fOf3qlBX277Db4bd4TnMeoh5dnHE/1QC4
	cxwo0ee/vLDJskq534Tzc6xbJZDBSjuBxNqKX8vxBrbPLgCExnY0B2+xKPtUzFgfi0dE2XQsJCj
	KS7dmq9g7CvTewdhf9AMekFGo9bvxGwfedIxcwEzpntCvcSSm9hdfJm2/a9M2O6+o4NzY
X-Gm-Gg: ASbGnculyoft9nZz0FTlcJNogJZReH5U9faitGkp7iihKoFTs0HZMYTc7e49M5j+GWs
	dCJZ0cgits0QQ5FMCtLc6nYHQkbhe3GgRzxvs22fY9Pgd6PYqTASJNR2AanoG8ffWUPINQycUPg
	WE0bttSkLmhK58ofOcPbf4BdkS7baNyjV+OMYbAiF6lRUxIL0iZMLbYy/hiOlbVjTZKCvui2olN
	Sy3X/1aY6sA618UimGXzx7ZTnACbuzbzqB+lVtZgpdHusr8NnMNPe4uzpGcSwAGfTm5H/Hagmru
	TK4UFpFe3NNA530SoBxjvm4gB25luoRsgMdogo0NH0GX5HdUBwDdk3OmOcT7jItcx4+qvIIXfcU
	fQXXjm5R+D4tqS/RsD2a9TrLga2dxmOxNNI3NNwEq5896eXZxjjftDkscpxAT5glkCSZg
X-Received: by 2002:a05:6a00:238b:b0:77c:64d8:3afd with SMTP id d2e1a72fcca58-7a220b214b5mr21094108b3a.28.1761044893376;
        Tue, 21 Oct 2025 04:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf15yzlCVmkR3EWNDWylnvBCSoHMHlENggLmfDiluhkXBb7QFn5SPjGtfMYoMRyy8Lh7Ek5w==
X-Received: by 2002:a05:6a00:238b:b0:77c:64d8:3afd with SMTP id d2e1a72fcca58-7a220b214b5mr21094067b3a.28.1761044892936;
        Tue, 21 Oct 2025 04:08:12 -0700 (PDT)
Received: from congzhan02.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34b8bsm11057337b3a.22.2025.10.21.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 04:08:12 -0700 (PDT)
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 19:07:56 +0800
Subject: [PATCH] virtio_blk: NULL out vqs to avoid double free on failed
 resume
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAItp92gC/33NwQqDMAyA4VeRnldJ21XrTnuPMaRqnAW1W6tlQ
 3z3VQ87yS6BP5AvC/HoDHpySRbiMBhv7BiDnRJSd3p8IDVNbMKBSyh4RoNxk7FlY+eqx7J1iDT
 XlVLQKK5ZTuLh02Fr3jt6u8fujJ+s++w/Atu2f7nAKFApMXJnUIWEq/U+fc26r+0wpHGQTQ38J
 zFg4lDiURKFLgQILTLUB9K6rl8bkiQoBQEAAA==
X-Change-ID: 20250926-virtio_double_free-7ab880d82a17
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.kondeti@oss.qualcomm.com,
        Cong Zhang <cong.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761044889; l=1781;
 i=cong.zhang@oss.qualcomm.com; s=20250926; h=from:subject:message-id;
 bh=UVetEv7dc6qihnycViKp+IETEpl1ulKaq7ZGfb1R8FA=;
 b=+2jE96K3P2nEDXz2nqE32h52ySapgBjuDfpmmaxvxcyWPTxgX5cVa+SqtSFX28dIRkmrmz6yb
 Jdz/4pJqCx6ADrZYPgriwtXjoi41c4t2eZrsNiJTuuDbB4J+X2dr/fb
X-Developer-Key: i=cong.zhang@oss.qualcomm.com; a=ed25519;
 pk=8SBh3ey5igz2nlW+UFC6khFvaNPgG7MmbWtAeO2s6n8=
X-Proofpoint-ORIG-GUID: aOhJjbnEvh7hGL78SbvG6AP6p5z-Lfr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXykn/q/tcNubF
 /0IFPPifmRhfcPBOaVFcg4vXNGLOQj0CYK/dMNd1uPZSYEEykCVAGlOrHXDyYJIYW4SSWECFF6M
 Wv7ru1WOI/lGkepb/6zSfpQazYYQh8rftakNo2azZmX4rIPQd6260OBlzR2nO/hpIu0dsOfWKwI
 UodgvLN/IQ63v5QQnZ85Tl+dk0YQCihkzIfBH0QjHsl6C+bMtw/s7Zrd76bv+j/LeH6K8hD+/aW
 TIv3tpp0X8kMrUhiNmmjzzhPChBHhWR5hmnlgbP8dnxEv+nzPTn90aQTCNXTbNwAMbR8jrmLC5t
 4YS6E/kDyBEOBczYQ/H0RlFu/IUKc3wLP1vOquQMt1VhfoTmDlpKkxuJFhZyAIUMKZEyj7rAxe6
 6kBfkOJb5rJpOADxvyyaYoT+fu5H9g==
X-Proofpoint-GUID: aOhJjbnEvh7hGL78SbvG6AP6p5z-Lfr-
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f7699e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=47QlDNkPX5KzPiwYzcgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

The vblk->vqs releases during freeze. If resume fails before vblk->vqs
is allocated, later freeze/remove may attempt to free vqs again.
Set vblk->vqs to NULL after freeing to avoid double free.

Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
---
The patch fixes a double free issue that occurs in virtio_blk during
freeze/resume.
The issue is caused by:
1. During the first freeze, vblk->vqs is freed but pointer is not set to
   NULL.
2. Virtio block device fails before vblk->vqs is allocated during resume.
3. During the next freeze, vblk->vqs gets freed again, causing the
   double free crash.
---
 drivers/block/virtio_blk.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c9a9c0344d24f9fa06841eb 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
 out:
 	kfree(vqs);
 	kfree(vqs_info);
-	if (err)
+	if (err) {
 		kfree(vblk->vqs);
+		/*
+		 * Set to NULL to prevent freeing vqs again during freezing.
+		 */
+		vblk->vqs = NULL;
+	}
 	return err;
 }
 
@@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
 
 	vdev->config->del_vqs(vdev);
 	kfree(vblk->vqs);
+	/*
+	 * Set to NULL to prevent freeing vqs again after a failed vqs
+	 * allocation during resume. Note that kfree() already handles NULL
+	 * pointers safely.
+	 */
+	vblk->vqs = NULL;
 
 	return 0;
 }

---
base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
change-id: 20250926-virtio_double_free-7ab880d82a17

Best regards,
-- 
Cong Zhang <cong.zhang@oss.qualcomm.com>


