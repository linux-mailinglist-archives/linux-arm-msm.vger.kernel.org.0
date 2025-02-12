Return-Path: <linux-arm-msm+bounces-47836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D8A333A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBB81660B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C811B211715;
	Wed, 12 Feb 2025 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtdO7FhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579BE2046B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739404180; cv=none; b=YdWhKzUXuPIW4iSOQVUeMzkecKdh14nUw7pDjKWyuKcOfmdG5kU7Zj0Akhke0m+CfYHZlRh0ZwUqdiK2QsKOPUruS3mTt0yPCc8SZTG95yColz56h0sH30Ip8NdFB9Ufx4gNWkd5LZAVbVl5twWbWcrXGhJ1AZngxsnnipleT0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739404180; c=relaxed/simple;
	bh=JIhvWwRBh4muoqeGhHJ0zK2xjH3Tjt8L2DiUTwSOSTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RE+XOB8xXG9Qs7XZkTSfCngZ2FOe1dBbc5BuiV8VRRv7OVQo9pMa6bwt7EMBrlA9b+KxiXaRICqHSnwg0b2EB7StZit5oxdBiL2CQdPVpoQdajgckZhrzLemKM6/808vUtK4YQmefl3lamruGHe+ugjnORlVgXdWK5srLMGj7L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtdO7FhI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CN03l1012444
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKclV7RyRuQunpXF1JKN4EFzwZ611czWb+KOZap1Vjk=; b=GtdO7FhIeh/+VsnV
	um5VrsNGTz+GnnXiXKtN2kULI8HI/zSkCozEsCzaKuganNg4s0LluLIJvKZWJ2ZV
	/WDEfL63FHjnFx+tn78d/Yo5voSS46mO4QpTbbStE4Kg4NRZt0Bz3cDNXkp6pT8S
	RCv8By29F5/raKbIYkRGIt1/+VK6qfp7OMqDbUoD86Fdc0H9zeWGeKAaY3KYjy50
	C0YgCs2upGPV0KgesYxClJ0pTOMc018cuTAEFY6LeOqIw0e4Lv6UPmQ5fbe3yct8
	3yo6ZtQjLojesiW7mux8Mufv1ZjfqZJMDd1Li/zAJUsa6OZsZV7QW+3ljDqF80dJ
	9u6F8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3xcg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 23:49:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-471beb45811so149121cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 15:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739404177; x=1740008977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKclV7RyRuQunpXF1JKN4EFzwZ611czWb+KOZap1Vjk=;
        b=HgYFjnLGnAOGDyn0gpiDXq81LRzSXSn5f2GEMaxWl1I4iQhntHpuDSu+v0vObcNAiX
         QvMgNpB5iNAL6Yc7TkQXDldmisFzqY0KSUyhe653EWsqm0EbVeIL2UrEUf/Hzft0U4Rb
         xUaDkWUFmVvYamHpgX2VHGfXg9Whhaj69ze0mF13GfO+O5NPCzkTtJdnPeA19eDsiZg5
         EJgammVoQw/rbks4RV6QVDqA8SpKYOewAXleoXLegjUr1vwGcxW+i7Qq3QzJf6kw7bIv
         xpq90AUQ1C0WsnPcc5DCljQCB1oCU5IuOvvKFQAqP1QxzB00zE90YBkX3qpF4eQ3+OJZ
         wkyg==
X-Forwarded-Encrypted: i=1; AJvYcCWjgUL6Wy+oofTb6cJo6jqBYZaCTm0BhDMX2gxRuDhX/rkjXGCwLVkRIVWjniXLJCnrv1tap0b5zdsJZIZk@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqkiiuF5ZV+ncKZAhq0uRQG8L1We6qg0kFF96aTHbwORg+Uy3
	vksZdsGMwtjDcVNtB3XBuq7ONuQzQ3y0HEydOYDYlXNGjI43myhfjECmS1XsRjCftVs30/5pp0v
	+vMxUOjwgUWU8JrmBEqroQ0qGNFLUN7sX2uGdjNIkVHJ0O/xZmBlzyIdNdVuiYaR1UQ25mMQS
