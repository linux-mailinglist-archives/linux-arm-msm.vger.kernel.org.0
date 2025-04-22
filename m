Return-Path: <linux-arm-msm+bounces-54968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C6A97303
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 18:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CC633A357A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 16:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ED0EC5;
	Tue, 22 Apr 2025 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxKst7I/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8A278176
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340433; cv=none; b=rioVZM0r7N2GRiw1FyYgONs2iGmdaHnLDUsoDwXghWYlV2o0FXrZiJJJNZzXLEe6cvLantecFeKfmxro/a/IGlnC4lH4zQculvwLgAOFJ2qArBGibIViHAWM7iiGf4dswiKPJ7jIKlLaL7Cmt90L2LoiEDXG7LKKgyxnOdP5TxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340433; c=relaxed/simple;
	bh=q41FPq0f05JtlihZrGKwdFbEk/8bWbV9HQOdX61yRiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLQbmpRQ7ZabJeFN/y3UjMpq8NTkxS6RkeZBFKeQ7m+FuH3vr4EUmFO0SEscno5CcyXgJDI20AVwCg1zsccKMPu9IDEZp7IuK47UcU/6qF14Fq85wsEZlgbtgQicRYrOKA20/tAPiAR7VcE6GuluwTaP4I4Z64EjQX6ni3Z8Z4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxKst7I/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCg4oK006593
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 16:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7esB2aoHj/zc0balrbTUPwT6TMFaoUq/f2Uz5vJdfmo=; b=lxKst7I/+9Bi83c5
	mRfFLwOADJxxj31+h04X6djc8PCdSjKmy3psDs1N7IPwiw46AaRQOI+xx886sWao
	oFTb9r3nMQ7Lg2BfYh+NaUO50e7l9RO/xl9ju8LySWm0igAtHzArqnYeNOMBiTwM
	5cpUE+hdF942nJy1MIEIfL9YMtlSzZX5L6npAC3Wz/g6+fzSso1u5Irln0QHlpPX
	SQjgslyYLA4kz1pemYVz/Yh6EiS+lENZs0UOhohkV0TPpHJLrYZ2f/bI1tbvbkUW
	s0fRdZg6ilKSmDNZ1tco7UAghvVvwOsHIU1iumvIu46UaD+zxbXZ+Flmo+KzEwxm
	2LRBFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426r9xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 16:47:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f876bfe0so847854185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 09:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340429; x=1745945229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7esB2aoHj/zc0balrbTUPwT6TMFaoUq/f2Uz5vJdfmo=;
        b=hfR21AccD8elwNVJeVzBbBj/J/QKluhizAV32HKE9pU2WUDOsDG9RZ3NuABMuBhFCf
         8e110qkQ9KOQxc3xZTskmh/C0brFFWYOqT8jDPOo+Zx+hXYP0pV8eN2zGN9OBC9e18oZ
         OCecBLluD6Ta/OkhktTVTJYi6ogVDdcyuMjsWupfCAmGnfMNx1A7WfjmDCOhirn1+yDj
         rq33tAVaPCVdhaokWQcIUh7iIXzlYcc2oM+MbINNTFR/ncUg64meN0NXurCoeX8uuFir
         tR7hL/olgFT44Qt3U/uljMjMdOmwCB3Dlxkqa4KTOjnunwRvBHS2uVrA/a0CXz57+0hJ
         A07Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNlreoHyidNwHkY0/CdjLIha2Hpq8asJ37ZBZp0CGtud9c9oFtyostcdg9ib5kMvHOq5sBfX5EtsDnVmR6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz612ZtTLbq4qpFnxxfNz0BWNhQcXmcfQzRlqE0+5EB/Twe3DEH
	cbIisnHMrV1BHhs8N4J9hmnIIG4L9K7Gq5HxIdOUK+4fwd5ffGfLdRUGoUziBNAMlbPiSJIs026
	Rp2LT3q0KEZXlF0S/36zMLc7hQHcluMNH1/O66C0RDTDfzqWlUuyNunzQ235uh+NX+P07TooQ7e
	vDg1ejjgrnvAC1DrEcSaTm/LwZZK4AJL1dGZYzUMk=
X-Gm-Gg: ASbGncu5UfSHnMaqFI31uav4f9XHdG9JZl5P/IfqIVPbl1JaJfTawRcphRpYPgvJFS2
	Zoqr3YOpFuTsNqelBUkdjenOytSuyDOzw+87tqJXKq/ubYE62zcmz66ZRtySCmHTkv0vL8Q==
X-Received: by 2002:a05:620a:d8b:b0:7c5:4463:29a3 with SMTP id af79cd13be357-7c927fb6abemr2521237985a.25.1745340429672;
        Tue, 22 Apr 2025 09:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG3qOQXOo9TwfXy+ZCRASfPs61YghUNcjXEoKQ9Cb2mxOyUAtnFLUy/fxANhDcySjFS+vdZv7enndytIuRPD4=
X-Received: by 2002:a05:620a:d8b:b0:7c5:4463:29a3 with SMTP id
 af79cd13be357-7c927fb6abemr2521232685a.25.1745340429232; Tue, 22 Apr 2025
 09:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
 <20250418141147.205179-6-loic.poulain@oss.qualcomm.com> <20250422-nonchalant-bald-mink-7c2d34@kuoka>
In-Reply-To: <20250422-nonchalant-bald-mink-7c2d34@kuoka>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 18:46:58 +0200
X-Gm-Features: ATxdqUFjcv7S-nnV4aqImBi-gZ-qp_DaZjNj_vXIRlmLVC63QNcKlWPv4CoSSKA
Message-ID: <CAFEp6-365xBQJL7A6vP99R5sBcYPDgwJEQyUfoFtuBBMRO2WVw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: dt-bindings: media: camss: Add
 qcom,qcm2290-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: rx4AewCpmVpQXXOlc5UHmASNhxhALS9c
X-Proofpoint-GUID: rx4AewCpmVpQXXOlc5UHmASNhxhALS9c
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6807c80e cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FiTWQ0jTrq8e0WeyI4oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220126

On Tue, Apr 22, 2025 at 11:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Apr 18, 2025 at 04:11:46PM GMT, Loic Poulain wrote:
> > Add bindings for qcom,qcm2290-camss in order to support the camera
> > subsystem found in the Qualcomm Robotics RB1 Platform (QRB2210).
> >
>
> Just one subject prefix media. No need for two. See DT submitting
> patches.

Thanks for the review. I will resubmit with the corrected subject,
keeping the supply names listed below unchanged, if you're ok with
Bryan's comment.


>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../bindings/media/qcom,qcm2290-camss.yaml    | 243 ++++++++++++++++++
> >  1 file changed, 243 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm229=
0-camss.yaml
> >
>
> ...
>
> > +  interconnects:
> > +    maxItems: 3
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: ahb
> > +      - const: hf_mnoc
> > +      - const: sf_mnoc
> > +
> > +  iommus:
> > +    maxItems: 4
> > +
> > +  power-domains:
> > +    items:
> > +      - description: GDSC CAMSS Block, Global Distributed Switch Contr=
oller.
> > +
> > +  vdda-csiphy-1p2-supply:
>
> Why isn't this named vdd-phy-supply like in every other binding?
>
> > +    description:
> > +      Phandle to a 1.2V regulator supply to CSI PHYs.
> > +
> > +  vdda-pll-1p8-supply:
>
> Similar question.
>
> > +    description:
> > +      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
>
> Best regards,
> Krzysztof
>

