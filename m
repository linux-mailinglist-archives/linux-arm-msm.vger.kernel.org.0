Return-Path: <linux-arm-msm+bounces-118595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cwvQERLbU2pvfgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 20:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CF7459F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 20:21:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iEfFRMd2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZNp7n14b;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AA5D30094C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 18:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C20D3655C7;
	Sun, 12 Jul 2026 18:21:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0835729ACCD
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:21:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783880462; cv=none; b=HzdcEyOzOIDR9qZtyfYAaBqf9WNz3j4othJ7T/4j5CY3ag18tD2coECDiljaYGG0t28UOfBqte1zRRqDAoAGmP+ZmP7TZEUUgcu+SjY8Q3mXF7PK3bfUCfgSTqUgVZjrx150OvPfVyyZxzGxxmtvqyL+8yK0DgXw6nynd6l+xMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783880462; c=relaxed/simple;
	bh=Ur+VhmHICiUOSiUk/oXrbWvI5RyAw52jF1BdhogL8v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2X7krUfplVSlGf6ntorGhc6D1cr56sGJTFqe7WTvIWULrq+1t8GFdrgXSBvjFt4DmdZXgkUnlKFMFxFZEnjzb3nbP7/fNuVSlsf2m0oH63OEQw/tjph+R2ZIGqT8h22ExjGHIAzbGZLGjLM6gkaRkVu2gk61OCVuySJjBbKbVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEfFRMd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNp7n14b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGrsd93174843
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cOa4nmmTOHFlx3MF2totcfZK
	vZun53wwDDNf/M+wpes=; b=iEfFRMd2fwtH/n/CCHTaR49V23rHWxAkFgkrnDwK
	kKTpNiN4nkSswUIYQlboo3MGdsIzgD8EjJnnOm+ZvZ2N972Umw+y6Tawn5AgFOK4
	0kxQrA/XeKSnsWQxn1eEwbW14KKDUPjhKUzYsJkQ99kc4LkcQ+MH2xgxn4clbLlA
	kPPe3Feg570kX+4r9E3MXnCpdGe+A90b/Vjz56CHIl11bma/R8BW015pPDpoCnfI
	35OvIEiK1PI4MBMKNFPUFIQYasQYtQBhoyoulQyT9Dl4sjAaNB9sP11UdvO2PBPc
	Ejpwgm4sKNjGzf4OuNyEG4J/wN7PVS4OuU06JFxq/XnlXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hkbbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:20:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so52369481cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783880459; x=1784485259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cOa4nmmTOHFlx3MF2totcfZKvZun53wwDDNf/M+wpes=;
        b=ZNp7n14bVR88mhPxRYUY58NL4aBFsqxbYxtnwep8PK9+w/kaHL+1/TEyFpt+b7nYOA
         tZth9TB5SkIRnwQL1CiUjCYlbUBDihXxow0N7Hne8FWsonuIOL7MI7VoyZtdtyoFWMxa
         /1Ljd2iPiO7DR04OOcZd7pGhfEdu1TgIsNt9toffqoZZgTJDmm4EH54ZdPjtbaisyCqi
         UzsNS2kHTvi7hJdBVERzOYi0pXvrPmBPRr8wd+aC/u3fGb+mmXOlYdlXjgVb9kns7ewf
         dXPDYPhS5gLGSb4AiE+tmepPqUEJrzM/QiPOOhn+yyFssk57Unk/9lgJb+dhU5t7HLiI
         q1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783880459; x=1784485259;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOa4nmmTOHFlx3MF2totcfZKvZun53wwDDNf/M+wpes=;
        b=seF7YonSnolK7URm7YbkpTC8lgSoVnnWqAGnfxOkxRG0pA+fm3J5+wtKhJoEeX8cjd
         dyKXItbdlx09U7aod1dowse3pw6YTsAUQUWd+NdQfIyk/fJnutZR4tTCCF0ZFc0tzpiS
         FG/nCtS2dTek5Tup4CcjGt86n1oHOnjmF9vVrolZNfqxIWQNRkmzfwoB0Es5xEabtbGn
         flIdqhD3EA9tAOkT9bw++M1HJgc6xezp1xpkNSTPeODAloPnZZmPrWYjoFxi6g+luKgR
         xBBzqr28flhtMgzbuCfmy15vQhzQl/A13G2z0bycoFl4BXSfF8nPSnXHVmuqgTtLMX8m
         QeKw==
X-Forwarded-Encrypted: i=1; AHgh+RqEfnBTwWn7mRRiAV0/T4lthSM3sKNRDzZY9POMKcbJSppfWOCi5Y08HSVDeYg+l1b0NO8DAdIN3aMR044D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fxn0nYYucJ5ph2t9fmyX/Hg1vf1FFxafFEudw1ibxBvvwE5y
	/nH9lShYP8hvALVS8Inq8ieqRNlo9H0OqAOOTurAjBPBZyT2qm+Nc9B/b1k91YIyQwzuFGr3L4K
	a5vQOMApj0s3h+5oTOcBYg1B6WSDTirWp4VADVyrVq0HfeqmM7Z1YcAwHx/0+hvQM5bVBvUXkgX
	GC
