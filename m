Return-Path: <linux-arm-msm+bounces-83463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF1C8A23F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 15:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A70B3A300D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 14:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE451DF254;
	Wed, 26 Nov 2025 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5uUQ9t0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8MgEU8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB271FE47B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165844; cv=none; b=cT3HDA9CtofIhYv7mtwCzOMi2ZkmhSH4VqZdVPTQiHfWqH3qwgOEE4J++gNQ+x09B2HkaxxB0XV425yWGsiuDd7lT//MNwQtYGdsSYR5Dg24Ud6Rz5dt/qXM9vDtGtE33c/HpqQxqBCFahvb8SfSjojBfWr0ECrLXjC66HMysBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165844; c=relaxed/simple;
	bh=8v1x2RS2pjT3QKt9mvzTfTrPxDuF/2BMWOoPGs7cASs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMkLQpK+5HbI0fN3Mts4Tp6Zjzuq8giY0ccWkRWPkStP9Mt8ts+yn25/pEsAbYyt8NuAeJfg8z79bnO6WmGiKcC9285utx4cwRTC3cz0zh/pFPcRpgHkeOpK7A1N8cITKUbcZ3wcKkE/C0nU9M0j/ckBWLMj9E71xGmNAeoa1q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5uUQ9t0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8MgEU8c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAsmjW1700334
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4Pu61FlX7ik1HTPqKufvU6avYQgm5W31lthRKIaR6E=; b=O5uUQ9t0jKDO1yBw
	NoMLZMVCy0T2XEbjHzAadosxwOexC41Ckz95dn937mPdH3F+/cG6RtPsVu9ataZW
	XTAF2FUTDSCE3uMdAaTliiMb1fh7m+wU64VhH1DV0nXl7OgtI9tVzJczewYsQseg
	54RUtXGey3mEfMwvJqzzd5LuSYP4Xex5t2rg+SGyArKGRsbosR0NrlDXvSo5ay5s
	7AIFkM2IGKNV/uhCCaf4+EMIXMrdIYzO/HqN8XOQYToyZoCgi/lHM1itKhsN3l4r
	LaxYFyRwhCrOOX7vXrb8sx9JNk+eXfD6HjKsGQNE6V/HhXDAvpMCn+5ZIGDA3qVn
	B1/6KA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a0e2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 14:04:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so1730413385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764165841; x=1764770641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4Pu61FlX7ik1HTPqKufvU6avYQgm5W31lthRKIaR6E=;
        b=X8MgEU8cTJa20URdftqHMmNNvxo80cxviM3L9USl0zuTeP5s3FaDRACJh+2YNbuJCi
         /tUAKHbz6cT9r0bLactq5kulgiVtMYcNxaJqLbTLZf76GEqjBcJiGMdS8SPfzmmiQO0T
         efIGKChgvhnyGMDdkQNV+kqFPsnCZN6+yVbskBAMg5bwT5cLHkblRyExhmJNByMLQjB/
         80joBGTDmyOt5dM5+ctjBPCCFms9tIJz6/J+h5ehuRVjznGTveNtrWLBiMa1W3jrmhTk
         +C4k18mjl3Dyj9e65Hy/uDaN/M5zZogcm35HSdPWJH0O5Ui1UEmNDsBTKBLbZc+2la7X
         uhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165841; x=1764770641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j4Pu61FlX7ik1HTPqKufvU6avYQgm5W31lthRKIaR6E=;
        b=rYUBNvzHV26zHJwc6LA9qtRsXUx5gFzeLHHtLkcyUkQ9zZ2O7/Iv6AX01BDAVjGZ4O
         5Cy1TFEKhLu5VsvvCIKYCVExrQG8Hy3SdoVYDDXQQMG56a8uPZZ0nzSDQus2g/P9eUxb
         DWGIbrcQ1Gb9G9wyrNWq24f64OOiL9JvbGa0SOJCznXhuZv4Mp/r5HrXql3COMrdgx2U
         GiiP+L0XWa47bhfEwICo07z4iF0h3QvyKAFwpw68NtQvCMJKvofHXwzLEUfO1R5OEbcB
         OS1LQs8HVmlGhJgfQ3BYs/6Yb6IZmbmYDpORtxiXRLQKRQt5fUW2BKRtcGNoV38e0xDt
         eQlg==
X-Forwarded-Encrypted: i=1; AJvYcCXmcXmYNOVPUOfYuKUvTbu+TDQVF1zCZ82GNsXVeIKhyzi1nGhx6grMGbUJ9eJH1Y1fLUoPczND47fpw/ED@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwHdZ4ajxpbgLoymuDa2bnP+1ii0QeaMcq6vt2OCwx1W10c5R
	hw/3/AbAvny6VdAPnHiF2vRTfaVTWhAxds3QUARkncZbn6aKPXRu6tu+HFv5eC5YumOWxT2vx7t
	bK9C9pZNZQcnR35p/pObIySxb+6qpwUbOs/w1giksqyCZsZBRBVYk+BdPrLbCLTNghC0AAAA7em
	GgOxEWw2ycOziM57mIH7JtMi0CEkdYZ7Vq4L1QFMPoGYU=
