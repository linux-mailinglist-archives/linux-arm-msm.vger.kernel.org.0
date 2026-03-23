Return-Path: <linux-arm-msm+bounces-99395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL+xOC+fwWn+UAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D42FD0E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB380302D746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB303E1CF3;
	Mon, 23 Mar 2026 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXeIWAQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxBfQO1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C503DA7D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296828; cv=none; b=IRgvx6ecd8RQ3qdYTpVo6U+WsaukxI6zOdIrOJLOAFuaOdloh1PW8j4qRe3PcTCEA6VJyIg1/30TjTJCufdqmaEzULVyUsbog/fDGQO78YugI3dGKWclsh/o7rqanbVrVhVMbIpQ53Un98Ho+hWaxWnjDD64pk40js+npih/kuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296828; c=relaxed/simple;
	bh=H5UIoWKcwOAS+auMl89W13gGP8KyR+VgG/pl7Eqs3ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0s8DK0DaR57nCqmNTWJyXPhf5+ANrx9p1/rFnI6Vqrd7lfGdPnHSLMHBegRWB8tNfYdO21zKYzecq7C8QaAyxj73vN8dWrC9HubyiRhWw6ICIcGUifEVutHjTJ0Mls/UIWA//R+IZSTEh3TTRlcwjHgFEGh6wQPwXdO5gZ/vLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXeIWAQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxBfQO1K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqliJ3634578
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6h1GbkcqRvODh/gp8Mx0/sRdMg7ZV4RUJ1froSrMVMQ=; b=hXeIWAQp4tXKWM45
	T/jZ4fs65SZJXFX59Y8kgasgcFUANVPeq2RnqxokWA4XW73kug81gwq3n4waBDI9
	fcS/RTvsjHljE0uTXT4UVZYVR7mAd9LxJ+SpNkQOpvfsgJBUkG0xBQuAARWhNUD2
	XVguUzRv/AvZ9eC8LzYS6Sn37EjcvpotP9sChM1U5IMs/HuQN9fsr3s/njNXwNFm
	XoKgnKz3ZYV0gb51jk9sDSzuEc7jRLgGLqyQT2vSZ7Y0zFPKiHfa1vwazoG0Di8H
	Kr9KiMctN5vWpAX16KfZHUqqm5YA7MMN2eO6sXJKsFgRKXEsOy246l4Dyb+ZgIK3
	pji7pQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4hwks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82a6906e35fso5988715b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296822; x=1774901622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6h1GbkcqRvODh/gp8Mx0/sRdMg7ZV4RUJ1froSrMVMQ=;
        b=ZxBfQO1KSK+xZG4Ua0gzzXWtGSETKrNKiwwHhhZwgH72t4c2RqE2zaUJkENiwlHUsI
         3c6hbi3bdvFXzv3k5gkyRtyLZrpihbqDaN3LdThTgJffqOXoQSx1SoP1/0eBNlF3DwF5
         guMt+9kZxMDybIE+lMZTqDesVxN3m9hRxc4/3W4MsF2vtp6/bjriKpRFigr3y/MOZb0E
         HxIFws6uepHBbzW5KQ8/LBUcZPdp5EvGjJtvP25oREaCj7LL58zd/h0V8yl6W3QfXJFV
         5GU14BV3QwiWcjr/avnZ+trk6dGo4lAc06dpbBf1IRggzS080/w4z0UI7Xi2QqzkXV/v
         OyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296822; x=1774901622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6h1GbkcqRvODh/gp8Mx0/sRdMg7ZV4RUJ1froSrMVMQ=;
        b=sEpb26si4RzYa2XoYckTWbIP/7yCBa4o5wqLoWQaeCRsFzzmgkAALDGAj5/pJEi45v
         h0JHxtHAD+QseZen3qED0SqkFouKjObwOBsZ6mOGNLETqoJ7kjBjWYPDSvAUF/5fbMCt
         V/sOJXklDVtw+UE+ZzV44EFnrtFq4fN39mhvyhJuoli5HkwU3TGVeVr6l8kwxaOGauf/
         00zILdG6T19aeN2WBWK6ciphArgqz2ij1gyCbgv1/2NF9E0b/wxGcdGMvNEStFSygvZT
         PYwd65iUaW22PEKrJ9tSk67NPPOw9g5I87e7b5epr2Y9dZN20SYYAwhqXa12We8feRfd
         l54Q==
