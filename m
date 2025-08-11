Return-Path: <linux-arm-msm+bounces-68342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC7B206F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E3547AAFD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C444E258CC4;
	Mon, 11 Aug 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3hOb9tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ABF274FD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909938; cv=none; b=ReN9tl+dCzWTf17Aq3WKUj3vBovW4lp4AtbvUlaIF90ElTjUgsuOC60b5WbY5XJxzt4ZgVw9Ffesplm6uWcchQvX4AR2/YP61tUEIUjjj7hk2H9POTZqtLYrmj5EsWsxndI7QvpfBOLHvQCW5YjN94n/IDe5M8vgxWF38v2rlps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909938; c=relaxed/simple;
	bh=jQpXt5lJOPGLa1sqB2RfxQcFg7u6BQCGwUZwSWOyUyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0MrMWq90y2+S1WUlIfJZZt4xQVJKEH7SR0NcPzH0nzgIvIgWMyRoEsrvdP2kVeAdzs/no5h4Am1Xw8EndGVXaWwOZ7DcRmLPb0EncHyIK39H+bv1XS/TCU/fOPpFL2ajRUbM8zpJa2YnA4yf9IJB2RPxdZywFGM3cq+/zLVQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3hOb9tb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9n7007563
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LCBNoKc54TT9NiHquTumjmp6
	Jc2gxZAQ8MEjjE3KJtg=; b=i3hOb9tbCFgU3XFUbquG8R85Ws2AOF+31mP3dKy9
	iqa1+sEKuHZbTz79Wii6UtfKZcdW9Wlf8p0YuMs6nrFjIsL5mbWnt5cOFrf4iEse
	bVvbJe52a5LZG2ZXxK6YZz+Joqfs3o7US22vZQzzLIue/ljR5YN0uWIgw0NbJwMD
	26pvtvhFtvst+Fd1xRBx5gMW0mU2EiDvX83vzcs0VtmtnzhYJIoECuYSmL1/2lJe
	BTGNm+NdDo/In5b0r9RGFhjWmuH5Dhn9RiPREPVKhwfy2gSXTWZdbUnU/p/PUKh/
	s1U6awXOH5A0hBCKFpa3MaCsxJmhiT+TYCOe1dNqZOZVmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fm9xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:58:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0ca325530so9756781cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909935; x=1755514735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCBNoKc54TT9NiHquTumjmp6Jc2gxZAQ8MEjjE3KJtg=;
        b=eCynVaLEKOjJqmz/2ka7mP0M1ZN5zHhFbbckc6wdM+0DWwJ4nj3Z9UnB6IaSnZnywy
         Osv2wFcta42/rYb80hxVMsP7Vuq6KWENE9SCF/cpHMWr6iBzR6odAhJTVSAOxzkYWeYy
         z+QSFD43LZAI8tB/D4+D3USEdlvlXSujy8wTYnxrkl3v4pDlYcijIhyHXKrFidi9tws5
         VlgoltUHlYUZ1hGlkM9amBKEbDo4EzTLIWGjeVaxuKzoHSTAcCCT2YpsuN1WyjNdKR46
         pSUSxfClFxM3MUOhC0Nigxs8kDdKl8rsuhBWQs8DBqL+CoRm1MP/z2V566djCEui/z0R
         iGcw==
X-Forwarded-Encrypted: i=1; AJvYcCXHm8hGseCItCSgAMbZbW23dXdey0kpCYbl/h3HeRYPr/bja1AGvKJqswjCNW03aBshy/j777c2He5P6t+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrm8T9xkz+ojz1+Tam1KpqFa/ca2ZpDHqmpd5lwi9OjKJAQbyW
	tteVFDvQtCY8HPrTkyP1LAEMEugU6vt26Icm9bGfIm9WHi2079RrjlyPmy0kNxsI11OrUql7LPs
	vtXA4ZERWSnwA98Gu6zS7F2VvroHoPbRTpTBiTWXHta2VhdXVwtI1cdzzq9XzVppbf83I
