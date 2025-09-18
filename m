Return-Path: <linux-arm-msm+bounces-74076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D33DAB84AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8718D4A5BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 12:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56CA2F7462;
	Thu, 18 Sep 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4vd72lU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B7275B1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758199782; cv=none; b=nJPN9o2RplOql4Tx/dhpJv4+AgQ+EBNGiriezf43ZocjSxgHT4TPSt/uQauhsMzpiAYERMV7MLw2EIazkORiN/2IorV+sEaTM9G3uKBJI0DzwO7l0XwrZC/RqfgXXtb4Fe3co6uCWDBtcIdETKIH5kOohIdm7TKV0135FcxtYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758199782; c=relaxed/simple;
	bh=T1g8wHxLM9v5baLJeX1hctgeaaXQryX52U4/5MjiOx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPj7j73/I+CerPnJPaHV6EX4gGxepWnVl2wAuuRCgFHynTLS8ym7pVP1T6bx0zPMXs3rr4KBr4kYoLdIhJ/AXs+LeM7KW5BhzmCpFeppvFs0iRQgAQqa5IEiIKfNvL5OaNp2Z8JFGz35EuyXLvaFRfbt7LWCGXduJQVb8pEemcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4vd72lU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I8Aghm007093
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9uvbAUaZJ/mM5qLA1wvd5EkiZnnOCTie1nM1T+8w90U=; b=S4vd72lUuT76G3sS
	Rg8qlJhfc15z0IaPwnZkEG4fFJ/pSzfBuKwoOsR+Mu3Nd23+GxmkhsiaCncgAqTb
	8OEPOP0306KKqFZeM2fX+h1Rxffx0ELM2Mb+1K3f8Tca7qmQHoT+x7W/FOraKM7a
	RSLgaKD+BKGAz0h0lEYsjBEzTS4HG446XWHzVAzHPlIOhGhatEOBd5YUUNONqpun
	V8f9haVjCCIGaWvl9PhZGqc4R+JpfIMd5HPmdT6RRqY6GUARifZvMvUkBpPzkAGW
	j31mwM1mEp+9kv8UifiM07/bb2SvY87hZwSiJn1tJXRGG8x4nrZHH6Srnx/pcXB3
	xMz8DA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebervx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:49:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-813dff9671fso14741985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758199779; x=1758804579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uvbAUaZJ/mM5qLA1wvd5EkiZnnOCTie1nM1T+8w90U=;
        b=YvtLHP/AFA7ou/PjmRGoTctW7ZQEPCXCiSKaQZUIPoC+hLuPiBGqod9Ve0ImRR4tX4
         T8JKMKarGW+D4B6KggfOHeqb4SEx29BG03z8vR2yhnwzfAv4SiEotsLjWv8GWMtDJAFA
         c+yHsh0cN8W8E2jn20nEmRsvaUQCYX3vYAvdStzhS8HygH+gtttcriAaxt1ckKT+nM6D
         1vseoDD/7QEGI9vCc4CcbjkSEdaENrjuBdMn5BOGRGjxy+DdgmxR7cQpQ1G/GgG8Bbuy
         E9WGncDUVQa09rGhv7JJcHBS2tHWyrGbJMyNpgXw7dt0XCQ+1joSYvEu+yKTKeL+PwKM
         KPLA==
X-Forwarded-Encrypted: i=1; AJvYcCVfC6LJ2BdKqpAKul4+eJwJ4piceiQRV5ueQznNb5rXvaSvTDES7g8eVchMNCiC6D/SoOrj6Zl8ZJgW09VU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2YF/sURqjs9esfYMr3UkkkXuimEb5cAyxlh+iRbj0jeJ5hqWf
	GwAfW2g4tFaraCPYjD4gsbVuqf1GEI9vkM2bhDt/XRNo/zcthQV0nYet3v0NQPXEqNsI4jw/j/V
	gKcpTiv2u4vsaanj0N1W0CLsECmoZjwNoIgu2Ev3lEpyq9GBS2cFAQ+huowsqeuOkw3xP
