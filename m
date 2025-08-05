Return-Path: <linux-arm-msm+bounces-67734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29105B1AD78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 07:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68C13B4032
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 05:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465431E5B88;
	Tue,  5 Aug 2025 05:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvfMhJFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21B2AD0B
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 05:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370446; cv=none; b=ez3kF6Z99MsfJJMvS3yWyt1htZ64jvt/8vWnvo6BSAdn+1WNY2QSNl6u10qOyiF/YmvPW6rXdyTRwzfYaJlFqPKiW+pJ2iIez7Lb/qgw0pkzeydzrGGFiIDw9vHKDeNoSAijrx7AD4gwTq+XtALgcthnB0nbtrUVAInpr4KewX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370446; c=relaxed/simple;
	bh=LWNz5BB8AB01cFChT1rd+gSO6AFmS23awzJOhwjdfoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0LkKwWDxub73PcQ20qqmQ55YwGxnLIdAigcepyL3ARVCZB0YRisQo6zQvF88IXPXdOPSDukKtFScNz7W3NgxM23rxocmqb41z+Ur2v28rEd/5DZBpzBhyPCxxG44WQkZEHju6fG30OVL2kYwRISAGhG7FjiJ1sONDidME1Ke14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvfMhJFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574K3HxD003252
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 05:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGDGlIBOS8QFQQwkn/fuebKk8DgDBz/tM3/dLliE5IY=; b=lvfMhJFpd24bhbTP
	O0kG2q+A5fVGCkz3i9v56lGSGUPn8WnufnbPMlvV5MbKP57W5QtOAmWlaRmEBpao
	nSKDSuh8YmLPKjb6xMP+/Y6JFgsLDYIld9SJc3BZszmXWt34qD0hzAZIMyKdy4v4
	/zWjAMprFk9X2vSrNSKCNzfEMqIbqQw6/ZSropEZITO3K7coDCUoRPmnPSIWLCJm
	0SbZYz2l/2ZutflB8CkZN9UACsZ4A7JNNyc5cTXVZySLVkOVoyT0M/RcjPzsgpcW
	88eNv1NJOeFvXWtEMFRf2UREtFg4biDamrXHki0+PnxKHyErxtwsIBm/+z+ysfOz
	hZrJSA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3s3fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:07:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073f12d546so113296356d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 22:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754370442; x=1754975242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGDGlIBOS8QFQQwkn/fuebKk8DgDBz/tM3/dLliE5IY=;
        b=VAo78H7KeZWErxwwEwyeo8lywo3F46U73aJwTUcqoi2KOHSHDHOydRcjvaYgMiKt1k
         79EduCC2/ZWrquJggx0YwaFUnFxabOHYfwYC1Gcz1H1CCH370H58zP5Q5yi9OzvxwJJ3
         xZNKdnBHv+GX2WH5DINQqiFspljPkA0Uf3tIkf4kU6mhDSEqv/10h/rJ3lRCumYdtVJB
         +5P0HHT/id9eYMyna0UQwt6JowxQskywtW55PxLFX6cS975dzC7zSXPfTs+QVT5vaD/K
         7Zynaq63Ap+8AhGptvDoEf3TJ3z4EGRYdk1kK0DTf9enmTpz498Ccc678YNtnGbWyE3r
         fT2w==
X-Forwarded-Encrypted: i=1; AJvYcCUqBURrYKSjL7xnExfgG+xxxctiFRLcKOqxs7sjoYjINiotrq5AwhjzvSmxlla0RLx11HZwgYGJkcBaIeJm@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5ywBFDGdctcPqHWXdtUejXFR/Ed1b0aNXl37x23lFQm2mO3z
	4m2qTahZESKt4MzP0GvPEXuJSc2h7OR/b1ZKw9XV+v3spFEk2qxxJBvoGiJ+ZkcqiJM6JvKq0v6
	Pz4hbjs8MaHBSeUWzeAWFlCf6cZ2uum17vwwRaGXWq7PcXj2O539Jw9/QQPDq76/kWAhR
