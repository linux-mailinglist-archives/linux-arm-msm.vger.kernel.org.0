Return-Path: <linux-arm-msm+bounces-68331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00795B2066F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD69161EDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904E72253A7;
	Mon, 11 Aug 2025 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xje/E3oF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14406487BF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909754; cv=none; b=Fsd7z5gubfpNBQ8zFNJc9TvusuawNdETcMqQgk7eJrDNsCzVmUIi/tQrhjuY3jv14WS203eywuh5fcuZETRzVdxzjdXy4aBfLn/jdChbRMSvAFSemcUK+Pj3ppF0G4/uq/ON0gIkXpFIDLwroG5hEEadE940z4DJN6iC5bCK5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909754; c=relaxed/simple;
	bh=EDlgtCGTTiPDS26OgrMplbuhmJKWPHHmP5ixMDSjbRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnurtZ/4z+wJbgaK6DW9UAGyC92DlxkeRsAb2/TFPAFy0Uk5Mgv2g5BJ+r603JXTin1aaXvt7HiAiwcPjeEZPyR49flxGhc23B3dJR52e5dFyuFqkiVhl5LjFkKMG/aKbgGhS8uMfpmaSF/a7Cirn6pTlxKQiY9MINyVqGLcgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xje/E3oF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAKw019083
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mfNS104sZvUDxiTcLFxI/nq7
	cWMQCwJ3YOUX3c0FHSE=; b=Xje/E3oFVs9vdnrDl6g8LqFPDlxxovzpfF3DtGBI
	coW9ZStep+39hJVXf+ZTRRDPVQc+mn8X7kWnebVhd8CjTVDZBAHrZnaEfH98mnbK
	wf6jDOPJqt79qf+zlxmYfxknmSPDPUnGciPjJ9rZHD1J4sILU7HGeZgVLOms208b
	6g9ssb7x3/DwraUbRMrq51yP/6MCKz19321gq3BepgXsmJGfBbJftNpspMBejuDb
	v+cRInn+48Qntb/EFUa2WL99GbJkm1n2zYXWDbRWa58/2GHHXRJbTngb6erwxXDy
	Zq5WhoBYHpcZGSK8aNKcbOCHVSTfoQKBRfaao4YmpA17oQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv2g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:55:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab979413fso89972006d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909751; x=1755514551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfNS104sZvUDxiTcLFxI/nq7cWMQCwJ3YOUX3c0FHSE=;
        b=Hi73Hc5OuG5RhESexGJ3ZKF4G9voRZWWvJkbz8CRPS7W9vl4lSzDtHmegWbp44B12k
         lv530s+n5U6qVhVPSA/WPygybusYH4ntFOkEGjbhfaKYVLIjlnF5zhmIE4dSQkopFdXO
         wWGXKQO/233tfG4de3W8iyg9c8vFUl9C/plIPfDPGFq47zy++xjRuJ93ja/FDzLhkdfI
         PUcKTL3WKZcLVFLE+88N6ZQ8Rmx97H/R464WqnHBq6MAIDErxVpUbEoSw+fz5hjF94Oh
         HqO9hnF5Vr3lGznGs6ziYReTDWNqg+2bFjWE5tTjh32HOrPhsc/wdUG8pDuGvFIf4p6K
         zsAw==
X-Forwarded-Encrypted: i=1; AJvYcCWhIvlhH3n8FxgcZKCMObZomuPjmHJ7OId1wS4gEgObZLUwQJkZHEo5S/JnrYKHOtR/GOTnL7fKvtj+R2/x@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+p2O+9VCnkB1LLQI8OQStNm6hjDgqJd0j27VT95l+8s0q1Ru
	ZoMZwuAp5R9a8V+LzvJAfRM+hfp/VnbDABjbRPxVLoqkaMo3WTUABT0qqH9IZSKKjoXftBNUdmU
	uBwHwRBnYO6mz5ar8/Td8f2r/1WMgmXYoe2ecWYSiaZxHOB+NpLtHD+ahdYtykaj7xwoq
