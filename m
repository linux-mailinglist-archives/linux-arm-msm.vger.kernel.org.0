Return-Path: <linux-arm-msm+bounces-52216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A04A6BEBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A38C3B5785
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9454D1C5F14;
	Fri, 21 Mar 2025 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2d7zw/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027CE224B0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572293; cv=none; b=Gz0illcy1l4ntEIoRZSS7hkh9DlgKzyMtOKBv0gqQEPAMi+gkvl0//nDOUYLsqySl8xQRy5w5fPtCxRONmxovM01F+gYpGsMQ+jMbzb8uHohcPaqI2phFVwL58hXVG2TDc38P8WJWSTudE3OgQzM+zhsfi22HNtvBklheXq9aO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572293; c=relaxed/simple;
	bh=e5e2Y0NokGvj7eAFla2Gwybd8uGGn8WPjTeaQOfkpys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1IVLTK+l7KW+CHuPYPuDKrFuIHniD2bRm46o9NDUD09xVVWM9XuLgNfmDzmLTdH/rEi0piq4ONnw73y3eXuAOS4CCKbBKa220d6S83neT7zMBDnuz19vmhnkxcrsKnYSsIhq+fHzHkBs031c5nQFp6/M6JmvZ79rrvYlkmKXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2d7zw/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATDhL022273
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=botcOBTfgkKNPv99LNsScTgn
	4cN84/U4QdrlCGYotGo=; b=F2d7zw/5nI4tUg9MAdRryTfXpqOhcaDi1fp3+Q3f
	Em7jeXhWp3vRd7dtgqxS7Y16g5alX8USq3ou7hn0rE/cuWinUHYHxfuNcKNNADdu
	BoKXmLl0qFYh/Tyr6xRsqC9i0zsAJ0V9mC4aqs1cxnQKZQuxdfYBCF8f+P39we63
	JxEwFBM2rr9YPrAlUw0/F++IY5tFxuyErXB/EnuVFa61o4hneDF530YYf92JqBqz
	uaJluuNsIXK00iwgWYuL2+pM56lav8LQQtno0JfWA/yY1CDYrGBlnScozKUvC+oa
	OAD29IFRdPaGQ/uC/DA2/SFzkAcaFHgf5LqWYq79SlBH4g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dt9sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 15:51:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so3417812a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 08:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572289; x=1743177089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=botcOBTfgkKNPv99LNsScTgn4cN84/U4QdrlCGYotGo=;
        b=INZNIetPeF4HPLMACdr7rk0HByDL3EY/iuQlGMjMPRCGBBzFddmPj6isgiIEmFPn8v
         OkQwVLLvE9ZqWO6qlsu/n/ipxxZqWJhcb5OKblztlJ3mAA7wO55+IDGHFjHtxMjJkBK0
         8tVUgWQ2TJ6MBCB4/AJAe97IdtJbYp01+XymoucZiMWmbFrFimoANJ0SftPmo6Oto/Eo
         8Cq1qd8+evqQqaKWN+gG7wWvqGtHbZXAZGofa0d+CfDKL53zW1MnhDRJ4vq5Ke35Jwm9
         AmWZ0HUORUMleaOnmEzPxYKQtgvjZPIFiNW1N03ax7DdZ+53U3bus8qQq9ACdESpc9VY
         Q8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWotS92u6K9EiVrEdISoJgiQF+KKTZqFMHCUYnU9IU7oxCo1BuyFXG4gwwX7VxfypUtHnizPv8y/yJn7Qm7@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwCnSOfk3EL52CJedP4oM8iHr/3nxobiQQUoWSJOiooOKsyEr
	PIJBNVQTT620nOFfnQBqZweWVkJVTj1QjamUY9G7ah7t1SxkjiHStlqWHWAvIImaedB0HiKcCPk
	sRhGGbS3dd2jDIS4UyO2NaAZTvcg/eTYIK1WvueWJAzwOWn5lvKQ7F2p90p618NMu1P60bDJZbJ
	fcyhi6RqlBh3balQ6KXn+5XM4jkbRHnx1KXX93k8o=
