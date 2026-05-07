Return-Path: <linux-arm-msm+bounces-106411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK68I0iZ/Gn4RgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:53:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E47004E9A81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3981305A24F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172943ECBD1;
	Thu,  7 May 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LctS8S3N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVa7Fokj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614B34AB03
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161672; cv=none; b=nDJnDbr4i8amo6Q8BluvCYdwd8AHI7zY9lCg5CzF9C8xnngWrl2uyGF/70pRqIFbRBsjk1eInNNNQzm5qpxYMpeYyfjvTo/gbAI9/45bQwIrGccJBEfy1CIBRPFatyP7qHC96u7Fq5xnhGlVwhPrVpIgHOspG26dQAGQ6EAdb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161672; c=relaxed/simple;
	bh=8OS5gcBu8m4VfIuRumMpyBOGfiiulkHjoVmZmwblqaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDktjv4zgCfcW0svSPLtTOdIJ1h2IEEjE76nc2df1U2Y0PhbEkKKKMVmiO5u7Dxg/k1tzm6kS3N0ZrbAO827D5EOmcNx53N98Jqmi177/zZ19j2Dmihr7EYYSzUzoHEQsYSgBS4QZvIFfILjGuGtKJNMjuZSMzRH/l0C8Y3lLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LctS8S3N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVa7Fokj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pT9R1424447
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqpUp23VOHn5YOYm5ollIwpR
	X6JS0f/sJFyml0hKjWE=; b=LctS8S3NpxPKOItgkSmBevJE36oW/VP1hswOm8uR
	J6AT3JzA4tYS/qjkv/q9b/of80955lA+fMGBdyjNrMwhEMKDbWCX6Hi2ycy0j3PO
	CkXTIfIENNyNmvW28BanIU0Nqtzln1RgxgA2I1TN/H0syjJQdhB1hbA4opGnIO+f
	iys3662/QlDSLPAF4UgtBv7KR/fTwTpYASb+pISShm6EUm+JPU02AHb2NePBH31k
	PRHO9Cr3emS2lyrsASpeGAMj8lZvOJW/OHuQAd/82NgLS+0j/lxSSHE4sJiJL8hf
	GLmJKfQctXuFDWM1VibxTH63XIMLQUFXr3Nbk0j0wRyGHg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfsacy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:47:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b52bb3ff88so46313526d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778161670; x=1778766470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqpUp23VOHn5YOYm5ollIwpRX6JS0f/sJFyml0hKjWE=;
        b=NVa7FokjNEkbZ7cLAkFQtkZQc35AlOBnI3gzcDFB64ELCTH1jW38w/wV7bPbyVtznp
         4pP66nK8Ez8d1v2wd4jCZvQ8iVKTOiHoWOOuIg4N9Phwe0zIJatSmnkP/4FM5mrhgQno
         W1ZNa0HG2wENIkNDNas+Y9zPoNSLhfTUYTxR5bkKPFc2M6iLcGK8LAlGDxxTyWliqqch
         3r3TzT4YwQHdhMG1gyxZje1zKuSxgsBX6X5XKd/SaYt/ZBKhlIgZ3dKkPTLCIeqNn3n/
         fPxakHfoVn6y61I7kki8RTrg/be74c/tABth88qrYSlSrQfMB2+sMsTdJOwnMIsBO9eX
         E5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161670; x=1778766470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqpUp23VOHn5YOYm5ollIwpRX6JS0f/sJFyml0hKjWE=;
        b=rY+a7ZTlgl4cWJv+3ZTrvpQA8ABWeTRXLf4fy975d7oonHP4I22rwmHhgRSDeYcdor
         AMc9+eicaEgjhjRxmy9DapCZ2Mj32e0u4gdcEeMFjg298fYj4d2L0HXzEaM69M5zUXfr
         HbpRqtlOKL79VoU+mpwq+QEweqae9YCuvhtGOWIUtIGPCGiCvZMuXBtXJg9W/znCPERQ
         HbBIZe49OF4Pz0xvrMy3KlKpApFI0CtwAT0euaj7J7iyZJ4/w8QoyeXnO0yYTVkH+mBq
         t4qtySEBo1LjxKY8Wnn/zQUePXs74FksUooWF4TXVxuYCLl+ZrJqTbTJ1baPPFZlD0gb
         K2XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/It2z06SlJaQ/YZKPf6zJjS8+SJCai0E11tB3sFhv+YIpjWRXcp0z/66xGUiOUCIxg3V0gz95qmit5Po+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzay8bC5dKUyZXr6Cm6TbUKckQNRwn2s4nMyZckjwPTZ1j8pb0H
	jilUUgdnxvl79gwjFwclmhGmP3YhrtAHbm8T9nTH0nIskXn7Km3rXmD+kTB5WrM3lDi8TRoOQNu
	4KrAE/2d194NElhO3xj4fDt11Y7sBIJ8mifh6pkjvy/QQXdiRse37mIt79GDE9/nZuUBN
