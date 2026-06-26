Return-Path: <linux-arm-msm+bounces-114694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id COelN5CdPmqBJAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:41:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F916CE96A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 17:41:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JdtYaAnt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GYI1glJr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114694-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114694-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1A3F3141639
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 15:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74E03E0241;
	Fri, 26 Jun 2026 15:34:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46737DEBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:34:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488075; cv=none; b=O71EDWnE+/u4FA2HJe7PAkMYR1SpEpol6NMC2WhKpoTUvCNeJUv54BneIiFTi+cew8IE0b6BaCgPIdWAdQiVgKFEeXT7Vx1hjSxQYjm6dZFjkhv1nfDdiiOfn21t3WKNiNPMvx/1jDf+qpfeb1drcIL+dzV70m975gSaBaNPGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488075; c=relaxed/simple;
	bh=uycrAyaNRqPC1wT03GAKc8SD5LIJHNc3+Z03A8sdBHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fM8WKA2Tga8SIcLYR0tIqD4n6J+66FEEMrVhYJsKWzBt8QKCWgieOhPgMx0/iuHC/464KIUd4EGG1PcjkjF3CpoB2UF3R96QngqAyDD3bRvGzGsbGQ0ABpwgjX8KfXoK5RHUHk/15iHl/NuhPireRh5cDoKAC8tYaGo2EVijN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdtYaAnt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYI1glJr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF3u8N1194640
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWeBwIab1i2IzhQduB2JbzOKce381YUPIvSMgEmg3JA=; b=JdtYaAnt+IQ2zkHa
	xbYaoXybk5idkMsh8AJKfDK1H1dgHo78sEDOyWi99zboNChKkNhXOpdhJJPXW4n3
	MCEDwJ5dsunN1SebLajsZoa7j5v3/Rig++djXlcL332tu/qE3aOj87Qfd9gACbv8
	bVvIMTi2vvCSKblgHaEwfCJQAxizheRh4e8MGTVp3cF9xrLGYFmTlKkqVkLrpkQI
	TZuqIxMgmPs1yZr+m8b1gD/+qqaN0LWLbCG3OZ9RueP1RtaRCICprKXExt2YXWBr
	VtVe3hh3H4brlfpcKzZkJ5o9+M3ObQFhrrnlXvIcAGo7MOqPjfsRD1KzRI9mXwSo
	cgAW1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asjc53b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 15:34:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517647fbff1so2504931cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782488073; x=1783092873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWeBwIab1i2IzhQduB2JbzOKce381YUPIvSMgEmg3JA=;
        b=GYI1glJr/ONXthAWlo01gyiz/CitvfWgR+K3ondbX8ICaO8vU3cUVs2tWk0EuDAM8U
         KhgVO9bdMwQxZy1MDbuVXWONgdHSE3scb6uoHiG5h7v67PEZJQzEouVg2h9JghSdPpzV
         V7s4tlZzkKyUjsZcp8IXdgLHkxUY7Wo8mbW23hj3bAvak6MbYA4EKHYwEhPDM1yn+JaD
         wmBcjnJVHzX6uNJXT5SgwYBh1A8NisY1PVjWtZMUx+wkR/22DO1AtW3l9RmfPHqZ/n5R
         o4777g9E7s2LnWuTsrHukNpJ+dtNsv80drDkvIxep8ocWetoc/1AI7l5c/A86RW4o2ol
         SMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488073; x=1783092873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWeBwIab1i2IzhQduB2JbzOKce381YUPIvSMgEmg3JA=;
        b=I6CEBk3nyAn2L6R77aW8wzF5wtpxnHumNpsd9/l/TXfC57hOnjjIE0JK3MfJ9sosQ+
         mmWAXM0zPlafJTrRhnFHLmz5Pbx3+lWEDdksVkxd0bQECGqRNucUwzU+m9mQS1Vo/urr
         2AGaCvg3OJL6JJlKifs4BwMDNmNAL9wk7gMo3WNtRReFSH2SzLkOS51XyycaMVFlpHSs
         ZSr098I4zxXphffmwvpIk8CMSyifALZLu8OdeWtI61hjn/UDGxBF01RshUFQY7nCXPTt
         54PkpTuPzrtCOY3eDCQuyEdoCSZhgdWy4L7Bn3AnfC87ShAPVJj3kPMFzgJxlXcaAWEP
         7tNA==
X-Forwarded-Encrypted: i=1; AFNElJ87n2CZ176ZpOBhr/OSU3HAil5Z/0REACBYxTMyd/vle6XO8hVwUtYkN8IAQGTbAHqSHq6q0hfiaUSWGcgh@vger.kernel.org
X-Gm-Message-State: AOJu0YxPc7dEwiZKkbc/FE5DxBz1X125U6RKGhUwS6SxU0tKaFL0Jqsj
	OkDLxuK1+0vuQgGHjsP/CnI/pFlwds+9N3uI4Kn8oZFEZ/wkqtrLQB/+gRyKHeHmu6FqEsoyMRj
	qkPdqQelihYPIAWttfgJpUak36e2wVxKLxrh1nDaEN2ukLSH1EOlpIsJhQY8XgEMea9py
