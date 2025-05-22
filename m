Return-Path: <linux-arm-msm+bounces-59140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A9AC1533
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 22:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416FC1BC4963
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662562BF3D3;
	Thu, 22 May 2025 20:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/wBmMOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313922257E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 20:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944206; cv=none; b=cAi23D/9woRPQQtbxSg72pXHxzLR5Lo47tQCNw4x4nw0qEdYU2Thc0RCaKfg1I6l7XL8O5yuTrKh6bJFDHTtg1C6Kf3KTmk08slrrL21zZymvErka99npnG85ZNT1oKEw0Gqy+DAJk0mXGvTauBW2GKiGxspo3hduxVniOUgvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944206; c=relaxed/simple;
	bh=ld5qaH27erwn+v4cs4MEC0E8uCca4+YFeBxOrd0fjXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2ZXccTbT1Re1bXJsky32kNZL9I9hEirgCacrEl/mcJBL3guDyVQCxCgoBk7QIrxVfdyulj6Titespp4+xy3bBptZ4qGDluZLtnOMoOQgk0kOkEqZPn/oZaIpMsJsETYBc3lDJEefFgkLSMN58SC3Ddej7dZWMpvCsWZJ2jhUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/wBmMOc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG0PrD000727
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 20:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=; b=C/wBmMOc0EaTf82X
	Hkwa9K5RpXrO8NvvPOqi+yXeIkOHEOBUO6SvSq3qIqH2ftW89TWV+1EPTk/CfXIc
	A6PQIWlVF0YXyMHJJsQLH3wwxHvESvQJ0bA/+ioTQC+WaqSaLDDZsZZPTJNm6kpp
	Le+zwfBr8gP9K8dsvoFF4DwYzatUA+HWNV8Q8y2CA/+aQu+o94onRbB9VVMbQsRS
	jREeA1PvcpdZD9//f5poEmetxz2tH46W8HD0TurP1HSsjTUhvjPJA44s/6RIPJok
	vmp3g5pkdbPH0rQypJV+RofaugKTeADLjGQtLp9F2wFbhDb5i3iyc1dQ7O5bo6Ur
	yuiVfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tnxke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 20:03:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso206266085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944203; x=1748549003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=;
        b=o4r6drvgEGXif0nquVw8nhYTIIQLS9BKYnVk1VBgk2+Tx+xVvfGfRBdn+nmUhfHlTv
         9KF5lhEk77vistmpkvvbsZ7ShFKNVsV2aiy1QFitSvlv53LVKitMeAsM2lPMeUq5+pzL
         Vt7L1sXak2Ys9I6E/bKZc8teSn61s4BYK/BgXZZS75qPQUOqOkYo6/AFBTdmgB28Lzez
         pCHugcF3Q5e1ZHQTzNBk3Ry8gyO+hnHCGIiOjoAr2PV5kX8/QgpWXjyQ6gXSE3MbKRuG
         U7J2QnlZ7+6aYFOBvxOyaRDOOtPPXSypR3itad/cp56+WHQW93U6DVDv/H0xO8MknEYr
         Y4dw==
X-Forwarded-Encrypted: i=1; AJvYcCXrLInU/Rrftb0/z50PHT7ClBgEJw8d9Lga03D0VQjPz8iaE2tBExTg0Uoep6gWPChFTBPE22AxOverwraz@vger.kernel.org
X-Gm-Message-State: AOJu0YzipKzCax9mvRC2007+2jU/3EdyHlN0/yNw5ujBR7zECMjzrOM3
	Wt5RotwjX50tMuFkHwzVtV0eT3r4r63cAw7u23tOkgfurk84hovmnHpg50+gn/vNk08BSplDhk/
	dRGVda5mgS0VQff4oVhOt1ihu9UvT6io60Vsd9uEUz1r9VE1/dxLOVOr4ImiSMbEYSAgE
