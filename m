Return-Path: <linux-arm-msm+bounces-55281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C2CA9A4E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE91E3A5616
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D26B1F872A;
	Thu, 24 Apr 2025 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgZC3Uiu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E881F4622
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481199; cv=none; b=q8K5Tbr33IzCr1l0kGc1V4GsNQLv0yWldJP7WjaIzvrynR6iRFj6Dpiy6htSN4iWqvLCD4RjPqLulE1hSxh2CSsKL6C/HJvbNlNLhQhtNNngtgITYn+2/+eAterx3hIO+Z9u0KPnz7tC+52lqreMwI8H26P4IPYgfKBQlL5C7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481199; c=relaxed/simple;
	bh=/XauFfBfDLiuFsXcUDVKCdVXifDbO2H0iihUA0ON0xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrhE7NyThL3iGNPuHZ+JpHcNJI3nlRzXpgB+TBoFjDjOoPbz/gMUbao8Eo52tsEa6hw+f4BRnPSS7YDaVKsF88qwlVeqQpkN1M0Tkr9GniuDpigPPjfrPUuH5FQ6AYj1rcg68LFUj3I0Hs6dAIz8qAQ4AAkY4FzI9oaqX6ZAQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgZC3Uiu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9FJ031013
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1Sl6rUgs8Bwln/XzJSCqXN1ov/Qw4BQ0VOs4DMYdN4=; b=BgZC3Uiu+epvYpOq
	0u6XTNrzcGKrwwMnJUZvZ2eO4sCDpupe3kGn1Cj37W1Xd3sw+ovSPgxek7gY0jbj
	ee3InnyjDpA343vSH4ke3B3FxJM8L1DtrYMFsMWwtFtEK+w+fBlySCAFzs3Kw5qf
	1k3jXNrj+mOGL7UNdgtvJoiuJZSD0FxgBp0633GxRVExNPPq0yYda7C6G/M2aKu0
	//xVUS8XwP2BLe/AuX77ZCZjCBoukGTegaLjLlo5oDdgcgxFKzm7OF08MAqPjFmS
	MCU33MkIttI4+7mwt0OzsqENFuwHB0hx0WcVDZOGS8fVz4/EENHIkAFe+2i967Ly
	cbQCbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cpcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:53:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c791987cf6so154222485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745481195; x=1746085995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1Sl6rUgs8Bwln/XzJSCqXN1ov/Qw4BQ0VOs4DMYdN4=;
        b=VAalC/A1LROX+JF1eYYCM7AtKOTQOYXtwjsoaJVrZDGGY+zRaMKExIGHxV4z4mQB0Q
         NKxp21e0Kixn/y9j1L9rCCWj7+FD6lR3TSWgiLUXkkCPRny0AE0qwuBRncpA9T5qLblG
         V1h3pJIWpO32gm0D5POtyJu0iMePUurxKV3exGBR1nKuHDvW8TngB7B168S9aEu3ZdfD
         V/rWxeTv7N4ez6rnIXNFETr/zv5GuCXzYDoJ3HbOc8PjiRKVcL5ZEyZyI98KqqDcdqFL
         I3646ZV4fjlsCIp2WjJCmsZRqXopX/8ICMNshPgxGhoIxSgzm9DT3iaQw229O4yM0/7n
         HVOw==
X-Forwarded-Encrypted: i=1; AJvYcCVD+mF6pV19OMhUPrgKB3+9RiymE70w+EzCEmCaDSUKyQfZ0L+51iEvBjMxUIL1xbI/oB5El6iWfJq07cPW@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNRwZs3UwtLcd9hFfSfXjZIRrEjnI/p8Jgau07P9Q3dFUhBVl
	xS0zEjFs36a42a41V7PFFKz4940yCVRnXWToyoqRzBWbN4uw2iWITAedfbGy7IonvKg9jGJw02x
	cYD2oWcXVai0A3kU9dx6j5J0KxFYke8nfhi4O8kVosTC2e25XM++YXMyZ2xfMHdGgmVzVuSNNBW
	r2d9yqE5xmLFHJFdbH7CxR3H4Myqv3tu9Xl459UX8=
X-Gm-Gg: ASbGncso3zWea5ikuAoL7vAhFlEv6REaNgwTrE6lmmD0bLnZO8WElRk2jBhT2rvWzzu
	ZYUUF5/azU2XleWUEhea7KyQVZzkt0lvP0Bm4U/pfMDbiyzBmD6Cu3cNXUJc4FoRl8LgXP7E=
X-Received: by 2002:a05:620a:f0f:b0:7c5:588a:5c1e with SMTP id af79cd13be357-7c956ed7552mr245832085a.30.1745481195656;
        Thu, 24 Apr 2025 00:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxoRtm0YXELpnaS7DAkv7clW4amhFZAIjp6C2urZXmOOqgWsE9GVj9esW9Y9VtDt9hsu5lK2/UP7/fAa/yT4w=
X-Received: by 2002:a05:620a:f0f:b0:7c5:588a:5c1e with SMTP id
 af79cd13be357-7c956ed7552mr245830185a.30.1745481195397; Thu, 24 Apr 2025
 00:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com> <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
In-Reply-To: <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 09:53:04 +0200
X-Gm-Features: ATxdqUGyaIbv3BPE1bbXrVWCYTG3g7Zn6QX_hCaA5PKGIcKkNwFl3oWcX61s4f4
Message-ID: <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1MSBTYWx0ZWRfX+WuvDZDEhCgM C/VKxgXSAS2E/XbHIeCpCVOMRX3/kTcP//469aowzsZlzWOOtp2Pbf7SAZDKGHb444CwDUTo//t JyB8t1vDPv4UZ3lANnyBc0Ry+avfJ7p0ol9IEFQaQ0UMX92pXe+XBgZl9Ttl4OxyAOI4AysK2WW
 Qz2cHxFzxIYU9770LeA/oe1kva70z9HR6PLHGVpPFwav4q76/WQmPHtuIwVGpFdPdZhV8pdcGEo wzEZ9E0lCdLDo3A3scl/2nlPIOMRjsuVzwdLgdpxqQ7eXdJlbVWOa5XXnUIONQb+XLULtanPXXj 1t/4z+/aSrUPY4M+dDoa+LR/H5xIduw5HFZMnymWAmKsUbLdTkKVCenhY+iGqVM8tiBl1TAPTQ/
 l6HMrYBjmYxr7z1szieSCsMcEQFOt/oX/PDo14sGBHKUyUXKpoSSudllm+PbQw/RFqTnKvge
X-Proofpoint-GUID: X-eP5EIlWE5V3F5rC4cE5BzsRiZuBMzC
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809edec cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=-OVsPAhMXzR0e6mcShsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: X-eP5EIlWE5V3F5rC4cE5BzsRiZuBMzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240051

Hi Krzysztof,

On Thu, Apr 24, 2025 at 9:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
> > +  power-domains:
> > +    items:
> > +      - description: GDSC CAMSS Block, Global Distributed Switch Contr=
oller.
> > +
> > +  vdda-csiphy-1p2-supply:
> > +    description:
> > +      Phandle to a 1.2V regulator supply to CSI PHYs.
> > +
> > +  vdda-pll-1p8-supply:
>
>
> How are the pins or input supplies called?

Pins are called:
- VDD_A_CSI_0_1P2 (for csiphy 0)
- VDD_A_CSI_1_1P2 (for csiphy 1)
(both of the above are supplied together without individual control)
- VDD_A_CAMSS_PLL_1P8

>
> Before sending new version, allow people to actually finish ongoing
> discussion.
>
> Best regards,
> Krzysztof

