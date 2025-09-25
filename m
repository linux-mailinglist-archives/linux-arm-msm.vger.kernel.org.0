Return-Path: <linux-arm-msm+bounces-75070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFBB9EDCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082674A1CD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02CA2F5321;
	Thu, 25 Sep 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dxh6OJCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255002EC098
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798407; cv=none; b=t0h/ZUoBDZOkGXJBaCLFcJgXo1aciPKc/sNtTfOl/CCsEJSX+b7TmsqGTef5mOeSJBIDkxpWFvZNC6Q/aUz3nAJ+U4n7kXk7yJm+eX9mRFlAwuOcKvl42fACNEX21+mRWnvtgS/98ZL2BEH6LxCAiN7l3EsbWDrO0u+1vIUwrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798407; c=relaxed/simple;
	bh=iTkf6MbCZfjRYj6doNponSJfEdSohtdYGWNCRkJceag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzgylXs1I5GkIfxaRx7eyFZJrU9UWzzUzHXm1gNyOTI0KBrpYM9ubc+3/qE4nJgtiVYB93AJptQPY7CUPWBRWBaCpJcESHXPUVZ6XETgidXKO+vYlksgOzer6qMkOIuFcJ9ksCaDHyW5FDni8C0aVHErfbyx+XLY2NzaexmQ+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dxh6OJCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9lwOi025099
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TUqX/2UP2jnwCgFCh3YZoQRNRidr+suu+zk9+HGhfM=; b=Dxh6OJCj3lnwPsyx
	AmJAr80b0qoUvS3i2Rtb6bVQ5f4zIReE8iXTs/axPlMK5YzgD2xZ+k8PIslqVjeU
	ghLJMqdaDJhICKmtK9Y0qkFgdy9bYw5vM25yiQIhekwgVxVSfkoeSpyNsCrpzsIA
	c9KnYpOy/ovawMNMtSlb5kJsED2JuvMbaaFImWMWzbFFpwmAeHGKYfz4gl3D7Zhd
	xk+/PiwES+t4EtkpQNGd1NLm9bMvkz9JioOHZg4YPJ+F/WnOB+YV1lXnBrUDKbKI
	aDBET/l36TBwA3d2Ug9p65or3lvx+rFY6SC6KfmKX+nHj5sx0dmddtntUc68Q32l
	YKrqfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyf060d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:06:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-82b15c1dca8so33326185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798403; x=1759403203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TUqX/2UP2jnwCgFCh3YZoQRNRidr+suu+zk9+HGhfM=;
        b=kM5x2EnB0bggxUjgZcLN9byxZbiux/f57N+IUTOV/O1Qx7ixI391KBlc9gfdVQNu/p
         72rmLatq/w4WOoLYw69cSKGOSBjXXESRk2gxHhQlBaui6SH4wzpfXED/HY3nXDij3COy
         JgLhBvbTzcAqvlUbeSi6gITBAQQu2hV5dcqVVPsAZaclqS6XnlLCulFo9sd3wds5PWgq
         nBIqAkRWl3pNYWQlIY8+/Qa6oEmb1n8/q/qmU2uA3Xm1y/BbNfyKjqPVeV0v0L58ZBwA
         bBIaK1VSlYz4FSBW6rNwqn7uRnI9LIOX1szt0NI5YaTJPfqPPcM05bOFStDxdjjvx/AB
         QNRA==
X-Gm-Message-State: AOJu0YwuuKENr4sj9gY6ASZZjUWfg3HIuwJHESfvTOOA41brwXxoOrRL
	HSjFBbcQjTSA6ZluZQLT7Ecpdn7aSlOxa2WbyhfrHMyytvgftYrxTMy/LVQTJ9N8nTe+1jaHeH+
	iicCB20BRjlBAQlqnDjDV8mBnjonI3fE+/r7vM3LLL1BkklAl4WLbWQpY6MjdjYl4HgHl
