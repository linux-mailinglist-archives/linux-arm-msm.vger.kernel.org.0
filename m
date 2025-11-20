Return-Path: <linux-arm-msm+bounces-82647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177FC7342C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 4B91530167
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA6530AAC7;
	Thu, 20 Nov 2025 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euxlg/KQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw9fGu7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB02F12A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631732; cv=none; b=Tr6unJpLv1OUQYVchQbkU7IU3trk0RVoM4+ReKwC9yXq7MM/L1bl4Zdkk17icCBHH3ZS7bdntD736OdmN7c7aAtR6aiAB6kRUIVkAvHnvUCJOzYqQHjOlsuiuF9Fgx7RRiWZVhaB1AqucoshvIIhah0j/111fiBZy3taTXm8NNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631732; c=relaxed/simple;
	bh=AAu1QF1nVEbCR8m664mmiKLqlR5foj412zlA2cpkct4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5+OgzhCKQnq6YsLzM32MqE6RElC+1gIeDif/rqmipt3YPbMijmc4gxWHKz4xiJIxZs3jhSMGx+Go9GjGs4cLeoxFSsfDEhQNH1UlvwThwoC+5VQeZIbgQYUMBRKsL2N8/hofFfv1wbXGOq5/lfcPTA/fCU/iDsuMUpVfiJP1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euxlg/KQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw9fGu7l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pi1k4031958
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=; b=euxlg/KQV7qwq9ao
	hSnEp1QgwUXITPyg4MV40UIz1442kR/jN10jYxQlIAbG/8ewSI5izgQqwdPFYTMw
	dwPyU//tMYJRXcf26OWNpgh/lbTOZ52VrdUQWgPxpARTjQp5FLuKhVvIqFPKGOxb
	S0nXUH97NgT4uVKHd/vSe09zXJ6ffH2u1nfSpfKB11aWmDj1NIqFSc+GPmgW/HW2
	pbkcPucEF8+ojJPa8gwfugB01iEPEQxYh3WJi6m9EdfTfjKFA3ceFsEeoywFxCZK
	cnUiRpPOjRO0cJa4TnxXSpmtwAzINhzRWBquXcgryKfENqOmcRwNxKjEbSgrkpB1
	E4watA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fgcws9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:42:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edace8bc76so2030321cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763631728; x=1764236528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=;
        b=Zw9fGu7lg2RNUYAhgdMkDkdCfAfFpLgZIZimYVtklRtihhq8rZeLjRIvv14qOYkR36
         n5R6n29kjUB/SWPvuh7/NsmsWDZ59sOKLG1wm1cGs5Y/27zMfiGGg1WNK8HE+chzAZt7
         vh96UXk/ZacHU/9EK5AOCERd+rfMLRet8Ru7g1u7GxzCXkQJava0dMLqbm59kwpDbWWB
         QVZOzoTeE/YD1Di1v6/Yhjf1iYQacIuqVZK5/og1+A3Sg3GZppXn1cRVIS6kxDMXtBqD
         ZHqiT3EzF0NQpXZb4bw6KwZVKnHm64gUiA2dJkP/c93x4qK2/Ou4PVc9QWcLeYB1yCpV
         U4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631728; x=1764236528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmvv4U22KcCKpsAjuusmY8TxLc3LF2rVDF+VedfD13g=;
        b=iJAnRa8lnUpH8wjIoDPZcpyuAXHe0qKNNxawR0JPQqiIgSPXwNIEFxNlLtCGfhzUw/
         g8KJP4BFcGazm8+sSa8NCCxVHZa6+edxon3y79enz94/XXDPlptHYPTDTts35tqcT0ln
         pNQggD4BbWnpxxTbdxlC5ZEFr1AdmK90Ay0h8GdOJH8AE4Yh5I2CGKCFvb6Gk2jKiK7c
         NAZeFBSOcGr1ndZTBx9uYN83waoxyOdc4EOQH+fLESyA6sUPhxlsFaDzwBY834VD7US3
         DdP3rG9f5GUEi6mHjDj0wC0hClFq1HnhnO//yY4S050zt1PqUu8uQPRxZzDmNu2bKb0V
         i7gw==
X-Forwarded-Encrypted: i=1; AJvYcCX3GgFRaHgvVh8ilH/W5ntbXkSR6Sm1kO1n0pAJfywncKN87RZLTMrdDfAxfNio5tVAyCNbpABdWWjbjlql@vger.kernel.org
X-Gm-Message-State: AOJu0YxBTkvHxhA5rwrXVXf7VX5cI8wK2Wz5Vq5ftPH6r8Lq6BnC+pwS
	K7OT68dQwIBHVHOkLZUcDfm9gGD+H2IR1GeiGyLyNS5VJsC9UxSAZFxlPsMgrK0xYf6l0z9atD0
	0bIjIjwHSEpihEb08cBcWXERoNXUG0sN/IN2TU0zwz0Og0STP+KxPd8ad5gRXW/nRJHSe
