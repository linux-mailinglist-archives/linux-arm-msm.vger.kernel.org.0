Return-Path: <linux-arm-msm+bounces-102824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKldH7nZ2mlI6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:31:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C623E1ED8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 01:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88E563003D05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A447286D7D;
	Sat, 11 Apr 2026 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akeIq2Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kK9Pzb3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB7355F5F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775950263; cv=none; b=YY3oM5C3UeVfujRTDGPwP+6l4ONGBPAs9BoPysAoKdQRf+Z7I85Z4VYj463lswvGEscGhRx1AjMYjLv7w3mXXypZ9PQGt11lthe2OMlSnnl16Otpbf3gJLyM6x9QNORw0gpDdXXDnBbMszKIujouyESp5WDJhMWnDM6eCJ8MhDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775950263; c=relaxed/simple;
	bh=19iUdEVjisOUsOFK8uUXbxu6zA4vWBWS3rba/U1SFrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoKiDhJBR5OJtBy8WBBcDSPWQgiaC3t86EjRnC9VP1NMqwOjk+dp8Wro6JKxkzIhgcHvZD/MH/Z5VuQGqEK/WgmEocY5OMWEBpE88mycxzHUPy2+LoNq2GuKxPnZk35BgLEmO+3qDZk5PmxW37A0nKEoddFOJ62o3Qq4b70W3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akeIq2Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kK9Pzb3u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BMN7m63955702
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4xYgpqQyRdxb5ffl5pkVoPqF
	/oUZhBzWtJrFUvf9RlY=; b=akeIq2Cm1PDnHAIMsZgyNt6h9w80p1sgsNJ//cp8
	qmVusBZkzLdUiymqfSdgklmyxTXvbq28mC/Rru9LjRQf8WzBG+4JptI9nXQPxSdW
	oDMTWEBpjipwHAHnT9M/lxbJMazWUMiDYrtQFwYl3sdCvZ3pS3w0N0G8kv8+uiEK
	H7swtgNZ9K0SWvNE+e/Lzj3a3TzHN5pcybbDEyWfyVKS7aD6V/uFH5B5YREz7IXj
	aNebUwqjXhO6L9lcUGFbDvyNxZlVg/j7pnlg1rcwIpucIeEa5UgQ1j5iATCw6sJl
	PiGchwBzjzARPCGy5ImEUo6JOxYPHz4X1mmTSXOTqRd9rA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6hfvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 23:31:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso16096911cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775950260; x=1776555060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xYgpqQyRdxb5ffl5pkVoPqF/oUZhBzWtJrFUvf9RlY=;
        b=kK9Pzb3uE03BKMjquEuesR2b6E7d0YgyMqmcuKXL2qVdfo9x1dVhuaUVlhVdZZVuTS
         GMWUJ7BFuch0Rv5BsnOgAl891aDXNh74ZToNQ92aF4ykIz4oCnrzrbXOWZegt9+rKCD7
         ZPzcvSkMMX5bZaK4vDrqebDzISNp+QKcvlbOSC485Uw1z5WB+LmwNsHHi+b/Tlxg1SP2
         n2YZ8ke+DnQEtUE7K1vSMZq79aypDze7i1DzaV5bhOjplfTs/i1ya9OtDbqc2aZEI1lP
         Xk6Wl/CD4hKyrewHtFoom7ovEdQijfhrZq3bwgbjRwtrGZOAQk/zv9Gd315dFCCn/xu6
         XsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775950260; x=1776555060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xYgpqQyRdxb5ffl5pkVoPqF/oUZhBzWtJrFUvf9RlY=;
        b=kNzsEj2qpVWjjH4FO5DFih/WEbLwbIZpZE3hOsoL40BlwWx23vSyvHtdEhxQs9gElC
         tRzErjC6vr4yjGvylNvXRas41yYwAv24vj/UHgqcDHfbtFtIJ0INIBiXz3SP7Iun/9id
         JTE/wRv5bR9gzCXpIFnNgPGUylk287p3bGKpbrDTfeQj2VCFxCLIWkBInTQbZp3UTys5
         iy1Bzja3rO1BWG4sOTpbFlXc83EAbz3LuDEw3Tjx5JA6u0aLfTnHXP/uS9kWBFreJb/8
         vUpyFKv8p/Z/HCbAuoOFv1/qv+2ShNPL+6tZ4V0gey5LP47OlVd7w3bcDv2SvEEvNHfK
         lZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXf+bBfQ2bdV4N7goKC5++9gjvfKXbfo30WBXX2mLXERiYTasebdoS8MeCpCDJ2nSpxhl/gFh8mxXFUGL/l@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vBEFXFgWJ/XzghO3OIJXi4/tmw5yQyjMvFWccL8u1z8N4t8Y
	1V1ayGxzTidr2JKU3mxlPYACBjeDvjcVC/xlWbDjzwQ/31w2BFrOKBc4i9ujcj0QtGBD9M88FeU
	v3ix9BKIpr/R2Wvsmx1qkfqhB/Z0asFnotBpbYZqxc8jGx4/zJwhQaMggid73MELw8jW7
