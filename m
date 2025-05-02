Return-Path: <linux-arm-msm+bounces-56512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ED1AA7404
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 622667B5020
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C6425522C;
	Fri,  2 May 2025 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBBuYMPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0834254B1A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193287; cv=none; b=cp6Uy8f3aTk9OzaLBS+QaoRftb21rMDca6m6j+QVGr9Lqm7rbuRc4YhYlXTZTAcZKYq8rMUa1U8K11dw3WgBYZXAF2Pn4mmTe5bJEbq4p4EyV14a3uiFDobeDDZ0loxQHYZRNp9Q8xkupUIVUAycKsNVE3bfRP1nLakdgKEzl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193287; c=relaxed/simple;
	bh=7ctWe9g+bFqInv1ZScTK1DftzAfA+fAaQRA0VhrX++Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V996VtX3gvq0HBVPscCc1kQRUEXBVRLc74MaEFoQGgIAqOiqcRCIFd+mtNXvSlzyhd5Smi95HKzBsfyI+QKY6Cps5hubM89+xPISpKtbXEV6xfwrPDiKd83dNquf6kAZ4pmRw94XpfTiBP+tOtBe1IYPaSjVHtvv2t+OF2BF0q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBBuYMPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N2pT015140
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 13:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRa0e6yzESCL53RBCKhEahi2ua9XrR9IpLFLe64y6t8=; b=XBBuYMPforHmAtBm
	H5FIgiWGFHx/rirNgvHm8uCpeP3+W5XiGVJAXgcJ196ov/SKhH53jJ75c410K0jy
	olIo9OcfhiF122ZpZZ7CCdCeBBWcBIWdpHCOGPOhdFjuR4HtChTx9daNEozpI2GD
	6unYvAglJlNodLjKJ2FFhqZwiYWfaokeucGYLum/IRvKEAwBTs5RlPRLBpM61FrK
	eOuC7/EJpiPiOpPzB2xZ6gba1pzo8a6akiCUJWig/l1yzoJLHKbNdAbH+cHp/Fvu
	Bm3YJLTfexs50TRYMp+z8w2pxLHuNzp7+883322cLXDiPv7vFEIlKniZxK+pgNcb
	yE4PWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0cfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:41:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso48563585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 06:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746193283; x=1746798083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRa0e6yzESCL53RBCKhEahi2ua9XrR9IpLFLe64y6t8=;
        b=mQQ7hY7teArej3tQU9uirSUbDZkMi73xXdidmppIKV4WoKXZrPGJ04+tH2VoMzHPNS
         pUnfK2vkqZQ1hvGcLkwAKB9U7bBzqAVvbw+XudUNDjDFUW2hwMZ6FgBrIEsfmGedVIvv
         JsUq265qvGUODMur6OvhSKV6LntZ8+87AwzEw7UvNIAmh8pmrf7QNALDB66vv48Buyb/
         b2DzQVdgP3GcjAf2jQ0OpVeUhdqX0mO9hy0Cq13+Yrsx1h4/MEEEsql6xEhIfhRXZNZ+
         Ug1iHE4M0rkYsVibj+W5zOzMqp7HcMoYByNbQcsUKk5ktZ0KVdZRDeYGJxrswZJv8Gha
         8lqw==
X-Forwarded-Encrypted: i=1; AJvYcCU6LSZqQ2eWhE1d3rQ28XtrNQa7O2MTUzSdMyz6zg8ekMWVZEkNs+HIP0JlAgnNXyCqXgTkOCgz1qbLIZmX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xw8Gi/ygurw5PsO3HEKZOTvrLltSFINvkhPw+5/JDDcgbZHk
	4raKuPdG2gE/4dPmcSDc1tno3iTlafk01yZBR3XvR3Mxs0mw/GMn29bFjfGCN965lVfldHsJ+js
	R1/p3zvIWmXWKIrskzIRoTcI84rGIRULsUF1NcnnSDlxNEdKhuDFD9fcO38lrwzqJ
X-Gm-Gg: ASbGncubVqcDGpuwiZs4vUQMIlazE+NdwfKm32PfyH2sf5vJ70Epin3ew5ibm4fzNU4
	Ao+Q0yItx378FAjf9sZYmSs76rAxHGpdtc0MUMyfUH/1ldWqFal6DwvBrOoRjP6gBVi/qOYVNqC
	319tSEDwtMBQ6Cr6TpDyfp99PtG9m4JN0vMtev49xYeOOVGLL4GVk0QtzoQuICrcXOJo8M6AH/c
	iE1M+dEygHOHJONfvTOLM+OjKgX0A7XRMIwSxGAVDcw+QW/g73WVfXvh+UYLCl4ZqNwQT0Bak/v
	164SUtRbBWudpomb03aOzD0vXPQlbXFeajicWCN80UeVtIVfVWPwyDUj8E2YCIGYUaM=