X-Gm-Gg: ASbGnctSnox5SyJCmzfeUU0vc+n3M/bFITJ5FxsrBtcL8qGAv15FJWm/W+S12yHnFmn
	LGhSE8l4rYyfZAH4B9Sf3hN3HkNszaU4OqwUnIBMpPUh7K5TOz/UPyYyxIzr9GSyrTCt4TxX6d3
	X0oAEJmBQ9Qz0yrUXMixU+iIyb9qUM
X-Received: by 2002:a17:90b:3a88:b0:2ff:618c:a1e9 with SMTP id 98e67ed59e1d1-3030fee7c07mr5042340a91.23.1742572289291;
        Fri, 21 Mar 2025 08:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeawR870RgNRsT7aX9neN4IVWph3gxSO0PuDog8K9yLU84HxYlXBGoNm94SOGW3+Ms1iniZq3RWPTSZ5JdcY0=
X-Received: by 2002:a17:90b:3a88:b0:2ff:618c:a1e9 with SMTP id
 98e67ed59e1d1-3030fee7c07mr5042302a91.23.1742572288792; Fri, 21 Mar 2025
 08:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com> <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
 <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
 <l77iickvroov7crzg6s2i7nq3kakqgdtbqki74stavqkiwyjfs@rv2oegbwogxi> <p5dxsjp2xdl5esmpxseqiy4n2xsici5fvow6wtiquhq7ixmlkt@fty3ez75y5ld>
In-Reply-To: <p5dxsjp2xdl5esmpxseqiy4n2xsici5fvow6wtiquhq7ixmlkt@fty3ez75y5ld>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 17:51:17 +0200
X-Gm-Features: AQ5f1JqEIudYIqVgFF6qdwfjhojclz6uIrhjBu1hnyRQQ9CPlnSR_Z7ke_cc47s
Message-ID: <CAO9ioeUSSshmw6gdEhQNzgAUQLh44etHRAsOThwFZ_9mfyJYiA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wse@tuxedocomputers.com, cs@tuxedocomputers.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: yZkepiVVaeXX2p3tELK2QluQh0y0X87_
X-Proofpoint-GUID: yZkepiVVaeXX2p3tELK2QluQh0y0X87_
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dd8b02 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=mY5vp2SPkWBKlwj5LW4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210116

On Fri, 21 Mar 2025 at 17:49, Ettore Chimenti
<ettore.chimenti@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Tue, Mar 18, 2025 at 11:36:32PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 18, 2025 at 04:24:27PM +0100, Georg Gottleuber wrote:
> > > Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
> > > [...]
> > > >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> > > >>> new file mode 100644
> > > >>> index 000000000000..86bdec4a2dd8
> > > >>> --- /dev/null
> > > >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> > > >>
> > > >>> +&gpu {
> > > >>> +       status = "okay";
> > > >>> +
> > > >>> +       zap-shader {
> > > >>> +               firmware-name = "qcom/a740_zap.mbn";
> > > >>
> > > >> Are the laptop's OEM key/security fuses not blown?
> > > >
> > > > Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
> > > > part of linux-firmware?
> > >
> > > It seems so.
> > >
> > > Because there were no logs about loading zap.mbn, I activated dyndbg
> > > (dyndbg="file drivers/base/firmware_loader/main.c +fmp"). See attachment
> > > for dmesg output. But GUI freezes after sddm login.
> >
> > Does it happen only with this ZAP or does it happen with the ZAP from
> > WIndows too? Can you run some simple GPU workload, like kmscube from the
> > console?
> >
>
> It seems to work fine changing the `firmware-name` property to
> "qcom/x1e80100/gen70500_zap.mbn" and updating to latest mesa on Debian
> Sid (25.0.1).
>
> Also tried with linux-firmware binary blob.

Then please post an updated patch, using firmware & ZAP from linux-firmware.


-- 
With best wishes
Dmitry

