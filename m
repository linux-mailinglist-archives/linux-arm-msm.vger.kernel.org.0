Return-Path: <linux-arm-msm+bounces-75062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323EB9ECB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89A2A16FCB4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B182FE595;
	Thu, 25 Sep 2025 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1OAnUTZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B02EA74B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797006; cv=none; b=B20tb64YKCl20TH6N6Id6dkCsARclEslYjOpM+0zwd/vW/Baiskb4faYalqSfK97c9l9+0ljOd6v4MHL7CRpe92TrQbNgsQGPZ1ckj6JcWQbGNe3O67pxvyR3rY+5JZdzkY5lqyhYxfcJjPrtXb1xVbRubM+U6xP5eV9M0YJf3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797006; c=relaxed/simple;
	bh=3cn448J5AE0qbdAmfGCuMMOHudJWRnefXkxO54l3c3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kproH6KpCst5uSgeXC1oqM4opypU9KRVS+YvYykMTenIWh/88YfN9nt/AYUnHJ0zfx4jxciLjeBRZdtGg+Itk8kQtyi7QIVfLjQD7P/3g4z1welLF7qdwZ6BCAv1kN2VDtD2ik/LC0zWOdBQaULWe4iaylZEuyT4hnumlIW1pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1OAnUTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9RciW024042
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LyNgLzLMWc1Mnqx+dRpZQ1k73x+Ofm4U0A3bsduzpwc=; b=f1OAnUTZA5xmOQeD
	4I9UfW6m5EmZd1fnOykAdpPsmr/Vy/G8wk+ChzR6yz8Xknu4zpaawsnJL+e9GkX+
	7lK8ggPsRfflffJvU4OM5U+KIyJmtdFmYsM2/rqoCE6zRDblUKPQAZ7YqW79jeYu
	FR7psXdcy3PEtrPH58841naMaSLKVkYjj8GZjwy4lzHnjNV2BdkxTwcX+uChkswL
	4bjOWKMwgbqKlgJFPuNapscqf0yjPpUvW13o33uqPzpze40aCUQQzbWj6/CUZUo+
	/iACCAkZDg6azDvoLri0cMdhI0MOcPOAMxHo883uaFLkNtp87n3W/sUZY7R649NT
	sXmIGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0etdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:43:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d42703f043so1190581cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797003; x=1759401803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyNgLzLMWc1Mnqx+dRpZQ1k73x+Ofm4U0A3bsduzpwc=;
        b=mvlQUBhjiA+73zIl8HHYqzraYN9mauaTJsqHGSM5nl1qGznnp3xF3GnGtK+3Br8uz8
         KYiegjRjRym854d1FDvOmKn91ZjGyrFcFh5yHv9AyiWD3Pd1cR9Lcbj7BD57AP29Ka5y
         031zqYYUflwK6EV8YRKcqpf2gmSsQBzraD6NBGAHfvihVZFHRLfMf1f2Mwc0rBcJgrXf
         bFELM/3yqMPW8na4xeLVwsy5Fq+6DryOYKmaSHvj4WpkHOugDOFn19w5X1rUw9Xenc6Y
         50F8M+Utm6FXxvrnAsoyi+Sg24dt5cmYM/QUZWQvIaVdoiFoyCq6D3H4b+BqLl8d+IAk
         Ehvg==
X-Gm-Message-State: AOJu0YylouVHepG6J2AtWwuCihOdSTh2Kfsst0Fc2+ozwBc3/Md4IYRz
	hPI2bocFRtNeL9TcFSwZWa4H/Tw/ePHRBm9k9K7zmYJ8z1uCNHqDkWupXvj+UFl+o/JmcHPb3Sn
	Haujx1LRjzjYpD9QYZA97plbO3TYA+Hmpwa0S4AyLHRzmvyjC6sqU1Wi99Q96IEw07dTm
X-Gm-Gg: ASbGncvlN27NcFy7SUqxUI/SX1a51BIzeb7bA1PROx+nogMBSK7ic3NPtaavkI0GmTB
	DFYkF4789z6NprpY94Eui2jM8qkOyc6CS5RsYl3srguwv11I8Ez9YTEW8AEesAShbYU96Ye66GY
	os2QYUMxUASO4lELI6Jjcd5C5sG/iSicYY+ECjJnAaXX5CPdNHhrTTDrV3hawqVANL/iuTtMJaz
	EXu9yrR/hZrx1FOcs0TSmvoDkhn5Pj6guP7DJYiyq4ov9zGapw93lv24KR9GgPL4Qo0tTF8avxo
	0qFKTp2Xi0JulrJx/TaFVV3UdBd060AxHoic+dgRiriiv6uI0o4DwIDLW9NJ6heP8TdoeJfOM9V
	Nu2a60LKvAcB9LgsA3EjC5A==
X-Received: by 2002:ac8:5d08:0:b0:4d7:9039:2e87 with SMTP id d75a77b69052e-4da47c063ffmr26594221cf.1.1758797002844;
        Thu, 25 Sep 2025 03:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRYUaRRp+tX2H+EUDkPQlbMlY0IAUeEcDN/SEG0LxWyKM6rOpzeC8AZaqcyLUwx8dK85q7Pw==
X-Received: by 2002:ac8:5d08:0:b0:4d7:9039:2e87 with SMTP id d75a77b69052e-4da47c063ffmr26594041cf.1.1758797002219;
        Thu, 25 Sep 2025 03:43:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a364ffa4sm1010479a12.17.2025.09.25.03.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:43:21 -0700 (PDT)
Message-ID: <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d51ccb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=O8mQQSza-jboQJHTzfMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: lOJJob3UDXZKezW2J8NeMAtrL1g2LMfb
X-Proofpoint-ORIG-GUID: lOJJob3UDXZKezW2J8NeMAtrL1g2LMfb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX0oYRuaqWvMBl
 zUEjANngbK66xONCzI0RRXaUiPBFuWHSnGeECmKn42u+NB1bz5QUeW36VLiaw25Wp0UCB2psji1
 p3ugNBZCqc4Y5Jr1eM3C9B2VC6bUYuP1dkSXahcYjeu7i+QiAVtdWMDDuxmJ8Yg2o5Ae4cvuyQI
 lknEyFvXqalzAQMcCdW8Ivke7EJ0SWOnfq9dQNlg489XAUf3U//lkAkAog4DDeUTiZOvaUd5An4
 YaTgKmwdbJ2eZVnPxeqvGC7GGTRlZ434YT1VmLG//HAxWUJnn3TISLXAycy80FsQEUHQ2qD36GX
 A36DlQCXP4K0p7fb3N4s00VecYA4CMkXq3ANt7UyPjFbCmxvEWITDio87f9INYLgSK7vho2cick
 /N4c6G1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On 9/25/25 4:28 AM, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.

[...]

> +	/* override hardware control for reset of qmp phy */
> +	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);

Clearing this field is going to prevent the PHY from ever going offline

The HPG says this should only be necessary for keeping the phy active
during MX retention (and the listed usecases are USB4 wakeup clock
generation via a respective _USB4 register and/or USB3 autonomous mode
operation), both of which are currently unsupported.

Are you sure it's necessary / desired?

Konrad