X-Gm-Gg: AfdE7cl+oLvIsTw/Dw7KFjz5RfdDRF9bW+zSoID+CZ1QEYH+9UBAJHR+qnjlFRbzv0r
	uOo3urAj4JBcCsrKN+nCtfYPFq/1KrJQvZBuaRFLefDpQKuHmyHmXykNCYmJ5T8wmocVvaVCZAf
	CuSD9rjf97yD54/M53AVlSnSOIGtOn5FbVD7VLeIILOwJjhP9zvON0uKgP4jdBTIUKQppiL70U1
	vBb3dlObLgVcfAflfdwYQTTVInD+zrQVbgB15VJBZTIzsHtaWxOHiH9f/61nyPGdGZqz0jLyMMz
	Um0ae3mAulRG7WwvISFNkx5vhJ+/IY6J3eAafa/Sbg8/j0yTw+8dtDw3BmdJr5pNN+ZqgtktVGR
	dGfAQjJUsYmDeeUa/IJPfj3jT2Th2Ibc0rfw=
X-Received: by 2002:a05:622a:11d2:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a726e0126mr68689201cf.1.1782488072515;
        Fri, 26 Jun 2026 08:34:32 -0700 (PDT)
X-Received: by 2002:a05:622a:11d2:b0:509:2a92:8088 with SMTP id d75a77b69052e-51a726e0126mr68688601cf.1.1782488071782;
        Fri, 26 Jun 2026 08:34:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba8b61sm341289566b.4.2026.06.26.08.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:34:31 -0700 (PDT)
Message-ID: <c22f82e1-65a8-4472-924d-91908f4d6104@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:34:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
 <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a3e9c09 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KdbZC8JMYa_JGPUaySMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: XWCp5k8kHa1V-3nH58dSNBxIO272FcRl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX+ljDHt4XaLVo
 scUq39JeOC0Xj+3TpIAfLo6kucRKndUN+EAAvPZiTn5l290KSWILImwMNd6XWU6Zfpuq1U1ggUo
 AnOAsDzS2SiPhBgOjnbwS56JAPppUE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX651vxdRX8usQ
 6J8Jyt24VfaXpDQe20HTGU5nyDL3sL1zJTzR6xsaFfYGuWUU3ruvQjm6SxNF0zZo/lo/+hgEYKR
 8BN5Vma9rb3FCLWftVdk2yr/2U5nic8yxtrw0g/9PUZ/Z/uJz1xLRy5S4iMOaixiNu5ta0Mz/vk
 04EMFA0syWu2cvuNkZoPxl78SiXQ59MdN3KrKCyfbcgtNBcY6D2O4nMy9icaRStmIWI1X+uu41F
 cJqUVjilSF4RIbuT8QcDwFqE5ja25y+e8LVd8XJpCVmFrAEJuf+9q0/2uQbtbUdEkjIBdaimPal
 0U78xwwS7x+a67CaAKEgjf+SYdubW7UjWv8Zq0JAmmH/+tlNMHmVS1cBjjmiQ+99nlJPPV94yHJ
 harNUnNm/ir/4XyIinHCoPK+4OIVGfsvCZZpSC82lpifKtgzawkQ14r51/DyiP5oKN0dxrXYzWJ
 kzZxW3HkuIrMp3WqciA==
X-Proofpoint-GUID: XWCp5k8kHa1V-3nH58dSNBxIO272FcRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114694-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38F916CE96A

On 6/25/26 11:06 AM, Mukesh Savaliya wrote:
> Hi Konrad, sorry for late response.
> 
> On 6/15/2026 5:12 PM, Konrad Dybcio wrote:
>> On 6/15/26 6:25 AM, Pengyu Luo wrote:
>>> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>> also support GSI mode, which is highly preferred for certain
>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>
>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>> the controller into GSI mode during initialization.
>>>>
>>>> Ideally, this should be decided by the SPI controller based on the
>>>> requirements. Another option would be to prefer GSI for all transfers if
>>>> it is available, ignoring the FIFO even if it is not disabled.
>>>>
>>>
>>> I have read reviews. Can we check if the compatible
>>> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
>>> presented, then we enable GSI mode.
>>
>>
>> This hunk is very odd:
>>
>> /*
>>   * in case of failure to get gpi dma channel, we can still do the
>>   * FIFO mode, so fallthrough
>>   */
>> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
>>
>> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
>> you have any insights?
>>
> GSI mode is preferable but if for some reason it fails, we try to continue with the FIFO mode. Just fallback mechanism.

So, would making GSI the default and FIFO the fallback option
sound good?

Konrad


