Return-Path: <linux-arm-msm+bounces-118614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nsxcCGwpVGrJiwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:55:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED474649F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 01:55:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ruat+foT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HWJNZ8DC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118614-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118614-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C07530057A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A4038D3FF;
	Sun, 12 Jul 2026 23:55:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BF5367F5E
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:55:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900521; cv=none; b=scMwj2GqlzGBeN7xAv5oacFZhFN/k0CCZLkc4UapJNPDCEf6oW4yjVuL4zTknt0zVzmioZnD4IuiYhiOTHlPlGmTvT2J9ExGDz6Ml1ZAncbNUYROchva2NTEHgir1DflMvB92HC5F+dhjHaOZX8eTGv2j/4s0H71xWsKOKKyYQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900521; c=relaxed/simple;
	bh=eTj3wz7TBlqrqgIVvr/BpBOi5a0natXrlLbywrykQZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njVg0u+lMN9PMfnxpsqWnxObJ3jw8b07GsPDYRnUjKV6DezbqofH05fK4NWuYweZhOQKhCOzDsgv2dT1O9SFEFbzRsn0HZF+GkABDGkAOFEHl1tspt+auRfZKiwL0Ltx/hWg8wO2njhEEG8NKwqEh0d+IFzu2ofqpUmE81jmt9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ruat+foT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWJNZ8DC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CNVAuu4024321
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M37f/ktR12Rc/Gd2GeEwEeJf
	uiXAWLubgkB5QLF2DKM=; b=Ruat+foT6CczYLmnczwmwypYAEgwi8UX9b/+Zn+/
	/efUPg9yewztxs45XV44fuBLioNtHt125GgFqpApo8/dtixlEa2OWREDsAHM+qm5
	JMHjbNtRFTfjCOA3KJ6bbuoSJvnVZBVkDRcgq2rp1C45KUW0BDNf7ovgUqN0bZ0m
	j+r0o0JIOYUgrCwOeb2FHv9VEpYI4ZIbo+1+FJgpfavbuQQMQaBnoUOh8zEig7Op
	UlrjCoq66vBfo9I/LuCsVwjhgAOMfp4VOHMONT7ym/3PpVx+RLyNdhTllJs9duDH
	23M6A3UwEh9Q6RH2CqDsSryUsSiP2wgKhuT2F9s8L7mZTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3860k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 23:55:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so34631991cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 16:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783900518; x=1784505318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M37f/ktR12Rc/Gd2GeEwEeJfuiXAWLubgkB5QLF2DKM=;
        b=HWJNZ8DC4Tft406sUWlKlzf/i6zWJ1jycpGRKD3tp0+QuUXAlreTU9RVcsaff2TUXB
         BiFX9EFAoF+FLoZI3yuE/bTGPcPC/lzc4txOaD8WYCIs8VxJGd76hYlZnpYHc93RKWIl
         GRcSFvd+KlGMPX/NwpG85uNSw/oyxGp0jNiVW0z62GZ+Zed/EhLWIE1AtrjXxzGDAKew
         Z1P0SwN2/t58r+qBIcWm7J6jX4LL4P7QgfG/ngqwcrpVFvx9yhEuLcqytVWxkFRMUlbc
         O1ZWwe2v8XHs8Xy2l7ZYVIEREoXyWMmhLQg5TCoHW5BbNq/75KfGRD7EJkKjapO3U2i1
         tkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783900518; x=1784505318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M37f/ktR12Rc/Gd2GeEwEeJfuiXAWLubgkB5QLF2DKM=;
        b=oZS68kXXAnn6WGx3DSxvrA20yZCNHyFJsykRW2sOK9HOBwJGDOrdtWK/KprzaQBec+
         kzEjop/2M9F8HdKBGkVfyBbegRAdbq5ZstyV4TwD6v3VLBYdWNvFUEf90Z1XSwOtWe4I
         PUJjoxbJElCed32F8CkWeBEd7wPA0CWJTrADK5um1fWIrQso3HwI9gZHNhGcmL6tC9Zm
         gCG/nDTzH6Dihjd19V28hxS6IMqsD6cSUM6kd13YqRL2lFT/hQnF79fpUv+pUzOvBWMk
         MUw+NNVOaBuWm8a1NrfknKqK1Oirj4N86xSMgyYJsQ1Gcv8iPbRfoa7Jb7bpehGoYG01
         G91g==
X-Forwarded-Encrypted: i=1; AHgh+RoTZD/9GVbxY6dK2OmXpZUEE/aC36+UwnO2a6X2XffBloxtjT7nd+KZbxTzrTj8Ll4DTqgHsOr0RrM/eQfA@vger.kernel.org
X-Gm-Message-State: AOJu0YwBk7oCH8dXGLKlqbA0sMhMfioXRZirCeXamcuW1IjpjihGDYoe
	fDWFc/I6y7OHWC8cBhEamlzj0JiqVWEQX+yunOMy0fQL4nm2FbxFhcb3ePcikg5v7pkEzglcULe
	0Rn+v3cVoXlNqJhdTKmZr5jCfztmhk4J+rRxTlN5h6sLZnNF6E+x0aqXWwL2mA3kEjo0Q