X-Gm-Gg: AfdE7cmG5oOpagUG0JGL/S3RW+0YucuFBpCRQuFnf8z4ofFGaSL2SJaczewZlDuPm6K
	1/Hw4u7ngz9PXMmOfTXiPuupPZ64gyRb/i83DVuc0hT0thqGoqgz9rQUnOqwO7wCpo13zrovOMG
	AbgEhamtyVmhtCAn+kfA4uBNtMnGYa+oHBTS79pMdm/UkDZYs2sOrODLeum5+9shA6m7xb7GZX3
	BHFb8MpFxW91Hw7AQSFtLH4ZE1aCS51wZF0FK/vmRAjWNhcwuO5ZsE0Zc9sCMV6NS4E4dls9qbP
	robzvlyFVsQytMlEUOG+eK6g7WTuJrTKDJXcbvT7xhEQD97UjL7ZSGAsO91H82uylJjYKJp8xxr
	/tl5G+WP0nvMeBGi0ZH+DCpn04QOqet9kf1gyeYl7J0W/O1SDGELxk7MBz22NlH8qOSJVgqUDQd
	ogp/YVC6ZQSaYRfRuYxf4rUiHz
X-Received: by 2002:ac8:59d6:0:b0:51b:60f1:689a with SMTP id d75a77b69052e-51cbf0c47b3mr71093041cf.7.1783880459210;
        Sun, 12 Jul 2026 11:20:59 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:51b:60f1:689a with SMTP id d75a77b69052e-51cbf0c47b3mr71092781cf.7.1783880458706;
        Sun, 12 Jul 2026 11:20:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a382sm2275808e87.16.2026.07.12.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:20:55 -0700 (PDT)
Date: Sun, 12 Jul 2026 21:20:52 +0300
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
Subject: Re: [PATCH RESEND v5 11/25] drm/msm/dp: move link-level teardown
 from display_disable to display_unprepare
Message-ID: <4las62mpvcuud6m6yo2mz6hiijv73zt27hnha4tlaejubt25x5@gxralblac3m4>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-11-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-11-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-GUID: qXKeP3fbxArfixhjw6CYqUcCDP4A1rv4
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a53db0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MGG9Fet2FOA5F7jA1VkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qXKeP3fbxArfixhjw6CYqUcCDP4A1rv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE5NiBTYWx0ZWRfX0/OtC/yYLbcn
 6JoMssV3nKqwwE6GKxSb7k0Gm23Na7wryvVpXuwt70fd4rtBzCIw0YsHga4ubbn+T01VLXefCmn
 z23IOWikQsK7lY7U/zRfZ7AiUUBpBt+Ls0Evg1BPAJZXXRHWPMg1lLabo1Kozbt0dVZy3VXFg9O
 RtjAxa4Tr4fkBbhpsUmczUjGPAy8mUygenBQnc0XpnwX1Hus4RbwZkEBLFQItGTEkMdfyAjQDe0
 VAksmmiU3rOcwQRVlFtn3g5//67iOQpL4d6QasdjiBr8r7xWldTJXeBiFjY60mzgZ4beQFHxsfQ
 EzIl3mUMTrCTuxFz053PC49xp8IYFtEVOGiyFcquDZvldamWPy5JCTdrlnwzKLiWQ+JKyCp03fx
 LJzwm8vVjddOzmlJsiKO6Gy3T4QZQxrmqRdg25fefWElXLal+IeK8vXVRoZLFssF34bXkAdzcyE
 XyRwAtUOtbl4bbM9EVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE5NiBTYWx0ZWRfX0qFCqcYmKNAY
 GUuNwvf2Pt1Q2oEoIQXQbecQJQo2heaS5T+oQr56L86QGs16y48ALt7lE3VfhfP76Dq9y55QLaf
 8ZXC8mdVcKPhDujz/qyz/jPAW0Yibwg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118595-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: A27CF7459F0

On Mon, Jun 29, 2026 at 10:14:32PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> msm_dp_display_disable() currently mixes stream-level shutdown
> (disable VSC SDP, off pixel clk, clear power_on) with link-level
> teardown (PSM config when sink_count==0, off_link, PHY re-init or
> host PHY exit).
> 
> For DP MST the same link is shared across multiple streams, so
> disabling one stream must not tear down the link. Move the
> link-level steps into msm_dp_display_unprepare() so that
> display_disable() handles only the per-stream sequence, mirroring
> the split already present on the prepare path
> (display_prepare_link vs display_set_mode / display_enable).
> 
> SST behaviour is unchanged: atomic_post_disable() still calls
> display_disable() followed by display_unprepare() in the same
> order, and the cached dp->panel used inside unprepare is the same
> panel that was previously passed in.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1af56c84b82e..1680a67284a7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -731,18 +731,6 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  
>  	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>  
> -	/* dongle is still connected but sinks are disconnected */
> -	if (dp->link->sink_count == 0)
> -		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
> -
> -	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
> -
> -	if (dp->link->sink_count == 0)
> -		/* re-init the PHY so that we can listen to Dongle disconnect */
> -		msm_dp_ctrl_reinit_phy(dp->ctrl);
> -	else
> -		msm_dp_display_host_phy_exit(dp);
> -
>  	msm_dp_display->power_on = false;

The list is no longer powred on at this point. So, this is wrong.

>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
> @@ -1533,6 +1521,18 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
> +	/* dongle is still connected but sinks are disconnected */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> +
> +	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
> +
> +	if (dp->link->sink_count == 0)
> +		/* re-init the PHY so that we can listen to Dongle disconnect */
> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
> +	else
> +		msm_dp_display_host_phy_exit(dp);
> +
>  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

