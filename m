Return-Path: <linux-arm-msm+bounces-111985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 70izCq1SJ2pMuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 01:39:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6671A65B31F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 01:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dfe1Wp4+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IIaDo+Ma;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F7B3017262
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 23:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E537E2F7EFE;
	Mon,  8 Jun 2026 23:36:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F73403EC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 23:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961814; cv=none; b=OAN1RUHJTztwGqsnHurPUS/Hk31YumoDNJs23HLOSSPe0XyUGEa9zE0RDey7i6RsMXpjmGDJq+suAS/TUVTPOX89h1v6jSJjNaUT6fJi+diHrD6ts77BWLRMa/AJYGhrBldR7mivlsOVZRo8Hxjc+zKwoMVs1zNuIYfMq8QK3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961814; c=relaxed/simple;
	bh=2NmZWaJbIB33VnT9ZsYiOup4YkK+p77o9Tr+gBsdYRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VAsixziQUnCmUBQ05YhVu1+GrtQGkTmkSoy38qJfDzuP+URREEsKpvHHpefTzQBDfNlwi2VlSw0sTV7Q/sBZt1xadA6CF3jYwE9HXN+oKHzUBpE06KHjROrvLb5Wfrd+C8BcjvubelQXUhJ1dUNWcTSbZPJIooLcgtBDwxL7cJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfe1Wp4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIaDo+Ma; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NE8gi409588
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 23:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZYk44gZi0gQL9cYyDZb0Pr
	aSrIqM6bq6tOD+CvfB8fg=; b=dfe1Wp4+8YJo75IuupNucxzuE/twbtpGtsnDUs
	D2Wuw4ncj7zES6qNewC4xFlum8ix4jk3lLiKnvxsvx47jYfE/0JSoQivnu41Wj6m
	eTETIjbRVp/4b3daTc6rzvUf2nk6fMnq5FrpMGT32HBkBwpkxbsUynmcYCGErCtS
	OKxt8YAb2pGbk1h7u6DAO0d8ozkC073oone6OxBMgvc7U98rPH8fUFzCuBWude9O
	rxJWKCtbrR+iNCR683gEy9EZZWZdpGgEdoMksZanpcFgfeVDVEI9ujxI7g2zpowg
	Q2YzrTPyoA+wWLA8q1XBTtHPvo8pJirAldqxUtr1wMOht+6Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunabdy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:36:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so50309435ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780961812; x=1781566612; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYk44gZi0gQL9cYyDZb0PraSrIqM6bq6tOD+CvfB8fg=;
        b=IIaDo+MakmeBQAmd8VulDJxlpvUNhPbVJ4LawvqaZx/UI2EA2U5sUQCGnu68qDjhhb
         SDfSEBec6dN0TAfBEuroIqWcwIVk2+YLAsRtcNXf2y49hycchdw6zq+3Srat55CXc6oj
         6Iw27V7OWSe4knUhkP5hLM2bosKi2aJoqL/GKY7Xft5sJF1We/br4NjWPIbsDHad/oxM
         Ur/Xz3igBhiSm+1NQOZKj0ycAkNr+RON5LGFS58YPEaol5OhOif2GZzGg6g0u3HTXXmb
         RbvJgMZNsUOkisMQRG2oEwcvDFBZ6UUiQLCy9jcFC6OrIKBZCNUyX0cDCph/22CVIli/
         kEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961812; x=1781566612;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYk44gZi0gQL9cYyDZb0PraSrIqM6bq6tOD+CvfB8fg=;
        b=sD8UJSvS5bSeVtrKofJMNSxUAO6CTuewT1roeO39IWzMxhCbkRWPLahq5DypbAkwDj
         eqtOpk/i+xSiltT1qfX3YG4bbeiAM97WE2Zdmhe7hwsIeewvxgVDE450TT2g9ZHMAAT7
         mZqsUSYj+ElTKoG5PdbHGaep/7gsWdrAM+GGZBSLyhTXbtnhtMboj+scNhUs0rsIPEH5
         kFO/Fefk19cvGLciFaytyC8/VhZn65Uur532dxzSpz5ix/MVVMyWKMtCj9ITswhv/CQw
         treldVJF1Jp47H0RUgQEVqrPIi4LPHM472ys1V83rvf3txd8tPO6HAXmQvfvHsccRVMd
         4B8A==
