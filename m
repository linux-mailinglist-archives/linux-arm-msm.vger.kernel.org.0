Return-Path: <linux-arm-msm+bounces-88489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1988D1151A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCEF33008F00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E60342C9A;
	Mon, 12 Jan 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YP3mjYFb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjEzZxwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC83446A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207661; cv=none; b=KSiXoB+cWCHO3/Osr0NBT/dn044kscOZTslnu5gYwQZzYEXDxB3uty0+hiMGRF5/y4Yf7Edx+PK07Jf1mQZiWFMsFwD4IJdnI7uQ5E569MTtcwGBZGH9llRwqxp0VSvOjEkO6myZHCIZSi/P+1hR8r0RRfEjcIxfGj0nZkerO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207661; c=relaxed/simple;
	bh=mdfZDExi3766mMWEZXVmItP78Ha0Pit9tQT+1Lb7zeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJeJaUACMbfJhxHImyhSBV+sJcQW1KS9fKLzB/8nBFATG1eFYs+EqKb2/LSMjHYOYWA/3ICNZEnDulEHyQFqsfqogZUN9h2ShSzWJnH7oDpq7AWXAjWF1o/N5W47R+bgDI7oJpMzN57FlKHV/+s9nn09GuatwxL42eb7ArRGOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YP3mjYFb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjEzZxwu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C820uE141546
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0M9Pe9DoO0IXD+DjDQ2KLBugxF3PBcSogrV/YVUfujA=; b=YP3mjYFbYe6mFoAe
	7d03yFuX9BCBbBVdAzLmLda/jkIalX0BCz1+tvA/a0B5/cHGobLotl64HW0m9DJZ
	jOK/GFfmOPTpGkR9N53lyY1y3VO/ihvs5MtuDlP22kHGR8+BCHrkvVkLN4JC065R
	RJ7yj3Wp+7x7U6RZZ/AxFLzi1sInlcTdq1puOP81sDs0XkPFQBF7duJbN+o3ivf6
	dyAuvPA7GSa0p6ZowQ3p/MoUXN97c5tZhMrHJ7VhPdislSa6xA7meyp+kxl51Nu9
	tU+eTONR4KHYsD8t3IcXkG6ZtVTvMAEYccD+ZW+rHCKdy/6OAp4dIRwMvIT2qNRt
	0LJpTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyt9tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:47:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so4645054a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768207658; x=1768812458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M9Pe9DoO0IXD+DjDQ2KLBugxF3PBcSogrV/YVUfujA=;
        b=EjEzZxwutgk2gIP6BBh/eqMcpGpGK2U0m+BGoIBc4qKsN24m16gAFk9G+djrL7byry
         Ob0xOyiZB+Oy7zIzwkqsZL2qqGAxNgmrYY3cprKxR/EjgjZSyAmQoBWM7XlYq1erYiaN
         GbUqvpx704qI8J3OysXFZo9Y4HmK12hfKGQW7HLPAoZe81JJSoqH0uJ6upGdlg4gv4Mm
         ZMSopG7gfyVEJCv6lrglQJfCV4r2fgIiaLH4YlcKZMntlHGWYFEfSljCl2DcEosMDs1B
         CQq6xERcUxnbZfm/dIVRWMdxSf07e5sz8SDoH3FOthcokR7CdZ6kPC4lb05LWbH9z1aJ
         E6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207658; x=1768812458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M9Pe9DoO0IXD+DjDQ2KLBugxF3PBcSogrV/YVUfujA=;
        b=sTlTVyupfY6FeALlJqtB94vMSIjJVnDgH4D0gtUUe1EXtnGzjYDc5uFz8dUmyMaQnZ
         Qpa+3smR+HvlmWheA8boxjh/rtx8OXdj7uUBc/dGdpkCowoFIgKfjCEGcmg2j9a7HfVQ
         cqO59qfLMniDPzwPCn3fN3ozRnTGVQfNLEnGUzI+JAuZfg8iq3TC1pIb/q46RiyJIoDz
         OVa6NOtnsd6RhNTVqF1AduxYJgQkX6ZAyB8WXlrfhwyLj97g+fB7ce6aMz9yatppiD1B
         6Pgnu6iBNy+pQfONxtNajE1T/eKsDVvYcdRcwwaX2jZkXQ23Np1oqECs/LXnDxKAO2Qv
         +GUA==
