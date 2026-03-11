Return-Path: <linux-arm-msm+bounces-96799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJopB1XHsGnTmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:37:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B605B25A653
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBFAF302FB30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A492136E488;
	Wed, 11 Mar 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDRn8tRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WH2IQP8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F236DA09
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193038; cv=none; b=g0vtCUKboiG/GQ9k4RB8FJXuiUI3R5DTN5iXR8ENHI0bAbpTwd1V0+QukW54T29J+L1QcQVF8/+gr+KONRYz+7Flnz7OfhVBB65/bbrP24EWqJKWpHAlZX2G4RpVOFFacIQMTF422zWCY28iKwDJjhZjT1FBgw3Q3HGO4Qy82n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193038; c=relaxed/simple;
	bh=sY4VrqF9ohYtCj6dkipnxOwbA4CLc+4Y+UVOTFVVRy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNs2d0XXF5T6QcK8C6mppW3hvOsSQoGTgH/TDwyMjhB1R+5oovZv/DwSuRj0KW0Qs/6CaU0FSB2zCTo3UUPwbP1X0odY2zKY0BOuiOKKuhwDH1MSwiKtb/rbepYACaA7QdCokALza3N505gbX3WdJhlzoIasWga8Q+SJNG27q7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDRn8tRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WH2IQP8r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B10v3P1265798
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcSQWdzB0re7FA2BhCO5FeuR
	05PyZU31s8Lle7bw8c8=; b=PDRn8tRUePtAKL42DAP8O3BQnzPR77oGDljViZes
	yld1CInidI1Mo6d5MwPm5/oXAVRqKvFvhRw8GHZUgCA2jETar5G8id5/6osNScOk
	a0FzdY1PTYERk/UGqEn7Hg1rPRbPCZX4ehZnYbLpup2OW0Mr6sRg4NDzf0bAxA92
	wXpiK+Gz+KC3ml/G56xCYZWKzTh7qmd642+8efNSpWaXAkuGbNVd6AUTwGQqPYMd
	C6FS7tgm2IUZAxDu8BlLRsLTA633Tj7r/n6X0Qc1sbEqMr3umVrdSjotemGexfR0
	o5lOKCw9JqCE7peVAXRUcre63NM27seGjCQH89YZXBOC8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfht8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:37:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1771397385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193035; x=1773797835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcSQWdzB0re7FA2BhCO5FeuR05PyZU31s8Lle7bw8c8=;
        b=WH2IQP8rd3f/+8Yd5jNXvxakIVV/e9YUZqn1zufITQf74sYzn9Ck5l6QybchytBBIl
         yTdesW9m4t62n7fsfE1H5HmEoRJ3QEWNukXV7nVfJ+r+TXw2dOcWeFYw1uBz4yp+ZEY2
         AfthL8idNF9CiiE+ReGvmpaeCBIgiFVz2/AKkxGsf+hXIuR+190A6f0nBraVaOjYW6HT
         LYd8irbulxN/0tRfO2Wsn5PAJ4tesLvtw9WZDWLDoQX88rcHWmbsZ8vFroPO/5TmuggK
         5teQzLU1FtGF/GamsZ2zicTOMBBmtL/faBAqi5wDYZeRZ967vnTaoerVnzpx9S6Nqr6/
         x5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193035; x=1773797835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcSQWdzB0re7FA2BhCO5FeuR05PyZU31s8Lle7bw8c8=;
        b=R4fWHS8N6+tgmRw22rkqtnWlfCZ60tAggoo1N4y42RypQ1LLZdfNKt6zWxk0hZPCx8
         ppHMheDipU0wJWaP+FRIBPhLux0VddkrgCj+PjxyjMEDH/aIyC5jlNe7MGWyxRbZ1mdS
         C0lB3omplLKiOOVWMMUhriOWu7MtHifOi9HECAOdjdjrRFPVcqev4l0p173kD1eW7MJM
         vlOzt8GwU1jwUdo1XTbntq5YPf2Aoo3qwuJK2ssF9XbT60gIBOzzJdRrAbnQB83N+L5u
         S6YJnPIkHWLACn0rdZz9s9QLbAfam4HbdLh3Ggkszoee961/H3gcvkhtd5N8KfLiWWLb
         Xt2w==
