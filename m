Return-Path: <linux-arm-msm+bounces-81268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A81C4DECC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FDF83B6CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A00836A013;
	Tue, 11 Nov 2025 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgQibGED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTMiwQRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA936A028
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864134; cv=none; b=ut0tYL2IpwUudN/aKKm+KDDFB9Oo8i0MnctWL8wBM2ynqx+DsHOVaJR3wKc0gFf0d1OLKS8523tNH4aNT45wklxdfiYI+kzxi5PWnSNL2gOlq9W2AKQZZdC+IU9UaYsSrCQ12ULitzlxIMxE5Wrr2AIYdTtrWA2qdBDcj+mQ7YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864134; c=relaxed/simple;
	bh=qWO+LslAAiZd3CNygxHIYmwELeyYi6yEhKewOMVfbd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cP1E6QAHMmtTynXtxY3msC+ZRc39AIxTnRN4/+3D9LyhjyikPTdFuEih9ZS5dqCHHLv2uT3PVqIjLnwKFD4e4TKZbHMI1qt9LC1xTqGmc/umnDKCNb5RnC6wOJDLDtUWiw3vo74PF7asWqjD1mzXIBcxh0pu1bcXhx7hX9r8Gb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgQibGED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTMiwQRh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGG8n2425409
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFlA+rmHCQw2mTHSNf1gtuKKDHdDMWf6upuETlt4zpk=; b=DgQibGEDdAnr38dn
	hlp1J2DOyIw9PACjKvJ3bhLr3qfAgXZRYpfrU1ys943h1nRU56sXJQcfYrCUSorJ
	TmUzfPoaRTlmu0DMQ+3IzfInrM1BhCC9WYiN0vg2VSbDWMc1GSl+LdruscQCWsB3
	FDioslIJPFV7YD17BPji4yM4QlPerQOLH4ugfoNzGPl8ev+vGCFHgYOIAV53nS8C
	YqVGcT7EnVTUhKBa/QdAI3GPKdIsXkf3t2M3adMkvfCXntz5nMxSvFJNfdUvQR/K
	K2spX6loxiPsFV4SMxcX0fPa8MlMgsJdxkOSqLtdIPX8sy+NoYkIXSFStvdkPsse
	sVlORw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac2350k48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:28:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e884663b25so101895901cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762864131; x=1763468931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QFlA+rmHCQw2mTHSNf1gtuKKDHdDMWf6upuETlt4zpk=;
        b=DTMiwQRh/fnagpk556j1jg93eJWU9TUezk5CF+vaPC07D4IzNXUWGx/9598NBuhH3u
         Vf8/Dz2KxvbGJMZA8X7Mgi54vD+pooI1Sy9i/SMZempaTqDiLqmJE9zKC7Jr9kescLVo
         2tstutoeXoNKoFDLXdNEUrNdXiqhjxGOdxe1WaSFnSJ/mjx1RycrWlOUDcqaBu2xYhmL
         x48ihIvZBnbrDcp9yvmQB7Z0O+1uzvl06tsjGoMITBrhGKNgDIj8YKHSWyYOWnMy903z
         0NwAIF/Sp0xpvpjfBrrHDQAj2Ife8oo9yJSLNUZ7hSevhaoEZfBDDF6SfPY+OPsrVTt/
         jMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762864131; x=1763468931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFlA+rmHCQw2mTHSNf1gtuKKDHdDMWf6upuETlt4zpk=;
        b=UuiwGTz5PLNdPJUq/d2+j06x5THU33R5oSruWH/iyc0ekgc6P9vNURA+lX4B6b5eTi
         CtqNzLT3LwetpYDKDsVaT9bqCsw1358sSICcW+jI1rG3PENHTPH1m+b7FC77cJjEo+D5
         HcdVhWhtvTcJOq+j7o8GuuC4X3A6vOXxEfSxVQ91/PF/DCBToaMTLfNpbu9+Imv7lhF+
         VttuvgVDw0QnQynHxzdKCj5qYLevay9pQ0BHDzLAUXvzN+/EFfDTLLB1cOAt9IHpn1LS
         jNr+N1GQG+GY8s5cY9tVEaNgt1tkaBCsecxzjqMGaXT0yq2jmoDesoFz3Pm+gxeMrGBl
         1dMA==
X-Forwarded-Encrypted: i=1; AJvYcCXLv7skCKnSrggxpPN+fVWR9raWDlJQlTZU+L5d4LZnQS+mTORgm504kiqkatpNcQmuuNj5UpMx1R1r2ZQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YzqCx5kQt8WFPwWbCjlr3KfbBtNmNwgfhQdmRI7MkGZUGotBOo8
	xRnmFp71SXKrNCWMitFz6V5P9018qhbN0fhJwDYZEXOHo0YtUF5O/1HP4Ksibnr0dlGHQvpHmbS
	5jUseo8SeoG3kO4ZnMYIbSaLOcr4HamFfGH/mHdNxdsJQzBhURaSYvj+dnfL2qPhgXE0R
