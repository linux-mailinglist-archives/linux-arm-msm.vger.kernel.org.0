Return-Path: <linux-arm-msm+bounces-97073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL0RHgbOsWmQFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F259269E1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 21:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A68963039340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 20:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97791374184;
	Wed, 11 Mar 2026 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCWqWiOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3GKGq75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2738E106
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773260262; cv=none; b=A9awhUh8Y6HtdcGQeHDRcLcDRyiNPkVdeZzYgFm+LxYJX12Ws8Rth8UkqlLONh1cR6oJi/w5bQGOsW6RsjT8Ke5bjEd4iLZtEgaGAyG4P1loUuFwQuHKHW3LEdbBUY8HzWgJkEKYFxBgGLHEW7BFlk1NuEnTmDJZJV9WQWFEWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773260262; c=relaxed/simple;
	bh=cKeuUxvKam9PYjthYzvdvrZ0HPds02yhZieULog6qvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+Vd28V/qt5XsfY48+Sfa0BJI/SfDZBcFSamX8B5Tb7Sv3d4qgXhxVC86Dqmdm4gE1LN/W/e7Jp3P517cxtf7xkoYycEVOfk9s5gpT13ZS7Ij3z4fHFXLo0Qn825WWgXGcOqD2xRmInGf7RCogWQcHlK3/z2q73mnst0jdnnGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCWqWiOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3GKGq75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BK9eW92030858
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IctiJKzFga8uaoriJYS2d7YQbSXoOC3YlhoWAOwIcBE=; b=KCWqWiOEJeY3hadC
	wS62c8gJ0nsvyWJ6BVuAEso34vcsVKmHkW899r2bacf6o0gkZrlAfXG1sYvXbAyW
	ZlxDW4ewUlMDDQz/NJUuKrT1OCxxLXziQju1Am3z0o9Ib3/+kcnVtOhCRmhtmjjn
	luuuV8V8Iqi4sn+NwBHiU2sA6H9ZLYWwNdsB+XtpBWZJ6iv528dmXTGJdt745pgI
	eo12qkxEKQwRvlbuKzIpzox29y7GE2dQDjR/dTgqaoT8b7yipGVfqSlgfxIrnA1g
	HuG9J+pmwBhRI7nTY+NYwmoqRib0CisbN7LoEIc+d1Fjy/2ZWDvpOWaKrULBtyHr
	0rtbSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h2sws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 20:17:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd767c51efso38006385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773260260; x=1773865060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IctiJKzFga8uaoriJYS2d7YQbSXoOC3YlhoWAOwIcBE=;
        b=D3GKGq75eEz2mvL8yKxyhkQ3jELiVKT4pMTMZhuYy0+6vVv/zTaMsHIPNHz5poBul8
         cAK5fgtzz2AvIKeI3PUkZk5ngkitFsVClc8Id0FyD4/ZRlMOs9i4YtflXJGeU6Fusoc2
         v0VZTIQqfHRQXyCPAidJOrEPPpIq2n6YEdO757vc3sw2/CJwlJubGsuuQK2QBeEqlUfq
         re11zYsnEfxpQThxmkCnXagJrg73c536qCaFzjGphJEn3vk67T6thVO/ZVf/uZxM7TuP
         9eCUk/E+RueiXBE9oLSF0dHXP5AacRA3SacyX0NO5+TcB6F5umPP15BCkRs15mLXK43N
         +7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773260260; x=1773865060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IctiJKzFga8uaoriJYS2d7YQbSXoOC3YlhoWAOwIcBE=;
        b=THrV/3mheTd45exWGdiq230KQ0PSBKh2t9r4meG7fq+FRbI3QjJGypkae6fXWWMq4r
         rlNmMFdyiCuIkaYN0T6sn8E6mVs02H82mGZT+kWS1fhA/cMLak7hWcGG0CKWU0BNsVC2
         tItq9KG+UGI8fS+qg7/q4e5iMC+JyNWUOdLp7SFFpLMlg4KpER5RkIWqQSaJZPkwNcE0
         bZwgknCl/hj/z8Y2i1o8W23WPtk/50ticyOEym+OgyQm13Uinbclcwstym5Jggz2xe9s
         a9PeqWYtTH97mAB5wHMXZdljv0w3+clMl2FHqIpq1YaryM/xyILLNd6T0gcHunupyakH
         bFlA==
X-Gm-Message-State: AOJu0YzC6Gvb8SEqMLgtfP1K/twf8p76eXWYuY2nqyyxjRo8GfCfNARj
	wmso7hBXMXCqIp9xSpRz3uMM3+EDqWAYiv6clbSMUHDkMxyduQT25vPDpXzPG3mSxFn8E6QhtfI
	V1TlMHyqsDbkBEnqOgDphLNopUZ8Z4dDrtgFs0HT8qxvJpGMDDifakMis6luwxWnEpLpI