X-Gm-Gg: AeBDievrpOrWqGI4OHRdTAHcZnvEV6wzCTwYg7sh8Wni52nbzbrnAmDBuX0YrDh/xwm
	aWqMC5+GIBAWKVNrINF4L6fnOTUJBAl5OIXfCdFqJUZav2yBUq7Ux6wh3On7uereRzRzFH7Xrlj
	xHDzLf/Yz5AWRWcG5jFzR3VE9orzqM9A+JQbkUQVX2+3uytS9VoVVtmc03nWcoaVuX/gaqlV+C8
	OqeaIdY0D9Tsh4s/4Rxjma6tcJ6WUr6tWEyJgZWAkpalp/dLD6IfcbPIQqPLtcGm9bbaPX9feG8
	05T0Yq4CcuSx3b2AKZMhQNsM1NsNPTsKQ2Qih1edw5E42PqYDF8WfrX6XJtTSFP7FFi5mpvyxH6
	eMrV2b8unXTXorIyHXp96joncrq241OL57SUdRE8E0o/U1xmvqIEF0SelfCsLvJkTIXhKFRlwx0
	234baez8QMdSseiLv8p2AzqFYWH9lpDjImOeuXxa8G62o0gftU64DI6YxB
X-Received: by 2002:ac8:5887:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-51475ca3204mr35949811cf.39.1778161669891;
        Thu, 07 May 2026 06:47:49 -0700 (PDT)
X-Received: by 2002:ac8:5887:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-51475ca3204mr35949201cf.39.1778161669248;
        Thu, 07 May 2026 06:47:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361300b58sm57853311fa.20.2026.05.07.06.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:47:48 -0700 (PDT)
Date: Thu, 7 May 2026 16:47:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
Message-ID: <lei627n4lyjxsztg4fcjji5xvjlp3ppbj2rii3uvowoqztsca7@t5jfgkx6itkj>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc9806 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=rixed9tzK2MMLKL13XAA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzOCBTYWx0ZWRfXy4uqR+iLRyLM
 Cw902Rr8ndF4zuZ1Z3B0cRehmCGCdzdED2Rttie46R0RdhakAxZ/TWzFnVR7JO2viZIAPRqxD8H
 r3BL9yDfI6JRlqt0RwtOgCFBAQHaCwiFD9Hxu+5HAzunsw3a7CR3u+/F3JqJ5OLdsu0StkAwVgz
 InbnDvGlrXbT9o4Tok35/2nxSuSqDQM/g79+UikK+ze6fMzIOo1gOftvXpRSizoMwvTqklyICmS
 s5jWhEj39tiTlh1sTx3/taUfWoo2HWJ4l6WrSjIDpQ+xyJGwlNhYEagJhvleNXtRV9cYOibucgQ
 WycQfP3dk/IeJSqIuLiYmAs+ogkCqyInsxScevrbE9VffucNi9+2eIoG4VA6/tBxbx/qePrcfTJ
 zEMuzeus81zP0TOux0LKWBenZiSgnqgtaaSduIxC1tw3MhLov3VLn7qr46gFvgmygDOlX6bUcHA
 GjyyEThgQGbcDjuqOtw==
X-Proofpoint-GUID: nUgEaWn30q_9hW5H0-K2mwbCRL49l1Cc
X-Proofpoint-ORIG-GUID: nUgEaWn30q_9hW5H0-K2mwbCRL49l1Cc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070138
X-Rspamd-Queue-Id: E47004E9A81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106411-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 01:37:18PM +0530, Mukesh Ojha wrote:
> Replace the bare `return ret` after qcom_scm_find_dload_address() with
> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index d9ee180388aa..f65b132004a5 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2762,7 +2762,8 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	scm->dev = &pdev->dev;
>  	ret = qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to find download mode address\n");

Maybe 'get' rather than 'find.

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



>  
>  	mutex_init(&scm->scm_bw_lock);
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

