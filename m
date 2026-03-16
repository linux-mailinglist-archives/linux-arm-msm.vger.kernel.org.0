Return-Path: <linux-arm-msm+bounces-97904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFdQCC3dt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:36:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE78297FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01129300916C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8520D37CD32;
	Mon, 16 Mar 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHYj7dZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZheN/J1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43658352FB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657249; cv=none; b=ZGTst5xUNuhKDnazETCkaV1O+IjgPBJh3csSPKBlxUs+74l10hGDOQkTlxsBiY3hqpBbsFxg9JXTVuRnBVIZUxVHCXN/nLXQJWJWZaE7LxIanmLJX+90ttY2uqsdxACnMwHTIzVF8TUdGMan7QPHNdXEsABIWryHwvJGlwCjVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657249; c=relaxed/simple;
	bh=2XtkVsl6vm14tOIQH1Xo9pQK48VvGzKucVB4sOsWe/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfZ4RJzwNmbwIzjf9TPE5jlRxX1n38jJlnbLeC2+UoN47kspWOUaEUxGWeyJsKQGDS5K+zOj/IiXBH9V31IqTUNB53LhMFiE3ftRBUGZ+bcVWmcqDh2fq4qVpeWkjCQ2dneIf+jZ3mgm6Og94laCWtr0kA4vlXdfyPPhE+C4mow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHYj7dZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZheN/J1E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G652ZR2129563
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8GUJhInowxvWnFS7m9mSt6uu4UvWw5Y85gwmNnzBEk=; b=fHYj7dZGK7Kdhgw4
	fg5Bz7yebO6chjPjEBxLJabLk6NvAhvMfWL3vVMJGIHVl/Iq7J5fEUKGj7vb0QC/
	H7YrlPhLYfze0pYOOgPGDakkJX81dCmohtoUuVwOG4MPPX1XUnDpS3EiRboRrJ+U
	vXkp1pJmaKL7IvRAz3GXqMXiYeo9vp8rcJjFZmAaAd2vpZRPGjlVnHQS0gVdEEqh
	wp3lb++KWyoe0sB1hCrC+VaMIuhonV1uhZVTiesbgB0o0IOx9ZBzNFNFACleo9T5
	MetbRFCNfa8KnzGERcEWG0xwylWdrNnG8KFmzHd60d9nZL2bGK0hEAiseyXisZw6
	V+hJlQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00anawx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:34:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509118781dcso55019271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657240; x=1774262040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8GUJhInowxvWnFS7m9mSt6uu4UvWw5Y85gwmNnzBEk=;
        b=ZheN/J1EgDjq/6c2qDAzuU+ZPjX89zWwoQIPxrehaVj2leWh6QdD72+P7mcnslBvlA
         H8NBkll0Y5xZSindir/WMnrtGnF1PElTFQkTsJBK/T1Z4Ffqq/Q4EEcIHQwfAySxVMR5
         GTeigAgnZryb1uS5ERNwXhI5X1D8nBbR8GzGnfG8Neky4jo4KAZ75bl/8sW6+kBnSlx5
         J8lW1rlfUdBxg3SLhAS7eoQR/2xtvnUeNVrUfAModD8w61oGpFdwf3YL9Fv17UwknQRM
         Bbm8Z8ws1UP/9aROavZ0sflFRyN15pc78hOqiih7M5XetOPjfk84L2La302rKPCyhsRd
         yxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657240; x=1774262040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8GUJhInowxvWnFS7m9mSt6uu4UvWw5Y85gwmNnzBEk=;
        b=EM1hlerBaBl0B0hHzLgM871tShfJc7XBNeVUchL0V68JCgstAP7dZzUbHHFrVrtXej
         caPR9HcM/3iEx0KrvAcRnesUABZPTTmdwWlbxfX4zS15880Z1yQwBiMXbw7qzBAlfcyz
         Za68hCcp5ib1efK6ROZaGwFv97+nBD3q+nZyfoTTOFVlffdIy/JhncTQC8DAAY7fGqUS
         uPvGYMrXzt+wI+DrkRjKx3uUjAvS+ufLABlRbakESAC0Xy7UzgnO+MSHxQ3mwgvZ90z7
         SSJjRoQvP57wu968WR0kvLB3orT9BE4zFNlamvzRhuJYQDwmlwj3s/DlCnvEiDi1nD6y
         l3KA==
X-Forwarded-Encrypted: i=1; AJvYcCXrPAjIdnKu9YA7CD2mEUq5OjVVs5rtlXlxkJ8kPOn4KYEMt4f7WGVD9lTwuog/px48xqWaw+zYa16muyZV@vger.kernel.org
X-Gm-Message-State: AOJu0YwFjsmy1Eb0WwowwYypbRutjDfemfWSeDQfF3fdXvYtcXiElEZ/
	ILM658GcV6fbY4qSZuLSF02nevD5uoQXN7G4f//D1mVZN8Ey2qUYaG0a/6LCSUnNsogKJsoqa41
	uNUJwduh9zBgu5IiEiBvO7F/rJ9tPNLyRq/mO4HLncvYfxAT434vgRLsUkIpwseWZetxp
