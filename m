Return-Path: <linux-arm-msm+bounces-94132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLd9BSUKn2k2YwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:41:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C2198DD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33B26315EEEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1410535B650;
	Wed, 25 Feb 2026 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjNagOxF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="is/INAKc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DA387362
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030295; cv=none; b=fGYzCQl88Kj+vfA3qwH9jiNPZZN85rJnjq0Y71Gp2/mQH26uYB/VRa/ibSeQQyKuFBXKkNOcGsYMuXb6NyRL44d6EJKjO3QX5BSd5QfZBazqqeRHLMZ7h0m3vhcgspZn4a/etBm+JufbMlILoAoD8xzW0uNs9AV9i6KdqnotN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030295; c=relaxed/simple;
	bh=digNdhj5ymvK93iQkbJJBvbVfxcIm31TqcqnBr+Bogw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZ5WixjygXo5hX7Yh2eQ9ZpZAXmdZ8GJF4Q24CJEMF5AjIfrN50oJhT7yiPLEuVZHaeAvEKQ5Jkx95hCMc0t6jZnBUjxWGGadQlxYZ7CR74RyjFzQ9DEJJn5CFFG6QSPKSUkhulQCfy8NFVLKVRIvzCWALZPzj7oJCORjsNnA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjNagOxF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=is/INAKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PCuomq3505069
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICZwg1StmPCHqHGLiPJjTvu8ue8fmrDu8Hu6winZYZg=; b=XjNagOxFxIzW/NW6
	AWWksZKNcBl1H9VOudepKSFFYINVSKZxHJAWlBgyPYFh17CC/UhndiRDummVi8s1
	PGUz3uvWU+gllG0vyCJsmlLFkfEKFM9bNb6wEXvsp272Gzaem+ZSGhxcFVsr2TC0
	0JgShWdFhP6/3FfMXkno34eN/4ucLmKeEa9RK66uJROJ2ykbWlBL3ZLtYRkWOCxv
	oSB5YNhMo781na4aErDPzxtSWr3KWaO/GaIdwgpKNacDwjG6Z4JB6p77wPyxUlCZ
	R/Fx9T9fXpLjggG+/5FQXEMZ52rmsDD0MxfM7V88FReyVIceGsiAGzhMXJpL04os
	BIzA+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39gxyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:38:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899c0fa75b9so1383396d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772030292; x=1772635092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICZwg1StmPCHqHGLiPJjTvu8ue8fmrDu8Hu6winZYZg=;
        b=is/INAKcgtxdGdaJEK3c7TOUpx2wLSGARiDkHlxSvQjQIm6lXHFVR5C/USa7Zo00Ap
         gkba/4WboH1o5bl4S4NcelchfalGuid06P7FSbVOKPtp1e2D/8QI0Ay90aLGLZzyzgL0
         AmyMjoe8NFEPDms+21mdGF/GWGHK7OTjqGaibuqoJrWHE9beCfJ6pzAQranlTQuX9a7H
         vZhNVBU+VEXDsadBPkPEfxI0q9d1u/8gkGQmpLrCnAgEvNLW7Me2nBTBTdO07txqgGIh
         9YtOCX9Mx+NHZk2CGDdO0oq1tA7udM3EKwAcHUfRlP81lU8PP++81gKqtMSFOKZRbBwp
         x83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030292; x=1772635092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICZwg1StmPCHqHGLiPJjTvu8ue8fmrDu8Hu6winZYZg=;
        b=tcdnxNX9zi/pkBWYZ+g8XvrZRoHwXlh/dSoOlpHa10iu8hy7llpIgXJ4PEKWMFpSW3
         WI+n/sUrcS0ed8h7zGktzzwfBQaA9rpHiADurJ7FWvfyKdsREN3lcUrgX8HbMZMMW4pA
         p4UGV4oGOLaV+MhEPUR0dqPuKc2W8ninj68O9dY+QlHwtsKE8PT1HA6VSQTyWcSHa2if
         kigXB2zTyOjfdB2phveUY0qY9GmqnpY1bljQ3QxyymBBJfjCXO5/5+75uZg0EcAJV70O
         YkJxAI5AyC9q3U7BqXWBziAJVVqwAjV3NpaOCYeC/M/pig3unZHvBvhgRxkiuBe3g98p
         OOWA==
X-Forwarded-Encrypted: i=1; AJvYcCU6mdDQyDKb2PqjsonPbiURydxxIrt8KMCw9Yb7N4Vn72Fdh16yITevuTcK6mhToelh/JUa21LZsMHUAgOe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TZA2MGMU9Ikt22KQdZbDfKiARscVvTRK8oLqG2jDQvNeYiC3
	NwJ3i+g408YR9Z7n85VoTa9d8pjMl9EG0pxEdJenbFH++N/Wqc2IsouucllYYQTqbXk9AKJSCYN
	wj8iTCL3GoFcASP5rlpeKxLCjmAdJJUgTCC1ko47niqlGDO0PUifbk0poGwCUgMk11knc
