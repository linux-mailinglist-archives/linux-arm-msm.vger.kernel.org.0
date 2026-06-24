Return-Path: <linux-arm-msm+bounces-114421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mt76FSJBPGoClwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:42:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3A6C13C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:42:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="G+kOedp/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JOmz9Mzc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114421-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114421-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF340304C6C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA65237FF63;
	Wed, 24 Jun 2026 20:41:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349CD37DEAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 20:41:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333684; cv=none; b=S3SOF/qYbIivy525mqC33msv/I2W9GNM302K+du61k1JohzWdW1AJLQfm3kAAYUWdaj0XI8TAC9Xo4frdiUCGdeg8fm5P6i42y0pq7k45fUbqBzf0+O3rr9jXEgYD3x943JbqK8WYQfwYntGWHD9UdFo87XPeB0zO+9hDK9twog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333684; c=relaxed/simple;
	bh=ktFuLBod6PkICS5eU2aAXOoPaoNHT5FsvcQS57K1xyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oej45JhLnAipNrNrr6Tu8ySmDgMPRNFyS77Apm1HoHWSx8kUmURdu1liNWvsfo03kqUB8yX5GeDcUXWGNLHNaQq2AI5RyoKDOSQcDif/+Wdr2ZgK1fro/Py1GoQUl6RCEmCFW/yWFIxC0Fla3WL1lzMla4qbjJSqNwGsUncwdmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+kOedp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOmz9Mzc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJj4j83828128
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 20:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzilcVAWfMphGHBUGGTpHmQyinvK3m8bXOKcthvVDMs=; b=G+kOedp/l6hDz4IP
	MRKMghCFfffhYlvzlLhU2vsVFfjAUus19l6mhBa8bXp+Hsg2ItVlQLkV98/xaL+j
	6YeSbTAXsRLxxIBSUTxSX1lIBBXbmQpt9JWp7Ia7EzOSVBEx702+RG9+oYaLyBNk
	9O2eajtaQ2KqmA+cfyR/o+ewwMpQ4KDc6s34wSYMilMLAhbxysaRynubMjke3mNy
	HjefyLKQbFrweKdBLEkpQeIm8OXLdGuNVrGlYSyTKXm9GQwSICD6XMMT4CnvJt0F
	+otPB0GdvnNRg7zbZcS+NPgwvwuO34yaE41GLTUIg5CgWb6dMcR1kru8u4Iiqtmt
	osHP3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbrev9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 20:41:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91576c147a4so313603285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782333672; x=1782938472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzilcVAWfMphGHBUGGTpHmQyinvK3m8bXOKcthvVDMs=;
        b=JOmz9Mzc8MUB4pzitfG8Og5gL7ERfzzNDsYEK1KPUViDmUbHYAAKDs4gdSsJQkZYA8
         z3YPXuyj7fORp1OEIPXB/ncR05WnJPvkp8UJjojuFoZzb8atqjyzmFelOWbtjsSjV/pR
         KqKn9Y+1P7JRYydcGVfhW5dXj8U9HvqjJkysScLvDipY6dk45nVItvZSBD7LBqu6Du5U
         enYF63freqUWg480l3RhNzJi0Lx7DnASN9XN5I9TEkI7Ek6Ucxd4gmMC3KdLk1kyg7DA
         WZCaAUcj8Caj6NcPBudzXsT8p/U1+irn2MffTIGu9HcDz77a8BhTVrhiV2wC7yuYjDOU
         xkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782333672; x=1782938472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzilcVAWfMphGHBUGGTpHmQyinvK3m8bXOKcthvVDMs=;
        b=jKNH+SVJ8PVp9aODdLnbjga2arN4cwHvkmlSmhIzPIUhsG2sMCPTRK8bfd27+3RZdf
         mgLAyGeIMh1ygxycRumWjtnBkbhp5qZnhCgV39AEB/XZPZ5HVDW22cCQpXm7sIr4HT+R
         dqJ2mxNXUTzk+K0OkY6+m/Akf53mkiM1bGJ/NPNoRmOVO3DmyGKbL/aPf76tszTwHi6W
         BY1ZnfKEHei4bJmXR4Lyx16R1WMP7/b2pzIpU2YSyVVybLu2GUAB7rwv/4lRUE1NGxBx
         Osx8NY/LaTPt0bUOhLvVV0ar4dWN/eLbAJxPM9nmMWRDrS2lF3Dm36AzrfjmX/NRZPxO
         uG9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/oUEunlnUEmpsNVde8id7rjaoMcKK8rpzTpkkkENRahcw/UqbAvzB9jEXHw1ErU6c4sLaMxpPBPXUEdfXZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbdj0W06YX6D9AzP1cgQ+2rTCE6f9OU4GVCsddqt5SnHZy28rQ
	QycUGIkXV/4p1LST2pVSumSOo3Fmdkw/QTz6NB0R1q4RrlAF2zJPf0eqpV9dKv4Oqb2BSQTBIyh
	7sR6iaqjg+rzBAAY4hbHjy9jveaeAfqeqjOsPbRSVW6iwPG+KocBAKUfx0vS/0mxth2KC
