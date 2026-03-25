Return-Path: <linux-arm-msm+bounces-99871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CH6OeDbw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:58:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 918153254DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F0733E9F06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66FE3D5248;
	Wed, 25 Mar 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mlhXMX+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1gZoYmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFE3D522C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441023; cv=none; b=HvWj67oNn0N67A3v0ckBjSn6y+UmvxPafQOl4Cs3/XlymJp6T5T74lxv6ZazFKZbSygc2e8U3F9mnFqYOoHwoTp8WHKsQ+jRz7hmKcj+Rmv8grhepw+MMFCD5CNvI5XIl+JEPY64u2bzqPMpIJc/PtdZYKkBTQ9vRkF94IjFaQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441023; c=relaxed/simple;
	bh=9HqjZjYEEXxWYNOsK1BlNwDe2qJ0g5GNTghb4mwsuPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYUxreYBitKwAyaCeFX6Ua9IHVNNfyHmjzhXOimAQvLvYTa2dwPSy9c0/icjbZXxBWJZ0RZYRhR5fUIlwHkllgqE5GY5nAqIuDa/pWKPpY+DaIUv8harfXvx/BoXXjEifXPqeot+vJVz0nvJ+91xVFL+tNRV0oRew0QG1n72v5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mlhXMX+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1gZoYmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGawi876385
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bHulzvi8uj5fqRnkCJqOhZgc0tBVSXYzU1jRVkjfuc=; b=mlhXMX+j56Bj66vG
	60DTQy7zye4GPRMm3d1tO8P54tvXJYeih8E2BT659jKcSHx/qmnDAVIbUrGqf9kO
	nR18i5MHGxI1DOU9HVDSPZxSdDzVy+1EluW0txFqHDPcKJ6t58pBJRlWh1fgpBT2
	xhZyCdQ1AuomT1RM7CJzQVsaTLb4GYX7bE0nHKjBTRY+mEZfEOlTX5syrGgK/Q0S
	ZaTvm5n450J5JXFTjVZ8LB6lw19WXalC1VAEjOMAFws59cR99bIrSNHh4AtKo/iV
	xtMFXmO+H5huicvTZytoScez2mfUxcNrdTFuPYUH6rHr39xU1WlbVHh929EAnk81
	tbOVeQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4k43c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:17:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-602948972c2so13119757137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441021; x=1775045821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bHulzvi8uj5fqRnkCJqOhZgc0tBVSXYzU1jRVkjfuc=;
        b=M1gZoYmzlcHcMuGSXAfrF3++uOYgV1JBtBBKkrNYfOLGJxefW1HCc/6d/yqnDyRCXt
         1AZ27VUkSaQxiZCpwUmCxhcuHBKuZ4yH36Oy7o2xxoRKsycaqC+p4cLWPs2aCkSdS4tH
         VOv3l0FFUhRpRoWnt8ZP4w0bK7TVgdHpVQr+Ix9C3DE8Ubk0BsvXlYJFOI3F3whpcmWx
         Er530wQG/Z1slvyOqdodQSvtcYdPJU7YLQNpmwnrDncIGpwd5sPA9S7Wx/kz4I7pu8y/
         YiMMcBz1021+OE3bUr6QZx45S3ioRGaFv3ogjQ7zjN2467pMPzo+01/n+jbwBZUAzVoi
         BeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441021; x=1775045821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6bHulzvi8uj5fqRnkCJqOhZgc0tBVSXYzU1jRVkjfuc=;
        b=QR/uBnAaa1q3G0X0pFhom7FkbH0OhdwocwPqj1ZpZH5a0KM1Z5H0ITL+d5lXnMAWfP
         GmWKjV59eIH6NIuo6C4+Xy981jxLWa0VjLHiQHfMMhD9C8d7tKUO5Qd/WvYxdszXHBXt
         nC7sOseV5tHb3SP6aPPi18qGVunkDOKJFGMgDLQST2HyxEth3D36Co+w0EWtx04/kU8D
         pUP4siLUb1eidYVd58YUiViEQE3Eyxc2oyLKRdvK7rJRRzKf9Je0O7V+gNd1rSa0LNMR
         WMBF8p6kcbj4AUQ5x8GCAsKUa2GstcnsB1tw/8lHg6G9aI5Rwp7x6tm6S8I3FxiveDzV
         TVQw==
X-Gm-Message-State: AOJu0YyhQ36bx+EcVwdnJVES/L1C8asaK6+LTJZwrlNGNpgPdsTWdwMK
	YEWG5PuKuHVQ66t6i3nZ7P3avVkbj+qxdfO98b/9ufdd/Tz3TaCH5p7iONhox4T3fFpzpvrpn37
	2zlQadJF7Q5dJA/N9+3kUoRVPTtBwQI92SQPTRiGfACQQPFKfyHy/Tx4jcr/qpdHQJ1VQ