X-Gm-Gg: ASbGncvWMS5ld3UEkdBjUx+FwmqOh2gZOqUpsThhCya9W0n7N/3eBVwpAsme3B5f+xl
	rMSY6mFqDYVHAkiU1hxIGB3wYt05EQF7mqyc6tqRx6klhgw/Nq/9qg9DSSWpFzby+YWD/BD/sJv
	dVx12HjDkV/E+bFxsY9qPtn2nt1tmvrBRclQDmZhy1JI4C/zBwfup5T/FHWGa43RAaTUTbXTAwo
	A5IVbncIb6WyJm/Z1tu0/OlcvdazmoODu2TTEWM2y6iF4FCcBghBPpgxQyHJF+SMUGqeyyFJW60
	g1fHg/a5aYfsIIKSuZy0k984INI4wF2U+fQ64sngt2CgbQ8UJYgiISaupD/p
X-Received: by 2002:a05:622a:110:b0:4b7:a1e7:25e5 with SMTP id d75a77b69052e-4ba671e4784mr41499111cf.6.1758199779245;
        Thu, 18 Sep 2025 05:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyasYH/VJkP3eENPsuUbGcbWP9AhujaqRkp4Ye74eRiaQ7tYwTMHWC/sWrG+J6Ac53C7TSTQ==
X-Received: by 2002:a05:622a:110:b0:4b7:a1e7:25e5 with SMTP id d75a77b69052e-4ba671e4784mr41498881cf.6.1758199778719;
        Thu, 18 Sep 2025 05:49:38 -0700 (PDT)
Received: from [192.168.149.223] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fcfe88894sm186909566b.63.2025.09.18.05.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:49:38 -0700 (PDT)
Message-ID: <8b02e7e6-4ae9-4e6b-8ae6-9688d29d477c@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:49:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: ipq5424: Remove eMMC support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20250918094017.3844338-1-quic_mdalam@quicinc.com>
 <20250918094017.3844338-9-quic_mdalam@quicinc.com>
 <3c42a3b0-b8b3-4c37-963a-e9cec2d3d025@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3c42a3b0-b8b3-4c37-963a-e9cec2d3d025@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bTIsyDaEw5xD-h34ZV_8no6lJVoU3xM6
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cbffe4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=AmzfQV_qY4rmN1R1o4MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bTIsyDaEw5xD-h34ZV_8no6lJVoU3xM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX81kLEflpLmN5
 Y62GXX9haCamYEVzWLIOz+GPkFzVf0qlO2TNdVTyGYVdHiaaUdWRjfgzlwwsYORKsIeJQETxMDL
 +DSgWuKoTCW/1rYSYbTcoalydSstiWx+gEFWgM5gr5LoLDikFCu+utiEUxFdLIJEMHohDJpV7QU
 VyjnZ1LZQ9UTZFYT1vKb+2h7J5/vAn9OywonGDV7OcBazvKm/caP4QeV5Ihh156t/6Iwjnm5iIy
 hYGY52h46dHv8ICnHW8pFSFySTYm329UbJ22pTFRCQKN7z9TH0imT62FJR0L/KBfm0ApvxpLXAh
 ZdkEDz5kF/xaao9KcOWiW3gpENrt+92W2G+sb4jInWe+Ck3hjFwEMxgoBQFiRpmRTHBYqKeGg/k
 zSGw3bV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

On 9/18/25 2:46 PM, Konrad Dybcio wrote:
> On 9/18/25 11:40 AM, Md Sadre Alam wrote:
>> Remove eMMC support from the IPQ5424 RDP466 board configuration to
>> resolve GPIO pin conflicts with SPI NAND interface.
>>
>> The IPQ5424 RDP466 board is designed with NOR + NAND as the default boot
>> mode configuration. The eMMC controller and SPI NAND controller share
>> the same GPIO pins, creating a hardware conflict:
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
> 
> The subject should contain the board name, i.e.:
> 
> arm64: dts: qcom: ipq5424-rdp466: xxx
> 
> same for patch 9

(and for patches 6-7)

Konrad

