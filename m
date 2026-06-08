Return-Path: <linux-arm-msm+bounces-111728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qz2pHfF1Jmo0WwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:57:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE8653BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:57:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B64M+k14;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qn1OiNiA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F1183006175
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769143955D3;
	Mon,  8 Jun 2026 07:57:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74B391835
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:57:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905455; cv=none; b=kJqoNiY2+K+GFpzTsuMfvelkWBCXrQ+oPzxuNq1FbEcodwqib6ouNGxEAoOj7McylyK1ZF2d7IQck/Ql3jum9PXCDW5ki155hFqnrbNsdVBvrf1Vx529umKDotqxXgQ+qTZVXnNeWmtiZW9mJwoElaqLzTi40KZwS2ETl2CIZZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905455; c=relaxed/simple;
	bh=7xl5ZJ1KevTPBNN+h45CaAdKyk7R/YqHDdBsPsCvuZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFH2X8VnQ5FsYV0MKTTLCyX/5v46/zQx6F686GeSkCIsLIOAjn+oM+MjHm1DtuePTRNehWq10mRyIiolfhylTuHili5orbjqTxRiNgUK08EiBIbylZTpG/ZtZOPwZI9iIWSzpFfZ9sxWkL8B3FuF10oX/icRweCsh5QWvGXlSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B64M+k14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qn1OiNiA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QrbC2771578
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inrSZaqSNNfPmqqbbkk6A/tclz5TUzd+4OzD5QMl0o4=; b=B64M+k14a8dzXt9t
	pFcpXMZRmFGsxn+n9iPEZxzHjZKiTj251qd6xREojiAphU8r+OOYwMgFAT1SfXY1
	o/PXmow4P024ZA6UP+DRzFkOHwFmPcAHxFtgMoWnSAvlFnvKmQw+EEes4XpByJJk
	FSDAHXcL9dpqZZIvyKBpK6r64IOoju+P9xgSt/J4XtpeWwnuy1NjpZtXg3QHuDqZ
	ntGJrBrpGI+E1mippHkJzLBc6yYmyB92DoTRJ7NFLvYyWaEHWR4cJQj6GLUjfYkQ
	5kAs5eShUrDzXr+FRqgCsJiqw4nlyR1Q0s5ML1S2VX6WfIDxj9gmo+/5LXHtsmKY
	7AaUgw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6ejma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:57:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so13744411cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780905452; x=1781510252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=inrSZaqSNNfPmqqbbkk6A/tclz5TUzd+4OzD5QMl0o4=;
        b=Qn1OiNiAhRvw4MvuBpDmK4398l/gK5XclP2Gor3MvWFfrT0S2CGIKaejOiuBnCGTnh
         AUINF+JUmpB28DYMKVX6nCQZ2xe89A6ZYHmVzdt990O3scRlYMhzLyjlmpf/ugAO7PA+
         N5YNPM3jwKCUKH70QEdfO1MLIUqrt+fU5NEmV4T3r099axg4mRsyyppYaeBHjhy7VnvX
         FNMWB+6XRYHm+zI5VqsGoEkJESiI9CszIjtFVERnBRWlWB6og4ZPNkw7VLUhx6Oo8rgP
         aA5FZaT4AkYQdMiZ0uEGnpU1zAak/tHU4pVuBPEDICxFY75uq5raq0fHlvnU8MoaVBGQ
         3NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780905452; x=1781510252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inrSZaqSNNfPmqqbbkk6A/tclz5TUzd+4OzD5QMl0o4=;
        b=b5I8HVgI0DBaehK2E+8MqXmgSWe5DNqGzPv07sgZtXGbXhzOjoCVIaJOuYQsQeLsru
         J1fnOZGc+AGES76sRYbr5Ez65dhVqxdhSRU8BUp14Sc+eIAmZEmkegJ+AxooyNIJh9Ij
         itT924SdpHJU5EdaoyCjjJwiuhO/00fAFk5NnDY/0pumtcwc2pSVbWz4ZZZNe4WXN+4r
         yJKOafR9+RqrGJOuvBg+PrsgOCCoGkqRjtfgsR6qrX7CRDB3Dm+vbjAN0tV8IlaaBlF+
         0Mwlr/KfTGr8fcEgyCmMK6VdQbGJY3JsVO1RLj3nxwtJD+qen5y7kWBZAJiRJqI0SXlk
         xPcw==
X-Forwarded-Encrypted: i=1; AFNElJ8h5wlb/I4qMXiINsFZ70U50/ekPhpIcANmWClg8BZrHqqhZ5PrR31gBKYhO7RPkULbKliPG+A32ebG8XV1@vger.kernel.org
X-Gm-Message-State: AOJu0YwGAWI+jGqXf+jVDSz6pfWQeqRZ0XI3ybEXOBM+ph+9UW0y1F63
	IrtnbQ/AI6Tj99nvpEmEYKSjDj3hDb/5HMFQe70qKa0DicR7RY/gcgtl86HIbdolNQXleRkEz0a
	NTjXE4B8P2dq4h6rJgf1jfPA7LRPyidg8unI7YR9Aym2V2+JPWd4RjoB6MlZIKqePAP8l
