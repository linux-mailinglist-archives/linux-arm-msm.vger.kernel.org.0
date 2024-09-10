Return-Path: <linux-arm-msm+bounces-31380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8359726E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 04:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09CA81C22441
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 02:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829961804F;
	Tue, 10 Sep 2024 02:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cIepPNDb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA921538A;
	Tue, 10 Sep 2024 02:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725933727; cv=none; b=OHG7vm+dnGCrJ+g42ef7ZeJD4vHIreWHnB3PzbnnwnWocgUYK8/9SU0Xn1mRrwLeHI/Kpmnq55VJ1RLePGJsMSQZH5jJbjhAQ+3FpXti4FAud4Y+kj7pQVrKjF4hzihOdlKIO6KVW8o+kmEmVgMww9C0mA67ZtKrv5/30hz9euA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725933727; c=relaxed/simple;
	bh=U+uufWjSRpTa3OT5NOCQdDsTdOAdkomdyUI5AprDGIw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTJxQk5Fvk4r4TnNqn+U2YjzalLoSQlYj4rBkKaodeMEOtaUCBaELHij0jeJoESHBAMbDsUZf1M/r5eO78qi6dPYvh+seuOfjFdA3AfER0jFHCY2fIQD6lMoBw6tBYMkS/W6840bVbOOpgD+nyEHDRdOeBoRIxO/NCguUVS5fxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cIepPNDb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRSEP020319;
	Tue, 10 Sep 2024 02:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jbOeq+6X1/4MAP644ULCEDj5
	PCIgL+8MAXcB5WCKTL0=; b=cIepPNDbfQh+8h2jqOUf3iJGFk671yM0MqdDly8B
	tLI9sk0qMOk/DayzGjucm0eqsfx/THdftyWeIm7F+D0BX/FrJZKDGJCTayOwQg9O
	pYWKNmuiDt+Lx6+VT/RTw0e7qXG/Wru6R9/cd0oxoxtghr3rV0lN7duxdNm5r1Xy
	0AWOUYsd1EL6gCl37+JJ2AIB8zc72p87hyMM7z+XzINXhR61mffUPH8nKFYVV5NO
	vGo2f8BsZ1g5IylrHsSbBeFDbBo5YE9XoLuB/ZqZn7ykrENkLMt6KSkdLOhIiFaC
	wI5xhA3BbAkY05FSgwGyyFKku4/UfRpcHqawFsyW9BGvjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5dun3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 02:02:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48A221FD000818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 02:02:01 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 19:01:57 -0700
Date: Tue, 10 Sep 2024 10:01:53 +0800
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
Subject: Re: [PATCH v3 1/1] arm64: dts: qcom: Add coresight nodes for x1e80100
Message-ID: <Zt+okXSkE63O/PYk@jiegan-gv.ap.qualcomm.com>
References: <20240905103825.2154633-1-quic_jiegan@quicinc.com>
 <20240905103825.2154633-2-quic_jiegan@quicinc.com>
 <734452da-6a3e-4063-ab42-607ac8dd10ac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <734452da-6a3e-4063-ab42-607ac8dd10ac@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _u4yqcohsHPVvv9wbKit1bHhFF32KtQS
X-Proofpoint-GUID: _u4yqcohsHPVvv9wbKit1bHhFF32KtQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100013

On Mon, Sep 09, 2024 at 10:05:08PM +0200, Konrad Dybcio wrote:
> On 5.09.2024 12:38 PM, Jie Gan wrote:
> > Add following coresight components for x1e80100 platform.
> > It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> > TPDM, TPDA and TMC ETF.
> > 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > Tested-by: Yushan Li <quic_yushli@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1516 ++++++++++++++++++++++++
> >  1 file changed, 1516 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 74b694e74705..9d6f3098e144 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -305,6 +305,19 @@ CLUSTER_CL5: cluster-sleep-1 {
> >  		};
> >  	};
> >  
> > +	dummy-sink {
> > +		compatible = "arm,coresight-dummy-sink";
> > +
> > +		in-ports {
> > +			port {
> > +				eud_in: endpoint {
> > +					remote-endpoint =
> > +					<&swao_rep_out1>;
> 
> Don't be scared to keep the lines 100-long, easier to read that way
>
sure, will fix in next version.
 
> [...]
> 
> > +		tpda@10004000 {
> > +			compatible = "qcom,coresight-tpda", "arm,primecell";
> > +			reg = <0x0 0x10004000 0x0 0x1000>;
> > +
> > +			clocks = <&aoss_qmp>;
> > +			clock-names = "apb_pclk";
> > +
> > +			out-ports {
> > +				port {
> > +					qdss_tpda_out: endpoint {
> > +						remote-endpoint =
> > +						<&funnel0_in6>;
> > +					};
> > +				};
> > +			};
> > +
> > +			in-ports {
> 
> 'i' < 'o', please sort things alphabetically if there's no other sorting key
> as per Documentation/devicetree/bindings/dts-coding-style.rst
> 
Will sort with alphabet order for "in-ports" and "out-ports" property.

> [...]
> 
> > +		tpda@10c2b000 {
> > +			compatible = "qcom,coresight-tpda", "arm,primecell";
> > +			reg = <0x0 0x10c2b000 0x0 0x1000>;
> > +
> > +			clocks = <&aoss_qmp>;
> > +			clock-names = "apb_pclk";
> > +
> > +			out-ports {
> > +				port {
> > +					dlct1_tpda_out: endpoint {
> > +						remote-endpoint =
> > +						<&dlct1_funnel_in0>;
> > +					};
> > +				};
> > +			};
> > +
> > +			in-ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@4 {
> > +					reg = <4>;
> > +					dlct1_tpda_in4: endpoint {
> 
> Please keep a new line between the last property (reg here) and the
> following subnode
> 
Will fix in next version.

> I was able to confirm that this patch doesn't break booting on the
> Surface laptop anymore.
> 
> Konrad

Thanks for testing!

Thanks,
Jie


