Return-Path: <linux-arm-msm+bounces-108619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJCVHak0DWrLuQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:12:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8479587738
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 06:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2F9E30531F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 04:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B65367B95;
	Wed, 20 May 2026 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvNIbbCC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/W2xhep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733432ED55
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250325; cv=none; b=XKtG2Pigd/D/LUu3lYGEPFusUJhX2KQUk7L9s4ytTxo8ATg7Ml8Vs70PNCaNQ0iI+JLG+g6/bnwvgCGJYTctG0opyVrthV7U3pBp6Nwa3QSYdSEBO/mxl2eXwU0xghz2BYzWY/FrJ7zzeBlCcEXIX1CvFpPXhn0yohbWGl/GaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250325; c=relaxed/simple;
	bh=hRI6xWNJhE5ETvgqRxmnzoAXjP1dG9fiu+8Iq8NoKVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PH5oxE9g6yE2JPwnvFRrAIkglxcmITuqrO6hn2AfsCzZz9Gge2dGxxwmwtlxNfRQIGc4++gF+IMwj0coIc2FkU/21r7rNwEVXVgGaeBb+twF2CE6jg1fB7R9B2SfQPcEONJId+d99IigvG6ERv3DGvQdz6oHd6PjOe0qLLHW+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvNIbbCC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/W2xhep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JMMSnB1237954
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=; b=mvNIbbCC/Vgc7nXs
	kN3VOfJo460AA0qwx/oPDrMtQUcpyls0+QNmcRhs/j9pOxxqnCPTPQhIoSZk+gMx
	Q4QcQiLM+Sc7Zk5DXRxDSWsRvvuKbIuW9pKBN718ZQYiTQYo/UvZHR31OMp9lDYD
	NCDTiOy4mhRRXqObO+SKjC9BYkJuA3wov+1+zUP12Emd1Pc3N3K4fcTQdVyMV/fR
	YLQQZxViyC03azYq5JdpkARKikuKTrwkHaT5e/iQ3EEM29tL50+ARFhL4PYZ9ZxR
	6OIiUxmWKJk/x0XafkrcBLNLlvVKPCaLfPGDRZTLfed5bq+5q9YjDRGqgVZKJtHR
	7Ercnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3stwgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:12:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso7153828b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 21:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779250321; x=1779855121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=;
        b=a/W2xhepNSCollPZV7nHb7NIEs1T8hs/wz+dNB6pbgPy0M/WXcP8M/sKCj8XFvYpcR
         aks66DHQEf+fjOE5yxju3I6ChRl+8PH6j8hFxc2IySponuQ7YTShfkgJQxXJbO4Doa2o
         5vmJzmkbFBlzR7irBZgjSbpzZD+B9t3xZ9j4ndmDAO8LpO5aqjBOejgzvctfh2APB1Vg
         g8Xogj9NwBEPCWLXgid3vUKx9f8O0kHIA/Q9uY80gLdAOn3oDWnMlaVZx2vhNEztjdkD
         cx8nhFoybNGORg1anFrnBtDGo/C4ywJ3GsvPNVkcsciU0AGzWSn6Sg51nwAmRAoMOEgz
         sU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779250321; x=1779855121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgEDiQF38ipxx7swqVfhVvhL/Rs0sn4zwDldOHSa3cA=;
        b=WGuaLjzQBa5d94A5X0EoqDFvj+5exBcD9YfgxUGhFMF0EKKmC5rkBrGp6dru+M2C5V
         zOjwCfT76yE8C0414cfBgue3DevxdRqEnc8nweq63YdkIoxarqwnyP0F/kZeGXF/9Jk8
         BH3j/L8vTtyHKfyR7v3+aBR5eHexUGCZ//9I8ZtmuH0t6cJV4++E4kyMtk/cX8WhclOB
         bhzNgVl5n3qQOPksXtyuKD2f7q6tJPvNkWWVjV+kDrZlQMUGKS7IhzCdCgj21QwbgTvF
         sU8JSKjMGZZiFTnR8YhuODm+uB3t1EaX2SzlVuFM/IwkGyuCMp0ILP/931kZIBbKp+Dw
         yLhg==