X-Forwarded-Encrypted: i=1; AJvYcCUb/JF9b7HMe7okn2+NkgqVmTmmsSHBA0uJoA5CIdi4+5M20+e8KyiiWkLmL4+JtNz3+U4FN0LWlunBk46J@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqc7AQGXpVrsAhyvfbVYU3rWG/RczXxqbvwlrQTgl73QetKaB
	Oh78pPgiHarhj0LECobRrbNDjhurvlE4W0Fv8rfX3CjmgUhxocBg5xfGUnUoNvTN/ShAz087Jp9
	aFothzCDe+vH+cmktml68C0bgmIMWvOiDjDFZlk0SGqn7dzPLheO6tw1T73q9JPGLkGsT
X-Gm-Gg: AY/fxX47/7KN7QJ5oNkldRXYo2PF5LVimDJu68iI1G0E0GBVrZx+0o30xpWgDx5Y8KD
	N9rS2rqP2OV73njlMkGXoOqxVN+TmijBMGmtEcGZ6wDTNTLRaOmfLylzxde+FVg4Dh43Yrn/TSW
	G+/mRrgPD8xIFyfF7icmtUOsS/Ukdf/qc70kB3PUTgQ8q50wYObOCLEq2KE9+mxUzLKEFAgOxhP
	F5CcxuyI5WdmWe9azCaiLZ4ObHQ1rZ36NAg659T0hKZLp2Gr6Nib9grWVxi3bHg1GSliHjUdYWy
	h3SB181nyBiP2VdmSEvObD7kfaQFUmKDLzXeOlD4WK1jFtCaSaU3q+NUbQzb7Uw+uQOFr5fZpka
	u+e/bMJfxf+Aqr4esU7Sz4SzhHDqkEACs7FJl4xdBCQ==
X-Received: by 2002:a05:6a21:6d89:b0:37e:8eab:c05f with SMTP id adf61e73a8af0-3898f9e43d8mr17501827637.59.1768207657573;
        Mon, 12 Jan 2026 00:47:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx0JXNd/sdIU8fX4xkB5Wqtpx1qJuakfOkz7xFVHpceKym2cVnYfqat9y1NQQgyCehuo0l4Q==
X-Received: by 2002:a05:6a21:6d89:b0:37e:8eab:c05f with SMTP id adf61e73a8af0-3898f9e43d8mr17501807637.59.1768207657056;
        Mon, 12 Jan 2026 00:47:37 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b2edsm16884075a12.32.2026.01.12.00.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 00:47:36 -0800 (PST)
Message-ID: <073c34fa-4c19-4905-851d-727722bbf8c2@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 14:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: talos: Drop opp-shared from QUP OPP
 table
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@linaro.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20251111170350.525832-1-viken.dadhaniya@oss.qualcomm.com>
 <ivinuu2ofm2hf7jvnw67gjfwo46bepunconf5g4kzdcaxs4jvm@6dm5btokf2zi>
 <efec8f09-8bb7-9739-5a1f-ce4a1c54771e@oss.qualcomm.com>
 <nm4hiy6vd5b3t65dagjx5m5qjfjdcnehz2s5w4lyu44eaqnwkc@hnmyhokxufz5>
 <13ea5fd7-b28b-b6c0-752f-a7d4b4677298@oss.qualcomm.com>
 <e5cef414-912e-4387-9a47-494567fe2360@oss.qualcomm.com>
 <vmrpdu7fn776vkwrhwvtuwkpsxaco4gt4worl43mpvk73ft67a@cbkg6gmqss5x>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <vmrpdu7fn776vkwrhwvtuwkpsxaco4gt4worl43mpvk73ft67a@cbkg6gmqss5x>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iOq8J0x-SDHw7LvFDARq9og4V45mUq-N
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964b52a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mCbzp4guXirYtTQ2do4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: iOq8J0x-SDHw7LvFDARq9og4V45mUq-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2OCBTYWx0ZWRfX7AhTRXeJUCn6
 Cgxd1hF953pgnBS8fdtnE3O/VimCbSm65a1Q3kgcfeQc+gp5P3nEOk4szoFJnrqh/R7Gee1WTLW
 a/C0wxa73V3DH+DhJ99ICTTmlsg0Uvnp7Kj0gL6/3D41E1RiPN9sDlHzoPs6lD4IqBZ/lcQxRoJ
 C67CepuKWJCB0ZplfRnrb4G9y9Dmm9VGLMAzn6QIvEK2yV49OoipN130sQ4zviisJSw/e5mmpRS
 oMutEcAnfXN8NpSmWp3cSySIJjoDiLzbik06W0K5xIZp0VlVXVFbZLw64NcMJNf/ilPm3aetC5Y
 Tel0rtpoHa4CYS58Xmm4sh81phgAOz6e/0AtkRFWQuUBR+zAb2eLbXDsY5X/Ln9fOFy2Xj90pq+
 ht6YggFsjIHSfbZK4qM9mBwsE1kE6BZxMmQjDmoxdN3F3mUdcjAott/L3mggUCdURaYA6iuidHr
 bH1QRzLXx7ezgNLZAYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120068



