Return-Path: <linux-arm-msm+bounces-69179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44DB26105
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97A9C5663ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FC42ECD2F;
	Thu, 14 Aug 2025 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBLjGASS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF82D63F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163638; cv=none; b=LbDSEm8rOU6XFLFN6ntWJDwy2rs5HSy53dP6LViLN3jHToTjO92iSYM18EIJeGj+fCNDMi+gcxaX954flQ48LY7I8k3BOZNL3MZozxVnWf23fBN0LODMz4Uwnz5A6bOlIbtFgYbElR1LUqdTs7KaCO6P/M1YtsQ/zIVgoHSQJgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163638; c=relaxed/simple;
	bh=WyOK9uLeBlvzO0w6/3VCi9t0XrcdmhDRVNlFrc7JmHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNSVJ9ZTtJUF+SYVamDsJEw1tD3Rpm6FiPFg4MahCjv+wGVR/Mt5oiyPOyRHjRNYktVuaFlk+1GEy97qq8kdTrnamRMG/lgh7aWHIEz5BeGgfDC54wHangUTcWRNbbgmb4zCnpt8EoVPkhrK/eL2a6ovUNzBv9HCJdnskUIRd30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBLjGASS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E91xl0012072
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zvxCWSRBlZv5hDIRk34myOM8
	a1Wew5iutKQ7yJWvhmc=; b=oBLjGASSkhi5Jx8pEoMRu8jNPs+eaB126S8Gjm3X
	KdDVYScRqmwQidLE5b7vEvkYaf/ckR6NA4AXwrJhSayXjTcSUyQbXixsLFGHHS1V
	kuTV4/iOsA/Um0A82sgfwGsAk1wrV0b6MayHVJNjms8MT9UwJAz/wivsewOl4Cc0
	vVZmFIN420+NFp7rHESUjcGEciqdNVlTZoCnumRrAPm7h7arbtwyvCFM1Tb4Ic2r
	G1xh69Dlz5YgN7xB6gnnj6YGzb4DQZ9jqYUact+8wsaFULzWEDyQFEFsaZemaQWH
	0E3pYh701SdXkF2SRrR+XJdHZoA53rKMYFw60QARpr6b6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbja40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:27:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0fa8190d4so47926761cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163635; x=1755768435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvxCWSRBlZv5hDIRk34myOM8a1Wew5iutKQ7yJWvhmc=;
        b=ddws6xabKu/BSCbyHYg55KvIF/vjLhiCyCpdjb3fMjjARIWXqaZs9gvYiCuWjKDrAV
         QGxBVTEbC5w5Bm4GUYE8zqvoUbZR2ZCIU2Y8W1bqqFlEA+dpPPZVcBLdol/wWFI76POT
         Zgm8hq6n4tOqiGWi4MsxiBFqg79TRlqEbI1pvP0gbw5oJEoj8/CLwEWRl5yyrf1oP/30
         sOhuCQl6NA+djwt3RSlaTAYU0Sya7O0kZP7HPWJLxhqUrCtN9AnDkdETdceO4Y+QsyL0
         KYbzzq95W+XuK6ethD8rZfTLTylA39+P1zOo9AQIIZaby61yi1xViqpb7wd6xZJViuJU
         SziQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNuhDN6W61EK/0jBiT/Elqo86L4yU1248xHDgCbFjI1CgBsB/Hrlm4aakwBPx+coTwR7NZz04TOShUtw/r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VpK6cmYRLvayPqgsJJMltDtKgek9wrihAvtgv7SIb6E/3WpX
	t7gHoraWGqOm6eC/p5Gq7WxjVjNacBBMcGb1Bn2FBGf1EY8AqR4NBSAkdT6ioFpJQR4JqzrfYsP
	9EhGMzhIVZdjwpX7D4BmvHz/xEk2Gv889Ue8yRn0FaWUlY2Kp7fupj92doUv+GsbF8ekE
