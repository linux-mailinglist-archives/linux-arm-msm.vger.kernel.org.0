Return-Path: <linux-arm-msm+bounces-55982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F00A9FBFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F695A19A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940BB1E1A3B;
	Mon, 28 Apr 2025 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpVk4me6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3319210186
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874529; cv=none; b=KXvO4T/UzStmTcBiB5p1m3E2+XbAWfb1W4LbCUS2p51Cmem6sciQH+YpWsLP0Odz73CCx7Hta54dyG0MJP5dtXNc3cN0CGe1LbhFWJ+uAmAJ/8W3wunlZHO9BQh2xYzHq1mzqkX8GAsPdB0Q+zyq2TRTrHybyNb751ImnsI5Q8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874529; c=relaxed/simple;
	bh=+Mncv3XAM9ZlakZKZDxGcDlDZcBAUXMdFsB21K/amtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIuDXNi/ulyWNnvTmiPbh080HSlqVtJySq13MtKnYGHjribwSqygtTYwudYQeLdvLulXmhUQ9CBNIcyN08lu+Jp5Lb55GSq4faXJtZX8Xg8KPHts70soKlyQkQIafsBMV2xSpriG7J2TGCdkS9Lqw/yOz4T5yFm38DWnwzhtwYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpVk4me6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACapv025877
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIIsicJwTNFSWBak9gbUD+9k9AX9vew+4qjNtRrWd3I=; b=KpVk4me6NdRtUiFS
	q0u9RAdDQ5YosLHk2ZkzWqdWGobtRyWfBIUmMCq+xUPqunGwJMyhnNrFZNaH7QJ2
	71VQsTzFoJakmbM8W/3yime/PQXD2WcVVZHLrgm7mK41FFayIZbgojVfD/Jqoh0q
	hkAhZ5SEpUYG+CvEf0zAq9oWIuzJjPAnxduVwSAXxsyLv76NriXEIE7+NxtmD5y3
	pJQUoRM2umaupipkCsZ4jJpbIkhtkmrhgU62sCATylOjbIg/kCiP/ZkhIuA+1gby
	+6YqzX5TvqM7yx3S0wJPszMIVo/nL88m78Sla7psGArtsjcvI+7BFA2fBXuIndQz
	UGbaoA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q322cda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:08:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae9ed8511so9894311cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 14:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874526; x=1746479326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIIsicJwTNFSWBak9gbUD+9k9AX9vew+4qjNtRrWd3I=;
        b=s/Bn6tinG5qqt1CwKm9+FKioVOadrbtbZ3Vpt7mvr22jHn7hkU9TldK9SHwv+VJYCF
         vpUURDMRsQLB4TECt3t2pfSk552YAXYxmN1L2YE57SQRiRiv4JLL3yX5oqA6EkPl/pFB
         HErkH1XJTl9H3BdUuj/CFS72RBMznnyAR6vmgZMq7luZ7PA1FBxoiIXUiym3WbuQtFpU
         Av/Fkzq2BXpNL0MwIw6rEewQk9TatQTNTcZKeniELHzLps/n7NobsfSFhx1FU8FaXXuv
         2jmtp0Jx9rA2BH2VDOL+XQqHDFpLNA1ztCp23my1u5Udj5WqQxzJ19RIGysXfD4amX7i
         BMlw==
X-Forwarded-Encrypted: i=1; AJvYcCXtXk0lZ7RL18xaVbUwU4UQ3VELLSwD5kRT9EtxlKaumk0egmQ1Ujeze7oST3phqTpSxqkXkYfUGZBMdjk5@vger.kernel.org
X-Gm-Message-State: AOJu0YygQBpjwTtLnHi5gpe9WR+hdQqPtnGWvD5xNCiO2ZAUKhqkhNeL
	dgEk/qffQ2TUaxIdGHpc0givymLEbZNJQ/PylnAwx3+BzLj/A7+JBbfGPpBnYlyfIG1hTyCUDT+
	gjwbZzMjeBGMcWYSu74qxUfiuGOIMXPLfIm21xKvr0gHxQJBb3keOpfs7+oj8Q84f
