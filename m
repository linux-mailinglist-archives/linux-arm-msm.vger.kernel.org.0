Return-Path: <linux-arm-msm+bounces-30432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036A9690EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFCBEB20C73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 01:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF953308A;
	Tue,  3 Sep 2024 01:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mzxQT8rt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89915D1;
	Tue,  3 Sep 2024 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725327055; cv=none; b=plw99SYmEjlTQwsrSUp56piw/1sbdkqCjhPkffuBra4zBfI5hdyJn0bl0L/U7rpOTCn9P+Y0FOtYK+QPBFVoVP47mKSpJmJ6f418Uwsd8RN216VJxHMdMohaXhD3gBgo4xufcOcVST8WWnPoPTNOjLH5K3b0vFTQrh9G2/50/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725327055; c=relaxed/simple;
	bh=fo7tlYkk9jPrt8TCHcHcAOeb3lNp4WaAVXtPx2TeG44=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH31ZTOYYvgsvCNQoOASkqXay67VPjWvBIMA4ourxjL/h4xC9wPLQIy0oBntz3B2RUe160F6vfTG+W0pvhxs+wAPazJ23OVFfb68SbD5MVpoohjdVe1HhT3ZWEZ8bh9Hx8lApR724Uwq+S/NRFodQpIBqeLwL87GTReSAZX3WfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mzxQT8rt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482NxE8T018430;
	Tue, 3 Sep 2024 01:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FVtv6Yv3URoaXC2cEmRj1Trd
	fRNj2NGxOvBSfbiEjBo=; b=mzxQT8rt03QoCje6Gqosjg8fgZLCeEF+wXcCzkv2
	gHyxMqUKrb/ml6wHB0M+SxNh+YIhnzDLlOEPZFDrKUmye+qaqj1JlScwQj+MX6lm
	RoKbQCTr7mTFPIeZCQ3HaReiMgNbZXpz1O2QdFPaqW24vv9fUpDnqbo+i6MO9IU2
	bcSWLOyTQHDW1+XxIuWg2u9aZHyQUCH3z4csl+ac/HNHI9IK69nabGwwGtCy9wJY
	134p37d9ltbvZhDGoNfNDxnmfFpwEN7/gnCfhN/2kp3071KBJhZZURMfbevjTFm/
	bp2S2dK5gk/kRW7sYjJ8BTqJ/eMfOXd6KZ1XHmyKpVBC5Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bud2nt1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 01:30:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4831Uonw007441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 01:30:50 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 18:30:45 -0700
Date: Tue, 3 Sep 2024 09:30:41 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <ZtZmwVK8h//nDXm1@jiegan-gv.ap.qualcomm.com>
References: <20240827072724.2585859-1-quic_jiegan@quicinc.com>
 <f6813e5a-9b8e-4728-abb2-ad5926d6fa41@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6813e5a-9b8e-4728-abb2-ad5926d6fa41@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JLfugollkkDNoaYPF8vxTlDZppvg3GJ9
X-Proofpoint-ORIG-GUID: JLfugollkkDNoaYPF8vxTlDZppvg3GJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=637 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030010

On Mon, Sep 02, 2024 at 05:27:32PM +0200, Konrad Dybcio wrote:
> On 27.08.2024 9:27 AM, Jie Gan wrote:
> > Add coresight components for x1e80100. This change includes CTI,
> > dummy sink, dynamic Funnel, Replicator, STM, TPDM, TPDA and TMC ETF.
> > 
> > Change in V1:
> > Check the dtb with dtbs_check W=1, and fix the warnings for
> > the change.
> > 
> 
> Applying this series and enabling CORESIGHT=m (along with all the options
> in menuconfig) breaks booting on my X1E Surface Laptop 7
> 
> Konrad

Did not observe any booting issues with our devices. Any relevant log to share?
This patch also tested by my colleague.

Can you successfully boot without the patch?

Thanks,
Jie

