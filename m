Return-Path: <linux-arm-msm+bounces-55932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A8A9F592
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 18:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52FDC178557
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 16:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B0F27A92F;
	Mon, 28 Apr 2025 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drqJPcga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F527A920
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857311; cv=none; b=WxBo+XyOjnI/JXNUxVRP4/rDLM3N/YhZXH4ZyisMzdtSx4C2kB50dVDth3Sxxu6uu+5Q56iS38V38ru712Osp4zQzdMOjGxoSRFmIZwx0Dy8a2WJERMqplLQ4g3st4/IttNFjLygetwWWC5VkyYnZ4B3xrK8/DHd7Vs34IBOGns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857311; c=relaxed/simple;
	bh=FAk+/hIlJrLqvDt63zVfUl7GDqkiGBuO0+vRufRCo78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbSZ6azJ2CJmUWuqwUWYMNJ8unSXnUfCxxk7KzVZXx5XuRCjkv0+Ft9R23RfDJTW13mf4Jj9XSK/+GooWSX3HbImT3MDRJEA5SqO8qJoLBxjn9p5ew0xwcayGkKPHTt1DyVaGOnYYBes9PO/jJJKZtbaGM59LPQnR1gW/TKPMss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drqJPcga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAD6we026369
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 16:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhk8zfFYK4MnpIXkJbMSmC3IFiPYjxX4pByTlAx/9gI=; b=drqJPcgaOkfRvzbc
	q3Z7ZGrv42FsrIzKBCTn1tF1XqfIhOtPdqFUnT35mIocHjCauHomlDpn69PU8tms
	eMGFSGoHDWDEf7A7V9hsq2LJ1v9/f67WnY8aHWql4Wie9NRtr4TwPR+dQ/x/50cg
	V8cLTRb7tFFJDVtKheVEkiGbZtYIa4AZOdsmpLPbABaelNOdxO1M80xif8/rOEPp
	8TapgnnX4LSdm2nLdH4btN2gBtt+OqAW7sZL2mCE+MH+UefTJkw0duv5+sxxyM0n
	zDcXpX1zt9MbQvcpl2CEWH8gTCq38GZLna7oibbcFfVT1EaQhqvohxzSHI++tgRb
	qecozg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q321r27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 16:21:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so103327786d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 09:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857308; x=1746462108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhk8zfFYK4MnpIXkJbMSmC3IFiPYjxX4pByTlAx/9gI=;
        b=NsfcuBPRjA2siYHcB6kJ41q/ME9SmAylGPMI+8ga/MyxF1VTJBHqIqxKcsglDwbWST
         +NCVGi7X4aDfyAmzbMihg8Ezu2q2M3Fza16tXd91TZWo9jQoR/aQpOGMimXAYa2znBWf
         ucLXVUHbcR/brlPcwRw+ETr069LfFxYMJjE8Y/4yXIqelKmWwSHgX9hk56sUNilPPyEI
         v+UMnmK9dAOmjK80IM5Kft14uW2JyKikoqkenPmJi7zt5zu/VWgZoTiFOFORP/t3/JOg
         CMnKTkWySGY20j8FJDXqqnv4WQ6PG0sySU88Ys8mGr+Ab1V8onD84Bs1Jr7GQlkJEXmW
         pm2A==
X-Forwarded-Encrypted: i=1; AJvYcCUI5Fizl3WsVc2lJuAAIBmQ44oq0kw0huRwtX/Mh8I/dYtECgw0cVOUxDLeBl8wKHrpfDk3b6Zw22hpTZyR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7DZUlAIqTBACWcr22qOARiT5Q9RI4ed0QYk1tuhnR2j1/B7ZN
	PUYUQXzEpQJiObyNbV09gFETfFa50Br4BSNgeao2ht/cqmsRmsatJO7Nr8qsbvkM/P8BpFnS9N6
	KEeO0o46f84pz/OzfCVVwZf+Mr21kuOJbH+uZh9kUAOT8KSmeQBCxdQp3yPPEakEeUPKktPLJ
