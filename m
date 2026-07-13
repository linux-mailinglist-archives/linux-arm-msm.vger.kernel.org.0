Return-Path: <linux-arm-msm+bounces-118618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XSnxG802VGqzjQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:52:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 679227465DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:52:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="BHI7B/DD";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JT3evBR8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118618-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118618-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80EEE3001A68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 00:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2E1EF39E;
	Mon, 13 Jul 2026 00:52:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D17191F98
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783903943; cv=none; b=u+FOSilqvkwks4fsxGWkzQoYCcDge8KlzJD+aXF7rN3A30wP8r53tWYCoW8ZZTUNSDn1yqGTkdhw3ikphyHdEkYAQZQdLfGvFokt5mfIPtOX8big1OG3k8KB+s5SnadN5+v+DWcOTjsaXZSBSSUX8SPpsnHHoTZjoI+6ySztHuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783903943; c=relaxed/simple;
	bh=TlTL9ZN/W4gRx2KsMYdj0iFQDQVV+CyqDhjaL3/Sy3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur7qO75wl8oHszTYsjIw2EI6eoVVcEsM/t9KvG/7YsK5gFLb4kvFDq5OsDTHJLFiABmuSd6bWNO9o/H4x8lQwjp+sNOo3WcJaZ3oxLqXcd4lZh/Z3yLNtGh8ZnqzVVohl0WnQABNl9j+qnDNmX6sA5TlBOSn2vhe3sVFRbOquQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHI7B/DD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT3evBR8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D0kLFf4067402
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UZ1PqNngYs1MCSJO+dFDJiXw
	TAJOcskxTS6eHcQKCNQ=; b=BHI7B/DDop0CPtMc53hmnn+Y/eXKUXC+Ih6S3ICP
	1PCi7pLIUXf2SM4dNp8D/wQbnj7ilA7gsy63pMajKQLQdSsySXn7azLEs21lloMM
	8OiSFcJQ5FJDOJloFaBSyZC1geZVB8aRh65NwALAzwJmvCdgT13xT1ttpnxY78y5
	ArsYgyLe7rwhPPGbltKPHG+riVKrgGp4Ncz6UfMk7Ooe7N58HNLdoBQWNRpTFrJv
	AHV0suld+Ya4nsbcojYCoWyRsRPRr3ypRAMWB8yohwQHIQufIZ9EJj0VPPGxAeRw
	L5CAdd5aBAkQmnkhNwQE5foaL0zHdJa7MOyEhKv6Y5AsCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamuusv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:52:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so35367241cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783903940; x=1784508740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZ1PqNngYs1MCSJO+dFDJiXwTAJOcskxTS6eHcQKCNQ=;
        b=JT3evBR8vUXz9dW2fmONn23snqpadh2X8q1txwrOjgz26fD/mxoNye9t9ZFfaLg0W6
         IFCfY2Ni+ufoXw4r7DQ/T9PjfTw2ax1QXHXHymua4I21xOcAWu4sDHPoCN05zKh9t6XE
         J7VZR8TRvZejN9GbuNV5ra8SzXF9uJ3C57wSDXFGgWRxUyfgxbFz7XZrlkyt/d1JEcXu
         ldMIxndy/wdel065CYNXTxGE0F4jrKPNUpjG9ytXk8R6R1JMpcVE43kCLiMlFUZSN5w+
         62NIa0I70Lqbuv8ppLIF/jaz1Z3dZnJWCVJF8+qIKGLpaJk1XUQiT2TSym0M65+Zvfdo
         njuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903940; x=1784508740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZ1PqNngYs1MCSJO+dFDJiXwTAJOcskxTS6eHcQKCNQ=;
        b=lw9dpAua+yc46fS/6LNKFVaTmQuciNpVvjk0E++OybzMClGQ2BVYwG4TUkXWLB44XL
         bXwlqkGim/DiJ/tewGL1Vy2ILaW5rVsg4nuMd34nrznjc9v2E4EeM81CajTEjCVlGDJe
         w6X4peaK90RJxQWqu4e7wzy63EQBUAiN0udVf+WmdUCfv6plUqssTm8eY9cA/HmN/1GW
         Iw5PDV6g1AY7w3BhU9I2tboieGDjf0p2M6xMt/qeTiVKR1ivSHjewtYhCCazf7PMU2Lc
         E2giGZrlUiSGsWyqsAl9893Y4m2wu1WJ3KSv/o2My26Pn9sIYwjPWPUdZ2PPuWoLZsD8
         O/hg==
