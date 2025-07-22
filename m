Return-Path: <linux-arm-msm+bounces-65980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3079B0D0EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 06:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E97866C125B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 04:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2840D28C024;
	Tue, 22 Jul 2025 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFc8kYO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A128312B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753159240; cv=none; b=cqy67Hsb3S/5LnG8rmIFoky6ydlH95l8jgkwqvtvx1uYMe4uRXIfXj1M+qXybwWEuqaJ8LiWgDVL8KL9x3mrn0yWga1f9+3OVTE4E754Z1G6r80BtKAnw33Beaqo9R4rlN22GLdT271Q4QaQa21B9mFmuO8A2F2MFm7/vHygmMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753159240; c=relaxed/simple;
	bh=DcWnCV5wiDFMtlUyE+DQhJbXPHzzcnoo0XyLl4KiE/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhSDt2aszODPh4HbTAkbz4yHuwf86tSMkMYad4Pq9Vekt3o0dZOCcFvXYpvl4sqoj4g9WoZmZWildCWKsgQUkSDR4DNjkl/rZi2ZMlbIC1zt0Ap85IG8wgKhx3WmXZBqKSCRrIvZdgWWwOYuSwz8FRt5vadWC+VMnT703PkaC/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFc8kYO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIgisZ009373
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcTGOBXUA+STk52mHs0W4PauDtLBRWn0+OXc0q8RYuI=; b=IFc8kYO+nhkzRTcP
	awect8oHXP0U/GDih52NV7CPNIpPNbBkERPbpHB1s61G6FfD2ExRFdytmIh6Q71P
	cMXk28h6Mm4mg+miGb4f4OY9k6RPlw+0mS3zuEYivF5KbJ18HWuBIT5JwHpLw7dF
	07sR39aZLa6RpLhFkaVL+Nw8lYfuWR9BuA3gmlSWG9K4FC+BRHXDY9DMCvm1S580
	++eXtMmjupA7HPhNWcwPvN5ax9uHhudOpouwmbKubs0BI1AZKKYZhmHZPNQxoDiD
	CfTmQ0Vse1I2V/cL974KZXj1rIXm4ag9pKTDYpBJmCQmU9uzvlARyT+8JHLw+W4i
	hHMtQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vxdr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 04:40:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74913385dd8so7203366b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 21:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753159235; x=1753764035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcTGOBXUA+STk52mHs0W4PauDtLBRWn0+OXc0q8RYuI=;
        b=t8gL0FGBylODfeM4lEVxT57zdf5HgbdhdqUtRMCOfX1bq03PghiiCeNtSUh0ZNHh0J
         dBlY4yULzom9Ruk4GU5KPuDZ2sdV3Ed450nmDfjpDbtvyiotYmaDUl50Mmz6j2IqA4c7
         wOhhMQUd4UAXxTv9ZPCCtp34ezUky39Ai4h83Hf7vdxi+V8Vks0MpeiKsn/qu2bx0GAg
         ALKzg7CLACBixnLoip9OEVriRGtrp9ofIDh/47MA4DzFyVEMthPIK3A6mTaqGBq8znGc
         mlem32GqqGNW9C+EFmMf7XsvMBYP4s08VDPOm3yo0SoDA1lPl8VWAO/LNyTNNi4sr/26
         2x2w==
X-Forwarded-Encrypted: i=1; AJvYcCXLUAyNjSrO3DxDS/wewEIG1YazehOrwnim4WqZAtSx+71DaZT7XAYGc5ns4RknfrK2lEWy8mrL8xKeDRKA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3g2QGn2iPtzgWJ5OyNelFNYN8iAg36Gurgn4wjr3aij62r/V5
	q8xer+FnEy0O8AqgjldS6WBAGupIumPHIRd4NrX6BZ2OucrEmWSBb5SVc4F9N+ywr8r+4CRqYbE
	GjDDCr9/jRJzexgXWF6YECji+Z6HovXt2ydeykMOH68lSnGYKaX57YcKfMxFYwV/r1j4/
X-Gm-Gg: ASbGncskTyIlM7T6nqP0POHDgXDR7xHLtnbmrD4Zb5AQjMWgaiisWrk/mIcl5r4NER/
	UQwof9Zi++i1j8iPG6BH8/fd37nNSW6JQugdXXqdF3qt0lAnwr4T7lSdC//H/ziQDYeCfHpkfgp
	s7NLZCwfc192HydDlx5i2Q3d7LQ6E+5RY3UL8FYBTLpr2k0uF0kF3dqAW1+iiEVigZAPAC8vF+C
	9A8ef4oKjNjOn0tEwQDjuO11UPD/LtlfGQXzvzZYX5d7B8kKwzpfWOleRtIy6cuzraYxf75YpK9
	Qtgd8TZnK1RTqRlOuSFDBms5aIbiBwIztGIMudHfwzQclM+2LtFlA59ruAnnhUJL6T88LosV1NU
	YnMHnb2cbp4aS0uFpcg==