X-Gm-Gg: ASbGncv5+b46I0CMxlTTxOz1dpkz0ruJ9N23b/0dmgGHiYHkK22txmkgAQwNZdw2l5b
	+413rZq+LiIkLbL1l65pdh7HTV3/X7WnKttds2Nl14Xu17Frq6wtc5hoaWfuQRqJlDnZOQ55ggF
	Y8hnlYUxyFWzscnc2pEaqXGmpkRWpB2jFr+NYKhFIWBlErAdYiydRwToYWLBvLj7dRuBk8VVAhN
	2OB5T2as90MvO3z43V/Kga21t0=
X-Received: by 2002:a05:620a:404f:b0:8b2:e922:5297 with SMTP id af79cd13be357-8b4ebd6fd06mr928362485a.21.1764165841535;
        Wed, 26 Nov 2025 06:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsbcB5py6KG3ibgJ3gEgq7um1CGHVok1rTCxoPdVhPI5x/5mvjr3hUdeJyz7HAPgluh6fFxRrAfnZqtAPHkl0=
X-Received: by 2002:a05:620a:404f:b0:8b2:e922:5297 with SMTP id
 af79cd13be357-8b4ebd6fd06mr928355185a.21.1764165840892; Wed, 26 Nov 2025
 06:04:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
 <20251120155825.121483-7-r.mereu.kernel@arduino.cc> <45329a9f-545b-4425-9667-26bceca67982@oss.qualcomm.com>
 <CAKA1Jha7HuEC-KgGktmuiG-U0ZVbKnmLU4bXTwLg+paoLpQ=kQ@mail.gmail.com>
In-Reply-To: <CAKA1Jha7HuEC-KgGktmuiG-U0ZVbKnmLU4bXTwLg+paoLpQ=kQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:03:50 +0100
X-Gm-Features: AWmQ_bnu7I2BV-0kj-pM4cBdPYEuUByoq8WpKikAvYHg-1WklPoc-0N_i0hL9x0
Message-ID: <CAFEp6-0kHtbXKQRtaLUB1bqRV5s_c_bcoAWPdTOH3JvV69rUqQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qrb2210: add dts for Arduino unoq
To: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net,
        Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, m.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=692708d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=JSZs4kpC3w6-UMKaf54A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1B_IZPLW-Xct93TOLHuiazaIh6P37wjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDExNSBTYWx0ZWRfX2FLED6uLUy37
 MdEg+6rj2ulq6Buloq7+9tZcTRghFvO5IeIWvRG8yd3HD4dgoPgBFuMWkKmwe8caurWJYE5hQ0F
 Dn5EBHsrgyAFr4FmhQE9pkJlyf10SOVtV2vE3UeMSf7T0okOeT9GfRO3foxcMtYLf7nzWz1FwLi
 Rd6onTgOxbTEioMy/LlyUFymtMjlaOQgGtfjkG+vZqEhfrA0oT330+6lBtTCpcEMbF79byh1CBp
 q+YRy/XK3+AHymMKe7ZiImBi0ZRM0O4n48ZJUQjBAfaW8p6tTK4UfKnAPOnknqpk8IVG8qgZH+1
 rsciungp98Xax454kV2CEoO5TZBZcOrWbCX82d1AOmAoeJKmPiUvbqYMnD/t+lYGnNrOWvOf3Jx
 leUKCDmbbm8xj1z6MdUTfp063lgRLA==
X-Proofpoint-GUID: 1B_IZPLW-Xct93TOLHuiazaIh6P37wjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260115

On Wed, Nov 26, 2025 at 10:28=E2=80=AFAM Riccardo Mereu Linux Kernel
<r.mereu.kernel@arduino.cc> wrote:
>
> On Mon, Nov 24, 2025 at 12:44=E2=80=AFPM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 11/20/25 4:58 PM, Riccardo Mereu wrote:
> > > From: Riccardo Mereu <r.mereu@arduino.cc>
> > >
> > > Arduino UnoQ is a single-board computer combining Qualcomm
> > > Dragonwing=E2=84=A2 QRB2210 microprocessor with STMicroelectronics ST=
M32U585
> > > microcontroller.
> > > Support to a simply boot to shell environment includes:
> > > - UART, I2C, SPI
> > > - onboard LEDS
> > > - eMMC
> > > - WLAN and BT
> > >
> > > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > > ---
> >
> > [...]
> >
> > > +&wifi {
> > > +     vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> > > +     vdd-1.8-xo-supply =3D <&pm4125_l13>;
> > > +     vdd-1.3-rfa-supply =3D <&pm4125_l10>;
> > > +     vdd-3.3-ch0-supply =3D <&pm4125_l22>;
> > > +     qcom,ath10k-calibration-variant =3D "ArduinoImola";
> > > +     firmware-name =3D "qcm2290";
> >
> > I'm not sure about this line but otherwise this lgtm
>
> This should be fine, I'll gently ask Loic (added in CC) to confirm that.

Yes we need to use the firmware APi file under WCN3990/hw1.0/qcm2290
as it has the correct configuration for the QCM2290 platform.
From log: The wlanmdsp for QCM2290 / QRB4210 platforms requires
single-chan-info-per-channe feature bit to be set.

Regards,
Loic

