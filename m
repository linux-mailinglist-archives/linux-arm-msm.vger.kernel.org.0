Return-Path: <linux-arm-msm+bounces-53865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF0A849B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5601BA668C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9BF1E9B07;
	Thu, 10 Apr 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3oNWYh1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595BF1E991C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302538; cv=none; b=NVmiwOkfFZ+lbKral9r5eMJVBLzG8xQUJ5UBBwbTT2TPYPQpoWo/AV1vMd/O/4opg0LiubMMynawcJtBgBHtPcJGNhJBs3cbXbNXDAB86OsjYwtHWwBSi+ZVDINTxcHLNZVMpjjn7/OAPo2EGeh+9CGsqHcGeZwpTQiAe497+aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302538; c=relaxed/simple;
	bh=lDRubKTkkiKz7YzbmfGnTOC7qil+jLzt1lxHNAlUwSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cX6cQLZgO0jcQjaxEo40gDhOyF2yQyf2W2ujmEof+4HoCLU/3IeDrPtJDZb435z8wxnS2Dz3v33RECgK5jhD/4ozjjgf3WC178lNHrpt9lTumuVWhvrljNJaj9Z76npHW21agE66jAI4NYuCuys0KclFm6FHssjVO3sHiJeXEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3oNWYh1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFc5Eg016330
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=; b=I3oNWYh1pmIWvoPZ
	YNXyQcTQxr0qCuCP3bjsX+gmUikLAOUHnI6M4W+4Z4iCmhJ4jauoG7R79DGyQaLR
	YRg9knFf18wr6BTpxnRr7MDWGcXkpgDZ6L3jPmbmd+HiMfbN6yDQEicmhQrqIlUX
	6tKvOV9Uxt33c/nVKz/ytYL+Cfqev0ynqT33WnoH5sMTx/klmCsJH6nt16qnTTKk
	FbbNhDcICoxYKKsdCJB0uOG6LJESAY06eXDPKphKszieSBsl+wgoSWCG3sGXfwYr
	C1KFDE1eKkHJg396QkFwC0ipB7VU3cyb3KnFUyklTldtsojJLNB71CsKoR+exSMO
	BvPqKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1qdbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:28:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f9c5af3dso359486d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302535; x=1744907335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=;
        b=sCUAMJw0rBd0Oel43j9VvPv3SnjosPB/1QgCfCub1eFsb+mR6WU4O4UQ205IFCCv1K
         UTMz44Sju4Q0hznq9TWHYAP8jkqxjYxCGaJHSKpkredfLKZ3e1kCELnyzpJC4iK4gmhB
         wJXL1JIdlEt9maVr+Sa4c78FmNIzjYRbUe91vJQJbizTm+EXkaF8VaUlsgCauHXUDJDA
         HLa7uz1JtA11wvRAGPvT5T9yDIFF4MvMdEVB4YINH1AEJ00u8DNXBHG2kAirM+E638xG
         auuNnTfaya/q1s6+ukQ/gxm5z0VMV4W/fmvqw/tAHpkocellq0r3QrR6SwysYqBXg4K/
         vimw==
X-Forwarded-Encrypted: i=1; AJvYcCWffFx9K3P0w866bue+CTDyVtTjVxqnn6sBmwD2xKNzSV7xHpdTqbOfdwxuQHoKc+7Pq8Xj+MIVsb0pLupZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzvZViN1x+87ngE3HK/EKC8pO+pwg/EJIQl6kg28dsQAeMfUQ0W
	ESkx2pKsX41iwU9gl1KyibU7zZSMCiMXxn0E5/NYUpALvynMArO5RvpSM+1vmcpHmmUCl0Cm5N0
	EVVjIrQcri7r8IBZSZosnappcYkLTqztsn0mR/9e8FXxOqXpLTj4+wYzvKCfhvL3X
X-Gm-Gg: ASbGncud8XKoYftBcRjy85RONRzNmPNfUgOEldakm8XmyGHKWYfSQboJjmMMxXswlMw
	uDk1ljr4d67UpTl268YxmjWGLzob3KS+VejYtCzagIr0LsEC+YFEtN2APxJkjiPQSyr3CgMCgrY
	NRicZ1NsV+xDcMwYn3WWToQWV6+LmSPLn7nM0vKQxS0ULUgDMIk+EeGk85mMonKTQa6LJdUTxFr
	QnUmeumvRzbYfW591oRKBckpsRN7XlMxoz2n1ToRnLNrVC0kHU6pOvdbO5GhlLrlONiLXjE8SjN
	v85X7+E/bOLKvu7e7gQDezk7qI3hhOlXssL6gyvxAy3QtRq7Xinlnfiy0qJmyjDF1Q==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f0dbc9abbcmr37085886d6.9.1744302535324;
        Thu, 10 Apr 2025 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQTzqEgSGnRGI9+a1gSJgk7i17w0vzyr4OAfVjD6W7x+6Le37QVc7oS6Fu1U4ISRaqoFqsw==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f0dbc9abbcmr37085796d6.9.1744302534993;
        Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4300sm305662866b.94.2025.04.10.09.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Message-ID: <5cf9c47f-089a-4748-b4b5-21637fb7368c@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add interrupts to CTCU
 device
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ag_abDZccq3nsY6vMt1W5s_XaJlHnQYq
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f7f1c8 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jy6vGmKe9HVL-Nowcs4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ag_abDZccq3nsY6vMt1W5s_XaJlHnQYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=726 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100120

On 4/10/25 3:33 AM, Jie Gan wrote:
> Add interrupts to enable byte-cntr function for TMC ETR devices.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

