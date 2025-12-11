Return-Path: <linux-arm-msm+bounces-85054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E34DCB6080
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7180D3005E84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EBF3126BF;
	Thu, 11 Dec 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCFzAB96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/x+8VHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE13064B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459821; cv=none; b=usblKlfYGEfPYucZnUfQv+xyd+sZuXPDG5fVYBanioIDlz3stuTbmXsyf4ZpiAV6ZvHGJ8+XBCAK67d8KLilAChvml/flPufIcwc/fonclq4herrRninviANj679RUaSi5Ptf2FBzC8xkeRGcM54bJBAe0ckj1zREzG94Em2+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459821; c=relaxed/simple;
	bh=Fb+wUO3exD6mEl6k5WS2/mc/HEywylJ6qlOWJKk8TYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rm0vReciorRhuAJz05NObwDBoC2qgtNEvKIexWOJj7yhLCY0CnRDLrr1d2bemYEJzvoh3WeaKK0o6w8tPtEfjyoxFwbptJVIR3vL35PT/NosE2F96FxPdj3rsvwxaNHzSBw/6ZcM/z5ezMmPUiYNWobCZRbvuZXJ4ry1bpIFq58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCFzAB96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/x+8VHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXqZM470559
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EO+BUDe6vdph0zzM9WBxo/An
	GjHrkdByqNLFm4MV5Ww=; b=ZCFzAB96/4RAiCpyEqXbHM8WkPaU4A0HzgO8j7F/
	YsutP0EKmUazLZSRpPher3XrYHC2ZRE/sMT67fbLPTEiaVSLvqg/h8c+JimpDX5L
	M0/qvAQ1xnMVa8/GKXPr0nj2EtZG4e4kEeU1pEkpbUdiJXVKbJTLsNfRCOSJKc+5
	EsZvdFbI2lgKUGbumX0D9la5eQHuMBc2fdq4yL0Yal2XfHZ3vTEObB0jToLZJzvO
	5qrsRw0F7ufE2RNg8Zj9+Mgj+WyRPGzMQqwD7HQGCUL4xs4Tj7aFV4kPOBrVE6EA
	TaW+Q7MclLXJExhYkUGdirSfW1NtuLrMQegrvnLXnfRv6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvsu77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 13:30:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso2169131cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 05:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765459818; x=1766064618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EO+BUDe6vdph0zzM9WBxo/AnGjHrkdByqNLFm4MV5Ww=;
        b=b/x+8VHlxm0ZIzDORVLp32Fictpo0tv1Z91jID5zXmFI5/dTHvH8oEn9aVdGgpvX2g
         Z+8GvN7MB3iPwh8Bpx0B08Z93RHL3eYbvh+xZtkWj6BrsylJIOqm2bNqrnqQqTQsXFSi
         XYQ0SyEy0hwExAJGttnDDvgeeegiJmRiEyzNyzPKW503a3BDrzgDe1QAySfufgv+xJaN
         Z7LdE5Yz3Dbu82sLzt0B7i8zEmpPGiWWW7WHbbFRHdudY2ULsEdWW6APzft84ZlPZCzG
         BGv7szBZaAVEjMAN9H5nsAXAYjsUqdWeZgIovtOvwK+jQArJIXJTq/2uS2PUGhbY5wY1
         7V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459818; x=1766064618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EO+BUDe6vdph0zzM9WBxo/AnGjHrkdByqNLFm4MV5Ww=;
        b=j7M4nAyMb7OY+0y35wBYGTqt5C/DuFE2rwRPZnQFdwa+P6xO0LIT+RI0L99ZaU77uP
         ObdttvX9HA0ezbH0YQzXFzAqJrSiizghUXmWvkgfANk84fkN/+7pngpmkH1WHrDXAQmf
         p4Fm/ITc/pucBMlHfqTeBbWKmGkTxqMYb2DsyiZr/xw3dsHOjxrpFnIHTbr8ppX5ce22
         E8+p/sqzz+s5kd1s3qWR+2UfA0zG1XUPDRzb9A/QsykAaqiaZy1J6mkVI0HQATyuRYaj
         S6NedHl1B9sbr6K67y28bZeSm/NRPH94+WTRRROVCF/b3MDb8SSqI2QpmPVgPY5+FxOu
         7n8g==
