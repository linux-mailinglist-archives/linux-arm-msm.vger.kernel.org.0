Return-Path: <linux-arm-msm+bounces-73500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84EB571CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBCF418855C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BCC2D6E67;
	Mon, 15 Sep 2025 07:43:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A9C2D6620;
	Mon, 15 Sep 2025 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922183; cv=none; b=RKhWFJRv3/B2vasqxKCYp0xL7e0gGwrUM8QFGdgWRQYJd4lFw5Nn3QOZhoN8Y6ERZI8pBm+0QXAsihwVXlaVsZTZCXkwMagog0u5sugSLtcDPaHL/Ru8QObi8E8I2dlPxECyfb6yI/Y5wY3WF3Ku6LpvRtc8nSa/fNX9wgWmYNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922183; c=relaxed/simple;
	bh=ggQUGLC8JTmMpWJqdkIhB62AvhBLfqcOms9LrrS7BiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FN3jOdJs2zJ0TpMRzI5chWJ/Qt/Yu+L8drJcHK9unGyC+jKKVWl5TJEi0YqAStBfvfeV8eIOpMqZV5BXLrTj4ZivmBBnm/gHliK8RYkP07a+QWUmIA/k8bGsAsOwFeFztzWPuPN+wNFdAdwWwQDLmFqVLnaRPhORndAlfSE6b7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1757922169ta20c0c63
X-QQ-Originating-IP: QRDqi4pNaU/sJUftpijW7H04pC9TQ/4M0p4TfS49pf8=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Sep 2025 15:42:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17166322424909041935
Message-ID: <CC5FA2116C20A69E+a2b123b5-1b78-444e-a886-3d3beb6e0ead@radxa.com>
Date: Mon, 15 Sep 2025 15:42:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 5/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable USB 3.0 and HDMI ports
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-5-045f7e92b3bb@radxa.com>
 <b3c169b5-607c-40ae-9ca1-0977b6f526c2@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <b3c169b5-607c-40ae-9ca1-0977b6f526c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OE3tIrIEWSq47Mbrswj3N8cLDlq4eBgBwhVZ81ZHNHdxWgG6algZ0kew
	Co5k8+O8BK18iL0wJTliNDU631oWoEA1mHmxePEfmxzuQVe8et8zUEK8jdXdZPhvCmGp2rS
	e+8AwStQKsyDuEroPZULuE9xKD5ITevq0tCCvRLGOWxPHHvfb9utCr7OhVq9oDs3YJgdmLg
	TxmEbb602l7kr4gtC6EZENfX71uwx1vdddVpyTTIdNKQIfGxsQRhuuwRA1sSqg+LcdyayV/
	it0RC3ewg98FzztPqIFggFkL6wyu+F328iupMoab8h1OwxZWAoNjzUEje2Hk5gNwK128whn
	EBt/XzAB/NiXB+8KodGyBWkzLz8qKiK3uexP/CUV968G/i5nGPiqOXGUpGwIUtInZiRYqWo
	9fxd32H9nYM5MV1VxuKTr7lz5wIQH5jrk2ETefHRS7H6kqNZHJxKplg85voVrd0sROngPRw
	oyrXwJrKvkF5PXgLmgxaRfpMDUZd364vrFe3Qbz2sZm2WNlCzui047AGVE+qIG0GQii0LpZ
	ipJGcg7t3v18YyMaCX+mR94B8poq1yS/JpHw+ZGwmzsp0usB289zl9MQoRhQbFIAje94Lun
	2BZAReZhcp96Sf0dxcnUZks5aALQksg9qfra5QGAvC/qVqdE4jFtFR0OzLBveTQ2QJW+glP
	0+zEug7YiyN3YCYckpEEea3unc8KUjBEpcvgILRhaPAUHhzDAFO990dh75/y1mEgw5eNEQt
	U0mpikn+cMRoVTxCIF7/I8B+bd3KJyFv8kp7fyeKybKUCaftCDwgo7hb0vZojXkh3v47+gl
	ZGCg+Ow7sbn/ZabodGUcMLVQ9vSyuztY94dg4srmonBQJzgA2UC4yZyKjC8+7GpIMzqncwt
	8lEEPt/iOV7iT0Ikz8aYynfw5oSsk1bN09WdiEk8Hsos+W9gMUytofaO7eH+OwF/9GMumwy
	+mnTWuMcux/d15zcAKEMf7sm5USL1wslQgIFvNFAJt6tCgP60TEm5Cy31OcwzgZEl6Ew6t+
	J4AEQLYtVMQQRsdpOYHCz3MDmL9Dkbiar7iGG00ElnNlkZ7E0R
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On 9/15/2025 3:27 PM, Konrad Dybcio wrote:
> On 9/14/25 5:57 PM, Xilin Wu wrote:
>> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
>> RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
>> pair is connected to the RA620 DP-to-HDMI bridge.
>>
>> Add and enable the nodes for the features to work.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>
>> ---
>>
>> This change depends on the following patch series:
>> https://lore.kernel.org/all/20250908-topic-x1e80100-hdmi-v3-4-c53b0f2bc2fb@linaro.org/
>> ---
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++++++++++++
>>   1 file changed, 152 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> index 3bf85d68c97891db1f1f0b84fb5649803948e06f..12bc9a0fcfbfeaabf6ede351f96c61193a8261c0 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
>> @@ -78,6 +78,71 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	usb3_con: connector {
>> +		compatible = "usb-a-connector";
> 
> Looking at https://docs.radxa.com/en/dragon/q6a, I see two of these.
> 
> I suppose there's a (dumb) hub inbetween - check sdm850-lenovo-yoga-c630
> for reference if that's the case
> 
> Konrad
> 

There are actually four USB-A ports, but only one of them is USB 3.0, 
and is directly connected to the SoC.

The other three USB 2.0 ports are connected to an always-on USB hub, 
which is then connected to the second USB controller.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

