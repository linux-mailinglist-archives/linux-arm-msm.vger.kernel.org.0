Return-Path: <linux-arm-msm+bounces-118600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6vWfAG4AVGr2ggMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:00:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12D745E48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:00:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oUmATThT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F51Zvxyp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118600-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118600-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F299300DDEB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 21:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A412701B6;
	Sun, 12 Jul 2026 21:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB5D2264A9
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890022; cv=none; b=VWbG7UnQr+KBBgfQW6NKFSe5YLEd5DE0iSkjrCF4iw+wQumvWElHSKOyuWbVuoi7JrJRGt1+SZwT5iQhZlfRPw+cnhLC7oIZ43kXvYyjH8RvUW7GRo6YOOJ2dyOMIlzGoZHbfkgP57OO8eEsUZmDTytg0ftfZjvNFi9tNtYfCJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890022; c=relaxed/simple;
	bh=IouDG0gagYaIMaIRpHknHXTVUT/N4cEx7DkfnUIE3aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2t6eE/nUlQyDFLqt7XROX468bpqGy3S2uNcUJOQBNOYeTQOKyLUjyihXiq88jBzlqlFUEFAgnaTeSPVIwSKdq/DgN5ZI1VoKzQ7GEgiepyGOyZWQLbTD7shDA6xpBJHYVnw+v8a+ZzQDbedd0T71bWThaW34oJWEGzT9edqhU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUmATThT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F51Zvxyp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CK9kZ83458792
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=771zBeqFjnXgCoTcPt0jsf+d
	nZGlHkLp9A+5v2Ou9MU=; b=oUmATThTxuz1OFem1e6V81I60i0POdk1N6LdHzQ0
	Ih53lq4Lv5zLYj8WxaQT/OsNfnodxpdsbfpMBu+CqavhIjkBzagsKtGPUTPPeA1J
	42bma2lZzE6n7DQlm8VU8PbFeoA2TZMDH9+tGg29GTqIjmmd02yOGL9L01xgwIR9
	zdZQbud8/f2Ggply9Dkdx0JRCXEUlVjyUA2O8aHDA7q8jdrShll0lY+lqGWNhegr
	E10Kr/1cHal4GCrHSS0vth90TTSNOo6FjSbAjyQwiQmaQ1KEogWW115K+nA0Al5i
	y1PXwE/2qbt2vgcyQQ4z1c+QZ8jSJp+oy+cQhqGkYJhKgA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe913j1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:00:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so32551321cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783890019; x=1784494819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=771zBeqFjnXgCoTcPt0jsf+dnZGlHkLp9A+5v2Ou9MU=;
        b=F51ZvxypYgbPTRWZpViIjNA9KuR5Uq7jzGr0jqseJfXKj/ywEomHIWOLeB+UStZzo9
         EleSYz0sU3i2YHWMJCk+8HPdQKjbV5gMWVdWQb4VXzG4uBO5QWgOZuDJt04AIK1DcLbD
         75p75LoJZapRjktckFCVWcrHUjM0yOACpTR5YbIxR4LWH0yGTPQrDRqKuq3uF6ndJEZa
         8GpbZlE9YmbTjKg77FW/JkVa8us6+9Um0B7qy+Q3DR3EGNSapX18Vwdvn403EArH39hZ
         S5nNplBB0OCGKze6VWceEaaycc+QIXIHHmPggEAUJKLKs2Q5E0enc8qF/F0FefIdDXAL
         L0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890019; x=1784494819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=771zBeqFjnXgCoTcPt0jsf+dnZGlHkLp9A+5v2Ou9MU=;
        b=Xghm4YnRndbEYKEVLYZd4pWQfoAZ3GiOwihsrcd7fyQgdggy7/iYzYcx8NbkHSA6l3
         vwUqCHOJi2h8/TGdz9KFBAxvq0oun7HUzDX33TLeFSCiQ0sh83fYbBvqTNn0M+NyrnG8
         KWikZ7WPjvQBPwNQeY5I95lm0zuCAUUkru/xBP9NumGmympxtfAWTgNWiJ8A7vBR4Qxa
         kPCNWAekwExG+IQAGJCQ8ytvRwBYd/so1DThzX33pDXM2sqVkMDGD0ZaEaBMzmAU/Ymh
         2RmPO4aaJ3OYW0uGcIY0vm/GKtQ04uwBYiP1CR2i1+uEKDqqUebpS4/SeRO2qM1MRZsC
         4VOw==
X-Forwarded-Encrypted: i=1; AHgh+RpHlRe9gXZxwc9hBqZw7XRoZOYrNt0wnYQJnswmb3VsSFGqvPGirkBnRHO3WoWbHGV+gxUPmuRupQI5TKgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwpY3LiVn0Pz8eqMhNcWsw+GUFBpzAKw6rsR3VoNrdU70kzjNhf
	IeoLU0x6MDG3wbRJYR1pJW7wpH4zlKvSgvmIkr5KWyXRo4ZPnIrc+Q51+IdBV0ASeEaNtF0WPYV
	vQ4qZw8KPgMkBSkmRmN+g1fZtixfzJ6TxEpUliIymgOyETQ8dQRxCZFMUQOFz1LwVHFuT
