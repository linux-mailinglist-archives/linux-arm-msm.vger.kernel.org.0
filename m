Return-Path: <linux-arm-msm+bounces-74442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED23B91DF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 17:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E17532A4CB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6602DEA94;
	Mon, 22 Sep 2025 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ch1JZDV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD94E25F7B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758553995; cv=none; b=ZaCvhTkomGdLB+XUak52pz97kiKGzYUzfOftlSc0T8lxLIwbxBfrMp2mCPVkHhgXUmlkVFV0hxxGqgZ9DKK+O8n0VykgZxSkFWlUld60JXqoj8MQqYkS1HIbfb1t+q3CxC1LFYLJOLUPpTAMG1d2PC855Y+bH7gkBouokathE7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758553995; c=relaxed/simple;
	bh=B5uTWUUwwDMXefPUA50NB4QAahXRqXQpp9CStVZIpOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOSnV2VNZKmEiBnB/O1pfr79XKcTpYbgIyWi1wblim2dSP1jFMSEubREovcn+SV4oipY5iFBSlmr86Thkt1ZS3iRhq1hCWeVqKowLAM455Ho6iNBxea627qYvmQ2IxmHoDQBs9wmN6zPzvGJ+lNB4Kv0SvDmLavFVGr+GnY6tTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ch1JZDV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8wYSF022012
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 15:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=6L9xQwPvNyqamZukUXThzBL99kp13JUWCh+pkhXMJs8=; b=Ch
	1JZDV+r8a/WgnKlOpaq43F9UXMaE7QwFKQFTc49dqHxNTCmTe3l+dGBTQN5/TPmM
	x39TiYYB18ZZuaM9vNEeWb+M4uOXoYafbF7ZwTD7q/BE14Sa6+odQIFtpSeUm101
	3x+01mzW4QBpFYlbrWORWQakdsbwSJ6C8MLXe1PfNGvdmD5BC/CS/HvHJOXlcXXN
	1rqTpD/saU4PxETzDxSYubavNCNOwKaJ1cMvEytGRhI6JAs8JszfAQgdtIakwr+7
	AC69IdlsFgwwKw91ZpvC++2o22NFJVAh75nm0JaLE4hWAbGUVeyjIWi9ua6WxXtU
	2cZJ8TH7K/nR9ngV2g3A==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fd427-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 15:13:12 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-74e3e3b0c39so4327894a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758553991; x=1759158791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6L9xQwPvNyqamZukUXThzBL99kp13JUWCh+pkhXMJs8=;
        b=flSZT+Q9mzY53r/miKibVi7m5JjqH/YKG5MrohVEYF8E7XLb8Q8DJjqbZhHxzgQEb8
         0FzjqNoG/0mN7SRNp7dT1ynAl1KGUo00GngmaNtn7EnUk1pyl2L0eFmghcU4neyEXdSJ
         VbkLi/2HdqTB0PLeJ8cjz5D7YlJxqIUj8R6IDgQuSDzKoGky3gnfIr56EPm8szdaASHx
         omQUuL4bksFa4w1wno+qoZkGZWaAyzV9UBJ/K/JIsvAYCkFUJQssPGlBhv66SHGBcLsf
         O8N6foZOXBCcK8uiJrksX9GsQjAcrM/ly/hA0OVapkryFRNfMflQwXH8VOfxt635iH4/
         ycBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHOwKRH90MuzXHV4R69ssAO2g4Cj8dr0fjrqozDw/T1y5G+yxeE0f1aNiITP+dvplczA7upc0bizvHU8Gy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfgd3fAKgvXApZ0h6bhV6VHti1TU2/hSPnG+SZ0qXpO0aGAQ4C
	hMHxDOVhPd9QhWAWI+HH890oftQtTVt2QByuJ1jUQalpZ2BmQYO15jvfnRwOlclN0aYBr59P6uE
	dcevo494grALWFCpzWyW6abzgc710V2aqqbUIIKAM/93vAs3DqD3PO9JeEyJntJYevgtPMPmYfk
	XOgPj7pmmP01Dq4B3M03A7ih4AbhxEX+O/Otd8BSYO2VU=
X-Gm-Gg: ASbGncs7nlMQdsAftb/a6QtUZcAmzFV7HEz0oFxEMk651BRJHSxhsAYkI5oYeU/c0XK
	+XA9nhaFPy/U9LrBMdOitAzss7war4/4EkIu5OoN1disDyQlCrzn/bXsFzg4KurvQ2EBYmxj2u7
	JP/ck7abOQnNt6qiI9a35DatBwsOXMw4Jkn++zWMfyWD1DQOOXfN1h
X-Received: by 2002:a05:6870:d203:b0:321:27af:4b0 with SMTP id 586e51a60fabf-33bb387a8efmr7066538fac.21.1758553991290;
        Mon, 22 Sep 2025 08:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeI3VUzLWw/6kf7cmjW8nkegRTNOSrOJHdfgWLSr9Z07F+QepvdikPR1+KMJ0NepSDMgedO2i6ynxIGcy1040=
X-Received: by 2002:a05:6870:d203:b0:321:27af:4b0 with SMTP id
 586e51a60fabf-33bb387a8efmr7066517fac.21.1758553990880; Mon, 22 Sep 2025
 08:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
 <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
