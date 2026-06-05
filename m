Return-Path: <linux-arm-msm+bounces-111318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7JGLo9lImofWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:58:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 543256455B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JsihRXox;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ixgAuXyl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111318-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111318-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E625E3023DDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 05:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8391E3FDBEA;
	Fri,  5 Jun 2026 05:54:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EED3F44D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 05:54:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638871; cv=none; b=m2Lbk6YJQW4QQd3yo/pmVL3mey71IRCUcnCOLRms4Gejp1KPEJxeiDceqJrtULYBC1Ay8OZ17HC0BX2Oi5sBCjujCeGyydFbBX80ZPJbnGEyJqpaJUWkzdOdcqL+bMWmZoVsDxxth8TFOzJEPwjai8D4gM54m8yNqbQkFjj+iQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638871; c=relaxed/simple;
	bh=ET/xmjqblmnRoz0s6RIdv44pnT8vwh6Cj2PRnUsuUVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpua7yhB8vYjAVFc/RS13gYpPi0IwCz3RrfTsHEE1w/qHY6HGWcmvqCLRLh/8qyjJ/3KoA1mgNsDXSoJJ8ZfiJYLR7OmeW1vQ8FPFWo+vSQSZgzEMZ/4U5Grv9j1gKT980Sv/dg7CkGs6NRIRPv0JekigcCCaM/VNyiQy4glZ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsihRXox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixgAuXyl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6553YU7A2974829
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 05:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WHvQWVrMY7Q6I7Q5CHZQhZsKVw1kfb0gB8Hxtv9NhU=; b=JsihRXoxNQ19qXF9
	n8Zmut16mdVZZ3L0RXq9fRHVpMdrGN3noW60TwDsCeDaE5aoKxqwlbR5s7PdW1dN
	76xuUmJ4KZwJa2GyytFUU9AYw2LJxsON29Hq6volUj62yo6f4ripvoK8MRvoUxyk
	9jI0tdVqsuCtARDStxKs67nYaBL0O4+eY50nNc0l2VmiPWd9oQsHNk9QV0HMogAo
	GC2Sl+0lbNRisbq4XqkDn10cs5UOhenBltdtpmvnhR95BkylwGsxpHImL34O3IOz
	qvjaQqM8/VZlApOTYJEzjrcvPW3SDn/SvWIKVU4mUBVptvXsKkFRuYnkdS7hVHIS
	Y4Ggeg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu8dk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:54:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso20446595ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 22:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638868; x=1781243668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WHvQWVrMY7Q6I7Q5CHZQhZsKVw1kfb0gB8Hxtv9NhU=;
        b=ixgAuXylIA29SE8P/xLcU/d82Eb6u1vEUFU5lwf8wfC+Ip/o/2xCYnL51FkfVhMmrR
         kootcNLl0QJv9xXng2xVsGJVGTfIn/R2OzvrqwbSB8cPE7s2EXYXLtM4MK4VV8+8oZNI
         cfIzmFPZdeZ48MGJNvDo/Zz70LY+aWzo943E0zde70sCzkUg4SzdxrHjSXrVRuBAB2wm
         EjNX3u9nWvC5PcZ4Fl8jNLzKx5HU3HrPNTic78fvE28Rp0RWlntroZQnZLKpUi2BwGBH
         WpaYBaLTOxUW0uynjws1+4X94bnj+hVudhuaAnf0ZO7LSrpE4hOjchcm/wb9mPNuLCEa
         DfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638868; x=1781243668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WHvQWVrMY7Q6I7Q5CHZQhZsKVw1kfb0gB8Hxtv9NhU=;
        b=QZd/NBZu2sOP8hp85sSV331j004TKZC6Ec2yNPYgIxSc0u8Q/FiHzf10dGDQpQdeDl
         YHJCWlBgW0hjGnbhL9sofdSZyAxtuiWaflWHPdoD5tfLwy7Ybg7lUd/LHw+h2eaZbBpQ
         xoZmk81N3MZ8kfhW9fUF8URQeZNBdz2/+Yd/PfZCFtoBxJLf9GY/NB6Xe3CKljxLiZ5c
         NQCGknQqJQmi4U4etVHzkfTONvVbDiiSshe0IY+d7+O4jwU3NeoxbE9rqp5qZD01qIL4
         FGhsLye7Uh/mc2Ip48XapcCEb2pNdRcyqEyqMvXGJ6p0yz9bpkyoVRgPEgXYlhYo9dzS
         WQlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/lzWvAUCM4SI/ZvJ1w6DgrPO2M7HJ7fH84ok3DyZZaIAF8EA3ySUqVIYYtkhH5H5YOqPBwwkkQT9JKfGK@vger.kernel.org
X-Gm-Message-State: AOJu0YxDNK7jTLByVgU6pftHhl5vu814XlL99MwY0wa6UmQpCAkdkNv7
	2u9zoqGB4i/LnfD6+XTS0tCsmYiI8vXdUj63fyECBWDCnYjPj3iaSv/48gkWxxZ7BCqJrqWk24+
	tbr6cU4QHmHSCIYtjs22DHsBxEpO4Bn9kPxO2tzx9VJNocBE1B7m1hIRFcKafxi8JBco7Wy+QeL
	htqSYGLQ==
