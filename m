Return-Path: <linux-arm-msm+bounces-58193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F55AB9A2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD7D189EF4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 10:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024FA23506F;
	Fri, 16 May 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mh5cU1vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438223370C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391357; cv=none; b=iBIRIfJQn6FLwiaz/JOnaOCYVXCgK2qNMmfrEEIlUpcSHB/1SG7oUqEblZLYyu11SuHnstVlaepl6qnuzegPZgPnuocbyyGvMtsxaWYy7cC2AvEy4coe0oKk/K4645lCt4euNMxGjAiU/5HbzbrepbG+G7dHbjTjmHNDOl+9+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391357; c=relaxed/simple;
	bh=J1Rlv9DJPlN8WQUQqRM+vg0Ho4hMW0bN34PmMACs0LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITCH0tnK/2QOn4wYj5MOEDQ3y+7Dj6sNv2/IVKI/tboMGVkCJInJcugDlCy5byljIH3J/K04r6UN0muf+AESd5Pqd+K/w/+yJ+qqAxovc2s4K9817NWXHojwnDcrlxI8LvP5P410c7DB8v/cdQ2sapwD7RN1eT8l2ZjI4CCLmq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mh5cU1vp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3DnF5024326
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1Rlv9DJPlN8WQUQqRM+vg0Ho4hMW0bN34PmMACs0LY=; b=Mh5cU1vpS2vvPs3m
	P4YI91mGBOx94fN0jt+pAjvNAJY8pzAm+IHgVNi0prP3uD79bxry9ddHpCFlUBEn
	0vYFMkeExKP6IEEKDC9UsNlR1eDJL0N2i31w6PUFvpVoEHbwqPUh3AW3wD8hvCPd
	WMp7ZIteXIOFMz7ybxpRYl9hDjLvhsqZqSAqe+plnZ+DcV/o1KLIw4nSvRFUCTup
	YTEH3ED+urLVoJyVRyTuSeFgQhlbSQ3dOfEYU1ll4zoqpqY/4xKudw4jmte/bY60
	nH1qqz2wlNtuHqzqLr2JQsv4WsglL+ejGwvbcTcEHPu4wk93VJMWvCdri8KJ0H38
	qLLm8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn1tde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:29:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e816139b8so17443455ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 03:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391354; x=1747996154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1Rlv9DJPlN8WQUQqRM+vg0Ho4hMW0bN34PmMACs0LY=;
        b=d9w4s0u3MWWq+N4iIAFnrbwubEu8gvglRLoTbbE8RiMR68SM4z93OZ1PBSqf94RfyZ
         sVnMf5L2rIX5CIhGLA5idssiwK0zAwNrBg5W+c6gxWCQwmR0WDf4RktXAf6izahEmoRO
         sftR6br6PHmIxwsNfzgEA18s3YpOjr/kch3jPMICHfRROEHurVavJJIIxw9YbAcaSijw
         asN0ZAsBIm86+3uxLRum4Tr0EdqTrmyl2qBDRoPw12iAmimuqUe7Hu/ni3ILZ/NwbyBt
         Hc2RDMjGdoVRBmbH4dw9MYs4eLwgb4MoZoQoEYlEgP6mCZ/lQv9WOGFgU6bxPNWXzrCJ
         8KQw==
X-Forwarded-Encrypted: i=1; AJvYcCVDEEQ9JY6EzX9HUoeXLkEXusKpDYELE21f3txN7XEWYHMSmN+VI8BsP6ISCDFgNwO5aoBpcmV8FcyRpD8t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhl+fbDJD7wdTJT9VNRfVsA8aorEbxJMmSMDnL5Y/DQRWogWGs
	HbMkG0+J/YL6/TjdN4EcAMOR4+0xA3RxmSby/BfxDbcTMp3GaNLiudEogx6qzwtBnMdXyqt3u4U
	16xs7Gnalqvs2zMafSbfZR6lfDvq3CLEY7h0XaMmOQl4viRDOXC5f3a3dp/B9JZjpV4lv3TaB+a
	IeKTXvh68aes4YPm/yX7XMma2HcK/cdOyy/bC9aAh/TCQ=
