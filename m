Return-Path: <linux-arm-msm+bounces-81971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C16C61382
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 12:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76260353241
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 11:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F51025522B;
	Sun, 16 Nov 2025 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVJSvkAy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AndtAZN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27761FBC92
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763293020; cv=none; b=XCimNkMf2xih0TZNOa/8Q4jp2nXkRjMWuyWb6JC495SHCuiDLx7uZ3rNzBYKoQ5nAoHZqsbPdUET/95vPPrNhX1NVHjcJbywnzD1bEtWJUqcPm70T+7+G8r4LrY2r26IUgXkE7YcdvYdZxfqDYk13hffLqOlD97bBzlPeA56jRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763293020; c=relaxed/simple;
	bh=7jrxjKLLHCYgpe/2ZXMQbyuaYicEtP2fnnY8ikobKe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Az5k/cCVDGA9OTLoWpaW/lZaiIcIly3Yp1dQ+VQ/lWIOOlBLwrHV4a1dXIhhjeaMXhJUbwT2w+I4FK857nzvKzkvKCvi3eB5D/I3qfoaWdDW+CcrO524KQdr89ferf7m2oxOcKXkTSk2dRNl7iKbFvkaV5mF79ENGiqorCsMQQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVJSvkAy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AndtAZN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AG2R8uE4086602
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 11:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl39reuCjCw22KE1gWiy484p1w8qFeJP1HonyxL4J2M=; b=nVJSvkAy9sEqP0gj
	/pe3DkNax22Be5r5Fg5UPpXl0ZJYqcz832k6FuZf2JL+10ERGsZMWn3Mjx4WB38c
	JIKMNAVGJSif3A3wAO+6QnCixzEDb9J5/JM3NeX5tZBaQC8fomOELqby7MoyBXBY
	MrR52sILyEw5pOE4miTlc52B3JenwMzUCnj9wji6VsWZnKkVTifsSqKXobovAKHs
	5ohEuwDW7kDXvMAlhqM3TIYwTS2Z12cGUZ9hU6apRexMv2r2/tmDO9LfLCyznQ/P
	l4dPW9Dd4gl6Z37IwEv8UiHlOpVypvmbtiiHKUkKCyniooCWW7pA5Ucb7+RSX3f9
	m1pjjg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0221e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 11:36:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8826a2b2d9aso126951466d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 03:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763293011; x=1763897811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl39reuCjCw22KE1gWiy484p1w8qFeJP1HonyxL4J2M=;
        b=AndtAZN979UPUEo1Sm/QqQkaFVtUy+8i0hrERagejRkUL4RsN8psJ8pFtsskmDtljH
         Gp8UnD8XVJFDs/IoUuBGqVkCTBLGvVmRdYz75mhZFdKuV8kniNx2gKypfCFafUp2m5CL
         aUCbRP1MQ4Vv6qbISlP1SfMoPBJs50e3MekVXSSuAJ1p+4BHhtWVBHfKNgPr2Itr9Q86
         CcuzZYbJ3T7OOWZI3FAwg/URf6zM65qQbbG5KKf6bQni4SpAIefXWHLUtqy0BZEcsZDJ
         9D86d8MSPYapL8/0Ey+Udje2TCnp6d/C1FSE5CgVhr0NfD4cmLwtKccgwBbKN+TPHsU+
         Yl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763293011; x=1763897811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rl39reuCjCw22KE1gWiy484p1w8qFeJP1HonyxL4J2M=;
        b=nbQ/pUG+mqv8uugS81EXJ+ELcdHyMQVDmF2aXCXYgTXzIn5lerXMiw+rA5SmANXa4Q
         8P3U/hlcC0+dnpxfrtLov2KEUbjYjw3/D8YcP+0+NGX+H/ScBX5pbuJObebkvwPkYE7a
         AmZibNt7CmxugZ5C5k/OpZgQydbUmUeLe9UetAeKygoZsz0+xLNR1dL52mb9YX9xJiFG
         yydmki6UPN0Iay5u1aZ4Lc/sQHBWrR96WC9t/23nL8TBCnPJEP3o7v8/gYGcaut+RChb
         +4wrDUc0+x3S7E/VCKyec+Jfbg79cZ9//9wiQ9xQqgX4a+JKwFnNEjTjJb3qpFz+/G/p
         U4jA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Jn4ey/yRNSe28U0YKRfBLKY5Rkh0Pbm8nACzr1T7UT8lGYc1cgFBaBOZk2r5V9yncDecYU7TW3wGjsL1@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGu0Obb0eiewPxfkr1gVWdNDaJi4Urz6FQN+F0dklvujjExc3
	JM0aInKjIfqC0ScoLlitSxubmmE8I4dkon89QRK3OfZM0lNRe1CXMiy++q0UUGerXKeJWurOn5j
	0x/izAmqWEoTQL4t1nr4XyaFpgU/V2ymMpKLwRHsCinZz9bHjBKbsKvBKIU1IkID7ZMZY
