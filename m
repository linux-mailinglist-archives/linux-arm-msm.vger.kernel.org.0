Return-Path: <linux-arm-msm+bounces-74548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26406B97C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 00:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3F1E4A3778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 22:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCE7281355;
	Tue, 23 Sep 2025 22:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYjD5ssd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBD226863
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758667718; cv=none; b=bPQtHu479cr3w+O9fViHJ1EXHGwAhXv2uMmJoHyAwI+4TvJ3V+nRFpf4t9YgtN6toyaoobeSzj0fwMdqAdSH6/L7FsJKyJFm1PDiEMT806/v1RTqKWQvwWjW1NDaJKH4YteyXYsSXP062o/qktQYiypbB8BmirQ8emJt3wi6wu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758667718; c=relaxed/simple;
	bh=KGYrdccxkJWz/NWcgi56AxtyIRez9CZ3n9EqSfyRTOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkpbmCHr5PxsCTdLNV7y7LnQx2A4VWMzbPMTaNPkChj75DOEfyde9FEpN7kobgniE5nmWEKcaUSaz5bc4w6Wcd6MND5KU12ckO8WzXNb6PzZrePi6nEBte0LbxVoavfmcnE/28T1PZZaGImmSCdwfddg02jDIG8Gz1jpdsFovgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYjD5ssd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NF4laH027269
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhTBs1uXxvVAGkh+Pb8xn+0DsTafgd8f9wM86mvWR0I=; b=XYjD5ssd2TIZMs4b
	KJOVFYCkUg9kb3Bser3VbMMsZsiZBfeTldoEOW3KslMmAg3wLdGmKJaY3J3wHiFG
	kdwytUulDNRhT9w0XqMg24YNnDTurVfRT1P1iyJqlwcsh1j9H/x/ehQLcklcWqjE
	YgYQY7SaBFWUHA0A53LGf0WhJXuZWiRZTIlhT8QmN/i3W7HMmYIo0VWTmfHz1Uv8
	pL6ttTnsUjcfRh9E9k9A7D0eE434QUlReDVv/l1AfenvIyQL9cMpvibRSy+U2wlU
	BSbd9EHSK/5LNTQrI6AtQQJOpvhRjnQPXjwaCphxq/ZhzQteZYZ32aKCqczu29dV
	d13xlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajevsdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 22:48:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25bdf8126ceso116232605ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758667715; x=1759272515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhTBs1uXxvVAGkh+Pb8xn+0DsTafgd8f9wM86mvWR0I=;
        b=xKX/NVk/Mwqll3iTu+NGVbbywOobhPG5MzhKEXuMmH7MP8s1dbaHN0FIyhUjkuY8zA
         NbY29z4j0o3RaloP1CQjjcTj8CFiPPVnOg8i9i4q2eR7shBt2WEYXth6IJThlb0Fp4N1
         SEZ5J1MowcbdwxH9gLmUECDY7tmPkh2rGw8yM8zWYhOLeS5X2/fASHTPBal2rx6aX7zh
         ilkFIPq2eRlBFO/eXcGtoQ+XHFAS1T3sz2+EDtDRRvIJTfZ4U4o/lDJ/IAukfAwQTrvL
         NBURgpiFPpPSRfG5S+S8SwUVy7l/l0kSMs2MB8c4PBFFFIvM1Hrk9Yv8Bo2IsKK/vjxS
         dXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg1yvxQ6g5yYZ0RgbpwRC3MfsjIl3X/EoTWNcxf2+8iP1v2/ZRMw5A/7940/v4Ev4kxKpK7tSNJ1prMaDj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw66o2vEfX4IzntwzytA0GAc8Aa7fgTCVEAFDQNMuM3iqo90hFu
	rMA172DTC9suZSfNmEXzpnDuUAi5irsFogCo3bN8CiVLOP3sqgduswSSkAvwOShPwU5Tg2XMxsd
	VZdnb3TgJXzjLaqy3dLdfpLwlgtp6H5FrLEkNNf+yS056kWf8bLdWUi6wu8J8tQPgdts=
