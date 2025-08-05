Return-Path: <linux-arm-msm+bounces-67786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D7B1B41A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 15:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18A8182724
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 13:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1EB2737F8;
	Tue,  5 Aug 2025 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNFfABln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55BB27056B
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399295; cv=none; b=V7PWribvW+DZuysU5i3pevlX6qWAciRC8/qjRd/Ls3pxx6fZ4yvNp7nganLtzDg+xjeQkn21KnzDedHebCU8Q9ex6hoe/Lu9VHaE9Wgw3+VyVZW1ly6D393W4tGmW3s+wkOBACt3iyEdfhLmovhF0YYaR+PNYoAc0MjyRDBAI04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399295; c=relaxed/simple;
	bh=XMQ/CjpHTQ625oN346Fj4oJVA2n+W7fLJLcl8OfHgdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3kZNi6HuZWbPbcA0mf9gh5HfqxZgBnZRigt/Jky5aTRUOCTPPNEbyTsgKTzXi/mVA5Sd8FKyKuaVlWND5qyfBtr3qU9p89kjQoQtASSimOD52ija7fjSzwYYw94yivJamGnO+D0AzLwNsR3O3af8ySXcqXrFokef6UfjkrpyAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNFfABln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757FTbW003583
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 13:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V1RinYJ//EKx/XDr4zrnDSZd6gtIJfrzcdr6MQbb4o8=; b=RNFfABln/8ZBwmeo
	YpNeLxPvSeiJYW8CKNyoetOA57j/scU5Z6xZZn06OC7ht/+oH31RtOlYcJwK6ZfU
	TLROl26OBvFQ5IJQy9e6uBexblAfSZvfSsCMNVWSnF6AQnGOcWV9eT78PQdAuIou
	OLCmNVo3H26WhY0ehdIVh40ErOemT0tOpLK8DFDNFsiK6sqlqdxAmDvatsrtTcl2
	WgKy8QkPZgJqJC40eFC3J3lWIP6wVCBqitFJzfX8NYY4L9CuUWfLTix9vIzQAb24
	p31E3hFfemkLV4wbMCru+C6bICAercOjuJhb0eOsUOT9kG0LA5ZhMzsZGrQgyzi/
	XQn+Hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b3j3teke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 13:08:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33e133f42so132453485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754399291; x=1755004091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1RinYJ//EKx/XDr4zrnDSZd6gtIJfrzcdr6MQbb4o8=;
        b=iatkPOv8GhHUHj03mIwSYglJcsUdS5rSSY/uN2plkDzIhVuvV78NqsMhmoIi6n41Hj
         e9YqzasuFx+2iupNJja2s2SNXGUDl9NGTkHiwze4a4/CXnsR/IDFsFnOVztiB+TQ3vzJ
         aqXFAUsv5SCoYYU+We2EQCbtH+ZghVDTnpQzmx6IgIWrjZPZJ/g4idZkWX5baXNfF/qL
         0ULch5jqEZQassaTOsCsmAQXzMhbqTbVAYit963ebJSICIyfK8sWGv2VwEfjPuqWVVOG
         3qVnvdSyiwSp0kl51QFsCFAAPVO7yIiMld8gTfxJcC6TK+uekwgroeaknFZDH0H4GR6d
         A6RA==
X-Forwarded-Encrypted: i=1; AJvYcCVddxMEyvAXZvO49eMd/w7ktGrvIXd5jT1Mlck4cvPN18uu3w1zHcmnNnCOLT9keR08siv2itIfnWMfsdW3@vger.kernel.org
X-Gm-Message-State: AOJu0YxBqHncSpq9oPxvywNGw8bbg4Ze7xw2xdiFzvRalCqbOQhqYEEd
	s3ANArHaUEXZH2qVzPN130NhDIDZzV5G7BNq8Iu82S1NNrw2GlXC+LhO0KVPy+YgAiU70xsGAl6
	kU7MBeOKjmKXJ3A2LnyCswUgCCn2DO/kTKN6Wu2oGp1zR1VzREIbVk3AjtbxE+ydwGrli
