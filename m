Return-Path: <linux-arm-msm+bounces-114247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wCoPNIWwOmqyDwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:12:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3E6B89B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Ucp9UF/E";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BMWlnkT8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114247-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114247-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB49301CCFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB51430F816;
	Tue, 23 Jun 2026 16:11:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CB30DD2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:11:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231100; cv=none; b=EG7sg8IjnVUyRxoyJE+qEeeDVC4oA49o55+wRZwIfe2Os1TTmOi/xd33KrRThPylNO0B0ilihbT6VLwHHjRf+k6Bb8FlwFlbZFMQD9+169thMaryNTQOCA27DVcCIPA1kH78GbYMuSmD7Ex+HuUUu/7faMs0IYBxqi+CeQiRYa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231100; c=relaxed/simple;
	bh=F15rI8raRRwQYsuXkvJxdAImYFQOYUO1jCX9P+4euHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf16kYS0ob6Kq7H9KaPMm73yqmwa47KWz40bMEZVDywZxUVK0nrQpsUG08HdI5oOKlCJcvyKt9IxXT5hyfOKmqZF4QWF1f/JAJLj8LDqwuBszSYqlsXPu5hajImwM1W/j1zWcjU0NAwjzcV1hU6yqo8uRzVXW+NqvG3Kuwlks34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ucp9UF/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMWlnkT8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZ9ZU030860
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWalCLVslZDoTLDQCTyjSJkS10gzwkPB8ybj9bURY90=; b=Ucp9UF/ETlvAr9Mu
	2PMuhoM68GUVa51d/R2sXZipIn2l0dDOkjXSCL0gJeJj60pS/ew4fCsvHIskVJco
	IkLPK5IWmGI4hpA4HjmPT7woR+7BpQhjB8+Fp6K5nnIv3vcWdBsiA/i1QyiPlvZV
	7OrXw8LctvIWw7c2lUeOM/lnkyJlB0krYLRayWUkpVsg0EhfbJ6hqooo2iZd/j4Y
	bOg2MZGAvpmJaOs4mMTzm0Z5FJkKxILFtm8VSaMDnRh7rFDtTF6PxehUPDhtcYFm
	H0hZP3n5437HwrWpgfCaBqGrzObKV032H37vawL7oAV6sqX/dXd2WiIbXwJYApQp
	WdRSqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe69qt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:11:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517796be724so10504331cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231097; x=1782835897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWalCLVslZDoTLDQCTyjSJkS10gzwkPB8ybj9bURY90=;
        b=BMWlnkT8n0jtHq5E+O5QpW7lOhWXD+umzXCDu72MfKYb4YxAxgqc4HqFs6DmwlTlWG
         /RaHAe75v2WuxqVc3LTgTKVcJXizxdF8//XDeUhFrjBI+s/DL3fH/8OW1cc1u3Eb28d2
         rgfB8tJnc2L9O3OApHeXg9Y0i/1kBoZeiG9O6Dd1E3Qj8hBofUTBrPelKvzGWlI2AGPX
         eg8W6+iQBG+T91026IocYSIOydLPXWAzFHwBIFEdCzSAasIPvqj/9s1BA7LpV3+VcWPQ
         ynYSc6dIUYqiBsAMdOkfe6oROAeu8sFAh0Xm9KVfWQj2ZoUx9olGuh+TikzpR7muogTh
         D3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231097; x=1782835897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWalCLVslZDoTLDQCTyjSJkS10gzwkPB8ybj9bURY90=;
        b=dRJstIauxcwDcyz6Zbvspr0LhsPnaLT6wnBAu76d+dHyCw+k1tCdREpBQC/meV3XP8
         Bq4ur0f++GFoZxAurgYVN/cXjVJGmiVbpWLiBGPotPkrEgHmcQioscgUYKowHSHYVQ2U
         gUmT9N1+SZWoDJ7cWPw3wQWho0J0d2GseeXaBG/kW3Wi2JBBGWBKkDXTJ+ol40q7vcCu
         bmDc0LAYvW7O4dnLB5/SxpPQ7ahplLcgevULqZghpGpn9Xvj3p7qIj3NrSAVJDR0Grv6
         fmazruN4UUD1bomCvCLJHvyqxehCLUJr7a5a5QuJROjsPT8V2ZRmA1fZ3an9qYXcCAGt
         l2xw==
X-Forwarded-Encrypted: i=1; AFNElJ+8UQ9I5enXexOouVRP4Ob1LRDNeNYbWHueir2iGU0o5GUGQ78PFAzrgCLWTuydKqYpZ+A7GoX6NfvIKhQ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ZL46/lSuw6I3X5URRqfj5Uoq4zE3mF01L5KL3ozeoymK3cfH
	hosaYQIwMWdhJHTrf2USjhm1X/nxJ2UrwAO/OrY9EtYj/naGgWmJ2CZe9hi1rLSnaabNAFKoois
	DRWLWXpEXcDBbO0b8Q0VstjssgD/KW3xwA9TjG/8VANamf9fn73DVwBPeYnrgGycYrLox
