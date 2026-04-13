Return-Path: <linux-arm-msm+bounces-102894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id H188D3yq3GmKVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881B3E92C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C96A3006145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1D33AA1A2;
	Mon, 13 Apr 2026 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/UgrM9S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEMz8afW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3A3A6EEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069242; cv=none; b=hr/ArPxA3R9pX/4nwL7YmJ8AWg4vqXZYBHFXJjQFUBAXG9mR4h+6Gd/Zj+6D27PoRlweugHkdnWH3y1/TPL+A5EsQY0j6/NWT69JzD3NXYw3a42t+aF8/Vu8AmxCWG7QTMqqXHaVthEy1Dqm8agtVziMS+UWrv4rGHrLdWNarz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069242; c=relaxed/simple;
	bh=Vp/qnx/z2Eh83IcTjOE5i0msDDzO8eFXrBlxexR6NGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIgtZ3MCrXMm4dPOGbx95bmLKOy4HibUAvIPEqestRog16WfCJ3scPor9ANEgkJn0HHlJyiZEPytiBRHZLizqkC4ynFwwEQPc6Rs+H8AC0dacbRaO/QEeC5wKbJ4+Ag5yz3eDgV+KCr96oprfYcT1jUAbFqS41aVvNR0bnTR74U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/UgrM9S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEMz8afW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D8Fr3o677692
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmfro5oJ4k2txPZx60B7uc29WXlA0tTdgImnU1cMafc=; b=A/UgrM9SxPYh9x2+
	AE2iGBmTxC6YQaqdHyi15FH9R1U1YTk8w8f586RLcSABdW3h6PVMILCzncnz0AYa
	bKQyG8TxMlu+S5EAQSCdGVxKcVe+rEHIvECiPkVBcIMyjZBd/InMQadOPZ1dxB6I
	S21Y36nEN24KR9dGh17OMBAZSCx3YWd6GwMacmCTOl2I3XfVixuUbSiUA3ttJyQw
	aAIWGfLlasUS3wGL0FL9rxfTds3afMHbXMktQ7oMEGLxo68L63ASUUystDzljrqs
	gH2bCLO/gtoGR3i1x/eftBSvac5Mr4ZAUzxIuyU5kFLydJE6WjuunXbOLDMYDFYZ
	6UNZIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhvdsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 08:33:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca2eeac85so6453506d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 01:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069239; x=1776674039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmfro5oJ4k2txPZx60B7uc29WXlA0tTdgImnU1cMafc=;
        b=XEMz8afWwb5UWYHIWoO+GEnUcUDahMzpYSfEvT/GHhZwjJT3znYp4z77OzEcs3ZYMZ
         ObifIlUCNXJU8yDMybhJofOWyezJd2TRtTZf+HjcLnczbwhxoXPM2RFDiVohrXbK3ORa
         EC3qr2BtW0Hxg5+0aRdhDO0gyRV3HvsrObaviGUHTSXfszjACo5yEvsfERyjAPwgdrHL
         BZ5jmvV4jck1RusjyuqhK5pDDWM7MRLnY1KdBHT/mnOJ/ciLRw6EVTRRvGz8elXuN3Ni
         qxg+/9/RujP+1J+NXzGrzZoVf96u+udgXWeuY5nKpf1wkcvdmR6DUi4r1nB5hONr1kVH
         KjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069239; x=1776674039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmfro5oJ4k2txPZx60B7uc29WXlA0tTdgImnU1cMafc=;
        b=oNgd5k+W3RKHseiRcQGLlmcDMkkWxeZbyV2tFPxcWJbGmbaudM7GXIXqgSQAuSmXJA
         y9K/J9cLagVcu3enWFifsdriSO7ypKc/CdUhjiaWeX8y8t7S6OiEv1bvTBibOYlV7NAu
         3ti6R7OYJRvnWEv6Ms4k20DgKdZpK0eoEoo50a7fnm8DXBFR2i9zPdOsr0ch+3wH52eD
         vl+5JnvHHy1LvPSdJGErIIQj76HUpO2KqNqIw6PoUgw6zzBU3UZKdfdAC4Pt1TYCX1bq
         oKVJaUuiRIcHnmCaEpWBSEADBmo5+R8DakksTMDNAQcTX3RSB2uYRxC5XdqpPdwqUblQ
         +ZlA==
X-Forwarded-Encrypted: i=1; AFNElJ9kERPY5EZQc0vKDmvZKXI/0BBCtMkxiTaFExjAOJ5wUXRtYt/rwsz/PDwYqqYB83AqY7kwF+Z19Kvsc23u@vger.kernel.org
X-Gm-Message-State: AOJu0YyrGI6b+6kWZkl+YwqbM/jYEJIvrongpp4IcUXWpzT3G5MIkLgE
	zVlb6EgrbAESl6JZFa16XQ2KCK1P3Evs54Rpg+s8p8SyVPyTuB2O6cjWJKUtqmhY+PUveU22lRR
	uFTSiQPOcNgin3p4kjIL6s0kpG2xEFRzpdJubLr2vM9QJwXiq7emiBfMWO4RkrhTki5ak
