Return-Path: <linux-arm-msm+bounces-99316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOS4LlNWwWmBSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:03:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCFF2F5B27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93C3304AD2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87193B2FDD;
	Mon, 23 Mar 2026 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezOkwpGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACNrOpHu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FC3B27FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277384; cv=none; b=h3PGJm+AEvJND7asBC7dCrCkxXOBMFE+7xsUj5KovcWYcRlJ58v+N9V1YUar8wbeRf57Ll5KiHpYQQ2RahGheUWx9N+0x6nt6YCLpJyJZugfAHxF8oKDkQpt9Dz1TOQSrY329kssxOhvJpOtXhGZiE6S2pw9GUiyyA8HCl/1dD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277384; c=relaxed/simple;
	bh=0/r/G+0z4yh01mKu1u+OVKk1NLi9FxpmQdTT7aSQh/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRC75X3pPlIqkmAD1AP3UNUaf5vpZAuj+Ndg6tnFmcY0xlbSPqXZpfre9x9v9+066WgPb598V5LGf7WASZmGQijwYBwsy0FCm5Kw91fuhqrG+qq6UY69vQ/7/MSfiOQ2hpf/OJ16HI2Rw73gBRQOsZ8LGblgRKQ62uGr294wOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezOkwpGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACNrOpHu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBLv1q2758677
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFD/0D7t3HkahIJrCp8Wcg2mwyN5dY4QTfenxFKZJog=; b=ezOkwpGRKkMa0jJQ
	o0RGNwdMo4ZjWPRwhMGTRwDkbKdetlyG3pRb4OwKYDar+Wm5YlhoZHsb8rXH2w7z
	CwC86ZOqIPd3Qd0uo2giPyrmXoOmhb7v9pJFLu0Ja5cu4C/23LaZtu8AvMGVQs0v
	Oa0/UFVX0rUGJEtDeCJ7AMOekaJBFSCX5aSH76DqPvHEA/TVjBX+7KquWaW1CVbr
	4zsyRdOKinY9FncviMcfLlQIvhBlPYzj7v/kSTYzFJHZTRxj/4cmneZq8UqFfq7n
	WJVnUBhudJv3mtGfKfoUhKe1GE65soFR4xeGc/bXDWdKgURnpuxAXCqdnJZo4cmP
	ze/VQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4grtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 14:49:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so27926351cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774277382; x=1774882182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFD/0D7t3HkahIJrCp8Wcg2mwyN5dY4QTfenxFKZJog=;
        b=ACNrOpHunII8fKwpfxUvbKe6EdZnsJqmbuMzs67IK55vhGUpaXKZRULxMykusshk6K
         53RUyPKN3mz9S2jZ/QU7HHhGzIgeAdbE0Je/QtalZ8gJavaNaZsZIEkwvGI5qe88BWAF
         BqbIc1LMx5M/0yHO9N+7Z1Z12Nkd68rZ0/bJiS+Z61DGoqs27jBjNezAqR4XjAY4RNta
         zW6TzSJ8533c6h3baF9+hhYyWkwDNeTuXOdFts5ebQeP8F2STXmMnGfAyZlbV2ovZ0M1
         RSt8Z5UwAkAO25UjDKUz25fJ8kc2kvSXVIlpGwn3gHXYrMjiFiOwi3me9JhQyyNegGdg
         y0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277382; x=1774882182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFD/0D7t3HkahIJrCp8Wcg2mwyN5dY4QTfenxFKZJog=;
        b=WXuZ41Q0SwITzPsbgDn8NEwB27c6SnF+B0rhsAstXVHR8yupeMMouuovA6aeU5iuE+
         Ajg+gcIglLi3uhKcSym8cm+M7taQKkd6m7I6RYTk/MX0kqx6sI+EhEcOy6pHbeUFrnbf
         j5vTOVI1DzMYvZkCgipmkhmorGQTxKo/+c84I/xNoiIuQ1JTWZKv6Un/XAcnsa0Xz2U7
         LRhyzk0uaOmlVE/9Yh9jg77nOkX64fA6VM1TeOGy3JxZ5et50+TgS0lIzyTD1+UhBy5e
         bDA2v1hE5wbJ2pOwNM5cTnQnBgg+MZ+EqNZC0giXdiblehg+QWRjpJ8I4P+9Mmqpyj4F
         liaw==
X-Forwarded-Encrypted: i=1; AJvYcCW8oDtqWDf1w9f8YEwjjjEXghfAvNDMLESBbkAArebH1xFA2t9B+jz8RIxi9IDgsO6QKN3OjveNRs8I8gZF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1gmvJ28W5rSdFWD/yjpHGnj7ZJ+/8SeXdigPQ+OIpSHnEMh4
	SyvrOV1dx9oBeT9eaJ2thLX+ZDrN13kDyX59Z6W2SvrTyg1E2It/wv+s7nuehNHWgD/e6tTjsvs
	T5biypPe5tJXf1h+Ym+cBffVcvG7YsKdmtbY0tufNtDTdNhtqaGd9SEn8Skg4JO16rym6