X-Gm-Gg: ASbGncteq3hMM7nWxNwNfhJ1es7RLqsWdqjcB/VKLxwDnSSbCumzmsl8gtnedANlkEd
	A+RW9is3iuAF7qoLSNHfwf7CBWAJIz6HX3WQ8RcsQ7NVDYtCu37NuXfcbBvuQG3qeq18XR9ifOd
	LY7bF3CvQjGVx+psXgIt7Vk6v0i9mFiohHFQPS10/4ok3BCcvl9w3RRwAFJhBHXn2QxCIHBHgzX
	/+O9GSbfaQf9oQWfmKQGqua1vuoEjsLLkBAVh0KooKERcGPeLzwmsYWg3b//Z9gJjN/Bo8WrWqw
	TUoYasNTdp/Urar5+tQleaAUjumZCNLQfolQQL7GxV9Oh43AoIpVMVfTKDdRjtTvQVA+UUmxSLE
	ciQGLT4IKNeTTGRY3FKRwmdLowBzqPLCWLPG6nBZZ/Zppd71mM307
X-Received: by 2002:a05:6214:cc7:b0:707:63b8:3d46 with SMTP id 6a1803df08f44-7099a30512cmr137320296d6.30.1754909751148;
        Mon, 11 Aug 2025 03:55:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJGm+AQRrMZQkHwEUDLQJriTk9mSlKcg15YnclWYqXloRwI6zRHEDtZsJFogLVGniPGmspvg==
X-Received: by 2002:a05:6214:cc7:b0:707:63b8:3d46 with SMTP id 6a1803df08f44-7099a30512cmr137319866d6.30.1754909750630;
        Mon, 11 Aug 2025 03:55:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca334asm4229151e87.131.2025.08.11.03.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:55:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:55:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
Message-ID: <y4yiyokoo7fclwlpyhct4o7mt6swustuciigqnte5pruust26q@ryvuwpd6h4qm>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
 <20250807-topic-4ln_dp_respin-v4-5-43272d6eca92@oss.qualcomm.com>
 <ibrupwvn5frzb4vo3eukb7p7pzonaxwhygshz743wmyrbprkcq@xcpt4ryzvwqr>
 <619efc83-37f3-4b4e-b756-c53ecd2f6867@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619efc83-37f3-4b4e-b756-c53ecd2f6867@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899cc38 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mUy4j-dTXB4InB_98JkA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q9FD-XTts2gPnfa2prRjSOP7Rlm4vT_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXzAPJxQ8UPMqF
 k2LX5aa0dOMkvaUNcUZMEk1W9Unrmsw9GEYYAxrTU6JFCDMwJ8QBa0+O+d+CHl4FSFFiLPC6zIi
 2dWhxQENxLa1ZatY1E2v4TK8YjvzsyS5zpfl4Gg642BLb+iwViNakpVpDfDeQFAoWp31Pfv6wmN
 aDKDlfkpE9p0eypmnT/5/6Pcao5G1x3NpMwdgvHFx4dnc1l/DebNqyRrB62w26x9/hrJqkUzHti
 2Iuma3aDZRCDtHsumgOjINYcGIcwE9gUwOZ84m2atsJVzE7FZHlimJxOIDEisjmY2U4fC2fvj0F
 5AhL3Y3YPICTNqH7zLlUN60Quatw2DhH4mq43TtImattpQj1nnET/sTHRfOslJXXAZieq5vZIsc
 kRRDFylc
X-Proofpoint-GUID: q9FD-XTts2gPnfa2prRjSOP7Rlm4vT_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On Mon, Aug 11, 2025 at 12:37:00PM +0200, Konrad Dybcio wrote:
> On 8/9/25 10:13 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 07, 2025 at 06:33:23PM +0200, Konrad Dybcio wrote:
> >> From: Neil Armstrong <neil.armstrong@linaro.org>
> >>
> >> Register a typec mux in order to change the PHY mode on the Type-C
> >> mux events depending on the mode and the svid when in Altmode setup.
> >>
> >> The DisplayPort phy should be left enabled if is still powered on
> >> by the DRM DisplayPort controller, so bail out until the DisplayPort
> >> PHY is not powered off.
> >>
> >> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
> >> will be set in between of USB-Only, Combo and DisplayPort Only so
> >> this will leave enough time to the DRM DisplayPort controller to
> >> turn of the DisplayPort PHY.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> [konrad: renaming, rewording, bug fixes]
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 118 ++++++++++++++++++++++++++++--
> >>  1 file changed, 113 insertions(+), 5 deletions(-)
> >>
> >> +
> >> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> >> +		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
> >> +		return 0;
> >> +	}
> > 
> > I can't say that I'm fully happy about it, nevertheless:
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIUC we'll be able to get rid of it after the dp rework?

Which one? The HPD? not really. My unhappiness is about the sync between
USB and DP. I'm unsure whether we need higher level of sync for
USB-or-DP PHYs.

-- 
With best wishes
Dmitry

