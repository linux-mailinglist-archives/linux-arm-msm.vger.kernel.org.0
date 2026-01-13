Return-Path: <linux-arm-msm+bounces-88771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE4D189F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 13:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B0A43008F5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3852550A3;
	Tue, 13 Jan 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN7FU3I1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAwdqUL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30DD2BD58A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305856; cv=none; b=ahTQIL99nvJUttklntGzaTvze0C9wdDPfgUIu+j9YBvy14MDPwrE7Q0Xj8gCdQcP6Xr3Zs08lCEP2VNli63I/IaoYEdHDrFgMq8URkxsUfBmUxW2sey5kK7Y/AwxaGZcMhm1+FhPt2Qr+9k/Iv7I1bKeJDeKsFzwLDjqVDPEwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305856; c=relaxed/simple;
	bh=u0LHbr96Im1xKjg/l6OPboVopd5vh24wdcfcDpP3m3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rik3BI92fxD7NuemdrY5WB1UXsEv/SOgiWxpK4aLb7gwEclMdbvtGX9SnRmmE5uBRzKvOpRgLSyF/Axy33KPkgFSrzNgVSprrgwwbtxubfb3l8PrgyMfHZMmxv39pY0j0rlajBKkduxdN3AduafAvvpPoK3eCrYodzQAbihVatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN7FU3I1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAwdqUL0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7aQ1j3299726
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VcmMnt+eYBgVcRUEQkb8qZd/4EenM2rNfE26cm16Dco=; b=EN7FU3I1eF6JOpqT
	a9/U2WKqup5B785ldg31BA9OcrMh8I8qbVugJL+AjKhKrkBmjKWcpEi6ObmsL6kt
	XXzbgPUBwJTMWWgFZbFm/r8vj+xqGL6zKUwUAYAioRkSPYog1l00D+47IKi58br2
	jRZcwxu7O6di8eTWtMSk8LbtSdmMQJeolcLrK32dgieJZIUUSC/gYaVFr7F6aPuL
	VMZxddRwn4lvIf8eMaU0NnyQki9dgOuI79lfwssiUD9lB6gLzDpM9munSBa47C+6
	o0IJRi5ZPaQZmAMIBIGELfvYkZFG3sIfv9BX8hhC0kIQCx7VItbMQDi8JGL/NURO
	l8v/rw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jmap94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:04:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f27176aa7so110863185ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 04:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768305852; x=1768910652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VcmMnt+eYBgVcRUEQkb8qZd/4EenM2rNfE26cm16Dco=;
        b=WAwdqUL0xKWW4nCv4RihhJUKzs6fMw8MoKJT+G4hLUVR1FFYMUbi3po98eaEe7VzVj
         uCyRzaeDmsPdXvvG1WCV7dHt6Khkb4GyURtZxTvisYXXrfUHPzxEGK+G48oDjWflnEZn
         sibyfeE9QKxYq12U/V8MthjHmm10nylqr6MD163GBuq60P1Urv1brn3UcBPejBRx8BcL
         +avelGOevo2vNku1Hl0mhDawnCC37fC3lZo7rKalNioNx8QOtlkEIKqiYzhbysRpGWDv
         Nfp32xI4F2cRtzjnJiVpiuA4Lob0NwI7q+5kJatPlWCrX+3UHYBWb0kSrOP9Chuip11F
         TVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768305852; x=1768910652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcmMnt+eYBgVcRUEQkb8qZd/4EenM2rNfE26cm16Dco=;
        b=nvAXQQRxSexUgnYmaFWF5a4VPv6dYhtcvU80LVcqsYqfDpJhFeFSciazzg1VQeg26L
         FUb1e2TwvoW/e9BBblRLg2VNz5A705sIlNOXlkgE5b66Sz3X68xACkdPjsBKQnABfWyL
         herPcg/5FTZUmFaXrAEPR//wVXn1WsKid4KKRoxyyVZ5e/WSLxD3WmVUzY39DGdn4TIS
         EANkC1Qq/6GK9UgyXbTmmNB1i/sV8AC6qMo3/Ex96ze4RjNiSOnNo5MR8Wvtk7N1PCgI
         4ABFVDk5QDIg+Eree5To9byG8ROok5Pxvnb6mcYDliX7+2ODbt2o2XlcYNAQEjeGh+1e
         Of6Q==
X-Gm-Message-State: AOJu0YykPuX7z3enNjsMzPND4XyKh6Pp7pBu3QSeEBTHMfhm2zM3yLW9
	FUbeeYJumOJYPgt/ORiX6EeDbNOl3yUlkssbNB5sedDHK38yLtZAwCvgoG9067XfSqKOwrgKtpU
	7SvPcMd/CydMUtQJ8cNnz0liGpBNEO2vJg6wDDVvtOJhSeU6dTpllje7P7lLjkZZosL5E
X-Gm-Gg: AY/fxX6cON1dZSxhit1tWsFElCHr6e/FbWJsOzGkugN+fmsAxSr0u4YuF9nEuKRkJDU
	m8yyBlXuoVlJBEWiU8o/A5KHIWa1QMvP4QffBVgjUJ61p44ZKrtnuksozxvDEt1da899uW2xISP
	JyEhwnjgIstKlEyPShdsM0YqLnojAQvgmhGYT/fAWL9Oif6TtQX2APbvGZQhLCQ5SlVRaFdLF74
	tp0PhaNUvHvs0sV3RAbdglPLgzklkKulRWUAhd9Bf3iVJTJvCY95t9HHqXa1exTjUk3AqH04AfR
	E10sKNBQ8l/MBHEeu8MSi8dI8bRYhHR2Z+h9dEsJcL86KeH01YpyrYD8UeOHr+ToMDKi+O3ZkAl
	s5UasCyJfTxhwToaXH3ubppNuyEROP6dJK5ouhHktS04G2ssVgUTDvT6OTuB5w6uucoruntCgRK
	7/o8NtsQ==
