Return-Path: <linux-arm-msm+bounces-110731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIzGAFyEHmrQkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:21:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA666298C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A37DA304620A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A898CA6B;
	Tue,  2 Jun 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvvBIJvE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqhwGq/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60E21A434
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384681; cv=none; b=Sdi25mVOQty1Sk6FLbkjDaA9/uCSAj43T8UwFiRo4vN0SQVmssDfJIBPTzwRAiMzJZG9R5raMsUVUXNs2SQPr3HdsmjyviQkfWx3dsZauHlgl4jyERPRu5B5yGto/MpTvUuXfBiwP3VgUjs4r9/W0FUsMTddVYIB1oYgEK+IZx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384681; c=relaxed/simple;
	bh=7KN7x93W6aGKzndfTdkiK4lfejhnXD9PmLGQ7Mx1BFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dTnCsWgsuZBpQCgt0JrzTwIPgwld/iUxpsmnugBtepy7ltHdaAp2Se6mPdhxxspDGK/D+MCrQvLaIavjv2AFA9ncnxto3PkfNWINei0e436yDdj9b6jP6rxApm2PNdkGOAdox0LuUT4Ufr4HsSZJYuZeUBFPl23HfFg7ZtnqApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvvBIJvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqhwGq/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tZW34012479
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IEO53fTfGnYj/uK6CggP7yVALgVJ97/bhq7
	uN/lgdLg=; b=mvvBIJvEB1XNVOWuTCDGtvFQ4QXssMi4xBUIH7937bLuSajmpXd
	Xtp00Qb9L9+/8ZZOSyaasjRomZChRa+Xc+dUA+Y/A5maxwJtBT5qdCJw8g2d4vAR
	JQRA8px4oI3qurbeaB9GUZk2u/68bQVctsK+CzEggpOgzMR0LJkcO5wMkl4+k2LT
	jvrctL0jtLZV0VTjEgGUIQz81em6VUDjhlAdSl5BsEAQsWNnOQf0gS6aKLvJQ4Ii
	lp3ZGik28Ikot3gxzX952fhtK/z3bb7WIUYSXvPLQZ9UHhqirP8AVtYteLUmwTIu
	tEw/qVggJbR69rCgnW/qA0VgX7YZarKfBLg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4gake-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:17:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso3830770a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384678; x=1780989478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEO53fTfGnYj/uK6CggP7yVALgVJ97/bhq7uN/lgdLg=;
        b=XqhwGq/nfQgm3AIGHBmazLK1rU56QdE4vm6xAun2YslqJKk8CWWwP2Sv7jb1lm9ISQ
         N1hXAKolvRlwwYSx9kYmlOSYOi5uTUedfAh9rSmW6Wh8aIa+4PwmqkE0ct+yQ8+VHAmU
         z0E13mm8x50RnHZlQC6PYtzFVW8hr04X7eq3B/TUmbd9Z8bLO69S/zoIYUWszfHl0V7n
         ph4frNA2JQv0x0/pe8O3TwV0IfEzRz8H8Y626OPpuDg2VGlAU4Ygc94oR8gOeLHJTpfo
         GAnGr++Gip66P5OJmpmBM9vf3qgcwqXf43zPQT5jtNQa/WSZJH/lmq8/A67K6J9relzM
         sCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384678; x=1780989478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEO53fTfGnYj/uK6CggP7yVALgVJ97/bhq7uN/lgdLg=;
        b=N+oe/6ZcnzCINS8h0p85U6xVZX6EDUrCbbOtexW3WZ6BgpP6hp4hAcR7q7zm2WCcen
         pR3q+gQ6I7Ftsxwi5Aekf5mjCe1FRaNX9xNPhhHnuxuca1lkSb0Cs4TyU5Yp8kCBazIi
         MmnW4I7DVpNKneRj6LSIbm8IPZOrYt3XRRidfPs43BJOeO7jaGa2fNhf2XVVBroIrWtz
         Z6SUgqHlp5s3iLrQEsqjsDMsuJD6cUFnSovAkgANzFendlVHo0z1zpuuBUQiH+2snaz2
         fSQhg4sbWGoMVXQnU8TTmQCu/kO9p77xILZurFvaTQdyHO6xiADgp1D1nN7qzB9xSFFI
         3tRw==
X-Forwarded-Encrypted: i=1; AFNElJ+GNToH2y3M2i+v3zQ8kM393axcVJvywkrqG/Cl1DzLA0sGelBX7IbSHtbY1PHnjCz48NEZhDUnasSUa01e@vger.kernel.org
X-Gm-Message-State: AOJu0YwXpZBvFmJDaW/3bvzSz8gBwpUDo+/0dwedp9wc8qZLNfyIkRGc
	cv0jHsgqXWce9ZApbM7yiCLEo89oMQ9fRp4tosXwTwu5o7hLhwrHhBdeJywGTSzOViShY9Krlpe
	gArUXYq6PRp7iCRLsObYKuoBVUaH6EVyeSdLNBn0ytBjpJNBpuPE7r1Y6NmM7GSg5UpqSr8Apxh
	W5
