Return-Path: <linux-arm-msm+bounces-96521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAoVAJ3Kr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:39:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80F2467D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5D89305B4A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8133329391;
	Tue, 10 Mar 2026 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b95/m8Ge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOeSt5yI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A92F5487
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128194; cv=none; b=OBN4xxQSA8G8l4ALrqApELYtA8tiOlRKblcpdzvbCkZyhq8fb1dUCdYC2PfdlytZkBpU9DvrqqE0sRLE9XMu5KzdeT3VrlSxJ2DDCn5QEFVoVp4ZHrz20Bw8AMYj6tkG7Wj02fxZKdAhTal7uqTxnoj6al9UjSkrXIiobVeO+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128194; c=relaxed/simple;
	bh=evPPlA3o8/RHmcQ5jBRYKEHN7vySVMUhhyZM9RQ1IYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlfJvYm2Tsydx37yvFgMc1B3/ctz8qrVRGRUtoBiX7tRwQ7NrsBmgjcBa4in/lepCmIpRFyJSWfome0SLh58HVamg5nRBF5NNoQ6W6Nnq1aLoeTug8g3ekXhPDYl3xf9FKuXu8UjJnlkVdNhUGSv9kDUyxsM2KxbcsenWYiy/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b95/m8Ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOeSt5yI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Eg213087371
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hrpBkcjZ0X2R4bvpnhheb3vH
	Wc/nYCiUqWYNqIv9sLU=; b=b95/m8GeprC3+GwB48btZUoWm/0hQtxu0n6Mfppn
	E+p/2iV2+5gJtmr84Ea5jX8y7OqYE8JYqLJPfX8wv2eDdeEFo4uAjiCQ5KMgKBmt
	dxmGQp+Evc5YUx53s4xDHqglj8uuAdGcHv/43fOAyuM5ZUq13ZuY5Z5uAHKN0DKa
	Ub6mzZKujaicaDPpptxNRob6hNTpdlVY1ba27ShQMjKzYRa5PM/B2ltOz0VjDYne
	HNK/D7AiOrim2qgRYx2kkm9x0hJG2HtDMOMjHObIHrbignHDCuoTZqhOhyzR7gxv
	sSss3wPW8nKSvFJht58vV+81DzEwNtxQIsnuHETJW2WvFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy83atd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:36:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4e20a414so518127265ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128192; x=1773732992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrpBkcjZ0X2R4bvpnhheb3vHWc/nYCiUqWYNqIv9sLU=;
        b=WOeSt5yIfp7GT62jJI2h0FDtBDKuyVq/HEWB0F+XbwF2QkaFFiYWnil2BFyaW/1rpk
         4Yfk6B5AkVLUjBEa/PzFrTLiTtpnXj1mCVmarYBMv+FWEuPHTKkNuuH/rvFcfjf8bEKU
         XhmtX6/fF12mqfI3AZamsM+Vv26gUDhMzoEYlfN2nMtS2I4NzZhoNZAA+Es5TXY9RoV2
         MzWiYRiHCJW3LhzIfFmfrHSagRTzm+3Dt0Ta73iVnVcTJG0wRRLR/UeQHs/eJSfO2ZGX
         HZWaPpnA1rF4BNScBwk+E0GylIZ/y7pEufxoqlSyhdeI/ouX02lqx/UtRSy29cMGo4ER
         3QfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128192; x=1773732992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrpBkcjZ0X2R4bvpnhheb3vHWc/nYCiUqWYNqIv9sLU=;
        b=BIsTNYWKVvnQe0Dv5JwO5Nqnxk6GvK6jntPdolwlj2bLUM5Wz1J7yYManREPx0SbnO
         aAHHzehgohlrf4N1DTwG0DpSv3x8mgONGdhGapzLWl1UQhvTgRr8uhu7/+DLqGg+nn4B
         KzFCoW5o4sPrdOG9ASXokLH0OmR3syOyBj59EWO0yQYBa2wGkYfEUU31uA6ToTXLtM/1
         conELwLQ4Ynz5K5SMq0pBuB1uhQW3c2FZsKInzI9cGMaXGlf/fn1nXHcTT8b8HwV2NbG
         Z2/s6xANcdt96iZ1bVQpxLSPXFxQ6lrFdddB7/8T+RzNiKghFcz/NxWNA3PnyQBnPFgb
         14TA==
