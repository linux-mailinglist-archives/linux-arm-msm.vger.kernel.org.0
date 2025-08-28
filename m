Return-Path: <linux-arm-msm+bounces-71089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 309ECB39A08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF61188BDB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 10:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413D530C371;
	Thu, 28 Aug 2025 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeHJaJ9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B1B25D549
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756377144; cv=none; b=ANB1luyA9O5MKp07T52yUT99IqeLCACGAiOOkYZ3uFfaeo/gBLsdRuQ/Ug3N/4o+i6i4zCLA4nF3sAkRPpGJYwzydd+es9IN+al5ly6VZY4atFYjsWVuhJpVmhHoHPfkWNKdLNYpCle+lTSL6MQmbhx0xo6zhtjO+uW3JrDK3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756377144; c=relaxed/simple;
	bh=dt9wxlmAwg0N5A5qd4O6cT01R165bdElqjuRlYhrIZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvDS6E/jSKMKns/k1OG8quk/iJPSuCMdZIC2TJH5UjNvRxyb/Sga/BwhYWneqWEes+AP8RTOe7SgtCfsl49kUMR9/h6+Hi3UEyOrrXDLOBHTTmHUSW1W9pYeRStN4WrjX1d9Jx3d9vJyOyTHcXa+4QAuX0Lb7MfCLA6e770V+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeHJaJ9a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S667Op029188
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pF1QVg0WiTnUKPs8/wG6SRgz
	3ikdq5fxvM7PGeVRu+U=; b=IeHJaJ9a4NYIPb/H4JVKvsKJhliLe7FlwSqYJ2ls
	gMrbQAuyXe1VhxJVUhcz+1aTlrRcLXMBZF2mmFBiEpu1P7KJXCO+h5B9/6+R1AN1
	5h6sD7ED1qBKixhFGSIxN3dn+AN+tAAKyqasMH5u1cbBeCoTRgE9f51zs/Lfpdf4
	YNCMFOmL4sySKZalRsnbcvsurPvL0vPuah6RbUDLxcCFSrFOUMOFRYlsCa3fHtEk
	gIydrKMNqaG6QdOHCAUjB5lPO9qtwAro0ElKPt9pLu1eBvnJrekLw18++XKRFzTQ
	2BaavOZZzA4gyX/k4WKWveAIPyUgox3AjFD/fwVdGamDaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umg1uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 10:32:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70dd6d25992so19097426d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 03:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377140; x=1756981940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF1QVg0WiTnUKPs8/wG6SRgz3ikdq5fxvM7PGeVRu+U=;
        b=bb2HXWSZQ/cDGIe2EY15YFLb9njP/Ln/PoCqWjYnFMQMm701nPEGeMvPlP4fcYPhZa
         8tk4r9fqBMUKttcCp5OQAgXS/we+r26cdEwusxIMjIX3BygmylpfAXbyYLfszcLqwWx3
         hXjwD6kav+F5NNAaKKG2+zhzvZeWhNe/CY6/eESLw0Hnf7AvQaO/cwX6JBV7HxZRB17i
         v+UBPRyvu+KBYM25ngH+SAKcYLygX6wnPElas1uI5Q193l0UNgeBwUNV0dlvvAa8Buox
         6rTKgIoZhBoosb9ZDXAjVk01bHaJWaCBTPjaborqdvOjGXAkqlmIF1hbl6uWqTImHmSl
         Qf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA11Arz+lTnbR09PjZAQ5LQy4jnVVYsV1gOQ8CJZvqZUo7xnJzOYPEPOKfYfDkZjAYHne+mRRgq/rRX3b0@vger.kernel.org
X-Gm-Message-State: AOJu0YwtskfLTaryTUD+k8ikXjWFJIXsLb+ikEat4rv6RSpfByRMlYzY
	3uRMyJZDgohM+VKUp5Jrnty+pFR+awvYnywYqg7oixYutiI45g34f3DERrNP1Qs5tOF6nH4LsoS
	cGMvy8mYV11jwLoFyT+L7dPWQlOqXHB4ondys7H6rmDiKGgtdzPMMaYORJSCqpltwc+Il