On 1/10/2026 1:10 AM, Bjorn Andersson wrote:
> On Wed, Dec 17, 2025 at 09:20:09PM +0530, Viken Dadhaniya wrote:
>> Hi Bjorn and Dmitry,
>>
>> On 11/24/2025 3:10 PM, Viken Dadhaniya wrote:
>>>
>>>
>>> On 11/21/2025 5:33 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Nov 21, 2025 at 03:37:21PM +0530, Viken Dadhaniya wrote:
>>>>>
>>>>>
>>>>> On 11/12/2025 1:25 AM, Bjorn Andersson wrote:
>>>>>> On Tue, Nov 11, 2025 at 10:33:50PM +0530, Viken Dadhaniya wrote:
>>>>>>> QUP devices are currently marked with opp-shared in their OPP table,
>>>>>>> causing the kernel to treat them as part of a shared OPP domain. This
>>>>>>> leads to the qcom_geni_serial driver failing to probe with error
>>>>>>> -EBUSY (-16).
>>>>>>>
>>>>>>> Remove the opp-shared property to ensure the OPP framework treats the
>>>>>>> QUP OPP table as device-specific, allowing the serial driver to probe
>>>>>>> successfully
>>>>>>>
>>>>>>> Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
>>>>>>
>>>>>> This was merged 11 months ago, and Yu Zhang added bluetooth support 3
>>>>>> months ago. What changed to break the QUP users? I think it's reasonable
>>>>>> to use this "Fixes", but we should document - at least on the mailing
>>>>>> list, where the regression happened.
>>>>>>
>>>>>> Regards,
>>>>>> Bjorn
>>>>>
>>>>> I’ve checked the older Linux versions and found that this issue started occurring after the following change:
>>>>> https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/
>>>>
>>>> Hmm, but it's your patch. How was it tested?
>>>
>>> For this patch, I had verified only the I²C instance and compared it against other SoCs (like sc7280.dtsi). But missed to validate all other instances from  SPI/Serial.
>>> I realized now and will make sure to test all possible nodes in future changes to avoid such gap.
>>>
>>
>> I hope the above information addresses your question. 
>> The current change has been validated for the SPI, Serial, and I2C drivers,
>> and it is functioning as expected.
> 
> I'm sorry, but above you write "verified only I2C ... But missed to
> validate all other instances" and here you write "validated SPI, Serial,
> and I2C drivers".
> 
> Did you test it or not?
> 
> Or are you saying that you only tested I2C, but have now verified also
> SPI and Serial?
> 
> Regards,
> Bjorn

Hi Bjorn,

Seems there is some confusion, let me clarify:

For the earlier patch which caused regression:
https://lore.kernel.org/linux-devicetree/20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com/
I had verified the I²C protocol only and compared it against other SoCs
(such as sc7280.dtsi). Unfortunately, I missed validating the SPI and
Serial instances at that time. I acknowledge this gap and will ensure
comprehensive testing across all relevant nodes in future changes.

For the current patch providing the solution for above issue:
https://lore.kernel.org/all/vmrpdu7fn776vkwrhwvtuwkpsxaco4gt4worl43mpvk73ft67a@cbkg6gmqss5x/
I have validated the SPI, Serial, and I²C drivers, and they are
functioning as expected.

Hope it clarifies, Please let me know if there is anything else needed
from my side.

Regards,
Viken

> 
>> Please let us know if you have any further queries.
>>
>>>>
>>>>>
>>>>>>
>>>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 1 -
>>>>>>>  1 file changed, 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>>>>> index eb6f69be4a82..ed89d2d509d5 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>>>>> @@ -536,7 +536,6 @@ cdsp_smp2p_in: slave-kernel {
>>>>>>>  
>>>>>>>  	qup_opp_table: opp-table-qup {
>>>>>>>  		compatible = "operating-points-v2";
>>>>>>> -		opp-shared;
>>>>>>>  
>>>>>>>  		opp-75000000 {
>>>>>>>  			opp-hz = /bits/ 64 <75000000>;
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>
>>>>

