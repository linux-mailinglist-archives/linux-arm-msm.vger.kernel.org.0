Return-Path: <linux-arm-msm+bounces-102836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OWmCjbk2mn26wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:15:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBA23E2194
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0796A300A33D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454E713D8B1;
	Sun, 12 Apr 2026 00:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKzFu8L+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i18F8WKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870A1A2C04
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952947; cv=none; b=XnVlxtah8hBCvTold39zk1Q0xIqTREK8zypZcGMkQjtiHgLi465nL7dLJ4bsRDjzUm8xnidRA9XFcKrBP75N28o2mcbWZhOn4uVc3uqn30hi76lxjmzbrixXHKjVyaIhrM2n3OLGzGvPRDYhHfZC1jQ1ujTwUE+pNv5fuyMU7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952947; c=relaxed/simple;
	bh=7mOOEK4ybCHEibTynUMeXCEMKeZb64hHamkv8W5exGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzkWVN/3+XVEtmEv/QX52rMwUj8cMWnSO1USsbg4vaiC9x0obZItfjZ8qbRODuGjOaquRXWXrUttO4FFL2IAMuUgNgDVdiaGU8i7C5J+klIP2bjbNQqhUOFqyEAQjw/f5FZp7LKyESkHDm4c5Ua69YDesKG40ZbtTSbN6tKvzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKzFu8L+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i18F8WKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BLgbrZ1862245
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jxT+ezVQFqvL0qhq3TEQ7PNG
	qa40HwvJ6vHkB4vN5Is=; b=eKzFu8L+nZRkz8D5b9prDJBdSsFlaKvN/sSrgNKT
	hz65wIg1XJpBAI0Plon8D5ODFUbLLQyvPJ9hVsb1p22GD2lZTnceeEe0axRwZGc8
	hUUcrmsKVtvVcZJ4lGvJfxhlullctUUomjgjLY0CweTQXsbadaO8hY0WrU2NHVrB
	OIAZUv5RJExR/wzPvLgGNX39kxqz6txiXiyzEdbCHDeh23Fb7h97En1C0jBjIrUF
	sV0v38d2l8Ub45yqOWsB5e9a9GT0hX6kX3Sl8OnwqXoLgLhXBJHKW3etGHSOqtci
	uHFRHLz6YfY9GSYHvimuNguxYHz0cLEEboDSrtymRKP4oA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew01j2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:15:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so34407301cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952944; x=1776557744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jxT+ezVQFqvL0qhq3TEQ7PNGqa40HwvJ6vHkB4vN5Is=;
        b=i18F8WKfEeVWnsNRf76AaGVmpWkmXQtmHzYItNmrflWFA5UhmbHoeO7f1aZw7v8+o3
         5ZaP12JuSpg4vYEuMQMFPGtdGeUyOgYh10BOrw5ufbf6X2K9H2/jkgjMFLAfNS/wWkWW
         lcHFeZ7s6GhoA/0+tZdDLm+cII4Oc7KcXQkmw4bojOOJnWhFPTS876VmUp9aQGWdihVA
         Npmw3aHm9a5ps8BUfBG0JC+bFwAXJDpk3wGKclYLY+J96nPvzOlm+HtFHgfOAbGz6oOz
         wI8TJVxuofQ9CKUc7uM5fYuQfp+XweGm3r8jYFN0zlwrrZL4UwAvBuGJV7LObK72tGHs
         usBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952944; x=1776557744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxT+ezVQFqvL0qhq3TEQ7PNGqa40HwvJ6vHkB4vN5Is=;
        b=ETyB7pp90vPYp1AwtxejPWRicrU7CxT7TwrA0eEwsUmx3yZD4i8QhOex1FNdYlMB+q
         ZrbwXAKQ2xkIGcc6xBZZsweTTvEbUrcJ+F/MBAUBw+PPo4qGQ3e+vk98ZkI4iLU/3FHx
         B3M1yb6typ1boKEsdrAC7r4huGEHKOW+LaIDwvMsgzPxKzAtODaV7uv03YvLHfK0ce1H
         1vC8HXDRDGd+86FutfYgYvtol59O7DVCl41oUCgiVuaC9KnQpmaz56L12S8JB9XQymZk
         lGDbPxfWvZv/sFiWL10WzywQFqH6CDhdWa2lTrqwdCCUBeNyEFeDqcwesZfz7WrZVxv4
         k1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjHmsBPBGlnbuRuRT/I/v6+yiW5pB87BcL0lcjqplkkDMQWwO4y7WYYmil95hbQT1gvPVA8QV8rSgOBfLF@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCEpQiRcAtDFZyQSDwhDErH3saaxgIjpKNfUBTqAEoB0q2yGh
	02i3K8pKOgXSr7l5FOSYF6T5Ckqfnu/mfauRTKEMeW2ZkAaKaGoswkmfITc1shTZCAY5P5wHkQ6
	7T98opAF5KRGgN5s8tW4OXDEhCrisPVbkbeeYg6xO7RElaX33kg2ItozW2BHA7cmozjmc
