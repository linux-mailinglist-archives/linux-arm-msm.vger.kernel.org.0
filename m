Return-Path: <linux-arm-msm+bounces-58433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A82ABBBC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35B6B17C48A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F6B2777E9;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHd7AOVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F3275114
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652339; cv=none; b=tCQIx9fwNk8NQ0i9ElVQhBWiU9pPSCbM0VQ8WI9JdIJgSLyxU/Z/tjPzXNykFqFZilAMLdTypDyhJ78sNgGy7sv0XH7GafUPTJxq71cLNlZUmrJL8n31OuC92f7Wc9sClEfrTrHYWHsHcpdvJa19+qa3RfQnoXpX0nq9mBIztgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652339; c=relaxed/simple;
	bh=k+dXzlqMIg75u0mEM2Z8oVwbF0JGO6yHXhkMZsH6N+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvbLJH0v6hHeEajpnMIOBN8H+SqKQAhmX0O66UJh9vvAC+P3n+QtdaosKOv0IzPgKZGbaPf8S5rL4HPdtfWO+uuMGMlTlizww3wJAhH0Ujfk2HNLi8lcSJbto7kNO0jDpYJNfNcNIN+NBnahZqRdYGE3lEBUjSy4/CkZVemX66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHd7AOVs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4F1H2014333
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=SHd7AOVs/dj+b+CH
	C0DqMZTpuZePwmK8MfQxgGgSX62LuWE60uRxDKBJXXvPecR3Ouc9yzNv2R4TaL0T
	yycGhVWuYVoitxHTUEZ3vGsGRjSQMekr6lXAtrTC+qIPAcy2307UcnuOEBm5+X3L
	RbqlZMGaH7Y0DJ0tvTygIvDw/o65/Qf0egGyymBhuegpGq2hXUljiNYr5+YC6q8m
	qgWXBxAjsPDDWC5JvcEmoLpYA25AhBOKoA//7A3tPt7AiVftM9kOcu5eqvdU69B0
	igmNlV2HsNiP7goxxfQ0yhsu3Yr3xPmJSeCiqVPwE/FoZE+c0X3585kMF5jsMbfD
	tm1gSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh5av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caef20a528so1200282985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652328; x=1748257128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
        b=oIe/VGnv1XcMnvohp6NJ52CfgwNUSq2i3CSkjdJzVZnZTb5ob8WA1vORaRYteZ+i2K
         rQQY8h5MvuZYiN2d60DLMUiffb02cK3Zfp1mJnKRxZSSN0mu3Avwfu3VE0TLTdKSylks
         2B+RH/7WgTrjPTs7ZYqEOcn4pJyE5AuT+lvYa+CGfmmtAGqkcQvyblbczhG/3YFrh5FO
         C7HndpFhhwIMzH5q0luqnMn++nqsB+6WTZmEsnRhj8jMIGnaQpd2NuUnUUqC6OrXJTbV
         8VIiZgEtm1RYsmL86ty+0PSCaPnFUrXVP4fildDm/bMpJz1xkxXtjQve6XepBmoGdFPc
         ymZA==
X-Gm-Message-State: AOJu0Yw9Vt2O+a+6wj/3kiqNpp2bmGhxfisjScyeiE99oOdYg4IdoPzk
	gOK7OpTF+8OgyQaqvmKFbbPwCX+NCFZdENWbclgr95NuDGry5nZB+T0prfqv8uSrfX73+SlQUvw
	Vsm67wLUsaO1uLzJst085imdAiMeo4YJNWKdFlufUyvuRNaLBY6gAOZvsUFnGewI20VIR
X-Gm-Gg: ASbGncs1sg9SOwtGMv5VqqD/LwetwS5oD2KYDO/1pmVMzMklYFWP6m3PEfkziRoma/W
	P5M7iJTTdD/JZmg00TFyqYupne8hTIVPZcsfZRXsA6+/6lRq8KOgrTbNL31u9TlCmCk1dgc+3+x
	qJdHd5I13FWGhqyQXDUJD3WDH3SVsNiYflH7TjUddCl5YhDf85/HqwoeBTCA8DU72qpDEz23pb1
	Yl04j51TeyGDya57HWU10TWmAvdniO+XoqOtjADfw92vtLx0Y5s19WKJHtXzZBKRvyaF6OHV2rv
	GMhfeslwQJanbtQEqFaHcUdEmt8J1fvWJTtIxnxiPUi0W/Bv/bnuykYC62hDeVQWA23V0v/ipqq
	F/N2QtLkjhXCmNu9y2pEEQUqO
X-Received: by 2002:a05:620a:248c:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7cd47f0004amr1688582485a.4.1747652327964;
        Mon, 19 May 2025 03:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0Dkz5uT81kjybYAt3wNQ4m8l4BP7fLJQGKLKFt5m0JWT/MZxJVQhBDzIpWZrb3G3Vyxmbw==
X-Received: by 2002:a05:620a:248c:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7cd47f0004amr1688580085a.4.1747652327658;
        Mon, 19 May 2025 03:58:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Mon, 19 May 2025 13:58:33 +0300
Message-Id: <174637445761.1385605.15776598312432418446.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OaBDzz9Z4prwPAmUjIBK8QVKurj2BqFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX3zFKNRgdfzKP
 hh0qp8cwjnjiGTp+AOkjV9PjUuJzasH8lzLcDGczj6k/DLFSis7Uho3Gch9Xv7ibyoUf+5L+2hO
 uZleokOZNxKmDG7MFM38fuNyGVbl+Ew9bz+4ZjumUTTA5+b8HFHDcnZa+5ZLgK0qA3MUXGYwc7o
 krnLiTGLbCbTp1B7h6UBeaaixRt0g7Nfpzbdvn4ZBZUajTqXh5Sq4k1pFxEuhuc2s52wVkUuG9T
 E0zUnhJkeIk88Mi3o3nXVnzEIcoNQQ+WrRrQERITOCF01Z0iJFUIxjAjrl0kRQ/OyrdIJdOXv2J
 W56qw+8P8TOII7O7NIEB7WoLdNDPr95tceyL+1JqBpkM2aLlFceoJQ5ZlC6twmVOCustFeOJeVC
 mGknA2QFr7o/FFITPM9KgomUP9TKblTte9HF5IGmBUTzuX/1Ue0qUd3XOTgfO4dRxz8DWQeU
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0eee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: OaBDzz9Z4prwPAmUjIBK8QVKurj2BqFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104


On Fri, 25 Apr 2025 12:51:50 +0300, Dmitry Baryshkov wrote:
> The LCDC controller uses pixel clock provided by the multimedia clock
> controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
> clocks properly, taking MMCC into account.
> 
> MDP4 uses custom code to handle LVDS panel. It predates handling
> EPROBE_DEFER, it tries to work when the panel device is not available,
> etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
> to follow contemporary DRM practices.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f1d131147aa
[2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6720d64d8eb
[3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9c2f63da6a70
[4/7] drm/msm/mdp4: use parent_data for LVDS PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b641bf534cf4
[5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f26b80359bc7
[6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b565edc44b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

