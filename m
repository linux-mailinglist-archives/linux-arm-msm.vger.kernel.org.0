Return-Path: <linux-arm-msm+bounces-96940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INsVA/pHsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:46:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 855BF2627CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABA06348610C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9703C140C;
	Wed, 11 Mar 2026 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHDk77ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBb9cvW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB23C944B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224501; cv=none; b=a3DTus/BQW9KqW3yYIjkXf3vprA5eOMjVIaoKThBeDhkpY3f7fFNVsNxXSmu4jaU3XdmFWB90wvqEjlZMznyL2ZFaiA2eRbuH8XZv0fJEH+N9q5u61t+4fr5cv/hgeIUuQLE11YQWRBEXTtzGgdtsUPFrub38CextIeDD0l5O1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224501; c=relaxed/simple;
	bh=OIr96WVd1mXbDwFtOdV3PMHRDq6mJV33ej6PSPF2MYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMvN6JCvp798q5Q4+BenCsvjaSufhhqZHT1ihVw0aTmbSgwemxBgH+dwtxDM8hmxkBA6gl4XOU59Cd5YiWOHegNoITLfNt1htakPmvwsBbOfB+aHAj0mpm7QTOFr4Ycg9cz8EsgZSQFoEgN6NCf/Y7yG3xWSl/HKokBPW/eWyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHDk77ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBb9cvW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9BX4w248601
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cp7y8BcGZ5UtDLsO0R+jMD4Esl8EbGI07itPMGRIp+4=; b=AHDk77ZAaoxeNi5X
	3gq3KmcJA98ah8laMh3uDg+byb+D/uH2oV9AfPRhUO9CXBGWz/2sRUV/I5oLZ6Ou
	XuHRe3sQxiNQzrGNzCyUH8nUqSqPAKc/d/noLx6DXL/N+phViPojTbKLhdCOacy6
	zdYHAdyJOkqc6C7GY/Bcyrw3dCXow5ZjXBe9uUZ/AbWJWNS63vwDE/dBD0ENrYH5
	8MNjYtnhRdkxhLw2Utx+xfLFmQFQ6LnEGVzJ/E8k1bHLU4wP0gXL3Tea72s0LywL
	8ADovhbwspUQdBPB9b/dOLg9A+0hPJ2lDXeRZWsu7D0AZo72WhsFPN3Ik8hrm9Kp
	L8mweA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv133c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:21:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7380305a9aso489689a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224498; x=1773829298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cp7y8BcGZ5UtDLsO0R+jMD4Esl8EbGI07itPMGRIp+4=;
        b=kBb9cvW+TSLZ4IluD50TI90GBsoBoG4iqSr85X4vPLEAa/QS4jmZXDBB5V0Q0Y3CUh
         2rH1VIJ0GCRmUorL2AAzfb8acEKWetRshi+QybjhGI1wW2JuKdpfxy4uijn8JAz9AaEY
         LwL+ywvgjkovRs38pdIwoCRRQanbAuQIkLHFplEeN+DhUZYBRyIZyQUy6VkBbWNNsAiZ
         befW2W0l9chC9xyl+yYuPAdv3Xg9s12pR9ErM+yOGnzSp5GVLWt0czjpffni9LbvaX3P
         G2ze6h2iQW2Rlun4e7cQgyeVq42lSScFf2QfDjAdF/AL/wtGH+XlVsDSvY5F/yycAoJE
         BX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224498; x=1773829298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cp7y8BcGZ5UtDLsO0R+jMD4Esl8EbGI07itPMGRIp+4=;
        b=EWjZHpy06AbHbIvnUz4hNvFSuON1T51+5v630MeekongC2MDxgv+Hqvc1/halfRY1x
         AJ2TnBCMIDVG43y04nLiTxKwoybwbW1Eluh2a8YeyRBJiKbyElrJspJl3sl/7zAQO7A2
         Jy20yiXObLP0vSlB/8uWliU+WeDGvpPQBo8AFNf1hU1qnWqFef+5H05NlVGX1HOmtaxH
         t6h4CvGdejsSYw9NXAJ2OltyLeYJdjsTzeuUK70IrpVtCkfFLJVbbiaF23M7JJ7L09wC
         cyY/yap40f7C82T28ipE1b6KtYDNhIKliuCSXg/XWYhOjjHR6zlnTTnq3Sdt/uF+Wodk
         v2dw==
X-Forwarded-Encrypted: i=1; AJvYcCUaXpdtgoFOORPs2Pud5TKpAZai+RavfcKmCZu/V7j5a2dXdc198HCWsiTuE14r8yNI0l23hxjt6cfZqO+C@vger.kernel.org
X-Gm-Message-State: AOJu0YzimYypAX3lywrbf4A/5Z5vxryhHgfe/nssHU149pytNdl+E86F
	D3gKJfQqibhbXxUNGgmT7pQJrE4buoz1SMuH0wXbVlY8XX+puADexhIEPbiYgli+B9O+pJqzPcN
	2ZqiKWocYnMWkeVEJtgguYR+Kjv0TDS8EULLYAUwpoQkI11IjmTgxtxrHVGKSNJrsnMWX