X-Forwarded-Encrypted: i=1; AHgh+RpY5Q4kfJ7hAae3fUxMV1gWqxm3WLjvuGDU6Fz3RnNsbfL1dbeIoT85mYGOupETJPl3eyLh0xCBF5uLGCLA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx23fU+wAHRnc2NwRf6MGtBiBofw9PTmPy4928XNNeb3XX82N0F
	XN4uL/qikm0buO2Npx3MMBQ8wo48MRnuHzuT+UAj4IRWw1EBYMNueCZ6CETqSSoRJY0MpUVdMmJ
	8f6qol3X5khuDomhf0Ji0RaSQrUDstytERx6b7C8MzYNCU/gBQNmL/VoiBGG/5Ea8BFTN
X-Gm-Gg: AfdE7cmwwx9AmtM7fUKAqU6xXZVsX+Bu3dHuW75Da/MVThqBE7bx8RVip7Vrv9eQHTq
	DCB1f7MjHaZMkl4CbqE7/9Q8pY7kMrdi+P8oAajDewcnLuv1iRzQCFaDZZdKenNk/mizuKN6uWa
	jSHv4oF9qn0WKjg8d3TRI93iiJJwCC/Wyw4/GPiczP1obGZiJQ2a402bqeIfhs2b6ApG7uOYx2X
	ZBPliHvDo11kFztkvJUi7IfBX8mL+nknERROMbvkUoXOcLmSJmfvostXWBR0bm9OGNh4isWUrA7
	O51zGlfJHvjq27SYGQxDD8w/dFNich0alVN2/EMg0pgMXbSHtHRLJSXriieGgRn3++WfxQrzKAL
	/5UVdvedWe15dvdd+tSWBK+ibY++zxTgy4DsPN7fNxSLaJHvlWTkP9bHTc61Id44/6zCXcnIvEp
	uu75gmdK6zXfmM3otFHjDMheIb
X-Received: by 2002:ac8:6f16:0:b0:516:dff5:68c4 with SMTP id d75a77b69052e-51cbf070fccmr76809291cf.7.1783903939580;
        Sun, 12 Jul 2026 17:52:19 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:516:dff5:68c4 with SMTP id d75a77b69052e-51cbf070fccmr76809181cf.7.1783903939103;
        Sun, 12 Jul 2026 17:52:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd35sm2412088e87.39.2026.07.12.17.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:52:16 -0700 (PDT)
Date: Mon, 13 Jul 2026 03:52:13 +0300
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
Subject: Re: [PATCH RESEND v5 24/25] drm/msm/dp: add connector abstraction
 for DP MST
Message-ID: <4ui4ztzjmyyg42azitguvxqcu7zs2xb5xc7cidckyugsfvv7ps@tdybmvmozukk>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-24-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-24-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAwNSBTYWx0ZWRfX+BPDnl6j4DLY
 OEzlzdEqwuGzJjDkjl/p6AK2nZE6ygz1qhqTrmX3CDjDiYyg9GN60iJHhdEpks/NhZNHUb2z5LC
 W6xoV5hjCHZPj0xHu+cHqoAEOdtdZoY=
