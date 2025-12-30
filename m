Return-Path: <linux-arm-msm+bounces-87014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E100CEA76B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 19:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87F163021050
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5112D9EC8;
	Tue, 30 Dec 2025 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFN3t669";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivReNxNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD672E88BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767119045; cv=none; b=s6l+XU9hRmhHPbZNTKke1ONtCSSWtJ2JePgqYsZamEHnTooO+wMz7Bfs9NcMLuCidBsOyypCLlWYlZK1wO5ZegAiyrdWgRKPhcA6ucY9kfjk58Nlk4aE3F++UkN/GXfxtUFKOsIqOfCBzuBUyZAeeqJJeGY5tfO1nG0ZfTXrMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767119045; c=relaxed/simple;
	bh=7dSnJjUcCK6pOIDtRuQzduIPgkkfk1C5+UmLNM8D2ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hj23m3pPqO314E4PVl9tX2uiDYC/IGBzIG/sWlQYJdV5DQ5l7amKteGDyCvUix8/TWtnL7jExwawAD3l5wYo/a/Q84HqWUDbNMLmGz+1fN661yJCSmYBajoDOuGIrCZWG0QGGxmShBZ81PKSrNcyAdiCGiDGjfkuSqYkIBilORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFN3t669; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivReNxNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9AY8w2551611
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TT2JWDxtkvqM/T76/R2j73xa
	lNEA1b2Id5hVcvXGeBo=; b=BFN3t669yfYgCxGKL6W7RM2VSqOnJIf2eAYXt16m
	PcNNXj/pGVXa1sVeupL/ndnJv4I1KU7oPzw9/BgaSRcd+jNDPtP4OHUUgnd+fwuB
	55LN8ZfQAqI2ffRFuuDl9U9Hdpy84QHkNbhBlQtP8NNTQep9iSY1lAjpubbY/SfZ
	EIlp4tnOyNz3MWyFRRPFKug4CA5JiCKJfKH5B9VQdm9nbHCmKERNQjTGI442PCgR
	ewvUInswcab2J1cJYGuAAnVxL42PhLrKJIZPdA5+xHnFXWh8IzjjMy3j6i5k676/
	S20zJ5jW5qwKLtRnaxQpNAngS8uq/fKZbaou8FD2ectOyw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skjmay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 18:24:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eff973c491so255258511cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767119041; x=1767723841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TT2JWDxtkvqM/T76/R2j73xalNEA1b2Id5hVcvXGeBo=;
        b=ivReNxNPf3m4pl9+mxb5FAIhs4hY1lMt9wAWb8gUSFmLAD1Em7U13AqIscXw3lrwdd
         dgw3gJxonoK/u83jroLN94gMxp1C/98AIBDjKmjo/zkuxKjTXpZtox/QyziyhLvzMrJb
         Juwcx+LD+PWR7UVlsxnOBMKzVzMvcJrI684rXTskj01npUbmhVI5HHibf4rwzkueEJKr
         BJsGTNtrzclP+o8NDJrUjZSBUrXJNTtQzk1rvbY7e3xqC+7IFiatIZf62AlfB3bJ6gYC
         qlTdxeadp1exNNv5MWvy71VNRnhBmNXJql4H5ccC63f6Mwf4zrztWvCdCWw5PauMBzz+
         XyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767119041; x=1767723841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TT2JWDxtkvqM/T76/R2j73xalNEA1b2Id5hVcvXGeBo=;
        b=QqliPLXZGzqOv76/zolSa8Ic1nruZhT4NZSnB4Dcrhq2vA/GwRIcncFGubIGtHmvcb
         OxUwh0BPkZNFsynlk/I6wDjHCOLS/dt7jmcqZKa9D6p1vZc5goT9P0AbCw6hK8FgbM/o
         B8qHfR1wzXTUmrPbNW2VwR2kNl5f2JZmmOTRnPIVCWh7gnnU72lllDpGxJ7UpgepdUL3
         UPIS3zyq1OzQN3tIgme/y6kLAhrmJ/VSqq+x0zaBYa2QNgGPDcZZx3peps9WrVRwXVzH
         oeV51gDt6eDmXnMZmMN0WQ2MwyIMeAaDIgMQwCdnOymwHqLh1gg3znDrAp3epBIkdxd6
         duBw==
X-Forwarded-Encrypted: i=1; AJvYcCWY9EeKAYlV1p7S0np9qrNTrHJyWnVREQac9RFmSQhEPVU1ReDpIhefNrx1odjpHja75qQJgsgowbEGJ1qR@vger.kernel.org
X-Gm-Message-State: AOJu0YziYKdGETHDnlynvIYef2zEGJrv0opj2MpMxjPh9/YqdahnFsZw
	iGaFQGih3m6jtBecJaBsYVZucGntZn0c6VsHN9BP3lfYE9Yr0rOAGZ2597ncklK4O5jCU3CfNNN
	J62HCPprO0+JNPGYVWIoE8rko8aKts+8Rk2OdJJ92PZupSBL4M0PObc2D27tWCNWUEblP
