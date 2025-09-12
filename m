Return-Path: <linux-arm-msm+bounces-73270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65232B546A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E49193B64B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69AF26B756;
	Fri, 12 Sep 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXZTo3fE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48E255F31
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668512; cv=none; b=e3dOCWKs5DP6SUWm0J+ClMfnC+Jy2nZxcIJNcMIssBBSIl0slKApOD1fP8uUxIefQ9I/w25PubgSY/+nTWXBXAorX1nrh0nUGQiTMZw8VWMdfateoZN8o3D7dxKiuKZQtnDUCD9/elJMGgZ4biau3VKUZUMH31XfW780x37kWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668512; c=relaxed/simple;
	bh=8hH52IQLTSY/6ETqGyVs/NjAsxJHI1nF028y2f3sR7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CL6xcCy6n/z0HVN2LWLQ6XfsyGmnA4nnFNxOmkF5521kS/8ss3tz8RwUlKuLb+R4xa5rx3zOHuQArvLuksOmYw2R25tNvXjzFil78t6hTB0GvvMxjccUf0iUvyd0Q6B2k+YwgGCZDjW1BYoT8cKkWGizijabHptkxHvyRWe7duQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXZTo3fE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7p9mh026568
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZ+JWI9X0wZqgTIagWn90TQC4d6G/t4jpa0lbBf0/MI=; b=UXZTo3fEtGFWKdVP
	uzjrOa6CXlmqVLH9za2XzdBTlfkgdfzbg6SBRUJ9w67brX8aTaRnYpvY/vyZXrRF
	Ct0ANNZpEDZ0ELVE15S33vrHmh6+FhBL/gFUbUSM+OYRp6szMfMv/UvMun8AX0om
	/aWxPk46lOcIrDiaNVZP5cW0jumz/lRIcCizLXYwey766/7BhUheOqLZvun+laAi
	ehM8ZC0CMcuUnARK4uMT5iE0aX3Gz/e+/P+u5Wq8jbYrIMxKbGWcHwl8VM5Kt4ru
	C+0CCgdPxfFs4q9iUDoMZCocrkjR+Qrt58F92QEkPXWGRS3w2YHHTQE+CvVcwT5Q
	mWFi1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj12x07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:15:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-720802c209dso2527736d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 02:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668509; x=1758273309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZ+JWI9X0wZqgTIagWn90TQC4d6G/t4jpa0lbBf0/MI=;
        b=DrIK26hh6t2ZuqsnXY1plmE3V6irVOjVDsMqksOUIW1wDAowy6Au3aGC03dW+VUG5S
         4joHGptLMLaHuqwrqMoG5Xe5j/AquZWQRrbRAytCYVgBXC5p270i1zSTkBWaMP67+37g
         4YiXJ5smf7th/M5ns5ipyLIOq5SOcPVX0CGslIPiPNHg/Se56t9VhfgKLJYBaYbKB8lI
         OPPo+3DXDvaf0204dQhSE9mC+aHpErm6Xqj0T857+5mAGd/hEPD5gthoVf88//oiSgew
         dazmK1b4N5+yR77M4b/1Ho6pHXYLRqgIZD3/nf9RhuqUB+rqC4EOUrKtAlOSUHoStXNm
         WCpA==
X-Gm-Message-State: AOJu0Yy5aTnBmBC8JgQofeBsK7enpY+HIWvCvJ3nHdKgyuGn02y+/KbP
	dHnpPP72E+bi+TtDxUjVZ/46FGD+l4DaKPuftloL6ISgbJOhBqmnB/XoipdhQTQ1SoaIdoLIJ6a
	yMkKQqc0tQCAsB8PLi1WgJ9HBMR3ZdxrbcZb+RnEECDP1v3x5NGRcAIUbxcdAF7NRL0WP
X-Gm-Gg: ASbGncv9YotnmdorVa9QY6l/lJXQRFFoWFMaf1uOhtLOGHjMwjtiGc9R2wwe844O1Zl
	TBGiq8mUSqF6I76aZp22Jk7TT+0ZrZu9ua741t2KUmX0H52rwtkS+XjEH9QhThGO0A6Rc9L6NRK
	4SenoLeFFczanUSUYJbiPUmC7DTI8Xl0MHXeDWLSdsg4ISRj3tOZskB/LsO4dWPFf5y16k2QP5k
	bxbktiHGJUPjAa8M+Fi0LoP+QrzQp/Z4In+8SswSVglm/2rVrX94kgSS6km/JdqCyJydSzy28Lo
	1OGMRhDVbT0BbwiWsAt/BbgDyaXH/3GAT1DtKcml7qbm8eRC3dYl+xJoPs286eMgkOpGYvgfY0z
	1a78BN9npK94s72loAuoqAw==
