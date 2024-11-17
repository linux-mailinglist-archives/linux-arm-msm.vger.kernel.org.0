Return-Path: <linux-arm-msm+bounces-38124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE49D0356
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 12:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906C92829D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 11:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71897145FE8;
	Sun, 17 Nov 2024 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N033CvT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564C224EA;
	Sun, 17 Nov 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731844290; cv=none; b=U1226lGhdIXJ9YTnvjGVjB757VDd/cTe6k6rtpopNRmwXSTiThUg7A7dh1uHaZM0gLb0N9rwKaPyVAy0ieRLoDWJrpuB/J9EpaaJy5nnAZYjW0E4qKdq9v5uFZuubwgSP0O83bGgOkFWgPngncBzf6D3nTnujMbXth0OaU41jDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731844290; c=relaxed/simple;
	bh=DmC8VdnRSA0mxZwzqevEwVwGsFG5Gwy+HKkYXSeVzjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Sm9D24uyA8RC8bjjNBrJjBWVuNv4Bzmr8ndot1Tn+u1AGAN9//MzwU3Xa7UL/fRmGn172vbDHOAE+C4NakD5dJbsG6LJvTZ6ZSihz0w1Tx/33CNWwCnqg4Wljx/5ksVcghsgK59nJOZecAlA+mSlrkdyXjjA0YJNpop7QHfcZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N033CvT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AHBQoEc018007;
	Sun, 17 Nov 2024 11:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7yo6t5c3rbNwNoB4a/nilO9me/cwL2wq9BFqEdkOaQ=; b=N033CvT39zoJPGTi
	SI6IxaCvgitn3oQRKgrSg38MOpyRcKS59X19nrT2n7Kv0AxiGab6NGw94XJvjv8L
	6krbIKAKE/ISJZY0i2J+NgS+Er85Ql7eeJhJ6atFxoezb55vOr8jO6jv/yZ0z6p3
	kjqodzrfiD5v6hZHmTFpLrZb+KPKSI1P566fflB5KR45fa6PeC2HmaUfo3xUU5Kt
	li5I33x8ukiEl1jocnJ3CLN3Giq+kK/9Kx4OOlwjsZeTxI1OQdtUa2nob+ZDQ3ga
	rRf4UUfMKcUHnxXkY36huIzn7tV6J+7MyApxef3mU8NEOKQDrQJLfK+LKXHMaIk5
	jqNR9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv9t618-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 11:51:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AHBpIM5023103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 11:51:18 GMT
Received: from [10.216.58.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 03:51:13 -0800
Message-ID: <51f7cfa8-3362-46e3-a9e5-e43d585d4ac0@quicinc.com>
Date: Sun, 17 Nov 2024 17:21:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15.y] phy: qcom: qmp: Fix NULL pointer dereference for
 USB Uni PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Andy Gross <agross@kernel.org>, Stephen Boyd
	<swboyd@chromium.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, <stable@vger.kernel.org>
References: <20241115091545.2358156-1-quic_kriskura@quicinc.com>
 <ibh3n7gl5qcawpiyjgxy2yum6jsmfv5lpfefuun3m2ktldcswl@odhjnmkj5jre>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <ibh3n7gl5qcawpiyjgxy2yum6jsmfv5lpfefuun3m2ktldcswl@odhjnmkj5jre>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4Z9p9YvYcx7uD8TRA6dEdOwt9rs22_R9
X-Proofpoint-GUID: 4Z9p9YvYcx7uD8TRA6dEdOwt9rs22_R9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411170106



On 11/15/2024 9:29 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 15, 2024 at 02:45:45PM +0530, Krishna Kurapati wrote:
>> Commit [1] introduced DP support to QMP driver. While doing so, the
>> dp and usb configuration structures were added to a combo_phy_cfg
>> structure. During probe, the match data is used to parse and identify the
>> dp and usb configs separately. While doing so, the usb_cfg variable
>> represents the configuration parameters for USB part of the phy (whether
>> it is DP-Cobo or Uni). during probe, one corner case of parsing usb_cfg
>> for Uni PHYs is left incomplete and it is left as NULL. This NULL variable
>> further percolates down to qmp_phy_create() call essentially getting
>> de-referenced and causing a crash.
> 
> The UNI PHY platforms don't have usb3-phy subnode. As such the usb_cfg
> variable should not be used in the for_each_available_child_of_node()
> loop.
> 
> Please provide details for the platform on which you observe the crash
> and the backtrace.
> 

I got this error when I started working on multiport support (begining 
of 2023). Initially I tried testing on my code on 5.15, hence this patch 
was raised on the same.

The 2 qmp phys on sa8195 and sa8295 (based on sc8280xp) are uni phy and 
the following was the DT node that worked out for me on 5.15 codebase:


	usb_1_qmpphy: ssphy@88eb000 {
		compatible = "qcom,sm8150-qmp-usb3-uni-phy";
		reg = <0x088eb000 0x200>;
		#address-cells = <1>;
		#size-cells = <1>;
		ranges;
		//status = "disabled";
		clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
			 <&rpmhcc RPMH_CXO_CLK>,
			 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
			 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>;
		clock-names = "aux", "ref_clk_src", "ref", "com_aux";

		resets = <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>,
			 <&gcc GCC_USB3_UNIPHY_MP0_BCR>;
		reset-names = "phy", "common";

		//vdda-phy-supply = <&L3C>;
		vdda-pll-supply = <&L5E>;

		usb_1_ssphy: usb3-phy@88eb200 {
			reg = <0x088eb200 0x200>,
			      <0x088eb400 0x200>,
			      <0x088eb800 0x800>,
			      <0x088eb600 0x200>;
			#clock-cells = <0>;
			#phy-cells = <0>;
			clocks = <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
			clock-names = "pipe0";
			clock-output-names = "usb3_uni_phy_pipe_clk_src";
		};
	};


I was hitting the bug when I write the DT above way on top of 5.15 baseline.

In 5.15.y, the SM8150 usb_2_qmpphy dT is as follows:

                 usb_2_qmpphy: phy@88eb000 {
                         compatible = "qcom,sm8150-qmp-usb3-uni-phy";
                         reg = <0 0x088eb000 0 0x200>;
                         status = "disabled";
                         #address-cells = <2>;
                         #size-cells = <2>;
                         ranges;

                         clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
                                  <&rpmhcc RPMH_CXO_CLK>,
                                  <&gcc GCC_USB3_SEC_CLKREF_CLK>,
                                  <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
                         clock-names = "aux", "ref_clk_src", "ref", 
"com_aux";

                         resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
                                  <&gcc GCC_USB3_PHY_SEC_BCR>;
                         reset-names = "phy", "common";

                         usb_2_ssphy: phy@88eb200 {
                                 reg = <0 0x088eb200 0 0x200>,
                                       <0 0x088eb400 0 0x200>,
                                       <0 0x088eb800 0 0x800>,
                                       <0 0x088eb600 0 0x200>;
                                 #clock-cells = <0>;
                                 #phy-cells = <0>;
                                 clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
                                 clock-names = "pipe0";
                                 clock-output-names = 
"usb3_uni_phy_pipe_clk_src";
                         };
                 };

IIRC, when I tried using the above sm8150 dt on 5.15.y, the phy_create 
was (either not getting called) or crashing. Probably because 
"of_node_name_eq()" didn't find either "dp-phy" or "usb3-phy" and cfg 
variable was NULL.

I can try reproducing the issue and get back again in a week.

Apologies if I have misunderstood something and this patch doesn't make 
sense. Let me know if I have made any mistake anywhere (either in my DT) 
or in understanding.

Regards,
Krishna,

