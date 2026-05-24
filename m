Return-Path: <linux-arm-msm+bounces-109506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGkuGHsoE2oY8gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:34:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 579465C3250
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 18:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 174793001196
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 16:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D8F3A7F67;
	Sun, 24 May 2026 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evqtIquE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGgoV/aS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D93281532
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640437; cv=none; b=mZ+hODsAtubqNA5n/3baj2Tc7fsc6MajU9sSjdXRf6DZCGYVXDZ9gpV51y7UDv54cYnguo7g961WwlC9pl2FAnFEi9cKbrJT/EqV4aHV1QlCkBmrJuUBwsRVkS2NT+lXhMeSCGtaNnstpJkuIUt9Zjz75cgpLClWUZ0AnJ5E/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640437; c=relaxed/simple;
	bh=NxoTYHofa6gKV2PIwxhjNn1qlSn+vhIA3HWh0oWKIaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJev5Pc5rmmo1a79HI9vYKitjbyNRZe2ABTNdDEMa1quPQnKB/tGGITYB4MZw7HdKbz1elbweBC94zhD+dw7F2risa54QXbKG7B0GCkk1X9P+zko59lRx/yh+RrwS/7yskq3Ug64c909GzA6dB0H97IF9+UPyo0LcQyLdNaa034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evqtIquE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGgoV/aS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O2H2v42115605
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wrvxcU9Tac+9ZjUKvUObJ9ge
	mc2+OvvMLP3GIcBqox4=; b=evqtIquEr/Hg/mYsDx529pGt2wI7r0m24QPkWfhI
	F8gUg/8dSATAr9EOVpQFz77jNgS6Zh5BI+oHArZw/ClXpXYVEcSl6Ho7N0F9gpG2
	+ox849XVXs3NxRHwHDxr6MEsaNtmdqy08tV/1ytED6kNCghFy0cLWBZC/tQx9ipa
	NeLYTxNYE+0YbRDPrAWiHBRTady5YBwj4RbLZw30E8VfNQrAMOcwWzD9SgalayQ9
	wDlBxmvlk5++EIJ7XOOoEzOPVDft609uNiSvxWuc6uNk10lVul5ub+bT29A5higc
	/IAArS1wOl/KGHpEDdMHIhMSNyGj1HmHtB2om5Muohic2w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386krm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 16:33:55 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so15050629241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640434; x=1780245234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wrvxcU9Tac+9ZjUKvUObJ9gemc2+OvvMLP3GIcBqox4=;
        b=fGgoV/aSJbxjfm3ysTq+3XXUrMDJdiXF75nv0Tn8F5KR3IXbLjC+geKA6SvV6FRiYv
         zC8C/3FlS1zHl2L6X81zfg3aYvb6sC3lONJoiglwn3sn8ynFfos2wt3qPVNzXc3gJnFA
         EkCODyLwvNi8K6qFExGYk9IfvDyoWy4l8lGr3T6FGwwjiVHZrjF0cxQR/HGo2SYrZspw
         8Gll9j6ZHjkYvBPynGF5Q+jIOQp7nn35cwHkFIB+qhs8BLGGDyHD188wssKBlcwF1dbf
         s737tX8WfTtfg5g6dOnt0lfv6tEzR5ScKkH2zIyR4MNzm7H+1BXUw/ca73ZDgXrLr06k
         PaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640434; x=1780245234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrvxcU9Tac+9ZjUKvUObJ9gemc2+OvvMLP3GIcBqox4=;
        b=j0/ugLfNfZvFr9XaiEWycTQRgpFL+DB1J5pXPqvNSCX0CLUvB/rFXweiUVgy2frTho
         SFEzjo6zHrvcmo300kCtFbJRR4nvUmZ9N3NSaooVnOh/kPMVom3mNytcvUCa/u4Zm7lz
         7RCpfpFXmp0EGIyOXaUFPOJ5U9BgTSnK720ISutO9Z9aDzgz3uvlLg9x3Q/UCipyXKAn
         oku4jsgk2gnOnoLRDPXPZCVa5etYZq7P6fvE4FvGAZkCGfsnugmHnbHwvsQz1QNep4SW
         kRzXgzXNc/iHhn3RXd91+z544wlLYSuOFD0RNryXx2ASGgyIzWIfRGPWeZDsq91sVKkS
         Mv9A==
X-Gm-Message-State: AOJu0Yy/hcrZmHQT9uZbGz7PxJsHm/rX+PXIMlb4YAcisAc7E/3zl6jN
	XsnC7DAUbpfV1Dl1zmj7eDIP0HKtkmQ0tBpp/a17gnJLLjWaFm8TzGNhoPbb001frzxDZ1Hxb2F
	Bz/aUl65Q1tBL+FtWeNAy8UFlvaIko/jVredpbvjWiU2Ix5QX7ndX1pPqy+KzU73hPcXgXFL0CE
	7B