X-Gm-Message-State: AOJu0YxwbjYvyuddA6DeT4k55NxbQBvuh602YZndeIQEsD9GwkwNGhxx
	DsQohcJrpwNkQh7e4ZledY58ZdxnMwv4ISVMKYu6KxdzBcA6Z9bFUJnJl/bpyXCr7kOov+mjq/Q
	YbvuXkuxot7NTLUZ9+0kPteHvqAchLKQYnjoea35nSL7xPYKjntFx9j0tR/B02+sAi/RO
X-Gm-Gg: Acq92OHX7RakKSmv4mtLJxQKqAnFq6rSfgEvycqUL1Ob3pojbYjRUaywfj/TH7zOAei
	7hbHTcDMBth2LviqL3vYFUahbMgagOm94UQLwRyl+MzUq7tAVIeQEoidSv+L3Bk0zFgJonE8d4F
	fdoS3WDdXHpoqLD438nI6MPrMFbAVM+mbC/iLS89Tqp1eL8p0u3x+QhV+T8WbWPqPE4qfScaZ4d
	iZuZNYcBTFCS6JdtNkU/0RWMbsKw6bAsNyxjYv2NDNObfzZuBXt1pDjy2Igk3pxw+mWDtrNnTV9
	yg+UGbyl/GYrCXDNyIDixeGRpdrRL04o1aupeBr3ZUG0C0mXljKEQyxRocTCcBjwnkMy/orH49T
	E6UTFwIvF864EIVZ2tz9tukNu2Xa7x9X3NcIjpZEeYj2i5lDbucqHIWb+
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr205752225ad.25.1780961812382;
        Mon, 08 Jun 2026 16:36:52 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr205751785ad.25.1780961811867;
        Mon, 08 Jun 2026 16:36:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm66206975ad.42.2026.06.08.16.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:36:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm: Add support for Shikra GPU (A704)
Date: Tue, 09 Jun 2026 05:06:28 +0530
Message-Id: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxRJ2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNL3eKMzOyiRN30glJdUxNjo6SU1MQ0gzRzJaCGgqLUtMwKsGHRsbW
 1AFdqybpcAAAA
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780961805; l=965;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2NmZWaJbIB33VnT9ZsYiOup4YkK+p77o9Tr+gBsdYRc=;
 b=1/B6F5tMzl92zsNhiGGCcyT+PvRqnKjT3hrSSl1IsdYCfywRdpbiG9Ou5ujtqqz5AfLz3whCe
 dVeU+IN6Pb5AyXEJI+69OE/qZSUsuy5BHUFC+4CQEAQKnJo+q1QlFPB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIxNyBTYWx0ZWRfX+qHm+BcVDQiF
 R4zbJn12lkVcKQe1kgS5hCljH815f4B517sydzxGxfKkSuzFjzIUEqZHAgobCxS4WIc5aLhRXIk
 gLvDJ+SJKd/BiejCPg6SovC+9wpvE+P7mSjK88Jpwb+2V+Vz4JVwa406MFVxEdzNWDpAi58Kcn5
 Yf5V/i5LFQkl2euKifPMUQS1cBtvoe/ue7pm9cu9sjGuLCTSxpK46QhHaJmy3dmtytclfq4ubyY
 8Mkt3T6s0Dr+nK90ASLsK0lkiBmXpdsrdKtlrCugGIwmmKFqz77wjyQRnFtGA6WijegaP07fTGF
 3u38PDju+clnYB/5Yo2YXPPZuhbSksAgvKAm25Aw2E1kYovZuc4i1oa6uKNVB8PWkW/KNuwaxxO
 QexK7MtbYvqdj0D1PDsQAS2/nDERKjyQARJF0EwaxPF6h4vFinirOscwUom5U4DDXXtsn1dEnyn
 7i16comH1NAkvsaafSA==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a275215 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=bc7Rx1KwavqhM_SNCYcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: pjYnn-GknCZmzHYDQ6213YhWNCX-AiG-
X-Proofpoint-GUID: pjYnn-GknCZmzHYDQ6213YhWNCX-AiG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,gitlab.freedesktop.org:url];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6671A65B31F

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

The dependencies for the devicetree patches are still on the mailing
lists. So I will send that separately.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Aditya Sherawat (2):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c              | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260609-shikra-gpu-5432bdeaf0f7

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