X-Gm-Gg: ASbGncud78/m/BGOab/Jdb27M8nPgCfqzEMs7OMgP3OgGWit3GWTADLWZNp9zSZx4zE
	qVuuA6nVyp4S9tvWpIzl5ISZGojkVJxl6swugCnFFlX18KUif3PbFT+N5cghBktPduCfCQlTzXE
	nKkYtHWb/0Sl2LW4hhtnal4oxqWUJ04IuH42eEkXFUDx+4UZ4ineZ113R/kXSRlDvqyMkUY6yVE
	GhV5kXu0T9FK0Z1TIEpyWPOfW5DGpLkfoMVK7Hnf73Ydwm0jjUlQVlHtbBmo/iFPJTqes6Guf/e
	tYEh/WqLnPYh7DKdCwPmBqUWdpunoBFp7mffapiTcuj2JDM+lnPVr8wH3mU2NJklGNybN3SsV6F
	F6ZqZE9173Eg8O11Ws9cKLQw0DaRdPIb6/rIxVpO6hQO1RjEBbjDCcWkuAdLYHeQjb05+8rsrRz
	cflt6kG+jN0u9i
X-Received: by 2002:a05:6214:27cc:b0:880:8682:9b46 with SMTP id 6a1803df08f44-882926d3d4emr119921036d6.45.1763293010845;
        Sun, 16 Nov 2025 03:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuuYZ2qRqPnytT4Ht0co/lJBzhqi3uZOB7XLqW3GSAiQkpAB7HtaYH7TYIA7VhA1y0LSU7PA==
X-Received: by 2002:a05:6214:27cc:b0:880:8682:9b46 with SMTP id 6a1803df08f44-882926d3d4emr119920746d6.45.1763293010314;
        Sun, 16 Nov 2025 03:36:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b3019sm2294925e87.26.2025.11.16.03.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 03:36:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maud Spierings <maud_spierings@hotmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v2 0/6] arm64: dts: qcom: x1e80100-vivobook-s15: add more missing features
Date: Sun, 16 Nov 2025 13:36:06 +0200
Message-ID: <176329291083.1920848.17290380320695043230.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=6919b753 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DDbhtB4dO4PzCpTsSXkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: FeNPdF4rGlAQ-JSAeTS_CFMO_t94jk4D
X-Proofpoint-ORIG-GUID: FeNPdF4rGlAQ-JSAeTS_CFMO_t94jk4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5NyBTYWx0ZWRfXxjQPhUUeWeVZ
 D1ghJPtVcu9Cb205gQOtR69HnPzlSt0M9OQNN/h7n+t9XM1qvoJF9vfjE+Pak30K0trENs83qCO
 O6lgDBiCKS32/MxksQzMtkMatMpcfPrJRklpup7C2NRqAZVkH3JypxKTurokYSb1ykgfx4gyD+6
 1eILyC5StIPyNs5vX/uyVRwVJya4K38Sgi4MGqOZc2SOEZ+aA7faL9g7NzSHPA0uoFbz45MplbV
 L/Wx/d9OSsLj5y2fZ7JPY3demIBV3MLdpAJU//jHuYEvZEa/4emcxggPaTH8lk/Hn4WGKJHd6dr
 mPWImyjq6yQeAtwhVsTL43/gmXqZKbyKdU4NCb57okC3zRqk8aDwhF8hAXF2hEWJO9F9y85Qy12
 yL7+DJkB/dnDRwu9sCfKk29XZf72Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160097

On Sun, 16 Nov 2025 11:52:05 +0100, Maud Spierings wrote:
> There are still many missing features on this machine, add the ps8830
> retimers for display over usb-c, the simple bridge/HDMI port and set up
> to use IRIS.
> 
> Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.
> 
> lots of these patches are very strongly based on the work of other
> maintainers of these snapdragon machines, like the HDMI part on that of
> Neil Armstrong, many thanks to those who laid the baseline for me to
> follow.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] dt-bindings: display: bridge: simple: document the Parade PS185HDM DP-to-HDMI bridge
      commit: 07b391b6f99bc1e62f41e4ac249e7c82d46480aa
[2/6] drm/bridge: simple: add the Parade PS185HDM DP-to-HDMI bridge
      commit: 92c49b3f4df8f9acfa95551ef38fc00c675319fd

Best regards,
-- 
With best wishes
Dmitry


