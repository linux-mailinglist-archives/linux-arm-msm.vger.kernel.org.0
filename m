Return-Path: <linux-arm-msm+bounces-41779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F39EF099
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0341818985BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465882397BE;
	Thu, 12 Dec 2024 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HuYk0AgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82A2397B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019889; cv=none; b=hq2VlgiM/k3jQN9HWOFL/HeEOKoPgXMOh9qkMfKc65SYqGXaHJGFCuBzw/jfBAaJ9caNHZ8LcECa9jfuhFT3wFSF2JDZ9Fr3KF3YfWjyzk0v4efWjIJF2x2A2RKhoNvWt4/6LnD6XHbfTP9xHcJ0Ma5HJDyb2u+v43vSRlmmnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019889; c=relaxed/simple;
	bh=dXF5alr3nkA4sLYcx0ahBi1JmELs74mAg4qLTyQDK0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qd9PaZWLeBwDaPwPaJaSnvIZPG8B3rTOjlrTK0mGvym9a9yUaJBzgSPeu/lz8myUYtteiLavGhwt+lIQ2Y1tdlI4XiBsh0DgfQX3oYjrbzE4E0dhZUbYgDRY5TAyjqdu+UNFTIyy17ap/cEFD+gf8X4ASSG41hq7FS8SzVLWK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HuYk0AgO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC87Fqw029009
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiOSCtICkfmA4vxytEAY623sRmhmgOgepKEKhIeGLBE=; b=HuYk0AgORhC7WmiX
	RUNFGvuNWjFQ1qX65CY8SVT9ojxODbmVnAxqQKRainhNLGy5dRD0XhCxAAXFD4rH
	8yWLoVYDNqMycld45sFwLGVGnDiT3UzzkK6ag8tm+NA1ir8CoA/6n/tnCHh0u3iF
	xUTM1NP2c5VyMJLuxy20CYpGx9z02PlICXgdA9m2rosibB7AVW7gtJlRymsDvJ7l
	3J+NE5geetgjFs0q2hEbJyVHsRCOC/IcGjEGvCZxPbUP1hQg0T5jMUjh6aAiV0s1
	u2jVZt2OPw5AS2VeTqzwbvFKPXi8wGxANXcCamDODhMurkt499oljr6KyPJ5EfV0
	26Ib1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuhur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:11:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467616df6c8so1406271cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019877; x=1734624677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiOSCtICkfmA4vxytEAY623sRmhmgOgepKEKhIeGLBE=;
        b=E62DIkMLS+aUhUPyKsQsqQSWf7Bw96JEgOhg3EDNqm916+emLFjGFKkfYjAuFTT4eR
         ZqIkBO5Ql87drsYabugyOiNbGX64mOWoOGKAyspxQ6DK9CDPHEJhPtc7KJbNlTGOKOzY
         sMLcrXPrL8OlytUV6NfAMhBEW1Ogdb4MVNoRyEhxEj45o+hiP0ps6nrdIieUKV0sSFgw
         GJ/BGtN3yk3ouvoG8X+y/QyJY2TeYeduwNo0+ezUd1hi6qbmiODbRslzsjypCRXfJCeK
         W+rQ+nmZ+OGF2c3LIZ86SQ6GMro7Nqs1OOkn2h7m5TmwGkJcwtanUPx3yHtPBBkyMHi6
         ufVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXysvSeFPJfLL8holW81KEOcRqsWGM6bjCrgWhASXZdpZRrzwhEM/UzhsUL2KN/WbFbgp2MOlclTy8xsZb9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw67qRCg/n0vF42WBsGgCpAEol1AHpo81G5DTSQ6g5A8R9Dg6D1
	IjteAGvdv0vUL1/6/O8RRZ66q35oGd4liqb3eDkOxjIC9kaKgaF5wzFh48d+whjN9v1igVEyi0j
	7IvwSzyJlX7p4hb9qyBkBw4LrnEWyt++lK0irnZVBRxGrsocIecheWiLOY+8oJPAB
