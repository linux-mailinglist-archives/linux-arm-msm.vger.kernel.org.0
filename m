Return-Path: <linux-arm-msm+bounces-76720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07525BCA2CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 18:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16781885EA7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 16:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A2D2236F7;
	Thu,  9 Oct 2025 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cqci1QN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ABB204096
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026996; cv=none; b=Z95/F9wB5ds7c2HA5ETsnsZ1VXOjVJ2Hj21Zs+lp/5HCEcwE46v7/BieoFDZZtjHl/lfRfuffKo1jFdKCu9kQEV+wmkmdxZw8wI01OS8m5XwkSjkKvgQipUIQ6tz4zq4rdFDmaoU8cV1Cmt5ef+ej07NjczKw5GlXGH/n2UnBuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026996; c=relaxed/simple;
	bh=E0WUp+SFGkom1xfm7TjoArjAQgZAB0HlkcaNu/zLrW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhzLZvFpUDxX6KLbIXLvm73mL6SApM98dpEB8W91B57KWa6R4EDbWcts0mgwosgqA8KqKrZ325whkzFepDmGLVWOrTRCUszwopoyPK4aLVA3Vr6jd6Z9F0LNT68+fXEbnoT/Z1+JOcBNHEIXaq3CS6riQCgL163gke8CQ5cMW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cqci1QN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EVrii029800
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 16:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bt39X8dW+ZDv9jSNO3RMlOzt
	N0nkdVf4IKuaB0k3nl4=; b=Cqci1QN97/teVcqE1BVo4WyOolpPKOXmhP86rTTe
	8ablEGLhj9fFsU9s985Tl1Z1dMi/kpDskgXb9j1AyPCJWvua/8YGu0f1PFl9aByj
	5/EkUJlKgKzkpjvV7gAcXUmxIItNXXBGbGWz9fz7pbC4RDIGLjbnJmIziaUIajfn
	XsPMG4FSEtXP2iJivh+TkgEihFQMzuyJJkjTRjWqs0f52DIhZhBsSF5oPlpzquCU
	ZjG5/RkpmodNzNLNcEuPtiYDjZYihWa+RieBSkyTxkBSjWQ+Z2JR7/LEEZA9lcV+
	xKm54IxR9QyJ3mLxjWBSX2xuc7ciZ6ql00hGMK3dNtdujQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nbkfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 16:23:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d9ec6e592bso31334371cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 09:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026991; x=1760631791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt39X8dW+ZDv9jSNO3RMlOztN0nkdVf4IKuaB0k3nl4=;
        b=VffcGYZ+WAAFe1IiWoVnfTZNVAt1lyRbstOO0ED8N9hCJ1aSszbq1UUOxjUGD0mnTR
         kp7iGn2SqdT8az6o+DYFatMBMNEYmu4EpwYmigum4o/Hjnpyy0WWz+qxQAFXF6QiEHPj
         Hi+MIlT3SlLXugv2k3lSkrwSK5FMtO/pGmx9SCf6xdpGt/7zqaTiSI5jcAxTX127W4Fm
         E3aJqSWz5/n27LxNW8Ym3co6Mp2HG1HcxYJJeRdoDVQtVAdsiNf+Js4BzzJz1BpwGhFx
         GBVjJ+eGsnJeOMzKvnyICQJz77f9N8RyIm9cAkATpa/S9UddgijBzkwqw82F0bWd09z2
         zdEA==
X-Forwarded-Encrypted: i=1; AJvYcCW3UjYf/YY8neXlQFlBhMuLUAdAIN5y934MifveF9XKFvvFXiY80Ccfgcw+0nAsCOW2N5p1Gj8E4vIzYwu5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1zawVizzJVIVUReKHUS4JsDGh+TDYdxutgxJRVkyfQjglQwZ
	E4q6S3fDm5IvXmCGzzEFvuN8cOx78BSMjAzwnt3ruyj6/+MyqjrphBjZ7GPd7px8xDIVICTP8sk
	hRuPuIgbafUOENv+QrVlK6Rk+Q76+McOttrvABi042g3aZQp6wideN+oiuKzZnnKUVOVd
X-Gm-Gg: ASbGncuvXNFhpe48jVP5U//dAZnEJOetkYhU0qglWflrkbYMKWtbsohugMfY3tfVvQI
	wwY45K7hdeYPt/xRnGDrspGCOrGVufnfLF1sHXjiy6gBSsKpHUvryzyymd8pT7zq7hxJYqS5H1G
	/272HS9Bg6cGHV1a3zBfa8qus8goUJPjNeB5oM1jSYT3qLBESTfAu4eCu0aNHI4pzoLZ5JoseQh
	BPdP+RJFA4G6YAOkFPScSC6OiOefc+i4+UaFpgj/wa7Dmb2uLq/w0JK3Q0LpxuPy1EIWFZKw3zi
	/4nHZ0nLhZHICLB4okZp4xlKwNkOWQaRrszfhVJ0KQYAcArZ/KnGnE4lXXaxiQmnlLQDbCmuGuc
	g2YgCbWXYHmpjO+Fyw/WaQsCLRXtYDENzKCJdrexXPMadlbQ9f6YZA8w16Q==
