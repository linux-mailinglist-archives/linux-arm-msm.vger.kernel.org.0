Return-Path: <linux-arm-msm+bounces-75800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D0BB37FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 11:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95A4F16EEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 09:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39842FF170;
	Thu,  2 Oct 2025 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIUaFGut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638EE2F7446
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 09:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759398033; cv=none; b=eRuVCOY2Wpre2hUj4+nRScs9U7xbGxFji9BI8wsl3XMQor0LsBfv48XldEHrs8cUSAexenpwOK3KPEATmNOQIZB+R+JW9La/bIfEY+Q97XAIQr8rFPY3c+OuDwnhr7xA2udEkJhQFgwzV1jIULxyMt964zvUQ7aOghfR78IES8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759398033; c=relaxed/simple;
	bh=p4GlG0i2Y081h5gfnx5qiqD7ASzyquWjITj8IlfhFC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQkdAJWMVS8sSPY6WbCNd2VOXAPN69A3CAmyl9aXmBmRTpu9kcJSvK/ykIhW0/bhBbt3lR3D8mG4djp1vtiK1mE1TRf59QdomgATESYZcskFUIgeFbP/qFVAyYNu1E+YxarO11l7vjkIIy6k+GBgpJyUPszU/+aaP4t6iBF5C7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oIUaFGut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59294GCl001185
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 09:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcrL4l9U3YzpWDGoNd9/zApd17e8vxY/gbnZPfARZlA=; b=oIUaFGutMZn3s4S8
	1ja7n2cTs6iP3ki4RSoP5ilYYn3moafCWfV/AO3gs+co+MZKNTEvsmXmvj1kE/S7
	jJihhFJMMYQYIUgttITzGVMGXkr6jJWXSrGcpCE2n5hkpGUj4CTvQ63MJLnPe77h
	EUDXwJ2PKab5xU2r3lVpSG5sO2+NnAyBXwCnJ7kPusPHHOUOwnZ/CuNwhYhkYtdj
	hgOdqGIFmghRImLB2/bnqSPanqfi4HZhhuHm75DnQBV8AAcxVEOyuXkm3Dn1cG8F
	eOYuxpplMfAIWK0Lh6QFBShObluttJCVeuR7kTEKeTL6TEB2rhk8afceGluJitUT
	Jj1mDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5yh65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 09:40:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-84fb3e80002so2108946d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759398030; x=1760002830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcrL4l9U3YzpWDGoNd9/zApd17e8vxY/gbnZPfARZlA=;
        b=k0RNwR8Sim/UHbrRMlHG0aVC5wNX+8/xHzWh5cvhW/hwlkJDbhVdr3k8pSXNvLaWWX
         ZPZ+ZlkJjTpHd+U9eOmj93NhIs8Bo4/QnklQuqbLMjpR/N41PCd1OYrqR13NsTLJE4Y8
         88muXpUj90384PBdJtPmCwrdfiYc3TQJbj7lhvK8o/cBZ1u2VbReERFcs4P6Wf9pi5le
         66wAjhnv5MtoW+IfY/ULy4ydnvVX//HVRO8DBXPwyf42iGNQ8XE2ccTXpVikm2ksJMO4
         yTOYlM3jSvJhUFqv2WLLpCQ8aF6FrS2t1rk30XGZ80jDrrgyQbnQMw3LWWX0sQaTPsEO
         UgPg==
X-Forwarded-Encrypted: i=1; AJvYcCUz/2lDdb3wTNDc6FvynY1oVRICw0IeDL+S2bnBstnxtc0MqnC2TMaCBPsjQEbAccbuNH+uctIruJaLgCYi@vger.kernel.org
X-Gm-Message-State: AOJu0YwFCf7P2EyHQd4qrvkzJ7cBWJp9kl/aiTi5qZ2xOzGJtwRJwXQr
	jvrbJcToRLvkGc8cHwQK9AkivZDBJvLpmoXe59q1nxfKxTjnT1fRVhWLNUqvz/2eBz1KQETwuZE
	Zdy61sHot8sTNDUHs304M6+Uu2YzNo8zRtmn1w0tPt6dNzCr33l6u4xQkdAscZPwmQoi1bxTmqV
	cQ
