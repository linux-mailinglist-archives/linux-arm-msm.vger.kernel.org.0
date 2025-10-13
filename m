Return-Path: <linux-arm-msm+bounces-76978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E52BD2783
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A93E4F1CC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814941A3154;
	Mon, 13 Oct 2025 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FO3eR9up"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B5C2FE06E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349980; cv=none; b=hHFMCM9W/BdJg+z+hBJD/OB8NsYBK51dIvzxFOdajL37G+rT+w1oJekrZSLepZxFu7H7M4ev76WiPy3rji1iHSzvkvreMsM9fXYJ/ofp7hAf0FZAYjkbRHpRxkDVdlyRi2SUx+qRsmjg64qVtbNFi4n+/AnYr/esbVFmKRkllM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349980; c=relaxed/simple;
	bh=lDWxaAzr1ubxN9qq1Z03neK8IbO1ZPnCFdTLsJXI13c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfQWQng/EyX+a2cxMf9er/GIM6FgcYQBCp8Bxpw3gq61EtKU8ZKiSB3b3MDDTAv4KhLG/PK1US49nHjyS2wmPi9BmjyH8dQJ1bO1v/DUB5s5/FxrT9Vor8vPhqnj8ZpT0Xx/FiudSaA6utIy774WeDlXukNPvPlpZ2i3ER3ZyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FO3eR9up; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nBjo000481
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Otv8cx1oiW9ZoWYFXAyZiTDyE5y+heQuSLgS1nHQFWM=; b=FO3eR9up3aA534rR
	8E+4RFs1jxbtjiluWQLaj4dv5LXAMIrccWwmGQsR+fkksA/b34TNlX7M59aQ+9hd
	o30iuT9jt7YCmCFfAxQWY+76ohV4KjUC/lTZb0fs+ztM5Mmu5AI6gXqMpWlh+yJx
	CdrcVCex/AfXx+VreOeet0FcbWQhpnKLIM1kfw3qmiRNMpaAglkd8j+LrypEBFqc
	Zj1E/Dzphs4NKRFJFeQx+9fKwH7Fnne8nRsjwFlEgYZQv5XO5zg/xeAAf2bU7oFM
	iMRaOJL33B5UaI4wiyIBjZ+/iyDIo7JCD0Y/uyTWLeD6lPAYQejEWt6ewRldMf4Q
	JArytw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qferv6js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:06:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-865c7dee192so193056685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349977; x=1760954777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Otv8cx1oiW9ZoWYFXAyZiTDyE5y+heQuSLgS1nHQFWM=;
        b=WJ5kSwSZxCZ+FOZW6JdlP4+rIk0ofqdAB5Xmm93bdVt7Ca2FijsptMoh+0G29VrE4r
         Fer3Yj/SZEdrXV8GfTb8lUaCP0ze2LDDzk2Q9TcmpaXZq6Ljost1VhN5MuMmozxK3slE
         mA8P02NFhNgkhZF1XqApJjYhXS4vRJ1Q+/dTWU7fNZiMbmqNHfoSR4oqabUdBG5T1Mr+
         rYJ6xCn26rYfgj4E1NJdUGDWpIe5BD/d1YaSFcKDcMjzhsHCkJpwpQz+va2GZNSfO1+b
         OTY0auVvZ5Y2kho0NanmU0axULOqJYlA2WC33Y6QpERHQNovfzlAzD79fvevaBKP1I5r
         jDQQ==
X-Gm-Message-State: AOJu0YxZE6cOQu5fVuLrVeSR6Q4ZdX/BEQl1WovUjaczD+OP836mQjTF
	TlODXw158T55v4GHAw3sSNqYUL2jbDj9k3nQa3hMjAOiuow9ifAzW/MQa36ARYQq54FS6plu8iY
	NSfR1xh7FeJMzhv/jmUrad3D2tTfuyoYJFNi7PIEtNPs24cazlgTXT14pnwmtNGl14cSS
X-Gm-Gg: ASbGncsk8UMelYhk5JvnANNhi+PWjiQ3T8R0FMY91TTrgCVCVfLM/cXX48DGKfND0xQ
	jXy6zzSCiOy9XtCtcHenJJrkxbD8d3Q7WiANo3ZuJa3Gf2BLPqFDR3dUy/RKrX/wBeIufat99xY
	jylwtuz2K0Dp2NOON0TjkfbyfDmn68aKnhutTzUO6pGtSSNmez8+lj01G60s2GI936bdUBu/vax
	nMBdZJQ70qi38GBsKM1Ov9yaRRzaGkM4gSzc7ExKPDZhFFfvIVqi0B/OJoVAsIBL7ON6qkhiiSM
	YtBkzUuC/AyD8K/E3vssRubAj9MXKcWUPTML06fVL08P9saDTaszcP9y3i6g2ctJEBxqGp6lZQM
	TQSw+2KeFxvVzv8SwS6burA==