X-Gm-Gg: ATEYQzx3lnOIGisyP4zJpZJ5YinE6v6E6tScptanIZZkf3vKPJQwYvumz+xwaI/Qy3K
	r6EO2lhr3sZXMVfVDbWfMMwHypyXwCp2tGGTCRQ9ckSME2qM/6OHeGt12zeuuRpEEVJx3Bl+BkV
	wCrhAZQ7MokirGOGG8Aq2Tc+YpLn1f5bH24wsn8nQ7aqD+eZaP4R8UZqU936XWWGNLDIlQ2wjcz
	OoAHE8IImeQC2PfVCalk6JnbzXeXwOhADHwTf27VNRfZVUpgB0VUo5hcoGuwzZYPAw1ZcWd1D56
	mUbBdX4AnyziYIlFTKYBloCr+Qvlse6v63NcKMbQMlcl44eOkBW9ib+H9OvhsQRK8slgXx1fkxD
	c6yzI5pozfytK1sd7ZvxSrSk4GDlLUTHi7aZz5PMIe3DavcR4N5dUiY7vxgv6c5jIdL8pYEwXRD
	5zc+L+CQJO30GFu4WTJCRwuyG5YYuneZP+aKHVs88=
X-Received: by 2002:a05:6a21:4d07:b0:395:cfa9:88e7 with SMTP id adf61e73a8af0-398ab2862a7mr5904421637.8.1773224497720;
        Wed, 11 Mar 2026 03:21:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d07:b0:395:cfa9:88e7 with SMTP id adf61e73a8af0-398ab2862a7mr5904390637.8.1773224497238;
        Wed, 11 Mar 2026 03:21:37 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdfab64csm1706820a12.34.2026.03.11.03.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 03:21:36 -0700 (PDT)
Message-ID: <96f4dae1-321c-4c6a-a6d3-85f4f785e863@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:51:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: cpus: Extend Qualcomm Oryon
 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sudeep.holla@kernel.org,
        angelogioacchino.delregno@collabora.com, viresh.kumar@linaro.org,
        neil.armstrong@linaro.org, festevam@gmail.com, Frank.Li@nxp.com,
        danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260310040751.3132523-1-sibi.sankar@oss.qualcomm.com>
 <20260310040751.3132523-2-sibi.sankar@oss.qualcomm.com>
 <20260311-premium-meaty-bullfinch-f01b0b@quoll>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260311-premium-meaty-bullfinch-f01b0b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NiBTYWx0ZWRfX0jtKiMKh7YNj
 CTK3MH7SqJ61230rg2kqmz7tM3gmAO5w+LefcKt89lw4rISEsr37bm+lQcBrRs31YxllqmCtHjH
 noGd8zhjkqsAKnpTdcuQ6qaDgJxz5Ogdh2RnR+cBOo0Yh4jl58jMZ/4sRdvpZLH2HrU7URBOyOg
 ljUKdgE9UKMJfQQ2QR/6IXf+sNOLaR8lofmEzebXuim7+X6l4KHSRVQvGp2SbQ3Lelm/9IKBk3u
 ERtrpDYHHBtKEVvqpkHSeFDAFITyidafAAhxQ3hGD35w7I+3J61vi87RjHtJ2QwrHN//xtu7U/o
 nDfkSC80QKa1PAtFj4ozeTY4/NDYQ3GyksmFWuE1mUgaSl0oBb5eYwtJffEiCYAE/bof8QHkXm4
 NOI0xTZnEOmMSpI4DmfjM570A7Jufjjc5xnISGC1SNo3qnto1Q5akcJe2S72Uf/OzUwM9QF/8vU
 YP96+YETpZMsqS5Vqcw==
X-Proofpoint-GUID: A7bx7v0TpFAUJaBsknJ5-9_BuKWph5lf
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b14232 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vZVINAHaOJVY8LkD9qMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: A7bx7v0TpFAUJaBsknJ5-9_BuKWph5lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110086
X-Rspamd-Queue-Id: 855BF2627CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,linaro.org,gmail.com,nxp.com,jiaxyga.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96940-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/11/2026 3:33 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 09:37:49AM +0530, Sibi Sankar wrote:
>> The generic Qualcomm Oryon CPU compatible documented in the binding
>> doesn't account for differences between core types and has been
>> deprecated. Introduce core-specific compatibles, based on MIDR part and
>> variant numbers.
> What do the "-x-y" stand for? What are their meanings? Your commit msg
> or comment in the file should explain that briefly.

Thanks for taking time to review the series :)

-x-y stand for -MIDR_EL1[PART_NUM]-MIDR_EL1[VARIANT]. Will add it
to the commit message.

>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/cpus.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
>> index 700255e9a002..fb6e5871b625 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
>> @@ -218,6 +218,13 @@ properties:
>>             - qcom,kryo685
>>             - qcom,kryo780
>>             - qcom,scorpion
>> +          - qcom,oryon-1-1
>> +          - qcom,oryon-1-2
>> +          - qcom,oryon-1-3
>> +          - qcom,oryon-1-4
>> +          - qcom,oryon-2-1
> Best regards,
> Krzysztof
>