X-Gm-Message-State: AOJu0YzUjUlc46Vt+i7nL1P3aIlAfNhak/Qo3INslJ1UARYPAwXpLdSH
	h3pc9J5gdS52G1BZyAor80n9d4tkciPDHlYJ7P5/EsaQLnz3msfU/UIrhp99R37B2Q4M3tPRpQz
	Rj3ROnJJWAn8++yt//dqCsA3AqL/rahIYeZSP6yAxj0WEc62z1frIgMdTSf67Y1NcLZUr
X-Gm-Gg: ATEYQzw5pxTw3xLhWnArxeQDO5SbtDi2AS0AuWSfF3oPG1MWZQjuW/n4zeuqTadW7nr
	tu958ssPY9K2Nd5xNK/QpbeKwjf0WtVqeQdChgpNfe366UDgKVTsWB1pPXtclomrXLwmhQLQq9R
	w+8KH2IfYPeUu0T9ffhZbjoo5/Y7yjMR4V/z1PODWty0qeEc5GPOvprA4lpzpC8M9nLA3Gx5W3m
	8Ba4iq6YcBNQNk9S87bJjakOwtAweV126rHkocgY4AGbYDRNY4aEtVZ+fQgel/qiYEDMc0vmdfv
	1fDs4crxnfcytM2uPdmJAR9JrVXPoSD/iXOCdwNGnNJAjjMV8gL78ckGDdqrTso6HT2TMvvm6xL
	yD90D35Ba0y2jkp7yiAmPts0wydBHwvnSgAH7zOm+I3MGBA==
X-Received: by 2002:a05:6a00:4205:b0:82a:14db:68d1 with SMTP id d2e1a72fcca58-82c5bf3fa3fmr615587b3a.33.1774296822496;
        Mon, 23 Mar 2026 13:13:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:4205:b0:82a:14db:68d1 with SMTP id d2e1a72fcca58-82c5bf3fa3fmr615561b3a.33.1774296822025;
        Mon, 23 Mar 2026 13:13:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:23 +0530
Subject: [PATCH 11/16] drm/msm/a8xx: Add SKU table for A840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-11-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=805;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=H5UIoWKcwOAS+auMl89W13gGP8KyR+VgG/pl7Eqs3ww=;
 b=TKJvi6RCo2aYUyZ3p7K/BZECCtS+cIhE1EkWZuqvmVpyQUApl/uOvQm2q6V3bOBVRiZsKkED9
 4uyowwPNQsMBemb25MWQI6R5es8SS8bmXShzUHHmHzoc9KqllrbrMt9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 4eXIhWKrGGi_ZtyDc3e-clxTdsD5UqY-
X-Proofpoint-ORIG-GUID: 4eXIhWKrGGi_ZtyDc3e-clxTdsD5UqY-
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c19ef7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ml_BBXNIZAQcZvYyiGwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX0uo464+QRExN
 blDJMPMntyuEeyc4mFCRFNFOQ3Pew8F/O+9epKHLPljwPJLm8S/IwnvYYtwCDlW3Vr9IQobdfVy
 ih/7ApDAJLgVvdFJ6OiONrtLiZtl0kNRoA2CU5MOh2J2NvzBCMgWMZnIZeOVcxPlJHjXwSdbQnQ
 lraZk2xJJHY7evTDwDYGUcrVW9hs1wB1t116vKkiGkTvVFwMnYkGryEonHNdPDTCpBKuR2Bxsz2
 wUHqppUDoV9Y34AQovMmAIyBdo0R4FS6QeRaib2dYEUbGdsOQi2PW50blRcUQbOLB8VUOorgu5X
 a5ozC4dGVDr9iILVcjceYTCwYnfoPjIwM2uV3hBMfaQ5/a9Uco9yQATgbIsiIOLjrvCn3gD7rRS
 L4JXeY0kUlhj28SC8ODvf21NNs0dsK8iqq9qgddPaxTclMFRLjJwlSbAUGtI52HZp/QEHAe9OxD
 mSlwe6B6yA9wap8urjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99395-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D10D42FD0E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the SKU table in the catalog for A840 GPU. This data helps to pick
the correct bin from the OPP table based on the speed_bin fuse value.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 38561f26837e..f6b9792531a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1954,6 +1954,12 @@ static const struct adreno_info a8xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 19708 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 273, 1 },
+			{ 252, 2 },
+			{ 221, 3 },
+		),
 	}
 };
 

-- 
2.51.0


