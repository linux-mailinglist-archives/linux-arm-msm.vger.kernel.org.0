Return-Path: <linux-arm-msm+bounces-63923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03835AFB296
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EB817EF67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37B7291C23;
	Mon,  7 Jul 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3gY9Br6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF029A9C9
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889031; cv=none; b=Ujrr4OTDcwoqjVzA/VMGJd80x69KMLQtHFhvVTj9cWo9o4OGbOvsngPWVAAh/pAKZuhN776UzfLKPT//c0Gay9He85Whuf7u/qNClgO4fnzjYt8MkWwCDETlkus0ipNEsGJigprSFEj6lTT1X1kGljFYGEf6/0H3WTwCD579fC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889031; c=relaxed/simple;
	bh=BgUK26apviIxGTvkhHUvUb5n67RTDT72hzLQIWUGjn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqfpTSfWp7vZb0z6xjN/7yO324hPsdy8LpWRyQXkvyaR1sbQT5peFTtKTguUCq5H/RMqc3azoQPVQLcblkpbzNvlFH91KsBlI2yAzYSEgY0JviDt65RY1YLfGwvaFEexJfjnstAkLf6ACxPl1Zafq7VkfOEsSLCuwm3NkcPQmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3gY9Br6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679WA6Z001122
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 11:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BtKyfxTPk8AIeJsvPWCjewsjZ38SDSGkBHzkUynmy8s=; b=W3gY9Br6OL0Xdp8v
	BwGPVagXKkoR+Yv5cIBk5G+LVYbTgh3WyQuNmP0wDi/vavTGxHdQp3K5MJ/3wcgG
	dAR4WxmP7a6jcNrmPvoYf1BlGS4T9guKIxdNXSpoPGEy1JA9LY/1p5h55u7du1xn
	uha5WNKCXSuWYoKT8ocO0BHbs3Ji3qZQGUx4KKRyjofWiFz6PcLRgPrGs69Q1/Sf
	TiY9gMMx6vWqt6Gu5LzZ2raA8mWtfC/D+w2JLPffHqPYi5Rzp6QWlhRH1nqLIGRw
	5wYKuDH4SeZluji2cX/M20fJccpbE5hC2TJHkEZOPZlxkqwAkd3eB+p7D02MYwYp
	i9pP8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qcam0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 11:50:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d2038aae69so2080785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 04:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889010; x=1752493810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtKyfxTPk8AIeJsvPWCjewsjZ38SDSGkBHzkUynmy8s=;
        b=Q1DlHkWbaJxSLjZ0mAcyjA6UxndzYhfmZwSR28TOpLW9YaJlyGim3pYNIbpJWWjIIv
         YfgWHcPexMeV8URrV2HEhPbhoG6HZXyBrSyPj1dNq/E8I1Z3wSsuLhQOdQdTp8gjaS8Q
         K/PpK6YsVQGNWKKaf+VMLXxkvTU1imW/pE4O6jbJgQep7oRGCIqWbvzL6fwo+9V5KSyS
         m2h+4rdHT/AX8vQFGdReB4omjr5XCSyaMRUmQMe2YpsNM+CG17Kiz1E+kmgePu0sWGcW
         b5G35sFjmvdKZ+nGh64lfvOwSqpqizJec+jgiFMKXnIxj2Bc6r4Jjxn4zWvECzsFDmb+
         flUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+eo13xyVi0MY57DIvUX5VsmGbSAZmsbRwLHwjiM3Lb/9PItFUOH8KLPugRM6/dOMpc0QxxomzwoG9e3X1@vger.kernel.org
X-Gm-Message-State: AOJu0YzC30Pg6/CUE13D1qwkFotNbP6pDfg7NBvnMuRvGNu4oNLTBxWi
	AJHYTz1nxDI997QW13CWJYZr61iRO8mBv+Fqq6zC7bupAFvIXfk2/jv3Z7EOy9VbN9F4DwK+4AG
	ruaYI9HOTEx17DRLlkMC9+SwywVsgSSbyzHJCfOTfqKxv52MTNb7WHSVfKPVMM0SulN7E