X-Gm-Gg: ASbGncvmUagZkuId1gRXkgGHx1bMc3q2zhzpK3KEfLHg0UHrujLK+3b9rFEhIQZIcuI
	+Bc7OgLAXeZmieKSOo046x6l+YceD9ijgTsBMsoK1ySxF5RxP4+1/nLg+oNlhYa2iy5iODhWDG0
	8S7TIPCMCA8aP76GQdQUWLeUM5oSpbihmaE9edJw8m4P7jSZEO17iQn1MIAodPcQKbJYObz6WMc
	waDR7dCjQKBXTiLtXkKls34dZe0GissEBzAGFF3wo2i9qbPUOW6TWWZ9WMbBRGkiMKPS5oEdFk8
	gRBVWfMInpK0DP63PzzWjgolvmwCWAbBvYFqHhcoMwZEwEsKMJd7ICor/05AyTvT+rRivIbOLfj
	NkmsYvRFbPVHRgz+baF5mGA==
X-Received: by 2002:a05:620a:25d0:b0:829:9017:82b6 with SMTP id af79cd13be357-85ae6d8219dmr223977385a.8.1758798402923;
        Thu, 25 Sep 2025 04:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUDkpnALbd8j8AqKvQTtvUGT+7H8HmfLLCVjMkeZx1BzRf5E0I8t3uyafJuXTdEjjnU2AsBA==
X-Received: by 2002:a05:620a:25d0:b0:829:9017:82b6 with SMTP id af79cd13be357-85ae6d8219dmr223972685a.8.1758798402193;
        Thu, 25 Sep 2025 04:06:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f86f478sm144386266b.39.2025.09.25.04.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:06:41 -0700 (PDT)
Message-ID: <a2008350-7aa7-4f94-9f19-926cf4e9d40c@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:06:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] arm64: dts: qcom: glymur: Add USB support
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zJYGHZDz2bGT-F5GeMo9O9sDMKHy1tKb
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d52244 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=f_k5thaLw67-wvj6FDYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX8A3Q8KOSjoeV
 qCtEVFtXxY73aeGqmEGKq5xZ1Ozbu7SuMa6Uvmpya5NSeOhZF/e6VixgsF4SxlUrTQGrmnwyGYY
 bWmRlhEJBgtohyCeYc5n3vfuIO1b6ow/GEPohehRGmcTINzfm3dhD/dkTtfgOXzMFBIaCaOkxE+
 1zeHkqE8wd7I5m/7DWZAtKFKwi4NtyeIEPvN4wqZBaWYgye/aFyMjUcYBwopeKkf9U1hGkeI3AZ
 fOz8OKHR+i+SGIxDJ/O3YWc9rRqRHEpSVkMLyLFz4grus2axW4uUS/cGjGyJR7J1BD80Fnk9lPM
 UkLAw+Moyk7G7tN/JvFN+LDFBiGPql/xDfnb4fCeiiY2Mey3Ga6xIHT4CltgIff9Oy2/S4E+Uot
 Z1B5nRL7
X-Proofpoint-ORIG-GUID: zJYGHZDz2bGT-F5GeMo9O9sDMKHy1tKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
> flattened DWC3 QCOM design.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 243 ++++++++++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 569 ++++++++++++++++++++++++++++++++

Please split this into two commits

[...]

> +&i2c5 {
> +	status = "ok";

"okay" is preferred:

$ rg '"ok"' arch | wc -l
6

$ rg '"okay"' arch | wc -l
33019

on a random recent next tree

'status' is also expected to come as the last property (but still before
subnodes)

[...]

> +&usb_1_ss0 {
> +	dr_mode = "otg";
> +	usb-role-switch;

usb-role-switch should be in the SoC DT, and I think "otg" is the
default dr_mode

[...]

> +		usb_1_ss0: usb@a600000 {

the nodes should be sorted by unit address

Konrad

