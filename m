Return-Path: <linux-arm-msm+bounces-53950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A37A8560F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 543FE8A0C3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 08:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF73293450;
	Fri, 11 Apr 2025 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFd7qLd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96623347C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358547; cv=none; b=dTZkVaccrsnY6K1tmYkTqHmZUNDXShLoyPULCx0moscepFMJYPsP8RVMCT/M7cdSaXPMdfAImLRMHY1oe8xS92XAcH1CMn9FVcF+dMnikARUKzqWH+f3PodvnST9W7a27PMTnbhBI3+d8ccrQzslvlJVaNZWsAoXAPALs/XEhE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358547; c=relaxed/simple;
	bh=KjBbOMBABp2wqkZDnNZYp6saAXR2kBuwY0iWJoMnE/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqaEiTQGVTh8tIXf4AlaNxlg8JStLxhp/6hc9tiGjbN/5SeklViF1Ejkz+TMZvegWZiX72Hx0zkn0OptnX1+aqbg/PbZ6EDtDI07RKo2JWBEWMwh2aL73WsDWRGyd1Moq+TgEoJNNO0Ke/1ly69vhnRXpE3O8zaxb7joizLUgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFd7qLd4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6EI6v017269
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zW7zReIOLTWHVfVBD0ooKWKkNzcgrHf1PMI2j0Nhy4=; b=BFd7qLd4liAUmqZI
	JaflTA5vFsg6Bwphs/fsA0n+pr/vX4ZrsG6u0aLan4qhvd90PH2mvbEf/aCloBmi
	Tva9Wspi0G0BCSwyHX+G3sqdo6/POygjoSf0cka4lzURJ9nSRV023J0F5kR3ITIv
	8OgQiEgEmljFs2iOa6DPYt2SCxjwlBQUtbpAgzaz9Hl7yT8enG0Zt55BG9V8eH8g
	phA+KGzh5CEAXlREY45cs3b9bKsftu9hVhyi+pmiCU+duRf0o71f6Xbj+7803Efi
	biaatO8cKOY7DmIZVcWZ+S5RrYw0NMAVPLF6TquOrZ9X/vmOgcb0P2ergHZT44HL
	MHOv6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1sfyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:02:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so283294785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 01:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358543; x=1744963343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zW7zReIOLTWHVfVBD0ooKWKkNzcgrHf1PMI2j0Nhy4=;
        b=GD7U4nEqyQu7JhCcJPd8sTYh5ZvQKUI484d9UEIUk9W3bkWRZ+Uq/th/7ggCuAr261
         /CBK7cfvsz85b/nVVU2cb84H+S+tTZjQvMSQfSSWT7ya6IG6j2UntDAZibDkckXO/1uH
         1BHmhNF+bP7iaL9zDnxih1DGKsuvcADL57vUx0tzN9+a9AT4J5NrjBWQuRrgzSmTx198
         4da3ntS81oxJLH6bz4l+tR6/RHq1H6M2N1YGYHsU0yuNFPxZwAvnKMwYJhnZf6L/dGG3
         Xo8njV+q52zCZwivBtrGXxfzd3wMMo7dqZ3jtmwYNkW98UQJCWKShH/1hTjRWzd9jDTg
         wztg==
X-Forwarded-Encrypted: i=1; AJvYcCUThRQHkRVxW8w6DnoT/iyICbE/q/rH7aYu2m/IZB/eWCKE92XSARDD/T7R+agpc53pAeMMccSdGwXvm7X0@vger.kernel.org
X-Gm-Message-State: AOJu0YycdCrAxxJenMdJSaUAa5MZgNx3KeaH2cLWeosLdugkZw5/ELuU
	iF+9fvI/XikfCJ0CuhbMRQXHUU+Pu/BkoBCzeTfAvi55t3WGcVkNdEQMnMDrACDyeSyTZqo1uFz
	ia0mKSfVSD3G/c1ZYV3VfImHhPZLeho/9bseFdU3syHB0uhPC2ZBvXqhWVh/NQHp0rurepidkAj
	utcA+WE9qPb2e67twrCXFV803oGiUaoi8xqgU3egvyP+QOoPQ=
X-Gm-Gg: ASbGncvDb6RqTqwS/8sOyhLZ7zSepdXv8dkBwJIste1duVNZWM6+TV6IOIqWbWtiznk
	0An4T3lN5KGnjoxVW/6q4xF+vAnoAzhlf/GEsWxu8G8iEMfPIhEYci2ad1aRjpXmIpqsWkg==
X-Received: by 2002:a05:620a:3729:b0:7c5:7a1f:4d89 with SMTP id af79cd13be357-7c7af20be07mr315076785a.54.1744358543296;
        Fri, 11 Apr 2025 01:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2IvqhPyxg7XDb4OwXoG0lMLe2viSIDhd8QRZ1holut7dtNKSKO0ppxxyVfArxRGLxZdZc6YXX3Mm8YnXZor8=
X-Received: by 2002:a05:620a:3729:b0:7c5:7a1f:4d89 with SMTP id
 af79cd13be357-7c7af20be07mr315073685a.54.1744358542968; Fri, 11 Apr 2025
 01:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
 <0YH8BNtmMcywwRXI3xHiLyB_zFED-XbjzCyyI1Vc4184BPadVJ-GWj23lpEwaXEHqDPiMiraMsWlOd1qA_hiog==@protonmail.internalid>
 <20250403102256.101217-2-loic.poulain@oss.qualcomm.com> <1b649ead-f6d6-4fb0-b5ac-02cf2dba92ca@linaro.org>
 <CAFEp6-2kamY6m_vzE0gMi-QKCRYf42RjMd7f2ud6bte=aL9mRA@mail.gmail.com> <170e4c9a-bdf4-44f7-9dd1-9eed31fa27db@oss.qualcomm.com>
