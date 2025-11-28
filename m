Return-Path: <linux-arm-msm+bounces-83682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D14C90D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 05:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 04C014E3E74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 04:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51ED2C21E8;
	Fri, 28 Nov 2025 04:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTmlwuLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeEHoqbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB1242D87
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764304951; cv=none; b=RaGFTOzLb6pnSn2RQoOWAedU/1o6I8LowzA4DoTUaLS+a4MDgnPdfanmBD2JLCqgLkrmWWzSOzbwqRVH3quZaPZfnzLB/o4/lPGN8HVaaGcyankDqZ2Pgu4iG06YkPkihFYy9/EXi1/oB0xQZwTChupOLYsUsrLpazxaZcPQwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764304951; c=relaxed/simple;
	bh=8rl0QrU3MlRdwHNYRZG/3TlzxVsvny1fEpzP63WAjJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uA1ykwaoti69rzCUxfjZQV/VHBpO+JLGg0iVFsgg/GHRL45Wtuo07R79Dn3DEU+VpXkaS1Xqr3ZdVsM+c06dly8LUWrNoUloPw3esNGapqkackFS7WX8ClXb2CiroIjRiTMWyEoQaqg9ZiAzb2qM1xFjEqU2wODM6Pk+YYeO1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTmlwuLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeEHoqbl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMuAhq2261833
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB4p3JALjAdaEds41Kpv7aXiJdteIXPc5KCCtJz6euc=; b=kTmlwuLx2TObGY5n
	0ZMAKlUT2p2oyHcbJwK1dw7Q47LvSVVeHmDRls5dyvF7Tqk56hyHwSHGCLf4Vcv7
	wv7uHLpg1Z4WCkYU8IK5auaVIwfe+sJwZP2YU7E74xMKMU0RoMPppSRI4YYyZn2u
	DjZTWE9M/BtcVtDK3mBCQkKKK7Izphr2/FsgFfN0bT0xbJfenxEBVqndivZ458HA
	oebKsN/hxYGyhuW/uQk80YeSjBSmwpT7CiW+EB2VfBxzWiHWlUDyevsaIe8usYhj
	qdqTQzYcyuk0dqCm/UUNFWEDnAXSrl/HulQ4yDboNJh5CZ7ov6GUtZDwvj2RSxWU
	C+sLkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj0bdnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:42:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f3710070so28043525ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 20:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764304948; x=1764909748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XB4p3JALjAdaEds41Kpv7aXiJdteIXPc5KCCtJz6euc=;
        b=LeEHoqbl+uoM6lK2B0M50HLeqA4WzIcDIalqfKavFSbiuBu+8wOSHOiMQWzcl0UHc5
         azCfXUZHutsIPl2GQY+sKbjHS/Y+jllT4j6Y0XuIK3JECJhvZP2C8tPB0Ls/zLs4KyYp
         igfCI/7Pp6vAerYW130EGkXtI2Q85elqJLap1aDzdaArsq5Dej3MIUFlaw6NVE1EqxCm
         8kYA1xyQLMqGSttRLoNiQKhGVPRow7wPs+ado5rms+7/926LKlrq/t2JjpMLzeh8mmwF
         GKenlw2UCVU9vExhStThVUFszQbj5Nqheufzl6HzBHTKEGYA3xzWAoWxdSQAmQ2UhAXN
         xqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764304948; x=1764909748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XB4p3JALjAdaEds41Kpv7aXiJdteIXPc5KCCtJz6euc=;
        b=QtIyyl3jgLZBD05p4EdeLCspAzbM4ItouJgo2RZeUEsi049WgYsIMROJwvhTeR9UaI
         m//Pz0VI5bwA2i650pjV4WS1KN+jTO9xukpV6BcHRWyMerA5qNaM1y2oxsdTWow387/B
         Jc3Mu6cfIKOLUSXGIF/4Ig+m/yMrF38iEZY2cHO0aef3TH4Jc2khSUg6+GmJdghtKR1H
         79FGZmQrIMbjnC+gDXCPpgTyNaeMuRHQG6vnu40dXVE0zOkE9NaB4GTvTri5wLccq/TB
         rfPKbUjRfLEs1wfjRO7CO7fWSEMs3/r7QaKH5NJPnhVABOzcrGjrDeePEcLWoWPJoC7Z
         zDBw==
X-Forwarded-Encrypted: i=1; AJvYcCX/E+eWyo2O9WxXyt4l/JMhN28S/afHe09277CI3Pt/w0yWBK4X9JuHNqQuLy4NxS9iZUaHeh+K7axG96Mw@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZgLkyv+eDEd/UdvAm65fzs4ZwJBZ8bMwCzKi3diBQLdhIpbM
	TsWPq3r6hOK15+L2DpIwniPoCb6pVqtst2FAqzGx83fAv3+fpk4XYJFtT+1EVrW54AhTahHXLrU
	jOhUSSAQHiviA/ayEqxxQdxVC1XQTLWsUnLH3ozoF+B6LTHL1+D2E7gKfe91/HR0D+tzo
