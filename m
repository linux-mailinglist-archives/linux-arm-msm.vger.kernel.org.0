Return-Path: <linux-arm-msm+bounces-118601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pcw+CCkBVGo8gwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600A745E5E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XLUIvL1i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ImaJURq2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118601-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118601-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5951300A60F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 21:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D88266581;
	Sun, 12 Jul 2026 21:03:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE5EAD24
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:03:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783890213; cv=none; b=croFMvxWeneqxxPLUrqMf5MgUpOhV8HpvVTwBQAUHydxQiWhh8Rr4yiPDjJPG8lE5AsGzkheztWfxJmReZI6KCvtWrnORU6L9gshBZeYgl+Fnp2eTP5TC4a7qeQe88GoqbfVEllGjB+cwdH59HmAs4GsseyxwUgyqHu3VZlWXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783890213; c=relaxed/simple;
	bh=Nrsi4/LKXeZEg63AUcZP5V7D83udaFItD/Xonm+YDlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSIFhsWZDt10CMo6ZrqX3DJnSU2db2XSeTBUlLX65yOYx7tfn7qh246OTHstmBIkOnPjt8B4riIbXosBPT+CiF+BUH30ir0VQsyzeO379jseZ+6DgV4sX6vYq0lwucFnrKTJcTS8wcERVwImzTcN8o7tHknqphoL7QltcURJWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLUIvL1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImaJURq2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CK8OQb3552150
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OwauCUMemFKV4pu5ansWi03l
	mH+jjZzuHrZDIv01P+s=; b=XLUIvL1iyJZI3OgIc9KprcqS6ntw/El2bjoYNo+c
	4VlPUU/4zA9Hmj3NULgAhoK/AD2RGwq+od4KMWdez1pFPodgLtVt6BbyfJcx0y15
	aCeVnSHJgwsgwLj23Kvs3KwFixLHLhhqvkEzrizSCW84oQEoGGNGoAgJuF4E1nQx
	zwPwiwgVPeooSoBQxUBFnUZxtRJONyHV2s6QGH8JHuWRDNThaEHvS8ltIpx65M0T
	5OXh3AXUP/kskFeEbayleuew4nnvKJIxPCYqt8vheZoRsqgD/AxRq2avT2wfr7We
	4OgO0fBI6DKwcu3NR4oeqxC1Atd5CrEHXQoEAuksNAlSRg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8vbf56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:03:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bfc75c9fbfso1495608e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783890211; x=1784495011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwauCUMemFKV4pu5ansWi03lmH+jjZzuHrZDIv01P+s=;
        b=ImaJURq2q/Y7AElE0VF3uNMDclO052xfkWrQu6+U52TuRmK8Mc5l70ZgbL/hb0jje0
         A1Bapz0b2C2POvG+xd8luS+Hdndo1NWTL5ZAufwvogxGmNriv3z13iXJBpf9cq9z6w3u
         D4ycUityGuNfA0PJZxea85Z4/PWUDRB0TNlUZpxBB8LVvTDs4/zs23BwqiOw9PqWCHRk
         VbMBWxUBIzN8He02VSoIH+trlOz4vbHatw6NHhmGOZ8dRCQwNwojiA441EEypJkmULMb
         SynupYNVNmHTcmQEje6gICLlB5e1TozypHnHzJyhZ46YVx9xmw2MwcPVzfa+ccvRC8t4
         zY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783890211; x=1784495011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwauCUMemFKV4pu5ansWi03lmH+jjZzuHrZDIv01P+s=;
        b=gxzQvOATtuuo6CN2LlR0WeKuKqv53Rq69yipX0NLw9CID7+u0reudMtMxoLcM9NTlG
         +iyHvbNVlAPrsJAB3HZ4eUn/47K7J+GJ3qaz2NB/eDr7iJBA4G7HE9Jwcp7guww8jcWA
         qn/sS25yWAzrdvHGGzb429MTBHf+WbQRYZicpDEYt2N4kmIK/Dgv/ymhwPnmZUkXYlcN
         r5g1v5qDy1/bO9JaHklCarXFGDYVpLa4KlGFN/sj1ZO/qcZQOlJVW4JfRHcRh32pYvqB
         JUsWr1GBf0WPBRnTjzeMSQ5WC+WetuXBO+b4eVvLQgulQqMfw7ob11PJgLUrs+g6B2CN
         w5KQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtR/Q3kJk+E3aJvKDZ6m6dbJaIGV1gd8aE35ylaMBhViHnmGL6GVVKgiO4V+fLRPLBX1RmJ4G0kPtIYCGq@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPKcK0cl3zLq4ZtQ5NCOEfderLb2IRVOfGCQiLLOHSiFcCK2s
	7mWp9D3k4ePKFaaLP+daB/uWlvUfl0GFG8VtQZag3eSnWpy8nFpXoH1h1vPaO2KaxHaoj1y5BMM
	id5LDFNZSVC93P1ynYWyKu3NF/XHKED6Dht+Ix29d+daTv130iUDfDyAGueZaz3mwKd2e