X-Gm-Gg: ATEYQzz+rIT786b6wgPzvJw2aOkOWpZQMrvrECVtaQOX3z8YTIoihbjhM+VtXcV2Jh3
	XLx0b0XWZrQEJ7QvW7drWWhc4vv5tYGqHMfBkgyl7n7eO4hv6Uk9wu4JNxd5goPFClD+FSJktwW
	oGVtRhCB5Em3+SVcukf2RJqoD6fWXp+lz6PMKvpD7sgLtqb7ueqqcDmt3UQJYwQBNU/8c7p/SjO
	qKsna14+W3Z4lDGAiEQwVXMwFLAkgvA+TY0V5Tx7vq8/wR7cHZM7hol8FVY8XcJk4AMQxLkHMkj
	FJSOzvWHfy5xAE3PxNYZH7KQp699YFNltIZ5m5nQZpRv8IOFb8LSpf3iBaCIivrqrUJSutdOZFk
	Rtn9QfyA7ARa1XS1CzhbOeq2WIuiburPVQ6gN2eBeNytj
X-Received: by 2002:a05:620a:4608:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8cda1a2d86dmr478178685a.43.1773260259826;
        Wed, 11 Mar 2026 13:17:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8cda1a2d86dmr478176585a.43.1773260259393;
        Wed, 11 Mar 2026 13:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm79257255e9.10.2026.03.11.13.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:17:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 21:17:26 +0100
Subject: [PATCH 2/7] drm/msm/hdmi: Avoid double error print on
 msm_hdmi_get_phy() failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-drm-msm-hdmi-cleanup-v1-2-c5535245f6de@oss.qualcomm.com>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cKeuUxvKam9PYjthYzvdvrZ0HPds02yhZieULog6qvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsc3XvpzTqDQBfvwACXsB3YLTwN5yo9Pd14XvD
 ywA1VAQbtyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabHN1wAKCRDBN2bmhouD
 109ZD/4se3ojRQZtYZkaaQQDlKwDOo3S92l9zAVqZ0fXP2et9tbZltOtUyDphgaQ1tGglCwn0pA
 vkOn3KAMfUPGYoS0dx9YGttBI0GRE2PsAEawERzZp01fH/i4CKhICGVhCYdKs7jAMAq1uqTZ8cJ
 ZjF/JUf7yVQNIZFMLn660vp7GRDrlYG/1wik0SA2VmeBxw0dKWHZcBelbHRhbBwmKn62LYqj9XQ
 axg65JTZ14ab0y12qTGqOhWop5SlPFd//siYUhl6qFqE3wy2D3Ih0gUKH3JLUgVREfrYdURxqj3
 6Gg56FETRpRnNX583bO7z9raBzHcqlCFqFJDZvOBvSnN00ROGo5/j3tGB5uHwRc6LOAf0prZ4nK
 Cx/Tq93mOcY538UehUbLughNs41PO+EtddMzmEkvi/j27IGTTCohT96fqoFkmNQd1YdGdPQuV6S
 RUYF2plnkzjtXFjnMoQtO8bMcimTFwDiVpBYjYVrTduiSDMJvB2Z5/f9YntDJ6kFKSMEZRW7Fw9
 lj+FwYnsMSIuXEkzA/bmobBEQUtr1YtuTmHKQVYCG56KsGkgbZaNTvZNgOnoirNL1p4HUQrAnc6
 zfd8tYD3sfpFRGB5hW1L9iG4E9oXMw/2CUDJ8hXHdYLMKesRsq2xj2QzszqqKauU+J6E98k2Hkh
 KoK0MUzqzV9vK+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE3MiBTYWx0ZWRfX1ff0xec0QgLN
 9rj3aJPKHnRE+PcRr44upEGKBzSX/+aYIrD4oybTmy/BJQOieeRA2vZl3JS7Kl7YPX+QjaKmtw/
 0kGQ2cSnV4deXqJTRfmXoCHburUor6xzc1P8X43rzjFXxbLgVzPek7Mhy9K9s9AaXR8NP61jGYF
 Fbz7WiajZQ6qwzCTQ343yJ56pRwaJoEv+cfqzu6poiF/7pniHVF2WM0cRLZA1xWNzwa0G/Sidnk
 9sQJKgUiD/fe16fzHp0cfYR0nq7G/HKm9iQySwwexliD+LEej1scg7CqK3iexz0adowWTgAW34D
 cefGT9ClN5O4FlZjcXcSK4ru12v4GGM/NwTLDHzNsQF1awvudkz1PiHCHXviAX+Dr6SK7OqqGq5
 2JerYkblzw6b35AIFQRHIyrIap9fq80GAwE8BAQkfsNha8aOc/QCClvOQpIhGxcqtJNicBAHUKF
 LubB8s9f51k87K/xlbw==
X-Proofpoint-ORIG-GUID: 1aDNspWTa0Efm8J5tEv9a7O9BvUHi_Zn
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b1cde4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kDavz4lrka8aSrD8mlAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1aDNspWTa0Efm8J5tEv9a7O9BvUHi_Zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97073-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F259269E1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

msm_hdmi_get_phy() already prints error messages on each error path
using dev_err_probe(), so final DRM_DEV_ERROR() would duplicate it and
possibly flood the dmesg on probe deferrals.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b1db1b597901..02a87bccab77 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -358,10 +358,8 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
 	ret = msm_hdmi_get_phy(hdmi);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)

-- 
2.51.0


