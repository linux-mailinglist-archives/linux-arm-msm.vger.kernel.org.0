Return-Path: <linux-arm-msm+bounces-73335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB0B54E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776C91D64A39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414843043B9;
	Fri, 12 Sep 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isoXHVb9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276E136351
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757680087; cv=none; b=K/60hO9KWXbEyL6ofgFSfeZxe2H7ffww/x5VYzvi6+Pc2r77yn0OlrZYhWv/+o/sHSUnh+XSbCPXuicepwLYNv8cVBni+DlcSm4w1BXENiyufnihmcafEYxsK446MjC2a0KSck24YNufxtAQaqIW2sto0NCwebO2s4tkVTF1TO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757680087; c=relaxed/simple;
	bh=iJsSVwqOcKJ+jvcqQulAE5UoFoAGbSHsV9vI7EwrTJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrTAktYFe5GHlt1i2s8tpLjqHap9EyZ1CbwCsODBRmml4y+fGalHTbmuH3KFIje7IR4yw3zWVffEcxFiTMq8+DmPRFugL3KAhAc2vFB8d7fj2ux6g9OVvqskWAQHdlw6mleXGjI3tC7cBwMBRHms0aSLe+JnG1zn7oKU8vXtKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isoXHVb9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fLFJ010823
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFUuM/6CWr6E6Ua8sjPcJgSq1lagiIOIVJ2nUPnOckM=; b=isoXHVb9i2tKsBRJ
	TQm4lxsHWuFDL7n3ICfQNr262hzzQiEbEnirW7xfG/7AoV8ef1UK6Oc8txWnMXkA
	uxSc1ukeqFtUkLzScgVskQLkNub7tfNBboRwknb7MMknY+C1DYWtSTbt0mEKpO/Z
	PApWevCNI/ZjOkWlZL5uoMwBfZOKfYiXZNEWLsEPPeQf/9sKmO7E9cZr0ulIzkqC
	XQoQwgJPqog8flCd5Bhxp0fZwSS2vxDQs9v9x/lo2QEEa46wKaxYKXGXXfYfLna4
	UC+J23gHmjvSNYciHYAvf4nvezoEx3vG9Z2g2XJVajs19Z2ktEeWUwgdZDQ1C+Tw
	uJbHGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4mbdwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 12:28:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f15a5f3dso1134151cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 05:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757680083; x=1758284883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFUuM/6CWr6E6Ua8sjPcJgSq1lagiIOIVJ2nUPnOckM=;
        b=SBRiGJwvGbcPJLgPT6sU1ntOtbyrERgIHu6N8vf0oYnWhqPMWrZ38Gybg+/+K1iwel
         yPB2cl0tCULgueb1qBj66JtVdA82RtiU/xQNdSWzpESXA2nAqykCjz9VobKb+neEOGA4
         4XL6oVFgWYWcsecvvl0DJ6PM7LgQsOEvFicSMzH7xJf44AGHvlZpekXbn+cxWGAPr1tI
         46dQ8alCsDWZfPusuyBP2o0DZTxmtb5XsF+oHgOlXxhDe4LHwFHUZMmF3L60j8gzvpvk
         5S2j2K2Ykki5WJfwlafC0oM/gs4+bU2nKAKE+440CfMfo95HtMkqnFWrwDZXsH2LSKAW
         S43Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyy0r8wSCWOTJo8Yntc2blYhmEaz1IQFwMHp1w8A9pSDPnQMMFdhfKfneQoLOZHvXKfdvQT4CghiZdjDBi@vger.kernel.org
X-Gm-Message-State: AOJu0YyaLb0NzC8UzgieQVjksA+YgDrl/uqmK10r1bKW3oxeYILmc7/p
	CDXFM24eE38EwuVClwypF6WxQuwkRiY2lx5sGgf49923QjPKnMfaTrzlADmbDa2EdYxZ78LahO/
	uo5joHNZLwEopF/izCbxEhSVRFCFLSdVvKkhx+yks4chZp2iFd9Vk+3duDbmbvNoufYtP
X-Gm-Gg: ASbGncv2Qgx+MO9jFszTRYPmG8iF/cCW0HcMqC3qVoZdES6w16TQAv1T78zVI3DV0sJ
	6ERLTut8SxjPZ6bZjpbmY840r+96R/iX6qPS1xyiI6MGEqZVHhEnH8iVYkXtfi9IWJbgUsbxrlY
	I4fPJEStsynfH/V31nxYC1QKXbZP2kj/yhcMx5HDSnz579wZWmZqcd89taW6EQ0/7Of+St61/f0
	F9JIOBIJfGnPqvwTtbgcJkLXDE6Md0nrclxzvVIcaWO1c40Vgc0wUcBzjEEovx7xQf1yqDuNFzx
	2bpwkiewKDZRVC5TmW6XvkujqQ4ZylAjk8x6WO6cltxwpZCxczPELmFVdAW0e/mHWkrdCK7BpoI
	9W4oUv7pUDEitdDYfnO9lCA==
X-Received: by 2002:a05:622a:1984:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b77d06ecbemr20553601cf.12.1757680083077;
        Fri, 12 Sep 2025 05:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8QzuRduFlaCIEb8iFypsFpoHRpXBscWN+xA6q9Sfc+5OImw0a6uM7bXGrxC/zLDbpdQwBZg==
X-Received: by 2002:a05:622a:1984:b0:4b5:dfdc:1f0c with SMTP id d75a77b69052e-4b77d06ecbemr20553301cf.12.1757680082556;
        Fri, 12 Sep 2025 05:28:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm359239166b.67.2025.09.12.05.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 05:28:01 -0700 (PDT)
Message-ID: <cb2a5c93-0643-4c6b-a97f-b947c9aad32c@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 14:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
 <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+pnk9hcglmYK
 daJAewHRvRlQrcFb8G0lSTeHSL5Vjbs9o9sb1+wZ6Y2C9tFXG99+QuutOPZn8kR8006JbPRuSpD
 h75z4RBPwGCy/kOhdCNZtj8C/Xpr1DcCIwfX9Rb1s+iS+RykzREwLpT9i4SMFcQadb9E8r/hXVY
 XGfu0SSyDrdBAHNYaaP3EqppjznXdvHmlYbbU9F7yyJkJnMkKzq/jGQhdzuMj9uCnzsJcHkjPqL
 FYfBfcLJoan0BosZ4aZXARL51Wf4WjY5dwO1r4t9I+bxtk3E1FRamG8lV8hLF4NPywwa/or1ZI/
 JQtVsbDjYCQN0WG2MJ0kf2e4bjY5DYdANJvQo6rou+p8j1V4STI0yCfOYKjHjJDY3jlXM9N8+S8
 hnwIBlyr
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c411d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nUKbQzcQiuh6IjOItDgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jlTZ7y7r13qZPBbYkGfpNQ9zg15wxFZC
X-Proofpoint-ORIG-GUID: jlTZ7y7r13qZPBbYkGfpNQ9zg15wxFZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/8/25 10:19 AM, Wasim Nazir wrote:
> From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> 
> Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> 
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

[...]

> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};

Pulling down an active-low pin is a bad idea

Konrad

