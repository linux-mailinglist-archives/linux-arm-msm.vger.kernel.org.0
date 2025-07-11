Return-Path: <linux-arm-msm+bounces-64538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B48B0192D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E8347B6614
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76C4A92E;
	Fri, 11 Jul 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axw5SR9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE31A5BA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228023; cv=none; b=nPNFSBmktPw8hiTR32XvURoS+JKnDf22lEATkFEWi2zCIbumw9hX/MB2YlQpLa/qbwLz8iFZkuXpkUv7KiIaVfx9bKq6OcchpJ7gd4eXbs3+WWrcLKi0Bu99rTyeQin1/ZAipzeM4tJyZSdbH+RkjZ6TQh/8J1gCQtHvFerMGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228023; c=relaxed/simple;
	bh=zWLtanhvCIpSQaF+swneQUeYFWPTh5F4obnY4lrF7m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPftraXETVJTWODWEq+RUYP/+nN3d6uC1AjsrfFdv242IpnAHKTXyVigpYF1Wp8NWUH2yjqV2ClftE2DfA8uSgYu8IDAr7HjWDj8r8w5MKeT1myAAZE28PQ45zvyoIZuO0nRFWuurSdKDRfQGqh6F0F0F06ilM/iKnQYevfBSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axw5SR9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B3GH06016058
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
	c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
	WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
	9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
	twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
	qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
	Qqv/kQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ttj9s0mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:00:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dfd0470485so12237785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228020; x=1752832820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=DaV5nCS8qhy3qi6seqY5MOXpstvKOoxrjZaSFZ41pvEnDBjQxvdcqSME7hmCwZEP06
         rQCdtFICRYtf3P3DBifsOAq2J5s1yO/r8y41x67Tf04w99rAMem1UnLUmbFPInTFcH6L
         L9g9zv6OfFhxp7NV/5O+1p5bq8sf4GCKg7sS+Hc39dJHWi/qyVo9VUMt0UJL9uouXn4k
         x0szGNaSKB9ZbimNcGz73cqDz0vaLUm/G9Wbb2F9QoGH0Gs+3ywdA/ZOc8q1NBhqSbqG
         bohC2SX9PlIqTHvOeITHgf6sEmKdlcFcODymbtP01omk/0vVOmRDu7jtBoqV1K/jx6I+
         2rJg==
X-Forwarded-Encrypted: i=1; AJvYcCVAn/B5fe7UKN9HDte7rRyaDS3XLxVIylV7XmpI14GN8WCMlzJU3cUEtumFl6D72P2zQZK0jCX/CmobDCFP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjm+Ei1vrhvbBJt1Dgqr3mfhCUb91HxVqgdPWrbIxYCA4EIhuO
	MqhMq7daphIQ1kiEPFLP06DEFSTNpwJ4/Vvm8oxRfBwyW81DxdLpE6Upovs57WpOGCVcCTjffxv
	+gp4JS9wgnkJcZtRJPBupFaqC9j61b3nIYWQ0TbVVUx8Zo7eO5WZRMus7IngZ1nHJZ3Hf
X-Gm-Gg: ASbGncuF3WhZ8HAREMV2xh5H1k0Do4Fl6+AwWpTJ9msniJ8ZK+Pk0M7i2gCbFD0l9Kl
	MvFa60Lp10PI2cWk0+tQZXO4ljIuVYVhDGfaliIhpq3wadcJhVzRDjJIUTYhKceaVXqKDJLeE01
	CqBp1/Dn/jRD58zLgUYa9LAZj8MtgIoluDbJmrPcWzYS78ozTYw4aud5aEvD6pxlWpv0YAwrJBC
	4VhqAJ7abyqf6R1Nh9dMnLIRBzjjyQebx6WqLFdYz9qJFPJe2443YgOJefM2kt2CqN50nBXVR/0
	wcv1mAUfjQQAldV5oXN6hON7XUQiVu/vijbiVMa6sDGGWEaP5snU+cR6HjCx8/cHuLpck80c97w
	2BPcAzXHUFrLQGfnYHlUl
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101578385a.6.1752228019744;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX5KlOMH45Ut0J
 cWy3o3vGQ1p7GJjMqG4rMfLd8kpYcN3bRD/if38g4USqJ13Oof00EROzeY1HJYwhVjOKMNQ/bJ5
 nyU7I792xtAc8jvStl0KII3i5ZSvq7nJvdslQS3+Iv2duIHoQoEpMFmom1H2djryCyMCUKAPQN7
 DD20VtwyARJE8IodduehezMLYE2TUwCW4amey4h2SpuiBcOV7WDh89SqbvA+fPtaZiK+dPEmWhM
 yxaXhFk2aYjnAQO0zq1itgJIhD76Mf0BTEzHv6DyTSTOpqC2JZlrVxT+GKFoXwCFESZT6KCs3yI
 i8kcV0dHGkIsdSHlS2nRB93x6pYY7po7O/E3mjn7A6+Yjh+rkv23ycbyf7JgSMCgny1dlyGneIM
 jZ/6qSW2q2MB1GSf9hDYwryJKqIVbVmw2gWQ5M+an1tVGT25k6hMZlxB2XEdBDSj4E2/pk8D
X-Proofpoint-ORIG-GUID: hmt_4QGUOHUWQqfX2RByszqhQxUOaBTU
X-Authority-Analysis: v=2.4 cv=Gu1C+l1C c=1 sm=1 tr=0 ts=6870e0b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hmt_4QGUOHUWQqfX2RByszqhQxUOaBTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxlogscore=785 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