X-Gm-Gg: ASbGncvh0pSptVL0LYJMeEfqlylWkP51gqjL2FTqcQN3CkkS2r2wdR28Gtpfwg6442V
	sHCTpY/mbA7VJqRvadtXLbPSMVifGahePTza3UpbxOWLSS7l9e37ZubzbxO5zaAOvvA6JMG4yvr
	wVPXLf0Y3EgQ0iY4NqbmoVhBqVcIGNFInyC4e0VtxIVhj9rZUm0YAfEuvZ+xCFJk1x/qOLQzEXa
	8BGaQTauCyTQSwU8UoEDQ64IItxqmlED8TLGI27KXj5s/bPheB2+I+yGfD6M8j+D10zXnBaFcgH
	6JcPkeQRqE5K9IbUR3anFhWguqvMvJT7K5NOIM9ssPVRCXvq3dkJty86iug=
X-Received: by 2002:a05:622a:9015:b0:471:b9e1:670e with SMTP id d75a77b69052e-471b9e16e17mr15312871cf.4.1739404176664;
        Wed, 12 Feb 2025 15:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgxK9FsuRe/oeuntjkcd+d5kRycbejmWWvE2jJR5QduMdyEFnA/03RDST0RqDTvW05TGkfyw==
X-Received: by 2002:a05:622a:9015:b0:471:b9e1:670e with SMTP id d75a77b69052e-471b9e16e17mr15312711cf.4.1739404176226;
        Wed, 12 Feb 2025 15:49:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322dbsm16236866b.10.2025.02.12.15.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 15:49:35 -0800 (PST)
Message-ID: <763d689b-35da-40db-8605-52e408728df0@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 00:49:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
 <20250207-rb1-bt-v4-6-d810fc8c94a9@linaro.org>
 <6e5bb2f7-a23b-4fab-914b-e67911eaf408@oss.qualcomm.com>
 <CAA8EJpq504V48qqSX0mzxCffUkq_xpu_UE+qubB46A7zon=0iw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJpq504V48qqSX0mzxCffUkq_xpu_UE+qubB46A7zon=0iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hMQOlhLv1FyHHsRvYnTEn8G2ISwr7PT3
X-Proofpoint-ORIG-GUID: hMQOlhLv1FyHHsRvYnTEn8G2ISwr7PT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120167

On 11.02.2025 10:19 PM, Dmitry Baryshkov wrote:
> On Tue, 11 Feb 2025 at 16:52, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7.02.2025 9:41 PM, Dmitry Baryshkov wrote:
>>> Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
>>> has been merged to linux-firmware and should be available in the next
>>> release.
>>>
>>> Bluetooth: hci0: setting up wcn399x
>>> Bluetooth: hci0: QCA Product ID   :0x0000000f
>>> Bluetooth: hci0: QCA SOC Version  :0x40070120
>>> Bluetooth: hci0: QCA ROM Version  :0x00000102
>>> Bluetooth: hci0: QCA Patch Version:0x00000001
>>> Bluetooth: hci0: QCA controller version 0x01200102
>>> Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
>>> Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
>>> Bluetooth: hci0: QCA setup on UART is completed
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +&uart3 {
>>> +     /delete-property/ interrupts;
>>> +     interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
>>> +                           <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
>>> +     pinctrl-0 = <&uart3_default>;
>>> +     pinctrl-1 = <&uart3_sleep>;
>>> +     pinctrl-names = "default", "sleep";
>>> +
>>> +     status = "okay";
>>> +
>>> +     bluetooth {
>>> +             compatible = "qcom,wcn3950-bt";
>>> +
>>> +             vddio-supply = <&pm4125_l15>;
>>> +             vddxo-supply = <&pm4125_l13>;
>>> +             vddrf-supply = <&pm4125_l10>;
>>> +             vddch0-supply = <&pm4125_l22>;
>>> +             enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
>>> +             max-speed = <3200000>;
>>
>> I suppose we don't need a power sequencer for this smaller,
>> tightly-integrated-via-snoc chip?
> 
> We can (and should) have it in a longer term. Currently none of
> wcm39xx chips have a powerseq implementation.

Alright, let's kick the can down the road.. hopefully not too far though

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