X-Gm-Gg: AeBDievbxwp8/aMieycTeyWPLv/bDeX49Jg5cuAByQf4sqhxuNXBcWh7Hz9PRx1/E9C
	DDI/8V/OPWycnasyvUCRUwYn+z/qf+Jp4FOd7qi2UBi/JXgBS6goOPdfw07Ou6+Ix69IgpSV1lu
	/q1L+9v/xTS7l5HFLsqcb90QPr887a78m5lwp38uGqlU1UgphxHEuhHBLUJymD6VS0enqYCmMKR
	HxmZGZRxbfr6zWe/iRh+hD8Doksi0rc0DfMSFE0m/VDqH/DH1yO9mfijVy6SrTHqwYgGaAhFM+v
	cvn9rXXA5/YYBZ31AzvbG1bBVfxF9mnzTkDao47k/Gqb28fvsuyh2Ot9aRSkuYz+nn9z0f64wMj
	u2B/cQLPD0a4Romg/oNZidJhYLLunKq+KTv/wxYfa2gZDERiPtsItl6PDKan1Vd0HTIFVNmMACj
	lk8U4KhVXmSW65GHOLiVOFB9K/UlnZdmHFM6U=
X-Received: by 2002:ac8:7d11:0:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50dd5aeef70mr131406881cf.16.1775950259608;
        Sat, 11 Apr 2026 16:30:59 -0700 (PDT)
X-Received: by 2002:ac8:7d11:0:b0:509:35d1:ca37 with SMTP id d75a77b69052e-50dd5aeef70mr131406581cf.16.1775950259119;
        Sat, 11 Apr 2026 16:30:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefbb10sm1669696e87.67.2026.04.11.16.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 16:30:58 -0700 (PDT)
Date: Sun, 12 Apr 2026 02:30:56 +0300
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
Subject: Re: [PATCH v4 36/39] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <dtxzkmq27sny2jzvvzuuxkktbgu6etmgaktcrtes4txprsfroe@zvu4xq4lm7og>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-36-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-36-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIxNSBTYWx0ZWRfX1V3lWDBCgezW
 o8Cgi9yCWxiHHBeIM8JKFlMAOmlaBeNk804gsZVVhM+Z7yvqvoJSSxc0iaJfoB47SB/rUZR7+EI
 bj1BV8LLRvAng93xA1kTwGSyE1yT2ovLb/KwQmW7RZxnulums/MpzdrhzrXMFaSVgaQB1Vmfge/
 DtLze70OV3zOCh2OrxjK4/cQf7EW8SHqwvIEK0JwiHCofJ+pvx76T5gCNKfhseDoUhvkJN2yqE+
 BUqVFKRe77u8kHKQyU2gzZ0i9OH/RJq3OMGlxvwG+Xk/tqF78xMdvjK9Nj97J6feKwaQ8n/f7C4
 p5FTLHXa0mgVqLXELnozQT8zLkKQMW1SY266IH+pdVhSDryCtsVl0HNc6pBTOun+dbSdBNzQV2I
 6RnNfMyVQ6xfxa45r3udF6tR3uqd6/gAxlVh0v0Bc7HA6XRwF8FWSgLWl/JkTUM0oJtSy7v5+e5
 wKyCCnb/AuSHCxLfB6g==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dad9b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_6m5guDCh3g6KUuHqoUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q7G587aUVQuows6I1tued6gYx3vd-sTA
X-Proofpoint-ORIG-GUID: Q7G587aUVQuows6I1tued6gYx3vd-sTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110215
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102824-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21C623E1ED8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:11PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Introduce an MST connector abstraction for DP MST, with each MST
> connector associated with a DP panel and connected through a DRM bridge
> to an MST encoder.
> 
> The connector is only used for MST helper callbacks, such as detect,
> get_modes, and get_encoder. Display enable/disable, hotplug handling,
> and modeset sequencing continue to be handled by the bridge path.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 231 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 4df3ea5e36d0..bb3898b1f6b1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "dp_mst_drm.h"
>  #include "dp_panel.h"
> @@ -489,6 +490,235 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
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
> +
> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> +	drm_edid_connector_update(connector, drm_edid);

