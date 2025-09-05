Return-Path: <linux-arm-msm+bounces-72345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE71B45E78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 18:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 915947A219A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E80306B35;
	Fri,  5 Sep 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldSFbhh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A2309EE7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090704; cv=none; b=H9vKecE0Vaj3yufQoaPDuWfnkD1nFpUmtIZ6SpgteD7nLATQ5sCExHonNe6S6FfYYMbXZPQ+NnSbkz8d+3xpgvabEKwa9VUJDHv43C8fqdJS8CPilflTuZMT1fC3SF5KMF7RPi2JQ1gOsngP/55k2tbqBfihm7wy3p0DHJXCp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090704; c=relaxed/simple;
	bh=5taBZime/pvFUSuPIcotl7pYepsL1uGKb4MYEuPmZDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujBktXCTHbRdvX6OtWLygGS30Sp1J4LbyaSfN0YKuM6FDjzPB/68yjjM2chLwtOkcm65QdUwAHnEXnkiwvOrdTqlgjrIkMQGyxBopeMGAmexUquunbNGJiIxDsg7IX82L1ASKmZ9KMOy9RAAWRmcvSeATSOR4dZWXrSd7QWMjYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldSFbhh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585G02Sa032210
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 16:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=prGcEflsEAGkacTiIj0gYdNd
	T0AAZRAHRTty/ORi3tY=; b=ldSFbhh39LkQ8va4c+5m9N1qEY7bvQXjo7vcTmYa
	cMlFnDcXlXR1kp06bxhiVJ10wvNUKQez+bDERQrCPeGo6U+rsyxTmbfNhNlZSrC/
	UMm3sgCZL1XIiIbMvYxHAx81BdSuYXM/Y8KuRBBXNzhPTTy+etEeeauhoikPSLwj
	/2F4/90RZ7zv9zaCeUhhLjyhWWzbZ5emx4Bv7zxW78cvXBdRZR4eOaVYMjpNETKn
	Qpp6Zk5fRHRvPHtiWrswjIUaYWqB1ibcMs3TwvpsjOcG7JJXTM6d7d6v+Qg0QjbB
	xdjsetWnsbwLlm5IcDBJ9IL5+yeQXfCk0qGyIzmrQOh2TQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpm08y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 16:45:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7296c012f86so37987106d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 09:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090702; x=1757695502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prGcEflsEAGkacTiIj0gYdNdT0AAZRAHRTty/ORi3tY=;
        b=aRxieiMuNqxu9jDlQbMH7dob5IQtfTXAM5ddlo7gOyks0ctSs7QlqmtyVmh+hjHfqq
         PMGizj4bkd2LA+vUZIJIgN/jDBFm//S/TQ+JXDq+q64oNAVS9Ku7ekeLI3EQrAn9mvGx
         Cz3m9jPSRif66QtfzpDpVhlVgG1URuPQc0tukKQgpIqZNXOdsXRXcGifXmaLc8kpC8eb
         hrSvRU1hc0F25mcl52v6TxkDPWsS5P+2ea50v7s0MrvqQdTqDnm6Jp3SKFhjFr1DuSSr
         C3yRcUaFJh1G3l5nrmM/4ipA5qc6OJHNN7gPwZZ/wE6DhXOBCnsfg/pHg2w5uKurvSvc
         gJRg==
X-Forwarded-Encrypted: i=1; AJvYcCXUCbW7T3ktURvb97m4hDgxhH4rzObNo6qtWj5WMw5171DvCVqe3nKYnZ486d2J+xY9ii/O7gIAchHy3sWt@vger.kernel.org
X-Gm-Message-State: AOJu0YyzjPkZG+AvTOyJG6dWgNbMF+8DsZaiMUsZhxQJ1cRAOkTBxWlB
	VUIGH8SwIUftX7zzg9VS/QiJVnIeE/g3857pOxWC1nfoMqmzji4gYDxjWBjDR1YM4AkCfFwohJa
	w5bprUtSdxrCGkzds9em/UE62PMaK1o5tYzT77tzTF5GRxKiadHjGZP6yVfV9l9LVnKPz
