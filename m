Return-Path: <linux-arm-msm+bounces-25385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CA928AD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 16:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF431F2320C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA96215FA60;
	Fri,  5 Jul 2024 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZMzvj/8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390B1465B3;
	Fri,  5 Jul 2024 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190331; cv=none; b=ZsbdvTulRxij9RR69y+DV3V93JOlzmlWmtpkh6KGYQhxrz9w08EdE68R50X5kSzwUXc8rIubK6eE2PSSwMWWGcRyOTbvDckkNWwT63FXLhH2ffS8yV5U2fhn/GCDnWKUUo5lyvjRP5TpHeJWvBzVALC8MM1Q4ZbieEuuJp+8OeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190331; c=relaxed/simple;
	bh=0U+Cr57H7R9yE1WxH57PTkyECEkrjNWTGnR9bYEGic8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBnatZ3HyOeni8A0tyNCBzBc9xG2ByMZIhbliPKOsmogmLkj1sYDAhguajrbgoXPLd1R5EZvguujj4MS2MlGCVl9m7dEX7QFZ4VDjJtMqYELWWi05+4nljHHbUHDb/H413pezNaErCt8IJvAwinZr2aFJgxIP8UGIfbL3dgVQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZMzvj/8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 465AAu3J030130;
	Fri, 5 Jul 2024 14:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mIgkHmUncf13NHzD1kwXIdYj
	zlDjDA152xV2lbSvfMs=; b=ZMzvj/8sDyoJrFDTTyEDQcS6evQ3uMFmQej1Co6+
	Wx0V5t9eF+9tecJRtGmUmn6hQgIvRZBII6fUsnNtLxtFuhOW0qynos9/hFCRGFga
	yMhU5e+hUbpx/gMwV2FwdICuYzK7yaAsg4cCKd+B8PhwcgRY1qwYbmT+LfM8CYgZ
	aZB3keLwdH1ZPZC4zFwdCg4ty8TFLuyAq0BAZm2YB85Lk2ijIZwCyyDBY8422ZSK
	ieIwRkj4sqt10I+zlpjzYtCrk5ui/Z/2o+Zo7MbR302g0XjdZwfpr9/wrODPXJVs
	0GFr6u4jN3gSzXR2Ag+TDPPKbwMIhYNsuJnUshnjWk7RmA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402abtxe2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 14:38:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 465EciSi025766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 14:38:44 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 07:38:41 -0700
Date: Fri, 5 Jul 2024 20:07:54 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Enable download mode register
 write
Message-ID: <ZogFQkOiYNei/bId@hu-mojha-hyd.qualcomm.com>
References: <20240705115814.1422995-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240705115814.1422995-1-quic_mojha@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gqhSeggmGsOT-bKW6YzX-r1FXvkgG-FY
X-Proofpoint-ORIG-GUID: gqhSeggmGsOT-bKW6YzX-r1FXvkgG-FY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_10,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=681 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050105

On Fri, Jul 05, 2024 at 05:28:14PM +0530, Mukesh Ojha wrote:
> Enable download mode setting for sc7280 which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index fc9ec367e3a5..e17c4c2401ac 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -710,6 +710,7 @@
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-sc7280", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x13000>;

Ignore this patch, sent v2 here with right phandle name of tcsr.

https://lore.kernel.org/lkml/20240705143443.1491956-1-quic_mojha@quicinc.com/

-Mukesh

>  		};
>  	};
>  
> -- 
> 2.7.4
> 

