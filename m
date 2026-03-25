Return-Path: <linux-arm-msm+bounces-99936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKPxCTUxxGkAxQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:02:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8532AF23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82D44304B36B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8B1341062;
	Wed, 25 Mar 2026 18:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AH6Y5ORw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XP7pl4Sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E9134D39B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465178; cv=none; b=tlpsK0fuBvmlaQh/v3/AV2Eqa9IWSs0MZ/xjftIGa1b6XCKRUfahsNtq88lRLEFz6sTxDTWrmUFoXiFKPaf7Trzl2zCwV60Yb0rvaHePMbs0VfxRDPHEYUAHzyFrCVrnXvzwwLzMLyZSA58EXJ83RFIoFDF0zk3SYW9sAOzx4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465178; c=relaxed/simple;
	bh=5/SJDJkV4+/g5MuOk9P15f7tRAwVbeu/rhg0gcRd66M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pd/K/3UVrP27uXKxndUwqeBCpGi853TXG0UvnFLERJ33a90iQw57u2NiBJ0B/wy6kXEN4THLsvkbpSbHMl0Or8KKZiGsVLbPED7HCJC9ZOKV3lj4o53y0wHMjwxD8ME/yAfj0VMEEOx3LvJX41PJYCyUTbqWCI/6XqU4i2oghbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AH6Y5ORw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XP7pl4Sy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH4Wc265548
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jQ/oQs6UJQqcj3OwossbpML3FdcdNFDAZeD
	Kh0U7al4=; b=AH6Y5ORwmX/fye6TGIHruZfMQHtoZP9RYg+ew2hfYoNoeLFpp41
	q0mVpuN9vD/dD4zD4tTUaCo5Bo0jAZ9iQQicEkBUsZvY4Lq18wW684EsZddKYP2w
	LWO0bRNJBsvtaDhUjW8Np88teMNVSQB11XaZrx+/gGn1YAR0+eDO3QAlk3DhfRKD
	NpVeu9f3beC1MIT2x6dTpEAc7KZFn6y/xMJ8MXp1ihsuwZgQy2Lda54r8MquR3S0
	cOHwGMuzm4AsQG2AbS8jbNTxuE1OsX0Pk0rYlDc8b1jRGujLSjAxb/UqUaHbrdAD
	aoC4V8N07dCE6W3tK4OX1OFNoUiuxqwkvDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40ravjb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:59:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b060c14ccbso4433725ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774465173; x=1775069973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQ/oQs6UJQqcj3OwossbpML3FdcdNFDAZeDKh0U7al4=;
        b=XP7pl4SyFrbWflJxzVKF19ziusXByVk6m5VoCxHl98OUFiHiZ/DucuFYRdX6nDIx2m
         c60ExNOjSSg0cYC0VrLhsNU0tON2uQpV6Gc7FCZmBqCVgrCpkjBGo6UQbN98MQvFenNl
         nKVgC9O4tfRZbE0qlluuF6d6P+VsgCKInAerFdFJ5+fg+Y4FdWFeTasxOgRNlykHaKen
         JrRXfp92f07K/5QTYG1s6TLsi2G65406MN/I6sqGy+nbtmz9x8Cuhiv/q9exJbXdiHHx
         wHei2eSAVtl60flnlM0p3lcyqpn/W5kgzohTj2ytarBmbsxDn5Ur+oTKTRapy1jHSjMk
         r25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465173; x=1775069973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQ/oQs6UJQqcj3OwossbpML3FdcdNFDAZeDKh0U7al4=;
        b=Fy1yl5OGKiVwcUuC6h4Ii6TrWZ1qsxI8EmBEj6aaZhH6fpdyGT5P6wEbyKkaX0ZolL
         dKQ5RpyIaoaw1MsAH5fXL1HDXBNR942hDlpynCRBsuBxIzrT1oaqT1DYvkJ4iO0z+X6y
         I5piOclMd0gHa0ONeFj6uj+oobpgM9kb2PLYwff20DFVBNJGEGvQGeVO1X5Q5S+g2ODU
         MsN+E/uljwE9K45swJAWAwiRYgmDU6m7oBodvl0WtoSCnb/HTQcSzEqTpPd3U/Ku/Jxx
         joBZELNSo71pxgLENlJLEnKoNc9ukOfiFy1a7m/e/e9KN/8npslgxLUf0e3b9A7KUdXo
         olMA==
