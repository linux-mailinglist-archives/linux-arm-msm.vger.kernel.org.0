Return-Path: <linux-arm-msm+bounces-111571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kqp1JaB6JWplIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:05:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BB650B59
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:05:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kSG1HEJx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PZZmUHsB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111571-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111571-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 275E6302BA7F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E5F3A3E87;
	Sun,  7 Jun 2026 14:02:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC04537B015
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 14:02:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840924; cv=none; b=niZweaSYP2Jm/y5ohA0AQ7OiufXmWCfypv8joAvcFWCaFVIQ7L1i853xhBCEZVzzDBXDXNihQcNndA68lp8OczEFnzUJwk8zYSyxdPYU920k7k7qFtxhcyNKHlCTj9M9itEAb8eenxvuAtbUnJ1eKfXWgk2Sv3gKwTNqrtIHHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840924; c=relaxed/simple;
	bh=+M9M8ac2qS56q8sL2kLQkzPuNN4X8lYfKLDCF9nrBD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N388suPxCF08NraPBrypPlWQOYLHox3MvDiATIZ/KmpeHtaMK2lsEnjOsszihLHufJzEEsNiXfUE4HWVTQdrUok5oSknbPlPTEaffM3U/UBgsRsWrjfA7PmuA6TSiyKcgpK0kfYJQ4TVOZgIYIL4gJTQ6u0jb8Vb4dy/hgJNNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSG1HEJx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZZmUHsB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B0TEf4140597
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 14:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E544aA3Xdhp2JbSmxDZLkz7HqyAP4q+CpKz
	42TXJzUI=; b=kSG1HEJxZcraYKRULhaGnYgRAfkHLmm3Aokfsb8X0qkrcOtyawE
	WaniOE604us3UP52HliDoFPclH4G7NlCMbTtSspV1pmNO26YE7jIwQPHtyfBbvb2
	K9T342wXMtza3MXWBzkmK7VEJ0HUTjBbodKLnk5aGNQKcth8viMeWblhftPdKqxd
	XbjddRryHWRzq6STTIb3ygigqv1WI+cRsSlTIS3IKJCG/rcBu+NyB2MreuKU6r/B
	hWllOfUpJj7HOV9yuQU0BCgKj+vP1nNxpmvzn1lPYX+15EXJn9lxWmFjkYhaH5IQ
	OdfC1nsiYVwzi6GNxckxpljn/sejMsc2oqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrc899-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:02:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c272e532so36370845ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780840922; x=1781445722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E544aA3Xdhp2JbSmxDZLkz7HqyAP4q+CpKz42TXJzUI=;
        b=PZZmUHsBSxTi6lTw0V9EnJzrdJb/3vVv3/XWMRnpGnvzsupnItnKJmbgE6+OpqsUWL
         /lh/VuW5vGkfKcSwBTa9TWamwIyd7NSQLFVVdnCN69rxEUyJjW3+c/KCOlVkNlQu8+Ve
         SsBbhTTNDbb2r1i70tFhIcVf+gtVlj+DiyvuVoRduWs3v2RjrdPsen3U/8z0IKY/6Gn/
         Am361B/dspt40etm4S4pDErwEX82DVo17PSDvmnzIZ4sDmAafLr3iJ0SN5SqD4cqDN1Q
         sc/q3J6arwxCmZtemv9f5ITKOMZErSpIfa2ivU4vdrlT1hNwLjTyEkwUvQy5Sj+G1Rva
         nKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840922; x=1781445722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E544aA3Xdhp2JbSmxDZLkz7HqyAP4q+CpKz42TXJzUI=;
        b=aFY5JGm39bd11YQ8SDL81lSfTGfSk/1N4tFjyT7720bB/NXDgq3kr/aidFqX/Us1Tc
         ItRRmrYj2xSWkjFb39br8D2wstiGU9eAycR4oZKoo2ToIqxjls11EYpJpu/mYOgv+ync
         yigZBkf43NIqR1dzOiCNo8H8S+iNHw59KhLeaEicBLpzaWbhNNiOf2S2EytA9wrew43K
         thBvWdAv87ncaq3Ezz33QwQQxX7MU01vo+52NI02dZqICyI4uHBMqtIugompVAZdNq4p
         GTDNs/AFPBhi8GGMkcMK671BzUkLgksrBlnvmdW39VGX4d6/xVFWXgbHJJ3WYLUigbqk
         AJSA==
