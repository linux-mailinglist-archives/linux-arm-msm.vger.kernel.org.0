Return-Path: <linux-arm-msm+bounces-39071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064F9D7D82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 09:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B86DB22A5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 08:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A235718CC1D;
	Mon, 25 Nov 2024 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iEjKeeh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5B31822E5;
	Mon, 25 Nov 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732524766; cv=none; b=kZJQYbJkTH/Ax5UOq0XuhfwV69LWa3aKu6H9JiBcfYS6YMFe9bbPRv2OZmcOz5IFA48EcFZbpX8z+PWU/MzK95KAUeu93wXMnxwBFh7uLGNevhV2EclZq4LkMMi1NkgONpwVVyy8deixAcMzRAGqbN520R2NeZxlk9RQq0qdhlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732524766; c=relaxed/simple;
	bh=q64t1sF6oi/r+jvaNBzPuC8lttwncd9tf2eliteF7KQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWh0v50vxY1o6whr///xEAEM/MDwTwlVTDuObjhpDcOO6kJ7oPaifNoqYMqA9LBwCdVxvyIFMfk0aP0tQI/lMymqHaq77dn+eXwBp7F/zR2XxjSudvd7fHbYe58st1XE+c+gwRik7QV+pGDAVSWXKWA3Ta7TpCjDJIW7T97L9QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iEjKeeh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP6rdm6011423;
	Mon, 25 Nov 2024 08:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b5mgZvc619GkvUpNzZpYa3dD
	AVQNVIeKhRVUDk+biO4=; b=iEjKeeh2VpNUzpklmtgUuxCaNnz2miJg2f1fvfFL
	5p2yoT22VU6D4xUizjATGkqxYVOlpUvUxzQZOobNiDZW4yq4YsW/3Qmk0RhM4rP8
	kGG63GoGFlqjtt2vTv5oKeu0+mo6s1PmNZAcyfIr3cfPlfAaBBPKF++27o6jnbwb
	ybc1dUk7qClMVBDb+NMTJ05mbgII/t/SNR4jd7baX6vd72h4J7EaDeg8phh2faSb
	I0e6MfF3yuWESfuv7LvNmbMLKWQl3uaB7oglPE6c/l+SRPFuvMAHceE9IvT48Wad
	w0FeI1AyHC/fUbd4knXgP1J9eZ2WiCyj/UsQ1ykfkkzbGQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mcarahx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:52:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP8qeAT011133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 08:52:40 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 00:52:36 -0800
Date: Mon, 25 Nov 2024 16:52:31 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Z0Q6z8c3SeXsFNQv@cse-cd02-lnx.ap.qualcomm.com>
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <f9b01690-8940-4f8b-b142-6c2ec4db3e83@kernel.org>
 <Z0BDYiVaLQXaMsle@cse-cd02-lnx.ap.qualcomm.com>
 <ccbc6324-0dcb-405a-901a-12dc33a8130c@kernel.org>
 <Z0Pe0B9LsjpRHkkS@cse-cd02-lnx.ap.qualcomm.com>
 <97a6c471-b146-4625-a3fa-93ee29be4c37@kernel.org>
 <Z0Qv8lh1I7yeS4W+@cse-cd02-lnx.ap.qualcomm.com>
 <ddedecca-4241-4a5b-876e-a2724d361e74@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ddedecca-4241-4a5b-876e-a2724d361e74@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _QsxndKFC_mgH13EdVghEKKWy53Z6uUZ
X-Proofpoint-GUID: _QsxndKFC_mgH13EdVghEKKWy53Z6uUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250075

On Mon, Nov 25, 2024 at 09:16:02AM +0100, Krzysztof Kozlowski wrote:
> On 25/11/2024 09:06, Yuanjie Yang wrote:
> >>>>>>> +
> >>>>>>> +			resets = <&gcc GCC_SDCC1_BCR>;
> >>>>>>> +
> >>>>>>> +			power-domains = <&rpmhpd RPMHPD_CX>;
> >>>>>>> +			operating-points-v2 = <&sdhc1_opp_table>;
> >>>>>>> +			iommus = <&apps_smmu 0x02c0 0x0>;
> >>>>>>> +			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> >>>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >>>>>>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> >>>>>>> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
> >>>>>>> +			interconnect-names = "sdhc-ddr",
> >>>>>>> +					     "cpu-sdhc";
> >>>>>>> +
> >>>>>>> +			bus-width = <8>;
> >>>>>>> +			qcom,dll-config = <0x000f642c>;
> >>>>>>> +			qcom,ddr-config = <0x80040868>;
> >>>>>>> +			supports-cqe;
> >>>>>>> +			dma-coherent;
> >>>>>>> +			mmc-ddr-1_8v;
> >>>>>>> +			mmc-hs200-1_8v;
> >>>>>>> +			mmc-hs400-1_8v;
> >>>>>>> +			mmc-hs400-enhanced-strobe;
> >>>>>>
> >>>>>> These are properties of memory, not SoC. If the node is disabled, means
> >>>>>> memory is not attached to the SoC, right?
> >>>>>>
> >>>>>>> +			status = "disabled";
> >>>>> Thanks, I think qcom,dll-config and qcom,ddr-config are properties of Soc,
> >>>>> they are memory configurations that need to be written to the ioaddr.
> >>>>> And mmc-ddr-1_8v,mmc-hs200-1_8v,mmc-hs400-1_8v are bus speed config,
> >>>>> they indicate the bus speed at which the host contoller can operate.
> >>>>> If the node is disabled, which means Soc don't support these properties.
> >>>> No, that is not the meaning of node is disabled. When node is disabled,
> >>>> it means board does not have attached memory.
> >>>>
> >>>> Move the memory related properties  to the board.
> >>>
> >>> Thanks, Ok I understand, I will move the memory related
> >>> properties(qcom,dll-config and qcom,ddr-config) to the
> >>> board dts in next version.
> >>
> >> What? Why are you talking about these properties? My comment was not
> >> under these!
> > Thanks, Sorry, I may have misunderstood your meaning.
> > Do you mean I need move memory realted properties(bus-width, dma-coherent)
> > to the board dts?
> > When this node's status is okay, then board can set these memory config.
> > I will fix it in next version.
> 
> Keep all discussions public. Where was my comment? Under dma-coherent?
> No. Each comment is in very specific place. I asked about memory
> specific properties.
> 
> I also rephrased it differently already, but maybe not clear enough: you
> cannot have here properties which are not properties of the SoC.
> 
> I am not going to discuss it more in private. Read the netiquette.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

Thanks, Sorry, I accidentally sent the email just now; I didn't mean to send
it privately.

Ok, I agree with your idea. properties which are not of Soc should move
to board dts.

I double check my dts, dtsi. I think I should move properties(bus-width,
mmc-ddr-1_8v, mmc-hs200-1_8v, mmc-hs400-1_8v, mmc-hs400-enhanced-strobe)
to board dts, these properties are just to config Soc. Do you agree my
option?

Thanks again for your time to point out my mistake.

> Best regards,
> Krzysztof

Thanks,
Yuanjie



