Return-Path: <linux-arm-msm+bounces-95536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DE2Hbk+qWnK3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:28:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CABAE20D708
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DCD430067B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219F3372B20;
	Thu,  5 Mar 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/KxXZzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzvEU6tz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91322EB87E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699319; cv=none; b=kf2s624g0+U5fwtkjHVJRt7zGjUaiGDFQfuhLtzuCdvOaKHa0Mi6mm8UFMMg8H4ZsdxPf8l+r8WwQ0JS7ujq9MihI5J5EXrI2XViAAIJpBXw9HesnCd146wOxfakXXaFHX4T/miNRn3z2xG71HRRwYaRDUgwCW9Jzzz4LW3SMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699319; c=relaxed/simple;
	bh=JwApMPYiG4fd/ILnv58A9G+Wcb/3tF+XZk+KEDsh1gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwj3ZW4GrOZBA4QO+k3buouyObWYjihv/Ucs9/rWZ6kpV2iEUrvDJGMJqt+Nb34wTKfcY2QC0h39mkJsWcAwpx44zts5KFmP4wqmYceek+We4w5auZYD/a3IGUiBnJt3OO1e2nVGnABBz/1LJ8EdfRo9/kVRO4B92OogRA8v7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/KxXZzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzvEU6tz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251NxBZ3665129
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mgrx79lfGEzLBlX9QN3Dz4SsddgdoZaYB0lKI1UCPb0=; b=A/KxXZzjrwhBKTtf
	xknJShvWkVYN1otjYIetX2XvjAB+2HazIWy7LzL0fkNAJgsobAmu6skfI3H5JtX1
	+NvTZqRh5TxSPdfxUHu81FaVsTnIlzGMUVREfOeVkPP1XJMadYcVaK7QCf6gxsis
	vf7+hUYHDfLRdqZR/auibSPTPP1f8pObKDQzyd2zFU5BivWxvCtnJBp20MrE0GUV
	deI3ujDw1LMsoxUwzskONrbHOG9EaFoxunskpNDUExTsuntSX6WsjW7YniNCIsjc
	nP76ksbQI1z1+4ZkhNmTDEWeAKaAQU/CRap9SHAgxbVxCSdfFZa6YMyY92XR7Qvs
	lPfEhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u17kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:28:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38a5dc3cso577621785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699316; x=1773304116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mgrx79lfGEzLBlX9QN3Dz4SsddgdoZaYB0lKI1UCPb0=;
        b=bzvEU6tzu8LQIx5J+I3mBt6x13UsytFwFvx+HWXyuqDzwx3SxW+LQ+PTJ+s1byTM5E
         2kVow+5GeH1/vOmU2a4yguM4L2RnQMyjOovfjrFJJWizRt9Nzm/R9dnZ/0N2feGWkvT5
         qGerlCSXLp9Ssk/fDcATPiUu4RRBGdSJU7ufxEX3rpaUxCu6e4oGE3qIThqV5Kwc8P26
         CfP4Q/XTGH4oeDDNhIsbL7Kqc3It8DylT72EH+xxOiTl5fBDnC40xwLPwTeGIGm/62qf
         zrsdmlpihCSowoMO8op0s1x9U5NWiirQ78t9cezKvj4nRaHGLX6HtBBtjgRG/pmfasFY
         ylhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699316; x=1773304116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mgrx79lfGEzLBlX9QN3Dz4SsddgdoZaYB0lKI1UCPb0=;
        b=A+SEPPOYRPAFKXRkdVeWh9JRbfpuGOwu0jUdkcsjfe1Aj4WS8tHaFlc5kPES4q9g6x
         j3HVyvsf2FEApykQ9dJv/AJpHIPtLv91m3+MYw4ckh41lp8ErQpdy/U2O7o5NDNPp09E
         Pu1wY5vCpoZKY3uJrDNclyKqyqizTxYL67Zp3UgpKN2v7L8nFQAslVPwz+Yqk4Bx/eu7
         yxTeoGX9zEoacbytlSuOJ7/BHFwDk8SRdZo/uEtK7/IycCoDIairn8hGwsJagnmMuFHq
         GtsZRjQlAlicep72hmIO36XGfIGlyxkhqUj48qv6nItaMGSxYCyYX2U4OqyiuczNa83k
         Sseg==
X-Forwarded-Encrypted: i=1; AJvYcCXzEd+5o3Oieidhjv1xYMxhyMovM5lEbo8ntnJL1lYVQnX/Lv//AKFLrXUGkFpaDNRmN1OQGp+1slznSZwJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GvqjwqG/fk0X6BGuAxhpJFp/T+fWbA0riX2GWZOQUQajFeZz
	cmJA6TXrPZx5L3Tw9F2VbU+16AbBMwqxPhXgBgh0A9sdbgYLXSL4Qr0bjExtRmWWJGGQU7lrgHO
	AsuShEi+kbX3GObavyOSc8ovXhgOAbbrs+kBPKZ021S71gMj5KCOIVNS3HSJB/lARowYX
