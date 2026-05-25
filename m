Return-Path: <linux-arm-msm+bounces-109599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJmIIJATFGoJJgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:17:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BBC5C86BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E1D30038ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712043E4C62;
	Mon, 25 May 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abKkV7H6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3q/Z3Pn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5C3E4C8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700621; cv=none; b=JSI+6pIIHayQ40dXcIcmJyQaT7tO8fkDH18ZDonOKGLUzL4TH++z1Jxi7Zstk3Hq5HOZ7j4JJJEaQtsAfvIxw4TI1S7ahfBm7gUnTxWE+WgxkzBdxv0I8583jqIoIjANiqqopc0nTPdg8iPg9lFWD1cGBg/ZHzhxdVUZOqo7Sj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700621; c=relaxed/simple;
	bh=8N2JlwzEHCxeFdlT9HQn3NVINPN6Khp+Tt8o32X9Eqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opHw4cxjl4a01mCm5taZnOW1eSED6exggcyYRDwMi9iDQqkQ72Rt8jB9fkjveiWYFjV55U+EBnrLmHZ5Bam1e+/oVJCn+BnkDoU/HPvQZVLFp/nU5X7+4lxAedsfedzqRrY3c4LQ8MfTL+QiqQ97qnryOqtT0nG+HMKOUpRnaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abKkV7H6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3q/Z3Pn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7Y5f51630363
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=swGUlrLa5WZl6kGap/pSw0CO
	t52HIv57pADbESN3Ydk=; b=abKkV7H6Fz+QC0xMZhrJJ3CP1pIr//RzFsO5yml9
	wn+H2SLGXR/iMHmZCdzwzzIdSKjtMOM+Mfn7cQSJzvCMlZ3+lF6k/CD/ZjRRxYwu
	M4RftU4PKNSGZA+zYr+BQgcL22+ey9VtYXKencBfHWbBLVeKU0dhoNLQt2AiuHwX
	x6UdgE55kmPJOUVb++VP7vzkvZY8vQkqgp+SiCoxRuvFAcdpP6all8SALn0kpy4D
	qdpBWCuOOMRTDW1ek8lyLMBXL8Bpt6PEW5qLK2CKaONdStPjSWBFWzgctCRs9jHX
	P/2q8TT/vHAefgdCdhz4SHfJ7zpSEOa9873S086jTcyA1w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5enn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:16:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6312af106fcso17388637137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779700617; x=1780305417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swGUlrLa5WZl6kGap/pSw0COt52HIv57pADbESN3Ydk=;
        b=R3q/Z3PnYUpKRfOPpT3qQitRqowTjwym5npN+1W1W9+hXqeOnKh/n94dZgq/bsR6C7
         6ELwbMWxRsaAp02YNCXCXp6frZBy0rSmoEtA/Z05STKtZNsWpViB7dYeOCHIpjKme3eh
         hxSCfj9NbfBDD7XNRwQ+G+/faxu3uQRI5gFlnK7kGPH7TuHWaaqiA7hFcqluZaWMNRO/
         NLmeWuTK6pOR3064HM2d7MvYK7O119Pg6U7UkniXFNlOpWwR00GTxgkL+t0oLUcnF59t
         mMrDtm6tY/2kciiZ3oX+g5HBl1RDIQllz3x1QDbDksW5UA1DPpJBfYikzFC3e4HKDPPM
         3BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779700617; x=1780305417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swGUlrLa5WZl6kGap/pSw0COt52HIv57pADbESN3Ydk=;
        b=kISIJykegAWSZB0Hc5Gcv6ku8D8AKH6DrqinNB+fMdkuAURSO2ui0U7l/ui/u7MTWN
         QLaCPTRWq9C0J5OkSMD2hi1kqYnX+goDxAij2152PNmC2YiyLgftLGktbk6Ot0KEqMNb
         Qgf2QVRvfJ96H3KDl+zERj8H+noyhm/VYo5PKxPuh+401rGr6ALvLidKFfwLj7FovSBQ
         7VBxTI2Z/ESopIBetIdeT7iIBUEejO5p1EN4uiB950JHs7AVisSJMNqKPkeHBWvXErzK
         MOHnQJ8LP9jGv6CA4Rwp4jU6HIr9A+yTrYO0LnxDylJjrHMvwY61MK8XQFtOSrsBJ5tM
         HOsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dBqnQI+rS//1w0ma6PA3W1aYVDpMgAD1QvfnEhfwQRQ/z/HteUZpekxEy8OxDqXZHGDFrJNwBcD5RTkyo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6IssW+UG7PDzqAL5dt2+oQkLATSQC7UOW1sOG+4pB0jmBTV9k
	VAmYey7vi1xXOxkzA2L2ieAPAFvq1+DAvJD6SM4Oh0mwmglqo30gFzs98yE8Im8if5Ke1f0XpCL
	PTWleLV+yp/P3ON06051h1himIg2JlWpTMm/qHchOo0Pm1Yca6ba53bnfb1kpcxNGpfOi
