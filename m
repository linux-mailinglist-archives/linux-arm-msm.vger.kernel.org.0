Return-Path: <linux-arm-msm+bounces-37193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D09BFD9E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 06:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDD30B2198B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 05:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E9119048F;
	Thu,  7 Nov 2024 05:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W1zVA0mW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724EE56C;
	Thu,  7 Nov 2024 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957003; cv=none; b=Ue11mdfAQ/B++BwnwHOJXieB3ImxUfJZstWh/vDCp599sekX/MHmeEENTxNDFysFdH2rEXT7SpSYIngMjRxD0/xOZUX+OSYnlMhN8SkcFDHlpem31r3bSk+rMGIoU76QkzaVoNOjaAhfJBZoDNJ12p9Prg6dkfBQgqgf0pKooDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957003; c=relaxed/simple;
	bh=4RrHTojRs96v4rakqDiU+Dt3TqgLeOLrnzVs/JuzDQ4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsSH6oIwBUzGjjPcQLjSYy9Xg0FOfEBodt9qmbDtsbtOxjUQE12Z9gj9m55G48L472Aa34lWQWB3+MXF7k7l02JjUR8M0kFc4Kj+n8sf8zNcC/anCrfziOx0PYd5wYAvswx8Nh+mkRR3tLNmFQp4xvTVhniDpUof4yxzAPZanSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W1zVA0mW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A71uOLd002699;
	Thu, 7 Nov 2024 05:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g/BSYm/Kr/63wMA/e31H7PVS
	+HLYrJz5jFt8xLfuhbg=; b=W1zVA0mWL0IRTyiVn+gjT0BM3tgI+R+A+Pva92NL
	28aWlZktKzoh/13gp0MsV/4I2LlYHBxxAH6xUz9Vk+FZhv5v0Hyz6EZOcYQOM2cS
	MezF7ol0IT2tm+lsKlC980g9SpOmXBqU5QO5F/FaZA7x1FxlZMAnq/jUmbDB7dnM
	MfMvp7kyeMvav8HYIBRfMG488VXItebnqpmBduOAPiB3mZO3onD4sKn/27lwGVbQ
	hGiIgWU+8Jyu4sPZ8XHfApJVXvGX34G91S7grSbrHiOS20Vnyxj62s1Jd0mumuyJ
	+lILVKnHf2Ud/LTeWtZ7AHHK66jCFyfH0zaxijhP1M3jOg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvhd44pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 05:23:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A75NIvh005081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 05:23:18 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 21:23:14 -0800
Date: Thu, 7 Nov 2024 10:53:11 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 2/2] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <e466a2bd-c1a0-4a55-9d20-eb9e58427554@quicinc.com>
References: <cover.1730735881.git.quic_uchalich@quicinc.com>
 <3fe8739458227081d43f00746fe527bc4f8fd8b5.1730735881.git.quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3fe8739458227081d43f00746fe527bc4f8fd8b5.1730735881.git.quic_uchalich@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fWiH6oS86d-Zf45TaQw92TbB53oAV_Se
X-Proofpoint-GUID: fWiH6oS86d-Zf45TaQw92TbB53oAV_Se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=928
 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411070039

On Mon, Nov 04, 2024 at 08:20:56AM -0800, Unnathi Chalicheemala wrote:
>  
> +static int qcom_scm_query_waitq_count(void)
> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +
> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO))
> +		return 1;
> +
> +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	return res.result[0] & GENMASK(7, 0);
> +}

I see that this SCM call is same as what we called to get the IRQ, not
possible to populate all the waitq info at once and process/cache them
accordingly?

Thanks,
Pavan

