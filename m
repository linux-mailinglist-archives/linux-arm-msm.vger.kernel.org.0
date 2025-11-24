Return-Path: <linux-arm-msm+bounces-83025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B359C7FAB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 363924E1510
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93482F60A3;
	Mon, 24 Nov 2025 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XepTROBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoEj6UzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20085298CDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977251; cv=none; b=cDuSUOwUSOWzy5JMV6/sY8bfj+hCPCK9a0y4tCLu/n4f8xmAAZ3YhTwXjbbr38yFL9eze95+IuOtcJIdI+yUPxWPDX5U1yr2caYyTYMSYq1fAmej+skyxckeF5+AS0xWwT2AryTcSvnLIaSq4nlqeGkDCWu7KFZe2CCFeQ3z9W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977251; c=relaxed/simple;
	bh=lhvQ0yUi4lNc90U56dIepg6hpvZuJ1yazj6oQhUx9Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUH37+zDbeyMjl8IFNPRxR7dXAjWzGoahx7saQrRlm65b0hIH01sgakZTlAEkw2fFxxkfAWRq3UYNg69Dys5Gn4LOi7khwywahNuyps1nU3/o2CUKlTY972AjyPMu8DHl2n6KSWBxzoKFcj3n7ht5TZ8BQERl+9hVK5fqBl/W3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XepTROBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoEj6UzV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8kmVA2689189
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNFvi7aIbzm8D9aSesKBYi4sjZzrxUjXcfJyayrQXjw=; b=XepTROBoDL6f6jz/
	5UbiUzOqJcDGnErl1HK8Fmx4Wq2oS9/H8oMSjiM74/zjgD0og0IErwrF6BrrgTut
	KC4ehyAUJCYfFq6XpdcHDT41SJmPDFkfUl+rzZdxjmJxrN6zmDAVJaNb7WTfQjKB
	PXOq33FODax8RZZQSR2g3h4PS7se4dnJxDl16+jO5R6BQdcwIN4OUh27S2YdRS49
	ja4QpWgvEgQbNjhV+JQ3ETWpy56jGVuhi9v/4UGVVMR+6QxEr3dkmMvXeCIzVL/i
	YSKe5bvyMZ+Jg4sYNtkf5gTL5sIl8YV0Y9I7PACpetQQOxiU4rwo4DK7krxMAZcf
	JVMZjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6ffcgbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:40:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f8a2ba9eso100793955ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763977248; x=1764582048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNFvi7aIbzm8D9aSesKBYi4sjZzrxUjXcfJyayrQXjw=;
        b=XoEj6UzVEkSdIUNXOK5ILZTZGC1oovoiVBO8ZN1StEMGmmDeUbe5GlgPuab0+3tiZw
         BHc7qigCaom8bmmTO87HLQBMetP0V1GpFKLHDn7Fungxxqxypxj6QcOqocYdtUTgun0Z
         xTEJlU1sBBkiwidIWRUiYuB12s0Nx+c29B0wqnChBYDONa7iq1Du0Cg8sQBXuDSradc9
         Qk0Vh/41wDHW747nE8SnElvK4vPk8aA24reJcDstlLmDkl2uSi2wZkqxrAKwskD52cTv
         HX4vM8w2d4CiFmuB3j/d4+FcNM5MF4dUdlGTR0gVqIkoD8qpLtLcQ7vP8PPLqPzUOC3e
         RCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977248; x=1764582048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNFvi7aIbzm8D9aSesKBYi4sjZzrxUjXcfJyayrQXjw=;
        b=rbO/WiFqVoDR636oqA/7k5mj9GSOjMw2cLEh5MGNgrUkYwIZAmlzpeA+hfwgUeBH7H
         OLmPRRUKJbY3B12qo3EaB3Evuo60SxxPwjgxp6KBkiTxVTQuM5aq+HkNWk8B1I70KXQv
         koVA+LsIjJxlIWrbX4Ij0BWFXSgnO8bJ0TjxxDG+YYQRT1EWyLppSKK5CMTtQ3LCm1tD
         Ia+AQCLePwFm5xQ64yS9tDXN0OjQ+8OCcP3ZkGkmtmLv1sqajzWPM8yrW3mHT5+rgvCp
         FBzTcudxJxvPwdPrOtSC+5LH+aeLvXl033HmQOZZSs+7fQLgQLXEjPRJGYdnIEU+7fGD
         T87g==
X-Forwarded-Encrypted: i=1; AJvYcCVzYeB0AQ8ML4gfCs4DFWlGt2wMFA+poEOvmgs7gDgBOy2q/QV7biToUGN41dFfa05nTyc5i0ttykWF3Lnt@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAqztFrEBXPuPW/udEypaYH+jvRgTFZD21HzCLYO58bD0AmJo
	xTyDShm/YVBwDrojfhIn/BWfQz6Wm5dgJy5YId+Wl04FEYwFsOU8BWSe3fY9+A1n9hPq4SjuS7f
	P2iq7TYwwzS6NRBDtO5o/0gltL0bCoiSwqI4w87B+ESd6Qg5g0iMxeeJiMfxhRGFBOe6K
