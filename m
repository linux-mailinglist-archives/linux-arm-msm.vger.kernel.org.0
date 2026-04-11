Return-Path: <linux-arm-msm+bounces-102827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAMIFoTe2mmj6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:51:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0AE3E1F82
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84F75301475C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CC52E06EF;
	Sat, 11 Apr 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVCP3bh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYlgGc5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE3213E7A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775951487; cv=none; b=LYoiUVeYl6YpO2V1TAbW+qE/GyyEItOwQIbBC76nePPr2ltyKkSpmPhJyLG2LM8j3ToL47ROJXfvmbQt125VoynfnfJA9+xbdwri9qNmgCo8fpSTONKLMadeBdciMWLatJryRNFn9xHgN4Y/7t3D3Z0i7j1lpLDwzzjkXEue1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775951487; c=relaxed/simple;
	bh=zI4uNtKSlY2Z8udw+bQc7ykqq9bMw9G+6dRGz27mNPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aps2uBJnhgh14q5DwWm4G2pemYgt/jdnpoXvSiute+QQxmkpNdiQ3EfLI71nMJ2e37H+ctcK5gn8Yxy26/bpIZdPR3YPMXbeWEKxW+JWxNnAAqy3FFJVKjhMxnRgaXDtPnXd2quH+1IM+udgj2bwc4jajF+qYiOhTy2U8WEwA1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVCP3bh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYlgGc5v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4lTuF1836204
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3oJOXl83w5zIKf4SQrANUMBi
	1ywOW39XvkHlHjGUHtA=; b=TVCP3bh8Pnd7mX0fAuFTfr39ezaQVSCSedeQEOQe
	syvMjL6vFKorUgVtl2oJhcwDgQMelk0tj7hYgraM688QjNQvE+whOStnXrdcZgE3
	x7/SsYADmo1XMK8hdOc/dga3CTTJCMg5k3l6T3pgmAa7BC8EnWCs0aZx/lqmYaiw
	g3GUhu6qyF9Kdz0N0bMXmI+lkFT+X3nXeU90n+v60qKa4IlmBV0hzNWJ8inf4jKR
	WkFp7cRrVzbtYAW/egNh9RGGLRRrPNR6p6kD6UWCyOpGEom181K5NCXMP2qQMzAa
	Uyz/VVM85KMUb1Yais0TYfxlmcuq/OM50eONcWcNdS0gVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6hgk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:51:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9d52ad9aso13514731cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775951484; x=1776556284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oJOXl83w5zIKf4SQrANUMBi1ywOW39XvkHlHjGUHtA=;
        b=hYlgGc5vy0UQzP5WtpU+oHDAP0561SrGU6C2l39uFK76bSKyDxErA7Qwd3Ut+HMZ1x
         85Zqv0V5NeWBNGSTzZ6yEfpP+EnhVmtfcTg4HSPhSzw8LfNhB0jyRG3MH5xVzrqGxUTM
         1xRPVBkEI6hi6tfy+y3L2Bp8V172Jj4r6KONWINBaClPOBeJKFaATY92Hsty69YX4FmU
         D+VUUtyNo8frtSzaGbNYejkvNmv+YPAWV7/AmdQSsaTx5J3/SKZhh4BEGnq5QP0dwrsr
         mkmDE7kaOzIMfSweP4SKQ7lskicq2erG30lxD6WxSa2PCh6FmZa7Mebe0fZMoWL4a+0B
         60rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775951484; x=1776556284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oJOXl83w5zIKf4SQrANUMBi1ywOW39XvkHlHjGUHtA=;
        b=nJnjuAwVNNapzW5qfCS5AYGBEzzhy0zyIYPUdNLqe9PEOKL+uPBZ17hrSptxxDP872
         Ky5BfFJrAYrXx47ZSaOwXGqDw4Gv9KR2B/TupTVPZX3eoKBkzQRzkXbUr+qIhpSpX98U
         UOxm86B02FIkhD4oq1sqMonC9EX50ovmzAz7l9HPZoNQgvUKoOq54sXJpPUUPlpiHAnD
         cd5TgHj8YnCXJO+TKEgM8EpzrWqrWiKEnHXiz8T1CVfKkrZ7mjEpPLT7aHZnxh8ZFKiU
         L79DLye1Al8dz/pkH4j/64FTLGxwq1GgODmplcaEoHVM51jDtElSX9SDjhXRY/hL/PS1
         EQNw==
