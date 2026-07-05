Return-Path: <linux-arm-msm+bounces-116586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6u/KF3mzSmp4GQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:41:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3896A70B0E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:41:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PVhvB4ar;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X+jJCCQ4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116586-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116586-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC41C3012B36
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124FD3A6EEC;
	Sun,  5 Jul 2026 19:41:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B73A6B77
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280483; cv=none; b=P4WsSgKr0LTFhRD6q4bAeQKYbcvdeQrpABkqgH9rR2tzvXln51oi4M9bXRmxF3Fo7jQ/wGaFpKC0cEiZ9VxVeijVnvNaBZCgW8v6XdhF4sO+UleoZN8RIZJXbMiRVOb7R24EBFDdMwkGXQZCrTfo+rdRwcUkpOApbZgwUs7TuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280483; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlGdOGLgBwgudrIifEm63ZxNEObwmHciePDuJM/EMZZOYagJx6ahHcMHSUcXylEYtAcje8LDa8YVMsosAkD6lclODR/vS69ipPNoRp36Goxjwi8G0EswrMGGQzXszAuaPWTJ1aJ7Rsu9u+y5AuA2rg8NqhyYOTKMB5CifxFZ3Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jJCCQ4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hi3cv2132252
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 19:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c82843005eso42724585ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=X+jJCCQ4rZNaH2QZPG0tZitzpUKqRrCOmuWF8J6cmnJ3Nezh1CbmYLLK3XFP/GW9Z1
         NZDdKt/HmKptEKSYSuSDjjeeCqArYdiH9LH5ds5rIZGHZqQcIDd7ilrT2+NMj0H2pQNc
         YXGiMP11RX308CqgyQ9qahuXGTw35xLR9bY8jQ6vV3UPasFMOeEz4Bn6i8n3vv8oXC+v
         8/q9SY35tZd5ymgEIzC38hWwU7FPnfggW/aRH/c+Nk0ZD/ocJvFlWX1+Gqcv8vZkZav1
         l+1xsS9fA6P9cv6WvY+n+8ZjiCX7ulw0dGUd152yINSkzYgwat5NwxLIITzc5E3CrlEk
         kUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=WHVlboyAliRYv85XrZ+yHEHLnvPv+bTMY7ERgk0mDH01p1viHWTjax9JWov5rzcYkR
         cU5mrTLdO5BRrYn52Lrg8ZD5zN8VNdw5xHUNs92oh3OwcLG0Xbxid3HBWXLqcIz2Zhp1
         GgGvSXqZbirvzyB6zYwD2Es181cnGj9ee0fqFGZqjAVrimAaaYhpbLSmBAMUxakPRL/h
         me9Ww3L5eybgF7pLkpbIIn0fLMo6ZflhDf4F6em3Yr+HgvY00MwPhvjwDNU0JppGLrbw
         Ll3oMKvikf6t79xFFesVseSnvKwLYAe80+gnOIp3hHXs5GhqdcRp18Su9oso/8H0Wqnw
         6wDQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+tmyhtmadHE58pZva+hL33CK2DnV2q9/9LEtZdG2I+pePovYiJOic2zGf5PbVKKmELTumJMyAAeL9+uUz@vger.kernel.org
X-Gm-Message-State: AOJu0YwO+zCMiJPSN1A2Xhm1tJ+y638m5YldME/muphKzqqSkx1P/XjG
	GuBgMYmX9XoexfX3VoYygdt1IsVgG5C7WXM9qbN9PcBdZ6khZ0opS0P7Gt4ErHMffWHJbjp7mLl
	RW7D5AfkgZMlpFFKipWkfXmXnK6OU30bh4KVThFDb7kBUMAuggw3cEfKdfEzXe6TwNVWg
X-Gm-Gg: AfdE7cmvdbO984GbnTINTXCnGkIIzb27szzXt4QAu7+dBeSKeQ5KP1q+RJBXloe4Yao
	AtiVTlMDrRHl8JF4SUTmNH4sl0ain+OCcVKyWNtdNstomNrCPNZNNBRpM1ydtEANnXGtREMspEb
	ZyrgOZe9IEI6onvPIqll23niQH6kg49Jv853c82SJzhyLxKxrlvO84Ya7cYKkaQmXiii06u+nX1
	fuLiTdIUgNx4dtc31V3RpUFtzW1tBCX/nbicgtbpBNuwfeA0/3VZgzgLZLIUehiX4d3mu893kT6
	joSea0mYuUAwobzPjxsJ17lIpNNV1gm579cZls8u2dGShfBApE/flAlyA8lmlyJUvvl+fQPmPVd
	dcE/H4t0QKkJuoHQyhRqCSeOW7DJXoELGhiTLVA==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826105ad.34.1783280478036;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX61VVMYyE2K2M
 KhtILuNyiZUI/V3LA6rqosdX/KF4dg4IQ7VO1se4unRuSADYEIle7oBK1yHxpIwR/pO83UgsSRi
 aSdlmARY/Gd/ESbvMVZSmy9w/X5NOrE=
X-Proofpoint-ORIG-GUID: PuCOGMyTLPyBpM4eP3YznpPskiMNP6Ms
X-Proofpoint-GUID: PuCOGMyTLPyBpM4eP3YznpPskiMNP6Ms
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/Zhj4/tKV3Nx
 73x/maUeqNA26iP9FmgAqL2rW5I2secpGX5Q4M0eE8E8B9QtIpMzdBmrdic3MLehCuzyviWDn9n
 7vbPeMIGDTkoM1BNSwc2y7dUuTzZWXyEQWljiDJuktn4A1rlJBALehTNnYKxpNpnBINsjNg6Gv+
 SNuSf8NpUigxMwk+3AIoLXaT0A9qyR3XXPOIsGb2YJEobNsidmrd+g0MIVF/UbQ1gfGe58SVGnn
 rM9uEtV4eCBFXtuXuFSeQYTWmspVQ/7br1mJv7Xt284SmdmcI1HgecqyT01xrbuKb/j6x8ChNsa
 hOGMYb/hRvK0P0FIWCMDhFdCnyWqBSVq7ghFMej3q3AC5IJpm/wQDyPz38vI0krOakJVNi8gv9V
 K94M5boTgoPUYT3Wde2ZAqfLsNbwkDwWvthRIbOBi/VwClS4qb9qF5eSqstLuFi2P2xswL9Th6u
 u2SEntziR9VPfmeEE+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-116586-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3896A70B0E5

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0