X-Received: by 2002:a05:6214:518a:b0:766:39f9:5e53 with SMTP id 6a1803df08f44-767c46cc9b6mr18965666d6.4.1757668509157;
        Fri, 12 Sep 2025 02:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHFLPs2knwRXVuLfaPYO2gi5ObjGWost5qrQbcgcq7H4G0UTAPCG0bAPwIvwmVi4F6AEwgxg==
X-Received: by 2002:a05:6214:518a:b0:766:39f9:5e53 with SMTP id 6a1803df08f44-767c46cc9b6mr18965396d6.4.1757668508674;
        Fri, 12 Sep 2025 02:15:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62edbc829b3sm1359359a12.28.2025.09.12.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:15:08 -0700 (PDT)
Message-ID: <cc8ba407-1d44-419d-9171-b6911f673772@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:15:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: qcs6490: Introduce Radxa Dragon
 Q6A
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
 <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
 <103424579111FE76+93c3daf1-4bce-440b-9048-74edb833031e@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <103424579111FE76+93c3daf1-4bce-440b-9048-74edb833031e@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dJIrDFRQiZCSCajX8UkQJ59wxUYKzIJE
X-Proofpoint-GUID: dJIrDFRQiZCSCajX8UkQJ59wxUYKzIJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX/fdOvqNa3qnr
 YGq7MF0LcrE78acsqJ7kSvnfo1TY34gzZy4xKgZMy3ykE2O5K3tCnmANidzzPjSz7Crgj6TUmuF
 ZqFBMgT3zbDhgOz2H4HFkTwxPJ44uI7MegPcWUj1QywkMbtqGNiZqS2Nf31DlZAv4+0kn6fhmjk
 3nDZewzVpdz4LuoJ5pFMZsSmBanxOMl5n28SGallUZ0+S9RktXOoFE1C0RrFyRj93O85v0zeQgo
 98unQ/2qMSMMdr3F+jb1GKZpNZBGRTMSgN+KRfTF/Dr6S03jF7NGLKfSi25UQiB8JNpJ5KWGF0F
 OvbTp3BMFgL/hpwb8qsZI/+L2zCwG1GiI2ygUR1mRKYZuVwbLtHVkvQW8d8lkqzPd51eNTIBiHw
 aMbNDTJw
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3e49e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ksxQWNrZAAAA:8 a=oiU97pQBqXRJkV0Aqw4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/12/25 11:04 AM, Xilin Wu wrote:
> On 2025/9/12 16:56:04, Konrad Dybcio wrote:
>> On 9/12/25 10:03 AM, Xilin Wu wrote:
>>> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
>>> computer, based on the Qualcomm QCS6490 platform.
>>>
>>> The board ships with a modified version of the Qualcomm Linux boot
>>> firmware, which is stored on the onboard SPI NOR flash. This allows
>>> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
>>> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
>>>
>>> The board schematic is available at [1].
>>>
>>> Features enabled and working:
>>>
>>> - USB-A 3.0 port (depends on [2])
>>> - Three USB-A 2.0 ports
>>> - RTL8111K Ethernet connected to PCIe0
>>> - UFS 3.1 module (depends on [3])
>>> - eMMC module
>>> - SD card
>>> - M.2 M-Key 2230 PCIe 3.0 x2
>>> - HDMI 2.0 port including audio (depends on [2])
>>> - Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
>>> - Headphone jack
>>> - Onboard thermal sensors
>>> - QSPI controller for updating boot firmware
>>> - ADSP remoteproc (Type-C and charging features disabled in firmware)
>>> - CDSP remoteproc (for AI applications using QNN)
>>> - Venus video encode and decode accelerator
>>
>> You have a number of features that depend on several other series, and
>> as Krzysztof pointed out this is difficult to merge/review.. Could you
>> please create a "linux-next/master-ready" version of this series and
>> separate the changes for which the dependencies are unmet, putting them
>> at the end? This way we can take at least some of your diff.
>>
>> If you still want review on them, you can also send them as [PATCH DNM]
>> or so
>>
>> Konrad
>>
> 
> Thanks for the suggestion. I think I can separate the changes that have unmet dependencies, and mark them as DNM. Can I send the new series now, or am I supposed to wait for a few days?

Since we can't do much with this one, please apply Krzysztof's review
comments and tags and feel free to resend

Konrad

