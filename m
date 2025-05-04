Return-Path: <linux-arm-msm+bounces-56709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 502BDAA87CC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F48E1897D8D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA0B1E835A;
	Sun,  4 May 2025 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PceyglrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57171E51EA
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375224; cv=none; b=hf9nEqVgE9wsCh2g6/Iv2RabmW3zTcv/CjN0B05PCHO0ntsgZa92GXKZJ8wRXNXKB7I/lIH++BqAB6IfIixLx1kN0Y/UC5nARuHlE/uNB4VnIh7IlbVAEvRLKk2A9kNL4FIJ1smy83qqOQ48b89Br8NsFqD8dPfAnXGmBYk8LPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375224; c=relaxed/simple;
	bh=k+dXzlqMIg75u0mEM2Z8oVwbF0JGO6yHXhkMZsH6N+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IaXw/7Wbcb2y3+jqGiHBaILpCzCTfgeVnUOm6DBGrZQ7miO7G46hZxYg16KYD5ANGazse5luaJMrOAMDZcTn0Tq+zSDi6CddJepvvk8xNkbSruW4gUikYDMVApqMvT9k7/3J7wa9TDCinJ43z8BupioYDeBZA2SU24Fd+dTn0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PceyglrV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544EUcl5028255
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=PceyglrV3PU7GHzr
	LuuP7Q12afGV8PbCfYTHmKQsTBtZtuXymMNqsu2dmixChR6erxqUWCPzVtzIT7Gk
	D72ayXTs04CvX8pg1yjiO3EBXBRqHRXpUYRYHBe8A6pSpkmCkApdh0vt9qhFEL2e
	qYe4qDZc0K7MXrbAPan9x/gNIgAWkQxxja4dziSbeCovgizl9DF6pVz8ML6UH7Aq
	eoxo9YtwQQTIU4OTEl7CSA938rcpLUBnFBZNRFns2Jrvjh5BT0+s8qlapBpu3x8R
	Fy23vk+CeM5ssAffU0ROjuC+FH8tK4rnDQixqbzSyXB0ON2tFzzgZIDrvggqZKg6
	mZKNhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n21hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so498585885a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375221; x=1746980021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
        b=iQpFoSmShg9c2RAy7M5kdgiWFDXph7pfZAbFWXbq8kMY8UuJ0K9yPUOpXwp/0uLqoy
         aQJn9Whe5tw1PJQxPK1+QXOXHe2OuSRSgoBzNTu8FwghQESClwutd8OnmELeqH7NUDWJ
         XPAJLXsL//CEN3H4ibWqiV/NVGFw5YxWo7u7nZuBgkR2sZQmbUW5fCMESEPvGFqv/5+h
         yYIlmlSIarZpwdAdyfbWxc6DKDCDCNIQ6pDlhxH5mYAdKOsoL+pBwv4rlBhsn0NWCu7b
         GHtjEIQwRB20qrPye6uVW8eNmHYZZdnBQTkd1oBF0may+zd6f2ggbOqS3WPFZXrsNI9t
         5m7Q==
X-Gm-Message-State: AOJu0Yw4g+fuvgjixIFvkt7OVoqarLLu5a1loOb9lP9SLjMy93MY3CDK
	g+g/DUc7j4D7oC7rqvjFVJCOdmVmt/LgvGpspNtpv4+AlnT0yxo5ZF7njXssv5uFhubtn7yhzpt
	4GFoCY3PvwTAf46rUqXljrUue+/qi4GSmIRp0q43gOWK7/9GWQhLb5VVCeBIlDLnn
X-Gm-Gg: ASbGncuTxMy7fv+QsK0Sa9FktVltfvZLUGm8Cxvc+5+brM8l7GMNaNKYo7VZjGG6BEH
	YG/VxitWBpaCB1ITgQxMcoT2EuHhsO35REISKmNpee3QIVEE4519FxORnH7cr50+ZnZz97bBIzx
	jVwAFAWs6orHt+2P7v2sE6pOkfNwsRJD8QUSOzc+X0E6wA7o3cTVHTkH8WVwGjnlegzYdCc4sNT
	s3E2AFKp40Xobf0qsiGs2vA1v0s6y4nnl7wT1YDXQiWxPUCQBgKEdlUbPXr1i9Gkok0dsQxhhM6
	QNs343oWuvLcKJlJugAzKcBRtq9MWvLs/I43bEDPLDsKKXyDvqasSv0e2HcLCYmHhNj8ygsXT4d
	LDaS6o8V/9K6gpT+4nbxs9I/D
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7cae3a5a077mr572042385a.3.1746375220858;
        Sun, 04 May 2025 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc6F2gMWEMC/eQyOndUIwlivpCZSW5Hk2df4PpYxa0HMFQ0EsGz/WEeqpDE8GrC8oyTI9p4A==
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7cae3a5a077mr572039185a.3.1746375220519;
        Sun, 04 May 2025 09:13:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:39 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:23 +0300
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX+PgTKkC2Gv48
 b86VDfgcifM/rFZTrK2AT2f6oL3nQJzxHx9fnHSCily6dml++S9ZQoGAA8/dW00T10k0qG1mGd6
 NNRIZobGpv2PO7R1Qd3qTS0TE1grvELFparmBhdULKlwt1Lqpn+qCkorXRGTiihTTXcLGlwEOd0
 V8cGI5rL0KI0ctSe7KsQJZmINTWcj2wW9Zg+dUfhrOP+GMPDLP4H4yCdBgoK3Dnb3qwdC1s222l
 HApfs/mtQWfS/JyFafTevjR/yGQvKIYnrPwxYApYUdr26ro7zbuC5CNMOUzQWV5Anflx7A5uRBu
 CSt3IYfqPkx5VgdzkWopfAOnETE651MukcorB1CM571cE7cIdyBSBQD6Tzq2Jp6TfrxUJEdE3SG
 z1oxSpH4zR+NrxHq8sEtXFAy02/TfDGrPBF6itB9MYuuvIJrgsBeIa7eLTIPiUFvuwV3Zzvj
X-Proofpoint-GUID: sQshsTG0fFJvGbWJ6vht4uPdj2jxzFIM
X-Proofpoint-ORIG-GUID: sQshsTG0fFJvGbWJ6vht4uPdj2jxzFIM
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=68179235 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=994 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


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

