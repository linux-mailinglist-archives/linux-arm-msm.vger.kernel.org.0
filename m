Return-Path: <linux-arm-msm+bounces-73678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B5B593EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30ADB3A44E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD092EA17F;
	Tue, 16 Sep 2025 10:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g+fBY/aJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FAC2877F0;
	Tue, 16 Sep 2025 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019176; cv=none; b=GmolYqX3Gx+yCviUBDGJpdAFcWA8jvuMtyk38RE1jOzVMdwDZCFwRFhG2GdFSxQGWGlwprzgSny3CvExX/blHwLeIEkN06WSCwcCk1kjUl2YlJiHAbl78ojRO6BoPUKMBDqGaBfsbfR+18+w+T6Rrg6HPMUIifZDgfnTxM9/b4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019176; c=relaxed/simple;
	bh=HIaITqBXF+Fw3WzmqJw71HSfN8dgGOZDFlkHWtPapkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jK+QEVwO/KqVLB5gUcFUZ0/lI+5Na59hr8Zj5O+weTr44Krm9lmL11FgA4rkJNshCUTKfibJB9yjkimudAgTxhsrDYy/3xALpV/dPPCpERXxg7kmtgoxnvBSEirNfUoJ+Nj05RnjpgGW4+rln5h0Xt9PmvMSK8riw3zgtvWhbC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g+fBY/aJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAUnoH018557;
	Tue, 16 Sep 2025 10:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CC2jNJzlP3Ogq+Q5JdC0jlGk0SFyzQnAypaUjM5cWlQ=; b=g+fBY/aJtDJo6Heh
	pv63ywNxVXZOEBLJ9RAHYdNL96zKGNHS0rHilVFV/7CuNBTeuoxqC/Qt4B6IxjLx
	iTas+v9HVUt9ttLejbZtKDxi8ZA4YN/Cjkh203aU2NFSVNSFUrLWD5B+kaqamnZR
	jq9p5QigPGXNaIAAh7KABMRJUoltD4BqV1gt4/0wZ9bIYCj640Qzcj5ao92hFUaL
	Bkg4PwwurMJQZGeZ2HTNRGWNYtw64QU4ZY53y6RPKz6EI/n4om7XxBALi87tyUEJ
	hrixKRM1vkoLjuNVJOZ7xRyNGuf5Wbm/PH1MSPBaY8aqLl3rgf0yX3zU61XmGxPC
	9OfgGQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9cwwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 10:39:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58GAdT0Z004285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 10:39:29 GMT
Received: from [10.253.12.79] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 16 Sep
 2025 03:39:26 -0700
Message-ID: <17d1e632-31c9-48b2-bf0f-5b57234de113@quicinc.com>
Date: Tue, 16 Sep 2025 18:39:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Yijie Yang
	<yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yingying Tang
	<yingying.tang@oss.qualcomm.com>,
        Shuai Zhang <shuaz@qti.qualcomm.com>, <zhichen@qti.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-4-38ed7f2015f7@oss.qualcomm.com>
 <aMPhEm8PuhEofHP7@linaro.org>
 <317ffa87-060c-4f1b-a6bf-61bb27367477@quicinc.com>
 <jimz3qnjrcvemvgrqpwxq4zmywfo6psplsg4jefkvvpiwlffek@fwn3juynr4zx>
 <b3bf54a2-f33b-44d5-a9e4-65ba18ea267d@quicinc.com>
 <ee2d0d92-bff9-4593-a912-7e4b1d66913b@oss.qualcomm.com>
