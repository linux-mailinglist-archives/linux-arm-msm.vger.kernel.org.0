Return-Path: <linux-arm-msm+bounces-59209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9CAC2154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C195041B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E5D229B15;
	Fri, 23 May 2025 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuB7GT0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B68222596
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997055; cv=none; b=eX1gIvzBXan4RYv3UVjVsS0dZ02dx8FMvXuZHwN30NpSwu/bW9JjCfcYz1wD4KM8leI6wVNoQL0dk/IXkfuCQ7TNHEVYpcdKMFJUG+5n1kDnI3STqhatydXRK4BUa6kPuntgA3XwdTOy/gJ5cUvEv55l0h4lxqfpy4IP7rNmbT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997055; c=relaxed/simple;
	bh=eDGd1A8CdNRMzewrtGp+LQNqJa5uMr8RmO6vabiZtP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIrYFZJyDlPRf5m0PPbnum/BuOLEHz+S33dWPTYO+zTODq5ThJl8m8RaCC45FSZnSQt68sQJB/ZiB6XatgRsqw7tW3ZsisgXWh+5NCmm/SstbY6oLvvtJJJWlevSY839OmRR8n2tcT9DYzykdgsz0TgsjegbBaEX+ldGNO0EGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuB7GT0G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N3Rpv8020602
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0D7e6LvkuMZVb5n+b52vYbIq
	Q+d1bIu9hB6AiSPvDa4=; b=nuB7GT0GhjzJnXndk2Kr4Y/wfFMq0pnQl8xfl4Oa
	zzdnFzprchf2dysPcCjV+IxWykip/ft/3g+FOHoQVHTv3QkG0U6UKWcpWtUoPSNi
	E+RYHwCkVsd6BGJolCfMrBq57ZIcQXEsmQy59+C8AG7TyMg5yDxa//hlCQ/0xyzy
	nmXpMW+xNeY8MDC1QwQcqlHsldIeTx3yXT6ygsC6jlzd67TxpWAp67iA2jQixUen
	Nqrlhd7it590QLFeDFx1TkgSHGwwSkRtz+98Ll2Os2sUnjpkFeQ+JnZIhmqXEGGj
	4dca1vcpYCpXRcSJ/FHi4oHTEUMAKGAYGarADUfyf8/TwA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb8317-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:44:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8cb4b1861so96745816d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 03:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997052; x=1748601852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D7e6LvkuMZVb5n+b52vYbIqQ+d1bIu9hB6AiSPvDa4=;
        b=REdjsgJXa+njEJoG+RZqRqzdWy1p9AyLC1Nc5ecMJVF2db1ZJ6hz/7ErISH7dWp508
         1I6PPbELW1Kvlror/3RiIiBW0jqCzXrU1faCYAXqmeDIJlbhoMTSkHHpJGEUkCjpz2nx
         hgPQ86oIpoYDfJ/HpP3GQUyRwMRzZfpfVqIcRpMCsnFXBJhDLdT0eKltYt1uijDEQ4/0
         Uu7uuhtdnR7qtvVNiDCrdTWlLWJS0TAwY1PSc4s6QoVHHUklyY9xhpHMtVBJDm1vyUcY
         ratOhpl7QqtlQggwsgyuoaiXAt23RQclpiM/UibfUAbK2sYRNufAPHIeMULvsIvNYsnO
         TcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxbs7cLSy3snXyApft+UydpwL2d7fTBJ6mJWIPUYufbIBcEkWPfMeNPj+NwVpE1FPYXxDHzfRKeDld6cvx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzu+JeTzU8v4IgBFVsBWGVbV5Ko8cHqtCnyfXaHp0jXqK1wrnz
	oN3NhXAaafz9Ds0Tx11vqEIl4c/9TK2MHLqPmggrrqDjimBU8TelHTB8bnjXSqF7PG6DvnvAucd
	WskACtggh8BeMhJuuXtptoaIx8ZuCmt1rd68bcRTqlbTNKyiPKJt3RLo/VAZ/T2zHvhrS