X-Received: by 2002:a17:903:19e5:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a3ee499fcemr238848795ad.40.1768305852288;
        Tue, 13 Jan 2026 04:04:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOKHkkTYijDA8LJDFEJiM966U0VHBw/LGQNMVWYuHoRTdB0Lt/6IuWsncLYxi/++H/OvPzXA==
X-Received: by 2002:a17:903:19e5:b0:290:c516:8c53 with SMTP id d9443c01a7336-2a3ee499fcemr238848405ad.40.1768305851767;
        Tue, 13 Jan 2026 04:04:11 -0800 (PST)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2eabsm196503655ad.49.2026.01.13.04.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 04:04:11 -0800 (PST)
Message-ID: <33d57a53-93b4-4ea3-a7bb-0b2015501bad@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 20:04:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
 <5187dc04-a1a1-4537-9c80-aaa100dd0033@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5187dc04-a1a1-4537-9c80-aaa100dd0033@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xd2mxWJa9E8aePmr-hb9txkpIBAb0mRs
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=696634bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFr0J8JOlEBcSWnzc18A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Xd2mxWJa9E8aePmr-hb9txkpIBAb0mRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwMiBTYWx0ZWRfXx+lmUKUvYLOA
 GH+dQoa3cwdx8LCQpFYyDzkFK7NS8yP8dIARuXAXK1SAN+ZSZeQjke0OCP78j9WBlCzUybv2ErX
 dpx4Ijp/zf5TYcAW8uo2n8/78whm444b9qKkERLFEZdWiOCx7kekHuGq4wjTw5h0bzR8xXGFeOz
 Zp3D0ky3/hz0QA0GaPOnpXkk5kl0Xxl6AabE9Q4qw+hVkIh1hyTKqXMZ2J/zizoxUNPzY+dY5Hj
 OAxAPU/543z6APYFF1YKhhF22Qb+pUYZD0aLQmQh6CZ/yATZNZoijgq1DO3kRKHMBArNuJAfBK5
 diHrhIchHnlPSk0autdj/4jKP8n4J8avcUfmZt2lCe/z4+5Yns2ZJHGtJXhjlgvDXznCP6Z0ZqW
 FZN2jtZZCS3u6MJYaqiZMtvMA9wfV/wbtvV3B+U9N8ZzuiTc2aXcMqngU8/ZMZr0Gj1EpRoa7DW
 G/cRS6SKJKC+p/Qj/vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130102



On 1/9/2026 5:58 PM, Konrad Dybcio wrote:
> On 1/9/26 9:30 AM, Yongxing Mou wrote:
>> Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
>> mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
>> to the appropriate DP-mode values.
>>
>> Additionally, the HPG specifies that the LDO value should be set to 0 when
>> in DP mode. These misconfigurations can lead to link training failures on
>> certain dongles.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 13feab99feec..5b0d774bd715 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -122,6 +122,13 @@ static const u8 dp_swing_hbr_rbr[4][4] = {
>>   	{ 0x1f, 0xff, 0xff, 0xff }
>>   };
>>   
>> +static const u8 dp_swing_hbr_rbr_v1[4][4] = {
>> +	{ 0x07, 0x0f, 0x16, 0x1f },
>> +	{ 0x11, 0x1e, 0x1f, 0xff },
>> +	{ 0x16, 0x1f, 0xff, 0xff },
>> +	{ 0x1f, 0xff, 0xff, 0xff }
>> +};
> 
> For these platforms, I see 4 tables of settings:
> 
> (Low/High) Swing/Pre-em for (Low/High) HBR
> 
> None of them exactly match your change
> 
Emm, this table is in LeMans eDP HPG, here are 6 tables. 4 of them use 
for eDP mode and reset 2 tables used for DP mode. If my understanding is 
incorrect, please correct me. Thanks ~~~ > [...]
> 
>> -	ldo_config = edp->is_edp ? 0x0 : 0x1;
>> +	ldo_config = !edp->is_edp ? 0x0 : 0x1;
> 
> You'll notice that this is further wrong, because for eDP, it should be
> 0x81 at low-swing-high-HBR and 0xc1 at low-swing-low-HBR, and 0 at both
> cases of high-swing
> 
> Please split the LDO change into a separate commit because it touches
> more platforms
> 
> Konrad
> 

Yes, you are right, here seems something not correct. i will separate 
this change into single one.Here are some parts I don't fully understand 
here. Could you please point it? How do we know whether it is in 
low‑swing or high‑swing. I didn’t see any logic in the current code that 
determines this. Also, the value in Hamoa seems not same with LeMans,it 
is 0x51 and 0x91.

While going through the Hamoa HPG, I noticed a potential issue.

  static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
	.aux_cfg = edp_phy_aux_cfg_v4,
	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,...It use 
dp_phy_swing_pre_emph_cfg not edp_phy_swing_pre_emph_cfg, but Hamoa 
really use edp-panel here.. so does this phy cfg correct here?


