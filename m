Return-Path: <linux-arm-msm+bounces-115597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GwM5MYPCRGqx0QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:32:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8256EAAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:32:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IbO2GVuM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hQ+CmHNe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115597-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115597-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C00BF3015D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6D03B38BB;
	Wed,  1 Jul 2026 07:31:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D493B0AE7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 07:31:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782891118; cv=none; b=j1urU7eDUlV6lFo/u17UkchKEGS+c+omeCPHpYyOp/MMjickmw1jtxrir1tC7rRxC0jnppYAvWgO/Kj8J+XyIKdyyNDLQ/72VkRO1yCzS4PT8lDxNlOT2m3K/HbWICXu2byGwlko0SMiOGYECgzlAn9rWYtLb/b6MItA7+kjNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782891118; c=relaxed/simple;
	bh=F3qtJ+0mswTvasfhVUrEPXonE05o5W9A1VPiF+r6U6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9w27C0NrC4cBo75tkxhRmnGw4f6mZUh5GuQBKG3U0bBk7J1rGrAMbDoiAF/u7OA1VvmhKhslF1zMmiODRq827VA0FoRvd9sIHCIKFa17Wl8ITWrtMdXfvJhOAoe46mDMHf/MsDeCsr0AmIK26BSKOOqAR5Y27V4AOg4/ToBGWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IbO2GVuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQ+CmHNe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZ9A154309
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 07:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=; b=IbO2GVuMXURSMRsF
	LRpjClDudvMqMNVJZqH1icTdQwvnrB335lkClOSpgpH5NxURfQyaT2VCpbqCbzBH
	5yDxZ1fHAGonqABfbe4eSPysXpXzJfnruVJv83g5cXB3Z/AxCbv6/cLfeTf32CqN
	gjzzqr2ANytjyg3uk5PdsTjnrofiVsJT0noHFHLe5en8l2wNpJLIt6vpgbgUWBLs
	qyBJKViRDXVa39/WDBekRvabw2AbW1Pnz8nfkltQq0NQ5tJk21NJIl1yZr+62u38
	ZOvkhuCqj3zBejzNgsanvCxy21S3m2j/iSS7ZXIXgSCzoqNeBQG8AFkyBJsYxG5w
	H88CXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j9133j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:31:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso10579285ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782891116; x=1783495916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=;
        b=hQ+CmHNeiMAMD+NsBYGAuHHn3Nxh1zgmYierXk85Q5xS5NrjFNmVI317lLgg0mhMUp
         iWzOxHl0Is2Wh1JhtQZnqAWJr3P1VJvmIiN6oNwUJ/D0GcQ/aJrv82tKDTqKHtj7dMp2
         IVwkOuVlIefyM+e0tLGkd57nm616t9nVCoWl2KdO3HvqAVY7WHPY7Y2G7V6aGUvQ27W8
         C1ovFPo9de7qNB8enZgQq632VudXMp0OktuslWl4l691VR7Va3wchssPS3RxyvyusAXC
         yP1mvHUDnkkrV0AyBq9Wal8mW71LdzIWnEBMSv9gXYzIUhLMKbsfwhgLNoPZsd9EpmHh
         4HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782891116; x=1783495916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naqNMluZvhh1zpVu6XPv1SQCAhNN/GX6Unyao2I5ZNI=;
        b=rvQpjQBp3aEWuwVR1WcJ21F2TL8SuijKlMLpY+QA/1FOU1bMperbOGeddxVkYKkc+m
         j51OrEILNkCipjrQbDy2Dq0iGbfYWw0LzcDtaa28Uk1xXYxD4kWonrpzr/QK3/SH8VkS
         QVMDeHnUroy0sg5qvXMN3rPir4e7v8OUQTLJe6VodbDyDAXVa6gYgDkEfUC3CpaDu+qq
         1R4v5RBUeX8h8RYj2I+iK+YtqMbdIBozBCz4RmNXCH0HaWwrV+Rq4Tx+8WgTvM/DgP01
         WhitgwBfNyHN0wXcRtUZAvgEft9xWHdiyjNs6tSyhoEH/DkAAL8trAZiFBpGkRBP+cNV
         Aalg==
X-Forwarded-Encrypted: i=1; AHgh+RpX8J3ungWldF7xhHx4SZ7lhQrDID6Q4/QiAlD3sBe4Ma2qhZ5WEZ+l8IungwkZ4abc2BalNpuUFzvBjotW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/3jtNazLuxRv7rXRCM8IJxHlSGwis20KK2cnPj1Ec2aT2M1zr
	hdH4t4frFfbsK3qS4BPIgCQS3vCfz36Q/YzrMgLeV7nsi5opbMDxMJqeIccVtxkrrMBdN+Xm/q4
	Pu5fsJwV4Rqk8bOkF8SKShJ9E82dmifI9tMT6inGNGvA8NkVzJjGpY1paqXFdGSkiyeom
