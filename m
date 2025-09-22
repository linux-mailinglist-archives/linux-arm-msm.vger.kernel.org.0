Return-Path: <linux-arm-msm+bounces-74481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF64B939D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BF071889175
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 23:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DE02E88AF;
	Mon, 22 Sep 2025 23:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3W6ofxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D9286883
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758584398; cv=none; b=CS7yB7erTuq7+NgDpy6szdjDY2wH+udKJD+YGYL85RhoKB2peA6OXuTmJVWgewHzaPNe1ASlj5O4f0ggTsGLVzjBfgLxgYAD2KXORLfUBfHnsJ8fBp4eptpfqpUB5d9AP0kEd85XgobUxRvRN+zxNGd6zJRTvE7DC1wX+ELe77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758584398; c=relaxed/simple;
	bh=00DvaK0h1Q9OJ62waEECpyMZZI+tqk1Cm+zAQuk1VsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBWmme0J1sa7biJCeiA7+c+HWIGcoGbhrISrVuZMCDQ/1WYsC3Ki9OoQnY3ZeRMXm9bIgKkE3eGsbkC+UBtY2/mhv0qYDeC9Tm3OkCvbHvPC8OE7iRw+YrKTpaTBzqvliH8qfzFi/nRL27wLwsirXkCgeskRVMBHXfj43w961Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3W6ofxA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MH5NGv003227
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nyhMdld3iRwlOfrrEDiEApYehLCv9Ntzp5VmwS0Yvcc=; b=D3W6ofxAWgqgKf9U
	ektTvLlg9+CI08ZNS9v2rTbGb4dWAJZr4z5TO6J+XBcpEFCJyZU09pZ7SPaqpNtj
	Oq/wybhLS+QOt2Zly/SnQpdbDVtdvDtXGiyWuh5cN9/OT8qx3H6h++ZllUAIaKy8
	i6ND3+wi0UMs9UxFX1uDEZ9oknTZWREMtrm3T5KAyZeWHT+qRbqA3SrB1ChAoII5
	Ikt16RUh1dsBoIRh4NY1DSzbzs6FfCFeqrCHf9tzMevSzA4fyDA/f0eZHhZwKpXR
	ECE1TgkJxCqtDZAqeF6sRHfAnqwGi0n9H6KRQcgGqDPwBMiwoMsgleo44NNYJ6D0
	XGGRcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fee8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:39:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-79a3c16b276so70117706d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 16:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758584394; x=1759189194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyhMdld3iRwlOfrrEDiEApYehLCv9Ntzp5VmwS0Yvcc=;
        b=cLNJ/OKzFg1+Owo8m0FS9NDq72el1vsqD4RLyS+9usfLCGnSHuwFohY3nJW9pEKawc
         MORctRygsequbIF4hrCdvx8OlwVFZDYsl0UIsRdvc7ZrS/4mrV5zZpuhW1byvsNHeCHb
         GHG+dLTlcK4SK2CDSHqbPnnOLSXG3LpWVyzToJXsafb0gi+01N65ccKFIj0YFVIsUdHv
         BJCzh4Yo7cQkAV01ZGuBDDvIL5XEDwmdLji8gIiMLsBZ2pAOQVH8gRlUqHp0BgRi8u88
         Eh8Zvi4vwKzusAJi73pbFNYKlzE+1gkcLji7U6W1OQKKvtMbulpaxNU84El0HACwgQh6
         3KpA==
X-Forwarded-Encrypted: i=1; AJvYcCVMHr/mF1x45U4uImvHuNzJPt7nAYHLXvdMVw00+3GAyox1oT03GqyyJrnAAquGqjkXhxO/rzgLk1CRhvM3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yMGSHL8EpjlJQvFqn2MhiuEeGmjwX/Z7gUQWyCR8KHsx4AjE
	UosYxTUckl+LsjzqOfRtux5UCJLc2KYpe/PhgVHYYCWjixjB2+EvJiyc35Fx6CmIvSku6yfrKle
	WrebG2bm+pEudjl0FJd0n6HczqRCwL4W2D7D/1YSClR4y48lwZMYeWkKoZnnDDblqMhik
X-Gm-Gg: ASbGncugwoBcmeW40emhLKUEgbKu2CumwZwEjj7brHokJvuSf3KOsIOLEdyvOwU4jTU
	GS3t5UnL7U3Nbd2g0Q+GNLLIpC5vfKEc00IME8ILZXgFFY6+luvj668MyPB7t7Xsrx/F6jB5MeI
	wy+XXb+jqyeiowzBm4czLRHe0YmH+9jsTFlyFxabnsMY6IVS+wr3RMnnxaOUiNVM7lFxArkSI6t
	hBa7CIOvHGBbX5r0BP88WUMUjKRAwF943/1CTtitrtIjRqebscKgXoQPEZQ1+eBaegP5J+txCAK
	u4W940Nh2co3QUMZa/QybcFoIiaKqNJw6Pga/VeCgllW9I00+wU6InpnZMClBNzNHOovbvb9+jr
	oBXvDQt3UcskXm2kyAgNEBKw4SZboZ4ibOilDh7B8BlWxaCYGC4uL