X-Gm-Gg: ASbGncu6e7n13tD0ZItXCK4vBbEGoHM1oXggHjlq9GD0ymLOHrtvuTYH0OeGH0aAuAB
	LQ2yq69NR2YbCanMh8V0TWHKL3oiwmbiSUumrn86a4osCSN+bTmNHbze3bixBiRpg5RoOgIP13e
	VzpXmEr/RChriUC3GS0tfz5iXTXdthfoxcTWHz8k7ovNsLglLOHlKocLy26jBzXbjL8SyQKrMFz
	WUhE0Sbt8PGaEZK/GF4XXZTsuMmmeVM0KwEwcjjsw8/BjirDtbzotwP39yKwy9kU9ehy9Td2NEN
	piSbS9jUJmkvrBOlsCyqmFMK2+pfbA6xH2JLWnd/yuaR/0rMkAfurI9jJK908nvG8ophRiRafK8
	=
X-Received: by 2002:a05:6214:19c4:b0:6e8:ee68:b4a1 with SMTP id 6a1803df08f44-6f4f058f110mr8388476d6.8.1745857307481;
        Mon, 28 Apr 2025 09:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIYoaNvRKG8//OnEjJanG3jFa3ZUwfVxoxZBR/HajeaP9e2qMwZlbuXIpdWarKogjDWjKqsg==
X-Received: by 2002:a05:6214:19c4:b0:6e8:ee68:b4a1 with SMTP id 6a1803df08f44-6f4f058f110mr8387916d6.8.1745857307149;
        Mon, 28 Apr 2025 09:21:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e8fd2d823sm1057195e87.194.2025.04.28.09.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:21:46 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:21:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus
 node
Message-ID: <vxwbzzds4lkixt2zsvjwnmfk22u3mmvp3cqk36aak2thomyagu@znr6b7gcue6w>
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
 <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=680fab1c cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uAVbjTU27lTVuhHKzXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 89dX7OzxO1tTdZFbUcZF00TG9TId2dND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNCBTYWx0ZWRfX0D3cDES+OOH6 q2l9RWs0sgJW8c/afgVxL/I7C6irhZj4dllg90laFowOZOa1c4L2KGmY3MToi1D+1zE0oqFi9UI fF4Z28vkqqUDXh3J6pWfsWanoemhWJwPfx9GCAhIj/4KEzDmR1IsunA2EVOg5FBVG3orUp7S1dx
 lEo+zWT5YvNF//egr4CftDbl1t3kTnZHGjfDLQYAzr1Nwaq+taIThgoyaGVajqZH6ayeGZfd1Kc nVeCopTJJIM50+aItSFt7joJXIbXC8GvH8LExn3Mr/PpK2UfjEb4ynh9sHGASeDeYpvbdRYjUS0 /arhzALa3ibLONyp9LedkfQuw9iKZzjEacwuUgsIcXXqJROt+9iwEzwzqsMoiY5lBPEjz/0iSKF
 DqKHtOteyZWD/oGJuP9sE9qRtqeHZ28D1ZoW7tRyjS3BXPgI1+y0AmQpviG2r1m/3r/DKZsF
X-Proofpoint-ORIG-GUID: 89dX7OzxO1tTdZFbUcZF00TG9TId2dND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280134

On Mon, Apr 28, 2025 at 09:40:52AM -0600, Jeffrey Hugo wrote:
> On Fri, Apr 25, 2025 at 12:28 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
> 
> I'm curious, how did this get validated?  I didn't think there was
> enough infrastructure enabled on this platform to check that the
> lights were even on on in Venus.

I must admit, I basically checked that the firmware starts up. Marc
Gonzalez worked on enablement of Venus on MSM8998 (on the freebox), so I
didn't perform a thorough check.

> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Rebasde on top of linux-next
> > - Link to v1: https://lore.kernel.org/r/20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >

-- 
With best wishes
Dmitry

