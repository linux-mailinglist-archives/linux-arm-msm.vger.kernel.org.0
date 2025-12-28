Return-Path: <linux-arm-msm+bounces-86702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C0CE48C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 04:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BC6F300F30F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 03:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E96221DB0;
	Sun, 28 Dec 2025 03:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBwh2Cl6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4s8USQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE721D3CD
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766893720; cv=none; b=YgFt9EiZNCaivlLkO2dBOR9WARIcwYW4uTJMddWd2x0IGYntokjGtf0dijQqNsVX/bg0p4CeEcFn2qCMph1m8nHVoliwnQFyg8ttZ+tTnduv2fd9d/1Ukg31g3qz6xK+D6myAFqebPUDZXhwCMNHZPULk4zAkTcz7grkhTOiZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766893720; c=relaxed/simple;
	bh=EGl0iRWJ4IpJOymN3GybjHNSaQwGT0/XFEGhADM8ahQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=og5EzW4UgKzJWNsECfqr5dT7E+LeXiunkjdS/dw1B9eK9TZ4roeqTXGrOJEmDo23gVW0xCeZXlTjFev31TaGxk42Rg/vGxWdNqzynq3phMWq+K74KxptoyrSpiMgsOHNEY40A6F+PBMlssU0ERqhbdV0KNB60n3duxhwfmLuqbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBwh2Cl6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4s8USQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS2QcZa1658260
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G5ZtyNhbwgn/S3NWbt1gNJl8
	aOXPg2uVBnJuiZYIEQM=; b=RBwh2Cl6gv8S5hJuNG5hcQzUg1oqYqLxV91bNY2y
	ihfJ4XNtZkVKBz0Z4efX6uXaYdB5YvhRCgm7VNu3Da0MiZMwE4fc4m1ukcDmB+YX
	QuYSYrmU1E/KpdTman+FDwda60vaBj1iYpyMICpFH3s9DdJlFi9OTVPN6S4zfI7g
	p2AcfYGCmg2bTnWnaxt21x/wOl5iokjaFr+GUmPP2xI/aaTs6R7ajtfUT4iqBnmc
	DnHxkzI4PaV7FMBcA4vhzv1sbqRf7SJovfjoeqQi4h/uq4ki95n7OSg34GxHpw57
	m5kVVGG+kgbYyGENlWIkLQBD+CXqK/Ag3gmMcC/iMkJxpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bskfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 03:48:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so159966561cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 19:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766893717; x=1767498517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G5ZtyNhbwgn/S3NWbt1gNJl8aOXPg2uVBnJuiZYIEQM=;
        b=W4s8USQrghWyL/m30haqC6pvCqdFCBJdHB7k/Ili14kjYDSMXjEn+1Y6aGyOlctrNE
         RmwYuk2ZAifFsdMwLALtSN3gnCANHNx2OB4QpDW3hQDZ+lFhH8TDOu3wHMzOcql2TceS
         M5khYpQ2adc/dBBPUBMftLKP9f8mRodQPSsiIV4f+Ly2BF3+rLka3jSondM5ANpzOjMy
         +S4Ljj1+L/Pvwdjs5bu0pYNGy0C8EUue1QC5Zv8W/RgAXNiMPVF4M0fwtKo63uzNtOot
         JuARJ8O3eB+dg0V9rk7L+CFaAhsG9EJ08GG49ogoK16ZAZ4GHuYNFH207gOtei3aTH1R
         QycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766893717; x=1767498517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5ZtyNhbwgn/S3NWbt1gNJl8aOXPg2uVBnJuiZYIEQM=;
        b=u4+dOZEuvAUmkH8+UxTVUvTIKyVHFDA3wTOYDEyPRCADfU51wJggVIydU7x95WeRIJ
         bQ94ZAoBx/RIrVCh9r5OdJaSQXW3BeGqrG7ixJV0iTs3B/1j1d4RFrDWogTQ9FSY0DCE
         GqkLo0ERpM9eyY/zK9yn+F+onpJ6GNWQ7V63gxMR9EP81dmbRjh4JtvUUtYgc9tAF+lo
         AqWAGnvGFff81BqoMsoY+IhgIYhskeNUTLlkKW0Xzqq23PZJt49TnJ9xvuX11idtN8fW
         X+ZespJOZEIlgtIc3yGC1oII70uTJKUHx5WvoMxzymsSo0p/JDeTse0fisFAhyhztuLM
         sK2A==
X-Forwarded-Encrypted: i=1; AJvYcCXK6UmhwUP54XWwHHSw7Ev889bpMzYmCB1aPjVGjBHBdh9dnppuXDe8w4hFRPLAHeqlF8j+HvKSfVy6nYOV@vger.kernel.org
X-Gm-Message-State: AOJu0YzyyQLZDfLSTwhZ/r/pN/h3L1PIeP+tCn0gO/HHug51HIp7Pl5z
	Q50bP583uWBM3rYDCSBdBRNDZy+3qtRPBiZaeGh/dEl09o4WGYFlKKqNciNmQa90+8jkWXDkV5O
	HxK/PLgGi+xesb6srKsYwxwBc2mdjLqxFCtuh+t/CJQa9ItMKE6NfcuQYo+p+KYW0MISf