X-Forwarded-Encrypted: i=1; AFNElJ+3Qiot6UYbh2p4YCHxEGAg2AsILUbDP/XdKsRbVIvlH0cdDkFivtU1o47bzC69/KfVoV2x0nRvCwYqpbwm@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKuwWoF+lcWyXRPw4P4xiNIn8nyUgHzHE7WvEJjLjUoBpjqxW
	CTrRLp1M9TSWGcu/G21XfgiFtt9kp7ApWjELk6ZKU/znty65KVwtlElL5gvQ7GIHK0493T014XQ
	BlnVZDetIAo/ygIhVb0RUMyUdbmCXHH/YtwRjTAgBlYCe4rHKiYfdiyMRHStkIuDdHQJ5
X-Gm-Gg: Acq92OFcP8P65hAcrrHeXg65P3oy3QMlNRMlVHF8xh9vI3Ilu/t4GJM6MVmbtCD+/aE
	WuJcf2cnJPPv3c71ptsjfv9UbA4FS47KnSYWJ70U2roOaOZWGVr2CpXhffFdiNXaXybm9UD4axx
	Btl5U7VmyIdU8y4b9H1jB4eGYt1QD9Qy6nTeIxzpZowIUGJ4htfSxGmUWN5H5YUMIZAq9uSCt/D
	A8PG4n5iEHTFzn9FRM74eptKilEQUfuINQZbQPxHFl7We+DjBSgGxnPMnluFhnbHfSMGu1FE8RD
	DUdc7ZWKPuDIpUaK/zK3veGMvvc7QOGlaf3bP47YpEwqkYbOSwEeOrnPJ0+eF0YJo9JwizrEWEh
	Tp+W0PcbprFQ3smfPwhrcUav8rFviw2OJR5K2Nru8hPRA/ZdfRJw3LkX5gO6NuldWySNCNSoGE2
	h23TB1cJPcmv239CFz
X-Received: by 2002:a05:6a00:448a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f33dee8b8mr22252077b3a.40.1779250321061;
        Tue, 19 May 2026 21:12:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:448a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f33dee8b8mr22252050b3a.40.1779250320584;
        Tue, 19 May 2026 21:12:00 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm18569319b3a.39.2026.05.19.21.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 21:12:00 -0700 (PDT)
Message-ID: <7724b8c5-3822-4b98-a29c-bb4a99dd858a@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:11:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        shengchao.guo@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>, yijie.yang@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, tingwei.zhang@oss.qualcomm.com,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
 <177918447247.2753487.2425115852853158786.robh@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <177918447247.2753487.2425115852853158786.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KzWX-oMSuIXi4kjfyKfyyrktTzQ9WPQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAzNyBTYWx0ZWRfX23rR8WtUTY08
 aXS4TCOMQ+36TYlitpHv3pF1Ypoy/ijzDF8Yy9A3obS2uZJ7EgDqwBAwYP+aHRUm0eIa+UjETbd
 7sunH3lx6NwzSbpX2UIL9g7gdSklsY5TZn97SL5ADkxsY6eZ7Ic7d7Rj5ug8+ThSXVQZ53MqgQf
 3akLH8PsfePVsYpUG2fxmcfT4bxWWhH0LmeJoQsxFXpglJk8uLIEynCl3MZRDm8XgWwnIKA7Meh
 K1p33i6w7SF08CId+bhNQSve5mK7zPGoLKwgg/ocKpfnRYHl1/Vr7Zn9IP6AvLHEpBzl82wfHI3
 q+FUjWLK4Q6EBvFPPgLg8c9hhA4IjTToxjbiX/yFf078S8psf2yovkd+BtV4v269dLw+1Z+bs9R
 NJVzPc7gPLokys0CAMQZESrq6vZ5aInHMuxOMAiODPNHYArGmDbzOUWBus0Mzc6HIkaKJC1b2KF
 BFen8DVeX0ikDGHNA+A==
X-Proofpoint-ORIG-GUID: KzWX-oMSuIXi4kjfyKfyyrktTzQ9WPQp
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d3491 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200037
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108619-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8479587738
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 5:54 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 19 May 2026 00:24:22 -0700, Jingyi Wang wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> Document SoCCP remote processor used on Hawi SoC which is fully
>> compatible with Kaanapali.
>>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
> 	'items' is a required property
> 	'minItems' is a required property
> 	'maxItems' is a required property
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Hi Rob,

Will fix in next version.

FYI, seems this err cannot be found on the latest 2026.4 schema, need to update
to the latest 2026.5.dev9+gdf9ad30c5 dev branch and reproduce this.

Thanks,
Jingyi










