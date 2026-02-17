Return-Path: <linux-arm-msm+bounces-93155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACNDIRxflGn2DAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:29:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500114BF57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03432302DE3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BE233A038;
	Tue, 17 Feb 2026 12:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNNLACd6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8zBlmcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1306B33A010
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331349; cv=none; b=Oky8re7df+raxZi5qffRu2fwYZ0Q/H3Y5AqY+pCu1t0NiaB/zBLP7XRYak5tmdUWAiJ+1/K+dpqB9B2vURd1S+uTsunvEIUvPoowfHsjIQ1sUC0NQJ/mdxywGOqcWOY0KF4KKKrifCCex6+ikqbxU+S/zoa76dxLi7OkXYNE7vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331349; c=relaxed/simple;
	bh=VRN60Fr3kj7zvwSlwYxaIWmnxVA6ckGzGv9Tvn2DwJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUpIyfgZK/29nLU3teFThGnuFnriCAMq3P9A/3crH6WonRWdO5rOeUDFGksyt398iDDi4mROK8ePe0RI1KBZFyGBdZpV0I5Ktof8O2gGUsH71Wdz2ksIJryWf0K3JiwuYmNQlnBEt6jaTZZGekFBZVBFfCxQB6dtx4YpuX8pbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNNLACd6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8zBlmcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54ewg2111894
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfN+j7iPplW7HNJqPxQ5mLmsOyD6t4QrPPRMvKjKBi4=; b=ZNNLACd6DqncwSV+
	Ri+bSrpWj/CDBCMOF2OBihNF6XcChI25PN+EIHitEB2UEFqQ0DDvMSGhV9UroXqt
	5OVmPFSt8w7xyIUeM0/2cTdKtwIoytqFgmTPhdvEu3PuUaH6LjRStLuc0j6IHOhn
	RHAxLuca+7Vredw93rR1MUuNs/V9RJ9sXIBIA7usd1JXHYd7O5+b7/bdgYe7uqPD
	Gb/qZ0WODeChXHG3X9DODHLAe84rBgNzmmQa/tH7/20k2ojStjMdZw+G2f9XlAOQ
	4YS4g4ZcpSyHn/6ZtkRYoOKxQBHxb5ibwbp6nozT9wWj9gzmWui50MsjhiZrlAZp
	q/qolQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4h1me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:29:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954937be97so34670236d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771331346; x=1771936146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfN+j7iPplW7HNJqPxQ5mLmsOyD6t4QrPPRMvKjKBi4=;
        b=U8zBlmcC5XtobSpTJRpW0A7MR2q69nzf56p4SqUxMolRo7EqzKHbG5LThCJMXVzmR3
         gtjOdDxwndJdQZiUhPj7aH4JTRZ+YbxZTeqYAoMTFswZhpRYQRwKBTODhUbZjjXbxr9h
         T+1lx5DyAZ4MT8qaeIc1WKESy9UKUgdC3FVgAU78oRTBs6gpaux0zZmHXsKo7WevqC0c
         7vsY/7XSrpMVqxooRoK01+3lEu4TkiqYXi6kS03qaIA1y5JAHc+tclMsMXliVkLjABo2
         mWGpD1m1y1tKc5j0AuzRJczRTJN2aOPLSezfwHkuAh3WIM9cricRRQhn7BVXWLUv18P7
         QbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331346; x=1771936146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfN+j7iPplW7HNJqPxQ5mLmsOyD6t4QrPPRMvKjKBi4=;
        b=uyKNtojrBjPwwAOjEXfH6BWiIzeV/+l6pGOyRingERfipZdOdcmnL7N0KsX+dirv2N
         ZRjL1P2eYKhttZ+Qi1F/qsLGQ4+HWyym7oEL/wNn/xpbaBdZwGOYuW+ixZahW5a4el57
         qpvY1lk4gAIt3isHykyI8qN2EE3huJfLgDGdn9TGHSUiz67tZq4QpZZ1ZvV/xSLpKCx6
         WEi0+0L/miCwi1BKCG2qD57wyFOAp0Xf72uprS4xk+dUnEa74NjCPSnE10yaB7GdFGtH
         tiJgkIRtYpLvO3JfG7UL3rpl+GLekJa49XzKdIe/XLf8uDIhbuaAlfB93BiZuhJRDHsE
         sjRA==
X-Forwarded-Encrypted: i=1; AJvYcCXZlvPSU0EW1kGPMv0OEqqevo7Ym+EQGZ9PJcJ6L6VK1MUWD97l7xolOwUZuwti3k6VRxIq1+aseC813ocS@vger.kernel.org
X-Gm-Message-State: AOJu0YybpsYsM5X3ngPwfo5IjoOC+JzDpMH3riPas9reZ7ti89oFJwXX
	KXeyJuFHAjSVWPKfO4a24Rq8OsO52y5XtFs1gkH9S2/MDMIoCCbM1HDj+207cgN3+TtfJniH9XK
	uFmi8z4NTTBBlsV1ZUue02u320Rw5fY615b6TcxxhWxSMd6KOHDNMBwAHSx5c0HMj8qDW
