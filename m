Return-Path: <linux-arm-msm+bounces-118607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NZq6AVEnVGpkiwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:46:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963F74641D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:46:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kMkta0wv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="dFV4Plu/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118607-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118607-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AA04300B776
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389CD38D403;
	Sun, 12 Jul 2026 23:46:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B586347505
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783899977; cv=none; b=rjtE1USo/SI3ypRwDmusYin8nSiJneJ7RRzyfgfRUxtugU++CvDk0KQFBgiKsF/lVmh7BtbzBLNcXHCNetDOaBGIZCUzbxwZ3IfV0sTQov2E8Oe68xrWF0CXqcmJzExoj5JY7rvnQYGmOULJ6hQx/m3JVzLMxOLrnPO6LancA4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783899977; c=relaxed/simple;
	bh=HgLNjJLQwILgDff2c8zRyVa0+OhrJiwn4q/T1QbM4HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx0tl1OEis7XPfMLNHouS/lfiLd4w2L/8p3AXJmby9rcV11ZPvrA0OVoaRBRl7cPVR6CaPD75ca6Q14GsccB7sOwOTY/bynqfcBFlM0hsexnXTya/WHeohpQeRkmU7197p0ICweGQlZV3AQt6BFQvxPmMRVhDfe2a9lp0Z2zCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMkta0wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFV4Plu/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNUdDC3809413
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+bNrvxyY7JJvuVGdCIRcAUFM
	lnDc7wQbUqxchf1kntQ=; b=kMkta0wviZTF7Q9yqce79kJ5IWxPrIkqEQipC4Fs
	jtgqzvtWegE/hAZUXSmBHhM7rpQBw4k3+O5co+LQcShQMMraHgGdZ8x38ovQ8+Lz
	pXI1eIfhk68TUE/InpNZRQrxMJD8T+6y/1zon1nyvS+Kv+K+WXwsKR1E6Yx+3Vff
	4HfeO4uJSdNHM2OnKPjqrByrug0OZCzGWodgTtwC9zZJTslu11VGmoEOG5p0pzHf
	LL1oaLdvvKeIUGiCwS7Qbo4KzI+aceLatBuSF263+cvAA6TdTbSMvy6Ge1e9CV3E
	wwl4R8TiBKgev1eGFeYrl2TXLQEdwCShG7ZEdT2oRt/yvA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekckp2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:46:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73850dfc198so1109589137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783899967; x=1784504767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bNrvxyY7JJvuVGdCIRcAUFMlnDc7wQbUqxchf1kntQ=;
        b=dFV4Plu/G1URcimwGW8GUi+CDCpdJsSZuMpRsFDq+3/YNcJ+7D8RQEsgZqQ/6FumGx
         lPUz90rVmaV/fdVcu34BRkRpm6v2292jyYiiwvNYAzNdIGeSoYt8jfX0G2zz2dzcua0z
         4Kr8FfIw1xwDOKTi9jWI+hRxAywioIEmiPVh5lsT1mCuFoqa1Gjgsu1hf6svHuBoPsHL
         V41FIzCVg5AVZpU0+dJZGiHu+LjNf31xhiaAxbHpuZsPoc0eNAaV6vL8pk1uOLjDns3b
         r2diY3tY88tx+1l/FTrHBecrYU2ognAOKdnWgfPMFhk8XvyrVsDMyY2QryaZwMw5YsqL
         IGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783899967; x=1784504767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bNrvxyY7JJvuVGdCIRcAUFMlnDc7wQbUqxchf1kntQ=;
        b=YbGAql+OsiDAPXsfv4rlo/Oq167lXdeOgERsAdWzp+na5CgBZYhQx0Xl7eQvnNCjHc
         2RAxLSq2m0WH3zufhY7MZcY/SJ2s7J32S60PkOlgco1GSYcJtDCey+Cm9hvf2tQGIjf9
         2l722VcQts45QWozOehoOcrMq2QH6373xMzHbtG2WFCzbdXmXPkGBUFPZBBBAg7N9L84
         I4Gpgxf4PY/dI11CrCs5Pn9QO+UriqRPKdc86Dt2PvEICyIwo/pk1RLgVB+0wQWvh1yf
         WdskCxf1kPSd0PZfUxv3GYfKw387fyyuGrfOmM48DfwFxvz1JQ4PCSYUXMN+f14U/OZE
         eJqA==
X-Forwarded-Encrypted: i=1; AHgh+RrGg6gplxoNhWtk5uAhnO33oc9qRXDpL0A0eMJzeiAWyfDR14nWuggKwvG12uVWRqModQCRu5TPnhBY1cfN@vger.kernel.org
X-Gm-Message-State: AOJu0YxovcOmrH4pThVbClcqvviagoD5v6V8F/jq2PApplMzzLs5VApn
	4otTnpL1JPsT8wd3uqpFgseXv2K+GIqXpXdK22jCgflvKg59ds9gFXpNS07FPLjVwajiGs/1/f5
	qPloxM3xRKaQP7WfaKTmLtWc7Z5NBg29kT46HtgqKbfSOa7z4QVmCssMM/Yc7Glnvidoo
