Return-Path: <linux-arm-msm+bounces-74034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B1B8326E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 08:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 304494A6A7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 06:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE6C2D7DD0;
	Thu, 18 Sep 2025 06:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdRlBb9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209191F3BA9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758177297; cv=none; b=S2fHQ4OuAum2gu0EQU8HLjr+z4tyzLeF747ROplp0/eBiozoMcAHJtMR3xnzIjKgxelgmZIc3PzO15DBaG2vsFnjZ9Xzn/I5VPk5RjWdP2f1awh+/0zOGELU+vidNgq9iBN4VqeouMw0IshXdnQPZBuaCVVnB2uG13WWtMCuOhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758177297; c=relaxed/simple;
	bh=+0vSdZmOwq8F/9R/kI0phGtqmphJwJ5lflmVHUCDqVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFP81c0eMaN072in9/dOn8fOHGl21aycLz5u0gekZq1bvdbAjLrU1vu8xauerzZi44MFis/WlX2urZvshKT1qvFdi2x68Loom+IDy/K0BY399mVlMxqpYdZk1c3My+eX0OxPePattL+i5Xv9aB1Fr3J+beH7i1ReIdlrjrddZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdRlBb9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I48EdK014189
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJ+vHFzBs1wUhjHtKO42xRexrj+VJ9lROsx9KC1ozbQ=; b=AdRlBb9BSGouk+ms
	L2026v4vGXrH1CFsu+CRBdl0yTJfQLwpXnopG/j1TbCnmNx9FoZawSH+J6cE4WZk
	jjoZYjkYCRVWdzAmikYXDrpYNUrIRjsNWz78Cet2XOCpoEQ6xkMD6uF6760MhiGe
	eAtxIUwGNmg7z2BGflHcY0bHfDVntUpHJcK3gjkDbciuta1hqoK1wRIJSSjXJp1+
	anZewHoIa2YXlOk4oqPyo0vcrwm8dWGDcrTjJuOdVbXxbY/Y9X5aitKXqr+OQQW6
	gOSrS3VQFmPazpgzHAhP/JIYcBIXAIwsB07Qd1LKLac8xKq5ihOaDXfEkGsJWu4D
	BuEr9w==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu57xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:34:55 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-72e98443055so7954197b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 23:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177294; x=1758782094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ+vHFzBs1wUhjHtKO42xRexrj+VJ9lROsx9KC1ozbQ=;
        b=EVx30kkluKoon/QlTE0VNBaJslWPrEcXFR1Kp2lbLfSGSTckHjHXimSe+rBp7kWCIX
         d43GdrFOAiEvHNHM7j/uitDPkDgIDCe73m3kzo8JUyIkVFCled655K0zyqOcR6h7Se5K
         VehopOU7QhK/t2+2YmUsINFPcAkVyua8OHpZPQMe7wmdRKrsVapydP7Ds5nbLXtkl2zs
         +cvj7jmb5N2evoTZcvdnhlkVP7VFNm63CjVaR0ZB9SAb/uX9Uj813R1AxTdTEtA94bfk
         YZa6nRFwU4TH5AhhGmI39+VtGIKlzxc5dD5AXNgdXWEoCJdcPvqpwzd+7p+IFtl6Snsm
         cfOw==
X-Forwarded-Encrypted: i=1; AJvYcCWvg9LCBqcpMvSCsUKrOXHuhA+pWfgxZBRUUHrpQugQGVudsZNC5D5pe2TmS0kjwG/5QxXIrsjd8ZULjYs4@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLHV678lF0IpvhDmdeS8pHGSiIYMArNI3MPuapuJEkGPdKWPR
	PN22asWCCtXZpnI7JGhRO0hpYsxKwNNeegSDQu+NCR8nkFh8DIYnLZCT67dZYmQKGC4c4golhmD
	+7ceMpGXD7EJ5H8tfkPw2rhYrGdp2/49KWvfVajOMsk2xXXqV/3I73zMRmrN8nGu1NuUKv6wtqQ
	FKLoQTelMBcFV98N6gjbG0zsTiRRUkBGfqs4yIFeC/zEk=
