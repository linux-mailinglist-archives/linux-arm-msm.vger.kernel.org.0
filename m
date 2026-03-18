Return-Path: <linux-arm-msm+bounces-98388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULQhL6l8ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:21:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E702B9D11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B28B43162610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AB135F18E;
	Wed, 18 Mar 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFupPodP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kcr/gPJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE9935CB88
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829066; cv=none; b=ZvH3Sx4IM1Fw4qRuun8StbZvoNX7E1hAa7BLgSF/WL3ngMh0CvFhXyq3rFD0m/5V87WwcjOWEkBQDDJHBQ/GI/tj2A/V0PaB+EcTkNtstxz5dwRa3RGgoJFg7t2fUsQY2kQLRd0lSp3/6DiIIkrNteQ6BGrrhMJtbOAs2OEiYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829066; c=relaxed/simple;
	bh=WVMWFV96lLN3mhMGsMavvwyeXFTf+FZzsoDInWRtO1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phEUJAICJ/Et7UjFURyB7sEp2yMi330Sor6D2Fna/TXdUsOLneOV/VURUqcAkY2ITVabUq6iXG7C9Z6fpj+KmST/2RVQM7XsXnBHEjKMJMSY1ikNY6o6KIsFcGqhaKl7V9TXk/XJ5LQ1zsNQEJLyddtMoc5y+VBXU0UC2djRCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFupPodP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kcr/gPJT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I96XnY2730140
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lh19zQf1t6QnQ+9RnPm7YifRa240Ss9KBngpJ9yjHIs=; b=TFupPodPcmK8Z4G/
	KmU3o8qIVh4ljvrlipTw4wVzUl096VPO3vnS395FZNUMHIMz5TI8EJeyCWGyZ1pY
	RI+TA1y9iw7vdZP2X1dIt4XN/t0PtAxyFcd/2OTH7VP1cjd4kD8IoJ66Mecbv5fu
	kQijeIRPn9PaKx0TlYIP1pVD81LAFhkmXR+vverDwNFLNvlHDu27RKdBiT1s1MSG
	zgzqiNITOiIBeNdweo+antzKpeo1eoWiCLQ0LBTu+cdUTT+3/W3DaQvDtW7ie486
	Qmwece3p+Lk9m7T2wwzN8JJ+fBNqkv6l6E96t7VcbjOjyybGcSe2Nd9aU0H1MOl8
	IGrMKg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvb9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:17:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35842aa350fso43754481a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773829063; x=1774433863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh19zQf1t6QnQ+9RnPm7YifRa240Ss9KBngpJ9yjHIs=;
        b=Kcr/gPJTUAr98ltdgddlWkX00gbb6+YbvpPRoYHfPtbOtrpTEOwTDbut0/XUzx2b1d
         IoEg2yuitJdH7PZYpDIngMNlYetO91BXYYhl0eJkO0QL0mkfdoWTCpNtsDkFdQZPrlZA
         Ts7MweTCBjev331ALK2t4rqFAavJD5C4P6hDXJF+1AebZs7olULgJq1nIQdKfPvN9Pgn
         q2OORAnwiPLCCLxsfdyh8jI2q7qe3KBL7VhiKcqrbFiAxV1C2qHw9j8urimvj3hyJ/4W
         IuoEYHi4AU3JTrXHkNhmcW8Zc6dddGUqYgkKyP44ZqCOefycALtth3l8scZyUtggBuS2
         Qksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773829063; x=1774433863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lh19zQf1t6QnQ+9RnPm7YifRa240Ss9KBngpJ9yjHIs=;
        b=gZTl40dBcN36n0SmxugQ5yPL0WyQuEv7s6LkTskfekP3PFV0/b/R8G6mcCWyVt36ky
         kjaHfIMq172eySSRaYtWDec4rJe5061uk6ZvvbiUPn/nbwRijBHcJ4kzxb/B/ca63Zhb
         PncZKuW5cU25gHIjkBdA7NB/juZguipgO8t8Exj2CS4K2fZTxQQhhRdqbDH3yzO2mwkU
         0Js9hbbLqirfR2xS8JX7aaj8TAZVE9Qa7vMqinffbuv669hz7t33hiGB0bbsTFeGkqc1
         I4dtpwrA4H5rC2o4BGwrgrqaesDSMVvBhXHQCU70PDWopfEesnafCcCa1YZ1d1PPrDVh
         41IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+aKaQ+EmBYqnYXR4C04IzrLnBvjuv30M8Xe1fL0NPUgopBa+YKAFl+/2Wo9AZb1buN+fMyB8wRS0u+Mkm@vger.kernel.org
X-Gm-Message-State: AOJu0YzTadqS7+e2gy3PNxTSVdz5T8HPOvm0hKHktI38WPSZM/Clb++4
	o8Opz0EjmlsE4q7B9jyPzgac1tVZl276uQJoHia/eHfxihtSOHrACdtZfV70AwMUGgcJBvOLAyg
	icCnyteq9R4ML9b2cOvBR51vpi1nCcfK1tW3ht8/tZlygTA5hS3PFRYGQ8/16AgFaU6eR
