Return-Path: <linux-arm-msm+bounces-88669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 337C3D16DC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC6D23019BB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCCD30FC3B;
	Tue, 13 Jan 2026 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irtCW/hu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvOr760f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3B330C62F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768286188; cv=none; b=H0Od2SPa2BrOkkuIen8mMKxmrOQuWDnFN4thiqmNjcv85w9Y+ZsKFKo4iSvJ9PTZh1iOptXLWRfYdjF5z8drUUct8k6SbDGc1qOYil8es1qU+GHikKkgWXSVKtmMUb9c4wegaOJQNJycLguwYZlLvbsf1Mb4jJRmQNn6Odb0sKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768286188; c=relaxed/simple;
	bh=bxHALflVqoB1ke0ZLKgbUhpZmhKx+Z+I3wDzBftzmbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JugZBptozJlZlKoGyOnyasTGRXP6nddhZPf7EasHNWcZ1+dBiud/2goto2JrWl4gEUW+taJHjrk3+/PTxFPOa5SVeEgAO6/pREJZxzDezL1UQYn2ckrWDjTF54jhFElMh2xz5MkRIkvXQaEL+4WHQg8e5pBufboProu1RTTxP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irtCW/hu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvOr760f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D537F42865805
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B6Onfh0ZeWVdoiG4WKvPT0Vn
	n91OfwpSgrb+ahgty5k=; b=irtCW/hu7TKE2RYyrPnV7zA8aYC+ggQ/rosFGwTc
	GItQEDVOVJxenGv5bZ0AZ46Iy43KQI577fYwqKNEq0nYCe6u3gwy/Q2U3qYPz/Pm
	ltqHglXxeYgrLLw+N00Pk8VLat+m91ZIq/AO8eoZP/tcrdgzvhnFEsk662tWPZPz
	w32ebC1MXCvSgmnJjkn05JenQHmuKvl9IT6qjTRFtUctBVfhmO16Cq5TKL1dZvAG
	OAzZPwNamYoWxEtBphezV860OU9jHzdBHb7qr1SH02O/nbcYSg9A1EV4179AcB5t
	PmRSgUVWSLN7mhtF1PpIzx19CRl6XZebOcLF0HhimiONNg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh88bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:36:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c37b8dc4fso13898072a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768286184; x=1768890984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6Onfh0ZeWVdoiG4WKvPT0Vnn91OfwpSgrb+ahgty5k=;
        b=kvOr760fUgny2xLqjw2pnp/MLXsz0+67AYtoYUmgFUDHCTjYbOmUZE3m8ThIC5nyat
         eYD4GrXcowAXF8TzCUMk60FBl8mgdWZrfTYLUaGy5iWt3LPEqYjL+id+ABWM4fNDBTaI
         jzpcSKKyuzfvJmkk8owEp8QIZH59JwU8SuIotnC9185EMXmIr0bfr5e/HYTZKvio7b2x
         ZcIFwMK08DhUrjaBgw9fhyMDBjoCN52Pgl6LJw7gERitGkMSndGQBoRhSOIEYGoUKBkw
         qYIPKN1qIljZHrgQzwrVNX6MuV8/lqYclBt8AEOH6+T8lQ0xtL0EjNnu5imzUjoxnyUu
         IC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286184; x=1768890984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B6Onfh0ZeWVdoiG4WKvPT0Vnn91OfwpSgrb+ahgty5k=;
        b=piLSGT0p7g2/0XZP2BpND5rd3qq2D2zgAVhJrTm5BlrTVBxqUJ4ORpqof+ZmbDt4fS
         8AXCM0XkKqKiTWljiY1nK99LQ/cVyWwHuAu7QBD4MMiuup6gyCpgVOcVobOi53e6/POf
         tmhJODoAgh4BQqRXIYp6hjPUj/Pa+r7HtVrGcdl//Mg+0VcgcbJETaYwsB4WUnqWD2bP
         jDn3zfEZ48kgkOmkK6LBY3P31lAe7nPlPiYjFay8P1TBn3mduMWVIWS+++R2CNURV5VH
         1WdakzTqJqUHhBtao3n23OWHHjFnkhvKnUqjCXgJUUR8HIH7Ph2gOogChqsDk0Lxt6fw
         PlbA==