X-Gm-Gg: ASbGnctQ68o4H7AiyQv1Awl870qVY9aL1s31Vc1lVw9oI2dic2y3LXxCaONUJk/nT3E
	CLmpAoN09xET2seG8cNLe82JPHuSpAd5cPtXgzrVik5Q9NMX4Jd4YJOuGgomYha0ysjeR81A3hO
	OnyB6p1y/bcm6fIiOLu8Rdx4GQg/6oKRenGm0CHkR+f9ZGrqOjTlqAPEt90+WVBCq7yGV5kxCxk
	Z/litf+6rBa4uZ+lZkgCbnw6KH1X3uQujKKNL7q4F1zkITAXCdHMjZcGJfFhwjQKANp/Iw3XVkw
	gP591ZAMp+I2r6kMB76u3ndGnqWi+PVi7nzbqeWORm+dux1YjnEmzhArGB7yBNO9DzNVorhqRUp
	/no3+noeyw6h9Kkx6tLffE37S8je5HDAoEOp2uvGPELvFH4IFUwZG
X-Received: by 2002:a05:6214:d6d:b0:70d:fd26:f234 with SMTP id 6a1803df08f44-70dfd26fc03mr809936d6.59.1756377140443;
        Thu, 28 Aug 2025 03:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9RHmS+Ep97yyR3FC0zlcb74IJbJ/77cI8edf8G9P9RRNhQsn1iB3HWlX/2n/MLMZQ0ByuXw==
X-Received: by 2002:a05:6214:d6d:b0:70d:fd26:f234 with SMTP id 6a1803df08f44-70dfd26fc03mr809586d6.59.1756377139998;
        Thu, 28 Aug 2025 03:32:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a063sm3239190e87.112.2025.08.28.03.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:32:19 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:32:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] ASoC: qcom: use int type to store negative error
 codes
Message-ID: <o6ui2oopflsxb7dyrdet3ti57zgms4lywrhibyks64qk3tmh53@vhlrrhpb4zr3>
References: <20250828075406.386208-1-rongqianfeng@vivo.com>
 <20250828075406.386208-4-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828075406.386208-4-rongqianfeng@vivo.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b03035 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=IPwh2cHtyxZVSPeiaZcA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX9wGXo6uqG3z7
 qiAc8QYUbaermBJTZGZ2v2vWnRky0MOgDMECAQq4epTAyzX6h3PBhHt5S92aocDBbGret9Qi+vf
 pB/FBkEBMgfYoBOni2Kg4Yk6+VI/zhz2JDzZC+3iDDOWo/JBcewFKexc5sdQ0FdPGYVzeXC21vz
 3cdVJcLcJI7Lv1MMsKl18r3S988kY1vQbdFvXwm6DdmpEqy+NhIve0IEU6J28I7XRN2fuS1/FjJ
 YM6H1+nBSD7UqfadNs6VFk2kABdlToCDzW+NwYu1GTtouX9gJ7FvWf+kvL/KNFwDZT5VH593amj
 ik7mNVgQclhU+ccitcbvSdhGrk9N5xzv8E+VTi8+supf39N2/oiw5v7p/w+2VLMvhq5GbEzH/nE
 80kB70dl
X-Proofpoint-GUID: fqjV0v-KLdGYnHJgjgLBE9tcgdHFKjCy
X-Proofpoint-ORIG-GUID: fqjV0v-KLdGYnHJgjgLBE9tcgdHFKjCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Thu, Aug 28, 2025 at 03:53:59PM +0800, Qianfeng Rong wrote:
> Change the 'ret' variable from unsigned int to int to store negative error
> codes or zero returned by regmap_field_write().
> 
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but it's ugly as pants. Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
> flag is enabled.
> 
> No effect on runtime.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  sound/soc/qcom/lpass-cdc-dma.c | 3 ++-
>  sound/soc/qcom/lpass-hdmi.c    | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

