Return-Path: <linux-arm-msm+bounces-114577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ojj3MHKrPWqg5QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF96C8F61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="dZ/saoJn";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MiBnh1S9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A29FA304CEB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E35383C77;
	Thu, 25 Jun 2026 22:27:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405B33446CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426474; cv=none; b=bbUhJesKmAZMTIkEwtPu3EXxiZ/C9eD9GVb0oKDcVJQu7kQqsEimz90jEf50jwccpk5NWcTfKdYaGn3NlvpmFIkAslToThCYZx7fL4o5GMWHoKiAxR3sjN/CRm59tD33ma/gpmwkA7DydMD4MZvYEbwT3+7fEVfM6Zz+uWsmei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426474; c=relaxed/simple;
	bh=LppP9yFY7NncQYSDh/0quwFeezYGCCAACz0z2FpEXEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRHu4G7ThgFkdjeA9cWsiBh6BH0dGatG74MMDblFHPJjlWrfM/OoAkCskkMW6Vz8uJoXBfVcdPC2cIaVSuM2q6GLuzLvzdRLMsflKgda8FGV12GXCWXq6a2qnrM21i3aHAc9ABzUnfcPSjFg8Ymw2+yMVxHBeM0Nwf45rJoFfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZ/saoJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiBnh1S9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFeJgO2737258
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YYGFMedjww5Nh57ZSCLwGdlM9va0wcgYMnw
	d+ig3sKI=; b=dZ/saoJnsKGsEg8awLUUmeiDrK73Q+XUm7lyBCluzNb/iO5zuZ7
	HWCjRKwI5xAAmVPyERR5itnvN88e5Lrt5RKwV4IQylqfbZC2A0SzZvp16/G/rmou
	HOEiolE1Ps9y11QnND8PB60QbnQx628DrOHNAU6ATqd7r/ztatiwIC4ULOpFXEKL
	KTJ8pjB42RyldK2i3wGPKwBkQ1nT3Ux4Tuygp2+zF7UPLE0MBGDuKbKTQAuDRhYi
	YJAw2kHVX0hn4kgQebn524UPZmpObpk6K8s6Qgbqt+rEcvQ1ezNCqdKsp2QxdsGp
	qdW3IHjoPMM7U3FaElXEk3e5mIw9zNfjxYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8umvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7edb8505dso3010535ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782426471; x=1783031271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YYGFMedjww5Nh57ZSCLwGdlM9va0wcgYMnwd+ig3sKI=;
        b=MiBnh1S9Rg91uDkWacuVr2zBVM/LCVlK5BUJ+70bCpaZXkw5GvGW7A/ll3YwI7q/2Y
         zZSQvX0jEgt+2tISFvQOT6DtM0IUebbEYaCGl3Qncht2+GoNBFViVgVqPvwA7115Oi0F
         t7gEY3mSwQ1iCbU/zL795efBtbaCtTcnbQqGMuZqeIsUyl8xOgfP4bKgr7FMkhL3gQHK
         z9ns8UmDuL5/YfeS9ulPHjccw4f0EOoHi8osVZEaxlZfL3b7j837DRbj8KZiRHsB3/mn
         YcfDPuvODju7rjBk9DTzdIzVdwveHh+ULINc2+x9InvPsFzaKQbuilrO1e3Z83JltdvA
         ZxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782426471; x=1783031271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYGFMedjww5Nh57ZSCLwGdlM9va0wcgYMnwd+ig3sKI=;
        b=iBlEe7rfrkkpN7S7sa9Vk5E4u6C4Up/q8Nd+4LeWyTIAndNRc63k4pI1rTI/KCXmBH
         szRZ1nYQZ1e7f/NBniOkF0R9KH5yovWm6P5LUojP4dEbv0SFXNsOZ6iYBxciE9pcJ1Pr
         cDSwgjKRbLAMnwgWGxhQxXYW8iJyyuqMi31Z23P6osjYLNeS+ZJOwKfGBKycTa9a8d+1
         hwDVFSKGyEHyUzZcHz6kyRCofjEfC8JtxVM5xStsvW0Nf8xQVrpmST7yxOSTTthNsVJu
         kCf90K4fPypXD6nGue5qEYYkoOQcRsWgv7d8n5jFSrWRzC9M4TpyOHCNc6nvFtDDtr1/
         7JJQ==
