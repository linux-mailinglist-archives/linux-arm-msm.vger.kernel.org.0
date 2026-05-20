Return-Path: <linux-arm-msm+bounces-108657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFomJ3J+DWosyAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:27:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D158AC2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAACE30C16D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E03C345B;
	Wed, 20 May 2026 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyBR6yJu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOhDHjVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E33C4178
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269007; cv=none; b=hFfy8U7g8lcc1HjFDqzyKl2ZNrR3U4gxQP4lzZo+igtuDvj0IBDTdqAwozIkdAdB7MiSw9YFvMZF6dYofoYcQgdyGCWCYV1xAdMWJ4bUM11LH5fe1IRGYLMcWuvR9heLJqTDr/nu1hJd5P2VGsHGnDkPGDZ96UcuuytQiBPGDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269007; c=relaxed/simple;
	bh=cLWtBiuUubZnbIqKqLLI9+g1x3x9vFHutawybfE3ELI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dilk2YD61Xc50JQMpaffuNPIz5xXJFvkrowNirVeGQ7cmjylrXn6Qa5En6wf0MdakZWRbbJTprEFqLltj4pzObip8VFGHb1PoYi7YvulMdmfkVv3Nt2+xZJM3F4ChL2VB1KWBwec4V4kZTeo21BtH0wzIPFoe8uhleyPBJ/8fjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyBR6yJu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOhDHjVX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K759b41953988
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2dk1xLGP6qUJ2X8iBTE2ICZu
	6S7Az8HHzhrvZdWPUyI=; b=dyBR6yJuZxKrrHZ8dfjUGQd0eixfA9PtBsDPv0yE
	XEceYydH1qTyG2Kfsye6z+FImj4m8rljS17KdWWwFx/KQtqeJaEQlOGeMcsKdmQ5
	Oudyhg/CUEyyWtBJZ7XnE9IYPZUgyx2Ve+GnC6IaXstujnQ3KwVyVJt8vwaRxYxf
	6C1rmybrbRtFgMwJyrqaPVZ+BiTtHBvpcAv2cxEFXKu9pMbsQVIOwpw7MdIalo0W
	mkTabsFYvjxBl2qIAxSm1FKpxydoMMHiInT/sJpJOA/lvFXjHu1IPB6ZHwM6cj/D
	w0mdwWBpnLBX227X8sfSD92DrNpLq4Tr3zQoCa67hTyPgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xv1rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:23:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so130766181cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268999; x=1779873799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dk1xLGP6qUJ2X8iBTE2ICZu6S7Az8HHzhrvZdWPUyI=;
        b=SOhDHjVXSG5jPLOhekHqflPpnazOgRdJbZ4Wj3lnT/ovGGO1TETcf/us3O716KnOYt
         aSGFYk3vdG9+FedHgWNxrKhUlU0wohp+uH26dIselGgCOZiU4bfFIqoUNS45U2DnI0M2
         Qfdm33U0oFgvs/0N6W5t7GADJZLqBa0cEYmR0dXg7b4oGPdwzyZHdli+dgx5y0vovzAA
         biloaDf/JKi05J1hIt1Gco5EZiPjwHijn8tU9C3KKVMMRjSnvk7Q3k517Yip1PgH/U6C
         +hrZ3VzVgPFpGw3OdTqF9TEmnE80bqCmKd6ZmQvDc5wshj1cTgft8qbCh8w9wLgwAKSI
         l6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268999; x=1779873799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dk1xLGP6qUJ2X8iBTE2ICZu6S7Az8HHzhrvZdWPUyI=;
        b=GN+uSaQFiGyRUQlKpG0JyeyWNlOxwK4BmMGMJPGDAxcma07MwZQqqCFA09eRE9StR1
         Zm8FfgIfKzGZtoC7yolDY7yECZK2Xj0B0gMlsAj2eGoJ7DnqsDYuutUuQ+xsCxY3rNhz
         YNWeTLSFTM1d235pbX4QbOiwQYmKIdZbEt4SeFi2O89FwqPF5RFBd38Xl5+FkzHZyrZZ
         Tmtbyl7QWeOaGP5QwDLbw8wnKlt8+uxkGxzwhY/hTF6XuPliFNFyqgUKd+bVqK2K9GJb
         1SmTPStrVuJ84d3OWuKFPzJahddcSlUOXSRidQ/jofRyiu2frEhU92l1Z2PqJISG/yBC
         jFPw==
