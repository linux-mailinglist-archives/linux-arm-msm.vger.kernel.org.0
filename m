Return-Path: <linux-arm-msm+bounces-82796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85356C786AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 365D2354850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566A2340D9E;
	Fri, 21 Nov 2025 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGuxeJfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzBlCeUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D434320C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719652; cv=none; b=GmXGrRh1raCnLA6aBLwBT/v7iTx9UoYcJHPKSHUbM4kEAbTuXS33cxX5tIjMCprMvq93Clau5pgQ8m7St64IzBEeSmWebH+aYEvPRWOOjydRtHUBpTNRYP+3nrxwRqiMLdWNSiLJa0M77mfhh+d1e7wWpPaqFnDw7SQL7dug+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719652; c=relaxed/simple;
	bh=PNmoRySXomFwHZ5wJR3FqfFGTm7ykYNU7b6TynDTfLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZJaCO0GJA0os63HzRhw71cHwcyreTJ1S6lWlTu5WY+Kkpjm3p3MnKcSTvqa4hZxviPHXogdqaEYWJdpg95bB7nM3r9Yvsgzs+VoXRllD1pJVfdexIacMdGF/M4PGAE4vOib2z/QS6UJTVFJIX91zslfz1XyfOkcBqkjkOYwe38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGuxeJfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzBlCeUc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL6XSVZ1987998
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qWcC51wdthdog5p8LZY+DkjPJ5e5/TUFh7HiVBSxto=; b=MGuxeJfS9t13WT9g
	02kaVwfWOT/Y8viLhVavvUWc37gMtPhXEMGWBPn9OAM2GCmQ7+2k1BH2e6XB97l8
	1ttFT4BxJKZp3+BQ2f9/fhicnspB0FIqSDzv9iXPFllJy5cMZBh19FcQAtKh+ZTI
	YsnjDw1RBYBtyiDU8pQGAL+tQ5IS571s+locXYw0JGLoVu9TGOuZ4QBk2KS0ZCzf
	71LoI3Vj74i2uqI6rYOI3Jy04Lbd5A0RUt6R02hSjPfF2DWUK9L5fnwUxGr1pA3p
	yl5YrUvnpXTQ0bScYkytRkR8hyGo1mtYCUlNB1tiWLUwKEeocAJD6hqWVCcnWb9B
	1/08kQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj1vac0v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:07:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dde580c8so73120565ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763719648; x=1764324448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6qWcC51wdthdog5p8LZY+DkjPJ5e5/TUFh7HiVBSxto=;
        b=IzBlCeUcKPVS6UEYwV1VSjjxHOapLphu9QrkxmnTwSqwD8M2ZMtrCC4oVWawvqBSYR
         BYWIZuMJHzdju1LItUoy2DpVWCk52G878sL4E8mXgwMHfWjc50eji8nm7BkeQ6tb7SuN
         ZdN08EVeZNxmD77PrnbKte2UfIMPcubawktipSmrh7wWcg+biEph3g7F/cgE8qoyo/jn
         NuJdN5Dyj6z2Y92pntJsjNdrcWqnlxu3/RWJbboP+hZQn5ZoBvqCVZSq3qA9QuYTb7Ae
         ehz0EonKy0ErzChFuzLoi+Zj+pX77vEe7QdmT4QC9DdmQXofkIVd4OQ98XXdo2m19fuq
         u+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719648; x=1764324448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qWcC51wdthdog5p8LZY+DkjPJ5e5/TUFh7HiVBSxto=;
        b=WR1YaEUzaC8mADR5xnDGsse3isGJ/OPC0sqmZ1U58VZhB/xqimTI7UEYRDsjqV0Bk0
         hYmbTV/UBbGgVBoaBfgWezDuKgsF5PqhbnJX+P7xxpkv3ZVdtDPJFo+aB9vSTlo7Kwzy
         u/RR5udgiRqMoRJVWlXL4Oxwecs2uDFvL1epSr5KXGjRK49llO6O1hnNCXxPgiBGo65E
         wtW4WIE7hjj+eN01jAseWd47Ri7k0CEXflb49JCHQzzSOphbNBtgw7mTpVXLOVeWF+sq
         Etnv2eqs9GBZ4TtYuRU8Iv18srB7LsXbUVHHQkEOLMjIQ/6OvwUURTrdQmvshIi4dOxf
         qNLw==
X-Forwarded-Encrypted: i=1; AJvYcCUN5QPojaKLytVn4/B7lloLNo5I1H2iEZSmu9Vgdji0vjSZlpZ3UxNTxzY06I/Yw2E7EmqOVwYbVxUJdKfU@vger.kernel.org
X-Gm-Message-State: AOJu0YxwI2hNkpBSgD9cANieBjy5yhtSLOYsgr1WLVjMXr3oEVvtvyN1
	PxWqkH9Hxr22ymBuut9VBCVLUwjXetXN2P7gTR9V/sHF4yBXUy9OO/OQ67nQIpbkXwJiTx7HgSe
	OkIrXJ5bCEzMJpuaVkwAiQyn/a6T2H8gJSYpJPDpn9aCjpZ/MVerwKnVUNdLwYSQSVMBK