From: Yingying Tang <quic_yintang@quicinc.com>
In-Reply-To: <ee2d0d92-bff9-4593-a912-7e4b1d66913b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c93e62 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=poIrirvEbd_GlcA9MXcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dCibg85zWcNXjd1x1amgssqLwLP94IKt
X-Proofpoint-ORIG-GUID: dCibg85zWcNXjd1x1amgssqLwLP94IKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX+EV7AruOi6L/
 92d5d6FO5YFzE4dYwwAeCEV/NGiI6t67V28bEphmFHzL7XnX7EjljPcmr9KqXgeJHB/W2ja8uK/
 mQ6LRGQXQr9yhAnN4Cl4TqyPnohFOZBDFyTlP6HzGhWtFAjBqxu3O145A5M5Te5fs1Tr3rfsnfM
 Lnwd+hHjyoRl3LA9tNHxgYUhdoxZ5n2w+nkgC2moFyuZlBbDTLoFZIr3O8gDuZ1t/4oZkHdY2Fg
 QNVb3vAVLz4Yl7F1GzI056519Tkw4+YtDCVntTP14PKK2R/ODvUJGMpJg1iiiW7DzDXzJCcf0px
 PXn8nloP0dxEGe+N5dtv9IOkn+u04qJljKW3tEk9zsB1VjVMiF05sJRFMNhVKgoB0o6oUBvC2Or
 SmMpvL4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056



On 9/16/2025 6:36 PM, Konrad Dybcio wrote:
> On 9/16/25 12:29 PM, Yingying Tang wrote:
>>
>>
>> On 9/16/2025 6:14 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 16, 2025 at 09:42:26AM +0800, Yingying Tang wrote:
>>>>
>>>>
>>>> On 9/12/2025 5:00 PM, Stephan Gerhold wrote:
>>>>> On Wed, Sep 10, 2025 at 05:02:12PM +0800, Yijie Yang wrote:
>>>>>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>>>>>> embedded system capable of booting to UART.
>>>>>>
>>>>>> Make the following peripherals on the carrier board enabled:
>>>>>> - UART
>>>>>> - On-board regulators
>>>>>> - USB Type-C mux
>>>>>> - Pinctrl
>>>>>> - Embedded USB (EUSB) repeaters
>>>>>> - NVMe
>>>>>> - pmic-glink
>>>>>> - USB DisplayPorts
>>>>>> - Bluetooth
>>>>>> - WLAN
>>>>>> - Audio
>>>>>>
>>>>>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>>>>>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>>>>>> <quic_shuaz@quicinc.com>, Yingying Tang (WLAN) <quic_yintang@quicinc.com>,
>>>>>> and Yongxing Mou (USB DisplayPorts) <quic_yongmou@quicinc.com>.
>>>>>
>>>>> This looks like you should have Co-developed-by: tags together with
>>>>> their Signed-off-by: tags.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>>>>>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1221 ++++++++++++++++++++++++++++
>>>>>>  2 files changed, 1222 insertions(+)
>>>>>>
>>>>>> +
>>>>>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
>>>>>> +		compatible = "regulator-fixed";
>>>>>> +
>>>>>> +		regulator-name = "VREG_WCN_3P3";
>>>>>> +		regulator-min-microvolt = <3300000>;
>>>>>> +		regulator-max-microvolt = <3300000>;
>>>>>> +
>>>>>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>>>>>> +		enable-active-high;
>>>>>> +
>>>>>> +		pinctrl-0 = <&wcn_sw_en>;
>>>>>> +		pinctrl-names = "default";
>>>>>> +
>>>>>
>>>>> regulator-boot-on?
>>>>
>>>> It shoulde be regulator-always-on
>>>
>>> Why it's not boot-on and always-on?
>>>
>> As I described before, connectivity power is voted by UEFI in boot phase.So PCIe link between connetivity card and RC4 is established once RC4 is on.
>> If we set this node as "regulator-boot-on", connectivity power will be down first then up. That cause PCIe link down and the link can't be trained again unless you reboot board.
>> So we can't set it to "regulator-boot-on"
> 
> Surely gpio-regulator.c implements .get_voltage which reads the pin
> state though? Did you test this, or are you theorycrafting?
> 
Yes we tested this case many times, "regulator-boot-on" causes PCIe link down. No any issue with "regulator-always-on"
> Konrad
> 


