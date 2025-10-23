Return-Path: <linux-arm-msm+bounces-78499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A04C000AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C63219C77BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B313043C8;
	Thu, 23 Oct 2025 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmWBgYYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733F2F3622
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209836; cv=none; b=EADxCn0STBFzbDUOr2525Ty8aPs+j8sDg7fT5WGRBUjKhidFNdeeJxt5K7bTiz22cXCIOutbboHUTRizkep/HEvyRtFhbHq4Sq5/j264H+s2O4d22w8jKxEedKtMJN7qhMbgqdOVo6kuZ6FV/LAJdgM10Uzav/X8eyysCgFoFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209836; c=relaxed/simple;
	bh=6CnqC37eTbY5VuH8kxQHnEiVd9ZxJjZ6l7vkM9Xeaxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9U70leyX1ziZkshZicv0dJnPCcpn1dUIY24VHxRdHsS1lPsWU4rrfpGDIFxu20+u4SWcBKW0tT1Ms7xG0WPX5lMkQLyAwGwpMSsDS0Kxy5eGiTdByXPUYdUqgRElCgbWb9BbK8Sl1z8QgQbttipN9Gr5CiNvYlJkCMKsTu9pQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmWBgYYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N87FeH020803
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lNE18kBABKPwFEGxjEK15XM1
	n6QIS5Dy2gILjWbl5oI=; b=hmWBgYYPMNr0aXe4kDE73cLq6UrT7cQfheOL3949
	tL/IbSt+IPPQvIwMYJRpZllCA5YrsJF3jIz2SwKesiyC7fTRP7czgo3Y0wUmfKmI
	B0w6nCA9eQIqnkqbdk17wmgQlfaTg4zosMnHNDzhstqxqpuQ4OeSxk85bvibYdoC
	9BI5LkVGlmWTIpgP41oqKERoL5ZP8edJv65j0WOtMwxT7jkfIE5F5VLtcCjmGyCy
	ypLbvbd16ESkz/huYlwTDaZzTj9pGJBBbbM1OrYpFHcqgYewp8b0u361Yh1eIhap
	ozvQ40VMKVGmyVjdu73MaUZxdCFbtFNpQvj2UQHFO2VO1A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhpgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:57:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f914b5a4so545277b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209833; x=1761814633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNE18kBABKPwFEGxjEK15XM1n6QIS5Dy2gILjWbl5oI=;
        b=B/LteSGFaDsIaoVjxuPXyTu4u8n1jGcCxP+YaRAxDCCXPy+IWzrvRc6DXMkMQ+03q+
         xu3b42c+uILMhRY3BZBE49saz8oQi0hximZCndy5xtYAaud5CJDkRPHyfRSKQ0MAMhJy
         FisveQliqBpuLuaFHeIVYEG4qt8uR1H2wRKCLSb9O0clgOdJDosCwKyoncV069tbv+pY
         PpVdkCGaUpiA5K4KTdDzWxOw0csH1bFJQlY1yBLoPk33cugq2iS4Kt4lxNVYTx+kvdsy
         cLL9f5NwM6b0HoG9mx2ZKpFizov3jluBZp0cj0KmuSEY6nsLyAG8ch08uS7grsq/vumZ
         NqNw==
X-Forwarded-Encrypted: i=1; AJvYcCVxjdPX53W7BeSUjcByCXK9Y/+JwXe3mchJfuVH+LMARteoasGkpwyih+LcaxApwOp/OBHhVX5PthEZPLDB@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxT0LzOfLgqOPp8ecbmkjYdh6Hbfw51X42aUGmqLkI6KBHrqm
	gDchHKvaHBsninYyBwlkEpFZCVtDfUPPklB7RJ8KwhRFA0xljV7bdJ4K/KGsu85Xnl+euD7qMPb
	vm04lmp7ZJdQv4LHPvHCpU6KAHkSuABpx5HZ5mYKwb0P7LqqmjXQfbAX6I4k8AjfW7O5y
X-Gm-Gg: ASbGncvLm2+aKzsS3ff7udh2UJ4Out3MUwEAkaUU6y+dSTgn1UV0ucZRo+axmjMJ/fj
	74uN1Uwz3/TUSvaIFt/nMlD8zhuno9tCTAR+nydtP7f9qjQscAe5EI67jGHXrZWdb2XF6wRs9Rt
	ZearwSW4c3kJLgXTxDHe5MCyXfAY8NqbmH6cVwfQsBq0wyc5d8aRa4NX98h7BePTdRmhIM2OXZm
	TC9SmE6HLExBVpcH/infqWBCbidTmNFLwkOqG/noEQBPCGwwKGer2+LFejK7meftpyM4c0Cv8FE
	8ji9IjqMu5cjegXAK0Su76H54SRbHQGPKLs+VI9jrDJk+zRc4v2HNxq00fSOT+u7yyLdbzfGfkw
	nrzvKA2Q+JKB2mfWJExyu1BAXGopv6IstyN6yGhUHEUZUMriGDj504Q==
X-Received: by 2002:a05:6a00:21c9:b0:781:1a9f:aee7 with SMTP id d2e1a72fcca58-7a220a5e607mr31700889b3a.2.1761209833346;
        Thu, 23 Oct 2025 01:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTrMxusQO9d3YWrx7AOvOf5y+PUG892+AnS4bSXJmEY45o17kf1UUxWKAK1eYBqr8xrk+JcQ==
X-Received: by 2002:a05:6a00:21c9:b0:781:1a9f:aee7 with SMTP id d2e1a72fcca58-7a220a5e607mr31700874b3a.2.1761209832869;
        Thu, 23 Oct 2025 01:57:12 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8add8sm1795740b3a.41.2025.10.23.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:57:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:57:02 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <aPnt3quCWKLh0bcp@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX1cFcsaMTqrKt
 dpvnTNA9FD4/DeU8JViIvjg9Kxg3zLZKjV37i0K0eDpZCNfjAFnU8EGNEGBm2Wrdb5dEvAR92Ca
 mFbTow7CKgHJZP4lu1810JzRl5AvgNgen/Jg8OwZqp6I4mmK8B5UmubabukHoTRb2w6ifYDTOT9
 YCGvAx/k0NRP6z8ANgpwyK7wAYmBtBmVwikaCYM0QGrtUpcIoUlMa3NemJXjhJAKXB3lXpCA+wc
 pw8rLFZLkMWXj98v1O5jIM7JCqdTQpzqoNbtnr9xmbbZT+mybBDVZWsjNXZn99GX64SqLxI2BF2
 a9kv2/IXU84xrzDAHLiqshoOfg0Eo5Gd/S0FBvw4UkCcNlm7eIvvXK2McsbVPOZQk4ZGrcNiHB6
 ol48uWvzKiZIfTKYgstzf2KycDA/yw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9edea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=C7owiK3y1AEyg5OQH4AA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 0pPVBvKaebs3ZLwitpY_fYQ0GmPhab35
X-Proofpoint-ORIG-GUID: 0pPVBvKaebs3ZLwitpY_fYQ0GmPhab35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On Thu, Oct 23, 2025 at 10:22:12AM +0200, Konrad Dybcio wrote:
> On 10/23/25 10:06 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> 
> This patch should have been sent separately as it's not at all
> related to extending the msm display driver to support Kaanapali
> *and* it goes through a different maintainer

OK, get it, will split panel patch.

Thanks,
Yuanjie
 
> Konrad