X-Forwarded-Encrypted: i=1; AFNElJ8yJxr0zDV6GPNSOonSyecwypfysR0K8ro8thTsrP49YDYpI9Aqaz3oNvJcVur/fTvRBaHXqKIv8QOcsOpz@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhSboHZkRA/ZdXN61va2e3fPTfOfl7s4itHHrFJUP4yw+1S3I
	TGH0AqzPNR/qvE6ExvqgzIZXeHuDkB6PPn04tQsky6pj3njpRItPKijKGtMZiWkaZwfi8Z32n/r
	UeWz2r0NJN4oNsDF0T0fCP3yv6D0lgfrS3MsuWsnSvtOGs5tVvdwYcK4IwiXrU0Co7gJ6
X-Gm-Gg: Acq92OFE8z2DtPXxmS/KN6g05R7RWVD4X+/XJcYk8SEztqWOYi6Hj99sAy2j51EgqAA
	u3G+J4baETRJTzG8wyvwSnLYcEpMJL5TjpE3scgRt0u9PpxEumMFbKuSHnrwplqpvNQ06VxVZcY
	d23L+Bn9L//uhfctY23GGq8rSxUqfqsUctfTg+Xqx6DZuUn1TSJKZ6AYu3mqHAoU4Slguq6dCaD
	zbtwvytDsVjDcxyLBp7+mMZvtJuSTdv3KkFTG/E/RcyCBpOxioH8MMJHhSqxFvkqMDvXh4bwFIU
	PXdtYshAu81MRV0sYcMR2WicGvDeD3VSCDr93c/eGLH2N9SnlhQlrLH1z92SqdDg8GsyAv5CJRQ
	FnOgcB/4K68rleQz3ls4s/Kbg6NoD+tJeLMNcFnUe+ePf1u8yY2RJfk3AzoUeZ6LJRwIlqkOC2Y
	ZshP1W0iK/MI8DRidBvNiT/5iC7TMcKP2uiXw=
X-Received: by 2002:a05:622a:17c7:b0:516:508b:bf55 with SMTP id d75a77b69052e-5165a276f8cmr302274941cf.55.1779268999204;
        Wed, 20 May 2026 02:23:19 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:516:508b:bf55 with SMTP id d75a77b69052e-5165a276f8cmr302274701cf.55.1779268998741;
        Wed, 20 May 2026 02:23:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c944sm4915432e87.6.2026.05.20.02.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:23:17 -0700 (PDT)
Date: Wed, 20 May 2026 12:23:15 +0300
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
Subject: Re: [PATCH v4 05/39] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <etjni6nlx5a6xd4oqb6ow5ihxdl5zcdtcofmo74pbdt7lilnxd@q2zqgiqycjt3>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
 <omw63f7fbqiuw2t266dq5drk7rz2kohydpvbbhcrbfiehb7lzh@aucqhfaliams>
 <57f574d3-7000-42c8-a5b7-88f1a73efd50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57f574d3-7000-42c8-a5b7-88f1a73efd50@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d7d88 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zA6fHH8LBb3Lnj-KyrgA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NDohuvUwmAgt-CDCGS_pw4DYGiYeKqS5