X-Gm-Gg: ATEYQzyB/oUyeEGCUcSpcPefr6sIN3AckupT0RAa2gCtGHBxFAavhSW3t+DGfqPUaOd
	rOgZAb/s+7roDmoD+LKRhCtucJOAScTf5Ea1YwhThTg5ICifSs3AmJQNurvGuHJOVK+ZZ54MBAF
	83a7yYO5IRo8lBtGcO3sWzjIXXTQ+4eWrkoScTLJOHMybhlNJOYcXe1YWnzcpwFgYuYxBmhoJtY
	p4hvuIzq57F5gh3tobeRQVXkxDFGA3z4mKx3XdbKWl5ZNBKSXfml3BQ2d/hdDWZGQfLmeTsWIh4
	ZAiH9q6vmiPkALy/zVGTFL9XmuwP+oUAg0gI9mTEx8FCaJBKjUur+UkjhVCB13uHMzlLi/3jGEJ
	haVd4bEagnJO/SJqv2AkanfezkNAdceQLLOoyUzrNeswnBjozcrs=
X-Received: by 2002:a17:90b:3f83:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-35bb9f0e2abmr2329322a91.21.1773829062689;
        Wed, 18 Mar 2026 03:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:3f83:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-35bb9f0e2abmr2329299a91.21.1773829062143;
        Wed, 18 Mar 2026 03:17:42 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badc0bc30sm6777551a91.17.2026.03.18.03.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:17:41 -0700 (PDT)
Message-ID: <3922012f-25e6-4b75-9183-f9277ef5d040@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:47:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
 <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
 <95142608-b5b1-43a4-b8b6-38e658275f30@kernel.org>
 <abhgxF1RcAJD-cK9@mai.linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <abhgxF1RcAJD-cK9@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4NiBTYWx0ZWRfX2ulmvZJBdxGb
 PvezIjuM1cZyBiMvEoyaTwp7yJWegG9C9RmxyWCpH3gzwQUpEgLvoiZwGmSeoM5n0UJOMKPj3D7
 OsLheYryVdldUVIzLTJbnkGzkr7prMpkxO6FH3UN2tw2AQdd81J79AZ8JQEeIGIwDy3Uy1e7nd/
 ZGzgtc5ebQGmGK/T2QVNv9Kdk4LCI0PA7mTGzDnc7b+ManXgeKPDpssFhr0Zg8n/LsEXVULDg7X
 /9U+Q5OO3hpDoeZeQiopYnCDqsujx1dSQcpDyVMD8Ph5vjkdEDc3MAQKybgaUuX92mfBRLeIFge
 rmfqnfAgYie26ScOVDFcriOAreHmLxHWkKD88OwcdAl2OZio4jCuNwD/RVKFMXb9dY49ApIWeYv
 5d4qi8jCbdMsGAM02LjQBGhyvLwzZ5ieoCrWi9fkTGsXoXxExkX//r6Up4ljx/R3UFF5lsrmBKg
 yoyLU7q/YccdDtPKADw==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba7bc7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JAm05eNYhmkk8n95b_IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: CoxNcFwEQqvzphpW7GULxSzlFyYILMey
X-Proofpoint-GUID: CoxNcFwEQqvzphpW7GULxSzlFyYILMey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98388-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41E702B9D11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 1:27 AM, Daniel Lezcano wrote:
> On Tue, Feb 24, 2026 at 01:17:22PM +0100, Krzysztof Kozlowski wrote:
>> On 24/02/2026 13:09, Gaurav Kohli wrote:
> 
> [ ... ]
> 
>>>>> As a result, each core requires its own cooling device, which must be
>>>>> linked to its TSENS thermal zone. Because of this, we introduced
>>>>> multiple child nodes—one for each cooling device.
>>>>
>>>> So you have one device with cooling cells=1+2, no?
>>>>
>>>
>>> This will be a bigger framework change which is not supported, i can see
>>
>> I don't think that changing open source frameworks is "not supported". I
>> am pretty sure that changing is not only supported, but actually desired.
> 
> Yes, IMO it could make sense. There are the thermal zones with phandle
> to a sensor and a sensor id. We can have the same with a phandle to a
> cooling device and a cooling device id.
> 
> (... or several ids because the thermal sensor can also have multiple
> ids ?)
> 
> May be an array of names corresponding to the TMD names at the 'id'
> position ?
> 

I am using dt node like below to use with cooling-cells = <3> approach, 
will post new patches with that.

cdsp_tmd: cdsp-tmd {
	compatible = "qcom,qmi-cooling-cdsp";
	tmd-names = "cdsp_sw", "cdsp_hw";
	#cooling-cells = <3>;
};

please let me know, if you are expecting something like this only.

thanks
Gaurav