X-Gm-Gg: AfdE7cnBEwOLbQv/UzW2ySDr5zPlvBbUvIvXluHhficmjgunPBmgjmffHyqk8a2PKHD
	1/ZGUF72ekAaWOScBcGXra6xLQni4kfgfam4vhlOE+uGHhdXCbkhPTnbbrHNoKGRMVJ93es/cON
	eKJ7/2Q0+XIqH1suqWSxCpn4KRlzBAngqqN7/t7dxS+PCyh1P45rXcxamkStEavhP03ZDSbc0rk
	O9ipaFAUMGV6JVSmzgJ7DZVC41/EQ2c5mFzEyZmBYHaHjFTUC8M8D9UUvwdKHlEDKnzpHRPAJJN
	xRo0b/8Cft5BHrwCsIkRpv7l1cY+Yo6pNegybTas98WY7/hR+jEE+L2Frq+/AqZyVMTFlH/K77Y
	Ac23oHmj4kCyJwZcfOto0vfyisAXS7rkSHB6gVQh2tEhigdcQtS76r7HtBhUjvlQ8XGYrqLO6sS
	id+/8rhBE1mawaeDu8JHYOH28F
X-Received: by 2002:a05:622a:43:b0:51a:86a2:7048 with SMTP id d75a77b69052e-51cbf213efbmr72564351cf.43.1783890018581;
        Sun, 12 Jul 2026 14:00:18 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:51a:86a2:7048 with SMTP id d75a77b69052e-51cbf213efbmr72563631cf.43.1783890018006;
        Sun, 12 Jul 2026 14:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a297sm2363302e87.7.2026.07.12.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:00:15 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:00:13 +0300
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
Subject: Re: [PATCH RESEND v5 14/25] drm/msm/dp: Mark the SST bridge
 disconnected when mst is active
Message-ID: <g2irqebm46aiuyp344wg3zjdzn2qn7q74bvppcgmveaoj2ndtn@mng6dqinykmm>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-14-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-14-2ed6aee1867a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a540063 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=aQLTzbDcWNn4qkm-jroA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIyNiBTYWx0ZWRfX82CRR9ccDBEI
 geG/6IELdxZSpHLAzigiGNoq27trsPeFfjZE8rcR+ywXTofdEjxhrZQ6IQU5S/cZyEfwUzZrlW+
 8MdTDAbts5llwQUY+KCgJdU+oihPHGM=
X-Proofpoint-GUID: -6Njti401Wv7r6JPR8Hv0E3QCtFA8FU2
X-Proofpoint-ORIG-GUID: -6Njti401Wv7r6JPR8Hv0E3QCtFA8FU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIyNiBTYWx0ZWRfX6deJQLGRoTDn
 calBvgaf4eS9AZBqSMPox89tSIex5zyv9pOqmx/hO8gVFL89g/nMnfc+atHAWE8WJB5qsFQHzAi
 HL5FOqc6p08ZinDim9L9IVsCX6l6hs1mtodllDhSJdj9aqHa6YI936dWpT2oMEyTzG5AOXO3yMI
 5UESadgAGVxQLJLYgTNkVtMCIQIIkmpghzUxTYaQWYiQrqVILUjPMMuUrb4i0zV34QK984ES99q
 L4tHYuBDX6EgL6412f1Z5kTJH9iIiSw47z3jpWPDFHt4/zM7je2ukl4e9pMy7Ya797TcdOdDFog
 59TOvz58+eQ7uhlWg9UL5o8NVCyv0cLfUoGZppzwJRSCN7LqCQlLAXiB4j9/UpxpsiK1Furzqg5
 0PctvtjdBXofK7Wsd7vKa2yuJmuIHiTMs+lloZLhtQNH627z987nScVFAi7cwc1M8JcfJy+GtVF
 wB4bcj2JXfrhO/iWuZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120226
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118600-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C12D745E48

On Mon, Jun 29, 2026 at 10:14:35PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The bridge detect function is only applicable for SST. In MST mode,
> connector detection is handled by MST bridges. Skips detection for the
> SST bridge when MST is active.

Please mention that it matches the state of other platforms.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d0081ea9f5cd..5786e598a406 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -910,6 +910,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>  
>  	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (dp->mst_active)
> +		return status;
> +
>  	guard(mutex)(&priv->plugged_lock);
>  	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
>  	if (ret) {
> @@ -955,6 +958,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>  			status = connector_status_disconnected;
>  	}
>  
> +	/* skip for MST */
> +	if (priv->max_stream > 1 && drm_dp_read_mst_cap(priv->aux, dpcd))
> +		status = connector_status_disconnected;

Hmm, should it only be marked as disconnected after we switch to the MST
mode? When is the switch happening?

> +
>  end:
>  	/*
>  	 * If we detected the DPRX, leave the controller on so that it doesn't
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