X-Gm-Gg: AfdE7clLFhHpCJIPrI0w0oBxtxPdGXGbefp5q6pF4ZWN2lE+mHpps5SHoX+9CqabfYC
	w8rrBJN8fD4sJFsGdwDvWcoKrmkWTsb0U+LfhlZC4u2Bsk19CkUu6mJyGIPdfgzCYWq/SwRUZ0O
	N2juo9D9uKQ1872OeRKtIEl4jWTwRUXzczzsVLH6/N8Tp/Qdkc4ahNYaULmeMBKv8QnzF+aO/ck
	cgQFSEMtNa0JRdBhOO6kCn7G+MVprnQHJmKZU/wTHJoE0KaEL2ofZkEoVwgxf9075+1/6qBFdVH
	q0rxHtGv7k1ZA0miDtXYnMjzIwaBcZHo2dFZxnJcJWh1INPzc6mJhjx/v2hRZW5RM261JcyYzqp
	sl2/RhDFveQAj4JxvNZf4Byxx7dKkVgQPbhU=
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr56982531cf.7.1782231096764;
        Tue, 23 Jun 2026 09:11:36 -0700 (PDT)
X-Received: by 2002:a05:622a:489:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51a4f502a89mr56982051cf.7.1782231096205;
        Tue, 23 Jun 2026 09:11:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697e9292788sm494756a12.1.2026.06.23.09.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:11:35 -0700 (PDT)
Message-ID: <cad79064-5462-421a-b477-42c3d9729db4@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:11:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Release QMP handle on ICC path
 failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Haoxiang Li <haoxiang_li2024@163.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, djakov@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623132015.2243317-1-haoxiang_li2024@163.com>
 <20260623160132.5rknnudcs7g7haoi@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623160132.5rknnudcs7g7haoi@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7etajagEE8DOZvTfZ_AAu39dnHTU51_X
X-Proofpoint-ORIG-GUID: 7etajagEE8DOZvTfZ_AAu39dnHTU51_X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX+4w1rsXqSr8L
 c0fBCN/az7IFwaebbZa8IGpKtFra0TmSerEVqjNJjiTg4J7kktbtLP6MGpav4iQiUvjQrks/EWy
 gCUjmtw5NV/Y9LyVbD4xtHLLbdc0xKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX0mvoHiGyD362
 hpIZlqk254YnAo98WZQmP5ZVyWchPeGDiDV4qa8CoZKqp57sxGPhsUwIHBY3cZdwkRvApus+kx3
 lISFDLIGho7i+0udqUajLhK3HhrPkG3uH35whl/+k9SBBQkkBzQPIvYdVThHFKj7Td1nVgLGlCN
 UO5Zb32i2uT/LWmIvUyqB6C5EqOomnyUGMG9Q9k1DirHxMtSs76ZX7Q41xG2PaLF2GsHxmk2nvZ
 +UgSbrA/1RaOq0KZIaP8/kfNxhFSsvK+9zOIPhZn7srPhC0KQt2IJIj9WdbWXqs5JFjTb8nP1WY
 e0Adriu9CHhbP5iY3WdcYH/2hc3giqEp6rBDmvLj+A3Qj/pddnV9MiTXQF1qZVZ0ZvK3+WQjVKU
 BFsc4a4DCPUEoS6JLC2TcEy23SZ6fBJqGXB4c7ybJk1qmelti7gOColieTugzvVVHx8ZaksNiDo
 MT0xdMvkUdNH3hWrBeg==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3ab039 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=yyGnx8vvHWscMj4to3wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114247-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:haoxiang_li2024@163.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:djakov@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,163.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69B3E6B89B7

On 6/23/26 6:01 PM, Mukesh Ojha wrote:
> On Tue, Jun 23, 2026 at 09:20:15PM +0800, Haoxiang Li wrote:
>> qcom_q6v5_init() acquires the QMP handle before getting the
>> interconnect path. If devm_of_icc_get() fails, the function
>> returns without releasing the QMP handle, leaking the device
>> reference acquired by qmp_get().
>>
>> Release the QMP handle on the interconnect error path before returning.
>>
>> Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
>> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..b57041a37d28 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -347,9 +347,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  	}
>>  
>>  	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
>> -	if (IS_ERR(q6v5->path))
>> +	if (IS_ERR(q6v5->path)) {
>> +		qmp_put(q6v5->qmp);
>>  		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>>  				     "failed to acquire interconnect path\n");
>> +	}
> 
> I would have preferred to move devm_of_icc_get before qmp_get()

Yeah this saves on cleanup

Konrad

