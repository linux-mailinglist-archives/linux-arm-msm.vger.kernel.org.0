Return-Path: <linux-arm-msm+bounces-23795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4221B913E48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 23:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E12601F214F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 21:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED621822DB;
	Sun, 23 Jun 2024 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MeTtD/tj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C682209B;
	Sun, 23 Jun 2024 21:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719176500; cv=none; b=ibeaZaN14wdP5owjkBODj/50kQ6gw5FDzkIUwlKLCDWoZGuJqjA78/MpKXUyur3Ama+lyXrIpDUPRtajEfEaC4Vbv16dYxyf6OkIXhxx1HSnPIiiU/2ZOSC1ztWu9lpUr7uTIGdyi0yWfDQAGaov6qNzbQUDquLQXchD8bwUYok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719176500; c=relaxed/simple;
	bh=C5EYTp84PTkwnTxWe05OBReF4zG1gQodvg76MrGPtrk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWcfVKoDfUjy894NqDh5sUNPZHUki2MtkzCfUpdov/ePFU82jksDcuU21wdolekM+K+h4ThqaE9z51Fm+qpwqKoEyn9qd83PigHJv4geDVZdosUlz92eUGqPHCPGd0ITCovPOaSrIlg5B4zu0lW0WtR72jl01Nv920MsRIJMuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MeTtD/tj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NGudij001480;
	Sun, 23 Jun 2024 21:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q7XGz76jCu2WWnnkgfEBCxSB
	RxHCD/i/sb3Z32/4624=; b=MeTtD/tjMT291VXt8SaeENGP1dzoLr46F4ReCOeF
	d1wrMt4EMlhqJvGZudP6WOn4J1KIEsGaknkNNLXDkeoXN8aoip1AEVHlKHbO6tsE
	J/LQvKQYI5AdJaiPWFenmuuyOV0e5mwkM0YUKwIZsNkj1wlz+aq8HMQiRlGtOoQK
	OLX+fOVU9rqAPqKpnj7vj+nCjGascimE622s+d6YYrzZBAnOQyb99JNOAcCkX8Vr
	u9Iz4HVqCdjHY3XZYfZ622AEpdLcl8omt1a/vQ2Ir/AR2Xf93LlEQsVWktCb/gfY
	WfZQ7gxFcQR3k8GUrlhA4aUCUFdyZV1o4pHZqAerz312Ng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrt8mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 21:01:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45NL1Vjb016151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 21:01:31 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 14:01:26 -0700
Date: Mon, 24 Jun 2024 02:31:23 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob
 Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <20240623210123.khe5fhzgb7uyws4o@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <a458a3a7-2b6d-4032-949c-b2c021d339e8@kernel.org>
 <20240623122856.kqf4x6mft74hzk7y@hu-akhilpo-hyd.qualcomm.com>
 <7d69e98d-a870-4200-8f22-2a16fcf02794@kernel.org>
 <20240623151630.bskqwqhp25mu3yuf@hu-akhilpo-hyd.qualcomm.com>
 <mmqji5hcfa6eegx2kdjkcy4hsoybtp25bgjsn2ol6dcdw2cgs5@fw3i3ufjkj3z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <mmqji5hcfa6eegx2kdjkcy4hsoybtp25bgjsn2ol6dcdw2cgs5@fw3i3ufjkj3z>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hHAdpiEbWqeyDJQWK0MiuKBTkMhdMC4m
X-Proofpoint-ORIG-GUID: hHAdpiEbWqeyDJQWK0MiuKBTkMhdMC4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_13,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230172

On Sun, Jun 23, 2024 at 03:40:06PM -0500, Bjorn Andersson wrote:
> On Sun, Jun 23, 2024 at 08:46:30PM GMT, Akhil P Oommen wrote:
> > On Sun, Jun 23, 2024 at 02:53:17PM +0200, Krzysztof Kozlowski wrote:
> > > On 23/06/2024 14:28, Akhil P Oommen wrote:
> > > > On Sun, Jun 23, 2024 at 01:17:16PM +0200, Krzysztof Kozlowski wrote:
> > > >> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > > >>> Add the necessary dt nodes for gpu support in X1E80100.
> > > >>>
> > > >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > >>> ---
> > > >>> +		gmu: gmu@3d6a000 {
> > > >>> +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> > > >>> +			reg = <0x0 0x03d50000 0x0 0x10000>,
> > > >>> +			      <0x0 0x03d6a000 0x0 0x35000>,
> > > >>> +			      <0x0 0x0b280000 0x0 0x10000>;
> > > >>> +			reg-names =  "rscc", "gmu", "gmu_pdc";
> > > >>
> > > >> Really, please start testing your patches. Your internal instructions
> > > >> tells you to do that, so please follow it carefully. Don't use the
> > > >> community as the tool, because you do not want to run checks and
> > > >> investigate results.
> > > > 
> > > > This was obviously tested before (and retested now) and everything works. I am
> > > > confused about what you meant. Could you please elaborate a bit? The device
> > > > and the compilation/test setup is new for me, so I am wondering if I
> > > > made any silly mistake!
> > > 
> > > Eh, your DTS is not correct, but this could not be pointed out by tests,
> > > because the binding does not work. :(
> > 
> > I reordered both "reg" and "reg-names" arrays based on the address.
> 
> The @3d6a000 should match the first reg entry.
> 
> > Not sure if
> > that is what we are talking about here. Gpu driver uses platform_get_resource_byname()
> > to query mmio resources.
> > 
> > I will retest dt-bindings and dts checks after picking the patches you
> > just posted and report back. Is the schema supposed to enforce strict
> > order?
> 
> In your second hunk in patch 1, you are defining the order of reg,
> reg-names, clocks, and clock-names. This creates an ABI between DTB and
> implementation where ordering is significant - regardless of Linux using
> platform_get_resource_byname().

I will revert this to the original order. Thanks for the clarification, Bjorn/Krzysztof.

-Akhil.
> 
> Regards,
> Bjorn
> 
> > 
> > -Akhil.
> > > 
> > > I'll fix up the binding and then please test on top of my patch (see
> > > your internal guideline about necessary tests before sending any binding
> > > or DTS patch).
> > > 
> > > Best regards,
> > > Krzysztof
> > > 

