Return-Path: <linux-arm-msm+bounces-56538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40EBAA7744
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 653D53A856D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDC425CC79;
	Fri,  2 May 2025 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSjuoatr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD383C465
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203346; cv=none; b=u6ljm17SlJreqIIE4gCA7vYAECp7TgUjA6TJSqURGDuZ8+ZMpESmzj+jN5+JrZlna9xz4nVw3JethZNy1HLoTTeaQIEardAsfp+iwHBjLDhrk/vLehZzNAVVaWe5Fe/V9w9AoY9qP/244cu4ahOebKCkqPHeB1uD7tL/8fyPqJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203346; c=relaxed/simple;
	bh=WYH9SiI/9OQc48EIzrGzJHbOYo13HPK+Z4Mom0Xb/vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnuJ0RUwaaJMpFzVek0JQbM74epWdjghw7Nd8qDfRGI+tQRITRTQr9YPXfCQdK/BD3v8BAM/xtntcp8xsZbLVewr4pgTEzby5feuInWwdp+3/+dOd/xuQJdJV99QiN4Vtrw09FXr2+LAGVTVTkfjTKe7ceSOxYTpC83UYariM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSjuoatr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DARjo024187
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 16:29:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Imz1o0ryfSKDi3h4M0Ledl/IY2b0AdaI+0+ZKgPWnr4=; b=bSjuoatrtiJvtPT6
	3Y08+ukmJt2o5+tYZfIZL9UeMc0MsUD2S1smW/eLeruRjtcb9Hqp7+TOLU5qIJYc
	G1R15j45rxv/61jnJyEmRGJ2DpX0gtmzSWcZSXU8DWMeyI5mVG34PDtKliL0Qdd7
	X3d4pJs0ZnQ7NU7Q+jXx9IfOq/erg4CuYl4QtlILNTZqpYGJDZ/KvIP3AP9WUKfQ
	h+LFVMGPwSZ3+LxSKctxB5hjy+c8wDI0iD0CksxE19E0/scGrG5wULa0DWG6Lnd9
	AwJQdXt6thnLIAa1N0NtlZCGtCzwSUzADNcheVzvbAj/tWCC+sHU+gFMygjSmsQE
	Zx87dg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u80v3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 16:29:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736d64c5e16so1870560b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203343; x=1746808143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imz1o0ryfSKDi3h4M0Ledl/IY2b0AdaI+0+ZKgPWnr4=;
        b=wBQySe97dYo1zB3uZt2QaSjiZeHbYAt4FW7bJm4suJZAiNlZXYKhj/W2iz515fs5Nz
         n7YswCv1Gz9i/JxAbKG4jrp9eml1swujIJwFHK1szMNUI+wj5qehjeAUfWHFcwowgInS
         rizM/zi7Wx/fK4nYtw8mbyAEpsZQIruqQnUJX3beBnOBX+/8GWsHDu0yzcPLzpruS8F+
         qaPDayoVhT1ZzAcXh5RRKHv49soJOCHqAE+4PiH8780GP/b0LI9gQZayw6vjkMHpfciS
         R3a4CqR7qZreR+lae4CTm11txBaoXF3mC+cGrh6AEReX6k5aYvOtkdsynGsezPxl87dZ
         nSTA==
X-Gm-Message-State: AOJu0Yy+NpdvTVujv2FSjRBfY/yWhCvR+inPwsR+PFYG26thQq6z1cgs
	b//jOa212G6As8KkhjbuLrCDCLUApmIncMTyqg6YWv9dpmF06l0l7a1hDwzQSQum5wxR2aOJblP
	i5jV4QF4xGPPu+v2BjRnRMfr4pv+lPKxX2/HVm2jSvl/dglTedYU6GhkOACjoJ4Wj
X-Gm-Gg: ASbGnct1mLJCo6TyVazm1uS+HXEz8MExDl5sDyHojOrPP7G5QXYWOfvUPVrNJjWPgsj
	JP09+LTR7ic99/6awrV7FhmrqEGXMXRzfzM4AjEmBnZ/PJNBvzh/skyap72QH1PemD11kW5yZ6V
	/XaHxavsKtHOSGMUCWGmFwI0tm1ZcewdR+iZBGxWjD+P4hLYRmtRkm68cGNb+FXozb0U5dc3hm4
	vUm2+q19axnqyIWYOCStMfym1TGfgzzSlJ/eCwdAp/kB5eyn9EaJKI9H/aCAzl7iDgA7k5XVHhj
	2kJOgCye6AEmT0O1sdy0KS0ghBTEOBeDVuq6GOabCeyaE3qCJ2UK
X-Received: by 2002:a05:6a21:920a:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-20cdea52d9bmr4592378637.10.1746203343286;
        Fri, 02 May 2025 09:29:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/l3hJUPTNLXKqmeVG2ZXFmeMKkNVJ0yJoue1mM9p2VxEWSQlOwIdlLxb1RykHuv6Sn65E7Q==
X-Received: by 2002:a05:6a21:920a:b0:1f5:7c6f:6c8b with SMTP id adf61e73a8af0-20cdea52d9bmr4592347637.10.1746203342906;
        Fri, 02 May 2025 09:29:02 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbcdd0sm1844438b3a.67.2025.05.02.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:29:02 -0700 (PDT)
Message-ID: <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6814f2d0 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=q-cXM-vEBeggpBd9xGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: -CJnQveEp2ebot8hPVWwi26XdLA0BDdw
X-Proofpoint-ORIG-GUID: -CJnQveEp2ebot8hPVWwi26XdLA0BDdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzMSBTYWx0ZWRfX6AP/qF0RQan0 tWuuVJEVL8ZHis2dmXpjWs1Wqj0aaHY4diyCdRSjUCz3NmL9oSIz+rOQW9R8kNUCyvJuZz/ht6I cmxz1obHkVTRVmgoMDYXXyvGZbKMT1vmshMsaWt1uH97Vh4jyyy7FVhmrFxIUD05w7CjqRAvrh/
 DYxqjD8eZHH+kN5IUv3h8QZoTnLI0hYkd766y0Z9PAo2fRpICCDdttCuWOeBSgES2GSOtl+Usue 25vxo4f3ovPw7CH14feGaltKDu7tOqp9Pw+YpVVm6d1G2PTwcqcdHCEGwIoqB0wIGjpjbWpsnTo ZQCO/4Nj4O/K2DaecjmNGSfR/cjlvzYGvOU2yeJQZeqLC/Jih6xRMQPyFMcYOgHXxe8n1s1Yyuo
 ATzj4eISl3DEXSF/Cui6qaC0x+rzmS+MMmlUhVz4Byi55AtflspoRkf8eHTobOd9k3DB3Xal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020131


On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>
> That way all platform specifics will live in the DT, requiring no
> hardcode-y driver changes on similar platforms


Thanks. I thought about this API but it didn't strike that I can use the 
args to fetch and match the value.

I need a suggestion here. There is a plan to extend this feature to 
other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT 
cause as well. For IPQ5424, all 3 cause will support and for other IPQ 
platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any 
case, can I define the DT entry like below

         imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under 
value> <Overheat value>>;

and store these in values args[1], args[2] and args[3] respectively and 
use it for manipulation? If any of the platform doesn't support all 3, I 
can update the bindings and define the number of args as required.

Is this approach fine. Please let me know your comments.


>
> Konrad

