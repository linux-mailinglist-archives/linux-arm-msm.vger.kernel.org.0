Return-Path: <linux-arm-msm+bounces-47203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A54A2D0E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF296188F489
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971F71C5F1D;
	Fri,  7 Feb 2025 22:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ+oJS/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB823C8C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 22:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968442; cv=none; b=lTwEduE7SrVR1KQIhlK9wa+UR7iS+7ElV4D7CvJ768kNwK0oKqkR0mjK5ERXNOlymop7Dy4R5FohhO6Tpj7M4iMw5k40p9g5jtslAtlbfzKldkgZEOtPXV8S/MTIXglDNHzOGzCVi7TZJPSh6D5dkf18oYlp5h3KHvW9DK5MCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968442; c=relaxed/simple;
	bh=Q1fbi3F8LKnBa1vR6e0w8SK35bgu0+iWdIMrLyuScbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXMvpjNUrplT5oPtDaCdbxzUG3sE1t0vBuMgiNcbcI7xpnqDI45bNpNxeIOQz4y/2pgwJ030kOKI3zuNqLdI9zGIipCTcj0W9OEOWPA2cAsh3xHitddhBXyPQ93NQAE23BeoZS4W/SCmfocHogBzo/TKGKLUbbR9zm3lmElz3Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ+oJS/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517Fs0Xj004887
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Feb 2025 22:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSfrT82LSQv1cmL5Q6NuLOzNcusRp2aoe4uqa6zAbDk=; b=hZ+oJS/wbJgwqJBl
	nyf2cAtw3hj0J0dYY+QaMuFSG6sVkBGmKo5JSCgv+HNmXu+OCOm6LVDnAOIDrNBk
	Zwnm3lvIhAka2ikEuLSrVlsB9YPq8CSW/gvN77nvjIzZp8p7P0WLDFoCqkze23Mu
	HkazSrVSCvVr3/dyrggSKeQo4UVWWLK66NrMTE2W158jd018dNEpHwZNMMLVEAyQ
	XSJXAdUns4rHpOR40ZBDOV30M+Bn9OOZTs1vcByoQS3kFMdkOxNHV/X7GEjPz52y
	zbx1XO/hME/l/sN8b98DlnrpHvLBJOxHyd4BDWo9iBX4p417t/j5R8s8Yg5xsUWh
	ffZF+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nn7frwkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 22:47:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a0d7fb9fso4023321cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 14:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738968439; x=1739573239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSfrT82LSQv1cmL5Q6NuLOzNcusRp2aoe4uqa6zAbDk=;
        b=r72kqPcTCfAcydYXKyyR4w5boOEnn6Eelj2wUgDnmBWH++Xf2qH8oSrToTJyw7p5ub
         a1pOe/sAFnQlTRJ3relvjTWkNQmn8eptTXcFwaRpUBdQU6aaxE8lCkJH7rEN/XA4onZw
         A9EH0do20Dl4K1AX+eYRn4lqGEgzQzYz3nw2JulMW5SPqGzEqnFErMvG5ihZb+bcNTMZ
         gfqDAyKABTIHwKi22r5NPCx4Z0W4TnxHnsV2zsGF5evrNTlIYbJvXUYwPsvLyZr6qlMj
         RTcfzaGG0dsRzpt3hSvrhD8vzEP/c5i2+c53CM0sk3I1OsK3EJC6QAwfJW4c9h7T0aUT
         PwXQ==
X-Gm-Message-State: AOJu0YyZkdZipcvfHbntMLke0GtWGaipTvJujYe4UsrY1uvkHm/du16l
	g/kplYPyvsrftkxO83UxM/I0Sk+VdyboO9uZzro9gBlhPAraD0E0+dQJASu4AlkimkVgAp/bq+r
	1DYOwulCemTdOwIfFoEEczXfqRU8sKv8jgbbvXdPqzduqQHjo28ic5vYBvud8e0gE
X-Gm-Gg: ASbGncsNRcpyhM0cnOjMz0+mYqwp8y8XseEei4gKWNWR8ja5EaOmPNO+jnAO8fP5GUN
	YTp2+NBsrQ8LxJ7TVJo0zdqhwZ7+//OfucErxbYycEwkEQOys9O7HxTqVLmhr40DWHyVIEhBtgD
	tdjuvuuFxUxewE5+d4sGdNPF/bN5ANUEC35A3xb2+BfSe/EC6gUJ1xL+bNDqDqNFZPNXM8K9qFL
	TwyxzeuIFkJv/ANZMRrNYzcZfnmKpVsYK+U0WCjgQeSan3jM8e/rf1seJC/yPMUnzDQ/Gf1WDyg
	kAY6LZWBURGfxq5xViMGGNwQNDAnKn8U1kd3+MI7tswCImYGSv7apXAgNIQ=
X-Received: by 2002:a05:622a:1b87:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-471679c7d79mr29186341cf.3.1738968438738;
        Fri, 07 Feb 2025 14:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSsJAkiNdMntxbj6WaJ97FcSyVaatuMmgkKKnf1mFsTb8a3C0KJ8abaktCJbg7NroLAnIrZA==
X-Received: by 2002:a05:622a:1b87:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-471679c7d79mr29186181cf.3.1738968438388;
        Fri, 07 Feb 2025 14:47:18 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ad6fsm3197436a12.18.2025.02.07.14.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 14:47:17 -0800 (PST)
Message-ID: <c6352263-8329-4409-b769-a22f98978ac8@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 23:47:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add UFS support for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h5josySZ2658ozQQiH-pW1AsDks-ffXM
X-Proofpoint-ORIG-GUID: h5josySZ2658ozQQiH-pW1AsDks-ffXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502070172

On 13.01.2025 10:46 PM, Melody Olvera wrote:
> Add UFS support for SM8750 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
> Nitin Rawat (5):
>       dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the SM8750 QMP UFS PHY
>       phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
>       dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
>       arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
>       arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD and MTP boards

You still need the same workaround 8550/8650 have in the UFS driver
(UFSHCD_QUIRK_BROKEN_LSDBS_CAP) for it to work reliably, or at least
that was the case for me on a 8750 QRD.

Please check whether we can make that quirk apply based on ctrl
version or so, so that we don't have to keep growing the compatible
list in the driver.

Konrad