X-Gm-Gg: ASbGncvJQZZPgT8jZRqmBSDfYKgEv3jhQ1YiwQdAF/mhGZbIiR0xAcxgE6zIAVY1K55
	vrUxOvWpgUakUu8ncpWs/HwgXYvpCjyy6rGm5GXBDzuOPcaqnwTBK1NsCkEa3yEMQQIsmTQCkGH
	8B4TbEmWVgCjaREnKENqYsZJFvvCYNenLT6nQ92mMk/3dR+LnSNNd/a2bmaw9oXHpqOfYGZnU3h
	3fn8RcSuAotxmQWFmFCbLGhDFKSDC0PHKmSLlENiN4cYVNTRoSIBzKZx4galg/rIx+3uJG0uC0m
	YNt52Bef2XiC9kwVJIL5Sm1j7z2t/23ya+uduWyz5IkedfUM0vat/Dj9lofXjb1Y3TnrM/GkyMO
	bB1/03/rORnBwjWWP0McXPn71k0YdCxO59Gc5og==
X-Received: by 2002:a17:903:32d1:b0:267:e097:7a9c with SMTP id d9443c01a7336-27cc92d6390mr39514775ad.53.1758667715274;
        Tue, 23 Sep 2025 15:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOe5Xvqff3pEzpF3RusBgGn/eeG6J9jfCttvo4aiBAfj9fCkj86Q7V5Xt8WKarN6JKSQIm7A==
X-Received: by 2002:a17:903:32d1:b0:267:e097:7a9c with SMTP id d9443c01a7336-27cc92d6390mr39514695ad.53.1758667714901;
        Tue, 23 Sep 2025 15:48:34 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c265sm171438685ad.49.2025.09.23.15.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 15:48:34 -0700 (PDT)
Message-ID: <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 08:48:29 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aMvV4kK386Sni10i@stanley.mountain>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aMvV4kK386Sni10i@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UWRRm-Pe6GJjNZK_jyxOz4ookTjh3Tgz
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d323c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=ok0EKaH7qlBqcbMr71AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXwzzdtnuD/sCm
 mg9Q11c/4YJL0wPKnWa2ImOEgahHSCBgS8c2a8r2caROffSrkkngy+aY/MqpXJBjbLeDAxngqHn
 6dMh2Nzh3bccu+l7C7X6fW+RLrdOQiphYKICLcwjfnL7SCrDnlYTPqpQKFFowmqgHMzwitdHDGp
 THFCdWPLu+rCMRKvTygJYNjnJwL9pnSOviTdJGQk+IfFcS4PuaZtoLZlcWGvCOtw+36JuaIKHF9
 SAOyUSvuJbC8FC63118ol+xd4vFPeQeyHaTxQC5xmaxHdyaUSAWsmOC7aXn6gSS80J6EAABebJ9
 HGZ7Hj9GBxASmNCd7DWoyArf84YQpfeCAfDQfh0F7ewQ7h1xvBWW81c2i0sJiZR6WgiypGtc1+2
 rerRI6G7
X-Proofpoint-ORIG-GUID: UWRRm-Pe6GJjNZK_jyxOz4ookTjh3Tgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> Re-order these checks to check if "i" is a valid array index before using
> it.  This prevents a potential off by one read access.
> 
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/tee/qcomtee/call.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> index cc17a48d0ab7..ac134452cc9c 100644
> --- a/drivers/tee/qcomtee/call.c
> +++ b/drivers/tee/qcomtee/call.c
> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
>  	}
>  
>  	/* Release any IO and OO objects not processed. */
> -	for (; u[i].type && i < num_params; i++) {
> +	for (; i < num_params && u[i].type; i++) {
>  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
>  			qcomtee_object_put(u[i].o);

This is not required, considering the sequence of clean up, this
would never happen. `i` at least have been accessed once in the
switch above.

Regards,
Amir



