Return-Path: <linux-arm-msm+bounces-113712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxVhESq6M2odFgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCDB69EDC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iaLU2eiK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bpp+yuc2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113712-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113712-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0030D302A700
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D7E38F92F;
	Thu, 18 Jun 2026 09:26:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C463B71DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:26:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774800; cv=none; b=gT57fvgwlgw4+pmGNg4idtnj1R+1re4IEKoWwEtJJyfUjToGYLY4A5QY9cREPwHEBug4QBj437oqIzJeES9urbLC1FWpTVo+S8yXID1zzmsbMxWIv5DQFYKB89PhUTKPeJ3Fw/gwOsU7i0ole6caPVCLaWYtNmaFu5hTRsxLjSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774800; c=relaxed/simple;
	bh=PQFzKq4u1Zz/DS7sc8HllALi6A+WiTA8yxPA4PvNbK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1dZdv3N/1aRt+LZ6282tSfBMgwhU9GHCmxBwMUDU0HTWrRkuXjJSDxod1DAQSVbzpJIHC/nbphzAT2ikvKjq9+RkgGa+Q986U6URCvxdWR0R7ymlQ1VTbBADioRp0TiCfUzbM/u1mz3UKbJg9rC2n3waBH2Jxe0ugvhxCWwTto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaLU2eiK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bpp+yuc2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Fae71011294
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=; b=iaLU2eiKyGioQKfF
	/1fGySA5k47KEhF5b7rmC+ewjIjlpA8gHmg1f2K1rynLSajU8h3loDZFIzXimb7U
	5Td/y5PXvhBxvY7hi0F0W7TOoNeJsCTT3O8mfhL8d7pLvup+prt1hIiqJcn6cUmY
	OU17XVNl3Uevnom7ONAipUD/sFYQTqDwTrJI8K2SSViWZqze7un2V+JaK1/E18Ef
	JKwKRR5OVCcSvbUX8UkMQq7IGCWNAX8d3xtojTjKDlgouxO6hmsQ7F9yFHb04HJt
	fN+1MT/OC5Nt/WWguR4EMqsV8IqhFPFc3zk9Jmzp4XRq0yJ1UuCau4T8T/GDxd16
	ER0Jzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rttkxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:26:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9158ecbfbc2so13842285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774797; x=1782379597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=;
        b=Bpp+yuc2CVZYKrVbyXR8w1vgB/NtC+URg00vc+C4YDcl02RIGYnO/9e8eFafhxKoFP
         8ARkK9zLtGU1zkeqEICgJZ29isUBaDFcwJTmnpjNbIeJbragPx3lBxDAQtZc5Tos80aW
         qVgjN4veevfn/MPCk+y4US8VN/BKdDjAufJNP1QiVvW4uhJbcfS9+vJkCWiW2M8A7AnB
         WOLyf92AaLPHbPhgo1KnCfDSmaS2BmzpPLnR4YTaN0Qum9FyZwed8oRBloLLrfjKAopL
         zLGPD4DxwOOczpp5BJDKWXV/PwCR/tU17VddlsGb7mNHGLjCjVxwMuV9srtRYUWQ01+n
         7C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774797; x=1782379597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=;
        b=rcMMxvtgkP5zrDQ8vXbxdGQPF3tEHS4itXhIuyPUaznpuJnKy3a110OnMKjdIGp8s6
         BLQmIUHCs/8FVBnk5x1BfD2NwSV2Zih8QS8jDEOpu+hHqCXJ9Izh6wMQnTg2yxQ2QjRa
         NJjSanfAaVYMb/33FhQbL8759AeK+2GkEAZ+PAxK+EI9nOBrv8TJUgaxngcRaCPHBv8S
         Kz17QI5HsnGNoo3z0b+gYei5k1dCN1RafDVqaPk0DCkwvHzGDrJeAwHXIbFOSwvM7sgK
         lMENXsHCZSE72Lg90tZ0D6OUZUkDYMo/VBkg9US7SWtuDeFY02uQoPWZNZ71a22i6+2c
         q4rw==
X-Forwarded-Encrypted: i=1; AFNElJ+TwPtMbNURP4nqFcRMLESbiq1ljfSs5lRGkqsUW0O23VEuNVywrAysZXuUwoEkV3v5sFIa0SPI8iRzWeCl@vger.kernel.org
X-Gm-Message-State: AOJu0YyRM3HWvvIGvpS3eDzOBCpraYaAo1IlGDewFVRfSshnIqQHD4yw
	NM5F0zmLC8HEHF//tQvV39oundfYRyBvoNSiSwYAgfDpDjM9CpxLMvt6Rz891QPkdqHMjaVNBkE
	l5MY6iWIZMy/OZmGacBkNlZpZ1gXFtKdZIyenga3OT0t2zTQjX2CxiwJxb3kWcT3BHjBO
