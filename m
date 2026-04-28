Return-Path: <linux-arm-msm+bounces-105057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI5ZLjLu8GkvbQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CEC489F3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 19:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 821E230B759F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED49433D6F8;
	Tue, 28 Apr 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hq8pIB9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1zOn8da"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA333BE14A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396906; cv=none; b=TYMCvwKxQr3n65SzlRLQlM5szLWHtBOIsT1dwKvNXoZ08Lu9+d1FmIDjHF1NOyP5VQJqDzcwuDSw1k5W+asLoez8zEFkKiMv0nRgguYCPM/TFd+/qv/rKWW4Dty3WNnjl/CDMbZHyoz+4ZIHDNqz0uVfW1uJk3Jo4UYknsxpuX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396906; c=relaxed/simple;
	bh=5AJj5gyS32IvdocMHajacRucw/Mcc7Uzq6Gz+k1sSWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LRHYm5DbcVJZFTV5Aa2QM8YzsX/gpUw3lXhdvLEZtbvpHEaLK9/vYiEHprNY1pMWh24xqF6y3WXQp3Wp4NyK2O81N2+ja6IpqGVXefQgpRY0jrqM0d+xnWcy1Jb4N4bmJu/hMbdd0fndJKwMxKw+wg8VXxb1WaZcvge+UdqXmCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hq8pIB9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1zOn8da; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsBi63634312
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xn9wqdSEMs33syKczrigyc
	4LqCkPv8AmhRyIXWRuaVg=; b=Hq8pIB9prRvOZD/7ftf72Zaz+7Dawl4GP7e2gv
	NHkgfA8DCa8v4YkHYW7qWGUWCT68vS6C+Upipl4hRf61kkfedLEvhwy21r8rK/Ih
	QaD9AY90txWWv4ME7yDaS5wE0KaTwqupwhTMW0VJ3Cc969LC0lZhQ3NR4R3i8pEI
	3Mv2Uvasf07LJyK4c+WekyA6xndp9dLzofmbalnMJJ+j0R2RtBB0+OEWYbnXg5Yv
	Gtb1hBYh8/Oj3Qdf1RYj4oMNr9ydjJiROH8xj/1RNNDWJ3W8M8q8AdDodl4QeH3o
	JfFG7JFgtgT5hnlhoF/MnVVjylVeUs2ANzS+AwJdfxvBBzWQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dty87rjbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 17:21:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56db8ed8e40so10193241e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777396903; x=1778001703; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xn9wqdSEMs33syKczrigyc4LqCkPv8AmhRyIXWRuaVg=;
        b=K1zOn8da652NabquIx073zcPEO43/WjG3SZj3KrjMwrMjXFYch7OlUQQM3o/AW/4vc
         nfXhh/GnFGPWR0NVw6en6mxXdbZ3Nzps8lJ6KpBEDsM6GTRr19z/HgEjE2bzFP9RUePI
         F6S3fhTk1RJBBLwOA+ycU1YumkgfHsI48E8ZWuziEvYmo4rCtz7jHyvzkWCv4624JcD6
         nEJkA2gekK4d4e9zl4O3iwZR5a6gDo38fhAGIrRYkKlZgA4gTJB996iknH8FIs0B05gU
         72X95iJ+nwb+tL52VS91fYxmtGHXOlik3T8vo0cUm9lL9nykQ49n2Rz50Z/1ztya1h+T
         yhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396903; x=1778001703;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn9wqdSEMs33syKczrigyc4LqCkPv8AmhRyIXWRuaVg=;
        b=fQXDNLodnDTCU7Vg/nzpXNVsQydq9LN6BdQ9gm8eIZminmOG+doPpUs92fOsoYfjky
         3fzz0EbefpUpFEhWnlppGPQaUckSQb6XC26iK39M++QJ2OFYeteiHMSa58aFLY5AzIwi
         n60ADhy+noZMOyytwj9Eb5qzgjsVyeDjbWxAb1u5f060pWELjeiTSs3UBj/ZFOV5FBco
         Y1J/a1a1HO8ij7KOyQ2D5PHQsLGEEn/R6B9X2Dmcya2dhovtcGdC90UA2CWgf6y5YHjk
         B4TB1p0ykJs6qTBmONPtdyJ2HPxUPAnXOc3eI0YQ6wz4V7Vr/B1zGSOBXoP5JP7fSx5h
         xEZQ==
X-Gm-Message-State: AOJu0Ywk/NSKOU6OVjX7ABrkuqT20dLHqKZo72CukbeLUInmS/y61N+E
	HaLhCuM3NKBovCxQ4swADu6y30lSNrctrWkMYzcIzU4YMKxbRDrDWR7uwPTYQ1HgXi+f39mTsN7
	SaOqvOpmerzlZtuXK3uNer/u3T31FdzuUqhT0peeXdHLpOQ8nIqFtW7aJVWCypxAxv8pv
X-Gm-Gg: AeBDietR/2iLokr0g2Jkqyb5m908f0ijhiEuGo1t3CBRTrnSxrIG875gNsiuLXFwIKp
	I1PAuvGAknx2ZXSOrltbdgypApxsMe49YvIBYp++WJ6Wit0dTmSLYScHrHJv1cRjyTerwXyr2CS
	78q0pr05AsFA2qNM7ddP7JAAvKrALN2BKe5MnqmeKuNk6PkLoePVwm9/9By+ADiD23mzt1QQe7m
	nY42scIrcaZziW459k7ztS8fmL6rd9lvVEjSaQ3YFFAcQ4VDgeASt+SZPv4iK1SbKP9L9v/4EOv
	6KCP42/cmUuIbbhHjYA+GeTZkbWDA0FnZL2g1LNZdqVqyZBB/YMjahQpCwhfTxvI6bCRMnXl43C
	mLyOGA4dez7OqLh8rnpLiFAzVPRWW/yyjVipRJInZR61lYcLwR/G02/nqFvotQeXusie7En90N9
	GHm+LctNLyusHGsmms6rpq9fwDUxH0PIvEd5Y6cj2qrODxmQ==
