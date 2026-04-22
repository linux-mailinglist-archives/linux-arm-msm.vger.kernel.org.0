Return-Path: <linux-arm-msm+bounces-104068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMinGIik6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:35:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFD444C7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2493A306FC1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027C5364023;
	Wed, 22 Apr 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVMv3m59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaE1pbCi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22BC3B2FD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853968; cv=none; b=Et5OrAesUdf1+TmEbQbf+wUV6whUo/oKUpbTId46RWcMCfrCE81+k7Tpyq+dDbFKifvrBorFCe7ACowJQSVDFPYqoqOVSH5iwuxIK1rvtPRc1z/g93PMUwK3n+2CmZq1nnaTX7wtYq+u4WuhnB0PBVcuVNRIdSZvLFR/1zVq/T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853968; c=relaxed/simple;
	bh=rIFfrXsNqItade2pDyhej3CucOfiOYuuR3y4hDhrMAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OapsiCspY2rq7MJ+8s9bwI3OvVm77DnaHRhtxrQBPeK9om53wpuUNSwnCo5TjCna6+Vo4Paovsedqb0LXDLMIeed0cz+JZx9wHFjoSyNFby8Fnofv/n+BERzxknn1cKtRgMwbWmbkege/a1BWLYH/1UMmb6eEMDhjdpSkaByGgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVMv3m59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaE1pbCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5YQj02123517
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XS8rWs2PV+b0Pwye+4y9eJeB+rJFDeOBFQOuGjsERsU=; b=dVMv3m59G9nSMnzg
	U6TzqNDpje0grW0dIFlVs/6Gyjp8HD0p48T/KkOTkfy+/eSrATna9LM0Igwrw3Pw
	Kf7JtaZme86UtaEkuqfKVLjOyTZMG4Cw9DwiFVIRa3qZpAeQza8hJpb+p5pt9GZJ
	JwdJZuN/FYEELGL9L6bv+NRiTO5eSZOjhKIqr62zQb8CrolwhQ4jgvIMPcode9JM
	ti69nuse04NiAK69GqLS6fZ8HURXAZsvvk6jz2j5mvGCH+g61/GPin8mUhIwblEo
	CEqiKlwWEg/ZsYL0kALBxPRMdvZnTT05WEh0gWO4Wvk+GtoDke4AUtGnYNH1ljo8
	YPvSTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfty90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:32:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2366599b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853965; x=1777458765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS8rWs2PV+b0Pwye+4y9eJeB+rJFDeOBFQOuGjsERsU=;
        b=AaE1pbCiU8EDC4GKBqoxzgezdnv1kdjvNKqSnqNNG2ibwsS7hsmX9EWFPat0JKcyDo
         GDxKzUppsf7IHnZQU/eA2uW2KQrBkqoN9je+wqk6OehKSwU+q7d3PymreLiHt4JUQlQm
         ttzx7ywSmXWGhUVDc3SHWk0F5liZYNj2tdTYOhJYQl+IGO5PfA9FyEo4TjB7iasIlEmI
         y3ZbIix9AMXfNapoy7mr8KDt2jWPHNSUsReqChgKD5ds1e7b6ZZAR01BhOxTkMQaOJhx
         o9XZ5JdZrl/Eas3wv8V6kIz10i6Pc7odzQk/+oIvpsRU2LUlFbEJaJZ+AuigifXRAO2E
         Vhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853965; x=1777458765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS8rWs2PV+b0Pwye+4y9eJeB+rJFDeOBFQOuGjsERsU=;
        b=idg7D8K7WKECgb5liPE3Cz0MbVf4V0/qJ/eTSTjd9b9d3wmEL8lzpZwn7+q1S2be2P
         c/71t+oJ1pgFJHEjI9rLddp15tftXcKIqBbzQ4SXBbzS3RhiEdqx5yRQeP7CsXu4V3k5
         ocqVU33u9nXbSWnky+JMFD7r0mbke5b/b7LS2MdME2C1+z9Sx6dchzXnLu18vlZKklmA
         oWDTI7M8HO1u/ADs61vh13/G21EnUsOBWbXhbv24EBzm+Ai3jePJ9XWVZS0uSLxt4+2m
         jrsK6pCiiyuI1wCM8RDU5hiug7EStRoVD39VJnXY2Bt0ONDjGBnFx5FNfiQ/cd3iYPdm
         S5xQ==