X-Received: by 2002:a05:620a:4252:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cad5b386c6mr117517185a.4.1746193283666;
        Fri, 02 May 2025 06:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfDTzMBbUFb5N3T6kjUkUukjjuCz2lS26RtjyWTZXBYvPjhKFgERakqZQ1lYamKTv/P1YcxQ==
X-Received: by 2002:a05:620a:4252:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cad5b386c6mr117516085a.4.1746193283175;
        Fri, 02 May 2025 06:41:23 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0363sm50718166b.121.2025.05.02.06.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:41:22 -0700 (PDT)
Message-ID: <f6d9b03d-3870-494d-b97f-b0487927c9d3@oss.qualcomm.com>
Date: Fri, 2 May 2025 15:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Update PHY settings for SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
 <tqzmof6rq7t7k3jbdmay7dplz7el3c6i3ehesdiqnp7iq5f7ul@3lnf3awj7af5>
 <CAMyL0qMQCGE-JNwTjqJk8TrGLBDr_1W7Sv_nECkW9Xp1fXgeuw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMyL0qMQCGE-JNwTjqJk8TrGLBDr_1W7Sv_nECkW9Xp1fXgeuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CFTOgDC7T8rj9QR38y1X9BC_NrVldg4u
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814cb84 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2aamsdQwrFB3mmDgIHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CFTOgDC7T8rj9QR38y1X9BC_NrVldg4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwOCBTYWx0ZWRfX72EoSRgzKOSu 6+xO9EznUs+NaCInkBcOO2iLHe8emZWPx98GphishL5yjKAAipdLY4eDjlsgOXfO+WcsuYdhnGi VY3rEDuDE1N7qdUTGn1g6bz5oxREqQZPzH/4MZJwQVNUx3K3I9GxQQESXOvWqvhEii/msUEuRAF
 pk/hXDHWY4DeldB8i3YmWhHXSwoMbLAIUaQfxDPio/zwm9axZiSNQJEjTFmlyo255RxHzFH8tSd FMBftlhgrXK0DdnWAxRNd+oSZeSZY65GuBXKlEIxpj7G4YArQSgTwfjXqrhm3YTw2xAcWYIJ5Bf rvZYj/Y1k5Wzb9o7t1vetRdoFX7OyY1mA1rvOazoWuk3mkrAP237Ol0EV4TlOD9PJOQTxTpOLrv
 EsNYc878asTaSwQoUSFP2/369RGJ38Ec9UIZdyYzcOb33aPy/ZvYVxFHaQ/5Qq11kKs+VgQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020108

On 5/2/25 2:25 PM, Mrinmay Sarkar wrote:
> On Wed, Apr 23, 2025 at 7:07 PM Dmitry Baryshkov <
> dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
>> On Wed, Apr 23, 2025 at 04:45:43PM +0530, Mrinmay Sarkar wrote:
>>> This change updates the PHY settings to align with the latest
>>> PCIe PHY Hardware Programming Guide for both PCIe controllers
>>> on the SA8775P platform.
>>
>> Please read Documentation/process/submitting-patches.rst, look for
>> '[This patch] makes xyzzy'.
>>
>>>
>>> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89
>> ++++++++++++----------
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>>>  .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>>>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>>>  5 files changed, 66 insertions(+), 41 deletions(-)
>>>
>>> @@ -3191,6 +3194,7 @@ static const struct qmp_pcie_offsets
>> qmp_pcie_offsets_v5_20 = {
>>>       .rx             = 0x0200,
>>>       .tx2            = 0x0800,
>>>       .rx2            = 0x0a00,
>>> +     .ln_shrd        = 0x0e00,
>>>  };
>>
>> This does more than just updating PHY sequences. ln_shrd-related changes
>> should go into a separate commit.
>>
>>     Hi Dmitry,
>     thanks for the review.
>     Actually in the previous phy version there was no ln_shrd related
> register write.
>     and only one ln_shrd related register write introduced to the latest
> phy version.
>     so introduce added ln_shrd with phy update.
> 
>     I will add a separate change for ln_shrd.

I think it's fine to change them both in a single commit, but you should
explain in the commit message that previously no writes have been made
to that region simply because none were deemed necessary.

Splitting that into two commits will give us an unpredictable programming
of the PHY, where not all parameters are in sync.

Unless that separate commit would be just adding the offset data, but I
think that's form over function really

Konrad