X-Gm-Message-State: AOJu0Yw7rEKPAQsJ8YfdiV7+AwBIDd1HgwKmLuWV5Lyfoq4O2SzFFliY
	iWRZG7tNwjdyLnX4inN5e0UTd50tIpdCgqjOseK8gWDjk0PSwAjN2PEnHyuc93uyrs3ahKxe7+v
	gxPKbAc1kxzepg5woY9cYUmXO0etZoIeV07YSuB4qGh41rSzSkkACHS/1Iiqj7BJsuX7P
X-Gm-Gg: ATEYQzy7+Giti4OpUW/Ie87etIrixOEf3EbVAfZfgsmIXkI20Ibycl4B5JaV4etZ01m
	GI0qVlBTG5ie2E4eDQp1rDQJSCnU5ipR7XDD9wnvCu0WTV16owBpNVrCpSMRextULTZORK5ef6w
	oyLVoy9z7Yem2Z6z1dIbGzuo8z4tGTxYOaafqn7N4xrK7jR4cBLT9EzbQGs+OIXyjMpWloRbO5e
	CGMzXaz4ag/bl50r4BmJ3xOnNcRS16L0aQkT6T6FasEKpz0Yu6b5wmocOYsznWiqxuKg0Rd44CR
	vFgY8R8HaimZ76L++i6jnPx+DrTjeW06aezNqVA5tnosNO2qt8DtH9AGDDkeyrdjnuQk+aZ355L
	vYi+EuIKrzSkcrCihKcljqV3xh7890PQs
X-Received: by 2002:a17:903:1b6f:b0:2b0:6263:6a05 with SMTP id d9443c01a7336-2b0b0b1e31dmr50542385ad.51.1774465173018;
        Wed, 25 Mar 2026 11:59:33 -0700 (PDT)
X-Received: by 2002:a17:903:1b6f:b0:2b0:6263:6a05 with SMTP id d9443c01a7336-2b0b0b1e31dmr50542095ad.51.1774465172583;
        Wed, 25 Mar 2026 11:59:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87ebf1sm5764125ad.44.2026.03.25.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:59:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Reject fb creation from _NO_SHARE objs
Date: Wed, 25 Mar 2026 11:59:26 -0700
Message-ID: <20260325185926.1265661-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c43095 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=LRWyuCbFSbfGocd5_k0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: W20GwNfnmAkpaqCqUyCWcT1GEJ98khOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzOCBTYWx0ZWRfXwy4B90cH7Unb
 j7BGHP1v7eQ9mNow8aLxBPw6VYhhZ2SU6vP1CIBArLxe7Dmad5dgMsTjfJmy9vr0nexlKwHIJR1
 BggX21dw4o40pKE7ks86vNIqSOzoytHplZh1cFUb7jIiRZXU8Fbug5lX8ZYkFu9IRzkamXKhZle
 KQCm3kcsOM50UD1d1oNHs3SrX9XIuS973ud2UlNnz8aMAWT/OFFLYtf11ia+39jhsG+rIQIsoG6
 iDVUXchlySgk4XjXunu8wWr+Q16DDvKyzETBeKXgX4WpCFJ3GLA1C3iD8BQ7BgcgTDQDths684M
 lgGtyLOlSO2Cf7LAwveNpJcJAd6A+e6tSpRPR4YK5V1mQFTUu0vHSfJ0JSVMraxMZMZhb6sm7pG
 jKQrNEBCE7TFoMk/9WMerZvbWN6He0KwWwVkpALDEohGvGpEHCxqhbAHFChxIETevKXXnidPciw
 aj8XMXvPsLgblrvhKIw==
X-Proofpoint-GUID: W20GwNfnmAkpaqCqUyCWcT1GEJ98khOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250138
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88B8532AF23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It would be an error to map these into kms->vm.  So reject this as early
as possible, when creating an fb.

Fixes: b58e12a66e47 ("drm/msm: Add _NO_SHARE flag")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 1eff615ff9bf..ce1725990a48 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -219,7 +219,12 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 			 + mode_cmd->offsets[i];
 
 		if (bos[i]->size < min_size) {
-			ret = -EINVAL;
+			ret = UERR(EINVAL, dev, "plane %d too small", i);
+			goto fail;
+		}
+
+		if (to_msm_bo(bos[i])->flags & MSM_BO_NO_SHARE) {
+			ret = UERR(EINVAL, dev, "Cannot map _NO_SHARE to kms vm");
 			goto fail;
 		}
 
-- 
2.53.0