X-Gm-Gg: ATEYQzw0QmBCvcuBE6BRhnOxnIhdo4S5L2+xE5koq4CR5gdmoA1NlWuosWCUPkl5REp
	1bMkV+bktLS1Cy/NGrIOUioFAah+eiFT2wbm6Idwg+n1xKGJ4XFP8bJXsLIfMtviqHDtuRvdW1R
	7jrza8pxLeoNk3CLQzruG6ShclGfFwCg9rFBjxsMIoPQp2TaZ3C26ScIL6hmXMmYX/NQCn7JQoN
	PQvcRFEwgkwybYVMwaGi7rj2i/fsYtDcEnH1EOP9gFr+8t8xZb2no72omzWDmKU255Y46mopjv6
	8yrXkyYTqyNf8jcZGuDkUSSq1zA2X3UNH98PNSRG8SW8MmwK5EsSnZZIypmO6bMst2Hlfo5oImB
	MTAStbVLGcEu7WZsHqElNochVzYOaOQj9uZKFiirRWi7taE1WD7dY9C8ed3NOiOjL9XgLjlfDzw
	kRI1c=
X-Received: by 2002:a0c:f11c:0:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a819a32bbmr109265506d6.0.1773657240459;
        Mon, 16 Mar 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a0c:f11c:0:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a819a32bbmr109265326d6.0.1773657239982;
        Mon, 16 Mar 2026 03:33:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm536788966b.58.2026.03.16.03.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:33:59 -0700 (PDT)
Message-ID: <760b9028-ef60-4f37-b3a8-d0045adff861@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
 <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
 <aa61HZOuz42C_R7X@linaro.org>
 <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
 <5a60f6fd-8cd6-4936-beaf-492dfbfa5b26@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a60f6fd-8cd6-4936-beaf-492dfbfa5b26@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G7RuHTkav61J6ZKlcN_0EEi9xjk6P8hy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfX1mbF97DyUyfq
 ye35dlFqksvuLzIGY3aVRfSEKNRLx9O3rDVXuApXNNoEWPpV9uvCDNC4vxNCCYhKVyEpJu/ODr7
 Njp3RNStXbf6OYwDIs769YmnOnSZoIx0ZWXLsUY4bLDepD7MqsuH3qMhgF3LZujy/8hNytRjdFm
 4TefU3kfSGOzyOUKrv7IzyFUMohB7O1HccD9scPcmKneCsQz9eT2n+FgKoN8ZP6AIjzK9wEiAcK
 QX5yYFPlJl0vYrU+mdjp27ctglZt+Cxu12OHO86uW5jkTFfZPJqoH2V/CxvDdy5FBCb4W15li3W
 fBCe9FM4tc2Fwnh7FjgGbnWWzUL749Hv93yGyO56PVkxMeNWFPeMGaOkFmR9tFqlPXaZL8OhPSY
 y8z+rkzbd6AoeeUl2fGSaBtruhWnlUEzyNPnOZHfVQlF1ha3r4WN824yF69KO4+YJMzG2lZjSGc
 Aev6F50Y1Rlt2r7g9OA==
X-Proofpoint-ORIG-GUID: G7RuHTkav61J6ZKlcN_0EEi9xjk6P8hy
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7dc99 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=odgoo8EOQweKgDa1cmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97904-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: BBE78297FB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/26 5:58 AM, Sibi Sankar wrote:
> 
> On 3/9/2026 5:40 PM, Konrad Dybcio wrote:
>> On 3/9/26 12:55 PM, Stephan Gerhold wrote:
>>> On Mon, Mar 09, 2026 at 12:47:33PM +0100, Konrad Dybcio wrote:
>>>> On 3/9/26 11:04 AM, Sibi Sankar wrote:
>>>>> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>>>>>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>>>>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>>>>>> reference boards. It handles fan control, temperature sensors, access
>>>>>>> to EC state changes and supports reporting suspend entry/exit to the
>>>>>>> EC.

[...]

>>> The question is if you really want your device to hit 120°C. :-)
>> And whether the firmware running on *your* laptop actually configures
>> these limits.. I would imagine that to be the case for Windows products
>> where the TZ comes straight from qcom, but I think someone in some thread
>> mentioned LMH is not properly configured on Chrome/TFA.
>>
>> In any case, let's see if we can establish what/whether the EC does in
>> that case
> 
> 
> The "debug mode" which is used to control fan is paused during the
> following conditions:
> 
> 1) When the EC receives EC_MODERN_STANDY_CMD enter cmd
> 2) When SoC enters deep sleep fan pwm is turned off
> 3) When external processors like soccp put fan constraints on the EC
> 
> So when you do set the fan to 0 and put it in your backpack :P
> It would enter suspend, the EC would take back fan control.
> i.e. the LUT based flow that it follows by default. That would
> imply it would be the same behavior as seen on Windows?
> 
> Either way I still think we all are in agreement here. This series just
> exposes fan control knobs to the kernel and doesn't set any fan
> speed by default. The LUT based EC fan control would still be the
> default, the patches to improve this are in-flight i.e. ways to send
> avg SoC temp, update LUT and select available profiles. With all
> of these in place EC would be in good shape in the Qualcomm
> reference devices.

Right, and I suppose we're in agreement that treating the

* user sets fan to 0
* failed to suspend
* 1) didn't happen
* fan still off

chain as an oddball case is OK

Konrad

