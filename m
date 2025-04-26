Return-Path: <linux-arm-msm+bounces-55812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BDEA9DA25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 12:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED4FA7B3BE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 10:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE538225A3C;
	Sat, 26 Apr 2025 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ak7Bg+we"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD0226865
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745664305; cv=none; b=tx7maau/TJ1vXdEkNyxM83cqLx7UcYkl+lJlaYnwldtam6qfi5cW0Y+8T8tp+pCWubJsneid1JXiEuH/FtOITalDXG4OO+TUZTRS4HxP1J9K+nFLXELPfu1QtvasUPYp9q0O436p0Y0s9jE62Vj3GVm3Wp++X4BMVgI5pz1La4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745664305; c=relaxed/simple;
	bh=W2cjkRemjCUenJHUNPy6mF05A9vEztYbyP+NpqiS4ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZwbYBbaNS+C8mwg3aYvTR9heQKN0wN3YmhOX77u5ruJvEd9tGEEqnKgW6h9G81dcHqnzK0vC+nVCMl0eGK6MzZPU+IJ3gVd94QXxkcev+2fYekwlfJpfo9N13zXRV/wUMJeiBpzO3eOB4pANryL+oRhotnyYSziUHfpUYXTvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ak7Bg+we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4li0B011994
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 10:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=; b=Ak7Bg+weLiLtmPbP
	mt+dNjk8S9Gx2LEOfa1s2nCl+j+2sfhFaLdLzBEEGQngO1cZADpIMgoOTlSRH/fw
	E6BzuUhRBfS5PHLSSl+egKF+GoZlBKBmcXLZYsdMbpc2fLcutXolg+H+5ZEJZBaH
	R8U7jG0OQFIBayCER7RTOoXTDCP1vfn8Jek/obaDj8o3VUoW1MMI1wmvNzwHEAZH
	i5P1Qniv9PrcxRchbcKKCHXijPr7M7BcUNcb6YCxeE2z12Rrn0z+rfA3bYPPMIPg
	Xtob+VoaLSi/30Tu2ydzjb0ZZe/eWu6qdZQRDV6okn704V/E65/ftmrb7LiTLMLu
	EBa89g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb0s7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 10:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476783cbdb8so7242281cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 03:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664302; x=1746269102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=;
        b=M9Z9crO4pK8rHwpHZMY2645IXZl//0Ez+XkKDQtNEjb7z1LFl3A+e6okCyb3sSZo+4
         mTaEZmNAS5AkL1zW4O6y2fxzexiqu3KK4U4JpO/8UhB8AakwsIsZ5WF3FPck9j8HjdSa
         IWkZGLWLMEmHTNSnxiKOT65k1MNnbvA65CY8X2QfyHUzQRXPhtr2HCnwt04irYL263WI
         6byxvykscw2pGJlAy2JqzDPERuVCaeOQ/u7CLLbDh2sZux14amxvN/WdO8Teh75FskFa
         se4atZWVDSVwC51C5cvPexLhWS79BpCwBze3/FTKvjc0V7KhraLCkn/idzIjWAYHTgWP
         cCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPyz8uEXSZVrJaBGz5Tc7T3N7hK1x/p2MzEZDYi9gyGwY8I6xV3GxY1NmbH9NxI7Dwbg65j50/VlC8ojVc@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlFHhQWgca+npCLxYgi8Hu4i65SjkwDUo5mAnfdZggjU1fSQy
	5/YZjZskGUz6Veq80kpHCHvugQKZYVPdoWkRDf48KXb3oVU5jGOPxWk7uv2QPnsueB1Cbj33q73
	2FwN0+44M1jOazJTieRw1NEaQeLpyHqeqROFpC/f4YItusfi/Jk5CBiex22hxBBGN
X-Gm-Gg: ASbGncuUn8AldEq+j5cbjuOgblYTNo2predlS+MqHrbPvFOo0/O7j/Fds3HRZsPQoy0
	wLzXqzcwqKRqN0PF7zqCxbVvKFtLGxtzSzxQgMXUy+z/zw9ZgTuyMfXqGRvkjnHghVqMfPRmXI6
	jbz+vfUnjiknecWPjr/WadXnXjqVFK44amziNNdyJtVy4ofE0y9vljIZCUuDA7ywqaDd3JD53j8
	sg4VDXlmlG6s0b9pXOmLmVE7eZhisgPvItbRNMREbnmbwkbBy6GmQ6A90RjneGqmcO1h1LQnhlx
	QbWvgEiDms1gUXmR7E/zFZWnb0EvZllopgXX85gLHQC2+KuE40T/si8s2uaiqQcoNPw=
X-Received: by 2002:ac8:7e8d:0:b0:47a:eb49:273c with SMTP id d75a77b69052e-4801cd5eb1cmr33064901cf.8.1745664301983;
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ahbGaThCrsLU5YdXHhOSo0roeSKraRYtG07uhVbFeJV6F+w1ZPA4VBcrJMdVncIiFqK5Uw==
X-Received: by 2002:ac8:7e8d:0:b0:47a:eb49:273c with SMTP id d75a77b69052e-4801cd5eb1cmr33064711cf.8.1745664301568;
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41ad27sm268969666b.5.2025.04.26.03.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
Message-ID: <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
 <aAt4TBrekUqyTjfi@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAt4TBrekUqyTjfi@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA3MiBTYWx0ZWRfX7xDprlR7h2mx 4+pYtCmsPMMh7htwRMVfPCzhHX2OXnoXjQVDoones8aTo3a9Mikd1+koDQ6ucnIQru+F9Vnamib Njf0X33Yyt054KGekDvyljaNV7JkuOp75EriSY3GK9ER+12eGAwH43YW4UGXV3o+4V8YAKczE00
 bGxHYFgKkpefQSe7kcQlAL2qZnOUE4U3ZfPUHhOHAUilFubTv5KriQxB4JCUkAwo5zH93j/c/LG bBR2yItPYD2nNcLG3cnTN6k9nf7599c6ctEz5g26VzhQt+D3opb+6lXIQMGH6MVsUgmc5iIQ8U+ ODRq/QMCt+1B989lL122ZzWlkePxc+R/4Qt3Gs8xAwiNqSF7ogS2PPyjyeHwQ0lTL+7PctnnxVY
 A1Psy/hODNzyJJvHCwRnLXWNNz2AErDJfSMDTYdr7kfLZiRjnEk5zB6lvZIb0HX4w0O6Kmr6
X-Proofpoint-GUID: N_2_hNNqBfALLC6KoG_6zxBNhG2tLn_O
X-Proofpoint-ORIG-GUID: N_2_hNNqBfALLC6KoG_6zxBNhG2tLn_O
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680cb92f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=FwFjppTGKuqVC4zksNsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260072

On 4/25/25 1:55 PM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 11:29 AM, Wenbin Yao wrote:
>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
>>> voltage rails can be described under this node in the board's dts.
>>>
>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> index 46b79fce9..430f9d567 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> @@ -3287,6 +3287,17 @@ opp-128000000 {
>>>  					opp-peak-kBps = <15753000 1>;
>>>  				};
>>>  			};
>>> +
>>> +			pcie3port: pcie@0 {
>>
>> @0,0 for PCIe adressing (bus,device)
> 
> No, the bus number is not included in the unit address, so just the
> device number (0) is correct here (when the function is 0) IIUC.

Some DTs definitely have that, but I couldn't find any documentation to
back the syntax up or explain it properly

e.g.

Apple T8103
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/apple/t8103.dtsi?h=next-20250424#n930

RK3399 GRU
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi?h=next-20250424#n486

Konrad

