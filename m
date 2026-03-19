Return-Path: <linux-arm-msm+bounces-98795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKUeEeQovGkxtgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:48:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E42CF150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 17:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E6DB3008251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED08A3E9589;
	Thu, 19 Mar 2026 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8fs0SV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSU7WfPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78837269D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938907; cv=none; b=rTj7YKQNqEg24lieGdVzeb1JdcfvCvwVFHLO3UE7cyIFR3WDpFUxkrh1wBXniRHkK34vkv9SGTCHDgNPi6gOz/e+J9Hvt7gxgkYAi+EsQXjPti56w++hXKv4/PYo8lhal2lmQ6FdJ0t4BQiUK6mMlAy6A6AMYxO+Y+/DTrEW2mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938907; c=relaxed/simple;
	bh=y/FraABuP9xNep/gjS+RJwSyPYFQAXxr68yqhYesgH0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SzapubClg2s7wu/PDlPsBP7NnXOUjwr7py3v/6p4eLxL1Rqsjs4ccjda8Hdlc563dZ8KONMYbq/tIKDSVMx8jMGgIoCZyjDE7jhHBs4WJFWoqJhncEWUmYDHeTufNOnD2P62XHovtnY58gQzGDexWmGlzVQeoqlBz+dXgXEl9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8fs0SV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSU7WfPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JG6hY2920843
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 16:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2PcFpzfVHrVpmqpZbpK84XpjUUsLQoulukuZRGaWSI=; b=F8fs0SV6AdGCTMqs
	pZEP50JBY+BQ29KlpzupTEXn7aD2OMXx7O18U0SFlRrO3x/iCCETvAoOkbd8M2Js
	JEzj1EZEDV6OcL5Y8v882zQ9Bq0H6bWmUGkcSNPtnoN/LDTJLsLaLbMQJuI33SAd
	Glcjlqx1K7hWtqb/8jkOVVjgHTx+kAXDfMrClFx5WUFcfQ+o6bpQaIRmT59F5WuJ
	uxNKBlg4rxNiP9A1Di+yWEIhitt6DLioH/p6pWBDb4YCLTBWAdpYOiE0X00OABVv
	8tlO6rcwbky3ZBd57Dmzeh6k0qpoEEYdMOdjV0sqsA+2ZEXeBWVioHruEXjN8RUD
	wAQDWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0mcm84m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 16:48:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06395b7a7so15391245ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773938901; x=1774543701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r2PcFpzfVHrVpmqpZbpK84XpjUUsLQoulukuZRGaWSI=;
        b=aSU7WfPTTX4YlAb2/wO6Fe5LCf9cmGe0bwEY+gTgq2fofjAcIMVSotaQznlYVU2Kkk
         gkrm2jAt5pVoizeHuTzac/wmv+eoLUoRVf1E5vFEl2jcTc+k17wCYG2lZiZ4K3wrGZf2
         GCGkGxdd4MN4Tk1xVpR+OYOefGGMqMk3/RxSPIMlQ+h2eMJIyJmxSCeYVTWkI9n8oYvj
         QKq7MS5QGn0ltfJXU7bNNPGel42ZqC+UYYOOAgLsU+ICWu9ZkC9wYF46Co6jH+BrLfln
         FNaNw5+8UAXRK6W2873fhucGK9MeeBDTAtpEw9UrwHapzoe1o5UfEDMbNpJqrOhwVuMP
         bt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938901; x=1774543701;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2PcFpzfVHrVpmqpZbpK84XpjUUsLQoulukuZRGaWSI=;
        b=FIOzZ6ccYq3RZb80nfnZccQJVNJFyPbjh+tSh5z4ke+tjZmFhZhyNGopOs37HzB0Mi
         tmWuiAPq+YdK4RCW7Piw3Gs4kW4gHBK9mbMvXdYd1MAArPzFQ/dITqnYv7zzF/s7s+CJ
         dTgehsZrbD1hMSk3TyJg+5oSZpfyhPYig/M43InYa1x1eXU4ExBKJVGl5gP6kzRrDQ/V
         1H7Oidh4L4xIskOEvJSHV4mIJa/zha0O9rfnEWikvggOlMoMFju/BgMAPendPd0upuAK
         5AWCXkzBFSDbvNj4ux+En/nUQxAoaiAD8LrDIpAEKc14Zi7R742zJlg85ogauQErBO0C
         aJ3g==
X-Gm-Message-State: AOJu0YzKBBt9bJFO43DEHZjIPWmlOveUxff13FBf1qetF7VQgZrsYRAX
	8FUpNNPa6hEXmdC5nZInvVMWp/74UFGkfMNf92RTARvHmFPXCVBxpWKIp/Ssb/BRbE/uPD0UW3U
	G2QZyrCg2zfXgru9kZmalr6uy8AU4B5X6s45rkgUa3sHTFeoqC3sL5I+MHxmSpCDOSATu