X-Gm-Gg: ASbGncs8BCXJHHaTI05XEFG7NA2w408YdeOV7e4lK0Fzt2yjaddWeDBWFqstVxNBmDH
	4ul+DKLeop7CxqWqUA5eHBRFQPs+VXifFK/6i/QKjFEi047EgYFIKDrVk5mIS/Bw6zQBluA9/Gr
	sgiJjDzodMap4J1vUlCkUupavoTVnonWDRLie3SDAj0jGbjB7FUUpaUXfG07DGXqTyuttSZ9WKB
	YDBJOhfipqdhjPHQ+yo+r68Bqm5LfcSU++d2LYZxOj6sJnZ8myG0eePiRo7I9pt3JlaOIfS2E5M
	tDrLyJD2MPbGDDPN2KFHFc09DJr3pvTARSNZDNSVKiybM9fKp66VV+yFBc9/z25wjg==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1598392585a.0.1747944202595;
        Thu, 22 May 2025 13:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdPVBb/3dMa+Oth0RFZpbRe4D5jwSzHxL54HpR9/3qg8beQB+fbLvxl1KJ7Gfry7w44GjJvw==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1598389385a.0.1747944202183;
        Thu, 22 May 2025 13:03:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d0717c3sm1134397266b.65.2025.05.22.13.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 13:03:21 -0700 (PDT)
Message-ID: <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f830b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=COk6AnOGAAAA:8 a=lzpFBSrVIYugpwGNuwEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: E_ymMj96_lJmjzqjH6nvQ-RNPtwu5iAi
X-Proofpoint-GUID: E_ymMj96_lJmjzqjH6nvQ-RNPtwu5iAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIwMSBTYWx0ZWRfXyE/Xo1v6vR5F
 CgX+Zn2PUvnWJgrZusL9OzNkE1jrSa9ChnQDM3XKS8JAxpBMTQpvBjAmeZJ61dN1d10GjJb3LDp
 GvXc7yA0uo0EjNWO8RD0VSJ/HHKrQl+aSa20oJlLIv4weDpAk+NSlt4Ywe8H9s9/xKjkUYmNNBH
 1JS47Yfikn7Z7WK8Gb9yUd0XlyvcSDmKBHSkiPD83uNE7A1gdqG6ileQNGhXH37jUcYoJPxHu6r
 AIwI3r8gtRDCOV8Gd/2vbZ4NJnf5ZJIA8jMXtWWK34LrBAi1X+Qeqc1BXbua4hmJtPmDCmvmIdr
 dpAV7ZhXIAd8HyOFypfLM0Z6wwtQ0k9ZCJ7kku8lAKWWz7JcrgtNrzrjknLoptq1bZKPKbapjdj
 8p4SBS3mEu4Z1vm9VnoIywMQQ4rnm7apeUABlIN//RRD+JzyWRevYCYDMn0Oq/QkKAkPQ92Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220201

On 5/8/25 11:45 AM, Johan Hovold wrote:
> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
>>
>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
>>> On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>>>> clocks provided by the TCSR device.
>>> This still looks wrong and you never replied to why these supplies
>>> shouldn't be handled by the tcsr clock driver that supplies these
>>> clocks:
>>>
>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> 
>> Sorry, I thought Konrad had convinced you.
> 
> IIRC, he just said you guys were told to add the QREF supply to the PHY.
> That's not an argument.
> 
>> If the TCSR driver manages these supplies, would it be possible for tscr
>> driver to recognize when it needs to turn vdda-qref on or off for a
>> specific PCIe port?
> 
> Sure, just add a lookup table to the driver and enable the required
> supplies when a ref clock is enabled.
> 
> As I mentioned in the other thread, the T14s has the following QREF
> supplies:
> 
> 	
> 	VDD_A_QREFS_1P2_A
> 	VDD_A_QREFS_1P2_B
> 
> 	VDD_A_QREFS_0P875_A
> 	VDD_A_QREFS_0P875_B
> 	VDD_A_QREFS_0P875_0
> 	VDD_A_QREFS_0P875_2
> 	VDD_A_QREFS_0P875_3
> 
> and it's not clear how these maps to the various consumer ref clocks,
> including the PCIe ones:
> 
> 	#define TCSR_PCIE_2L_4_CLKREF_EN
> 	#define TCSR_PCIE_2L_5_CLKREF_EN
> 	#define TCSR_PCIE_8L_CLKREF_EN
> 	#define TCSR_PCIE_4L_CLKREF_EN
> 
> That mapping can be done by the TCSR clock driver (which would also take
> care of the 1.2 V supplies).

So we had an internal discussion about this and while it may work, it
would only do so for some SoCs, and maybe only on the surface, as the
wiring behind it is rather peculiar..

Plus, not all QREF consumers have a clock expressed in TCSR as of
right now.

Konrad