X-Received: by 2002:a05:6122:1d44:b0:56d:b4d1:3c3a with SMTP id 71dfb90a1353d-573a530f08fmr2515046e0c.0.1777396902875;
        Tue, 28 Apr 2026 10:21:42 -0700 (PDT)
X-Received: by 2002:a05:6122:1d44:b0:56d:b4d1:3c3a with SMTP id 71dfb90a1353d-573a530f08fmr2515031e0c.0.1777396902255;
        Tue, 28 Apr 2026 10:21:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f52e8b1sm8950271fa.23.2026.04.28.10.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:21:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 20:21:38 +0300
Subject: [PATCH] drm/msm/dsi: don't dump registers past the mapped region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-msm-fix-dsi-dump-v1-1-5d4cb5ccfac7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKHs8GkC/yXMQQqDMBCF4auEWXfARG3Fq5QuNDPaKSRKRosg3
 r2pLj8e799BOQkrtGaHxF9RmWKGvRnw7y6OjELZ4Ap3LyrXYNCAg2xIKkhrmNFWnh62r31ZMuT
 bnDjvZ/L5uqxr/2G//DtwHD/vbr1PdAAAAA==
X-Change-ID: 20260428-msm-fix-dsi-dump-14cd71b5c33e
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5AJj5gyS32IvdocMHajacRucw/Mcc7Uzq6Gz+k1sSWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp8OyjNONsypGXls+eo1YAT9pue1gJLCpD4mCfE
 FI++wCgWh2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafDsowAKCRCLPIo+Aiko
 1e6gB/9xe+C09T2JJBbS2bxIoXqB4T9B80/eImmquoUDc4l6N6VFEDPI8dQ0VyJfvLaUAMTXemy
 gW47ojNdlwVAKV7XsDy35ci8kiT4y7Pccmvn+GW8tZD7ihPHjD8EkR6ySMZmIIbrZCUq8d9RWhN
 dNxyBEdq/3F7NV7MwYSyhxgxQ/v1kuMSwZ1vpFQJa6+yHI9el1WMeCCnHFn12Z/Qtz+FqoIwKbp
 67E9Im9yLj8nWnFWpYU8bkxs0vBHQ/2/HSygXQG5QPln9xXJlLY73xf7RRn0eFFpwAR8l2fdkXQ
 8AGNBcNIechCM3HTh0c+v/7YScKfdLrBUkggL2MjweH0yaiR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=abJRWxot c=1 sm=1 tr=0 ts=69f0eca7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FcX7t0_lAfRerrM-ltEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: OH7lTvuWvdReL9JzfN7-vuJRR04zNu40
X-Proofpoint-ORIG-GUID: OH7lTvuWvdReL9JzfN7-vuJRR04zNu40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2NyBTYWx0ZWRfX2HXTq04nvMZq
 F+Bu5kr2OzAE5oe+3Dy545tGyYTiz7i876LHN/+zPc01W3YyNNnJwUZ5qATQFYXJelKWApdySd6
 DP6xXZEBdgp+6hkL8efXjBuJY8TZ33rVAN7mUznyCXcljA3P2ws1yAd60fUtBgs9nk7RSSnjdY0
 m32nqo3I55s60aniym7qlLZQKDaHcB140hx4Ll209e/RNf+4lG4Pq2Uz2HhwGXbeE60A8l5sRuP
 7G+hPx0busSTbbJjGBcpcjcw68y0i0xDql4ZXQ6MmtyTdrJNTDNPkuJK0VXxlMgeV9dyRGUSMY3
 8c6+2rivy7HsrIf7IIYa+38GG2kM7RhxIIrAJYOHbiVTIacvIICvbBbNYIg6eSYjtJC63YgnKtG
 Ro9FcltE4JVI2muIwk33f2rYlx6oy+xsVI5bLd4NDmOZAbhjffLS52meIQjvUITSpg/I1Ln7Max
 eW4Kf8Tdbu04B7LFYvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280167
X-Rspamd-Queue-Id: 37CEC489F3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105057-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On DSI 6G platforms the IO address space is internally adjusted by
io_offset. Later this adjusted address might be used for memory dumping.
However the size that is used for memory dumping isn't adjusted to
account for the io_offset, leading to the potential access to the
unmapped region. Lower ctrl_size by the io_offset value to prevent
access past the mapped area.

 msm_disp_snapshot_add_block+0x1d4/0x3c8 [msm] (P)
 msm_dsi_host_snapshot+0x4c/0x78 [msm]
 msm_dsi_snapshot+0x28/0x50 [msm]
 msm_disp_snapshot_capture_state+0x74/0x140 [msm]
 msm_disp_snapshot_state_sync+0x60/0x90 [msm]
 _msm_disp_snapshot_work+0x30/0x90 [msm]
 kthread_worker_fn+0xdc/0x460
 kthread+0x120/0x140

Fixes: bac2c6a62ed9 ("drm/msm: get rid of msm_iomap_size")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 565d425f88b8..982abaaac00d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2033,6 +2033,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* fixup base address by io offset */
 	msm_host->ctrl_base += cfg->io_offset;
+	msm_host->ctrl_size -= cfg->io_offset;
 
 	ret = devm_regulator_bulk_get_const(&pdev->dev, cfg->num_regulators,
 					    cfg->regulator_data,

---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260428-msm-fix-dsi-dump-14cd71b5c33e

Best regards,
--  
With best wishes
Dmitry


