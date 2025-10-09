Return-Path: <linux-arm-msm+bounces-76678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3BBC97FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC753B5151
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435052EA75E;
	Thu,  9 Oct 2025 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YR8u+Gs/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503572EA48E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020015; cv=none; b=ZN8tXRdlpZNycuT13UamndrFrYXyWUy6pRfWuqBGQLVUm2ftCsUIC3JS8As+/Z1EFQYXy0zkZB6nSMVNxEkXs1ODAbskYHbcjZgyPYScepXiMr9aCP4/0vqgGf2rCs7Ho9a/JyuvX4ySzWz8ZEkUD3DM7A4eSUWBNhkSGL+N5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020015; c=relaxed/simple;
	bh=8hvdupc+LZK/iN+CW4zbSmj8G9FzomotMvequinYfSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSMrq3bQlAe7ZmbRaomnLy8ZqUzb6a+jRUZvS/sKzMXYqYNQ0kwr3ONIEbjJep0ENKpFUExGF6hRGqddoHOJNFreAyqV0Ur+vO7ubG+PNTVZAXnJlauyBvWdzk7W9yAQkeYlgCFUp2BJbfxTD8WWzqIzHAQxV1ldOHcyMvyOV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YR8u+Gs/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EWLV022397
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 14:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G2KvXnwbuscjouOeX9M2xhbN
	j+kin2y5TQrFozgduvU=; b=YR8u+Gs/wtwLU58ZURivOsxW92bTU+ngTcRJDdn6
	ZT/eU6WoX5YaoxxHNjuTJDjBKUj+rqCxM6EdVLaLxxr4cCP984JzbUP0kiKJrEw9
	9uzHclNOl6GuTNUt+7C/bFvMJH37oEAe1qbuDg7eLOuaKnv6h+kJyhgLmER9g8ja
	5hJNLuV2OSVu8yVHQsxnV0W61H2fLrtR8lD+pFyfJZQQ48r419N7pX+Lm81VY3IV
	wKC2GhXO6ORGFm5eoMYHQg31fOyiNwcpObEW8SfbzIJbV/gH2FcGVlTvMVjnm4Nz
	HxI8mDhBhy+Z2hFnDceypl06uTyHHBRsZ/qZYmdtp2aTuQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sk58y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 14:26:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-792f273fd58so27933596d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 07:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020010; x=1760624810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2KvXnwbuscjouOeX9M2xhbNj+kin2y5TQrFozgduvU=;
        b=c77tOkQNk8zeJzEUlY2ZyeNpiw6cFWolEh278SH32rSgqyagOB4RF8RyhoeszUJYG4
         J2tfYn9ZK5VP1+wkUYUndTf1INoK9LHc/2SGqe9fXAXbeLvbuR3q/tcexshpQb3xcI7r
         4gzOrBfJyiXBvrE6J0T0vPjQjD7P6QVfiNFvkwP4LvI4JVqhxNzLN8W1jXODXqfTQoX/
         IevO4wt8yzPPfvLmwFuKj7b5ZqDWA1Td361sY6PwqM/B1xoQbXMC4tPIR7dKxyjuZ9Eu
         rEd35mMogUDeg7+q+OzluiF48qaVT5s+lW9R28kznd0go350PmZnhgIYUItlAk8wTQUO
         qVvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3ROTRDBrd+NeDcyfg0HKZVnNbDDatR+vjnRWi0+lClHtb4RFn54MNUlrjZ/GVhO3eCGoEhFfYUFhrfge@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvo8eLFfvPNSVd7kNPtBHQYHH3xubmoRwxyhMzdVl1Fyt6DPn
	JvOzsYEWm+ZAkMqsy3Z9+AyroBaowml6dnnyzdzTxlEivW4hGian67ue5Q1J4jY3NrSgTRWP2RW
	47CrBtB4mgDKuCJuPWAQrzjf+zp/EKkPxv6+YPgcuQ6ZajIHjsKN3HpS1k2O2zyDj+lnI
