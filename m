Return-Path: <linux-arm-msm+bounces-96574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF8GC4rsr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:03:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E9249056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EBA83036629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EE33314D2;
	Tue, 10 Mar 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHVX8tKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXjCmikU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44834D390
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137009; cv=none; b=U6oSM8TMWZrCzDLzfWT8SfrRfHS3NJURSDObM9XxbTgC5RgJVOju0XS1cWET9LVtDpQ17jInYfcbGLgMAwmhD0EL6qjLWDsCfnGIbd8YWf8NAJ+qJ0fa/qQ+WYKJDcpbDH5bJTKzdXZ4QsVbC1Klqimh3DVMAWcUhi+vE6lOJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137009; c=relaxed/simple;
	bh=o9f/DfHjqtLy+XwGn36m+PNn/X6NRNIVz3RHPScRFiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyRsAqvjKmD6a260pimQ+ImuANCC7bLy+qgLHtoigz0eLE5F1krcZdWs79SgON1QLHGLW2V1EelUQbnjZd6Lfd134FXaq9RL+ofI3E+aDZXXi0qdgZ7B2IjJw9mUeiqhe5+upFzW2bf+aBroL5M4KRyjKdSR6BYotPLFStmVI4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHVX8tKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXjCmikU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8plp23690891
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tu7WN51aRJ2MI3GqxMQYy2+U
	xQuZDNaiymrwuxW8PZk=; b=dHVX8tKt26G23kTAY4KFx04HrJFv+LHqWlxPmEAp
	s4FFFTUFnSKQ2POuLOJnrIJ6HArg+nbvpO0lJfBk8VlVaBMDEHx2lZDmN9TZp+7X
	J8gFG5N84PdMjtvbhftr18LxB/d+hM/B+G43Fqp+j2l1OB1ENg2wG74TgjkuJN9e
	dC/7hY0Spk7/kFAK70iAFCE1y2UPJnIyo/AzgNxyzQyMLfQFg10b8ACfNx2+J3we
	lY2qTr6TXMBu6uuGKIYdVcFp6Vm4PP1bDc7kG7FsBprDfop/Kek+Y1eWBHlVTs2M
	Q4sKOb+GmvuQQafiwsKnz3bz7eIqa1KBG7iriXJxuRA5ZQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ng9hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-359812e4fefso6547167a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137006; x=1773741806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu7WN51aRJ2MI3GqxMQYy2+UxQuZDNaiymrwuxW8PZk=;
        b=SXjCmikUU7Dx2GrC7P0j3B6EnL7fs9KcFpugIPkqG/z0o57TFcxlJfxI6V//6uXSbo
         v6gznRNP3Nsxp9TPIYqhuUE1DRIPX5oqUdDkA2WDSeytrRMcHGLsdQ9hA6jC59mkPx22
         188TiV0UomoncIN4tdJwhNRU4RsZwZepKshuQ8Fdz1Q4jMV8b9WqFPFJzNWUA4ZJaxW8
         zOhIw0OtUuio4v/mIH/0kD002y8B+rIaXDhUuwteLFg3nAat+U6z+g5bi8W+DKjPA4uq
         cPttyoHaMbqw6UkYMGDJyTJ8s5c1bDCfcCaiX5zK519q0Qsnyeptgj++RH1B709+1/UK
         whWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137006; x=1773741806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu7WN51aRJ2MI3GqxMQYy2+UxQuZDNaiymrwuxW8PZk=;
        b=L56c7QSDeFFApUNEl3WoqWzEorMsyBFjgY4usfof8dmSybAk89QFgVOp+OsGqfZaf9
         EhnqtRPwFhzBai+hi5HnuoBVGr/znY/Kem6dkcnS+6YzyMLTY8/lD7js/LXWqvO68aLV
         s0Ch12l+HnzA2Jb9EdMljACERGF+aCMcF7Odwa4rhuh8YEph4orbGRxkwI3H9JDetT4G
         LTkH+AjohR40Ds49iC3uDfdVvUEs8hJz6mJjSJsTpTFMH1w7KSqOWKfsiJaoz1fRnI0U
         lWYFAgzXfqVQSqMoTXHpHeVyRKfQnc1DIEYpBwpV0zAefJyrW/ZBgeEY3JEWaJxzaKj6
         fQEw==
X-Forwarded-Encrypted: i=1; AJvYcCUcslQ1TtolKYCh4xHiSoGWiAxmCsw8grc7O253I9FJlO1bD05x7QF92Phc7BvUQjvk0xwZ1GCi25POfnac@vger.kernel.org
X-Gm-Message-State: AOJu0YxO3S425dz8LNm9FH57s+uLiuustQBeY+DXtr0ithYLPcQ0x0CZ
	cwF0caz85GgHvRPWpX1gtqU5VhfznVaGxwBo/b93hofyZ+FUTZdrahNz7RzvNMxwtS0Ji7M2oPm
	rhBwDrAF3EfAm/R0VQz3VXAvNvOpCzWBXm+3JToMneUyAkglXlaH28EOOkNUWDjHPZeCb
X-Gm-Gg: ATEYQzwfjG8Zqk5PX/0SwRn4DdwpkNBMhSbvbY7t7HzJkSiPph9Kgf11A7PJ/gmE6PY
	L0GSlrNO+PcmFzeT8b1SHr8gY+HgbOlGHr+DQIe/uZclEFzUETM7gCocZW3Xmi1sGrGBj06dcMg
	pa49mFf2RhD9P390nHaEg/BYfawrF+lDzn7pK2VwGmZ+74p6gEnLNauVaPPcjlIRSTLyhVOYIpn
	knNFTPCPvItrWm5pZ94jVeCHW1MwPfKkY27u+twmRxbdWve5Cg52pXxXSjSsS8CeSCwn5Apzeos
	wI3453zcAAwzonx5gRvZH5vwaVvB303xjBaJXu/K9BHz5Ejg1VbQM8ZgLQ6K/1vu8FXd8yW0XmS
	Yqmo1p+sh0Bw4aAAUr9ghA+OE7XXwHjH9fBR/achvPm/p5Qja