X-Gm-Gg: ASbGncvp3yCwLHC56TLLtfoCcwQWwBVjR1b6JqicD4iPawgXJHnDzVi61zNEHMP7eSK
	Hdkki1JQ3ZCpR8V41h5j+0xDBSaiGMRI1E1XA5Kt4Mro57PScf4qmVxUeE2qUacy5gFzfMrTS+q
	epxu0npY0ffDZtIpsz6mEAKcDtQ7hncoi6t2ALvFTfolvv8eLxSVGD5yh2VU1LCB1aJihFrwZwd
	PCXN63ZVcz+9k4AISse3PzXIWlV6IiZq1EVhmFTBEghLjT92OagU2+BsV8AeDbMlFmMecx53SkS
	KJuXwxrn6+luMGXWHAG3WQUSzF8HtBQYXrFyaOJWUrL7lFh+UhlPXC5ER1C+J6/lXC9pp4H8P7K
	WZIhwXtV4XF1petzFfHGZlzoucrI=
X-Received: by 2002:ad4:5ec8:0:b0:7a0:a767:a178 with SMTP id 6a1803df08f44-8738f502fbdmr66516896d6.0.1759398029983;
        Thu, 02 Oct 2025 02:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVXxbuADxsDG4M6Oq6bh+r8gRFAtX4iygac+XXhWKQ9H3f8VHZAfJ8X66Hn5JI6RTnHcgGiA==
X-Received: by 2002:ad4:5ec8:0:b0:7a0:a767:a178 with SMTP id 6a1803df08f44-8738f502fbdmr66516706d6.0.1759398029297;
        Thu, 02 Oct 2025 02:40:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aa9e4sm1513886a12.7.2025.10.02.02.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:40:28 -0700 (PDT)
Message-ID: <f212ddf6-9bb8-4222-b3ab-58d493f0aded@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 11:40:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
To: kernel test robot <lkp@intel.com>, Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250926-topic-hamoa_gcc_usb4-v1-2-25cad1700829@oss.qualcomm.com>
 <202509272140.wYFpHZfD-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202509272140.wYFpHZfD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5XaV1uPKIUpFMQ9zrktbEeahbG7g-J0P
X-Proofpoint-ORIG-GUID: 5XaV1uPKIUpFMQ9zrktbEeahbG7g-J0P
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68de488f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=lGh6S24CkXRaUtfctWAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXwh5xXrvVriHf
 HKS0Z8GegnNbnMXNwkgq832DxkP3VCTqFnFjMoyeG4/Rt8sylmJPWAlKz977Vyg3qK/39RHwkPb
 xPZhlfkb4DOlOPqywhu3jXum7QUnf1in4WuyVsM4z8jR8wdio/ubMyrZcQjqGhPejwpx/jDI8dC
 T1mMuw85q9zpX2OWbfQTHO8jtW51s/1UuJ9/On07dgA5qjV4Fqmy4ftptMDipnMjdZqnC80vVx9
 sQowmE6nAgaTtvTpPV/BlmfkLeLSaTu9vE9bbFOHRvgBPrCI5itIt9QHCGwumLLCQ6y0qQs53CH
 Cfgl9kKL0M+bMhbI/qxc677bwZ9Pb1aFa4WJ/fro6R485BtjsmWyE+kG4oKoKHt6aJ8mv/wd3qH
 YPFqn8Lta/B38tB59DDDfQVggmZypg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On 9/27/25 4:01 PM, kernel test robot wrote:
> Hi Konrad,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-clock-qcom-x1e80100-gcc-Add-missing-USB4-clocks-resets/20250926-200520
> base:   8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> patch link:    https://lore.kernel.org/r/20250926-topic-hamoa_gcc_usb4-v1-2-25cad1700829%40oss.qualcomm.com
> patch subject: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
> config: riscv-randconfig-002-20250927 (https://download.01.org/0day-ci/archive/20250927/202509272140.wYFpHZfD-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272140.wYFpHZfD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509272140.wYFpHZfD-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/clk/qcom/gcc-x1e80100.c:580:32: warning: 'gcc_parent_map_33' defined but not used [-Wunused-const-variable=]
>      580 | static const struct parent_map gcc_parent_map_33[] = {

I initially used a different magic clock struct, but the current
clk_regmap_phy_mux doesn't need it. I'll resend with that fixed.

Konrad


