Return-Path: <linux-arm-msm+bounces-73549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7EDB576E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94E917A34F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12512FDC5E;
	Mon, 15 Sep 2025 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZz7aImc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096962FC009
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757933119; cv=none; b=YMlQACxERLYIRS252rD87qrcWRTpwAarsv/tHa+R1HfjTnO+yO5GvzfIPZ3fQZ5LxASMCL0IlBy49vhWbYXW/xXWAcUdYTlwmzyLeTB7N5wA7Ui1G4aw8QbEgz3q74p2GLVeZNsRCJSVDooNksAjcVdWv9bNnxmpg/WCI4osVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757933119; c=relaxed/simple;
	bh=4Hqmjd3+E40zlmae07f3O9TiuExFlT7eQnjsd/l9Bx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d62ylX9RRh1ZnNtYZOmu3yd5qDrPSXUR9nZ8OLPGP2S9UcMo/7yZt8iiP7CF19G0iUNssN2zxotQJbFQPX5mjUEYNGQsxeZwA3mKpjzA8ebaqeGICdvpNMLFsMtAyqO2OeG5r6ZW7jEuP7mjXqLOm0sOv4xvpV46tfudCAEsPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZz7aImc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FhbA014092
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3q9UHllEUzo7emL0csxSsit2MUCrJ9I6itNrb0wCCSE=; b=FZz7aImcq32G0kDj
	Oa/v2b1+4ho8TvoVx33/+DXzLu6BhQ+T0y2fU2AyBKpZPlGY9Kk3B3T/s4UjJO3x
	noR9HzsHnCHE+qs5qXNp4LA5L38qpD8KRJuCcw3w/RcKtM9wFfXVtWC2ygn864pG
	6rGWIDOGU0AKw5IN5vhxFFne2Pc/Nh4htyRXVZYhuEhEUAumTfGHbmSoyqc//iri
	+LzLbhra0i3BdLPrYDkwj24dJQofMd10m8psh9gl40fmyJnQ5yXRiuy3sylmDUXj
	zlOs2iqquxLthxrORvtKbARxuKl1sCNtqZU9sIW8cVCoHU0oN7K3b+l7k6UKzjQK
	+0QCbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr4u19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:45:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24c9e2b6533so9355285ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933112; x=1758537912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3q9UHllEUzo7emL0csxSsit2MUCrJ9I6itNrb0wCCSE=;
        b=cvDjHuN9B0wME858vTm89ZCK+GP0kdoGpV5QBitS3m3ahvNAabssXKCcFc05VwpdeH
         EzxC8Xu8fBbCuuHUR8s+R4QySBws9sltdPPUCboUn7YVeEwVLDAMNUDnBGSqeDH+4tYZ
         Rrhxc4RgU/9rfpY2U0M+q1wkRAUE2ZSAJzxiDS+ind+lMhyy0s2zOHhFThFOULnDsleG
         f2DC0n9QQ49lRvmC+fehJhYT/Xll18IHM2DLGYd2bc9Pe/M3gHA85GtMk58DKsnHKLhI
         VRjHww6+6FdC9nu3JBBxB0HbYpR0ElNdh7bQ60lvwE2GYWPW+BV2yGaoURURDMSemgCn
         bR7w==
X-Forwarded-Encrypted: i=1; AJvYcCWp6mElJwBV+MbsOhHgSS2MOr37PCteiqWaRcUdNgMm6a+4H7W9xROMU0aKFcoLHeqyhLA9M1f8ragRc0dg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9AMTQ1y7RxyFe/8zVV0WqVZLbvHqIwO918enCIb8tTC4SpCUN
	ojpMDi1hCKd3TRNwSUX/jeBlJT/DDPaJrfXlXI9vXTMegOobslCX5TOZodZt5pPvzKLa+ZCb5vS
	kxtxh986NM5R8SCTu+oVdV/oY2vsWr6glNLN0BKXUO8AqCt3nOjl5Bya5vg8OFnjZqoWx
X-Gm-Gg: ASbGncsAnEDRConvjGIUOOnYqpyGCAw4fOJBfZ2We6O/+o2I18e1XR2LX2qZSWdTCPG
	9JCLMVGE5E5Sxm5mbJJICGqzZoBDeIb8h2iTJ/PnM1eQLgxXnVMAgpGwof7G8DNI1jIQRo3PGWS
	mqTQ/p/gMFNc5xTzddbnQDVudepe/O2YW6X8dIPI75+dmSB8jdjUhs9/9mffQwcOP87lj3izHhA
	1v40UkjtrcuWGkUFfkf1RznvfhLyOwj8exQemMn9Y+ohnigh2i4bOL/rtnMVBuUe4egm6tpVcC1
	5+llmIRzMOImWUV45E2pW+HWLOYv5WR/htZxtB3KGoLwTjT/13K9j6IldhFsF/tZF5seuLnHikv
	NzYEOEGN5cNOGsS8WHV+2h1PA0zr0spbqw3A=
