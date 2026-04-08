Return-Path: <linux-arm-msm+bounces-102378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +mAMFwDs1mkeJwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 02:00:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63C3C4DD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 01:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FEA93019F3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 23:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85624387348;
	Wed,  8 Apr 2026 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZg4ZS65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hejot2JF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3C37C0FA
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 23:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775692797; cv=none; b=p2oSed4bsYdvwQ3RbmB2xpy0roInz3p1jFnSCszwEfAbjOGNGK0Q1PFauJ0fxnXoITVhQdcZwEQf77W1yHm/eAw800Q0hnByIpthEkORw60bL/YmuZeeJOm/t5eQsagFBz0t2En9vs1d6E083lzs1SEq+A9mKE/GThyxALldRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775692797; c=relaxed/simple;
	bh=EAKAg5hD3Vv7ZWzxBMtSmifevzxSKLOq6V7r8WAHoTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr/w+i6XMv5zGoItAHICUXECsUNl5LCbFVzYeZNR54lRpOdUshHajhDVnoLZ/pADkXVxn8Ab9J1yx4buLezIWX5QWHzJgR52rbL8qVyPc5H/R+Gf1/VjEqbnmEWqiYy/wl7hclkOotQaDcxa2oUXP5Mb6h25bxErNnPO5MHzGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZg4ZS65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hejot2JF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638KwMTL4107662
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 23:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ly5ShbBbsn8Morpo/AAHgSWK
	s29jkJCIb6xE3+Qy6j0=; b=KZg4ZS65ARTWeOYXOLUtTYgWRGb1zOiEWup0h965
	9P8UQlz6PccqrxRmruM/f16DGnRICh8Apkle+2fwr3dXNmrQnGW70m6aGNEMQuIF
	QN7b8s6moOHKeWKDPhVxuzHqiCqUhAVM1+lVwzQv2Iu9g45aSieVruTOMUP87N6p
	uH2I9kntKtsw0SFWXNkN78dI7UoTlpkEuqgos4wvLe3E4QjdjAcAIDTP1EpdPFlj
	gnuqTB3Dkomvsi92QqebxOeuqMi79B3Lw+j+SxvSDdb3rUKiXtVl+hiv7a2milqI
	OZb5pM7ogpsHofcyoG5YO3NX/C15ARlz7KwIXQVnvSviUA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhagfq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 23:59:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso14000411cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 16:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775692794; x=1776297594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ly5ShbBbsn8Morpo/AAHgSWKs29jkJCIb6xE3+Qy6j0=;
        b=Hejot2JFp8/TUozO+pzTxy1CHaqfXawPmFVZuWZitNCjbuy6fzQ90VfSfldPYTu+l6
         jb/S1d9ZTN/XQlX0toNNGvA1/Pomh2G2o+ou+oCQou5uOs1tvSjapOf/QCYBtJmqHXPU
         nqzIguvnGKeG4fkbDyE3GIHE3MDPLNuv7joIEp6dJiLWzC8z7gd9oRYJBW4o9iSWmbbq
         iLsTJhkiJVDipJVf9V06AtGxDvCeBjGWR0lTuHsIfaMG8+TcZcoyMQ9xVHRDIq3N+jUr
         USCzgRHJNzbMNuUATkXN/OlEEFJU6BWFSW6gJSwL2G6W0Gm3YOeTinjusF3/LpE82tFi
         1KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775692794; x=1776297594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ly5ShbBbsn8Morpo/AAHgSWKs29jkJCIb6xE3+Qy6j0=;
        b=PhZyUtWb7lJLV+ngSDafzGyLrqapx4n/PfTH5wN/mlpccUFAiWJHdMtPRCLN02dSK9
         Fg3+J9XfuUNzjIPmxaCk8Qzt7nYfXUV+OiCrNiZ6s6kstgh9PWih5sDVjLX6t/310h+f
         tdPvRn6uV9NhaR91Fdp9RiDV7Dm+1Yq2CXIZSez4pT3Kn6GLjqoiSP9PRQ8NUYd1Ou2J
         utoegIsU2wyyq7cGh7mhWyMbfbd4Y2VqjE7MPt1j9q34+eiMmXDcBCsPH44d2R0WIE7b
         i4K811p9jg+t3a2pMW8kDL2seMJjcgOgcOyONKcWY9LNXHMlhDup7FGomp8ECIP9paCO
         c3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXRjju4H7XuAHP6HTtwJxwxAVzKn3ZUUrGeoVsod1fRKnRnottaBG3JH+OGqGAr0nTBf8aCQ1yUkQjQAMGd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PtH7ETwFWdZFvstdghRy/hkNhYdbZgb0aHI4xZCthrNunzy4
	2+WOR7kc/1HRAM0SQx7h/JO+7ywKGzyGRiu57L6JenNxoEnKn+H3M8l92X17p1D/LbcDNBnDiSn
	4K+M8hRuGQKJW0foNMtHbbROoUuq7XurVeiiZFUPgwl1kyc9L7mK44pojWBAE8XfC6cml
