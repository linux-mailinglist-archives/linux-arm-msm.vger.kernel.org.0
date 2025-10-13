Return-Path: <linux-arm-msm+bounces-76957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EEBD24CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3D333A328A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 09:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02F02FD7DD;
	Mon, 13 Oct 2025 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvzWtq70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B02FD1CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347797; cv=none; b=IDU/WF5tlN9eDCFkV7+pSe9gzWBOE7YFdRpZOFp+TA6Df4efJjTnKtZ2iZqdSPwi2lvudowG8anoCCyly1pvkR+YP9xklOpYDAhMPwuZP+paRZmhgumGxBSIma4oaSiLnCKWWxpYt2l4as6F0BvfwSC+xOMkObnbM1HwL3cdWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347797; c=relaxed/simple;
	bh=vP0PLgMT4WwbLdCQf3igzkCMShp8qEBYq3eJHshGHkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtx0FNyV0VMsQhwl2ZqYkmLJm4XJCJIGy5IDOIH6hHjmYlMAdnW0PYQSfQtihu0K78/dU7GtH+k8xkOmauVyNwEiitbC3p8raH4g13Qh8EmFAUbqx3fabNVZLjsnZhMfvj6sTEXE16IFCEd5cl58tvGxtsXl7glOeBZqxrzcjdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvzWtq70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n6Zw023971
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cquzd84x/mL+NX5HhV6P5OClJ1tqgADwhpjra3SGp8=; b=XvzWtq70PExzhEGL
	y8gyMkojEIaqMXV0jj1wEdvnvJTuhTKAVpCRI+Cr5OyFEIjghWouwmK4N81YxDeV
	Bd8W9kTk07aOewhrgL6Ss3X+8Wmp1719erMZeFXFaJ0gqqjJ9b7OtP1mndRt1227
	9RxZTxnVheqWeHOijLcd45TMKz0RF9KIxkFwN1099c5MKpexYKAfHWefki8RKpzM
	flrJKMPA9zFzzGE2KSM0hZm6dLn1kAUfe7HkTj42cwLF0/GRL6RxKvcPzUTYkwdr
	t0h0LLDFyPPCDT9vL4/IK08CduY+9vyqdqTne1Vpn0cB6NV93/KPt3V2Lywsguj9
	FVaANg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa842t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:29:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28d1747f23bso81721615ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347794; x=1760952594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cquzd84x/mL+NX5HhV6P5OClJ1tqgADwhpjra3SGp8=;
        b=pNddIOSGhjiRUq32Cx9TWd9RKnjQE0oKD8oWyZuHHS38MEy3Tc7oZ2Bgla6QdLHABy
         SxXS+lGxF3kvBPUqlG8LOAjuEaX84AojorV3rt64j0WxEks2lBJy+yYTaIZnDzv0BX2Q
         QZSoKxD4YIl2TeHUwMz1asKy7gu4qFzGqj6aHak0UySCMuYkz1lYa2vPVJHwR+UF3w2+
         mMjrJ7Ok5moYoSxiLOqyVdQmis5lNahYowVuQI1nkwuyjSaO+sntjCMOICB4FoFS3G6V
         ATg99ycBObflF5eXZDA6zJAujLDl9naauQ0wK1A3DKqjmOY4JGAo9eou6Sx0vkD2L6wA
         VCnw==
X-Gm-Message-State: AOJu0Yx2tbOG7htdizhZwfA9DqhjvkVFcWBcLhqg1ttl2kHXmUlEx4k6
	/5cWuoF9VaRZ4jU5Tl+W5KBJsjWVVg5fAy/CIJUl0R2qKJOPw4453nnY/P1SB4VB4KMQ0JSmXRu
	vwa+MRE3f8bAKi/EFPIpqelQ8p5agG6CProfkb8KuhR3r9jUjkWQ6NXUYmHN9fntKlAxP
X-Gm-Gg: ASbGncuEYbknG/fr60D7GPfjG7XZF32niqXvxvvx8oU5S4vaWXs2PZqpA38RYLjCg32
	Erx4jXLT9NZAcJlVu5snxQgc/nRNE6lVS2HGYSF1ep/FZUXcptWWoRO3VC/DI/ePplaguyK45Ls
	yI126ZkALcBRTaWOovuc3RTnqQMA+hpkAuftlf7z7DsW8jBu0p1Az7vrQNWa35nv6uAzjnsRDbg
	nJ5eu5n2assOLO9/g9lOI2PIC7h9RwgEeXh8ZsHngb5sX2eh65QaRqnuBAlAAzdQEwpW/5tlMtS
	Bf47bQ22t5NC8+kGmLXQlyu0Ps2up8cYMMSC7XRwVKbG/7b3m9RigHG2gln3BEkc
X-Received: by 2002:a17:902:e550:b0:268:15f:8358 with SMTP id d9443c01a7336-29027402ca0mr255190295ad.42.1760347793644;
        Mon, 13 Oct 2025 02:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6UhW3l3Ne3sRJ9hvwI6/6HGpjAZcOesXR6ipfc4QNItSwXOe+IG2CS2vgrhNw4PDOAOyXSw==
X-Received: by 2002:a17:902:e550:b0:268:15f:8358 with SMTP id d9443c01a7336-29027402ca0mr255190105ad.42.1760347793167;
        Mon, 13 Oct 2025 02:29:53 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm128166335ad.92.2025.10.13.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:29:52 -0700 (PDT)
