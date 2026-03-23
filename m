Return-Path: <linux-arm-msm+bounces-99182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDxVMyYRwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:08:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 380702EFB56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 808E83031AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CF037BE66;
	Mon, 23 Mar 2026 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSPC5el0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpNnKx2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BD388363
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260191; cv=none; b=tZl77oI9wDZQ5hBTxwJZkR0jsXJHPnyTU+NjkrYiHyIM/wgpxjHbgOVsnspUfZR1pQaSuAUwO/LjT1umYTqQxqxLGAZGCCjKfvyHcRV/HXzWnm6sJET08rD0Hw5pMOntofWY64CcKcyq7DqRvE0e5UXkUAxkpHrDeWGMcOPXZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260191; c=relaxed/simple;
	bh=QwzCyOX78nD7ncp0SN9zqj820SaB2ohZP28QrqdWwGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEnQMNVodVvw+OWI3c3FEtXqaRMGWWuvDyL3AIUJHGHAy41gjdTgly+vwQ11yT9MN7dYM6O7JqDKsrVsXsC6P4dtEy83KP3ZthOoAtO9ssr21ARV3CMoBz0UlRdQMorAh9t5VJCjFwEMArrMdqnqk2zQXDN2lBobsI4jf3H/c84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSPC5el0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpNnKx2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tVCj1627086
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oIoe2eVDq2jNI1U3Bss+xvTEm8vrTdWjM3zGINO/NI=; b=CSPC5el0C126Hs1i
	TRy8gWlYI5Sg4G+y0kYhGbWYt3PK7vWO+1v2XYePJuavtVJF3ASWktjoX7kOJoX6
	QBP4/vif6w7vwO5+KXrp+42Z1PgBQStgJdIIm2v7gABM+jUbnQQIG+epMcfr6eYw
	xT2D0MWmbIttpcjgfMlX/uVgUEXziv0MvpQfR9wnSu2ZnvZNuAzMsYp4eqlFhRuH
	K78aEYODmyfZSPhJjMHV0bRo9AryOg1c7/BuXBoWQC3jVbPOE87PiT/f77m75+/r
	ScNGpWTeBgOL7x1sRAZ7kRFsRPGBzJDS2KWYPhe+AElSNwijtd5dZeTnLJZE46+T
	8uGHNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0f1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:03:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c4041so26951411cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260188; x=1774864988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oIoe2eVDq2jNI1U3Bss+xvTEm8vrTdWjM3zGINO/NI=;
        b=CpNnKx2zMkE2X2/KT6hqZ6ZnZPP4Z6yEmA5TaIbbBurXDes4SZ5rNXkyrTqc+4TlVb
         W+Kpkl09g9FY2X7wvOF7zadCZq1ySvjqF9qNPs3BOoAhDPAujSqaOJ7klAhpR866MEmw
         LBNjiAvZrZ3WiuEVajRq6EnPE/vwGqB1Z8U8y8Yl8yHzQxBkE17JF8dqqwIo2aRkNrkr
         /UgtNxqggumsiXaTiWl+WerGA2Fl3/Wgm8XjP9nvy/oktajWp8DYRmroXV9C1Lthj8JF
         YA+trjdENpyuieAhJZ3zL/RN2bVC97u5A3Ohlwg8STuvWITt1dOoGncQf/r3yThNuTkX
         /gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260188; x=1774864988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oIoe2eVDq2jNI1U3Bss+xvTEm8vrTdWjM3zGINO/NI=;
        b=UVDOE/dVSToOCpBQjMW6J4Vf6acFIrCtL3KET+7MhbZBv2tGYvWth0bJm0EfItcZet
         /mSZtQKyT1zuvz1tKTaY5Ne2oor2yZpxTru+0oto2E0xSs5u3wwZ8ia5tUOJ+u/DyOrb
         /52ogoJuCgRHZIBdgrJB5GcDhwiNNHHPoafTkATKANVNSEYAdQ902FBOsDc2tMuDiZCz
         /C2657Td1E2eXzphjBBoF/Vr9/uVRQ8aEaT2yWF5j9Hy/IlkUCTnDD9YLuyk2yvf30w5
         +TnZFSnuyRPFzXswlbe7+ADLoLXFnRjbQgt1pWVlW9C8jnVhxM1aBHEgLiD8cRDYIT4z
         xvhw==
X-Forwarded-Encrypted: i=1; AJvYcCVIqxI7P9jgS4jEom2XpG3/KMesHX4Ajhhn7gHjr+X4IyKHaPMnSPqn+x47M8MVWPvtXgaiU5hiO7wiqE07@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZu3i20O5lYmzHwlSXYjMNY9Fuzh32i9uzBuJNS93Snv7FqH9
	7SnpNhsTTGGFkQgi2Nzla5Qhg+2oahs/IyqeOfxeda8lj/V7aSHsTPg5ac68Ee5RVUPKHv2YyD+
	DHEH9Lkyjh6xHcmnJEfUtpJ9mgqpdClpUluhjwGCv8gS7SUzhekqbprSMbplojNN8rsNa
