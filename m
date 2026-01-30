Return-Path: <linux-arm-msm+bounces-91299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDPqGZGefGkLOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:05:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C561BA528
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0763006B11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D04336CE05;
	Fri, 30 Jan 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Im70CB4y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsKeXlXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467933B96E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774731; cv=none; b=jJd0NaoVSuYQw3ewnZ/AUUm3eQNygXEZlz2qj93oVkgLwmB2eHArQBsMgxR50WvoY4PeeSAnJS4CJo+wWG+ORevetPibh6C4GGppdnDKjSYx0rg+Nt2HkcqEnzODQDEasms37yXbo5aZj4Gk9qBEqbrVJh1lp3OlYsd9EnN5YSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774731; c=relaxed/simple;
	bh=aFC0zeyoW5t5zvTuMz9rGwaCcw9cyjn7qR7jI7+2euc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulDMiRKx6juFF9dArNpzshjFtf9FKBasNEnTf2XJ6nrjK5GOLx0VLmeA9/V/3Sa5BOlZB9wj0OlapY6jkCQb7YSmvUTIUc/fj2lYLTffcS8seZJ+KVlE38PsTllW6SWBKkxTkcdvc8WNa5HUqPxpACnoxh8P3IIpATP5XdxitJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Im70CB4y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsKeXlXm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAPwmZ1022110
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJZ5UjJQNNupcjkDwCIMciIXXm9F7RB7VuIIvWO2KnU=; b=Im70CB4yRaEL9v9N
	FGrL6W7SgVEDc4q52HBfrqTR75hqdrlKzXlFDjICf+Bk2quEvgABuiiSsG058Aam
	1RubjQ8pK8Es+V2/SeQjH7W/lnHc6AzOJCSWJyt9B5hSSd5j8pYw1Oil9ErNshVJ
	XuLaFXcSnZx7exXoAtdE4VQyNUhFPdL7ZqdkO6J1K2DbxXEemWd0xA3xZe7N3Ai3
	jgaEIf1PiKY5uJD+Sas82yIX42x6cfOVd82sDXbYJKoC5diMf/cqMNai3qzIYhm8
	JKYSCUZgww6YUYyyMfqFi/lzRYn7UDvqggdtjnwNmtlD/GdzRKCwlJz1Ky7xCXjY
	KztCtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3kaff5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:05:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so39616785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769774729; x=1770379529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJZ5UjJQNNupcjkDwCIMciIXXm9F7RB7VuIIvWO2KnU=;
        b=QsKeXlXmS1R7+3ZdU9GpumAAdWSLH0n496f0a9V8AiN5f08FMYpl8AKUMft25hf5aQ
         4QVZvVdTG3jClqn0LP4G5RSCc4Ef3DeM76tX6zCHz323+EybCRSK3X90T50wFqC/QvBa
         beFaKHH9jg9z7uxSy8IrVJDOhIIb5GC9MNPfy83BWN/Z7x75c5pOmb3bjiQ/HPOAT8IC
         OyCysDFj8XSrekaQiHyfxjIg1NStvAhsCkXWLCDcnY55HE/oN9yW9kHAeODpCMUGR5dy
         6CBYaREQ+eGRbZIUfIUrktFtlxPtGScY4ZyxoheFBFW5h7isAxkhUVRemRkLlMOG1C9F
         RGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774729; x=1770379529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJZ5UjJQNNupcjkDwCIMciIXXm9F7RB7VuIIvWO2KnU=;
        b=i0W1L+yT5LS7ZC1pYfOcCEf/ERT7SaOvS2OO1kT3hjbiGTHWEV44bsheDuDSOYFAhH
         CErQXlhq3HQZB/mKqj7RdsKbnbvF0oMdAgMziMkJ7oHF9lI/QFGx36gdlirFZ0FR37VW
         zllkOuDhLDj+RmJ/dbakZV8tKv9NhOntqjEijO8JNirP9HzbpOg0GEq3ltdIFrV6h81I
         CtGHRaXnpscFiJxdTg9CeaKTJfrUp2FrORexGvJl7jqSBw5852tqJPtmKLGqJNr+Ae8k
         Kves35+FDCWrnEFvqSY8pQKne9rIQtUHxEuWJFyjYwVZ6xa3cYoU0AoEthgF6mhRbdUg
         j8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbBHYpZvsHpCGHiyoX++JP5ea/hR2Kp+Xehfl82HLkMqDxiU/3L6f5h9Wj8pr5k1rXHrtTztjkp7bXTvac@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/DbVN+VHm2zNslehVANd4y4OnEgFBIkcdsrSKMjSI0wlNDWq5
	ROIRxv8uJPX+4Z+0v6TTQwj4lFP1mTyAkZhvtu7XR8cm59g0wZj8b9ap48v/eoS5x9s+MK6POrN
	XG7GBqZJViDzmCz5Y5b9cGEY/PSV+OhB40tDCZ+v5WKGk9qWgHXFiQkw0CmqzNaUmWIH+
