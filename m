Return-Path: <linux-arm-msm+bounces-76694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A32BC9968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D6173B2DDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADEE2EACF6;
	Thu,  9 Oct 2025 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSnJCb/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CC2246774
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020932; cv=none; b=iOhnXjMiTN8+TQVUD3u5l2ez/xcbQ33UTwTGZ1LfH7F2tio386f0v5FQ6+zc8TFuiL02O6nGdVEp2jquLPC5MrGH/WLapxmJoVTPY9hu93J3heeXSs1dM58tdQg/CUq//Fr079lQ5RTKN0frs2py/XH+nLp7wuHc1wlyl5GxjJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020932; c=relaxed/simple;
	bh=QZx4nVpAC3vRxTaSdKPSim4kZsjFCKfjifLXoOWygnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3bJRxEBTxK3u97VO9rV0jFwCa7pViYoK4bHmU6zctCeq2OuWdrXoODSBOH8NUIvDw8FKzzzyQXzJL+veFKPIdNO6vPc4ZetA3hh4z2y1+9IC7iXaPyv9CxgJpSuBNhOHSn7TjOWW0WjI5YC0y02oYaLpTjXnIyxSmqUo7svFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSnJCb/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EQrul028491
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJVTkHydqKBrCSgwLkXUZtm0
	Z8WJjCWEqwuofJXX3rc=; b=pSnJCb/8DG/0imYlcFsnOQfpkVy0tPFrexiM27Es
	VwcAVfuKZcsW28YbjfY3vQeTC+4jNhfUITg0FTmcYCSN2jPbp8EkUf/UpIsf/ccf
	JaA30ZkS9Hajd8P9dDBfeuYv73sNe899yjgqxFijOnC+vcTVTdUv2MgD/6TFH5Qv
	XcmEez6z88xhOlvKhsgbzDNb3FAZoXYiz0aiVrc3oZomrpWgSl64UbaCyck92DLn
	O4PzzeBfDuXWu/Af+lU+FunV40heM5uZHW7lUM4t8aP0XD8yfuzo7/T4CjBwsXI2
	i1kvBccJ9G9JpM+/n4z8dBywPjLlRUknlSEpi5iLG1+Veg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku78b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:42:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e574e01ed8so33502321cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020929; x=1760625729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJVTkHydqKBrCSgwLkXUZtm0Z8WJjCWEqwuofJXX3rc=;
        b=DPCUbY+As2aB2lpu1u/fUG14JWSAif/WEHjJqPMZIij4TBCesqa9gq1PE+PTdSojuW
         w4b/i1z2aJs3lEhiMSZuYJFcoa8/sSUZogquQXPE8boxxEZrVTBBGdBtVd/3rA/OFrXq
         fQ95167HPRtILdkYTsLU0r+Z41m2ly5hqA2skILsF7Sw5ci/KM7kf/Lb1kZEbLMKEJ/x
         nrhz92Ibh/8k0iFgT5TIxm7appi9J6Vsi0QwLOgIt+RR76Xtmx8XHyUDYC61YwNKk1vk
         j3W2sKPnLBqOSZoPKkXCiN80Z41EMHprpx+JbvLh9M5Osp0lkXirjoBAAdFYg9DAoRph
         R+zg==
X-Forwarded-Encrypted: i=1; AJvYcCXBSv4lFwqkIgotu8J86reyp6SEOSi0R+RRaKqjopzdwncTuL0HTBe4Za6A+X0WP32xrioxfPGbUhf2xvdw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vSovP7Eg89Qru6dZ8Br9bKqXf8cBoErxgA7nVfLegrwmmRxH
	mjZW2UfCzmHHZHbIOFMBr4Jkh31hZkZVpjOGBv1ZGBXtZcXHk6zkrfU8L7zjaDE+iWScC0fCwX3
	cwqk2JR2ccM8mKzIyz1k0/E+kjHzNWYbW8/3RB8is9MW28hzRn0q0eRDVkQvLMp9K4qS5
X-Gm-Gg: ASbGncsb7XvgLAI6d6r8mUI/ULuN5Xa35IaSmEd1gKAiD5ZnyDNb5qhH+hPkGjinIDp
	/gbweZTdRbalSjcJE+dRnqHlLwEuwpg2M6rg4NKw6qskV6T0aCV+rZ6Fmhu8vDOv5cuQgl164W3
	9j2Or2yGBjs5AVn39/L16U5EjSvLO/oOh/WSkvKzMBaxuc199kB24D2ZRovF1Mh9uYs4pjawPnK
	/trH4RcJu8WmMdDVdUtgtlkX8PZFSYWx30hGHjeMDqvLxwkg5ht4yBCq91GEVjByaa5+NwNU/Ys
	gB+ZxOJRsi8W+/n+9VlXl/+DUL3m67UamQLpl5ZHKnacLi8YYA8zMkRfa0Mdm9DVTlIGkxeDrDU
	Pu0gEfMCg1RgV8+DgGPea2Psg1GJgfuNYaG4vtvMxVvaRGxSpgPCebi1jgg==
X-Received: by 2002:ac8:5d53:0:b0:4db:347d:edb3 with SMTP id d75a77b69052e-4e6ead712c7mr91268551cf.80.1760020928721;
        Thu, 09 Oct 2025 07:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNa4QnjcuKYB3jwjG7GLdf7ymSiMVsjch3Pok5PTchB2g1Op9BuA64It2GGfI8BAkwpNNtAQ==
X-Received: by 2002:ac8:5d53:0:b0:4db:347d:edb3 with SMTP id d75a77b69052e-4e6ead712c7mr91268131cf.80.1760020928280;
        Thu, 09 Oct 2025 07:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ad9e55esm1097574e87.78.2025.10.09.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:42:07 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:42:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
Message-ID: <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6JQBJW6pjCoi
 FJgOW/hQC9JmugS+FZvyop8TIxf6m+4euxgjQEI+VB+EwkmIk1qwxHGptUamzJ827mn55di4IIb
 RTkYjUaGzB+U+hXCETR92Yb0oBKEAn8sENZD6uQxuhA//nm4FXtG2Iu/pTnzw5vOBYBK+Ftys1j
 +jJkcHqWc7bREKtbBylF6nsxBWWytRYNCPulfg5KyaKQaYkHTWjLqqmYw8c8kXh3Gm7afQj8J3E
 kZtvtArwJzcJnAwwLNrip8cYfwT804jMbLvXaYxpvEeSJX/XNx4rM9mPrTzICCx5v8tB/kdbTXj
 fiPpdQ9JnxOw+Apcxch/7QtDBg62q8lJtkFWsZFWRz1b9Re/PLDuxeT2GWNlQm+EiLZZGmL4tSw
 U4/OtNsLd9tcnzn61FkCKgDJDY9muw==
X-Proofpoint-GUID: 3JBsk0rdRDhCF4P9UOAANM72_fa-kgbI
X-Proofpoint-ORIG-GUID: 3JBsk0rdRDhCF4P9UOAANM72_fa-kgbI
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7c9c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=_tRjzsPFGxlTNT5lhXYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:35AM +0200, Luca Weiss wrote:
> From: Luca Weiss <luca@lucaweiss.eu>
> 
> Enable the RGB LED connected to the PM7350C (PM8350C).
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

-- 
With best wishes
Dmitry