X-Gm-Gg: ASbGncvYXMtK4HGruSglWQVAFVmGK4YUjEX3AWcUTLxqjzMk3D2FuWMBG5uv4zYpKk6
	oOLCqBTq3t9Ro4TceD/nk0tWLxr15wu17j9wqDRoiC98loeWugaaz2KlSzjDk3f6f9OFLCC8cnz
	XIA7cikgCPl8ZORdpy1W2bA0WslwsHhGb9Z0FvT8Xs3UxhA7j5xsIOLLhjLh5FV6L2EK/v77+MT
	yr8YxhVSnvlPQhBGqc4801MY3x65CbYraVZr58JI4NV33Zh5kD3exXjFFfMa0ULB/mWK12l61xr
	yRxRtuoO1MrQ2F9pfoTBMYAoDP5rKPprUMX+iRfcaQ83EJ1mdgTqTKQ10aK1Js5cJECLnL2M5q/
	LMw7H8podC0qWxFjo5IroxGJzWaVO/wLjGszKz/3swzTY2ALvMkNZ
X-Received: by 2002:a05:622a:1a94:b0:4b0:bc43:dd90 with SMTP id d75a77b69052e-4b0bd6610f9mr96569991cf.48.1754909935247;
        Mon, 11 Aug 2025 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBrlBvmKL2RueO2NS0xviGlmtRPiD5NDEbuXSKBImqyB7gwapNEVCwYcaPgiOWwUqYRHjJCQ==
X-Received: by 2002:a05:622a:1a94:b0:4b0:bc43:dd90 with SMTP id d75a77b69052e-4b0bd6610f9mr96569681cf.48.1754909934768;
        Mon, 11 Aug 2025 03:58:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc9df19afsm1050425e87.168.2025.08.11.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:58:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:58:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH 2/4] phy: qcom-qmp-pcie: add dual lane PHY support for
 SM8750
Message-ID: <mjg63cvby3jtosoiswqg2kjxlubavyz5o27asthjazg2z2x6gj@3u4gywclkg3r>
References: <20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com>
 <20250809-pakala-v1-2-abf1c416dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-pakala-v1-2-abf1c416dbaa@oss.qualcomm.com>
X-Proofpoint-GUID: px5RvhiTiZ4ia1y2hhb6tYTmVzwimZ6v
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=6899ccf0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=m1AchfmAwCg5kGC2PD0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX9iGnwUHKk4to
 WeWuEZbF8DezlK7q/f7mnP4z+7Uohma/5JLNCHOKD6XgYU+OEOMU9IAXpsmTX8qjc3yFDvnefGh
 HtNx97Bl4ixKC6OC691vZ2ClfC5I6G52yJoqS/QLNyWkNHpU2R5t37uuvZ1Z4HIOdF8Xd3Tbu0h
 jE9jykqQH9Z5nvpkqW2Ak11pVX8W5x+Z3iZrwQoxgu5SZIca70lVHo+MLluSbqg/cPLikNi9jIs
 SzEi22r6ye6TGTiqwvXXZBUkM9BuIqHM93IjV0rxBVh4MMnJhLSfZ9/sc1LNG3o4EmgbJ0jHPoy
 IO5Ov6UprDgxYnXb39Kqs72YUDdKnrxoX1t7Lgu0qYDh2oLaTksl+d5H6cXHL7L60Ojvgyq3DVk
 nPkyxoTJ
X-Proofpoint-ORIG-GUID: px5RvhiTiZ4ia1y2hhb6tYTmVzwimZ6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003

On Sat, Aug 09, 2025 at 03:29:17PM +0530, Krishna Chaitanya Chundru wrote:
> The PCIe Gen3 x2 PHY for SM8750 uses new phy, add the
> required registers and offsets for this phy.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 149 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h         |   2 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   4 +-
>  3 files changed, 154 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

