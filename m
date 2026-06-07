Return-Path: <linux-arm-msm+bounces-111572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v5lqD7p6JWpvIgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:05:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF1650B6D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 16:05:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KJWJxoAH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WV25BjEI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111572-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111572-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07AA23034577
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FDF3A7582;
	Sun,  7 Jun 2026 14:02:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F43AA1BA
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 14:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840926; cv=none; b=s6ZpILVcRyEbOQhwEwGCoQ6+o6Ir/d+edgHo6BbH5QFTb0MTrsVfWjnTnK35HRqtXVE7FCINeulbHe6D42DGDPFwwtp4wkNVSQ4D5ApTgy6hPXftmk7xdC+CLAWM+aI654oAS/51Rh5r6C7W6UdXSh0cWr8JGyT9Nr4V6+29kd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840926; c=relaxed/simple;
	bh=VqvTRUA6o6ZYdITB2RrmuudL8aq2Fm1Upzn0MV4FZ5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pg4lA7CaoUFYBZdmADURnSgo+HQtnROO5HpzyOIDWD2/L9E9YAIEkPhv/m4R9brQuh5gW1GcrYA9Sjl5lzfOg5rhvL9CJm8Ex086bqHR0qMuyabjFC2WO2am2QOMjo1w36xrTH1Gz3q5CiJAXWUetqXI9z7DX/Y3GzFRaWMBCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJWJxoAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WV25BjEI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1aYX346365
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 14:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3HLvpgf/bq
	VTB+xJ2J7kEnCnU4hICG3RGlKEepjgjI=; b=KJWJxoAHca53dDOvFXI310X+033
	oG2lTbc7kt/UZAMw6a+NaCADZ/xx60N0yCtNlZxrjgdLcGBKjGoKfwv3Iw2esjr2
	MzfbRDL30HzgE9+J/XgHO6fwpks5X+VRfCkHCAXadSZ+gKCZL29RnBa9ZcE1rN6B
	036QEUNbv1DI+TG7emRGBajPF0wB7hvQVAPcP3+s1slwkkxKecDXQhwwVlC35e11
	WxCwm7ODMgRBHsOsApyLY1eE5TtsFkbofeQu4qMKILKcV7MGzG4r+EJSfuyJ8guV
	Ojmn7xV9n9FrefTGTC31QmczRDh+keB7ky3C4m+Qb5Cnc6pf7/z7kAMxnwQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf45ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 14:02:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso3451479a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780840923; x=1781445723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3HLvpgf/bqVTB+xJ2J7kEnCnU4hICG3RGlKEepjgjI=;
        b=WV25BjEIuZLfU6LrpMl3Uotm0goPHFsN34AYQ+RpmFZ4kCuw3C3tOFbQOF1/K33C+n
         8nZDNZqgGfXKYvkrL7IEIHDcW11BfeR8bhfytTHRHGWQjZgK93YLqdd2WNAeGe8Rytli
         p74hPPNQsNAMU47HtVXXRY1XykmQ8KYkTXRdXqaL3vSMvH4DKTsa5Cms9w4jPY6Lu/o9
         b4lHt9sVdPbR6SMWaN+Qxp6eIumgiOgbUSdrmu6tHcLfUyQ8vhucrNF7+sJruaH5OqeR
         qAkse1dN4U1gUsyVMj8eYKiQwpMFVfnb2wuL5pEQlAoDMpgGjd3kM07G2lD1zlHJab+7
         qKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840923; x=1781445723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3HLvpgf/bqVTB+xJ2J7kEnCnU4hICG3RGlKEepjgjI=;
        b=DNVZE5vWdvVpkM08+BNBysIwf8h4yRKqv8uRl5Da1/MlojbzVc1ZgKeyFiJv4f7vEv
         QeIYwlvpY4DhiTksyBw463o2URJX4CHTIH7OpKLN+C1zMwt5eZzveA3pPJFLdSvPHltb
         lH0Bk/PhKIRkaoZ8tp3bC9GHk62pn/8G/lxWLYigpzQzFAF6jFmzj1cCD+EDDNH/yFcE
         0SPGblfsHiTC3YZ3ngyZNNxjJs/SmY3Kk5/p+4jtD6M29/6Cmv8heXC+jDy0HVvgrQaF
         HbTwgjZ6toXD328PedTAhYiu6da6o7oCFyCw+nqQlcBNfbK0XxdwavL4DKmkn593vEZ/
         87jg==
