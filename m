Return-Path: <linux-arm-msm+bounces-99566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGpCFPYzwmmUaAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:49:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0624B303739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3E053094EAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4334A3B47E5;
	Tue, 24 Mar 2026 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUVwpc7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TynZuZCq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8D03B47C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774333958; cv=none; b=Epnk7fwqeQnYI0IjBaXCANeb1hvANRSiOrBTHMSf+FDf/vtLDu6agZYPBeOePOAK1fE/KPnfyYQ4cL5IdxYmz/0O20U+m9U8zy0n6g1DupkQu2zcxzAEwtBgd53+sDA1l9DDYRNYzgUKzvV87zJZ0+nvt9BsN5o+HyjXPI9VpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774333958; c=relaxed/simple;
	bh=FdsB9MamT0cI9bJ3AXnYJQBw0SqUp3sP4jRNqpAHku8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7BU+AQjuw92Nv20HkUyB2Ej1pFD5HB3gSYfAi08hTxftUyii0LLonW6BDOfHEn1mVKQ54XY5WIsQwj9sg+Y/K+Qwnrj8Bcny+NsDYIZJ5i6CYqB/C16+3Bg3jB3zKdY0hj5wcyIOCm8PKGMm2CrDkyi6QcP7dZeNO0l8YJoa/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUVwpc7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TynZuZCq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3sDG5943490
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Bk9DQPrM1MAWu7rdtJ3crEI
	UaG9QOGukEfNOCxHMM0=; b=WUVwpc7xrIUGh6rmxM1FHJl77MhFkWXm6OHGCrLA
	x6NaC+AsKhXLmKVRliHU6ZS1pJxHWr5T+4olFoOHiaPrCBEsJ2RuwaCsY54bRlrZ
	UlfXnvnRQGtyuSxaM6y7Y5V0RuV9yfyNji30LsIb1ErDtebFbK5X0mmS+oN4Dake
	vuDc1QouWLNtKp5XesqFdKjJtTR+EZxuQwh350IDA9LG1vcc3seAaEevJC/RuN5F
	eIR/ccwLnM3Z59aqeBKoq0/H9Wy12R300JMVgKJqYMueLZejBH8SKEoCxHE2f05U
	6VTeIQB6+VzyK9tEScmCJ0L7Jy35o0k2Wxwbk2cnfGaEMg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkujbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:32:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c646e980bso116237b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774333954; x=1774938754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bk9DQPrM1MAWu7rdtJ3crEIUaG9QOGukEfNOCxHMM0=;
        b=TynZuZCq51iFe8uOQ0bsZF4rLuSx6IdkRREs+9m1+ntdIIb1YIVHcI6tH/gIxfOqnk
         zMws2U5tV90xhTpWtvwz75h7SFDHH6HcL8EhyTEdLxentJCu95dBqMDx33tmGz58lv4E
         MP9By2RTqAmfjT7veDhVE5UWwckmkK6vfnnLg07evyatG7sD0sX22rqCajiKakOrTmKG
         kQODprLUeqE3WIL/HzkIOxkbAw4J6sCJIDghNIuIWVOZH/gyhM82bEiVeHXR7w+43PP2
         VuAGwbfYSQC/W8eJPQRXUfoA0bdeOQxh7Tq14u8eC6hSX18Pd5RVuk6CwYMAsQ8ToEPk
         1RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774333954; x=1774938754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Bk9DQPrM1MAWu7rdtJ3crEIUaG9QOGukEfNOCxHMM0=;
        b=LtbyuRUUkuHzGG0UPolixF2ud05wJjZ0/K+8rxqrsJrUO9oNTeVpH4tKkCSU0catI3
         Xgzu8iMXbbq+wUoyvqIgLPNbegPTmVok6IiVNf9kibRDRJSfgpwBBEdFbKZHyWk9P4tN
         UpUzs8Xtgo1NtLLFrb+TO6EZliaxKfP8aYqXyIRfYQ2GFqJNn4imTJbCCoZUKJOksotk
         1LOiLaI58JOOJyHFngU6QBmzqEdoi0WXz+itzoIq6+r9psx3lonRWF2fTc481RbgQmyy
         fOEkXb5W7cRI1ZOOGiMrePNMS1uirKCIvOflpApDGrU690hYd12GUv+WcfrehehiwUT7
         rEog==
X-Forwarded-Encrypted: i=1; AJvYcCXilBDIFo3ooRsvdiLwZ9R8dA4h1EDI6ShQ43fjRpPXXAAlKlFpuSzaJr4jiksSCtn6tMqhM6JF6fdnNvYf@vger.kernel.org
X-Gm-Message-State: AOJu0YwiP93++e+G33iv7KlaDJf9mMdHgw9ohr4tGqmlQVyXpHXFGrfT
	aXOQefJrhLS57dXmGSNde1NZBc4N19QnOxV55CuagBRkzTHqXGJvcJGx2l8M0mmMPVZK/KRsKD6
	Qi8R7UYFSqbthyZXcydpQqiGOa11sL0VjNeQHcAfQoxPSRJzxJmCTz1oVYb3cQw3Hle3L
