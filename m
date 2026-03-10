Return-Path: <linux-arm-msm+bounces-96536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPGdKpLQr2mVcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:04:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B92246E7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08CC33078F86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EE23ECBE9;
	Tue, 10 Mar 2026 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lURctvYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9zFZmgX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B93ECBD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129640; cv=none; b=QLoC1GhqRhccPKwF70/wP2cuR0SSPQm16pDewgoPDXlvkKHrUI0khcr+OaafU3nLk8smwIJV6qo4KtzdlpJd6Babo9CeIWs2ZoBppTBs/MLmtJ0lBnJhSnUBFXbus+msI+LUar8rCbuWKj+RsGzRB6BNkqbJg/lF8dS11ev5Y8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129640; c=relaxed/simple;
	bh=fYNOujxx6NxYe2zOaLlz1irIB+ilchNKF1jB0JvRFYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cH5ghz57loPIqqJD8i6Vwj/17KcFycvS5oRM5VNdwC312sZgD3zYqXPsRn6qZ60SMh5USLBEhV6fGYrTviMmhhWzgyF3Ja5OaosrcaxM3h0HDnxdyFO/IamMFLjfeNgpBXev2WQBtt5dyrta/8pxRSO3SGYoHe+M4FFwTRJtIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lURctvYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9zFZmgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EQL42460634
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0glcIkHMPYElUIV5XbqxlIA8
	HWv58+kwPpFRAYmUSIM=; b=lURctvYBQZwhlQib1Iy86m36wkqntNPJ8kjgRG8y
	4PYTXRmI8uDRdE4uO+6LDwe6g3I0npgTTzqKXwsLtt/TY3pQhVWwfH/lbO5k8R0u
	iQQ8b1k6NdI/e3io55rSpbibJX9ZoVjjogRtLerSZsIWLmKZz7+GTwHf9YYxhoyJ
	kGVAKDPuQckWwJHRZZw0SvTlVyPgyLm4y3HBE/Hdbw8ukbgAoE4gDFXkOcYaypEs
	HnBvnBRI1YDPo3fnNHv2PH1sEqcv5fp2jSkcIc9JHvWKaglpKr5ZBs/MBUAEILDY
	u7Tf0HrB42UaZevgFfed9RAKFLApJsw7riq2NGeKT0XSog==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1b7d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:00:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a535ad7fso11206235b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773129637; x=1773734437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0glcIkHMPYElUIV5XbqxlIA8HWv58+kwPpFRAYmUSIM=;
        b=U9zFZmgXEqU3UGf+B2QHjSET7cgbKCM1+TSOw3o95syviJcqJDkm/dU93Tm30bxrv8
         wO1AgL/TdgzRhmG8G4/AZbBCcXCo5dEAslxbOy+MohQhcLGtNMGKLpxif36h560lTe4G
         3fmP7tuK4Kb/yyG1/eGMdCxrPHpJ/9Q39qBnn7kU3URvib4KDrJhnNM9IbD47tMfOS7y
         24yxHKRPeAExaAokPDgo+lXVrqbEEDWpm+4FkSzvpVlm1lOna+SNUcGRcbO6SO41nTFD
         HiNpJLEqujic1N66MQOUpyPV48evVgtcVxPw3hkkHgoTr05tKxDYVCJlXBxeHCNAgzzr
         lmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773129637; x=1773734437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0glcIkHMPYElUIV5XbqxlIA8HWv58+kwPpFRAYmUSIM=;
        b=t66BWbECm5LgRrdqIAQuzEK74Iby6PBHXOJT7YhdBPTO/aW2ujtHHRE01XbMf1J+Yd
         5kHPO3R+SJpUsRzuoTF9JQaOqjYpVqR4SPShPVp6hIu+7Ar2nFkqiE+tBHYCA48iYFuo
         kuu8DmI0kZ2+CAh6itqCRqkvhMq13aFN+osRA0c2+ctLqYc0djFEF9IjqesCzr8eu9CX
         KR9CeRpw+Ssw3h5PO8k+XzOMNiTHmPcDAfBlfdnmoU716OhqzFSNEI4fZBt+/uJJIinI
         Yj4KTXc5giNN5oacpX52mWllW+fU9+ay0mhAZKYG9eoH0jmr6XA09d0VW+7nPWgVSJKH
         psoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFBvqtP06l90kPT41aZ4hJk3oIC855VNIKCJ8kUAnM5FUplmY0gsN4/5RJMS4ESgAXjc6ULiZyaHOAR09K@vger.kernel.org
