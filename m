Return-Path: <linux-arm-msm+bounces-96522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOCQEKrLr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:43:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD68246898
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F9B30ED7EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F483E9F97;
	Tue, 10 Mar 2026 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ledlJ3/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfzVHXUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1484D3D7D76
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128385; cv=none; b=hmJHNoyct/nIpQcYyUL/3XJu6RZsw95voiStdl26emYSHoLdczZUlEJrijKd9n7Bq5hRih2F3Jr+d75RspnzfE/i0pfEXqaHCm9rmFqaeS4zolaAKmJ+0k0meWOeAtjpeNAQV8Gqc5au5EeD1ULIHGVKnosAQOfOocVEEF5VET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128385; c=relaxed/simple;
	bh=Ee95napIswr+YinpVxc5RjeujdrrEruDYBqteyDH2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj262G04esIUNtGiNdysXoN3TaV/eJA+/fsrqCobCAF753cYAgONWCzaIedQFdv0mGyu6hZpumDAbnqp50FJV1EnXDSz5TndnhESoPJi7qc7fU5tjxV8+ewU6IjGi2sK3q7r1PiMXrLBby8e/XqItoaX6hzyvlBtnQw5nNez3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ledlJ3/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfzVHXUH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VLOK2021448
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F80HPQ1/HbI25COFxU2GLyzB
	JFuxorX49mUflnSs+xM=; b=ledlJ3/50dzcUX13OPhxOCE1iB4UfMFQIjLXU/eC
	VBkG9EWww6DHReFXbR99imJIXDQJw9M6ql2RQt67jN4/5e0Ppceup/pGBvknfb71
	dlp6cCfmY5Hr08QZ3sXbEKCftaAjL/m+0SvBUWKOx2RQPG6Jxo9aj9uIwmoTL+CK
	IUdyK7luiD7CwgGH+XpzvhQmLouWqI8TyoNz0kbjiNHUTm+m7B4OmZ0XrJUZx5Mg
	u0FIXUubFRo9KL2KeuBuH7eObwPveUx7Q0Fb813DZXqW4c1vGV6JVLcPoYh/PCYi
	oNi8pkPCyvY9do3mISGFHS32gVF8FZohfunXjBnZCb94UA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w877h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:39:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae47b3adacso86244855ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128380; x=1773733180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F80HPQ1/HbI25COFxU2GLyzBJFuxorX49mUflnSs+xM=;
        b=QfzVHXUHMMupM3sMXpNz5jBPe58aXWk33o89QG0bvirABkQfAOdndGnfie/mF07+DY
         9rLwnsrFmq4qzwCLMyPVcCFh3ghnmTYkscUamHQJKGJaX5WaZFfD60Cvcpn1FZ9sq/xN
         o7d6tGXfTNsX5/4845pyted1Nnge35lf7zNReueNPCF5AOWL0zrwcjsDtG6ea3D+PMcA
         RqBmFDUqjVmd3iOT92RJnaZiRL+htDIK35FMeiZHTL6NdvftcNhSxh3KGGEM614zgjJ9
         QnZxhIW/PAjeYbgNWv2kU8ZLW63OHrNC4RbARlzaWosLKwRSZs8EKxtfgE7BuaDVQSkD
         weVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128380; x=1773733180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F80HPQ1/HbI25COFxU2GLyzBJFuxorX49mUflnSs+xM=;
        b=tRe3yK0MziLMGOjVP7chnmQIJ1nmWzR5uCSIuIiGxJDjEojconre8OTpwT00aenTWm
         na8Hd9nYuCCn4jombwBP4TL6qZzgeV8j/MuMua93aXIfsRsMCsqXyitFGkLY0WQJuk6G
         6E/3yt8RwrnFneHs36608qpKnZFQisSHMaBGDA0v1n2AC0kEkwKKp932vjap3QLHH62N
         r98XCQTHlbykZU+xetWT7Lr2Eb1bHEzQuCgGxWORl9IPKd64nCnG6h59ycdAMNOxtQKK
         XXNN32IF1EF/FTy8+zBaG6dz9CnN0E1eThPnzSCYvxR61WLGOKk23TzQacIFgzZpcnYD
         SxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWee48b8VY0pnmap5coryuh5W5sUbI7hoU9SzbpBKxMcerL3bFXqEN+0QbhOn9q+vOwUGw55Eqphz7iIPp3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8TTVMYwW0Q8I6pZQQLGPCy5xWAYxGsnWYVC5KNSGNbja9rtk5
	PDNUcHlVraPmVwm5+ynZww5RfPegW+tFVZPbrtC8PTOfHWghlFXb/WFX6wLk3CWWGBeX0vmOhuI
	K9BF1W3jfPMUQ2wHu9Q5KZhagoxBmOBMpnSqtMs1EJZNZRNYCjtCzF2RjOcr0MSbK8KS5
