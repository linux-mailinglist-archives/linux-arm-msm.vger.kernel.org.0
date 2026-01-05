Return-Path: <linux-arm-msm+bounces-87575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C29CF6034
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 00:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4DB13063274
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 23:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9073F30BBAE;
	Mon,  5 Jan 2026 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep2gLraa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AxYIMvmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE629A9E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767656497; cv=none; b=FRtbAoDUMcwDFVCgLk2pIRGCtXny9wIdHYRUnsyHzemkb2PLXwcDGw3+z3W7oJTjF3gXcTCxao40iOYmIGjdHy/LGxCryG3TwicZkLk+OP/dIlhogYftnru4WxebfQ4BfR269JI477jfA/TSoiyrNDdUfBBSYRJKBNjPyI72HAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767656497; c=relaxed/simple;
	bh=4ay+JcCM1Es6/rBEyuVJImH6yU9hjcRYfFXX5x+546k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBw2lvyCXTc/PRAh8ZSfQzed4ZPOu7NUms0AoqhCO/mP7YwW2HiR7D/6IEvUMoHsnuMiEgUICXGWJ/YJ/fEHmNnaVvfmB2qd1U16FDb1eywP/skTFgaS6TtsYkcW/bFQlmnARK8S2Ou0n0AOftR0eAjoZ2G6IHlFIp+OtZ3WMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep2gLraa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AxYIMvmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605KmaMs2628692
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 23:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUIR9JTcHtKRM9x5/hVBGZtWQeYm2YE/b05cPAn1xqE=; b=ep2gLraau6RY91xs
	BhAhWDl8g0+Q20oEKs+t8pj8HPbY8lkW/BpJrTuAVWXoYjurU7beZQBXhavC7Ygh
	x0nedFnPp514aIHnxTCrUA2y53HMsw6Dkfta3MWN9WObGi/E+NbAkZf7NQoMNtiq
	X4/zF7hEwmlWXkQ7tqPdV5WmdgoRGKXOKyjDuCqKnI5zErB32BsucLiJXaBIdoXl
	wgl8wqPyR0DGQupqS1w5e797O14s4h2R/SBUDcRnouYZdrCg2y/tqAb/+GuWvk3l
	qSDcPqdVfNuyZXEVZTQIuJ/ra/0yhNiv00SmS2IlPr2IuJoi1bkP6xtLyRCUZw0Y
	BPctZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh8byd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 23:41:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so13266101cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767656494; x=1768261294; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUIR9JTcHtKRM9x5/hVBGZtWQeYm2YE/b05cPAn1xqE=;
        b=AxYIMvmyCw9pHq0db8QQzdW/DH5KceI69tWYHnBks8LC00VigLHeXbIzMq2buE7cL7
         FuF3jh4HOwKYo2cjbWFVL0UTXe2KpqhVrshII9cL9TRIZzMR3PRZMAp1tXlZH+wgJD3m
         2+QP7P+XgEBQH6mwP+Zu8GBEaqySCALI+NUs1NpGTCGd8JThglHuJWqrBUGgQrmQnrOj
         JtYgA/5rK3lA3cC1d/kWaqzDdv3fdkon79IzXhxnrEOLEZmNiCLi53yVDVxk8HgSaPvT
         i2kURK8jo0VmQ8kvYfOkfKGCoc9Oh8U3T70b6J0+3P7+vDeUdQ6icqzapvi2uFRLJESn
         HYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767656494; x=1768261294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUIR9JTcHtKRM9x5/hVBGZtWQeYm2YE/b05cPAn1xqE=;
        b=RbfHWPlGuYHFcKPBROoatPN/VIDh69VQQFJKXtkD7W5qa5GIwcEjP4X3fJmu9+QljF
         V5C4lK1JOu+oEzXxojBPGg+hIWn+ZTIaua/vjyKJy2pY35tPOvLQv5QeLPXTqAP4+Pwg
         X2ARNeNZIo8ubtSItXNanMz2HHdhvt7t8z/Iu7fU37rhspdYgOaZgQVu73SAl8yXAKh2
         eR5ZgvLm7LVtr7iO9sMBskuyjVtK8EFUZ01BLvW/8/tUxum0bIrur+9A9yc36e8BG556
         Qx22RGU9PwnhlFb/wnomCd5++l92AfkxgNDw3mZvaEHoxo4HJ6ZPYD4eIvjz6igPxXk/
         3RvA==
