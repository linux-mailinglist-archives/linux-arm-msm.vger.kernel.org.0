Return-Path: <linux-arm-msm+bounces-80387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75FC339BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 02:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11E5D188C3D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 01:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D46923C516;
	Wed,  5 Nov 2025 01:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0WzNt1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtD7IxCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E1139579
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762305275; cv=none; b=hzlde+t66WebzUCe+DESwhuNWf0Z1krOU7uOwNQAEDqGoIMEOsCAWUl27JDruTLtQtspLF/8v5/9v8xJsjjvyOzaxJfRKAUQftoQH/N7KFYKsQG+AxhyzxkLRg74fnCjiR/SnerQJR7d3R0jsNuNIm2ohrDlLX0xFocGXQaWMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762305275; c=relaxed/simple;
	bh=C64jZYQf1HDqvQtVJlXXsDCo+WCdnQpr7HP6+q0YmPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdFWOKdZ7X39+rrhYongTFzSqDmK4pQP92RH4SY+maP2RTei0Q4Dg8bXVjeJTp8SOXpoqaEJSSSnxLQMkxTTpy7+Npjf2UgHXvFmL06C+SF8AaFQd7lFl8q/Y+2FErnJ68b92RbT5ZGWmpapE3ZaOmbLeYQNAI1p0uwFG16QzGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0WzNt1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtD7IxCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kfm0E2978797
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 01:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=; b=I0WzNt1o5RNYEuLn
	clZx1+LqrhIdX+IqGLWSuWPCxcxQDB0iPOuIVHVmmlOaZ7H2pgLpP7IKKNvLRk02
	gLhQgwVb5tggVA7uo9EE4w+78ecKDFWGCtsppRzI0ghHMLbXLXCllU2lReaDeW26
	p8A1nQSB+aJJRuA8Cdt2WlOnXpD3PBYTaI1oqoDbca4ThzDPXTfBapiXI1uop1OI
	KbY226Fyssg+hFq8sq9qv7QLDjegEsxKlCgCi+cLa9kuXpa0xsCIhnR/NtpPMn6W
	KudVgOV1iCc41+szXhjSOXZMpgcA6GtybFk2Z3YlMcBvX38+FEk4UnS0eV5v3tJh
	ZCJKng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7hbjt4m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:14:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956a694b47so43619205ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 17:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762305272; x=1762910072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=;
        b=PtD7IxCnVljb8xs97S8Xk35fXLmPKZgQD+OOGDFgXNHKMVDFxZfye0ua2m/WJN81MM
         ot6E1bhEQ+h2n/S033802mfDMEi1OYQm/74KugB6ZTKR1sW0PjzAs/6aFQpJLYgjJsOU
         EDu4tPWMJ+cJaebJayFlfNt+xpbMc0owrPHnwZAVOQGRnZLkEXs79hC9kWE63Z+W1X0h
         3OYggy4/kWl7vTvPM6XE85ZXCPcJ2Z7fmYQ+P82BMb5z0f8zI6W5S19Ss1k6qUPtOe/z
         S2Lt8rm2Lak5DjeEZJa52szW1Zde3KiV2UDp4KVJbe2pThaGE7nwUwHO8njCfdwfJmHu
         AYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762305272; x=1762910072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=;
        b=Ym0CvkW0fbLsrze71/fWMQ82s9HCKpOzpis0xOC8YumgKuQyyVO0IDJVAUz8nBi+Jh
         vH+rbburKTGLV7DH/q59W363iDRlyXnLspn+vgJmi/4GzHggcKrhGKTXVzCo53omx4JV
         X9GQHWZwbFkV9s2ESHKATjuVv5l7wG+Fswsrkob26KC6ybNBrSvRqgm21ms5aZD8VUy7
         Jsa1DhdjEtlgZwefH+Q5fnvAOMxezcr2SeouayIDb2u5ScjPAU3EEScIrNfsC6GUibKV
         9AXlSN/RPItSJ1GwIs2fds9mvZpBs3H1RNjztWghi/D+EfvQpmguyU829vjajaLFa8rZ
         /RQQ==