X-Gm-Gg: AfdE7ckUVGx5+MUMSTt4tc2rHxKNCV+rRr6Wh5xOJZfH80h+shROEjEPbbqE9j8AkCV
	GPSMYt1GCqOI7BdP0dwozMh7sukPZFSxgzmD4xqUid8FRlbHnY3YNPMI/tJ1ky5cw94w8vevxvD
	LiAQUshKpKGtkB0SkWu5CkK5mVC6AmnYVdUZZUTzlUJqCnnB1pEj5baLkWH7CdfetGHUBpV/Wm8
	iZqQNbvMe7fcA2KsKpfpwKFpAZjUE09HzRVkMbFNvhWb5yxMJC4dY7RLjoBqPAA95rC+HyrHcr8
	IML3ecfVEGN5/qR6bfffxxXWvdnJKRTB4O1e9YLZn0KzpNgp5IIDLb92kzF7z7+Jq8zShbDKHSa
	bS/n9O4yX6mdI8ZBnvXK7uTL/xtdDBtZI+euNPxi2BRHu6jgTHkACq9Yh9AfAJLJDmC/gOI8j9S
	PnUDRmYaDoRd+EmCaLGl3gr5Qi
X-Received: by 2002:a05:6122:6141:b0:5bd:fd79:ee35 with SMTP id 71dfb90a1353d-5bfbf2531ebmr3660986e0c.6.1783899967386;
        Sun, 12 Jul 2026 16:46:07 -0700 (PDT)
X-Received: by 2002:a05:6122:6141:b0:5bd:fd79:ee35 with SMTP id 71dfb90a1353d-5bfbf2531ebmr3660963e0c.6.1783899966831;
        Sun, 12 Jul 2026 16:46:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b9fb1csm21333701fa.34.2026.07.12.16.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:46:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 02:46:01 +0300
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
Subject: Re: [PATCH RESEND v5 17/25] drm/msm/dp: add link_ready to manage
 link-level operations
Message-ID: <2ciespht5pfxvqnrik4a26drkmow2ilvxbkcnpt43jprhndryq@vfetl33dz3yg>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-17-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-17-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX8UEX+Z3Spfgz
 iBWXJ3Mn8OZYaHyqaw3tc4O5nDQmuE+ZsUm0eQJ0iNfA8834MqIjthjyKSFhPTOqh6eTyZxSQr2
 NylkMWHn4LABpUGmlP6CTa6yjX4jLnHUH5JT66QdZDwCGyVq3QvIpbnFBpgDIkmTQjfDjgl0ci1
 XOBuSc34/Cwy1dcWlotRhzAh+dVjYtUQ+ZaHA1W3pvkzbi0Kfa2Lnid9dmQ3y2iZRkCvmc0qT04
 w99Fs1hD7lP2X6E7beb50taM3RiSyHhJLAKU2+drcx1wXHLpm1PJxJ3OcSW5yfnu0Wfvg2Z8d1S
 /f3g1AAZdODtYt/67rzW3SkuCxvKSQPMBFe9ss4B8NNUnpEJ5f70t/GRntb+x+Tvy1MNrcUaE/e
 /OVtRfl0HjBNbNhwABIF8TB8lxP8Ud68IjNXDGM9Ho/7QSd9CweR9ZsKZhdmMkBqe/N8/W7AQ12
 QjvSx9wjBqPxrTlkiaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1NyBTYWx0ZWRfX6iPSnQEGW7Wy
 8sfdZlmFjL/05BbWeCb3k4H8FySYlECgBJ+IEOxUR3uM86BjEYYiTyuTAHy7862Gs4wTXMLtj5l
 3TNE3i1QF++dRtGCqFMRc6h9zlq66+A=
X-Proofpoint-GUID: fGfIcy7uxA9gstrgSzeP2IDOdmNo5DDZ
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a542745 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=j7iepdKy8yGsvB39TCEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fGfIcy7uxA9gstrgSzeP2IDOdmNo5DDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120257
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118607-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5963F74641D

On Mon, Jun 29, 2026 at 10:14:38PM +0800, Yongxing Mou wrote:
> In MST mode, multiple streams share the same DP link. Track a link_ready
> state so msm_dp_display_prepare_link() runs only once per link and
> repeated calls are skipped.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2a74302bcb7c..d56ee10ee065 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -702,6 +702,9 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
>  	if (msm_dp_display->is_edp)
>  		msm_dp_hpd_plug_handle(dp);
>  
> +	if (msm_dp_display->link_ready)
> +		return 0;
> +

What kind of locking is protecting this variable? What prevents it from
being accessed concurrently?

>  	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
>  	if (rc) {
>  		DRM_ERROR("failed to pm_runtime_resume\n");
> @@ -714,14 +717,18 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
>  	if (!msm_dp_display->active_stream_cnt) {
>  		msm_dp_display_host_phy_init(dp);
>  		force_link_train = true;
> +
> +		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
> +		if (rc)
> +			DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		// TODO: schedule drm_connector_set_link_status_property()
>  	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
> -	if (rc)
> -		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> -	// TODO: schedule drm_connector_set_link_status_property()

Why is it being moved now rather than in the patch where
active_stream_cnt was introduced?

> +	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
> +	if (!rc)
> +		msm_dp_display->link_ready = true;
>  
> -	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
> +	return rc;
>  }
>  
>  static int msm_dp_display_enable(struct msm_dp_display_private *dp,

> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 676213a48089..0464f8941e8d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -22,6 +22,7 @@ struct msm_dp {
>  	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
> +	bool link_ready;

Please group the status variables together.

>  
>  	struct msm_dp_audio *msm_dp_audio;
>  	bool psr_supported;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

