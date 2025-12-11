Return-Path: <linux-arm-msm+bounces-84992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71FCB4FD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5163030014F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29A92D374F;
	Thu, 11 Dec 2025 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljBaAdt8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO/9XQpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383811A9F90
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765438545; cv=none; b=mkKRrkWmxu/YVJUVAUIlE9LcseQRpJx6vEEyht9tH3BpLa6mF/4d9FkQGaCy5Wa27ts6CIdgG8gfEJGR+E0Q0xQZQ+jzmiH3zNcRdhQEZQ8rNwI7DJhkmNJ7sAGiyyTb3ol2AqNrSgYtw68sWyGQYFMr4WD4ob3PiVAZ+QJK+S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765438545; c=relaxed/simple;
	bh=3H8VJcJBIq6KQHz/fGQdhhu6SPxZH6ixBn0JrpqS+oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fh8Nh6+nwvTngFpi7ILoCf45vHWYToIyaOOU9qBSwfZ4G9JLQKtnfBjGgMe2wSpb8QOuShFd8uCHiaUWFXvZgZUAU4i/LQcgWHrWtiD7KolQX/5AYesAkBV8XptkMTOtF9BjyltNHgGCUDTgZMl/xmNXndLLFfzw4afi3W6qv7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljBaAdt8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO/9XQpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB32iWm3683025
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 07:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=; b=ljBaAdt8ofjlpln2
	NRTKr1GoLJ77MONpQ9sYJ/yoR9+4gNC8bgAh0PqsGnio+RoNsT1T++/rQS5QdPnV
	J2crG5Zfo/KdVSZ3rOKm2/FlkUFQhDO7zXk+FcN3/QHJN2AN2k3tStwhzXIS5nkJ
	0IgcMtvMh0BXQbyuJ0ri6nHStMhpJqWrbCjngsfB3PYM8CdZGG8WlzJMT3pgV/Jw
	ZuSlbyTuAnB5/uJFy5YmcRR1upxw6B1W5ohiPUzADmG+LIMrVdZYsWEfNEvunA99
	YI9mdAgBVbFYYMQ2HXDsMA7Q5Y61E9r+Xf1CsbtxYOcxXJHzzuTsCmebfsY5rRJB
	DKk4JQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynpvrp7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 07:35:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso801173a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 23:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765438543; x=1766043343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=;
        b=NO/9XQpQzQJm7nfB1Nqbcf6otM9xqibye5fEiQFZ5yvdN/btu5NAvr1RpUsQwPoTuO
         YiIOJvfVTdH1HRDmrChtgKLsUaMqxnQKafyst6MitQg9R93dzPeD8TmejHzOeJli7tMG
         feOwRNY2+bVlCPLj+YQsseVdX5SZWEB5JKQKKiPf/TB1p3qxkr7PjSQJbhXG3uO8yyWl
         95mPpL1HO0kQnJVhutnuiGV2XBXD7mc4k0Kf5gW+tjZI8cBXqc1uts68NSYaJsft0X1W
         ZjfDimeAe9g1U9jQxGyhZJHANEJZgbx7saMjfDUXOykU5JQhnNpyF9TO3KaafF+/wMLu
         7kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765438543; x=1766043343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=;
        b=Jy+LYg4jknIDKFFtbewZ1rAQOU4RhuiFnxS/HuQ6WX5sfec0vt7kQ3t1HAanR9tsKm
         H6hyH8R8d4ctIHSaMI5sfPeCfXNz2btBsVK1ZBc0G0vEJ7e3NL5v59J+Wcax9yMp2YLE
         tL8t9VWINHZl12DH+uBzPoJwvLcwvn5xYmPm+Ip+HL7MQMdqJM9+Nrc4IBSMnHOc/xDL
         zjd/nLwGWlHj58Rh0fJhqQuxhQ97+Pswspsiy0zEartkdh3tMb9SlIMKesyhHLYocN6z
         W+jvGds8Q0kgcPd0HgGVLZEb3LQGS36TqK0owItWE3LLyxfCeXqFzPy4TsckPQQCi7pi
         ghMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjVjlhl8BZi6fyqUAPNUAsLC6pl8P1aZitEqz57RcDKT+vWc7zMFV/IVyjcNMTTsImsOdMHyvDWz7YCmAu@vger.kernel.org