X-Gm-Gg: ATEYQzyjZmYXhcmEqDIypjFNOMWmrWJgQB5N0V2wDXbilMp9tQkH4AU84dBwyWANFfg
	uoJ7vYI9uNOENTnUKD+ahVDRCHCAV+l26dnv6oF/KJr/zJksTPlOENdUoInuYtGh5wIUCZ4NHVW
	kr0Y9wbwshM2cgBuHLCLDyRDFd8CRfv+aYZJXe/WdJkAgrxVgomET8YmPDiID4OUYpebwTjNosh
	sGAEivq9UTcr8JEPAVwM8mOGs01D+1wT+xYEW4RR3gKa5PU8yRLMYzUTmVukHmeqAh6l/Zfq+lA
	hJI0vmcnyLazVPJKyWzB6QUh5Lc4lAeVkp1G7MCcdepIb3dg9Q60QqbFnE/0nesWLh3ZTGXnRzZ
	PRUx7zjwbR/A2zegZYIIIwbnVa07tJrwK8Ebtdr1wJUSOMgYlbijxDxdJSg71SS09SH7FLJRWwE
	tdywQ=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr10113041cf.1.1774277381564;
        Mon, 23 Mar 2026 07:49:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr10112421cf.1.1774277380803;
        Mon, 23 Mar 2026 07:49:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42f0dsm505750466b.12.2026.03.23.07.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:49:39 -0700 (PDT)
Message-ID: <df086652-a715-4299-b6bc-5d253b7bac39@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:49:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
To: Bjorn Andersson <andersson@kernel.org>,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
 <fcd9de7f-b65f-4a30-a74b-57bdd690422f@oss.qualcomm.com>
 <2d6d813b-b2e7-408c-bf58-86d25859bb40@oss.qualcomm.com>
 <acFLk7i7FMFBTbQS@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acFLk7i7FMFBTbQS@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M8qK7ez8N5SKamn3lX7pDUSOa3haw8X0
X-Proofpoint-ORIG-GUID: M8qK7ez8N5SKamn3lX7pDUSOa3haw8X0
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c15306 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=T3UWdygilXLZWxFm05IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExNCBTYWx0ZWRfX7F3qVtGO7Dny
 8xff/uV0m3DN8cL5QnkAJNqXCoeaxHtAS/899KaKzfPCm0Li/7flwxAc07esPotfqAW2brQYGRz
 /trWw/vKTySb1cTe5yv6RH39ScLYhA0UJW9qoGjII3u13XG/UMKNxVXq4uNTQJyl+U5gLWakJjw
 DxoNDlb/zkEcTn4nChpX3eu5AolzwTvEkjvXhT8myowYGkoq6j1OP8FDHhtnpzj9MhEGBaBp1PB
 lRBlX1PxdrtXmwWQQY2GodT3ZeLW7u0Z/M/k+qkXD/n/XX2Uqb/8pa0IR5Oy3x8BCSWSJzcTLyS
 v0D1/N5DMDn/JehVhk4y2adTaZi2VGe/qmRZ6PpPdvoR9pyq/HBNyUoaf9wu2raR6DcaeoCT9Rj
 z+p5xeTuLrhF/ygzcghUQqZLk6GyWjm4841UNZPox9h5Q7/bSVdq0DLYC8jlQ06rdOxKNYz+meI
 bG6tu6n5VyrGgO4rS/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230114
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99316-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CCFF2F5B27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 3:21 PM, Bjorn Andersson wrote:
> On Tue, Mar 03, 2026 at 05:52:53PM +0530, Pragnesh Papaniya wrote:
>>
>>
>> On 3/2/2026 6:27 PM, Konrad Dybcio wrote:
>>> On 3/2/26 12:46 PM, Pragnesh Papaniya wrote:
>>>> Add the CPU BWMON nodes for glymur SoCs.
>>>>
>>>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 87 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index e269cec7942c..fd947b1a17dd 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>>>>  			};
>>>>  		};
>>>>  
>>>> +		/* cluster0 */
>>>> +		bwmon_cluster0: pmu@100c400 {
>>>> +			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
>>>> +			reg = <0x0 0x0100c400 0x0 0x600>;
>>>> +
>>>> +			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>>>> +
>>>> +			operating-points-v2 = <&cpu_bwmon_opp_table>;
>>>> +
>>>> +			cpu_bwmon_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-0 {
>>>> +					opp-peak-kBps = <800000>;
>>>> +				};
>>>
>>> Can these values remain unchanged vs hamoa? Glymur has more memory
>>> channels (as reflected in the icc driver) so the values send to rpmh
>>> will be a third lower
>>>
>>> Similarly, hamoa has roughly the same values as kona, which has half
>>> the channels
>>>
>>> Konrad
>> opp-peak-kBps is proportional to bus_width and is calculated as follows:
>>  
>> opp-peak-kBps = (Hz * node_bus_width)/ 1000
>>  
>> All the existing targets do the same, since bcm_aggregate() in 
>> bcm-voter.c divides max_peak with buswidth.
>>
> 
> So if we make the bus 100x wider, we still have/want/get the same MB/s
> throughput?

Right, that was the question I tried to ask originally.. 

glymur ebi node has 12channels, 4-wide
hamoa has 8c 4w
sm8x50 has 4c 4w

bcm-voter.c then does:

temp = bcm_div(node->sum_avg[bucket] * bcm->aux_data.width,
		node->buswidth * node->channels);
agg_avg[bucket] = max(agg_avg[bucket], temp);

temp = bcm_div(node->max_peak[bucket] * bcm->aux_data.width,
		node->buswidth);
agg_peak[bucket] = max(agg_peak[bucket], temp);


Most notably, the channel # is only taken into account for avg votes
(whereas the BWMON OPP table only has peak votes)

Perhaps the question worth actually asking is, whether the code above is
correct, and if so, why that's the case. Somewhat frustratingly, all
downstream kernels that I can find seem to corroborate that.



As for the immediate, this patch is indeed correct in that it creates the
expected behavior.

Konrad