X-Gm-Gg: ATEYQzxHQFyHen8hqCm1ZSDVbfhui3S+PmA2eUJDW39Q1x7xHHjf1gN681uFfi9fXOl
	69TH8Usb5W42PU5gpGErOqD4Po6+e5fweP7n+F3yP0G3UgIDK8iV8EZg+UyfGFiigvi0oGd0wbh
	x7PXjS88B3JK616ipb04ckGjrNObMt2ol9gOoBilaH409YDCLZQJaoH/QI3YtQ9huniQc85EcTs
	aR64pZ56yhhJFKlqCsPIAFt7cLFIpphZ6KOiiRGTdaSB21lC4+rhkTONNONU8vULOFwbxQyMR5M
	GKKedmklR73xki2a8EEhmLPrVcYAJELSnhoZXZvmGzgoFYrGwsphkWiVdKGsROr3k0UoPci6NrO
	X6RNLphFJhCLz2g4RrdFNN63yV7+yTa1xaIJZ4Tv0usjn5N+w
X-Received: by 2002:a05:6a00:1742:b0:829:800b:9fe with SMTP id d2e1a72fcca58-82a8c35d212mr13189035b3a.39.1774333954407;
        Mon, 23 Mar 2026 23:32:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1742:b0:829:800b:9fe with SMTP id d2e1a72fcca58-82a8c35d212mr13188989b3a.39.1774333953665;
        Mon, 23 Mar 2026 23:32:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm13116945b3a.22.2026.03.23.23.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:32:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:02:27 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup
 ownership
Message-ID: <20260324063227.vlafq7ukmm5fo73z@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-3-5843e3ed62a3@oss.qualcomm.com>
 <20260310073933.ttble7algoiy7rwq@hu-mojha-hyd.qualcomm.com>
 <acH4WGLAfJnyzK9H@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acH4WGLAfJnyzK9H@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA1MSBTYWx0ZWRfXw031j+EYl8jw
 NutlVcCe/JZ2cYJyF+m8sWc5RPIGERAcMTGdDj4zIfQwEyDpvPn+TR/S+jM2gP60QG+y3ABuCTE
 Jl0vSRElwXcaSZ7eHTLSauplw7ROENlSw16UMZCAqLrI5Vwfrvr31bQHqdLmLaJctkVHbTP6VEl
 STs7yxqIPwCjogzCZx94fUYcqNLNYMs/vOSmYCDLDewklg6jlv34e+lG2s1SWuI8J3AOI4KXLjm
 919OEXS0pD4dhnZ2TMFtor6BpKKOpaBkUi+3oyPD+MZq/3QrTUiEQH+vqyhZaKmhgyn5VrDg9To
 LdKa3vaekJEMzwfguzLjLZnZZZIhMdfs4XFGfUDpV0NdhPou7SNKCVTExsc3M0owNKQoyYIrviI
 MyL7XwG25y+SHEYv62zaNP+Esa5U9EKWwxh3n+pXYLD7BIem6bMdHsdKsGGQ5M0AqQPLvfouHpF
 Nl/Kiw1lr1dzclsCh+A==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c23003 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=24C9S6smnu-WsuHNAWcA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: q_WGb5IazyN0aCrB7XyBd37n4keP8NPr
X-Proofpoint-ORIG-GUID: q_WGb5IazyN0aCrB7XyBd37n4keP8NPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240051
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99566-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0624B303739
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:36:49PM -0500, Bjorn Andersson wrote:
> On Tue, Mar 10, 2026 at 01:09:33PM +0530, Mukesh Ojha wrote:
> > On Mon, Mar 09, 2026 at 11:09:04PM -0500, Bjorn Andersson wrote:
> > > PDR and SSR callbacks are registred from the controller probe function,
> > > but currently released from the child device's remove function.
> > > 
> > > In the next commit the controller probe function will be modified such
> > > that the error path will unregister the child device, resulting in a
> > > double free of these resources.
> > 
> > Change is fine, Could this not be accommodated in the next commit?
> > 
> 
> The problem solved by patch 4 relates to the oreder that we're acquiring
> the resources in probe and how the error handling of that works.
> 
> If I squash the two patches, it seems that I would have a lengthy commit
> message talking about that part and then a "also, while at it move the
> unregister from X to Y because...".
> 
> I.e. it doesn't feel like the same logical change to me.
> 
> Please let me know if you disagree.

Agree..

I was not sure about these text usage "next commit" and "will be modified",
Hence, was asking if we can accomodate it in one commit as both are Cced to
stable


> 
> Regards,
> Bjorn
> 
> > > 
> > > Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > > ---
> > >  drivers/slimbus/qcom-ngd-ctrl.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> > > index b34e727bab086c95dc7e760bf1141baac9ccf6a7..09ce3299e15c25b1b9cf6b1559850adf4aa20737 100644
> > > --- a/drivers/slimbus/qcom-ngd-ctrl.c
> > > +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> > > @@ -1685,6 +1685,9 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
> > >  {
> > >  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> > >  
> > > +	pdr_handle_release(ctrl->pdr);
> > > +	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> > > +
> > >  	qcom_slim_ngd_unregister(ctrl);
> > >  }
> > >  
> > > @@ -1693,8 +1696,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
> > >  	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> > >  
> > >  	pm_runtime_disable(&pdev->dev);
> > > -	pdr_handle_release(ctrl->pdr);
> > > -	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> > >  	qcom_slim_ngd_enable(ctrl, false);
> > >  	qcom_slim_ngd_exit_dma(ctrl);
> > >  	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> > > 
> > > -- 
> > > 2.51.0
> > > 
> > 
> > -- 
> > -Mukesh Ojha

-- 
-Mukesh Ojha

