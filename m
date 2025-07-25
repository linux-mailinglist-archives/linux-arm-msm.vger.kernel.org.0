Return-Path: <linux-arm-msm+bounces-66661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5855B11AA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D9E83AFDAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 09:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130792749E7;
	Fri, 25 Jul 2025 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ild5GXSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A27274678
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434830; cv=none; b=qhhqA8ZSRZOgFCNkLhqmvFVhH9rFHBVlyqpu5Hxj7zS8V+1II86EYa39XZIZYk7Jk4TW3AXstgdOLo3g7Bbe4GB0tQJBpdoldyRFcV1+kjbv07sDOAahOvsPTPqciBRSeZo5IPU004KG6qM1ifuNHxrMP3rm+UAsfYox0km3i0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434830; c=relaxed/simple;
	bh=PaBfkP9n62fPauaryWWVRFcxPJrOXO55ZQmLOGK6kpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMNd+tT+Aq+u7+7aoebfMa0fowzWDkRIcRfa9HwPzWzSG2rphpMcXm1b+ZyxK39/A1MM7HzLndXbM9xJBN3s2P3ZMR0afMuCdDK8Qe6gWk7zCIgXI69j0aa1boeNwnX673tCork2b1eAcwO5Szi7KBlsQiDEWDEYopBcqQryZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ild5GXSh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8aqro023710
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEV4DPbLykBJZVuPLhGCPh0I2ttNyDmYPVal2jJWRtc=; b=Ild5GXShfumqR5rM
	uStP62mpxylPBAdooPdL9Oz363aKSsFJOVXe7xs8qPBaDau+3rUeKABmKCdWSvAU
	hiciaj+hPTTjnA3GoyvkriGQ3Vw+DWi9ZjWebGIQYqfXqJ5/hzI7K9T0NOdFHoay
	MBJ4iQrtdBztmcd2OlTqt7lE9jUs21kCZS7cZ/pS3SGok66vYxdyGzcJHcuRVPpD
	wWksrLjhvmWg51Jk2MBydfKF74sWO64uX0/4hzpsZCGug5vo0jfvN70NUmuH+RKK
	Rbm1zddVbiDKvsHUFNitCpwoKD4Hx+hHcTSmEeCfOlSgxkMP78zB+VXIJudIIsZx
	r/eaeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2r9h1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 09:13:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab3bd0f8d5so1394011cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 02:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753434826; x=1754039626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEV4DPbLykBJZVuPLhGCPh0I2ttNyDmYPVal2jJWRtc=;
        b=ajFuBeRKbSTpgwtFkdJsqpOYTnyhp8HIgM1W+ld7uctLVVHy6kiXml7htl7Wxu79kP
         q1s1F6+6jONasLr6D95P97NmtHNqXmtSZW24DeqCz0r4oinxELTwSJpZI9CCWm4CLgCa
         XXsiXbpX0aOaNarH5EwUM9tFwDga/+9SfRTaANVAMk6o4noXOk7Pu70+iST5P0MAAHbi
         DBkUwlNasNh+FwhAjNe7h8siifg4VeJBCJzWPcIVchuGvOlrre/+HqvJD9+tp3ugStZs
         i6KKuEiTjFzxQqbQc+tgNfn3bjOZT+Ygnl+STJkEgo3vMuEw4+90qk13xcbrwA7rJPbQ
         NR+w==
X-Gm-Message-State: AOJu0YyE+DLrxQ4HyNaxnlHgUZjJff2w9WwUinTfulmQ9lw3RouWbV8l
	xmiUzH/k3VUytreT8ibOP4iDcoql594fE5f+6XQfkjkYgfJr53EJVQfCK8wH+PaKMfzkaK/d4S+
	H2eEm7lK2OsWPL2mUUsOfFxYFAe/vY428wkV7JGWHacK9V6DXKu7n5/NaNukUgQLy43eQ
