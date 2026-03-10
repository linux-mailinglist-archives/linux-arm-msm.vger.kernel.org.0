Return-Path: <linux-arm-msm+bounces-96519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMFvCWnKr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:38:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FF246796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24FAC306C7DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB8EF9C0;
	Tue, 10 Mar 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMICNFGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMkwswHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C148292B44
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128004; cv=none; b=S9uacxhmMMRtCzPbtpUUdJmHeI23MZQw0v/2oc3LIe/SJybCi6+6YogjLejl4bXr7ueVeqGBbpRzJPYcrPCNuYZ3Tr7oUcsv4gJuNG6EvPy+a4Zi2XeDMhtwddhtVvAggZGoyLoZuEpdCml/UX6blUvyLTcKoYxss9aVccAB1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128004; c=relaxed/simple;
	bh=SiNGQ275y2rqtx8AWmX/tbCGzRIsl7L+AqIntr6B+Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h++tQQHPS+4ric7iNm17A4R3S5wGMIm+TQw/XgaSr2u0fauU3HFU39RTVc2t1Gup5s850gi3SMV6Cvacur74czqhZyiXrYxYBv+m+HaGyjYfO1Rcu7Tfj5d3oMFxgeFXLLiTSqM5ibuhqDxhtoH/+2uUeI6zHADu6RUldJ57Xvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMICNFGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMkwswHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ERb02460703
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CjqfLXn+ke9/lyzwQiVi5EYP
	l7mKCaQVtaOChOHp13I=; b=fMICNFGGG0KrNemM4+GR/t64pBcUAFoFxtlwmlVH
	/rHr9OjkhAAmX2zMwucVyisASdECOLGwOOh3ZYXaGVq5YtcCjcCHNxnhHhchscHY
	L13ucLozGzQJQBxEjwL9PtRwZ2g7cpu0fJrMhDrq88/A1N3ZYIgtlUXUIR1FVCBz
	YlAUQcyA2eRV3Xni3W8+xkkXiNIF9kyqhmCVbRGpDGofgMtBKNOwkVMHBy/cE61L
	778nZGRBjIFRJp4jaHnFG0KVYL6HofZQoo/lEDxpacPMTZMKzcNS3nx/m49i+S28
	tbHqFHTEJUKpI+xvMN/Dx4dUGcE23Pj5d4/rkRr4/5MZKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1b4ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:33:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598d3e3bc7so8544011a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127996; x=1773732796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjqfLXn+ke9/lyzwQiVi5EYPl7mKCaQVtaOChOHp13I=;
        b=kMkwswHBfhqKJ6onQzb0VFyCZdz0TKYi2PpxwYaPUzlFfLJDVpQ6xiyEoGIW4sI5+o
         qQRg6Lwl3XF3MxW8JstRPfmoL+vgQB0S9s68xnCbgvlk99WQgAh2zTsNAWMWdT/qky9n
         RpyuOE651jJmzajXBtRpbvQoqX+sYlV4D+272AO2bSCd7l6tY6gl0NqBBM93nHKNco2+
         Sf7tZcmsWZ7WtIIgm+XN72lDg6LcFSlBAQmKHz0UFYfn0H1SHvWJbIN3fTCbxsQJ1m/i
         6yWSVRk47q5eJhdnfIk9LJyY7wnf3HcjWj9TxeYc0x0FvuAF5JiZC2LwB11LDVfaJg6w
         2dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127996; x=1773732796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjqfLXn+ke9/lyzwQiVi5EYPl7mKCaQVtaOChOHp13I=;
        b=kovE6TGDuFsRA6r1E1hKiq5e/MeGBiCRbwKDg+tGFO5yBW5gvzquHUihnRnO0nEQ5G
         HfwHm8qwSlbLYOU1t9nc1vXObCq5VxZEzZhWkNHnh9eDWl5xE2RPNi0IJoOv1I/u+K0O
         sVkiL0s828cGyxUk4TN+znLCYj72cJSvDZJ/4fZDdkNH+gcec2Eaw9Z35ZRT0umKnw37
         Z2AKmR9Q1I8oAsRDYStSpHPCNnq7yuiTWpO0JWLlgOiuA25guBJfUvz+TDGbQDcrKAcH
         BTOrTi2RG8t22w6jdeDKspsNtg/Yp3xihJEQH3tCn6v/4sDpcFcF87IvZYUEbCgPJQQR
         H8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUc5p5dgqs8nPJid4L8Q20muZcaa22CRi+D58DknxibjIdDJitVlJLAgKI/r9W7IJM8YP5e4NWB+DggaQ2G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DYaDe3SJW1KpG4qCnXDGfT4sGMQntqHDnf5MBG8yxyjoPxQa
	YHggSUfja+/EWRGy+XGv6p//CZgL60HPz2wj2uK4wOAq0wQSYDeTtiIfwuI9VL3Yf/7FDEOO2Gj
	sTtI7N1JkA1LYuQGMMwzk4yCT7X1H35LJ5htFe56i+nrl4K10U9E6X/+5jMNm19cTCus7