X-Gm-Gg: AfdE7clijoSsLHFruMjO7GwO18pqMujdvnCtCyAdgV9GaWsw2g66QblThfPJIo51Yhz
	RNMN8ExNGMbRFdEsE3F0AVTUEiRbK0/0sSwVaOLso5lW08fMfSvSOxHFdSwfR8GoY7WCBT/wG75
	Z/lfGX7N7HmfSh6SpmKiR6eAxR2EcdYfVfp/7ROvh2tDXIEIOSi/rN2UAqPEOFLEXyW0M6LkMun
	QNx1DV9BLck2ASDwXiNW7MIk2c2h9bs9UHv54epsWqwojkyOfZIbvHS/dHT/TXRcXQIpFr1lsc7
	vo8aKrh2QF/wOpqe4Y+5L8FyLauJfaQTdMPmHALTB+rQlO4qE5Yo0K888/i4T4ONTzWJTmB91Qo
	d7vs/TU+RBQGOJEGR1DDVJR38ioSf3XTLlYpsAlrOtGmyCAD23oe6U/UWKsV66PnvSPYcy6/8D4
	6LWzLvp9Ak0toqXZzIk0h8n4IW
X-Received: by 2002:a05:622a:1e18:b0:51c:2075:afd5 with SMTP id d75a77b69052e-51cbf3953eamr71132311cf.72.1783900518136;
        Sun, 12 Jul 2026 16:55:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1e18:b0:51c:2075:afd5 with SMTP id d75a77b69052e-51cbf3953eamr71132191cf.72.1783900517711;
        Sun, 12 Jul 2026 16:55:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd79sm2378160e87.52.2026.07.12.16.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 16:55:15 -0700 (PDT)
Date: Mon, 13 Jul 2026 02:55:12 +0300
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
Subject: Re: [PATCH RESEND v5 18/25] drm/msm/dpu: initialize encoders per
 stream for DP MST
Message-ID: <yvriev2yh73wl6zdya36q43ffz4kx5xdfjlkvlu2vwoefyosmy@6psqndhdl3yu>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-18-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-18-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDI1OSBTYWx0ZWRfX8T1y4d+VUPIU
 Ieql08GfORAT3cwhZPk8axWDLaHaqO9Hx/Enk6u5mn3kqlwOPMT71T4wksnNhyGrlD5iIctRzdI
 dLkj11Lnj0uLMDoKbsiCF8gTbwwa39Pk2dvZ14Kq3qtKNIQMXYHvOeSMYpmtfxuXN2aVHkSuGQ2
 knCyE5BW5qpPeXu31Nuqv5neFoDp/pq+QsCSKUgzynt+S/Qw0mSyzdyDJMhCTUwRLCwNBv8LI4F
 pG4hLDJ412kdtgynDaKB4W6D0L+eLO7k9wlGD0pfaUqTh2pF8QPUPCtaT7yIbNpzjLAdVNTdFtF
 +bzNp0B/+Joc7jDoJcUoCpkMARunG/yylcwdyMsWAl0atlhXNVWz4ZkoYiWRXzmq4/v/hacaviS
 9O+7wb9p1R9Qv5BfrHGZ81s5l7TsQ3Wo9OMGOvj5eC2kCKTKLXyM8G/Vaja60HfJpGJPvmscXxq
 +FVP71Gl5d0dKOqBrVQ==
X-Proofpoint-ORIG-GUID: zw9-lzBzPn1jY3aOcJi-4RYobcSvn0Jf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDI1OSBTYWx0ZWRfX+Hq8cHOhSy9T
 WazKCzMwmQ0qW8j6hmIQ5wihvqYWjSApdfkja/NyQE8tMt9Ozu9wmrHpbKwTqGW5tB4vpoLVfUF
 ECqeA9LHamiZUntk22J+LUI32bFh2Z8=
X-Proofpoint-GUID: zw9-lzBzPn1jY3aOcJi-4RYobcSvn0Jf
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a542967 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=hU-Az2_SeSDlFTkWwngA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120259
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
	TAGGED_FROM(0.00)[bounces-118614-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,6psqndhdl3yu:mid,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 68ED474649F

On Mon, Jun 29, 2026 at 10:14:39PM +0800, Yongxing Mou wrote:
> Simply initialize MST encoders for MST-capable DP controllers, and
> introduce msm_dp_get_mst_max_stream to query MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h           |  7 ++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index da3556eb6ecc..7a00c4094d5c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -655,7 +655,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id, stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
>  		if (!priv->kms->dp[i])
> @@ -678,6 +678,18 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {


for (int stream_id = 0;
     stream_cnt > 1 && stream_id < stream_cnt;
     stream_id ++) {
		// foo
	}

> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index c3fb3205f683..5fee0b291059 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -355,7 +355,7 @@ bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>  bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> -
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);

This should be a part of the patch, introducing the function.

>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -372,6 +372,11 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)

And this one too.

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

