Return-Path: <linux-arm-msm+bounces-96801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IhiAkPJsGk8nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:45:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE425A78D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 136B13009E13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 01:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A68640DFAE;
	Wed, 11 Mar 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClVhRmEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffjZc9XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981D175A76
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773193532; cv=none; b=dlvcr+HS3QpozwdHSFUfN5ttz0JNoGlLPjIfbxmNULzGkmAYNr+JvExz9qtCLav0mPYC0lVPXX+D4vVGjuMiwPIyVgApz1nHOtKYPJLhWQoRVoH//BXgueWQhar98BdDokUU/Q0FoLpTpZPmgsmBnyzwKXRj6y8xMHv2U2Xzwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773193532; c=relaxed/simple;
	bh=5YtUYEmAFTe9h0/m9ByxK+bX3xsmB1lIBbTonuwpxL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXzFBW/RTWvgvbeF3tnfqKkeplgc6PSGyOwLAExXjwEUQsA7wtnbQLM9ytcV/iANOnebe8JCnl1/cDZzdDffa1de1UP6Glm+ViONvz1FmCWCHXzFCv0Cu4YRmRhPf8mfSQzLL8gpVTlORgxomGOnmxymqTNEMt5LMZkToeAqPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClVhRmEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffjZc9XN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIlGNw3295899
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnvYoQz83uuHbndV1q5nJmq+
	tn2JTM91TDSnDm7YcUk=; b=ClVhRmEdykA/wzekWq7Ui6cVkrYWn5qU4rGioJoH
	ZCBDRTCEirktT37AFltIBA+AuUWtM2vm4XG5BtD2ctSJQtZ7jNFQidtijVdOxyPA
	WiEbrqB+TGW5UDz0fi1KdmAuFJm1h7YCAYCPlHf49xtZwrfn94yYzAGH63bGOXeA
	zNmqgOWRwkbhSqiOeEY3vueBQe1DUT/oL1yfui4j2InrRPr6hbtl3bIGb/UxG76w
	c9AaHmhVfj71vPsS1SA0y3pjJc9Rpsrajx4pCGGcadxSQ8T1yO3asQv7ESu7hYx0
	bTYu6fuXE/vI8iHcNZ9NGCj06THoRvLEitYXMUnGS9drwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mugdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:45:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937c5b742so15968641cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 18:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773193529; x=1773798329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnvYoQz83uuHbndV1q5nJmq+tn2JTM91TDSnDm7YcUk=;
        b=ffjZc9XNnC3iTGt9sAYTjR5oFxXs0ff9XMoCtnay1UCNPmaOuj2rqe815syF5Jqcdu
         zocDcLzIee+DYZbRB75T5qBFICSa1MdRtN7Phs2tLwFX4CRPtUA1ezaSiYEvHCb3XkTR
         1O+OmVroAdH3vhGsCsYaky6Iv2BTleNCmULvyl9Pi5SVFp+suPGAhU5Vyrfed8AuxVI1
         kfS/PNIxSsrrnJNZkT3PjEKCmSZORT+d7L6E6ljSdaYPeBYKIgmsE78aioHJZphgrkrn
         pGe6hE8k8Qi0378QnLrMopPIhIPnJdxls4Cyunba361Uw/ME4VvEIQDffrrD4/l6yp9W
         gr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773193529; x=1773798329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnvYoQz83uuHbndV1q5nJmq+tn2JTM91TDSnDm7YcUk=;
        b=rvIlv6v7Rdnq4bxuBXvq6KQ+/JbcIaSx5qNAvKe9S4oer5QQN/g9EddHLvI6KfCw6V
         aHrZcz+kIlbi8L0HBkwsIazGLARWaRPejYhmbenPZUY96iRF3gb1baJcQZu0h299WgcK
         N0Q276JR+QtWMdiD16mPbyRlRIiZe1coUUgf9s5UB4XLxBigK3mlZZuvfr0yhDu6Q9Tz
         +LqdmSxWgRCDTZC1EVay4GW1IxBwQzpVrA5meshyn2hlSXJRcW4jLyCum/ucKzx6Y6WW
         ndudFdwVRUaKPS3+SomtZYf04PjGBcsxcLbtstvh+POSzOD8ftmO8VAkCvPIqslIvVzl
         gu6A==
