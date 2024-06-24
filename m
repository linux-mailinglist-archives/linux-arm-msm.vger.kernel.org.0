Return-Path: <linux-arm-msm+bounces-23876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 158439142AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 08:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF681F2137E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 06:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6489C225D9;
	Mon, 24 Jun 2024 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fgtNEasX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D652E400;
	Mon, 24 Jun 2024 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719210132; cv=none; b=W/34H4sEELjKiWqWZPe2QB/cvXNx0w444OW9GPrrIo5Zw5HkbqKBXF49XW+RWt4ZUMDxg8ypCHucXnO64mSSgGKjM08mu8Ji13cFXEddNhmxoGshgKZmRFNXFDYpJ8jfZVS/NL9Tsbg2n0IUutU3BZVy7iaLFHoTCEEQnBChrB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719210132; c=relaxed/simple;
	bh=OehhVV1KBD0S5MzdbAomE8iFH0avJWioXXG8XDrbc9c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eteT0MsYIHOfDIuvY3IcNtf1g6xMBeDhZhfYYQf3coQtmwmaWmXGYJSqMKRej3inSP0pB/INhn1YpYXhwxF89m36f5VnhkXcK1c2srVojvdDv7qwfK4uo8aB0X1a1Y+deVwrA9X+xaVjXyI0EPTLqSOK7mTMnWuOFkenMyj5qMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fgtNEasX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NMpd1K025140;
	Mon, 24 Jun 2024 06:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78BjC4ZngSF0zZa4ZxItwDC7
	TOkUvZ5wSfalarQ23zM=; b=fgtNEasX4CeU2QVGVI0PidkxsvZTVx1bqKiNCaU3
	/R91iNbjSiLQzvWCTNf/vtJ6XI3Kwabx03TcnTxYig9woESA8nMQZHYim/VIzLj5
	NrAQVKesjy72FI447vVix5NzvdMiIzXHBmGtl6+Ap54DF1KnfLqM5FubtVSu0XUK
	miqXFh4MLBR8ZTTtyKAuz/pOZU4cvpvPcRWnslGos2RSr0t3gFsJvKTZ9t6cDZ1m
	Kv25nR3TetyaZiNjerumLIfKpJGI+rVInM2jq9ExaoEqbvANr4faIIffrCw8CLNo
	mqFN5rsK06byKnN8SoMczeINsZiyzThB3VTD/1/yy4OKBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnxgtsf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 06:21:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45O6Lt12025514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 06:21:55 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 23:21:49 -0700
Date: Mon, 24 Jun 2024 11:51:45 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Sean Paul <sean@poorly.run>, Thomas Zimmermann
	<tzimmermann@suse.de>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/3] Support for Adreno X1-85 GPU
Message-ID: <20240624062145.nkqlh2szazvjigk7@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <26abe6cd-e9da-4db9-9035-76edd5dda614@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <26abe6cd-e9da-4db9-9035-76edd5dda614@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PO8NswSRSU9dBTs6ixM3EjEKZVLtXOKQ
X-Proofpoint-ORIG-GUID: PO8NswSRSU9dBTs6ixM3EjEKZVLtXOKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_05,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240049

On Sun, Jun 23, 2024 at 01:11:48PM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > This series adds support for the Adreno X1-85 GPU found in Qualcomm's
> > compute series chipset, Snapdragon X1 Elite (x1e80100). In this new
> > naming scheme for Adreno GPU, 'X' stands for compute series, '1' denotes
> > 1st generation and '8' & '5' denotes the tier and the SKU which it
> > belongs.
> > 
> > X1-85 has major focus on doubling core clock frequency and bandwidth
> > throughput. It has a dedicated collapsible Graphics MX rail (gmxc) to
> > power the memories and double the number of data channels to improve
> > bandwidth to DDR.
> > 
> > Mesa has the necessary bits present already to support this GPU. We are
> > able to bring up Gnome desktop by hardcoding "0xffff43050a01" as
> > chipid. Also, verified glxgears and glmark2. We have plans to add the
> > new chipid support to Mesa in next few weeks, but these patches can go in
> > right away to get included in v6.11.
> > 
> > This series is rebased on top of v6.10-rc4. P3 cherry-picks cleanly on
> > qcom/for-next.
> > 
> > P1 & P2 for Rob, P3 for Bjorn to pick up.
> 
> Which Rob?

Sorry for the confusion! I meant Rob Clark whom I had added in the "To:"
list.

-Akhil

> 
> Why bindings cannot go as usual way - via the subsystem?
> 
> Best regards,
> Krzysztof
> 
> 

