Return-Path: <linux-arm-msm+bounces-41704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A419EE455
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 11:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57D9A16758D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 10:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F830211273;
	Thu, 12 Dec 2024 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzfbFH1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBA91E89C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734000041; cv=none; b=JDVrds04JicbsROOMd36rASFbGj6KWBF7NUztxii29xdPOGjYuEkSuYUr6C8nwD5r8qmd5FPgZe6IRIpivYX27CQ0zCWKmbzxkhfvgILIbgPaG3ZDeFrpNk6RpPTOyOvN2HySeQd72SRRI5rPxdQzcQD+jKbVjeq6VghyCIxCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734000041; c=relaxed/simple;
	bh=82uRSP6JyhMVkQdfMkG1/sQrlBHkCy+1P540zP48nsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZ799hv1pHLIJJ+UDPx96aIUjQApwbNn3+h/JHChvzkpaMdOWKTppKdbmhL996668Fjdj0958C29tMM8ekJIlMdLYLnad+Xi9ZKweHNR75dECYMGTRjNUGlVSGR7GlSvc5A7xpnbQCryseyTCgrDmvDQwe5vOG3wdHIAVcM/+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzfbFH1e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7uxVY018754
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWrJazIZB+IUAXQpfsubELHX8kDFRYRr2kfkMUKYC14=; b=EzfbFH1elAL75DhY
	fygULKF3OlazaRGQ8xKoAI3FOzA6nXiE8KS+4L82qF8C8/QI0VA3Ovk2scd6HatJ
	hm1sEbVUGCygnnTTv91N5CuEmDwIHB18ha6L5hYNg3lXTVf4rdQsscGoXD4jPv/d
	Cb7VB9DJsLUMsH/WMaRDQiXtZjeDRO+3l0NRE/K9+Vw9A5YBLbL9MOX3lIwkCM1E
	Lcy1LAumWLc5dZJddRrZrXvGadO/Rk/AlT6aKfK+ie1it2vELJcp1p4uDELNOsYF
	P7mW+W5tIDza+cnl8lrDzcqdCVVOuhh5peHAFgXPYsHZiqWeghC/PCc0xpgAwlH3
	kX6MMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ffdyt5s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:40:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso498824a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 02:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734000038; x=1734604838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWrJazIZB+IUAXQpfsubELHX8kDFRYRr2kfkMUKYC14=;
        b=jL+et7TgAfy1QijQ4T4d8s4XQAj9TJ1EwmtLNCjoReRH7Enjl+6BEUsAE+2h5fZ0EW
         sRnI1n3rpaldMSuEOdVpqyoSnewiUCUsdjV/QhzYcUdsi6mlWEDgC6Cy90YhrizA5e72
         c3TXCXjQDpYO54r6Px42r+1DI9xQ4Y3Sd+7PtY09w9BSCKr7vq2xKpDzIlLIyKBc+SI0
         n6hBnw5bKqox/x6VKtlbEtaDpLghW/23lZvNDr5WcGHipuOVl5Gx5aa1I3qodDhfqdwk
         fNPSrc2FrDaY7oyjUfLKE9mItlJ0Uw6I7TZQ+N/Y1TykQSqn1ntq4vwOnE9RZ5oUz+jw
         vMXw==
X-Gm-Message-State: AOJu0YxeVX9Bqc7aXEqgI0eUzY7M0wxNkSF0pO2+jH5r/Vw12OHJRC9o
	3kMR2Y3rgK68u83NvoVN/NEUgzM+DdA8wnxGJEDN0k0I0kYiOWmUo+OK6GNWc3sDa22SuSI997J
	hEC/1GBorygPte0XoLBzPbpwxwBhilI2PJIvXaaGkOuGkdRTmgBsAwlLJYMnRbJ4j