X-Gm-Gg: ASbGncuZUcdc9XVStM+jAhPRyIvSTIRxBkEQSMZxfpleiJGwe2JOqjWvnTMSyeoLIsh
	JAdxo+BRqmgJSLAgjEz1r09xAf/Eo76yXtjdx312mqe2i2V03dtODtdGv2kqTjRNZwFrEEeZdjG
	cB2hja/Ppgy1OhKhbTJs2VXFekrZpE48M7ymmDPaP33xBf7DTLBxffyQKWBbAfYdKkwJ07vpuJ2
	Pj6r/Pd8zmPdvf7PAB95jZ3WbFqLOVli6z9as15ZmkAv4C+w4MnCHp9pgzu92kp2+MujdIV8zwk
	Fn8KnrGkXdniIv7Lkf4z+vVLZlcImlWSRgIh+fHJQE6F1BacJ0VLcd7IpAFMTMZtVVVcMHU6TSX
	MlPPnFXWI64o1kiHIBA==
X-Received: by 2002:a05:620a:3703:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e69627a8ffmr993276785a.1.1754399290872;
        Tue, 05 Aug 2025 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzNz3BICSPsbshnHOdcR51KGwLa6oOSI7DAskcW2OrM/K4xCPKDoMD/yMxAl4j9/+41ZoXKw==
X-Received: by 2002:a05:620a:3703:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e69627a8ffmr993273085a.1.1754399290302;
        Tue, 05 Aug 2025 06:08:10 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8306sm911353866b.83.2025.08.05.06.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 06:08:09 -0700 (PDT)
Message-ID: <5d5820c5-463a-4fa0-8ad9-21b75797aaf9@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 15:08:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <lkjp2353athoi76h3j3bgkcxdwfn6akcyyweipt4g774ztmmer@vcw7ru5red3n>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lkjp2353athoi76h3j3bgkcxdwfn6akcyyweipt4g774ztmmer@vcw7ru5red3n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2o7tNQwqYtQtQMK_GtEw7CAZJK38nKg6
X-Authority-Analysis: v=2.4 cv=TZ+WtQQh c=1 sm=1 tr=0 ts=6892023c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=36rLTHuftK6yE2Nq2w8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA5MyBTYWx0ZWRfXxVe+srrjvkvW
 Yj150KZa0Sdgr27B+DaV+UUkBviw5ZP+fSd4JxZ1xrVB7t3tF0TvO3DMnLXMnv3dZ3qlop3ykun
 MBY8QosKaY6YdUVw3te/hP1huq/w2G+AzGJ5iC4h9dND7U+2BnZs5TvuLp6osn13ALvSjBJSN6Z
 POslg3MAvA9DWY5cLFKCGJrtJ7ZXxJABa3sfCrj7BiCb1hSGoScReuiUCGko9XWU0P6I7sK7IE/
 2y3db2xxE5gZTUxdgElE0pJvaoy+ktCsVPvZEheCPTaMS7DiUrbJ5bqwYjW099/DdCJpkolPvfr
 UrT/hqsQJNS7HZNpD0F3Yo1iu6j3oSBC2gn/untV7eyveyhUgYGAqtbJyPo6yeQa8YUbKEubKwV
 xgFfEOfoqxjPY386UojreFAw7FaDRJWKgtmbFPpL+UdJPmZfSHKlopTIi3x3VgVXIuviIeQO
X-Proofpoint-ORIG-GUID: 2o7tNQwqYtQtQMK_GtEw7CAZJK38nKg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=786
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050093

On 8/5/25 11:59 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 05, 2025 at 02:49:29PM +0530, Sarthak Garg wrote:
>>
>>
>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>> The kernel now handles level shifter limitations affecting SD card
>>>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>>>> capabilities in the device tree.
>>>>
>>>> However, due to board-specific hardware constraints particularly related
>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>>>> in the board DTS.
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
> 
> You missed several devices which use SM8550. Please fix that.

I would be in favor of making this addition in the SoC dtsi and removing/
altering it on a case by case basis, since as I explained in the threads
of previous revisions, the fix for the limitation is additional on-board
hardware

Konrad