X-Gm-Gg: ASbGnctjPQgk9I2JfN9n07fKl3k2j5Oxnkw0cbW4kUK3faqv87F09VszmKtT3SzPBW+
	3kJ99Y4nYI3c45UkIP1Qo6Mc/pCGnvy8VuCclu0iHEWhtA2nrpxw5niYCQEGBaB9qmENOi3JnG0
	5SAQgmhngixJ2RNX+UJXDFSx/nmRyvcbOx+E+7Juu5IHge0xAE2H114i81DYkNX/DFtumsYPf5j
	4Ljg9hQSMElm8K24TNWcaAz20RrvIGaeytJFL1kuKnHociXX00m2rk1L/4Wy/eEfRn7BEc3JERZ
	RHYm7SdHtb43334mEvRhXU0va11JvviRxD+5GfvxtroZgNfPY7edunBGtndob79/2Ss1eP5ZISk
	CJ2mzaSVgDBIojFqSEfGIqAbeQ/Sw5pBQA4AMzE7G2TY0PAHqLF2o
X-Received: by 2002:ac8:7d8a:0:b0:4b0:69ef:8209 with SMTP id d75a77b69052e-4b10c03f7e8mr20699891cf.26.1755163634732;
        Thu, 14 Aug 2025 02:27:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjVvw/Dh9L2WDNaCrSVxcKNewmCQ7QcEKe6lAOLf6M3q1psXddyfkwfj70vcyEZ6Y9oS9JQ==
X-Received: by 2002:ac8:7d8a:0:b0:4b0:69ef:8209 with SMTP id d75a77b69052e-4b10c03f7e8mr20699641cf.26.1755163634235;
        Thu, 14 Aug 2025 02:27:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8cbc6f4sm2275421fa.9.2025.08.14.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:27:13 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:27:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <pbbisppntd7fntghbjbyjmdvbxqc7uux42kiuryau4trgf3w47@4d5fi6zpcdf5>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
 <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
 <e3b5721d-cf37-4b35-9851-5e822fa16c09@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b5721d-cf37-4b35-9851-5e822fa16c09@quicinc.com>
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689dabf4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=jWxsxo1frd0NMcvgwksA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX4JIeJ3uF1/fJ
 PA3STB9aDLs6ATHIScOLkVfg8qrsSsrG4W9NauZaMlLduW0P17PGKFj17e8+5CP/aEWyyvxYvD0
 uukoE/1aTkZ+TgYGp7IZWCHQW9RTKkKEYIrRx5JXEGrAkbGNHgO2v1yDPmGYFyUy6uBqq9BnSbs
 07KwBXnRH4jyMSdaNftJGxtMJhuQUx9C3pNlYTtx1q1RmipFG0bvPLSneIAm1O5OgbtwBcZINS/
 B1VaepVH9or71xZZJouyZPSISKMIUSTy0UUr+oX7SUgD5EoBCSrlPYE8Lqj9pm866/Ach5hIAck
 xirYFdSRx0TUa3+DIEcjz+vx/1/NpRSZXScylxtkcfoL2VPp2AhloFXOOh1VhGv2bojglNCcCVA
 XiJTy639
X-Proofpoint-ORIG-GUID: pF6wDLNrkHZCEXPB4enAcWLQXh1YKL1f
X-Proofpoint-GUID: pF6wDLNrkHZCEXPB4enAcWLQXh1YKL1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On Thu, Aug 14, 2025 at 04:22:44PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 23:58, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:45PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > For MST cases, EDID is handled through AUX sideband messaging.
> > > Skip the EDID read during hotplug handle for MST cases.
> > 
> > Why? It makes sense to read it during the HPD processing, ping HDMI
> > codec, update CEC info, etc.
> > 
> For MST case to read EDID. we will use drm_dp_mst_edid_read when MST
> connetors .get_modes() called.

I see that other MST drivers indeed read EDID from get_modes(). The only
issue that I can foresee is the audio handling. We've discussed that
some time ago (for the HDMI implementation) and it's generally expected
that we notify ASoC (and provide ELD) from the HPD (detect) path rather
than the get_modes() or e.g. atomic_enable().

Note: AMD / Radeon, Nouveau and Intel drivers don't have this problem
since they don't use ASoC and hdmi_codec ops.

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	if (rc)
> > >   		goto end;
> > > -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> > > -	if (rc)
> > > -		goto end;
> > > +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> > > +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> > > +		if (rc)
> > > +			goto end;
> > > +	}
> > >   	msm_dp_link_process_request(dp->link);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