X-Forwarded-Encrypted: i=1; AJvYcCXQmUhFgnZJRficMc+HUR9ordwjod7kEMQp3PDSJqiMyKL60zuT/PxIvv0N7ALWsRv8RbE5khxTRLrtIz0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxMI5Rt/uOERNm+Ja0X600B4r1TtP0vjMX/KN9TDY/e5qtqJAIn
	kROU8A/19oGlNSO0Kv5EtzWf78HflJYoH11Lwccrwy356ECefpq4ujjgRnbTe2dKFzTpEkGqWoz
	UKEQyBkGc8JbBykiBF0rQxkUu4tHHPZTGZHh6TWsMN5Rq2DdyuR4nzESFV0n5m72j50Yn
X-Gm-Gg: AY/fxX7CX6RDf/3lYylRaDJk2oKG8gDzDMLAPZFmvGG56NC9VBskexpRwBWAMHvh18u
	KIdiKuPrBstPMz3JlngM6LpfFMb5pPL4pTkCkO2rnWxvdV7vg3Tsgi2qEJXXYI48WHzzRj1QEc6
	UNzjsZPMWAp1UrtmOLP8oz4Sthk5XJY/zJ7v3DBtyMyPPEhzydTGQbob1ES1+6yFR1koJsRjDVE
	vb3pXxhz4pStwI5jMKgZIrBozkrJC3+A+EOS3o+hPqMhxfBxYl1HX6b/b7W8WIC6WiwEWPGdWed
	D7QkT1L/R6895dyo07N6K9vxFRP5gowJib6EjCe/Yqngr+zkN0oJJ57wDlrQAhW9kH1Azeu7j0M
	DVguUKo/YVvcSRGY5GIGsKxqT+g1sFk8q5aeS
X-Received: by 2002:a17:902:e552:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2a3ee4b2440mr174486065ad.50.1768286184395;
        Mon, 12 Jan 2026 22:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHItfZsPFTEbLZbowJWgLdd3ZlvBosWUoMGGxVHDC9dbDCVCbwmem8tj+6GFFBOLnBlw37b4A==
X-Received: by 2002:a17:902:e552:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2a3ee4b2440mr174485895ad.50.1768286183850;
        Mon, 12 Jan 2026 22:36:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4f1sm186646175ad.8.2026.01.12.22.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:36:23 -0800 (PST)
Date: Tue, 13 Jan 2026 12:06:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com>
References: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113023839.4037104-1-xjdeng@buaa.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MyBTYWx0ZWRfX9DOyHukiX/dI
 mMrgppemMeNLVskxpXbWA+K8dXQ35m4q0uct7QbNnEdnlW3XuLc0sBp4munrMsjlWj7OtOYIzRC
 X2wJa7KoIXmb2Wr6DWUzL6YaVsWIB2JdWbiAmd4oYYEbarNJ03x7hm4nNEbKNHvpB5tOtMbD+1M
 8oJjSomV9ziNYLCHavEbZQh45uY+MH1+be6NBR4bRxkdGhBU2+u0X4Sle+C5a9oZjC5ysKUh37P
 Zfv10v9ZIUkyTdPGYbST3MzLzyjUJ1jJBObgaz70whEEbm3v8KZedbpWWQzbxv13F7xWW5atxBg
 Pb649r8V0LvsRnomn5lBw0tiZI2KmgzBL49qnrGkZrGbs5j53vvTg63QJ7AwAyuL70x8KSUcFEw
 yvNRQsXL8IT4TcDoFGetZTIEQ8QHNcYy/qx8Zu1BKzmjtlxciHtXX1vZmQnmvF3LdoJUd57peOQ
 pgL5Lfn7IzLYr730N7w==
X-Proofpoint-GUID: SJCUlBc3PQCKfATmLrAGWRcrmsU2_Db3
X-Proofpoint-ORIG-GUID: SJCUlBc3PQCKfATmLrAGWRcrmsU2_Db3
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=6965e7e9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=CfPS7sswJGtPsZrNj_8A:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130053

On Tue, Jan 13, 2026 at 10:38:39AM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not
> checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

I don't see the lkml mailing list as part of this patch.. please use
./scripts/get_maintainer.pl to collect all the necessary mailing list
and maintainers to be cc'd.

> 
> v2 changes:
> Add Fixes: and Cc: stable@vger.kernel.org.

Changelog should go below ---. Also include the link to the v1 in it.

> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index fb3b54e05928..cbb12db110b3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		if (!err) {
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> +			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);
> +			if (err) {
> +				dev_err(rdev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> +					res.start, resource_size(&res), err);
> +				goto err_free_data;
> +			}
>  		}
>  
>  	}
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha

