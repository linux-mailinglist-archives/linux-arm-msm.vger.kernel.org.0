Return-Path: <linux-arm-msm+bounces-73264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5BFB54614
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356CA1C270B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9A326FA6C;
	Fri, 12 Sep 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jetTKFEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39926CE02
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667371; cv=none; b=XJA5eTx6tiVnnBlEJoIjfIevNtwMacrXmd/hcrarqsNA8NI873Qlu6342lI9nSCEYWWki5crENhXW6WKzVZSHn1hLKXJbn2HXKPUivMWfglgT1nXMqbRBLMwE1jtbtnRN1hoqI8wvBxWJtosKyuImmQv4nV+3/qUNqRd3sRk0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667371; c=relaxed/simple;
	bh=Hw+jWTOnPa5ZB05R1aBQnEOz4XeAn49O3zb5xmvLtoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsG/ckEXPiff/hGsbikYZq0bwu5xg5ieAw2jN+2duF/On7P2yzTy7aUzs8/EqJi8np3ImDiEF44SUmXlbq0F3FW5jF9FQAse6o/GzOUr3OURyKuaEPY2oui+Zv0LZA1Fn4IMd6K8Oj3CBV4Z5Oow1GMeTq3UJm+cBAqWK77vziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jetTKFEE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C7AElu027365
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLpUpRSzu5WwkQPIakVTd9F3SFHqAib21JyOWgJz3GI=; b=jetTKFEED/iGK08x
	OLCF6Rzc9gEuXc4ylMAmmBtykxKYpjnWjlh/lnkWDCfoS2rF7ohT1pcDdp3D+ER6
	z3N+48f8srtAfXlTAcASHvBH4HTpJ9BcuS2NvbKpC/NVkiS4xHIXxyFKBbxSitut
	FoSkI0XDOiUhrUf5LPy80pb38a7koPIWMFvEwrqgzfEuJYqyMctzsgUUV15ez/NS
	jM/JdilFD0vuqOvcCUPdMDQP+OuIAn5QQtr9vUt7ZrJ0hJxJ9MwoN3kSjMxdxIqw
	fNMr4xw+zluF3R35fNtjjCfQ7fqCglbMbPiMUm78G98+j2uwnBOTibGyvR1MexKV
	3DFXjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h5wjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:56:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b613a54072so6326381cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667368; x=1758272168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLpUpRSzu5WwkQPIakVTd9F3SFHqAib21JyOWgJz3GI=;
        b=dZPeauHqQIhHPKzJSA6kbzDluIpE5zUaEmv4Dc6aILfW7tqDZ3Mt3bl7U/Pv2EtU0z
         ETzRkz1DQ699ESQvuk1CdtMP9EVhDhJQmlLPDO2JtBU3Ou4pxYuCp4tzAVXHLDYrgtoL
         ZB7RLZJbpFLbGylHrKwUkCsWCZcKH//V07nHu6DGZX2GW8xNgAQTpIuMkxw+NZXHvpJf
         9ZdYWC46b5EnxhbfsQYYBdHuM6NwR3uvgjxO6GmOHsPiKPz/2g8mx21C3VBPWbhhCdAD
         7l5qKlJl9ATPZagluCIwiyEgGWo2lWG4BuR3OIvCf+zsW0YENXKNKxQHN3Scq3xl54XF
         pDjQ==
X-Gm-Message-State: AOJu0Yzj7h/CYiGhpjsx/PVamDihGycQy4B2NJfMcFQAXSz+DY5Owzj0
	lCrNu41N5YuOuWQHmNOFzxZG5v4RG+F5UjrDbP0piy6Ufhc6BOpk1nhMaoK7NQjPzpX7fI4Wxfr
	txvzrIBGw2g0mzEADv79RH8A1TbQkfDmO4879ZZmJoJNVMzy7UruWv/ztL93W7PyMVYU+