X-Gm-Gg: AfdE7cnD+d+swB+di34fKOWbSa+UsFW5P4/RJBDE//yCiQzG02JPxC3STT6MSsDu7R/
	rmo9kUe8RXKxsunbrJEuSJiqBUVfzFHw0sQ+ZrCAfz4+/3+db4qtqpnkb2qIh8UAidn8B+QTw7k
	z4Ybowo4Ez0LjICrBv+uY/sP6PmktOWeAglae6WsA8WupL5EcEY4J005iGXNz8aBnKRowfdQ2rA
	+yBNTPWgh1lf61wo1aoGLTImTQg6u3ZeigujI9VuJ84mO3qEzsNRrLFfsd3A6rnfVw0pNHt676o
	o76q6dbEm6iPzE51hyMvUt4d6Evn45FIVcKvQuoyG2DjG9k2qeozf27COaDj1vGgo10vWXE5GnP
	eW3BRCIogRr/F3kpFuRuHxhYT4s7rccZfARjc8LBaho8nOcKkbcyu9h0wxtlcwjigykdtxpJLL5
	4=
X-Received: by 2002:a17:903:2f8e:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2ca7e6e1653mr6427455ad.21.1782891115646;
        Wed, 01 Jul 2026 00:31:55 -0700 (PDT)
X-Received: by 2002:a17:903:2f8e:b0:2c9:ff83:41e3 with SMTP id d9443c01a7336-2ca7e6e1653mr6427055ad.21.1782891115085;
        Wed, 01 Jul 2026 00:31:55 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c2e8sm26960375ad.43.2026.07.01.00.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:31:54 -0700 (PDT)
Message-ID: <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:31:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bt9Mqe8dPBcFJK5WVJPMCUWks6JVcD84
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44c26c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=TEn5Sf8rmKvuiEhX-CAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Bt9Mqe8dPBcFJK5WVJPMCUWks6JVcD84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfXzg1RH2tNcuNI
 m91dB6s6pgxK5TUPDhrPFh4WBYJY4xJQTG9OZjRJpLZNAobqySaCskNrQPqU3AqGgxfP+szHb7s
 Nn0kpqWQEo+U0QQ3POJqAGx5zm+YziBpeFVgTW/OLdBL1lnyLeJwax1jRZe2XXS170QpUJkXUyT
 KJ+w93yQohf9NlDEYQ8CjHVYH2N8q8FDEjHTmFuFnw39V4TmVv7uKmxuvA1s7xr6k0sqZ7u/aEC
 lWeGa/245VAVt+pUau9SJJyXe6Io3Xee2cJCRwpr21PbVDIAHKixeCLu5SGq+wjC+V/hOr+8rda
 IAPOa3diD46zd1fMtxSLcLk/PzCb50CtHdHAYPhTq9ZyaXpy4oG10MxbPFv8dKXkcwn0Rzodrm9
 pQSZJvA7usZLQinpd2MSd+SpwMr7WhQ0Ix4ULJnVSXOcLqVdXoRjg9TGaZ1CoWY0yx36Xdsxyd3
 A489tgIxw6fK6RCN/7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX+SWC0nQnup+N
 dW9NstyGN6sHyh58cSIIrlIrhuoeB5jsejgN4HAP2RrEB/MB8V3gz5KXASbrKrDq0GRED7+7URo
 X4v83fb7aum0m35k1XJppyIdKBtt9U0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115597-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E8256EAAA3



On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 09:16, Jie Gan wrote:
>>
>>
>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>> AMBA bus.
>>>>
>>>> Convert the compatible to a oneOf and add a standalone
>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>> created on the platform bus instead of the AMBA bus.
>>>
>>> That's a Linux driver specific reason, so not a valid one.
>>>
>>> Describe the hardware instead.
>>>
>>> Also, you do not get other compatible for the same device.
>>
>> The device is intended to be discovered and probed via the AMBA bus.
>> However, due to a hardware issue, AMBA probing does not work correctly.
>> While adding the arm,primecell-periphid property would allow the
> 
> If this is not AMBA bus device, then drop primecell compatible.

Will drop the primecell compatible and update the description.

> 
>> existing AMBA driver to bind, but I think that's a temp WA. As
>> Suzuki/Leo pointed out, we should not add the property to pretend the
>> device as an AMBA device.
>>
>> Instead, I introduced a dedicated compatible string so the device can be
>> handled by the existing platform driver without relying on the missing
> 
> As I said, that's a Linux driver specific reason, so not a valid one.
> 
> Fix your drivers if you insist on that.
> 
>> AMBA primecell identification. The purpose of the new compatible is to
>> clearly distinguish this platform-specific case from the standard
>> AMBA-based implementation. Or shall I re-use the existing compatible
>> "qcom,coresight-tnoc" as platform standalone compatible?
>>
>> We already have a similar pattern for the interconnect TraceNoC device,
>> which uses the platform-specific compatible string qcom,coresight-itnoc.
> I do not see there a fake, duplicated compatible for the same device.
> Can you elaborate how is that relevant?

Will fix it by removing AMBA related description.

Shall I update the clock name from apb_pclk to apb as a platform device?

Thanks,
Jie

> 
> Best regards,
> Krzysztof