X-Forwarded-Encrypted: i=1; AJvYcCW1mwJcJocSH4jLvhylXuH8jpVec75C9jfnb1tfY5GoKfRFJXjBtCaOU+Nox68aPNc+EcEz+R2BnchH+DfS@vger.kernel.org
X-Gm-Message-State: AOJu0YwlaKuC5d0xCsUEJecfTawMfTKGZXcwualEIRQK+tzcSmPdf0do
	eRooq9e6ss3lSFzvUtvFG7DZlJHtyz13vxmuviBjvfgiucFF9m0YYgCU3T7V/W6Sk2LB9MnZWrN
	YJ0vxZIu3WEgviX9WkD4iNZOngEU65TKqdLQ5a4j+SjbqPC/dFBIlVUbl/J2AUaNMi0mN
X-Gm-Gg: AeBDieuFs5Ob3SfmLAW6ZrFE797FLDqMFkH8GSChxW64QtDcR4kTjQl99SmzTVGdK7v
	6fB74+7IQbxOLYLL6+p4HJWWAOPOHv8Gm3gwo2762BXaDT99CSuTU/DdDzaC9dZ3hcgs7tiDcfr
	DhUrVFxfG+E9GbX/KVPvbyiBtB0zc4zG/Rla34LsNcsjldgvhKqmB9CT6C8kxBpXhtRdhMuP85d
	WAjLOuE10ABJ6kZdn+XgyGGZROreYfJ2D5IQvzV8pYapLooI3VWKZzrA4IBRMtdO5QLlpQWUw/c
	IGR5v760+Symugf+uUce2vHEvlsSnDCbdTjWpOykbPw+rEeQTzKlEcXeiu/6XjHF5My0CTxy45L
	Mdm8TACGdrebwrRL1rWT3XLuka4nuHBxp8hvYq0cxYUWsej2kwHtxIy5iqT1hAG0LdjKpfubQ6K
	vvXJVU8zcgIHQQ9xpo/ODmX1Ec6lWjD9vqh+0=
X-Received: by 2002:a05:622a:6bc5:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50dd5baafddmr89992561cf.30.1775951483894;
        Sat, 11 Apr 2026 16:51:23 -0700 (PDT)
X-Received: by 2002:a05:622a:6bc5:b0:50d:8c24:20f2 with SMTP id d75a77b69052e-50dd5baafddmr89992401cf.30.1775951483366;
        Sat, 11 Apr 2026 16:51:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef08c10sm1663298e87.83.2026.04.11.16.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 16:51:22 -0700 (PDT)
Date: Sun, 12 Apr 2026 02:51:19 +0300
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
Subject: Re: [PATCH v4 34/39] drm/msm/dp: add dp_mst_drm to manage DP MST
 bridge operations
Message-ID: <eu2anl6dx3gctpimozko3a22puleyjrd7jwk7ygygghj6dyry3@fb24egr6letf>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-34-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-34-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIxNiBTYWx0ZWRfX5F6UH+2BP8Hs
 retsxO7rJ5BD5Me5f5Mxi5b3kacvQBu/gD/mqDFGAAvnfPag33LoTwEQFE+hytffelKi5mtEeES
 5POluzXxMBqK0ogxywMf7TrOSn1MWcgCCBiBsk7/yanPe0q/tGftfaQ5r+POwo6VMzUn3BeraLV
 aiGAaQLn5Gb/nmBhcsCCZG8eCwSqvgCor9j3LUnAsaJz78tG/KsnFKy47q4XTmjk7zrRGcoFTfu
 kDyVplPnsM4ElosJalj+VKGCsw9xLsoHriOViEpbH8AjUKAUcQl90l01wls+ImYKr5uvHI5iahB
 J4sZt/WSVylEFNmhbFsk2hPjY29TdEx/kFuXKZW4ZW+v+MMgOj1XC4aUxM4YkVjDT4gKZhB1YXY
 +BoeSsxa/tqkFLD+uqb02hQs8NEdj1TBJTVVABDqSUwfS3449bnBP5wZd/wWZZF5jtFY5XpwAiO
 jknQWZAP9g5XZJ/RJrQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dade7d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=c_jRCA7w00fGOAweXKEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RITANP9j8hi_yVKR1lcfrfXbUvWCNvpF
