Return-Path: <linux-arm-msm+bounces-25506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B492A6D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A6B286054
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 16:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFB613D2BB;
	Mon,  8 Jul 2024 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EO8AopNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688AEC7;
	Mon,  8 Jul 2024 16:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454945; cv=none; b=IUUrVWH/mhKnXLJWZ3r5sm3bjh0dTmavQuubmUpKWGqUJZwJUl2pkqeqNLhliZ79AsD083yS/+EnLJRMdTpaCcSOVtfAV9ZqxEAfPpF95jUJ2YcG9U54ST2GYAFO3rdsGj+ByfRG1vdaZHOgWqHmmdemXRQZiRbZ1tDRWFFthso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454945; c=relaxed/simple;
	bh=Gaqv1F7HUUrf7r6YQfWOX71U7e5DKooiIPc+EJSlaZI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0o+7Bh0r1jTAwgJ+OOI42W12OCA1QPUEBt8oJYlSCvd+GNqfLYn1uUPkQN/Cub/4hXyt4Mnjn4oTmdEa4Xou+AfAIJYkFqjVn6CBbhhs+BhCh+PfsCsE8lAjVpMvgKtbLkOahZBUkAAdwcLUW3jyfRHrBpX7LRf2ScotIgN5do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EO8AopNT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468AHe7K008024;
	Mon, 8 Jul 2024 16:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PNBE/PluTogbqN9ixTFzSKz+
	dbIoyJJDQX37ZYDsHMo=; b=EO8AopNTjQZsJoLBBYXuDxtF4VHeTL1038I3wXRK
	xaAuhJmHvOTq8eGjujvPzQ6GBYJ5GJ+KJ6avv0m+axWCrN/YxYqVieO0/HdF67EO
	lDdT+lMQODeZILUX4l4aMWzrgt0kMZR3GeCF+pPkrRDpuOWmbsAt+a/NwVD+itcY
	rC9JeZ9N/VGDc57+iyuen+sKv9te+nJzn5tdrvwlW4342EZ80KV4vsLZCNGRAPOv
	47tXyh4zT91Uki9pWMdZ3kLZJMWcOl8yLi1syjJiQDdIcQLQfDsKbhnRnoZdXo4t
	gjhU4o9PSfrpEvVpMXx6p0hp5cq91FI9NM+giGmfHbFdcg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8v3rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 16:08:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468G8rTE009394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 16:08:53 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 09:08:50 -0700
Date: Mon, 8 Jul 2024 21:38:41 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add TCSR halt register
 space
Message-ID: <ZowPCeNFh/Mw8ev0@hu-mojha-hyd.qualcomm.com>
References: <20240705153252.1571814-1-quic_mojha@quicinc.com>
 <20240705153252.1571814-2-quic_mojha@quicinc.com>
 <50d0bdd6-2262-4404-9a26-29b1f2e6fe92@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50d0bdd6-2262-4404-9a26-29b1f2e6fe92@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9aoOXSjaAJAO-s9OzL_BZPLAfjH03VNY
X-Proofpoint-GUID: 9aoOXSjaAJAO-s9OzL_BZPLAfjH03VNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=721 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407080120

On Sun, Jul 07, 2024 at 02:46:59PM +0200, Krzysztof Kozlowski wrote:
> On 05/07/2024 17:32, Mukesh Ojha wrote:
> > Enable download mode for sa8775p which can help collect
> > ramdump for this SoC.
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > index 23f1b2e5e624..a46d00b1ddda 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > @@ -221,6 +221,7 @@ eud_in: endpoint {
> >  	firmware {
> >  		scm {
> >  			compatible = "qcom,scm-sa8775p", "qcom,scm";
> > +			qcom,dload-mode = <&tcsr 0x13000>;
> >  			memory-region = <&tz_ffi_mem>;
> >  		};
> >  	};
> > @@ -2824,6 +2825,11 @@ tcsr_mutex: hwlock@1f40000 {
> >  			#hwlock-cells = <1>;
> >  		};
> >  
> > +		tcsr: syscon@1fc0000 {
> > +			compatible = "qcom,sa8775p-tcsr", "syscon";
> 
> The file is going away. This change is very confusing.
> 
> Please align first with your colleagues instead of sending conflicting
> work without any explanation.

Sure, let me check with Tengfei if this can be sent along with his patches.

-Mukesh