X-Gm-Gg: ATEYQzxHwfoFapNWNt42xBWQfd5pJ7L0+ba9gaLUClU1IA377VzSKo2hcphMMxYeSTL
	C+SENIiPiN/y03hSnudlnI8NKFJTXz9QLBxTGZSo1/nzKcfgOGXvy6DUHuuQtbx94TlfmYZyxfo
	/7RK+2CjJp9mCC9pzHXLjed1A28TEpAytKKyDNrR1Vg+mujcY1ncF29SnT6NMy43E12iLcdUWLT
	6ZJEYD9vZin6nJOx5ZcDkeNiq/QmNlICCE1FYebp+q3AqRB9fO6loQNzG4ExZDppLp4WzvMzR5u
	/A3auzd3O2NkKiYUChKa5FPlFSMNyQwBDgAqFFBKJ60mWqC0zHeXePnPlmofthfv3mFlkOlHONX
	xjWEBiZh7pPXEzO5FfoKptPgioiyhEv0o7OQzZbSQyKqBfPjI
X-Received: by 2002:a17:90a:d40f:b0:359:d54:846f with SMTP id 98e67ed59e1d1-359be27c33amr12321993a91.7.1773127996158;
        Tue, 10 Mar 2026 00:33:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d40f:b0:359:d54:846f with SMTP id 98e67ed59e1d1-359be27c33amr12321972a91.7.1773127995557;
        Tue, 10 Mar 2026 00:33:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f7993sm1990924a91.5.2026.03.10.00.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:33:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:03:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] slimbus: qcom-ngd-ctrl: Fix up platform_driver
 registration
Message-ID: <20260310073309.djxq5zsyudhjob73@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-1-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-GUID: 26fBl6tXtHNkDfhgPmdSAcvaO7webRrK
X-Proofpoint-ORIG-GUID: 26fBl6tXtHNkDfhgPmdSAcvaO7webRrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfX1mWgD3Cn2cA4
 sgjOQElgIx3o7E56pJcXr1nFP3yK0sxkrgqnkXwPQryExIL53ajvwdVHuByT5FV586X0zgKlNBl
 +0gXr+YCCXRjRVZ9AEpfBQnYDid6rWDK5Y78xXHenMKdkw0qx/vJhjuTIn62ji1gXYXnz4g698P
 jzhSdN3y+RpCzeVBVAElXbkVdfEy5769gfmGgbg1EPobH+m6TCbtOpoZJgSxU98AKiO5T6ljm4g
 o5QsT+DDG26w28VNau+836In68xECBl+9UG1FsYfyUSugVd4pFogxe33AbnNkvWOG/UsvQOPMTr
 xjKFo3vfRbcGYyQDzfC470k5EnfSKGHUYOaETpuejRCpVWpzODawC93/9bY453Bn5cWdv0Fn2yE
 dd3JATX9suPvdr65MtChi2rDaSnLdBuJtWZHKlQmADyifNFS70uxhNiJHGhUe0rqsnWWEcYv188
 9iqqrdVHTv2YDsrg2eQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69afc93d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tp8SaPNMS71W1gbXFkIA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062
X-Rspamd-Queue-Id: A97FF246796
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96519-lists,linux-arm-msm=lfdr.de];
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

On Mon, Mar 09, 2026 at 11:09:02PM -0500, Bjorn Andersson wrote:
> Device drivers should not invoke platform_driver_register()/unregister()
> in their probe and remove paths. They should further not rely on
> platform_driver_unregister() as their only means of "deleting" their
> child devices.
> 
> Introduce a helper to unregister the child device and move the
> platform_driver_register()/unregister() to module_init()/exit().
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 9aa7218b4e8d2b350835626839371ed6e19860e2..c69656a0ef1766d5a9df40bdf37bae8f64789fab 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1562,6 +1562,13 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>  	return -ENODEV;
>  }
>  
> +static void qcom_slim_ngd_unregister(struct qcom_slim_ngd_ctrl *ctrl)
> +{
> +	struct qcom_slim_ngd *ngd = ctrl->ngd;
> +
> +	platform_device_del(ngd->pdev);

First, it surprised me why only once, then I saw there is return 0 in
for_each_available_child_of_node_scoped() loop..

> +}
> +
>  static int qcom_slim_ngd_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1664,7 +1671,6 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  		goto err_pdr_lookup;
>  	}
>  
> -	platform_driver_register(&qcom_slim_ngd_driver);
>  	return of_qcom_slim_ngd_register(dev, ctrl);
>  
>  err_pdr_alloc:
> @@ -1678,7 +1684,9 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  
>  static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
>  {
> -	platform_driver_unregister(&qcom_slim_ngd_driver);
> +	struct qcom_slim_ngd_ctrl *ctrl = platform_get_drvdata(pdev);
> +
> +	qcom_slim_ngd_unregister(ctrl);
>  }
>  
>  static void qcom_slim_ngd_remove(struct platform_device *pdev)
> @@ -1754,6 +1762,28 @@ static struct platform_driver qcom_slim_ngd_driver = {
>  	},
>  };
>  
> -module_platform_driver(qcom_slim_ngd_ctrl_driver);
> +static int qcom_slim_ngd_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&qcom_slim_ngd_ctrl_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&qcom_slim_ngd_driver);
> +	if (ret)
> +		platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
> +
> +	return ret;
> +}
> +
> +static void qcom_slim_ngd_exit(void)
> +{
> +	platform_driver_unregister(&qcom_slim_ngd_driver);
> +	platform_driver_unregister(&qcom_slim_ngd_ctrl_driver);
> +}
> +
> +module_init(qcom_slim_ngd_init);
> +module_exit(qcom_slim_ngd_exit);
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Qualcomm SLIMBus NGD controller");
> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