X-Gm-Gg: Acq92OEHK6Z/qr5D6azN3dIjZrSkwoIKaWgdgL16PCroBRVhEEYOANYLZzOPtvgG2Ig
	NhwpdIbvHXrIbggmt/oSaBIDqqtG6IUl27h/N92GAvkkI2BmSc3NuKSCdpRdHwkRNa7ddQfWXHc
	AL05rpjflSdm9SsF5wIjmvQhCtVo0xlOCi6bJP7A3/zSbkW4uBUMiawrzKA3vK75JAJjLZ6JvJX
	K3Fr0eEVm0ZQi3gXtlGibwM89yY5NH3/hAF4l0M9IDP8lzdTFM6LGchmNlJ3e5MFLt76hZ/O2bz
	2BdlfoSTj+0yM2a18lVQvVXVWb7t4f5QjLLqEqwqgmlv6jyb6m4Z0IhelnJXhSAn8+8emGLHx53
	Z0aGeWMKJxwKw4pXJNeUiaFvy8QUTtv6TqH2ImXbE1G88gXhVhuNCYE/WyEwGQBGV9OsVyiutfs
	K63n+iR585xmuHPfs+7D3NAeZck6nL7IYLTls=
X-Received: by 2002:a05:6102:3e22:b0:631:ab8b:c348 with SMTP id ada2fe7eead31-67c803c8b93mr5581652137.8.1779640434548;
        Sun, 24 May 2026 09:33:54 -0700 (PDT)
X-Received: by 2002:a05:6102:3e22:b0:631:ab8b:c348 with SMTP id ada2fe7eead31-67c803c8b93mr5581642137.8.1779640434160;
        Sun, 24 May 2026 09:33:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb258sm2040482e87.48.2026.05.24.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:33:52 -0700 (PDT)
Date: Sun, 24 May 2026 19:33:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Graham O'Connor <graham.oconnor@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] firmware: qcom: scm: Allow EFI variable access on
 Radxa Dragon Q6A
Message-ID: <65pjothj3tjvfmpjemktdinmeouxnuodkhjx3s53it2spmldwz@l2jhbuxeutyk>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-3-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522060645.4399-3-graham.oconnor@gmail.com>
X-Proofpoint-ORIG-GUID: MNsZPPn-tXfaH2UfnUBrVdGRKq1lRP4v
X-Proofpoint-GUID: MNsZPPn-tXfaH2UfnUBrVdGRKq1lRP4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2NyBTYWx0ZWRfX2nG10mzX1+Id
 01M4zHt6+wnR+T/5fk8viFh8iwDGz43TSJ0zTIpYBQmOY8eq0WVzV29+9PJi4QHBSsVjbPr7ZtP
 OOwLDeyGo6Jf10pLIEtNWnRUCMQn3q4u0+PbxP2feBk2byp6+wUlekLtjRMQ8CE7Xq8gaOL50s5
 SE2Dbe3MIs7oLhFBIXkNjm1cfqZEhiKy3Cxy2Cm2btiyLxtMUY9CsptYWvwsHFhzSeFdq5XsXor
 b3xqHannV2HvqHeOlvFznJR5vQyvwDjOqGCpUzhpPjYRuDaulleZFXenWwCfZrvp4qYrVjQxxvz
 o2IvTPDNjd4z4zjfBHrCHHTro+MIRvRmTsMeSt3xdNcXcaW+azOJfGKd1N/ngA94e4EkoXNit2m
 9MRqZiwMAwAyokTTtA+EqYY1j5BB7n18IQ/Kg2ZbXX0+p6kKv4nYDgV4VxrUbMDaF3uGccSDh/8
 Yj1L7It5/6fdjWuvO1w==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a132873 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=tsHZmUjQ-Mj4z8azS1oA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240167
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109506-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 579465C3250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 06:06:41PM +1200, Graham O'Connor wrote:
> Add the Radxa Dragon Q6A compatible string to the SCM allowlist to
> enable EFI variable access on this platform. Without this entry,
> the SCM driver refuses to service EFI variable requests, preventing
> the system from reading and writing UEFI variables.

Which medium is used by Q6A to store UEFI vars?

> 
> Tested on Radxa Dragon Q6A (QCS6490)
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 6b601a4b8..4702ad898 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2320,6 +2320,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "qcom,x1e80100-crd" },
>  	{ .compatible = "qcom,x1e80100-qcp" },
>  	{ .compatible = "qcom,x1p42100-crd" },
> +	{ .compatible = "radxa,dragon-q6a" },
>  	{ }
>  };
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