X-Forwarded-Encrypted: i=1; AJvYcCUwZDExJEMMUJSbTW5F18cBzNAJ3HmA5gcSlVwyrgn+6ULC0+XWlA46Zmdl/CszE/XyqCkbXChShEKiq8MJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQuvJJNHEkQC6DTuXheyUaEQeL9ENQwzSo1jk/HAPxK/d/9nI
	wGmCejaoA3ozpSiuIH1xAgMDFYrVXjUjfMGIMXpOmamBd5L9otnKmj5a/w54g6BNnk5twQa/Vx0
	yIzXNQg4cWaBDMnDeOv7jUDeV0Mzx/2B7VgCD6V+MeBFoJyMT7jXM+4De08cXDhH1t3Fa
X-Gm-Gg: AY/fxX6DL0zGyPNfrkUpVdCnqDutpsaEXJLlosJ9gDcqrD0/X5uD5CwbswtABSv7K72
	UQFUn9qGqc2TguM049jMq8J7+hfB9fQy02w22XsFT67bg4tw30YcMuzOQQrFiUVvXxNNLfxmldN
	Q9FDIJQ0z6atvh4MqrrnHSouZ+Sgl2K41vJiDaWJfgu6/9XINRhxz7f/ldBJmb53yvjnZEY3U1V
	VFbMihyj2M2shx0rU0dOy0TC/v/N0UO4V4sCj7RZSSDftWx54CFAp34h150lCpXMXo185tsgmHD
	PQVTdAGVwpMHFpO1aZuj/suV4Srz/pqoPy6rTFci9rf/jxJ3CzSs91gxRC+6LG0aDaW44ABAN77
	Zn9sWrOAv80fidq5d08WdtxKcpJCAw5eKqd79VJ0qjOMrU39vqcUjGbegMfnQzgl6U2/pdo8Z5O
	V1bjz6dxZV3Ml6Nf4J/mCNAU8=
X-Received: by 2002:ac8:5a08:0:b0:4ee:24c5:2d7e with SMTP id d75a77b69052e-4ffa76a6db4mr19386881cf.7.1767656493651;
        Mon, 05 Jan 2026 15:41:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLmjRRUmpEjErcTROxB/tSXKL1Z1RPlt6j4qdk4IgbM2gYDgTPqDQ2Re8y9zeaD3i9llxiFg==
X-Received: by 2002:ac8:5a08:0:b0:4ee:24c5:2d7e with SMTP id d75a77b69052e-4ffa76a6db4mr19386521cf.7.1767656493176;
        Mon, 05 Jan 2026 15:41:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b3037sm1380921fa.19.2026.01.05.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 15:41:32 -0800 (PST)
Date: Tue, 6 Jan 2026 01:41:30 +0200
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
Message-ID: <5j5dxvuki2hotlve2p3evv2ofkelqornzdyord4kvday5ukgr2@s743nvfri56k>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-4-praveen.talari@oss.qualcomm.com>
 <2zeqt3tu36qcxs6xrzqqmn3ssmyzetl6tq6lxrjdvt5dhxrtv4@g5q4zhk4sebs>
 <8c734f2d-59db-4815-bfc6-3823cf3ef37a@oss.qualcomm.com>
 <25f3e3c0-7796-4318-b479-a680b878528a@oss.qualcomm.com>
 <793dafa1-43bb-49c4-9e05-cfb597ba39c6@oss.qualcomm.com>
 <8a51bb87-ce81-4adc-92b3-9a077f124ff8@oss.qualcomm.com>
 <d97cef3d-b6c0-42fc-952c-1b9eff8b730c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d97cef3d-b6c0-42fc-952c-1b9eff8b730c@oss.qualcomm.com>
X-Proofpoint-GUID: 3romEqQobHS9RhsHPyj9M8UMnKSX0E0E
X-Proofpoint-ORIG-GUID: 3romEqQobHS9RhsHPyj9M8UMnKSX0E0E
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695c4c2e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-Jeo3ltgELdrsRQOa8YA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDIwNSBTYWx0ZWRfX6V+e1cXjuowb
 7wAm17t3I1XNVugsFQW66yLuYCvbF5WoFVdn6G4+XOgNvOaQKto4lTXmrMnNXjXiTnZwKQsCe1X
 Sj8A6XywfrClVG2kIGS5ipHZrLSFmZrVh+Uq0nB3gBzpa+9pptxeT4oqysSruYdcBpx/RhkPn8d
 FH4FP3AkskRS/ZOY9+DtmEeWbR7Af//APMp2NoRn6ZA9GFEK5HgCUVLoKYV7UoAnhCXHkeGM5xj
 8PgiriEdhlE3QhSq9EV0NE6lumKobM1ubKnVVa+7IWBsbWYj7mJMdm7KZySD9E0BdbKVxbTyTFN
 L54mNTleaiYrBDdEnSyDjnPzf9bC4tT0U8o5ngHAujISDO6Zwdj1P423BRNmVcMe2rReIxAVHgU
 gPGVpeQRnCfr2WcYDgtt1hyC5YvgLJESwpE6OwLV1QpCWjiIC3FIFrhWobj0sqvNEOz65boY1cl
 776A+KyJupTNSx53gzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050205