X-Forwarded-Encrypted: i=1; AJvYcCVdm9iwjkvCXQk1FvUfFVlCyu0zsD/p62qc95Mn5sjirBffrvG6mrCHXNS+XjPTp8/AHExeZB9j4zcH/4Ec@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYtAlHUHkWmMSb0OgIh/UpwC7P4G6TKT9Nz9RG4DKH0OWpoM6
	9bgZHmSmsv3Eop9KPsE/6sCUtIw0u3ashnSjmYLdtEBh1AOalnGfmdcacOUx/DXcL2iHet2sFdq
	OaGTYNzW1JtA31qqgZtA4iGNZx4wQIf0l7Gb/KMoV2/ZJ+VP551GZaWyN/3FFnJ4i7rJL
X-Gm-Gg: AY/fxX5u8ifAlAs0WTr0HHJvEDdBtU3ZAFC1qmsWj/DtpFsA/VkJtH81zSDlrZ4Xpop
	hwgJ/qY1T5NvkByQfFnqmE/Cl6SQ9ljNA6HO9odAKdL1nLbX9eFfQd4EyuiI4m3vytlkDZhS0w4
	p35njmPplTTb/drYMZvVSyO2fvxEnT2YJzMnjJw18JefnsQWyCVj4eb3U4zwi7x6p23771v8i0a
	KBMA56XkZncVeNhXJSmX8XlreukGUTAjHuaL0F303NJNeIOjnFkpZIcgZ3PhhdJvA/YVZOOr/0H
	24/eTWRMie6NpGjs61YzfTe99KPPR3D8QOXR/4YMSA2MX9JOFpblfvwSB/AbjbBOzZ72buHBFOK
	Jrrb+Mk51ALTomg1x4VpTXlIwp4+lpZjztRO80i6CESLiFJTZ+QOkiMpgiuPCXFnlX+W/Y134Lz
	wWXbrwUosDEQynOBFfpN8JHZo=
X-Received: by 2002:a05:622a:5806:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4f1b1b91046mr76448461cf.80.1765459817531;
        Thu, 11 Dec 2025 05:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAhdhH0nn4P7B440k+djR9sb7ykmSQg3YeqAFNdrpZPHC2OvvdjB/siLR2Kocqqcd4BcKfPg==
X-Received: by 2002:a05:622a:5806:b0:4ee:4709:4c38 with SMTP id d75a77b69052e-4f1b1b91046mr76447771cf.80.1765459817038;
        Thu, 11 Dec 2025 05:30:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa7780sm880650e87.67.2025.12.11.05.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:30:16 -0800 (PST)
Date: Thu, 11 Dec 2025 15:30:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6 4/4] phy: qcom: edp: Add Glymur platform support
Message-ID: <azhdq6zxeiidaijw3cqhhsepyc6gchn4e3gataqrejss3win33@6ntrm3bk5zgp>
References: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
 <20251211-phy-qcom-edp-add-glymur-support-v6-4-5be5b32762b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-phy-qcom-edp-add-glymur-support-v6-4-5be5b32762b5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNSBTYWx0ZWRfX07H9fn1B5Jqh
 OwoM1ztZwdXZi21DXI0vZfo9ml4X32mNi9c+tm+2rKHOJhZaVJpPd78qhiwWe5r7W3W0M4Kqj5Y
 tV1RGFrJJyTGqUjkV+41nY81shtTfHWnFLL7JpZ3JdwaXW9xCLfQx3zcF44eYv2qShQ0Uc396xc
 bT39Rf2xNquL5fzlwMoP7XvlXBNwux+LZE1A7RD7xOgXWZ44Ju7zhIr7jBuLfbRibzkLk3wurJR
 qpK3wAm8ZrFB4jLSQ4Oj08PisMdnXi6Z5E15p2hPBcyvooNEWdOtiIPQvYcj12WDOQDDos8pRpI
 BKzhyr9R1IurL8RmysXUNXa8ygoS5obT9D5fI3nuu/vbQblUTqlTrc2DCpSesvRr2Z4LT2dObrt
 9otiJvZCtFLcRryA3SxINdk+eWBDLg==
X-Proofpoint-GUID: dvAA17Ih7yOSd2qD4p4fFLrddbfBa8Ec
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693ac76a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qj678yAOHSKhnH0m0hsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dvAA17Ih7yOSd2qD4p4fFLrddbfBa8Ec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110105

On Thu, Dec 11, 2025 at 12:17:25PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> The Qualcomm Glymur platform has the new v8 version of the eDP/DP PHY.
> So rework the driver to support this new version and add the platform
> specific configuration data.
> 
> While at it, add the rest of the AUX_CFG reset values for the v4 and v5
> platforms, which makes the handling of the platforms specific array
> cleaner, as they are single sized now.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 227 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 219 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

