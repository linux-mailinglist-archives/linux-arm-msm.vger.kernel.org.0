Return-Path: <linux-arm-msm+bounces-68346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88340B20706
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BCF92A157C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A172BEC24;
	Mon, 11 Aug 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHvdNXM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99942BE7DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910786; cv=none; b=fzhfBjjuCLbh8A9sioTgr1XzVjtWGt3ACXAuisLMQTpdl7tx7leUv/kZr+mvMVtpJBaYVfG+YVWfFCb0kLrdWIT+KsHzS8KjHSBqpXacZpKqnCqPJ04JRdz6ToBcdt5DCbePhzRfgNtwMJ/vIfaOh0tEsbPcHGEKjLcBEx3FcP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910786; c=relaxed/simple;
	bh=lEuV8cb9kowURNTyypZITqyna8vIdGy3JqFnkYezfh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNuc1gtY/Fjg5vaIga9Ro2Vdto59Vr3s1vjyU1piNseNBaYkui6PYyFfjos4c4WUhIchp55WI2MUNDYAwI5OG3WcodKfuw/L/8wSBlwwca4BVvqYwIUTf7d+UiyKa8pdNcgkt4BU0rMc19bH7wjQtt9wNER8a5QtDdKu4/MiWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHvdNXM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dT7g025914
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URReqVGPLDf+FTpAoIchtSx7YISeSz/3xo0Fm79Dgds=; b=mHvdNXM4HBdMH7W5
	6CcQL6+te8F8+Dxc6iZqp2RPt6o80vUW8TeoQrZUX1VUM2vnSqCmbDs3E90hkyr1
	YJiHUGxYZsywpV7qVqEhurquMschCcrIVdvk4OLDUdIXU7Qi7PuFiI2r24qwe0cE
	mmL1I7eTgmvINwd5sOF5uhiGB9sZHPM1WJVP79YeqrNskmJ4fKXXPQrhvQZjjw5n
	6i1Nty/cKpbFO+uw7o36YlkA0Zsy7GgoUmjMG3EEDBZ/Glvpy3okNFGpbO7WM7BA
	3wYOsHgDb/GQgwbEIOBk0WWpf50b4rlpBn25JUQooMIFNJ9HUDMECUbALkFEoQsL
	L8tsgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb746xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:13:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0938f0dabso11572071cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910783; x=1755515583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URReqVGPLDf+FTpAoIchtSx7YISeSz/3xo0Fm79Dgds=;
        b=RJEBYRR0dW6pLr9Ir3Dg3MPRNIm8ygaC6EqfE6KuTknuGlh9/X0h7/RSjE9L73Z4CL
         OI0btuUaCaIe7OzKUPSf8Luf+8VXupB4RUdjI/6ZLmv7ZDZFUnNXoK06+8SQtB9V5fcH
         uU/Ka6ZHvybM6BDwsWmZbcfhkxVFEny3rcVfBCJnAJVmPNuJ5FhNxmx8/I0/ZwheeeLC
         8ABOwZrkq9117PjDaHiRP4LrOTwvgrYt4pQ27UCxDK/7bdVWUL/vE3vsSdhjaKSsG5eG
         CO3W3TgNRDEcbAi7yMaGjyoSaHC37lBTxoJQdb/Uxk+TKZVkTvlguS22Oiypl+/UtAwP
         XU7g==
X-Forwarded-Encrypted: i=1; AJvYcCXbdPNSnV+mF97XJx5K55TNbAhU4W+1AW7U59AzP0Hzgfq1l8cq0Q2Zjxa8Nje80SOI7V/t9QnLdEWdYMwc@vger.kernel.org
X-Gm-Message-State: AOJu0YyxjktpN4QT3F0+U3UTA+N5LmQDy2IpQnyzNvZYZxd1mu/pcqA1
	81y3Z3SvyMmTTnHL0GgNh3KZeh8HpbC9sk/5CRNxlu3zbla/FcW2It6ecxTiuQVNcFMHhlBpfPb
	a41bydjm/cvmsqWVdLVqNPdXHhzIvrDMMG04g4xGOONP/2WLRJzbR8jHxALeh8rnxppoyOBd3Hd
	2B
