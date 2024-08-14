Return-Path: <linux-arm-msm+bounces-28562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893C952541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 00:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243CC283603
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C3E1494B9;
	Wed, 14 Aug 2024 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IUj0pH/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8660B96;
	Wed, 14 Aug 2024 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723673364; cv=none; b=SS19g5dQRsiJ4SMT3tk8xDlaTkphcCNthpsG0YCQ+jogUhRViilC2sUO9ymCA6NZ8EvT8lvB/ERvTZWpkPs/Kn+2ye/LKTVgIK0UIemwne6TDjSn5b+ATM2J46hWj/vFbDP1RI7ec0KCpt5Ni4tCnbdAK/Oj9w1NZQ2fxhGiJH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723673364; c=relaxed/simple;
	bh=joRzg/EV/Eg+5FrgAQqj8T32FaTk/sCtinF8S64xJvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RwE/B3VbHl9o6gcuhWnjLi50wax2Pmf8RX/LQbvpJzHFsCPxVWmuYNPZm+g7r0yuOWyqGask+hh0JYdTscR+jAmZhEp2WN0M5H2yt4RZSH1BicppJiKVX3E/uJkxqOSM/qA7UEKSKTivXwfKszmh9K6e7eMHoXBXZvztLqKOaYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IUj0pH/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EArDDv027591;
	Wed, 14 Aug 2024 22:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SgI2w+z1vEHF10CPobuLWVlnnNE3pSKGSiAjVHETLk=; b=IUj0pH/h+3vuFvGi
	R2tgpoJdNPib2OgXLaHM4XbcrEtdvlZtauBrb8T+m/fsPDBR3IY+bK9uB11y6QDr
	lzjeslDzIgw1dRLfHDmJC+qC3n4/W1DSuUrQYra42kl1wJh8kBbf07rFW/tdbHEQ
	/UhFRVbZVgdgYfJmA04jAML1g1Dl2eCXltyVNEikkWE/qsch5Snh6BYIN7vJQE+W
	DOWUGZnsz0V+npPpMVENAYB2vj0y7USaXW/lLnCY7clnBB42Sk9hEnJLRL0NBXAo
	i+eZwuM/iOmIy8wBJu+VE0YfcQVx9J08RZhtwGYcm7mtjfSm1TsHJql/aVa3Pvhn
	Q1HCWA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3etcjct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 22:09:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EM9Gaf012864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 22:09:16 GMT
Received: from [10.110.78.201] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 15:09:15 -0700
Message-ID: <f8caa9aa-7fc4-4d42-9011-21ca40eb106d@quicinc.com>
Date: Wed, 14 Aug 2024 15:09:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Konrad Dybcio <konradybcio@gmail.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
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
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <0eca6755-a2ec-404f-b98c-ee6c9f6fb55f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bDH0nTmkWRQEmd3FpdSPVJBC5KZPgFc9
X-Proofpoint-ORIG-GUID: bDH0nTmkWRQEmd3FpdSPVJBC5KZPgFc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_18,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=386
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408140153

On 8/14/2024 1:25 PM, Konrad Dybcio wrote:
>> Unfortunately, no. We considered several options, but none guarantee that we will avoid
>> a crash if we try non-securely. The secure call also won't give a specific error if it fails either
>> (for security reasons) so we can't know if a secure access failed because it's supposed to be
>> accessed non-securely or for another reason; hence this approach. If there's
>> another way to achieve this functionality that might be better, I'm all ears.
> Can we read some fuse values and decide based on that?

In most of the cases, these fuse values are not allowed to be read
from the Linux, so that will be another problem. Melody can check
if there is any fuse values around here and possible to read them
through Linux. 

-- 
---Trilok Soni


