Return-Path: <linux-arm-msm+bounces-72022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2AB43929
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C15A0188777D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA152F90E2;
	Thu,  4 Sep 2025 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8UprB7/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB42ECEA6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756982870; cv=none; b=eP5joiuzTq7AButUlgcAJVzJ7xfrLvJyGqByTWUacXbOTrrNIxW+94Zj5S+vwRBn/ZMCqV17+nEsGzvJhwdT2p2G9DLd0UCEqmqVdFNzMclEtyhRTsWhRQ2kFiAgbev+lX60GQgcCNs9XL+S4SdPOfu6dmjgiBZ+OA5gNzl+174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756982870; c=relaxed/simple;
	bh=+MvyZKV394meBDJI7Ka/R3SOhT63C//XXT5EerNYuUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iuj0Bue5nyuSeS7KgKMYSVsc3v2QoAFkfzXfgu+hq1dXuTJjsMEiDhzVCr1NToZspjPWkCAZvKFD/Qa4/ZBJHZJhFrPw/uN8Wgqcwu2lA6iHbAGK2WaHnjBbswLrljktrz1pAnmNDZFhQySjXAtUBY0FpK2H4U7VrNEVc3UVJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8UprB7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7fF013602
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLHQFn6pkMnsAa57RfPomE4K+Un5vLqC03X20SdqDEQ=; b=L8UprB7/oErcgVda
	zKHYwOzjome2tvY4NfHJAWGpY7G+0exIFWN2ZkVyhPP8XRDKv4KTnyNqIL8xKs0v
	nw57QFoAMxeCKT38V8Hatw3UpFmF9zTEyjDDtaGHo2pmCOnsfc8coJ2AeqD0QwrX
	XL/KzBGeTLvCR9ofY7ULvAfMOB8Q+HlMpqemaXcG7Eo511B3UdHI2aHYuOpXXEkQ
	arLY7Nj9MOxmDbINYQEVC6Q6e7E9RMoi6yBi58p+yoepOxl7pvt8Sa0JkbUTXAtY
	n7wQviY+8q/ed3m1aVUltLDbpDQIm4PL7qGf5GbxjgqkdOIcD3Ldatr6U46Z57R1
	fKgYcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyb3j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:47:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3d3fc4657so1567901cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982867; x=1757587667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLHQFn6pkMnsAa57RfPomE4K+Un5vLqC03X20SdqDEQ=;
        b=kZMVk+ktBfuLl6lm/cez+2Vgd8aZKBOyaI3jifCfKxd/tlwcYqay7jUbzN8ierJKad
         sAJ/91zithWmGSUtBvVEqKzhFFvnyUlq7VWK3naTSgyr1JATHkXP9kqnvUndzqcKpWG4
         GlbpAWtgpmQBxHojlW1lLdoQcKllJCoKdeW+ctO0wmJ5dfTm9nB2wHY0jMceIXIGkr9m
         LBHo1nzfzI0boIKfxLZAyseD7DV8Xm7UaI9RFFx0X6Uc2F2m5EOxZ5JuFLR4DVlZLqS/
         Ae+l/PD1p426S3Ou2DNe3raUYIli/xQfCmXdGKrhWZccSjJX+7CjHcukQe1oy/mKfbcd
         a10Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZLL0r7menM8sg1HMRRCCxIDBWp1R/pEApr0kuu56lLUz4Wnzzj5FdTkdmwAntkJkSEOci6Bh+Mhep9Hp@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCqIyfubczSlhwEzHactE2abmorNwYfg46gqt3OF5tgwfjvyH
	mCi5IelY69sDUoLKfxW0qfgMIgavcreXV+l7d/NP7PwmbqIfwBF1Yq2IBGltYwUmFY9QhSViz6M
	d5eb0xTcTEHYAtuB53ob9RhO9XJ3sfHCiwscz7lcaY8w4k1lR8pCIFoHfuhvOWKUbHrkd
X-Gm-Gg: ASbGncta+bmDhoiwLMuXM1iKA3oCGSlYimt4mphiMC3ljnPJ0PYdwySKwUlFsMdhdNY
	dbPGIWasmjyDKCke4OydS3JPi2NNFJ2o5SqMhXLDNeo6iQUzUsyAMdvHqk77msdRPL7VvX/G9r3
	14emsISiYjMNp2xfigfnc+0gU5ZkuSkFUYWzJedSWZVuDQvAuHu0p+QbI7ti2HG5xQu7VALT3xk
	FgjKxM3aGXNWpG7pR42XaIEx03+lPIHVv/i6raXrO+BssJoatvq17ld8rQO1Ug4uUpKfEMqevGy
	NSdXcZnyodcqwc/deN7GJhDRymvpFW+FDaSEIZYOwFWHLcPjO9tNeXQ0GPMyCWXhBOBlSjKEw21
	rM4moi27Ixs7WgzOA9Amh9w==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr34284931cf.1.1756982866899;
        Thu, 04 Sep 2025 03:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXASXN0Fwg00LcigTqQaOYYWJNuiGp81igsFg+arEoNr/lKhb7mhDv0j6dJtANX8BbKakqPA==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr34284721cf.1.1756982866457;
        Thu, 04 Sep 2025 03:47:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc51e109sm14011468a12.41.2025.09.04.03.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 03:47:45 -0700 (PDT)
Message-ID: <bf5e7ea2-9f0f-4d83-a567-028ffbe184bf@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 12:47:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom-qmp: qserdes-com: Add some more v8 register
 offsets
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904-phy-qcom-edp-add-glymur-support-v1-0-e83c6b9a145b@linaro.org>
 <20250904-phy-qcom-edp-add-glymur-support-v1-2-e83c6b9a145b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-phy-qcom-edp-add-glymur-support-v1-2-e83c6b9a145b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b96e53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=0CiQ1jBnox6ZqaB-0zAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OTWtdzC3ArJxKs5Sk4hv9OhWHlLIwyUd
X-Proofpoint-ORIG-GUID: OTWtdzC3ArJxKs5Sk4hv9OhWHlLIwyUd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXxzjviW2o8hii
 b0GiufhyN8f4t3k4Wslrb5/oI1f9GFzgn35oPNRq69OUiCCWGoCMQkhZp8x6tIXOqkbVqc+hxi0
 8/RnBqTU7euJbO1U6ZzbEUIT3BOym03ZlSvXEuzvSNnjOCAbJnyig8B5iE7zWWMYh7P3QrzY3dh
 Qz2gwG8Ry3aVeABGHrHgvYiXrCNQRmWNzEV3r3ZsJg9t/qYRRpgkuSz3gho0MKjLCBWZNm+NCzW
 vURSpb7JoRVF8CxDCOkRhIHW+c9ke3Ke+UOJYr2DG0s4QbVAlxbAIrkV97s9C3hzmsPMJjQaV5E
 A3BZLGbpyAkBnWSxNkJlS96B0o5jLsXvH9/IDnfNM9RyqOpqdy67jSVJMz0kJJsBsuQg6DU8g9q
 kP2M12yH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/4/25 8:55 AM, Abel Vesa wrote:
> Add the missing v8 register offsets needed by the eDP/DP PHY driver.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

+ a couple folks that I talked to about this lately

Please create a separate header for this, Glymur contains multiple
"v8"/"v8.x" PHYs that are not identical to one another (or vs ones
present on different SoCs), even if advertising that revision

It may be a partial match, but there are also stark differences

Konrad