X-Gm-Gg: ASbGnctSJXfQvVeRcMaToWBWZV0mhu1vqtSZpDa4zCeFm0VS10MEOUc5r4aNE1pp/bh
	zthp5BZ52jnJjQAuadSrslPCgi9/uPast+0OU/OYknzxfJBnTTegQMZ/sh0AgjV3+k7yL+GykfV
	OPYWuUuHpWjzcVqq0Nfm/B0GqrsYvn61ThRhHrCdTblt2nB0cnzbpXgNS9gKgj2/TteRdQd00jo
	u/wMHc2YeqSzssPt75VCDFuhav9N6grf8/8eT2jC7XZnmuz5DEr+VDXdysELphgwPbuGbRstV/h
	Onf3Boe97qf4vtEVFMzPr7QBVEOgEW44FWavZqJho6jV50DCnI2zfH6SRjg1o1eQNQ==
X-Received: by 2002:a05:622a:58d:b0:476:af54:503f with SMTP id d75a77b69052e-48864dbdcefmr3871481cf.2.1745874525647;
        Mon, 28 Apr 2025 14:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHJmQOmBncqndjrVeMWVQWQwsIs6y5yTdT4lkSfhS7I040Dt4ZL43tltFARnvyaMhT9jbc3A==
X-Received: by 2002:a05:622a:58d:b0:476:af54:503f with SMTP id d75a77b69052e-48864dbdcefmr3871311cf.2.1745874525320;
        Mon, 28 Apr 2025 14:08:45 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7ccbsm689895566b.59.2025.04.28.14.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:08:44 -0700 (PDT)
Message-ID: <bce21a40-566d-4e21-becd-9c899c12a1b7@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:08:42 +0200
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
 <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
 <aA9jjyBR5DZcSbyQ@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aA9jjyBR5DZcSbyQ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680fee5e cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=jsbeokMXWjskDHubqLoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Sae1J-BZqK24uvbmL_ulj9AczdD5pIW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MCBTYWx0ZWRfX5vSF3p2zEyrO /kRk4sC3TnsyrbCnUub4tfe1usgfmliB2FAVDIqG2TCDF+1Ljs1yKiQ6cU//eW8gKtEA2QLtk+m sjceoOxbIOr+HFZ9Ur4x/U/QSC1hOm9Z+PU+MWRqep5t2CamvpkNSWbb3AzfO3KomipBoMGGy3T
 33WaiFR95weEqG0Up4uXfk/+RoZAcx7Lh6iS982DnFx3xIMgkfqXRZHLdCo4iPNJRGoYOzh5y0r D7MLX+IcAWJy0xxXsRJhzNCqTBrds2I0PcuJJV35EHbva9wZZQuPZnHJa5+nJU3+KqLa0JuE/Fs KbRIAE3jrf9UHr6ufrRfs+6dZ7N2E3POPXNtItMLXlSgaI1I1btb8iBGatQhb5Ka3FPA7yoyBbn
 kVe7iGQxhbjThFfyFaFMUsKbDPz2lLciyjYcyIh1on4yYnWoUcRJVEwQij9bVMTkmtlnU/DE
X-Proofpoint-ORIG-GUID: Sae1J-BZqK24uvbmL_ulj9AczdD5pIW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280170

On 4/28/25 1:16 PM, Johan Hovold wrote:
> On Sat, Apr 26, 2025 at 12:44:57PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 1:55 PM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
>>>> On 4/25/25 11:29 AM, Wenbin Yao wrote:
>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>
>>>>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
>>>>> voltage rails can be described under this node in the board's dts.
>>>>>
>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> index 46b79fce9..430f9d567 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> @@ -3287,6 +3287,17 @@ opp-128000000 {
>>>>>  					opp-peak-kBps = <15753000 1>;
>>>>>  				};
>>>>>  			};
>>>>> +
>>>>> +			pcie3port: pcie@0 {
>>>>
>>>> @0,0 for PCIe adressing (bus,device)
>>>
>>> No, the bus number is not included in the unit address, so just the
>>> device number (0) is correct here (when the function is 0) IIUC.
>>
>> Some DTs definitely have that, but I couldn't find any documentation to
>> back the syntax up or explain it properly
> 
> It's part of the spec:
> 
> 	http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> 
> The first number is the device number and the second is the function
> which can be left out if zero.

OK thank you for clarifying

Konrad

