Return-Path: <linux-arm-msm+bounces-84506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC0CA938B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97DD530657AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB57225775;
	Fri,  5 Dec 2025 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc7ZDwTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZCMJ1DI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD5272E6A
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965584; cv=none; b=IVaEvQzSk3AkdQdtpFn+8QONhtHxxWBYWSHfAUlYW/FQVg3nHtOqh4qP8S36m7c0GjfPFhdoTGgVld6C9snJ+08aryE+CJDsdnfryO/HxXbVTK3/3AottwLkLRUrfYMb2HzOkkNuYvnqL2FTGlGen+9+d1smGItXzSwLq+l/c7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965584; c=relaxed/simple;
	bh=A6EnYJkhX8nuI1lsCeEHAnR4iji7JVgc1TkD816cBz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCruRbeynZpYO5fhobQ0545Zhk3EbA+OAgw58/mYUDHMfUulLl7olPJ0neytO77ikzJP6aa3lQUfDVBth+B2S1pyumdfs90W2v/LMSA6bgJnC5yuPRLwop+/F9oT5MXBIbtQZedQS/fQ71YC72al7Lywovr1AOKb1ovbZHGhxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc7ZDwTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZCMJ1DI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBKOt151289
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=17Up5+gBu+ip9HZgRMjr/+hJ
	pm6AotMUUkY5/MMs2v4=; b=Lc7ZDwTABPb66mll172FgEqwHBfsc15B9UyR/Zs+
	byPjez7k+a8coEamMvjbqMHekbtdCfYazvQoVp3INnllNd0CVqtswHZkOva3HKXj
	3nmuC1fZrxoaVVXc1JrJsS5jvX1qb70v1zR9HfuxpC+FaZvpwl3bvpjKhQasmvtA
	CNN9jnjm0fsQnjKY2SDUFw8PO+9GyDyalhNYZ6JANBLxQWt90fOG2x0pFt25Wexb
	wV/e8c7oBMBGqHbLkPR4I2QEZoWojv5V1lK6czvst/KuYSJwX5Gq8WheoRd6GEp/
	B3TvyufQNHV3EY/4R+4FAuSTDHd59UH4hbvMYRt/L38q7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auknfb8r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:12:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b55a033a2aso641517485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764965574; x=1765570374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17Up5+gBu+ip9HZgRMjr/+hJpm6AotMUUkY5/MMs2v4=;
        b=VZCMJ1DIUBVSgDmt6G5P/Fi63HEbd7UTa00NSsBJ2HWnm7syC3yfWyFHzv+iD6Yjfg
         OKwmJUyz2NHgWKQSWVG0g5gOVhEneG3nRhVLrhD2SIxqMe9nbrY9FM0VCDjHt8ZOkZtZ
         W9ytjNcWMxzxBNfxE+wwAx00qndWcifXVHV7w+XOMu6bK9v4OsKCrD11K+zDE77AKF3U
         4Lpa0HrCEYZWOq/2x0x5zUWgY/NGnestG555T51VZAYplvcSL1OCb/g5IoQAkANMEcqM
         2kOdlRaM0lFGONPupIKK1/CUtyABqOCnkAmi06YLoMmu2Zs/ZPtfToJWQfVXypaNOZDC
         ZIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764965574; x=1765570374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17Up5+gBu+ip9HZgRMjr/+hJpm6AotMUUkY5/MMs2v4=;
        b=pVXRAGznFXTKX0VRtObwMKyuV96/58Zl1F6ML+kSdBMto+NR+fJUirxD9/PLGiII9a
         7vZJj6zgNQYzXFDieH80vQ6Iugem9JrC15z2K5XtQfuzfBDJjMG6gIhJudmyK2MWzkn6
         UEoBYxtdB8E30oV0RUOBkwggKM2ytMPYidD2M1ljKrgo2DC7P+jGv52WuUfsrtW9CY0X
         +xWpCrYn4zY+sGwb/eraF0sw+dWJh9NEzDRYXODrGS4w5vICRbs1W71HY2dRh/B5Jw1N
         z5dA/BzMk9QvFhijq2HPV+KwCEIAaA2eE2XpXumS33NP2z9SU7Pb3bKwz1Z30srKpUVp
         rJVA==
X-Forwarded-Encrypted: i=1; AJvYcCWCyv5NTAcmx3kYeIqch6ylUVXZ66ot8oxLlT/x0vogAL/B3o8pCrvkGhDryqAfiVs7OQp1sPP6h8pmD5Tb@vger.kernel.org
X-Gm-Message-State: AOJu0YwwB2qSpEbFEOaErFruqXId3YXMLy9Sc8+MFPnWhX30lTNV3aMI
	Pz89eMfv1xMvijq113BpT002HVGbPTwK3rMzgqDI2JW9pXHAlOWW8O4JcxLnvXNnrpCKwJLyRCN
	tkgbvMZBFuXAWtau5WoPG5N9giSuDV7rt4KyRAFDzav+lAoqxtOs4p7NgFePn259tMp/F
