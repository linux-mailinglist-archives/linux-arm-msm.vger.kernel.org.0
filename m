Return-Path: <linux-arm-msm+bounces-117434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uRkzBh2PTWqf2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:43:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA97207A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:43:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=crb0II+v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bIe0C0xV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117434-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117434-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C4BB3041AB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B032238D415;
	Tue,  7 Jul 2026 23:43:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552303806DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 23:43:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467787; cv=none; b=kY8GSvqOwokBWwsPq6HCPKk3F4Sm4eftRG1B+h4CU6zV2MJFtn+MXrEn6oVV8SNnv73wl3tiCQq2SUSNyv4I3nq4IfprFyhCCsG+4bEFSGL0cBayFhg0i8xtRVPRtTQGhehlld8lqmhWruZEyb6QW8J4AQfUOarvcCdu5TE/SYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467787; c=relaxed/simple;
	bh=BHTHri+ZfTV1XCCUNlVrsRaVpUzXRsYsnJVN6lmdlbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uxnph5WS/gOhndln1mpR+1EuMxQ/cZo7LOJ5nC5dAwdQQumC0izE9yvxe3YXxKVdVwVinH3/EfTWiFRjSnVCwY8wVP5CfhQ6nCmGdhxuNTwk2rBUt04K4ATgM7NPKrxm+WS/rUa12UiyOUiXV2gQuCXNRD871zZ/H32ALM03Ygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crb0II+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIe0C0xV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MdLW4945673
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 23:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEw6ilYXdZ3qjUDqz2rKqYftoPq3jdoTazkyvgRqJAw=; b=crb0II+vP0BN6QJN
	Pe86QFgoW/X5MGSZwF1FBCJ1aht3tGKmd+Tp0PRWp0akQxy+ZjXPm2aTvzDqmhnD
	jRrzqkqN7cjlykUDc+wiwz7GDCtJe5SXwPfDuON54NEOfkwFeWwuKtXxz+y7jV1u
	rP36rPNN3z2IVLK4bufQgimjEfK1WXw5CUSxV+szI5khyIjOrUdBn4sDrd9uJwfM
	LvS59jaVqrxcEgRsXpsdIsCzAsvVmjDrxWBJKg7rzlA+l7nCM+tpHvoMn44UFUv0
	66PRhE3W2ScSwyWheEUIXc6n+fkXryWX4PG1MAxI4SQAAEscF4HUCNYbCWGPbxOB
	mryYnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9ac9vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:43:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38001e788d6so193518a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783467783; x=1784072583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEw6ilYXdZ3qjUDqz2rKqYftoPq3jdoTazkyvgRqJAw=;
        b=bIe0C0xVdEUZYOb9beqHvkKLMTaj4PNOffnHxbfme2AsTz764+X7ipNZLjgmV+YZnG
         1vl9FfGMIoa39mwNTlah4vadLa6BeCVmZoL/z6c7agzCOmB9gMra4lhE/fsAkvheqa18
         3UDw8Lrd19zD1uqg1JChckW+/3NZA71+e34VirLc3p/BIjvG+lie8c1S8PrXo0daAkwv
         e86MU+DE/RpLt45W6N73MmscWuoAW0eRIwl7Iqjy4Lw4jfV32FeluAp/FlpFvFrm4NU4
         cVzNq+FmxA4/PF77qe2LXQI5fRVk6mBUMJZj0dvekub4D2ygFAIc1NHvYqpbSi1GtjQS
         TmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783467783; x=1784072583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEw6ilYXdZ3qjUDqz2rKqYftoPq3jdoTazkyvgRqJAw=;
        b=DvTAMMDP07ba8zXYClmLA6YvRAxA+gqt3VAslKs6/+X7t0IQlI3zq6/j+3HrlCrl8N
         P6wYYQPedPPS7eRBs+BOmvXQgpB1qL2cYtxcRjISZPMvnckUv4H6M0yHZnysi7j3PsWu
         gAf0r/JWQpAUsn3DsVHPBBLeSzSukw0bpcAt/R3txnt10xt+cf6gCz6WHYtz1Amdng56
         1spp7UsCmrOJo0jGmoMT249+dpHp35mRt3sr5fdZzRjF0oF/q28Yfe6cMlEgkxeFAFJ8
         1mk/ZaAsKu+38mstl39mmUKsxnLD/hiFOXBjd5cc+xv/jLYY/KhCI7fF1jVS6kfBGTl5
         ygiQ==
