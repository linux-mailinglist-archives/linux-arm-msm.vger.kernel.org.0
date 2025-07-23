Return-Path: <linux-arm-msm+bounces-66269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972D9B0F0E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A6058346C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C446F06B;
	Wed, 23 Jul 2025 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGGBfEPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3403529B8C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753269036; cv=none; b=S426diNWLe+ezwM/9gfoSvUgAktSbgiZY7oDYEi+X8BtJ8dcfKxBXop7BnUE1rtT83fdO6dO9ezqsY/ZuJuJ0hbsJArKb9BN6z1rlw4LovNC4Exz/J9wI1Bl8fUsDj3cy+x23QP4LYO1luJsdghr6v0f4ZW8e+cZ9cx6W89y58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753269036; c=relaxed/simple;
	bh=XHZNcb709QsG2HbbAkiyf/Y2zrRKN0Tk7Rb2azhNs8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEMpr8mUH8jf3sazZQQXRP3VCb7kVNUC1r7fW8EZXroV5EAMiPOao/FdVNNujIN3HN0sXCbINv315FPJVxznFX6rLnGyFXoc6TztXiGC6Dcdt+1oRrQC9bnt7YZ839VwlzO6vBpCr8TfblqAuRi3cPxnBQazbbeEnKmcnYRI5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGGBfEPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9MP6s030783
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o8v/bH2NBjx6+BJ/r65MfwKr
	xmq2wQHUa+XHZT7+W+g=; b=SGGBfEPrF/eX72+93Lw6lKpkf16xoPZWUMRMXU4D
	rqgLNltlyAsee1NqncEyKzv6vDJ2sW6t7neWKE1jKxMxpBXRu3N/9AmswkySAh//
	Y5CGliP2+qiQ0ijEKd6ya44NXX363WjF6Lht45zGyvD9plt6/Zi/BHsNXaLPd1RI
	JZQvyh+ZQp9db6fw8Fsv+UjyjMfBoLBR/vhtDc8wqA8qC9fIXOR7sC8hj2QzItMp
	Oib8Z8wsvOOnOjEGPDsumsAV3vj3tWINJPoTX2Rn9SW8lben9deCO4iHKprj/qun
	QyXxhJlAuQ54sAoUfuLXi3eK/ogxdRvskC3FfNXKruPJGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4x3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:10:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e36e4467e3so140076785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269033; x=1753873833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8v/bH2NBjx6+BJ/r65MfwKrxmq2wQHUa+XHZT7+W+g=;
        b=LwEiOCAi92B6Tda3zVTyUCGkeNjPL+AOMrIfhdHA9ZYAz+rgoi8m71mPEKrwvIZguQ
         HA9ojmJ+hsTIwAL/K0D0bog41GpcKMac1Uy3XiIUfAkjULrhPKZvAZOkFP1b7Fo/h6Fo
         sCHHV0f8mOBMBdxubi3ofoB5cqNgp/PmfvHyk+GBIJiafa6UzWF8WvTIE0zD8V9gFrxn
         o/FTOOFCbkLsWKqCkovXT6/XngNhCWbZEhEjC7cPKKyOULZNWMEIsRSrYIuP1uBJod//
         P+Tx5lAkHfcV6rwIiXxVth4n22rStkI4hUO5wUrNpQ8x2IRU+KaNfcnGnyDRRq7TgnYF
         B1eg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHALaaPIUznZsbmbTFbDVl487ljpUbQLWNiL4uDBUVsClzEun8NPVYPTdsp93xllP6mqdC/7XaJT7/f9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj5yx/xCAn4+k0tkel+bbXBXHhtDkHno/1DGaH0xpAdrXjyv1N
	Kr7bhQkJF0VkbZs2u42H62JFJIANsr52JAznLiS0Hr5MKNCB58/gtgxMA8JPCLtvKWSE2FeX+Yy
	7Z8DxPGIABA6fdLpB7VPrddUa0zdCLmt66tXPfI6byjHEG+9PIL03ut2UVC2BUHtnaAC4