X-Gm-Gg: ASbGncvaPBcL4q98hSZy3tgw+ShqqodCn4RxVUhYzyq8+MdVGpS9QITODd9IT9k3mwK
	7VWykFQeXQrxQgDYLIZPX3WRtlQVjPd5e/5qClma8g/hppkKWq/vzx1UnVFQsD31a7Vfedbq7HT
	tyReVTTSLUBB+dChCO/wsRpPgV4FP85D8Q9s1fJz/Fa7LS6JzYs6cycXR21SjYYbqdvBDbbFdwL
	AI4ANQyyvLUNg5D5MHPQ3AwI+sJxSpVGRDH5NFFx5ChObw9aooA25WJJGFjV5/PchN38lmJUgFL
	0hjDD2t7vf/ORLSYSfQ/6oPSJZZGVRfAiun1AW0vCLbUrEnwx+aLOlGZGEPvotA6X8rr0+VLiH8
	KYv+InFXuVj0VFgGrBkE7HNEJUm3luw+pX8zw09Sg4w==
X-Received: by 2002:a17:902:d2cd:b0:298:3892:3279 with SMTP id d9443c01a7336-29b6c40542cmr296229795ad.17.1764304947733;
        Thu, 27 Nov 2025 20:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKoSQAoyWlLvG9Vcnnkn7v1pyhIqUhELgGxaiA4ZAottbIZWLZGceYNfF/YTGLtSDABNSzoQ==
X-Received: by 2002:a17:902:d2cd:b0:298:3892:3279 with SMTP id d9443c01a7336-29b6c40542cmr296229155ad.17.1764304947087;
        Thu, 27 Nov 2025 20:42:27 -0800 (PST)
Received: from [192.168.1.4] ([49.204.106.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb276a7sm31043815ad.48.2025.11.27.20.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 20:42:26 -0800 (PST)
Message-ID: <18c151c7-5c64-48ca-b6a5-3363544f292d@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 10:12:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] soc: qcom: geni-se: Add geni_se_resource_state()
 helper
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-5-praveen.talari@oss.qualcomm.com>
 <bskhxahakxpc74rdoz54eqlplb4obaoleouh4pn6qdy6yjmggw@fojwzct2haxa>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <bskhxahakxpc74rdoz54eqlplb4obaoleouh4pn6qdy6yjmggw@fojwzct2haxa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzMSBTYWx0ZWRfX2M3UNEJwKIzh
 3ljK6Ygh2r120Jl51/lh9Bo6wxjugNNz59WmvUwQflY1XxcrCNYTc5GqQXKWIEfNNuk554D8E8s
 0F5X9OilOukwiZvQX9/h/R01RClUiYVhlqHnliBT+U/k19bVPr8L8VT1ifFLc2jYvzAwNiYiVB1
 VPC61VFocfkQqtV4y+E0fy9zUfXCiMxqPwZ/4s4ZXqBqadaxtOdsrUJN1tYdxVTZn7qorJKTWGk
 VldKIohmsQdVKJ8icZ5OlgZ6fLOPrlwAHi6fZVI9te6xld7jVnqGFqSgXnutvRqoMvaDPKxS675
 DOHeu1FRc1SYof4hkMbYLlt6JL8NGp3ZgeRdCxUchOcgl3ijZB64oKW59zQEQasXSN97zQrjc1h
 c/fjC+gCjTOpWtnYwpcPNzQez5aYDw==
X-Proofpoint-GUID: Cj8oh4UqlJXOJKRmPFEef_KBx-9P3kL5
X-Proofpoint-ORIG-GUID: Cj8oh4UqlJXOJKRmPFEef_KBx-9P3kL5
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=69292834 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=knFCEH6M0+SSkFC620ieTA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1NPS5M18cN_QFYAy7wgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280031

H Bjorn

On 11/26/2025 8:49 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:10AM +0530, Praveen Talari wrote:
>> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
>> activation/deactivation sequences independently, leading to code
>> duplication.
>>
>> Introduce geni_se_resource_state() to control power state of GENI SE
>> resources. This function provides a unified interface that calls either
>> geni_se_resources_activate() to power on resources or
>> geni_se_resources_deactivate() to power off resources based on the
>> power_on parameter.
>>
>> The activate function enables ICC, clocks, and TLMM with proper error
>> handling and cleanup paths. The deactivate function disables resources
>> in reverse order including OPP rate reset, clocks, ICC and TLMM.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 61 ++++++++++++++++++++++++++++++++
>>   include/linux/soc/qcom/geni-se.h |  2 ++
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 726b77650007..7aee7fd2e240 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -1013,6 +1013,67 @@ int geni_icc_disable(struct geni_se *se)
>>   }
>>   EXPORT_SYMBOL_GPL(geni_icc_disable);
>>   
>> +static int geni_se_resources_deactivate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (se->has_opp)
>> +		dev_pm_opp_set_rate(se->dev, 0);
>> +
>> +	ret = geni_se_resources_off(se);
> 
> Why do we end this series with two different APIs for turning (on/) off

