Return-Path: <linux-arm-msm+bounces-40559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 343659E5BA6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 101671688D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7C922256B;
	Thu,  5 Dec 2024 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTv9MVdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769E2221464
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733416925; cv=none; b=It/nJMlvq1lPoU8pWUYaMJVJ2wbUlaXJ2uZb7k4Hu+Pfg73vQKZCB/9Cj+jBCiLuNBMo+T6nX3vXFaz6yk3S97KB7+zHdAGvmQFb5bITFy0OGFeX0kV5C9jPUx8P5r+TnedQzvKhpzKYLVCB6zp4xCqFTpktDYZA6zvQUksDzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733416925; c=relaxed/simple;
	bh=jFEMWbR0VhaeTPkf5GJbzyeCa7aECzmYDLLXPPu74Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFsHWcLnCayE+zXsSwyUauR9n92u9HmXiJ//64d5m4ZxVyKQZy4E6YBWCYXiLt372FXLKTY+MMVIkFN+3tXDatFj1Pdm138LCcs4MiQ2wYFXvy/ey7tSc2ilIh1LHjRzC/u4tQPBI45X+WsfK8/HXg9hAACg0aT6QP4Kp4N/prU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTv9MVdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5FEmlb003245
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go+snB4FH6pFEZCnjdkBfOyMv+1g0HKMFcvMCjUYGfo=; b=JTv9MVdttvaQVmrD
	JMX7FLwLipdKJvDwMWvd89CnYL6Ogjtal2GPGOBv4CkdCI3D+xQ8G4ZIQdEdJ4Fi
	nvNxabMb/GUlLej4Nt+cE9i4mJhx/n1BTBIPmYQjrTWRE89L85LA6XJpCYmuKkIH
	VafpGfilJsNoeDVbFobjfYC6V0MGrYc237emc81sRQgnEC43EU8g4q3w59adLRhX
	qKq6XpCvZnhIaTMErgSZy6WE+y/SgXABgb8Ghg0T8b1vlrv4MkkTCdOa/F3z38NK
	Dr8b46lZHoYnbfgzi40nlVfsCI8JSDyVULinfYad6+DH1MLuH3iBJqHPEWB7WOPU
	C5KxwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben888uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:42:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46692fb862bso2289941cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416921; x=1734021721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Go+snB4FH6pFEZCnjdkBfOyMv+1g0HKMFcvMCjUYGfo=;
        b=wuq/rWOZc2rC+ajIq7iqu7CNN4YCuDBQbu7TaWYFBiOB2t+vwq32xVc3+JnXB3Br+o
         2ZfHi2bE7D3Zw991FkF3gpS88MN0Pl2u+tG2Qd+OUx8yaMx+LZB87hyYuT8bDG0Ga0Gd
         OhapyYk6gNtUyAOJ9GW6C9OMm+dwIY9zzfQwIlgk++5XJkXkrgKHsbuiwfl/sEulZm6G
         51JNnx0bBhpciw9qrUD0gedfmErdj16tgPga7XssCFsDyugiaqkew2PJkH/SeHCMFART
         x3w3GNDOsaoVeUOOfnb2ZBQQgP6AxpswB9oL5uYu2DD+kmVntweEpE2WQvOILSnD/+Lv
         JbDA==
X-Gm-Message-State: AOJu0YzJZ/PGDkV3ENXlP0fpEsxbJBsB83CfWkQtt9AaFjHIQGwB91Vw
	vnFqlqyl5KEsG2wXv4ldtZ+8BavGSlMYhgoZesB3iS1KicKDLcs+6klznNXLKo5yyk7EGLDXL8K
	WjG0vz9PDKDy47BmSwHg6lQ1RZfhjNjY0PVHaYv1bglmfLXuxZcYwcM54euK6wCz43KBJWv7y
X-Gm-Gg: ASbGncuB6wMP3eMMU8P2OXYSs731c1+/pKnvu+c5Au3+v1/bwNWPxvzSEK2nDs+Hwqw
	JfDhfLBXmCRnriKZfSCQUZf++uvkSqZh6asZFw897MCuKDirJivvKSHeZ1sVMEw7AkMTF+7wE2m
	Ud6e41yahwHMbURxU2v+D5qYNqmXlMHcyGUqyfBBFZUfL7UL3KdaeVzXNyKxWiQuhxN/5vRM9rU
	WADkkX+SS3UmoeHoFFrPidhBNbHiUU8UrdoD1GeaKL4s4j9gvohtqvCaPOSO7ISXco7FgLTXIaa
	YbFMY5nW4peLtMveswdUwh0RxMVkUaQ=
X-Received: by 2002:ac8:5a11:0:b0:460:fe2a:2311 with SMTP id d75a77b69052e-4670c372ba9mr71128571cf.7.1733416921281;
        Thu, 05 Dec 2024 08:42:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV7SRkAtz3D9vcQvS/ksz/bMCqXlEy7cy7fYGtzD2n6lH/UZBtIGm4GJI6vdwH4FYNiyJTMg==
X-Received: by 2002:ac8:5a11:0:b0:460:fe2a:2311 with SMTP id d75a77b69052e-4670c372ba9mr71128411cf.7.1733416920949;
        Thu, 05 Dec 2024 08:42:00 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa3besm984232a12.75.2024.12.05.08.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:42:00 -0800 (PST)
Message-ID: <0aee7d2e-37b3-4130-a090-a40773638871@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:41:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/14] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
 <20241205-starqltechn_integration_upstream-v7-5-84f9a3547803@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-5-84f9a3547803@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R420s0tGfHrfUoOq8WtbZtxDfznteHgn
X-Proofpoint-GUID: R420s0tGfHrfUoOq8WtbZtxDfznteHgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=618 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050121

On 4.12.2024 10:34 PM, Dzmitry Sankouski wrote:
> Usb regulator was wrongly pointed to vreg_l1a_0p875.
> However, on starqltechn it's powered from vreg_l5a_0p8.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