X-Gm-Gg: AeBDietHxCP+SihLBhTLxBFgYgZP5FRQW5oxEaxDsTEuassqF6ldT3gVMW05C9TITfs
	4OFV+ZLWMafTR0aieyUc28B2gXqe2HfwhzKCyPTO84mWyTgK5G+RDlGGDS3QpmAxK6kAvzv8W+r
	lDDRg9ituRBwym5yYcT+8Uioe5Qk9uLBvTy326kRDKUgRAwQUJ3SxSNcFAjp8jg2+R400UuFiP8
	fpmGwd+iR3t7Sk+AOU1USwS4twBgvu7LVlnlTb+b9E7HDs5WlWISnOWQNvnHe9iW9GPuR5iu4Nq
	rILOnGr+MY7JAfJfySqHmBTboLmdGSV9WnAbR/dIlytmcjNyNfowU0nRP6bc9XihVr3+UaxTAJJ
	vi1bTJyzSdzgKoVVly7EmFcEKXIugGuJQYDW0EcFnSNG/0iyiOB2iBvfo4PxXgRoohVxMfiWPZl
	t6Uw49mT7mTupVqZL36PAjxxkA+MHWZ8b7jJA=
X-Received: by 2002:a05:622a:13d1:b0:50d:8727:b1da with SMTP id d75a77b69052e-50dc2221113mr22465531cf.39.1775692793885;
        Wed, 08 Apr 2026 16:59:53 -0700 (PDT)
X-Received: by 2002:a05:622a:13d1:b0:50d:8727:b1da with SMTP id d75a77b69052e-50dc2221113mr22465141cf.39.1775692793353;
        Wed, 08 Apr 2026 16:59:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9c3b6sm4987647e87.19.2026.04.08.16.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 16:59:51 -0700 (PDT)
Date: Thu, 9 Apr 2026 02:59:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Message-ID: <753kndrdrq6j67c3l7uvwrsj2ino7vb2chmvfwzmppo42kcd4h@x5wcdhdpzje2>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
X-Proofpoint-ORIG-GUID: eTt7Z6DEr-Nn-5p0umVG6-fP14xNfaCa
X-Proofpoint-GUID: eTt7Z6DEr-Nn-5p0umVG6-fP14xNfaCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDIyMiBTYWx0ZWRfX09V7JaSNGXMV
 7py6KDmfvxd73ib/8T1MaTGXFFonHK5xyjnzZDYKFVrgsbMtpmqpSvycYnNDPScFcnBHJ0d2eGN
 n6nkPvmPa4Bki78tpOnaIwaPJ9Sv7GAFKwd0itybMuvewFgt0YugV4ud78mOCPBBQAiCloClL6i
 G1/EVQ67esqHrcM4kIBQFH0p2zQUtlTPrpFVDNUagvV0YxfGopZSZegsPyWDorbCgyTj8bVEwux
 TrDZMSmk/LwRxws1EC0K1mV5JPPtPWUoWUr2WUDuJYHNf5hcmacpdzBb5fc0h1sX2+A5jGDooVG
 RkTWfoeg4EarElUeunZ98NvVLgqLyglqAZS1m/ha5egxvymchYPqCBNzH+bErwyARvxSeS+RkT/
 WcUMXnyi7J359DTHz1ecAxHKA+rOadFF2eW4U8XalzSNFw8uxKaWflMyt+4B4IauZVxroUXjYop
 RMXcPV/1CZ4gKjhPG0g==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d6ebfa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=dUrpdcx2ztF4zUj74WUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_06,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080222
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102378-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E63C3C4DD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:43:54PM +0200, Neil Armstrong wrote:
> The P010 (YUV format with 16-bits per pixel with interleaved UV)

10-bit, but with 16-bit alignment

> and QC10C (P010 compressed mode similar to QC08C) requires specific
> buffer calculations to allocate the right buffer size for DPB frames
> and frames consumed by userspace.
> 
> Similar to 8bit, the 10bit DPB frames uses QC10C format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 81 +++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)

> @@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
>  }
>  
> +/*
> + * QC10C:
> + * Compressed Macro-tile format for TP10.

UBWC-compressed format

> + */

-- 
With best wishes
Dmitry