X-Gm-Gg: ASbGncuYkdpNqoqXs+toVNyP70aWdKA2j1SgsVA1DRozWKHeWLWcAG1oyMEF6ezR2KW
	iSLGZd+GoK/rZ9z5q1wVm/iOYQQL0erL4TpJpah8CcpHo+6l4MSSp0JTaOHNF9jyR9PaZpYdlLO
	lPe/UYPfBSkx9ojS/7sQiyxRNaUJKvDEbREeObY8srfdB6RgQ5kmy4WPV225B2HSs7Ra2ybWiqO
	BbBI6XQekMR/hlrf6InCoVrkwkfpRdCJqEYQJWXl8wFYBMUs13ZyTKX4MtNEPYlc6IrRdyLYWft
	YXhg+mgaVYuzwvWMt2EaDqrzfeVVSL7EX7gNI4omUA17/Ero+x4kNSf/sGD2o0CqZkD5Cx7L3JG
	6oXHi63u9a1isMcz5UQ==
X-Received: by 2002:a05:620a:d87:b0:7e6:23df:a465 with SMTP id af79cd13be357-7e63be3ddecmr57812185a.2.1753434826298;
        Fri, 25 Jul 2025 02:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEExgv8ZCapXOzq8o1kxrwx1MV3NNUzeObfI4hzLnJrsbPQ9KAQEat9qeWt5LdoLPLNJ5W3vA==
X-Received: by 2002:a05:620a:d87:b0:7e6:23df:a465 with SMTP id af79cd13be357-7e63be3ddecmr57810685a.2.1753434825949;
        Fri, 25 Jul 2025 02:13:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd3191b3sm1846833a12.46.2025.07.25.02.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 02:13:44 -0700 (PDT)
Message-ID: <510b1761-7eb2-4215-8910-67dc1676ecb0@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 11:13:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
 <20250724-hamoa_initial-v2-1-91b00c882d11@oss.qualcomm.com>
 <d49d2755-2967-4bb9-b789-8be5f138d4cd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d49d2755-2967-4bb9-b789-8be5f138d4cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=68834acb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=YlCazyIblZRc-Zwj5O0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ESMzF_vlWqmDQ38t2ymrkosfycOpEJYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3OCBTYWx0ZWRfX5j5iZ1P2Z6gp
 NGxOcd3BJYOrTeBEjo8nF15Ujh5VfbeKN/F54FXSQaMKrBHrt+gLt7s+byzEkXmv8Kz8G+esdxB
 mpIvsugPssgjHM9Kunp8A2Y+eWENKr3ZENsjPBHxlLQZV7uIAwpiYEXDMSidGzAq9EoMtj3dNXb
 8UjmxQiRMqMJw/w2uNIFlDQ1qhY5ROimvlPnNkXWC28ey8wuRPr+4dM+ELHS193v3gtvRiXt2zU
 SBv+OIIsRfK8WNjkXeaY4biyB5+kKpCqt0gNKTHG59DNQ4twwpV/s5P2sMLSGWreufddLrPAQe5
 DJHmu9STTgoVeGii0C9ZqDQIe/W1lUTG+XbLAe51CJAD+QJC4vZsv0f+bSSltruH33oulF4RaAs
 dKVjDbVPHBfNJVN5QAg70Megssx/1altrxLCb567hFk0wLK5fpdPjyuDKG5ZPmXC1uHCTWXU
X-Proofpoint-GUID: ESMzF_vlWqmDQ38t2ymrkosfycOpEJYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=951 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250078

On 7/25/25 8:55 AM, Krzysztof Kozlowski wrote:
> On 24/07/2025 10:15, Yijie Yang wrote:
>> Document the device tree binding for a new board named "EVK" based on
>> the Qualcomm Hamoa-IoT platform.
> 
> What is hamoa-iot?

Marketing

> 
> Later patches claim this is a SoM, so explain here why you are not
> expecting it to be used outside of EVK (not following standard SoM rules
> like every other vendor)?

The SoM is unsurprisingly called... hamoa-iot-som.
EVK is the reference carrier board. The expectation is that more boards
will be added in the future, as the SoM is adopted by third parties.

Konrad

