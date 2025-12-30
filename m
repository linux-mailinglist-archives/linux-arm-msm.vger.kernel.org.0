Return-Path: <linux-arm-msm+bounces-86933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A138BCE9208
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 10:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B92353025A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 09:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DE726561D;
	Tue, 30 Dec 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuHBd3YA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfJjIM7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB1262FEC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085398; cv=none; b=Djsdd9KdVC5a3rlaMCgeg7DhurN9fbRp8JD/4DtzwOBQBj1SZSbLqT/8a5cEKAc2+VmW63MTCaiDmnkpAtZpQlDezQm6kkCxhKRuPdCnzmrtEkSfOp0egbrgt2SEEzg/UQVB2qwadPg/6s5j9z+NcQJ+ej5Rcis9LLHmziKjlOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085398; c=relaxed/simple;
	bh=4GBCj0hU48S2+i+MhfdDptBgFyH3UUTZ8+HpufexFM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKbQmkMquXpd5JJL0iDHaH56tplnZIdESnJOvP0rIAREDwyzo8cbXn66Ihwe/kN7e05p9QLic0eBodKe3uNZ02u7tlWEvnVuxRx7onqDznxd99DMD4Ekp7SJopG6Z/aN/a2mjNozJesP19Twgujep2rxtYev6cB47KObkZWw7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuHBd3YA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfJjIM7s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3jW3U3555705
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZ1ZUU929l28kU0e3CGefBDE6aEb96VXDtF+iVlBDlo=; b=GuHBd3YA/Jvc5Qp/
	hq/XuTVq0m0wQkwKecnV2wxcu3KmErUz1T1cqUUabjQ2dHM4MnWfxi1KW7BHNRE2
	37YQ/Kw9YEXKErrcXTSgktOMNhPaMW7RLv15yt4K0EihUGDokK7K7/DKHDXmnlxf
	XsKqidtNeGj7fWGPwCCiMfr9wx5gzfEbWIF5RTX4Og3/WoRE6WjHH7NaVLeOyWin
	0umS0myHLkf8G9HYhcqMMRiwHO6aCq2MrsB2yF9e+eJFfT1hDXdiQQ7Fy5bW73wz
	y0U7Jd+2vexuI9zyaNmanlh149ZkhRQ0hqbfVNIdmGj08cVWtIcCMz5TmddRWRId
	EV8bEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7460nq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:03:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c1d27c65670so4964564a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767085394; x=1767690194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZ1ZUU929l28kU0e3CGefBDE6aEb96VXDtF+iVlBDlo=;
        b=XfJjIM7sPOK2gxDKfyrDr6W9w9BlvsIfvwm6WsOZ675qluoGgjD6Ws8I1Cs7tUEQlB
         df2or3yeZQIdHz2KlZ5WXo8FqYREGQ5q0FGOHnYmoFJBQWsKgc6ZxHroAHCf6znNCw09
         oaZAhlbOJvaQmilyzdmnDYM644+HgVdrhwWmsQdEcQHQUKs534bV5urOJV5gOvHKh57B
         oJ2W9hAC6DqgDSkTPhA9EdsJM5gQo8RbvPbjKAFWdl65H9pzGUjBpKO31kEFDJ7wiPlp
         Uta0IIk1f++jnPRdMfcUt6X1X/evzCl+WcD4pifV34KeGl4RAMG9NZQ5tgNhgLuFDnGZ
         5Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767085394; x=1767690194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZ1ZUU929l28kU0e3CGefBDE6aEb96VXDtF+iVlBDlo=;
        b=c7L5p8Ji9Ek1nTDVkpU+P+YIaNSSy4RflO1r2xX38xNvdhuHKoR0S8PUweGo+DFar6
         Ej0bmaTpLuWZDFkPrh6VX9AwDwGiYd0wOmfyJ352fAhKkXIBVvT7JeBUEjxhApCB9GGB
         k08J1HlUpirOsolCjPuRdY7QQUv3r5w3st0+K5mbRFtCDNdzrV8XUj/ghdto9Pz1JVd6
         /sng3jeuA7u5SAb1+qi+RamY9TeV4bTXHQowEwF2flFMUlhZqfx7bZdaO9kRHmG95VYb
         6B3djbXwDAUSSX+iRP+oHG+/bAiO29DeM+B0lE/gg0cId9HLSDs6/1DLJLon1mf+FsDe
         BlTg==
X-Gm-Message-State: AOJu0YxuCc+VRi4EHzAuML2YC6ulwZs9/ujbXJwO6QUG4Rk6piziQ8yF
	xnRBkc7Elrb8145eRqouArxpVO6c+k2xOvcd/v94Ma84vzz3HXSKEv0G15EkKgjlYG6rMAItbZT
	2d/kLGf9txXhVgGSFcfaTjg6AUbyzKCM8BVs4MQzcUeJW+W9QQZE7MBPFPrNUsHnvO83q
