Return-Path: <linux-arm-msm+bounces-109002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB82Lt7VDmr2CQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:52:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 385115A2B2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43D2E303C7F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744F037D11E;
	Thu, 21 May 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCNT7r9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dgvm0YLh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27C37C935
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356765; cv=none; b=c3+AnR9d6hXzgANs9Z6IG3khjjm7OwkFhDRumKGbcok9XcuOwW8alsfCuCqZriSPtpwsksy5mdbbWLJENuJcAPJqux0hcszt/8jDWJPJ84zgCcVz0LgXUDkMyngK+zYnTf4MVlmjv6lSF+DkEMc2CXqgsugtfKQUowPvh2FqZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356765; c=relaxed/simple;
	bh=hGtbYwpPIlm5fk4l7eabC7OuZYdGNrVAZREmsNFz8l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db0NMt/yw8WutSS/J2bpOgwOxbA4UHYc/I1R07apzHkR0PVMaxDFuc/u65UpbB0NItJjQxH5XwvnsQcH1ZvhzUoRGA7NjajVWwBMkKnmz/OW788GNZksQYBRDFs+z3hxMDfXClw30VZd4+n6hIH6zrlhxzxsJSCzWMxS32t2N/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCNT7r9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dgvm0YLh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9ANkk1731245
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDNmhELg8EvsuYL9gAVqpBedxk2dH2CUpsHmIoks+ns=; b=bCNT7r9NExZr52M7
	2Zo0HAtBKV9IT+aNbPBHUU33r7wZQWY4U+BGgMX+LwmnnrxadSiVyaJA9qkVU7Qh
	vYo6uFBp082W5jWc67ehvuNCXEu6hmM0bdroY3xJ3kTFe6dZO887yKI4UvUQe1m/
	4wYkbbdN/9J7oZs8snLXTyzsKVkOpdZBu/k6uLBXtE/fyXlH00l/9jegHhJoel8o
	vzzhKTUTsxzzd1snfzeGUaV3LuitTgrrTgkLE0aLZkovMVAwCk+jjEE4sCGQvELb
	2WPFz1EUFn5qEvs1fPgp46RKaA6ktZOnpRT0W2BrVk5MGEgvtYy7sk5UNQyizqOU
	ffXP0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4rfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:46:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b5cc5cd2so18840981cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356762; x=1779961562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDNmhELg8EvsuYL9gAVqpBedxk2dH2CUpsHmIoks+ns=;
        b=Dgvm0YLhdsv2t57qQGvPkKYbjb7Dtj2vLSLiYA5I+IF/hK0we/I/lWwDNaFzvxM0Dp
         WWoIx4Gn9U8UseaZi8GCw9R9sh+AVA6ijE5AYVu0VhgZkKDBJ7DvHTQDMwis8pR8Fc0Y
         8uefzV7TrUlqYp2Rx1tUYsJC2BU6exPJ++GMIkkqIUEi11OpMH/lkt5hrVx4QC/Y4A1X
         r9L9xDp3Tpv9/pc1hanvgKVBUlCyaupK34jFJqxOK724VfYEWXqjgBSK1tD6aAlSNjlb
         LNCSx0QS8hnizjU9kHdB4mZIpvNg1jdvcAmIg48mqUCfV07O4HFsKJQF9Qck6EnDMjye
         imhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356762; x=1779961562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDNmhELg8EvsuYL9gAVqpBedxk2dH2CUpsHmIoks+ns=;
        b=opXUPK0biE1v3qTjFmwS5l8H6825MkGyDKV5WEVz2dgREbmM2R1ccl5gOgwIqY6x6A
         OtFViygnczBBox6+pdJ+nJa5isQu3lHNKNaNON0Bmxl4B0cpLUUiUlopVfCQfm5m/yW7
         aO4DOexPWNtzTRG8nJ6IY3vIYPeHAJBCkrTNY0l4zCgLFCP7JTVrps0z6MWXpkW8mIYS
         GXoP5yGANNh0R67nUs0Z4h7kaAAN1HgpUe/SFlza95mtRe2y0TpyJxk+9DM/EcawUxne
         QBIEGWLlkrR1qW/M6xYk2LzDyijkYuGfQmmw9rk7GAwtW5MVKPEwljJ1+PRDklIi5wFw
         CUYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CsjWsnXcawgJWiyfMSmRPrj2nZ8KnBo+OQwkYimJL3teyBUJsKmRcW7P40XRHfITFaTG3DMXZbuOtLam5@vger.kernel.org
