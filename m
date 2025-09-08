Return-Path: <linux-arm-msm+bounces-72583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC5B4900B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D06927ADCCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E1C30C374;
	Mon,  8 Sep 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAYTtaB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B177111
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339133; cv=none; b=nc12OYofo1CEigXt6VOop+ga/QiktYomRanOKghTUGyDTTaHIarj3fmgfF7DWN6AmE8dV5T8xHJXLWIHRwzx29gvTayWaW7Ewow8U3ygq0Yc9kV9+23sCtB0yWROKgJXie+rV/ALh0mu05OWqH2lIj62uO/vdotUbnhnI+eO+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339133; c=relaxed/simple;
	bh=hIc4P2K07XlvYmHQkfI0woteLpw/ikjw7KN9mYvCRiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lW2Tmxq2sn5W//NgMXOg59KT4cFCmXEuFyDca9f5zB/Ji8UpGn8Z33CIFEr8PTVUws+OWmsY9u3Gbs7oWy8obafh/Hw22JQmzI93E2+lNIYBVUjA7rMLrRiFGlbKZVwHkXpUoLLfX0Kocxy9/IUMu07xBYFimWc4AabSTusSzyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAYTtaB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889BlXx022735
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 13:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=esqnV4GgtEbrquLS/zK5rW3W
	tt7Z1gs3taNjcse55BA=; b=ZAYTtaB9Y7SMyW3MEsYa9Jw4FcBylLtuUJgggnT1
	ggSBjKQSPM0bXafiZrmUzWnhTeDn/elXOFafxMai3AEAY/kDCKHX+MBKB8G3DTBX
	6L3JeQM9UJFDd8i9sHQc5H5BnSv/a35X3UP8bEwN63u8E9Ci+V12IaNx3mmrhCNv
	cM0IA7wrC+tWa/DrMDlLdScyBmtmsSlRQjLjNSMjc1GCmXrwxmM7uKbXVkuoVEbE
	CxU30u7LffSpJh+V7iKVEVU0tZWX79nGews7Bfu4qQnMA04l4zl+P3SfICmk14uE
	hv0GFp4UNlNkeuLjD5Ui40WyB+CPsZn+nTG1unjwpxj0jA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kvmur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 13:45:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e303fe1cso86577301cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339127; x=1757943927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esqnV4GgtEbrquLS/zK5rW3Wtt7Z1gs3taNjcse55BA=;
        b=KSmHQr7WldZulUiIINxTH3/sjmVYpNqsJGPl5Q3ZZfbIe5Z4Z4R5NbCoS4aSlYZyug
         +r6hwQi8s+TN1htafcE/MoBo3/1ssHmiAn7ZqmajE2dqrlJv0q4Fk2AYANOS/3lw7UTN
         jjo+qdstpReswpraBVgPfZfbbSjTxwpqoRu1abfbvTE872jldGFq7iqT2xs/ulrRYLVf
         WNFMeXJgi+tSfdQNrotjPz+aEtdi4hTR1wTD572lvbXeO8q8NmalurymC+oKVQlxa7ag
         /Fj1QxPH6FL5KOS0Nx1QOeuIHswE5cH/T7MJs5ACMme7t+eVbjqfOyGml7FrtVKGPPc8
         /7mw==
X-Forwarded-Encrypted: i=1; AJvYcCWKNtupcFP9JoOE1+GGPqJuGkx++VLz64kX2JBKkRdCUufoHpNvp2bGbWY3kcPhhTLiE1kGASI5Pm3YgaMo@vger.kernel.org
X-Gm-Message-State: AOJu0YxPwaS87FutvCYu/YF9PyZI9hHqf6mRQMzt7JSKwjzXIeilqS37
	QojJdpwmi+x1OdZrQshPewHrXes64GztY3S5gAQWrAHFB6cHEFVg3oH5bT7KGVprwLXbQZXbb5z
	6yH8+5Znm6L+5HtUu3u5PXZULxsD/r+Hs3fSzOHW01fqLx/iY8bAgswRDDaFVYtYe6Vre
X-Gm-Gg: ASbGncv2jdQ/L0S+P9WZoTpkHlLe/3gU6HciVu/+r7NnQ3kQ8PLUKvyoSUG8O8kBmkS
	0RbB2mfagqif2YgeB0E9Vo7uGKVIVEHBtJhm5xNmL0bk6+oSBEMx0S+sJNnK6VVR12T+5xRFh1j
	XLYi8XxY6pMS8lnnmWXXGO8McXtla299AeHeQPazMAhthCfuKWx07aMhFT5R3ZVFL2iO1OQ+fin
	8Kly96ys3P/GEZFKEVQJ9dagoEnd4RE3qrsyMxovQmL8o8vIcxuCQFawzPHkF/Tw5v1ojhYpW/E
	8x1Gfp9KTVrc5F8lP0hmpF3Rx5lLs9Dbuqw0bzup3VF/+0zvI+uB/rqRxBVbjEsAy8EMxHi14sl
	YplSwRMoGRE1KOyq+ObN8NB9RcCw/8vgjNmaW6lw4ufj574hn3Xgg