Currently, we have resources_off() which only manages clocks and 
pinctrl. I’m leveraging that in the new API.

If you agree, I can migrate the logic from resources_off() into the new 
API and remove resources_off() once support for all protocols is 
implemented.

Code snippet:

static int geni_se_resources_deactivate(struct geni_se *se)
{
         int ret;

         if (has_acpi_companion(se->dev))
                 return 0;

         if (se->has_opp)
                 dev_pm_opp_set_rate(se->dev, 0);

         ret = pinctrl_pm_select_sleep_state(se->dev);
         if (ret)
                 return ret;

         geni_se_clks_off(se);

         if (se->core_clk)
                 clk_disable_unprepare(se->core_clk);

         return geni_icc_disable(se);
}

static int geni_se_resources_activate(struct geni_se *se)
{
         int ret;

         if (has_acpi_companion(se->dev))
                 return 0;

         ret = geni_icc_enable(se);
         if (ret)
                 return ret;

         if (se->core_clk) {
                 ret = clk_prepare_enable(se->core_clk);
                 if (ret)
                         goto out_icc_disable;
         }

         ret = geni_se_clks_on(se);
         if (ret)
                 goto out_clk_disable;

         ret = pinctrl_pm_select_default_state(se->dev);
         if (ret) {
                 geni_se_clks_off(se);
                 goto out_clk_disable;
         }

         return ret;

out_clk_disable:
         if (se->core_clk)
                 clk_disable_unprepare(se->core_clk);
out_icc_disable:
         geni_icc_disable(se);
         return ret;
}

> the GENI resources? Can't there be a single geni_se_resources_"off"()?
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (se->core_clk)
>> +		clk_disable_unprepare(se->core_clk);
>> +
>> +	return geni_icc_disable(se);
>> +}
>> +
>> +static int geni_se_resources_activate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	ret = geni_icc_enable(se);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (se->core_clk) {
>> +		ret = clk_prepare_enable(se->core_clk);
>> +		if (ret)
>> +			goto out_icc_disable;
>> +	}
>> +
>> +	ret = geni_se_resources_on(se);
>> +	if (ret)
>> +		goto out_clk_disable;
>> +
>> +	return 0;
>> +
>> +out_clk_disable:
>> +	if (se->core_clk)
>> +		clk_disable_unprepare(se->core_clk);
>> +out_icc_disable:
>> +	geni_icc_disable(se);
>> +	return ret;
>> +}


>> +
>> +/**
>> + * geni_se_resources_state() - Control power state of GENI SE resources
>> + * @se: Pointer to the geni_se structure
>> + * @power_on: Boolean flag for desired power state (true = on, false = off)
>> + *
>> + * Controls GENI SE resource power state by calling activate or deactivate
>> + * functions based on the power_on parameter.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int geni_se_resources_state(struct geni_se *se, bool power_on)
> 
> It seems the purpose of this "helper function" is to allow replacing
> geni_se_resource_on() with geni_se_resources_state(true) and
> geni_se_resource_off() with geni_se_resources_state(false) in patch 10.
> 
> 
> Naming a function "on", "activate", or "enable" provides a clear
> indication of what will happen when you call the function. Calling a
> function to "set state to true" is not as clear.
> 
> Further, the code paths that needs to have resources turned on should be
> separate from those who signal that those resources can be turned off.
> So there should not be any gain from this function, unless the same
> obfuscation happens further up the stack.
> 
> Just call the activate/deactivate in the respective code path.

Thank you for the inputs.
Sure, will review and update next patch.

Thanks,
Praveen Talari
> 
> Regards,
> Bjorn
> 
>> +{
>> +	return power_on ? geni_se_resources_activate(se) : geni_se_resources_deactivate(se);
>> +}
>> +EXPORT_SYMBOL_GPL(geni_se_resources_state);
>> +
>>   /**
>>    * geni_se_resources_init() - Initialize resources for a GENI SE device.
>>    * @se: Pointer to the geni_se structure representing the GENI SE device.
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index c182dd0f0bde..d1ca13a4e54c 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -541,6 +541,8 @@ int geni_icc_disable(struct geni_se *se);
>>   
>>   int geni_se_resources_init(struct geni_se *se);
>>   
>> +int geni_se_resources_state(struct geni_se *se, bool power_on);
>> +
>>   int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
>>   #endif
>>   #endif
>> -- 
>> 2.34.1
>>

