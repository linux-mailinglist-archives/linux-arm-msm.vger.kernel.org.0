Return-Path: <linux-arm-msm+bounces-109622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEk6JvcfFGpGKAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:09:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0439F5C9046
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A36DA30087A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0EA1CD1E4;
	Mon, 25 May 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DbrYRItD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgCIpdlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86533F598
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703794; cv=none; b=RAUy7yo7BvcjLm/Wb3/hdYKrG0oSLkHgEUPxw5Gp+Cu+wPGBc3VtCADcJJ8Hl//UChAq/eo8hNYFKV+w1yuO2OGeLVQS2Lo6ax35W8sojSYY9ainTPh5bKBdIeGhqbNUfVDfnrbsffOQZTGTHnaHX2WS6lqcs10iElkRujmfIEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703794; c=relaxed/simple;
	bh=mP8Y9pKy6yJKgyXfuQYJdFdo9u6cmecZID+dcrPajTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMY3ormwGYojCjarjs1mNIzxf6yQrUA6bOrL2l/LW9oEOwEDotNBhCBlWYjpml/cwhYUBw7dW1JMugYy38PdFwfBYMq0SJ45XgsvcFvq2X0/qRt56o7BrSwn+detJ635trx37myLdJVjQsk9Zdn5b11xeWpRekWvn8aTJgoRa20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DbrYRItD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgCIpdlr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6njtD1330183
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/8Z7uOlX015yIhJn6y1raKw4
	TJYwaNZ3Kd7c2AF+C2k=; b=DbrYRItDZPi4Ok9ci7h70thanEvb5HZcUAwDTJqj
	Ib61Bb24gvaDJebAKCuJfQ4B4N8VtxJaBXjbcMq8ENrL85N0soMjH3WC/K6aN6Te
	VAZT7qhSVMgH+Ko6iviPHeR7GPxiRPq6kFqCf3FeUM/6ODvBXZ/yuNm3nmrjgFZi
	xIcHo2bARsqNRN7MkQ/mKYgMRVAdUTbGYmpGKOG4TxwzmVTWeNDTgF/bF7DCQnpi
	HJxRrQVRhCRrduGG8tU66/4xVM12ela50VDp3kqlRMOVzPn/eFsHlyTvtrdVIrVN
	ovOLXGoRPjnJg7QcL3B37ytKWCzWfuzR9oZzB3aP2cTISQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5ng6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 10:09:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751c50552dso1398701137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703792; x=1780308592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8Z7uOlX015yIhJn6y1raKw4TJYwaNZ3Kd7c2AF+C2k=;
        b=PgCIpdlrRhHtd3AqWCPIimazxY/jBaKoSF256Y527FyylKP8KY2bCzm18kgqsC/6Bq
         ggJBRW5AQ8PYvWa6I8QwcLtzmFKGxtht+WqVgg5vVG7Hwhz09Lh79AOu6oymGfOBTaBk
         p3e25CLOgUGmv+i4WNIO2OQWxYhA/hb6jFGdrkGLl5R2Vz378r9RH+CTj/Ly7qyeRD99
         pXvcFibS6x2zpzi4eLCeQb7xx3InXM50Skx/1wEkqgDUM0FoObAD/oOj6pbP0nuQ8qkw
         4tUUX8Z5o5GawgNtPySB2EvDA/Ktx4keNblGcG+kddMrJNVvOFHqAy/dVr1EHADw3HkM
         H7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703792; x=1780308592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8Z7uOlX015yIhJn6y1raKw4TJYwaNZ3Kd7c2AF+C2k=;
        b=RR5O0Mj+RbzvfkF6GxTOsUJVpALdQrh4SfnvOE3Ko/5cLWxSyyGjc1LVNbzRvGsYGk
         gOVxZuR7r2TLXHWH/fcqoZDxzf4EbcyYBVp27gg5K5JQ2GCuTXoaKGO581Z6uAZxj0Q5
         fJxTF/xBQPM4ax6/B/G5iOg67HCnQnbmTZdDAsrdgMkbP/qUi3ipoCZd/aPHz4YVS60T
         RsIzGMvrgi/Svw93UrCFmSw9S1b54jvV+3vOHoKfK+fC0jqkK/dr0f6/JY6hhdQlfI71
         7RwrWDjMFyUaaquL8kEdW8wi0Yk0hjbhzOdVoXRyLFLDquuBetcz4ORjU3aRSTiQJPT/
         jqvA==
