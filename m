Return-Path: <linux-arm-msm+bounces-118616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E9TDB9QsVGo+jAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:09:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC95746519
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gIyctDIw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TjtdD8AV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8252300F13A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 00:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8730F42A96;
	Mon, 13 Jul 2026 00:09:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0128B2745E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:09:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783901385; cv=none; b=sfD2FRpeK4PxTDYF4EwcWPanMzibMvCRWGkyQvtmZCc6GzaVJOIkvU7GhjPHAA97EF0m9Ag5A80uIL6AOnGJ4HErzMnl6q7H45k0ddp1mWd74uLwf1AlJbU7ZbG+xEZMECMOSDaOrVdSApwbP5jDzgRLDfGvikXiwrCcTLl1y/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783901385; c=relaxed/simple;
	bh=/+DaJar2AQK5EYVAzLJFTCM2RzlrzQXccre0QriX1lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3n5Iuq6g9inrAGA7isBwBpSWmvT2t18WwJAGlicy8F9ArulnDVQbjMLhHD6QJ83ruLrE/nXJWc4W23YXGkbHowvHL7kqeZv8K5fN95qHgaO1aBUS98LQbBGu4LhoELa8RRDWOvooEoRoPH38aW0LQgQsekRz2LjjszE/vLe5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIyctDIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjtdD8AV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNV4R33810329
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GA+QgBdn0574n3JABCA8ZO+N
	9bz6eWFUrGRBq86C1/c=; b=gIyctDIwwyRbQvRU16O2xyqcGc1vbm4on0Nrt1XP
	BdeYPABiIKRVNluEY6vQX169LXccosTqLcMyX3LrsrqKRfEenz2WXvp1ppMcFvqa
	j0rCSW3GHRcMZg6rUwATKDLYZE6hwWoLQBMe6qhP5Jc+rJgwNWk2/H308SPqsKM7
	KhRbqX+wijzMXFbQVeTvZSkU5R4853i7YKqfylJd7IxxeAM18X2ZBxyE2Lpveu/L
	/Mhzl4dK8W1Qj51LC76fLfLxxV0ST4s9JDtFYO/HtjC21wyO6505flgVwRyrbYaf
	4vAHCuZRE6tvpdIhmhyAOc0jshPo0Z8qkPZxXkJyK2IgVQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekckq5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:09:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c0fb008616so298600e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783901381; x=1784506181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GA+QgBdn0574n3JABCA8ZO+N9bz6eWFUrGRBq86C1/c=;
        b=TjtdD8AV5a82oyZX+aQHhdpsSZaPColViL1g8oEKnPprtU/MPwBdBi8SmiK78Nwphf
         sfisqRl6WxoxQuWU8Nc3XHnE8if3rfRsF3aZE52Hqlj8ozZkQzQGRwW2mjK1TFlAkVVZ
         DtO4QeI8530R8Yz6JrOeIR9nj0/DhKP2ddT/KP/QWhkkFv870IzW1mrnrLuODvpucSRI
         jL6geTa12RqvX6Ys/3KNpPu3Ag2m9gGXfumyNXWDzQNbmDRqFi2hlSHYEUPVGnLqnsbf
         d3u39RYPPLqWFljufWykbuPabQxZRb6PbcPg7nVBndttsEF+k8hnm5+g0BmHwv+umOWi
         qgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783901381; x=1784506181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA+QgBdn0574n3JABCA8ZO+N9bz6eWFUrGRBq86C1/c=;
        b=q2+tVYnkXt6cmTxj1PkfcABBcL+m+Oy2ZEovfwr+zNvU+JTIDpeWRN8PUjPCQAqpFe
         JnX//YO4+Sco9E4By9e0mvUhWSXpxAemi4VG1yk78yrhjnDQ8g6Yf2/Z9jNprZxILpb7
         Sh+2lG9Y/qOyxRUZ+cpEXCkzymp6CQCD6xlldfU2L3cmmdaRu/i+ZA4AK2z2/JiXDycF
         Aqf/EdpaVH37KCYMvBxqoJGsx0j3vL8JGvl83hn6Qbkgp/ST8SnbUWPB8xP9hCrC1O2F
         oLnGtcmnqv1c1O9uuXxdTPP3nQjqBwYLsLmHpob9OiTDCAiLh2V9Wpo8Kao5f2BESyYv
         dpmA==