X-Gm-Gg: ATEYQzyPpXlt93PJGjnPT5quYNa3K1tBtEQy5hX70OOKSe9snwUkLTBKjp2V1gF0ZdX
	bXGZ836ewWP6ElKSssgVn1TFs3thm+q9YNrLzRJpWiIdx5+LaU4dMNUoXH3VKhmaauvif43vy4i
	8LZP/4pJe16+A4x8I1BkGZPUpbZERoVgjGL6dAMO/QDmFFO25B8KLZ1a3G1KfpRGz9+knOhRj56
	hFyKZcXOpq+THTKeY5tUF6YxbSWgAZB907NcIS3r6MDLk8TzFQENzRyM+GJ3YDYlw4o8FQY96li
	zXGpTxVHVw/mpU/x70vx8LMwxWH0XNUGfogTJ2XLEuEmbS3m1OP4JYtwb2jNDqvqP50sUWNBqFF
	NxvqaK+pB+bh7S0mbXH5O/bhOW+RZRxvLIkTPkCJZQ8TBlfF5
X-Received: by 2002:a17:902:e748:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2ae82519bc2mr150496625ad.38.1773128380211;
        Tue, 10 Mar 2026 00:39:40 -0700 (PDT)
X-Received: by 2002:a17:902:e748:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2ae82519bc2mr150496235ad.38.1773128379608;
        Tue, 10 Mar 2026 00:39:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f78370sm145364995ad.43.2026.03.10.00.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:39:39 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:09:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Message-ID: <20260310073933.ttble7algoiy7rwq@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MyBTYWx0ZWRfX6rnvpzsTY/XR
 lpxP9EOHo9nrkXb3Ax7WV1oVrqqKPADFdWakok05mTWamjgluk0uEkmnW+u5tqu72ccNnn1APb7
 L1Z8+65MUcsmqFvbG77pWJNv1WCnZuPUQwXZC271MZ4JsbYcyLiraLsBfu3LsYDKTiOh6+2OspI
 WlynycpUeQ2JYayouxyUcqaMGHsqmqe2axnScu3DIKk7UMdoiyt6PAGrIWPUtDtCm4ojcdz9Y7H
 vAO8cRemK8nnsG3Br2AUsXsZAgryv+5A3jTAgv6b990e16S+TJvMmmgwiDO4RnEr4TN87VXHBtQ
 2sTUX2x9IAmd5xY9K6oTw9vnD1XStjVmJkOdYOjFJsFkqegScq9dZhR1uIhBEwC2wqeW7mOof2J
 LodYMn/sHL1XDnp5C9r8zJxXyEqedgHC9cMJYqQeSNuUKLGWcIjz39XQcS58Ka2YBPUe94uSLuT
 2MtOiiXjYkqQfCUNHpQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afcabd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Rba0rGCAh4Qlar_hUqYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: zKo8anZGHSPGkXxLn4kWZ1FOmUzGD2my
X-Proofpoint-GUID: zKo8anZGHSPGkXxLn4kWZ1FOmUzGD2my
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100063
X-Rspamd-Queue-Id: DFD68246898
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96522-lists,linux-arm-msm=lfdr.de];
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

On Mon, Mar 09, 2026 at 11:09:04PM -0500, Bjorn Andersson wrote:
> PDR and SSR callbacks are registred from the controller probe function,
> but currently released from the child device's remove function.
> 
> In the next commit the controller probe function will be modified such
> that the error path will unregister the child device, resulting in a
> double free of these resources.

Change is fine, Could this not be accommodated in the next commit?

> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index b34e727bab086c95dc7e760bf1141baac9ccf6a7..09ce3299e15c25b1b9cf6b1559850adf4aa20737 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1685,6 +1685,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
>  {
>  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
>  
> +	pdr_handle_release(ctrl->pdr);
> +	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> +
>  	qcom_slim_ngd_unregister(ctrl);
>  }
>  
> @@ -1693,8 +1696,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
>  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -	pdr_handle_release(ctrl->pdr);
> -	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
>  	qcom_slim_ngd_enable(ctrl, false);
>  	qcom_slim_ngd_exit_dma(ctrl);
>  	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

