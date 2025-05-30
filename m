Return-Path: <linux-arm-msm+bounces-59842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE86FAC8802
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 07:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DE364E10E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 05:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466361DE2A7;
	Fri, 30 May 2025 05:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeRC5F+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C31A23AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583500; cv=none; b=NpX4Q2L5pmzDwHWNuFHK5sIQLjo8SlGKOemDnHBQMQ7U00hbKzLrXtbxWumhc2/N0vrPkPWiJgKl0iOpI8rOiGHqYrrndan73Oc4OLoVJ3jPgcqwBmm+o8hT/TC8rhMZSK413G6HzkWz44JSk13aJEJ/wQhXgFv0sOUejtRGuTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583500; c=relaxed/simple;
	bh=DAM1xv4aIcHbG+44NWHL5X8a66NMADDmmoa/uAs40V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPouMJurg0fc8ZVTtS5BrgiYt9PwFJY0f/a4Ftr6Q54Q7IAbl7PE9zp0iBlWCQJ78/Y/C0Wd2Uhg6zFsVmsmkb81mo414pdg8a0LumkqYIQoFbW2f/qeqUL6sHgQ3KPr9s+8fEkQh/PUEJHAeK7M+VzMG4p+9CiQoXKi7twQ9WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeRC5F+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0ePXT004885
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 05:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAM1xv4aIcHbG+44NWHL5X8a66NMADDmmoa/uAs40V0=; b=CeRC5F+JSf4KVN3C
	4nyAdI7/AZkOzvoiFdnzNbY+nVVmiZs+tCb8g1ZnfOHurXlghIxc1j60OpGA6MP1
	Iq0x4XixKmdVvmfIzvviNElSssmARGSyFglKHHQu1CATaYgq91CZO6Q8sARLXcrz
	yXQqveRVpawvf3RbkwmUNRnxYNJno+tMuMn598YtSfnIVDW6B3jiAHjDjt0wYHc6
	qDlGzVWItPBwANgFJgHtn89B9GomQWkFfnG59AfCPI4A7e9G+4QiAr8LlePYpQOK
	wD0rILVIYzrj2h8QVlkE4s5n1QkWBAtuh7IPY5n7BVm1M2uplRsr4HWjGUe4tMQX
	/ejv/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek7qct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 05:38:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso1742879a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 22:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748583496; x=1749188296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAM1xv4aIcHbG+44NWHL5X8a66NMADDmmoa/uAs40V0=;
        b=I5rgjgf9/bwWKjLctODRE8xM4htARPdIr+IcLbjt388R4l2HYJJgQrwn14nZhW2BQ6
         q4IOZahYTpJdrBdptVyz0EkqLwuKFxoyk8BHSGVtRwHKyEQXY1lbd5m87vvvfmkTY7QX
         /JGL3Ys4FgoFS2Fv1nENwyaWeYrgvhrsv2uswQ7rt5zjncxeSvXa9jXtzfsfK64viT35
         TQQ+CHFhV821TtBdDsMXPsInl+KoiL14wD+IY/JeeQ5N3lmwnroyL+KoSzICUdVmtInu
         07DZN6wGusqXDOuk6r2g4B+p0Uijd4Jx+gBgY0WIiVLPHUSvT4IXPvNK5YBu/efdmogD
         DzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2H4bmNbYe+PvniMusC70cnXhz4UYXfQhTxFfZPpXh84ik3f7E5bcy3xxyIZ1lNB1AseNS4ISqo2K7RKov@vger.kernel.org
X-Gm-Message-State: AOJu0YytjTeTYs9Oqz5GGFLWh70ZSGnZJVifTOyJGxmoY6rxo7jfmvJA
	UUlKnPzacGmjeb1IT0CxKbfb2kl3d/cynB3P+V82vlhvxiROLzQZX3x3eI/MuBCPnd8XkwvuWwy
	0PIlDHoyoD+E2z44bZOl1XgVLRzWZn6fD02ZGzLOlpym5JCy07Qvu1P//LsL58uo4jElbApW8KN
	F4Y7wcpGqMPlZN6+PTOGIPHSmYB5q7DrwBanv2DGLhoVo=
X-Gm-Gg: ASbGncvXUn36TZQFnCEE7DQgag+gsLQg1PcEQIUaSR7R2XWxxsbjRfjAthHk/soM6uS
	gfWG0Durvz9w5sgpWPeEblUkQT767rwpgnqCeXLavEZHukbu5kucSa4sRBhtxSrIS9UB7+g==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr3480995a91.24.1748583495946;
        Thu, 29 May 2025 22:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlRKedberL2RSYX+Cuqh6kpcKHhbGZ6knyFtPkPCsJbClMKOFQ0UxpJuVW1yGijcS7W1vDNS6L1UHnnyNYTAk=
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-31241e8cb1dmr3480961a91.24.1748583495522; Thu, 29 May 2025
 22:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com> <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
 <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
In-Reply-To: <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 30 May 2025 11:08:04 +0530
X-Gm-Features: AX0GCFukz3bJpAGapqXqQc3NL2QHl1v8ESUc1ESnOp93Hj9Tp8FIwCGUoDy2dG8
Message-ID: <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
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
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68394449 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eed2zNinQUnWPIZz8mYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qC8zlcCdQ5mikyiuIQ66aH3Cu7IVx0zx
X-Proofpoint-GUID: qC8zlcCdQ5mikyiuIQ66aH3Cu7IVx0zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA0NSBTYWx0ZWRfX69W5ixjvJazk
 TlM3TvOS/xOWbeLkMgCK3EYJkwdMRliqqYokS0b27scs6ILNjjjITrSg2GJThOujY7T5c4vRg0m
 MFHfzB1BERzA8w8PnyFLp58KZsdrR0Sy5memtvhkRbIr4ZEfj4p1wo9YiY5OuqBDcVHnsIxikhm
 GhE+XpyoTcLRpI7GzbSqpDOXh5WIInKDPrPrlhgqSLZ1D2k+d8p3YibIZZKN8j4jx4Tz7qoq1k+
 5TnfrMLcSun3coOp07xalqfVo72gCO3r12WK3mswnRqXI8pr5Csa3wDwZzZvMiLNu1xXQzuR/j5
 bP1/lOT7/CraHBhJznwvOhZhm67HgQJ7XING8cqYuQI8GXVpXuHig5QgBxJLo0bNkyzAkfX40hw
 lRjDcJey87Y3iOga4ei2S0zTNdnakY1TOStNRZTO2TnmMBCkd6aVg8B+r5taYxKF9HZmRFJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_02,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=883 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300045

On Tue, May 27, 2025 at 4:06=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
> > On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
> >> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> >>
> >> The maximum link speed was previously restricted to Gen3 due to the
> >> absence of Gen4 equalization support in the driver.
> >>
> >> Add change to remove max link speed property, Since Gen4 equalization
> >> support has already been added into the driver.
> >
> > As Gen4 equalization is already supported by the XYZ driver remove the
> > max-link-speed property.
> >
> > "Add change to remove" is a bit clumsy.
>
> I'm more worried about this node not having these gen4 eq settings
> (i.e. the part talking about driver support landing is true, but it's
> unused without the presets being explicitly defined in eq-presets-16gts)
>
> Konrad

Hi Konrad,

Actually stability issue was resolved by this patch series:
https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743=
f5c1fd027@linaro.org/
and I don't think we need to define eq-presets-16gts for this.

Thanks,
Mrinmay