X-Forwarded-Encrypted: i=1; AHgh+RpSZBiqB8+PU9l2UbUqqrJgSjiTxpGxIJuLyM/ZaRkV/u8YIC/4UZ55RO/wmUYIvltg/rnpYGsvEPWBleSE@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKYVAxiLDpqE81djCz8ECI+HEZx3cHnKBEBvqP36AHsbqTJ9N
	OzAaMdhSMESIako8D4Ukx5CWdEjDlWrnotvGGCq8Qut8MQ+P8QNUK0/NcEo28rSHq674nNPOGyB
	FcHIai+3eEEjnHhZPQtkOYubg9qixhnu1PIM8eGBr61visPp5mpc26e0+vASt82pz8FuF
X-Gm-Gg: AfdE7clfN56qNxShkHo4Qjea93HOa8vbpUVZgIuD3qpKzVM41gvGLPGAsX5jCnj/byW
	2ayLXgBIt4EtvaDDBd2WSJ90nQ3OLcNdh9jNCdfvLeHGAQw+cIjHn2Gv9xGq+9zpjxBnxeWttag
	H2c44xS4QiS5grkCjx5YgBn2U9WHLayg4l5BwqCExqpwkWAutL9olYWGgzt7vE9ORb07xpnE/xX
	s0/hrlzWObN2uMxCh/hBSOpO338d16YgmTj962pTPdvfKGm8go+gkFgejoa1anHYPwTKbhesJzW
	AfIVA1hdDid8IiK0nsa7nyVwMTvqzRVisP4dkqmFRrwtpyQ+tuGNTI3/fuLtDj8wWXBZOo2xIkw
	z0v3zrVuMuZOIAcYR5gBI/ouJfg4niyC9cWOKdqKa062rr3Yo2MtbbZpvTgHkABT0y6MDJcsd92
	eIDklJjbK8AQq0wvcMeE7zCXaN
X-Received: by 2002:a05:6122:6310:b0:5bd:a2dd:60ee with SMTP id 71dfb90a1353d-5bfa470c003mr5528520e0c.3.1783901380967;
        Sun, 12 Jul 2026 17:09:40 -0700 (PDT)
X-Received: by 2002:a05:6122:6310:b0:5bd:a2dd:60ee with SMTP id 71dfb90a1353d-5bfa470c003mr5528506e0c.3.1783901380396;
        Sun, 12 Jul 2026 17:09:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b97553sm25969171fa.33.2026.07.12.17.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:09:38 -0700 (PDT)
Date: Mon, 13 Jul 2026 03:09:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 21/25] drm/msm/dpu: use
 msm_dp_get_mst_intf_id() to get the intf id
Message-ID: <pnhfi37ijlxuboqritlsg2o6wew44pe7niyhyvxc3dbrdvgazc@dfpldilmrp7r>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-21-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-21-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI2MSBTYWx0ZWRfX393oT48qER4V
 gQeHPj9OTzf9FRU1QsuWJZzzN2NOAHYKCh+k03CfNDCekSkmzHolr9AinXVmb9FOhlQllnItUbN
 te3dTJsnHT93jREoEIHCwBj7c95fk5RtzrVi846YPK1Rv0XZ/5gVuOGqudIFxaS9a4gNcxUiAhz
 7b8ziQRZ3gJNPOSerPLhEYoHZD1dwA+xJjRAd5Kd2gwDpLAjEtI59jsC6BUKAR6vz2sebHZ6Xae
 Zv/6QfZMwa+W9CGbCrN+xjUFwrnZ1tCUCOu2cUEzYErkdaGsTzA53ep13N9NrwcNZRWIuXX+yGU
 ZgJ29Y8rcCV0P+N9GBWenkO5QQhrvVfztfIQZ21RYdoTerbVPUXBLl6FqpWF7vls/KjoPNWKZlf
 1r6evBzrLqRxK5sxhxUDbw1abWYJ2Kshq4BWUCab80kXjwMDkJnyzJeSKKg5qc2RAIXblfuT9Zd
 nXoz2P++hpHizMCPBfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI2MSBTYWx0ZWRfX1GA4oNCGbzJg
 ge0OA5+ZgvvuC/BhSaLCUbUz80GWCCsTxYCrvFr/OyNTYAxTGxfyi3XA/dCpOG7gnTkIlqCBaqN
 pHzjLudpyc2xT9NSu17fLohjoCvERYc=
