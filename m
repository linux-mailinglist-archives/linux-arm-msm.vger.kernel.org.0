Return-Path: <linux-arm-msm+bounces-110247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFCrDftoGWpMwQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:22:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A24600BC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E72B303352C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971BD3B5318;
	Fri, 29 May 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIqgbXkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaOoDM4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48D93BCD00
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049855; cv=none; b=JYNT/5Mt77kXEiXjkAanbRH4rCHU6OdjJMPMQKd651M4lAYhqXH8Ifq7oyAnf4EodefcrxX3NmBRtt10AubhGAabhxDCfI9YewdMouTxcxTJdOrllH9obT5Wa4B+NGe3qmlaqzwEc77EL/JoJ7ey+9rn4UvkzF/AulWtTnXh80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049855; c=relaxed/simple;
	bh=wsTTRuHUZyUK2eHffcCelXOtF0Eanqo2UbgT/sM+3MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASReC316kWAhFJJBvhY3fm03Xw9bYpqVXYobdhTNA0IPy8MjTERvjJoO2mp/NtzpYYuFZRqtaWv3uPmi6zcWjzpM679HaCeVi3qLPZM8/t90wc+WVJi8EtOLyjFP20Lo9W7XlxyniD56lWs2gvUTZDPYHBx2CuT5JDSYUA8magY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIqgbXkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaOoDM4c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7Uslw2247805
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlFPCdtZLGigc27wlhIiQC/YA2l7/69jHdSprQoVZBw=; b=BIqgbXkg22cpNPPU
	1pY0M8VNRN7Oh/5UUY+KY4rDi0rHJ5zM3AhUWS0ilyFhJVAKwzFCwikg54MO0lA1
	ZZwErYVBCuXb2AVwZx8i4j9Ff8B7Li56H4/0kVW0y5y9o6Ei+MBSzhQryga4CZba
	mqi80RoAbOYQLgOnyVtnU4xSFf6NZBZDbcblS2PjDw0yprxYs9JaSa+TNFA9RWCe
	0b5BhqB4JJhVQPRo3EMgUZnSUfeb0/gUUHFeFqtcwxVFGjjQ4dcPTA0X1DvS6OX9
	tJ2x4ztc7kyLEvWtTtJSMkMw/gTtlKloitSvx2D4Vvr1hjPFnYkzE3lHT0wmwvB0
	Fb8lrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety53hcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:17:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-841f09a96ecso1320695b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780049845; x=1780654645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlFPCdtZLGigc27wlhIiQC/YA2l7/69jHdSprQoVZBw=;
        b=EaOoDM4cIm/Nwax77CEjPXaXRTNolksC2fmv1EZefd0mmUGBoWEq4+X3nCfqfgpjvH
         KWgL3hklRSOX80C5an1AA1FtuC1u9hQ1IG7tNDtHCRBLUuG4x7P65a004gLCaJLdthGA
         Zh/OfT6CZ0RSz2yuIQbpEhRidcWnijwb9KQoXZ1v1r944P+/ybMWxvNOHrX7sJjWctVb
         dg4RnZIN525RykBzwj9xSiz4Rut7w037m4V/s3skOGeVoyQe/dK0O/i8mNZJbE5vUia3
         6wNXp7JqyGpa+Z3D7+R05VMAOb3WZwwbMj9RC2R7Fpib2s+2Xidd2Vq7FNovTxKkwkxS
         VP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049845; x=1780654645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlFPCdtZLGigc27wlhIiQC/YA2l7/69jHdSprQoVZBw=;
        b=qybnuqlRibWu6HQijkN4safIPe9nLS7p5frFEduU6X/mAgsFyQDUZWCOslU/WMijja
         MFvlccrfWm3LzIEwdosHyNMI+gCYr/g8cbfRdr5hbUqSOX+XoLP6na07hrztecGRy/r+
         Q7YVkZM93kstfHI+ZE53GINzn/J7R5oXQvip66eoJkIhrAqe74++0ZuZzj/s51o1QoeN
         uL9vADhgA3FIPxIIaYo7QoUixjtoS1P7Pcw5fDtImMWZE37EV7eteWKuSmkXb4ARtdbv
         S9KjEZe9l8xvlHRwXitJcKEJWdkjtVxiMaChufWH8mG7ChlLvEpQ2oglNeiaDQzcT2UE
         /mBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W2OYuuEZm9V/wumojOt3+hVVau8z3xj2uHuDgrX0IiHKJtwmfsP/oqFL503UCdlAlswuLuoXLB6zkR18z@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvQr3j1EzTGIb4amYJZUeWfaSK0qL3vMVGUMVcvZL7rd7xB8R
	1cTnCPlLlQkojG5/3p4MmhUDtzwanHOaRRCd/ctEZfqii3zeu5F3wGK4O3aiZhOzjqCKy1MeLfR
	j8jx3Dcf7uLIqYlWWYD4D5xRoHStLBkL7ww8BYmTtQA7hpZW+ji4OrgJKJEc/0zdOKkM9
