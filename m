Return-Path: <linux-arm-msm+bounces-103431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Gv0Gnjp4Gl/nQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:51:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0640F363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 15:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D19F3302D52A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6BF3D3D04;
	Thu, 16 Apr 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX+3Rd1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brDEbeOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28D53D5237
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347384; cv=none; b=HZR1hISCWzqXB9WQwqqhoqsaVNAh3M4N3ZxIh4pX+e8eIbrgc2hoYkchxOG+wfOUxTaKNBrlePn/rezZO6+pQgrb9cblFun54Ldvh52MBUjz9oDlzok4bPF28Av6jkiAoPu5sQu6mq5NgWynxSbUqp/6+GgmUZJEcolixOgvJNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347384; c=relaxed/simple;
	bh=ZB8QHmnI16kH/a/B0OkrUHPxKGpdp/pz4wFFK2+YkVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRDeF/xbUIqb6B0dWi6C/NvSOW4szzNIOQp/3MVEPNNJjmQ+TbvTpd1YWc7ldNwRNlBEppuR3EZY7CumaTdxM/Mu02KkBxgFfSVaSwGFkVJZw2wA3Hliw1/UOOwBu9rPYjKWx1cFkgBiXqDkG7h0wvyfMFznBrvSqJB4ma7xbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX+3Rd1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brDEbeOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAY45j1245288
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=; b=CX+3Rd1EK0MuNj4w
	BggEtQAKJJnIgZ+/4QVS4LLC/WbZ8aG6cAK23Q4srqu0JTk6m09enKkIHDVFWkfF
	LGG+TeIqR8ksAJWrzxhzSzfNHCGymHB04xICUdkqZjaHjcHK5X+mYMq1eIHgP27P
	UDnvHUbLybmPFkDilyMI594rUj0FUApxZABF0aPQFmFme6ykD0dX1+KXzFU2cWmf
	Z6lJY+z5wRA/NnLS4NO/VZ8NfogMTUFvKdV9K5/+YN0CmPAUikowQSDxCtxzYfgm
	3dNWnlrhqVI2mwN+j7kGw7UftHDzFvTtvQ4uhpJcCKD3R3O20CdKkqgCKW8O5gzP
	PdDMzA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k8k9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 13:49:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so186728785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776347380; x=1776952180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=;
        b=brDEbeOAHpaeZZi920kD7hnYLcanm77QXTKpdjAm5JMd93TZUtoNeS1UnhwpCxz5b0
         D6i64cshLx1QDIGOhKjvfStXHBB8aXfCVQQ1J5LdqQBeomUADakbGfMWrAELRKp/fZIw
         uEKYv5120NySipu39CIjbgEWoIY1PZkWetqJiz7fv8ZAM4t1E2csEyj2HrwbC3dlBWeQ
         4pjE2MNoSZnXJnamJwd33SQPzxFqqVNiXrzdNF2ZNzk7EVhgqV+ygzT9Y4BmtBWYrZKZ
         s+9vVGSoMvlKLskrii28+sFLYYIIfNjl2W642yFQNGW1csyZcGQlo2zvmNo31oBwMH5Y
         DyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347380; x=1776952180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp/HXPaQ0G51D+8PCdkwYaxrgtFLEn2Rl+hEB4QvY6Q=;
        b=KZqbFA1OEonTUY/csE54jVu9YSpN72d5E2Ycld/V5ePlZnjELPfqyBEAbUhrmiDh6V
         GZ2rlhjIqHJZwkwIN4PdwOfWp7UnJw26qm/iAsCDIWL9ZheIz/bW61Y6HCV44z1yjgcf
         PvUj8yNCQ1Hf2xDhcMOqUmA99OU4fjhbYHKtvI0p1HBG3qTYx2EN22KzKn0rgZMrguno
         VfmPEwbbOedt6ojNRTummv0pQz+dyEoeFodfQSvUwTcGKd/54m3vsvNf44+73Xmy+u2b
         +TCqW2Uf1NmYZTcdK9WM9BG0HUfStlpA5le6+StYo8YFrdEKi4NDEo8SHsfJqjNaxEuS
         zeBA==
X-Forwarded-Encrypted: i=1; AFNElJ+1rNLG64XrWbFVpTrkbtVeoJiXZekfvuRjIrZ0dOQhMTcWlo9BiSWOyOt7fpUtSPef1aRDDtg/FW9q62v7@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqgEffx7JgpT9raP4AL4Ko1JQts6q51tpSBeTWGOjkEpk46m+
	F4pO6fipautuwbz4Mqxe0+HuKxYmnlUIkRnz2QbLhWOVwAd1vLI5Uf1bv4YVYQJdr+eeIdPg1Mq
	UQM79tC0R4eWbA2MPQl/xUB6P1AxzKOlv8iyRU/idfMKdhkZ9iA665M5CS9mbTVJzqDhL