X-Forwarded-Encrypted: i=1; AJvYcCWgde+ahsL++cdeh2aY8ZozCtAsF2Ytt9tw/WaH/XsUpUH8TWppUEzao83e4tYUWkO0YP5KQlZbnnd6DvMd@vger.kernel.org
X-Gm-Message-State: AOJu0YwF5GzTP/kFZwWqjxx9zlBagQ4zQXRNeppAcdCqsOxsTTXz04xa
	JFWcpbQi6X3AKC6THjcJJhuh+dX3K3552S1ThAvTkG0twKyBFmaVnsGKJl3z4x6B85KO98gc8Ge
	VLrzEiNXLvRznOfmgcBeqhsgKg5krV/MohJrADrf4iV3WopA3DGdlgNeyLNMkJIeqAbTaXB5A3X
	Wg
X-Gm-Gg: ATEYQzwP3UDfN+SHKztccS2UBg7uDN8bT5NMEaIIBFQWuJSjCYvaYKQ6xqkLWss81hG
	uctYvqwE4LW8PtrSw6QyKmdy7n+g+iijgKPzXJPYmV5ISC7Xm/lADF6nOYldIy8fjl+luEn1i+M
	QNa3rgNR9DpqRwJD6OcE1KjoYRg3/L+ptbXj2VkW96eqcRChva5nQYEJCApDJwplKVC05GKpVvd
	zlAj22dR4D/rcy4CKXfH9JwnZdCJqhg3tsxoFDOUNsiGwmBrHoe0pAdCDTEDdrqH6M58xYm3hWr
	+fNOLj1jtluzq9C1qpFPUEaXWc+YpiV3jAm36l+Lzq5+Jt1D6Au09k8De9llmjZMS9XCnwHwg4B
	4cYvnBxwDtvUoQUfU//0Tblk1i1AAyoSzq1MO98lIvbp5fw7x32tN4l5C6RPf5dZ9OPQg2opBR7
	DbzArn44NGjQmI6y8P98dNjAisEldTH+bOoF0=
X-Received: by 2002:a05:622a:180c:b0:509:379b:d48 with SMTP id d75a77b69052e-50939f530camr11693081cf.9.1773193528711;
        Tue, 10 Mar 2026 18:45:28 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:509:379b:d48 with SMTP id d75a77b69052e-50939f530camr11692941cf.9.1773193528307;
        Tue, 10 Mar 2026 18:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm132524e87.7.2026.03.10.18.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 18:45:27 -0700 (PDT)
Date: Wed, 11 Mar 2026 03:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/7] slimbus: qcom-ngd-ctrl: Register callbacks after
 creating the ngd
Message-ID: <auuvpevzpawojqo2girimhfaudtueukbgibklfzwiseslpswmg@qto5chpsermz>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-4-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-4-5843e3ed62a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0c939 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1m0rO8gg5OcOTR6atC4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: GE7LbQXsVWmTDJSkWSCeOlgAS_4PtyBF
X-Proofpoint-GUID: GE7LbQXsVWmTDJSkWSCeOlgAS_4PtyBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxMyBTYWx0ZWRfXwRjRiKkaOnZT
 h14ttIJAHwgr+SG/79HfUB2VUBJ3Hvg4VVkkeKsgf+OjbLXaVj/tbi3JwLVo0nQDuTnWth7oefu
 FFQsie3EUpFlAGW4OZJ4Vh9aVb5X4rmAWFnjfHU7sISPA2JbgJJfKdY2MVF4d66Uj5bKCtDIxal
 lirEBfw0rLJ3xskR9nzwwMFL1FABx2IjFqq+NWOaWJiZBoVGetBVsZB1HnCuXquvpSaIRVnHVpI
 dhT1DMt3Aq4Hbyh/UwCW8SESNsUG2NpQWMnU8pUHqbOfa6mwS5AqyY2reGSPkbrrmfhruxNOzUI
 ehjvXcybKvld/0WKk+GK7NG1qk1WdWykEY+GJf22BzohpqKKRa+19QVbq7mSkXaBFl53egAKl6Z
 ojET8PAlieubx4s5E6HJIy9uXWOC2ke1s/Sejkk8uvDlKTr/BAnmGUzhQFOw+qzpCOV6EKr1svl
 XC/C4U4mmRb7fWMUdgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110013