In-Reply-To: <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 08:13:00 -0700
X-Gm-Features: AS18NWDsjwQT4-UMvgr22Kwg3NRpxj1iGVDde1kRYPcz2iKyW9TnGKIpG41ve0w
Message-ID: <CACSVV00Bat6LE=joM+Wh3HnC1=c3_Y=crxUGdhLQWxxpZ17Q3g@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mNfXJ5-x0Iy6FJ7GSufLEn42Ow3G7PrY
X-Proofpoint-GUID: mNfXJ5-x0Iy6FJ7GSufLEn42Ow3G7PrY
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d16788 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=Ck2O2MNpSjHhtJkipUsA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX53ZgAt6ZpQUB
 8j3kBlAPwRcA2EskoHSmqtGN0U3pJiExIhaoX3vEbh9/qO59JSB58KHz2xqQmLN83pW6r7mPJpl
 6ZbyHqajFxv7YEYLTLt4F7tyO6A4EBNCaqgzuz8dxjkKq5gAPiYf3TedXdgRu+6T1rtyK5gY7su
 Y96HIODPBdwdVOrnNIJ7eSw9x4puuF5gjYnsyBrRvzQeDr2jbhCokeO4IcQGUNYzSDLaQcUnOPX
 MRb5/Mt8XUiwE0qXf+Rk8T6Bc0oFqJx4cPWhg4OMbsaiXDTJuKf23099sbxVL7/ITVfWVGmpI08
 9l2eeq2u8y2OBSFppQIJrnTTWUfIfIGGBKW5abuH5amCM+DrFVW8BzR2ROGbPuomW8/fYY5BwpX
 1X523dt/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Fri, Sep 19, 2025 at 11:35=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
> > QCS615 platform requires non-default logical-to-physical lane mapping d=
ue
> > to its unique hardware routing. Unlike the standard mapping sequence
> > <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> > configuration via the data-lanes property in the device tree. This ensu=
res
> > correct signal routing between the DP controller and PHY.
> >
> > For partial definitions, fill remaining lanes with unused physical lane=
s
> > in ascending order.
> >
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
> >  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
> >  3 files changed, 66 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/=
dp_link.c
> > index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f133=
52f7b3513aa88da2a 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct d=
evice_node *of_node)
> >       return frequency;
> >  }
> >
> > +/*
> > + * Always populate msm_dp_link->lane_map with 4 lanes.
> > + * - Use DTS "data-lanes" if present; otherwise fall back to default m=
apping.
> > + * - For partial definitions, fill remaining entries with unused lanes=
 in
> > + *   ascending order.
> > + */
> > +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link=
 *msm_dp_link)
> > +{
> > +     struct device_node *of_node =3D dev->of_node;
> > +     struct device_node *endpoint;
> > +     int cnt =3D msm_dp_link->max_dp_lanes;
> > +     u32 tmp[DP_MAX_NUM_DP_LANES];
> > +     u32 map[DP_MAX_NUM_DP_LANES] =3D {0, 1, 2, 3}; /* default 1:1 map=
ping */
> > +     bool used[DP_MAX_NUM_DP_LANES] =3D {false};
> > +     int i, j =3D 0, ret =3D -EINVAL;
> > +
> > +     endpoint =3D of_graph_get_endpoint_by_regs(of_node, 1, -1);
> > +     if (endpoint) {
> > +             ret =3D of_property_read_u32_array(endpoint, "data-lanes"=
, tmp, cnt);
> > +             if (ret)
> > +                     dev_dbg(dev, "endpoint data-lanes read failed (re=
t=3D%d)\n", ret);
> > +     }
> > +
> > +     if (ret) {
> > +             ret =3D of_property_read_u32_array(of_node, "data-lanes",=
 tmp, cnt);
> > +             if (ret) {
> > +                     dev_info(dev, "data-lanes not defined, set to def=
ault\n");
> > +                     goto out;
> > +             }
> > +     }
> > +
> > +     for (i =3D 0; i < cnt; i++) {
> > +             if (tmp[i] >=3D DP_MAX_NUM_DP_LANES) {
> > +                     dev_err(dev, "data-lanes[%d]=3D%u out of range\n"=
, i, tmp[i]);
> > +                     return -EINVAL;
> > +             }
> > +             used[tmp[i]] =3D true;
> > +             map[i] =3D tmp[i];
> > +     }
> > +
> > +     /* Fill the remaining entries with unused physical lanes (ascendi=
ng) */
> > +     for (i =3D cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANE=
S; j++) {
>
> Nit: i =3D cnt, j =3D 0; Don't init loop variables at the top of the
> function.

These days we can party like it's c99 and declare loop variables
inside the for(), instead of at the top of the function.  My
preference is to do so, unless the loop variable is used after the
loop.

BR,
-R

> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> > +             if (!used[j])
> > +                     map[i++] =3D j;
> > +     }
> > +
> > +out:
> > +     if (endpoint)
> > +             of_node_put(endpoint);
> > +
> > +     dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], =
map[1], map[2], map[3]);
> > +     memcpy(msm_dp_link->lane_map, map, sizeof(map));
> > +     return 0;
> > +}
> > +
> >  static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link=
 *msm_dp_link)
> >  {
> >       struct device_node *of_node =3D dev->of_node;
>
> --
> With best wishes
> Dmitry