X-Gm-Message-State: AOJu0YyvCUEk5zW3DILZW5mlHDxsdtLHJLaFbjv7G9qr4j/ee5ncGMPM
	B4Wkpq7COEtXO8oGcdohAFGwWhFGK/UywXTpl9mFym2VSDVum6kuJeXVlSdG7JZ41ORgT34ahCe
	3oqJ4XFam/O8N2xiONOiERetPbE7qNVaDYUGM4n7MC3o2VJvIVp6OxqEIW0uGmLSwKmYN
X-Gm-Gg: ASbGncteWe8+x5w8/Po3enxABWVT91cPb9NMbkSckbExYf9L2EquZv+7slY6rMLb/vy
	2Gr3Z4WbQiVLpy8o8WqNdk9TMflHpgTxV+a8QaMeIXV8wF02kVYzOw1pUtJJLJvjKq50IR+H+Js
	EHJzXcMOFyZ8ZHDhJgwK82LKAJzqXonNVSKeG9gM2m/ehcjKUHssx7zJiP1m6V2cKJ5N2gFCJYy
	Hsjm3zM5LCGz+sb0HR2UyN0kJA4Q+HNs/+s7vEz5CGDz1d/N6CwYe++ZcCZUfu/CEXZLFfu28ae
	D6PLc+D+HLEMIE0OkFtyRVXn0EhCWdWNBU3T3aFDIgrckqbuHs6GFcu4yjZf9gsNonivXq9Cpkv
	Td67w4S10zgkfeAg5gtSDwa4mv/HLuj3Tr+T9964eteAwb25gIO1oqP561us84j4x
X-Received: by 2002:a17:902:f607:b0:290:29ba:340f with SMTP id d9443c01a7336-2962ae671a1mr18399915ad.42.1762305272194;
        Tue, 04 Nov 2025 17:14:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEED/fTV83G2ZG7/CS+zuzRag4nZh2Fw/C150/51l7Zurc95Tng0uT8OYLPRpC5Vpxhxx6R4Q==
X-Received: by 2002:a17:902:f607:b0:290:29ba:340f with SMTP id d9443c01a7336-2962ae671a1mr18399265ad.42.1762305271615;
        Tue, 04 Nov 2025 17:14:31 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998893sm41616145ad.40.2025.11.04.17.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 17:14:31 -0800 (PST)
Message-ID: <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:14:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
 <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Uv5u9uwB c=1 sm=1 tr=0 ts=690aa4f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DRhC30DjRFB-TwiKtc8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: A5Z7Lj6_9h8vM28E_29PeiZCJm6P0ZU-
X-Proofpoint-GUID: A5Z7Lj6_9h8vM28E_29PeiZCJm6P0ZU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwOCBTYWx0ZWRfXykvtz2dOScA4
 +Q8Cr1fWMflP6DG9gjID2Em7Xi3LXNEMtSr8vppEzLcSvSh7lPDanEOQTk0QHO2s0md4WriJFVM
 aba1Ff7YgdvsZCCpzQ8kouUIQrjAkcdFE0cS4S4VKnckR/I+yylV/DmuJsg3YQCaMXeDsA1LMPe
 Jt5KlMEpkhFsnE+5tiCnayokxmSOzSV7DcAmYcvzTaaohV2zrz5yScWj7wKfD1kpLAMZj3t1hzi
 GGwkMrreObwcFtePJd9ozlRP2MP+R3AHbqWIhUfyrnv6TMFoAtykgjLXtG3BYBfafyAiXGyArXV
 hcCgzbfmv6zLtEGZNWFw2uOPh8420N78EY9wwrQyLlcD/KaKlZ+izesDI5TkisRWYujJ+ijealw
 XTcNvKEb0pnvRvQqTgANP36MPSo8tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050008



On 11/4/2025 8:47 PM, Konrad Dybcio wrote:
> On 11/4/25 9:10 AM, Jie Gan wrote:
>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>> tracing data from source device.
>>
>> The CTCU serves as the control unit for the ETR device, managing its
>> behavior to determine how trace data is collected.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index a17900eacb20..ca4a473614ee 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -6713,6 +6713,35 @@ data-pins {
>>   			};
>>   		};
>>   
>> +		ctcu@10001000 {
>> +			compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
> 
> Missing space between after the comma
> 
> no issues otherwise

sorry for the mistake. Do I need send a new version to fix it?

Thanks,
Jie

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


