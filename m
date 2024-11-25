Return-Path: <linux-arm-msm+bounces-39046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC69D7B6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 07:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B876DB2150F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 06:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AC97868B;
	Mon, 25 Nov 2024 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RNWBb/gi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928A2500AC;
	Mon, 25 Nov 2024 06:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732514738; cv=none; b=S0iDLGHW9xmiTh8MY/a9JFSG8Q9DCelVsz+88YtzDZM9xMZObf4hfpPSC3aOkw3mVINt2qoOCmrbJxuucNbgoErsxmJUsJuHmr9QvBuLvVWAFhmSB9+4mbIgwLCkhmRIE6soG6yNpokqUgYE7CmpGSCWn+t2RSbrSvPSz4LaUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732514738; c=relaxed/simple;
	bh=an8rWgreDm74MFOtPYXXmdZtuxQirXtzQLDHzx7rjA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IfPd06HlQ8ZWpyV/hSn5ldsFJvXkHrQwwjJYe+E3JfRgMsjODXteLBmTBLSYduTnZo+zYK3CdWjD724GdkJU1E6a2oSNyW4q5K3U7QUPoKuRmSOp9H+7INbaq19pSLR2SEjn6+qX1ZxVzTPwm9k04rCetXjQXh1DeYg+apsW0jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RNWBb/gi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0K1bn027857;
	Mon, 25 Nov 2024 06:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lnh/3KAUnuT2JLXbUybTyaOGYoch3HRaIrGB4ANrgSE=; b=RNWBb/gikWhN9mSV
	lsdWKiPC1j3km7+m4Y1Z43eXT5mrd+stk4o+brv+QgK9qwoBwqXmrFPTP1Wjo4mA
	TG5kix/BsVg+U2FqU30Jd0NuPkL9PzcqfhWgsnO4QpgGiVa7UmYvJdwewuT87oq1
	nUOMDE0o9IF5syJFpuBMAVN0QZc832a4er/UTj0EJWp7B3EqvSPP1v2a9XT8TZ4S
	A5QSTmiliwJRRQhYtvbPYlTxKLQbpIWglcdJwdoCtWy0R6kkwZEj2FkgCQprzHVv
	nVRPp18kqGket4s7J2QUzxsWIHqSCe09CVxy2tmX6lkLGtZKJDe1i5h+gQCKz4hU
	ElQUNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433792bgpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:00:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP60RaQ020971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 06:00:28 GMT
Received: from [10.217.238.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 22:00:23 -0800
Message-ID: <214a7342-cf0e-4ef0-a555-d09bb3ea6301@quicinc.com>
Date: Mon, 25 Nov 2024 11:30:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: qcs8300: enable the inline
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241122132044.30024-1-quic_yrangana@quicinc.com>
 <20241122132044.30024-3-quic_yrangana@quicinc.com>
 <bb2da224-2c0a-41de-b458-0c5314ecd90b@kernel.org>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <bb2da224-2c0a-41de-b458-0c5314ecd90b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H0Eo19SySGUSQeH9okahagMboPhGsGew
X-Proofpoint-GUID: H0Eo19SySGUSQeH9okahagMboPhGsGew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=724 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250049

Hi Krzysztof,

Same mistake is done for this patch series as well.

I sincerely apologize for the inconvenience. I will remove the tag
in the next patch series.

Thanks,
Yuvaraj.


On 11/22/2024 8:25 PM, Krzysztof Kozlowski wrote:
> On 22/11/2024 14:20, Yuvaraj Ranganathan wrote:
>> Add an ICE node to qcs8300 SoC description and enable it by adding a
>> phandle to the UFS node.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This did not happen. Provide a proof (lore link).
> 
> Best regards,
> Krzysztof