X-Gm-Gg: ASbGncuBhVo5+zja5rRCxSJvoFZWy9+hmdC4mTLZ+ebUtRMyvA/3crDfHT+mFWkHLTc
	TGorbA35cZXw1TvY/zn/1MbTfSXAyNmdYZX3IKHwLIpCKpB7pqUDWp8FTWTw+TBl883L5N/NDqe
	nTpxrVtCLdClCXLJWXwYwr86Z0bFSAcgkZ3m6CiEOTcNRbQXb+Xs5tUrc7OFPkwmEr7qqogJOXz
	Xlw9+JQ51ICBDRrTwDQFaiIYbDZMYU15DwX+ahu33DrAAR71iy5/O29sjJK8DA0YJYqajgwXmqo
	qqp6cQj1VvSKoUtJfWwevCJLUh26+0teWv+Q/N6iui53X5HkjQATkBpAcXGqRq6jlncUHmDjfb0
	0RsPPwO1PQyEkk9q9W5vSJA==
X-Received: by 2002:a05:6214:224c:b0:70d:da58:446a with SMTP id 6a1803df08f44-767ba2773f5mr18025536d6.2.1757667367964;
        Fri, 12 Sep 2025 01:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmyfereoE1eQ0kPbehRY6j+qV0N12MtpHVBAp6lLccgcRMNmVw9DpRMAkIZbmd5hcu6cTwQw==
X-Received: by 2002:a05:6214:224c:b0:70d:da58:446a with SMTP id 6a1803df08f44-767ba2773f5mr18025376d6.2.1757667367299;
        Fri, 12 Sep 2025 01:56:07 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62eed9aec1asm54813a12.3.2025.09.12.01.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:56:06 -0700 (PDT)
Message-ID: <56b5bacc-7214-41aa-b969-4f622afcd9f9@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 10:56:04 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250912-radxa-dragon-q6a-v1-0-8ccdbf9cd19b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qodriD2flDC9NIQzo3bM6TIrUGzBdSZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX0Yru4cqeYUGM
 lusAF9gi7niUoDZBy4t2yVUgQb+QyR6xFXS0sZNYLtf92aIpf0eWTu8tEwQ+mckp6BIbXeQPwx0
 i5VOdjoaIWCcY9wnKgMRAOJFwTmKXzMfRYINxq09ZOj8RQrLsKTzmakjehz0Ry0x1JXKgJ4EQQ2
 +47T4F39cHw++iSmELdjZSKZYjakoPwdS+wrxEsVtOdcnVBdzvTsUl2ovnC5bbelouPxzGh3NOu
 EAVuIi+OQHxzL1IbPzJVUTGMA2CA4gKS5UqNawBm4A2WOfrjuGNVIktCs3cvE6uDgmFO95rWv3V
 y2uRZU0wlV4S3Y+/TLqL5aYJSED7a+moodtFxeKR+MqaTuGscjopRP5zr3eSf+I7HUaRCvN7Dck
 +pgG1g+q
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c3e029 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ksxQWNrZAAAA:8 a=-GE0gMS6kJAlqz36ZuEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: qodriD2flDC9NIQzo3bM6TIrUGzBdSZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

On 9/12/25 10:03 AM, Xilin Wu wrote:
> Radxa Dragon Q6A (https://docs.radxa.com/en/dragon/q6a) is a single board
> computer, based on the Qualcomm QCS6490 platform.
> 
> The board ships with a modified version of the Qualcomm Linux boot
> firmware, which is stored on the onboard SPI NOR flash. This allows
> booting standard EFI-based bootloaders from SD/eMMC/USB/UFS/NVMe. It
> supports replaceable UFS 3.1/eMMC modules for easy user upgrades.
> 
> The board schematic is available at [1].
> 
> Features enabled and working:
> 
> - USB-A 3.0 port (depends on [2])
> - Three USB-A 2.0 ports
> - RTL8111K Ethernet connected to PCIe0
> - UFS 3.1 module (depends on [3])
> - eMMC module
> - SD card
> - M.2 M-Key 2230 PCIe 3.0 x2
> - HDMI 2.0 port including audio (depends on [2])
> - Configurable I2C/SPI/UART from 40-Pin GPIO (depends on [4])
> - Headphone jack
> - Onboard thermal sensors
> - QSPI controller for updating boot firmware
> - ADSP remoteproc (Type-C and charging features disabled in firmware)
> - CDSP remoteproc (for AI applications using QNN)
> - Venus video encode and decode accelerator

You have a number of features that depend on several other series, and
as Krzysztof pointed out this is difficult to merge/review.. Could you
please create a "linux-next/master-ready" version of this series and
separate the changes for which the dependencies are unmet, putting them
at the end? This way we can take at least some of your diff.

If you still want review on them, you can also send them as [PATCH DNM]
or so

Konrad

