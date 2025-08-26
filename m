Return-Path: <linux-arm-msm+bounces-70875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CFB35A15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1D23BF653
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4102F2BEC20;
	Tue, 26 Aug 2025 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VJOlpBQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC62BE7B6;
	Tue, 26 Aug 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756204157; cv=none; b=dv/B52GQW/+6/RubbJLxB/icvFU1Cmw0nM13I0DWD10/cI8jcTuUE7rlHXdKUyEr4k97qQc9tSfZ0V/nFEsqxdtjjIawil4Gf8WBlnwf/iwQWlG4xw7PDn1KbcV5+H7nLHKj1rLLm6Geh+iFzXESXScNcVe6O+3EVZKOcalzx+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756204157; c=relaxed/simple;
	bh=mX9QBiCJqxB4VZf9ASx5A8Odnaib7u9cvsMOKUr/1Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DC9Qz3moATzCyIfkkX1j1Oj1qene4K9aC06dNwDXJIVjweDfUPTVah/LAf+/H3bmslbAu8h0JNhLyPqt77+JBCJP1NkqEd+eeKAun3aBR0cgEOjgFy0+2kH353i3WhgJ3UubOQ+Fk8uItwgfKHG+Cspot0vhoSrp+nCD7UWUQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VJOlpBQE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4FWsL004580;
	Tue, 26 Aug 2025 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WeJc6gdRVGRLNoV6G+Timuykst6YYsMsFtf09tJIXCY=; b=VJOlpBQE8RgE1zC2
	xibKq2zGWSXk4FDi2ut6K2h29kXfUiF5wOtlQ4pM4DwtuWKzztidqwfTlDavbpPZ
	eqxOUrYajJfRcyhIY2AJJ943jchW8wL4MxY8BIz4C7Z4tI6iN/JCmFgo775SY4gG
	FLg4MYrm5LdFXDeEOTSekrjvRXjPU4w7vBZj1PAku+WqaBvL258o/kA7GqbIch0a
	9+6vnGIle/3b6sHy65cLyQ06XOsmEZAmknl0cveFGDcqlcgsh1pjxm4PqI24uq+q
	DQLbV1MoJc+O2tkS2P/5ijnr0CTxxn/jkjEkQ6HjDAI6Rx8Y9bnXSbfoyGBuqwrS
	TPelLQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um8j1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:29:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QATAAe029562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:29:10 GMT
Received: from [10.216.45.32] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 26 Aug
 2025 03:29:03 -0700
Message-ID: <5ae730f4-5337-49f8-8bec-8605a2495f37@quicinc.com>
Date: Tue, 26 Aug 2025 15:59:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov
	<alexey.klimov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <psodagud@quicinc.com>, <djaggi@quicinc.com>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_arandive@quicinc.com>, <quic_cchiluve@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Jiri Slaby
	<jirislaby@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <bryan.odonoghue@linaro.org>, <neil.armstrong@linaro.org>,
        <srini@kernel.org>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-8-quic_ptalari@quicinc.com>
 <DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org>
 <577d05d4-789b-4556-a2d2-d0ad15b2c213@quicinc.com>
 <dcad137d-8ac9-4a0b-9b64-de799536fd32@kernel.org>
 <DCC8WLEKNS8W.9GAJHQGYPZIY@linaro.org>
 <8689a8b4-75cb-4f01-ad6c-0a8367851257@kernel.org>
 <DCC9B5C7SSU2.GRI1UY0VUDHF@linaro.org>
 <890ede8a-c049-4332-8f62-5dce2fa0f77b@kernel.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <890ede8a-c049-4332-8f62-5dce2fa0f77b@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ad8c76 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=pppSVFNryQhGxNBe3yQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX50+h4DrBNnfL
 v/jdyKBoo5Yd09IySOg4XvE1Ldnl+JlPWgjcrjeStU+yWVZZIHFLHgOjK6r/f73fQGHsHBa/5C4
 yDEKfrSE0AXsTJnC3enbmXlVrNHfVC5LegjgGIUKaZ+GeIY0N7lbBrb5KXtBlDDGbiuYt8zB6zD
 xi64tjPVmrE+kRr6wVzPJfESJ6zPh1PEj4CC8bVTikZ340Hum8RjvLdpnz6lQqf3y50defbi9yp
 Uh+Q1UXrM7UUvwM4brXj/bw983JJyeeTcIisjM3AeYiKiQr1vnEUjLspE5wZFM+5MuFNMXlqE8X
 aH7CRdJkBWPdtF1O7wsdym6utDm0NeqL5WUX2puk53QS7H7fIYhFKY4jjrgxDNI7judeeZgM7nh
 FZNpLeV0