X-Gm-Gg: ASbGncu3OjLkPvWpGP851XjH7BUx7e3Olqa+gBFjzbF2pYMXZeKng7mbiJ/bJ+F/2Nz
	tt4d9W4M9oTh1Cw2BnohMGY/qVPM+r+ul5qeoqaL4W8Fo162vFw/8U6QJxJEUAJ1g1pdnv51Pg+
	6T21/Z7CN/xb4jE9SU1Zd12ybXG631duHdd6UaypYdQRDnDPQv2ItPEzKAxcaxwvNub5Z33LcBk
	yHmegqyCVoMER828RTPEfhmUh7amQgcA/q3YxdF7pmzY02tuJoCNq+0jBisHC7GsJwnk0ks/bR7
	jh/vEoSi1N1uHTMjkiNXO7Xb6O16dzoyCHojX7wiywWqJUy3reyz5BZ0g7WtHNSlomdfn+U3Q8X
	26Fz/KB7HVFw5v/yZfw==
X-Received: by 2002:a05:622a:24e:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b0c18feedemr57354671cf.3.1754910782609;
        Mon, 11 Aug 2025 04:13:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7A0+Y98Xy74689qvBQIGVL869VUV1Q2Mn0tA1F9GaDJPsmzmzsKoUL0ebMPuxgorWRDYqVQ==
X-Received: by 2002:a05:622a:24e:b0:4ab:63f8:ef30 with SMTP id d75a77b69052e-4b0c18feedemr57354411cf.3.1754910782197;
        Mon, 11 Aug 2025 04:13:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076620sm1997071666b.10.2025.08.11.04.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:13:01 -0700 (PDT)
Message-ID: <4f6a7dc5-b0f8-491b-aa12-78be5f47ef2b@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:12:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
 <20250807-topic-4ln_dp_respin-v4-5-43272d6eca92@oss.qualcomm.com>
 <ibrupwvn5frzb4vo3eukb7p7pzonaxwhygshz743wmyrbprkcq@xcpt4ryzvwqr>
 <619efc83-37f3-4b4e-b756-c53ecd2f6867@oss.qualcomm.com>
 <y4yiyokoo7fclwlpyhct4o7mt6swustuciigqnte5pruust26q@ryvuwpd6h4qm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <y4yiyokoo7fclwlpyhct4o7mt6swustuciigqnte5pruust26q@ryvuwpd6h4qm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6899d03f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=l4QWMBroLdz4_K-1UwwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wReWKkw9D_ERR_XkU7vXlTsgfT7FJSgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfX3N0f/7WkSgNj
 uhkXc8ryOUQQnf3Dwl2J7aVVLQyLcEXeT9QrUG1rrL2DDflCFgIBDXNNNKcdeetpgqkduTpdnUF
 +8uieHnwpBbDD68KYfMewUEcgwyXZLnr3ly7oU0cr0KIwq2X7JQadQnw0gOnDImaYQ7OGc2lFY4
 ieFKrqYM8XU2yD7IqNtviU7Q8m4T90pca0okZ04W9uG4AW51C6P6YWncaZh2DucvSxPYeaV2+aJ
 pSv76aAHBU/K55bbfXl94SlsXKDLFrf813baF33A59+CvYpBcbGyHMyqQ/QbMeJAZPMXa8jwPCP
 eW18GUOpaR10pRSSreHokGOvSMV44i2EmgammRJVf3iSd5ykMWwEQN8HnDd3Oy6kg2dBxQS9Yis
 RxcXZo/Q
X-Proofpoint-ORIG-GUID: wReWKkw9D_ERR_XkU7vXlTsgfT7FJSgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013

On 8/11/25 12:55 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 12:37:00PM +0200, Konrad Dybcio wrote:
>> On 8/9/25 10:13 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 07, 2025 at 06:33:23PM +0200, Konrad Dybcio wrote:
>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>
>>>> Register a typec mux in order to change the PHY mode on the Type-C
>>>> mux events depending on the mode and the svid when in Altmode setup.
>>>>
>>>> The DisplayPort phy should be left enabled if is still powered on
>>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>>>> PHY is not powered off.
>>>>
>>>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>>>> will be set in between of USB-Only, Combo and DisplayPort Only so
>>>> this will leave enough time to the DRM DisplayPort controller to
>>>> turn of the DisplayPort PHY.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> [konrad: renaming, rewording, bug fixes]
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 118 ++++++++++++++++++++++++++++--
>>>>  1 file changed, 113 insertions(+), 5 deletions(-)
>>>>
>>>> +
>>>> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
>>>> +		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
>>>> +		return 0;
>>>> +	}
>>>
>>> I can't say that I'm fully happy about it, nevertheless:
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> IIUC we'll be able to get rid of it after the dp rework?
> 
> Which one? The HPD? not really. My unhappiness is about the sync between
> USB and DP. I'm unsure whether we need higher level of sync for
> USB-or-DP PHYs.

Unfortunately it'll only get worse with usb4, where the DP PLL may
need to be online (or not) for when we're tunneling DP data :(

Konrad


