Return-Path: <linux-arm-msm+bounces-118619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fgklOEo3VGrPjQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:54:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A37465F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 02:54:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xj9uErt8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hWOP/VX8";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118619-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118619-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5814B300B04C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 00:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98751EEA3C;
	Mon, 13 Jul 2026 00:54:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF3191F94
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:54:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904071; cv=none; b=o4NInmNlWm0x9IZcjjoB2hrQcPk+ygQosbOioThirmsm0Hc49BSSsinW/Rpju1ETkwwtKses2Z4UtDgSTpFIS5EO3ZBU0y/LsZQLtyPn2gjPVbkpqDUfQCzuEU4dgdZgramEwwTmbvu40ssggz7URZVjpi5AugCFvVhvDSj5Rbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904071; c=relaxed/simple;
	bh=siZvKfar47pX4e4Cv+R9LDRf+K83AWIpoZswRdaSes4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5bjSIepog1Rkqv7rlk8c5gtZDF8wb3d9DJU9oPzNXEdj68LLse4y6/i+GOU9hgONqZmhU1H2Zsw6h+l6YQu+/+IpqgWhWROSUV86Lv2HSWM7R4gOZlWh8QaKBF4JKL/WqzS0QpMjGlF3xGpEyOTKDbQpFm/B0PoI5D0L47sQog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xj9uErt8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hWOP/VX8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D0kHpW4067180
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FTjuGasG6jAcdaV46NtQY/aS
	JFb1KEyP6aKUqNcdxjY=; b=Xj9uErt8D4XDuHRxNnex3DEaJEdeEQwGpCaqISxr
	HkOkLZ86FshUWhoe31J/byzmb7o/M5Ps1ueOqaQut0mmmwDUP36HsSBvQheU11Pz
	KeSkz96mqHddIUIF5LG7Dj/Fx6cBOpztgmf4ePrh/Ts0Yvu+73P3x7/p/+7T8Luk
	qUNfUcIikitt0mEI1FGs+ZZAB0rfh+MlI7gPAGTGMlEDrqFOXuDqcaQ90K4REgsb
	sh+Wimhgpv9JarRu+n7jh+mdzroet3qB1wEvVefeUdEMItfEH3IlN9ZwwIEgPHAf
	1kFMrWoLRvNcDUBN3jMY8C+3Pz0mTVHGCVLh0Yl1r0Suwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamuuvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:54:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so31144001cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783904069; x=1784508869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTjuGasG6jAcdaV46NtQY/aSJFb1KEyP6aKUqNcdxjY=;
        b=hWOP/VX8SCj3zntytCc1UXnx2HBOVQBjussK0uq3qQKxiwaUC/8UukCD8Nk+P83QAT
         +oWpey+nXe1FCiT0vk2Qbu8cuH0/ENctZoAfjRFmR85F+3MUqDa182Sshj1UD/wvD5PY
         Z7mXE/x5L5prLHNgtB8A22q5XQ8WV6UiDYcCNKzEz4pD8EvFe5/vCVobZ/sSmO2myiXD
         +Ymvgu7BFQEh52h2gM/Zh4SsBkYYmzLbmgotU2HagpHbhqTzZi7JM+eGLY3psNKwnZdJ
         iy++uIxSMTgG3b6hNAQhI0O7+MZpJ5yuCWhDBV6Itb2pQMHkrC5wEXXwfJBojs24sCcB
         /Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904069; x=1784508869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTjuGasG6jAcdaV46NtQY/aSJFb1KEyP6aKUqNcdxjY=;
        b=mt/dh49yAymUAQChq1K9QriTrbMxT1Wc9IlBw0rl7Mnh63qhnthcnYXxNiJMbo97Jc
         gcZb44FtL4rK7mig4lVt//sBiaMXdTG9XzMQKo/UMdL18j0zvNdo039aQyZvrDlmoFKZ
         TKKCkWAAX/9X1/FX5Vu9FEnDNqtfHbNCEz7u2JJgdhvX18QWS+RcGIV1o0nxbW5VZkXs
         HHqhuFmCzWgsTHA5jH13f1P0Oiq+lAeZAKbgY2pNfRl1FSE9BeE9tDju30tHOblUcNR2
         cJE7J4wfLvpgPA8JJ7gT3OyIBqllEzt0AoAABAUwtD+/Lx77KnoFQrohGQ7opezWDuYO
         7vsA==
X-Forwarded-Encrypted: i=1; AHgh+RqdJEBIVZ+BnEEz+9X4Ct+96f9JgE+4MzoWTewd9rqrH3N7XH1jA6VB+5CHiamHNv6tvlI3s3VB9FTNmNto@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYSb1mmmb9LSD6MnC69zJRa79VAjejdto+uGbVMENgnMzBU4X
	oa2smj4IuSfOLtipo3LKlnOxWQxaWUQbl/XdU/pH/eHGo3nl4RDckmr66l4WxE/P9dTpRS7Y4OS
	3itjH1VNhyXFipbH5MZQWiXFeLoAdjp9Br3M5f+BU8n3ZuT+B8PZ93C1QPuC05m06/5WE