X-Gm-Gg: Acq92OEJRS762iZtgG74vtq31h05eY1Qu21dbrbUNQv+VNB3mad+m/MRqgVBO2Bp326
	12N6RBvsiUFgZccYaKLgKxdAXVjcfy9zv9xz/t4BB6Q0LONWNj/4IpfY5q2ieiV/brl+G/Y2erq
	/aHmPBOHcTicqDcC9wlUX28HIaGJ9dOPM6KygcTTyLFTr5bxUQ2PgGPLKnV9WDCABnNWrgzCnD4
	3iTR5x2+PHKfguTbqPFQ4gtL84ggb1RPbOnxi3NxuLZgszd7civP1qaC+RwMADahByQoSfV9AFp
	Lr9+m3UNfkQSkeknG8DnULI1mOIGiO8mikNu7xdf9CcvMcnjpjtkOhgB5gjTd8dF4hqGuRQkwus
	3eA+c/FH+6ZqUTUxi2Ekrx8sFTrB6KO10g7d2DFR1Du6cSUrEnanD2bRfjxcyLr00gE2hgzrUMW
	nnzHnouFkUjJWk7DMpjm2ZWh2ZMWQ=
X-Received: by 2002:a17:902:e78c:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c1e80ff880mr19922655ad.9.1780638868291;
        Thu, 04 Jun 2026 22:54:28 -0700 (PDT)
X-Received: by 2002:a17:902:e78c:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c1e80ff880mr19922345ad.9.1780638867887;
        Thu, 04 Jun 2026 22:54:27 -0700 (PDT)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629c08bsm79168795ad.61.2026.06.04.22.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 22:54:27 -0700 (PDT)
Message-ID: <c88b955b-5aaa-472e-a928-eae8bbc7feb5@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 13:54:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
 <20260530-primitive-encouraging-quail-ee8af1@quoll>
 <c7b5f9cb-09a4-448f-8f49-bdc9570d6b29@oss.qualcomm.com>
 <87b24725-1c78-4830-a61c-e486c4cd4f3f@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <87b24725-1c78-4830-a61c-e486c4cd4f3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RRosCBegyCg0arilX1nOdrjgRMNrc5r_
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a226495 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B0G_J6igUEDZZdstlRkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1NCBTYWx0ZWRfX3ZjHvv4qbOGX
 Q4OEUtd6CXyVMkTimn+520zjnCoJsfShUxGFy0qAEv2P3saofAuK6vVd1d868RyZcYFI/eDRM7a
 AwdaaDPxdb6u2AjRUlzUPxtYsJNvRm9F/w6b432+FVECg9a5iGN0a0TvK76dTL87wsuch1iBogz
 d7c1wK6tZc+uE994ZuRJ5vuLsTmlT1lBYisidX2B2zs4rOsQHpCO+r44H1v+NQ8SoNDe9QicLuX
 8v2g2IDPNdKpg0hj7P/obbEpUM3FuNIaYQQLucWPSqLKX0kGGdeYOkgUro8SSV5ooqCx30jdlZd
 OGNzPoKCwJYYBJ6DrTWoKadMPX+jAJC0Dz6D0yARq5pKvxIlFRG2eIA3hi5VfI/MW/uQidjjYV+
 DiDar0xx0MRjGrhyMaDATz4h+VSRDy0er/x5f42IeCIkE4Cz6IctaEgVtOujwLk2S+TXjQDAHzr
 D8+j1YagolwQTZp4zng==
X-Proofpoint-ORIG-GUID: RRosCBegyCg0arilX1nOdrjgRMNrc5r_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111318-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 543256455B9



On 6/1/2026 4:38 PM, Krzysztof Kozlowski wrote:
> On 01/06/2026 08:15, Jingyi Wang wrote:
>>
>>
>> On 5/30/2026 6:42 PM, Krzysztof Kozlowski wrote:
>>> On Fri, May 22, 2026 at 12:42:07AM -0700, Jingyi Wang wrote:
>>>> Introduce Top Level Mode Multiplexer dt-binding and driver for the
>>>> upcoming Qualcomm Maili SoC.
>>>
>>> This is the first patch where such name appears, so same comments as
>>> before for other cases - describe what is Maili somewhere.
>>>
>>
>> Hi Krzysztof,
>>
>> Maili is similar to Hawi which is not announced yet, so we refer to Hawi
>> to use "upcoming Qualcomm Maili SoC" to describe it, shall we expose details
>> now or add info after announcement?
> 
> Just briefly or how much you can describe above.
> 

I have added a description in:
https://lore.kernel.org/all/20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com/

I think it might not be necessary to respin this pinctrl series and one-line bindings(e.g. SMMU)?
Please let me know if you have any concerns.

Thanks,
Jingyi

> Best regards,
> Krzysztof


