Return-Path: <linux-arm-msm+bounces-38465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472519D3993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE13BB212C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2357219DFA7;
	Wed, 20 Nov 2024 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IR4+fqrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95432199E84;
	Wed, 20 Nov 2024 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732102564; cv=none; b=rCh+OgnGzqIYqMJmxQKIe61mNyBDfmxcr5Tpkc7zUpk2D6c50CzuACdSNhSvjX6arvLSwIQvp8yMsgZQhKrYVxlufd2thuTqV3osTyhkVV70QzBK75noLsIV22EvzU6O51ZWJfrT5It2GzlCwh5PgU8PdLQfhato5zRZ1DqnVGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732102564; c=relaxed/simple;
	bh=VqPdryv5FHgZvOOtmSROQ3KLGj/x+FdpXnFIQV8QZzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aPc6zTYpo+0DaGscYe0KR2fzNOPsSCgFZ6/OvjfH7fPCIvmUrrcJ9O7wdwPJr1mp9v9jWWUoufdwoPlMIqCgJu5v+fox03K887XEF9I8RLKsFaO4/jp9d9leEui7OCfL0ScKco2e38Y0aSQ5H3KDW1uYxxm7HXg/3DYI/PRlJP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IR4+fqrd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FJfG029748;
	Wed, 20 Nov 2024 11:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oa2LZZiK+pbo5jdQvoe1rOEQalWxMsI1PB5zABeZAqY=; b=IR4+fqrdS3qoY7T1
	Uuyw61jDD96ggUHFSXSe1s6nbpadB7xkfDBk2Du1QPo7H1mnRhh8qdnmWC8dd6Qr
	mpCb+xYJBLd/hvRabNWrw6bpoI+vqPCCjVIgoPLHphYpGoevhX7QxS+LbFjUx3dQ
	hLIvJFB5SjkMPJKdRFCipxoxrHoJp2Njmn2AcJ4gjqt5h4Fis7bGwuMbXvYaLAYP
	MEo/0ugoEfkW541Ew8Jzwa21zqPYsNqAVNacsye1+Kyj34Gt8mjWSo+29drV1yQ8
	9MK3lYXJ0MuS5IXy/Go9aifYoSP+GfdJnpQFjabsSNOsSjiVzfxbmwlK3ys1HL3K
	R4a+nw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4319528xgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 11:35:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKBZw0A030836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 11:35:58 GMT
Received: from [10.206.104.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 03:35:53 -0800
Message-ID: <a741b71b-af04-44aa-9e08-a3f852b8a801@quicinc.com>
Date: Wed, 20 Nov 2024 17:05:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_abhinavk@quicinc.com>
References: <20241120105954.9665-1-quic_mukhopad@quicinc.com>
 <20241120105954.9665-3-quic_mukhopad@quicinc.com>
 <lkovymvjsbd44v2huij7paikvnmo7i7rrmkmvpha2wn5sc4hr3@ppr2dgvhzy6d>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <lkovymvjsbd44v2huij7paikvnmo7i7rrmkmvpha2wn5sc4hr3@ppr2dgvhzy6d>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jDv-mbhgXW_C-AFm6NQOA8oiQONt91li
X-Proofpoint-GUID: jDv-mbhgXW_C-AFm6NQOA8oiQONt91li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=908 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200079


On 11/20/2024 4:42 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 04:29:54PM +0530, Soutrik Mukhopadhyay wrote:
> > Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> > sa8775p-ride platform.
> > 
> > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 80 ++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > index adb71aeff339..4847e4942386 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > @@ -27,6 +27,30 @@
> >  	chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> > +
> > +	dp0-connector {
> > +		compatible = "dp-connector";
> > +		label = "DP0";
>
> Thundercomm's SA8775p RIDE platform doesn't show such a connector. At
> least not on a device advertised on the web pages.


Are you referring to this product in the Thundercomm web page : SA8225P 
and SA8775P
Ride SX 4.0 Automotive Development Platform ? For this particular 
product we can see
eDP 0/1/2/3 serving as the dp connectors.


>
> > +		type = "full-size";
> > +
> > +		port {
> > +			dp0_connector_in: endpoint {
> > +				remote-endpoint = <&mdss0_dp0_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	dp1-connector {
> > +		compatible = "dp-connector";
> > +		label = "DP1";
>
> Same comment here.
>
> > +		type = "full-size";
> > +
> > +		port {
> > +			dp1_connector_in: endpoint {
> > +				remote-endpoint = <&mdss0_dp1_out>;
> > +			};
> > +		};
> > +	};
> >  };
> >  
> >  &apps_rsc {
>

