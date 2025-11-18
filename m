Return-Path: <linux-arm-msm+bounces-82255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62409C68E6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD53E357D96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87CC2FFF99;
	Tue, 18 Nov 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAF5ONL8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="USJoa3e2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7B1347FFE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462682; cv=none; b=PXEeOKwJ6GLcHsUVCVN/iMQA/rkjMn/hdsnq9fw4JSswKPqgGlccXPlzUF2jbOCNkSQd8+rSHKqm4zbE0AmxGo/EFHF7Y8OZOCA5+CacVt4Kglhlnk1HwEwxRf9pwrAKeBBBKyJH8VMSlMlmu+nXtfcLHlqtbpIRb5KjYar6VWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462682; c=relaxed/simple;
	bh=iPkSGmX9KxQ79XLq9QwfSgi/5sR/v08OwyUjdBUS4Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZjxVHOkI3WRA5h8YIOvnQ1Za075KOXM7Y4WwkgvOtjrlcT9syyKL/GKuFnykt/BFv+OxP5RqcNKnjC5X0uilJFfF4nlEHyEXcDPqARuZyAMA68pDrwbWgrU6yYvg+sMMCSa/nTPgjpxEx74LEOnmkP0WNmsXFAF39RdO6m6Onk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAF5ONL8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=USJoa3e2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAcAkd375643
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCaK7aEvfsFFZyY5KFZUmcHBNjI4yJN5kXzzhPr5dBc=; b=DAF5ONL82otdyD37
	ZpBScCYfdJaJ8/Vs3uShfNzk7+NKwnbwQW+pAiUAPijuG05RDZ2YFZvUerVgP/YU
	l3yGfLkK6gnljrLGQY4/d38u0XuGI9MR/DCQiuXWHug/sFzSpC4EkbReLGVq7hDi
	YcHHfCDUpOgesOUct6RJL+cLXxmNUIVrEnpRvCDOFv6LKddMLjGXAbxsDbt5gcrg
	NYEBzGq3/GlJV6z0kr6hN3HGxu6IsNH7kIx6g+mj5M9LEHcsufaQ2OpjRQC/xFi3
	9YaOdQ5jleItgTfJ05YciyWQOs1gyrrHnlpYA/pj4ZC0M167B/7ef/C/LARPpdxH
	0yCn4Q==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76njuav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:44:39 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-949026e871cso229272439f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763462679; x=1764067479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCaK7aEvfsFFZyY5KFZUmcHBNjI4yJN5kXzzhPr5dBc=;
        b=USJoa3e2u44cnh7pF+tEXEI3QvsKJdUYACfY7jSnVXoiYfgkSsAGhO3I7vr99+2nhw
         TbDs+Kv7PMx4ZBr/vtSlCodW+J3o8/eb0lFR2sq8c17LAhljIQ2lwj4qsu+VECPPClgK
         vUl8CIhl822vhFZgTtzEM2h9ys4xT5fRmL3AbKcvCWo67WgOzOC+wIGX6ACUGCBla0e4
         YNXfbcHRrnVA5DWRbJgTsqF3gIHiuNbZ8XF67vxYG4F28rNethRs8A3ekJ4elaZWMVTS
         9yyJvu9boFKO4ehVYz6bPq7LzpMI8iPEm76Ym+daVrBcHxCL+LERB2OlbkUJRLp5Douw
         OveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462679; x=1764067479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCaK7aEvfsFFZyY5KFZUmcHBNjI4yJN5kXzzhPr5dBc=;
        b=SoJmPAqJnA/S1Ol9hU+TaSouzQs7+BGOJ2/CWsu0EdOlQojb3ztDv5cQTlHBS19TQq
         3GQ09b3xbOoxuZL/tTLJqW0VE4YKuwM67mUsrsL0fkQmADN4L+EKycDq5tdfEID2EIe0
         L3sDvtt+BmFRuyCvjoXd5xu/pnoAvp/aQLWminug12ckwVpgCT48qxdcLT2GHh5x9GgN
         VUmrwRUB+FdeD7+Z0Ug0ElYNJ4aEBBnRjeNmZHjp7iQr6l9b42WwO2FH2TRvaQWJfpAV
         kf5ol47c91bPkbie1VEgovx0nG3MhvJeS6NBhHBgUtlmbZ/RnsFBdlJj9BvGPU6G5Njt
         W5rA==
X-Forwarded-Encrypted: i=1; AJvYcCWuvxOi+NaXhToZtsW8XQIbwIQmgqRLPRpadAlVCXbKFkyoJYc7PMab6JhoJDtC+j4TLElKUJWMCtYRSQ5L@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1rpiv3yk5n1P9bMPqZJP7sEGMxqgv2yvFgbsWyYdeGj0gspx
	EhopXxhfKgnwmFt7M2vAHj0AP89x3hvYFWHnymrCKc82jRJrYRijlle2S/h/dTAPZ2sQQgIu4/l
	Dlu02YCpgcYwfHnYglsUGzbjhWX1QgHvr93gmrQU2p9fdx1vulePJTt+CYFpWKM4v6eKh6pVmYc
	hLcRr5CJN6fb9ZpIvtJaHvh5mMW5NSu5+mPfj7QNI9tS0=