X-Forwarded-Encrypted: i=1; AHgh+RranyWNk9U0FO1HQ271ZEO43OI6MBuUXhuh7EKpDvoOfMLTXL9ZPC/3jMrKob5KY/ES8m9V+IhgJjb5k70+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6gc615jCQOH+hHW3kjcPfQolrskg/UMyblb4nri05FYivRcMT
	0G5YaRhDFIK9s3JiV/N27zxlrrdkl9n9m9gAPeMdmET7TuO6lnLNqt963q3XwGmRSHVDRSqfoC7
	VSStomjZ8cYq65j1+xhCOISplQ1oydNJmOpthE0GlaMC7J8/cQ4pbo1neMvr85JHEz5Xe
X-Gm-Gg: AfdE7ckCotLznhEU0txjVRKGPeqVJZJR52KgyaUJMiTW5n0gD5g0aCy6sqMlgSeqThB
	j0U+Reb0AXtacKInj0RmT86S5uRP1WBjH6zuOeEWkh5py59fJvxfygjHgN2ItJGRXXOZWE4x0IU
	i715eKRLgIaCgLGdS2PjMyhxdjFeKRN+RblzMZaZxNbA6f9rXvwx13NiLKIGm2hhTrjojL+1zCQ
	O5PoDUcf74/Qk8EQVgBOVYeP+x7+qlsdnQx+UeWHggiRcSDd65vJLge5R1PhDAtGcC26kLbUinO
	NZl99IdYzHwwgjxSPptTQPz3HWQ/6L+aDFgl76ikyH2WuWr5wQjc9A+mWyqQvd33rCEqAQrTiOk
	5vCQp2N3/sCCgDY3CA7fLgtUyE9t6bZ5oqvZERlGtdI6qaCGfMQl2tqZnEHc4cc1mC9iLFZ5/oT
	giTUs=
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr49538a91.5.1783467782798;
        Tue, 07 Jul 2026 16:43:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr49517a91.5.1783467782353;
        Tue, 07 Jul 2026 16:43:02 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm9721413eec.18.2026.07.07.16.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:43:01 -0700 (PDT)
Message-ID: <ee352411-4275-4411-9b78-2e5f7694f195@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:43:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m8bTQtGS1iJDe16bMx-Cut03qYYjgNG5
X-Proofpoint-ORIG-GUID: m8bTQtGS1iJDe16bMx-Cut03qYYjgNG5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfXwxtTUd5I+UpL
 ui9053wJOE8YWOGXFCL+9MbJ7olB+W/FVzVI1VNigmEDL8G5q2vtctej+crpAFOPTaIhn4QAUBK
 RG0NTU7RsdyD1QGka6VBgyM8WltrLKA=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d8f07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1DRqv9_6FyKhlAIeCz8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX0HYck0mZHWxW
 6epeiZdAipS3pqy7js1mbGFHNTLEiXYi6ZtOkzDREvcE/s+uOVDFXH6TbnBf1VAUP1UJTVpC6or
 zYDnRRiul/qjMb79tGchm07mHEztlP9GapK9VVVW28QWZaMNqI9XOeX5MEsJmRC9XRUhNhT2yR/
 becK52JGYp4w1VgvGYkNGbvL2PbzqKy8ITlfxdfVECMuPHWp0Nwb/3eS4n8qOmcZDBj4tRvY16x
 A1O+hQTi4pfZTQdZYd9OE1ZAJtbhmxA4M005iNR258V08DkQDplyjRfiZxecLtF+ppnWA1ZiAvB
 ySWotIHdYtekn4SCfpVU3ZuINJuiwj+hO9nk2Ey08woGjOLl72IUGVpp1MoMHjiZsl1eNX16U9B
 L3ncFVr85xl2hA4BJUHe9PxeWvVOys8Xn6+Oufiz47rOmA7Afo50k5zccKVVfkNANKuLyPKFp1L
 9/2lzE0629GLkn8Qnlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070233
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BEA97207A5