X-Proofpoint-ORIG-GUID: RITANP9j8hi_yVKR1lcfrfXbUvWCNvpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110216
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102827-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA0AE3E1F82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:09PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add dp_mst_drm to manage the DP MST bridge operations similar to the
> dp_drm file which manages the SST bridge operations. Each MST encoder
> creates one bridge and each bridge is bound to its own dp_panel
> abstraction to manage the operations of its pipeline.

This doesn't explain the most important part: why do we need a bridge?
There is nothing else between the encoder and the connector. The bridge
state is almost empty. Can we squash it into the MST connector?

> 
> Keep the connector/panel association in bridge private state for atomic
> assignment and release, and mirror it in the bridge object for runtime
> bridge callbacks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   6 +
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 459 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h           |   7 +
>  3 files changed, 471 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d7ce13a4586d..89868443c0fe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -692,6 +692,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  					DPU_ERROR("encoder init failed for dp mst display\n");
>  					return PTR_ERR(encoder);
>  				}
> +
> +				rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("DP MST init failed, %d\n", rc);
> +					continue;
> +				}
>  			}
>  		}
>  	}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index b6c7b8211025..4df3ea5e36d0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -13,8 +13,47 @@
>  
>  #define MAX_DPCD_TRANSACTION_BYTES 16
>  
> +#define to_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> +#define to_dp_mst_bridge_state_priv(x) \
> +		container_of((x), struct msm_dp_mst_bridge_state, base)
> +#define to_dp_mst_bridge_state(x) \
> +		to_dp_mst_bridge_state_priv((x)->obj.state)
> +#define to_dp_mst_connector(x) \
> +		container_of((x), struct msm_dp_mst_connector, connector)
> +
> +#define DP_MST_CONN_ID(x) ((x)->connector ? \
> +		(x)->connector->base.id : 0)
> +
> +struct msm_dp_mst_bridge {
> +	struct drm_bridge base;
> +	struct drm_private_obj obj;
> +	u32 id;
> +
> +	bool initialized;
> +
> +	struct msm_dp *display;
> +	struct drm_encoder *encoder;
> +
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +};
> +
> +struct msm_dp_mst_bridge_state {
> +	struct drm_private_state base;
> +	struct drm_connector *connector;
> +	struct msm_dp_panel *msm_dp_panel;
> +};
> +
> +struct msm_dp_mst_connector {
> +	struct drm_connector connector;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_mst *dp_mst;
> +	struct msm_dp_panel *dp_panel;

After squashing the bridge to the connector, you might need to separate
state from the non-state variables.

> +};
> +
>  struct msm_dp_mst {
>  	struct drm_dp_mst_topology_mgr mst_mgr;
> +	struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
>  	struct msm_dp *msm_dp;
>  	struct drm_dp_aux *dp_aux;
>  	u32 max_streams;
> @@ -22,6 +61,419 @@ struct msm_dp_mst {
>  	struct mutex mst_lock;
>  };
>  
> +static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> +{
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +
> +	mst_bridge_state = kmemdup(obj->state, sizeof(*mst_bridge_state), GFP_KERNEL);
> +	if (!mst_bridge_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &mst_bridge_state->base);
> +
> +	return &mst_bridge_state->base;
> +}
> +
> +static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
> +					    struct drm_private_state *state)
> +{
> +	struct msm_dp_mst_bridge_state *mst_bridge_state =
> +		to_dp_mst_bridge_state_priv(state);
> +
> +	kfree(mst_bridge_state);
> +}
> +
> +static const struct drm_private_state_funcs msm_dp_mst_bridge_state_funcs = {
> +	.atomic_duplicate_state = msm_dp_mst_duplicate_bridge_state,
> +	.atomic_destroy_state = msm_dp_mst_destroy_bridge_state,
> +};
> +
> +static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
> +								struct msm_dp_mst_bridge *bridge)
> +{
> +	struct drm_device *dev = bridge->base.dev;
> +	struct drm_private_state *obj_state = drm_atomic_get_private_obj_state(st, &bridge->obj);
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> +
> +	return to_dp_mst_bridge_state_priv(obj_state);
> +}
> +
> +static void msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
> +					struct msm_dp_mst_bridge *mst_bridge,
> +					struct drm_atomic_state *state,
> +					struct drm_dp_mst_port *port)
> +{
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> +
> +	if (!payload) {
> +		DRM_ERROR("MST bridge [%d] update_timeslots failed, null payload\n",
> +			  mst_bridge->id);
> +		return;
> +	}
> +
> +	if (payload->vc_start_slot < 0)
> +		msm_dp_display_set_stream_info(mst->msm_dp, mst_bridge->msm_dp_panel,
> +					       mst_bridge->id, 1, 0, 0);
> +	else
> +		msm_dp_display_set_stream_info(mst->msm_dp, mst_bridge->msm_dp_panel,
> +					       mst_bridge->id, payload->vc_start_slot,
> +					       payload->time_slots, payload->pbn);
> +}
> +
> +static int msm_dp_mst_bridge_pre_enable_part1(struct msm_dp_mst_bridge *dp_bridge,
> +					      struct drm_atomic_state *state)
> +{
> +	struct msm_dp *dp_display = dp_bridge->display;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(dp_bridge->connector);
> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
> +	int pbn;
> +	int rc = 0;
> +
> +	mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
> +
> +	pbn = drm_dp_calc_pbn_mode(dp_panel->msm_dp_mode.drm_mode.clock,
> +				   (mst_conn->connector.display_info.bpc * 3) << 4);
> +
> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> +	if (!payload || payload->time_slots <= 0) {
> +		DRM_ERROR("time slots not allocated for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
> +		rc = -EINVAL;
> +		return rc;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d pbn:%d, slots:%d\n", DP_MST_CONN_ID(dp_bridge),
> +		   pbn, payload->time_slots);
> +
> +	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
> +
> +	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
> +	if (rc) {
> +		DRM_ERROR("payload allocation failure for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
> +		return rc;
> +	}
> +
> +	msm_dp_mst_update_timeslots(mst, dp_bridge, state, port);
> +
> +	return rc;
> +}
> +
> +static void _msm_dp_mst_bridge_pre_enable_part2(struct msm_dp_mst_bridge *dp_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	struct msm_dp *dp_display = dp_bridge->display;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(dp_bridge->connector);
> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct drm_dp_mst_atomic_payload *payload;
> +
> +	drm_dp_check_act_status(&mst->mst_mgr);
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
> +
> +	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "MST bridge [%d] _pre enable part-2 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void msm_dp_mst_bridge_pre_disable_part1(struct msm_dp_mst_bridge *dp_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	struct msm_dp *dp_display = dp_bridge->display;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(dp_bridge->connector);
> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
> +	struct drm_dp_mst_topology_state *old_mst_state;
> +	struct drm_dp_mst_topology_state *new_mst_state;
> +	const struct drm_dp_mst_atomic_payload *old_payload;
> +	struct drm_dp_mst_atomic_payload *new_payload;
> +
> +	old_mst_state = drm_atomic_get_old_mst_topology_state(state, &mst->mst_mgr);
> +	new_mst_state = drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
> +
> +	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, port);
> +	new_payload = drm_atomic_get_mst_payload_state(new_mst_state, port);
> +
> +	if (!old_payload || !new_payload) {
> +		DRM_ERROR("MST bridge [%d] _pre disable part-1 failed, null payload\n",
> +			  dp_bridge->id);
> +		return;
> +	}
> +
> +	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
> +	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
> +
> +	msm_dp_mst_update_timeslots(mst, dp_bridge, state, port);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "MST bridge [%d] _pre disable part-1 complete\n",
> +		   dp_bridge->id);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
> +						struct drm_atomic_state *state)
> +{
> +	int rc = 0;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct msm_dp_mst *dp_mst;
> +	struct msm_dp_panel   *msm_dp_panel;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_dp_mst_bridge(drm_bridge);
> +	mst_bridge_state = to_dp_mst_bridge_state(bridge);
> +	dp_display = bridge->display;
> +	dp_mst = dp_display->msm_dp_mst;
> +
> +	/* to cover cases of bridge_disable/bridge_enable without modeset */
> +	bridge->connector = mst_bridge_state->connector;
> +	bridge->msm_dp_panel = mst_bridge_state->msm_dp_panel;
> +
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	msm_dp_panel = bridge->msm_dp_panel;
> +	mutex_lock(&dp_mst->mst_lock);
> +
> +	rc = msm_dp_display_set_mode_helper(dp_display, state, drm_bridge->encoder, msm_dp_panel);
> +	if (rc) {
> +		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> +		mutex_unlock(&dp_mst->mst_lock);
> +		return;
> +	}
> +	msm_dp_panel->pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
> +						 msm_dp_panel->msm_dp_mode.bpp << 4);
> +	rc = msm_dp_display_prepare(dp_display);
> +	if (rc) {
> +		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
> +		msm_dp_display_unprepare(dp_display);
> +		mutex_unlock(&dp_mst->mst_lock);
> +		return;
> +	}
> +
> +	rc = msm_dp_mst_bridge_pre_enable_part1(bridge, state);
> +	if (rc) {
> +		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
> +		mutex_unlock(&dp_mst->mst_lock);
> +		return;
> +	}
> +
> +	msm_dp_display_enable_helper(dp_display, bridge->msm_dp_panel);
> +
> +	_msm_dp_mst_bridge_pre_enable_part2(bridge, state);
> +
> +	mutex_unlock(&dp_mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d mode:%s pre enable done\n",
> +		   DP_MST_CONN_ID(bridge), bridge->msm_dp_panel->msm_dp_mode.drm_mode.name);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> +					     struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst *mst;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_dp_mst_bridge(drm_bridge);
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	dp_display = bridge->display;
> +	mst = dp_display->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
> +
> +	msm_dp_mst_bridge_pre_disable_part1(bridge, state);
> +
> +	msm_dp_display_disable_helper(dp_display, bridge->msm_dp_panel);
> +
> +	drm_dp_check_act_status(&mst->mst_mgr);
> +
> +	mutex_unlock(&mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "MST bridge:%d disable complete\n", bridge->id);
> +}
> +
> +static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> +						  struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst *mst;
> +
> +	if (!drm_bridge) {
> +		DRM_ERROR("Invalid params\n");
> +		return;
> +	}
> +
> +	bridge = to_dp_mst_bridge(drm_bridge);
> +	if (!bridge->connector) {
> +		DRM_ERROR("Invalid connector\n");
> +		return;
> +	}
> +
> +	dp_display = bridge->display;
> +	mst = dp_display->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
> +
> +	msm_dp_display_atomic_post_disable_helper(dp_display, bridge->msm_dp_panel);
> +
> +	if (!dp_display->mst_active)
> +		msm_dp_display_unprepare(dp_display);
> +
> +	bridge->connector = NULL;
> +	bridge->msm_dp_panel =  NULL;
> +
> +	mutex_unlock(&mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "MST bridge:%d conn:%d post disable complete\n",
> +		   bridge->id, DP_MST_CONN_ID(bridge));
> +}
> +
> +static int msm_dp_mst_bridge_atomic_check(struct drm_bridge *drm_bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state)
> +{
> +	struct drm_atomic_state *state = crtc_state->state;
> +	struct drm_connector *connector = conn_state->connector;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp_mst *mst;
> +	int rc = 0, pbn, slots;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	u32 bpp;
> +
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->enable)
> +		return 0;
> +
> +	mst_conn = to_dp_mst_connector(connector);
> +	mst = mst_conn->dp_mst;
> +
> +	bpp = connector->display_info.bpc * 3;
> +
> +	if (!bpp)
> +		bpp = 24;
> +
> +	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	if (IS_ERR(mst_state))
> +		return PTR_ERR(mst_state);
> +
> +	if (!dfixed_trunc(mst_state->pbn_div)) {
> +		mst_state->pbn_div =
> +			drm_dp_get_vc_payload_bw(mst_conn->dp_panel->link_info.rate,
> +						 mst_conn->dp_panel->link_info.num_lanes);
> +	}
> +
> +	slots = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, mst_conn->mst_port, pbn);
> +
> +	drm_dbg_dp(drm_bridge->dev, "add slots, conn:%d pbn:%d slots:%d rc:%d\n",
> +		   connector->base.id, pbn, slots, rc);
> +
> +	if (!conn_state->crtc)  {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, to_dp_mst_bridge(drm_bridge));
> +		mst_bridge_state->connector = NULL;
> +		mst_bridge_state->msm_dp_panel = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* DP MST Bridge APIs */
> +static const struct drm_bridge_funcs msm_dp_mst_bridge_ops = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset           = drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable   = msm_dp_mst_bridge_atomic_pre_enable,
> +	.atomic_disable      = msm_dp_mst_bridge_atomic_disable,
> +	.atomic_post_disable = msm_dp_mst_bridge_atomic_post_disable,
> +	.atomic_check        = msm_dp_mst_bridge_atomic_check,
> +};
> +
> +int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	int rc = 0;
> +	struct msm_dp_mst_bridge *bridge = NULL;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct drm_device *dev;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	int i;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		if (!mst->mst_bridge[i]->initialized) {

We _know_ that it is not initialized now. And anyway, it's an error if
we call this twice.

> +			bridge = mst->mst_bridge[i];
> +			bridge->encoder = encoder;

This looks wrong. It's already stored inside drm_bridge

> +			bridge->initialized = true;
> +			bridge->id = i;

Definitely not an id.

> +			break;
> +		}
> +	}
> +
> +	if (i == mst->max_streams) {
> +		DRM_ERROR("MST supports only %d bridges\n", mst->max_streams);
> +		rc = -EACCES;
> +		goto end;
> +	}
> +
> +	dev = dp_display->drm_dev;
> +	bridge->display = dp_display;
> +	bridge->base.encoder = encoder;