X-Gm-Gg: ASbGncsnreGI1Wk4HxbkHwwJUEK6aHobeRFKtT32Hq+LaKea3tp9mpNJOMgAjutkV3b
	1gpbxcij7fZuQA0LbnBzasWwUu5d4mKOsELaBrmrsVDy2UiFnq4FMaPIPotyinodxFWfl08y+QK
	4fLbJlGQ0K3ktjsKzQM0PT5vFOPaWIMhAzQ/BHpOTRhFD4HwCvUsCRzfxGuMYGkvdDIxoBWhEfD
	kiqkTPudXUMJ7a6t44vnwHXD1QeL9R61gujmMVFkXsv9B1PCWepLyJg4NV4m00Fvpl2IT63ZWy1
	gXZtn3wXG7G3/qBxUPKbdazhVhSTtekCIJevIbzooxyC7MIX/M0wYk/wMolyzPGpQxu9UTPrW8A
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr382110876d6.6.1747997051722;
        Fri, 23 May 2025 03:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeS62dzPel9ch9lSgqWKEmbxy/diUVrvetaVUG0ypD79ipE/0sxsqSYTwSLfgB7z3VmBMJgQ==
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr382110556d6.6.1747997051372;
        Fri, 23 May 2025 03:44:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm36493711fa.44.2025.05.23.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:44:10 -0700 (PDT)
Date: Fri, 23 May 2025 13:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: qcom_battmgr: Add lithium-polymer entry
Message-ID: <xwr5xiwbiyl27x3uhe5z2kvyqdkwdp3nnwzcbufr3fgmkqa3gz@oacrb7zk7dyp>
References: <20250523-psy-qcom-battmgr-add-lipo-entry-v1-1-938c20a43a25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-psy-qcom-battmgr-add-lipo-entry-v1-1-938c20a43a25@linaro.org>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=6830517d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rZQgA2wR-xeWlAxma3cA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: R4zCMMF23CTP70CnrcrtRCoY3ALgLi96
X-Proofpoint-GUID: R4zCMMF23CTP70CnrcrtRCoY3ALgLi96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfX4nszuxBtVOK0
 lS9RKpiaqTZootamIsoI/qEiAXsLPOdxDhX+fGc59i+HZFANv3VoHOnLfudkFijp+EnTHqQSiRZ
 0laaUHIrbx50rJXJEtsvYF0pKrEE48E2jNufZ4FsAKIkC6nasWeSayWNCbb1/qWOfdwZMtyfn/h
 dfDrENWly5cW0IwDZeT/3zcjr5e93vfKWbr51PUt+RC8EGbzAmg1AB1FmGCVy/0ELb0SfJetZBW
 bZax6NlQy4SkG68hbwWGwUlUlJ7UH5DMvm3ON8/PW2uyrS8KboXCRfHCCJ9NiJs+PSYaO0g/6BT
 mSc4x43cAU32/TDdwFGvaAIv84V4gCfhnRjFXwmE/8MWv61RqCx1XqI4n9i8hHqvLXOxkPELhGB
 sYY9PT7DBSlcHv6lThsey73m2aRvPg8uUHAuopIcDRynkoB6SQnnCeIdHXX52WzP7S1T/qSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230095

On Fri, May 23, 2025 at 01:14:22PM +0300, Abel Vesa wrote:
> On some Dell XPS 13 (9345) variants, the battery used is lithium-polymer
> based. Currently, this is reported as unknown technology due to the entry
> missing.
> 
> [ 4083.135325] Unknown battery technology 'LIP'
> 
> Add another check for lithium-polymer in the technology parsing callback
> and return that instead of unknown.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/power/supply/qcom_battmgr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index fe27676fbc7cd12292caa6fb3b5b46a18c426e6d..32c85939b8973422ee417c3f1552f2355658cf06 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -981,6 +981,8 @@ static unsigned int qcom_battmgr_sc8280xp_parse_technology(const char *chemistry
>  {
>  	if (!strncmp(chemistry, "LIO", BATTMGR_CHEMISTRY_LEN))
>  		return POWER_SUPPLY_TECHNOLOGY_LION;
> +	else if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN))

no need for 'else'.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +		return POWER_SUPPLY_TECHNOLOGY_LIPO;
>  
>  	pr_err("Unknown battery technology '%s'\n", chemistry);
>  	return POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
> 
> ---
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> change-id: 20250523-psy-qcom-battmgr-add-lipo-entry-e75b3be303b6
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry

