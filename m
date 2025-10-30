Return-Path: <linux-arm-msm+bounces-79557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D4C1E3A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 04:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC181891F0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FC92D3218;
	Thu, 30 Oct 2025 03:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff7b/zPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="am4a+kn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0D2D24BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761795823; cv=none; b=JOVylhIpRZcF3JtjjzBn0UZP2dhrwax81DHhkmjsc14py33L1OfLHMKzGNhJmwT9ae9mNsjEvHeNcbuxlfiNLVi130rv5s5aAcpU3jB5ENZgsqWtS45EUgP3+vosL95OwfG0lPFYkSvBteiHDuP7ejwLKsXZlrnrSWyNbgh7Vnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761795823; c=relaxed/simple;
	bh=syWr0hrchEYBIUz0nvESOsKkTCKM8MAjLs9LG9A2Ri0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Duhs7STa4tAsZAz3gNVeWKuERoyO2CU8sfIWSITnYLrVTFzFWPohtxv/HpTuOU0eMOJ5VG7eV9khXbxVO2bl7fLpM2Qn1kvmdCxz1CK6NQ9Mml3K7JKWsaR94JYB4XPvC4S3OLNEBdgnRerNmgg2Ylfi8Uj+6Xg8P18qat1l+HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ff7b/zPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=am4a+kn9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TIrd131324798
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=; b=Ff7b/zPO8tvJceRY
	Cy74AMHIYHiNdUVuJcP4f/lSQDyMMcebAS0DE7AeVm+xAKnTzShtg34YkxNy/wdt
	0g/NgpqpoAnJcIwT+n9clchm94r9tbrElusIK7GlLiRc2pz1AFcKCCUJFZpQCbHb
	e2XH92o1WH8HIESZAW0yg4FczD58ri60/EcSr39tD7F2kPSrT5vBlNVHNi37cCeE
	s75H5V6v6imgELujCXf9R4NerDgKzEjBRpO/HBLA7QXsuw075f/x6sEFhGWdAZcV
	aTVcBDFbMl/YzO6id4gLeaZXeFKzfoEj8DDXlNudFrRmuwCUptl38Lt66V1h83z9
	QLLDUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3rkusax7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:43:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290e4fade70so5180645ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 20:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761795820; x=1762400620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=;
        b=am4a+kn9pM3fQ7lSfl9eDgL7UcHRBU0k8iuEBI9mSGpI6iIG0IxuzNzxGrQYsRY8ow
         +8ZF6Bb3HSbqBjzFzTPcqJH1eY8VYXXVa8WwELqg/yr7ul71zsbsKjHNRgBvsXCFVYQ3
         2e5L6BTzVobh/aqOtcOG77OH7Zvp83U2f/QvPs373V2aINt0U/MIbhlOp6b3IBQ73WaC
         y5s506DuIJDJrt+uOJPI66VPSb4+sU65XdqqqDeOho4skt/MNzBijB9WF14GlvH/OXFB
         GjOL5sKWZwcwvvyqOihTezNqPjWYTlimnEndhR6U0t2d6S2mrBjyQSy+kXRo1pEc4my2
         frcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761795820; x=1762400620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHSWFWmnOzX1VHAiA276NE1gVjUwB6rf3KGgQY67Spo=;
        b=g11qdBj7JZYMxL111U7EztNpLltNHDM/c+H4o0JHs3C9RaqHp2z/cB2/GeQJz9tvWu
         RCP5kD6u98LEZ5wTPibL4TmxoGsEiJAcvISc1VngblSMycjym+5ui1bu5MneAOhH3NWz
         bp03MkHlyXa0FHN4FOKFaI0Z28nY9+Vva9ObG/6o3ASpyXds0VxbvVqNHNaOYzjr/g4o
         gZS2uLXM9KADbD7uDI5EjMJQLoypHEu8AGjnwb2JxSHypZ9lFVONSnYIspMm4/wz0Y1H
         Eh8QYfYA/j+8yHBFXOZq+pYF0ELyu1h0PpiN1E0cQbm5/O8EY/+gZ1o7oK1EEMk+Qt3w
         qQcw==
X-Forwarded-Encrypted: i=1; AJvYcCUTR7895IejJVvSPGo83nNtNT12wW/sd8O5v6XC5Yd+40BuxUa57q21erFIZIysbY42LdwSgP0u/9+R0R92@vger.kernel.org
X-Gm-Message-State: AOJu0YwWg3mHz50xjK4UJZ8hqeYDiiBbLAFwy0XCkajijYeygF97KYCR
	nD9Cm1wZuOS5FQbauMoR8gMLvtLZYmefWArGSEoCDImrIGTSR+eHKVOxTv/j8nBQ/ayQRfJFUy5
	2tkCbyzddH07BE45jVFPP9Qm/yI213tXzt2NMG7eAh4WOBReQG1md5nRIwTNSb+LEpaIQ