X-Gm-Gg: ASbGncuk6OQje+7cFqEpAz+vLRwpe6vyeb1iLgdDi9CkHZ5282amnN30OAxAS6Uix9L
	7elKgTt9/opw8116U3qKgC/seLIvKC9Hf29h0g02UcKipJOuoeAKM+jMGdXNa0PPrXTu/+UIeMG
	63Es020FqiatxesOQRcNTNCowx+0mMH1mtgTDln4m1eGsfiu/0ujMUs9aRNP4CbSJb/0sQVLcGr
	NMrUoU5y4EqZixjVsHi250zBNe75XoqTUvD3Fl7byNdgQVzSYBaKQcqveiGqWrGZZA1ReUv8ZUY
	AD0T+h1fyq+5oHQj2jw3vKG42HkNhNoPZ41snKH3Jw68k+7euIpwn6T0ZLQno2tX9+Mfi6wD61V
	KKDCCv+tukHq8tu/YDQd6sOWGBF897g8al4OkezXuFzJSVP9iI+29
X-Received: by 2002:a05:6214:4015:b0:704:9b5d:ef4b with SMTP id 6a1803df08f44-709367094c8mr164062856d6.26.1754370442556;
        Mon, 04 Aug 2025 22:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN3RBZkH/ni6lalhr3Yl6Hm5Hxp8OvzmpE/5Ch5pnBaCVPtzbmvTCMAnzgDBAbFiiWNiQ4yA==
X-Received: by 2002:a05:6214:4015:b0:704:9b5d:ef4b with SMTP id 6a1803df08f44-709367094c8mr164062496d6.26.1754370442018;
        Mon, 04 Aug 2025 22:07:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cabb7fsm1838792e87.146.2025.08.04.22.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:07:21 -0700 (PDT)
Date: Tue, 5 Aug 2025 08:07:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Christopher Obbard <christopher.obbard@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <kg52pqpr5ygfw3usru4z5e6vniqiexiewyplpru433tilvwyzi@stwgmyxie4k7>
References: <Z-pTcB0L33bozxjl@hovoldconsulting.com>
 <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
 <Z--eRHaYw_vbgK2f@hovoldconsulting.com>
 <CACr-zFA77ogDSNEOGd32Rdh3geqkL25T0BKtNdKzUdjrL0+9RA@mail.gmail.com>
 <aCw4EK_8C1KLb6MD@hovoldconsulting.com>
 <6612cd14-8353-4d3a-a248-5d32e0d3ca23@linaro.org>
 <CAO9ioeWeQ++qSaD5ukooqBg997=1pwwS80NHD_xiHz25ABmtXg@mail.gmail.com>
 <a9df2561-95d4-47a5-b5df-5874b71937a6@linaro.org>
 <5d86adfd-e16d-4072-b5a8-4f128a2c9adb@oss.qualcomm.com>
 <aJC0GLAeGneb3WFR@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJC0GLAeGneb3WFR@hovoldconsulting.com>
X-Proofpoint-GUID: qaqfyqK9mAglyVyuVzqIugYjou_nF68K
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=6891918b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=NwXsR5GU8CxyA_XcHSkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzNCBTYWx0ZWRfXxjH4Z8cdjJSz
 yNNd/5vFCIjiEmug+te/aWdQSJ3X6kig8dlInLMU4Iv4QTbnu8stm32g7Q45xQEj7dcR78JnItG
 xBZGGcTIHpV835hFk0xvnyrzz/Y4Oj8iZsHOjpuSAVpRu6XgBnS0ZVncKl4c2ffbYEcxGYk4144
 DBjypqGXEQMns0tbltFgqUxcw6CQpeJV5gA07g45sEci1vsW4wMnVEIU2i+1JFV0TLnL7WBb04G
 V/uQ147bYW5SALbH9iA5TBMewuldpo7uxaVTgs08FXZXVl79kbqXsdy062XiRVKMD1Ov3j0g8+F
 2N80ddzurzcPHaR9Zf/Kc3JcoYgMFKnMpr9nkBAkUwvQ5llZG075PwFjpqjsEu+LnRouR1jGJ6Y
 jOBZZsCilNMam9tw6zqQxdPzUaor41fiwZ49bCZCly80RI0yAuSG1SUJR58xtuyaSJq06l36
X-Proofpoint-ORIG-GUID: qaqfyqK9mAglyVyuVzqIugYjou_nF68K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050034

