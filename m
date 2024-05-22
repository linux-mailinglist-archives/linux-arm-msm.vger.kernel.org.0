Return-Path: <linux-arm-msm+bounces-20277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B08CCA02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 02:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0872B1F223E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 00:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C2F14D283;
	Wed, 22 May 2024 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LaezNVqN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6892E631;
	Wed, 22 May 2024 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716422398; cv=none; b=hD1rZKuIZF2ycOHvt6lK3qVbUNBC7vYL5mzRPMFO9BxY+HiViWEPdiHdvi2SpvRK+ND1eoj+b7jMtZKY1KsP8cyjKPu4YbIBZNpRCjSEjbIKL2qTbKJgEJvsqyQMTVvEro7QyHYemtkufcbB20PX1egfhdWRH12SbebKj07RB6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716422398; c=relaxed/simple;
	bh=bH25G4J9tJZE1A8A+0SH1UYcRTKMK873psmxMuRe84o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plqVjDzRpTWqD8XFOxpOQxRzYOPSLCkTB7RFZclhVQtEulk3RGDviKxK7z/6cJTibJDlOAIVxtX+an0GTT4jD8D5dzsyJCR9v8hCUXu5KqPUJgPk4MstqhtdAxhiWiTfp0efVDca1IvxzjZlMEfrHsBMs+lUx5j4/aPjzk5uijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LaezNVqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MBkjFj010453;
	Wed, 22 May 2024 23:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=RpsDCS1dfdoVuVzmg/2ZQ
	JlLRYFFc7pkGn3XYPNcMoc=; b=LaezNVqN7lh4+nw66AgI6w0YFvS9ZHMqjTjef
	ocPhU+VUeWbr0XQWw+DERG6RKr2JEFnH+kW/jQf+3MvHY6i4VNzFe5GbHB1Wu0Im
	T0lXkdCewXJc1XeE02Jtb/Srm/P12iJJ4YGwHQ+r1J1rPYLI+brhCnZQtpEIZRbT
	JXUlphLjmaNrWQaRPH4lQnxyUtgY2SiJAH4DWgF6u0zeG1S+8Cf2lEGzDGMTxtfj
	oou9lZgbsOwgJonDsiXyplRwAQhHSwJHVEPQALAhcM7GXHsdEjjpZua+Cun6HFib
	aN7oXtbMWqj0fiJ+6/16gLv8un8GoAbSVPMhvS6cjQLC1qheA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqcag6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:57:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MNvaRI002713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:57:36 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 16:57:35 -0700
Date: Wed, 22 May 2024 16:57:35 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Amrit Anand <quic_amrianan@quicinc.com>,
        "Peter
 Griffin" <peter.griffin@linaro.org>,
        Caleb Connolly
	<caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>, Doug Anderson
	<dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai
	<wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC v3 1/9] libfdt: board-id: Implement board-id scoring
Message-ID: <20240522165555758-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-1-e6c71d05f4d2@quicinc.com>
 <20240521-sandal-onslaught-7762ee03ee96@spud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521-sandal-onslaught-7762ee03ee96@spud>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aJOOoogyRGQQumiFE56hmGnw41NPIqf4
X-Proofpoint-GUID: aJOOoogyRGQQumiFE56hmGnw41NPIqf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_13,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=697 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220166

On Tue, May 21, 2024 at 08:28:01PM +0100, Conor Dooley wrote:
> On Tue, May 21, 2024 at 11:37:58AM -0700, Elliot Berman wrote:
> > The devicetree spec introduced a mechanism to match devicetree blobs to
> > boards using firmware-provided identifiers.
> 
> Can you share a link to where the devicetree spec introduced this
> mechanism? I don't recall seeing a PR to dt-schema for it nor did a
> quick check of the devicetree specification repo show a PR adding it.
> 
> What am I missing?

My thinking is that the next patch would probably go to dt-schema or
devicetree specification repo.

Thanks,
Elliot