X-Gm-Gg: AY/fxX7aKmVHmd27WthWAUV1ffLVaIdeKWrYLzo0FF28S4HEHhzPjJtyQ0CLVA/9lbX
	tsFd76gJkKw5LGcDXStWGNWZjIwbBPm6G2LIbjfLbV3usY5rQJI/i3ga7yI9OxLFiZxV2jPP2MA
	4hD+h9sVhRHUtFZq6ek6Ll6p2Xtiw98K+4ffogG3lmE7zWFPBHrZMUe5l4MxCEDKRQbcVuzS81F
	u3FUOFvVhcz4OvrhdSGJDvYhN8XfLHpPLPaGSnnetCRScy8wbGi2c85MN7dQQQ7y3n9LpQSvgyF
	pX7GXkJzWwdhPqeql+n9Utp8o3hZdLSe1ud2faBDWx+1FAuGTZxK5ubInXhPGg8x8944rqLbpWM
	xKPVD/+7XYKgJpz1PqwXHB4tsmhNwsDNiJomC5QWWDEFlrAw/AUGeYraui9a0P7q94faP7aiIVE
	377Ko9w22oaA0wW6V0Kq/7h4E=
X-Received: by 2002:ac8:5fc4:0:b0:4ee:ce1:ed8a with SMTP id d75a77b69052e-4f4abccf0b4mr376484031cf.16.1766893716860;
        Sat, 27 Dec 2025 19:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWl5R2B2w9eNeTAdexpt9iS61TBLyp3dSOAsh42BGWIL7uO3Pn0K3kDuZ4F2wO6bCoLEUjJw==
X-Received: by 2002:ac8:5fc4:0:b0:4ee:ce1:ed8a with SMTP id d75a77b69052e-4f4abccf0b4mr376483921cf.16.1766893716473;
        Sat, 27 Dec 2025 19:48:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122680689sm65495831fa.44.2025.12.27.19.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 19:48:35 -0800 (PST)
Date: Sun, 28 Dec 2025 05:48:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Message-ID: <dxtktuo2evbqibblvnxejkex2em62jkbhcvnwxn7iy46me7msb@5scbwuow6stj>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
 <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
 <aUwhqUlM3WBqQwZb@SoMainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUwhqUlM3WBqQwZb@SoMainline.org>
X-Proofpoint-ORIG-GUID: mSc2FhjJmFRohDI7X5xsL7mDRsx-oGob
X-Proofpoint-GUID: mSc2FhjJmFRohDI7X5xsL7mDRsx-oGob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfX7iWW3Qks2+rB
 e/fC5no8bu/DfTCOwf35nQeqJRNwUQHmcltuwR5ePt/UTBbyaJUXZUwn7zIj7GT6vWXMEqVq06D
 7BIAkYJMKFD4IuOACP6F3dAwaDhhp6IDj9/AStcz/RDejVY6IXEj5XcOGfdO+uNUBgvKyMuScsj
 stXDFHxkbRg10Gg11JnUjR3s7Bt6HHhMUvCTo3l6H8kjjbEhrl/Umm9W2z/oWHaV01FBtU5SgA8
 QacGiF4P5d1JsrR75OnYpSuY1wYQL37/6B4wM4bkn0OJqDZf/sN7O5iUnBWaLSFBP+aRCG3XvUo
 QECCG5rSJ4k98hbBwUHtt1QmeGZKfhBJbGiwb6dn/w7KF1Rxw0/BTL6EFa5twAEnubSj4rPzq4+
 /DO7KrLsB4KVbMUVc3Ar/cjDIt7Nzi7+QxbG8T4ZouM53M5qxAnwY2uPCam2a1P80iXTJW+l6vX
 h9kZ9w8xweUJW9B9JJQ==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6950a895 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=djJBbdDc_AO9gVaMYpQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033

On Wed, Dec 24, 2025 at 06:26:59PM +0100, Marijn Suijten wrote:
> On 2025-12-24 17:33:49, Dmitry Baryshkov wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> > 
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> 
> exectued -> executed typo remains since v2.
> 
> > if MDP TOP implements the setup_vsync_source() callback. However on
> Double space to match the above, on two occasions:        ^^

I've changed all occurences to 1 space.

> 
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
>               ^^ double space too
> 
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
> > [DB: restored top->ops.setup_vsync_source call]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d1cfe81a3373..0482b2bb5a9e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		return;
> >  	}
> >  
> > +	/* Set vsync source irrespective of mdp top support */
> 
> I still think this comment is redundant, as mentioned in v2.

Dropped


-- 
With best wishes
Dmitry