X-Gm-Gg: ASbGncveEssjPUrre5SuYbHeERzLlZQHVZQfHyATz5nYUKnkIPz57AJfm/u5PoG2QWD
	4Vng1TLmSuu7veSEA9Z5vdBAxlXfqjNYWtMTFiWXND/CV4wOCYgf1RK6oJi4gO6rQzgqi9zVn4x
	uJ4BCrHqbgkcPWYOTWOZjoXm4LUIGKSx609Eeycp9KYpjYrcCJUjdEiXrtgzeEPqxyPl19oFLo5
	Q/hTOKuZmk20toT5Dt39VcUld2Qo1TB74n5SuN/+Lzx/KyBV6/9fU2B1z/3FrZ2aJ6F14jOTGGX
	MEuRJ0VpPtsCzXaK5nlizvAzVVtUn6hh5dyELOJdwZnJo87ya2tgpJ+AKDMMJ7zNd7bIDv/BSD8
	/ztwBX+2X8uuGFhanWPZzeQ/ycKd4uR+orG2QTP2zcyyeEaqrJfFjTZgzGeUGqW/CXFM2bFuwqp
	bYbd9wiEEvrsJ2/FOb740uess=
X-Received: by 2002:a05:620a:2886:b0:8b2:e669:9888 with SMTP id af79cd13be357-8b6136ee6bamr1280803685a.3.1764965574177;
        Fri, 05 Dec 2025 12:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0nyTLqLB2IE3HGJP8umJGrmHXxIDwSj7rjtYEq0kRKK4R6fl+l0h3DgMUGz5HpK964IXw6g==
X-Received: by 2002:a05:620a:2886:b0:8b2:e669:9888 with SMTP id af79cd13be357-8b6136ee6bamr1280798185a.3.1764965573673;
        Fri, 05 Dec 2025 12:12:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e706064a7sm17570821fa.39.2025.12.05.12.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:12:52 -0800 (PST)
Date: Fri, 5 Dec 2025 22:12:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qusb2: Fix NULL pointer dereference on early
 suspend
Message-ID: <iua4oe52yb7xw4jtdg2n6bsi7m2aqdjcb2qsk6lrxrf57yeuxd@mseysn3kwuck>
References: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1MCBTYWx0ZWRfX+guAFM2vsSdd
 IRIxjzuCdKcSOy8tcY5iNZc6MruGQCQuLrKOFYZHCJ+Z9Xzq9sywAYfCLdMjgRwCIZncfbjS7nv
 z/iiWRI+pzlsLWrdVRrrDK1rslB2uZXqzmY3YlwPtFXPvK/CKHpto8daZjUa+fl+Fwq4OFr5sJz
 hGCoCobmIbTv0Uio2qobyXFSHqzLqI7Pwx65+nZ4X37oEbjjG4EOM1L5GDJDakPJNQLNfJu6o1e
 l25ETFDUZGa2q4qOmjnONBW7defm4Pb5xJmg77cbVcZKbjeAbujv2YBGdDfWlRHGpZEQdXEMJQP
 bFy62b5AmEhSFvfaRu9eV8KYv6+fq2mMhvkxlO6HypHbYVT1tPSCeYjJLxI5uhumRuAyb4UqfMD
 GshNbswViUEq1Rlh3lloFFOFWnXlJQ==
X-Authority-Analysis: v=2.4 cv=P/Y3RyAu c=1 sm=1 tr=0 ts=69333cc7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=hUq6kyv-PA6msqUrbqQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: rGp6VGSvUgbiF01QhJFIGOgI4kH08Dty
X-Proofpoint-ORIG-GUID: rGp6VGSvUgbiF01QhJFIGOgI4kH08Dty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050150

On Fri, Dec 05, 2025 at 05:04:37PM +0100, Loic Poulain wrote:
> Reorder runtime PM setup to ensure pm_runtime_forbid() is applied before
> enabling runtime PM. This avoids possible early autosuspend and prevents
> qusb2_phy_runtime_suspend() from being called before driver data is
> initialized, which could otherwise lead to a NULL pointer dereference:
> 
> ```
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> [...]
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> Workqueue: pm pm_runtime_work
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> lr : pm_generic_runtime_suspend+0x2c/0x44
> [...]
> ```
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index b5514a32ff8f..97bc3755a390 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -1093,13 +1093,14 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>  		or->hsdisc_trim.override = true;
>  	}
>  
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> +
>  	/*
> -	 * Prevent runtime pm from being ON by default. Users can enable
> -	 * it using power/control in sysfs.
> +	 * Enable runtime PM support, but forbid it by default.
> +	 * Users can allow it again via the power/control attribute in sysfs.
>  	 */
> +	pm_runtime_set_active(dev);
>  	pm_runtime_forbid(dev);
> +	pm_runtime_enable(dev);

I'd like to point out that the pm_runtime_enable() here isn't followed
up by the pm_runtime_disable() in the remove path (there is none). Would
you mind sending a followup, changing it to use
devm_pm_runtime_enable()?


For the patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  
>  	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
>  	if (IS_ERR(generic_phy)) {
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