X-Gm-Gg: ASbGncuLKm+diAEyfx4ETZ6oxhzXBaFhGL7bcD0kD8wKbGyjQFpZHJPlIKvvHHByaqX
	Tq/MuUWR2e7evLzTrIMRpddKaHffUtALh9Hfb+SxikqAjeb1Ot7bafxrcmrp5ejFS7NaF+Q5pzc
	4/l5uctqgf8F43tKczivI4J3bjz3uSviBdGV4mFFBdKyf/epdUAb4AlwTASXPmnUx0jducDMF2/
	Dserqc3vHLPZMubs7XCDsd6v5NK0jvCtv8WRxx3k7v6fA==
X-Received: by 2002:a05:6638:838b:b0:5b7:3de1:e1a5 with SMTP id 8926c6da1cb9f-5b7c9c5678dmr8785646173.1.1763462679189;
        Tue, 18 Nov 2025 02:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR4bh7rs9exhJQVqVxgzqNa8Hqi9xarFc0Bf1cW1lcX+y/WBnb8w+purdq/irbPPDybbw5G4vnB/UapB3Q5S4=
X-Received: by 2002:a05:6638:838b:b0:5b7:3de1:e1a5 with SMTP id
 8926c6da1cb9f-5b7c9c5678dmr8785632173.1.1763462678815; Tue, 18 Nov 2025
 02:44:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114121853.16472-1-r.mereu@arduino.cc> <20251114121853.16472-7-r.mereu@arduino.cc>
In-Reply-To: <20251114121853.16472-7-r.mereu@arduino.cc>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:44:27 +0100
X-Gm-Features: AWmQ_bmN3GDVSaMzesy1zRTz832e_xMXref004SjMzrpC1Nyjrzj_zI6bF87WTY
Message-ID: <CAFEp6-31A9arc=JmO7ob4uDnTj+Uhv_xJFwiUAZnfNLoAnOkOA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qrb2210: add dts for Arduino unoq
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, m.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NSBTYWx0ZWRfXxvvhPTRwIAqY
 YGqttSxxGBSVqooQzIqu1LTXj3iLlM5Meox0eHl7vx4/FiS2tKD6mwMzCkSwrt3t18klIVkuWXZ
 g0qoQ/kPKi7eh4Z+tk/EZeLeppWDpJEIK3+xY9CTo16X93bHbNLUNzxouETTyOXo7d0b7Nt2Lci
 I5E7UT4cIsoIYsUCersG66mNdSNaCESFP+HmTZsNYexR+zqQ2Pm6DT1mp2jZ2YOQ6APuy+5C99I
 wXUIFBhcHddEveL4XRCwjR7fNdmtpRfpVfzO1F8emFGoFfb2bLcRMeZvCJsrMICzAAbZTvDx8Ul
 m4d5/mv9Sgqz7fKGUR2JzYgmyF5WIjgshz+7noEOWRUCFLJcibcWZH00yZgPdBc7bIWRqDXYapK
 sInrv0JUGMw1Cq3pBSLuGW/nQh3DwA==
X-Proofpoint-GUID: 53O_9bVRz0dSeUnWI_PE87b_Ohdg6olg
X-Proofpoint-ORIG-GUID: 53O_9bVRz0dSeUnWI_PE87b_Ohdg6olg
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c4e17 cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=UdB4yIQZu0W153naj6EA:9
 a=QEXdDO2ut3YA:10 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180085

Hi Riccardo,

On Fri, Nov 14, 2025 at 1:29=E2=80=AFPM Riccardo Mereu
<r.mereu.kernel@arduino.cc> wrote:
>
> Arduino UnoQ is a single-board computer combining Qualcomm
> Dragonwing=E2=84=A2 QRB2210 microprocessor with STMicroelectronics STM32U=
585
> microcontroller.
> Support to a simply boot to shell environment includes:
> - UART, I2C, SPI
> - onboard LEDS
> - eMMC
> - WLAN and BT
>
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 456 ++++++++++++++++++
>  2 files changed, 457 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 6f34d5ed331c..9f98a7f2cbb4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -143,6 +143,7 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs8550-aim300-aiot.=
dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qdu1000-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-rb1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb4210-rb2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb5165-rb5.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola.dts
> new file mode 100644
> index 000000000000..8de355a1bf6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -0,0 +1,456 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2025, Arduino SRL
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include "agatti.dtsi"
> +#include "pm4125.dtsi"
[...]
> +
> +&wifi {
> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> +       vdd-1.8-xo-supply =3D <&pm4125_l13>;
> +       vdd-1.3-rfa-supply =3D <&pm4125_l10>;
> +       vdd-3.3-ch0-supply =3D <&pm4125_l22>;
> +       qcom,ath10k-calibration-variant =3D "Arduino_UnoQ";

The board-file you're shipping has been integrated with `ArduinoImola`
name in board-2.bin.
You should keep that name to use the right board file.


> +       firmware-name =3D "qcm2290";
> +
> +       status =3D "okay";
> +};
> +
> +&xo_board {
> +       clock-frequency =3D <38400000>;
> +};
> --
> 2.51.2
>
>