X-Proofpoint-GUID: SKtGKsPbO7yQ8EH2JdlinASRonkRaUTw
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a542cc6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Ur00xY7Li4RbIHJ_WnoA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SKtGKsPbO7yQ8EH2JdlinASRonkRaUTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120261
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118616-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,dfpldilmrp7r:mid,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FC95746519

On Mon, Jun 29, 2026 at 10:14:42PM +0800, Yongxing Mou wrote:
> Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
> controller as the intf_id is unique for each MST stream of each DP
> controller.
> 
> For DSI/eDP/DP SST, the stream_id is always 0, so existing behavior
> remains unchanged.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++++
>  3 files changed, 17 insertions(+), 9 deletions(-)

This really should have been a part (or done before) the patch adding
DPMST encoders.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1c74ff6f0dbd..3adfaeaab71d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1438,18 +1438,21 @@ void dpu_encoder_phys_disable(struct drm_encoder *drm_enc,
>  
>  static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>  		struct dpu_rm *dpu_rm,
> -		enum dpu_intf_type type, u32 controller_id)
> +		struct msm_display_info *disp_info, u32 controller_id)

As you are now passing whole msm_display_info, controller_id is
available as disp_info->h_tile_instance[i]. Pass index to this function
instead of passing controller_id.

Ideally, split this patch into two: one changing the function to get
disp_info, another one adding stream_id to the struct.

>  {
> -	int i = 0;
> +	int i = 0, cnt = 0;
> +	int stream_id = disp_info->stream_id;
>  
> -	if (type == INTF_WB)
> +	if (disp_info->intf_type == INTF_WB)
>  		return NULL;
>  
> +	DPU_DEBUG("intf_type 0x%x controller_id %d stream_id %d\n",
> +		  disp_info->intf_type, controller_id, stream_id);
>  	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> -		}
> +		if (catalog->intf[i].type == disp_info->intf_type &&
> +		    controller_id == catalog->intf[i].controller_id)

Why did you change the order of the args?

> +			if (cnt++ == stream_id)

Squash into the condition.

> +				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>  	}
>  
>  	return NULL;
> @@ -2675,8 +2678,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				i, controller_id, phys_params.split_role);
>  
>  		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> -							   disp_info->intf_type,
> -							   controller_id);
> +							   disp_info, controller_id);
>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 25ade3dbbeda..861d69afbd76 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 91d33b432427..b32ecd5b0777 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -614,6 +614,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  			info.h_tile_instance[info.num_of_h_tiles++] = other;
>  
>  		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
> +		info.stream_id = 0;

It is memset to 0. Drop this (here and below).

>  
>  		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
>  		if (rc) {
> @@ -689,6 +690,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			}
>  
>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
>  				if (IS_ERR(encoder)) {
>  					DPU_ERROR("encoder init failed for dp mst display\n");
> @@ -716,6 +718,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
>  	info.num_of_h_tiles = 1;
>  	info.h_tile_instance[0] = 0;
>  	info.intf_type = INTF_HDMI;
> +	info.stream_id = 0;
>  
>  	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
>  	if (IS_ERR(encoder)) {
> @@ -748,6 +751,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>  	/* use only WB idx 2 instance for DPU */
>  	info.h_tile_instance[0] = wb_idx;
>  	info.intf_type = INTF_WB;
> +	info.stream_id = 0;
>  
>  	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

