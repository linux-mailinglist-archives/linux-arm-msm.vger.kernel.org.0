Return-Path: <linux-arm-msm+bounces-90396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B7NJjUcdGn82AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 02:11:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E37BE3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 02:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B55FB301A731
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905331C5D77;
	Sat, 24 Jan 2026 01:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqFiAPPo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNiyjKif"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5616541C63
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769217074; cv=pass; b=FuY/nlfDLFNyMF//96DZ1DWwoF2VFmPdCavT2lT/2uyFAO98cta80KBeIj5/3z55BdeRXarBMkPM5Y0fvZcP9scKttEYXwzYRmpv8SrMSpwfYqFOS9QjsJG6rK4TsFFr2LDfIJAU1wkGNWYCXh/N50PhzuybcUheok9qIZVnqIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769217074; c=relaxed/simple;
	bh=DLeu3LL8HAmsn0r30BrPSs7mZjZrYe08im4XveoAB8s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SsIjjkiVbLKdv5ZEpC6+QWw0DuOAE5by41O2Qj6jTRAUfoQLlKDPDyS+RLjA27TM4Jmw6G9vsNHw5F4vAaP4G9JF8+Iqu6GkNoICdnDlu6uRDzGWnjcy8dfjfC5Gzvxqjw2bgssFqEgUC6LSWN5r2auJnUfn/+RgPnT80vpLDZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqFiAPPo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNiyjKif; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NFUqke1848614
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 01:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63D
	QQGCqs9c=; b=PqFiAPPoZCCB8o2szsfzdXeBjbo09PybAb6dWk+TvJeCrOx3azf
	aCeR/E+AOYmIw/PUGA5emZ5NuDO44SmfznkgmFI9AmfY+U47dlQqb0RPCOGo+7SB
	BOyDHQWRnIlquyKvQjBSZEeBuO5OaLEMzm1HeT2wm4zDPWxEkxxjLKYFMY6pYgEO
	h4syc2XckCxuFmpc/KLC0O0HLHTYza/5ZRXOU9qN+86+3AM6Kld8LRP39Nwtz/Qq
	DJoDGTJhT6oLa46K86m+D+nrtB8v3+Rem/ojFkIa5isSCgO9OlkuQXdBwrc5b3R/
	b98yGTs9H+19Ynj2sqINIkZyClbV4qAQRfg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvbpn1cqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 01:11:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123349958b2so3099256c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769217072; cv=none;
        d=google.com; s=arc-20240605;
        b=hMTgwOEgV0m50FAm0ixT+0ER9g/OfPpJ2eaBPdsDu/7nZp9at4OdREYzAuFgjzfGX9
         3k9WVUMltSp2rTcWTuOGJBZ0F0CK4UVoPpyDFQn/qt3tOLR8MghYfgs0JhdRnKN/onk0
         7L6G0FOYpOi7awzsMo2Do8DpOGCcKZ/dtZ80bj6xdFSjemb0NBBGOv69NMJ7KxMrkxzZ
         bJLyixMbtac1T9GmvuJFSe+mO6U2FL0PkW28E0EBvikEbx4GLKg4p99/calKuul+GSuR
         YdJJ/vE3aPI09dqKiLMqZj2VCAsmP+7aXlRya7wpQf+JoxWgpnZoOEmEuYKNHAZnztIh
         WoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
        fh=3NV9nXjfRXLhmf0iSQS5AKaNHvVzmAiCHIKbzXq7Fi4=;
        b=f1uzdh3AKp4+eodoYgXGT01yCI5ikclZyrSxlyl3d1Lwi7zXcgcRkAigzFNbJxNZAq
         cFWmpdO5tyfVChU9+NcLwvbKb/TPUUKMeZyfPAxBV4DDFLMD8ELt3eYfsil1m5CrXi8r
         rOP59FD/FIKwW0qO6cWVqSMp0Y//RndRBLrGhtB8rSBIcYzb69yzp9O6DaoSVp0t5LVu
         J5E9o3hMKw0RsjVGSd3ZtKxZdoOqEUbpSPU1vQqzHLrz5ajoIBSU1cDBcf/6XWDREsJu
         vkwWmYja0mSzFGAHHjelfHxWGqq6591WqlOYTxJL0ppu1BYkVkm/d/d6i4OV/fSmh5jW
         iskg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769217072; x=1769821872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
        b=ZNiyjKifv/AUyjxV9CbtxN0pIl8q8e0mJkEYgZMmMkiZrHSwyz0bIg82R9G28GrRU0
         pFhgwt136hiXD5CSHt80o23dRJZy+zANiEa+mNpHQlIJq4v4+muBEvW8/Pyp47JZjkD+
         CQ3eMz7bOV5EcYSFtPUykTqcTpfJo+yFHykqkGKBDtRfcumOkqe/lzDywEmkbAztZ8fs
         RjXiD/gRhZbvfzxbN9OowPvMZmwpEyY9CotqhHNkCzUu3iJoU5ufsc7uj+zHmOSoO6sC
         S7G84PLuDCCvNAMzMwGuNE6B+Nz3GLPG/M8f2sGvRCa0uny2vfQGaNASbZanLuObfjYS
         wQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769217072; x=1769821872;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onPzwbwKPYyNqS7iOfuEHuvzbaXgGWEM63DQQGCqs9c=;
        b=CMC+N41S0JXyS88lsNjnWE0pPc0eoFa6l4adDrT72eEXFPY/ZMD7Sxzoj3Gv2D28uc
         gb7uAAw617zu9Z+gEPPIDrJjWrX9j7fXDzjgw3lExCg0LSFMPlCny06ZlnQJW9kMWkI0
         pTYaH+ozD4OHncChWPK57pqYC7nPnMHXWASGHdx/M1XGT0ip/Dqz5+xokeXVkFnCrwpI
         zgo5yL71/nzL0a9HAOew1OdWiBorX5dznqOPxPQn4ppDjt+FRMaGQyUKq87HVRsB64SJ
         q6a3SozI76ynexXMjI4C0xsKM0dkwGS9FGpNNfnZDzLruOVOm8b+KOE7uCnqhd8eF/k/
         /AGA==
