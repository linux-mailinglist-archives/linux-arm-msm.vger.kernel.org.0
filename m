Return-Path: <linux-arm-msm+bounces-91026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBsZFf0Memlo2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:19:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814BA2068
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 14:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B38303CC2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E4D352C4D;
	Wed, 28 Jan 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGgSAA4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKEMUR5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641F352C3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606353; cv=none; b=I+Mu4qNGyIcmpbP7+7w95zxGF/kM0NzfsLATNXlhddYkqvQ7Q0O9PP8GIM8CdJVCmH9bQjWQKt9GDahQo06YcVjux5UsIherITlsSvXtLaLES/ZLJqZqCgWb9N0+HeuZt6m1rPbuWnfyNRbgYNdeg+cPHR9THVN1WclEnV/fNLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606353; c=relaxed/simple;
	bh=QO2pAI/Vv2Z6kufeJJdU9NeV/PumRQ6m5o1iD6ZX3w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcGfG6udQKeIvC55hSejVKLHEb9P/t5XMU4HAezKF2LhzFp6om+I9ycBjMFIAzMV94Y8GJ0ixxgeQFePAYf19jXgrM4RyLNQ+/z1smHEB6+5FXDW02YHUrYpUy+xXQd3Uhq3stAyz60u8eFUDy+9kNR6wu7DF43MyzPZ9AuAXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGgSAA4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKEMUR5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S929iq320354
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rH4qQKPHxV6KC04uNpQ1ZaSsZ/qpSvcg6cesfcYHkJ4=; b=OGgSAA4zBK+NYdt0
	5NnU4WgKszPY9JgVJQVqxOx+7YnE7AI4Wg4UdERTYVm++EjpPeFL2Jhg2gmr0nrm
	XtAEW2eKnoRfXTXrcFqK7u7lSDwwnWTPNnbsiFNFlDQ3J6yErkk0XD/n0xX0bXye
	mAdcVck415SkmpoaQDs60TB/O6pMT3VNlFz4TNATgRZ8ozC2RL1ZF3vNiPHXMyI+
	qd6XeW7iAtA0NSeEjwJcnvkR38WViayAyAZvgIy9jaLSfk+Nia2BBPykn3r1R6yY
	SsWiRNaie0afk0idFBQzABuWQbML8goOx4yTzr/QQ/rCxMx4fwfC6n72OREw203Q
	kMMdtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjtvqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 13:19:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b48c08deso202465585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769606349; x=1770211149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rH4qQKPHxV6KC04uNpQ1ZaSsZ/qpSvcg6cesfcYHkJ4=;
        b=CKEMUR5T4j9NZeUNCeEb66WrQhLNtYfLygT7XbjWDnp9Uvn4AaDfmA53R401bHADLK
         FfKsmdO2Gr7yZ99Kgk5kca8fQbGIrsOtHmk+ZKbw9U6vNro6ShBkA1nDm7h4Nxlge8Iq
         JW2xpaYto6WFFPN1v8WH15U+MKXhm0ZWuI3lRydDwe3gRXemRp+DY/dCINwvWq1Lnqe8
         Tgr70v+mTqH9ToldCjUhzjCPSZRMkhy+IwURwWSPU9BsLnSaar/nFboKBASCFPT/M8do
         lxj+3dveVcjwF3R1skTvOVCCX8BW/mXty+ri4FotXd3oJb0eu9TqJ4F2hbn7Yslh6qgc
         BWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606349; x=1770211149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rH4qQKPHxV6KC04uNpQ1ZaSsZ/qpSvcg6cesfcYHkJ4=;
        b=FC4vQslXuwBwULjFOqW6weJEL1Bn6RiD887jlkZZ0Ipaifh0FC5bG4Hdl07fDhWAmI
         +Ndd1NqRm0SnAWEOiRMPjS4bQlJ2WvHxNT/k6oywfbRlMD9kuns8/Nig0jP0pjckdDBq
         zrbMJk8kmqGO2kPcENXNNT0836N3QDBgVwa5qOtxOs5XOih3xhLa+FbROOL95QEd0BKs
         Pm7FNVNOJYrtW3kHZafNExY2FnYox6gA5vZ/day4uk5VKA9IP/2NC4J8+KtFsQZJHEXl
         xSF/+7H0MxfCNtTxJilwcgxdi28tR0CTjqAdOPwNFsrCATzw3a/UvxLvqwjARbQuNOuD
         qcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZ4+1BKouC058/WC2AoDpq4Kwl5RUNPWN6f3OVhTjdvVojpAxMYQHuCkVTqOsj+K1UB+uS5U6h159zaOA@vger.kernel.org
X-Gm-Message-State: AOJu0YwfVhyz9t7VKa5CUruWemAMrbrb6vXKrv5a6iAT2WMk7JeE7I3W
	NlUGJ7IUhhdDz8XWNfaD1aQ03iaOt7Uw/8fAZa96QgfzPgj/+2ZN3sjXKdMIfhPvf7TkMhtZdWO
	HZiIZaSkRUZjMt9eFzIpKkUmB2k1zQouBOla0Gu51R1P71gxwjWTtHJxDMDktbNoupErH
