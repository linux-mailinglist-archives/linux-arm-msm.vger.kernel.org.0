Return-Path: <linux-arm-msm+bounces-101726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PNvKisd0GnN3QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:03:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9939808E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176CB30A8C28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C681D3D6CBE;
	Fri,  3 Apr 2026 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5sgsR+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkMn6QvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EDB3D649B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246410; cv=none; b=HIiD2EQUY73hbC2ENna0RoYJFOqqY4gyoRre6+YdkrSOoEzmB23U5xFzrA1nB3iwayKafCABjZsCyUI1B3qxEWHYnja0i0WucyQomlTcR/5cKqT4A6ZPFojLeRXI2yMmNpIyewTKIU3NMwRX1LK1MctI+FpnnE+poVwf8e/AWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246410; c=relaxed/simple;
	bh=sG+5QOeVSCKezV0m3ouTyeQAdPMO5wGz9Q21s1LFass=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFh8vqx8QnoGW/f2+/0ZTi7xl85kP5DkuWb3i/0vr636h8VQ/mxxmUjyjyq5YsjHDWXQc/yrdqF+zd+xmbJQC0Pyu/IoviqRxAgLcw4pUSC/nDaqBeG8IcFIx7G6ZviR8xDYGt5hTQ6d6/xTsO4fB7hdlxcVhm2ikFyEjab4SFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5sgsR+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QkMn6QvZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fanat2707989
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h3e1HySFPcFsy/9IzoZDxyD9
	SAP0usqz7ly0+vlzsYc=; b=f5sgsR+3xe47ELotQ3DKbnaqVnbz6kBEnl68T/DI
	22okcOBQOxoqGxIOu4rQNmOlWzIAC2b9piqQsQImufoHzs1VvWgOXh3axRVnJR0H
	QOW+NEcwypOceEZ0gbt3PReQIfbsaGgGPTxHDoh7CeSnNMjPM8kBRALgoj0bYUM2
	N65HhyVjb0h63eEBQqLD6rlKg/hlpC6vZ8QQRLgNDhh6c0/+awbQwFPqBU509AJ3
	aMNaAGgkZi+Zvq3pLi25isrq8KS0EWryueXMj/76z5y+mo1Ntj6VxePC0BKa0+Li
	Kz3HD++BiSf5cbE2Ao1SACW/pr7blC/r9s6S0BddfJ2i4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjkkyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:00:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b6f869676so51124241cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246405; x=1775851205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3e1HySFPcFsy/9IzoZDxyD9SAP0usqz7ly0+vlzsYc=;
        b=QkMn6QvZ+wycR9V4uNKCYTIHCKjxmD5bny8pUqw3G8Fyrx6vBcFAsMIcjtrEucjO+/
         vYr4Wad9Xk/3bwn5GwHnVh/CISkd6+tU2+CkvDPKEWqAknhYq4hU0P5i3ZRf3lLHizXj
         aZwLsdoICWNNbkFTSgCnSwxZ8BnNHp8vRAzyuN3aZ3NLmpQeNiY9fzKoENmB/VE7WVW5
         8EDhuv5JxF6vl/0OR2CukY9+n6kEN7coxlZHBA68zgwlC51mJfFU32QKssz4RxewxaHz
         +U1tfW9097TEbeL7kuJEsxaNSRIP+EuEiiHxUKyiUkJeH3UdXEBx6phYAxCXmt7QQ3e9
         dRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246405; x=1775851205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3e1HySFPcFsy/9IzoZDxyD9SAP0usqz7ly0+vlzsYc=;
        b=VeUR68XTFVhmGQ4aYxQvtAsLas4t+us6DnRxaKkeOJXqnHaHkjGvlJhfDp2P6P6O63
         DlcY8VSMMzYMZDJBgxug0y1+QD79E87zDzSdG/liHGF3dF00GZtQOpJaZxTu6218QaK/
         5ePV/klIS1S4YfvlPqjqSp1lb0Em+CeG/W1zUcxPsxiI5QOsn/V78uzZgA78jQ+LygwV
         cu7ZuRx6X86UvhbMgUJwap0xGQS7Ee700cE+LnBq4zICYmV2UZuqGYZDhK01oVgI8GOU
         a0FqW0WOq1FCTAnmLpZmVYGjpPwAsfEUoiQMix2tpHYSAzL4FKd5I4KSwnBqu07+gQfI
         cRFw==
X-Forwarded-Encrypted: i=1; AJvYcCWcJdV2uGQO9pJU7LHGcHpTi+B2VHUF8UtyoY68kxx2o3BQg4piDzlkr4aWZTZj61WtHcbgTF2AqAHK2NvI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5kQPiM6aAvxUCaTWnElLOWj7FPbtl/06U/kzmBW4b8Sv0uS/d
	vxX8L2LnPxeWYH8GEfJVKzKL6eZHbWLwclSbVE8DzcGFOvCwknFrBBVaMT0o65QU3YM91jKBPIA
	9lhp9HROYkmxFMEx+Fq1mHb9onXx1//sPQY9G49nIyPcJtQ/Cw/f2QTFG32wmqz2OL2T7rCAuxp
	fo