X-Received: by 2002:a05:622a:355:b0:4bd:f73d:eee3 with SMTP id d75a77b69052e-4e6ead54c1fmr111202811cf.39.1760026991178;
        Thu, 09 Oct 2025 09:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg801ObE8F+R8kZBeMVN+M/a5YBBI9id+lFXKMYLvZEjycOY0KP+OvFKokNNP+wtFnRV298w==
X-Received: by 2002:a05:622a:355:b0:4bd:f73d:eee3 with SMTP id d75a77b69052e-4e6ead54c1fmr111202101cf.39.1760026990405;
        Thu, 09 Oct 2025 09:23:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00a78sm1182099e87.19.2025.10.09.09.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:23:09 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:23:07 +0300
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
Message-ID: <ylnjckdtgfktz4x7tcgy5g5qebpppregubhjn23e6cx7s5w23b@7tq35tvwx2qi>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
 <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
 <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
 <3mbngf2r3rvbn5fr4vxbk64ouvm3voo5o2r63vg3clyswnceoh@64r6ujb5qr65>
 <9018af52-1c81-4d2d-8717-44e5372dbffa@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9018af52-1c81-4d2d-8717-44e5372dbffa@ixit.cz>
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e7e170 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7einrZQClg3FUqyrEHMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: kjeUpr9UgSEGCgmrol-vV2mRIZKoKtBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4r9GQdg7LFl0
 x18zQZBfXYb5rASWFDwZkFfWIlOXPSI4uvgAFCMQg201v5dUjr1zJoJsBydDZb1w7oBkhKRs1bM
 5Rak6R8CmWgaAMXs3V0YXHM+DK1ehT/QihHNuU4k2NxRYj8yoDkmaoBXpSsi+VDSvuTNbezUxDs
 eELhjxrtl5qMbtQkptUEGwesk+06rmc0OlZt8k8QYOYw3lQoRHQiyLTfR3aelD/Qee0BgmklyFS
 ZSZOL5KTYEvDi2KZhmysXlpgkIGNjUDv+Ag7y/vs8pG0IeWzMroY/e+CtQEqvzd9fIgR7uCTfPz
 nSl7/6dMFWUWbEEa/GENOkbcdehRnauP8EbuHImUNIsvR4va1PgmnjW/yvDhUIHnXPUSlyQYBRl
 DFAWayLwK+IM42UzwZgacb/ETkMoRw==
X-Proofpoint-GUID: kjeUpr9UgSEGCgmrol-vV2mRIZKoKtBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 05:44:46PM +0200, David Heidelberg wrote:
> On 09/10/2025 16:26, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 03:32:22PM +0200, David Heidelberg wrote:
> > > 
> > > 
> > > On 09/10/2025 15:21, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> > > > > On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > > > From: David Heidelberg <david@ixit.cz>
> > > > > > > 
> > > > > > > Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> > > > > > > 
> > > > > > > Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> > > > > > > 
> > > > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > > > ---
> > > > > > >    .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> > > > > > >    MAINTAINERS                                        |  5 ++
> > > > > > >    2 files changed, 83 insertions(+)
> > > > > > > 
> > > > > > 
> > > > > > Please also describe, why it's not enough to use defined compatible,
> > > > > > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > > > > > panel-simple-dsi.yaml
> > > > > 
> > > > > panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> > > > > just the in-spec DCS commands in mind') panels, but Samsungs are
> > > > > widely known to require a ton of vendor magic
> > > > 
> > > > The question is about the _schema_. I think it's fine to have a driver
> > > > for a panel covered by panel-simple-dsi.yaml.
> > > 
> > > see display/panel/samsung,amoled-mipi-dsi.yaml
> > > the OLED display don't fit well, but I wouldn't mind consolidating at some
> > > point, but since we know very little (no datasheets), it's hard to do for
> > > now. Maybe in the future when there will be more panels schemas, we can find
> > > a way to consolidate into one big?
> > 
> > I'm looking for a simple answer ATM: it doesn't fit
> > panel-simple-dsi.yaml because it needs foo bar baz, which is not a part
> > of that schema.
> 
> v3 will have:
> 
>     dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
> 
>     Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
>     Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
>     panel-simple-dsi cannot be used because it's limited to one
>     power-supply, while we use three.

Perfect, thank you. If the bindings for samsumg,s6e3fc2x01 are
incorrect, they should be dropped too.

> > > > > Perhaps the original change was made with an "oh it just works
> > > > > surely there's no drawbacks possible" attitude, as the panel
> > > > > was left initialized by the bootloader

-- 
With best wishes
Dmitry