X-Received: by 2002:a17:902:c94a:b0:262:923b:4e2e with SMTP id d9443c01a7336-262923b5125mr46665325ad.11.1757933112401;
        Mon, 15 Sep 2025 03:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYdD9O4QdRiVJ5hAs101DS3Zf4FAq6fcZz1dgavqsmhdSqj3W4RYmxEazrWjBJJAH2vJCcqw==
X-Received: by 2002:a17:902:c94a:b0:262:923b:4e2e with SMTP id d9443c01a7336-262923b5125mr46664835ad.11.1757933111666;
        Mon, 15 Sep 2025 03:45:11 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2664f0071e5sm27436305ad.68.2025.09.15.03.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 03:45:11 -0700 (PDT)
Message-ID: <8baa3f62-8069-42cb-810d-33e1ad61abbb@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:45:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
 <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
 <335ffce5-19c6-409d-8386-686fe9e5dea5@oss.qualcomm.com>
 <7ozv3u7xuvtz2x5q3pp5kdeydtsu5jlrgwjnxpxxiuh7przr2z@35uo7t3b4ze2>
 <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
 <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oTIJQplU8yw6nMmDm_i3G8k0if162Swx
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c7ee3b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rsY2jHysN4_Lp2AvgbIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfXwzgEWbpjG+vN
 w52cO2z8rwBZe36H7Ct/NACQ5HHlQmVsoYzvKP4YJTFqbbLNDrgk0uqlWALwpClGB+anwE898UO
 RcdKCo5wP32lw/MO5aLGqlg2yBwDzdZfP12qGslSGZXjkvqgFW1YgNNLepij3V7jtLcW4JXS8Vp
 JVf5vD64ITtp1PQ7pSZMwle4yZ0hHKs/GZtWRzyZE/2irsR1tI/H0zY1NEE1uib7fifXfxRV96E
 0TLwzb90Gyc9jmYRGMWXxABwIODp+IuXv0lmNxn4ogx2VrNmYTXrJeo1d0kqh7m9Gq+sunSsdMC
 hXk886nBYFgQuAj5H3yLp4cYEh7Arfsn1AE7I2We2wI/CUl4K1bqJ4VPTKcLHvI8TMnPbQy0cBz
 bpf5WFq7
X-Proofpoint-GUID: oTIJQplU8yw6nMmDm_i3G8k0if162Swx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000


On 9/15/2025 6:14 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 06:02:19PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 8:08 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 08:00:14PM +0800, Xiangxu Yin wrote:
>>>> On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
>>>>>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>>>>>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>>>>>> USB and DP instances.
>>>>>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
>>>>>>  1 file changed, 195 insertions(+), 13 deletions(-)
>>>>>> +	default:
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
>>>>>> +{
>>>>>> +	int ret;
>>>>>>  
>>>>>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
>>>>>> +	ret = phy_pipe_clk_register(qmp, np);
>>>>>>  	if (ret)
>>>>>>  		return ret;
>>>>>>  
>>>>>> -	/*
>>>>>> -	 * Roll a devm action because the clock provider is the child node, but
>>>>>> -	 * the child node is not actually a device.
>>>>>> -	 */
>>>>>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>>>>>> +	if (qmp->dp_serdes != 0) {
>>>>>> +		ret = phy_dp_clks_register(qmp, np);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
>>>>> Do you understand what did the comment (that you've removed) say? And
>>>>> why?
>>> And this was ignored :-(
>> Sorry for missing this part.
>>
>> For USB-C PHY, the legacy implementation only supports USB with a single
>> device node. The new driver for USB and DP also uses a single device node.
> There is no 'new driver'. It's about DT.
>
>> The function devm_of_clk_add_hw_provider internally handles both
>> of_clk_add_hw_provider and devres_add, and supports automatic resource
>> release.
>>
>> So I think using devm_of_clk_add_hw_provider allows us to remove
>> of_clk_add_hw_provider and devm_add_action_or_reset.
> Which node is passed to of_clk_add_hw_provider() in the legacy DT case?
> Which node is passed to of_clk_add_hw_provider() by
> devm_of_clk_add_hw_provider()?


Ohh, legacy is child node and devm is dev->of_node.

Will add that back for compatibility.


>> For combo PHY, the legacy implementation uses two device nodes: dp_np and
>> usb_np. To maintain forward compatibility, we need to keep support for
>> both nodes and retain the related logic.

