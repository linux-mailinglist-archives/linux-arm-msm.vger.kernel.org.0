Return-Path: <linux-arm-msm+bounces-87789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40689CFC3F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 07:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4653B3027CF6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 06:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3272F2773E4;
	Wed,  7 Jan 2026 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lque+Mkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZNwN7yG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A267F2356A4
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767768861; cv=none; b=HLa3sGQucEY7uW7ZNsvnlKnRTdKBcP8RbJdQLcp+CdITpUPCYGA7gXmTK7CMu0So68YuNVbdLEF42/kSHeaRYr9xz0bkWqbgDEz1Z9dhbE3xaJHhD7fzt+XF4FMWqXE+3+TmV0NMbD05Sjnqe+cf0/+JdaG3v0j1oaaWg/jHOQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767768861; c=relaxed/simple;
	bh=+3PJ+TvkjZbDdpS25ePa6BK1DlVke0sYn8/aoLnxebI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLBwyoZBPjhS5zWDb/bCyPNdAI67fUn46NQq9qr/G6FChU3507znhLbp8Q+n2hb4GP4ofVbnohJ3jAkg3ylsr2d6A0x3KL17hUVfLAXujNwd3L+In3rBxknie1BBJj3IzTVSLZ+J1TWcc2etUtilzq1Xkp981tpOY1pxeDRzoY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lque+Mkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZNwN7yG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076WIGs4048690
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 06:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EcTepQ7R/++STU1aww2Izf8r
	4iZvEbkucPFrPVqCueU=; b=Lque+MkkbTXKbabVA4VtHF+4cUug/+l1M8e+sjRO
	DOYmNLC4npynaNey+DXlmKeEAr0DnhssJ7qSgGl0tLaUF+iUcbdQ4HgLo6Xz+gcg
	DQSMinT2+/l1hp/R0o712crhAp3eOdYlGT7EpZxSFDveLzlrP2B4Piws2OtG0kvM
	B9uf4xNJw4fU7WmOXICOl+Zy1yaOnTTQOxNapM00Sr1fj/NQi1IcvCWcpWGzLLGT
	CFey9bKS/Gbo4YWPhcbO3154eSOmVVXydcCKQSRZijjT7vqiFj/g+2Qn7fuHw1sb
	gR9fQJlbLZjVmDxAVLEpz0cBFX9+N52BWZOuFb8EWeHWqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25ru100-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 06:54:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso628017a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 22:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767768858; x=1768373658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EcTepQ7R/++STU1aww2Izf8r4iZvEbkucPFrPVqCueU=;
        b=KZNwN7yGEin4c0KzqXfkD5j7aV/9QiGlsrbyQoAv5vt3H6RDlYmLLvGdmykXKSbVsS
         f7M5mtopsH3UPw3iOEW6OHZye0Uu3kxQMexzDVHNO8xlX9pskwuIZqZPkgBz/LnjMx9k
         FDX5cPEXMZFE3vxZeE56a9zoBMm89eKqrhp6YyD+dStS9LoywVCwI8F3Hbbj8A9xVBQW
         Oa6xwK+ZANSzMTjnaZMnhTerMVnLFmgRlBoccSyJddgMlwTx6y+w5aSX+/K9KkMgsqkG
         nKJT5jFWzmJ/UG/pKY/evqcUCDiTlCAl7f0DZ+UBCbdXmqgaIOUPu05/ncIZdFrjZVNr
         Hv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767768858; x=1768373658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcTepQ7R/++STU1aww2Izf8r4iZvEbkucPFrPVqCueU=;
        b=Fxi+s4CPol9s/pWy6NugJTP1KyiWhnpXA6+rLeO9TBPvhk5DpCZ4xGk+W4Fu+iMc1F
         TdkMMP8p7LApsoCC8WeOH5mIWsvmU+dY3BjQx26ceEKbs6SEj/7OtonE0aWM8j1hnAfB
         PciCfGB4Oj3q88iFlssWxRdoOfAVdH13wmlhRXj2wv6/4ch/BocTH4zQtWf14ce0RtMy
         e6evsDDd4Nhki9HygsLXTYBOghO8zSSaUTjpW02PEIxs1b6pLEYY/rcNKZ5QuETOgKKy
         PM1IdhBRp+8+G0A034BFJPeFfnNJMBAladd/+PbwErGoLA2oXMpYY63gGoEThw0YK3VD
         +i1g==