X-Gm-Gg: Acq92OEiJttXABl0//Y/5ISjjF8BhwJUchXsnkbwGN6TWUNHlpgnWT6JTyynZMrAvJI
	6rwh8PbEcZmszfto6FssF0x7I6utRwRtfwDkehzVIzFbcCK4Lx/7VtYhBJhkJT8g7ETYUC/ha6F
	WhKUnjifzk+G4G7AvsTVPRf99APPlh+BNfC1hOc10s9508ZvGmOSE1u9uMGj8RbzGKv5+eP7gqn
	HGTlDGhBwct/V4r5EWzNLsbkrI+yN2cPrtq8X3Gtv5ZTFoUj87bV6PoVETKIsetUfqrFROoB9pd
	JvT5VjhLy0qffQGg9p7WNJ4snNmlecMDCVihUENDt4J/86khBKEDK9zkc6e1XM9ZsFzryyrNEpG
	NtVgbun4rZaUoCG/ijtvrh63yCgd2RGyQurI=
X-Received: by 2002:a05:620a:458a:b0:90d:11b2:80f3 with SMTP id af79cd13be357-91f2b477d71mr290817585a.7.1781774797387;
        Thu, 18 Jun 2026 02:26:37 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:90d:11b2:80f3 with SMTP id af79cd13be357-91f2b477d71mr290814085a.7.1781774796807;
        Thu, 18 Jun 2026 02:26:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83428a8sm925516266b.44.2026.06.18.02.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:26:35 -0700 (PDT)
Message-ID: <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:26:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a33b9ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HaZQysj9wVKA4b69cM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX7Fw1jZOoiABq
 HH/Jcfrtg+AqmkvK9IYnuQsYP7TeRdJR2kV6dj11Oyysm7Qk57ko19I30XtTkURKqXNICZMRi0C
 xnQiuuqZsp3wCQs8UP1pMy4Z8+tRdbfDiM3IKJMcTivnI/UpndMEGhIjituCD6G3up9ZH82/Vcj
 +Xcce4CrUb4mlwI9BJep1A6zCS7wyr3s1R9F1Qigx1B+bc9RhDf/VLF/NZI13wKbICI+N0SIuDm
 trF+1Ow+I1jN5+BczQ00lG3xOUZVF4vTn0ZG1l2rBIFpvDSq4WL6xRhtUUhXX0h7OJlXIGkFb6s
 1SCVjXBuOzKKkv42volzx7X/a+nasAWhhQ3fiecd8mzJQkTjFU0T65R0BcnZoNDyzQhITf3yDY6
 3SoFxxyG64oVe0jThHFhRnbZIqlEm+IttjcYwCGeazbIL/nBQJvto/6uDh/uuBq2pMKO4bXnhS1
 H8r7rLt6OZh4MDSTotg==
X-Proofpoint-ORIG-GUID: 3M3hO8QIOM4MAU6XGCpO0CjXsalZ-_nP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX+ctIzoUa4Uqd
 Xd2rQ7bdC+joXw5kbErG0ln5zM51hvbn0xFoKbSMKSCycW0wG0j6/s9Ry/GevBLCz72Z1kBMTTa
 tPX8UX/g4MM0IM7L8f2zIeI1dbtldNs=
X-Proofpoint-GUID: 3M3hO8QIOM4MAU6XGCpO0CjXsalZ-_nP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180086
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
	TAGGED_FROM(0.00)[bounces-113712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: ACCDB69EDC7

On 6/8/26 4:37 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>> are accessible. Without this vote, the SMMU may become unreachable,
>>> leading to intermittent probe failures and runtime issues.
>>>
>>> Add the required interconnect to ensure reliable register access.
>>
>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>> be voting on other interconnects too? I guess so, because currently I
>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>> vote on the power domains?
>>
> 
> This race mainly occurs in GPU SMMU, where the GDSC can have an

Mainly or exclusively?

Konrad

> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
> already have been removed by the GPU (or any consumer of adreno_smmu,
> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
> errors.
> 
> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices moves to slumber/suspend state before adreno_smmu powers down
> and the later doesn't have explicit interconnect voting).
> 
> In the case of APPS SMMU, such a race is not expected for any known
> use case. APPS SMMU is part of a shared infrastructure block, and its
> power is typically kept enabled as long as attached master devices are
> active. Therefore, explicit power-domain voting from APPS SMMU may not
> be required.
> 
> Thanks,
> Bibek
> 
> 
>>>
>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>                 power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>               dma-coherent;
>>> +            interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>           };
>>>             gfx_0_tbu: tbu@3dd9000 {
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 
> 