On Mon, Jan 05, 2026 at 09:42:32PM +0530, Praveen Talari wrote:
> Hi Dmitry,
> 
> On 12/31/2025 11:21 AM, Dmitry Baryshkov wrote:
> > On 31/12/2025 07:49, Praveen Talari wrote:
> > > Hi Dmitry,
> > > 
> > > On 12/31/2025 8:30 AM, Dmitry Baryshkov wrote:
> > > > On 31/12/2025 05:00, Praveen Talari wrote:
> > > > > Hi Dmitry,
> > > > > 
> > > > > On 12/30/2025 11:53 PM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Nov 10, 2025 at 03:40:42PM +0530, Praveen Talari wrote:
> > > > > > > The GENI serial driver currently handles power resource management
> > > > > > > through calls to the statically defined
> > > > > > > geni_serial_resources_on() and
> > > > > > > geni_serial_resources_off() functions. This approach
> > > > > > > reduces modularity
> > > > > > > and limits support for platforms with diverse power management
> > > > > > > mechanisms, including resource managed by firmware.
> > > > > > > 
> > > > > > > Improve modularity and enable better integration
> > > > > > > with platform- specific
> > > > > > > power management, introduce support for runtime PM. Use
> > > > > > > pm_runtime_resume_and_get() and pm_runtime_put_sync() within the
> > > > > > > qcom_geni_serial_pm() callback to control resource power state
> > > > > > > transitions based on UART power state changes.
> > > > > > > 
> > > > > > > Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >   drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++++++++++++--
> > > > > > >   1 file changed, 22 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > 
> > > > > > This breaks BT support on the Qualcomm RB2 platform. With this patch
> > > > > > applied, I'm getting the following:
> > > > > > 
> > > > > > root@qcom-armv8a:~# dmesg | grep tty\\\|hci0
> > > > > > [    0.000000] Kernel command line:  ignore_loglevel
> > > > > > console=ttyMSM0,115200n8 earlycon root=PARTLABEL=rootfs
> > > > > > rootwait systemd.mask=pd-mapper.service --
> > > > > > androidboot.bootdevice=4744000.sdhci
> > > > > > androidboot.serialno=2b89b520 androidboot.baseband=apq
> > > > > > msm_drm.dsi_display0=qcom,mdss_dsi_ext_bridge_1080p:
> > > > > > [    4.074354] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000
> > > > > > (irq = 140, base_baud = 0) is a MSM
> > > > > > [    4.099410] serial serial0: tty port ttyHS1 registered
> > > > > > [    4.131200] Bluetooth: hci0: setting up wcn399x
> > > > > > [    4.149847] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000
> > > > > > (irq = 142, base_baud = 0) is a MSM
> > > > > > [    4.229099] printk: legacy console [ttyMSM0] enabled
> > > > > > [    6.499519] Bluetooth: hci0: command 0xfc00 tx timeout
> > > > > > [    6.514347] Bluetooth: hci0: Reading QCA version
> > > > > > information failed (-110)
> > > > > > [    6.559933] Bluetooth: hci0: Retry BT power ON:0
> > > > > > [    8.016330] systemd[1]: Created slice Slice /system/getty.
> > > > > > [    8.066194] systemd[1]: Created slice Slice /system/serial-getty.
> > > > > > [    8.148389] systemd[1]: Expecting device /dev/ttyMSM0...
> > > > > > [    8.956804] Bluetooth: hci0: command 0xfc00 tx timeout
> > > > > > [    8.962447] Bluetooth: hci0: Reading QCA version
> > > > > > information failed (-110)
> > > > > > [    8.976917] Bluetooth: hci0: Retry BT power ON:1
> > > > > > [   11.296715] Bluetooth: hci0: command 0xfc00 tx timeout
> > > > > > [   11.302340] Bluetooth: hci0: Reading QCA version
> > > > > > information failed (-110)
> > > > > > [   11.309534] Bluetooth: hci0: Retry BT power ON:2
> > > > > > [   13.660078] Bluetooth: hci0: command 0xfc00 tx timeout
> > > > > > [   13.665814] Bluetooth: hci0: Reading QCA version
> > > > > > information failed (-110)
> > > > > 
> > > > > Sure, will check and update.
> > > > > 
> > > > > If possible, can you share what is DT filename for RB2.
> > > > 
> > > > qrb4210-rb2.dts
> > > 
> > > Can you please try below change on target since i didn't get target yet?
> > 
> > Yes, I have this patch too. It didn't help.
> 
> As we discussed offline, On the RB2 target, Bluetooth fails during bootup
> but functions correctly once bootup is complete.
> 
> I suspect that GPIO configurations are being affected during the bootup
> process, possibly due to the wakeup registration sequence.
> 
> To address this, I have moved the wakeup registration process to occur
> before enabling PM runtime.
> 
> Could you please try below change and let me know result?