X-Forwarded-Encrypted: i=1; AJvYcCVM+sB+t1yqADMz67g2fpD7uIaA4JZ9djuiXpZ5gaVPhUM8i/lLM8gH88TbOkWi7aF33gsywyC1twbsyG+/@vger.kernel.org
X-Gm-Message-State: AOJu0YzHShoCFyOfeWtF3NdCuC4QTvB/ptkbIYt+UCBBHQE3fqj3i/2W
	k1O+DkzL9/gFkIPi2wEpa0fI/PGR5TKVFoLJeegRbosjTy+NY1jc0f4R+EG2S7k4dFz6eFrgs1W
	5+tGjOlNUFDaxKHxqaQ/ZIfqUa+dCAjvuTJB4esGzgYBRoK8WhThMtpk9igEkDPN/5KowXHgxRJ
	qkzcKVVQBIf12U3rNXES95PSkDJdoZffXSz82j4+4Qkx4=
X-Gm-Gg: AY/fxX688P+NOptKwdMf42NFysshwUTS7htJnHTKI/AWf0VJMpASwF1wZFcgjRTHeM+
	PHPlrmZI9MECBs982/G2y+brt31wOv04F+kZG8uAxapeU1/SHYY2dHXusIb2E2G4dyTFdQ2NBbH
	E01RLLB3rma4i920BWbCJYGWLHGCqTggVGeSqjb9h3nEC8jRboQf29vgDGPts6DMn2GfYPKGuok
	l4fO2OH
X-Received: by 2002:a17:90b:1f86:b0:343:87b3:6fbb with SMTP id 98e67ed59e1d1-34f5f84acf9mr4461787a91.8.1767768857887;
        Tue, 06 Jan 2026 22:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvp9rgoGp/DdjkGp8TXqU2OEkbcr3GMWgOUCniDzfxMSGtqc065zOax+ZWSCwtQybEbmLDVBB8Dvc6r1qbkxg=
X-Received: by 2002:a17:90b:1f86:b0:343:87b3:6fbb with SMTP id
 98e67ed59e1d1-34f5f84acf9mr4461754a91.8.1767768857387; Tue, 06 Jan 2026
 22:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 08:54:05 +0200
X-Gm-Features: AQt7F2qMdhOkuVyNuxoT7JRRqkGmym5R-u3pIRQndUuycMVtwUwVBV684s7xs7E
Message-ID: <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2 platform
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: nkxRvAvfQzchCKePEI7Vj_QA_YC0miqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA1NCBTYWx0ZWRfXzE4RVavaRTDW
 Dni8Mv7XDhnkVj1q1wvUf4yrsimvXS2oyuTZzGWf30qILccr65vk8vD7irReK9hrGaRbvQwwK3q
 h8rQfJcQn7neRr7NTiT3VNL9qjZaggFijCzEyd1hr4Dhio1RTZ3J2E6PRcHLiAXm6IgN8JIYHxd
 Z6VcPJIAt799KSAyp8Q7jdde8EmNYqv/YaOxUYa2NmmKCeWd4V5LyjNqGeakgS68YVpgz7sTf+P
 D1pTb5Kp2frkDz+GdBFKbZF7ExPluj12tDfdnOvvP5JcbpqtFa1sQGd01NHxNHERFM4LfkT+R2x
 rklFbUau3ggSPmtSiFGvO4IJKwFa7NIOKbSGb9aq+OskWzfBmu5qX65QX+VAsXNN9sCcoBgIPSa
 jAaXIkBV5hloYxs5+LoBOQRPKWkfPa3owzm1DvpcgoSvzvxLpvBZzTUgPzpb4TvXw1Xa6646+F7
 9kUTE1phUWn5Hc75kXw==
X-Proofpoint-ORIG-GUID: nkxRvAvfQzchCKePEI7Vj_QA_YC0miqW
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695e031a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R9UZfdiCTnRQo2W2rQ0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070054

On Wed, 7 Jan 2026 at 08:48, Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> A regression in linux-next causes Bluetooth functionality to fail during

linux-next is an ephemeral thing. Please reference the exact commit.

> bootup on the RB2 platform, preventing proper BT initialization. However,
> BT works correctly after bootup completes.
>
> The issue occurs when runtime PM is enabled and uart_add_one_port() is
> called before wakeup IRQ setup. The uart_add_one_port() call activates the
> device through runtime PM, which configures GPIOs to their default state.
> When wakeup IRQ registration happens afterward, it conflicts with these
> GPIO settings, causing state corruption that breaks Bluetooth
> functionality.

How does it "conflict with GPIO settings", what is "state corruption"?


>
> Fix this by moving runtime PM enablement and uart_add_one_port() after
> wakeup IRQ registration, ensuring proper initialization order.
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Closes:
> https://lore.kernel.org/all/20251110101043.2108414-4-praveen.talari@oss.qualcomm.com/
> Fixes: 10904d725f6e ("serial: qcom-geni: Enable PM runtime for serial driver")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