X-Gm-Gg: AZuq6aLJCUMwvx0P0POOBrBo+mieS35LfC42JQZfD61zHDF49mBDsQT92hlpZNGGX4k
	f69Gc91+udrU5ul95WEsotWLwTYsXWfmke2RYVDhGmgxZKNk4eFiDi3co++2f9CYr7wM6sCKwXa
	O+sqyuEz2HkLD01SC6psStQWEFtD7XZo576SxY7cPgFkF4QZJv4061sMWJaKb5dkl/CHJcpR5c1
	GuKBIRV9JXewHxzLGwcEGn0m926Tee2/7Ryl5hT1DHbz2XZCv3CpgJmhkOAiFDqH0O48aC4fhY5
	Ka4KYVKlqzrBU8284R1Mq43xZ1bJi7ItPdCJXo85kRI8ZaFAmlGwm5CBYbaIQZb8YQfslzZxtFw
	6p8mC19Xz4xYcCZ/Pwo5VCZMt9nAS2u86dL1WNKOtqrdq8ZMwb+TA/0uvWH2KyOC/jDs=
X-Received: by 2002:a05:620a:46a7:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c71acaa118mr13675385a.1.1769606348490;
        Wed, 28 Jan 2026 05:19:08 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:8c7:eb2:1c3a with SMTP id af79cd13be357-8c71acaa118mr13671385a.1.1769606347969;
        Wed, 28 Jan 2026 05:19:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6besm123842566b.60.2026.01.28.05.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:19:07 -0800 (PST)
Message-ID: <67b0860c-b53e-472e-aeb8-6370ae8ff98c@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 14:19:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: add Acer Swift SFA14-11
To: weifu wu <wwfu06@163.com>, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121112721.2981491-1-wwfu06@163.com>
 <20260121112721.2981491-2-wwfu06@163.com>
 <b3460102-c624-43d3-8cc5-fd2d4b730a9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b3460102-c624-43d3-8cc5-fd2d4b730a9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwOSBTYWx0ZWRfX24CWA+rhgZIj
 O8thOYaNhEFEQKe8I0OOR/gmmYn8Gb7xGDLD0yNggMlfptf3onjKRklW3o8BQnyoU4tCX4qDk04
 42h3kvizNGwUL8Xh2c9Fky+j5VKDzk1osSSVi2tWWDQ1Sn//20/iEGVH/ETdnlLUvfaCc/dsUph
 bAtSWd3AClzYlsXwrXw1CTFMQbuPfwjLPvJocOW1Y+rZ033OifJ8V2pXCIuy10a+scL2Hvw6lIe
 SiN9YdCYHBEbU28/BvyicuhSGd8eV0pq7YiYFYlZqTXJ4NWm+1fE7viROrSxPd1tPCmMYrXsQeR
 hIMxcT9Rwe1AsRDoh4PCnrIBGzVwa1bV790ZmSZV2kgppqw6vKQzEErpP84WzDgds8qYwTv5syY
 STi3Qpg7OLbTXICud38648I58NUmg6ErNQW34VbF845OHQjlMN/txdhweDG9AslThznKNOfiZIu
 IZwSRQzmW6Yt3OXw8vA==
X-Proofpoint-ORIG-GUID: YyzDLfElWP61X2WYF8WA74_5SqXehqym
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=697a0ccd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Byx-y9mGAAAA:8 a=kwJdEQ3qBRiSTqlgakQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YyzDLfElWP61X2WYF8WA74_5SqXehqym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-91026-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[163.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7814BA2068
X-Rspamd-Action: no action

On 1/28/26 12:55 PM, Konrad Dybcio wrote:
> On 1/21/26 12:27 PM, weifu wu wrote:
>> Add DT binding documentation for Acer Swift SFA14-11 laptop based on Qualcomm X1E78100 SoC.
>>
>> This introduces a new compatible string for the Acer Swift SFA14-11 board.
>>
>> dt_binding_check and dtbs_check passed without errors
>>
>> Signed-off-by: weifu wu <wwfu06@163.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index d48c625d3fc4..3de631667701 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1076,6 +1076,7 @@ properties:
>>  
>>        - items:
>>            - enum:
>> +              - acer,swift-sfa14-11
>>                - lenovo,thinkpad-t14s-lcd
>>                - lenovo,thinkpad-t14s-oled
>>            - const: lenovo,thinkpad-t14s
> 
> This needs its own hunk, your patch as-is says:
> 
> "Acer built the Swift SFA14-11 on top of the Lenovo ThinkPad T14s's
> motherboard."
> 
> Which I'm sure isn't true
> 
> Konrad

You replied to me in private. If you want the discussion to
continue, please resend the message to the list, keeping all
the recipients of the thread.

Konrad