X-Proofpoint-GUID: Felq0SrS_VUaXE04oySgBIIhmWME2D0B
X-Proofpoint-ORIG-GUID: Felq0SrS_VUaXE04oySgBIIhmWME2D0B
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a5436c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=VJSk_efHP0iEdrlVDEoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAwNSBTYWx0ZWRfX/uiYhlQzi2EE
 ZMn6evFsQJhVBzyi6VMCPCXzbJhqWkUSxDmojvZPZH3Opn6GB07GqfKD0ZUpZSHYroqBrN+/y9F
 5HWR9r/JrKBOnnTUkJNDjEYaPmeTHihPl6/rJVGZdCaACsSMSYrxIN1CKIUhT/KxsAgwEDcLhfq
 ibXr1yo5i4SIanm/5q5Tltq0jguRAwhnuGmIS//apth5//Or8FE6646IgQgQi6+0ZgsLZbISR/p
 H8kUo+eVl+5iozp5qS/+sHuAEva5oaEA63bqeIlIBN/9dYTgLJHqszIxD4BPLEEyo6ucf9MNuST
 CKltWRpl4gRmm/H5T/awdEZWTm7Fi8CNFL42S85Ta3KlYprYpm6mra9DRJXukLaP9yffcM9tp60
 QxMZJc1+B3jVL5b049JGahxWcbCCt6Fg596VPRryX83mRzHCGHsc1dMatuiXBr0o4yTC4uD41Y3
 dGC5TL/NMxMHCKfGM0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130005
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118618-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tdybmvmozukk:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 679227465DD

On Mon, Jun 29, 2026 at 10:14:45PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Introduce an MST connector abstraction for DP MST, with each MST
> connector associated with a DP panel and connected through a DRM bridge
> to an MST encoder.
> 
> The connector is only used for MST helper callbacks, such as detect,
> get_modes, and get_encoder. Display enable/disable, hotplug handling,
> and modeset sequencing continue to be handled by the bridge path.

If it is so generic, can it be completely generic? Can we move it to the
drm/display/* helper code? Or, at least, leverage significant parts of
it there, providing necessary callbacks from the MSM code? It feels that
only the connector -> encoder part is not generic enough.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 232 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 6a77fdef85e9..12b47a413793 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "dp_mst_drm.h"
>  #include "dp_panel.h"
> @@ -50,6 +51,18 @@ static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst
>  	return NULL;
>  }
>  
> +static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
> +					struct drm_encoder *enc)
> +{
> +	int i;
> +
Ca> +	for (i = 0; i < mst->max_streams; i++) {
> +		if (mst->mst_encoders[i].enc == enc)
> +			return mst->mst_encoders[i].stream_id;
> +	}
> +	return -1;
> +}
> +
>  static void msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
>  					struct msm_dp_panel *panel,
>  					struct drm_dp_mst_atomic_payload *payload)
> @@ -275,6 +288,224 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
>  	return rc;
>  }
>  
> +/* DP MST Connector OPs */
> +static int
> +msm_dp_mst_connector_detect(struct drm_connector *connector,
> +			    struct drm_modeset_acquire_ctx *ctx,
> +			    bool force)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
> +	struct msm_dp *dp_display = mst->msm_dp;
> +	struct device *dev = dp_display->drm_dev->dev;
> +	enum drm_connector_status status = connector_status_disconnected;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return status;
> +
> +	if (dp_display->mst_active)

Can it be inactive here?