X-Gm-Gg: AY/fxX5D+MjzGSTBk/HYgSDAN/FSYtqWNZPXi3WvCNMsFxMepTC8mvIRXGjOoefNPkI
	y0WyzqZQObm4NRiuI0GHdthvTk7F7p3HQLsFo1SSmFXJseppy4hr/ZidJmwgycLqyVQrnN8hsRP
	MO3DeNqTAcrztyPg4jNVOifXSYsfwia3ZeyMgOxsWcL7sXowk58poYLvedIsFSN9UT/W6GOtU95
	S5RxfWNJpv6iq0AVaiyLwdqBvvcuMiSrw+xwoHnlRybIBNRWBNTaYxGEPwvCpxYtpJcmE/4Qns0
	ZqJYShnmTsguDKg2t9EHHGn30iOFHeJ3wL8Jru5k+zpbC0dt1PFjaJtEUNCd/yfybtzuHhYr/rU
	CjrgDsr7oK0o0iKy7pAtiIPtSPI3ZSkQ9/zKI6SPkpduuA1v37LFHKu0/0Wc86cm9zsiB3hMYZf
	mWov2u1UYe/CgdyrfH4AewmS8=
X-Received: by 2002:a05:622a:5c97:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4f4abd02fbfmr551872081cf.24.1767119041516;
        Tue, 30 Dec 2025 10:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+8+6OKflSK6Bubom6ehfUe13lAPzkU4EdfXt11HYBrzMJq9StVBQ88bK7FXswxDWqNtD12Q==
X-Received: by 2002:a05:622a:5c97:b0:4ed:2ec5:acbf with SMTP id d75a77b69052e-4f4abd02fbfmr551871511cf.24.1767119040950;
        Tue, 30 Dec 2025 10:24:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620305sm10337496e87.79.2025.12.30.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 10:24:00 -0800 (PST)
Date: Tue, 30 Dec 2025 20:23:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: Re: [PATCH v1 3/4] serial: qcom-geni: Enable PM runtime for serial
 driver
Message-ID: <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE2NSBTYWx0ZWRfX+WJKLjNLOTx4
 HwkHjiRkPzGS2wN2MSeGhwUE51BZZtpYCsOaTdIM0r5VCUZiB3jrgzN2oPSUFWXFfph4JyuRfEs
 +xWfoTz7RIhS0tN7ZOssBa6UYFtBDRI/g8mea33vQ/xRt9lFL/e7rOt68TIqYtQ2e2duxm1LJJn
 pP8q+3WOaXni4zq4qQp3ZKQ7f8m2TTL6V8yM+Xiv4L1eH3knlpZ5P335dpWkuFNObfk62i1S6Dt
 +pA8PUJCtnQCaRHMuyE1FPtWSzP8YsThYgaz9JvQ6LDeDXWVUFCs5Xv6+aSth48Xm83qY2AQhkG
 97f5bqqJbrx9ctvvCVXiud0a+c+TciJH85m7KKJNKJdmRhACxk461zl2VdVS0gapYlq0hOOtmtp
 r+ubHnoY7FGQPmbCo0oO4y6tcKdTRdHxMsxihZhgDhti1NAAoj82SINGdXKtvDbu0Tsr3uSs9ok
 LYAgzjGxgIRhySUwsPQ==
X-Proofpoint-ORIG-GUID: o3wC-ddI-A6BAz1lPNJPz5rNFdCpsrso
X-Proofpoint-GUID: o3wC-ddI-A6BAz1lPNJPz5rNFdCpsrso
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=695418c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Fr_lItdLrazyPUTGiqEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300165

On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
> The GENI serial driver currently handles power resource management
> through calls to the statically defined geni_serial_resources_on() and
> geni_serial_resources_off() functions. This approach reduces modularity
> and limits support for platforms with diverse power management
> mechanisms, including resource managed by firmware.
> 
> Improve modularity and enable better integration with platform-specific
> power management, introduce support for runtime PM. Use
> pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
> qcom_geni_serial_pm() callback to control resource power state
> transitions based on UART power state changes.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

This breaks BT support on the Qualcomm RB2 platform. With this patch
applied, I'm getting the following:

root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
[    0.000000] Kernel command line:  ignore_loglevel console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs rootwait systemd.mask=pd-mapper.service --   androidboot.bootdevice=4744000.sdhci androidboot.serialno=2b89b520 androidboot.baseband=apq msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
[    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, base_baud = 0) is a MSM
[    4.099410] serial serial0: tty port ttyHS1 registered
[    4.131200] Bluetooth: hci0: setting up wcn399x
[    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, base_baud = 0) is a MSM
[    4.229099] printk: legacy console [ttyMSM0] enabled
[    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
[    6.514347] Bluetooth: hci0: Reading QCA version information failed (-110)
[    6.559933] Bluetooth: hci0: Retry BT power ON:0
[    8.016330] systemd[1]: Created slice Slice /system/getty.
[    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
[    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
[    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
[    8.962447] Bluetooth: hci0: Reading QCA version information failed (-110)
[    8.976917] Bluetooth: hci0: Retry BT power ON:1
[   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
[   11.302340] Bluetooth: hci0: Reading QCA version information failed (-110)
[   11.309534] Bluetooth: hci0: Retry BT power ON:2
[   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
[   13.665814] Bluetooth: hci0: Reading QCA version information failed (-110)

After reverting the next and this patches, BT is back to normal:

[    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000 (irq = 140, base_baud = 0) is a MSM
[    4.082426] serial serial0: tty port ttyHS1 registered
[    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000 (irq = 142, base_baud = 0) is a MSM
[    4.108647] Bluetooth: hci0: setting up wcn399x
[    4.125371] printk: legacy console [ttyMSM0] enabled
[    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
[    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
[    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
[    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
[    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
[    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
[    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
[    5.671740] Bluetooth: hci0: QCA setup on UART is completed
[    7.993368] systemd[1]: Created slice Slice /system/getty.
[    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
[    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...


-- 
With best wishes
Dmitry