X-Gm-Gg: AZuq6aKUw7qk0CSNC17++88Hlkk4lY15sfxoJYevbpumk9YRdJKtG0gr7rlJUHQO0n6
	VWFrK1CaukgzcjKVa73p9ZKqweFvja4EwO7jOfDIGlhLChHqAfaW+AepldywStxQWyb2WQGMzGu
	LOzJ/sjAwqDkT1b2diXTuRH8D/vvwhqj2Gzc//foMaV3DROWAD4IimY+xiY5stNounWUEyULwV1
	95hdIYLusj0GUq9SRbHmaaQSh4OFRnnyBJn7pzR23mBtYG9jDrsmPHUDNKNuZdOZ+wVsJr9uE+a
	FOg2xhXmTcfIqJl8/+R4JWSMEppOvKTqwDhjSYcSED1Dbf55HM3q8eDURP3rmQ6BgRl9WBq4Zai
	KWNZivJ1QNvm48F6VFwVTfh4/olnsG58oXcqhxp3Nd3Hm4UpFfrbvB7NNdG+QiTqDDMw=
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr291470585a.5.1769774728823;
        Fri, 30 Jan 2026 04:05:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr291467585a.5.1769774728347;
        Fri, 30 Jan 2026 04:05:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fbff42sm15630051fa.45.2026.01.30.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:05:27 -0800 (PST)
Message-ID: <ce78b376-b581-4053-aa23-4f41ea0d140a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:05:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-11-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-11-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c9e89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gzD-2WDeCj_JQFVUwcoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kcuof87mO9zsrRjf5RmsnLteYYqAm4n3
X-Proofpoint-ORIG-GUID: kcuof87mO9zsrRjf5RmsnLteYYqAm4n3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OCBTYWx0ZWRfX2PUxU5MOWTWE
 R3ISLXwKn9BruxVGQ+zAFid9oEIF/zgS+omoDS9aDvAN2G/GMSYcfrdFndJGGJ60ou9nqUiR+5s
 xcJcTn4VuSvOox3NGXxdG5kvVo6kTOvKGdG6X5UsQF/g+Reu05PryRHMpZShtDxe+92w+/kyA9r
 UjYhw0OC0OACW3WPRmamFrJyl/lpb65jma4ZtmJs629diq7RpGjrpnsdBTufOMewabPQp+0wGo8
 S6sjl+s+zBys5q2BO3F0t11mH/ePadyjA5Ea9M8nflIdl83+hF0gfXRV++yrw8hwwt/O7WUKAaJ
 wq9sfYsZeKCSZvP0nm+PV1gSNIrVSKcaIzXRqjD43Pcw1X6jJ1+YF/mVURX0rp5Vj0TrmFsxNrV
 ZGy/T9XCOyCgnBMe+83U5SIMLdJlrbCHjUC6j9nb2R8wmxvPSwUy/umwSh7OYSIche1JRm26Kbe
 5BajSbDcf1Eupy0HM/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91299-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C561BA528
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> To manage GENI serial engine resources during runtime power management,
> drivers currently need to call functions for ICC, clock, and
> SE resource operations in both suspend and resume paths, resulting in
> code duplication across drivers.
> 
> The new geni_se_resources_activate() and geni_se_resources_deactivate()
> helper APIs addresses this issue by providing a streamlined method to
> enable or disable all resources based, thereby eliminating redundancy
> across drivers.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1->v2:
> Bjorn:
> - Remove geni_se_resources_state() API.
> - Used geni_se_resources_activate() and geni_se_resources_deactivate()
>   to enable/disable resources.
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index a4b13022e508..b0a18e3d57d9 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
> -	ret = geni_se_resources_off(&gi2c->se);
> +
> +	ret = geni_se_resources_deactivate(&gi2c->se);

This calls dev_pm_opp_set_rate(se->dev, 0), dropping the performance state
vote, but the other function doesn't have a counterpart to bring it back

Konrad

