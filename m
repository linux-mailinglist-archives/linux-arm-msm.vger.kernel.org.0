Return-Path: <linux-arm-msm+bounces-97878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHScKP3Nt2mDVgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:31:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760E297093
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89D8C300FC60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D815837B021;
	Mon, 16 Mar 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koW/HKn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VHOBtDJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7E3890E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653438; cv=none; b=PzBmiwUdWzqybm+TQzLmdWCWQ3QB2WfNwuM3GUK9eDoq2701uD7b68sNotwPdwnDuKkfJj5bKicjioAzDumFCUpb1YQJz3RNeOsoLziqpzJS4p1MQ1djajG0u7NHHa/0qznCSNOBPOHkbOV6LRyhvRwXyDq9RcQKaO5hUR3EB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653438; c=relaxed/simple;
	bh=rOmD/tTSLtI4sGePVuziYUR2ACOxJnPfU42NIVxWQFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6IILbrWKnuM8bhCnH7cwB2YfMpy9Z6urAeoexonnqpmSxkIdk5DHKEHM+4Lco+GrYInh88W+KWGC5p+p1l3j7O8z8smqYulOthkNPC1iNeJHTFP5C2q2y6V2iGyCiz7SgIL2iIrwtj/TbjlqJRKED/Q6O1MQGStyD7LWo1Iwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koW/HKn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VHOBtDJ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64ag83777629
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCVKI/eKLtlamMd2/D4n7rtJjm8TbWgtnqjVuvE5Ek0=; b=koW/HKn7jRlpg8rG
	CHgAzn+oKT3A0UScRhwWUQyFgmBxKjPwNMag3iOzB7gALOQ93035Fgw8COl07E+I
	Htm0JWaRNvI4NpZsFFNxeOWKM81bYYuLcOe03228k1jdCrOUJjZsyjoDlnUogV+3
	Vguf5XuJZN8jpcep5R7jTOA2lY2wDO+8h8fXCOyYtuAqTJ3Ia8x86e24gz1x4Tsg
	48kHBxsWIbone4i4xIY880tvuermVtXUqtfCztjFx+B0UYsLkoAiuHrXPSQ9Eba9
	54Ken8JoeBoFusq+pKr4ttJDUoywTpiT6sCkJ6LpUPKn4XsbbRSR4yfTHL1Bww1C
	yQOP9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vwyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:30:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a5b38affdso33110466d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653433; x=1774258233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCVKI/eKLtlamMd2/D4n7rtJjm8TbWgtnqjVuvE5Ek0=;
        b=VHOBtDJ2rXvlqoP9oL9dNbxjRCa55zooraO9zFCXrDSFpZmDgu9Yb/pcxXjUvqTmEX
         nl2MUg4CU1oHF7cZGX3coySJk4tEBACFJn86Pbqe1QuOo4msx5aBXNGaJEjfrutt5TTb
         TLkU3mI588b8nMRYeXkfOWUj4/EHVmwUIA1cmsPkYeMnR7PdEnooNsNeFK/OZAywodOk
         YMbw5BOgOYtnuv/oTuS5trgWc5SGGv8ek2uJ2SNhCIEz84U8taJp07h64WpoqyP/1sva
         bnrisZo/lvOYeY60M+Ebb7gElGGdUNNRAISPn9rizjb2cefQBKn6P333RmEGBPmLMKbp
         YPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653433; x=1774258233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCVKI/eKLtlamMd2/D4n7rtJjm8TbWgtnqjVuvE5Ek0=;
        b=KZrQJ7Tg6WPf86Js2h1gM7EjFwoAFZ8XDey/rEjt69V+iOXZzYgq3IfLpf7L05bcBX
         v4DkkzcA6BTENoxDHsyrHV8TvknP0VIpXliVkXRC7jqjDIhY2jF9DXzHf0Oi8NbNXz5Z
         JkJMbchazHCNbq+yahgqyr4l2f48RFcjwi0cWawTgb+AmpvsPEaErrkxs5cLAX4MvOxB
         Y3hW6OgeqjOsUlI8frV78uYGJ/nnsH+5myl78uLQ2VD60sJ1IihgscCnolrIqVad2nef
         gCKR7oSdXPchcVjQKE/QbRmkGKoM9wEvFFMzzPVq6lySo8mIUAITquMUuCdwAlQqHvsX
         n8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUPCO1u7BItpwhcvAFI1m/ju6xrlRec830SKci8VY1JrLfLKSd4Em5DwFcMEF8vQUAjdmfA4Ar6G+kIr3WQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHecreV1j8eRLh3+M0RhjyQnzpT1/UIywkAK5k10Ic5U6ZDk9
	ixd/0tiXulT4njvQ4kYy27vwxMUWn9sVfvB3v86pFPqQDY2WekGesN3n5I3uR+rucsU2JQG5XwH
	QVWmzbEsVmw+XqEC1Be7QifIFC1OOo3At1E7R9RVB2JNnxOL9+uwBWmYybvF4Jrc16N7/