X-Gm-Gg: Acq92OGCTCeM8Rd7n1ayuZv1xXiJQd4/psfGZdeuSEoQhXJBvLwr7dqx+XfEf5PONK2
	0/PGIUlOY4lo5Y+l9qwKIiVHpC40VtFi9wsOiAIvy6OHl7ZzRdr1dxNyKnypZLxc20YlRxJkIEL
	oTpHmd1TPtKPFVYBMdEP9atcxZnwbjwFa1QtPPB65q7cV2Zitm/72QYtCmRA44GiVMVycek+YAY
	RiW2pR3kmP9ZJUaM/4EVxu6w73kEv44BjKT4956+07m59A4RHkfdCM/EeYtn9J+V1Obd32Avb2K
	O/vMybHuofYBuSiwQpKoIh6yt2IVUybD/Kqe24NNjKBaI64DZa8qh/bpX9tIlqHfHhYUr6VV+hy
	AzvC/VI84Ju3Hjd6DlvsQNQhz1qY0WK8c5vwFUsApI0fcmkFZzPVAaYUe
X-Received: by 2002:a05:620a:7113:b0:915:769d:56e with SMTP id af79cd13be357-915a9c1326dmr1339166385a.1.1780905452573;
        Mon, 08 Jun 2026 00:57:32 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:915:769d:56e with SMTP id af79cd13be357-915a9c1326dmr1339164485a.1.1780905452100;
        Mon, 08 Jun 2026 00:57:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517721c2sm798793366b.3.2026.06.08.00.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:57:31 -0700 (PDT)
Message-ID: <f2dc655c-8698-4db7-a18f-069f215f011f@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 09:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] crypto: qcom-rng - Allow zero as a random number
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Om Prakash Singh
 <quic_omprsing@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
        stable@vger.kernel.org
References: <20260530020332.143058-1-ebiggers@kernel.org>
 <20260530020332.143058-3-ebiggers@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260530020332.143058-3-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2675ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hpjdtu9zJg2xOlDm1gEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MiBTYWx0ZWRfX9hHrpCrkR7IU
 WKtwAQSoUO/OQENp8LYx+COOfYlup/ULVb/ZDkPEir+bdG81XyWKkEr1NYFRnXvLk+UrY3up1TB
 EEbG9SJNnvVFq+Iay+PT/bk4kkkGM/Yp0mhv27kish3Ok0mQCX4qmJ5LI5efh29vMRUxAUdEPMb
 CpmP2ovLsvFA9HYH6J/z8gA01beygiJFCcxSlyh6mtm3ym6NfHuSOyAf7d+1urQ7aOSudLXiFVl
 ibl3aC1bope2lujocLeYp2qaS/b6MIr+HjsDavoM467Po9GOtnEPXvDhCuMZAo6gAu2V6rfRzZA
 wougBC355gn+hP8zCuqbAi9QkU5nO9i0KJrWk2XleMwjpuLhF69N9opyz0DzLjloIDth8+4FYDw
 zdbpAzwgtokroLSsmCtfpfLVILk2sPiNQ0nTm+LFcORZqA8JCKt7pz1JJjcrZPMzse3BTtJgvBS
 zXYWn+ZVnEiU1ZZT99g==
X-Proofpoint-GUID: 23gwEQMZinW8gzqEmTDIqe6a9SBFZ7eU
X-Proofpoint-ORIG-GUID: 23gwEQMZinW8gzqEmTDIqe6a9SBFZ7eU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_omprsing@quicinc.com,m:quic_bjorande@quicinc.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:olivia@selenic.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EBE8653BE1

On 5/30/26 4:03 AM, Eric Biggers wrote:
> Zero is a valid random number and needs to be allowed.  Otherwise the
> output is distinguishable from random.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/crypto/qcom-rng.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
> index f31a7fe07ba7..b7f3b9695dac 100644
> --- a/drivers/crypto/qcom-rng.c
> +++ b/drivers/crypto/qcom-rng.c
> @@ -63,13 +63,10 @@ static int qcom_rng_read(struct qcom_rng *rng, u8 *data, unsigned int max)
>  					 200, 10000);
>  		if (ret)
>  			return ret;
>  
>  		val = readl_relaxed(rng->base + PRNG_DATA_OUT);
> -		if (!val)
> -			return -EINVAL;
> -

nit: in case you respin, please keep the \n between the read and the
following checks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  		if ((max - currsize) >= WORD_SZ) {
>  			memcpy(data, &val, WORD_SZ);
>  			data += WORD_SZ;
>  			currsize += WORD_SZ;
>  		} else {