X-Gm-Gg: ASbGncsOBo4X3rq/SPZn3q02KpmAEYKu4z3CFTpWUGF99dIH4TVMCuRwYQBRmplBK4k
	paKdyWIsXvUnWrk8GYaxdvvRqGeTO9NvFNk4YkYqiAwS1WSuLQIofQpW2npnfdVBIBpM4w27ivm
	zmXl+Gmv0IP/xyyVGULs2xrs2qbMtWn7lE5N84TCpGORTu+vGdrzQfkIKdc+eTD3Cgicxv1FaVc
	CcnNa56JHDMZjIbFpFHOnjSK3JPw9wVWzhrdVfUUU+vmABP66OmmICmotUz7o5XyUi2SbNnObwI
	9cVN3XON8LvyhdrYe1P8S80/e/eF/JKKs6rDkptvs2N4sYpleZ3lg3yqHU1LQFbycMe7PS8+Gl4
	iuUFkoTTGKrW6pJriom9FTjgI1cPIfPYNe05dl4ssoa+ZjGDIaRf8CChoy8wD4SxwzPP1ohewoY
	41ObwiMyFm0o3b
X-Received: by 2002:a05:622a:d0:b0:4d8:1f72:ba60 with SMTP id d75a77b69052e-4eda4e7a7a7mr134961701cf.14.1762864130673;
        Tue, 11 Nov 2025 04:28:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB0QADbO+w8dIjN2emZaXFkoCmnPbMKIptoyc4K6i/3GMqeYEKpmtn9C+u+nB5MxEt9+6ieg==
X-Received: by 2002:a05:622a:d0:b0:4d8:1f72:ba60 with SMTP id d75a77b69052e-4eda4e7a7a7mr134961411cf.14.1762864129941;
        Tue, 11 Nov 2025 04:28:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd359sm41987281fa.32.2025.11.11.04.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:28:49 -0800 (PST)
Date: Tue, 11 Nov 2025 14:28:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net,
        Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, mm.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: unoq: add dts for arduino unoq
Message-ID: <vzpbuf3hrmt7axry63tgelbkj54kqby6pjnb3cynew6k476uye@6qonkynked2g>
References: <20251106153119.266840-1-r.mereu@arduino.cc>
 <20251106153119.266840-6-r.mereu@arduino.cc>
 <f20fd593-0173-424d-9951-e0f2ad33b4cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20fd593-0173-424d-9951-e0f2ad33b4cd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5OSBTYWx0ZWRfX+xhJIkOPyD9g
 yqdH7EwrKzRpX6gAOIvwEupXyKkbee6GsacCKlfU8gsJN6EiMGfQzzwsWugHfD7p+5qLWP9tbin
 K6xOwr4bWWuPi8fh98kSHOMlNALwdymil1wev9VjuJwgarwkC0jVVA4uRZiInEyAr5qp92BXggG
 s4zk0IWpARy7QQGAJoASnD0nOQhlBsMmUorH5IfIrAS3AlWNm7ydefsyZ5IPEqfxC8VDb+aMcLI
 aDqOm0J9xVvnq0XwvDlpeRwCyememgeIlEhSwA/WqkYW0NuUqCoAvXN/5OBTTUwj/+MamOQ0PHc
 j6WCQu96j1A0HaWGatbyO6RCHBGjzGq5iSUSgiXR+Or4R4fBVEafBo6CYd+RpE9ZLlHbR6ZnwaJ
 v5r/C8tNBLexyQ8kRD50lOgvQKVj5A==
X-Proofpoint-ORIG-GUID: 20Y1OqK5xqZqFMIwUl6EXaD-ofhDEyq0
X-Proofpoint-GUID: 20Y1OqK5xqZqFMIwUl6EXaD-ofhDEyq0
X-Authority-Analysis: v=2.4 cv=O8I0fR9W c=1 sm=1 tr=0 ts=69132c03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7D5TFTMLEG-0mYwEVy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110099

On Thu, Nov 06, 2025 at 05:29:47PM +0100, Konrad Dybcio wrote:
> On 11/6/25 4:31 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
> > 
> > Arduino UnoQ is a single-board computer combining Qualcomm
> > Dragonwing™ QRB2210 microprocessor with STMicroelectronics STM32U585
> > microcontroller.
> > Support to a simply boot to shell environment includes:
> > - UART, I2C, SPI
> > - onboard LEDS
> > - eMMC
> > - WLAN and BT
> > 
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> 
> [...]
> 
> > +        leds: leds {
> > +                compatible = "gpio-leds";
> > +
> > +                ledpanic: led-panic {
> > +                        label = "red:panic";
> > +                        function = LED_FUNCTION_INDICATOR;
> > +                        color = <LED_COLOR_ID_RED>;
> > +                        gpios = <&tlmm 39 GPIO_ACTIVE_HIGH>;
> > +                        linux,default-trigger = "none";
> > +                        default-state = "off";
> > +                        panic-indicator;
> > +                };
> > +
> > +                ledwlan: led-wlan {
> > +                        label = "green:wlan";
> > +                        function = LED_FUNCTION_WLAN;
> > +                        color = <LED_COLOR_ID_GREEN>;
> > +                        gpios = <&tlmm 40 GPIO_ACTIVE_HIGH>;
> > +                        linux,default-trigger = "phy0tx";
> > +                        default-state = "off";
> > +                };
> > +
> > +                ledbt: led-bt {
> 
> The labels (label: node-name@unit-addr {}) for the above 3 LEDs and
> the group are not used, please drop them

Also, I think the nodes here should be sorted alphanumerically.
Otherwise LGTM.

> 
> Looks good otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

-- 
With best wishes
Dmitry