X-Gm-Gg: ATEYQzwTKP4j/7X6mZYE+Dt5bXhj+WtunIgTjsbzbHzfeY6bwCRNN5runI5fxdzti7P
	PPoXdqQHruFkk8TWWeurP6EwSvC9a6yQmSvMZ6DLC0GAlFZZSjgq7i6KF7n1qtrnfFMfi1xV+ib
	pP9hkeFcIqcRh7HSV3OL+Qx4Hj8C1Kcl7LEVA2biQQQYger7OPGKCA/r/kXbpDYJYuGnX+/cDn3
	5UhmMhkCYNflYgnw4zKkpVXGrcGWciRWUfbhO15QUongadJ72r9xD/0m5p+icUoECrjdfZHmfkR
	K5dXNDZaKSf+abi01+Munxalc3xpX7DFNTt3dgNoJUmMLSMhL1YGmekQ4md4yS2Swf2Qv3ftl2q
	+Opfn7xmkMCQGn8v8RkP377m4dUnv3YtwxdyCFlKk1Zw0gwurEguGYqN4NYEY+Wg3tuN23G6NI1
	Ms9II=
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr122910096d6.6.1773653432940;
        Mon, 16 Mar 2026 02:30:32 -0700 (PDT)
X-Received: by 2002:a05:6214:809c:b0:89a:4c1b:4f6d with SMTP id 6a1803df08f44-89a81fb81e7mr122909756d6.6.1773653432457;
        Mon, 16 Mar 2026 02:30:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97afca45c3sm231447766b.13.2026.03.16.02.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:30:31 -0700 (PDT)
Message-ID: <e242dc13-9818-4445-b835-86a87965090e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
 <t4uhjpxdvjxda4dxkoxktv6xlxg3xvzyslgerluu3t2dzxv33v@k46gvwv4uf22>
 <137c19a3-136a-4e0e-b4ea-8cc474172d81@ixit.cz>
 <e65ebd79-9edb-4001-a5c1-c4b6a67d5234@oss.qualcomm.com>
 <e93d3d7d-1df3-45e1-bf9b-d2ccb937aced@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e93d3d7d-1df3-45e1-bf9b-d2ccb937aced@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d--ahZE1FYo_Zp-hhtPps7ZmAxyrCWtR
X-Proofpoint-ORIG-GUID: d--ahZE1FYo_Zp-hhtPps7ZmAxyrCWtR
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7cdb9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sfOm8-O8AAAA:8 a=xNKo-it-qOgi_xrJINUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX85yWM0OqEMQi
 VVIcF7X+onA7e1TjHWkUQhGi7/8WmuFBLsUbv5trTCfZoMy6+LZ9I4MoAuyfPSC15pxGtni7hoe
 Ha2Evgdvr9PT8u9adR9pnv+YMb1pOOR4ijNbJR2ZpLvE2MAKnMDESnKDu+3mZkfsed9IomEtqie
 eb+nJEcuF4csAX/Jq5sdiB3vfLc4/D7CT9Nvqj85aq+2LedMgzoqi+2cc7/zRN9XyrF68SLfl6a
 qlH0wTh2PA6RP3JEqbDf1tF+98Q6DIsE1b6dgLz/enl5Km9bMOSbZNDiGj3+JVrbtr13fqLEIzP
 eqUBc3pkeE0BL0iTs9KSktMpi9C7FndMUpK7nwYNa04UmNI5m4yGvkdhTnVBb2Kfn8HqqLKhqsY
 UeHXHtOtAt2+6W9y+BUZwQYVwRT5rDK3COwjphdJySyGSu2V34ZrxPvURv990HTitHzMjKHaCuU
 lr+0iu84//CXYdlOT9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,protonmail.com];
	TAGGED_FROM(0.00)[bounces-97878-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
X-Rspamd-Queue-Id: 0760E297093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 2:09 PM, David Heidelberg wrote:
> On 13/03/2026 13:38, Konrad Dybcio wrote:
>> On 3/12/26 12:25 PM, David Heidelberg wrote:
>>> On 12/03/2026 03:46, Dmitry Baryshkov wrote:
>>>> On Wed, Mar 11, 2026 at 07:44:30PM +0100, David Heidelberg via B4 Relay wrote:
>>>>> From: Petr Hodina <petr.hodina@protonmail.com>
>>>>>
>>>>> Currently the panel driver for tianma is broken.
>>>>
>>>> How broken? Can it be fixed instead?
>>>
>>> No output to the panel. Definitely can be fixed, but current situation is that we don't have anyone who has available time or device to tackle the problem.
>>>
>>> I know it's not optimal, but on a way to achieve working mainline phones, my thinking is better to mark it as broken in mainline until someone fixes (assuming Fixes tag and backport) then just going black display (when we have at least framebuffer now).
>>
>> If you have a person with limited time, would simply copying this:
>>
>> 2b973ca48ff3 ("drm/panel: sony-td4353-jdi: Enable prepare_prev_first")
> 
> Sorry, I don't follow. You meant introducing prepare_prev_first?

Yes, just setting that single flag

> I asked if it's possible to test, but looking at the rest of the driver, it'll need refactor anyway.

Well I'dve assumed it worked at least at some point in time given it's
in mainline?

Konrad

