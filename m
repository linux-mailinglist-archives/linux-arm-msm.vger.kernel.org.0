Return-Path: <linux-arm-msm+bounces-60680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D88CAAD262A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 20:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9661888B4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 18:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E23C17BD3;
	Mon,  9 Jun 2025 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeQjhE0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B321CC79
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495286; cv=none; b=lQbFS+kQ1dgPxjR5PB30tF1aj1QCYsd40Jn8gNKolPRapTdO4JdM07oIkA+wWxrDzuucuXrvELEZRlxwvsKxDnpxDSSU91aCzrxLY6cGwrj6LFZ81ENlBh8e+7mN0e5O2igHII6YyzaSVGJ8ZMzWhTK+m5NLrNmnfVbrzp3Vt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495286; c=relaxed/simple;
	bh=d/HuagAjGWuT+D+xMNfACpVB6mq/KbmKFKK3BRgoASE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiwCiigR88UFgZOnuUyNvcM+HTKVXASV0CRCqOUEPtb9Ls7cTk8VJBsQwevQm+oNvgrtT1Yfx9cdt4gcQlmgoQvNe0AKHhNM1NOpPTHYXLG0mx0GJmTE2xHZT2INlKQ1sIiXgcfZYVayQsQ9OhCnAFp6YuW/rqqs2LA1h9B4HCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeQjhE0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559A0eq2032175
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0Q7j6JWLfPAIL0zTecYfobk0
	dPt4Avr6FVotIxI6daM=; b=BeQjhE0bIDAzAZ9450ceDp5t5AFtsbnnpPL7K7lD
	lY7CXnC9+u/2cJLe2hAP05S9UhNYODDnkThUmBkNaoIZ3sBlwRVQi38IRBp2NUkE
	O+7hmUk5zqhQKIse4m9cOW3SBO7NBC5UjKavLOVSPgWR7gAn+j5r8vPwPO++mE52
	qYCHiJhLo0XwKfxag3OJoBbvqSKDu+6VPk7fhpAAKZJPGlFcSMidTsCuVEl5m3J0
	0I5E413QGPINSfDzmJS2Ul2N6NKVimM+to4dwxiA9GxtZ4qhg1sidqquRit7eOW9
	94CIR7AyRK1ng/FgbdeaFZbI/d8GwueuUxKIMOYAALhr/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv6w75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 18:54:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7cf6c53390eso435418885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 11:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495282; x=1750100082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q7j6JWLfPAIL0zTecYfobk0dPt4Avr6FVotIxI6daM=;
        b=NWMH5GgPmk4YdFPT3+haNxBucIZeWPzuiQKCupuJFn1V1nxzw0WRQIuZn6hczob8+x
         0FDawOcYRmq36l1fPtjn+jC2VoKEf494r/63Ry8Z5wxM3oQExCduoCy76wC9w/5Og3Sp
         r/aiBKw6RH7RF/96NNHYya9vmrXZR0Gxm8hAFS6IE2kwlEJIW0k9+ZdoqnggQvuS7VbU
         mT7/bEy28jd9MweMPL06KHJQ2BkOixjs+jbG1Ihrm1ftHI6ghUIe6/4eLoQ5iToWJ/dh
         A5V0I/KA3uRXjwQYeDV5mA4n3Tl63uc2eeyGOHABf+LygWsi0Rz/KxhNjYapY3QpdtXk
         MTgA==
X-Forwarded-Encrypted: i=1; AJvYcCV706YlBFZpx4Ly434q5lZJNWI40w5NEawilDJ+aMDpStjTdnC1RqRdtPXlteqjyHyYscEjrkHlQcBpQZVl@vger.kernel.org
X-Gm-Message-State: AOJu0YwetRKjeGk+eD/+E3RLd/WCivKBG4+7yrgV3NCG++MsVD3BDZTU
	2t7C52kf15RIcYNSzfXaa9cPp+2uN70qB7UHdvUr/b+zO5wLv9JxSP2TN4szOCdKiYiMmDFyVi2
	oGz7zp6YGRlQQk/wkPk0u/+C1Rf8v7UmhYuXXbePmM+Tox3Xuk96nMfQOzEoG2hWi5Sfw
X-Gm-Gg: ASbGncsQ7vmVwMqQUf+fHoIzu5AirzNaXyOooOVGJWwHYmYH0Be47QXvNzMuwWmOKGB
	N9hj9HPgWjPkYAvPRYv4+1RoY4pK+b/RmJZt2xbBW4/GDLf17fSgXljJkIOTR9xAKgJ2z7fXTHT
	ymkWZMQK7CWjKI4blBtjRS54l1SYMi94cB39KPURlh4jjzMY43TCFWkpoHV4pX4PM8eg8NcFx4F
	/i1aza/bzIK15GCY4Ukh3zQHtxDI495U3K1c9lTSUzN9ieCG+mKplUBlk30aH9ptMekC2aYG06K
	84ORCFmLJcoPMt6s2WC0gX3WdAwc/+/Zf5VzFXQGU93YCZ7fw3++SCRWiIEsv7RPMSRINnwcgA8
	=
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id af79cd13be357-7d22995c589mr1782744385a.14.1749495282643;
        Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyj0Zi9Wm7AlJmus5lOeyDznWCCczyVFTC/lx3IzF8V10z6/pDpyYpLgHsXKeVB0xoCMPtOw==
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id af79cd13be357-7d22995c589mr1782742085a.14.1749495282327;
        Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772ab63sm1293535e87.178.2025.06.09.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:54:41 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Message-ID: <hv5zpb66oynxm4ge5ugvtgfqkwukxjazcsutn6phi4ll4lpuvu@r3t4dti5pfri>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Lhd5MO_McmDLX-6yJ8fEenhKnbExZaWx
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68472df3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Lhd5MO_McmDLX-6yJ8fEenhKnbExZaWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX+ql2gzpe0rcF
 uKV43mbofWZc4TXvQY+YN5Mgld4WCDPMXIXmURK/QjYmu/EWxp/fkY2cYiIi5wq8jjlrtCAmevc
 VhRQ5dtAcit/EVFOAAwohAAAQg1KOuQFahErs6jzLZPRHaMiCsI6jtPl/1TmfKCaWESeaEaNS/u
 eyCuWKcf7ad8VjKvyu0FFtOCmDZhZtuNcJsKw93tV0979RHlzjq/2noKPdwVuMd+D4Mx4Vr1h8M
 C5VuRS9lTLs1MziikLplp2Xt0ftdBfp+2q+xGs8ufizSGgBafZ/TVUEQvt2xa4roNbl1motCM9z
 kgy1IKsZBGqqFdacF55mMOzCcu0SAt1OzwhOmDQHac1tyblbmkpmcpsOmDpYDH0wyjJJ9sYHayi
 2K3NF5n+zozHelwOoooKFvHWndwFEh9Oln0IuqegvX5luMQRiN5cF58g9JeB/MeImFVhNhR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=740 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090144

On Mon, Jun 09, 2025 at 11:24:36AM -0700, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