X-Forwarded-Encrypted: i=1; AJvYcCVIGicYOpx6q6zlu1wgiwRapFiOYl/Y4WQhzrDAB05cajznxPxzVTYl0qLcTUgLvCTA0EMrWK2IdHEgeRPD@vger.kernel.org
X-Gm-Message-State: AOJu0YzSLEPrTYffXLmBsaAY6FPurRqijjK/JVNakDQTXt0J4QwIwRIR
	cwlknf0S0tS4e0vN5AfcpBHARM5wj+Aou0d+g51tEGXx/UKCfUKcT2FuXTfwAcn7wG2COiAiYgK
	KwOFPYMWndBVlYvBPCz7UmyMCQId3pfkoPmrZaXs33r4Tss0VWTS4IYdycLUFlOkM7Us1
X-Gm-Gg: ATEYQzzxWeBUTmSw2cthdfSbzZItLmXgCRhLWU2FtclOUHeMWJpmkZ2oDUWNOqnHQXW
	ZsYnh9n3B8luD896Z1MkNfVfoUXtrQc3SnnFA/WlXfm7VPjzTbslzWT5btq/VPCIDsXLi/poSPf
	vyQIlr7e+s7Bx6N2UFT0VfpEXULs1VQLrcWPuG/kKat2RqP6mA6aB8SqsKk4y956Zes4gWf6kcv
	clqmKWIUyZBtVG0U/dIl9ZoW7yZg2zupT2DBv9shcFqMTVyUOAo9U+ZDcmyQhtfWlVtYjkrdcFe
	vKdeeY/rqXu/NirliXmlnc2a9Lu8keN/hfoDuSJYO8tIL2YQGLFS68ulhwWdidLZzoeC0dtfPip
	iz3NleZuNOwl6fRLBiVGbby3UMHPL+9oiyXTCovAIkI7dPQN/BovumU56wRcgqsHorjTYQtzFIO
	X89Rzhp6UKABqJkEQt3ML7bArLcD817D17O5g=
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cda1936e12mr126921185a.5.1773193034943;
        Tue, 10 Mar 2026 18:37:14 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8c6:db3a:3735 with SMTP id af79cd13be357-8cda1936e12mr126919685a.5.1773193034394;
        Tue, 10 Mar 2026 18:37:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm131098e87.76.2026.03.10.18.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:37:12 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:37:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 7/7] slimbus: qcom-ngd-ctrl: Avoid ABBA on
 tx_lock/ctrl->lock
Message-ID: <eyitss5zwougawqadgpfb2xa3tv6nbqtlte3iou5aut2neuptw@ehktjxi66a33>
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
X-Proofpoint-GUID: 9rcjEP00uQ9ae9FoUnWP505frgZgyTuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMSBTYWx0ZWRfX2nx9IDaMSYae
 86PwEqlvjXm0PP3kxC2sIOmrQcQ3J18nz+obdIy0vPAoOVDoSuBMJrh/QSSJQxnO+Y8ZFaXMUuB
 OUjf340Ma4x7W7jRzNIS6SJQJX3o9SDu9gCSBURk/8KXoWVFFXCitgCIwQ/av0WRSYbie7gznl8
 2XXSYtrJZw6GqZDPu3IzUlfKRrvoxYWzdl1/VHLoTcczeA7twU8oddtikbNBFLdNBuXZ4dakrFx
 e1Bnu4P3VoCjhQTRrM9diMfPqiUDRJLKOv7r9IbtBR2mvdSMwG2SEcYnRjML9p++pGM1u8COEhT
 1UDSuMUYmxciXiSAeGOt5xzSyfR4LxeXwXjmAUU/+7V9hFd2fpsviiVpL3vpft6i4bACrQ3fr0s
 3A1lmtVRoU1qGjib5rjHPzfn/p3OYJbXt1srXf5UW5b3C2rpW8qIeRtYGpvBz0bEV1/AdeFj9Da
 pAJbf52otATYDwVnwmw==
X-Proofpoint-ORIG-GUID: 9rcjEP00uQ9ae9FoUnWP505frgZgyTuc
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b0c74c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hSI2FgT3CeMcK4FCQxQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110011
X-Rspamd-Queue-Id: B605B25A653
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96799-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
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

What will protect ctrl->state from the possible concurrent modification?

>  			qcom_slim_ngd_down(ctrl);
>  			qcom_slim_ngd_exit_dma(ctrl);
>  		}
> -		mutex_unlock(&ctrl->tx_lock);
>  		break;
>  	case QCOM_SSR_AFTER_POWERUP:
>  	case SERVREG_SERVICE_STATE_UP:
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