X-Gm-Gg: AeBDietWtTDlESAsoA+pqy37X4XJoci8tpHZP4StPnXjp78Yq5a3J8S9bBhb4uKigbC
	YIK9s1jRlPp/SudJchLYMlpB2ofHjcKS6MyrKSqYlD+BjPoThrzr8v809RQcAeYwL4pG3BQ+jtV
	MQv5FMXf+I3i58VKhpA8RI2kOP/Ja78CWNyzQ0/dflTfAQjWJXB3BLgWTUEgMwUxkeUe4nipl2u
	Fsnr5Z38YP7SJoGe1LglL+zlrGGPvQbojK8cAe2jyA19qLB/k/nlUr/N4KiLBo4eO9g58iX8xwM
	zwNQHpHZR0N8mpLCWV/6lzCEYICnuAAoIM+7v2XxEt6VMVGTiBx+BH/X5N5HHhcbhiszTs6TpRq
	UEFISPJpKfIQuYLowefut9nin/LUud06G9gCM11JY07QdYrEgFbEoMbG/SkAemrrt4d6X11/IRK
	Le3IZggwDIayRrTQ==
X-Received: by 2002:a05:620a:2a07:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e6324d73a9mr261649785a.1.1776347379628;
        Thu, 16 Apr 2026 06:49:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:8cd:86a2:340c with SMTP id af79cd13be357-8e6324d73a9mr261645685a.1.1776347379181;
        Thu, 16 Apr 2026 06:49:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d789a9sm1348465a12.3.2026.04.16.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:49:37 -0700 (PDT)
Message-ID: <00e40481-9e62-437e-ac75-a04594ef6879@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
 <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
 <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <71751331-651d-43aa-b30f-135cc62e8915@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sPgeqSg0dnq-K3L0CBk3qI-QL3f9z-Fw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMiBTYWx0ZWRfX2zS2GPi0Ii9i
 CJPOEjejcVS9V7kwiOqUUnID+aDcEBfiqXI+buwJZuFTimOkzwUXAe2SGfk7+KdAzkdJrA2dRpP
 UmeKt/NwlolRlxWP96NN2tUX9v0BT8Rdeav8F9+duJWYY1/2Ca14BA6jf7Q+y1CTEINCvAUpkCj
 +AGvM8C5Q+JTA0wcJsa7iK2FOBSa0q4B5tf3ku97FzwecdYqpfSSAY9hCBc6atYzjAgTXigGfSC
 N1DEWRYq+AfVZSKETAebhuuP5vVndC9t3RkPv7/BTw17ottO9ZjUqkg9Y8X1Pj9DosUCxoOm/R+
 VyN6ottnQg7Ha3h2fanuiJ1N82rJ4/+3OQnNJRgMryADwl7fPrme3ZgVbJVzhX32D6JJTqvZT9x
 zdj1ELtLBMvK27xXFvPXaNfJyYlYXxVe4i6Fu8R3n3FbUARwwJRTv999iT6DkQMRrk/zCtIOsWI
 nlaINq9Fe4Na4kyqnVw==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0e8f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=wxLWbCv9AAAA:8 a=QgWWWv2VTRXgYXpbdksA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: sPgeqSg0dnq-K3L0CBk3qI-QL3f9z-Fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160132
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-103431-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,smankusors.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 17B0640F363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 5:20 PM, Antony Kurniawan Soemardi wrote:
> On 4/14/2026 3:07 PM, Konrad Dybcio wrote:
>> On 4/14/26 10:06 AM, Konrad Dybcio wrote:
>>> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>
>>>> msm8960 uses the same clock descriptor as apq8064 but lacked the
>>>
>>> This doesn't quite seem to be the case, some fields differ and
>>> apq8064 additionally has:
>>>
>>> QCOM_RPM_PM8821_SMPS1
>>> QCOM_RPM_PM8821_SMPS2
>>> QCOM_RPM_PM8821_LDO1
>>> QCOM_RPM_VDDMIN_GPIO
>>
>> Ah hmm, the MFD driver seems to provide *all* RPM resources..
> 
> What I meant by "clock descriptor" in the commit message was
> specifically the subset corresponding to RPM managed clocks. From what I
> can tell based on downstream code, msm8960 and apq8064 seem to share the
> same set of RPM clocks, even though the overall resource lists differ.
> 
> Is that understanding correct?

If that's struct msm_rpm_map_data on msm-3.x, then I see that 8x60 has:

+MSM_RPM_MAP(PLL_4, PLL_4, 1),
+MSM_RPM_MAP(SMI_CLK, SMI_CLK, 1),

While 8960 has:
-MSM_RPM_MAP(QDSS_CLK, QDSS_CLK, 1),

Konrad