X-Gm-Gg: AfdE7cnZ6sNeWgavJUAS+naJRRhMIta8vgT/yl+8d23W3gNmVL9uT4TIiyJ+n94lZZd
	UzgC7H4k2LUxpzC3ZJ95lo7egSx6H/pvpRNAPBvhFgyplEkwRms5ettdFjCFcuAZtOL8xdKSKgX
	1cSyTjfh4RREjkpxIXdxCCmA3/U5AwNIqKJ+fKstdGA+7e7xNLXJn8jIxJSB7ghvapY94qjwWxF
	14j2F+djdcj9VVFKSh7gjt5NNaJ6Dn5Ke2ihlSmGgVdj1xMmcHrrjXyKLB8oB9s6s5T8a9hdZgl
	RfM/ekZ8Rvus/ymcNyLhAgALpPpEeiXv0xGnUGyPdYNrm+FCRzDKkhV2MGLPgD5yhdA+7xSCKOr
	AnxUEuECRVcT4xn8i0QB6tI15D9T2hEnqdBeKLybKhFOjCthiV8bYEAGlqFiykaMByJyIa8Pejm
	tbfhPsxDwV7M4RCezem3iEsmQU
X-Received: by 2002:ac8:5d4f:0:b0:51c:164b:b241 with SMTP id d75a77b69052e-51cbf05b77cmr75713871cf.13.1783904068735;
        Sun, 12 Jul 2026 17:54:28 -0700 (PDT)
X-Received: by 2002:ac8:5d4f:0:b0:51c:164b:b241 with SMTP id d75a77b69052e-51cbf05b77cmr75713591cf.13.1783904068275;
        Sun, 12 Jul 2026 17:54:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca55043sm2439852e87.32.2026.07.12.17.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:54:25 -0700 (PDT)
Date: Mon, 13 Jul 2026 03:54:22 +0300
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
Subject: Re: [PATCH RESEND v5 25/25] drm/msm/dp: add HPD callback for dp MST
Message-ID: <remaj6npgiv2hakdeevj5mp76c46xupoa64dqbp7x37wlzgrca@66ooracpci4x>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-25-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-25-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAwNSBTYWx0ZWRfX2SmtSYay7+TI
 0QJ+ZZqoDuvyrX65C6CTnKDIXnlKsq3ye+e9+HGzxi3570z/SX8WwIV/xzGTuzf2FzCxawOJlde
 8kLLt8RrEzx+0u/B2xTmQdYl3SGkM2A=
X-Proofpoint-GUID: 91ifgkfZZqpHaloOSL6xXH8wvXr4I3DO
X-Proofpoint-ORIG-GUID: 91ifgkfZZqpHaloOSL6xXH8wvXr4I3DO
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a543745 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=_nuYtHmMXLcvbywb5U4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAwNSBTYWx0ZWRfX3llD47satP1f
 0unqnQZ4ByBk3KUFep/uK/AYGf17zLW2tNw+DhzcSHp/TkW1KDJh0RrujpCeUp6FUjM9rZps28i
 gilthhQYBtTQBdrR42K2/2GQAn84GSn5wTcPlalrzC6DZiLbpAxpTBUZ6PUhuAUWquTo9ja3HG8
 V68FGSTY7HlM//HWrVs+gMd9RQ3xvw0Zbrs7sUx8hxNLOmz8RU3pEzHEGNgCjytGM/bTYMnaqdA
 ywkTtoGYkIpddzaUH89HUYN7ksAlW2iCrvhI/0eK5Uc89w/LEAdbRafcjXLC2q3u7eo0pIzldfl
 Qj5uQxcF2HuZNXdoTwEu4iaD6VSk7sBt2gtT546Xyac+GIW8+S2eOzg+5eZJ1leUpNR4OJd9Eyp
 wh/q4Gm9dxgAr+qBS/wEmxyhGK8nPrK+0V5qP2Z5FP3lE/pF7PRVLYETPxva76kk3mOJKynX0WE
 Qiv6MaVvfBYkaYiYacA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118619-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3C2A37465F8

On Mon, Jun 29, 2026 at 10:14:46PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add HPD callback for the MST module which shall be invoked from the
> dp_display's HPD handler to perform MST specific operations in case
> of HPD. In MST case, route the HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 46 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6eac390af2e0..49a7bc5e031e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -455,6 +455,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>  			dp->msm_dp_display.connector_type,
>  			dp->link->sink_count);
>  
> +	if (dp->plugged && dp->msm_dp_display.mst_active)
> +		return 0;

Why?

> +
>  	guard(mutex)(&dp->plugged_lock);
>  
>  	ret = pm_runtime_resume_and_get(&pdev->dev);
> @@ -550,12 +553,18 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>  {
>  	u32 sink_request;
>  	int rc = 0;
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	/* irq_hpd can happen at either connected or disconnected state */
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d\n",
>  			dp->msm_dp_display.connector_type,
>  			dp->link->sink_count);
>  
> +	if (msm_dp_display->mst_active) {
> +		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);

This should be routed through the HPD / notifications API so that there
is always a single path for handling the IRQ_HPD interrupts.

> +		return 0;
> +	}
> +
>  	/* check for any test request issued by sink */
>  	rc = msm_dp_link_process_request(dp->link);
>  	if (!rc) {
> @@ -1111,9 +1120,13 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>  				      connector_status_connected);
>  
>  	/* Send HPD as connected and distinguish it in the notifier */
> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> -		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> -				      connector_status_connected);
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> +		if (dp->msm_dp_display.mst_active)

Locking? What if MST is being enabled or disabled on the other core?

> +			msm_dp_irq_hpd_handle(dp);
> +		else
> +			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +					      connector_status_connected);
> +	}
>  
>  	ret = IRQ_HANDLED;
>  

-- 
With best wishes
Dmitry

