Return-Path: <linux-arm-msm+bounces-88447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE3D10ABF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D74A63038013
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5746B30F92E;
	Mon, 12 Jan 2026 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLx5sOeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyzL5qCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94830E0E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768197699; cv=none; b=niaum3TbV713m69DazwLQpqFjJc4ePVdPXxU/OoKOceLvbvCE294lT/i9S71cmI1eZ5KC+IS0/ZVqGO+DcI1Z7KS+EzGakjjmhtfnENP4dwTIrmfuVoM2IBrIHi/3Pk6wWltXEys1DFHgm67o22R0F8lK0hJ6RgAwa8DLDKvXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768197699; c=relaxed/simple;
	bh=ldRUibakNqt+KrUuDSlSldBsPaK2f9o6bvdH6yhF4fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OedVFbxIwxSH/F/Jqa54sEXRH//CZhBCr8uVEboQmW2e0GLEh+PhXnz4hXbNbxwYom1MTVlgHD7as9nlVcoEW8PzMMwckgpHjAap40gynURAsGelMnLbjwfjbUoIRQBop+ysnzu5RLcnXRe7VzqwMGyrZrTatoVjRXPoREVIxd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLx5sOeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyzL5qCu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BLHORP3014049
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4yyeW8H9AwBD3N3+BZ7jflIWD9eijZ62aIyvZeBMPk=; b=kLx5sOeqXocqPCXX
	I1XA0Le0xBJRGm6AHDUSPxWVDnMpp27XW8mIcqXVRFzWENDU3QeqyCD1ISkRouP0
	HVTLrxTkxYRH4v0+yUFkAwHfU8BUTVmLsPXGddtEB7oKqEGMLZ4l8sXGibjrtWfH
	slIk9Sr2KK/DkKjz5YN8ySTAN0GzVfFd5FA/XxUx7dNJxb7M/5VE/JhrcJ1XABdK
	t22TrF0WcIrDxKaZasba0psNeA0AtmnwD4CiNUPWkiDUjWUXT2qIeLE0laEOJwU0
	UUYwnUU0Ckl7+esm6KOmVzeP9u7KSrdhV3PROmeSDVM60PtUcdHBjZmF8+wzrVCu
	/3bQuA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuk46d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 06:01:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso6477850a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 22:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768197696; x=1768802496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4yyeW8H9AwBD3N3+BZ7jflIWD9eijZ62aIyvZeBMPk=;
        b=OyzL5qCuARCzarj1+//N1/LPnmWSk101VX4w/zWGwniCMwxp1QhTgSHeUCHS90ggm6
         +EL3vfp2eAAUCNpFRXIGm+mQFJ0VcgtgIuG/u4LT4OduVuH4lcVWpvdTOndofuwUzFki
         seZTsS/OQvTk5GXZ1Zz9EC7c+35eKxk6DRCWHGKDBvq0/TIcwARmGpNQtk948eNVSkD1
         xnXjc0fZuAqYoi4NTX9yaunZ82d566EfkM954ja7Yn2ntcxLf0wyxIZFzEMh3grbG6mC
         Hk4AA7PZTAjMtqgVC4QYDxuDoMZTSCYoRlHxz2NagTqFdlWltcdwfT2w3txIDkhHvirQ
         caUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768197696; x=1768802496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4yyeW8H9AwBD3N3+BZ7jflIWD9eijZ62aIyvZeBMPk=;
        b=CJTeXDWL+VMu0DkBijNJh0PUFqgmcPATcaE4Z4Z60s5BPGbEgF85v6TIwaa2ExaZgS
         pVb15YfnfjFIojhrus7FGuS1OEzxjsajU4h7UmgS0+fS1S+W+4hSoNJwpBw3dnHWCYgZ
         L6L00VFQgMEVnB8YPMgfJoCTgsDcsSKJFcSbNX0Kc7i6rr0LWpzg5lNOwq/ynBDG4m06
         0H0n2138WcvMvey+Mw3FKXenTSeHQuGeDOkLbOez8uXuylRVeMKqCWNhUMgg8F6t85Ok
         2Kb2qKnTHs/Hz+1/PQKpPVLNOnwE3soLrTv5WShs+rGq5nw/es1pJLMl/argUojtMKqM
         I+YA==
X-Forwarded-Encrypted: i=1; AJvYcCW2AJKty9VV9cSjW353onrMu5Tm6HZmduBWS2dgZ8vfblzf0DSD1l3s3zyhUaydubWDWlWAVn0RWDzVq3q/@vger.kernel.org
X-Gm-Message-State: AOJu0YzYlhP0fxHn2/KqNOP796QngfhXylKmEnhPYhGOnHZ/BbXsOHGJ
	hKNDMYoorW4eRhtqJiO1IkgyxfCEblX9i4KD0n/6phx1exWAiOwICfTiOFukQNe+prhrgRmr/l/
	a5EU2cl5Gfcnk+NB/vQHLNXUWfGA8qoTH8xzQCrgfvBIvUVRaCJEYsVgMF1cOyJfCzAw6mOzdTn
	a808s5JiwwlxaHRXTTy2i9SqXspmmRPoyzpmeCJoYZo+s=
