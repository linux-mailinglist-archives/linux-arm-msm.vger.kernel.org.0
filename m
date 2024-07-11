Return-Path: <linux-arm-msm+bounces-25932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FB92E36B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65353B22EA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 09:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65311155A52;
	Thu, 11 Jul 2024 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SOApO34m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89271553BC;
	Thu, 11 Jul 2024 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720690113; cv=none; b=Vn9/P8IIKlsZapSuswHnfnVo+Tmu9t9LYw3TZeFKi7/OiNWXWx7IxQ3tbvs2mCzs7hyRCvf7b+EHSBYslYvmONjWcJaRCfTxFj+JC5CRzp/ApoCDLCQnUDL4dJb/oIXAfQQ2TtARrbivLJOGKXwl6Ou+PJu3tycPTK/HhLJrQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720690113; c=relaxed/simple;
	bh=/K+lCMjK2dr/WBBFPRaN3f+6YxEMPa/QeHQ6NWrXnos=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIAHjfI17QE0wZUYgyFOjHmEakENZv7dhJKkU96Zmh8vOCuf7D8dsIG8CViHecAqnZvqTbOwcnj4xSVkZG+BtOVULjcUt4bvkQgtOqv81GqIRqdgx+P39GTr40WEAjTgHJWtW/lMhG2BjVdOfwlPz5N7iHJkm6FXeaCJ/biKMj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SOApO34m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4n1p9011771;
	Thu, 11 Jul 2024 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/K+lCMjK2dr/WBBFPRaN3f+6
	YxEMPa/QeHQ6NWrXnos=; b=SOApO34mjAy1QoftfeKHwWjVpiFYcTo4qc21QgQJ
	YcQfAwy5HQDGUiOi+ji5/v9DkcV7M3g4AwChYXD9PSPDR1CuzO+6BFjdL6h2CbGX
	UwGFNNLKzb9HDrRq6iS+ctBGn3fi+4tEFaX6/wflKmS0HdHgUbvkM3+Dv0uwcstm
	xv9hiX5kHg8Is1KLskTu4TfehOH5TfXl4ZdLXrJEmaGvBzrgtKPiAUVI1oTIPhlQ
	zhZfs/yONudapvQWaqxZK0MGw8+MHLkDFd33QQbpM7/9pFcpBXc+lFAbPcfo4uBT
	rFqUSDh6ItDCph4BbN5ELsDw0eNIK4zXV0VIVe/0zXeWig==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwuvrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 09:28:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B9SQ94005396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 09:28:26 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Jul 2024 02:28:21 -0700
Date: Thu, 11 Jul 2024 14:58:17 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <johan+linaro@kernel.org>, <quic_kriskura@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v0 1/2] dt-bindings: usb: qcom,dwc3: Add minItems for
 interrupt info
Message-ID: <Zo+lsSwFG3+KwKUu@hu-varada-blr.qualcomm.com>
References: <20240711065615.2720367-1-quic_varada@quicinc.com>
 <5fb21a62-9c9e-45ed-bf3f-c4d54f243886@kernel.org>
 <Zo+cDxiog/IXdt9S@hu-varada-blr.qualcomm.com>
 <5142d8af-2b05-4018-a9c5-0a8b99719b0d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5142d8af-2b05-4018-a9c5-0a8b99719b0d@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PQNQcTZkXsnwtvHbHnecuI6zXOoVaAM7
X-Proofpoint-ORIG-GUID: PQNQcTZkXsnwtvHbHnecuI6zXOoVaAM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_06,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=427 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110066

On Thu, Jul 11, 2024 at 11:03:56AM +0200, Krzysztof Kozlowski wrote:
> On 11/07/2024 10:47, Varadarajan Narayanan wrote:
> >>
> >> but x1e80100 has 4, right?
> >
> > Yes. Will have a separate block for ipq5332. Went with min/max based
> > on one of the previous blocks that had min/max as two and three for
> > a group of SoCs.
> >
>
> Did you even test it before sending?

Yes, ran dt_binding_check. After confirming that ipq5332 related
errors got resolved and no new errors for x1e80100 sent the
patch. Missed the yaml file related error generated by Rob's bot.

Will address these and send a new patch.

Thanks
Varada