X-Gm-Gg: ATEYQzyTaOnrBxHVdXiiahLlhEUAMz8Sjg4kRqm1pAmgvUi1i3/JSYhw2hOsDOhsnEG
	rC3Ajzodi/4EGbhc0sB56uENYWXKOdHzXhJG+u/OLz2Yf9qj1XvltMcgdjvTC2MfkeGfnsuXKoR
	ZTuSoNKKo2rkIF2/OqcpV+uHP74r/9soc5sfSxYYYbekg+S1Z+4QskXLeWqS6yc03+efjbCGhjX
	5zuvXGSRUTdxQrRYM3NP71AdGMfQVZ2ieAAiywMlGyf8ai3Z5SytzxuPBAF39cc0fRIOLf00JLy
	WrAtFptoLSbsH003HbOklQgXdSPlz5nfsHxdb5TPZ79DE+dDPnC5O+GTiZ+GFgt4Vitn2uEXuRM
	NIE5LWV61hpay6pbBKJcZ5n+BJs0Mz2js2WOaDHbeJFfNa4DFIor+uGdvnaKRoPp0FSNSgUhHiE
	n8LF8=
X-Received: by 2002:a05:620a:4154:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb8ca8a757mr1520292585a.9.1772030291545;
        Wed, 25 Feb 2026 06:38:11 -0800 (PST)
X-Received: by 2002:a05:620a:4154:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb8ca8a757mr1520287485a.9.1772030290963;
        Wed, 25 Feb 2026 06:38:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084eb912dsm536073366b.55.2026.02.25.06.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:38:10 -0800 (PST)
Message-ID: <c7469822-5c7d-4040-917c-e40533d0985e@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/13] soc: qcom: geni-se: Add resources
 activation/deactivation helpers
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
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-6-praveen.talari@oss.qualcomm.com>
 <05340972-2013-45b6-801c-7e52fe48cef0@oss.qualcomm.com>
 <9b49a776-a65b-4210-b335-627a296049a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9b49a776-a65b-4210-b335-627a296049a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzOSBTYWx0ZWRfX4eksmmrO1sPk
 7gSDLCSTvX1zdPncsxCjSZ9NKmWPTNWwcFeASnVE1AczUl6lGGu7fE9DnXvrWXoPC0E3u2y/7OB
 CJqC0xu2cFyvrFFxAJZDCJwndr+CjHQvBhvTmOpJ0rV4j+dUHpZgdRNPM7vzE1/nCvT/kFuAmNL
 SCjoYCIf+O71q1+ltMXyzdNvrqP3TeFQGFoRuyAjb3eHb3hjAcCMiq5Ax2ldR5hAZ5hD8cUQDYu
 MXUyTC1gc3lNT9mhw/sYsznk5NglI4a4dAyFRrBmsFw3Pswr1L9o3oTA5KgrjPSIGOGC1D6V5SC
 kUkjfW/5TaA2m2f1ApY4wAFtHkudpeDPQp0unO6IQVm7NtIuS8qnAUTmhGrlkgCJxAWoMBsKP7k
 GKdskEWImtEQ4Tarch3RzFlESYkZ0lXjKOXu9baGCFlOnhWscMShJzZrNHCHY/hudsAXFvbg+E4
 xdw2zLmtjqMeq5lVVmg==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f0954 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pvrQjcnNlfa1hpXBJfkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 7cCE367-mGJORxL7sCwuScdiF5ebj6Lf
X-Proofpoint-ORIG-GUID: 7cCE367-mGJORxL7sCwuScdiF5ebj6Lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250139
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-94132-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC3C2198DD2
X-Rspamd-Action: no action

On 2/23/26 2:39 PM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 2/17/2026 5:32 PM, Konrad Dybcio wrote:
>> On 2/6/26 6:41 PM, Praveen Talari wrote:
>>> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
>>> activation/deactivation sequences independently, leading to code
>>> duplication.
>>>
>>> Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
>>> power on/off resources.The activate function enables ICC, clocks, and TLMM
>>> whereas the deactivate function disables resources in reverse order
>>> including OPP rate reset, clocks, ICC and TLMM.
>>>
>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>> ---
>>> v4 -> v5
>>> Konrad
>>> - updated return value as 0 for geni_se_resources_activate().
>>
>> I would really like you to include that kerneldoc bit I mentioned it
>>
>> https://lore.kernel.org/linux-arm-msm/ff9a2aa3-1b2b-4001-82ce-198c61a4b637@oss.qualcomm.com/
> 
> I hope the below works for you.

Tracking the rate internally with drivers potentially doing more work to
change it introduces more room for error. I'm fine with the current
state of this patch, so long as you

> +/**
> + * geni_se_resources_activate() - Activate GENI SE device resources
> + * @se: Pointer to the geni_se structure
> + *
> + * Activates device resources for operation: enables interconnect, prepares clocks,
> + * and sets pin control to default state. Includes error cleanup. Skips ACPI devices.

use this kerneldoc and include a paragraph saying:

"Unlike geni_se_resources_deactivate(), this function doesn't alter the
connected genpds' performance states, which must be additionally handled."

We may find a better solution to this down the road, perhaps including a
factoring-out of the clock configuration writes in the non-scmi case (they
seem largely similar), but that's an improvement that doesn't have to block
this series

Konrad

