Return-Path: <linux-arm-msm+bounces-117307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CaFDEBfsTGpvsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:07:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C440C71B363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:07:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=go+XicZp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NsoM/IRs";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117307-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117307-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D4EC30352D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDFA3FC5AA;
	Tue,  7 Jul 2026 12:07:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08DF3FDBEA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:07:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426066; cv=none; b=Wj4xn1CpIupWqPuj6h5a1VjhO2kUGdbcLFfmj4+hJHLBNGRp/yhMZGiKFy5Ucwo3sxoNeM7nLe9P9h4kb/BBpyD+6hTTCgBju7trWojjQkOCycCUss4V4BoX3Tw8vljLnJOlf04ODLv/k4sqEuwfvKb0bwJjZM2noxBWLPouhts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426066; c=relaxed/simple;
	bh=sx8vAXwqtM2BF1RSMU1Bl5a+jAMRY4rgd8VoA4MEKH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBuix5IXglZUlS5KjcGXhIlcArgm2S8nHJgMfef6wGEw06BgQY+JqFveX4VWNXQdqO9StAu9OLQ+Yu2EIioaiKQWaHUZBm57D0Ike0xBFJZVpALd4v/alb1uk1aPIXnHShQgzBWQB53bxkkZpywH/YDvkbrkIMSVCK+tF1ajPxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go+XicZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsoM/IRs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A761a3471480
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSZCpVJgYGNPn1Ohux957EKWIlXyg6nTTccZRFciuH0=; b=go+XicZpWJFxQRlD
	q0EUzpDkuXG7BOzDsO3p6LrAZ8TKf4BxfuGYViRgyBuKbXB7E/XEb+yH0WLd3QBh
	9YtUZFlHi+9sxl9rVRRpjZeYEPSb9fuOlOE+7d2pBtrvGAZVqxopGXu7PzFWFKyF
	XEfkDfk7Xaz6V2dtpmj4qWI6JkeW/KU7JQOaAr4skymQA0gVc71JaaTujABrld3K
	z5HOWBuaqA7JEBugDGD0atRrgsTkdrNCwdnze1jKdYzSvmAZFsQgCMpvuxWMhLAE
	sXjDGV1VD1HkALkWTxiPC5pjx+m7s/Xt0yzsCGNv5xWx2DdjnTqX16bjqLN5QJx4
	e4RvZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0geb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:07:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84777e9b51bso10419086b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783426063; x=1784030863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSZCpVJgYGNPn1Ohux957EKWIlXyg6nTTccZRFciuH0=;
        b=NsoM/IRsBD8cswNnh2zuMADu8DfXNj0fn+a7JPtGcSXn5LZbrEw1pSXc4nY9r9boqD
         MBFn8tAzI7u5Rnp0Va2Cer92oyTHdpHd/3UZoLYo6b4kQuKL/o7cnR3hVUE+IOb2UYU8
         Vi/PlNBDZ/ntguZyFxrlx4O5ZvgoY1CdW7zAzJX7MAnCfkotffex62R76jeo8chntDyM
         b9tYtjF2kW6129ByyLVEV/nU7l7UCYGZQie3cVxGBP2giRxuaFrAq/NXpEqFaRK1G6r8
         E8DX4jORNNafA7y39gtOSYUG27gYnVsFBHuAP8sqeoZmZeUsyoqoMhu20BN3jCkjq6Pt
         BPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783426063; x=1784030863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSZCpVJgYGNPn1Ohux957EKWIlXyg6nTTccZRFciuH0=;
        b=pgLHKG1oE7Cw3TVAsaQpvIKOm/SZLLDaYBIX+dqhtxYKLo664JQz9HvOYV1B21TOyq
         KAJDmKFdbJng+9fISr0HhPMnbXO8dNjzUTNB7cuBH+na6QP4jG/m2DgBh9SLT894doye
         WbX6PpaHQUGp7Ob5IVyHNsSUjZ5OPzvwSa+NPDRaaZGxlW8qtSQ/mysrbR0DG7pTvBJp
         04z6EioEWHiNwkSmRa2Yr1OptVLX1p42ZGzpijdAX6+pjA1xCVwILu+xDMfv+zUdSDbu
         DW8ruhPJmh0HGZ8HT54NENqeniSCihjJiPsDt3MVE3kwdVPhNN2YBsGSJwpStRV/6DX1
         OTTA==
X-Forwarded-Encrypted: i=1; AHgh+RrpdwXcYTVCF9KlrjhN2HdUC3MKG4Oh+OVKcxba0vMU5eZpZcp4yxPiKNDY+ura2UMayUeDrJFphvejxErz@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/uZOSn9ZKu4O0abPskFdt2uwk3e8xiOs+gEOVHwBoYtxW1Tj
	jnYjFUCy2/wpDPCgoZ+CbifQyIl7CdK3ehm0jGms7xEtKZTBxspIDIr+doIkGFIO9wFgFcf52cu
	uo3H1sXWlERcfzgyND940bvB+bjGcSbNRtTUOLQk8zvMoGBhIGSAmyaNcYnDHI4xDlaOk
