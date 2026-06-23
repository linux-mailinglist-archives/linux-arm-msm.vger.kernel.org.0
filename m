Return-Path: <linux-arm-msm+bounces-114140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cmIfDdZWOmrt6QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:50:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A56856B5F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:50:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YWWQdKqg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fTPza3f4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114140-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114140-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2174530B5837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F376B3659FD;
	Tue, 23 Jun 2026 09:47:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F57364953
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:47:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208062; cv=none; b=dMIrLXJEnqvGCsfDI3HYO+BkL5qznSuSCFaRSLO4tnLov/NSj1pFHLHAUvMww+uOCx4hg0dGQAJkLfJ5XDRAywK5m/Gj5LHgnnQGq6Q8xyVg6zeoDHD63G6yIeam5yiu5jYhjh2r2aTfhclN9cm82d4LMpfe5hWUHX2ZAlcBHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208062; c=relaxed/simple;
	bh=ZFXjWZJ8Yv0VUo0VzxGtfovaoA1ZCFVBqtbCKCuuY6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqrSR3ZJCKoIgknyXXp1ROJ/rU8ezZg4sy+YnpfBIgSKVVu+ujpkkO4pKHqOU+CoKaOgiEdhBtVk0I1k6A7o9GgekqP4MxC7H2FqqXlHoLIQ7HiIVija0Hf+eyc+EJdRbXYn1pfIkZBkCky4CTrOHaxPbcpdB0chk840BGksRpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWWQdKqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTPza3f4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6caKB2992148
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dT3ZqB03YeVKv3AnZlUlVxas300onzHYiYQqPphtYjI=; b=YWWQdKqgAT3uRMP9
	ka82y0gtDjXKINfzPufO+dbfLuOFgYay/FuVXlaC2b/K2FY6xDGZbyd4EMmfNZSp
	1oatqPEZrYXWmZs3YwcWkJCNI+jwJ13nnq99r68LmdD5hvMhd6wjImkBCtwS0Iwh
	0yAKje4wrlzgsh+dFUib7ky5erT5bgLA4lZKpkcBRnqWB382T9fy1VUExTRpiF9l
	M/H3+aWC1zUOba9lone+ka+Wim+C4WMrp12tiHvsXZak3dOXmTvf86VhZSBLKVtc
	tpr+nWWyG6TmMM2RM2iDs2tJqG+m935vzUB9R8sl8121UzvVtzYdwlFJXjkdpFhy
	m1JUYQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729uskx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:47:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423efbfb61so3992613b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782208058; x=1782812858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dT3ZqB03YeVKv3AnZlUlVxas300onzHYiYQqPphtYjI=;
        b=fTPza3f4E8CCGcf5vEltZdLXZjilUEvzJ7BjdKR2lMTPQf9D4jlyzDe9i8buT7QtBK
         fICPs4JW2/S3e7NvustNbcboaW1N4xzpXP1aRhnuFgpuK6XN/zQFh2FCjTgjx9JCoN4X
         koR539CSlp5fC0BVE4MYm/54uN/tY5WN2tBhbVPAk7DTOJSY7OLiFswhHuzCD/u8DGBm
         CRxofFtzgRi4E1GSsgH9R18Dzj76vQ/8/sVK+W7JoZgoK4fPDnSGGbWyNExSFV0BQRDx
         YSR4RMMMpHWo3/ypRftDZJ6/QODbvgRaVXGkBuznlsip2sjMDhGVbJimKbzGnPW/5OOv
         JjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208058; x=1782812858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dT3ZqB03YeVKv3AnZlUlVxas300onzHYiYQqPphtYjI=;
        b=ldBSC5MSVLAeXgvPgOe1vCCfciRIb3eSGcGhJ7qxbJ2qDwiavrFhOt9Ge8rGgugsNa
         PFPhTrs76epiPQHvGtASy58V9ERdxI/Lx4XsDC2oVo9XGyzKVN+ht+bFkcg/vuvX3XE3
         hOwJnqX/7OKRm2oWFKT8Uqx3MOsfbIqVkOgzZUrQ4oSS5GLPgh6GdeSM7Fmsul8qWHxu
         xFU28Lb5PyYg0QPDUq184sDz/5S8tce8YCPw7gtw2eMeqH8Pcfo28CpSdAOY9YGTYynF
         cCIiEW9fJ1Tg4FLpiUBNwSAGvLdgQW5+p5wqEBdOsztmzLhgfV4byyQMwMwoUBeEjb57
         JB4A==
X-Forwarded-Encrypted: i=1; AFNElJ8xea8MeS3OrbbhBWOTB6YfNmXeeOPFktTgkg4RgxuQ9+STVKkLDqksIx2J5yPD8meloAvtyNRkmStW4o2R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZKHpCdzBg5SXdFYNFdjpRmHNET3IY9DaUMRjQ0cXTnBE2Cfh
	UdNAcKje7zewMMjzOvexmS6zJKiYh57SsWXDXlTmLH0tFzRuh+7HamFm9L0ygBzZEnMpyWNaaeL
	78Oq04eMqkGcSl95WLsfvqCsl5nOmJg7cssrexuECYEvi2VGA7HGAHDO1vRu5omXbPPPl