X-Gm-Gg: ASbGncvjns+sR/ZoM7Yn/ZU1V+dreM1+9zMqfHHc3MdcqFJYoaToxyRJwZG54GMdm+j
	Yk2rxdCp421TKaIT1dfkeZxCFXey37UZhOjnVOy65JM6bb/qgAqCTRK0v/lmd4i+nRbqDWV7+lm
	F079E++jTjtuRSCeJkOvHt2DUIwwBiuk5Pmi2lEQZDamB1nLilJweaNC/5Vwozcyjxzco3vU6Z0
	mcUiWbBCs1fK7CxVY5Ipaq6Ukvzvr8QDcbK+AExKJ0IOH2e0KeJU+DRoaHU26msazrlXVKNvJAP
	IFjvy0l+PHDqFGdeQYSr816uM4MhosV2caKKtg==
X-Received: by 2002:a05:622a:4d43:b0:466:8e17:cd1f with SMTP id d75a77b69052e-467a14eee88mr5930001cf.3.1734019877225;
        Thu, 12 Dec 2024 08:11:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXG4K2xpTGfNJ6S6PvXxb4g2uE22kte381m+d1ycbDxgdpkjeTWw74mGy0LyTdNM54e5Jl2g==
X-Received: by 2002:a05:622a:4d43:b0:466:8e17:cd1f with SMTP id d75a77b69052e-467a14eee88mr5929771cf.3.1734019876722;
        Thu, 12 Dec 2024 08:11:16 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7991a5sm10426669a12.58.2024.12.12.08.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:11:16 -0800 (PST)
Message-ID: <e8e438b3-f60d-4257-956b-a9c77496bf8c@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:11:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs615: add UFS node
To: Xin Liu <quic_liuxin@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, quic_jiegan@quicinc.com,
        quic_aiquny@quicinc.com, quic_tingweiz@quicinc.com,
        quic_sayalil@quicinc.com
References: <20241122064428.278752-1-quic_liuxin@quicinc.com>
 <20241122064428.278752-3-quic_liuxin@quicinc.com>
 <d4f7ca97-b37e-4b8f-918c-9976e4a9cf41@oss.qualcomm.com>
 <677251eb-d3c3-48e1-ba79-fb8ec1e29c6f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <677251eb-d3c3-48e1-ba79-fb8ec1e29c6f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DRBQy2GDkqWNgZOYavfJp0NFkaC96ql6
X-Proofpoint-GUID: DRBQy2GDkqWNgZOYavfJp0NFkaC96ql6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120117

On 9.12.2024 8:56 AM, Xin Liu wrote:
> 
> 
> 在 2024/12/6 5:21, Konrad Dybcio 写道:
>> On 22.11.2024 7:44 AM, Xin Liu wrote:
>>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>>
>>> Add the UFS Host Controller node and its PHY for QCS615 SoC.
>>>
>>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +            operating-points-v2 = <&ufs_opp_table>;
>>> +            interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>> +                    <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>> +                     &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>>
>> QCOM_ICC_TAG_ACTIVE_ONLY for the cpu path
> I need to ask you for advice. I have reviewed the ufs_mem_hc of many devices and found that all of them use QCOM_ICC_TAG_ALWAYS for their interconnects cpu path. Why do I need to use QCOM_ICC_TAG_ACTIVE_ONLY here?

QCOM_ICC_TAG_ACTIVE_ONLY instructs RPMh to shut off the interconnect
path when the CPUs go offline (without OS intervention) to save power
and bus bandwidth.

It's the natural choice for paths that directly connect hardware to
the CPU, as nothing else should be accessing these ports.

Currently, many platforms do not set that, because nobody cared enough
to point it out :(

One day when we lay some more groundwork on the suspend side, I'll
send a treewide fixup.

>>
>>> +            interconnect-names = "ufs-ddr",
>>> +                         "cpu-ufs";
>>> +
>>> +            power-domains = <&gcc UFS_PHY_GDSC>;
>>> +            required-opps = <&rpmhpd_opp_nom>;
>>
>> this contradicts the levels in the OPP table:
> The required-opps here corresponds to opp-200000000 in the opp_table below. Similarly, I referred to sm8550.dtsi, whose required-opps also corresponds to the opp table.

What I'm saying is, specifying required-opps of NOM here will make
VDD_CX always stay at >= NOM, because the vote is max()-ed

Konrad

