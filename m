Return-Path: <linux-arm-msm+bounces-46938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB8A28996
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 12:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A8EE1679CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C87B22CBF0;
	Wed,  5 Feb 2025 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bKKdUXbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F382422CBF4;
	Wed,  5 Feb 2025 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755699; cv=none; b=PLmGw+CTcpZ5Es3ZHDp0sv1GhvJ09bXgyOCSILqkiz8vUB2uJ0vq28Qj8okZLTIjlrKxwKu2O5aa7nxi4ytfGkUgfuG5u1mupzpdsWunt3xM/5KoPnCQRGB1kODnxrkOYpjkRBYcnd+IvmgfxebHmgwZcy6W0QA3yxHFYLzYzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755699; c=relaxed/simple;
	bh=Ghnz9Lrv2cS6vsNZoTNWbx17eDzcBL/Iujr112P/8Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TI70HnpLeWxlEBjo6rANkVOfDmPtZPr8IrN7BPPtBm9B+UYzySX7ldnH6/22wUIF4dLRxhjMw+sB9k1Likt4MXRAjRbTFvwp+OIRkJwpy+pRPoLQbrey8dpJfW2+X04w30t4BICGyUtXc5xokatUA5h12BwAGO2pYH++0GUP12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bKKdUXbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515670bq028606;
	Wed, 5 Feb 2025 11:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJW2wTzYmsHqx4B86jwIraVpK/tuRPJ5kg7vAlsnOoU=; b=bKKdUXbETXEKCqgK
	lTl/LBDNTpKICKfP/ZYuHIK/godyWTdYrbCaufm23UwgZDsEsMhv7ffZg+7UDc0O
	6AZPTpuMgF2MrkL3ikOQzPNj7N+s7ByBwIBF3Su/N14LLrd7PqkvQqUybx1x5KLh
	oEnwlmki4Rr86vD1L0S1JJozNv6YbxNrdjykVD3yJUhniiHFRiU1iQ4epc8Z2qHZ
	cvB0kF6gP6BPHLVgLZOUpgGPNsd8jD8AxQHeLxj4oTSqJeVewMeyGkh/JpdvL1FT
	F+NJXHdaS+9R4GH91RU09tGubuMJlZAsOxF5cFeNt7aECIchLNYTiyYRIAVFrql8
	rfhA1g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m2ea0r1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 11:41:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 515BfOUN007965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 11:41:25 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 03:41:18 -0800
Message-ID: <fdc8f80c-ea7c-4bb3-a0f5-06353f2d32f5@quicinc.com>
Date: Wed, 5 Feb 2025 17:11:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: qcom-qmp-ufs: Add PHY Configuration support for
 SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross
	<agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Manish Pandey
	<quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-2-b3774120eb8c@quicinc.com>
 <vry7yib4jtvyc5baruetqb2msy4j4ityv2s6z5smrz6rqjfb5l@xoharscfhz5n>
 <6873e397-dbc0-4c30-8c08-a65ee7cd6e01@quicinc.com>
 <CAA8EJprjxMtkefY+90cLGVgz-bDf=VXnaa0eH4ESAC6nf5vrLA@mail.gmail.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <CAA8EJprjxMtkefY+90cLGVgz-bDf=VXnaa0eH4ESAC6nf5vrLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E6W9CvTyEzzFTvMhI20owqA81mW0pP4z
X-Proofpoint-GUID: E6W9CvTyEzzFTvMhI20owqA81mW0pP4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_05,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050094



On 2/4/2025 7:06 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> On Mon, 3 Feb 2025 at 10:03, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
> 
> Your email client has corrupted all quotation levels. Please fix its
> configuration so that you can not compose HTML email. Or switch to a
> normal text-based email client like Mutt or Gnus.
> 
> No additional comments can be provided to this email.
> 
>>

Hi Dmitry,

Sorry for the inconvenience. After software update seems there was some
issue with email client configuration . I have updated the configuration 
and resent my reply.

Regards,
Nitin

>>
>> On 1/14/2025 4:19 PM, Dmitry Baryshkov wrote:
>>
>> On Mon, Jan 13, 2025 at 01:46:25PM -0800, Melody Olvera wrote:
>>
>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>
>> Add SM8750 specific register layout and table configs. The serdes
>> TX RX register offset has changed for SM8750 and hence keep UFS
>> specific serdes offsets in a dedicated header file.
> 