X-Received: by 2002:a05:622a:289:b0:4b5:e9bb:846e with SMTP id d75a77b69052e-4b5f83a51d3mr96781721cf.21.1757339126997;
        Mon, 08 Sep 2025 06:45:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6pGd+MdXBZbW1TIlirM87MxAFCUjEO+5IJdJhKbmEgdqD6cBDX43lwroMqHuWkohubp2b/Q==
X-Received: by 2002:a05:622a:289:b0:4b5:e9bb:846e with SMTP id d75a77b69052e-4b5f83a51d3mr96781021cf.21.1757339126299;
        Mon, 08 Sep 2025 06:45:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032aaesm32757861fa.37.2025.09.08.06.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:45:25 -0700 (PDT)
Date: Mon, 8 Sep 2025 16:45:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        airlied@gmail.com, andersson@kernel.org, andrzej.hajda@intel.com,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
        jonas@kwiboo.se, kishon@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        rfoss@kernel.org, robh@kernel.org, simona@ffwll.ch,
        tzimmermann@suse.de, vkoul@kernel.org
Subject: Re: [PATCH v3 2/5] drm/bridge: simple: add Realtek RTD2171
 DP-to-HDMI bridge
Message-ID: <u3qwrzwcr4knq7ueinws3siz2frugbkj75r5zp6i7qmkhnyauf@lrmiqhtbgzfj>
References: <20250908-topic-x1e80100-hdmi-v3-2-c53b0f2bc2fb@linaro.org>
 <AM7P189MB100924E3244B953F0EA6D462E30CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7P189MB100924E3244B953F0EA6D462E30CA@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXw0BDtjOecxO5
 l/67+q5dKK9iFVXOxh/BarxJ82NmsX/wdBTCMZrQqCGeWcxlLEKvTfosaCA4Og99i1lV0LKxUSc
 TAuYD2ZxPi4pIsrls66gPHTdSr2PC8tmOtEhe7+ZKTMaZ94EVpSXycJ4vHV+yJVbC5n2KBwxm1a
 VSUQv3P68Ix+0SpeMvON85cdZiCRV7jEVA7LJjgcJmLKJzrb8WVMQ60hFLPkRnrSjCCturgDbSh
 1ChILKgXo+SttKvJLdmh/Ko35+d9E+jA5gbKx0F3jtH/E4u7OodqB2A9kV3OXr6dJ9HpK/a0DJf
 OTo2CJKenNrYs5T7I6aU2dx2n75jR/9z5r67EXRNDtXBz7V0ppkOEh1QmZ3mIMdhn8WlEbTs7dy
 lvb/kZ72
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68beddf8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XwVbCjRl897ke_8r9AsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EWpcuqzVuc3_FQuZ1vIvTeXJG-HK0spE
X-Proofpoint-ORIG-GUID: EWpcuqzVuc3_FQuZ1vIvTeXJG-HK0spE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Mon, Sep 08, 2025 at 03:35:23PM +0200, Maud Spierings wrote:
> Hello Neil,
> 
> > Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 1f16d568bcc4e0fb56c763244389e6fecbcb2231..e4d0bc2200f8632bcc883102c89c270a17c68d0c 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -266,6 +266,11 @@ static const struct of_device_id simple_bridge_match[] = {
> >  		.data = &(const struct simple_bridge_info) {
> >  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> >  		},
> > +	}, {
> > +		.compatible = "realtek,rtd2171",
> > +		.data = &(const struct simple_bridge_info) {
> > +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > +		},
> >  	}, {
> >  		.compatible = "ti,opa362",
> >  		.data = &(const struct simple_bridge_info) {
> > 
> > -- 
> > 2.34.1
> 
> I would like to ask again if it may not be a better idea to introduce a
> fallback compatible, once this patchseries lands I will be adding the

I'd say, that's not a good idea. We usually don't have fully datasheets
for those bridges, so we can't be sure that there are no strapping pins
/ other GPIO controls.

> parade,ps185hdm. I don't know how many other variants there are that are
> just simple dp->hdmi bridges that don't require anything other than the
> connector type set to HDMIA. The Thinkbook 16 and zenbook a14 both have HDMI
> connectors, likely with simple bridges too.
> 
> Kind regards,
> Maud

-- 
With best wishes
Dmitry