X-Gm-Gg: ASbGncvYs21BtPQhZBP2ELdPmOXQGnVcUsqPdAMJK7jo5Iho8+YVTYK2fciCPwy5sw9
	9lFiyYCpWdRo5xuc3PmM9z3xtnS5bwc1DWGPkQ0S88+yMFL+TZvvRT0k9+fdQfEcOeuP6EtzQPE
	PWLdJrk+BFOVpTqGLl2VZQ0CmqGI8NRYM77zf+MSqNlI/kwS9tOF/mDA6Eyg7Y45Y01POHuASMY
	FFtTJKCPGJkBpJ6jafluuZ2NMaq0J8m0n0DyvwOdm0qiqFc1X+OUr1vwyo3XRQ2ylvu6WSW5n8E
	SNefry+gzxOgljDc59GNJjLabA6Rx/vs4RAYkhk8MWhOAj8daTCTFle50gUjqMTCTlkO2Uw9Fmh
	IWuFYOgCS2MfijMbYc5nntyG/C4eSpvLVs/QSYRpXHQ==
X-Received: by 2002:a17:902:d587:b0:298:39f7:2d83 with SMTP id d9443c01a7336-29b6bf3b849mr143766865ad.28.1763977247899;
        Mon, 24 Nov 2025 01:40:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFydp8fiW8WVoNMuoKv+rgFvWqiuLz4MzGJVcl+ZoU4OhTn7ToiKsUGs0n9JLTW4uyxU4MzEA==
X-Received: by 2002:a17:902:d587:b0:298:39f7:2d83 with SMTP id d9443c01a7336-29b6bf3b849mr143766625ad.28.1763977247435;
        Mon, 24 Nov 2025 01:40:47 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29978fsm126901155ad.84.2025.11.24.01.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:40:47 -0800 (PST)
Message-ID: <13ea5fd7-b28b-b6c0-752f-a7d4b4677298@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 15:10:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP
 table
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@linaro.org, mukesh.savaliya@oss.qualcomm.com
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
 <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
 <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
 <nm4hiy6vd5b3t65dagjx5m5qjfjdcnehz2s5w4lyu44eaqnwkc@hnmyhokxufz5>
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <nm4hiy6vd5b3t65dagjx5m5qjfjdcnehz2s5w4lyu44eaqnwkc@hnmyhokxufz5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GK4pajPWpBfxhZZkAjSaszzzZr2FJu1g
X-Proofpoint-ORIG-GUID: GK4pajPWpBfxhZZkAjSaszzzZr2FJu1g
X-Authority-Analysis: v=2.4 cv=OsxCCi/t c=1 sm=1 tr=0 ts=69242820 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fkNT4l1spcEQcygpf9AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA4NSBTYWx0ZWRfX6ZBfxM+iS0pi
 Dzr8Fhk0sQzhmFyD/9MWXBBcOpxzn1Qi5apP1J7sefRFJysTf8S7juB5Q3NiQhHEseWMsieAija
 2lqLYSTJw791ikocvL9lV3FW5LnYC2UNQiIWhTO1SFEmtHQEXYC+WuP9XRmpPBSKzwHEe9FsKNr
 d1KjIRtmMseoucB/WvT5WfdDUiptAlZbd8Xx5kUhxbZ0KMHR83vcezrdr/xnOBenhQ62BAmPxMm
 gNaJWUwXcjfDuHQyhoVrqFK9FASRkRrOoio8JKNej6lpBP/KaJqBbWzp6/fUBIcHFrtVWzwez2o
 bHpJW+UpMZfJartiOU1zPpvw3L1oUrj9mHKR9BaMtWI/VLaOXddbFUBJaHSJHyPfTgNQIrSO9K0
 09bHBRj/r+TC6UMAGSMAW0+8Y55uQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240085



On 11/21/2025 5:33 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 03:37:21PM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 11/12/2025 1:25 AM, Bjorn Andersson wrote:
>>> On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
>>>> QUP devices are currently marked with opp-shared in their OPP table,
>>>> causing the kernel to treat them as part of a shared OPP domain. This
>>>> leads to the qcom_geni_serial driver failing to probe with error
>>>> -EBUSY (-16).
>>>>
>>>> Remove the opp-shared property to ensure the OPP framework treats the
>>>> QUP OPP table as device-specific, allowing the serial driver to probe
>>>> successfully
>>>>
>>>> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
>>>
>>> This was merged 11 months ago, and Yu Zhang added bluetooth support 3
>>> months ago. What changed to break the QUP users? I think it's reasonable
>>> to use this "Fixes", but we should document - at least on the mailing
>>> list, where the regression happened.
>>>
>>> Regards,
>>> Bjorn
>>
>> I’ve checked the older Linux versions and found that this issue started occurring after the following change:
>> https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/
> 
> Hmm, but it's your patch. How was it tested?

For this patch, I had verified only the I²C instance and compared it against other SoCs (like sc7280.dtsi). But missed to validate all other instances from  SPI/Serial.
I realized now and will make sure to test all possible nodes in future changes to avoid such gap.

> 
>>
>>>
>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> index eb6f69be4a82..ed89d2d509d5 100644
>>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
>>>>  
>>>>  	qup_opp_table: opp-table-qup {
>>>>  		compatible = "operating-points-v2";
>>>> -		opp-shared;
>>>>  
>>>>  		opp-75000000 {
>>>>  			opp-hz = /bits/ 64 <75000000>;
>>>> -- 
>>>> 2.34.1
>>>>
> 

