Return-Path: <linux-arm-msm+bounces-80733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C2C3F547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E54B24EEC6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A1C3043A5;
	Fri,  7 Nov 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq5IuS50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIWz4TAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42A304BC1
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510081; cv=none; b=Uz447Oy9B2JkCjL9DVcoaUqhh4Apy57FQxHwYVDC6yUBHpWC19IbZIKrRl5DG2ooAV3x6wXmpvomsd0HzZUsroLapau9paHrf5+ZTqn2cflgRHDgfjB4s/pYX7XHySunZb9UdXiiyJQkZ82sshIegk695R8FD9fgPavyBU9hCTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510081; c=relaxed/simple;
	bh=pAeuv8eOL+5wg9RgGs+Pnrpz+ObPQlxFoMAfwp9+uXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZiqBb/SBBbEhFIJESW1OptHUuup775mJWVHhJnb9/nvrnYSt2jB/8TxDKPKQtMQi8o2OlxvZwNUaW1So+RnB4doLf5ojRzHxkfaNAGCncl4AFZncMtB8Oa7OdhO7fxGuXzgTmEuctabNPIMfWmt9qKVjpZ5l/zIVkiNaiBLIVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq5IuS50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIWz4TAw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75OZKf566907
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MvIAOFltxWle1TwjCIbYDRWklxWqBrXkSsk3joE4gzI=; b=hq5IuS50h/SWhhy5
	stXFwO5kla4H4xLD5en3Z0KYU7FUXfpwrZ5VcS9Oepmh3E0eoMu+INO6pxqUzQEF
	7x3lIh450PIHagJhyvQmvmNJLnSXAD44BXbfjQhbTmxVCv3PZm9KQzsYq9ACQ9g3
	Qm3BebQsop/IP7jRONacxY36359y6Ife0sJ0TyAA9q2rwUdGFsNMj42LW28UOazf
	Txf04PX81BmQ4ioPy8htxvtWtuJ5/ypM68j94XUYf0BOUzuXEN6WRe957wxIFSTJ
	1Y+Kr2NOKLNC+H1juUQo0Xr3Y7+Re7EdR/E+DOrbuVmxFcO1+H9N6ubbcpbFTLx6
	wuVAUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qjk0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:07:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so2013321cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510077; x=1763114877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvIAOFltxWle1TwjCIbYDRWklxWqBrXkSsk3joE4gzI=;
        b=AIWz4TAw6iXadvVCLf9pyRiB7ygdO0u6GfyeToiFeZu9dUYNmhXjEkj4q6XCR+QYrC
         QzMoKq4BJYwwgB6PAMj5LWMb0vEP4RkFzqgycyBmjy0i7QcOSqMXxBPWlytYjc9aQfgW
         w+SG2KeP+uIle5RFJOKXq+1BeO7a5gYULQBCXM2SRkqk8ajL/W7MWb6zQM6z9HOhcTom
         KayrSw0C8b7IE0NV4g31EU4PeYlOLpWodbmzCYIwaHyhLjiH6+YOUlQprBzYAhRlyb0e
         4iKPAUZwSTPKaU5a+yD//9+fdgrhFgLsqi/fezxxP+bXl7OYM4iRahhjvoWI2ba5J4+5
         9/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510077; x=1763114877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvIAOFltxWle1TwjCIbYDRWklxWqBrXkSsk3joE4gzI=;
        b=YoMIQ+ZoED6qfjArSsVylS4QadDaVahAf9WuzqBGhaI84vg0WXnA1uP1B4nC8LXIXE
         ccf0/34CneEyktWea1aY/o7dRF646Rm7aBRza6+dkH5g+Et0Vh+bYAlS/iWd0aPlv66U
         k+eGgGHm7nS/ZP8FcefcSU8L3pBZuFM5G5hb1Qldb9gs4y/RCnMQjHvI/1Q/14kO3R7z
         3PgSpD/TFmW4aQ0OlUqudZTSS/qHkn6W/Hs9pM2CAKgwrWW7+9UjAYxdITZGXYuBdsEW
         tmLnK8WxaA0JJkB0Urcf6C/XEuysj4YRx0CkuXQLM8afGi5cWT0EneJGV9rsGcvSmFMc
         7++g==