X-Received: by 2002:a17:90b:52c8:b0:356:21e9:73ff with SMTP id 98e67ed59e1d1-359f039ada6mr2344271a91.11.1773137005731;
        Tue, 10 Mar 2026 03:03:25 -0700 (PDT)
X-Received: by 2002:a17:90b:52c8:b0:356:21e9:73ff with SMTP id 98e67ed59e1d1-359f039ada6mr2344248a91.11.1773137005091;
        Tue, 10 Mar 2026 03:03:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee152sm3365248a91.2.2026.03.10.03.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:24 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:33:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Message-ID: <20260310100319.fzucrw7do4bxvghv@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-7-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-GUID: Q-QRE4P_E3YPFYFYHFmGdH4zargEOdBG
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69afec6e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hSI2FgT3CeMcK4FCQxQA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Q-QRE4P_E3YPFYFYHFmGdH4zargEOdBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfXyJlfxrzDPkEV
 duve5HqQfxiFzcZpKsDLhtu8SrBcvuDlZNfgST628WJ5607+0l4IsqVm2Q+CoZ6Kdlp1pO6N1HK
 aUewQ9v1Pcza/5iW4PxmsEIx9WzsQKZynXejdVdpxlJapwInuTBWwWyKpSpcVQ7E9oxNrk9xhxt
 m3r5pf0zEFIXGptmhob4WvNUBdE9xBvyWXHOR4GMh/xEm0N3ZyaDvHYJkSZ8Z7Psoz+PAiQEwGT
 WQbJy+fo9RUR6eIKkAkalDG0YCQCUWwlh2B5AyIFxaWZRetP6Sxi/8iHIJD8WXYazojYyF6YyKa
 0lT/a/BCEDbPJGh0CJ8EsevvANpGCDWpKNCyugFQcHNlikYoGOz9W3P6auqm6GDs+eEZRakd9cX
 MLqxh+CE/4WVaSfcIH3Q4+ewP3y1UJiSeF4RjmE077NtLTEkmzwHFi8qCqMrCfNHvh1Bz6ZhVbg
 Ym2zkYVypRBvWwqakOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-Rspamd-Queue-Id: 754E9249056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96574-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:08PM -0500, Bjorn Andersson wrote:
> During the SSR/PDR down notification the tx_lock is taken with the
> intent to provide synchronization with active DMA transfers.
> 
> But during this period qcom_slim_ngd_down() is invoked, which ends up in
> slim_report_absent(), which takes the slim_controller lock. In multiple
> other codepaths these two locks are taken in the opposite order (i.e.
> slim_controller then tx_lock).
> 
> The result is a lockdep splat, and a possible deadlock:
> 
>   rprocctl/449 is trying to acquire lock:
>   ffff00009793e620 (&ctrl->lock){+.+.}-{4:4}, at: slim_report_absent (drivers/slimbus/core.c:322) slimbus
> 
>   but task is already holding lock:
>   ffff00009793fb50 (&ctrl->tx_lock){+.+.}-{4:4}, at: qcom_slim_ngd_ssr_pdr_notify (drivers/slimbus/qcom-ngd-ctrl.c:1475) slim_qcom_ngd_ctrl
> 
>   which lock already depends on the new lock.
> 
>   Possible unsafe locking scenario:
> 
>         CPU0                    CPU1
>         ----                    ----
>    lock(&ctrl->tx_lock);
>                                 lock(&ctrl->lock);
>                                 lock(&ctrl->tx_lock);
>    lock(&ctrl->lock);
> 
> The assumption is that the comment refers to the desire to not call
> qcom_slim_ngd_exit_dma() while we have an ongoing DMA TX transaction.
> But any such transaction is initiated and completed within a single
> qcom_slim_ngd_xfer_msg().
> 
> Prior to calling qcom_slim_ngd_exit_dma() the slim_controller is torn
> down, all child devices are notified that the slimbus is gone and the
> child devices are removed.
> 
> Stop taking the tx_lock in qcom_slim_ngd_ssr_pdr_notify() to avoid the
> deadlock.
> 
> Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 54a4c6ee1e71fe55794f09575979826d9aa5be9f..75d70de0909a8d17e2410d30f7811f32d5eebea3 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1471,15 +1471,12 @@ static int qcom_slim_ngd_ssr_pdr_notify(struct qcom_slim_ngd_ctrl *ctrl,
>  	switch (action) {
>  	case QCOM_SSR_BEFORE_SHUTDOWN:
>  	case SERVREG_SERVICE_STATE_DOWN:
> -		/* Make sure the last dma xfer is finished */
> -		mutex_lock(&ctrl->tx_lock);
>  		if (ctrl->state != QCOM_SLIM_NGD_CTRL_DOWN) {
>  			pm_runtime_get_noresume(ctrl->ctrl.dev);
>  			ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
>  			qcom_slim_ngd_down(ctrl);
>  			qcom_slim_ngd_exit_dma(ctrl);
>  		}
> -		mutex_unlock(&ctrl->tx_lock);


is it not much more safer, to put this tx_lock around qcom_slim_ngd_exit_dma() ?


>  		break;
>  	case QCOM_SSR_AFTER_POWERUP:
>  	case SERVREG_SERVICE_STATE_UP:
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