X-Gm-Gg: Acq92OHI6eJqs8+Mz2+KNd/D1iRgDMC3ZvBPFsKELat5qA3LKEevYapaKUAxw4O2/LQ
	z3pEeq9AIIMEIRWkQocnsbHZSPKcP/oAsBNEhdP33+E+6umOcREtNZY3YrC4j5GkL1wSHdRJQ7Q
	mzuUeqRJav53kcMkduYtshxbGrdIJxVsja2PbhhOQjm5uDOBeScQk1tq4YtG7cpAt46qtD9m2Nh
	mbvk19YG3gtnA2AHoOx8tHGv1/wgJkGbF99sw4yFLjl//wMoCDx/azRuJklf/03zdINJqnrhoI4
	YHnVmaovSHZq6HpxCEQrICix3kM67ZIhKw5VfNItaCzMCqTXbBiOfv/oWbP/yM8Jl6l0AcjZh/D
	OZKcrtEXwA3wlNhB2qB7GWzQeutHS3ammMOAVC5Dgs04zUherAfLwLj/X+N7aOAHOD2EnlRj4p8
	A2x14vq+jMFlA8jR3x03f310uiUQrTQA==
X-Received: by 2002:a17:90b:4b47:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36dae6a241dmr9389528a91.16.1780384678466;
        Tue, 02 Jun 2026 00:17:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4b47:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-36dae6a241dmr9389491a91.16.1780384677982;
        Tue, 02 Jun 2026 00:17:57 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91c9991sm1766279a91.7.2026.06.02.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:17:57 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: [PATCH v7 0/5] misc: fastrpc: Add missing bug fixes
Date: Tue,  2 Jun 2026 15:17:45 +0800
Message-Id: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NiBTYWx0ZWRfX/LE2ir87PJ2f
 yxOryf+hwThpuXbineIJp4ux4MP+utWH8/d0EGFLjWM97Rt7bhzNnYxY5AP1PG4vJPeRxAj1/ml
 QdQGzpSIE5U2SPz7+rOoMMk1QZNn73Wg7at5izeEb+wq/A69hzneUsRBtsqzEMs8T2urYQtQfgz
 ZCbg04kpcje+31Rj95iNEsj1jNDVLj0mtWw7Z2S+PKjYPtZNBz1mIHXdzGQe6Hv7AkUh5GApUaA
 itPeBfqG+3wUzD7EoHwI8gty7qjdWZO5gcs2/WGz6qKUclQ4cRX2fVo9OVmkg/P3YOm/9sFq+Ll
 qyP6SwR7PGpg8974I7o9Qgk1aEA0FvHOSUFnNP8cZ4aNaZZNUwvbfqgGJ+KWdHFJ7e4vQZMTlGi
 L0won5jA3moDx4eAKJz5unXePq6eiCbtdkx1LUZBC3CyQnH964xONiSGLKA0nU0f219mEv97bKb
 6rnOt6662fgtMCwK41w==
X-Proofpoint-GUID: qjEDNp7KkAWWZQ5t1Q5AWtEaElfO9sRe
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e83a7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iZgqdknpxvlyNCGGVIUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qjEDNp7KkAWWZQ5t1Q5AWtEaElfO9sRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020066
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110731-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.993];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AA666298C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing bug fixes in memory areas. This patch series fixes multiple memory
handling issues in the FastRPC driver, primarily around the Audio PD remote heap.

The Audio PD uses a reserved memory-region that is shared between HLOS
and the DSP. Allocating and freeing this memory from userspace is unsafe,
as the kernel cannot reliably determine when the DSP has finished using
the buffers.

To address this, the entire reserved memory-region for the Audio PD is
now fully assigned to the DSP during remoteproc boot-up, and its lifetime
is tied to the rpmsg channel.

Patch [v6]: https://lore.kernel.org/all/20260526111124.515-2-jianping.li@oss.qualcomm.com/

Change in v7:
  - Removed duplicate remote heap validation check; keep it only at
    the beginning of fastrpc_init_create_static_process()

Change in v6:
  - Separate the handling of err_copy
  - Place the check for remote_heap at the beginning of the function

Change in v5:
  - Split reserved-memory handling into separate patches

Change in v4:
  - Fail Audio PD static process creation when no reserved memory-region
    is present, instead of silently proceeding

Change in v3:
  - Adjusted the order of the series, placing NULL check changes that are not bug fixes at the end
  - Modified the commit message to describe the bug background in detail
  - Switch buf->list_lock back to fl->lock
  - Add locking to the operation of audio_init_mem

Changes in v2:
  - Remove the if check outside fastrpc_buf_free
  - Store the spinlock pointer in the struct fastrpc_buf instead
  - Allocate entire reserved memory to audio PD through remote heap

Ekansh Gupta (3):
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Allow fastrpc_buf_free() to accept NULL

Jianping Li (2):
  misc: fastrpc: Fail Audio PD init when reserved memory is missing
  misc: fastrpc: Allocate entire reserved memory for Audio PD in probe

 drivers/misc/fastrpc.c | 128 +++++++++++++++++++++--------------------
 1 file changed, 66 insertions(+), 62 deletions(-)

-- 
2.43.0