X-Gm-Gg: ASbGncutHPYyIHEZlnWOTpiKG76ZpRlbxaEZqeE81XokXM7tJroXPjMzi7wrrc4IiQj
	uJVSOtajDJvdFiF63hjeDpAhOyRGUXDVIvazo4jsDAiJonJi1IBJoIWHPIsBD5yphkFQpljDMyJ
	ai6+nd5uek9xOgw3J/1iTQbgizQnT6alTxIbhPI4WKSNnrbRsTgGE6ok83lpnuHAj26RG0DcIq9
	fl5Vug6N1mII1l1jB/bwnkTWye9/eHhEX40pZI8TFmp0HNJaKeVRViS+UMwuy7vqhA/lqP1OSsh
	JhG76dppJTYtqLlq+KQQ8QBSwWbiztxM5hLn7uHDx7ZeRYjel97Ix0M/g9LRQ9pjVLiFyM5Ecuq
	kgmg=
X-Received: by 2002:a05:620a:8086:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d5ddc7186fmr516220285a.11.1751889009827;
        Mon, 07 Jul 2025 04:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJC3Fqsx6CpDLKzAOaBps+irlPhHcFg2khR3/yaBWnK8u7z2vqoG9wXzHo+FYxm5ySpxgERA==
X-Received: by 2002:a05:620a:8086:b0:7d3:8e88:dc0a with SMTP id af79cd13be357-7d5ddc7186fmr516218385a.11.1751889009295;
        Mon, 07 Jul 2025 04:50:09 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca696480sm5522871a12.27.2025.07.07.04.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:50:08 -0700 (PDT)
Message-ID: <20c4a464-699e-4266-92f5-f23f1024e277@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix HS-G4 PHY init table for sc7280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Xilin Wu <sophon@radxa.com>, can.guo@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
 <o2chuy22dls3y3bsjke34z7pnyzap6m4m34tjxswueshulii4d@d5lbcragrbjb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <o2chuy22dls3y3bsjke34z7pnyzap6m4m34tjxswueshulii4d@d5lbcragrbjb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OSBTYWx0ZWRfX1ZF7INEHgcYH
 DPiDVJ7UqJb0/E4BG+fHn1Wve9jp5hlKl9K/R6JfXgZkWp4Id9mC2XF/+6FdU9uZ+/JGD1UsmNS
 pbBAg114ff6ocXiZ4EattigFAwYOVIrkrzb4j+N2E+AJzMF3aWiC8fgS6wojq1b34evh2BmlSVB
 lK+rTTlcS1ryNDgsvXIp218lblYRbQrFIzn+LfWxQB7myBwXuVdqd6uDvciNXSDg3wXlCoI1DxI
 jl4IPzAsglxA0yzXlDC89r7FRx4/jtzzjMdTG6ko7if00ZzS4gF7nMYs5vJVx8R3sDnSiKWdYwr
 KND+EsYHI2IgPcpZBZBHR2Ur4LPaUK3UD5XdpKuu225LnL/ywM2ZvTEoS8V2++PQkDVzuVGfjUn
 JW0SmN+EoJJR8acIJs8/psAOZYfzooTyEnxlQGlH05ZIEWTNCoxJarhVI/RKAU1Ae6LFhjT+
X-Proofpoint-GUID: ZQFyLO0izWJIZi2TLbHZQYjgnsVbbCdc
X-Proofpoint-ORIG-GUID: ZQFyLO0izWJIZi2TLbHZQYjgnsVbbCdc
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686bb485 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=FoyzFE0DsDRb6SHPX1sA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=735 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070069

On 7/5/25 3:06 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 13, 2025 at 10:41:48PM +0800, Xilin Wu wrote:
>> The PHY is limited to operating in HS-G3 mode during the initial PCS
>> registers initialization. Extra PHY init sequence is required to allow
>> HS-G4 mode to work when needed.
> 
> I can't find corresponding settings in either of HPGs.

Yeah I don't see 7280 accounted for in the usual places either..

Maybe + Can knows where to look?

Konrad