X-Gm-Gg: AfdE7cnKP9p5vvvhTzEV/6hAvqOiS4za6nRtF3eLQ6keZn0h87yYKYU1wXoNOhfIoPO
	9Hvn80Z2l7P/lGrIO72whqhAcAD7UyrC8EQPuj1olxhkUXiPf+bujbJwmonXCqEZy9jCBJNJ+wq
	qRNkggNiUaR0r9d/LHW9jKh0J5o1g5N3mZWcFceKFJplZRL5ItH5IvrBK4iJ5MT6WA2zveT57II
	vv+QsMrREyLkl3cJV+rkWJCADikHJUUTUkXumI70TwqP1Y6OiVce5l+6VIHrGDLnTm+OA8KdNao
	4KZY9pXB1X3F7AZ8sAJlViJAtra9ccSmxNpoG5Xrxeag+79mfdbDqR3W+32FFFwAsaw9UB/83Fg
	Mi36C2irDacQNxXv94ehLvGYcnxwDAZaCWWBK4fMSfjd4qg==
X-Received: by 2002:a05:6a00:9a4:b0:83e:b443:965e with SMTP id d2e1a72fcca58-8459707afc1mr2244895b3a.3.1782208058402;
        Tue, 23 Jun 2026 02:47:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a4:b0:83e:b443:965e with SMTP id d2e1a72fcca58-8459707afc1mr2244862b3a.3.1782208057841;
        Tue, 23 Jun 2026 02:47:37 -0700 (PDT)
Received: from [10.92.209.135] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8cd9csm9737902b3a.21.2026.06.23.02.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:47:37 -0700 (PDT)
Message-ID: <db8f06fa-0dda-4a22-baaf-8a708d43e113@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
 <20260622-armored-witty-tarantula-84a28a@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260622-armored-witty-tarantula-84a28a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a563b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ZBGX7F9o7YTsjpKyWPIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 0UAclmrlGuEPKB4L0DMb9II2R8Pogz6f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX30QEqUd3S5oA
 f/eaP1rcWQMJ5Xp+UOhJtTFTDYQ3YiyNBdhxJwjecFbdl1Qxz/MqZK3PHJJPBOpkidgB/IvZ4Hm
 xljGa9zbu1qcS96vd9VoGAHQpeM/ThI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX6PF/qedlmtL0
 DimLYMtrNZro0APdDf0KVEiccxd40Bt5z7kLpYzMsKFPDjDzBcqiuTwLlt0Q53TqPA7TgHl8ykn
 AZbJCg8ayC6ntCpwYHStDYpZjUsn0PzGZtcm8r6HQ2a86PNMViOgI27hGlQEDILWKpjq4Yh0LtX
 xAIuvTaJZ8Va6AU+qEDXGNPkOiIoh7P5tc4Zkul5H/6/QOyclsgNUQl11jGF2fBRMi0AwS9rARX
 A9jD64whSvlHaLzoPVSr7Ti3dSNMTviI6IObULxB2SUCdMJNjyZYtpEEyqsa1tyOrGWU/dTr8PR
 kZMWbOyduYQ7AalVyUv6sobnZD3EJohnqn5YCunY7SCbxqTiU94eqwPQy2ErosmEhVATgEPASaF
 HEQduxqHU4mboSI32gyjT4qNCaAtPQ==
X-Proofpoint-ORIG-GUID: 0UAclmrlGuEPKB4L0DMb9II2R8Pogz6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114140-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A56856B5F04

Hi Krzysztof,


On 6/22/2026 5:58 PM, Krzysztof Kozlowski wrote:
> On Sat, Jun 20, 2026 at 02:09:08AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various domains.
>>
>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  6 +++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> 
> What is "limits" directory for? What sort of class of devices fit there?

Added for devices that integrate with the powercap framework (exposed 
via sys/class/powercap). These devices are responsible for enforcing and 
monitoring power consumption limits across different domains, such as 
the system, SoC, or specific subsystems. Any other better directory ?

> 
>> new file mode 100644
>> index 000000000000..4c6e6cbfbfe4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> 
> Filename should match the compatible, so qcom,glymur-spel.yaml

ACK

> 
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoC Power and Electrical Limits (SPEL)
>> +
>> +maintainers:
>> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> +
>> +description:
>> +  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
>> +  power monitoring and limiting capabilities for various power domains in
>> +  Qualcomm SoCs.
> 
> Please describe here more what is this limiting capabilities.

ACK

Thanks,
Manaf

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,glymur-spel
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: config
>> +      - const: constraints
>> +      - const: nodes
> 
> Best regards,
> Krzysztof
> 


