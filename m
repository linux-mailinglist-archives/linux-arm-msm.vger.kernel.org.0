Return-Path: <linux-arm-msm+bounces-52422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3345A6E8EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 05:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0F917365E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 04:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB36C1A2C11;
	Tue, 25 Mar 2025 04:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNnC4RLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5207D64D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742877802; cv=none; b=kI8ZqmVhlIRcILvW8caiscg9P2fKFTNXyBwUaX+GRIzPs9iNEMBo3ePaXBzA3rTBsGJdiw4AQt/hXD+rXoddi3BYE2J+CRFfbKob9dGlmf/H4VPj7OT69Q2OCJL8gZ7rVDd3g02G9rwOSNuk9t2rMsllue+/YtjTeRzTg2LqNtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742877802; c=relaxed/simple;
	bh=SIXKcpBMIQGoLpI7fW2p0s99bbX903KeXkbaEGxXY64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=md8bpzWLN1wApgA29YPX8eFwEdG6TcTh9oMqmxQiUMZF12gLxoNU+m8Gm3HTkcYlmy+Q5AduDFbxiZZWmETOQg/ddvfbgrauFDONV6Lv7KF7K33O12YpF1opQtMre+3YpD1S83XESL9hJDgKTSwAg8sjwwmHfU+OzsDsO+fX9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNnC4RLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P3DUPs002982
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8rg16wpSQyfAsE/YtUxxFvRY2qDBDufr5ivHz9mkK9s=; b=jNnC4RLEs2ZKvOab
	/gdws6j4I+3nL8A63nPCl8Sh7gzusmIlS1tpiOowvyvcXEFhR0XLx4wlh9gynOWt
	HTGs0Wq0RGP6e2oM+GsAiWustpSZ4LwNsEjfnPfEoqUYf/zCib0p75MTP5qLo9iW
	7d6zOmtsUzkUM3pFxqmZOqip57wZt5ra6xEEqxb2SApwt5lnn+g3cm24EEsbpOea
	pgClGGIcyuR8gtWVZu0H2VlQx3pi40eIufwuUPZXMcv/Hg9gqRH9ykH5M2MzZqHe
	ZqBMQ62bn3iEVU8KoHUthu6+ZuvPDqYleil2c9tII7CS+Ne6YTBlR9GCH+yj42Wb
	XAnVmg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd30640-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 04:43:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2264c423e37so140483755ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 21:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742877799; x=1743482599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rg16wpSQyfAsE/YtUxxFvRY2qDBDufr5ivHz9mkK9s=;
        b=DSJEw44Fac4Sj9OkiwmkHPzDxrl1h9Bs0Yli9tt/p3Aw3q45t/dPrFkUG3mMSY+5pg
         oyvc05gbw87QeRlu5TSzJg+XOKPtvkSzAJG0lxUbKh31lHsSBRb5eC1Z5LCI8OlXYA91
         rAfCrzfXf8IIRttjD8heqCRjmsBwL98u8WuIOQ1Th0uzVNvDHrRKk+mgXP07IVf4552p
         78BO0KcFMCar3ZClhZbRSTebwsp3PBo+jylLoFGAMmN3w97MTmBZFZkype6s/fIorCxR
         eEDQqFwvM72doRMaqMpy/OCMz3oCt1Cb0XxTkbXOYifFkvOisqHkOIpwvc2Fl/qYkQtH
         WAfA==
X-Gm-Message-State: AOJu0YwYthtCvMIzjAolpgElNjIdpvNuS9EVKtXt7MeUW4exC6E0W9zJ
	hu3PQIIxk7CpaXjLlx8let/tymALqxHAhWfYzY+6QnALsu6O2ygnC2ek6EU+WCBEVEtbqaiqKuw
	bZkTGMInXIflHAWjIUMdE02cPUhbAqWXgNorhMIpDysSXQ5Ft+UWo7gKOqNqyKPXb
X-Gm-Gg: ASbGnct4RhGEHt8iV9pb3Y9HixOIZ8XPO19K4Bvmxx9succw6j5GUmVj/FCaL7pikr1
	b7zq7unolEHLnrRhheZlvScTTxg7jcu5F42b8vETiuGxGa4OUNaBQvMuLkRxEpbTqBRrPQ06HtM
	IapqXcRvuLGPKiXHQn6n4nF2c70hl0IJdZm9m8kQ0D10CCdBW2aA8eQtomYbksnQr9a3jxmd1tb
	4l3wdcDn9hcT/aJjeYwGggBdfbnndk++h0sKOk45Ktg6vqliff+MaJP5KX1/oQ1vW9nBUwB3iMH
	6Dqldx24QrxZru/vAeHjKQuMa+y883NCJzsGRNqwEFpmnw==
X-Received: by 2002:a17:902:d2d0:b0:224:1001:677c with SMTP id d9443c01a7336-22780c526b7mr205321265ad.9.1742877799440;
        Mon, 24 Mar 2025 21:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHhiFYkMAYAQ90q+e8se3nX4Nk3qVKNalr3u13o8pkfzAvJxAo67LexTL8yeMYxb1e286o3g==
X-Received: by 2002:a17:902:d2d0:b0:224:1001:677c with SMTP id d9443c01a7336-22780c526b7mr205320995ad.9.1742877798911;
        Mon, 24 Mar 2025 21:43:18 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061872b7sm8948785b3a.162.2025.03.24.21.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 21:43:18 -0700 (PDT)
Message-ID: <3bccf9a8-f60c-90e7-4301-8e10417c8107@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 10:13:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250322-perst-v1-0-e5e4da74a204@oss.qualcomm.com>
 <20250322-perst-v1-2-e5e4da74a204@oss.qualcomm.com>
 <2b038454-8994-490c-9d59-9bd03f52e337@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <2b038454-8994-490c-9d59-9bd03f52e337@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KcVnTpya3SpRl6iEy5JFX2RwqSzO07I5
X-Proofpoint-ORIG-GUID: KcVnTpya3SpRl6iEy5JFX2RwqSzO07I5
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e23468 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=1RYYy9rr-L5vwPXD2fUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_02,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250030



On 3/25/2025 12:45 AM, Konrad Dybcio wrote:
> On 3/22/25 4:00 AM, Krishna Chaitanya Chundru wrote:
>> Move phy, perst, to root port from the controller node.
>>
>> Rename perst-gpios to reset-gpios to align with the expected naming
>> convention of pci-bus-common.yaml.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 0f2caf36910b..6c21c320a2b5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2271,9 +2271,6 @@ pcie1: pcie@1c08000 {
>>   
>>   			power-domains = <&gcc GCC_PCIE_1_GDSC>;
>>   
>> -			phys = <&pcie1_phy>;
>> -			phy-names = "pciephy";
>> -
>>   			pinctrl-names = "default";
>>   			pinctrl-0 = <&pcie1_clkreq_n>;
>>   
>> @@ -2284,7 +2281,7 @@ pcie1: pcie@1c08000 {
>>   
>>   			status = "disabled";
>>   
>> -			pcie@0 {
>> +			pcieport1: pcie@0 {
> 
> pcie1_port0 (or pcie1_port), please
> 
pcie1_port0 makes more sense as pcie1 indicates pcie instance
and port0 indicates root port0. I will update this in next
series.

- Krishna Chaitanya.
> Konrad