X-Received: by 2002:a05:620a:31aa:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-88351fd204emr2008637385a.8.1760349977142;
        Mon, 13 Oct 2025 03:06:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXJ7K8dw++bJphGB127PSJ6QNoV+sG7t2QtOil/vVGVAQL67doMLdc6ejSELgkLCSeMcvtsw==
X-Received: by 2002:a05:620a:31aa:b0:85a:4bc8:3d2d with SMTP id af79cd13be357-88351fd204emr2008632885a.8.1760349976436;
        Mon, 13 Oct 2025 03:06:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9a3fc41sm899555866b.87.2025.10.13.03.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 03:06:15 -0700 (PDT)
Message-ID: <375ea9e2-c2d5-4bab-8272-ed54c37f8415@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 12:06:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: add system power domain SS3
 state
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012225950.15475-1-val@packett.cool>
 <0c8735f9-eac0-449c-aa95-b82cec0e6cb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c8735f9-eac0-449c-aa95-b82cec0e6cb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R64O2NRX c=1 sm=1 tr=0 ts=68eccf19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=2QVM00dS0TtG868yuiMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KOtrIlzx2EoEH9hq4pW8xMinqjn1hNt7
X-Proofpoint-ORIG-GUID: KOtrIlzx2EoEH9hq4pW8xMinqjn1hNt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6+NzI3z2PrRo
 yxfPbNnQ0YpbfPzlTOztCC8r4kAK4XPAcsUf8JdTxzrjJXnA+AIsM9ydBepeUUwIl09PQbb4Oan
 syNOBd8QXG7DGQC6i86PmHbwZQquO0X7eOw8C4c8TdbTYHZR4O1EbkS1Md1zyMddc48u+P745FH
 n6iHMircEJQbKLtH9D8jTI6FE4JQ8HB5bOhBPSW9y4BM9S2KsrdhUQ1LM2Y14AnqS7mY/yKbmwR
 FXNGbFpG2TKdcoKKErLoXlKtopeTqF/9i7Qsb24g6EbMRhmPrv6pVxMPkr/cXKTAAVXQUSyA9MY
 KVo/XpillxtSLhoDXZBAOqCrneJbC66P/u1R09XfC95XUDO2mOAYoPZo9t+ZRfCNoDNtNSauRE+
 +tZBPerD9iB+XAxaTpG5xwbsURwwvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/13/25 10:15 AM, Konrad Dybcio wrote:
> On 10/13/25 12:54 AM, Val Packett wrote:
>> Add the same PSCI state as seen on other Oryon-based SoCs like SM8750
>> and Glymur, seems to work fine on Hamoa as well.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>> Tested on a Dell Latitude 7455:
>>
>> /sys/kernel/debug/pm_genpd/power-domain-system/idle_states:
>> State          Time Spent(ms) Usage      Rejected   Above      Below
>> S0             69476          23006      195        21562      0
>>
>> Seems to mostly be used in system suspend, though I've occasionally seen
>> the counter increment a little bit during runtime as well.
>> ---
> 
> FWIW the exact same state is hardcoded to be present if you use
> PSCI_SYSTEM_SUSPEND (which is mapped to `deep` in /sys/power/mem_sleep)
> 
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 3cf2568def3f..fab8104147bd 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -303,6 +303,14 @@ cluster_cl5: cluster-sleep-1 {
>>  				exit-latency-us = <4000>;
>>  				min-residency-us = <7000>;
>>  			};
>> +
>> +			domain_ss3: domain-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				arm,psci-suspend-param = <0x0200c354>;
>> +				entry-latency-us = <2800>;
>> +				exit-latency-us = <4400>;
>> +				min-residency-us = <10150>;
> 
> You seem to have copied these time numbers from 8750 as well, but
> it's not a great idea, since they're tuned for getting a good perf/pwr
> profile for a mobile phone
> 
> I attached an old patch I had laying around that described all three
> states exposed in the windows DSDT (although I'm not sure if that's
> exactly beneficial without additional tuning too)
> 
> +Mukesh please take a look

Well, I of course meant +Maulik, sorry..

Konrad