X-Gm-Message-State: AOJu0Yw/d61+2xzujnwHJYDe+H+YbIg8xgcVYKgCEMbZ/NsqeATI1MQa
	vUwL1iHpFugqtxwGqTUc4r6M0cUOvDmVZ+UmigWuskOIT4pglr9R72maWQO7UjL2knAx/X82zDJ
	s04dzR5h10ni0mcwnc5qnQ0I2nBmkxdC/ksvSAVTZnFPnUpIU+kuWCvunOMhSGu0NdDY/
X-Gm-Gg: ASbGnctR6YJ+E8qlo2udcfHK3W3CkkM420K7fnVM6+MgnyC81WU9VlauEtzcnS1N7VS
	khtRmtmjHkcGlBri/aeanqUTV9oTFkS/EhmhLDiOZ3ZUxkcf+/pSlBLGEml919jkDImuJ7pdwUO
	wiYQX7Mxzj2geYFpgkoqPfB/dyfAJncB7Dvp/1w/dytyf5q6aMQfXt981Ory7Tgzngis7gF+SEM
	cjEvkrfGjmuLkfNU10Y4Y5I1C4UD1Q0PEShaVJu8H0Uxl5Bk4XO/cXp2BcbYDmsb6otmACzhshP
	PtesZhuiUdVFJ/3znUX8WB1/ztZMWv6nlwSEURzb7v5m/LI98QJkizOAd8Je96q91roSk7PRUfq
	Jib/Em0fDj2u+SnvP8OHwyYcPaP/Cy7eijkd0fdEsrOdA10f556bxxUXc
X-Received: by 2002:ac8:6981:0:b0:4ed:94d5:8d2f with SMTP id d75a77b69052e-4ed94d58d96mr13070871cf.0.1762510077109;
        Fri, 07 Nov 2025 02:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCffUKEFhoQWX42OnPuY8WARk25VbAeAdm+d3idM/CIVmUeG3yhPMYpj8qPKqDcpRK9eDRMw==
X-Received: by 2002:ac8:6981:0:b0:4ed:94d5:8d2f with SMTP id d75a77b69052e-4ed94d58d96mr13070671cf.0.1762510076732;
        Fri, 07 Nov 2025 02:07:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm200008166b.72.2025.11.07.02.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:07:56 -0800 (PST)
Message-ID: <22facc8c-7830-4ebe-aa04-003876f093c9@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/14] soc: qcom: mdtloader: Remove qcom_mdt_pas_init()
 from exported symbols
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-7-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-7-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yi7ejLeUV_Q4I717zazWwJP5BM4ZyvgE
X-Proofpoint-GUID: yi7ejLeUV_Q4I717zazWwJP5BM4ZyvgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MSBTYWx0ZWRfX8EWSherS529g
 q5uCD1DpKnod5v5yyVep39ZmrwNICwv8JuV5/OJzEfbX5QdyyBBKQZT7CJObEdQKtraGz/qp+QQ
 qj6vQVd4GDD6fknmggf+WObzIuPlh04o+1A/MY5XUyGdbTD1iKJabH17z2mKRJesySZyPq1gk9p
 mPLSkWULJuFlKsgdxbRtFWX31W+QHV/q9e1EmLBx8PfE2h7T2HLkPJCk2V9M8OQiwlpgctBLAi/
 04knASqrlZdqYaFkZ6CySGexTJi6HqTn7OxUEqy57bFfvTNPEL0xrEb1uzX2irP1/Jz9mLyYNOs
 ZGGlKujCrYXfnviaCCiI8i8058VPy3t3fnx4E8p3mj9hk4piEwQjcysQsL56bhjz8SDXcS2+UZ6
 U2t047zGpaXXgrunFr/MBt5WORk3jw==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690dc4fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QTrYF5lwelmmVfwXoV0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070081

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> qcom_mdt_pas_init() was previously used only by the remoteproc driver
> (drivers/remoteproc/qcom_q6v5_pas.c). Since that driver has now
> transitioned to using PAS context-based qcom_mdt_pas_load() function,
> making qcom_mdt_pas_init() obsolete for external use.
> 
> Removes qcom_mdt_pas_init() from the list of exported symbols and make
> it static to limit its scope to internal use within mdtloader.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