X-Gm-Gg: ASbGncvpQsL0lYpnwF7WxpLoncRGt8aC8OcU4kL9hCf7KcA3qSuxjk2ovQG7WyTA+rY
	xnNuPg2iE1Fwgt2+3vZEZNrs2s8ipN6KfaX0uNXXWsDvvtKjH4uhmbBBONLTh0M8AzqesdBVRwZ
	tfWFDUFC2Hpaq1/NB76gokqXc=
X-Received: by 2002:a05:690c:87:b0:723:be18:e6de with SMTP id 00721157ae682-73891b87043mr37498717b3.29.1758177294167;
        Wed, 17 Sep 2025 23:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF359T+ynH7B0YBVHYdIUSznowf26uiydfg4Xsq82Eyh2GFZoEJFfVFBb/Vop9pNIb3aRomnhYSHj8mNK6v8TE=
X-Received: by 2002:a05:690c:87:b0:723:be18:e6de with SMTP id
 00721157ae682-73891b87043mr37498627b3.29.1758177293634; Wed, 17 Sep 2025
 23:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916093957.4058328-1-anup.kulkarni@oss.qualcomm.com> <2025091701-glamorous-financial-b649@gregkh>
In-Reply-To: <2025091701-glamorous-financial-b649@gregkh>
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:04:42 +0530
X-Gm-Features: AS18NWCwmtfeqFQcg9i-B4xEmvRecUhlo2PrXpNtE39W8_lbS3jp3t7HmtTXQys
Message-ID: <CAP0YdSqCD8MZPrj0ekDHG4LhoGm4s3qs_z0xubD5hQ=vBOv9_g@mail.gmail.com>
Subject: Re: [PATCH v1] tty: serial: qcom_geni_serial: Fix error handling for
 RS485 mode
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, johan+linaro@kernel.org, dianders@chromium.org,
        quic_ptalari@quicinc.com, bryan.odonoghue@linaro.org,
        quic_zongjian@quicinc.com, quic_jseerapu@quicinc.com,
        quic_vdadhani@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7VH0DPeUNRfP
 TbdX+y/b3MT2Z3WpdJyR6AleXtIdCrOGND9i5TbmlKWZUtEFg4AdFpkthG1RIFQl9SPnXEJa2bf
 b0XANGFQos5wc4SrusxnPltW5vMpEdkL4hYSXhrWtiMKtysS4IKewcHeZSSMFyoCWR66HajoyYS
 n6y8Fpnk4qFlJjFNlVQIvPrskhzk/qfoTNHsc6etBpBOv28i8Od2LX6Iqul1VyPc4euD6kLSUfe
 z3PrLGGcrM9goivPtru313Nr1411d/LGxXjSelidbmvY5rUbV5I/5a55rk+KXFW8HQC64WVWDOn
 lye4U5gu3oMLrapBJQAnIG+ssBqpXbEhBDf7KSpJOd1LtSiyK7o7rK6keEfMnsvtlIESb4tf9Rd
 jYKJbf7B
X-Proofpoint-ORIG-GUID: cp78nGcZuIUYkEzLjr3kRfQ3eRGwCAuU
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cba80f cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8
 a=oPvcWFQ82zTIPni4Ta8A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=cvBusfyB2V15izCimMoJ:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: cp78nGcZuIUYkEzLjr3kRfQ3eRGwCAuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Wed, Sep 17, 2025 at 4:45=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Sep 16, 2025 at 03:09:57PM +0530, Anup Kulkarni wrote:
> > If uart_get_rs485() fails, the driver returns without detaching
> > the PM domain list.
> >
> > Fix the error handling path in uart_get_rs485_mode() to ensure the
> > PM domain list is detached before exiting.
> >
> > Fixes: 86fa39dd6fb7 ("serial: qcom-geni: Enable Serial on SA8255p Qualc=
omm platforms")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> > ---
> >  drivers/tty/serial/qcom_geni_serial.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I've taken
> https://lore.kernel.org/r/20250917010437.129912-2-krzysztof.kozlowski@lin=
aro.org
> instead, so this shouldn't be needed anymore.
>
Agree. It's not required now.
> thanks,
>
> greg k-h

thanks,

Anup