X-Gm-Gg: ATEYQzykNQWNfRUDGhDNqFfeXCm6dz0fqN+xeHa8exXBKRMHuXqIFxepkTTWc+XlLNy
	oYtzmOlL41OWVcnNiU1lgL10KoDoyeVkjp0eLoNrA8frrLYaE/fvMmpHWyUOXwQf+aPyf/hbzP8
	7LZpM11kgApImdYe0CF1XQa0qMkYGVWCxZrKiY2jtALZkWPpDorvl/mQZn9h7fzNv5lzyfK4Gzg
	UBo/nbgqeVJHIrrX/w6KBt3IOz53B2cOB/Zwa22VoU5v2dEEMOdaltI38HWwsGYsghClZCI5Bgq
	LygaobiGPLAKi7h1m0cWX3IXcLzWjhIzyBiifbXTte0IvXAy+JSoCJ0FuLbxpRakpuYvMHCZazD
	cRy0o4DQ1jb6RAHeg65Cuv/Z3jt3oczodWQE1k0Gip6C4CtvJWnjbYQJGAxec/s3x5d1HHZ5Dr7
	5RqO8=
X-Received: by 2002:a05:620a:4409:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cd5afa7b9cmr428636285a.7.1772699316230;
        Thu, 05 Mar 2026 00:28:36 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cd5afa7b9cmr428635385a.7.1772699315811;
        Thu, 05 Mar 2026 00:28:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac84357sm868737766b.30.2026.03.05.00.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:28:34 -0800 (PST)
Message-ID: <a3668aed-0763-4bfd-a24b-f95977d2167c@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:28:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
 <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
 <aaiuzCWHegpJMCVj@MyryksLaptop>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaiuzCWHegpJMCVj@MyryksLaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2L3mXJ0CivDR4e2WvJvYzdYrdj4ZQBXt
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a93eb5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=boWcjoDG4uMwkFA1WOEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2L3mXJ0CivDR4e2WvJvYzdYrdj4ZQBXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2NiBTYWx0ZWRfX2ZFIWuAUJOQR
 2hl8mb4yBeICIMwZw8JkiiVeLZyr0yIS8bWYOkITakfihLpRZrTRVelDDYMGlwpsXl3ZRClrX4Q
 XiBLCS20EZPDdMjhPplh+Idjt3r/vmGvz9+HYHdY5TUABpinStvu/Sm5cUgaG2VWpprXNpbXN8E
 3kHG69tbLYJkXzwkSxr7bOW2KjSfSlnMDrsQd0rcq/2eTwco9YG9v8QB3sIGrZwYqbuBzqRnCf4
 kmsba+UiYqAACMBiE8JtGcmaWWZ6moT2qsbVMCAhIoC8iusCrtEDRqn5nFm0XZCGtqD7vkkvZV2
 h9ZXyP12ZPGW47S5kMfufIiX/+RUQXkXs2KBtI/SBCzo5+SOTvFuNZFNT6lybvblEloQf3s9XiK
 MLcmCI0Pox/ImmppByf/fgl/UgnWIoF2xYy/92DIV0Y7qgQJSo6V3VgzlkYg/y4pXOm/In6GhN0
 I0eTjXgrGo5RA4gIIPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050066
X-Rspamd-Queue-Id: CABAE20D708
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,posteo.de:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95536-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/4/26 11:14 PM, Paul Adam wrote:
> On 26/03/02 12:08, Konrad Dybcio wrote:
>> On 3/1/26 11:29 PM, Paul Adam via B4 Relay wrote:
>>> From: Paul Adam <adamp@posteo.de>
>>>
>>> Add an initial device tree for Wiko PULP 4G.
>>> Includes support for:
>>> - UART
>>> - USB (no OTG)
>>> - Internal storage
>>> - MicroSD
>>> - Volume keys + Power button
>>> - Touchscreen
>>> - Backlight
>>> - Accelerometer: Invensense MPU6880
>>> - Magnetometer: Asahi Kasei AK09911
>>> - Hall sensor: Rohm BU52021HFV
>>> - Proximity sensor
>>> - Vibrator
>>> - Earpiece
>>> - Microphone 1
>>> - Headphones
>>> - Wifi
>>> - Bluetooth
>>> - GPU
>>>
>>> Signed-off-by: Paul Adam <adamp@posteo.de>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> Thanks for reviewing!
> 
> I assume I resend this once more with your tag added?

No need, the maintainer tooling (b4) grabs tags whilst applying

> Also is there anything else I need to do, if I don't receive further
> suggestions?

Nope, just wait!

Konrad

