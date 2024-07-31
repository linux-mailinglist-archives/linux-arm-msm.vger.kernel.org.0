Return-Path: <linux-arm-msm+bounces-27581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 393439436C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 21:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8152B21142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 19:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B417414831F;
	Wed, 31 Jul 2024 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ViktmJ9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224E0446DC;
	Wed, 31 Jul 2024 19:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455941; cv=none; b=q00Z1GPG3eMIM2Jlst4ryHBneAyl/+kY08OBLdIrHP2Bo7/j2Ju/BaCHT6CcamV/j2iNS9OIWR/t1hdu1hlf9Oma1k8otPAhU8aVHh9xLWQ7kUGe7c2YPoeFbtCIeuobvFEp5pAAazzTVhMMGMu3tXmW9ZD241J2qJOjuJl241c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455941; c=relaxed/simple;
	bh=KyQI+sweQMt5785Uw0yRrolEVdjCSVNq4NEAr1ITaFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jlrk5Ohu8gd2po0ymK379QivJXqCNefSMIZREuEAPE0Kb/S2d4iSj+Jp7ILwQ7wDcSCTRjNkSZrWUGbhSEzIDMGgpKvs66Tsj5xmIMBoQvhW60/7dmDtgiI6T43HHrsyBAFReL20PcTrg0F5yjNY52KBYh0ZmfHFqEfA2VMzyr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ViktmJ9O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VAZahg028742;
	Wed, 31 Jul 2024 19:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NDo4XKsdJgp0/vprHSd5f7d52rSBjEnKwcp9vYBjX0=; b=ViktmJ9OXaAQLmtz
	rW8UqfRFcm9UoiAOCwaKg04bC1Z50aWfPC3AgZdv+GxCFoAwEsenbmdumCZHuk2I
	oYxWRtPloaSDwyEhpfKk2j0qu3RhyxpO3Z1M63lVGkhn9J0pn5p53wk+ssQR8sU+
	xCXROrP04rYsmNIDsZCVCrxDuH+htkVTmdkv/0m5/VNn1uAiFKfhd7pe74zt/Tu5
	2B8cHVjt/hZBCuNtPabk7hOn+ck19wQGNlF1I23oR7MtSvr0dxy+GgfbhKEbDOUo
	2PfxPqI5Ai4BeqTJLk4sIO7X+LX5jrhDQ5Db0i2Hd4d1pRnmmZ5TYuPBa/MS7pyc
	heClKQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40q232vprd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:58:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VJwsxD002431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:58:54 GMT
Received: from [10.110.68.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 12:58:53 -0700
Message-ID: <2a17eaca-54af-d1fa-304d-c7e0afd85b33@quicinc.com>
Date: Wed, 31 Jul 2024 12:58:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/8] Enable EUD on Qualcomm sm8450 SoC
Content-Language: en-US
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Elson Roy Serrao
	<quic_eserrao@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <023d4ea8-635d-435f-bae2-87284f70123b@linaro.org>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <023d4ea8-635d-435f-bae2-87284f70123b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2rhD_10awpfiG3nfYMiTmoKOY28lUfIJ
X-Proofpoint-ORIG-GUID: 2rhD_10awpfiG3nfYMiTmoKOY28lUfIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=432 clxscore=1011 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310140

On 7/31/2024 4:13 AM, Caleb Connolly wrote:
>>     
>> 2.) Proper routing of USB role switch notifications: EUD hub is physically
>>      present in between the USB connector and the USB controller. So the
>>      usb role switch notifications originating from the connector should
>>      route through EUD. EUD also relies on role switch notifications to
>>      communicate with the USB, regarding EUD attach/detach events.
>>
>> This series aims at implementing the above aspects to enable EUD on
>> Qualcomm sm8450 SoC.
> 
> Are there any plans to make this feature available for folks outside of Qualcomm / an NDA?
> 
> There is an openOCD fork on CodeLinaro but it still requires some proprietary library which is only available to folks with a quicinc email as I understand it.
> 

Which codelinaro link are you referring here? 


-- 
---Trilok Soni


