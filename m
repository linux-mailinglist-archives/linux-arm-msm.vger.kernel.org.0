Return-Path: <linux-arm-msm+bounces-104355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOiLDtAv6mmVwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 16:42:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11867453D38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 16:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B9C03017388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB6A331A57;
	Thu, 23 Apr 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3ZWwaiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1LbD8Jj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC3A34028F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955174; cv=none; b=c3TcbkFVbQkzn1+IOh+mhIS7a6epUdMGR4PxPMD9hkr7xiIt6kWhFKIvjbF6JSuzl1YXn76Io1ZYL/gZxUivJIF+JlGlrMxyH/AQgs7tJxlqOstUQ9KamsuXtz4HewYtDH6OD6gryTuxU9SbWLqEE8wXixy9HWXA1caB5d2Asw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955174; c=relaxed/simple;
	bh=iM4FnFbPIlPGBw4rptC+ioLvIwd1Zwc8TNcrY4TW/D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FV70kmr2HHyy9lSuAIcTwsING77gll02GecUmRFj3yB9Lc7c4NNOCOfCaVPGCNnVhAl/V/WTer+fFH9XoYrTnwhTOy7FGhI7TVlgOoebf2yBWssncUYZ1dssp7NSB7vbcyZUVJdbY5mzFZ/+sFStqBPYEiqracJ3sSioxvWicd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3ZWwaiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1LbD8Jj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tpGE179266
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 14:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpYHhIN7XCWTKEEc6vagc9qGPbz1W7/asIFyMd/4dvk=; b=F3ZWwaiP4vw5r4iB
	CHKdUVZJt1z/BC8AKqV6HboLyg75D+ko4kqPf6nAMsWWuttTXbxC6NYaomvgfC9s
	AAOCm39FqWC0pJyqR5sCU+ziclDEVflKcPxLhuW/ZcPoKP1A7dyugFtvpycyHP9T
	1g+W5wgt2gd64qY5Tas0PfXNI/NetlWbKQ2D+Uqq1+gHROSUosRi9Zt22StQNvqq
	nXzS0IxM82CZNleWvKnzvepQbeOZhi5Cob78Qya3WbkneEinGnEaoZogWcz/u8nH
	n+x1dEVaYgF5AJiO2EqlNR3ufbs3wcy7s1VVvQuOqsF6f7hU0Erojd8qs/QImtfi
	ERgdTQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hyp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 14:39:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a1accb970fso70935426d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776955170; x=1777559970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpYHhIN7XCWTKEEc6vagc9qGPbz1W7/asIFyMd/4dvk=;
        b=K1LbD8JjqgjiCZIkbFqtsddioq2dIHW2Qw5qUOxYm72YX81laf/M6f83qvy6iGX4mQ
         7THUBcdCGBorJkUt/zkcAlNLLMHudupr4JNwEQHxZMbDDGiHFNg3Rtr9GvPYBwrQpjfB
         dzIb6KURK+DT2uygEAUil5f8DvrosxdQUVDrnd1nxSPWy8XXxjTD2wy5tBJ+1hV23JfP
         aE8DtcB/YJNxWsECzrKGb83OMdW19qM/X0QY+1YN9C9nxvDP2Io2zsc4+VedGOuM/5eV
         ho68k5ZnLtjDckMCmil3hA54sCWlcW+071VqM+48bBFNx+O/DImq1Vk6h3kr1yNT21hT
         fR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776955170; x=1777559970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpYHhIN7XCWTKEEc6vagc9qGPbz1W7/asIFyMd/4dvk=;
        b=D86G6roReKf/6I79Ofyg8tMq7ktXQlQMlb1Nu//bXiq+RJdHxm7TdE5z3v+UoL4NkX
         E6kVgE8nQG64EAIzjLwRHjf7tqvMqlcOzKugByT6NvL/qgA4Jv0cm8mvQAK6XrF2eRx5
         NUW4fDiD/6Sc+Y0uZRL9UaPqE/NtGljaIvXjRLRCHWGerM4Eyf7Ce0yM7UNmFcQZotJq
         GfIXrsMKP93ay8HrlmdWgOFXnwcWQTe85ja6fRZ4yvKvqj3RhY/tvNYvVgbEbwYrySDU
         GxfNVgzDPykL3/NTRZLjgo6RQbIxOsBzrWO/YkBT0mmrE48hkDJtYueoWQL6gh0ckMUm
         6RdQ==
X-Gm-Message-State: AOJu0Ywlu6pZImv/27fkxgjITDb8kq6fUZ6E5mFu/PN3WR6zVohemfxN
	eUaI/MckaQHEew5KGD22xTOUkW7LxBtI2ryq7j9rIHO4mx+zOhsVQJmkZ9/vbS1Dz8motqDTU4u
	4o0YrZHU/SSf2nlJUQDGHrIrzzvyBf0B4sHuYKtzrfX9msoV+RI/BJUDK1S1UbZlPKv2ZZZovGC
	71