X-Forwarded-Encrypted: i=1; AFNElJ/p5pcAdio3SoCNGK8ewA+YaairCgck6s+ghS+Ply60lM9Q1c70RgbTr6y3wP77aGEhnnmHueTe9BfJ7aG8@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFMezm39tft7f+DkPqRi1D27OQDs9UGYjDPLsU7wsSrZT1P4F
	1OSB+QQygupVHNYGmyOrkPsvjc6SCxKsEMIACsGfP8enHYk/WbYe2uV07ROyVyxoFx5LJL1VyWT
	bwpi+nw5iK6KGTXVdj6yilBvsN8aE7VfGpUtDxkI74CHcOCGVG77pScKYKyC+KPzcpvGsjXmcF9
	k5
X-Gm-Gg: Acq92OHGWqnvDmoTeckvxSL9CYu5Wz+cAY1Qp4EuJIHLmlIWVavJh30sxK0+wb7O7EU
	I6gVVaj07bzL94YHQfhE/UxnFN5Bzcvax5llVl4N0Gk5z2FHk/0/ji9W5Cw8jZV1aUwfTMT1kcg
	55i+5J9QBjCiGKGEg9GEM1rlPOCEtm9v+EC34aSAES6gGdeNXJ3sd6Z7yxF8OF1XuUPeWUXlKhd
	fmRyT/oSG/z+QPGbV3Y0YQRGArUnnCbJiZrHSyBQoTo3jXAm6esh2SWZHwmHKJTJuW9IJHpxSyY
	utyFfiJhhaRCkkpnBCU8yyPoEOhe3+XvxwyYHvSxizmR33iO01LowIj/nwSBm3WQKxHLuo+FWPw
	kDOo9aVTEtM0kNCN1JLIW2gkrKYA70UDMYyiUH/87miY=
X-Received: by 2002:a17:90b:4b0f:b0:366:decb:d119 with SMTP id 98e67ed59e1d1-370ef0f5942mr12763325a91.11.1780840923548;
        Sun, 07 Jun 2026 07:02:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:366:decb:d119 with SMTP id 98e67ed59e1d1-370ef0f5942mr12763277a91.11.1780840923085;
        Sun, 07 Jun 2026 07:02:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668e98sm13168827a91.5.2026.06.07.07.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:02:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Validate lazy VM is created in GEM_SUBMIT
Date: Sun,  7 Jun 2026 07:01:57 -0700
Message-ID: <20260607140159.137068-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607140159.137068-1-robin.clark@oss.qualcomm.com>
References: <20260607140159.137068-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2579dc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: yKeY_sgszxzrtLXEn3IHSmjkfzko80SW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEzOSBTYWx0ZWRfX6CUP33erSMAG
 /uPiRzmmJ4taG0mWEc5OpYsawPCMyUHdgf+UFZAPlXwTi3B8DgdpMCA/0cFZEbh3Gu3qnrrtkPA
 vAu0cgHgWgY/RbUgb+cXuo2JjFhsvU6qcOBLgfjvvar2Saha3X3eRCzxzRHzE3v/PnxCC5DjJoZ
 t4oDbS4SepJtSOkakhI6aWI4iZCldASdPHr9Av9K+AwMgFGzZsOYDQ9+pq8p1xQMG3gtqQjLZlh
 wkcMEQ/tYnBNl0z+ZgF5cphnxqPNhG+nSbNlRtMOE6KdgqdfrcAW84VA3U+h3XtJvYOu/o37dUj
 wGfAquVrDnGBfq/LkBQn37nI/Wz8ExDLZDShsGeYn7wjcXqLsqnoVYemFZn53G118YtPxZKYsC0
 TiAf6d/4dItKH2AisbOg1jvVVPmgJrh2ExzPQ1EaexHAlS7ECPv4i0a+DLr7/TIBNcgOS6165jn
 92VdbcO+/eHxUw8cUTQ==
X-Proofpoint-GUID: yKeY_sgszxzrtLXEn3IHSmjkfzko80SW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-111572-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEFF1650B6D

Otherwise a GEM_SUBMIT ioctl before any BOs are mapped could cause a
NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 26ea8a28be47..af564acf1f0d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -572,7 +572,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (ctx->vm && to_msm_vm(ctx->vm)->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/* for now, we just have 3d pipe.. eventually this would need to
-- 
2.54.0


