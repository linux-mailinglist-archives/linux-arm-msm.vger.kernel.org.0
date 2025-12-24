Return-Path: <linux-arm-msm+bounces-86491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB2CDB827
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC1A301ABCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 06:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0275B2ED873;
	Wed, 24 Dec 2025 06:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9O2NG6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrctH7M9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283132F49F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558002; cv=none; b=tpOGvaQkN+rn+QnzyT1W+IhQHTGl8BCWbdrkq1rSdQYEqO8gYyAkxbIYR6GjKelhlBQezFK/RKY7bqDEA5EF3gXWABrE5nR13wZwsBM6kBLx/3NUAX6lUKVegG3hL3w6hXipYyU79PVwDytWJEz6+l0y8PGZrIIDZS6TtD72Bu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558002; c=relaxed/simple;
	bh=9sJdSKrG92u9vy+lohjV1an71OMhes85xynXKk9theQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRsDk/yeavw+LQ+cTIAMjg/yTaN9tQvei4lWchYqXvqJABr4OQ5R21PnaojTIEJze9sKJRy7B5hP0SRfzw6IfMtCHl9XpV1WUUbsVVxvldNmJXxWE3Q72yOpykuUfpHLsCb1J4ZExCvr0C38k0B/duayI1ukn5VlUWlsOx/qyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9O2NG6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrctH7M9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3Amcr913618
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cLIP10R5qZPENwwgn2IodzKT
	zyc56RdXNuD0KpBt0q8=; b=C9O2NG6i5AlJfVZJu1eHt6iMLr/FoEILDpYn8V22
	p2hbp2WScLNC4kgm46m2r7Ij4VwlFNoEpFED8k/hmML+ybl6HABN5JafRVaczfO/
	rrK3KvIpDf6Y5E2FF33gjpQkf9VQUA/hxskh293bvkfZkR9jAoA8CSQDbEka4IvX
	3ka7Qnz/HWJ+4Pxk9jtphVpdpASiWS1R8+IOtElCFPc2GnY/bFAjbrCFGUo/suNm
	q5JXM6x+ELSt5SUEg3y4hthzDkCXnA6kA+VWVEdVmxt2HIqbknBCkZTTqvaA3hIR
	PI0OJva9KrnUXgsRB/lzRg4HYdToUfD5qRBhiBRGFOl+7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2jbkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 06:33:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cc5b548so147114246d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557999; x=1767162799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cLIP10R5qZPENwwgn2IodzKTzyc56RdXNuD0KpBt0q8=;
        b=LrctH7M99prKIboA6v7HbMTtYx8YjQwE9ot1JvJ399FS+OtDTUzbMIFp2A/93qQ06R
         pMfLfOT6hbwQxDPntaiMediOa8txlN+DXEpjgFIc4xTtBdUoIKsL5nSyF3TsNxPq1Mbz
         D8bOuFYsW76XJEiiSiYPZHpRvadWDkP9HxuVrfV9mSfK8NpJQzDy1Ilj8tzwNEsTJBkG
         TNCnrZSJgJjEG68wWdwsoBeTnpkp1WxS3sUR0ml9PJgJTdaYXM09glJERxLCqauuXlPG
         6uF8oHSIAXhduxp88UFUoMHpju88o/9BbQrzyViSjlHisZCa5bb0RAXGbWyh7AF6E7zo
         b9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557999; x=1767162799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLIP10R5qZPENwwgn2IodzKTzyc56RdXNuD0KpBt0q8=;
        b=j0/UZR+vTFgBcp7Ni36BGVsz5A4J9NQEC6qJZQc1kIcCy0aoPHAqp/JZSAbf2MKWdt
         WaId7YIA8uH1IWdPwLWYtlGn8rNkWCS/qLzxtPltOfr8bI5ftUZoxLsTp8+5+JqZO70T
         N50rruC/O0emDQYl5yPzBT8ekGOFCOK5V4pw9ILEDc2oivF/1LMB06WPRALPbAd28tqS
         6ky0bSeWmc11gcEFo77u2ePbDHMIk9ti6mJs5b0vmDR3wHJ0DoVYyF+59LobM11Eh22W
         KyoMCfHGvKBtNC1mCNAs5i9rSplFNnyvaO1yPgQpXL9mDgYBInu4NyLCs7rj/+Jyfwsy
         +Ezw==
