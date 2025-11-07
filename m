Return-Path: <linux-arm-msm+bounces-80688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A649C3E55B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC23A3AD87C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFFA2F1FE2;
	Fri,  7 Nov 2025 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn/g3237";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4nYr1gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFB2C375A
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485598; cv=none; b=Uqct37UnFCGMhhBv9yzHFeHye3SqS+fsfLTjbUKX2ZT1+CHGXOe9LShETe9kno3ajlNcLYxsa2DAB2fiM97w9VXsG30BBXhq9pn90JoTkGpqu1HrM83OiDBpKJym+ZRDW7TqgwRP7wMrrO5bWkkv0GWKua+sfjv9l2ktf3zXHjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485598; c=relaxed/simple;
	bh=c8A14Q/V8GEKQyw/Jggt3KvMMi70EOyHMLOV1fzSV98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gihq64YIhIRAs8SFbDhs+uQ8uKaEZO3SNRKMRgr5QV0Cqu/DV+Sj2FSNLW/qqT/gAuM6KwY6lUHPK0USjoSjMqruKieTs4pat13PYv9DFSAOZehF3I/q6rDfiNZKilHrN9Hp0J/ffgBMTPVYw7IQTzgiiT5H3DG+AX0RLoGi/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn/g3237; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4nYr1gw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Mhghl4131373
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 03:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M80K1COQSKSOsbnYlBiyMzUX
	hbNJGsXiIzf10YFAobU=; b=bn/g3237YhT6RGT/NZXYeOvYm5A3Ef/qBwofC4bb
	ob4Dv/kHYUnPlqmL0Xa1UDS8viZtBnAjyxyHlhbUdzUrYXhO4WGipDF/pR9Akiue
	+PhN6YduFkOcBVFaCl6P/j44ij1qjqOtDIzTtkiR8ARG9UJNrLVau/QwrO4d3Sev
	d5IEuMtiyWEz8BgDIp+/J9i7vls7cUmINJhhat1FNXPnBah8jPCaEUfWi7aXBjKK
	Wb7W4dNnoH3GQCxQF56O02fdue9GWMkmlqu6Ild63nraYcyvLYV/K3nzCadQ0xjj
	RhXXNa2/vwQChQFVbvEhClT+oiAhzPsfv+bBb2rK7oOBLw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x2hus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:19:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so9151351cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 19:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485595; x=1763090395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=H4nYr1gw8UP/zYarOxiyoDwoDw/ke/mQw8y3zSzCFLystxSDWPj0GSrCUi4veXh08/
         Kb/tZKPLMYZhFiaT2nQmWLzespdO2omch3XGx1aws1WNnKs2lm5+uEQXiPUzsTCNPG6M
         dVVLYQMpM0BqPLObxTPRI+h6PFCHkVg+yiIZAr5tLoRONPzi5j5ctxWTobisoThnJlHZ
         Mx2mZKJwy63WyjRHgR4kV60FsG+ZIFwoEl0NPfrBGNI42/E8DjHmWvwLGsTAXfM6muSm
         QVvZDic8dZOYA0iJ8oIte0PFHDrRVlDy9Fw1Yb9WdqHx5dbZ6qCiXTP6pM+yJZ4rZIUt
         fPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485595; x=1763090395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M80K1COQSKSOsbnYlBiyMzUXhbNJGsXiIzf10YFAobU=;
        b=uug4Kw8wJZ9y+oLn6wqhHE5ERU9+R7BV159GACdffPnnRsnaJJkCEMRb+pPPWXmeEw
         xzh5GJ5ooBy4Sd1rQJfPeUuXysCSJzeIP6qcCg/2pOa8BkZ2EkfKHoU5IHMKpjU3iRuB
         uFZwXw7rZbgBeNhSdFl+ZfJDF1Iu2oOZCJ+TgEj7mcMCG+2ctJ6yeGmnqARztP+k+bSG
         bNTQQXJ5ZuKJfTqDMfCUxG7HWO+PT3+m3pDlXw/DAJMLsh/Lfqz1rPXQdYSvhbK8f6bC
         roWWL5Ebng4ArCUrZ2wo/GMKER2SFepxAqvqSwW9SyFTLfvWAqg0At/71wlyS9GWay6m
         3dFg==
