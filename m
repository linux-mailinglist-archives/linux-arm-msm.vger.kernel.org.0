Return-Path: <linux-arm-msm+bounces-29560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6369603F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 10:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925C6283F79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 08:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C2E189BA8;
	Tue, 27 Aug 2024 08:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GY4bT0AX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97B194C62;
	Tue, 27 Aug 2024 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724745990; cv=none; b=tOR2g28cQoUdLz5ug6BQDiO98wkC1LDSKNqvLvcyx060161++G9pI1GJ3mGeWVOtJvioZOA2jSw72uJO9SZ8lwPCv1Y1y/ilJIvyEp4YyUWyI6+RWhCGn1wX4B469XdOlasFEsNhdEyo93NNosKaQTWU5R6Mau3k0D9dH8g1Cbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724745990; c=relaxed/simple;
	bh=bNrUlql358duxz0xZ6kkPTqgaytxYizLfD7UW4xAL5E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeZoWrrjdN+4OcJwaPlIKZc6+q6X+KKcQ8wDWnXsrzPxrUxCgC+d0GDYob1MVfkOpkAFfCUhws/QDQanRqZ4ahint5J7w5oaF+EvVmdUGoFR19uykSHVoHun6gb+Rf9AWmECG8YDyHgtSFAR9Uy/XguGfAZxjC5QQylI5sImsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GY4bT0AX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R6umTS020197;
	Tue, 27 Aug 2024 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rMzWwOxLAvaYBL8C14V2DUa7
	Royn8qe6WziQ4i9Py9g=; b=GY4bT0AXvdPoYZYuSXwqcW8dJ9//Jm4BgcfHXDfM
	hPeBtWURey+hrxUjq2o8htmOJF2il8rMDoTvx1WuX7Ah3nWGn0XekpyXLfl9Nu9Z
	hk2Ze9JY7tFH4hWWpWIVN1b3hzQ7fNnpHdaS//EDliMttJ3h4nZNHvhi/lgBWh+j
	ekkjs0sb0QD8agaMulIBIf6stYk6BjlNk0Jc/bR+BAPu/dL5VZ63ZUPLYqPUnyzE
	tMgwzLloRVjy30K19RNWeDGNDNfHEXqpkxp6//Sql36YsyUhnNdgoB8+9KKiD6Wk
	7Cgz1LWqi1j2xunnjAOJZkW6vAJucnrWMinOTzOyTlU0mg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4199yt05ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 08:06:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47R86OHH021760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 08:06:24 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 01:06:20 -0700
Date: Tue, 27 Aug 2024 16:06:16 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH v1 0/1] arm64: dts: qcom: Add coresight components for
 x1e80100
Message-ID: <Zs2I+M4wkjVlKuq9@jiegan-gv.ap.qualcomm.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
 <833eafc7-46f0-49d1-afe1-ad9d20ca16fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <833eafc7-46f0-49d1-afe1-ad9d20ca16fd@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VvDaQR_qxkiI1NW4xDmtASEtCFuJxqbJ
X-Proofpoint-ORIG-GUID: VvDaQR_qxkiI1NW4xDmtASEtCFuJxqbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_05,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=417
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270061

On Tue, Aug 27, 2024 at 10:02:44AM +0200, Krzysztof Kozlowski wrote:
> On 27/08/2024 09:27, Jie Gan wrote:
> > Add coresight components for x1e80100. This change includes CTI,
> > dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.
> > 
> > Change in V1:
> > Check the dtb with dtbs_check W=1, and fix the warnings for
> > the change.
> 
> So this is v2, not v1.
> 
Appologize for the mistake of the version number.
Do I need to re-send the patch with V2?

Thanks,
Jie