X-Forwarded-Encrypted: i=1; AFNElJ8v4aTDJr2ABp4gvYAs5rmzylPsLegqIOdyJCcVAGwtzvSMPoJhCI7wyy1btmGN6uuazGblMRtCPdC6J27D@vger.kernel.org
X-Gm-Message-State: AOJu0YzneuQNrkBQDStu2N4Ff1BspTStURcKsr863dJfxtW865ZC6Lwg
	a3kvHbczYkymb8ARhhjlAIzxNqIMS8IglNJRpylkwjVj6qaAD2Jquq6HrBmUo5RtTR2reJcH2Xe
	yT6RGsQmaYRNxwyWRLnMHrr6b4thL1mSk2CQYEd1KMJOwoMNzaEhXjt+DEHh+pNrSxel5
X-Gm-Gg: Acq92OGT8JdaFBUBnBuI9E6/OxAjxSP+4qq9MhK1fWj198oOiVByunjP4B8mpuGsAdG
	okz/+OfxxIGCgG5zqWvF1kXxfF9omccSlfSfj3VLXqDtB1jChOs+681lzKbeUjBe60qxd7RW0JP
	aSluVQvEw9xewamXKLV5HIy52HLdLZ9MBfJcngaUi2m+TxsOLLxKYw3Z1KRQyolh1j1bmJxxgBs
	Gv0ttCpqWBgGt5FKp+HstQUArX9IwBDkGUbWwBz4M+p0768Te+2d8GIwQvJG0iaGUgxRwwE8XYx
	ftmrYTPjqPcXGiBdkIM9gUTZ/C1+enfOrIlHvVBjRClLR158B9zZlJVugr1lR24in9Q2xy8i6bs
	2O8uFu5dRSH4sLcTvN1Pu+Kh14+qHn7Lcpowo+05vQ6sEj2gGsopNSQ0C+4KvwCyvxxsVBSpz81
	o94xVP6PPHhccybs9SvSGeZ7KMcEuRnWQfZcA=
X-Received: by 2002:a05:6102:2c8b:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-67c86c90d4cmr5933483137.30.1779703791900;
        Mon, 25 May 2026 03:09:51 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8b:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-67c86c90d4cmr5933474137.30.1779703791492;
        Mon, 25 May 2026 03:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba53asm2589674e87.26.2026.05.25.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:09:50 -0700 (PDT)
Date: Mon, 25 May 2026 13:09:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
Message-ID: <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a141ff0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_oG7gLS4OdEnMWnebfQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMyBTYWx0ZWRfXxitjNGoq8jG2
 KSEXruyH92yZScNj+ryHH3zaA6UbKNWTnBE0rlXNtrObropJgQUX/UosePo1r2dwnu4AeAr/459
 LVXUE9nnbJoxtQnTQSkXj9dmJPHsXj2t8ZYhvFP8YAmapv5iIQc5R565r1fNWhz7XKejlFtSWxr
 LSk6f3qOWFGF40TcCSJIpwJlEpNlWk1SE1zFQIdgSAR11Sbvbh0EeparnsPpSP4LSL9AhCTtwEd
 9Doge5nP6rl3Zaik0XuskrKy+syMX4OtRHs+4Vwy2XDHUsffv37eJXbZZ/hqVhBSyEI/f2CtCKe
 n6kAwwAAXqRLOxiQLL/UgIsrkBl+qps40IqCdRKMSfMJ8kbl8zpqvfDjJ7F0V1w4TQjoM6AjK8C
 EJgAJLkHggfSTIx8LijO0slUsfpiy9zy/Myijavh7nB/5zpIn/hHFgySFy8mhufNQ+In3m69/W7
 GCT9MF9qmQBN84tSbng==
X-Proofpoint-ORIG-GUID: 9ZTL6QGXIhBJ5NBFB_-wH4MUeDqtPxBV
X-Proofpoint-GUID: 9ZTL6QGXIhBJ5NBFB_-wH4MUeDqtPxBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250103
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109622-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0439F5C9046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
> Now that Linux has the consumer for the GPLL4, drop the

what is the consumer? When was it added?

> CLK_INGORE_UNUSED flag.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
> index 35af6ffeeb85..3ddd4b3aedea 100644
> --- a/drivers/clk/qcom/gcc-ipq5424.c
> +++ b/drivers/clk/qcom/gcc-ipq5424.c
> @@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
>  			.parent_data = &gcc_parent_data_xo,
>  			.num_parents = 1,
>  			.ops = &clk_alpha_pll_ops,
> -			/*
> -			 * There are no consumers for this GPLL in kernel yet,
> -			 * (will be added soon), so the clock framework
> -			 * disables this source. But some of the clocks
> -			 * initialized by boot loaders uses this source. So we
> -			 * need to keep this clock ON. Add the
> -			 * CLK_IGNORE_UNUSED flag so the clock will not be
> -			 * disabled. Once the consumer in kernel is added, we
> -			 * can get rid of this flag.
> -			 */
> -			.flags = CLK_IGNORE_UNUSED,
>  		},
>  	},
>  };
> 
> ---
> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
> change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
> 
> Best regards,
> --  
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

