Return-Path: <linux-arm-msm+bounces-29141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26534958DEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 20:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6381281858
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 18:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6441C37BB;
	Tue, 20 Aug 2024 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GQ96bBzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11F1990B5;
	Tue, 20 Aug 2024 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724178138; cv=none; b=CuuJqRRWGczhuXhAByMOV5q/djCJ/tzSTVWk9fIHXqKaqDPg//oyzAYVFZJVE/GBdxCPIBXVIbNEjbZXg9E4iIpmznU1ywkLYbciyOrDg0PwQUFTusp67el8zpPPOv7LR004Kv6TCyRDeNb8y4sTl6ybZyCau8E0e7tE3BvsFpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724178138; c=relaxed/simple;
	bh=p0rD8iQDZhChw0dyt1xfRMik7zyAtae3RppvcGhOMoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z7NuaKtHohqIyJte7gHu9sVXm0ocUpmfesmJauVDzERW94zpY6HSI5RoKABPeQBZFEBYqU8uh0Jx7eAxJFeiATqLj40fBGFNVfSc4M8f+6DciAQHm8Apch3Sm0Xz7hqq9qXxDot7LyG1XDiW7t3hzi6WNrysAD5N+9KBwI6lta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GQ96bBzN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47KI0p6h005013;
	Tue, 20 Aug 2024 18:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pM9WQJcIaevMMvJKizzzZGpgPI1sM27/xlhKsRxe+kI=; b=GQ96bBzNR0zSsloM
	9BiM5CjKYqmEA8rF5B1u4L0bwpQTqbctkp8WGxwh+9RwlLsS1yfLLdHp/PGj54UT
	gRqXCEFTxtXg3QxPJNPkJHokhnzVAiRFlHkMyFydBetoegN30AvDhqj1NUZH9iCD
	ajcAM33RbDLYtuQjuoebEL2zJNRjK3VT8Wnf7ECwlbO9z4Dq9YlExyAcLgG74HbV
	2+/kdznvBe5YndobClBm0lbqV9VKQrxKsLjyG9A2loY6sfpAy+34nruF6yei/UKE
	auFv4GL6c1m/NHcwF7a/+Smh6dLAL5qDjzInWpmlKli99xPpUDtHttBnh0thxXtX
	tNpWcQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412hjdgsky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:21:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KIL5Cn013030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 18:21:05 GMT
Received: from [10.71.111.18] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 11:21:05 -0700
Message-ID: <81ec34a6-8627-4a59-8fc7-87eee4625b2d@quicinc.com>
Date: Tue, 20 Aug 2024 11:21:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Trilok Soni <quic_tsoni@quicinc.com>,
        Konrad Dybcio
	<konradybcio@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk@kernel.org>,
        Souradeep Chowdhury
	<quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "Satya Durga Srinivasu Prabhala"
	<quic_satyap@quicinc.com>,
        Elson Serrao <quic_eserrao@quicinc.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
 <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
 <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
 <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
 <8bb412f8-4fe1-40ca-8414-bb77c66899ae@quicinc.com>
 <0eca6755-a2ec-404f-b98c-ee6c9f6fb55f@gmail.com>
 <f8caa9aa-7fc4-4d42-9011-21ca40eb106d@quicinc.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <f8caa9aa-7fc4-4d42-9011-21ca40eb106d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J7FDUnbjyhTQ3gsd0FrCRLVXLp_2FX3s
X-Proofpoint-ORIG-GUID: J7FDUnbjyhTQ3gsd0FrCRLVXLp_2FX3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_14,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=563 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200137



On 8/14/2024 3:09 PM, Trilok Soni wrote:
> On 8/14/2024 1:25 PM, Konrad Dybcio wrote:
>>> Unfortunately, no. We considered several options, but none guarantee that we will avoid
>>> a crash if we try non-securely. The secure call also won't give a specific error if it fails either
>>> (for security reasons) so we can't know if a secure access failed because it's supposed to be
>>> accessed non-securely or for another reason; hence this approach. If there's
>>> another way to achieve this functionality that might be better, I'm all ears.
>> Can we read some fuse values and decide based on that?
> In most of the cases, these fuse values are not allowed to be read
> from the Linux, so that will be another problem. Melody can check
> if there is any fuse values around here and possible to read them
> through Linux.
>

I double-checked, but there really isn't any kind of fuse or anything we 
can read to determine
how we need to access these registers. I remembered checking before 
authoring these patches,
but I wanted to just make sure before responding here.

Thanks,
Melody

