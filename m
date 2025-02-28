Return-Path: <linux-arm-msm+bounces-49800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A9A490B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BEF616CAB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8003E1BC062;
	Fri, 28 Feb 2025 05:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fTzk5aUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEA1B6CE8;
	Fri, 28 Feb 2025 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740719362; cv=none; b=ij0QyI9obBKL54dqNJ0Re3PKl9hzayxEpB6oWifmgrVhcJWxnOsLvkdqn+gaf+k40ohWhphOj/20h8NGyj707wQhdxfYs7IdJTfkSnMYsp8YKAvPvKCpUAKb2JYPvNJAotaIZYjStP4a6FzT6laqyWTHjxoZ/KAzbvL31IcVwh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740719362; c=relaxed/simple;
	bh=pyEpxRsjDv1Vp5XUqCc2KvoRzTGi4Jn5FvxxFOA8b6M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C71GOp6b91Ag2bsBlSauHizdNYj/PI2bvIzHev/9nC3sosyz3isKV4TwNBCS/mma34CnNoWmmyxP3UJ0H+lswiIUUd//zOFxVmRHf5wAG2+GUghNfG4Bn/jG/CalqqbsNeJXzhV6PEIFHa2JfCnWwy74Hp566THBItZDG+4VqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fTzk5aUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RJI7Wj017602;
	Fri, 28 Feb 2025 05:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FVTwoYTTC+nsaPq7ZifRjG3l
	o1tRW2WUQg1YyfusBZk=; b=fTzk5aUqEiwNtwIsq/sc6SW9Uwa1XU+oqtgSmNE5
	QfxgEtFQRPw9N0v5evp9qbU/RVUqdrmboKaAfP8zSe4jU379sghfl1Y3w73+eIih
	dHmnguAS+pPNn2k4dx1Js61zJJzFm3Wp+m/fDYW04gL621d/E7x9fzTtp4F+Qy8k
	V0GYaf45Nq1DGtKCyyBgn2zXP+BH3k1rkNWV01B2VMQY80crolV4p2yTfJks/d8k
	dFX1jruGJDr35/Fm5zh64FKcay4sDFJqW/m7lkv3+0aOUJzY5X1r1X6yzcm5/uFm
	n7TMfvrl0v+iaJsGIdkppFAaM6eG2BXzMbFdOeUdgh6Snw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn81jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 05:09:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S59CgP024814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 05:09:12 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 21:09:09 -0800
Date: Fri, 28 Feb 2025 10:39:06 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: Enable MMC
Message-ID: <Z8FE8nmYm8uqya6k@hu-varada-blr.qualcomm.com>
References: <20250227094226.2380930-1-quic_varada@quicinc.com>
 <ryfawl6uykry5ds5kovujvepkwffdwitbqltx75wnnrqrbl4b2@i2pjwegs3u4n>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ryfawl6uykry5ds5kovujvepkwffdwitbqltx75wnnrqrbl4b2@i2pjwegs3u4n>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ow1mVos_vONoQRd7XiNIWc4sX8C5gp2H
X-Proofpoint-GUID: Ow1mVos_vONoQRd7XiNIWc4sX8C5gp2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=635
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280034

On Thu, Feb 27, 2025 at 05:03:10PM +0200, Dmitry Baryshkov wrote:
> On Thu, Feb 27, 2025 at 03:12:26PM +0530, Varadarajan Narayanan wrote:
> > Enable MMC and relevant pinctrl entries.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > index b6e4bb3328b3..252687be9dc3 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > @@ -69,6 +69,14 @@ &qusb_phy_1 {
> >  	status = "okay";
> >  };
> >
> > +&sdhc {
> > +	pinctrl-0 = <&sdc_default_state>;
>
> Where is it defined?

Few lines below [1] in the same dts file.

>
> > +	pinctrl-names = "default";
> > +	supports-cqe;
>
> This property should be a part of the SoC dtsi.

Will move it.

Thanks
Varada

1 - https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts#n128
> > +
> > +	status = "okay";
> > +};
> > +
> >  &sleep_clk {
> >  	clock-frequency = <32000>;
> >  };
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

