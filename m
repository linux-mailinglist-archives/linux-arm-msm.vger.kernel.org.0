Return-Path: <linux-arm-msm+bounces-50205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B794A4E3FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 254601889A13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4080227C844;
	Tue,  4 Mar 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B5pYH20n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990D327C876
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101947; cv=pass; b=Ac/H064ndQD8hT7KsKxTnQIC5hQLf2pL2OG5EV4NriiQBAoS+JWzO9Li9itopjQI4oEyguYXPd82kZ5aUSU87GrAIIWjz/dORoqNwGcCwemi2zM346kvk5L4mvgeIdf0k4j39PdVUYc6i5KkJMmTVU4mYmXTExGf2toe+p3d4KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101947; c=relaxed/simple;
	bh=d+vzEwgjupu0/77CHBo1T27lBxQg4sfPtaX0+5uTUTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eWAqkcNT4RytWNLXgJ6fJx1b6zB/W2vF84insPGehb1ZEyfkWJvnGuQ55TxHdWuyFyJNH6X814xiQHsDyclbFkpUaxY90eE//OIKdYUaQ1jrQhGcvnroJ2FErIvCwg5Fa7+f0GvSn3hWORu/YPDkRGl36swpT9GxN29x2rl1aiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B5pYH20n; arc=none smtp.client-ip=205.220.168.131; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id CD76D40CEC8C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:25:43 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B5pYH20n
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fbX4JfTzG04L
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:23:52 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 67FA942728; Tue,  4 Mar 2025 18:23:50 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B5pYH20n
X-Envelope-From: <linux-kernel+bounces-541658-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B5pYH20n
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 6D57E42921
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:00:24 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 4A3223063EFF
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 15:00:24 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29F9188E1A4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA80F20DD6D;
	Mon,  3 Mar 2025 11:59:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376120CCDF;
	Mon,  3 Mar 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741003171; cv=none; b=dJ5zfhOIXwANz7RmtZHfCITQ7kduKMRRkgt1TlMcmzIsdAbOErWlCHwSI8oeapFAF/W4zreGwKi+GnIBYgD5RzR7n6zfc2RnicN4PxvST+3eyQOR0znRkpzzLWTc2kWA0bVbO4uevU8CA4zLT7n1OqbdQIbf++1IBlS3JD+qtMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741003171; c=relaxed/simple;
	bh=d+vzEwgjupu0/77CHBo1T27lBxQg4sfPtaX0+5uTUTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tUpmSppJLyoqV2DCxVd/ADca1LEz/x/Ig/exStgR+XTK0nBYmqP05TlKXjgk+zcP3n2NXuX6CvsY8rkgUTpe1LK6T2Jn5RvxgyhPi7T7cK1XbecLFXVQjNcuIRKgP3hKnChO9KmfxSxLdmq8rVTHLzYtCPTXmOkqObspyhjICtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B5pYH20n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523B6wYi006580;
	Mon, 3 Mar 2025 11:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QF0ASAHpAxj/q8GZgd0wP+R+aHXSmNyo9XU3EaLp8lY=; b=B5pYH20nLkszZuZw
	IyBjpxMzdQfCm+3cubdRMgFt5Jd4aenXcNsCRNzcS7A7fXozNaYX1Uz8XCbxFA3m
	6NLFarvWmKCDcfqF1acR20j4z8OFx23EBpqzlfUnY2OMbmEFmmzoJTxMB8vV04KE
	ZJeuKWs08j6ETvyVBDnmFAomAOQlDhQ7zKcb9K/mM2VJeJZVbUtMc8rb/gblpZZq
	LGefihTdG6rR4yXHuhrUDBFonXJd57aup1nzzAkIXi1zcyzPQVz0f1iEdABDL0hJ
	ZdcUfkap6cOevCh6h+ppL0Y54/Ig1ejrq2buKPejvbfSMtXwWkGlCS2rizPGRh/g
	8fSVSw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t994pq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 11:59:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523BxDET026439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 11:59:13 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 03:59:10 -0800
Message-ID: <7b3b52a7-5a4b-b34f-3450-8e4a60ade22c@quicinc.com>
Date: Mon, 3 Mar 2025 17:29:07 +0530
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: drop video decoder and encoder
 nodes
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250303-b4-media-v1-1-ddc5c81cc2b3@quicinc.com>
 <9cf0f5cf-1287-485c-a75d-1a4333c6e457@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <9cf0f5cf-1287-485c-a75d-1a4333c6e457@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 44Mq91G0J83_GNLhyIsZ60sukPo-NzgH
X-Proofpoint-GUID: 44Mq91G0J83_GNLhyIsZ60sukPo-NzgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=770
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030092
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fbX4JfTzG04L
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741706648.93874@BSGs4xDTCKOuIpvpAa6bcQ
X-ITU-MailScanner-SpamCheck: not spam


On 3/3/2025 5:06 PM, Krzysztof Kozlowski wrote:
> On 03/03/2025 12:01, Vikash Garodia wrote:
>> Decoder and encoder nodes are already deprecated from bindings. Update
> 
> Deprecated since when? commit or release.
commit - 459997e8990d9cdf7fb126057c31ec0ca8ff66ca

https://lore.kernel.org/all/20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-3-a4d5070d3aaa@linaro.org/

>> the venus node to align with bindings.
> 
> Since which release kernel does not rely on these?
I can see in 6.14-rc1

Regards,
Vikash
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 --------
>>  1 file changed, 8 deletions(-)
> 
> Best regards,
> Krzysztof


