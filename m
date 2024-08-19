Return-Path: <linux-arm-msm+bounces-28952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F40956655
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 11:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E868C1C215E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 09:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3492F15B984;
	Mon, 19 Aug 2024 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PDNXaoUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739615B12A;
	Mon, 19 Aug 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058440; cv=none; b=DA9JOCN6BQwPB6GWfUC6Kt3RJKpeYIx4uO8/f2N+QF//jANUd5hnUhCkiVxuO5L/7gjzeVrKdKt9fgt5j5Dkw1kj7wruMCk9JnZxYo4MnkLtPpSEz9P7fdyt8hqrhu8y3DtVnyygxtpyTGuR/e7aBiOwEd4RUbbG2UBHLT3+O8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058440; c=relaxed/simple;
	bh=SK+t3a71v+rCe6BbpnH5PElTunoWwbLeiT2R3+89TBY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iahaa/SS3tG47Pi+nYDBqrXFVAan2MYqlVEvIDzYbQAywCc99EA9oQ1adRDtmY76Y7R59F74+hLh0Z26ITq0XuFL7W/j6WzYUhP/2Ru9BHE8uaXK74kwyvKHUhd6yui9ucT0wV8T+aaTCYGiizPnwfHBETfYOofuLFlNlXeAsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PDNXaoUj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J002AM024937;
	Mon, 19 Aug 2024 09:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8uFeWL9jZ0Gotc3ihJ9vM7p
	FSGFaFzKwoQNZGtb/nE=; b=PDNXaoUjYG5lQQM50wIuiyRJtoW7fPLwe9Mt88jc
	+r5Qga0c/pR3lRYN7ncstw2DiHMWamIwskWuJyycsynlbzp43OC5S+7QTBFY0jaO
	x9D1FVqMkLRtss9XzBzQPtLKeH5SyClmNNLfagoVD7UlK3fSkbLxlmPTBUAVGC0B
	zfgErOwBt6C+GHJlWNMfHInbCWEwoXiWk94I/qqBTdGaWImzgrKNk7oRCkc2eQPD
	o4URUz/mPtNL+3TxRbs7cRj7qXcIZWx66bCMwiEVbuGNV68zHwJPOgRv8pMX72Ca
	PrO3cMMsphUSnZjBvnR6T8aNOxfTCG0PsBm7hcFFaQ8JIA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412jtrukkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 09:06:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J96pqN008822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 09:06:51 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 02:06:45 -0700
Date: Mon, 19 Aug 2024 17:06:41 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
Message-ID: <ZsMLIRoDMmbH7vM0@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <e087b788-4002-4d12-bd8f-a40fc814856a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e087b788-4002-4d12-bd8f-a40fc814856a@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1o1y9cZQz3WTmMDiWMDwbcku6ekrAHBn
X-Proofpoint-GUID: 1o1y9cZQz3WTmMDiWMDwbcku6ekrAHBn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_07,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 mlxlogscore=718 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190064

On Mon, Aug 19, 2024 at 08:26:19AM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2024 04:41, Jie Gan wrote:
> > +
> > +maintainers:
> > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Jie Gan <quic_jiegan@quicinc.com>
> > +
> > +description:
> > +  The Coresight TMC Control unit controls various Coresight behaviors.
> > +  It works as a helper device when connected to TMC ETR device.
> > +  It is responsible for controlling the data filter function based on
> > +  the source device's Trace ID for TMC ETR device. The trace data with
> > +  that Trace id can get into ETR's buffer while other trace data gets
> > +  ignored.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sa8775p-ctcu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +
> > +  in-ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    patternProperties:
> > +      '^port(@[0-7])?$':
> 
> I see only two ports in the example. How many are there in reality?
Existing projects can have a maximum of two ports. I used the range 0-7 as I consider
it unlikely to have more than 8 ports. Maybe it's intended as a large buffer for
futher design needs.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Jie

