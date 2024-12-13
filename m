Return-Path: <linux-arm-msm+bounces-41957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0ED9F0933
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4C6188BCAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990DB1B415F;
	Fri, 13 Dec 2024 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+Ajp6lA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B241420A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084830; cv=none; b=Ou9vmKDY3hS4Cz2zhsKxmSdxhnWTjvleeQMgGw6qqPpj+4N4p78yzu8vXopj4g2zX8Eiqi44qFd7+5tsJTQLGJDaDl07TKJovXfzw0YpfgjcI241rRs8Xji/KqlR5vl87jkTnI6PBuU7BaOxMMNPK8rxh9kk1ENNvCNcB79Foj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084830; c=relaxed/simple;
	bh=jV0gUiWcMRsqOoOIjT1olcLqeVtC9DuU+58/yi8Z9qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2uMf1EgPxZr7Fi9gJj+YOUuQ6APyk8i3QaXvSreG34QkTD8ToUTjhQe+OHltDG28VT4LGQnkuFtKcZOuPJnVldJL1t9cKoyMjIajFHChc+FI/ZV9pq3igqLQREKkumuxe/olPb7mGSmIwBF7YqsZmPIQUgHt/wADkuJe4VXKKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+Ajp6lA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8I4K8026835
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nUm8oLabsV1qJq3TKFmlTydmFh/ikxL/g0ApgTD594=; b=B+Ajp6lAxCMjxbbG
	U6dnQcdqF/0wMvfDVE3GICHQCaWqGVbm890xstYz4dknGd3d5T5W0gf//CX1o6aU
	ko7C8/x4O2MKFBirxaltctj02Mw4RHfJGsdugL8NL6M4/KSite1CI/czvdd3Sve5
	AUQMSbB97z4lX2GNmzkf6RenR5VppFtr2nCdNQgBiZJnpCtpo5esZ+5d9IyMxCdZ
	GFVeZCTftE/0UwySVLPM/2bm69U+5LG3iN/pVw/VuXzaiSoIjT1SHTwr0ugW1ilc
	qHh9QpIveHqYPW1cjMy1OvJfTlZjdtqAbOrQ61ae7uo1tAXJNBdAZf8M0T4t8Ss2
	qPaZag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40nxmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:13:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46748e53285so3209061cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 02:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734084827; x=1734689627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nUm8oLabsV1qJq3TKFmlTydmFh/ikxL/g0ApgTD594=;
        b=IjadBYj33nYLiNuqjyfBZAN6S8f/OekXGdzipbRgrZRtIlDiEo0dc07GCRn2eutDlw
         KUtiiKLt1CCEW07a5qyd2XGUjPSQN8KcLd+2Xggvzo2IhSXYbQJQjalsnJ2NBcStr2gp
         tKeI90keGfTlFYLrBwXyMz5r/nkuKr1+GRlkulLpE4yY23LNZmlTpJ79+ZI2WuRP0UDe
         cf0GtRD8Y1YjsHqBAhNOac172a9/0vKXPRV3pX1FEwDa2YTsaoN/Yw5ZwaNc7AwWZIRc
         kAj91s1hi8sC8TldJX01su4iFpLlFEsWgDDdHugiXoY1VAXCXRJ2miAn1J0Vwm9fTuMg
         fhIg==
X-Gm-Message-State: AOJu0YzNP3y3Nct7HDZVb4efpUV2C7+Fyj58PgudB4ASgcYvdMPfq7Vk
	G0YmjkKQWp7o4bKnWOacFtsoj8buwR1l+htZDl2KWQFb0dFUHwF7rox5RvjqGBPKhakCWjItrVw
	cknKtX7KKUGRN5cMr5IPKzOxqxKjEc9bDGbvziR3VjYmNpQlrGBSgXonipZAjoExd
X-Gm-Gg: ASbGncvLWpMss/eKlCSMmw5smjY0SYFmpn/aG9YrZ5r7po5+kjxF3wOeukN3h6pI6Q1
	QPezjMw7sRUIJpQpt/FQAvuzTxU19h2Gc7QWA48XG1CFL5PoIAVAoNLUIWhKfhy3GgmzoJ8iQNL
	SgDcJs9VtLX01El3MriysSR3KzvtIDnfo3DRTumwArSt3TATwOhj2LebZRRwz1EdcBrTfnYvSPG
	VkCi4joJk/weduCz/t9MKmQEGm6sUmQI9O1KKpXTS/TF72OuD0kxA8aDVzsjJtKA4Y2LV2aAOYn
	VZHA2SWxOBznog8C3YzEji4grJa8KaIilNo6