X-Gm-Gg: AfdE7ckOMm+aRSjH7kKFVl8l9sWGWRDDa6QjjBw5gvoCycAWzWL2+UmTj5TrBBpGkO6
	eI3pdRBsk0c0AFdjnBzPSo9H5Hep7jWDxcRdxhyLOSIH8uvQEpOeWCzb99kj7hayaJ0cdmzj2ZC
	+euovFwXocpyMAJ1NTgsJ6DF2akQmC39B1tO3NoVYf+hJOoZbIVf1C137Wy6znnaWVjjMh9H3In
	9CDYjlPHfdHYaPrzK5R5EKjmLwS6lux2qLSYbTOSOls+x6CqwqTzGcbV2Garp0MNVqH0YgpX8Kr
	I3xLfHJ+eZHhkCo1UN0M9CRREtEpCDjM0oauGpje6Vej6FU+PUylmepOnlErvwbUbLiZkpcFi8a
	oXg/SsO3E3B+qD2NEQldwfLh+9TllaF7AgEukn06ow5giH2mR99f/sjcPJL/Jf1zAoNyJ6d7Cov
	7eU+jmq9tscj4vxFzr1DjJPXI0
X-Received: by 2002:a05:6122:4f93:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5bfbf0f4baamr4898803e0c.4.1783890210871;
        Sun, 12 Jul 2026 14:03:30 -0700 (PDT)
X-Received: by 2002:a05:6122:4f93:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5bfbf0f4baamr4898782e0c.4.1783890210468;
        Sun, 12 Jul 2026 14:03:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b1a164sm23251951fa.16.2026.07.12.14.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:03:28 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:03:24 +0300
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
Message-ID: <zfu6ockf6amm6d27rb5gqqy4dvohestx4ewqlmd7liastbhlw7@jjvmq3mi2gtf>
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
X-Proofpoint-ORIG-GUID: zmwQACDSeeIOG0wKCDMfyziU8Zrrsnm6
X-Proofpoint-GUID: zmwQACDSeeIOG0wKCDMfyziU8Zrrsnm6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIyNiBTYWx0ZWRfXxfZix7Kd/ZE4
 ZEQ0KVEhMACetch+fTP3V0/uOlQv+/6AyPgEYrPTfs+nnEtG8Ckz5tgdUCiJsVVAaqCoV75xuXL
 rdsmksbEXtKk3ThoWBGiTWjzJYs2yqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIyNiBTYWx0ZWRfX77k+Nv0fFyi0
 J6jTvDYFHwnt/tywebTxfEB/D4G3Vlpy14dYz/WKQvl4KMZtm12GFqIWIkCFtSGujAaFywTBE4J
 k4JJFuUDMh1v/Z/TXCOvpSE65foicfINHA7dcrVCZitSBBPMKHiEmvyhSJded2ZpNEdPog4bZ9q
 8qS3S+Q4Scodg6e0H21v7/t3HYhV+OhXCc/odpaezQDDDZE56BYTxlwwRV9mkpwlnJQrru5HWBG
 wPc21AcF1rLyKEyYiqyPacLwL6zi1ijWanNWsUTowS7TlDebENBTtm8/hqjMN7LmmtodSoYl7jV
 9iqEQGNFuZwnu273ODPxNkWNtTy6WvXimQT45oykxvRDLRbxPTmP/QT6+2bdwuV1Z4oPOpg17DI
 KADQdpJBOrP2dpH5rfH3JicYo1cP+ZcwmsVc7IDuqkR/45m5mqH2x2WzYyb3V1xkOO2y1AkY8gr
 wZIGa5UYgWSzQPxq3qQ==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a540123 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=aQLTzbDcWNn4qkm-jroA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-118601-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jjvmq3mi2gtf:mid,vger.kernel.org:from_smtp,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4600A745E5E

On Mon, Jun 29, 2026 at 10:14:35PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The bridge detect function is only applicable for SST. In MST mode,
> connector detection is handled by MST bridges. Skips detection for the
> SST bridge when MST is active.
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

Also, if this patch gets applied at this moment, it breaks DP support,
since the SST connector will report disconnected, but MST connectors are
not there yet.

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

