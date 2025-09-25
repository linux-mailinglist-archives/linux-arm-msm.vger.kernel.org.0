Return-Path: <linux-arm-msm+bounces-75181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35555BA1335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5C063AC8F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5694B31CA68;
	Thu, 25 Sep 2025 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6pMUdgg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD6E1DF27D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828786; cv=none; b=louguRWJ9TVLZlmlExGbIzB+7uGS+vYwZEjMMoZX06+jfm5ykPbS3a2L5zLgYkD3uImEUTBUwk7GVWqMJnyQjMpOeWcE1S5/X/4oEdqM9d4gzxIW4v4rD8WHxuJ8JKfPMTRhrynVfUrsRDFzIkioVLfcTmgm8zuy0tNsZTHWmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828786; c=relaxed/simple;
	bh=TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ou4QN1D/niLt/ydS0aYpiynQ5Yb84F4JLV6mpUOZh146Bp1bP0g4F+rTeKIbyqQkGJOqo+Kr22hWW8CpGo4aZ8PVljCs35YSarY18LTQGRJef915o5mYZUyF30Dpt+5zxH+6NZkr67ZJKOWn2TF3IauIQHPqIWESHflFxxu3mVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6pMUdgg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPnkF027798
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=; b=n6pMUdgg7o1HOrgY
	EhGqoBKaP6P2x8Bf+fJ0BEpsE9y7I9q+ZUsYD9Upeuz+1qp3rab4zpH6l0DAbCoH
	pGmpyB/yuXh5Jd47KllaZk53mhlUdOuw4ydqth+gkoXHHIgTQdrDzi47c8soowfa
	etPQT3hvO3eavu8XhEpS77QWY3YVZlzSSvKI5qX3j+4mO+/NU+gMsgj6Y1XEXw4U
	WhDf1QgSRAOXGbm3uHmYMh9PSrAWdsA0Uhd4Y8u0pC/419B4xZOj0S2e7LND0PPA
	QK9hgYURCbFTagVrzz0yEQN4QwrN+JkNtFJaoRotH10ta5A2cVZdvP8VY2o0fkb7
	T7EO9Q==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q05cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-424c8578d40so16318025ab.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828783; x=1759433583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=;
        b=MtLxO7dgZcp54RSqNLySL9M3OHm+Dhew+BqKtQsbH1gPdcH2e1TrNo7/6ZnDaoe+hD
         jM7sKOCtWLgp7uMwOHE0cGZQEjklN9XEr8GP523aFRu3cx/VWgMKXodrhgchuBpyJx8K
         zUhEW9krA/WYxM59U0qAUY7JBayZPtQINLRAIfiWMsS74TNCnJIyQez4lVbVjLjq/A99
         lATAmehu3Rd+uwD/xGihHToJoMHS9k21TjeshZklt0McmDCgjujgmCB3H1O6vDXVOvA/
         F2CIml2BskWOoUTH8D+XWY0i5ik4c2luzxssk4AnwJ6n0P1zNpOq/ekGKo4QvfkDetNX
         HCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVIJB3rWly3axNc3G0OeqBwCS16HymG4JV2OIoRaDOfsOPDDtq38yf8ov0OjdAxJ5E6m7mfllAY3rDlPoD@vger.kernel.org
X-Gm-Message-State: AOJu0YzNxMiOrBM953QgoaMjaPM60HskiEoFzVeV6avsOLRVqQaeQUvM
	H3bOcgh6I/S8YpjItwI55fmnE3RQC6yogX0E+cSL6bNdi9Hs1Lv54FXVy/briSB4Wegu1P/MT6u
	umQU7a2eiLevwJS+GFehNqewBYixmWnj183YRMpI9knu55dOFymlPzCEPTWzglgJcGXWS2GvC3a
	CfR7qyDPETY0uaPsjVhCRcFuSIl28yWn2FSIhoYKz0vtM=
X-Gm-Gg: ASbGncvPpYpNeqYgCQ7wcIee1OtKjrznw5hYX84MNpHau6fLW+TVP606jWH+B8dUAGO
	a/d8v5co8PTS725BArlN92hFU4cgXGtXF4t/hCW6TuirzaVqWFdsm7my1ck7EGOx+n2SM+LBzZt
	2YNkQVcWlbBlWjeLLklFyvEjrnkWO6E0BtyyWH2tKo/PpnNgwCInKr78q2o3BnTjG5qwn4nC1Jq
	gH4h7Rr
X-Received: by 2002:a05:6e02:471c:b0:425:70b9:243c with SMTP id e9e14a558f8ab-425955e5344mr62881475ab.14.1758828783031;
        Thu, 25 Sep 2025 12:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM8FpReApr0CA3Q3i/iHZMzcvXpITYuK0dqKpybMbm53VSYRwCkGk4q3clx06ZAwPs9BfYLZtd0oAmaJMnlD0=
X-Received: by 2002:a05:6e02:471c:b0:425:70b9:243c with SMTP id
 e9e14a558f8ab-425955e5344mr62880955ab.14.1758828782638; Thu, 25 Sep 2025
 12:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com> <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 21:32:51 +0200
X-Gm-Features: AS18NWBmOViIv5jdU4dSvUosy08SUKDUBUh2nCRDhTzk4mlZzt1vwqBX05hLiQM
Message-ID: <CAFEp6-38buo3WafiiXUEUs8n-=SKgacMD44gGAd1pnEDAsizCQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXxo0NSKifP+8p
 rBNGQ3Crr2ctZ87Nb9sz25cNGOr3s33l91aSdWQwbhW9aM4ddk5AD7DlG0ZlgAD9hWIvfGsQ0tp
 lBixMoivbcSo/Gm4TL+Dcsv2UutwDzv6mNNjF/O5eWw41ddAe+KnN7LPQs8X8M1p4smf1uLqGkH
 IeTeb/EFNmSqcR/xCPviCfCuQuaBNau0V28oNXwuitvbUJPxjwnLx6PUImHT8oHJ7D400MyVlh5
 MqJ1vIMOkg8p0ZEzLuYyzTT4e0bvy8APqrQ+UmPM4M9cbkqZBnDpM+GcszYWMDfjNBJ45QjUE1/
 OWQ9YJRqxkEsCUagn+OvoLbTgZ4SfQr+y7+fkcXk6aVpSJHOv2NRQogVRDsL75dhFhhuNrB046r
 P7cXtrqNr0mbOpwfeRyeLKvMO048uw==
X-Proofpoint-GUID: EK0sRvQcVW-DMjILn-lmmL1iH6OD1ycN
X-Proofpoint-ORIG-GUID: EK0sRvQcVW-DMjILn-lmmL1iH6OD1ycN
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d598f0 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=i1QE4n8HBj4RHUU_w4AA:9 a=QEXdDO2ut3YA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 2:02=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
> of clocks for Kaanapali requires its own compat string and definition.
> This changes the minimum number of `clocks` and `clock-names`.
>
> - const: cam_top_ahb
> - const: cci

The recently introduced qcom,qcm2290-cci has the same definition with
two clocks, ahb, and cci.

