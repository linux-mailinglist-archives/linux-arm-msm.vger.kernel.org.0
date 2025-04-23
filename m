Return-Path: <linux-arm-msm+bounces-55245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE08A99C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 01:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E78C1B80CB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C78F22F77E;
	Wed, 23 Apr 2025 23:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aeILG+mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B92701BF;
	Wed, 23 Apr 2025 23:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745452466; cv=none; b=a6Aw39OCbnhYrJk9vL1GKAisV2KfPwBjIlyyF70nXwR5C80Bho1XsSmrW/1q1IgfzU4VEib3pSXixfBc+N2EUsUCax5hKldW2kkEUJ2y2fNZPjCgwEVFSCFCtrHUHQzXBalN6zB1eq6XTRnH35Ns6LweK54HE14mjkhO+aT00tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745452466; c=relaxed/simple;
	bh=1ioOcm70PiCXiPbPEaQ6Z/0vOtjI2PruMHzYshxYu8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C+fuPZYn3G8SoLj+jWS63Ap87My/JjVE159H/3JHyU+t+ZICgBt0wcNUIasmTeLQLT0dyPcBdMeuMgNfltOjAyi8Hn58qrf05u31Wse1pIj8NziRo134c65XuUY9oNc8wm0l+6MmjtoNb9lSbpWPjVxeYW7E6fImp63zOE21iWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aeILG+mn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NN2tDo022024;
	Wed, 23 Apr 2025 23:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75FWWGrqH032yZ3lQDiHkWlzBpL+APIEVWgEAytftd0=; b=aeILG+mnAC90bZbB
	LyHJvBo7WmMndLPTXkEFMa8I45KYDbxZKqOqCgzZ03/Y4TuDIQlvzPvCIHLBc09U
	mMwxvu4cVyOy+GF/CvyXHUJzTAc6Wza7H7PkiuDAoBsLFZclGgyG32DgoxaATtE6
	8DVLXGnePcYD7t7bnUDlxuhtH4pGPXsWibVu5adD8ds/UtrZnaXEXtjUI1myXegC
	3COYCBMNszcY3LxJopWM2iYlU/OJAuP2gkM4Dr0eFgbisTzDZcjltZ9IERKFFb9V
	9hylXJxdtBwEkGb/wdoZyKTsSlzP3aPsgNEUO5Njk1tx8DpaA3U+OTMkqW5vzau3
	IPbiKg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13n28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 23:54:19 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NNsIwf013392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 23:54:18 GMT
Received: from [10.47.235.76] (10.49.16.6) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 16:54:17 -0700
Message-ID: <21a13826-0ee3-486a-956c-153f42477160@quicinc.com>
Date: Wed, 23 Apr 2025 16:54:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: arm: qcom: add SA8255p Ride board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_ptalari@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250423003845.3980330-1-quic_djaggi@quicinc.com>
 <1d75a955-409a-409e-8708-754e89d6f046@linaro.org>
Content-Language: en-US
From: Deepti Jaggi <quic_djaggi@quicinc.com>
In-Reply-To: <1d75a955-409a-409e-8708-754e89d6f046@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HEiDO0IG2azu544wYR1CiYJZuWTVgnkD
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68097dab cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=hYcRLG0h8KmFg2GfuLkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HEiDO0IG2azu544wYR1CiYJZuWTVgnkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1OSBTYWx0ZWRfX3PXSXwMWP0Gj xWDLvbQVcWQ7rK4ZU5ENYLL3dVmkYuypqGe8m7wh9CihPbl1fP43CxfT0Og0q6yY15aZPN1Nd+x 7zkQT1IJELvstk4iKGlpuW6pkqaIeNagBVm4IUgnb78Uo2Ej5XKtgEmZStzwx1ifikpdIzhJFMw
 Inq+ndiZsB20o8tk8ResfyBG+IWnn1TKtX8Rkd30+Zjq86DqmoF91gbJk1DdwRmpFw9AFrlrEFi AKEhKVDcuWWkBbjcml9hAofYduUIijtnYpI/3Ut70opHoh/JyPi+4rewOQNyDElimmXlwNfSUBZ VPl93JkNGw8gFGOWvpT5N7Cjlvk5D8bRgScuwZ1f40EGAY4FXgPQyy5ay0eyl0yVHjAdq9rVdfk
 PMQaFlY4CiX79HeNkK5iyv8S5PW0PUgrHKiA6RxOWqVQeyaWwjbSyKs6MFo8rBlgcwRcTZG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=851 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230159


On 4/23/25 05:00, Krzysztof Kozlowski wrote:
> On 23/04/2025 02:38, Deepti Jaggi wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Document the SA8255p SoC and its reference board: sa8255p-ride.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
>> ---
>> Changes in v3:
>> 	Removed the patches from original series[1]
> 
> Why? This makes no sense on its own. Binding goes with the user. No
> user? No binding.

Thanks for taking the time to review the patch.
All the bindings that were initially included in the original series [1]
were removed and posted as individual patches.
devicetree has been posted as a separate patch :
Link: https://lore.kernel.org/all/20250422231249.871995-1-quic_djaggi@quicinc.com
If necessary, I can consolidate the bindings and dt into a single series
for the next version.

> 
> Best regards,
> Krzysztof

--
Regards,
Deepti