Missing drm_edid_free()

> +
> +	return drm_edid_connector_add_modes(connector);
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
> +	if (!mst_port)
> +		return MODE_ERROR;

Protective coding?

> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (6 * 3) << 4);

Can we actually support 18bpp? At least it deserves a FIXME for bpp
negotiation (for the DSC, etc.). More practically, we have YUV,
espcially YUV 4:2:0, which uses less than 18bpp, if I'm not mistaken.

> +
> +	if (required_pbn > mst_port->full_pbn) {
> +		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported.\n", mode->name);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	return msm_dp_display_mode_valid(dp_display, &connector->display_info, mode);
> +}
> +
> +static struct drm_encoder *
> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
> +	struct msm_dp *dp_display = mst->msm_dp;
> +	struct drm_encoder *enc = NULL;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	u32 i;
> +	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
> +										    connector);
> +
> +	if (conn_state && conn_state->best_encoder)
> +		return conn_state->best_encoder;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
> +		if (IS_ERR(mst_bridge_state))
> +			goto end;
> +
> +		if (mst_bridge_state->connector == connector) {
> +			enc = mst->mst_bridge[i]->encoder;
> +			goto end;
> +		}
> +	}

I thought you wanted to get rid of the msm_dp_mst_bridge_state. Let me
see...

> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
> +
> +		if (!mst_bridge_state->connector) {
> +			mst_bridge_state->connector = connector;
> +			mst_bridge_state->msm_dp_panel = mst_conn->dp_panel;
> +			enc = mst->mst_bridge[i]->encoder;
> +			break;
> +		}
> +	}
> +
> +end:
> +	if (enc)
> +		drm_dbg_dp(dp_display->drm_dev, "MST connector:%d atomic best encoder:%d\n",
> +			   connector->base.id, i);
> +	else
> +		drm_dbg_dp(dp_display->drm_dev, "MST connector:%d atomic best encoder failed\n",
> +			   connector->base.id);
> +
> +	return enc;
> +}
> +
> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
> +					     struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
> +	struct msm_dp_mst *mst = mst_conn->dp_mst;
> +
> +	return drm_dp_atomic_release_time_slots(state, &mst->mst_mgr, mst_conn->mst_port);
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
> +	struct msm_dp_mst *dp_mst;
> +	struct drm_device *dev;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct drm_connector *connector;
> +	int rc, i;
> +
> +	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
> +
> +	dp_display = dp_mst->msm_dp;
> +	dev = dp_display->drm_dev;
> +
> +	mst_conn = kzalloc_obj(*mst_conn);
> +
> +	if (!mst_conn)
> +		return NULL;
> +
> +	drm_modeset_lock_all(dev);

What for?

> +
> +	connector = &mst_conn->connector;
> +	rc = drm_connector_dynamic_init(dev, connector,
> +					&msm_dp_drm_mst_connector_funcs,
> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	if (rc) {
> +		kfree(mst_conn);
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_conn->dp_panel = msm_dp_display_get_panel(dp_display);
> +	if (!mst_conn->dp_panel) {
> +		DRM_ERROR("failed to get dp_panel for connector\n");
> +		kfree(mst_conn);
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_conn->dp_panel->connector = connector;
> +	mst_conn->dp_mst = dp_mst;
> +
> +	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
> +
> +	if (connector->funcs->reset)
> +		connector->funcs->reset(connector);
> +
> +	/* add all encoders as possible encoders */
> +	for (i = 0; i < dp_mst->max_streams; i++) {
> +		rc = drm_connector_attach_encoder(connector, dp_mst->mst_bridge[i]->encoder);
> +
> +		if (rc) {
> +			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
> +			kfree(mst_conn);
> +			drm_modeset_unlock_all(dev);
> +			return NULL;
> +		}
> +	}
> +
> +	mst_conn->mst_port = port;
> +	drm_dp_mst_get_port_malloc(mst_conn->mst_port);
> +
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.path_property, 0);
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.tile_property, 0);
> +	drm_connector_set_path_property(connector, pathprop);
> +	drm_modeset_unlock_all(dev);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "add MST connector id:%d\n", connector->base.id);
> +
> +	return connector;
> +}
> +
> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> +	.add_connector = msm_dp_mst_add_connector,
> +};
> +
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
>  {
>  	struct drm_device *dev = dp_display->drm_dev;
> @@ -501,6 +731,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
>  		return -ENOMEM;
>  
>  	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
> +	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
>  	conn_base_id = dp_display->connector->base.id;
>  	msm_dp_mst->msm_dp = dp_display;
>  	msm_dp_mst->max_streams = max_streams;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