X-Received: by 2002:a05:6214:d62:b0:783:aeed:f591 with SMTP id 6a1803df08f44-7e6ff32ee4fmr9470266d6.11.1758584394111;
        Mon, 22 Sep 2025 16:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjwGj4dPuDuQgAOpaSc71GX0OUwUXDROsU0ay7TcyRk+yHVyKF7m4w7U22p4wZjnkRg5+6gg==
X-Received: by 2002:a05:6214:d62:b0:783:aeed:f591 with SMTP id 6a1803df08f44-7e6ff32ee4fmr9469836d6.11.1758584393538;
        Mon, 22 Sep 2025 16:39:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57c5687103fsm1861749e87.52.2025.09.22.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:39:52 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:39:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <t4x7okzjvh5ltyoniwlreoyy76735igtnxpeohpbojn4hkqk4q@v3ayfjrkez3e>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
 <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: xfBhhDNPIinZaEOKDZ8Lx_QIKWmiTBoN
X-Proofpoint-GUID: xfBhhDNPIinZaEOKDZ8Lx_QIKWmiTBoN
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1de4b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yZMGBzM-AMQHzKZg3z0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX4Q1p8bZecQ+h
 piz+FNJUOhV0Wu7Kk+/OaoTvOllGVizy5EKr+964wkkdpYR7iLIAwaHpvr/BBGjw4ky8lJz/wMK
 u0m8OB8VDXhdZsMchtxXZf2Poq4j0OAZy3HO8Qe9m3pGRWMDYrTXaI1l7RC34n/ZYi2A1gO91B+
 wwmXLOY8Us6Fqv55g4LSMTpdTmzl3D1CyKjsc3X+Q+bIlcJm+w3PsOUCvQozjaI1ekcTkMQ4ba6
 U1WXuWa8ExS6gDSNC8WgUVi3cnlzcTJ67xnkz7+1pX9qm1qBz6+gzcgQvKp1CnSZ8jEWOa9GV0E
 4KHdlqs/bvlDB1ZRx7GBvcQC+0KchgO+Y7IukqNJWAC2UZL7lrwS7Fwva6OdVztrcCz8FRsko3f
 T2PpfzEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Mon, Sep 22, 2025 at 08:13:00AM -0700, Rob Clark wrote:
> On Fri, Sep 19, 2025 at 11:35 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
> > > QCS615 platform requires non-default logical-to-physical lane mapping due
> > > to its unique hardware routing. Unlike the standard mapping sequence
> > > <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> > > configuration via the data-lanes property in the device tree. This ensures
> > > correct signal routing between the DP controller and PHY.
> > >
> > > For partial definitions, fill remaining lanes with unused physical lanes
> > > in ascending order.
> > >
> > > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
> > >  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
> > >  3 files changed, 66 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> > > index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > > @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
> > >       return frequency;
> > >  }
> > >
> > > +/*
> > > + * Always populate msm_dp_link->lane_map with 4 lanes.
> > > + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
> > > + * - For partial definitions, fill remaining entries with unused lanes in
> > > + *   ascending order.
> > > + */
> > > +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
> > > +{
> > > +     struct device_node *of_node = dev->of_node;
> > > +     struct device_node *endpoint;
> > > +     int cnt = msm_dp_link->max_dp_lanes;
> > > +     u32 tmp[DP_MAX_NUM_DP_LANES];
> > > +     u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
> > > +     bool used[DP_MAX_NUM_DP_LANES] = {false};
> > > +     int i, j = 0, ret = -EINVAL;
> > > +
> > > +     endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> > > +     if (endpoint) {
> > > +             ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
> > > +             if (ret)
> > > +                     dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
> > > +     }
> > > +
> > > +     if (ret) {
> > > +             ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
> > > +             if (ret) {
> > > +                     dev_info(dev, "data-lanes not defined, set to default\n");
> > > +                     goto out;
> > > +             }
> > > +     }
> > > +
> > > +     for (i = 0; i < cnt; i++) {
> > > +             if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
> > > +                     dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
> > > +                     return -EINVAL;
> > > +             }
> > > +             used[tmp[i]] = true;
> > > +             map[i] = tmp[i];
> > > +     }
> > > +
> > > +     /* Fill the remaining entries with unused physical lanes (ascending) */
> > > +     for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
> >
> > Nit: i = cnt, j = 0; Don't init loop variables at the top of the
> > function.
> 
> These days we can party like it's c99 and declare loop variables
> inside the for(), instead of at the top of the function.  My
> preference is to do so, unless the loop variable is used after the
> loop.

Ack, works for me too. I think I'm not used for having theese parts of
C99 allowed in the kernel.

-- 
With best wishes
Dmitry