X-Gm-Gg: AZuq6aJQcs2wb1Iuwlfsj45YfwGClNwkvOVWIOWlsfxMz6zYT+3meYaERtL/PFBRec9
	X8LRBML3/tHYdTJgFd2bR9gVDleriRdYzEdqpc6XAkK59UShyt6uWBnfoVPpAEVtvRBBfVQkbaf
	23mtvgI783RDzCNZRZLasU0N4ogD6qwcaGQLvynPjwpPtI4HUdcTwOMH6FI3IWobbpUj0yF31pv
	m//XB1KWKd3XPa3Ta0QtFvGgkGwQJe3swUo/NRNZC+U7+xsVGxMWPLHw/b/xYIzLhVS7qbbwh/h
	LrYmvcrrlLRMENCs6b8TFixf/m8lTNsO2Iux50gAUA9RTvcEBUMKR6+DQn5YUU1aygKoyXWinaw
	WupW36LkS5ZRT1pCJhWmMjRblIOn6CF0l+csrhBDrn+2uCNFfEav1Gaegq0F9U2jsL1ENAZVQUb
	lOvZQ=
X-Received: by 2002:a05:6214:5e05:b0:897:1e9:578c with SMTP id 6a1803df08f44-897347b028cmr142895146d6.4.1771331346246;
        Tue, 17 Feb 2026 04:29:06 -0800 (PST)
X-Received: by 2002:a05:6214:5e05:b0:897:1e9:578c with SMTP id 6a1803df08f44-897347b028cmr142894726d6.4.1771331345677;
        Tue, 17 Feb 2026 04:29:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691c48sm348833366b.59.2026.02.17.04.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:29:05 -0800 (PST)
Message-ID: <10fad67e-52d7-46b4-b785-d6c3f556ff20@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:29:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
 <20260209-add_pwrkey_and_resin-v2-1-f944d87b9a93@oss.qualcomm.com>
 <b0ade3b3-f2b3-4dbe-9e21-920bbda1d077@kernel.org>
 <20260210082612.3xakor2yo4h3dbra@hu-kotarake-hyd.qualcomm.com>
 <b9c7aa89-b260-42aa-a85d-9e596e78e419@kernel.org>
 <20260211104153.r6xz7ya5emxa36cp@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211104153.r6xz7ya5emxa36cp@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69945f13 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=9iDGNwz4qdmNxc66HVYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwMyBTYWx0ZWRfX+kxuv8oj96+Z
 629CGwIAyw6PxejSgInS4wpPwWRcal3SNYRwC2JYI6fER0FmuaBJmDAHlQpPgPii8IbEr60+Yxn
 ZyOjPE+ywyMVYQc8rUr8qz4tuIC5ESsCsAgHWkIXiRcpWl5rK7Zaz1y/TwcsyEZPtFBvhvmnrZ+
 B0FZwmNepP8dWSfkQ3ahs+9Tda9ssgVrt9nGdkM8xFvmYPmEsOffKHWc30kEETk/8o0W1OEdQZt
 sTUVDy1HX66ZJ3ZKuecMXiRtp7bhK0drlsye7+KApM+Jt5TYU7GIoLS7WB/UKQ6JVZMKB/3QYg6
 vKNnSq+qaRHu5bffs8BGhgMBlRtp5xTmpaAEIVHvsVnzXf5++IIHhSWavN8yKh3yJT+bfpu5ME1
 1FbeVVpF0sntVQ+5+RPNQLLxzfrrHehmT2hSSVQIWN8lF8qqDb9b53x9XzrdZHM8b8wiEwzKb/k
 NbNdspS3oe7H7rgWFPw==
X-Proofpoint-GUID: PhTMqlgzZCxGU1io5v-wFArWR4-IfQyp
X-Proofpoint-ORIG-GUID: PhTMqlgzZCxGU1io5v-wFArWR4-IfQyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-93155-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sonymobile.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4500114BF57
X-Rspamd-Action: no action

On 2/11/26 11:41 AM, Rakesh Kota wrote:
> On Tue, Feb 10, 2026 at 09:32:18AM +0100, Krzysztof Kozlowski wrote:
>> On 10/02/2026 09:26, Rakesh Kota wrote:
>>> On Mon, Feb 09, 2026 at 02:49:24PM +0100, Krzysztof Kozlowski wrote:
>>>> On 09/02/2026 14:23, Rakesh Kota wrote:
>>>>> Add the compatible string "qcom,pmm8654au-pon" for the PMM8654AU PMIC.
>>>>> The PON peripheral on PMM8654AU is compatible with PMK8350, so it is
>>>>> documented as a fallback to "qcom,pmk8350-pon".
>>>>
>>>> Drop everything after ,. Do not explain WHAT you did. We see it.
>>>>
>>>>>
>>>>> While PMM8654AU supports additional registers compared to the baseline,
>>>>
>>>> full stop.
>>>>
>>>>> there is currently no active use case for these features. This specific
>>>>> compatible string reserves the identifier for future hardware-specific
>>>>> handling if required.
>>>>
>>>> All the rest is irrelevant or even wrong. We do not reserve identifiers.
>>>> If you want to reserve something, then I need to reject the patch.
>>>>
>>> Hi Konrad Dybcio,
>>>
>>> It appears that Krzysztof Kozlowski has concerns regarding the
>>> compatible string reservation for future use cases, noting that
>>> identifiers should not be reserved in this manner.
>>
>> So do not reserve identifiers but submit bindings reflecting REAL
>> hardware being used.
>>
> Yes, there is a real hardware difference between the PMK8350 and
> PMM865AU PON peripherals. The PMM865AU PON is leveraged from the PMK8350
> PON and includes extra features, but those features do not have any
> active use cases for now.
> 
> If you are okay with the new compatible string, I will send V3 and fix
> the commit message suggestions.

I believe the only issue here is the commit message indeed, you're not
reserving an identifier, but rather describing a new version/implementation
of a hardware block that (with the 8350 fallback) just happens not to need
any specific handling to make use of the 99.9% of its features

Konrad