X-Gm-Gg: ASbGncu0B8no/BEkuzqBTtXXZaHvER9IcDKnmzw3AkQeu/1jXMtvvZWOsKYs/FQUTuD
	RbG7nvUUb5RJA4+y/6A79tvW+M0oAgYyHcOejyIdFWoH/2oTaorAEdwRYawrQBiqRvOJtwoIep4
	PxY6LsocLfUs0t4GzTggrbqZ2u7K7ARf5WHRs/t4JBjxVI3ChIv2U/7o1d41fDR0K/LlhsnlGJB
	6Ame7SX9d+nHeNJfJBgQDui0mFqTvA6AeobltTj7OMlcFG1ugDOUoLTEBmzPNq8O2jXcEUM9pnZ
	eXEt7P4IHOD/du65JnFBSsT9qRZd3gNwFYWkTS5kdfFRSA4zK5DXMW+Zdq9SyZgQoCZ1+LPYNPh
	LfpW/zPim1N5yriLpS/DC6DRu7gfqMWQ3pOi0Nbxu32THFkTMCcCDT1wYgSogc6o7lJE=
X-Received: by 2002:ac8:5809:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ee4946ddb9mr23360541cf.4.1763631728244;
        Thu, 20 Nov 2025 01:42:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoV+9O4ZHEVJcW6VptazFPrTitDoxk6d6Ewz7I+wTr7KAcVQVGIDHM/4EdK+mcnY60jQIeJw==
X-Received: by 2002:ac8:5809:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ee4946ddb9mr23360231cf.4.1763631727776;
        Thu, 20 Nov 2025 01:42:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4f59sm162407366b.36.2025.11.20.01.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:42:07 -0800 (PST)
Message-ID: <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:42:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JEg5-Hjj9W0PKOudu3v6WrwRR47KreA8
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691ee270 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EA-HfeqjSxqo7_82F5IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OCBTYWx0ZWRfX8IFEKhYGp8hr
 LuloapbtDhGVjtpVRw1lr35cRMxI8E0pc4qIXcWjxzTC5m5IHMwmPDb3ouOh++xBmVzgRSQ4gEQ
 yUihI5Za5i2r2KxF/Mya+GYC9LNlhpzqHzk/YeJBCSeWPTji539x1xCK6OZt10+btLb/ipm/1mR
 tjIw6U4qUh7nLE5RApOjwOYsT5Eq8wxhXC0Bighvc7zniyUL7YzdjJH+J8Ng1aJ6VOc4Tbq+jiW
 y58Jo4491DNwf3q10zQi0/rPboAV0K5Fw4w1klhXukmZKvua1jE3Rm50p9PX7VDweEiBz9JKo9k
 G0GMJ2Ahi/xBTTtPSUlfCpa6e1GbENnDN4peTjj5m1kOgE1pJHNjgba6tJ6OrT4pJ+7gJtQ53hV
 ZGqKB7TQ69WjvjSBXRaNxo9mfkXIeQ==
X-Proofpoint-ORIG-GUID: JEg5-Hjj9W0PKOudu3v6WrwRR47KreA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200058

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> The driver has a lot of bit manipulation of the RGMII registers. Add
> a pair of helpers to set bits and clear bits, converting the various
> calls to rgmii_updatel() as appropriate.
> 
> Most of the change was done via this sed script:
> 
> /rgmii_updatel/ {
> 	N
> 	/,$/N
> 	/mask, / ! {
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
> 		s|^\s+$||
> 	}
> }
> 
> and then formatting tweaked where necessary.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
>  1 file changed, 89 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ae3cf163005b..cdaf02471d3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
>  	rgmii_writel(ethqos, temp, offset);
>  }
>  
> +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
> +			  unsigned int offset)
> +{
> +	rgmii_updatel(ethqos, mask, mask, offset);
> +}

It's almost unbelieveable there's no set/clr/rmw generics for
readl and friends

[...]
>  	/* Set DLL_EN */
> -	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
> -		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
> +	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);

double space

[...]

>  	/* Select RGMII, write 0 to interface select */
> -	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
> -		      0, RGMII_IO_MACRO_CONFIG);
> +	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);

and here

Everything else looks in tact

Konrad