X-Gm-Gg: ATEYQzyY43UdLRO7ScegRuk3DbouBX9q/3dQ56eJAgMU+l331yV5I+5yabEYO/f9luB
	FIg1xkcZRCqiKLhaEWnfLYLB5Fz3os2MWFPfOYqp5P8HQ+8hv8UvRe+d6ljRZdYCPj2ELjRFSpH
	wghgDqnwp6lX7z8McOhqVlPx0mzgjThMwGaDBlIOhBaUQvFTVpR2lc+vM6cQ5Hy+v0O+8zKZXT9
	fmQYT4oiPS/Jg1BxnqIgV2bWyNLC1+3+5ZFxpCNHUt2tqBVBatL1bF9CDcM9YuUvkHvFkoLPhUQ
	SCubZwQ8+UgSx+FmEje3b4l4qTQauOsjAjZ+2laB03it0ds08ahJLK8GNDrWfSsWoXram5O8rsY
	R7vo2G6zsJQjJY/h360+HDQ37QX66toqasm9TVWJ3pp9Y
X-Received: by 2002:a05:6102:2c0b:b0:602:aac7:b8c3 with SMTP id ada2fe7eead31-6038790b9camr1337445137.31.1774441020772;
        Wed, 25 Mar 2026 05:17:00 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0b:b0:602:aac7:b8c3 with SMTP id ada2fe7eead31-6038790b9camr1337403137.31.1774441020095;
        Wed, 25 Mar 2026 05:17:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:16:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:42 +0100
Subject: [PATCH v3 1/8] dt-bindings: display/msm: dp-controller: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-1-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9HqjZjYEEXxWYNOsK1BlNwDe2qJ0g5GNTghb4mwsuPA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Iw5L+afc/dju46TUr2s9Lq2I56+t6xkHzKm
 Q031EeScWaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSMAAKCRDBN2bmhouD
 10BnD/9HuRUfNWdBCJAgc4h4Lhj+HceKAcROYA4eYTZleik5zTcVA2+UoRkuWgVnayYohOp91tH
 +IDCPUYeYVeq/puwXOedqh5gC8e3WUj38YAePe2UWEu9mVsmWAbmkZoq2x13ccL/tPU3aj3RIPK
 kXouMO9KXy1YT6KGcWJjQa8ApumirU9xZ/fThPhLFskgVTShheq6wcEFoO6uEig7FZQzj7v9K/n
 JU1kvj9/hHgTFJnTAqOJ5QHy8c7ivSOhKDt36O5/eQSzBZIBxxnsBvYMRkX+StGC//ro8HPmH89
 M07tkyAjK7D/pgOVz5gKQ10vGjxGTANHzlYFX87padmWaMdIduaKeUhD2soDJSrzrpWDPPb6Ad5
 vq/D61tWXinvbV/7WFXPxeXNWKRz2joYrpaui5CZ3oYdnTkL/QXHebcFITHXFQ0NrupCjV72UdD
 kJ2AMspRNT3par6p/tfZtBlbSs8TOfIjLJEi1v1qoH2T/gfUVctgtcHh2xbLjvhweg614PqT1rU
 kspSJ5Nd5svksyMzI3zlUpFzTYypbob2pUADypVlxFLukEIC90nlslvzKS3/1Bp8YBwJzi30jod
 iHq4bM3+HNL7PH2y8/JudbkKjnUNUIVXoIHlHQk4caI3op96ee8HMA6DQP2PNl2ZfDjaFw5D1MK
 QstMS4EhmQw+K/g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX8XsyEUIYNHP4
 PZCPjXeByscZMzCrcBu6NcJRYDJpKc2XByoPqkQD1VOdso7Jb5rujeUFh4BNYX+7dCPNsLoSMis
 KoGWYImvI6WV4vvOYeIFqveJzGxxbdv9ccaZSnuUA1v3BCSMGA2wvI9ufwQBqq3jJEALA4SwWlp
 ju2NQU24dVlqw+DEAHu7Uf1zw6lEhJEEsuzq4XIX7GyPmIM+IDuT5RsrViId1o9TL/UexTHbL/p
 +q/5E3C+2+j5PIgotOz8fXipGAKudthWSk0x4eY8iOowO2ggrzj1Yw0ZgrsqJZ1gVgQHVm4241N
 QpAdPT3mTHkxoeGSOOSYRVgZp1Ev8fpvVuPA5V4oVAC+uMeVivGubCbm+IkNKbF0lzi13bfcWHN
 YJTefeFmkLI9d9QwwGywfz4ZrH9ssSfQVK8oSNV/cwOFrhFdCMaBh6cL3SL00QmEeTktJaCyDcv
 LaiEh/SFICQL+enVNVw==
X-Proofpoint-ORIG-GUID: mGCWSkZ_gIaQeNxuUono2UU_y60ble5U
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3d23d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HHm6X3FrcUt9TeXg1a0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: mGCWSkZ_gIaQeNxuUono2UU_y60ble5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99871-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 918153254DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
4nm v7.0, SM8750 uses 3nm v8.0.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. Commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 02ddfaab5f56..8239adb7f7d3 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -67,6 +67,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-dp
               - qcom,sm8750-dp
           - const: qcom,sm8650-dp
 

-- 
2.51.0


