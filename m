Return-Path: <linux-arm-msm+bounces-82176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B1C673FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 05:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F8CA361C49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 04:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEE1288C30;
	Tue, 18 Nov 2025 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoqfXrmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e72afUAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37462868B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440057; cv=none; b=rCsuYtz98GhbymuKzD2CY9V4+ktIsda6LMtob2zE0lFV7tJEevJCrssz467iqbvkJtsO3bpg9IO/UsjBgy7lCTZQxKnma3LMQ4tVC1hCefuV7tLVooW+0VhPztrNBnF160K2i1jJOEBS5cmng/0vTENQYffkl2SCxrFIu7XVR/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440057; c=relaxed/simple;
	bh=7r91awU5VLldRKKlpu4/0SLwEa+ljbG3f4dZiO9XOZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4uJE36CRHQmCd1MuteV4/4Rcp4ztyKqVO8YAI3TuhGBxoHnD1a91PXQto0Vc+VqUuuTYlx4pD0CTfS0RF7oxPhkQVoUqf4iM/EdpH1FMG/KTlf1as15JU8J9BiwC7gvWL+D7il4N7w5KlRuyVyO7jWrvnWzuZVWx/QVhIEYGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoqfXrmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e72afUAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHK9w1d385904
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hoWYq/2sdspYgKJlIQFUEghEbB4YrfTam2Gk0dChps=; b=MoqfXrmmESqj3s8o
	dUvDF5NYrTnfYnHpApZmuh/8wydi0/DKp+v8+40M8YZHJ3ylCAIdyIQxqSvbr9WA
	ubqTpTmj8aovWxeHxKomjvaQFcEsI3HitX6RDuvbUyDB8AuVBs0cYorNTHint01U
	NUL3hPP2moofJUOWKcRNHYsVHjTATTejo4AZ4eL9TlKICCjSWBCj9Cj15GyTwNi9
	i2kZsYwk2OZx0i33uS98G/tcU/FYBhmTuDRadawcdxNAlbMPyXv7/r6WoBo+mix4
	oT8PGiqPNOZGwfkwOrwS+RXvzMVhPJbBoXNM1iGrTaMhtQcePEPyS6aaFka/TBjc
	/kVdzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8h3t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:27:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29b4864b7so1541671785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440054; x=1764044854; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hoWYq/2sdspYgKJlIQFUEghEbB4YrfTam2Gk0dChps=;
        b=e72afUAj7KY+VUR3lFO3jZKXI0Qr+/4NmLG9ZTzkmAyHDBLhAJ+Ih8eTRTxZ5EDsig
         vBV9r12FRl65I3tDq1095OOPHYv1/149s2mGX1m8iTzz+Azs4lwjAKYW9ooU2TrIcnJm
         oEbxB4oxuVShEr+BkIpEha1oX7BRyph/MSFXkKHZO4cFdtAYzYUZPGlQkU0o+lKC2NXg
         WB/F+74wX2fgGSII0Ea83PUunHOKmTWSVrxfW7xKOKoSOgHKnJRCuCj/tr6Zjj7aWslm
         75Zy54/kG2GV+cCIY629aDF+DN+avOFa+RtsJAyXg6xlNTVMC5Gdp2cHkbSJwQZQIGJi
         4YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440054; x=1764044854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hoWYq/2sdspYgKJlIQFUEghEbB4YrfTam2Gk0dChps=;
        b=E0of1DF6t2IgrIzZjV4rzoCL7hmZtc+Trxq2GNVlUAT0bib7SEyS/AlsDmXGnpgapu
         56sKnAUN4MxiUYEA7ViUZ+9az10BJ0/Eqo6/jshvqqf228S6C6O6CNaYlvZaop+l3wuT
         iuehzaIVSZYs2sCcH4LeWiKbAi032OHafa+oFmitT9M/zXKVdC76CXVD6eeFQsy3jZpk
         VvoBX91JGLCxNYh07yBk5bjSIOgT1jIaos3Tb3eMgEVHqQs3r1hDsM0g72zLx1ZP49ZR
         6lLClceHKaQ5lNUtn97Ov0yppDYDJQZcWRw5NHOAY1cnRH6mfISq79fh5+cmRKIY83zW
         ThsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlzKLeIfPHTAE5oZ4ZmjCz4wIIsdV25IBrABVZNDjiHFnhHzKXjRGLSI4mQMI4rB3iunStsfNnXspOJZG5@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIRYVArOZnWg/mLMcQhjoQLbc0yNYN6kjXzsYhhfwPbv0IXv2
	vioaM+5/TAVMbgSzK2hQzGbkT8aBxjOt5jNKUtxGmGK6WOJJDWxPt3AUjshdJ5PIZ4dvUdikyLC
	Htk2xUA2IqiUbkxnV15WrX1fi1VujSTNulrYzO9zJhK+z4GFvQN4g8Ij2gG0Q28zJ9mNo