Message-ID: <7a62a8e4-9c67-4772-8687-9741a48e733e@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 14:59:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] arm64: dts: qcom: glymur: Add cpu idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-5-24b601bbecc0@oss.qualcomm.com>
 <2055e6a8-dace-4ee9-a74b-0e3bf2d58fb7@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <2055e6a8-dace-4ee9-a74b-0e3bf2d58fb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RCiGa1Y5cTpJ_bmH5RYfVFDGqVPdobn-
X-Proofpoint-ORIG-GUID: RCiGa1Y5cTpJ_bmH5RYfVFDGqVPdobn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX7O081P/LOH3r
 nTiCxrS9h5P4c5L/nOit+rm/pEIzkOtXGkqrMes1ZIyL9pM8+5a94a5V9UCGMNxDqpAyNFVIyjM
 j/959seqYNJPH7OZ6/1bXFky2ioQZqaoyqp2Mo1XCW0VqAaTAgn/yuJUuSQcJt53Eio5VO1Rykq
 j06c3YN0RyS8SwiL2247cY2j4TzbUzAsTIcywqPb5QALRe5Oy1FKD38zKFbvPrp+NBIft0G3vGS
 gEjuZG9NLl2Ck7bAgx1UppNPFfMUbiUYogO1d38GwkG2iCxgkErIOthJJfzfR7Vxglh0QIJnhMP
 YuCi52BNGDCX8wIiwtRWRxZyDYZKucUrI6MfPPNqLtue7iaN+g+92Wc8x+TIKwZCYv2pt3nWCsG
 an9yOtjlxUZV6GKaj3z+oTiAYEqgEg==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ecc693 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=49XlnRG1adklC0iOWOYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017



On 9/25/2025 3:55 PM, Konrad Dybcio wrote:
> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> Add CPU power domains
> 
> The commit message could say something about what kind of states
> are being added, what their impact on the running system is, etc..

This will be squashed with cpus node.
> 
> [...]
> 
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			CLUSTER0_C4: cpu-sleep-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "ret";
>> +				arm,psci-suspend-param = <0x00000004>;
>> +				entry-latency-us = <180>;
>> +				exit-latency-us = <320>;
>> +				min-residency-us = <1000>;
>> +			};
>> +
>> +			CLUSTER1_C4: cpu-sleep-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "ret";
>> +				arm,psci-suspend-param = <0x00000004>;
>> +				entry-latency-us = <180>;
>> +				exit-latency-us = <320>;
>> +				min-residency-us = <1000>;
>> +			};
>> +
>> +			CLUSTER2_C4: cpu-sleep-2 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "ret";
>> +				arm,psci-suspend-param = <0x00000004>;
>> +				entry-latency-us = <180>;
>> +				exit-latency-us = <320>;
>> +				min-residency-us = <1000>;
>> +			};
> 
> All three are identical (should they be?), just call it CPU_C4 and de-
> duplicate it (unless the framework would read that as "all CPUs in the
> system must sleep at the same time" which I don't know if it would)

Updated to call cpu_c4, cluster_cl5 and domain_ss3 (inline with SM8750).

> 
>> +
>> +			cluster0_cl5: cluster-sleep-0 {
>> +				compatible = "domain-idle-state";
>> +				idle-state-name = "ret";
>> +				arm,psci-suspend-param = <0x01000054>;
>> +				entry-latency-us = <2000>;
>> +				exit-latency-us = <2000>;
>> +				min-residency-us = <9000>;
>> +			};
>> +
>> +			cluster1_cl5: cluster-sleep-1 {
>> +				compatible = "domain-idle-state";
>> +				idle-state-name = "ret";
>> +				arm,psci-suspend-param = <0x01000054>;
>> +				entry-latency-us = <2000>;
>> +				exit-latency-us = <2000>;
>> +				min-residency-us = <9000>;
>> +			};
>> +
>> +			cluster2_cl5: cluster-sleep-2 {
>> +				compatible = "domain-idle-state";
>> +				idle-state-name = "ret";
>> +				arm,psci-suspend-param = <0x01000054>;
>> +				entry-latency-us = <2000>;
>> +				exit-latency-us = <2000>;
>> +				min-residency-us = <9000>;
>> +			};
> 
> ditto

Updated in next revision.

> 
>> +
>> +			APSS_OFF: cluster-ss3 {
> 
> labels must be lowercase

Updated in next revision.

> 
>> +				compatible = "domain-idle-state";
>> +				idle-state-name = "apps-pc";
>> +				entry-latency-us = <2800>;
>> +				exit-latency-us = <4400>;
>> +				min-residency-us = <10150>;
>> +				arm,psci-suspend-param = <0x0200C354>;
> 
> lowercase hex, please
> 
> also, this node oddly puts arm,psci-suspend-param at a different place,
> please align it with the prvious ones

Both updated in next revision.

> 
> [...]
> 
>> +		CLUSTER3_PD: power-domain-cpu-cluster3 {
> 
> "SYSTEM_PD"?

Updated in next revision.

>> +			#power-domain-cells = <0>;
>> +			domain-idle-states = <&APSS_OFF>;
> 
> Does it make sense to include some shallower idle states?

Shallower idle states for cluster (CL4) and system (SS1) did not give benefits for power/performance.

Thanks,
Maulik

> 
> Konrad