X-Gm-Message-State: AOJu0YyrNPKk05/5kkCAfMBRomWF718/sRkJVmGkPzZHbbmusK3/UY7k
	RvNx6za8Rdiqmcf4nGspTpsTXCflAWn5yzZbrfhjCKK23nDzcdLWQWsm2uL02qVXP1XZPobhmLI
	HMl/QHbnl9KXi0gC9vtrmkReQialesaZ6ozPH6ASQxvg2f3/Rr0WdazE9/mHb9vWkHCM6
X-Gm-Gg: AfdE7cniVecFqMz9aD0rnvAX3opqfuGtwUjxO4xLayaJxmaDHQ+hMg4y31onRLpxCoX
	r35z54eULDBiqMDv7XFOpmoRZTicfa19fX7joAaDunfLOiZtofJrLZ7JgWRYC1Ywg4r+QXc/uQR
	D5WtC9XB0YZtt2h9Zgoi+khchRTdY8SCsaBbHdXHpjr0cI61DNV/WrVZFJd/DAgHVBFAS6wO+Ul
	NeeDeE5VBTBURmXEwWDZJeh+GI8Zj3QzllM94KeFtTak29aATm9FmTtUvhn5e8fMp6LaC1mPFuV
	3z7+cVpXQsShEoldn94AjKgEASamriP25/a7yTs69riw0DN0o9FQ5mGh0AazXB2Ljpu3TZeGx90
	RHy6OAf4KAupoMQDpVEOXEZcwBbkqSa3tj+ji0SUxH9hhtyYC5fAFnKTJEA==
X-Received: by 2002:a17:903:946:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2c7fc791633mr43939315ad.36.1782426471160;
        Thu, 25 Jun 2026 15:27:51 -0700 (PDT)
X-Received: by 2002:a17:903:946:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2c7fc791633mr43939125ad.36.1782426470713;
        Thu, 25 Jun 2026 15:27:50 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc322sm27290185ad.64.2026.06.25.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:27:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3 0/4] drm/msm: A couple lazy-vm fixes
Date: Thu, 25 Jun 2026 15:27:39 -0700
Message-ID: <20260625222744.22254-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX4/90Xj50PCJe
 3uoAPmW6I3UDjxlRyu1i8RtLamtTRdKDcTd+ATglIPZeYFEn3xjOy45GT606fHTocfr4P4TDay/
 mR3qZh7EPSWqxa3QaGcAO2lLSgE1Q8I=
X-Proofpoint-GUID: v_88_H3tlllmqCEqLkjuZu0J3RJ7Z-BG
X-Proofpoint-ORIG-GUID: v_88_H3tlllmqCEqLkjuZu0J3RJ7Z-BG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX8firtpOxuYX8
 1lXTrvnb/PKMeNg/8HcUeSHAjr5rqZTq/EhsutcEOZyw4QI27Fq2qotlzRlGT17SBQjT6p6aF+H
 s9QNCbczvmHRyteA7QM2NKpZ2JaYj1C7JpHlA4HVijCZBp1BatJlKub4WhO0iE4E3uI9riQvlpu
 aK0IQ1jJr4EAFnW3feyumRh0/3JkN06Hb1MQMrHTtfMqd7NXJQu3xk34s5PUV8WEBYFvYEmjUEH
 5ByYew65vYFQ9ZxAjBDpnK62Gget+rGXWIA0TbD0ar/+Fog3CpoTHFHtzNg3Bj/+WDxg+gCjv/P
 C5p1gFS1aUJKERdXhMrM4rga9XwzRX5g04KlWItPdU+eHck2Az8+xY6SOa8FcON+meDFoDPgous
 5yB1XdITirxQohw4y9K7rUCm9sbKb/bpvpub4ai1uTBjZ+mnS253hYja3tgp31+Mxnia6sb9mUx
 VJ0QNfqGCVYZpbxZI3g==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3dab68 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=384pi0yy4wJ6F0PkkBwA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-114577-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:akhilpo@oss.qualcomm.com,m:airlied@gmail.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:marijn.suijten@somainline.org,m:sean@poorly.run,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BEF96C8F61

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.

Rob Clark (4):
  drm/msm: Fix barriers accessing ctx vm
  drm/msm: Validate lazy VM is created in GEM_SUBMIT
  drm/msm: Validate lazy VM in GEM_NEW
  drm/msm: Fix per-process-pgtables check

 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c           | 13 +++++++------
 drivers/gpu/drm/msm/msm_gem.c           | 10 +++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  9 +++++----
 4 files changed, 22 insertions(+), 12 deletions(-)

-- 
2.54.0