X-Gm-Gg: AeBDietcENqORh0YGtL/meyqGU9IYa4fvMi/fVsgMoVfXDkskzC66YxOiQcyOl9Qihy
	CKC8jMvvcWPYode+it3L7KQJMGct6JuY/E1sCssyvldbd1AaUMFFXy2+RBhVA32pylsD+oWVWOT
	fyagvt6arPD1DXNRsGyEDFdWPT7V1xlqjQ+yD7qS8M3hu6PidkV9rbCTvvMcGP3pOF5d3La4fG9
	3Hk6sz5M7lAZKdHoy+tlJ5x/sfhA1mCu7fULVYhB+JLl/VL4lcb5nNliHjzgQhxIGPxNjKAOAex
	YPa6skwCw2UPNJ54jjkK86beyqF2hzL++6gjM4YhBE/5i/pBwgw9DuvdkcvpeTfVAI4wi6XNu5G
	vFkt2EHx+FJBuDAcE2iZvBbAytcnA4WJH++TIyjVvGS6oFc8luzGyU0Bvf7OJ8z0=
X-Received: by 2002:a05:6214:5295:b0:8a1:478a:e58a with SMTP id 6a1803df08f44-8b0280fc448mr435352236d6.36.1776955169800;
        Thu, 23 Apr 2026 07:39:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5295:b0:8a1:478a:e58a with SMTP id 6a1803df08f44-8b0280fc448mr435351666d6.36.1776955169283;
        Thu, 23 Apr 2026 07:39:29 -0700 (PDT)
Received: from [192.168.1.10] ([122.175.112.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b031f65a27sm150708126d6.16.2026.04.23.07.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:39:28 -0700 (PDT)
Message-ID: <22faffca-b4bc-4e43-b33f-2c5a7152a218@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 20:09:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
 <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
 <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qtaHtVHQ7wp2nOsoaGb51MxMf6r0fu8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE0NSBTYWx0ZWRfX/dMeix5g5DFi
 i1Sb7Kj4phFmIYEWi0xxIPjU/7bR+UkMeT32ozHRWmrAF+h5MejVCwlAKrNQoMuc+FNNQnLpJc1
 45vx5LjVOVhN1kBGYJ3auNhf2rCtWURXbyECDDYMqFWuixUU194wxjI7n5i3cXTMik0wr8Ar++h
 Yayq8rAgHSWmFyjixStQucxkPj28Pfm7hNd2aJh42E3v+6JOH/1BFtlbfRH7l+oGCu0u9fdYanM
 nE0T6GR1HGbG0vvCyYxdmFu9Yw4WAqucYwcpaYlOah1cMi5Gkq7Jv888PrvVZsziN0J0vtv4AfE
 JrbqP6LvUWi47JgSo2TJSiTy6GRCIOp7QTYl0uKxgwSHENzYcDWxLnwDfAd65naFebmlflE3QuU
 M5YqLEYKfE/sqzY/eATfkiiS+BCwt3/MVUkF9KIarM8HreezABiwegtYwYXaBy7VNuarOeVHsEU
 KTHSG6KhE29F/5zt/9Q==
X-Proofpoint-ORIG-GUID: qtaHtVHQ7wp2nOsoaGb51MxMf6r0fu8F
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea2f24 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=OUBTGm/turYs4i8w02Pk3Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=3i_xxtmr_Qu0wC4MHgoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104355-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,mainlining.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11867453D38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23-04-2026 19:18, Nickolay Goppen wrote:
> 
> 23.04.2026 16:08, Konrad Dybcio пишет:
>> On 4/23/26 3:06 PM, Nickolay Goppen wrote:
>>> 23.04.2026 14:05, Konrad Dybcio пишет:
>>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>>>> assign it to the ADSP FastRPC node.
>>>>>
>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>>>    1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/
>>>>> boot/dts/qcom/sdm630.dtsi
>>>>> index 36b419dea153..af2bc29ccdad 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>>>                        compatible = "qcom,fastrpc";
>>>>>                        qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>                        label = "adsp";
>>>>> +                    memory-region = <&adsp_mem>;
>>>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>>>> Please double-check that, the VMID used to be different on
>>>> older SoCs
>>> Do you know how to check that?
>> The least painful way is probably to add debug prints to what downstream
>> calls hyp_assign_phys()
> 
> I've found in drivers/soc/qcom/qdsp6v2/msm_audio_ion.c the following vmids:
> 
> VMID_HLOS= 0x3
> VMID_CP_ADSP_SHARED33

This VMID looks correct.

Just had a look at the downstream fastrpc driver code in the same tree.
The fastrpc node in DT[1] is adding a "qcom,fastrpc-vmid-heap-shared"
property. For this property, the VMID is getting set as
"VMID_CP_ADSP_SHARED" in the downstream fastrpc driver[2]. The
hyp_assign is happening during daemon attach call[3] with srcVM being
"VMID_HLOS".

Thanks Konrad for highlighting this difference in VMID.

[1]
https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1699
[2]
https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602
[3]
https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L1999
> 
>>
>> Konrad
> 