X-Received: by 2002:a05:6a00:2189:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-75724876a95mr27257779b3a.16.1753159235199;
        Mon, 21 Jul 2025 21:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1twrNaoE58MjndE1bdJRlSy7dI5BpM3+Jd8iUPOsl/CmInJrgSot5/C3EE7tyMWUpjbzqFw==
X-Received: by 2002:a05:6a00:2189:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-75724876a95mr27257748b3a.16.1753159234693;
        Mon, 21 Jul 2025 21:40:34 -0700 (PDT)
Received: from [10.110.120.151] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e20b7sm6725618b3a.28.2025.07.21.21.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 21:40:34 -0700 (PDT)
Message-ID: <0b595166-d3b5-4b01-b8cd-ba9711c88f30@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 12:40:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: sa8775p: remove aux clock from
 pcie phy
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_krichai@quicinc.com,
        quic_vbadigan@quicinc.com
References: <20250718081718.390790-1-ziyue.zhang@oss.qualcomm.com>
 <20250718081718.390790-4-ziyue.zhang@oss.qualcomm.com>
 <aHobmsHTjyJVUtFj@hovoldconsulting.com>
 <86e14d55-8e96-4a2d-a9e8-a52f0de9dffd@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <86e14d55-8e96-4a2d-a9e8-a52f0de9dffd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687f1644 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_GfwqhGknvAR8v4wHWsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: ukh0iduEztvaD-Qi_VlOfv4dqhmDpnhg
X-Proofpoint-ORIG-GUID: ukh0iduEztvaD-Qi_VlOfv4dqhmDpnhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDAzNSBTYWx0ZWRfX8AC6sd05qyl5
 5HHz0b16KBx3Q332TrjYWwuDTjFf21E6xeNQAAdSfrzTZTsMGeS4sjtejzN30SB4O/Mc9W13UMK
 X5+yYY6+3bboNLQpIiEPAtK0TjKCPWiYvN67KuuJH0AfSIDDuDMatCnlSJW8+jJgmzVTsfXUE58
 IZFVMJqQBJXjOLs3BRZUJaD4XQkdMnD0ibabKw6wBQKqhUAYQIOsyQIterBMNAyQgO6kSoMVn11
 MI2vSZSyHLAwiCmKq7/Gyf9dUFToUkBZJm4P96QGjmI4F80K7Wl6BFyxGLyCJPe7SMD+4k67iy5
 87d8cABeNeI5vVKMgqyahQT/cC377qLFqg79tpePoklwc7C/iGl7vVftCZ3Buy5R77khd+tTfSm
 B2f3cBGrqLYzSIxtu+2+Z6SCA7u4QslUEVZA+WntUhuudJzLQ8g2LX5Jfng1e3v4DkkIp6Xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220035


On 7/18/2025 6:53 PM, Konrad Dybcio wrote:
> On 7/18/25 12:02 PM, Johan Hovold wrote:
>> On Fri, Jul 18, 2025 at 04:17:17PM +0800, Ziyue Zhang wrote:
>>> gcc_aux_clk is used in PCIe RC and it is not required in pcie phy, in
>>> pcie phy it should be gcc_phy_aux_clk, so remove gcc_aux_clk and
>>> replace it with gcc_phy_aux_clk.
>> Expanding on why this is a correct change would be good since this does
>> not yet seem to have been fully resolved:
>>
>> 	https://lore.kernel.org/lkml/98088092-1987-41cc-ab70-c9a5d3fdbb41@oss.qualcomm.com/
> I dug out some deep memories and recalled that _PHY_AUX_CLK was
> necessary on x1e for the Gen4 PHY to initialize properly. This
> can be easily reproduced:
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a9a7bb676c6f..d5ef6bef2b23 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3312,7 +3312,7 @@ pcie3_phy: phy@1be0000 {
>                          compatible = "qcom,x1e80100-qmp-gen4x8-pcie-phy";
>                          reg = <0 0x01be0000 0 0x10000>;
>   
> -                       clocks = <&gcc GCC_PCIE_3_PHY_AUX_CLK>,
> +                       clocks = <&gcc GCC_PCIE_3_AUX_CLK>,
>                                   <&gcc GCC_PCIE_3_CFG_AHB_CLK>,
>                                   <&tcsr TCSR_PCIE_8L_CLKREF_EN>,
>                                   <&gcc GCC_PCIE_3_PHY_RCHNG_CLK>,
>
> ==>
> [    6.967231] qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
> [    6.974462] phy phy-1be0000.phy.0: phy poweron failed --> -110
>
> And the (non-PHY_)AUX_CLK is necessary for at least one of them, as
> removing it causes a crash on boot
>
> Konrad

