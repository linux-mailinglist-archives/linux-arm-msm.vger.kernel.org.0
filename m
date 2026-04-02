Return-Path: <linux-arm-msm+bounces-101419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GtMKOzuzWkzjQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 06:22:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3681383843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 06:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C09A305212E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 04:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB603603C2;
	Thu,  2 Apr 2026 04:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmHMAttv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RirmtoNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369335AC20
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 04:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775103544; cv=none; b=Wjk/ui23ly2DV9pAUU6LDPaHmlj/1Was+xZ+yrGuGom4xdi65CfCXByFQ2tvRBSch2obNNuaPA7Lt7/9tv+BuYTfQt4zEUJTwri0HSjTlkJeqLPOmT0fYq7DSY4ZA1Bsu0YCZSCrAmoEfuGJoO9naTX+rMx2Hf4aEaWPmvvgVFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775103544; c=relaxed/simple;
	bh=Nq1GoCB4ClQcOLSkMueynU5dDovgmX34BLhKBGAYTto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZnaNy/GKl1rL8bkW0z/ikdFIzsH5gD1HIf8KOaBHOi0kBMrniFbXQosI5s6hGCnrJvw7xQwnmd704RW5e+uA3pAaTrWitHVLHydIsww2Q5R2rSYrvIJOnlzi0lCDJqGfjGyJ2CWKbZg5R7ZrlugvXLcMb262bAPpuK4aH1ateA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmHMAttv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RirmtoNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M427J3955883
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 04:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bqgz4J2kZRGzsd8djgWHGW7grHzpbqQpKF5+hFiPBos=; b=ZmHMAttv4vcTNrXm
	yKP1z0+qccXYhdpYg7SCBc5FUfL3MbAmNWctJkA2QlfHZbe370bfavIlbSj2BfWo
	w7eNbq3UUoe6wSNHM6unjsTTds08HaUisUD/txUHDrZXUZ00wHtlsOVwuH+9tNdx
	ElPzSeF7Tpd9TaHjq1M0P8KVFsf4/HyhTC8GwCc/U3ZfKDtRs0/qIAWu3OzewJsM
	FkHjKbM9Vb2XtGYPBCjAKC0TG7HINcHedqElMeJlqc0lEV+B/XRr4dZNgrmAwKrb
	1hfuLSlrxc1H66jPHtHV4+gfn/PF30MctEGrhQNoHSYtnlXaCgb4fCIp0X2yErCE
	3cYaAA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5h858-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:19:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso994199a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 21:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775103541; x=1775708341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bqgz4J2kZRGzsd8djgWHGW7grHzpbqQpKF5+hFiPBos=;
        b=RirmtoNa9Hle399ppZ9reKOkJfgn0WXn1a5biSuJG/30bJS6ND6b/u8t+i8Fnr1Wpp
         y4rvuoAuU3nvVvsPPNjjz8c80u57GZ3U5kNBdZJ+U7K9SoBJ1NDLVvWdwvICLT+JqNHt
         HNeLJKo85zJ21V6tZLB174vDo2EqrqbyU2eeldGcclx2xEtcl/a1bOPo8hATJLTYY3H5
         32Ez/ZVEMwr6P2EBa+B2oeRLXJE6EBXnqOvL3INCdxGrldjqkioLTf7HQyMZqOFAXOUd
         8Xa2xaMYxX1P/bU1ya/Q5D0ycQQNuLQidUXSgze8q8TXYKtanafqiVLKKNoJ/eJhAGIN
         XHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775103541; x=1775708341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bqgz4J2kZRGzsd8djgWHGW7grHzpbqQpKF5+hFiPBos=;
        b=o0n/H61JVmTmjh8cSC2EswO00HoEo2boLFz+HQNZGGyoZmLRG5c4UHjPHBj/y6sNOW
         uZc+a6NTsLq1kjhlkLt85UEMSqC2pKc5JhdcfQPz/SX/nKOUJDOncklnY34ewQeh9Yvw
         eF1TX+Mon0MmbbTqXeAZmzpi0G4dUpasYFmUAsTshyBXP40c3gyDi4JGBqF7WNqy+GOy
         St6wBWxYC8SVTx+SFbzP2Ql10YVRVilWV2ahCjOXr08Nn+nX4kAAz+2CLldUXG98DPwq
         D9ktlMEbJFjzcBM0TeS+AZko2tI+kLlfIg/Z2lXY4hkuwOv8FQuU9cZmfHamMyrEVdN7
         BQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCXysTiCDYce6Q8EnjHcCattN8chvE/6P6lIxuv34t2cKqsMxmKAgrb5wN32+97crIt3um5nqv0xPv9Q0OTm@vger.kernel.org
X-Gm-Message-State: AOJu0YwI85hJcuxfoSuPhqAvIgD9/qMdd6ASLdKeXgAoXOoTySt65h7Z
	bLtFLwVXQW0HadkXZXOk+EUA2U+H1GiFMSD2cL/WDQ0ItFhm5opzM8DT5dDQ7FwNCncN7lSX6/x
	ZG08m/HlQUcFbo6QTG/czGww66s0ouMWZJKkVbtgK+t+h1X3S3XtD+xIzoHLJVHXZ4/2R