X-Gm-Gg: AY/fxX71+qmaljdj9aBxZZBfH9syeQS8S+Ax+jKk9cTHfdzCNXv62bS01wDKFQ2PwUO
	i4igxueyFo/APuDzdYVHJYlnStQ9Zh23Px9GtEtGREF56mQevo32PuJ/TJGiHNP8QZDbCLdzPsj
	xwXm9OhAF1zqfWdTdDRwCcNI8HWtufvIBC1B8auTk867eZUHcAMhpHVYRySR1q6oofz9wsc7BvW
	yM9uvSi
X-Received: by 2002:a17:90b:3c01:b0:34c:2ecf:2b2e with SMTP id 98e67ed59e1d1-34f68c282bbmr19099086a91.12.1768197696258;
        Sun, 11 Jan 2026 22:01:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1lj47lNYZdw48nFMWoPsvTSPEplpxVaR/Afv8C5xbG258eitLtUGCVuazNlPkkGI6u5Gq6O5nJElxfNhc0ts=
X-Received: by 2002:a17:90b:3c01:b0:34c:2ecf:2b2e with SMTP id
 98e67ed59e1d1-34f68c282bbmr19099049a91.12.1768197695737; Sun, 11 Jan 2026
 22:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com> <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
 <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com> <ak6xsow3cobhe64y2koa4v7w5dkdc4v3zlmpokws4nxmu5c6rt@kdgm2oqxxvcl>
 <d5d1d6c0-87ab-42a8-9816-359a64b9112e@oss.qualcomm.com>
In-Reply-To: <d5d1d6c0-87ab-42a8-9816-359a64b9112e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 08:01:24 +0200
X-Gm-Features: AZwV_QjfN1MA6eA9W83iSHOPi0V7tYeMDWt0snIKUwJlTSUHGhiFRZIViitH-Q4
Message-ID: <CAO9ioeUTPopTg+S-6uASXa=L4DQaVVEJ_CYRGzKbJR3MkcZMFQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NSBTYWx0ZWRfXzrdBKXFz+Fbv
 xs/0QltMB5Wb0ucdTKG++64jY+UWgCQZ/AsZDW03oOCIJ1yAokof2YOicfHgym4pPoGEPEN738R
 SeieahT5DGyUEyTOk+S5HNWXnbaDHom7sJUk6R/retpMUi0EUskvpKbCFNTyfbNjNnC4M8N+TJ5
 y1fa2WAyy8i1LYdzdcg0GyuMbjiii5zlfax/TZskc1hRJdDlhDT3osa0oyu4kCt4FnbwjHpgzQ9
 FYUgWg4B79Q8R3h5ys5IQ7ukDWMTz4AYQIlTXTM5m5vrXnEgONuKmDhveSPUi97a3fbnfg0jAuy
 8k/9zOTy5OvFo+Ej0n1tY4Nvcsfqw4WCUgPwK2HC8mt0of3aSu5krjO3U32JJO4mU0F3lb8cPjn
 t67iEPMAJ9iq2VZWQZf0ZGYxHdvD3IVJrycnISgxP9plvK19vOuWpJV7xc0U9Eqlc18gtrHV+ci
 VQBtcn7oAOTq0RyONuA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=69648e40 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=E746VpiyXhNrftZtulsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jC8WCppfeyDwPznZciWsFRfnw6LIIlBR
X-Proofpoint-GUID: jC8WCppfeyDwPznZciWsFRfnw6LIIlBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120045

On Mon, 12 Jan 2026 at 07:51, Yijie Yang <yijie.yang@oss.qualcomm.com> wrot=
e:
>
>
>
> On 1/12/2026 1:00 PM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 11:12:09AM +0800, Yijie Yang wrote:
> >>
> >>
> >> On 1/9/2026 7:29 PM, Konrad Dybcio wrote:
> >>> On 1/9/26 8:59 AM, YijieYang wrote:
> >>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> >>>>
> >>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, compos=
ed of
> >>>> the Purwa IoT SoM and a carrier board. Together, they form a complet=
e
> >>>> embedded system capable of booting to UART.
> >>>
> >>> [...]
> >>>
> >>>> -  backlight: backlight {
> >>>> -          compatible =3D "pwm-backlight";
> >>>> -          pwms =3D <&pmk8550_pwm 0 5000000>;
> >>>> -          enable-gpios =3D <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> >>>> -          power-supply =3D <&vreg_edp_bl>;
> >>>> -
> >>>> -          pinctrl-0 =3D <&edp_bl_en>, <&edp_bl_pwm>;
> >>>> -          pinctrl-names =3D "default";
> >>>> -  };
> >>>
> >>> Is the backlight infra different on the Purwa IoT EVK?
> >>
> >> As you can see, this Purwa file was copied from the latest
> >> hamoa-iot-evk.dts. However, not all nodes have been verified on Purwa.
> >> Therefore, I need to retain only the functions that work correctly and=
 keep
> >> them aligned with the nodes from my initial version. The deleted nodes=
 will
> >> be updated later by the respective authors from different technical ar=
eas.
> >
> > Please, only delete nodes which are not present on the Purwa IoT EVK.
>
> This isn=E2=80=99t a deletion=E2=80=94it=E2=80=99s just not ready yet. Wh=
y do we need to include
> all the nodes like a mature Hamoa platform in the initial push?

Purwa seems to be mature enough. What exactly can't be enabled at this mome=
nt?

--=20
With best wishes
Dmitry