X-Gm-Gg: ATEYQzxVXZpMTj/TM6kalVxnpIjDD+XrqHGHXeJyvccj0MsZLX+vvG0HX1zU9xvvJj4
	JYHatIvXpyEtQuPUxsq0tXDrs30SCMfSZ1QirgvrncBoRD5HP0kbQqBU77PbYlc9Ysq0n+1GXAW
	nuJrSzbKb0cVnbYxtGLXY04PRTl81NPTev2+Il7Kvra+bIZAft4B5lLlRdtcVbRyKQTNEYP2zIH
	6w56drctba62b8rt8fUy3TUuJ7Y3FXhHC5HXCoiBZFo4xglgC4EUWVarkqJvLCTMGOxVkFqfKsU
	2q4SjoN3UdOzykDxZGtdI4h6IGhm3obne2BRLwRtwqtd1BJAg4qNzdgwI5FOcXFMrMXCSfB48H3
	Z+nPeYeTwqOqSeFrkL9lIXy3tcxMoxXDidVfVNj2XRlnPP3spNxoerG+htcUqv/1IILL3RSMwcp
	cy1eI=
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr136051611cf.5.1774260188595;
        Mon, 23 Mar 2026 03:03:08 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8d:b0:509:e68:22cb with SMTP id d75a77b69052e-50b374b1751mr136051391cf.5.1774260188185;
        Mon, 23 Mar 2026 03:03:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm467071766b.9.2026.03.23.03.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:03:07 -0700 (PDT)
Message-ID: <37580c69-6175-4f0e-9601-5e69bc07bbc9@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <c464d106-8e7b-41a5-b76c-ed5e7a82fb37@oss.qualcomm.com>
 <CALHNRZ-AC+0+JdjvvQLREE-nXAzV+kJc_9GMNjVs=tT8GxKBzQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALHNRZ-AC+0+JdjvvQLREE-nXAzV+kJc_9GMNjVs=tT8GxKBzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c10fdd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=OkuuJbLxH5YwaLbutXsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: xGm0rauHpReQjvgoXSEyhvprra2_dfDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfXwsy0Ft45oFzY
 iOEBwE6SK3KJ0eJaw8nXnovUUvXedRAqPpxUHtDMez5pn93Z4iqp8N8QDAP8aTUAM1MEOfd461X
 BIR5txdKhYyACl084Yvs/A5IQfJr0sc76vaw4Mhdi+fpl79/2hX9BV3wFJzMg61xRCI2dClbhpj
 fU1HGjEHLpV4VCNf9ze3FKOoUMzzlc54WceIganjzQtxOqYvZep8aL/zoDhBZtfSFrXzHIVNBUj
 Cmc6rwzLPQFnpF7nXdG/3aFyzThStFqwjb+SmNi1JuSe9aFYJi+/VpVOwnc8M4P+3Fy8NJ2Vpgj
 jzKXYmRs0yL+kX+593sGEysctnmqbHuO3elZ3VnUcRrRvFj8U0q0oLi96UVV/8aC157Z1JUIC7/
 93Fuqly2IGI1E19lbJO4cC08MdqRaagcjk42z2zjURyyoLFpC42+1TrE3wbWu5dEjvXitkYPP8x
 P9tMZ8Iwl13hVLzwf+g==
X-Proofpoint-ORIG-GUID: xGm0rauHpReQjvgoXSEyhvprra2_dfDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-99182-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sobir.in:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 380702EFB56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 7:39 PM, Aaron Kling wrote:
> On Thu, Mar 19, 2026 at 6:40 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/11/26 6:44 PM, Aaron Kling via B4 Relay wrote:
>>> From: Teguh Sobirin <teguh@sobir.in>
>>>
>>> This adds a base dtb of everything common between the AYN QCS8550
>>> devices. It is intended to be extended by device specific overlays.
>>>
>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---

[...]

>>> +     qcom,dll-config = <0x0007442c>;
>>
>> Is that changed in your downstream tree?
> 
> I honestly don't know. This existed in the mainline port dtsi mirrored
> by the vendor and I picked it up as-is. I grepped the downstream
> source release and I don't see anything named 'dll-config' in the
> sm8550 dt at all, only in older soc's brought in by the kernel fork. I
> know the fork I based on was chasing the issues with high speed sd
> cards that seem to have been recently fixed upstream. Maybe this was
> part of that. I can drop it given no one knows why it's here.

FWIW downstream has this data under the qcom,dll-hsr-list property

Konrad

