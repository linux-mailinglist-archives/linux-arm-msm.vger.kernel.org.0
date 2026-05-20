Return-Path: <linux-arm-msm+bounces-108656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EaOFlaBDWrUyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:39:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46CB58AED9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B6423024CBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12EB3BE644;
	Wed, 20 May 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgyAbB5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPDIW9G8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C53BED0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268937; cv=none; b=hAAWGWQDoD0T7ba9WACUjzZBOot4ZJMLEfNhW3nl0DzrRz2OK1dl1k5+nu0vFTu24TzS6y7cHd9PYBrZqgukFg5DzPXUJtUpKXDLVyFXp8eiWvu/2dZfpMA6BBJv9z7OutegdihgaMi3Kmoo7p4z1G34KHQs4QXtKLgcHsYiYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268937; c=relaxed/simple;
	bh=K6b6s0Yka5QWQ2kzCbB7V93xXslwXB0X3JeDEZ3V9Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQMVVnpLIexnosuzo2lGThkELpPzpXMgxPCwbvI3A14eSTpoDFHjj+rkR5gFn8PSsOruQjJyyROdoqrnueunI6WZ47S0URAblhvByfW04357H0DY2D6cSf5NqQfocIYt+165S1ctFwf6ee7ucSedaLT83IB7vx9BcaalJx29DIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgyAbB5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPDIW9G8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6kR2D2984427
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rjtq3peL9p9PxOypZu985aac
	PSWUcWZM+8JLMllS69w=; b=BgyAbB5Gsbl9LTmJ8vtyhWifro6R02Xdj4PUD/Zi
	90tSQG0JbTDp21fX+TJcyLpRGU8tvmK6NtNUw7yWeuSjWYj3FWtjngtvr+FKXxnU
	mLTEK5bb7AKZmbcQH1TchB5lf/M2fb1N/tgGwkN7IP0G5wuZOUhpc298piePT95l
	aFQQcuIvnnCkr3/VRx928Wf1RXEowvm56ZXSNy6eEYNb412Zi6n0WWeZTZQYt6Ki
	IdMRVCCLyDCf7DGsuOom8AiNKX0DkGiS9lZxV9hY/16jMYUliIyhGqeE1jQquLbw
	y1fec+VevE0IHHLVhs+Qwj3MPMIJUkNIDwb2JhIUpf+u3g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t43ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:22:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8c9352f816aso112080686d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268935; x=1779873735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rjtq3peL9p9PxOypZu985aacPSWUcWZM+8JLMllS69w=;
        b=LPDIW9G8cClY2FOToIgsg+Yn081O95TyaJ6PDzmreW8J9rU3QAQL44KTMHLUy/9p4G
         qktz42+pKJHiipLKukpclaTMI1DgIjE/hn3LBZ5CuQQ6w5TBy3IzccM4VkUe29+jdKxM
         f89qrWJ+edvAfx/ZWLVwFwnrUw8eOJQgrWwtz1UTatZWDSSPwBUjt1t3svF03SayTFBb
         MuS3e6qYSRM0jIuJn+gh4moeZCNiLC7UPQdBmk2M7R6SyKPvAySTdQLWFErhaQSyeBUl
         64m4vrsUKj1DiwOmviUXGWada9WrWh8dYZUxmoIvytU5HSKoIyJZo1jbi+JpbdD1Xp4j
         iujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268935; x=1779873735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rjtq3peL9p9PxOypZu985aacPSWUcWZM+8JLMllS69w=;
        b=QXo1n6l/iuCI1OthqTIkNBcVEpICt4ZehSN14JT6r9qg2iK3yKFudJD5tS8d+IAx/q
         Qa4s1To/Q6dkyK05UMU2XDIww3B+zpH4RsRc9ilPF2kqssRRIGzQwVMzGGooG0bR8iy/
         RdEgRAK/MufJgAhXRm35dqX3MZze/Gw0nkxLNNx5jll4qOIzjpYvAKd5A/9efU3oytkU
         JpHLGHO2z3492uFHsRZ3YPB0frV6sk6prfisrX6rl/w3dBbGdCP2wJRrpU0RhjB3b1OF
         fKLpWS00DpXfsiC4xDc+80RjA8yAdaT/TIl/uahVq9bOOWj+NNvYVa3FU6AqLzlFi/LZ
         in4A==
X-Forwarded-Encrypted: i=1; AFNElJ9iz2dLfOoDGGgnJ1c9NNpUQwzUNf6xeTSWnY9YQRoEiRipzetDLjaGCLze9AMQpCNfAi9ydfwi8dkS5iW8@vger.kernel.org
X-Gm-Message-State: AOJu0YzapZZDqqsEPHCuI6FXAhT0Tj0Uv3dmgn7C8qTv3GoT/BqJJCOt
	OdCiaIVGmBTd8FNsgXTZ7CRv6wP3xYfXqLIpQCUU7ouZpnMm1CQMCmddUicepCCsfF0CVY1iQl1
	wdyN0zWaQCAAbh7GPK+vIYP7WeoO6VVu1sRnyFqn6tRrlGMw2zxVmI+8sO5aLFZeYro4Y