X-Proofpoint-GUID: uvJknOoi9DXKqn62yR3xGDAGOJTdBevm
X-Proofpoint-ORIG-GUID: uvJknOoi9DXKqn62yR3xGDAGOJTdBevm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

Hi Alexey/Krzysztof,


On 8/26/2025 3:36 PM, Krzysztof Kozlowski wrote:
> On 26/08/2025 11:37, Alexey Klimov wrote:
>> On Tue Aug 26, 2025 at 10:21 AM BST, Krzysztof Kozlowski wrote:
>>> On 26/08/2025 11:18, Alexey Klimov wrote:
>>>>>> May i know what is testcase which you are running on target?
>>>>>
>>>>> Boot the board?
>>>>>
>>>>>> what is target?
>>>>>
>>>>> It is written in original report. Did you even read it?
>>>>>
>>>>>> Which usecase is this issue occurring in?
>>>>>
>>>>> Boot?
>>>>
>>>> FWIW, what said above by Krzysztof is correct, there is no usecase, just booting the board.
>>>>
>>> 12 days and nothing improved, right? if this was not dropped now,
>>> Alexey, can you send a revert? Author clearly approches stability with a
>>> very relaxed way and is just happy that patch was thrown over the wall
>>> and job is done.
>>>
>>>
>>> If you do not want to send revert, let me know, I will do it.
>>
>> I am okay with sending revert, just trying to see if there is any interest
>> in fixing this.
> 
> Any interest should have happened after 1 day of reporting linux-next
> breakage. It has been like what? 12 days?
> 
> That's typical throw the patch over the wall. Revert.

Really sorry for the delay.

I forgot to mention earlier that I’ve been actively investigating this
issue across different platform SoCs. I was able to reproduce the
problem on the SC7280.

Here’s a summary of the observed behavior:

The issue appears to originate from the qcom_geni_serial driver during
device runtime resume. It results in a blocked IRQ thread, which in turn
causes system instability.

The call trace suggests a deadlock scenario where the IRQ
thread—responsible for handling wake-up events—becomes unresponsive
while interacting with the pinctrl subsystem.

Specifically, the msm_pinmux_set_mux function attempts to invoke
disable_irq, which is problematic when called from an IRQ thread context.
Since the IRQ itself is a wake-up source, this leads to contention or a
self-deadlock situation.

I have verified below diff and about to post it

diff --git a/drivers/tty/serial/qcom_geni_serial.c 
b/drivers/tty/serial/qcom_geni_serial.c
index c9c52c52a98d..cb3b4febd8c2 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1848,16 +1848,36 @@ static int __maybe_unused 
qcom_geni_serial_runtime_suspend(struct device *dev)
  {
         struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
         struct uart_port *uport = &port->uport;
+       int ret;
+
+       ret = geni_serial_resources_off(uport);
+       if(ret) {
+               if (device_may_wakeup(dev))
+                       disable_irq_wake(port->wakeup_irq);
+       }

-       return geni_serial_resources_off(uport);
+       if (device_may_wakeup(dev))
+               enable_irq_wake(port->wakeup_irq);
+
+       return ret;
  }

  static int __maybe_unused qcom_geni_serial_runtime_resume(struct 
device *dev)
  {
         struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
         struct uart_port *uport = &port->uport;
+       int ret;
+
+       if (device_may_wakeup(dev))
+               disable_irq_wake(port->wakeup_irq);

-       return geni_serial_resources_on(uport);
+       ret = geni_serial_resources_on(uport);
+       if(ret) {
+               if (device_may_wakeup(dev))
+                       enable_irq_wake(port->wakeup_irq);
+       }
+
+       return ret;
  }

Thanks,
Praveen Talari

> Best regards,
> Krzysztof