X-Gm-Message-State: AOJu0YyzO3s4DgSWl4kQU2R2f+iPiINbRlFt3XHAPuhkMrsrUzEGiWQN
	UWcSQ4x2tov0xFPyd6mfj1sfirS/rE3H9LNyYJuf7EsnMjHxNP1BffGcJExIlIuMwNUeco+dXDc
	PfmUhJ3ceAmM2hEal+cFZmaxGLcyw3NZQs0HLjz1Pwmg5mxmI+IXWpAu2eM6GuXXmzYBW
X-Gm-Gg: Acq92OHBXNxlGLWa++WnjJQPCHuN9irCT4V4egQM5pY1CTUys7pKsKy568iH7i5YFVF
	z2+1WbO1MQXopZkvHopQmB3O/HvwuZ/DdhEwQdsVz5gyjfCIDbtsMiC4TvMqFZozX7Y9DtgyeOb
	GZdKhHlwMk1q3iFqcvz8/3YgoLr3K4djPrT5JSKQvFq/VmXjk38ypI1i3sPMNlG2F8veYMmCYKH
	UhDj4Jdrbvf/m4VA6dL0y5IiisfHd5pfJpiMuk4gBd4TpGbqiBCh59zCykbLRH0TlFEWbuNc+0A
	Ym0BlsUcAC1loTUCuTmdmXMfCdMCRUdsqFywu8RfTdBmHj+cTaqWKLuD50QHSAzQEqWf50QXEew
	Bbg7YgZNLwJaA/vgH4352AdF63L+4kcNALojIQTDypo5vSr2u/LX/O5AthnFTuyL4oD+qkOj2V8
	je88U=
X-Received: by 2002:a05:622a:5909:b0:50e:6311:7380 with SMTP id d75a77b69052e-516c563252fmr18310561cf.6.1779356762443;
        Thu, 21 May 2026 02:46:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5909:b0:50e:6311:7380 with SMTP id d75a77b69052e-516c563252fmr18310341cf.6.1779356761999;
        Thu, 21 May 2026 02:46:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a40e102sm23330766b.40.2026.05.21.02.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:46:01 -0700 (PDT)
Message-ID: <3381259a-1deb-460c-bbde-a97263914e15@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: apr: Check response packet length by
 router type
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ed45b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LHNn7dHNAcYXqiuR6qgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6Lca3ETky_fGh18t-k9fbfF2l75LI9IZ
X-Proofpoint-ORIG-GUID: 6Lca3ETky_fGh18t-k9fbfF2l75LI9IZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfX+biSAqzIvLmy
 d3zBAGscqShVQnRkGHra/N7VxkQFXKru3/7NofFylMyDvp2rS/GEv0SBTOJypQWUAIbOANh+Q/G
 hJJrw10g5WwSnyc2xoo8oKBdV42iLaE+Pnbmej/2Aqqe4mREVyyXISzI2aqOvFB09qMo80xrRmV
 qUAPNzaGVRtIKawxromWGXlwoanIFgUofSSWXDm041sNbIB7PC6KAS1mg3mauwdFb2Y3opfQEbx
 N549zY2vzta8LcpySsvxKP5KwvVJpvTJv4/XKZDNbeATGs0OV5pSRhEBnAtC/KDnoJbVzFGJ4Ne
 aQ0lfagTEx/LiYL4GfLyeMDpmskO7Vvyq9jtTjWhv9Ab4adPWXhsXRd+8ltV7OTOgLTtu9lbAM5
 1chpXB95lyTn3bx9UY9nGIUf6M9Jxehpv2JdPS+F07nWFLOzPUdvwAafKQ3/9Jy5UwgACI8MaX9
 0xo/jkSBa7gMf6gPJ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210096
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109002-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 385115A2B2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/14/26 5:50 PM, Srinivas Kandagatla wrote:
> apr_callback() currently validates all received packets against
> APR_HDR_SIZE before queueing them for the RX worker. This is not correct
> for GPR packets, which use a different header size.
> 
> Validate the received packet length against the header size matching the
> packet router type before copying the packet.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/apr.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index 127204c195ea..68b357462438 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -165,9 +165,20 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
>  	struct apr_rx_buf *abuf;
>  	unsigned long flags;
>  
> -	if (len <= APR_HDR_SIZE) {
> -		dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n",
> -			buf, len);
> +	switch (apr->type) {
> +	case PR_TYPE_APR:
> +		if (len <= APR_HDR_SIZE) {
> +			dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n", buf, len);
> +			return -EINVAL;
> +		}
> +		break;
> +	case PR_TYPE_GPR:
> +		if (len <= GPR_HDR_SIZE) {
> +			dev_err(apr->dev, "APR: Improper gpr pkt received:%p %d\n", buf, len);

It first says "APR:" and then "[ag]pr" later, please at least make the
case consistent

> +			return -EINVAL;
> +		}
> +		break;

Switch seems a little far-fetched, unless there'll be more packet types

Konrad