X-Gm-Gg: ASbGncs3k3e5WorOUPE8i3R9hBaHb8nGJFRjwHqrE57mRkO8wbSVaiVE+3SPywYGSFk
	FSIIsnlPIx/hgUaT8CEx0+1eVHx0ffP/In8gDmSBqFkKvWhS6wt/kDBmplHz/LfqgZVPw0feg+Z
	lKLzQJDBd3YfK/nY9tX3rkfZ9xUw20aSFR8kz+/yaLs6B0xm/D1l04GFcmbOJoDyRZ246roH8Xv
	N1Kl6KR56JMAZtUimMf84JbDgQ8AMjPyOnrGHu1kn1FwDjEI/Uwz1gemoW7niwmNDcrEDGyQh0C
	H0BYSd5bHzwmXx0VSTZ36WMgZNbJvQ4HSWW32hqkm9jcd/3cRWTlAL5XF+IUGMCCqoJOuajcu6z
	HR3Yvv9Sbe5vdn+wZ2y4jNmPE50Cuuuc=
X-Received: by 2002:a17:902:d487:b0:290:c07f:e8ee with SMTP id d9443c01a7336-294deee23a3mr66507465ad.43.1761795820123;
        Wed, 29 Oct 2025 20:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG8Tsm7zsMNvRb42NpHg0S5cqbhX8hvTZ+lzZFtUmt1DssbzW9YgQ30jiCbWgwAcLvsjL2Pw==
X-Received: by 2002:a17:902:d487:b0:290:c07f:e8ee with SMTP id d9443c01a7336-294deee23a3mr66506845ad.43.1761795819628;
        Wed, 29 Oct 2025 20:43:39 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2333fsm166960675ad.50.2025.10.29.20.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 20:43:39 -0700 (PDT)
Message-ID: <3dccca2d-272f-451a-9e38-901a6fa3a24c@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 09:13:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] PCI: Enable Power and configure the TC9563 PCIe
 switch
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, amitk@kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251029232323.GA1602660@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251029232323.GA1602660@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SVkRDFh-0RyWUk8-m9aMKRZp6M819DQM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAyNyBTYWx0ZWRfX5LAjQqSiUDqk
 slWB9sJ3WZ9x/kBFmqOvmSe0+0RXqg+sDk46lsLnNtD38ffLjaUAtSi7C+vDOIFeuT0YR782QAx
 /If3235/09yjxK649ohVBFQJrk96vnQM7Igw/CiipXC9Oyeqe71LBhMDuBAs2slvtDKAZVzHkYJ
 QBkeI+jPfCF3q05yST8j5eJ2O6xHjvcccc4EtA/mu+8QTOw2ChGLhj+cN3zPKtFYLUqwzEnqY1k
 gQW2hxL5GsRw2VuVP1OmfXW42CBtk127oCS41tcRIrk/LV6uiCyr1pPWCQquibjn7WteRwfmO+o
 m7ReRCyTYlX5Gauw6sgdwxBqOvkgnEDbfpJMpLKsPXSLSSicd32hGj/6kvkSYkdk9TYf3knZfhF
 bovZ11WLn2wltEhgOUFImG35xDAa8A==
X-Proofpoint-GUID: SVkRDFh-0RyWUk8-m9aMKRZp6M819DQM
X-Authority-Analysis: v=2.4 cv=adZsXBot c=1 sm=1 tr=0 ts=6902deed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FxhApbZLZ_QfhaJha3gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300027


On 10/30/2025 4:53 AM, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 04:59:53PM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is the PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC956x by upstream port.
>>
>> TC9563 switch power is controlled by the GPIO's. After powering on
>> the switch will immediately participate in the link training. if the
>> host is also ready by that time PCIe link will established.
>>
>> The TC9563 needs to configured certain parameters like de-emphasis,
>> disable unused port etc before link is established.
>>
>> As the controller starts link training before the probe of pwrctl driver,
>> the PCIe link may come up as soon as we power on the switch. Due to this
>> configuring the switch itself through i2c will not have any effect as
>> this configuration needs to done before link training. To avoid this
>> introduce two functions in pci_ops to start_link() & stop_link() which
>> will disable the link training if the PCIe link is not up yet.
>>
>> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
> What does this series apply to?  It doesn't apply cleanly to v6.18-rc1
> (the normal base for topic branches) or v6.18-rc3 or pci/next.
I sent this on top of rc3 as we have some dependencies with latest 
changes i.e ecam changes in dwc driver.
> I tried first applying the patches from
> https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/,
> but those don't apply to -rc1 or -rc3 either.

This needs to be applied on the dts schema in github, it is already 
applied I will remove this reference in next
series.

- Krishna Chaitanya.

>
> Bjorn