X-Gm-Message-State: AOJu0YxA0ejN8Ogdf52IiYTMW4sdu9K7oJ4Z/vARwHLzi1Jm8nmvjrJu
	F4Yqc5HpAMUKPM4ixmSMPMc2+6ct0QjrIiEhWZ1NTnA0vWUOyOGm+6B+ZfQkaObZtfimMgdioGO
	tPR0FNMnFpmOY2l6apQtG4oAoysFUNRGDmtW2zdqlMR2Iw9w4mby3U17bHOTk7i+z+F9F
X-Gm-Gg: AeBDiev0aVPYL9gQXUALxbhM3QjTX/e5ltEpe+TTpAmZewG3jv6cCJM5DaJDAu9QvhT
	8xuGTxuGv5uU52dJZu6fhJ4q75sP8JgY4MliLK/6P8Gi4YKbmqZbo91RuqmmSiZdctp9BW8caic
	ayLqyhLqrbLu20FSnQdXwfnFQhtdUPAhCwkFjfeP8XOTetwzQ05Bjjvbh/TRSpDUji6HC7+fuGn
	BdLXNlfJZSqNYbKTJKn64I66Y6K3F4wizzQis1V8TrziCGJVARjfFSLOVJDGCyOATti5NvEgVi+
	ECKkrB3+NXQDzPSuFs4NEbcQlwhtQ5tkfOLwei+9Su3h3XkHfMYu9Ge2L/ohhWfj7SviIYeGkl1
	bc1PXyG6cKYT6uB6+g2y5VkoeUf8VTjdczklvTbQnM0s01mXnSd/ZCH4t59lN
X-Received: by 2002:a05:6a00:14c2:b0:81f:4e6a:7276 with SMTP id d2e1a72fcca58-82f8c856e48mr22036479b3a.14.1776853965252;
        Wed, 22 Apr 2026 03:32:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c2:b0:81f:4e6a:7276 with SMTP id d2e1a72fcca58-82f8c856e48mr22036453b3a.14.1776853964794;
        Wed, 22 Apr 2026 03:32:44 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981829sm20345091b3a.12.2026.04.22.03.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:32:44 -0700 (PDT)
Message-ID: <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:02:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8a3cd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=SFoN1qW29ypxsV0XCrEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: e6kAIZ2izTyc5IH5iYNaDltfsLpf-Z6K
X-Proofpoint-GUID: e6kAIZ2izTyc5IH5iYNaDltfsLpf-Z6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMCBTYWx0ZWRfX5r1dJtujv6iK
 gqDpORhbM1yyxBci/f9QS09WAlI2nQV6IPa2NMHqyAE+IbixOu5h4ucTlSJAUEEJTR/pBAx3vaD
 h8Z2FNOEHGX8Lgq+GH2Ocl1V+cDSxTO8V2iWlW05reEOK87g94II6pYX/n8gFUHClaq7kySKGas
 qCWfzlpUOq6k9KWde6QwZzoyNbTrUvqHQI87albyxXDWRu1FTAfAIogLKQ/E8prl8zAn0I0Qnd/
 bMe1o6cI+KJUw2tjG9Z4KtCxWZQyH+J6IusaENiL2t4SPvrHhxkZVPuwTbLy3YwSn91UrDpbYYT
 DADaGyiyZvSdtQMvRkf5xnTUPDwiLAkGqvHxXwrOrqZeVyHft51TjlOoLvQ1YGGVf1GdqyA3hAW
 WIL5vKl2O8Vz2zr2rXwt+NN5M+x52QIhCWCipXFUdLfsrirumDwD81tPYDljMNT3YOczBCf9169
 1CSUd6UwGgxNnbVpsyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220100
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104068-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prashanth.k@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7CFD444C7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
> On 4/22/26 11:39 AM, Prashanth K wrote:
>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>> super-speed enumeration on that port.
>>
>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>> Cc: stable@vger.kernel.org
> 
> This is a feature addition, not a fix
> 
> [...]
> 
Sure.
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				retimer_ss0_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				retimer_ss0_ss_in: endpoint {
>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>> +				};
>> +			};
>> +
> 
> Stray \n, but you should really have a @2 port here as well.
> 
> Konrad
Can we ad port@2 and leave it empty?

Regards,
Prashanth K

