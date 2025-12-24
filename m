Return-Path: <linux-arm-msm+bounces-86451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5FCDB0EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67A8E3007260
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982892673AA;
	Wed, 24 Dec 2025 01:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfSbmJzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmHlZ9Bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25F1DF74F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538779; cv=none; b=Jn0xcc5+rywMTidzxKkNMNjyY9wXDis6MT9VMZS7pYW/0xzuVEDg5Cws2ifv0uDKeO8Hdzm6qzkhmwzI90OGtAMV+OLpJj5Tp947B9AKQZBqvThANGj7XcKr8RAC/HcQZsPe/dgPoxEz4SGX/kyL9BjQTYkDPIxU5b1GyKW4jpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538779; c=relaxed/simple;
	bh=8X41ZjfAuuj9MQIn+lLzP/fXdK5Qw3HROKBiWR0AtuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfA3zfH0bitLRiMBvDtt1DB0jI4sJXlvhRzWB1gU/o0ROnLnKLP2e/FhsNZiIy7LHHX3+es+Bsf/uu2Ml8PyIQpl3yt8KWIQ+vFdg065zM4iUcb2OOObrygvBd4itaSXxvoSZMgT5GBP0K4EV9edkELCOKUbdaWLrmjTQlYqoPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfSbmJzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmHlZ9Bv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr3pT4134142
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oVGnFQ3gqli1QHEJXbge8cA5
	8T1nSyBsOaPKVoUKLRg=; b=QfSbmJzpQZZ9Y9KiuDEJziTx3vl1Ow4lrUAww0nU
	vHdtIQsSn5onzKEBX2iR4TlgBi0RHksrgVRrhuRCoPgBCz4BShObEVDqexGecluO
	8iUMd1ut9B6C6vhUFVPa7qU++xqLUmRQyi82pEpT8sqBZunWOVZQa9Idj96uciyt
	mLWq11W/IK99/qVoxTXZolu7pXZ+JhSm7M/QLb0DRXntHNicJs0TEsFSmTMQElqW
	D0BKyQf0CfKI3YnBDV0GjeXHXslUxvkht5jRBmpJsgTVBu2h29Yc5MeyZHoOOI3Q
	+tBrCADGA2yq7oOo9DCquPlePC74j7+dHpgBqDqA7KsxPA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46sf00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:12:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so118921301cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538776; x=1767143576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVGnFQ3gqli1QHEJXbge8cA58T1nSyBsOaPKVoUKLRg=;
        b=KmHlZ9BvEfZPdrrLQ7fxHkuXWyQYtH08r4ZFlZInkmrYiFKE9TF+FTLp02AJ5nS5YH
         1WnsBBlDd2N79mNAuEa9/HLBsjd0A1/oCGrFg3Alk/qG7CEon1NgIYTrl7u8yFHNSSg9
         XjjuUfNGF1R0uCnNnbF7ZnMhFthjiuIc3hGduJSKtRTP5nlTQAwjt1YH19Ue5gHGsxJU
         jajzqiP2RZUXQHTmoFJ4n9pKbL+bGmvKZnE0mvQve6W45sSqmJHsUWFiKJx6BmUTWtVa
         EanR+AWaB7zIYbLrGnHJgFn+d1iQ4Pdsz6NsYOqUvnaqOod5c0aqcFXVU0xww/CcBAuk
         HMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538776; x=1767143576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVGnFQ3gqli1QHEJXbge8cA58T1nSyBsOaPKVoUKLRg=;
        b=LyjD/QXRMwvS4eWXNMA17/Gdsd8H3jeeSSEG+PXX24GXWm6CCmBSURJDr6alwNAjTM
         2mlL2gdjWaL/azeOeC4mdZHGWbmU4yFnk6yOdJuv33DSHal/DHOgtaMKloyp7s5/amJ2
         62ZCx3z55aO1XakmE+hxcdebFc2fmjaTXX68QDdKLKVUD5pOqoErrwd68ZjwMFk43Yc4
         iBwjaVToyPuiGM8CGN5YuaHi21RDaeaReNV1He3m2VYyly2V3y4i39+ypYqaVYkhWH2j
         ZRwwgOFClURk5rCqdKa9ASyYp4gSv7Ifd/zIvrW5f2s4mOPQ/Xl9HZIPJdizd6i3tmOx
         dyCg==
X-Forwarded-Encrypted: i=1; AJvYcCUPVDETssMlGSfNHCyqRpuFRV7LgTrYjjLiZs/AWjGEGGyQCxq53Fi+ztKDc6VmhBfZ6yBH8vUXnKoIi1x1@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtsm6xqwszxeSHX88UEES9Qb7KRWL5nA0zrc55u/WM8RMSYon
	sS9vMtUC7SuXPhShYSDWloreFN41I85LgF/h1ET0nBcLz0QkCPeaZBWxfwXcG9Ywz5h7vNEM/g3
	3vbpMpATFnrC0nb7PoVPnYWK1GVPzEnfv8lOSXfqZHUcSvWJHhCi7A2p46zyj+JOGTzcg