In-Reply-To: <170e4c9a-bdf4-44f7-9dd1-9eed31fa27db@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:02:12 +0200
X-Gm-Features: ATxdqUHDyn-FwdIrMxmcERFKIVr7FD-HzoyyPETqFVlIlXwN4wD2v6Xbi9zA264
Message-ID: <CAFEp6-2jiq+8wOz1WzWR_8R3t4GoVR7COv3iVV-mJkhZxcRYAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm2290: Add CCI node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: tioDPsnfFrWWq23uvYskVqCIap958NXT
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f8cc90 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=1sjH1GyyAEOjfuzXYiMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tioDPsnfFrWWq23uvYskVqCIap958NXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049

Hi Konrad, Bryan,

On Wed, Apr 9, 2025 at 8:39=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/7/25 4:56 PM, Loic Poulain wrote:
> > Hi Bryan,
> >
> >
> > On Fri, Apr 4, 2025 at 2:10=E2=80=AFPM Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> >>
> >> On 03/04/2025 11:22, Loic Poulain wrote:
> >>> Add Camera Control Interface (CCI), supporting two I2C masters.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>>   v2: Reorder commits; Update dts properties order and style
> >>>   v3: No change for this patch
> >>>
> >>>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 ++++++++++++++++++++++++=
+++
> >>>   1 file changed, 50 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/=
dts/qcom/qcm2290.dtsi
> >>> index 7fb5de92bc4c..43fcb4f40a8c 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> >>> @@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
> >>>                               bias-disable;
> >>>                       };
> >>>
> >>> +                     cci0_default: cci0-default-state {
> >>> +                             pins =3D "gpio22", "gpio23";
> >>> +                             function =3D "cci_i2c";
> >>> +                             drive-strength =3D <2>;
> >>> +                             bias-disable;
> >>> +                     };
> >>> +
> >>> +                     cci1_default: cci1-default-state {
> >>> +                             pins =3D "gpio29", "gpio30";
> >>> +                             function =3D "cci_i2c";
> >>> +                             drive-strength =3D <2>;
> >>> +                             bias-disable;
> >>> +                     };
> >>> +
> >>>                       sdc1_state_on: sdc1-on-state {
> >>>                               clk-pins {
> >>>                                       pins =3D "sdc1_clk";
> >>> @@ -1603,6 +1617,42 @@ adreno_smmu: iommu@59a0000 {
> >>>                       #iommu-cells =3D <2>;
> >>>               };
> >>>
> >>> +             cci: cci@5c1b000 {
> >>> +                     compatible =3D "qcom,qcm2290-cci", "qcom,msm899=
6-cci";
> >>> +                     reg =3D <0x0 0x5c1b000 0x0 0x1000>;
> >>> +
> >>> +                     interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISIN=
G>;
> >>> +
> >>> +                     clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc =
GCC_CAMSS_CCI_0_CLK>;
> >>> +                     clock-names =3D "camss_top_ahb", "cci";
> >>
> >> do you not need an axi clock GCC_CAMSS_AXI_CLK ?
> >
> > AFAIU AXI is not involved for CCI.
>
> I'm not able to infer that from statically provided infromation, try
> forcefully shutting the clock down (both the branch and _SRC) and
> poking at the CCI

CCI is a 'slow' device, both control and data flow go through register
R/W (ahb/cnoc).
Below is an experiment showing CAMSS AXI can be off during CCI operation.

```
$ cat /sys/kernel/debug/clk/clk_summary | grep -e camss_axi -e camss_cci
       gcc_camss_axi_clk_src         0       0        0
19200000    0          0     50000      ?         deviceless
          gcc_camss_axi_clk          0       0        0
19200000    0          0     50000      N            5c52000.camss
              bus
             gcc_camss_cci_clk_src   0       0        0
37500000    0          0     50000      ?               deviceless
                gcc_camss_cci_0_clk  0       0        0
37500000    0          0     50000      N                  cci@5c1b000

$ echo on > /sys/bus/platform/drivers/i2c-qcom-cci/5c1b000.cci/power/contro=
l

$ cat /sys/kernel/debug/clk/clk_summary | grep -e camss_axi -e camss_cci
       gcc_camss_axi_clk_src         0       0        0
19200000    0          0     50000      ?         deviceless
          gcc_camss_axi_clk          0       0        0
19200000    0          0     50000      N            5c52000.camss
              bus
             gcc_camss_cci_clk_src   1       1        0
37500000    0          0     50000      ?               deviceless
                gcc_camss_cci_0_clk  1       1        0
37500000    0          0     50000      Y                  cci@5c1b000

$ cat /sys/class/i2c-dev/i2c-2/name
Qualcomm-CCI

$ i2cdetect -y -r -a 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

# Dump GCC CAMSS AXI clock registers
$ dd if=3D/sys/kernel/debug/regmap/1400000.clock-controller/registers
count=3D8 bs=3D16 skip=3D90123
5802c: 80000000 # CAMSS_AXI_CMD_RCGR =3D> ROOT_EN_DISABLE | ROOT_OFF
58030: 00000000 # CAMSS_AXI_CFG_RCGR =3D> SRC_0 | BYPASS | HW_CLK_DISABLE
[...]
58044: 80000220 # CAMSS_AXI_CBCR =3D> CLK_DISABLE | SLEEP_CLOCK2 |
WAKEUP_CLK2 | CLK_OFF
58048: 00010c00 # GCC_CAMSS_AXI_SREGR =3D> MEM_CORE_ON_ACK |
MEM_PERIPH_ON_ACK | PSCBC_SPARE_CTRL_IN
```

Regards,
Loic