X-Forwarded-Encrypted: i=1; AJvYcCV3t9d9jpBKuRvvZeanZLWHxzHZ5DlUvqSJu+kZVLPz6OVJzRfG7pH+waQYOIWaa2iUH2UrfajFaj27K9Aa@vger.kernel.org
X-Gm-Message-State: AOJu0YwaK7dHNA+pEzRaVRZzEQ3ncE27qmxj5R8t6tkopYolLXrzLQp3
	whsquSdhmvWjV9LsGYlCWnVdWTMOJ+JRhhBz3EDnHPBHwjy6L/OcM6A0bi0OhmCXN9cXDMUiYxV
	nOrKMoL07Jt7TgpsqZZPzMHDpz/L73HRG5WucI1gAY+ettQtLNWcGJEBYlppm4l7JpcEh
X-Gm-Gg: ATEYQzwvahGJiQ2EGpzkGa4SHSYSrcHGtF/LvAiLmEKCtDx6mWOt0Vk5dJJzN3OnVzc
	2QRnaLyToIynjLfef0Ciwnd+ByrMPs1CWwfa5cqzTUsLe4G6S0/Lg0Byyc+gbRXzzwHJA08SxeG
	gao7gqVi8uNA/dSazLuiJArrqBUcSYmGYADSLAYE8QmidJ2tMdxb1MgNWSuXz02SiPM8KubmkOE
	NdbP6tkmwZJjUouy7WT/VWjJ0jtvXYkTiU1xF0V2L23Slb7DjelcBOxKF1jEEYBTfYK1PXbOH/Y
	zMPqufxPFs+Yna5Hltz2RdKLoestpjLz8VAIOn7QZC8qWcY1kxT4ecoG+JrFkhtrT26OGmpxsTO
	E9x9pEQmJ0Hmnwq7kZHGMgv9Vi/6u5m3+UY1+l9iaQa9s0dus
X-Received: by 2002:a17:902:db0f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae8238bc3dmr156453215ad.19.1773128192139;
        Tue, 10 Mar 2026 00:36:32 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae8238bc3dmr156452885ad.19.1773128191506;
        Tue, 10 Mar 2026 00:36:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad74asm192662105ad.78.2026.03.10.00.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:36:31 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:06:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] slimbus: qcom-ngd-ctrl: Fix probe error path ordering
Message-ID: <20260310073625.dyqkkaasd6khgmzj@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-2-5843e3ed62a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afca00 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hgJ7biYs1z6SSqIWfREA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Tm-Mchxv_2-mkRDArMf3ID0V2qAa66Kj
X-Proofpoint-ORIG-GUID: Tm-Mchxv_2-mkRDArMf3ID0V2qAa66Kj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfX9asFqCjFCnYS
 dqnhUH+D9qdal12Qv1zW4xMJXCuZIQjQ+uiQetGbgDonpKneJUDKqpPlvzZ9iJF0NA9zz1vkazQ
 evkAa93w5kFNwbWjkdcTvUn3SZmdsZtsHLO0ejGu3m37aM6yUEGpIYjYUqxkQFbcFmbBv1wNY2F
 BQE/8oAXLBwG/euhFSAWg9p/G5+4/HFzlm+ymwPOjSYX9w1gbg78zGGaU87PCB833Do25YOmfEV
 VBIAfUazdqu3zBQnfATtrXis/gN3eU1oBOAnTtwd3fr/JygYTETGZ7SPwSw6Jane1z1ApILXFw+
 +HEqejB6llxgVSxJOTrz2tE9v6mjbtDwbg5cfmtczX9TYN69RPA5x6IZbQQy6wmuSYOId+Ilzb8
 hpJaR81jGhyS/jZonKU7q1NsYWi71Nm/U5v43xCQL4lWvQ5ZXrPbEic3L+zMqnI9uGGnzZOrUac
 P9nUF117iTEfCB8/0YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062
X-Rspamd-Queue-Id: 6F80F2467D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96521-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:03PM -0500, Bjorn Andersson wrote:
> qcom_slim_ngd_ctrl_probe() first registers the SSR callback then
> allocates the PDR context, as such the error path needs to come in
> opposite order to allow us to unroll each step.
> 
> Fixes: 16f14551d0df ("slimbus: qcom-ngd: cleanup in probe error path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index c69656a0ef1766d5a9df40bdf37bae8f64789fab..b34e727bab086c95dc7e760bf1141baac9ccf6a7 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1662,22 +1662,21 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctrl->pdr)) {
>  		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
>  				    "Failed to init PDR handle\n");
> -		goto err_pdr_alloc;
> +		goto err_unregister_ssr;
>  	}
>  
>  	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
>  	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
>  		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
> -		goto err_pdr_lookup;
> +		goto err_pdr_release;
>  	}
>  
>  	return of_qcom_slim_ngd_register(dev, ctrl);
>  
> -err_pdr_alloc:
> -	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> -
> -err_pdr_lookup:
> +err_pdr_release:
>  	pdr_handle_release(ctrl->pdr);
> +err_unregister_ssr:
> +	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
>  
>  	return ret;
>  }

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

