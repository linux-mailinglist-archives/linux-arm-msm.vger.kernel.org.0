Return-Path: <linux-arm-msm+bounces-61340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124ACADA4E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 02:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A565516CA59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 00:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD91072612;
	Mon, 16 Jun 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jN+xyIuL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E427081E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033272; cv=none; b=orfZNxFu7R5SoYH141SAwyRVGngJFKMibvyXoIh9iiZot26c0ABlsakck24Y0mRVpzPgC+o/CHs6bgD0ns7SdSk+L5HJL3BpHcmAda19qnNBS/mi2GcefpJmBSnC3Wm9nRSGhGAZxUQtI9qDD73zeLQJfBADCwtOmJKQ8hbg9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033272; c=relaxed/simple;
	bh=l+Sko6t7/6/IEYppf3ZaJVyiV6kFwfeL5oNRXSRXULw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI3mQCoSjThQw7y9rdTFPedwYz3+Ik40JKQ8+96Yn1/ni7yc6PwqrJRvk5pdybaP8/07v5d50aAWoUw2UvFv9xEz4P0Xl1S86qnsWJk1OYBrl2wnQYXJA8Jwlr3wfJAHxpBU/dR8Dq2CY+EXiwq3lECD97biyOpcYwdiC5ilhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jN+xyIuL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FLTsJA020826
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yn5zET/nVqjHf3G0UXft39HF
	DTFNHFCZL9S9Mm8zd0A=; b=jN+xyIuLdRWyT1wdAol90tVtJFIBDSKY40YTHl8K
	FpvJKlU4u53urWLAW++pR/t/8LGJDiQeLiJ4GKMwb97cMZJdjaSwuIfsrasys3Eu
	BsOMqDPReNIWvsIk+aw+hiOAR8H37MCPSrVTk95oZcT7/zF58I+CnURC7Hm8xUs8
	/IXJCijjC/qAxLAPRmc+oavSaEHsnCb/Wn762x/0AZKS0KDc7qf69voDLrnlR+6W
	yKxcBZT8Dk/Y8ltBJsjaaLnCmFo2mxQqy6hlX39mxVeDS9Sdk8U6Yc3Go03RyLxN
	8wpofvuw1Mfhj4R+F0ubW/BjOZbuDFCDyX8rQXGsEz9TXQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h92jv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 00:21:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb50d92061so9946116d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jun 2025 17:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033262; x=1750638062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn5zET/nVqjHf3G0UXft39HFDTFNHFCZL9S9Mm8zd0A=;
        b=bXGL/lyMxCBSgV0y486YmgW97ymtmGyW6s74ZBrB4C0JEQmzGa7vP52th9scIokh8T
         NBcLf/jaOZhpd0clBuuIIvFpJSVj8yqaEp5unJcrDISh6coM+rbxbbSpsoePkvFMi0DM
         7DPGvG4vVZXu+0cErFzNxXMEzeptOE9Ag72kUkJxEsFtPZh/dDPD6kW/oykLgox7pdQW
         YrdQb6a21yKOO/UuT4QZp/ib6hStOKnnGLvdaSGZkyA/ne3rpcdWizoK+H5L1CWAfUXA
         WeLJOA1TIx3E/WNnFc9xInNavd3OlVBaqR0Ss+rJDNYEOb4aErUewVFBh0FLCXQ+Zsdg
         F03A==
X-Forwarded-Encrypted: i=1; AJvYcCWygofVuoAhMdMFRcmJ2ormU7tYHiUm0+kDlWtsxZQwV7uLAKZo0QEenhGe/m2mh4uKR/WFlbz7ld+/ZXQn@vger.kernel.org
X-Gm-Message-State: AOJu0YzK1pjAhVVawGSw7gZqDFr94aZiUSVTLgF5eEtrOAtmvgU31MsZ
	bZndWZq5teqf2doVtJZRhQL9yi612Dqq821FoQGfex008BIOBSNNHEa63zrojNA1cwcUgBzlq+7
	4L7fbCNza3ACWfoRkPg/GNu9GTnBkNZs5hiUw+RWayXi01E0s6m50vySZzRYaPOai6x1k