On 7/3/2026 12:45 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
> 
> You miss SoC specific compatibles in the patch. Binding describes ONLY
> SC7280 but you claim here it depends on SoC (not sure what is a
> "configuration" of a SoC).
> 
> This should be also restricted per each variant as it depends on number
> of controllers in each SoC.
> 
>>
>> Because the EUD sits between the USB connector and the USB controller,
>> it must relay role changes across the UTMI path. In device role, the
>> EUD inserts its internal hub into the path to enable debug
>> functionality. In host role, the path remains directly connected
>> between the PHY and the USB controller, bypassing the EUD hub. These
>> hardware constraints require per-path role awareness, as UTMI path
>> roles may differ.
>>
>> The existing binding models only a single UTMI path and assumes a
>> uniform routing model. While sufficient for simple device-role-only
>> configurations, this representation does not accurately describe EUD
>> hardware when role switching and/or multiple UTMI paths are involved.
>>
>> To address this limitation, per-path child nodes are introduced to
>> describe individual UTMI paths through the EUD. Each path includes its
>> own ports description, allowing controller and connector associations,
>> as well as role-aware routing.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
>>  1 file changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> index 84218636c0d8..21f75038a81c 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> @@ -45,10 +45,63 @@ properties:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: This port is to be attached to the type C connector.
>>  
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^eud-path@[0-1]$":
>> +    type: object
>> +    description:
>> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
>> +      to associate role-switching behavior with specific port connections, allowing
>> +      EUD to manage role transitions independently for each UTMI path.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description: Path number
>> +
>> +      usb-role-switch:
>> +        type: boolean
>> +        description:
>> +          Indicates that EUD should act as a role switch for this path.
>> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
>> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
>> +          between the PHY and the USB controller.
> 
> role-switch is per entire device, not per path. Either device has role
> switching or not.
> 
The EUD wrapper relays role information across each path, and
role-dependent UTMI routing is performed on a per-path basis. A single
EUD-level usb-role-switch therefore becomes ambiguous once EUD spans
multiple independent paths, as it does not describe which path is
participating in role-relay/role-dependent routing.
>> +
>> +      ports:
>> +        $ref: /schemas/graph.yaml#/properties/ports
>> +        description:
>> +          These ports are to be attached to the endpoint of the USB controller node
>> +          and USB connector node.
>> +
>> +        properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB controller.
>> +
>> +          port@1:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB connector.
> 
> Add one more example with eud-paths and its dedicated compatible.
> 
Ack

>> +
>> +    required:
>> +      - reg
>> +      - ports
>> +
>> +    additionalProperties: false
>> +
>>  required:
>>    - compatible
>>    - reg
>> -  - ports
>> +
>> +oneOf:
>> +  - required:
>> +      - ports
>> +  - required:
>> +      - eud-path@0
> 
> - eud-path@1
> 
> There is no point to provide eud-path@0 alone. Ports are doing that
> already.
> 
eud-path@1 is not applicable to SC7280 as it doesnt support EUD on
secondary USB port. But eud-path@0 alone is needed even for single-path
SoCs when role-dependent routing is involved.

The existing top-level ports representation only describes endpoint
connectivity. It cannot describe path-specific behavior such as role
relay and role-dependent UTMI routing associated with a UTMI path
through EUD.

The legacy ports representation is retained for compatibility with
existing users (if any). However, the goal is to make the path-based
representation the preferred representation going forward, as it
accurately describes EUD hardware when role switching is involved.

Additionally, like you mentioned above we can restrict paths based on
SoC hardware when we add more compatibles.
Something like below (SM8350 maps EUD over both primary and secondary
USB port)

oneOf:
  - required:
      - ports
  - allOf:
      - if:
          properties:
            compatible:
              contains:
                const: qcom,sc7280-eud
        then:
          required:
            - eud-path@0
      - if:
          properties:
            compatible:
              contains:
                const: qcom,sm8350-eud
        then:
          required:
            - eud-path@0
            - eud-path@1

Thanks
Elson