X-Forwarded-Encrypted: i=1; AFNElJ8opBmIEXNpBeSahCXuQlYQkPX05FcoBDO6nfDIZmf6QFx7oaWeG0X9U8dzQ0XXk+ruOMYMLzcGzc8u3/6w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PQ2Ceet7th+DIQkjs3rs1F5CtK1LC3knhww1RDYV1v5jag38
	zygca9QH+XYh2PCJM7umVBD7PnBwAdSbMbjF0k426bIhNGL4FeyNV2Tbn9pw1dlC12Qwzznt0F/
	ZhMPsnq9m0/PEEkM/MQOoP7xNDGqIPfZ9Cq3fcgd77kBL9BP9t3EyD6YUOSLZVwNV7t0l
X-Gm-Gg: Acq92OGukx0qCoGADTQGUkbUKjQYmzYqqVhZMjsOwhcm9d6P851ZCJghHfqn1QoTIA3
	KplGn5LCduTjqPCLJv3Y2LfYOL8DNodtCyybPFzb1MfYSIDHafId3DOHTBXL+t3+VE05gnqPgLs
	JD2fu4DNLD59qPTPE+HQOl1gJoiQWcKtnZ97rkSCW4En+rv7u+cmEI9TajRE5E1lhjM0E1RmzPL
	wkCxY6c74PfLfVPNor8MSImqVj8xw1uf5PM0asxXPJNEhEtRMRYzOXinbAz2IhF0sYGw5I519p5
	Q7MbZInePrx9PcmJZUb06VTrvTNoXnI6SYKGAGUQygsfipKdUOSluSV9S4heRsHe63/OgNjCXhG
	ubNN/u8mKh5PzaxexiYA6+CeeDqrQkZ5rRwOpiFRKj1g=
X-Received: by 2002:a17:903:138a:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1e820e32cmr119002095ad.37.1780840922239;
        Sun, 07 Jun 2026 07:02:02 -0700 (PDT)
X-Received: by 2002:a17:903:138a:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2c1e820e32cmr119001665ad.37.1780840921724;
        Sun, 07 Jun 2026 07:02:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm148370375ad.67.2026.06.07.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:02:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: A couple lazy-vm fixes
Date: Sun,  7 Jun 2026 07:01:56 -0700
Message-ID: <20260607140159.137068-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEzOSBTYWx0ZWRfXw8fWRS7KhKdG
 gZGxxOEmKPufTn3zyT+2xbCj/q5qqe21spKgIPJ0ruxJLa64v6aFeQf4K+D3fPtEDgiGSe8Wqy7
 EXebfaFNI9yZDsmNBwg/+RrgASWgBln+nE+0xTuOsHNMt5TLzgWMZWhdBghbHQuFD0Z09DPdQIK
 SzQRDeZbh18btwAWp7JpZpLgks+EB+VYCEqDVOxc1WrRKZjiHzFu088dOyABj/eu10irJwZ1twN
 uiQxNELtDZZREApWBZz4vcHtfx0arthpjx6W8faLiBwf/WLQ2LXbvU4115QNrlhj1CcPQ/hmQC8
 xvVtOL9pHqervI4wXMc2GMfFA+q0w7DuuhUgGrNqZA7AkBH5uKhHAH1cJd3diF1/bj4AuAhkODF
 5jOUEJ9okWYdHq+9xdGrMl6AkMi+EF6zrKvmoiH45gZjcC4dGVuI9MVyPsQDX6aqvgkBFyLqWe2
 FmWoOhL+u5UITsiEaog==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a2579da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=384pi0yy4wJ6F0PkkBwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: UHO--AvCF-SdYi2ZCVTrTaYSVDCTNAo5
X-Proofpoint-GUID: UHO--AvCF-SdYi2ZCVTrTaYSVDCTNAo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070139
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
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,linux.dev,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-111571-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:airlied@gmail.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,m:marijn.suijten@somainline.org,m:sean@poorly.run,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE4BB650B59

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.

Rob Clark (2):
  drm/msm: Validate lazy VM is created in GEM_SUBMIT
  drm/msm: Validate lazy VM in GEM_NEW

 drivers/gpu/drm/msm/msm_gem.c        | 3 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.54.0


