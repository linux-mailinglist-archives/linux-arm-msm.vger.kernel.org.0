Return-Path: <linux-arm-msm+bounces-100129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAPaASFexWlM9wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:26:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7B33859A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AE53301F4AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D344383C77;
	Thu, 26 Mar 2026 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZOKp+zi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSpcZ4nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981C379EE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541851; cv=none; b=WbtiwjJ4+ObBMiqdxMK16gVVEZuqkwYUFr9yvHyT3sVpVfo0STCTo4SJaK/cnMlOJO9MfXL5gQOqxSikL06/tZlAKarZPxAcbc4gtm6+prB+O34HYSiw4+BmGgYxe5bimCqdijzYvlhXBV0n2rNaTZXwtf6TSQwZBQzaiRrV1Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541851; c=relaxed/simple;
	bh=tDSpY1TejOzwCOwtqoeML4zTegfiFUOPdcSviZLNYpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p07YcUFwkoshgxpjvcjGBoyjeG7DDJOodM8RYs26d6FkuNJ4vTa4/w21v4ogxnqnnzeaEXXzKupvWRDAewBMM+p1X90pxdCQy8EbIBekUuN7xzKIZ/RERPuUS49Soc06eBAFDk2krw4o7xvRHs4CumE//J5QXgixH5oTZDJEGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZOKp+zi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSpcZ4nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9l9u3373806
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rv1vMcePfr6BrkYqOV4MUVosqHAwIr52HNOnEfknKZQ=; b=UZOKp+zilRaU2178
	BbFu5L+mi0L69kdCdbiLtEBcwTnSNldcrrujeuW8oU1nBR67UkQFbvcMPDsYgIr8
	uYkNoKpaJsUviVpo+CQ4+Z8vDOj8TDHRHm2sxT37NlOzdZJoGx9+b6BmUNq2b/xE
	pN8odIvefr0tTz/4XYRhQb8ugqDsy+kAcou1gWX/1FihEC4gLU+wI60PveH8dLpM
	kzUhYHsgqqC5BljGyUZKfC4nHzJ9kjAxoTzl6hzTzAAXVpr+2sivwDhK3USjijls
	Ji0dBmZcBb4rcnpLMNhHkHk2LUQtSDxtz1Bz0ivnq3EVNtPV4uVwSTu4Fg0p1hPi
	08Dqug==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksuey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 16:17:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso872151b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774541848; x=1775146648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rv1vMcePfr6BrkYqOV4MUVosqHAwIr52HNOnEfknKZQ=;
        b=LSpcZ4ncs8ZWgHyCTwfQDUB+XU9VqLW+nBbe6MJ3nToBZG8SiNvJdclC8HjYmk0C3I
         seOk+oT43tFokC1+PmrUIO+loGr088rb8+t9Ns+rLP/IJWlLaIO+UyVsgXD5SDtl4l5b
         ZWXBoQ5nIkxpXfjRDslptj9ov/bvMS9XysgYsvdLKMRkZbgTOTnMI3tazUj4YKg2fGK2
         UCtNRvL8EdMzzgHjEgjFMCoeyfygy0lduIefL+z2tXU/4/ny+ShmYkYBeCn5gFi24MWv
         QTEG5jHftwyJgLMLk2hoBc0s0G47egjmQfynhnPlephxMa2gFqgGEh0Nb8kyGko+odoZ
         C1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774541848; x=1775146648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rv1vMcePfr6BrkYqOV4MUVosqHAwIr52HNOnEfknKZQ=;
        b=UN230XgKsHMryr6kYpwkKvg11PjiOa/F3WT4xDW2B29QQ/IrZCuxf1uj3DjqG2sTrD
         95e6fgN8g8Wxm7c1Q4J3moPyBV1dpJW79lKp0vfJGu/MMuOtI7i0beMC5pxBqniTTLyW
         VRYp79TET0krpB+/1Yg9MajO4w7x8SdvMKIWBOaNvYXRGjaj6soUPIZZjlJ3vQ47QWCp
         nd8Fj7KT6ldSPD8+DLSwBjGd8igJB5UOwcKvB1BpgcohVFz1QK97apPMpcud1DEEkniP
         3Q3DZG0hjwT6yb9o2mCusAXPVu8f1f0njLsdUbFNGxdL8EGHzVYx+Op9FJTF0N1FwE+h
         xWKQ==
X-Gm-Message-State: AOJu0YyPYy8vNoYDuNzPiDeHp9NavGBKariewnvMR+oi1gNP68eBvRUs
	YeMBwYpJlUiyJBjNPAhCe7/FkXpxlLLd8M0tGP1DJouMyjZTr7aQRdAvnQ0Sn6jXSXjZbKcUnVQ
	buGrfzYaWPYF8cLOmVYLvwyVh9U9+7XmPQzOvvgfWqhA/yc/Gre2Qdm4cEFfw7D86nYSI