X-Gm-Gg: ATEYQzyiM31doJBzcpGMA0rD6Ih0ONasLmzyQfVIB6jQI0L8xvjx8/dwnj/G/fYQekX
	BmY7+xgjax2xqwC2/tgYaGGcjpaFYzpI7Hi7vMX+wRjp1nrDobaQpUPcQrPKO++VnkFHyhiqL7t
	dcYRYdwHO1FcDCExaRlkDBnE5YciQ6yJ+UBuKfsqiOroFLuS6ZzjaUDYa2hiKWyAEoXAnRwEQZY
	kSc3vPFzVjd+40/uuzhdAoMZxxXJbwsDrcWFOS/GxG3NtgEwrdnaEE/W2ofGavYzfbUfQP+f0aA
	NAEuAOMAIMjWZ2gUvCEZbx+BTPqxRJE3bpon0JtJ3Hmpk1ksGsD3HyqtoxVO9GB00/3tVZFm6G8
	dptvB1zDjrHafrI9dlKgGqHVBRsuutFvz4gVWv1hfXDGR+3bmrJiw97voaL7EPDm7G5fkAcTxuS
	v/BFTM1e+nMeg4Ssn13d+nLHZQb1QLFpEiAxo=
X-Received: by 2002:a05:622a:5810:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50d62750dbbmr67576571cf.15.1775246405285;
        Fri, 03 Apr 2026 13:00:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-50d62750dbbmr67576161cf.15.1775246404812;
        Fri, 03 Apr 2026 13:00:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951a6sm1627294e87.10.2026.04.03.13.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:00:03 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:00:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: host: sdhci-msm: Fix the wrapped key handling
Message-ID: <x2mmttyg5t5qjo2tyrwqbynqylqqlulu7fhoyxl7vd54geubqx@qna6vzzr765y>
References: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
X-Proofpoint-GUID: 3fFb2XQgRmwToydoXe7Oc_WL7KKyVoLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfX/3ZU1YUaVVSu
 oECYIgZ9O7qjJ9cgTi3Rvyv8jrTVhCIKmQOzJHovmGOg43fVl41ilhHnPOW5WjhbstVNQEHMEaM
 bsK6IWdzZZIyhaL2HpxoV2WJQ8VmApVcbEGQQyqDxicbaKWZG5BigdEn0CMVvTYly8EM63uOLtD
 Rp2lzokUlOyW5r/P6yGD45/t2nc5+w1L+kLrIqdEDWnneWmxXxf6hr/OtNtwAYa/00oAoGr+1Hc
 MldOEhYu30O9PZpEg9smEkVnxawrCzTXySRx1/q0tQrpAKo+f6+lzBM7q0upr4zq81W28+0Ydci
 yK+u3QmySFyIG5uAVddB4tXo5ysCIY3TvqFnZAHPb/GWz0kv7hG681UH0Nj+40Tx1q/9wpQw5ml
 vzvsFszmVSUTgqYdjpUCpW2srXhUm5Nllw/DD9t/N+Y3w0TziRaJgnw3Gk/bgtNxCrUleM7GtvW
 vOf+p+kjC4FP+BQOqaw==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69d01c46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PJDidmACEVZXn-zVn4kA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3fFb2XQgRmwToydoXe7Oc_WL7KKyVoLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101726-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EB9939808E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:29:49PM +0530, Neeraj Soni wrote:
> This change was originally intended to land with the patch series:
> "mmc: host: sdhci-msm: Add support for wrapped keys". The fix was present
> till v4 but was accidentally dropped in v5 while rebasing.

Don't describe what is being changed or what was intended. Please
describe, why you are performing the change. I.e. what is broken.

Also, likely you missed the Fixes tag.

> 
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> ---
> The patch serirs "mmc: host: sdhci-msm: Add support for wrapped keys"
> was originally discussed here: https://lore.kernel.org/all/CAPDyKFqRG1_1aYavfrA0Ss85B0kcTnjVBeqLgq8PUJUcSx5LUg@mail.gmail.com/
> ---
>  drivers/mmc/host/sdhci-msm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index da356627d9de..df0a038269d4 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1926,11 +1926,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>  	if (IS_ERR_OR_NULL(ice))
>  		return PTR_ERR_OR_ZERO(ice);
>  
> -	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
> -		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
> -		return 0;
> -	}
> -
>  	msm_host->ice = ice;
>  
>  	/* Initialize the blk_crypto_profile */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