X-Gm-Gg: AY/fxX5gZYJ71L0BpCoyPIggcJaZlxB8FHSHdf5/ePWKkLPoM2h+vn1lQcLl4PED+WU
	mqUctK0GkAcRt//7suajKcctUXFCDNmFUjW3YRAtGUp5O6vSBUrdmNPL7wFQI49b6M+JygDZQ7/
	k9/EKeN9CPtCJTVgkMgCBhe6j6kGEu/6HRhKvSaVJlWsiGJ+nnsiT14S0eClZ/3Vn21Y7dPPRKh
	IFeWq9aSsLqbVE0mFWnSErXEFDVsd22Z/V1MnsSor9HuYgcrWqYQ4oz/nwjyi9G0FjG2i2XzUC8
	0OMKWUqil70llqzsFPUdaaid7Cx/HSCLzFcbkDD9VjbJCsLB7oR1lImBXWJGQYhauSGnVA2ieYf
	JLlDIhg2MHnTvMQwi2NOrUw9rcXfEpiUDgWkBiMngzhPOG5tsISs=
X-Received: by 2002:a05:6a20:1588:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-3769ff1a89amr34483854637.35.1767085394493;
        Tue, 30 Dec 2025 01:03:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbAGF2db+VKOhlDQMrg8j2Qk0RrNBOlo/z6NG5BVl4tukVcG15xd/QngN7ITvfdf94rAAulg==
X-Received: by 2002:a05:6a20:1588:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-3769ff1a89amr34483814637.35.1767085393974;
        Tue, 30 Dec 2025 01:03:13 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm27338846a12.2.2025.12.30.01.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 01:03:13 -0800 (PST)
Message-ID: <28751331-d298-4cd6-b98a-c125e3f75eda@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:33:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for hamoa
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com, andersson@kernel.org,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-4-pradeep.pragallapati@oss.qualcomm.com>
 <986facd7-92e7-4d29-a196-d49cd9f3d35f@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <986facd7-92e7-4d29-a196-d49cd9f3d35f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=69539553 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XVHmVgbNHDG9-czVeNYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: c0ONBZZoDQ791yJYXtV-aSgvGhc2d4dV
X-Proofpoint-ORIG-GUID: c0ONBZZoDQ791yJYXtV-aSgvGhc2d4dV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4MCBTYWx0ZWRfX3C61p7JW8j8o
 +Q0G122kROBCXiPwyVrkaNIF7rsOhzDXEu14ljVaXlttRNCQoz94dugpTCmuOsbrOmKiX8L2JRr
 CbkubChBM/ZVtF0Y6gxnuIg6oHqwF8pIRV+JFDeaG5PAj/nRkqROmDQJpfuTk6cvuEo3ZFcMWeK
 saFFhIrlJoGxx+Gx3h4KZ3bltWNrnOAFBSShzr74hhEY0I2jf7zVXShIrYJFqd+P1b8jrqdZSGP
 +ZIl3n/J4GkOyYsXhSOa1dKa3qpZqIHztunKYh5AegP8bIGxv4QVHP/8CIZXv2ljUk1RyijhAdD
 YeMv3GGAgy5WGIQzzEewOQLGMC/8EjuNpjIm9uTh6P1md2gBKu7fAI70LI4Pjs5NUhGhfryn654
 XfWpCrRCiBXaqFgFQ/F0u16MB8ERITGGLBFm9IieGf3aFknM/v2U3KMA0oPlwkWU0m4BVox/drL
 AqmTs4GBQXTX7drzl1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300080


On 12/29/2025 5:45 PM, Konrad Dybcio wrote:
> On 12/29/25 7:06 AM, Pradeep P V K wrote:
>> Add UFS host controller and PHY nodes for hamoa SoC.
>>
>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 119 +++++++++++++++++++++++++++-
>>   1 file changed, 118 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index bb7c14d473c9..340b907657be 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -834,7 +834,10 @@ gcc: clock-controller@100000 {
>>   				 <0>,
>>   				 <0>,
>>   				 <0>,
>> -				 <0>;
>> +				 <0>,
>> +				 <&ufs_mem_phy 0>,
>> +				 <&ufs_mem_phy 1>,
>> +				 <&ufs_mem_phy 2>;
> This patch cannot be applied as-is (needs GCC bindings changes first)
> which you didn't mention in the cover letter.
>
> If it were picked up, we'd get DTB valdation errors.
ok, i will mention the link to GCC postings in my cover letter in my 
next patchset.
>
>>   
>>   			power-domains = <&rpmhpd RPMHPD_CX>;
>>   			#clock-cells = <1>;
>> @@ -3845,6 +3848,120 @@ pcie4_phy: phy@1c0e000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,hamoa-qmp-ufs-phy", "qcom,sm8550-qmp-ufs-phy";
>> +			reg = <0x0 0x1d80000 0x0 0x2000>;
> Please pad the address part to 8 hex digits, so 0x1d80000 -> 0x01d80000
>
> [...]
ack. i will update in my next patchset.
>
>> +		ufs_mem_hc: ufs@1d84000 {
>> +			compatible = "qcom,hamoa-ufshc", "qcom,sm8550-ufshc", "qcom,ufshc",
>> +				     "jedec,ufs-2.0";
> 1 a line would be neater, perhaps in the node above too
sure, will update in my next patchset.
>
>> +			reg = <0x0 0x1d84000 0x0 0x3000>;
> Similar case as before
ack. will update in my next patchset.
>
> lgtm otherwise
>
> Konrad