X-Gm-Gg: ATEYQzwtRb1HHuCcSQYsaixz3fO9eYTdX1w7IvIfNWwKJC8AQ/dQ0XWvuXSeMisiTy3
	8+Z6vUD7+Jmt/ytOfhS19lbijwuKYI/J2KIx0gfquXCyRNO00DYbkVFU19wpa0PqBFtcPL4ODFl
	7cEsOsxRXeIgQXs652/gQI3DWqtLIzyzemyRIFgfr35l/LmdBqUHuKDlyGXijU4W/Ocy2fEnPVt
	bNzhW/yZ4IhTTKIH3wbonaoFykUYMrnpKF+tFtPzqHLLvD5Mg/KgBrTJ95fVjFSkEJ/MUMlZYLl
	0kRuZwDE/oC4q1ZQrR8YEsy/6VmVO28QuKmYgZqXZIpwGZVoZqXtJAhk/Wjh4ZV/k4tMhR9iGxG
	SQ9F2IO1/88hVgT7eJSpg1U7Zam0rCh6KJ1D3q48oIi81vf3P50XJqA==
X-Received: by 2002:a05:6a00:1c98:b0:81f:44f9:7c1a with SMTP id d2e1a72fcca58-82c6de863demr8484550b3a.3.1774541847943;
        Thu, 26 Mar 2026 09:17:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c98:b0:81f:44f9:7c1a with SMTP id d2e1a72fcca58-82c6de863demr8484520b3a.3.1774541847445;
        Thu, 26 Mar 2026 09:17:27 -0700 (PDT)
Received: from [192.168.29.82] ([49.43.230.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d20fc0fsm3820103b3a.19.2026.03.26.09.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:17:26 -0700 (PDT)
Message-ID: <93eacde8-41a4-44a2-a427-31e56cde9da0@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 21:47:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ufs: core: Configure only active lanes during link
To: Bart Van Assche <bvanassche@acm.org>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
 <20260311060912.3139257-2-palash.kambar@oss.qualcomm.com>
 <7922d339-5e85-4b12-9e32-f095e10b1211@acm.org>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <7922d339-5e85-4b12-9e32-f095e10b1211@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExNSBTYWx0ZWRfX6XtOKtW3ci23
 ZjFQiA+9hS3FQu2iM8FWK8yiMTNBkSTOAOgu2CdFIXSkY5/cA1jnvp1sRfjJ3b8mfFaimSXOJ2W
 0tInQQaTxDCHzWKEH/JA1GRhVOjBKXCWfSnet051uAy0P0G6YRyABYabew96KtmvGdJq7QlgZoK
 cNpfthAEYcf6HQ+l2FtVBeKkQzJ+9TmjLEzJJKpjTcaomCzplexNNwwh4TSYnIxfaIdSc8G9CWu
 FcAgPC3/9sy5NsnyUFGszW3rN/yw4JP0OrevBMk30o/8nguRVcXZASvnYLuj7t4ndrNgRX1JYNW
 XKzqQIzR9zhnKMvX2IajA+ttpF/2U29cRaf0KlRLFLqiuwQpy8k0OpfRMW+wYGFF4IieJkPl2LZ
 hXn/8lkWKSVJy8Nf6G8qb4P7sgOmUBwXQ3Tv1Jsg+K8vPMUq6zJ7xPW+zMhKaClWdgy+ctU/Y8J
 4QhQaObZ28YwkkXqZ/g==
X-Proofpoint-ORIG-GUID: mS_7xBb5tFB7f5qg5IWXwypEksbJdnob
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c55c19 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=PiB50hzSAWR/pQeEMnc2VA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zigxiAtAAKp8hoqNa4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: mS_7xBb5tFB7f5qg5IWXwypEksbJdnob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100129-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16A7B33859A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 9:13 PM, Bart Van Assche wrote:
> On 3/10/26 11:09 PM, palash.kambar@oss.qualcomm.com wrote:
>> [ ... ]
>> +static int ufshcd_get_connected_tx_lanes(struct ufs_hba *hba, u32 *tx_lanes)
>> +{
>> +    return ufshcd_dme_get(hba,
>> +                  UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), tx_lanes);
>> +}
>> +
>> +static int ufshcd_get_connected_rx_lanes(struct ufs_hba *hba, u32 *rx_lanes)
>> +{
>> +    return ufshcd_dme_get(hba,
>> +                  UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), rx_lanes);
>> +}
> 
> The body of the above two functions is very short. Please remove these
> functions and instead inline these function into their only caller.

Sure Bart, will address this.
> 
>> +static void ufshcd_validate_link_params(struct ufs_hba *hba)
>> +{
>> +    int val = 0;
>> +
>> +    if (ufshcd_get_connected_tx_lanes(hba, &val))
>> +        return;
> 
> Shouldn't it be reported if ufshcd_get_connected_tx_lanes() fails?
> 
>> +    if (ufshcd_get_connected_rx_lanes(hba, &val))
>> +        return;
> 
> Same question here - shouldn't it be reported if
> ufshcd_get_connected_rx_lanes() fails?
> 
> Why does this patch only call dev_err() in case of a mismatch instead of adjusting hba->lanes_per_direction or making initialization fail?

Idea was just to warn and catch the failure scenario. But I agree on your feedback. Will fix it.

> 
> Thanks,
> 
> Bart.