X-Gm-Gg: ASbGncuDBwEZ7VXJCO8YNnYgNP6RYEBdCVaYpmk9VwKNGTZ6etcIyiLDZBMZ9WL1Eva
	Co+XZMSAt8yyumEAarUW0935WmzaMsPoLyakMe1w11d/FxdVq2c1KgMGOgsRK6zKCWGI+vEMSOk
	GFabgY1a8XazI+CUX8qKFiW6DVIpeoIF5MpKWZwsylh2nNOSP4MGWG1+8lfPG0sQXfe5nP96cpe
	MNSCT9SFQOD4BcK4giUIWiR0foM9GjLGLakNX1eVB6R0kyTZ3k63Sp/klqW3dhBQig52qkw72vy
	9icveMfxqJc=
X-Received: by 2002:a17:90b:53c6:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2f127fbf2b1mr10723672a91.16.1734000037920;
        Thu, 12 Dec 2024 02:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnyVwDRBDMftoBMWsplpwELfuZa5WcAYks6wRIYQboTRQ2Ou+bmDhyPWtpyTxpRnJH5n6szw==
X-Received: by 2002:a17:90b:53c6:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-2f127fbf2b1mr10723646a91.16.1734000037551;
        Thu, 12 Dec 2024 02:40:37 -0800 (PST)
Received: from [10.92.207.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142daeee3sm936232a91.20.2024.12.12.02.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:40:37 -0800 (PST)
Message-ID: <39012a4a-7d02-b954-bc06-53708b772a7c@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:10:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/4] PCI: dwc: Add support for configuring lane
 equalization presets
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20241212-preset_v2-v2-0-210430fbcd8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pfHktwYq84pg-0xqV1T2i_0kPTHP1vZM
X-Proofpoint-GUID: pfHktwYq84pg-0xqV1T2i_0kPTHP1vZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412120075

Please ignore this series it has wrong patches I will send new series to 
fix this.

- Krishna Chaitanya.

On 12/12/2024 4:02 PM, Krishna Chaitanya Chundru wrote:
> PCIe equalization presets are predefined settings used to optimize
> signal integrity by compensating for signal loss and distortion in
> high-speed data transmission.
>
> As per PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4 for data rates
> of 8.0 GT/s, 16.0 GT/s, 32.0 GT/s, and 64.0 GT/s, there is a way to
> configure lane equalization presets for each lane to enhance the PCIe
> link reliability. Each preset value represents a different combination
> of pre-shoot and de-emphasis values. For each data rate, different
> registers are defined: for 8.0 GT/s, registers are defined in section
> 7.7.3.4; for 16.0 GT/s, in section 7.7.5.9, etc. The 8.0 GT/s rate has
> an extra receiver preset hint, requiring 16 bits per lane, while the
> remaining data rates use 8 bits per lane.
>
> Based on the number of lanes and the supported data rate, read the
> device tree property and stores in the presets structure.
>
> Based upon the lane width and supported data rate update lane
> equalization registers.
>
> This patch depends on the this dt binding pull request: https://github.com/devicetree-org/dt-schema/pull/146
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in v2:
>      - Fix the kernel test robot error
>      - As suggested by konrad use for loop and read "eq-presets-%ugts", (8 << i)
>      - Link to v1: https://lore.kernel.org/r/20241116-presets-v1-0-878a837a4fee@quicinc.com
>
> ---
> Krishna chaitanya chundru (4):
>        arm64: dts: qcom: x1e80100: Add PCIe lane equalization preset properties
>        PCI: of: Add API to retrieve equalization presets from device tree
>        PCI: dwc: Improve handling of PCIe lane configuration
>        PCI: dwc: Add support for new pci function op
>
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi            |  8 ++++
>   drivers/pci/controller/dwc/pcie-designware-host.c | 21 +++++++++++
>   drivers/pci/controller/dwc/pcie-designware.c      | 14 ++++++-
>   drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>   drivers/pci/of.c                                  | 45 +++++++++++++++++++++++
>   drivers/pci/pci.h                                 | 17 ++++++++-
>   6 files changed, 103 insertions(+), 3 deletions(-)
> ---
> base-commit: 87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
> change-id: 20241212-preset_v2-549b7acda9b7
>
> Best regards,