X-Gm-Gg: AfdE7cl//DjwpvY4bNuVmz3tQayW4FInGc72sfSTrsFnIZ894yIRcNj361slxw3A3Uh
	214wVTKJrRgxSvDLxFam4WA0dNCznFqk0khYE1AaHkYSG2R/qQVk13axZ6f5KtN94EZyA1SPPb+
	manULpNcD2VyhDIujWpANIlw4o6ryjXZ+BHcGApNDTl9+rzamkr5Mq4l1xJLDt4p3NC+0bpIWVt
	EnKzevkoPhbJbY2F2l3wvQsjy632JHsd7FFTPr140NT/El+YrWifpXq1oGV68cjL74QqbnzVrsJ
	NI3suouyUliwGMJuZn3HgJDvlDVTJ+Mo9tn+c7Jrk4ufKG60RoPdDurAyHto25xuJJN3UEIOMdA
	SrOxPSGQa+Pd+D+uhC67aeFtWVuiwM5HEFYAWteBDYV+6dICiBeQuxgQeg2yR4tS+25DxPZlIyw
	==
X-Received: by 2002:a05:620a:3724:b0:914:9ecb:9adb with SMTP id af79cd13be357-9277f6db9b0mr759157085a.50.1782333671733;
        Wed, 24 Jun 2026 13:41:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3724:b0:914:9ecb:9adb with SMTP id af79cd13be357-9277f6db9b0mr759151485a.50.1782333671228;
        Wed, 24 Jun 2026 13:41:11 -0700 (PDT)
Received: from [192.168.10.101] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926544dfaesm1511725e9.2.2026.06.24.13.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 13:41:10 -0700 (PDT)
Message-ID: <63d42dd6-862f-4a9c-a950-5bc90ffab391@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 22:41:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
 <20260622-armored-witty-tarantula-84a28a@quoll>
 <db8f06fa-0dda-4a22-baaf-8a708d43e113@oss.qualcomm.com>
 <d0528339-8be9-4895-a054-625df96ca926@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <d0528339-8be9-4895-a054-625df96ca926@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfXzLNY6L4wJXpJ
 Dq4JjaqP3aYVtHncza+fnWGNIaUzoMl2HimqWwbUHkXd5Cl1IXdi86TrAtT5KmJvHB/Q3qlGpMN
 WnsRnsSKVnYgDAAGTrzFcUAqbBqemyw=
X-Proofpoint-ORIG-GUID: ri4vODqcoOhZNoDmdHYjKdHshkqqBQd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfXz5ojlTZL9eNq
 Oy1BIEZQICT1yUbKS7dDwcVXb+0yY1vw5cuWd1LullNpNIp98/fYJoNrMXjnamzrxr17waiiziD
 xlRl79V8zdMvXcfehCGIq1IdDg6Rcw+iKhhrQnqQgnnooLqXbRxtQ65c2Z5J99KcUjpCKN6aui5
 INDoDvT8euc2930As+JEPhJQiJ3pL+97tniSy33ZB21SrOyTX98bLwXAFgLyzSQy4TC2KB8Arih
 j1cuRmtER/tyrFtQZ66y8OMDxP0txMZxvY7m4ySR+HiJVPtIJBFELLVIAY4tBN9J7vhzX/y40PR
 RD9hDNjp3yygsV5StH3m31nhO5EOWI2FZJwtq3uNKvWTC1JFDKtvQkNgHYLnZGhJuYs5KVd9hxi
 KcdoqNxBwK0RGTK+9icplhosLz8VFCM6x9JQYQ27w0taTqv46IuL/ihqiB/T3rj/DR1oGON4cjH
 i09+yHN29HY1SSDoZdw==
X-Proofpoint-GUID: ri4vODqcoOhZNoDmdHYjKdHshkqqBQd_
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c40e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PPDuxORCk0BztKokjgsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114421-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7E3A6C13C6


Hi Krzysztof,

Le 24/06/2026 à 12:45, Krzysztof Kozlowski a écrit :
> On 23/06/2026 11:47, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Krzysztof,
>>
>>
>> On 6/22/2026 5:58 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Jun 20, 2026 at 02:09:08AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>>> based power monitoring and limiting capabilities for various domains.
>>>>
>>>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>>>    MAINTAINERS                                        |  6 +++
>>>>    2 files changed, 53 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>>>
>>> What is "limits" directory for? What sort of class of devices fit there?
>>
>> Added for devices that integrate with the powercap framework (exposed
>> via sys/class/powercap). These devices are responsible for enforcing and
> 
> That's a driver answer. I asked about class of devices. powercap
> framework is Linux thing, not a class of devices.
> 
> Please describe hardware, not Linux frameworks.>>> monitoring power consumption limits across different domains, such as
>> the system, SoC, or specific subsystems. Any other better directory ?
> 
> I don't know what is this hardware doing and commit msg is quite short
> on explanation. Power monitoring is usually hwmon, but probably this is
> not a hwmon.
Right, it is relatively new in the device tree bindings. There is the 
Intel RAPL which is the same device but it does not belong to the DT 
namespace.

RAPL : Running Average Power Limit
SPEL : SoC Power and Electrical Limits

It allows power capping and read the average power consumption for a 
specific device (or/and an energy counter)

Basically you can set a power constraint (power limit) to a device and 
this one won't consume more than that power (the power limitation 
strategy is managed under the hood by the firmware depending on the 
device - lower OPP, idle injection, modem weaker signal, etc ...).

The RAPL or the SPEL have a hierarchical power limitation. For example:

                                     SoC
                                      |
                           ------------------------
                          |                        |
                      Cluster0                 Cluster1
                          |                        |
                 -----------------        -----------------
                |     |     |     |      |     |     |     |
              CPU0  CPU1  CPU2  CPU3   CPU4  CPU5  CPU6  CPU7


If you specify a power limit to 'SoC', then the power consumption of 
Cluster0 + Cluster1 <= SoC

If Cluster0 power consumption decreases, then Cluster1 is allowed to use 
more power until Cluster0 + Cluster1 <= SoC

For me it sounds reasonable to put the device description under power/limits