X-Gm-Gg: ASbGnctkmVKaxsvjZ186qdVH9SUeTIgKSr8jf1F/lZWC23m2dJ6xNos5y/OqjKVzUuE
	4O6ZZnndF1lrtKLE+HZBmf6bY8cV6Mmtixyowk3Hj/KIAtbmVI4TEE3GE8YKb/EKkYDoviEdyBZ
	vD5Sdpu2MIdy/EqJzUdvezp3Pa1coycUVE7GZRMQlCzFuYv/SEfSIuES/B5ModaRiXq+dQb5m5c
	e6I27aGAJmjX78EfnJd05deaUestfLqnVTWZ63o2xCqTF4OyEylwezvaBIB6IY3ri9XT09LCbKK
	nDlrg8ohdzEKPvlqjGBAJGsg1QZGc97iuU+YWERnoheOhg0hXTzMc2tZxoViVJ/4kNshPc20/pd
	+Y+Bs2yoP4a6M7g3uBktx+oc55CBTyOEkxvyMNfCtOHTTU0iMCg7sU1JDfYkO1CIhwDwXIjK4Yn
	tOd9p2uGI7CFMQ
X-Received: by 2002:ac8:598d:0:b0:4ee:222b:660a with SMTP id d75a77b69052e-4ee222b702emr77345331cf.76.1763440053934;
        Mon, 17 Nov 2025 20:27:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK34XMALMLhHCXyEM4b9N6S6ILPLJGMBP91uz4eSXchUdD5hGMZY8O87pIcn7bUOAHLZ4fWQ==
X-Received: by 2002:ac8:598d:0:b0:4ee:222b:660a with SMTP id d75a77b69052e-4ee222b702emr77345131cf.76.1763440053519;
        Mon, 17 Nov 2025 20:27:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056absm3577733e87.82.2025.11.17.20.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:27:32 -0800 (PST)
Date: Tue, 18 Nov 2025 06:27:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
Message-ID: <4w2stmuxwq3bkiipxsvgbbhtjeokhkx6qz2ew4udfp3hzppqzw@bqifexv4xlej>
References: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
 <20251117-gcc-msm8940-sdm439-v2-2-4af57c8bc7eb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-gcc-msm8940-sdm439-v2-2-4af57c8bc7eb@mainlining.org>
X-Proofpoint-GUID: tp_vr3iTCcjG4DntG_l9IaoD_A5iPzjU
X-Proofpoint-ORIG-GUID: tp_vr3iTCcjG4DntG_l9IaoD_A5iPzjU
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691bf5b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=nxiTF959HdLS1GldUw4A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMiBTYWx0ZWRfXxpdYh9tC9z8z
 xjo7TSLo8fJ7uudE2iNG78adL1jy3D4bng0N4Mnqj8VzTqA+GyfIR3EKfNAunFz4R9q0nJ1BsXR
 QEW0PxVYKDVI9TmlZabFvX9nSFn1aesyntDqTwIyFPNe3rym0Vy/zngYBL3SN8aYG1TgJ4j0SIF
 O1mOb5iT/1bI+Px85xGqjuhNUIqDkVR30EGptmiC64vDx/9TVQNACqcTOypcpm8nqKrus56wDO1
 IB5+UP6K8wGRyHE5J4KUjj023cg6OKZOz8GlKNowOjzBuj0f/qyCIHOffEc5zLV6tYSi8FhRaR3
 L4i2O7WYwu4vzZI25B9Z49efAa3lTIxIC2eNhAi7V4sacVy1wUOEXfcr5VZvN1noTDJtN0pTvrd
 WamZWNQ4yIN/QkCqmYifGO7KYWPj/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180032

On Mon, Nov 17, 2025 at 05:57:07PM +0100, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support MSM8940 SoC. MSM8940 SoC has the
> same changes as MSM8937 SoC, but with additional IPA clk and different
> GFX3D clock frequency table.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/Kconfig       |   6 +-
>  drivers/clk/qcom/gcc-msm8917.c | 231 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 234 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