X-Gm-Gg: AY/fxX6L2DOhGFvi4cFScKiyH0EkfTxYpfZ6irx/25WEjOhICuCznM/jld9fla+wyEr
	AUgWHjhcUp4Nl2T/PrSgnHGW7AnICWy9u/66q0PFRQUbei38VY/XTCXeme2oP/DoHFCohqXt1Kd
	ljm07j0eSf+80vDLO3252EsXejjMGPTh/6nGU/nsVTADgxu2bJJ3UUd1F4Js95x0EL+8Q1PpVuI
	ovnFfEregur4glSk0WiUHGgb/aG1ycE3l2cDEgSHrpO4XQpsGq96YykOgAV2IOcbjx7NuW7lutq
	DN+6J5xgGLo8jZ++U+QhskdLsFblpJkbdwFcXCqi2gHLsgQSu3ynTJo6RoRDcn0n+f55c6iIAqn
	gEbU4bMp1VwaQuc5wDhZF3+se6XrD0h+HNqQ5VrhlRCHkeZgFtuOcsO4jxKA2pHbbTspm/l61U8
	J2bUfF4+ksTNUnJelfcsNy4sA=
X-Received: by 2002:ac8:5e53:0:b0:4f1:b362:eed7 with SMTP id d75a77b69052e-4f35f4849eamr282708461cf.42.1766538776323;
        Tue, 23 Dec 2025 17:12:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE4B7/rPVFuJHrgTNYbucMWLjNHWMuUQI0EU8npl+25cOJb1pV/0Xke+yOfgEQK+FXxdRvVA==
X-Received: by 2002:ac8:5e53:0:b0:4f1:b362:eed7 with SMTP id d75a77b69052e-4f35f4849eamr282708001cf.42.1766538775854;
        Tue, 23 Dec 2025 17:12:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd861sm4587300e87.30.2025.12.23.17.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:12:53 -0800 (PST)
Date: Wed, 24 Dec 2025 03:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Casey Connolly <casey.connolly@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01
 DDIC
Message-ID: <7ssxf6rprsllmfte2neuobccnbcxbk4vrintgvrm7aghaqxwma@wivcio66spjh>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
X-Proofpoint-ORIG-GUID: DlfJEQpeoM0ElT153nSbwez_-9PS0fqX
X-Proofpoint-GUID: DlfJEQpeoM0ElT153nSbwez_-9PS0fqX
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b3e19 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=udYctNd6dDZtC2LY4QMA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOCBTYWx0ZWRfX73LTHtFXeG8Y
 2bDl0zj2BZs2wbEAQLDqmQmyXALkuBitB791c4y/FCXk69lvtvPk8r1ie7xn6NgRLk0yXMHJuU+
 C2VemRn7g4bKvE9mwH+NaPDffASJ3dpg1LIKuuArmN5f9j8YF1KL62Xoztv4TOqz6VQyyuf5tEA
 EmJfu4x4t1CnAEJaVXqkJgCrLGCYWUdfxr6Xod2JDq7JuqRH2urc3TW6/hqsWhwt0m2zIMbyh9W
 A1K0JXK+Wh/sm1GcXTa7GRBwLC7g9Z5ErOqT6nu81Phk8zoKAYu/5Kpsn6HX+cDOUyyBrtwgWy9
 Ebkmmm8dXUGawOyaaxrDWgPaDrijFvmf4lRNJwljrTxb4NwEdhaP22Bwber5JQ1lI+OroiITcbJ
 OqPl9Tp92rogeoiDz5pidDvMum+pOirNvVdFQ9bgGWDf/t/l6X/sOvfJ3DHRkxZqxxzAweoEYji
 vpv1mvYHKdoVez48lCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240008

On Mon, Dec 22, 2025 at 12:32:11AM +0100, Marijn Suijten wrote:
> This Samsung SOFEF01-M Display-Driver-IC is used to drive 1080x2520@60Hz
> command-mode DSI panels found in many Sony phones:
> - Sony Xperia 5 (kumano bahamut): amb609tc01
> - Sony Xperia 10 II (seine pdx201): ams597ut01
> - Sony Xperia 10 III (lena pdx213): ams597ut04
> - Sony Xperia 10 IV (murray pdx225): ams597ut05
> - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> 
> The amb609tc01 and ams605dk01 come in slightly larger at 6.1" while the
> others are 6.0".
> 
> A "fake" porch calculation is included to artificially bump the clock
> rate necessary to account for "transfer overhead" (DSI packet headers)
> since this is missing from the MSM DSI host driver; porches aren't
> otherwise used on command-mode panels.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |  18 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-sofef01.c | 463 ++++++++++++++++++++++++++
>  4 files changed, 483 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