X-Forwarded-Encrypted: i=1; AJvYcCWXBvhLfqTxA8UrZ1NMluFs0uS622Euck7QFB7J0UNk18VxGspqiwz92lNz7+UuNA0uui7/8LteTgiCRezn@vger.kernel.org
X-Gm-Message-State: AOJu0YztLtUVMaa++x1H5/yZ5i8pxglwzIFJAf4PKjF1hej3znTtY5MU
	xQdt5FXKA2r1r6UFcu4pUdsNwOZyH9Go4HSDVU9Ot9GUx/l2ThyIaW27B4CIYz6RBg+LgYakx4K
	97russ1pGQTL/VyG3EumJPSiq+rXY1XIksM/HdrRS4+VaFZF9d+mzKYJsneGDPITIcJIIt5ovqR
	0o0WDQ1B0p4VJc20NKSD3vFKQYAh/mg0VS/ZnOAlZahpQ=
X-Gm-Gg: AZuq6aLivsHrTqfavua5tCCSXZ2Jszvx5XPY6jiD3/qJ+FQ1WvpMOaoTBbZRLFvCaHy
	HhEF9mj/RM06+R1e1WZf94eOkzlrio+iaEqu/wBiwqw/KRYxTcjl5sTOvrgOvqT6aRLt9/1tn8h
	8U2UxUb1YIzJjEoCkEJP9mDmx9fY63f/1xhN+Z7wF0TVPUhVtvn+lhJOAoJHw1xBWH2gpjpwI9c
	L5Gdv04CiFGdlrRZoHnYFxbiA==
X-Received: by 2002:a05:7022:112:b0:11b:7f9a:9f00 with SMTP id a92af1059eb24-1247dbaf59amr2586258c88.4.1769217071895;
        Fri, 23 Jan 2026 17:11:11 -0800 (PST)
X-Received: by 2002:a05:7022:112:b0:11b:7f9a:9f00 with SMTP id
 a92af1059eb24-1247dbaf59amr2586243c88.4.1769217071308; Fri, 23 Jan 2026
 17:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:10:59 -0800
X-Gm-Features: AZwV_QiAi8xrARX87HtwGvXJ3KtnTfbMYZbjGy5OdRX7_e-hsYCRCJbIWRy83PA
Message-ID: <CACSVV03A-GE5mNG1OLF3s9UCenQk4x3jO71Hmvr9j+vCF2hc7g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-01-23 for v6.19-rc7
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: VWt5hnqeohqJkf2Kp0grBkSwUknHH0O-
X-Proofpoint-GUID: VWt5hnqeohqJkf2Kp0grBkSwUknHH0O-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNyBTYWx0ZWRfXyxQl/QfwaLCJ
 FJw7us7DCHr1TnBzO9IT/XDRtRbdbGmIeBjYd7zvvk9c185rFiH2eBFK3lM9xFrYcb8zdna59dL
 vXUmFHiUrq3NNRBA6mbhD0Z6K0VBIUTIux28iw/9QueqnV+khTZqVLK6oomPP+F6LDVg8AZLfFU
 CIyievmNldGY3mQXv22bXkhldWAcYNBEt0ZqpuQf1Khh+OUN3KnS2Gr5kXE96sEDbCCSfBmmE1f
 LfDfKJjDM0dbJTOoGXPdc0Jh22TJ8LgiVDsCNKkhh6jsEG5JYG0fxIIJxPV1IP+cV2VUN7tnBEN
 7bE8G39Atrcbtwa6x0hz+R5fRyui1OP6EpxHvsHZT2gZQZqZsjcy56yTHLqRbcVRPTFsHIoUBdj
 PvOa+dc586QYaeeaUdu5KUEhVeBxu8ARc7RxzU9EjGhjNt9ukNjA7jb5XVS/zMzRMdLWjciMIzf
 Lp4vGiqk6BuXsklETqA==
X-Authority-Analysis: v=2.4 cv=P9M3RyAu c=1 sm=1 tr=0 ts=69741c30 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=5xzA7AtM9dvb3DZk53oA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90396-lists,linux-arm-msm=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 034E37BE3E
X-Rspamd-Action: no action

Hi Dave, Simona,

A late fix for v6.19-rc7.  Fixes a crash on A690.

The following changes since commit 66691e272e40c91305f1704695e0cb340cd162ff:

  drm/msm: Replace unsafe snprintf usage with scnprintf (2025-12-24
17:55:29 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-01-23

for you to fetch changes up to dedb897f11c5d7e32c0e0a0eff7cec23a8047167:

  drm/msm/a6xx: fix bogus hwcg register updates (2026-01-23 16:51:44 -0800)

----------------------------------------------------------------
Late fix for v6.19:

GPU:
- Fix bogus hwcg register update for a690

----------------------------------------------------------------
Johan Hovold (1):
      drm/msm/a6xx: fix bogus hwcg register updates

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
 1 file changed, 2 deletions(-)