This patch seems to fix the issue. Please send it as a properly
formatted patch.

> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c
> b/drivers/tty/serial/qcom_geni_serial.c
> index 6ce6528f5c10..46a9c71630d5 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1888,12 +1888,6 @@ static int qcom_geni_serial_probe(struct
> platform_device *pdev)
>         if (ret)
>                 goto error;
> 
> -       devm_pm_runtime_enable(port->se.dev);
> -
> -       ret = uart_add_one_port(drv, uport);
> -       if (ret)
> -               goto error;
> -
>         if (port->wakeup_irq > 0) {
>                 device_init_wakeup(&pdev->dev, true);
>                 ret = dev_pm_set_dedicated_wake_irq(&pdev->dev,
> @@ -1906,6 +1900,12 @@ static int qcom_geni_serial_probe(struct
> platform_device *pdev)
>                 }
>         }
> 
> +       devm_pm_runtime_enable(port->se.dev);
> +
> +       ret = uart_add_one_port(drv, uport);
> +       if (ret)
> +               goto error;
> +
>         return 0;
> 
> Thanks,
> Praveen Talari
> > 
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/
> > > boot/ dts/qcom/qrb4210-rb2.dts
> > > index 0cd36c54632f..5f8613150bdd 100644
> > > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > > @@ -694,7 +694,7 @@ sdc2_card_det_n: sd-card-det-n-state {
> > > 
> > >   &uart3 {
> > >          interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> > > -                             <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
> > > +                             <&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
> > >          pinctrl-0 = <&uart3_default>;
> > >          pinctrl-1 = <&uart3_sleep>;
> > >          pinctrl-names = "default", "sleep";
> > > 
> > > Thanks,
> > > Praveen Talari
> > > 
> > > > 
> > > > > 
> > > > > Earlier I had validated on RB1 and Kodiak.
> > > > > 
> > > > > Thanks,
> > > > > Praveen
> > > > > 
> > > > > > 
> > > > > > After reverting the next and this patches, BT is back to normal:
> > > > > > 
> > > > > > [    4.067201] 4a8c000.serial: ttyHS1 at MMIO 0x4a8c000
> > > > > > (irq = 140, base_baud = 0) is a MSM
> > > > > > [    4.082426] serial serial0: tty port ttyHS1 registered
> > > > > > [    4.106122] 4a90000.serial: ttyMSM0 at MMIO 0x4a90000
> > > > > > (irq = 142, base_baud = 0) is a MSM
> > > > > > [    4.108647] Bluetooth: hci0: setting up wcn399x
> > > > > > [    4.125371] printk: legacy console [ttyMSM0] enabled
> > > > > > [    4.445205] Bluetooth: hci0: QCA Product ID   :0x0000000a
> > > > > > [    4.450927] Bluetooth: hci0: QCA SOC Version  :0x40020150
> > > > > > [    4.456470] Bluetooth: hci0: QCA ROM Version  :0x00000201
> > > > > > [    4.462006] Bluetooth: hci0: QCA Patch Version:0x00000001
> > > > > > [    4.509408] Bluetooth: hci0: QCA controller version 0x01500201
> > > > > > [    4.515656] Bluetooth: hci0: QCA Downloading qca/apbtfw11.tlv
> > > > > > [    5.488739] Bluetooth: hci0: QCA Downloading qca/apnv11.bin
> > > > > > [    5.671740] Bluetooth: hci0: QCA setup on UART is completed
> > > > > > [    7.993368] systemd[1]: Created slice Slice /system/getty.
> > > > > > [    8.045612] systemd[1]: Created slice Slice /system/serial-getty.
> > > > > > [    8.125418] systemd[1]: Expecting device /dev/ttyMSM0...
> > > > > > 
> > > > > > 
> > > > 
> > > > 
> > > 
> > 
> > 
> 

-- 
With best wishes
Dmitry