> +		status = drm_dp_mst_detect_port(connector,
> +						ctx, &mst->mst_mgr, mst_conn->mst_port);
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return status;
> +}
> +
> +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
> +	const struct drm_edid *drm_edid;
> +	int rc;
> +
> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	rc = drm_edid_connector_add_modes(connector);
> +
> +	drm_edid_free(drm_edid);
> +
> +	return rc;
> +}
> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    const struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp *dp_display;
> +	int required_pbn;
> +
> +	if (drm_connector_is_unregistered(connector))
> +		return 0;
> +
> +	mst_conn = to_dp_mst_connector(connector);
> +	mst_port = mst_conn->mst_port;
> +	dp_display = mst_conn->dp_mst->msm_dp;
> +
> +	/* FIXME: use negotiated bpp (DSC, YUV 4:2:0, etc.); for now use

You can't use negotiated bpp, because it well might be that the
negoation didn't happen. Anyway, mode_valid should be returning the
modes which are even theoretically not possible to be set.

> +	 * 18bpp (6bpc) as a conservative lower bound like i915/nouveau.
> +	 */
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);
> +
> +	if (required_pbn > mst_port->full_pbn) {
> +		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
> +}
> +
> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs;
> +
> +static struct drm_encoder *
> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *iter;
> +	struct drm_connector_list_iter conn_iter;
> +	u32 stream_mask = 0;
> +	u32 i;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return NULL;
> +
> +	if (conn_state->best_encoder)
> +		return conn_state->best_encoder;
> +
> +	drm_connector_list_iter_begin(connector->dev, &conn_iter);
> +	drm_for_each_connector_iter(iter, &conn_iter) {
> +		struct drm_connector_state *peer_state;
> +		int stream_id;
> +
> +		if (iter == connector ||
> +		    iter->funcs != &msm_dp_drm_mst_connector_funcs ||
> +		    to_dp_mst_connector(iter)->dp_mst != mst)
> +			continue;
> +
> +		peer_state = drm_atomic_get_new_connector_state(state, iter) ?: iter->state;
> +		if (!peer_state || !peer_state->crtc || !peer_state->best_encoder)
> +			continue;
> +
> +		stream_id = msm_dp_mst_encoder_stream_id(mst, peer_state->best_encoder);
> +		if (stream_id >= 0 && stream_id < mst->max_streams)
> +			stream_mask |= BIT(stream_id);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		if (!(stream_mask & BIT(i))) {
> +			conn_state->best_encoder = mst->mst_encoders[i].enc;
> +			return mst->mst_encoders[i].enc;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
> +					     struct drm_atomic_commit *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
> +
> +	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);

Why is it being called here? Don't we need to perform slot allocation
too?

> +}
> +
> +static void dp_mst_connector_destroy(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +
> +	drm_connector_cleanup(connector);
> +	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
> +	kfree(mst_conn);
> +}
> +
> +/* DRM MST callbacks */
> +static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
> +	.get_modes =    msm_dp_mst_connector_get_modes,
> +	.detect_ctx =   msm_dp_mst_connector_detect,
> +	.mode_valid =   msm_dp_mst_connector_mode_valid,
> +	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
> +	.atomic_check = msm_dp_mst_connector_atomic_check,
> +};
> +
> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.destroy = dp_mst_connector_destroy,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct drm_connector *
> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
> +			 struct drm_dp_mst_port *port, const char *pathprop)
> +{
> +	struct msm_dp_mst *mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
> +	struct drm_device *dev = mst->msm_dp->drm_dev;
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct drm_connector *connector;
> +	int rc, i;
> +
> +	mst_conn = kzalloc_obj(*mst_conn);
> +	if (!mst_conn)
> +		return NULL;
> +
> +	connector = &mst_conn->connector;
> +	rc = drm_connector_dynamic_init(dev, connector,
> +					&msm_dp_drm_mst_connector_funcs,
> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	if (rc)
> +		goto err_free;
> +
> +	mst_conn->dp_mst = mst;
> +
> +	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
> +	connector->funcs->reset(connector);
> +
> +	/* add all encoders as possible encoders */
> +	for (i = 0; i < mst->max_streams; i++) {
> +		rc = drm_connector_attach_encoder(connector, mst->mst_encoders[i].enc);
> +		if (rc) {
> +			drm_err(dev, "[MST] failed to attach encoder:%u to conn:%d rc:%d\n",
> +				mst->mst_encoders[i].enc->base.id,
> +				connector->base.id, rc);
> +			goto err_connector;
> +		}
> +	}
> +
> +	mst_conn->mst_port = port;
> +	drm_dp_mst_get_port_malloc(port);
> +
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.path_property, 0);
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.tile_property, 0);
> +	drm_connector_set_path_property(connector, pathprop);
> +
> +	drm_dbg_kms(dev, "[MST] add_connector done conn:%d max_streams:%u\n",
> +		    connector->base.id, mst->max_streams);
> +
> +	return connector;
> +
> +err_connector:
> +	drm_connector_cleanup(connector);
> +err_free:
> +	kfree(mst_conn);
> +	return NULL;
> +}
> +
> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> +	.add_connector = msm_dp_mst_add_connector,
> +};
> +
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
>  {
>  	struct drm_device *dev = dp_display->drm_dev;
> @@ -285,6 +516,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
>  	if (!mst)
>  		return -ENOMEM;
>  
> +	mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
>  	mst->msm_dp = dp_display;
>  	mst->max_streams = max_streams;
>  	mst->dp_aux = drm_aux;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