X-Gm-Gg: Acq92OGtRz1DI46huz7FvikBXJ7iCvSSpHEl4njcPvOqT4sPFYTO//CR4zT9hNRS8/h
	PAZZLRD2Glz8mhxpwi0cta3dmMfAn7ah/pc3+dyMMcB/kKx4wtCoPDnexKvjBS+3bLLuL69EESL
	+on7Op0T0FnuYE4ZcTS/R3jv/hrYquh332WFFUbygCDTM/wg/E3y8uLhVCaIJunqnWHfpV4nrL8
	YK83ESR4oA5GTAn2lP+3kWHkkORU7oacmKSAIG5u7BWmCUkRUdUX8+Hcf6LOmAfCQXdAwuDvD0/
	Qb/t0PeivhapzmHA7gIZ057edq4epNeRnx/AyyCLvCzKEntaxkedYt+PD5Ct/M6zq9C+x2b434u
	QVUYFJqr00mraOHpFWHN/1mlWOroKzen6DqgjBf9z12okTrgDAuDs/VUz0iXeQrm6L6wYDjlL80
	KjZ0n4NE/1BK3mW9L50bnqF/A2c2AafC9DgmU=
X-Received: by 2002:a05:6102:3585:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-67c8cba579fmr6903436137.29.1779700616864;
        Mon, 25 May 2026 02:16:56 -0700 (PDT)
X-Received: by 2002:a05:6102:3585:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-67c8cba579fmr6903427137.29.1779700616494;
        Mon, 25 May 2026 02:16:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb153sm2526918e87.39.2026.05.25.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:16:55 -0700 (PDT)
Date: Mon, 25 May 2026 12:16:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: fix channel ctx ref leak when session
 alloc fails
Message-ID: <jubkqaefflafx5bfa43ky64y4zwbpmhwrsayh32fyendoplfaz@ih6h6nohp3wb>
References: <20260525085340.2734738-1-anandu.e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525085340.2734738-1-anandu.e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a141389 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MvwZFT3bVuec0MXgCpgA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NCBTYWx0ZWRfX6djd7BqTNVMa
 p9zRlLW1QN/xZAE7BEymtnJq27OlsbBItR1MxVUM9i5BIDrAr+NEP9t8JMs+yZDV3RtC3ICz06u
 fOKttw7hi4X/XlWIt53+qQnl+pNvCB0NzG+/9/mj5l0uOeiiCi8OTdSiJODHiYFjsx/wsSqHZ/N
 yonChvlrkd53+DEDHUZ4lm1BoRCO4e4cPtQMWNTxTnqfc5lKY2Qr7op4Islg3GskMvpsjsD/lnN
 e/xFae98kUjM3XNGxZO9mpgMVWA/GflSTQPrCpaYlkme7xd8ryYMe9fz2KzPLdb8LeNOaz5OTWI
 qWuSRZmw8bUHGkCuiM+YEKjEGfMsQFItwoloy+WCop4qGZibA1UHG1ql71oB3qtvG9QcUHRvEWg
 GHvcyuKELKUOsaEY3Ofx+M2Ui2XClNNft6vjnSSo30UktMsdvKoUwdFfHrYADAe57fljvmwlxzT
 mf+z4oxtPde3rnT6hKw==
X-Proofpoint-ORIG-GUID: ERhzeBxHE75gtipS8u6O417t4JU9dtWT
X-Proofpoint-GUID: ERhzeBxHE75gtipS8u6O417t4JU9dtWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250094
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109599-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7BBC5C86BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 02:23:40PM +0530, Anandu Krishnan E wrote:
> fastrpc_channel_ctx_get() is called in fastrpc_device_open() before
> fastrpc_session_alloc(). If session alloc fails, the error path
> returns -EBUSY without calling fastrpc_channel_ctx_put(), leaking
> the reference. Fix by adding the missing put.
> 
> Fixes: 278d56f970ae ("misc: fastrpc: Reference count channel context")
> Cc: stable@kernel.org
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