X-Received: by 2002:ac8:5dc7:0:b0:467:885e:2c6e with SMTP id d75a77b69052e-467a573441bmr13879101cf.1.1734084826600;
        Fri, 13 Dec 2024 02:13:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxaOjgUy1JAarpLCgxQumw40uPOCXOrWpCd82fp9aJ58XJJIwUpHLC31vejPCEBWaDxiXvnQ==
X-Received: by 2002:ac8:5dc7:0:b0:467:885e:2c6e with SMTP id d75a77b69052e-467a573441bmr13878971cf.1.1734084826219;
        Fri, 13 Dec 2024 02:13:46 -0800 (PST)
Received: from [192.168.58.219] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68c4e3749sm662769566b.154.2024.12.13.02.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:13:45 -0800 (PST)
Message-ID: <93c75fdd-c09e-4fe3-b79f-fea8cd08ec0b@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:13:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight nodes for QCS8300
To: Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241205084418.671631-1-quic_jiegan@quicinc.com>
 <16efb6a8-ecaf-4097-ac5f-368ebab177a8@quicinc.com>
 <25a410a7-2418-45bd-be06-3672a9fb1928@quicinc.com>
 <04d23c55-9167-4e8a-9e5b-6dcf66b02b8f@oss.qualcomm.com>
 <409678b0-339e-4d93-86f1-117d358a2d33@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <409678b0-339e-4d93-86f1-117d358a2d33@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qbaK8SDaiF6GQRa_vKcNVpf0Rq9hPjTq
X-Proofpoint-ORIG-GUID: qbaK8SDaiF6GQRa_vKcNVpf0Rq9hPjTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130069

On 13.12.2024 2:42 AM, Jie Gan wrote:
> 
> 
> On 12/13/2024 8:35 AM, Konrad Dybcio wrote:
>> On 9.12.2024 3:01 AM, Jie Gan wrote:
>>>
>>>
>>> On 12/8/2024 12:28 AM, Aiqun Yu (Maria) wrote:
>>>>
>>>>
>>>> On 12/5/2024 4:44 PM, Jie Gan wrote:
>>>>> Add following coresight components for QCS8300 platform.
>>>>> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
>>>>> TPDM, TPDA and TMC ETF.
>>>>>
>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>> ---
>>>>> Changes in V2:
>>>>> 1. Rebased on tag next-20241204.
>>>>> 2. Padding the register address to 8 bits.
>>>>> Link to V1 - https://lore.kernel.org/linux-arm-msm/20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com/
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2150 +++++++++++++++++++++++++
>>>>>    1 file changed, 2150 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>> index 73abf2ef9c9f..eaec674950d8 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>> @@ -293,6 +293,18 @@ system_sleep: domain-sleep {
>>>>>            };
>>>>>        };
>>>>>    +    dummy_eud: dummy-sink {
>>>>> +        compatible = "arm,coresight-dummy-sink";
>>>>> +
>>>>> +        in-ports {
>>>>> +            port {
>>>>> +                eud_in: endpoint {
>>>>> +                    remote-endpoint = <&swao_rep_out1>;
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>> +
>>>
>>> [...]
>>>
>>>>> +
>>>>> +        tpdm@482c000 {
>>>>> +            compatible = "qcom,coresight-tpdm", "arm,primecell";
>>>>> +            reg = <0x0 0x0482c000 0x0 0x1000>;
>>>>> +
>>>>> +            clocks = <&aoss_qmp>;
>>>>> +            clock-names = "apb_pclk";
>>>>> +
>>>>> +            qcom,dsb-element-bits = <32>;
>>>>> +            qcom,dsb-msrs-num = <32>;
>>>>> +            status = "disabled";
>>>>
>>>> Could you please provide more detailed information on why some TPDM
>>>> nodes are disabled by default while others are not?
>>> Some of TPDM nodes are disabled by default because the one of the following reasons:
>>> 1. TPDM device are designed to generate HW events, it needs a clock source to read&write its registers. Coresight driver cannot control the clock source ouside AP core, so those TPDM devices without enabled clock source will crash device in probe.
>>> 2. Some of TPDM devices can't bootup with fused devices.
>>> 3. Some of TPDM devices have known hardware issues that not resolved.
>>>
>>> I put those disabled TPDM devices in DT in case some of them may be "fixed" in future.
>>
>> Please mark them as
>>
>> /* Hardware issues */
>> status = "fail";
>>
> 
> Maybe I should remove these devices, to avoid confusion. Is that ok?

That works as well

Konrad