X-Gm-Gg: ATEYQzx3BnMOUeLmj7GlRfb/s79Q1w4BSKGWN4LD44c0hBTBaPCvOegT844llhod8gY
	vEeT/VQJJnp0fpVYqRLR5oow0/L8nOfbF6oHnKzdgkaAXgYygmYsEf0OhbYFJKAUa772CcAo7BM
	3bj6T1AXPcrrvWAHi7lQwoOYAsySmf2UH5c9pdExDegQml0t7aKifmXdAfvQNI9gCd+IBaNK2AR
	ype77Xtw0BT4gEqD0fGqyKmPzSUMqgjkOYLDENPbbTvJqmJI0/yI94kk6k6icLHveEs1KNttO0G
	pgFX+bWRpYmKIBdaXt9ulSSmqkCPnsCBpfsCfKpG1H5lAaVf3qRAI4dpcLbxOfEZZYK1oA1kjJi
	X7vlenRltVkntE5UjhV8VNlLN0dNk+cJE2TU5zyTRUy/rgMMk6HTHHbNfmw==
X-Received: by 2002:a17:902:ef08:b0:2b0:6621:cedd with SMTP id d9443c01a7336-2b06e4319d3mr88268535ad.49.1773938901149;
        Thu, 19 Mar 2026 09:48:21 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2b0:6621:cedd with SMTP id d9443c01a7336-2b06e4319d3mr88268155ad.49.1773938900520;
        Thu, 19 Mar 2026 09:48:20 -0700 (PDT)
Received: from [192.168.0.8] ([49.207.203.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e608a66sm61607595ad.61.2026.03.19.09.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 09:48:20 -0700 (PDT)
Message-ID: <4a839c38-1534-4e57-852e-452876b521c1@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 22:18:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
 <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
 <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CKlDT0ivraSnmZ3QSDSQbcZTB-VNl0-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEzNCBTYWx0ZWRfX6pKyFwDpB7Ei
 YT8CAhSeGz2fMnHpdy7irH8/zViZsjq1x29L19NdnRjCwvQh7zT19wUfVRDYWbaXDVk8Mpzdcwt
 Yey28hgRTqOmlBJSUuZwsWa45IeAw6Wv3xJYoEaX1W/gExybP6kqaPpAO9EJ0BbuBbslVSlIBw3
 4mP+7cpihlNH+iAJl3N9SATbBHRQvvxwhka3Yx6eK0TIRvg4rdgTcu3rf6tEj7meA3ABB2U+u9I
 Tv70yk7Ph2iFhaxYNmVpJdlvSNMGAI2w2Fro1WQZiItiF/Lr+MTj3E0iRUSlKhQ1yfrfTx7zCts
 TJ4c1taElE44uaXkqzUh9JWWErLIAealXkLU12Q1j6pRrePFw5yCr81wrsfYAFg4EyPwQatbwC8
 0FVPT+yIGSGCVZKUyfcPKj/NslBFlhMTa/3QI6KsFczp/w8YEUykpHhY8znJQIPnssVPZaRlKEg
 q/b1+UzvGJ2wwqRm6yg==
X-Authority-Analysis: v=2.4 cv=BdLVE7t2 c=1 sm=1 tr=0 ts=69bc28d6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=x8mJkLzaWX5SuAxYKO6kdw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gSO6LVZMiFxkKTxjkA4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CKlDT0ivraSnmZ3QSDSQbcZTB-VNl0-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98795-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,100c400:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA6E42CF150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/3/2026 5:52 PM, Pragnesh Papaniya wrote:
> 
> 
> On 3/2/2026 6:27 PM, Konrad Dybcio wrote:
>> On 3/2/26 12:46 PM, Pragnesh Papaniya wrote:
>>> Add the CPU BWMON nodes for glymur SoCs.
>>>
>>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 87 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index e269cec7942c..fd947b1a17dd 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>>>  			};
>>>  		};
>>>  
>>> +		/* cluster0 */
>>> +		bwmon_cluster0: pmu@100c400 {
>>> +			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
>>> +			reg = <0x0 0x0100c400 0x0 0x600>;
>>> +
>>> +			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>>> +
>>> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
>>> +
>>> +			cpu_bwmon_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-0 {
>>> +					opp-peak-kBps = <800000>;
>>> +				};
>>
>> Can these values remain unchanged vs hamoa? Glymur has more memory
>> channels (as reflected in the icc driver) so the values send to rpmh
>> will be a third lower
>>
>> Similarly, hamoa has roughly the same values as kona, which has half
>> the channels
>>
>> Konrad
> opp-peak-kBps is proportional to bus_width and is calculated as follows:
>  
> opp-peak-kBps = (Hz * node_bus_width)/ 1000
>  
> All the existing targets do the same, since bcm_aggregate() in 
> bcm-voter.c divides max_peak with buswidth.
> 
> -Pragnesh
Ping

-Pragnesh