X-Gm-Gg: Acq92OH4zzPBpm/e+Hd4QqclHPWwjJ4P53U7WZ4yrAEI8FMkcdVRj3NaK0QtjlhHt9f
	Nksjj/1S7FAIEkHox26xHM6NoyEC3RlhKs2re6rPC9dM3nZVpL1Hn6cdiooGw84EL8NDFYgFfUF
	g2F1d05mSAiDSQglgQ3tPd0g7r5vhWf1E/mzwTAOjwQpL1oCXoTny/n3QmuPyK7Id7rT2U34LTt
	fRDjP3RtIFaRSGv4MGw3RFsQ58zcUHu1KekY21BWeoi/xRnnRgapQsIbL/FUJexvQiFtlK8gb44
	T8+pLAJG9RiduGp7G2FpwhdnimsqIHVTw63PmTzh3GVe7NH56a8HmNLa3cFzvyTxkac4voAotle
	uQ4rpNW1fhHjdkesYTkgQYngvIsOyNzJLROBiTakXqxnc5bjz3pzUyMtWI84=
X-Received: by 2002:a05:6a00:3690:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-84212d35431mr2340234b3a.29.1780049845188;
        Fri, 29 May 2026 03:17:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:3690:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-84212d35431mr2340201b3a.29.1780049844647;
        Fri, 29 May 2026 03:17:24 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b307acsm1440342b3a.21.2026.05.29.03.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:17:24 -0700 (PDT)
Message-ID: <63794650-69d4-4ebd-91c4-89bce022c772@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:47:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP
 and MPSS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
 <xq6vkeer7c32fmmofhu3yxnwxns4mn7umzwjf6k575m55s5mek@zrjiuo3eiq37>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <xq6vkeer7c32fmmofhu3yxnwxns4mn7umzwjf6k575m55s5mek@zrjiuo3eiq37>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwMiBTYWx0ZWRfX9HMR1lLxKgN2
 fSekN41+qFizxXkyAi+P7B4Dv0Pul1PwCipiR2hA/x6sjLg6SUW527xrCqL4vcQu8Zl9BID6s8y
 IIPZMvWAavUHhR2kavYsBuGDRiSLvSSz37sig8syfQSCw+sQ5z+oMzpH+wrqgi/hNAli74DBkxP
 HZ28PTLt3MvNYleKFNeBjiuFaMGF5B7b6LuE18Mq0yIAsJNWPLdgxOa3vlUQLoJtPHIaNB8HMFg
 HXhbGhoS172TVPSInK+OBN/+j3+qGstJiW1jNRfkBFa4I9zGzrt9voqqRnumn3cbJs2zL61Pwf7
 uR7h7yQ/8kpcAAMaOfYPZYlw8r5Ct3mds0px22CKrYGgS/RAfdCw2d+8PmaWKK2OjMUkJe86VJt
 jv9EPPYMZHHHdQtf+OupgIj/eJj0pfhsp+NlGsRdHIa4oQ/vsioDM3Taf9i4vCtjhuPeLgwfKmW
 ylm5XmlcDXGgaR3++6w==
X-Proofpoint-GUID: hxRNH7R2CIfoy7V3B-auCCUL2SnYIxB8
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a1967ba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=S9tZMReaGwYLiO49R74A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: hxRNH7R2CIfoy7V3B-auCCUL2SnYIxB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110247-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5A24600BC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/2026 2:59 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 01:19:14AM +0530, Komal Bajaj wrote:
>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>
>> Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM EVK board.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c..b112b21b1d79 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,25 @@ chosen {
>>   	};
>>   };
>>   
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/shikra/cdsp.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_lpaicp {
>> +	firmware-name = "qcom/shikra/lpaicp.mbn",
>> +			"qcom/shikra/lpaicp_dtb.mbn";
> When can we expect modem and LPAICP firmware in linux-firmware?

It is anticipated to be updated in linux-firmware within next three weeks.

Thanks
Komal

>
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_mpss {
>> +	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>>
>> -- 
>> 2.34.1
>>