X-Gm-Gg: ASbGncurGrfvkyFuMhVs0iI1ZlvofLecJdS0PHpAaeSLzvaeuTSlQPEnKfwp5n5z0N8
	f5sWPcWVmDwK3yLWsTxQP/FnhA9F+dmcJHI6nK8dP5r5xAZCAIqpAoLfaHDzuNuxoI/dkHQ==
X-Received: by 2002:a17:902:ccc1:b0:225:abd2:5e4b with SMTP id d9443c01a7336-231d43a18c8mr37734275ad.16.1747391354579;
        Fri, 16 May 2025 03:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZAc+CeMJekoQFW7pX27l11esuS+Ik/pvnn5IvCnGgOf5pBzK5VCsUKGY1MWIIJgATFPYlOTgG+hSzTf1RdEo=
X-Received: by 2002:a17:902:ccc1:b0:225:abd2:5e4b with SMTP id
 d9443c01a7336-231d43a18c8mr37733975ad.16.1747391354168; Fri, 16 May 2025
 03:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com> <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
 <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
In-Reply-To: <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 16 May 2025 15:59:02 +0530
X-Gm-Features: AX0GCFsiaMZlXOS05wODRIxixqHxUY50BuquyqtK7dKtFH-53SX-bL5lc5kBz7Y
Message-ID: <CAMyL0qPH2r8oXOrNp3jF-nBJCRCZzJr8rYrHn+Yp0MHR0Wy-vw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ul8MwtqPxQFkxh8308u0B40JXvtcCByo
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6827137b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=U-jVYuukGFQHpZbOjhcA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ul8MwtqPxQFkxh8308u0B40JXvtcCByo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5OSBTYWx0ZWRfX7K9b17G9bnIT
 LA1R2lkwvScZhyy+mCTiqjlTUe5JwzAL2LiZL99qBJgWWWj400udQPXkCt/giUVYZkUzbySgkvH
 5FtKL5dCkjJsdgtbCFl8DHSkLF14pIt8sgliDOJuO45LJJceezD5ctvhSMpIS8hpnkdYYBT9hO0
 URAIzZTA4aWQYw6saC5GHGin+6pRl7a4h++Uufpr1UixHgNsPaJLMmmAvr8KL2zf80RQIwg+bS9
 ZApqusiOg46ZwIfe2Q4jpx1798byWUa0jAdIg42mahVy0840a7TDrllsOneNrqbRIh55W988pNe
 QU9pQjRhzrbnn9FK9Y68yIvILqYnN+YBl9vb725UCK5eDcG6a5hxLm+pJfPkwMCJZhQIle1Z2hy
 JdxX5ihcqRoPXzSlIt0GDtmtvKcQpKikmE/kEsBlaqKAa2O6cLX0WoLdMbdPOeeKJtOAHkSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=893 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160099

On Fri, May 16, 2025 at 2:30=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
> > On 14/05/2025 13:37, Mrinmay Sarkar wrote:
> >> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> >>
> >> The maximum link speed was previously restricted to Gen3 due to the
> >> absence of Gen4 equalization support in the driver.
> >>
> >> Add change to remove max link speed property, Since Gen4 equalization
> >> support has already been added into the driver.
> >
> > Which driver, PHY or Controller ?
>
> Controller, see
>
> 09483959e34d ("PCI: dwc: Add support for configuring lane equalization pr=
esets")

Yes, this patch is helping to solve gen4 stability issue.
>
> and commits around it
>
> does this change depends on the patch 1 PHY settings update ?
>
> That I'm curious about too, but I would guesstimate no
>
this change doesn't depends on the patch 1 PHY settings update

> Konrad

Mrinmay