X-Gm-Gg: ASbGncu+a7C1tOxFREtT1f8l/E8atDsrrEFTBdJzNWFhxHwwm4O20xPGYXOQb3ZmN0X
	N3erSYX+ufrKmA2mrrH8hDh9TT5edJY5AhhId9XrcGdm3RVcf6a6FFcmupZvDemM0yBejzKbjEF
	npknlc7CswQfHUGFmQYdnZOlY36H9XIcrOl2tX3/o5wwELfVYcrYU5u8eBW3ggqveIeV129pHGk
	4kx+IObuKyOPs3JtUQfNaSf1srYKsV9u1fqSu7MBKB1ROb1mUY8/x7ME/vPFftmT5UgtiTyjYez
	xn/xaVd22BFRgArQ1s4pplHeF55okAg05UqWkFGexllRz5aTkmWkZRuWAU25o0G17Htl90r2on5
	v9vaPQwS1tD/XdR7JkCA3jEPMeIVrRDs4R7E=
X-Received: by 2002:a05:6214:2b0e:b0:6fa:f94e:6e69 with SMTP id 6a1803df08f44-6fb47725f2cmr126097606d6.9.1750033261903;
        Sun, 15 Jun 2025 17:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjm2yOoYBnfFuKFuUHTJcSuDR7kiUIrX3sPjUJtJBygXJXa2SZAkdU87ee3Y8xnyvwbhTsQ==
X-Received: by 2002:a05:6214:2b0e:b0:6fa:f94e:6e69 with SMTP id 6a1803df08f44-6fb47725f2cmr126097336d6.9.1750033261489;
        Sun, 15 Jun 2025 17:21:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b4e88a72csm6764361fa.64.2025.06.15.17.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:20:59 -0700 (PDT)
Date: Mon, 16 Jun 2025 03:20:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 2/3] soc: qcom: qcom_stats: Add QMP support for
 syncing ddr stats
Message-ID: <2lfuaki4avexx5yphx7zaaw5e72wfro2buyddkjauc2fdc5gvl@ne65atmiotnx>
References: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
 <20250611-ddr_stats_-v5-2-24b16dd67c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-ddr_stats_-v5-2-24b16dd67c9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: H8ucibzzLnnPTN47YAhUztD2F-zyWe6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMCBTYWx0ZWRfX9LJlPYnYCoak
 Dd9c+aJVn00eOlEAJi8TS5gPre3RMF8VjVrVLubIYpmGE2YpjOxp5XaOathJKNQD+Ahz3ojgVJB
 X818p9eyNc0L8PYKSkwVweQT68jdTYZeULNPLczgXZ1gYxIfUz1j2iMBobjXbOth+tqIZ7+xsfe
 DIHvo1ZzY644yUwM91A5nvvG5L/O7K5h43B9wMH6hlQ2PB0rB5E92JaQsFy6MheAWtKJMnHa4Gx
 XsZMyi3z98aKw7NUus9OdeKb75PT9sHFpbp6c7R9cprd0FjoxQS6F+Omrl1ZC49Ew1JWG66Ithi
 bgsP/IgmvF2Kw8k3eYbrwANWCRAnzE8oPqN2RB9FmO8oigNG1dD/WoGER2vJ3igqfNyyslQx66Z
 b3uBVrU7fB2tOOnhF7kcqPif1b4v93NsTum3KjjMTXYAKazpe6AVElEpfpLpIp0tlVNTT84U
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684f636e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zPEmSsMKRztXHp1w78QA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: H8ucibzzLnnPTN47YAhUztD2F-zyWe6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=956
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160000

On Wed, Jun 11, 2025 at 11:33:46AM +0530, Maulik Shah wrote:
> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
> ddr stats. The duration field of ddr stats will get populated only if QMP
> command is sent.
> 
> Add support to send ddr stats freqsync QMP command.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