X-Rspamd-Queue-Id: 17DE425A78D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96801-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:05PM -0500, Bjorn Andersson wrote:
> When the remoteproc starts in parallel with the NGD driver being probed,
> or the remoteproc is already up when the PDR lookup is being registered,
> or in the theoretical event that we get an interrupt from the hardware,
> these callbacks will operate on uninitialized data. This result in
> issues to boot the affected boards.
> 
> One such example can be seen in the following fault, where
> qcom_slim_ngd_ssr_pdr_notify() schedules work on the NULL ngd_up_work.
> 
> [   21.858578] ------------[ cut here ]------------
> [   21.858745] WARNING: kernel/workqueue.c:2338 at __queue_work+0x5e0/0x790, CPU#2: kworker/2:2/116
> ...
> [   21.859251] Call trace:
> [   21.859255]  __queue_work+0x5e0/0x790 (P)
> [   21.859265]  queue_work_on+0x6c/0xf0
> [   21.859273]  qcom_slim_ngd_ssr_pdr_notify+0x110/0x150 [slim_qcom_ngd_ctrl]
> [   21.859304]  qcom_slim_ngd_ssr_notify+0x24/0x40 [slim_qcom_ngd_ctrl]
> [   21.859318]  notifier_call_chain+0xa4/0x230
> [   21.859329]  srcu_notifier_call_chain+0x64/0xb8
> [   21.859338]  ssr_notify_start+0x40/0x78 [qcom_common]
> [   21.859355]  rproc_start+0x130/0x230
> [   21.859367]  rproc_boot+0x3d4/0x518
> ...
> 
> Move the three registrations of interrupts, SSR and PDR until after the
> NGD device has been registered.
> 
> This could be further refined by moving initialization to the control
> driver probe and by removing the platform driver model from the picture.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 52 ++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 09ce3299e15c25b1b9cf6b1559850adf4aa20737..76944c515291a62fb9cb192bec5cd5c2caa542f4 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1613,6 +1613,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	struct qcom_slim_ngd_ctrl *ctrl;
>  	int ret;
>  	struct pdr_service *pds;
> +	int irq;
>  
>  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>  	if (!ctrl)
> @@ -1624,19 +1625,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(ctrl->base))
>  		return PTR_ERR(ctrl->base);
>  
> -	ret = platform_get_irq(pdev, 0);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = devm_request_irq(dev, ret, qcom_slim_ngd_interrupt,
> -			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);

This should be still called here, with the IRQF_NO_AUTOEN flag and then
manually enabled after registering the subdevice.

> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
> -
> -	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
> -	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
> -	if (IS_ERR(ctrl->notifier))
> -		return PTR_ERR(ctrl->notifier);
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
>  
>  	ctrl->dev = dev;
>  	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
> @@ -1659,24 +1650,41 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	init_completion(&ctrl->qmi_up);
>  
>  	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
> -	if (IS_ERR(ctrl->pdr)) {
> -		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr),
> -				    "Failed to init PDR handle\n");
> -		goto err_unregister_ssr;
> -	}
> +	if (IS_ERR(ctrl->pdr))
> +		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
> +
> +	ret = of_qcom_slim_ngd_register(dev, ctrl);
> +	if (ret)
> +		goto err_pdr_release;
>  
>  	pds = pdr_add_lookup(ctrl->pdr, "avs/audio", "msm/adsp/audio_pd");
>  	if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
>  		ret = dev_err_probe(dev, PTR_ERR(pds), "pdr add lookup failed\n");
> -		goto err_pdr_release;
> +		goto err_unregister_ngd;
>  	}
>  
> -	return of_qcom_slim_ngd_register(dev, ctrl);
> +	ctrl->nb.notifier_call = qcom_slim_ngd_ssr_notify;
> +	ctrl->notifier = qcom_register_ssr_notifier("lpass", &ctrl->nb);
> +	if (IS_ERR(ctrl->notifier)) {
> +		ret = PTR_ERR(ctrl->notifier);
> +		goto err_unregister_ngd;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, qcom_slim_ngd_interrupt,
> +			       IRQF_TRIGGER_HIGH, "slim-ngd", ctrl);
> +	if (ret) {
> +		ret = dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
> +		goto err_unregister_ssr;
> +	}
> +
> +	return 0;
>  
> -err_pdr_release:
> -	pdr_handle_release(ctrl->pdr);
>  err_unregister_ssr:
>  	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
> +err_unregister_ngd:
> +	qcom_slim_ngd_unregister(ctrl);
> +err_pdr_release:
> +	pdr_handle_release(ctrl->pdr);
>  
>  	return ret;
>  }
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