X-Gm-Gg: AeBDieuRPFN0KBKrtfwhb/8TwkWShvfKXr6V0neYGKaJWBNzAWaIl0is9tGztb+y8hB
	TRDLBsPcK8IPI7se6F5UHX7KG4KMkw/FQmYiflkIolgzn8AaYzFjgOdyjb5vmUCc675IRzFN7cb
	qP+AZEksqyebzlfa22c866ePsTJkMf3NAuxQvjLOptZoGaVOpiD+pzbq8coYm91igeNFDdqeD8P
	0WhPMVuJI+ZEtrXhLNvt4HUlDyIHVDhRTTqMTDDC6/WN/tyuHoPAE3T4WxJJ00/PvT8okR/Zwhu
	rMDl0DrUxhbyy0KVp5zHtkQC5isTi/Sfdc5HlV2WgjNpRgP9sI+sXGpetO2Ps5ccRDxBS5y1o9R
	tIlUUJbu6a6VCuBxJ+dg28ieLNkl9BrxUJ0pcXMIDGi+0dXl8CmDB+walZbSlvc8yiDnIKFE+Z/
	T3DZM=
X-Received: by 2002:a05:6214:1c83:b0:89c:e075:9558 with SMTP id 6a1803df08f44-8ac861c0889mr146927616d6.3.1776069238676;
        Mon, 13 Apr 2026 01:33:58 -0700 (PDT)
X-Received: by 2002:a05:6214:1c83:b0:89c:e075:9558 with SMTP id 6a1803df08f44-8ac861c0889mr146927476d6.3.1776069238264;
        Mon, 13 Apr 2026 01:33:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd76b8sm291173766b.20.2026.04.13.01.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:33:57 -0700 (PDT)
Message-ID: <bb18fe25-0207-465c-a2e4-46b577f17725@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:33:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
To: Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <adyfWzVHsg3qo9cH@prism>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <adyfWzVHsg3qo9cH@prism>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX4XQ+7CLHBshL
 UBcXM4j/n/d6EOWktH8c7d4mWeNKbEL4+HAdSxhvweMRKsyS4KxJvmJhgSGgxrny/ibW6ot/X3S
 1MVCyc6RE4iQjNrpQ0MBijrMwvfL2bq2sAG4dPqLHaSF1XI+6S8IsU7gPsVG6K8y0Gf5ud/PBcy
 wOydxUkeznaZRb7erisAOc4B+Pbw45Vt2mukXETP7LSzWjGMMGaElZwYjH6Hb3QJRQ6heByK5Jn
 XYCOCYMtXRq68NWy6d/0XtHk2utMzXs361bDybAJhCgWWd7HFFZ7jl7ISvqTnvNr3HpfaGHvGA2
 VOdWM3hRgkZRWIJfYgC7WHZOhFENQLNdmyoqOizZjP6qP1heJrYn0Cnrblw0arzjcWpzKMhpxjX
 gf7xxLg0KghyQP8vqAbvUd0S3xvv7hWSFMxovjrTPCC0ytz0kUX+bbKYuWf/cabLTgAIldXnO0y
 CYLmd2Sb78Je7/fLDfw==
X-Proofpoint-ORIG-GUID: NmVomAsW0qnDNn-MtktwM9Sqg0KmV5hx
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcaa77 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rioUKAgr9yKdZ4H-ZIkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: NmVomAsW0qnDNn-MtktwM9Sqg0KmV5hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102894-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1881B3E92C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 9:52 AM, Alexander Koskovich wrote:
> On Tue, Mar 31, 2026 at 01:37:24PM +0300, Abel Vesa wrote:
>> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
>> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
>>
>> Describe the port and repeater, and enable the USB controller and PHYs.
>>
>> Also specify the ADSP firmware and enable the remoteproc.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 83 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> index 90f629800cb0..c31f00e36eee 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
>> @@ -6,9 +6,12 @@
>>  /dts-v1/;
> ...
>>  
>> +&usb_hsphy {
>> +	vdd-supply = <&vreg_l2b>;
> 
> Shouldn't this be l7k? Looking at kera-usb.dtsi I see the vdd-supply for
> eusb2_phy0 as l7k. I don't see this being overriden by anything else
> downstream either.
> 
> Just bringing it up since I copied this part for another Eliza platform
> (USB 2 only) and USB failed until I fixed this supply.

Looking at some diagrams, L7K seems to be the right one indeed

Konrad