On Mon, Aug 04, 2025 at 03:22:32PM +0200, Johan Hovold wrote:
> On Thu, Jul 24, 2025 at 02:09:10PM +0300, Dmitry Baryshkov wrote:
> > On 24/07/2025 12:42, Neil Armstrong wrote:
> > > On 24/07/2025 11:32, Dmitry Baryshkov wrote:
> > >> On Thu, 24 Jul 2025 at 12:08, <neil.armstrong@linaro.org> wrote:
> > >>> On 20/05/2025 10:06, Johan Hovold wrote:
> > >>>> On Fri, Apr 04, 2025 at 02:24:32PM +0100, Christopher Obbard wrote:
> > >>>>> On Fri, 4 Apr 2025 at 09:54, Johan Hovold <johan@kernel.org> wrote:
> > >>>>>> On Fri, Apr 04, 2025 at 08:54:29AM +0100, Christopher Obbard wrote:
> > >>>>>>> On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
> > >>>>>>>>> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct 
> 
> > >>>>>>>>> drm_dp_aux *aux, struct drm_edp_backlight_inf
> > >>>>>>>>>         }
> > >>>>>>>>>
> > >>>>>>>>>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > >>>>>>>>> +
> > >>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
> > >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > >>>>>>>>> +     if (ret < 0) {
> > >>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
> > >>>>>>>>> pwmgen bit count cap min: %d\n",
> > >>>>>>>>> +                         aux->name, ret);
> > >>>>>>>>> +             return -ENODEV;
> > >>>>>>>>> +     }
> > >>>>>>>>> +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > >>>>>>>>> +
> > >>>>>>>>> +     ret = drm_dp_dpcd_read_byte(aux, 
> > >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > >>>>>>>>> +     if (ret < 0) {
> > >>>>>>>>> +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read 
> > >>>>>>>>> pwmgen bit count cap max: %d\n",
> > >>>>>>>>> +                         aux->name, ret);
> > >>>>>>>>> +             return -ENODEV;
> > >>>>>>>>> +     }
> > >>>>>>>>> +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > >>>>>>>>> +
> > >>>>>>>>> +     /*
> > >>>>>>>>> +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > >>>>>>>>> +      * If DP_EDP_PWMGEN_BIT_COUNT is less than 
> > >>>>>>>>> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > >>>>>>>>> +      * the sink must use the MIN value as the effective PWM 
> > >>>>>>>>> bit count.
> > >>>>>>>>> +      * Clamp the reported value to the [MIN, MAX] capability 
> > >>>>>>>>> range to ensure
> > >>>>>>>>> +      * correct brightness scaling on compliant eDP panels.
> > >>>>>>>>> +      */
> > >>>>>>>>> +     pn = clamp(pn, pn_min, pn_max);
> > >>>>>>>>
> > >>>>>>>> You never make sure that pn_min <= pn_max so you could end up with
> > >>>>>>>> pn < pn_min on broken hardware here. Not sure if it's something 
> > >>>>>>>> you need
> > >>>>>>>> to worry about at this point.
> > >>>
> > >>> I'm trying to figure out what would be the behavior in this case ?
> > >>>
> > >>> - Warn ?
> > >>> - pn_max = pn_min ?
> > >>> - use BIT_COUNT as-is and ignore MIN/MAX ?
> > >>> - pm_max = max(pn_min, pn_max); pm_min = min(pn_min, pn_max); ?
> > >>> - reverse clamp? clamp(pn, pn_max, pn_min); ?
> > >>> - generic clamp? clamp(pn, min(pn_min, pn_max), max(pn_min, pn_max)); ?
> > >>
> > >> Per the standard, the min >= 1 and max >= min. We don't need to bother
> > >> about anything here.
> > > 
> > > Yeah, I agree. But I think a:
> > > if (likely(pn_min <= pn_max))
> > > is simple and doesn't cost much..
> > 
> > Really, no need to.
> 
> It doesn't matter what the spec says, what matters is what may happen if
> a device violates the spec (e.g. if a driver triggers a division by
> zero).
> 
> Always sanitise your input.

Agreed. I hope Chris will now post v7...

> 
> (But there is no need for likely() as this is not a hot path.)
> 
> Johan

-- 
With best wishes
Dmitry