X-Gm-Gg: AeBDieuIrFFD+kzGbEdG89Z161YTmgm9QdOc6H5URvK3LRoPShVa6n6WoY5QYQowthk
	03hqFmcu2uLiuUb09E+o+xlkWxUV8U2N5G7+ItG9b45Zbt1Ub2bj+RM0fdwX3lGU9C+1Q6OhxDe
	cEPqC4fFscI/FnFUHeewZhPHjlbCjM/5KkF94OPH7ZZHoaA0MJweaHFMT1EaFnfrPVHsgnFl7d8
	YQMk9HO/M+tnM89JBLLLD4wLthzznB1BOywDLlQSM4GCfftCwt6A+kFBXudlLJB+Ep8xEsCPpbr
	fqFHvsoGIocpDIXQPNxuKFIqrnPBnGFJs3ojjL4fj7EiORPG+vzFnwYD/676e/oDdtST9D59AI0
	r32JjUQEwFnjokHtFJ4ma5+Uvi3ebmPDW8CAvSaXV1vwPVMIn9l8eb2UIKOXs+4hwhO+V3wtSgA
	T0TtJ6n68zlQuLD0yTg95ejtXGtIpjGlao3Do=
X-Received: by 2002:a05:622a:30f:b0:50d:8350:9a15 with SMTP id d75a77b69052e-50dd5750e53mr138011781cf.0.1775952944031;
        Sat, 11 Apr 2026 17:15:44 -0700 (PDT)
X-Received: by 2002:a05:622a:30f:b0:50d:8350:9a15 with SMTP id d75a77b69052e-50dd5750e53mr138011471cf.0.1775952943608;
        Sat, 11 Apr 2026 17:15:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm1700379e87.80.2026.04.11.17.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:15:42 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:15:38 +0300
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
Subject: Re: [PATCH v4 29/39] drm/msm/dp: add an API to initialize MST on
 sink side
Message-ID: <32jtwnkusxultvsgvnalrvccfkcyk7744yf4d42pqm7wudysvt@l4pnrzfxh2f4>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-29-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-29-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMCBTYWx0ZWRfX8KtktSFgca38
 XSs6D2GhrOMCbIpYJ85vwVYz8I7lJfzmlsTTRi68CLVncTFCcJoeGuaLnyyUA0ntGSgNidwLFyw
 FM9WPgr6IHng0twQoro0/SD+8X9WFaiZN9IRTW+avc1C+YTXTq3T0aYQZTc7S6A2zn05bdWnZPY
 68figaqqWQ54+XEjIg/MioVOlrG7l6wffM28ZWjRPkX8YRIRWqUfsg2COZ6dmp0w6lgZNBZWv3P
 zO99WaK+7IywG4UtmPFlz6sKsYtFHOO2b7YmbCJ1Ew5sYTKtFmbU0mu8fQgPb3PC69QqWcWBS83
 ZgY3GxAGvadBuxlktgSfxEeXTMV25xUMXIcmqvq917GQKFciX2d+NOJ8/08lQRJmYmVe0aMXKWC
 xFMMLLaWM7lRoIISZgcYwpX5mpxKFjy0eUFJyEOkt5WmDloUImUBCi4eH9JKeTYm+23ttzQ2Hyn
 m4Fi7b0XLdhwozpA8xQ==
X-Proofpoint-GUID: MUTiv-YbKcqSL8LfGzcFLasrGEvMZbzo
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69dae430 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=FHX0uZl4Zi1gEOnxAXAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MUTiv-YbKcqSL8LfGzcFLasrGEvMZbzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102836-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEBA23E2194
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:04PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> If the DP controller is capable of supporting multiple streams
> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> DPCD register to enable MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 57 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8ae690ce2b9f..abf26951819a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -14,6 +14,7 @@
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
> @@ -270,6 +271,40 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>  	return lttpr_count;
>  }
>  
> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> +{
> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
> +	u8 old_mstm_ctrl;
> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> +	int ret;
> +
> +	/* clear sink MST state */
> +	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> +
> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
> +		return;
> +	}
> +
> +	/* add extra delay if MST old state is on*/
> +	if (old_mstm_ctrl) {
> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
> +			   clear_mstm_ctrl_timeout_us);
> +		usleep_range(clear_mstm_ctrl_timeout_us,
> +			     clear_mstm_ctrl_timeout_us + 1000);

For 100 ms you should be using msleep() instead. But where is that
timeout coming from?

> +	}
> +
> +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
> +				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);

Isn't it too early to enable MST? (I don't remember this part of the
standard).

> +	if (ret < 0) {
> +		DRM_ERROR("sink MST enablement failed\n");
> +		return;
> +	}
> +
> +	msm_dp->mst_active = true;
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -288,14 +323,19 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> -	drm_edid_connector_update(connector, drm_edid);
> +	if (!(dp->max_stream > 1) || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> +		drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!drm_edid) {
> -		DRM_ERROR("panel edid read failed\n");
> -		/* check edid read fail is due to unplug */
> -		if (!msm_dp_aux_is_link_connected(dp->aux))
> -			return -ETIMEDOUT;
> +		if (!drm_edid) {
> +			DRM_ERROR("panel edid read failed\n");
> +			/* check edid read fail is due to unplug */
> +			if (!msm_dp_aux_is_link_connected(dp->aux))
> +				return -ETIMEDOUT;
> +		}
> +
> +		if (rc)
> +			goto end;
>  	}
>  
>  	msm_dp_link_process_request(dp->link);
> @@ -317,6 +357,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> +	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> +		msm_dp_display_mst_init(dp);
> +
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
>  end:
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