X-Proofpoint-ORIG-GUID: NDohuvUwmAgt-CDCGS_pw4DYGiYeKqS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4OSBTYWx0ZWRfX8Zp/KXb94/UX
 ow1v5r8Gp5xwjrqXO6pcMGDbqe/g3x9Srx6dLQ/yuIkizmDbbwlzLLFMawCkmbudIxe0Ok983HH
 SSXXGqInKYGXyX3JMz3neWDkEuCUeA9Z2PQqazGNoFLwrq8bvWVyre+MJvCd5NGYPclLoj/yx62
 AkDEVrwwuzMn3eOp4eUU4A3qaK5KXTXcw1g3ktGWfCQyPOn5IED/kznPtqkF3Mzfkktmsc75/YU
 pa37oNjyuTiCo917D7BPaBqSPqXGMpu/a6SEHS8jGUAxUbHwPbGRrB2c2nZDQTM8zivQMvNbJfz
 gZn9fauMkj9oOsjO+HHJQxAy5Dbe0BtOgrH3R7JdBkpLQsGOGghbmBs9KTcoIjtS93/WTWu6d+G
 H/rWeavyx8CRkIYfNZWWIyxXZapNTtt6cRrAYG/gFlsSHwpnDMlJ1FDhpoG+q++1dY0LOredKxC
 wr09+so5DrV78tlLaPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200089
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108657-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 181D158AC2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 03:46:36PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 1:34 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:40PM +0800, Yongxing Mou wrote:
> > > The DP_CONFIGURATION_CTRL register contains both link-level and
> > > stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> > > all of them together. Separates the configuration into link parts and
> > > streams part for support MST.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 43 ++++++++++++++++++++++++++--------------
> > >   1 file changed, 28 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 476346e3ac19..85315467b5d0 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -388,26 +388,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
> > >   }
> > > -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> > > +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> > > +					    struct msm_dp_panel *msm_dp_panel)
> > >   {
> > >   	u32 config = 0, tbd;
> > > +
> > > +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> > > +
> > > +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
> > > +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> > > +
> > > +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> > > +					      msm_dp_panel->msm_dp_mode.bpp);
> > > +
> > > +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> > > +
> > > +	if (msm_dp_panel->psr_cap.version)
> > > +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> > > +
> > > +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
> > > +
> > > +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> > 
> > You have an RMW cycle here. Please document what prevents it from racing
> > with the concurrent msm_dp_ctrl_config_ctrl_link().
> > 
> Here protected by mst_lock in MST case. Will add a comment.

And in SST case?

> > > +}
> > > +
> > > +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> > > +{
> > > +	u32 config = 0;
> > >   	const u8 *dpcd = ctrl->panel->dpcd;
> > >   	/* Default-> LSCLK DIV: 1/4 LCLK  */
> > >   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
> > > -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> > > -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> > > -
> > >   	/* Scrambler reset enable */
> > >   	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
> > >   		config |= DP_CONFIGURATION_CTRL_ASSR;
> > > -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> > > -			ctrl->panel->msm_dp_mode.bpp);
> > > -
> > > -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> > > -
> > >   	/* Num of Lanes */
> > >   	config |= ((ctrl->link->link_params.num_lanes - 1)
> > >   			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
> > > @@ -421,10 +436,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> > >   	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
> > >   	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
> > > -	if (ctrl->panel->psr_cap.version)
> > > -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> > > -
> > > -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
> > > +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
> > >   	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> > >   }
> > > @@ -450,7 +462,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
> > >   	msm_dp_ctrl_lane_mapping(ctrl);
> > >   	msm_dp_setup_peripheral_flush(ctrl);
> > > -	msm_dp_ctrl_config_ctrl(ctrl);
> > > +	msm_dp_ctrl_config_ctrl_link(ctrl);
> > > +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
> > >   	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
> > >   	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
> > > @@ -1628,7 +1641,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> > >   	u8 assr;
> > >   	struct msm_dp_link_info link_info = {0};
> > > -	msm_dp_ctrl_config_ctrl(ctrl);
> > > +	msm_dp_ctrl_config_ctrl_link(ctrl);
> > >   	link_info.num_lanes = ctrl->link->link_params.num_lanes;
> > >   	link_info.rate = ctrl->link->link_params.rate;
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