X-Gm-Gg: Acq92OH/7/aa+GH4A1NuEggXnie54PlIOG4hAXqxInVeIQ5cqZhD5DxGvlyhCKEOqxe
	7UxnaJau7G+ECzqsl+dB5VlDi5ZOvgifdhkU3ju3REfRj8aiZOR1+Djo4uIezXvEOmroPkCA6bx
	JsD8Qxxqc97h97kxEkeS/d+jIH+22foyozHRfV90kEz1LiRn/vUiZv2mE4gr9n1h9JJuwVI73S3
	lA9I2g9uG2ueHf5MALyzzNJoWRREnsyGX78+Oou5Q4p9IbLr9+exDBRWnHCeIX3KJzhzU8Mu2Q7
	yJvzJ4wicEPMim7DSZC2sB7x6ByzmC1/dGAxXkJUJ23BjIi+d8HxiikljL3CbtTTKEgj7xdYR82
	sw6FdvaXo5AjjbaR+D3CqH1NG7E8Jryy9GzFUe2ghmteRj67vNEZUItyy7pNm02M1GJqi7VmVj9
	tLep2aPuOwRBVaGtcxxru/R/QkY60jkvWP1mM=
X-Received: by 2002:a05:622a:2606:b0:514:845e:e7a9 with SMTP id d75a77b69052e-5165a023123mr326100841cf.15.1779268934789;
        Wed, 20 May 2026 02:22:14 -0700 (PDT)
X-Received: by 2002:a05:622a:2606:b0:514:845e:e7a9 with SMTP id d75a77b69052e-5165a023123mr326100501cf.15.1779268934241;
        Wed, 20 May 2026 02:22:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958828150csm27404561fa.7.2026.05.20.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:22:13 -0700 (PDT)
Date: Wed, 20 May 2026 12:22:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/39] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <k477w6qrrqugfjnnzj4h7f54ahehgpws2xfjgcyewqsakplnzl@e5wj4aqwax7g>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-1-b20518dea8de@oss.qualcomm.com>
 <7cnjdge435t55s5vf66fkjfmkz7jvcbbax2uuismyc74mv4eia@toe2vu2folqa>
 <b02965b1-3805-4ac0-8772-aa832f192756@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02965b1-3805-4ac0-8772-aa832f192756@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d7d47 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zewPlGMgYXjjnaek-JwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: KjuZkw_sZh5qwaz66JATCJ3EN3AQx3cm
X-Proofpoint-GUID: KjuZkw_sZh5qwaz66JATCJ3EN3AQx3cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4OSBTYWx0ZWRfX4/9IRcXen9uT
 c7smEXujKoWBMBi1izIZAwrQnNxEKj03S3u2rWKiY3KG/tOzMp97sTC+JtNBIrkmIuQU6y1O1Uw
 PdHUTLAxvMUZPUmFBx48AVILQZz0ZFtwtFuBRJbVV5ut6Cosp6OHLZON00FiepKKwZC7O4/GG1q
 qtzdl3FEoqZ9bYlDDgqdrNq+kDhQjyFLJjLfJh0abmrjyrqYRzpV40Sqa0dqcPDyWbu6tzlKhc3
 P7GYClubB9IjeZdJvPzUkeQo0rtibiobTP4BSrI9FcxD0r4avrbig7OW3udlXGLlWlb3kiTmFpd
 WP7DUrdyuZ3GBDLuW1C/OAu/4G+1rr67CiQ4JDCb041T0Ww5b0nuFdHIU9gHAy/IyU8CTrWGOng
 X/UvsPokOpUXP9auPFeM6DXQC+UanmvOJyu1vg8MzaTHHhS9hCyoVCW3i1+KaLwfg5k5GAkTgYE
 Ig4o2Y6SBMXfIn2Gmaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108656-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B46CB58AED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 03:27:00PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/10/2026 9:52 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:36PM +0800, Yongxing Mou wrote:
> > > The cached drm_edid seems unnecessary here. Use the drm_edid pointer
> > > directly in the plug stage instead of caching it. Remove the cached
> > > drm_edid and the corresponding oneliner to simplify the code.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 57 ++++---------------------------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++------
> > >   3 files changed, 26 insertions(+), 71 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 5c6a24ec140d..e28cc1bbb5b1 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -268,6 +268,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	const struct drm_display_info *info = &connector->display_info;
> > >   	int rc = 0;
> > >   	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> > > +	const struct drm_edid *drm_edid;
> > >   	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
> > >   	if (rc)
> > > @@ -275,10 +276,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
> > > -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> > > +	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
> > >   	if (rc)
> > >   		goto end;
> > > +	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> > 
> > Where is it free?
> > 
> Ohh, i miss it, will update next version
> > > +	drm_edid_connector_update(connector, drm_edid);
> > > +
> > > +	if (!drm_edid) {
> > > +		DRM_ERROR("panel edid read failed\n");
> > > +		/* check edid read fail is due to unplug */
> > > +		if (!msm_dp_aux_is_link_connected(dp->aux))
> > 
> > Does this work for USB-C AltMode usecase?
> > 
> For USB-C DP, i think it always TRUE, here should already existed before
> this patch..

I'd expect the answer without the 'i think' part.

> > > +			return -ETIMEDOUT;
> > > +	}
> > > +
> > >   	msm_dp_link_process_request(dp->link);
> > >   	if (!dp->msm_dp_display.is_edp)
> > 
> 

-- 
With best wishes
Dmitry

