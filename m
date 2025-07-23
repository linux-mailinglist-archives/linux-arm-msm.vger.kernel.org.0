Return-Path: <linux-arm-msm+bounces-66278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96BB0F169
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55A00581C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C55A2E5408;
	Wed, 23 Jul 2025 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBQf0Gtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66432E498D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270735; cv=none; b=TYSwmo8ECpNqM7FxGr71BScFstk8KnPGieFRn6U0aTsJjupI9cqeRQHfx7BwDfVag/MCVlqkX47jPf6AJabozQ9rX8ATu+2MmF+lloR+htou6Reh6fHhVJG2M9BiT3eDHX19UQtBXyvsqGI+fWWbk9qxtXvLV3gZp1LtbgexMAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270735; c=relaxed/simple;
	bh=Q/s3PcMjRexeC0DnoBSgh2I/u1nQNwA+BW7t88ERllQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmYMnxql3Kp8dxEkdIEtb7rn38O/6vRyPJ4Vhk49ooMqQPsKstW6LwlfR1/NTZuALZjG4VAF7fazadI9CQhXaD2Ec4Z+u+EEcw+IvoLssMFkrqww7wky2DLCbvSRUXHXs6mk2fCDzCNzXBd1b5h1tfyd8/bHK6dcYJrA9l+vIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBQf0Gtd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9aCBv019723
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAFYdgiboJDJWj7VnpPVQrrNPGsva593mh0x6zDqHNk=; b=cBQf0Gtd4C0UdpSE
	+0cqRGbUkvfbeaYdS35p5RrCfpBVx4zxfifBwb+MZIphMlqpRQGhSUJYBV7Sg1uM
	EBhYlmokdqmuU/7TbYC7ZCnca47cMdcMw8ndUfbpbrkCC6cSVlCdwsMy+dwjqBvI
	kGGplKZddcmCcsGkBfw4NUEBJVOaTFKhZ4fbAy7Go2VHPOEDEPzCjVsHz2/vT1Uf
	tTSqUdhQpg2SVhzIEUf/t3bm+Hm3UZXzOO8Vzg6JbGlZYmP8sEAVRV5ttM8EzDgf
	G8YIZkeYxoVY1RRC/SI8rGBvVsC9vhtTr2opGWW/46tQLOgma9IOx5RGo5dx/XqQ
	1UwCGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hu0kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:38:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33e133f42so30574885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270732; x=1753875532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAFYdgiboJDJWj7VnpPVQrrNPGsva593mh0x6zDqHNk=;
        b=F4FEedyuXiIEBbDDTlACDcKM93OwXPFZM8UpjNfu05zYeZc4of0jJzoPZzJwj4a3es
         Rmky7wTKTQplnDSC8bS2H3qnByweIEEz+PcIlsGoQH9G4ABHVmJBtTCU4HPin4SRGWMN
         R0treVU6K2AnNDsvGuBp8M7XGYVTykfV9PgAEK4kA53DXiRZBfJZlF+T5V9LZtr8jxDO
         WyrxGJqPoMB5qmFoklxO6xRmURjikc+Jat432Lrb8Sg3RFkhWlztwNOCqrvy2zRaqaGC
         RTnsQZ+iTk5Eqdx2blzZNztbT+etevpL3cltFaWuKMpewTdewIPSLnZT/sxh3oiCClxl
         DyKQ==
X-Gm-Message-State: AOJu0YwNIXxCMxie/1Gr16R92ecdBMHgROyqy/cM7Q0U+lUMLT07B8ed
	JaE3vvTLLdLfxRoJmANWUz7COXdbfrd/jZ9jfAOBSVlwMMKLb1XenolCPcTU/Q4eoh41r7wiaGM
	1UYKKjBmvM1IXHT4iYHbxFHoN+yOrJwV08PfXbFliPJhn1HQS9jvEccoa1T86w//5ly44
X-Gm-Gg: ASbGnctLf+afdsYM3fSpozdbJMfEVDNketpsn7iwYRYZ0/p2Rx3WPsy2oEloY8g0MeU
	cz+Ke8el+IUVr9EY2QINVG+oSb3pBXKMjWXPLLVUzod4w4/dGguki/1vJzXx0hfVjK0nYXOWDZS
	mRRGB176uvu7VKiYkhH6MNEAq5AwARoLj3TZRYQub3E8WZXpmCpievvc3Scq9NAWH//Th0FDvqp
	QSz5M/sdBi4mNOMNdZJWxAxBMne9qUfohlfyCpNMNPpES3fK8YhfQmyHTs8h4LyjITi08q9BO1s
	DFG+eKSRATxZX4xft3PWkKLzauGWh7oigpyLyq6zi+usQqWh2T3YoCDtEpgB2kWyCdZSyv1d8hZ
	TuTX9VmHEfxjGtDMpng==