X-Gm-Gg: ATEYQzwc+P9OANWUAbCxGgEpcFjQ2itMgljdsQkdBMlLD9YAh7ojPhj1GE7NuVMsuth
	OHxQHBM6HyswNBn/h/gaoAgkyOpvhgKN9FSgvu3aH5lpS+mrilRmULXflpn7iHIXUz1W7ilyO/n
	NKE1KPZbcrFqmS/LjZyzCU1v9OmruNU6jruGrZIlsfSQ0XoQkkOQ72uqX3IwUV2MiV4tl+96vQL
	fbkApGrtt/PXD3uiSK3sHS3Q1exJjT7e37sbzh08t43u5PBX98v0mCg3Tmh6IAk9/NDDkl0REjn
	RU+GSIzLgS7d4U9fTPi9uN6KsrkId0bqSV0ng8mcywga20ZGPepJbE97ibdxlauvunf7zu+2WMx
	1LxxJYSRVIEzXDockkDhkvyenGIhL9o80n1QsFjg1hIW5vtwcJHigH4Gd74HRmwqeGzgZbtAQ8S
	7BNinhzzs1Gqb5Tg==
X-Received: by 2002:a17:90b:28ce:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35dc70192b6mr5926727a91.27.1775103541104;
        Wed, 01 Apr 2026 21:19:01 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35dc70192b6mr5926694a91.27.1775103540587;
        Wed, 01 Apr 2026 21:19:00 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9377b7sm8548259a91.10.2026.04.01.21.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 21:19:00 -0700 (PDT)
Message-ID: <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:18:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
 <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69cdee36 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0XuG8Arr-fMTETogzHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: l1Q6YZPKtKw5vDvwCqiam8TdtC2wk-St
X-Proofpoint-ORIG-GUID: l1Q6YZPKtKw5vDvwCqiam8TdtC2wk-St
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzNCBTYWx0ZWRfX5oaLlpECMivS
 mTTsyQM4jDPsimyvmekGYp4XDpCKun7hY2g60Ci05/DzkZmP6qpDIY0RZEGCNY3Uork+/9+Eamh
 EQfnQz7Tv8jnhy967ojniHelJgE3yyMy0QM9ZChcitmzj7o25wxlnk/R3ZlgFSr3y6KSzRbSq+M
 WnnvCTMpML98iSHYsSBoHN9LOkQ/AZPsZdUfcPzpcUmWoFMsBbJr2SB4SZUnQiW3Tex1UowlHb+
 CBEvWWdI2KM+FyKnG6Az0i+8g5hj1a9gmBfnqpKfHEeF0DORekOG2y0mtK1hGPl3OXg+P1iIHIu
 7+mp18bfd3ZLEPy9q+HGpNPvc3/QZoImAPpHpKyzD/RaDw9zaVCFGpaOSyCleIK13UlqjCpSMES
 XMoM3Viw4AO+wvzm9DUudiA5b5GtcBt4AZKnQgdh/b0JfGeLNw3gYs5d9YgX5LVAJVFKitG8GA4
 yGtQPcuciXEGx2ZlfJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020034
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101419-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3681383843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/1/2026 7:22 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
>> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
>> the definition of the channel status register bit fields. Add support
>> to handle this difference.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 60 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>> index 69f8d456324a..deeaa39bb647 100644
>> --- a/drivers/spmi/spmi-pmic-arb.c
>> +++ b/drivers/spmi/spmi-pmic-arb.c
>> @@ -28,6 +28,7 @@
>>   #define PMIC_ARB_VERSION_V5_MIN		0x50000000
>>   #define PMIC_ARB_VERSION_V7_MIN		0x70000000
>>   #define PMIC_ARB_VERSION_V8_MIN		0x80000000
>> +#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
>>   #define PMIC_ARB_INT_EN			0x0004
>>   
>>   #define PMIC_ARB_FEATURES		0x0004
>> @@ -63,11 +64,34 @@
>>   #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
>>   
>>   /* Channel Status fields */
>> -enum pmic_arb_chnl_status {
>> -	PMIC_ARB_STATUS_DONE	= BIT(0),
>> -	PMIC_ARB_STATUS_FAILURE	= BIT(1),
>> -	PMIC_ARB_STATUS_DENIED	= BIT(2),
>> -	PMIC_ARB_STATUS_DROPPED	= BIT(3),
>> +struct pmic_arb_chnl_status_mask {
>> +	u8	done;
>> +	u8	failure;
>> +	u8	crc;
>> +	u8	parity;
>> +	u8	nack;
>> +	u8	denied;
>> +	u8	dropped;
>> +};
>> +
>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
>> +	.done		= BIT(0),
>> +	.failure	= BIT(1),
>> +	.crc		= 0,
>> +	.parity		= 0,
>> +	.nack		= 0,
>> +	.denied		= BIT(2),
>> +	.dropped	= BIT(3),
>> +};
>> +
>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 = {
>> +	.done		= BIT(0),
>> +	.failure	= BIT(1),
>> +	.crc		= BIT(2),
>> +	.parity		= BIT(3),
>> +	.nack		= BIT(4),
>> +	.denied		= BIT(5),
>> +	.dropped	= BIT(6),
> Would it be better to extract generation-specific callback to decode the
> error rather than defining the list of masks?

Are you proposing to add a callback in pmic_arb_ver_ops, like 
'*check_chnl_status', and create separate implementations for PMIC 
arbiter versions before and after v8.5?

This approach would add more extensive code changes with some code 
duplication, especially for handling common error bits shared across all 
versions—even if they only print error messages and return an error 
code. Is that a concern?

Fenglin