X-Gm-Gg: ASbGncuUyng69J10hNsUg98yZBXD0dBAGd1ANNT3X3UG+fnPG4+oGhBMw62KHQEiF2x
	EIVjOtwxusRyfPtO22LvwpRVWKMm24/GqPRRWPBCuJk7BYV6Cgiwxo2AW51HbV7uFRy7H2wKss6
	xhrBEg76P6bA9z5/gQJEA67C8DDd19ceWsyD10YkVKmYZsuWHv7YCZ4LQ1CFK6IqnaRvaPHvn0O
	zbd35zQjegyCNukX/BdR+6zRJyA/3DgYyjpSRXFYZZ2M4vkcGn7Q3fjk2zMWRHDdk6iBuLEmvsj
	v96hDvlMyRkuh3msTaztuViu72eR68+rgOYK5LVCj7D8fWVw6L9Zq8zAL3UQ81UPv/l52b/KN6c
	s6uryiAiWPraCFPE06FL5R7X/B6cL/7YZ86XtUxskFe6XxkU8V0PU
X-Received: by 2002:a05:6214:f09:b0:709:12b6:5a8f with SMTP id 6a1803df08f44-70fac7ba44cmr313993586d6.28.1757090701584;
        Fri, 05 Sep 2025 09:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHADphYCXf8LFxn7W9jBvqaJTxDjvxZRV3ILFEB18XoXpLrtUdbQ1fD4T3t9TthbsGZ/gU9Cg==
X-Received: by 2002:a05:6214:f09:b0:709:12b6:5a8f with SMTP id 6a1803df08f44-70fac7ba44cmr313993006d6.28.1757090701061;
        Fri, 05 Sep 2025 09:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5619682eaecsm376145e87.123.2025.09.05.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:45:00 -0700 (PDT)
Date: Fri, 5 Sep 2025 19:44:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 10/12] ASoC: codecs: wcd-common: move status_update
 callback to common
Message-ID: <7rizn5ckjyyxx3aabni3xgrxi3lr563q555llq677lcnehyowm@ys7uf3dlk6sx>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250905154430.12268-11-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905154430.12268-11-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: pNuTmou1ly3vP4-DmvAc88qsmXfpYfTY
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb138e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=Wf3XbFnT1CmmG50OB2QA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: pNuTmou1ly3vP4-DmvAc88qsmXfpYfTY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6mB3YYtdDlCN
 xmY0LQL+s8lI4hn8R/CkPPz/E7+BDrlygf3+c56juOPTcvUaXSCCL8LBT0bTWMUKxXzoBpMZ6wi
 1udn09DJ6XGJ4+cKVclznP8cftvsRATC0DmjL82BJyto7P575rU0JkHzdb0xpW+xIH3JxBv1FEe
 5RcpP32t24MMCUE6HeoWyXEKssRpzMeySOK9iSPhCpgNdmomJxalf4fIZRrMKnk/6mlMzfNYOmD
 KOf22C5S2dYFziki5tXrMFKeI/uPoMCtjvRIg850P16mGTgrKWtWvuDr5Dxx2jhh2aMGl9H2Cgh
 gjdKn0X9ePNckLRd67Cwgu0JvrF6K2qqd2oVGJWNzFZdZT4A48yuO5PVZnu/JpgM8BWHnajatZV
 t8rczy2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Fri, Sep 05, 2025 at 04:44:28PM +0100, Srinivas Kandagatla wrote:
> Soundwire update_status, bus_config and interrupt callbacks for wcd937x,
> wcd938x, wcd939x soundwire codecs are exactly identlical, move them to
> common driver to remove this duplicate code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.c  | 46 ++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h  |  5 ++++
>  sound/soc/codecs/wcd937x-sdw.c | 28 +++------------------
>  sound/soc/codecs/wcd938x-sdw.c | 41 +++---------------------------
>  sound/soc/codecs/wcd939x-sdw.c | 42 +++----------------------------
>  5 files changed, 62 insertions(+), 100 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