X-Received: by 2002:a05:6214:2464:b0:706:696d:d0f4 with SMTP id 6a1803df08f44-7070069c99fmr13782066d6.10.1753270731627;
        Wed, 23 Jul 2025 04:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9RWEsyo4ybfZpZOzleOs98pWnU1DzaZC671XDHTlA7NNrqQhMCLEiMR5XX29DxqVIWwvFDw==
X-Received: by 2002:a05:6214:2464:b0:706:696d:d0f4 with SMTP id 6a1803df08f44-7070069c99fmr13781816d6.10.1753270730943;
        Wed, 23 Jul 2025 04:38:50 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2f1a7sm1030310466b.91.2025.07.23.04.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:38:49 -0700 (PDT)
Message-ID: <bebf58c0-b340-4c2c-ab57-4be751d1d7b1@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880c9cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=FtQQbC5FwJ0cWtqdlLwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5OSBTYWx0ZWRfX3RbBGgcUZcxp
 CyJZKUq8EOBQI4yhNS1aODOv1ChJPkbP4vEtioqPGfGSmGi0Usj57nRGYxgaVyqYpaWGnC/PDCT
 fZAXKp5UV/My38Qgl33Fmo3Vju+eLC7zia1xa3EXzRHQWMxdHOchmvKlIPWgt4OWN5UYHt09Xkt
 BLckDL7F4iK+3MhSIva+g265rzZcymwiZ5fL5WgJhYUt8+KCQy5WQ34sEuzhsyVE+tggMXbOxFk
 ls8Wn0LAVJeJMnRPZL5HV1scgw3CJrGnaXCPBkUwjDrGjDsDMgDHSKkuhB7MqyXJXu8PlnnT8yB
 mPBdn0mEedC/xwuvjFDu6V9mH3ybfAhaHrcQ/kWFZ+qdNEKBgPw5xHsRB8+bKBhwZ6BBZ9Bksdv
 f5DX3hf4VorMuz/zNoQ5ddNlTlu6mPuLwet55U7H5swlIwR6B0rRCL9oh2JZvJeucs9H9TXQ
X-Proofpoint-GUID: cTLD2eJvcaem5igamlHsdvWNunt57t7F
X-Proofpoint-ORIG-GUID: cTLD2eJvcaem5igamlHsdvWNunt57t7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230099

On 7/23/25 8:14 AM, Yongxing Mou wrote:
> Enable DisplayPort support on all three USB-C ports of the
> hamoa-iot-evk platform.
> 
> Unlike most X1E-based boards, this platform uses FSUSB42 USB
> switches for the USB0 Type-C port, while USB1 and USB2 rely on
> Parade PS8830 retimers for Alt Mode switching.
> 
> Support for the PS8830 retimers was already included in the
> initial DTS, so this change adds support for the FSUSB42 switches.
> 
> Due to limitations in the USB/DP combo PHY driver, DisplayPort
> functionality is limited to 2 lanes instead of the maximum 4,
> consistent with other X1E-based platforms.
> 
> The platform also supports embedded DisplayPort (eDP) by default.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This change made top of initial DTS:
> https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
> ---

[...]

> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss_dp3_out: endpoint {

Please keep a \n between properties and subnodes

[...]

> base-commit: 0be23810e32e6d0a17df7c0ebad895ba2c210fc4
> change-id: 20250721-x1e-evk-dp-141e0df5593d
> prerequisite-message-id: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
> prerequisite-patch-id: 3c553b55d143eafc1036ce2e88df558ec61c4e83
> prerequisite-patch-id: a4b2dabd376d32ecb159141c17113a8f3fc4ddfa
> prerequisite-patch-id: 24bf2ada12dc10f9980ed2c56347e5b6f7964ebd
> prerequisite-patch-id: c764e86c94055e56aaf9e701341bba52a54a998b

Having so many dependencies should raise your attention..

Konrad