X-Gm-Gg: ASbGncuN//vd6SxojopnwSet3qjQ0aM4h+CnwZS81ajOTw9KWflm6FQioPTp5SdKyp8
	vnc/WSATxtz99XmaseLRA/6Qc03eEQsYOoFhsGUCrkNS6xXNBkz4qFOAW/JXHZInzN2QpRi5NAb
	OVnnqJY/1bVXo5i3IHFVpVfpLcn9q9wCUVOvx9uVstEvRidd803+vhqfoaXBaDwsbZP0n9EW+8U
	t3la7SZjiom202j2L2+QlhRsJ9DRn3ynX/JtDkzSZZLeTiqmW6Nal8N1Cd+AfcGohNr0BV6t0P7
	tMMi3O7LqzRIdrtw8GgcXTffcU9S1Q0YfKOMNPB7n3ysI5HNG8y3Up3NzWdGNzw55I2jtX0Tp3k
	AwBH3igIr4a1+gAG1XFVyRtZFFw/pXOydpm9UxuU1RGP4VbuXsQ9r
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id 6a1803df08f44-706eb97e401mr95429636d6.24.1753269033185;
        Wed, 23 Jul 2025 04:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKX/yJfDO+WKJkcweygCNZ3fLCTvl7U9+hFOTGqWhqzh7qpDIFbc61paUsq4qoz3Ql+XOQtw==
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id 6a1803df08f44-706eb97e401mr95428916d6.24.1753269032389;
        Wed, 23 Jul 2025 04:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a9102bd7sm20831921fa.27.2025.07.23.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:10:31 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:10:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Message-ID: <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
 <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfX23fUnMAaNlhE
 8q+nFehW5oIxmFhOvZ9PUClM/YWMMIzuFev7rx4aeQDjngBFee4KYoWjENQaFjKfWi9zz39+EIM
 u9b02YScrCoxyQqFT/MQEfeGO5hesP3La+JHTVTxckvdujPtTSC/Ka6DR9m5WakEiObV2KWCDpx
 TMAcWjFIlssLAFltvaA/qrCdoytWs50vH+vqH1SGPqRv7Tft+QYkMLka0A4foO/3VmIU7IaNOlh
 wsqIOCUbr0UimaWDEz7aYu1wJ11MRYdSZ2mEsw8l7rlCYqtUa6q7y00wKqs1A3qiE6yLz1YMtan
 jqPlKcH89Jgbe/QmKXGeqmbEgXNANqoIuYC52WPjTexUNjODfF/qJQLMe2qqCSSAAh4fJmDoGiE
 iYoVrgEJqkDIgd/jjJamanLM8fDfddKBsaD9/8dlqYI2cdnJpC3o29/llhwD/9nKT3CnXd+F
X-Proofpoint-ORIG-GUID: cAaj53E4Dl0JsfIBPUHuktxYmDYAUPqV
X-Proofpoint-GUID: cAaj53E4Dl0JsfIBPUHuktxYmDYAUPqV
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880c32a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k4jRfATEMmhf2Y4IZEQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230094

On Wed, Jul 23, 2025 at 01:22:20AM +0530, Akhil P Oommen wrote:
> On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
> > On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> >> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> >> different in A7XX family. Check the correct bits to see if GX is
> >> collapsed on A7XX series.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> > 
> > This seems to have been introduced all the way back in the initial
> > a7xx submission downstream, so I'll assume this concerns all SKUs
> > and this is a relevant fixes tag:
> > 
> > Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Dmitry/Konrad,
> 
> We don't have to backport this change because the existing code reads a
> couple of unused bits which are '0's and that is okay when IFPC is not
> supported. So there is no practical benefit in cherry-picking this
> change to older kernel versions.

Fixes tag is not about backporting. It is to point out that there was an
issue in the original commit which is fixed by a new one.

> 
> -Akhil.
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