X-Gm-Gg: AfdE7cn3SCb+yvqzFkBH2Pez+0osIxRroLBi4G6BvTR4QspPN+hPu//1OF0QYGrmmjP
	8Bb7+FqvLM1LcHaAsHD2bfOAfOhMSGA7LLBF88uYSHQyRqcwXusvzTbvvRU5o8z5a8jYfTULna4
	JbqOuFGegnIrCXGOEA0CRN7yC3Br9Sw65MSz6qxNCeoJ9pbAYGDNDADu4dvPC860FW8+kq+3xBa
	uYY5sn2itIVbuQ8DZuTgy5oxuU6FCWspQ7Zht+F7gBq8BKGKQsUb12M5aEJV0RkkWpRWx+Pxv8O
	l+ZyHqOISL9rXvOCFTqz3RGllo9FGZJYSGcbagLcVSZqdLjdQ5BoO+uO4ZczJ4jmEizFPJEr44H
	/XIJjYiMfmvmbY7irw2dWTWbAJUrypFJRf6CidJLm5MRV
X-Received: by 2002:aa7:9a88:0:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84826db0b6emr4883537b3a.38.1783426062779;
        Tue, 07 Jul 2026 05:07:42 -0700 (PDT)
X-Received: by 2002:aa7:9a88:0:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84826db0b6emr4883488b3a.38.1783426062170;
        Tue, 07 Jul 2026 05:07:42 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbfd41sm5359873b3a.57.2026.07.07.05.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:07:40 -0700 (PDT)
Message-ID: <81e84294-b438-415d-82ef-a523c4381eb4@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 17:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xBhR2x4LnipaAhC7lz1UK9dAuOs0XHON
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDExNyBTYWx0ZWRfX21qQkY6GsKB5
 qjoVG1h69gu0s8jk6P0V/b4lL6Y0Zchw+s8LuGpkmkVxr6fHJcHrP6LXGfZAPZgBVWP6Yh9IMQx
 WEEYaS9pwL9j6mHuOobpSS2pejgPZJw=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cec0f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=5YGwSrtyFkuD1B6sRKIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: xBhR2x4LnipaAhC7lz1UK9dAuOs0XHON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDExNyBTYWx0ZWRfX5KuctLl05QTS
 db4DETuVOmoKIyON1v5k6OrCGJHrkBnbCkoLynY/tNsySG5fTA+5P4HNbAQk0VNbkjOhQmmn5/w
 0FsCTqLHEdDyZVkdols1qpWsmKfJvCZ1kX185MK/ltHRYV2u8Y4RdcRY+83z/2gcAal9Q/OXS8w
 AcVLxgDhtSal6T5Nc02XrNx76a/89TOXfH35sU+YgvjFgKjJ9bhgK/9gvZuB/3ghID0VvSAlqns
 CUa8pRiBEvubPXg92cMIOpvC5kmX0J1cYwCZpOPnsF5gf+Qi2hGN046FE887shqar2eHH8OdoYp
 nX8l81OMg97SK/pG408eyAT4yybQJgywag3ou16kGw+dvE1w/E7KVxVNz5A2rfbYfXBumWGSe8F
 nEorI4U3vKi4G8Pl3qufJUkpJzeG455GfoQQM3edR5CA1C08SC2UQPooShvFJWI5B0w0T8yGNTb
 PGqi9UZ2KJ08Ti5lCNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117307-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C440C71B363



On 7/5/2026 7:27 PM, Aniket Randive wrote:
[...]

>   static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   {
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
> @@ -471,7 +484,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	}
>   
>   	cur = gi2c->cur;
> -	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(gi2c, len));
Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an arg ?
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
>   
> @@ -513,7 +526,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>   
>   	cur = gi2c->cur;
> -	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(gi2c, len));
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
>   
> @@ -591,7 +604,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
>    * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
>    * @dev: Pointer to the corresponding dev node
>    * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
> - * @transfer_timeout_msecs: Timeout value in milliseconds
> + * @transfer_timeout_msecs: Per-message completion timeout in jiffies
>    * @transfer_comp: Completion object of the transfer
>    *
>    * This function waits for the completion of each processed transfer messages
> @@ -601,7 +614,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
>    */
>   static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>   						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
> -						   u32 transfer_timeout_msecs,
> +						   unsigned long timeout_jiffies,
>   						   struct completion *transfer_comp)
>   {
>   	int i;
> @@ -612,7 +625,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>   
>   		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
>   			time_left = wait_for_completion_timeout(transfer_comp,
> -								transfer_timeout_msecs);
> +								timeout_jiffies);
>   			if (!time_left) {
>   				dev_err(dev, "%s: Transfer timeout\n", __func__);
>   				return -ETIMEDOUT;
> @@ -736,8 +749,15 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		dma_async_issue_pending(gi2c->tx_c);
>   
>   		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
> +			size_t max_len = 0;
> +			int j;
> +
> +			for (j = 0; j < gi2c->num_msgs; j++)
> +				max_len = max_t(size_t, max_len, msgs[j].len);
> +
>   			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
> -								      XFER_TIMEOUT, &gi2c->done);
> +								      geni_i2c_xfer_timeout(
> +								      gi2c, max_len), &gi2c->done);
Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an arg ?
>   			if (ret) {
>   				dev_err(gi2c->se.dev,
>   					"I2C multi write msg transfer timeout: %d\n",
> @@ -852,7 +872,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   		if (!gi2c->is_tx_multi_desc_xfer) {
>   			dma_async_issue_pending(gi2c->tx_c);
> -			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +			time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(
> +								gi2c, msgs[i].len));
>   			if (!time_left) {
>   				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>   				gi2c->err = -ETIMEDOUT;