X-Forwarded-Encrypted: i=1; AJvYcCX7eWzlG+6mkTzLCa4ltgIf1d9BCJ4Ql7m9+KLzUrE/zde7ArzWO8ecEQhwHtTZDs14gI25WGlJzkXqtlhm@vger.kernel.org
X-Gm-Message-State: AOJu0YzQz2tR6ATjlZyYZuFNOo2+97WCw72GkgtmdYPirTvqt0sVT9E8
	XWU/k5F1+tWqHHYA76nkgzatGJiJK5Nj3KGvDfL/GTDnalX/VC/KB5a0wAAIc9fagTkyYfmAuDp
	YE3wuqypfqdN2KhjiaGIAwpUzI0EPJo8CIMMTkz4zOzlpoOn21q0U0X04LggI0WPuOr+a
X-Gm-Gg: AY/fxX53liss0KYNUFq5ZsMeLU0m3btP8fK6Ey6e7YsoS7Er053+S0aULWx2NWE3Ngw
	sDRWyI3Ss8Xybt6dnC4mHbhw6RSP5PsbES59iwoOLOU8ZLO69ic1WZ4ctFh9JxCyE3qYMltn2Sv
	zybwyMhS2DypVvud6dOUTVnuWUsHei5OIThZ4E7bEfLxKc6hRI7Rr1Fm1bTIiPz1uQljDNGOunD
	SUktTEVz64nU9Cy9Freyzmh5qDkEQoyQpfROrXKhxxwH6Qj9vITxdWxq/QeUCGaMHKh9w4d8lvc
	YPtX4Q8Jz2H3B+ebkUv8L8lQ8z0DN01Hgab8mgzhH5Gih1cHkmQPHu3UHJaUDh/2sy1eWRx4N/0
	Cs41nX+HCp4RlY5AvrrKuyRxm1tuJSZKfq+3+pFGjfYLZPDoL2gye73gTtPiBh0DTUJ4A1KwFXz
	MpS1NDSd8sZl2lYjjpnI+jKbM=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr302365581cf.7.1766557999500;
        Tue, 23 Dec 2025 22:33:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGatEjpfm8ML332l49xMJ93mADIUv34etNyzL9APFRqVHNOW5FuGYf9TgxW4oQ4hlxq8wZsGQ==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr302365381cf.7.1766557999087;
        Tue, 23 Dec 2025 22:33:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122501558sm40268471fa.13.2025.12.23.22.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:33:18 -0800 (PST)
Date: Wed, 24 Dec 2025 08:33:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <oyj4z6agsbzytdmfdxfshrakymdekrkvp622cnf43zh6cyebtj@hd2s3yragq6z>
References: <20251130012834.142585-2-veyga@veygax.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130012834.142585-2-veyga@veygax.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NCBTYWx0ZWRfXxXlYYpIjtFUN
 bghg4aDZaSlupLv3QvhvFoM7ufQCiPimyd8Q2lQUKYQ5uURHZPTlEUGA0NOFuFvRazreKqCxFsk
 cLhXM24AdgXlnT/dMNCo8wFxxQeeW6irfclx2+4RC9QX8eeZtd0IHuiymIIXaQpH38BNIYeseak
 CWKT1ewKyMSnznhronzbdiwtxKUsisB3YEKEIdOAuyEFXCczVrtQ13slOhFNyZ2rmCDzCww10XS
 4+oOmZtsEm+3EZJ8vVJoowctR1au2QLOFvCf9RPCaxqveHZxVU/k4H9bH51fn1TcxSR3EB8J0nF
 5DrwWyxJAl7uMRiutbCnLEPtWsb2tBpou3pqmFmskrbLEn9beGZoMhwWK4Xi6k/C5sLp5fi5ACS
 cZtwwbGAj6e9isqb1aOZuuwARgXtT5yrOck8hwANBDxHyCpQjj8PFl3TaswIblGriZtNNxhw7zf
 zOW4N4Jwx+PVSNfsN2g==
X-Proofpoint-GUID: 5MLAxzFV52Cexam1nxv7zFaF5DqDHsHE
X-Proofpoint-ORIG-GUID: 5MLAxzFV52Cexam1nxv7zFaF5DqDHsHE
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b8930 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DdfhrY3wd40uxI6BB98A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240054

On Sun, Nov 30, 2025 at 01:28:54AM +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> Signed-off-by: veygax <veyga@veygax.dev>
> ---
>  drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

