Return-Path: <linux-arm-msm+bounces-46764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B463A25BBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A5481883C54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B20205AB5;
	Mon,  3 Feb 2025 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crCbTKGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107921FCFDC
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591419; cv=none; b=VekXwFXBHgrU62T6QiFFa5O+CHEdbwa87X4CKF/2zIA2w5H87mui+X6OBe+ot87B6tZOqpvxuv+42SYQr31BXdN+5CKGihordzzDBMU44KR+b60iFqoV2sBD3PBTEjoQbr2jpbIlRDZhnUJj3u/mXh48sjr+dVABF6qY7czWUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591419; c=relaxed/simple;
	bh=dnnLSb++p2YFGzcVrLe7pEE0s+usY7hFu7uZhP246Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qw+icBmieuzd6Kq/9o5y//Or7Qq8Q0yRkKl3qr5Afg+jJ1txnGn5oGt71B+qi8/rdrC6ZGFl4kNL2AH5wp4hYoolU005hS7tcHB4bP/cbJkhliX8Y/cIGR+J4WeYLcF9eAXz8a2KBBFSNX0F6SHja3E4V8h61hPbJkV8W/aTXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crCbTKGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135ltPd008189
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 14:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+3+UEinH9HlKOOW1lKmNQkdlLJQcZh9QqivHjlVeGI=; b=crCbTKGeSiXWUV8A
	eEMkHTdbA296G+Qe36MAbeerchdhi/IxCegBKF/zW3F6UCQwQM/azcyVir/LD0na
	sI66fPipmwpyMGivDDlWPJ7bcGWDBXODr2A56R6uwk8lMDa1HuNq79RYq3i0SKFg
	7C/xJTYRj8l8/zw7tYMwip7KNEaztcQQSSviObOfns9crUOotMbIGW9mxBIPC6Db
	ElSwzylpg8cLZlxER/HMVWgcgegqCK14e8rBqqAtMpvlZTKNH7xi5kn3kX0IUscv
	lTiE3ozezA93Y+OfUl7V6cN6ujh4noHKJ4Cyjr4Dh0qXqWKxnTFSDviLVoYuY4pr
	93NqcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw1a5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 14:03:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ea8fc9acso43555985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591416; x=1739196216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+3+UEinH9HlKOOW1lKmNQkdlLJQcZh9QqivHjlVeGI=;
        b=IqLbdsyi5bz6OwvzKSeqY19sBnxm2h+C0kt66vYjin4GkdbuC/YH6EQokiLSL0UmMb
         740G2QWDUl/lBOhJThLpVhKnZs8EPNxO5BqZyf2Qs1NIAs2Mzv9cbzmKEC6jLmuL0aZe
         P5xkZ959xYrul0W3kYaMI5Zto6k6gYoZmEQ2JG8g5XJ70ls0ZvINCpESfLiOVkRi62iU
         VurbEC+gTRBje/9zSn6o8m0p31YC+c/hnVsisuKFjvSICyOQPkKPHFhURnPmH34J4Mvf
         SZe0eZ+1juMPV4w4Gl15JrhHpapudolnbbh+Fgp/WVIHCjbr/dGNfmNew2P0bN2egdBp
         2RkA==
X-Forwarded-Encrypted: i=1; AJvYcCXBFA2sAqZUejsCaP+VbDcL8zEm/YIilih9z7dSrSykgo0INsnHOk/FQ0cPjWHx8jQPhFPRqnx1E103ZgP7@vger.kernel.org
X-Gm-Message-State: AOJu0YyPhAbzdy19LDnyuhYQYwf14KR9V7Y72DveRGoP1xPuQcJmAhFg
	g+b4TP0yjmZ7ROecrdGXQJ6CwRda5f3sLc2tLjYq/q86Pd46J4i3OzzD9rhTvrIICfeYEbHeS8W
	yLHe53FQc1h5t4FcdntLbWQGbWwbnp3G5MupdxwoEaoH/YD1+BI8rpEZJR8NeRAFk
X-Gm-Gg: ASbGnctsLtxPwWNn27h9tvNYYzF5hm17D3Y5SOg9gEV3ot9CSv1zCzqiuC+EvSmGJ0c
	SbWNM1LOBAYUTlzRCOadLcxh1746wEdC5gddc/vsy71300DdYU1XebPILn7oBrTFOdYMSeSoQcm
	1+Z6QFXeB85QQxVEE6Kk9Pp0QBNPk4hmaCXnB9AQWxYqoM04NBdhA+/O3yzrhJmW2tludHHc4Zo
	Nxv2igXQjRFEntYCdLCnN+rujDoItGFjX1jbgdwrd64DqoiP7mc2S159P0MRryk7oHZ860w8jVT
	XrPdL2szUT4rLJ69fVGB9hX1TCQEHtOsNAiJkr8gx+t7MBmm5qAXlLBF4MI=
X-Received: by 2002:a05:620a:2686:b0:7b6:d65f:cb6a with SMTP id af79cd13be357-7bffcd8b180mr1178988785a.12.1738591415955;
        Mon, 03 Feb 2025 06:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuccZd+8SqpIVkFwAnkdbqSvt96BeRFug5Xkne0FmFHcRaIvwsaqXDKDQ1GEvc7j02F7/j/A==
X-Received: by 2002:a05:620a:2686:b0:7b6:d65f:cb6a with SMTP id af79cd13be357-7bffcd8b180mr1178980085a.12.1738591413895;
        Mon, 03 Feb 2025 06:03:33 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a5621bsm774180866b.172.2025.02.03.06.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:03:33 -0800 (PST)
Message-ID: <636c4822-34c2-42d8-a434-ecec589a117e@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:03:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcm2290: fix (some) of QUP
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-4-6797a4467ced@linaro.org>
 <d5e1e6ae-b773-4ec8-a66b-2e1830827164@oss.qualcomm.com>
 <CAA8EJppMVzuRLLakNJd4M9MRbW5P-0x=rTf1p9kj0zj88SOOGA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJppMVzuRLLakNJd4M9MRbW5P-0x=rTf1p9kj0zj88SOOGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JFPqAbdVi7MkK3K3VOiH_liDimOkRmfr
X-Proofpoint-GUID: JFPqAbdVi7MkK3K3VOiH_liDimOkRmfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030103

On 3.02.2025 3:00 PM, Dmitry Baryshkov wrote:
> On Mon, 3 Feb 2025 at 15:50, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2.02.2025 1:16 PM, Dmitry Baryshkov wrote:
>>> While adding interconnect support for the QCM2290 platform some of them
>>> got the c&p error, rogue MASTER_APPSS_PROC for the config_noc
>>> interconnect. Turn that into SLAVE_QUP_0 as expected.
>>>
>>> Fixes: 5b970ff0193d ("arm64: dts: qcom: qcm2290: Hook up interconnects")
>>> Reported-by: Konrad Dybcio <konradybcio@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> index f0746123e594d5ce5cc314c956eaca11556a9211..6e3e57dd02612f3568f07f1e198028413f463c69 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> @@ -1073,7 +1073,7 @@ spi0: spi@4a80000 {
>>>                               interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
>>>                                                &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>>                                               <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
>>> -                                              &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
>>> +                                              &config_noc SLAVE_QUP_0 RPM_ALWAYS_TAG>;
>>
>> Still incorrect, this should be &qup_virt SLAVE_QUP_CORE_0
> 
> Hmm, why? qup_virt has its own path. I think this one (using CNOC)
> matches the usage on other platforms.

Oh hmm.. you're right.. very confusingly named..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

