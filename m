Return-Path: <linux-arm-msm+bounces-71143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D259B3A2CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13EF51C8358F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA66313E21;
	Thu, 28 Aug 2025 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KBWVCwb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727F3101C6;
	Thu, 28 Aug 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392901; cv=none; b=oMTSq/lArHGOxat64K0w0t99nbTI8YNwDqkUPYD2INP5ZmTcRCV9naobiIWGzHawO7wGHfSHv8gCD2AKKrvMBMW6AtQ1yV92YDM8fo8Y/pBBaJOZggcvyMiJNPVunv2ZR0uwTJ3UathfJ4CLbtx34VAIup/Fn1YtMwNPbt3FPRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392901; c=relaxed/simple;
	bh=Dp9KMrG3bfdOJSPSqWLpQPubDY8yWZv+uyo6/wkaGYY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwWtI5uJ4l9g2yTVHtMuA23xNhseH12ER/yTp2Y8LfFubDf9Acweu2TzvYOMFl7qVzGdg0OjIO14GsRI1iVbY+RjvjzYrNamYfdZHnStzMKeW+YDr7fm2ZhZZP5hl095dX7hVNLH0AGYMZGGp4Hja4lLVzcozYQZixa8rmmBdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KBWVCwb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEBdcL029277;
	Thu, 28 Aug 2025 14:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vHMLsOWDn1lzgcLHv58ZjEOh
	KPUDtolOGcVwqwzYyVM=; b=KBWVCwb1WT8WQn9a8Lgzyh5YIBMu+5w3J+rnDZN5
	0tPTL9R3qPEZ3xjQeG2mNnp4+tFIeiZ4SmoltsCOPiJ6tsI8YbzeYeT+hHujHJ+E
	TeEZcLFihTC6SwrBxl1N4CyVg+gvA3+kHyk280/akEG6u5jm96tVIb2aJFf34RrY
	JBF2RZuxD0ODTTBEFdi2VplwIfua9F8GgbPx2CCVncFr8sff7qlikbyx5OKmmBDl
	psqMd6YRqbENt9nF+dHlhA9LMOflWyT+reU6WT0GMelD7bNvnIYdnbc82V2O62qk
	i8OR5QOzfN9itZodCTSCVXelEv/eI3qVXn2IVSJphGpz4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umgqyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:54:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SEstHJ005452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:54:55 GMT
Received: from hu-mchunara-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 07:54:51 -0700
Date: Thu, 28 Aug 2025 20:24:40 +0530
From: Monish Chunara <quic_mchunara@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <kernel@oss.qualcomm.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mmc: sdhci-msm: Document the Lemans
 compatible
Message-ID: <aLBtsEHmNrmwRauR@hu-mchunara-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-1-08016e0d3ce5@oss.qualcomm.com>
 <lxcbfiiw5ierl7r6wmrmkhkyavhysddfb2ndg6ydawb32xs6ju@aq2jkmx4irrq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lxcbfiiw5ierl7r6wmrmkhkyavhysddfb2ndg6ydawb32xs6ju@aq2jkmx4irrq>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b06dc0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=HNruM7kcQO_uLJi-M8sA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX4oA3oZMoJfwU
 b0nSOAUOzYthgQtQu1BjIb5lv3McTTEIwvjZ4dFNfzfp64eozmTnipHHGeHjDE6DGMrP+eFSKzj
 u1Eh8DJwpVNNmca1hUnpsz3AqbtooA6RONmMDEfD+TrkGFXFB1112SrRbBn9XzHO9jkMKo1GvAo
 1PpHqUBlTZmhDr2CFKOPfqWpBfmK3OJywCb7+10HdgNdyRaf/C06049F0MYakpm4QP4EUF4XuiB
 ZK4W/8RG8bQKT5vcbJXu58bfK6/nfCf5AUICWlOl1Bl/xNHDLB1CBll1KYeFDrH6TB03CfKPeBv
 ooO6x7rfjEQi47jQpDoKVVkXdOlziqp3KfdQz1RTDtcVBlLeBpD0860r6HFnDU8Os/rln5/bkkG
 mz0KLA8i
X-Proofpoint-GUID: TVukss46DljDFmtbbhw4uul4yXivvSra
X-Proofpoint-ORIG-GUID: TVukss46DljDFmtbbhw4uul4yXivvSra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Wed, Aug 27, 2025 at 04:19:33AM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 26, 2025 at 11:51:00PM +0530, Wasim Nazir wrote:
> > From: Monish Chunara <quic_mchunara@quicinc.com>
> > 
> > Add the MSM SDHCI compatible name to support both eMMC and SD card for
> > Lemans, which uses 'sa8775p' as the fallback SoC. Ensure the new
> > compatible string matches existing Lemans-compatible formats without
> > introducing a new naming convention.
> > 
> > The SDHCI controller on Lemans is based on MSM SDHCI v5 IP. Hence,
> > document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> > 
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > index 22d1f50c3fd1..fac5d21abb94 100644
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > @@ -49,6 +49,7 @@ properties:
> >                - qcom,qcs8300-sdhci
> >                - qcom,qdu1000-sdhci
> >                - qcom,sar2130p-sdhci
> > +              - qcom,sa8775p-sdhci
> 
> 8 < 'r'

ACK.

> 
> >                - qcom,sc7180-sdhci
> >                - qcom,sc7280-sdhci
> >                - qcom,sc8280xp-sdhci
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

Regards,
Monish

