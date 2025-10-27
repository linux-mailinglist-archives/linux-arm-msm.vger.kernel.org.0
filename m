Return-Path: <linux-arm-msm+bounces-78854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F5C0C89C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08F319A1C8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F9A2F6924;
	Mon, 27 Oct 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ngt45IGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9D2F3C0F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761555290; cv=none; b=IPyblNCmYQIHNBT2pGdiTiyiJu67i+Aof2kVhCFfZAc3h1GqOFxLxUKaQ0EebjamclRHD9IeV5e+EModK6dEwrzwVOmdSoVFcIGptMwnkMr8jB1EbtYYb6eDlvlrBGZi1SP7/4DLLL2yF+SHQRdGShCEG38uKt/3wRGU1Shf3bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761555290; c=relaxed/simple;
	bh=d0gHDNANklrUbVkVHIAruKx6owCCpxs01cR7OqXcJ4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAH07x1dtLenAMqrJuD++XEy+WMl6Uzn43eL1R1iJNsNkQDLaBmlYSGbJU8jthjXCssxzFCjrB7dvsyNC5VTl6x6CGw02NnDzleiwKY7DnYTWC7eOk5PBoYTe2U09Mf9Z8zV6RXQ3xscBLCH1ohXBEGgaro37fp67b07+CVGz/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ngt45IGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7K2g42059437
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUrLsKs2d/s0PaieRlYVP53UUARWHT+wI36bM1TCnRw=; b=ngt45IGhK2sGcNJ/
	BGbb5/udj8f3VbPDEViLsDO915jqzlVWOUT39iQGGnQl9YTDmRHN7Gk+xgRmmVFK
	ICkBNWuWdFCpnzrMgP+xfeLBlivYTriuZBRqGURA+rgo6xiZ4HpeNFuOvfla0cjT
	MA0F+pjhVOJuE5tgktNNHm9Jk+Jx9uiLPLZ6xSO5WY4VBOGcZcIdrsJYJS5f/gwo
	GG4kJjLedhWF/wMS1Z8z9O77nX9DTP5NQ1CxbutvVPGTVRzScOl3AwEHMdWeo8os
	JDujRAkpehaviE+21PW60LPDvb9Z1mEzci57RJrcq19qbXxN8gxW9DsqBeOrHbkQ
	laUlnA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p8831-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:54:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c0e043c87so13139086d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555288; x=1762160088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUrLsKs2d/s0PaieRlYVP53UUARWHT+wI36bM1TCnRw=;
        b=fXNotpJVUenuHWmy8SIUn9/QOWpgpRS9RjSeH7kpabsk7Ip1KeBhw/6eriSHTtQPRD
         wAWpdwzwFZsN7bZokpa+XoE7J3wRPIAhj2ILUoWYuw9jUvbRYBPd4kJhlIANN71zzvb8
         85jrPJhZIGBWF/CWyZ+T0H2FigEM+2SfPs3CyuZYWYgzIoxsgmRjXH5n/K4N8arxegsM
         tjY3hcJKGKyP99cdVNq8jJHD5rAF1ej+NTPtd9p1L9aH778OMjRq09FEutRNHvCmSih3
         JNOP7HoSFs9SDS1VG66iph33ECgVnuG4JrcL8Mo3GxIGzwEvAC+ENI86ils79ZqZME62
         9sPg==
X-Gm-Message-State: AOJu0Ywl5RIXWUqMoRSroUO8atCS4Os52UfQ8uayWMSYKauIa3v4b50d
	WN0e1hsnRn3oEy3+WyJ+Ywuwo2hcKOXjK9xiL8G5Lunx0l4MDbdUgh9Hkf0MWzbiiTpHpZNTYig
	mA5UblzbOkB19GbQMToL4qZp9b6mEoMKqYGWm/ElLuxVGTywsdtcGVcbztMhPmTBaWbdE
X-Gm-Gg: ASbGncuUtDDb23hBOix2VReksV5s3SbkxGyPp4aOWzT+gCPsHVh/0/uegYBs7LqIo10
	kB4V3vrCdMlLTyXdj8Q5ra4jXSyEvwgf3mRI10bIqxWxwm1P2eMvhj0djt+doOinK302n69GKE+
	3BjjMMR1I1Q+4IgZABG58QA58XMADkcLYeyAeBO0TU26942dxqk5doWhMLcWeqALOij/hL6CJ72
	dgQ4mSW6OqMv0pa7QSpRk35zV6MNWNfaHkQm3k4BpUCK/kc2PPAEGfgqBaOYXgTTGYdd0DccGf3
	GpyQ6yKxwoCKas8EGhNPODDvmg4t6H7ACzBZGFqpsHbHVHhfMFncg4Z/Sre2bZXiHaU8ZiJ+SaP
	aBzDBDJjBPFBtJ9q2EOgpEzQN/y4XneBrGI8S/ePJMfD5Sp7JevheG8CZ
X-Received: by 2002:a05:6214:240b:b0:87d:c7eb:2743 with SMTP id 6a1803df08f44-87dc7eb308fmr272761216d6.5.1761555287776;
        Mon, 27 Oct 2025 01:54:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQLwxIWQVmNEtHsQAWHxLLfHwABji01MEWnNC0Z9vg2T+gCI0aBxHit5UrPn0B8GJHlm8a/w==
X-Received: by 2002:a05:6214:240b:b0:87d:c7eb:2743 with SMTP id 6a1803df08f44-87dc7eb308fmr272761056d6.5.1761555287269;
        Mon, 27 Oct 2025 01:54:47 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077c7sm703606866b.7.2025.10.27.01.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 01:54:46 -0700 (PDT)
Message-ID: <507b99a8-b8ef-4bf0-88a6-1a82e6b794e1@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:54:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100: Add missing quirk for HS
 only USB controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
 <20251024105019.2220832-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024105019.2220832-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff3358 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XwfBWbWjICH4QB9PVrQA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4MiBTYWx0ZWRfX//PhNe7rKlfT
 g1iENeaQdKkKxWqCcYr0vZ9499ijupPH5Ej9XYUZUVLFv+VsnKYVSlj8giAPUTKRX3PBJHpGnMq
 M13ZpbTEgmWvIqRegnzDhgxweAoScDV34OM4iHBZJQdi9MAtEzH+ySaL2Egaxf2ZkjGccGq+5mK
 BsMpp82rUc0iaPLD4lT8AQERgm9U2lG/veJq+127Rx7uykfnSWp20O7AVx8QQvbffI71RuUWGmx
 RfGSmpx2tClnBrx9Ry9PJJ6myfV4zwVzO9pdtxNljL9Glwa+UnsIyIpMbBTGhVlRnCj3Brj4W/0
 VSQoM548nM5HskbNV9EyyXuVhkI3qGfZniljeot7wywbHKOn8ORNGvfXQ2WKPPRXZHX6hCyLn+Y
 4uKoUGXXJsS+IL2L6ES3+15meIDm2Q==
X-Proofpoint-ORIG-GUID: uCQQa3C9vb8nBNf0jHTbx3esJJQn_yJu
X-Proofpoint-GUID: uCQQa3C9vb8nBNf0jHTbx3esJJQn_yJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270082

On 10/24/25 12:50 PM, Krishna Kurapati wrote:
> The PIPE clock is provided by the USB3 PHY, which is predictably not
> connected to the HS-only controller. Add "qcom,select-utmi-as-pipe-clk"
> quirk to  HS only USB controller to disable pipe clock requirement.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