X-Gm-Message-State: AOJu0YxSG/gCUTkJQaQLvAX9XCjEnhgJFZj5GJCIA3oDujlWfO7D5JIB
	NTjXbX0pZqiPJfRF59if586BqrqeK7TziS88PS5wQWDm/TahGgwckuJCGCM5YzpI9HmI7Fg/HLU
	ZB2Gsxpx3IpAs5ar4Ml7J+TkvEL6t1dOQhSGTU0czkBl6Ny260PH+ta6XDklGPJbzE31rEIYr9F
	q+
X-Gm-Gg: ATEYQzzdPtZqRbpqFLNssKGy0Xopc5N9MWw2fP8cyRM7eYhZ4hOez7FptVEaS0k8qMB
	63N0sOsh02DQnHQGjyudvudkWqu1kcvkRauFJjt5pu0JnCBiTuzg2qnayTgKBCSdmkEWa1JYjl7
	eKGlrOKB/g1mA7HBactu9+579aImvEUIxF5q+0gQ6+wZP4qZ5jHieT032pIrkNbNoEvlAO4TCk7
	tPpVv18+CZijoQkMvzrhRZfVrvojTksCPbNHJ8bIh/OVE0XSBifC/bGtYgXDa/rE4tAYatxufOm
	v3sf5Vwc32/Uq+tN2dCOonLYjusqAqmHk6eSIwiB0wAhVyI1Dvi7y/68fB+eQuX6mqlIbp2bnzi
	GrjuAN2IzQSf1LBvF7qjBBcBIUAWE7AO8xwuCurAZqB+qoefy
X-Received: by 2002:a05:6a00:983:b0:829:7e6d:cf20 with SMTP id d2e1a72fcca58-829a30dfcb6mr11834184b3a.58.1773129632541;
        Tue, 10 Mar 2026 01:00:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:983:b0:829:7e6d:cf20 with SMTP id d2e1a72fcca58-829a30dfcb6mr11834145b3a.58.1773129632002;
        Tue, 10 Mar 2026 01:00:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4638a7esm16029383b3a.7.2026.03.10.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:00:31 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:30:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 6/7] slimbus: qcom-ngd-ctrl: Balance pm_runtime
 enablement for NGD
Message-ID: <20260310080025.lbof4hj5zqytc3vy@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-6-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-GUID: aTNL4DwOnLJwawMdzBZgs6rLI0mBX91W
X-Proofpoint-ORIG-GUID: aTNL4DwOnLJwawMdzBZgs6rLI0mBX91W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NyBTYWx0ZWRfX0MT+KbIsqb5E
 ED5U2nivSRtQWBVrk2qKKq4dbNg2HRyasgEB2Hm+a2dMvQl0QCPxuxRoXEY+0QxRuHMC+pnjrQ5
 cyolPxv613BXtJw5Rx2CQtPzLcHr3MYjPijg3b4EngHaEc4GiFaAngAOap06ly6zfqQ6BA6wwhy
 Q9NNtbo43cVfYzBvfi1wxT1UA1c60UqCjRDqe/OXpA2ZYtypSVUbUT4CNkASQJB1RrrRaPxOECz
 XiotDUYgoL1n2VIva3qFBR9rLrRkm6wN23z+KPngLlYvFl1F/fiU7YKhGzfYZrTRrz0Y1pk/JpW
 wU2s+5uFYzLtD2MIt4kpGnyRqc+Rf1ClyyPot/z4f91uKTODebvXf1cyIVWbLbKB+SG6I37pZa/
 6y6VuCRPcW6Cgayssixz2AtyYpbH+rHVj/yXiBCdYKxRaAhQ1UffVuvzbrAUXIaUXjANzye9iEm
 cKp6C38Uwp0vu32dFWQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afcfa6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=prLrz33j-ZeXCHbr2zwA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100067
X-Rspamd-Queue-Id: D2B92246E7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96536-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:07PM -0500, Bjorn Andersson wrote:
> The pm_runtime_enable() and pm_runtime_use_autosuspend() calls are
> supposed to be balanced on exit, add these calls.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index d932f7fd6170773890f561e3af444ac2c5730338..54a4c6ee1e71fe55794f09575979826d9aa5be9f 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1584,8 +1584,11 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_noresume(dev);
>  	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
> +		pm_runtime_dont_use_autosuspend(dev);
> +		pm_runtime_disable(dev);
> +	}

Can this entire pm_runtime_* calls moved after
qcom_slim_ngd_qmi_svc_event_init() ?

>  
>  	return ret;
>  }
> @@ -1699,6 +1702,7 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
>  {
>  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
>  
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	qcom_slim_ngd_enable(ctrl, false);
>  	qcom_slim_ngd_exit_dma(ctrl);
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

