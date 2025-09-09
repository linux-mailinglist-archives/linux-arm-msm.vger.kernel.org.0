Return-Path: <linux-arm-msm+bounces-72713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC8B4A719
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D3BB1884C74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFC9277CA1;
	Tue,  9 Sep 2025 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j91VP4Gv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD5527932E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409135; cv=none; b=LyMrZg9k2Y3amygkASs8WCu8e16sy3bHt3cGVZBWCAisCMvYl58hoGkvhKX49Gv98J+N0gFeRh2hiHe8Mve8W6EhgrfhUNjMSze8+ygmc3ZY03bR/nNKUHsTa3e3vQReQzNuW6EgGoKMzZ3LZHSJ8IgL6h3sX6LOAT2uqZ0WYXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409135; c=relaxed/simple;
	bh=luaWj8YLVt/GHe7gdqZ+kOjyKtBzDcdnU6RugbywhPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7vpkezwS93ysje4AeHRn5RJ+WbNClkYN5ZpYPYIXo+tlnQA+UCpklAMHJCcnXYJxYjB2gJXfme9xX3SSPBH82fBiGe7RWZ1aAr4BcJrsDrm73gDEkKXVH4ODR8FcDMy/G6BsbE2T9EvEhugBoZq0rk/0GyGIrIdbbagUAnDziY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j91VP4Gv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896ScDV012369
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 09:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/LZ7jld6Mn4TzxL+e3wR4fKEsF+dhJ3GAlByrhuIjw=; b=j91VP4GvonjXVqJG
	g7UJdf4R4krV5SI1hisRHQTgpAYDp99pUNmaH0VbNzRwikm4gD+lpc/O97k/rzaZ
	ldmX0ZDowjWc8kfCWE2m6WJoUqn7gM8RWHgHbMlXcJ+ZoyJYcNUozb/gAWa3ys6E
	xQJA91IUsus+fR4iYRPl7qWpOpSfp6ut6oIJbGYYeopXtVI6IQjHVme9nJRTOck3
	Bc7TSKCQavDYO8j1+qu+zLdk0sHDEDq9C90RRR1XuXUW+yj2pZTx5rQypvKhiEPc
	fMH03JwEx6Q8l5+DjRi9+rhY6OUHB7Rl4JQZwS34qhVLbA8/NARnpTmQI/Golbfx
	TJDfeQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a7j1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 09:12:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5eb710c8eso10436561cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 02:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409131; x=1758013931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/LZ7jld6Mn4TzxL+e3wR4fKEsF+dhJ3GAlByrhuIjw=;
        b=JrPkkBrm3OIAAf9FR9oPUx7JG0JwZ+ouMemSkHLhQiGt7t5fqzQWPt8FIUyrVRNYIv
         4c1Js9TGIpjUpAkjKr98iKbwh1pmDdx7ZWm6jG0MyuImPSTGwknK1+iSDMVnghi6QnJu
         PmxXmQwKToy2K8ZslIImSqgiKGT81lhGuSOPW1Gv03BGZ3W0OpQrit36MBpYYK0WM7DP
         xdazajqabJ2/upnUFkbaghwGLb7FSzZVeRchfFd9HM+CLmseLZRLQb9FEYsC46fzf3vj
         a1FjQGON9OAwzvh+RfB/Ddq1rliFnHd4W6FyFxA6Z2xnaR3NU2Qqwt/KhZvx1T6N3x5X
         OZVw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Rf5VVznadFVpOe/yWh6wXJ6obwMZAA+l/AssWtrkIdXnJREBjMntdGTm1hm/hZbEb2Ead96Wqu+AdJAB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7j0aHBanE9gYiD7R7yIVcKCTISBd4ivU0/lU8ninYUml0pZG+
	EBn9yqOPFccLw11dHbL9fBagW/jSuWuvrK3a0rCHFFVe6oVSUw3nOTpYNibcmBSrAx4utjXGLri
	2XYMvsLoXwXvxT5FndtTsgSNsyH64m0fsPm6xmMC2DE5Nx5WHUvArNpU//AehLovlvQh3
X-Gm-Gg: ASbGncsZwzCWdMrDybWvNSRKfPs1bYMn/PYSbZ96IAkUwsJ2g7TtoR2qIS+C0fCwx4Q
	q9KRuoWQdaALbWjfGCBN76dieKqUxytCCZUnu69L89rzhVLCuLvKUE+/W0CcI28E/Wh3JLBqfMG
	mUWzPMDU9ujMEkJVPAOqUpv/c/Upf4lPrFcp7ECyBCGYm1LOY8XB7HLv56LdDlY4VBiGRgs4kA3
	xFUQYSltsoT3zlg0qx6fZpoMFIHnqnaAuiqOlgUz3JF73Gfz3Of4nueXmSqlGMMw1a3XGTnCuxC
	lQoMDRl0ELK93TD3BA4vLhf1qpwA5bXln629j9IF/SU5o+wIPO3ub1L2avdsYQOuvO6plCixf9M
	bKaTVAB/riB2kBalryKwNJg==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr81429401cf.6.1757409131406;
        Tue, 09 Sep 2025 02:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT8WcnSygf6bNTgYYy0/PkzY2w1a4gXks9/FKqoCWfWHg07YtEpBTM6SSkzd5fxyaeTOsD6w==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b5f847af12mr81429211cf.6.1757409130769;
        Tue, 09 Sep 2025 02:12:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b047373afcesm1359797266b.57.2025.09.09.02.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:12:10 -0700 (PDT)
Message-ID: <25df0f78-68a0-4459-a5a1-eb035b0a5395@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
 <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bfef6c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bBjZtXtOduL1R7AEkPMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WXQL1b3KGwC6deWg2k4Je4l-JoKIwmTp
X-Proofpoint-ORIG-GUID: WXQL1b3KGwC6deWg2k4Je4l-JoKIwmTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXyQuitgqiG57X
 nqcjD8V/RJubAhwrQ1dwX3fG5SyeSmTRz1UPbU4TQIv91F6SQe++8tuVod31k03qu2ycPplrNDY
 ATup0jsDy6gX/Uy9uWn4mihYunMYGf05b831bEYFMA2N2e2inN8h/O/niMUFxEkIy2mWJSKc9na
 Vrig4LTDLH6Dn9Dw8IIgEyfpGEIbzMWkruzEa09rnx40nmANCTBsTO1QewleMaTmQidOsyCGu0O
 OhBpA7IFaGqcPo96WzAOaY2h7Yrw7lMMKACLXowSX5zVuRNmQRNxjOFXdtwj36z0b33ARuSheNO
 hclx984dJwgJNQNEFBF/sAtT1JbLheWl8hLAOwMaIbiH9C3cT+ZzjgVPaHPOsuF8fJw+gCTWdKF
 IwUpdqZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On 9/8/25 9:39 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

None of my comments on v4 were addressed (we agreed to drop the
GMU MMIO range one but others still stand)

https://lore.kernel.org/all/f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com/

Konrad