X-Gm-Message-State: AOJu0YyZzR9GVct+4xVls8myFdPgQmRYfHouiTW2jMHCW2l6zjDbLv5w
	bnriHXwuxqfjklLmQzIuYHZ7pcgbn3YcZ0ze5oYKwdlu6TMRVPy6FociuBwshSr60ex6HR1jGf9
	PJshD/KcKRqVnLjK9sONKyO8NIX7oAkRy/4xz4Ba7FtlJLYbIa9i497oxQzvK4XzmM79W
X-Gm-Gg: AY/fxX71yBkhfiFCg+JK4I+N1BTisMhPrskatRKvv5x/U2KJjH42WqzxvnGUjQNDVcD
	v/kG01FVXuedU7v7+nj8wPOaII70lp4JFjHJ7CL+YdEJhjTKQ+cFm7OJMz8zMZvnczAsikkHjsn
	3+wnzdtwC374+aCuotGKwcoGTpW5HA5DvVA5p79vZLplNblnXl8+L0ZdwUEkv5yFNydH7bUkIvV
	w3eL77DUW9Rr0vfPJTZZfPE2swPo0/RhVyF9bXuYhj/OWrmajLLWciniUqQHDxJkF+Vswnm9gHl
	+L3jjyYZJz2vDQS8N0Yw90AmIrc++Vg73SC9bUGcZFDdVukSRiqx1GGmAvU9qx10bQTmKRSfr22
	J6BT+Xe5PLQAJMZ8Y9M7QJX58tSBpNvWG4mZ0r0nHjANFhX/zce0vjBQFVaGwhnVUsR8fcjagH7
	Y=
X-Received: by 2002:a17:90b:2e42:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34a7281d762mr5366731a91.14.1765438542522;
        Wed, 10 Dec 2025 23:35:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvIG9rHKDb3pmerPApO4qZcY3ni6sXBrpH4zkU8qilpPmVJXBVULIIuqu0qMtN5qRAsrbSqQ==
X-Received: by 2002:a17:90b:2e42:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34a7281d762mr5366694a91.14.1765438541736;
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a928381c1sm1033740a91.3.2025.12.10.23.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Message-ID: <44b8df0e-2786-420b-9402-ee19f4cda0d2@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:35:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        James Clark <james.clark@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <176543802198.60924.10267408914731981420.robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <176543802198.60924.10267408914731981420.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1NCBTYWx0ZWRfX8ciTfRLIQpFZ
 0IltjlPaK9bquX6WKinyse/iBY4nKUlSTIRp3WX1rv2mOHLAP+9iDUfYrEY+LaMYqYgF4VdV+uE
 UzBKJ6+bTsH7sZyqjcdJVVf4qIQTuwXPerog0O3N2szXKGsgqnoa0uwlhD2J7bfI4bvneO9VWM3
 Emk8XojFPNLNyPqfjXKxuNTl7zt6AjSVs/InyW/b3AFLdxTD8o84Qf3M84Dcc73Vl0RTb2GY6VE
 65YZiQ+OzISuaccxziFELrq3WKlRn2/Bh0SuinB+90FsWyhJP2kNfb573suco7VasAtaKZJiR+/
 V4TVEFDFFWZM+p+Vxpwe3HSmLYh8iysaTDSILLrrZIp3GGxg+KaXzxOumBDMSPtPuCn7vqkPCH4
 xo7VPODqxEA+eB4P89WoMd9uK8MQZQ==
X-Proofpoint-GUID: KPfyhPdzPJRWaIWVqZL2zks4NJMqdtuT
X-Authority-Analysis: v=2.4 cv=C6nkCAP+ c=1 sm=1 tr=0 ts=693a744f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0awkmHLjsCMGZ7zvgVIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KPfyhPdzPJRWaIWVqZL2zks4NJMqdtuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110054



On 12/11/2025 3:27 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 11 Dec 2025 14:10:44 +0800, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dts:36.31-32 syntax error
> FATAL ERROR: Unable to parse input tree

Will fix it in next version.

Thanks,
Jie

> make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com
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