X-Gm-Gg: ASbGncshVuuXtDDXVHAmLGU9iYzTqBEUzutenXKjre+6r6+PlqiePvPrhJRSXMMs4pZ
	79BUTx6zv6iijpGKHPWP4rs0ipmZcwp4AW14GpeQY/YaUDYHEhuNFeDCE5OcLL6X+tmHcIw4jpv
	f3b3Ro3VJDaTOgcS5yNRhAFJBSLNmYlQKFpNqZ/fR6fz2zi98gyCTo71qqVgjseRqY97dhBJVtQ
	PFaMPJPXkjic5+QStai7sD5PslVrai1c3CgZvPc0Z7Ecmpyzer3m1/9keZDaekCzB47DLZAsVfH
	Ize7rydQIcelYpXGa7h7qNVGuyvjE/sMRgoXvUr3N7/Q/ycyJC3AXbrgffR4BxaPS5q3vfDlIP7
	duvi65+qiy3dBbJSplhTpzwM77O0lRTz6044OyFlloQ==
X-Received: by 2002:a17:903:2c06:b0:297:fc22:3a9f with SMTP id d9443c01a7336-29b6bf19f1dmr24090585ad.38.1763719647831;
        Fri, 21 Nov 2025 02:07:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVecqhY0KyIOS0VJbGRckurUMgBDF0SzgoQ9N/+mxRQVhMYHtAiPWpWP+ignhE3DJhCxCfNA==
X-Received: by 2002:a17:903:2c06:b0:297:fc22:3a9f with SMTP id d9443c01a7336-29b6bf19f1dmr24090275ad.38.1763719647429;
        Fri, 21 Nov 2025 02:07:27 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25c20dsm52665545ad.59.2025.11.21.02.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 02:07:27 -0800 (PST)
Message-ID: <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:37:21 +0530
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
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
 <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NyBTYWx0ZWRfX8hJUfKyGB7zR
 aYw205HwqGnYFm1Q0LtqcLFEjRmuLVH3ZG1QDyo+ntaXMjCe5wE+sKSzw18C4sJ6lKW0VuV9Mg+
 2rSkXBqyf4dR4zc3/3m+C3OlW6xA4/qw0e412XHLZQCkPEHT2Q3aj8nZ2ezATSpUU7S+KiYjIge
 SPjvI2wzHT1qLrofoDy40XqXERNwE3LWLE0zUt1RzY2XoenTydCyAnpTkc+jXgd/of0KHyVsn2/
 U/qNiUlNRje6XRCpw3Qjo/8jyFOA/HLJ1HdtBioTDP9cchGv3ooJjiMnbIE7s7aEtW18XXaIWFe
 AvxhIqKubLKYM9zlexjrXQ/lqprHZoI89mcmyYRCFgGA9zmrccurWVOlgdK1X9flOt+FhgeNr2R
 /cNmBmCbQTqSB0MFukhIFUH1w6VhRA==
X-Authority-Analysis: v=2.4 cv=Vpwuwu2n c=1 sm=1 tr=0 ts=692039e0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cdpHMJko8vg9vcfRfWEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: v4_lMvA1RRqjHgnRWI9DBQLo147WDHN7
X-Proofpoint-GUID: v4_lMvA1RRqjHgnRWI9DBQLo147WDHN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210077



On 11/12/2025 1:25 AM, Bjorn Andersson wrote:
> On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
>> QUP devices are currently marked with opp-shared in their OPP table,
>> causing the kernel to treat them as part of a shared OPP domain. This
>> leads to the qcom_geni_serial driver failing to probe with error
>> -EBUSY (-16).
>>
>> Remove the opp-shared property to ensure the OPP framework treats the
>> QUP OPP table as device-specific, allowing the serial driver to probe
>> successfully
>>
>> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
> 
> This was merged 11 months ago, and Yu Zhang added bluetooth support 3
> months ago. What changed to break the QUP users? I think it's reasonable
> to use this "Fixes", but we should document - at least on the mailing
> list, where the regression happened.
> 
> Regards,
> Bjorn

I’ve checked the older Linux versions and found that this issue started occurring after the following change:
https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/

> 
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index eb6f69be4a82..ed89d2d509d5 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
>>  
>>  	qup_opp_table: opp-table-qup {
>>  		compatible = "operating-points-v2";
>> -		opp-shared;
>>  
>>  		opp-75000000 {
>>  			opp-hz = /bits/ 64 <75000000>;
>> -- 
>> 2.34.1
>>