why?

> +	bridge->base.type = dp_display->connector_type;
> +	bridge->base.ops = DRM_BRIDGE_OP_MODES;
> +	drm_bridge_add(&bridge->base);
> +
> +	rc = drm_bridge_attach(encoder, &bridge->base, NULL, 0);
> +	if (rc) {
> +		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> +		goto end;
> +	}
> +
> +	mst_bridge_state = kzalloc(sizeof(*mst_bridge_state), GFP_KERNEL);
> +	if (!mst_bridge_state) {
> +		rc = -ENOMEM;
> +		goto end;
> +	}
> +
> +	drm_atomic_private_obj_init(dev, &bridge->obj,
> +				    &mst_bridge_state->base,
> +				    &msm_dp_mst_bridge_state_funcs);

It's already done for you in the drm_bridge_attach().

> +
> +	drm_dbg_dp(dp_display->drm_dev, "MST drm bridge init. bridge id:%d\n", i);
> +
> +	return 0;
> +
> +end:
> +	return rc;
> +}
> +
>  int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
>  {
>  	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> @@ -49,11 +501,16 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
>  		return -ENOMEM;
>  
>  	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
> -
>  	conn_base_id = dp_display->connector->base.id;
>  	msm_dp_mst->msm_dp = dp_display;
>  	msm_dp_mst->max_streams = max_streams;
>  
> +	for (int i = 0; i < DP_STREAM_MAX; i++) {
> +		msm_dp_mst->mst_bridge[i] =
> +			devm_drm_bridge_alloc(dev->dev, struct msm_dp_mst_bridge, base,
> +					      &msm_dp_mst_bridge_ops);
> +	}
> +
>  	msm_dp_mst->dp_aux = drm_aux;
>  
>  	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 5f73e0aa1c2f..03bedd15fe02 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -364,6 +364,8 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>  int msm_dp_mst_register(struct msm_dp *dp_display);
> +int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -390,6 +392,11 @@ static inline int msm_dp_mst_register(struct msm_dp *dp_display)
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