X-Gm-Gg: ASbGncvQPrGlwewDK+0SIZ5j6KiZiu6SC++LPKKeglIeXNc3uy2Ub9mRCcLlTeOYcN5
	7PDNsFfLImnQL8R0hWYmGyySJ0ql6p4zWWtN8o0Ffni/BZw2CXuQW7MgJBHTZ2f4Oj6dgMZf5dZ
	bmQup5kvkGm6h5RQVJpMejclksjWSrN+oKcvdZvcANSHfkyDwYApvX3K0KTur+x9dhPdEXYppEo
	JWtoQ6HqrRb7Rsc0q33DVRih1X+3bAlEB0X91nsd43/vfhVTr3wwJebRoaL1FW88zZUiDlZ9GNP
	PeUoNTDNsgITbSmSe+lpyry4ih9hHRUixYRrUcvbiTLPDvKCOOUlZFiClpb/CevKBfbl8AICq2B
	vlU7ADCKEysY7Wbc40pIaGI3EStuCgrgJ5pxb6++Jp4BmjTuqILGRWnlwyw==
X-Received: by 2002:a05:6214:2aac:b0:783:2157:5a34 with SMTP id 6a1803df08f44-87b2f02ba73mr98393946d6.65.1760020007740;
        Thu, 09 Oct 2025 07:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdTWGuZxMQcCYadLFdJmdthwUCJVxPbcp/MQRks6lOTZwcbWtf0yNa8g4UdjMUG53579SmMg==
X-Received: by 2002:a05:6214:2aac:b0:783:2157:5a34 with SMTP id 6a1803df08f44-87b2f02ba73mr98390956d6.65.1760020003398;
        Thu, 09 Oct 2025 07:26:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b63f1bsm28387511fa.31.2025.10.09.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:26:42 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:26:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <3mbngf2r3rvbn5fr4vxbk64ouvm3voo5o2r63vg3clyswnceoh@64r6ujb5qr65>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
 <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
 <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
X-Proofpoint-GUID: LVUfkBLW6i4Z_tywY4Rew5_o7wtqM6OO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9CMpq3YvSWw6
 vPFuN7xsD/3F2Wdgm8UUuo8rWTAj3pmeVanLsqJ2FVQeME58vrgVJxx2IONZU+NXjV2y2ojapGa
 Uae0bQTh2Q+n0jBm1oOUVBJWaBGH92jisu+kuNbtR18POg6SWLf73HqcLvVHfw8okFIXWaPO7Xe
 Ka3P2NIbRZZwV4Vm8BJb4+PAcQlLRwzV904dndYG0qGrw9Q5iY3RcGMTrP/dB73Lj2PZMvjoPyt
 rDQRjBOpBk/g9cW8WpuCMXVga47tnl7SXudX9MZfVjaAQ681cAPJmAoiKTs7eW11w1oJSVoUDtJ
 ED6yKYlYSOfB3YKEbR/InWvecdilyI4NjwLsJwcoBeqw2NJHr/O9aWVeSSxDMkDp0zng5dCh65s
 k+ockHx2Vzc9xss5DEdX5/jdyfPsPg==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7c62a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=df2SJZlNlAcoaDSKSIcA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: LVUfkBLW6i4Z_tywY4Rew5_o7wtqM6OO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 03:32:22PM +0200, David Heidelberg wrote:
> 
> 
> On 09/10/2025 15:21, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> > > On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > From: David Heidelberg <david@ixit.cz>
> > > > > 
> > > > > Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> > > > > 
> > > > > Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> > > > > 
> > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > ---
> > > > >   .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> > > > >   MAINTAINERS                                        |  5 ++
> > > > >   2 files changed, 83 insertions(+)
> > > > > 
> > > > 
> > > > Please also describe, why it's not enough to use defined compatible,
> > > > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > > > panel-simple-dsi.yaml
> > > 
> > > panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> > > just the in-spec DCS commands in mind') panels, but Samsungs are
> > > widely known to require a ton of vendor magic
> > 
> > The question is about the _schema_. I think it's fine to have a driver
> > for a panel covered by panel-simple-dsi.yaml.
> 
> see display/panel/samsung,amoled-mipi-dsi.yaml
> the OLED display don't fit well, but I wouldn't mind consolidating at some
> point, but since we know very little (no datasheets), it's hard to do for
> now. Maybe in the future when there will be more panels schemas, we can find
> a way to consolidate into one big?

I'm looking for a simple answer ATM: it doesn't fit
panel-simple-dsi.yaml because it needs foo bar baz, which is not a part
of that schema.

> 
> > 
> > > 
> > > Perhaps the original change was made with an "oh it just works
> > > surely there's no drawbacks possible" attitude, as the panel
> > > was left initialized by the bootloader

-- 
With best wishes
Dmitry