X-Forwarded-Encrypted: i=1; AJvYcCX4oACHgBZA/htztW85vmbbioRUSBjJ7yFE9pGirKdZCbocDdM/mXS+mm6O2DMrPaZt2Mz/CUWG2fK7Qf70@vger.kernel.org
X-Gm-Message-State: AOJu0YwUeeLs4z9h5TRtBZQ6Tx65Pq3y1O4a8ag0hR8f/M/bmqzbNDki
	XP0Sfv1zf/Fuixj07lnW6j6j9E7TvOdJV6x4JKZMRSYLogayo91aOsSfa5iy/bufWFqCwuJDA5u
	2Vpyi3xsmGqpKF92PQk9ObDZMeWFq0uXWclVddIAq3jRes3tg1Y6KSvwf/o01Ppi69X5j
X-Gm-Gg: ASbGncu+ajy18US0WFa9RkWEVRtLmIHrGn71bZzwJcIKHOQ0N/1jsBJUE9SnEOGjBn9
	dE7N9fVubnIBJvDrU0Gn4HzJB09L2z3YsQGlyiLTirjdx1md/1RyBy6YDy4H7z0y8nt/YxHzBRG
	SAy3xCpPMMY9pAmfMlazkqqAdu4DOaTwkBV5Z2NvjvRRIq4epY5SdbSTnYgyIQ2zofAKh4HFZrn
	yBThycuv1WR+GC3XXHU3YUGKMw2JiTBW0SOZl973yVayPFTHz5SUCFnZm0S/VG1OMyNl7AyZEzd
	OHKWHSg6w1YvMIyZQfJOfRSJoBMqmBVPllyM3ZIH1a8nkirWV/0tZmNN5hmB05N3K6367gMCVlQ
	UvAgyvjqfOKTt09jZbUtIMEGPQFNKbxt+q5IG0H5RFYw/AgDy4+7hah4RrCEanOHmTIhjKQUBjX
	ICM2PJqZh14rkM
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772811cf.50.1762485594830;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4pxfXAI2QN5tx3rdS8w62pU9piMwAcGPSHdAchfcF87faMpVG/a4sNiNd3ZJ914ce0ITvXw==
X-Received: by 2002:a05:622a:199e:b0:4b7:8d1c:1be2 with SMTP id d75a77b69052e-4ed94a67750mr18772491cf.50.1762485594416;
        Thu, 06 Nov 2025 19:19:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a593af0sm1136865e87.96.2025.11.06.19.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:52 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 12/13] soc: qcom: ubwc: Simplify with
 of_machine_get_match_data()
Message-ID: <zdnlmxrlagpmwcfnzka7zgmrxzya564cjbd56l22fazxxhqpjw@64zf3akyfp4h>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-12-d780ea1780c2@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfX7ouVGI75WIGJ
 NgXUimpEuh1RiYOX+VdbkSBaSgr/Rjmu8k2fb/zaV4LZ+tE8Q1o91vXnvlMAZ71Un9iF+LHlD8k
 6jbHoDdXoHWeyFMeAF9hJmFxzAU4ttV0roBYcOcHu+VC6reET/XJfPAHT2JBBrMyiD7EWj7I5jJ
 zMJgh0j2/aR1g/gH+ihGEqK2mCxcwRaaThzfGxYJ/uijZSWoRH4FPsESTmA4IGgSyEc/J1LG5fa
 7zT7MG5ztkRr/1q213cQUUG2QP3Bh+kr85tns2Lhyl1u1BYQK9zCYLAtxPPszT6HpKT5c2QcJI6
 YGAYPBoiCI1gDs+LOl7cCLgNrHxtHt9Z/K8y/NReP84ZtWtrI8sOr3fnEI16ltFQFX74U2IhpUM
 CwarGv1yvbYpDvJqgJexXENVJAoJpQ==
X-Proofpoint-ORIG-GUID: v8FBcm05sEJfWxF48suvegGYIwoCvp8N
X-Proofpoint-GUID: v8FBcm05sEJfWxF48suvegGYIwoCvp8N
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690d655b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=228_68lKBFQWPJCgatoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070024

On Thu, Nov 06, 2025 at 08:07:19PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/ubwc_config.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

