Return-Path: <linux-arm-msm+bounces-29016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2095769D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636F92841BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875BB15A4B0;
	Mon, 19 Aug 2024 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PIodz5Bm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A33BBF6;
	Mon, 19 Aug 2024 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103338; cv=none; b=apGLqPf8EObBSMKZiiZWkZ1q2w5ecHvugL/BwaG3lW9OW40jtqYTi+t6R9qFx0xGu4pmkDzvnbXudrzirbThFJP5S6HM63vMNtiIhArIheGz87LmPe/5OpFkkq5itROutvFlkEfVP9wyqwmyXzxBl4nlpx5RFAmqe7/gUwYb9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103338; c=relaxed/simple;
	bh=kr7OhUlWkGiswT1cACXS3V41X4+0wObrzLXgq0QZFXg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjG/62QzCaS3bE++cqGofRqR4Fyud/trFnsmXaaXnyxE8fPy1qLwMwSzXQYNACBEWAV/PDHJapZF4bfg7ZHBJKNLerK9JnpAteYbhrYkIL4lMWvHfdsfQuvHrU6eCCg+XJpakVH88hMXaRJp0SfdMuxpRho1vw+zNlIjXnJdKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PIodz5Bm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JBD8Rg025604;
	Mon, 19 Aug 2024 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2nqAfRz1/3iyZnGB0ZUXWcC
	CyXyUxEc/gWJKJNWumA=; b=PIodz5BmbgHUvmHJw96PlkN0RhQl7iOH5eEBz7u3
	v+2SKQ5fADnkcqsv9rygMNDCYUUL7qLN1WjcvMxeg/E33cq+efaomChx5sVkQkku
	0eM+qxSCqBDxyYXWPf1QrQ8FmtPi1HPEDjN1RbLgImbSZK2gyIlPdjIA5jHqWPJa
	S0aS84/nprCQKbmQpNhY1g5bt8FXeAAlEynBGhFY9Awwdg50JBboSN/ySsIc8Rc8
	FZ72tgZRa12uqdMEz0WHUU1kUD1hv6o5zP4R7P7q1ZehefMzmn+fA5adLeNUC+0U
	PyRWb6ArwUcgLwSGh1ahQ0EAVeyhQxtoaOpzjTnww8cNeg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412mmeneas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:35:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JLZM6L014487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 21:35:22 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 14:35:22 -0700
Date: Mon, 19 Aug 2024 14:35:21 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Frank Li <Frank.li@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Felipe
 Balbi" <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "Saravana
 Kannan" <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
Message-ID: <ZsO6mTNFWUOLQwEt@hu-bjorande-lv.qualcomm.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
 <Zruix+aadUL2F2jY@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zruix+aadUL2F2jY@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s1xcBr6Z0QzKtcvdrBee_AwZzq43tVgq
X-Proofpoint-ORIG-GUID: s1xcBr6Z0QzKtcvdrBee_AwZzq43tVgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxlogscore=964 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190144

On Tue, Aug 13, 2024 at 02:15:35PM -0400, Frank Li wrote:
> On Sun, Aug 11, 2024 at 08:12:01PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
[..]
> >  static const struct dev_pm_ops dwc3_dev_pm_ops = {
> > -	SET_SYSTEM_SLEEP_PM_OPS(dwc3_suspend, dwc3_resume)
> > -	.complete = dwc3_complete,
> > -	SET_RUNTIME_PM_OPS(dwc3_runtime_suspend, dwc3_runtime_resume,
> > -			dwc3_runtime_idle)
> > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_plat_suspend, dwc3_plat_resume)
> 
> since you touch this line,
> suggest use new SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() help macro.
> also CONFIG_PM_SLEEP can be removed.
> 

I'd be happy to follow up with such cleanups after we've concluded this,
I did spot a few other things that would benefit from some TLC.

Regards,
Bjorn

