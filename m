Return-Path: <linux-arm-msm+bounces-56172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B316AA3A12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 23:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EF534C5626
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 21:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C8626B2B1;
	Tue, 29 Apr 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxv5evRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56426A1D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963096; cv=none; b=sT77NvhemUcleyaroBFhFrqGwVj4QYrIog5aa3TsqLxREEN1QErYlorvnus9ogJ/cOWMwMDxRiEUBRlOLsd4K1SglW88GAwh9pvxX+z+daTFE2D+bYMHkPoQ3D6J4IkN0gDX4yHND2zw7oTmfQXORUJwtxXTeDk4pjv20uzspA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963096; c=relaxed/simple;
	bh=qkHp5l9+nz4MH1uJ3GUPU77Td56tAw1bQXg8N40pIXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMNwiU6swVgCdx5Zm9u0Uor5PI1MMFvekDV1O5uGwjVVB8A8y5VytyYEBQGpdbIjwXOCVsAnwAcb3UQjoNIIa2Wq3jxlbw3A02LwcvIMntV7khMpLWicLo1T+6UA09oVxRs/VWrTjY+job/HvRd6x2mckhQaA47k4ZcmyMAcbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rxv5evRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLbDTI018244
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 21:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN6pjaM2etTBGja25JzheiP58CmaPRV1x4Pzl8D4/+o=; b=Rxv5evRzs7U0gFZa
	Y58Jvr8LRRYyRBVb0wvkgcfcrcLCQ2MO86ObiCK8lo7m41HSHK6F6b9hWrygDEGZ
	7SCYb24IWntAAT4Vowd3oOjvEghgr2VDu7H8+jMs8IFUCdmeBD/ae94PFm9B2oQL
	oki2d4F+qM7mNqng4AMekGQgJJdTQVWANIWNLmP1YdOyh6UjMVmMQiSfwPS7K6VF
	fftJyVr9KAiUH4UVl+EEXiTHHXm1+TlYdRI2OJXdSTV/BMzxuEm995RqklKCwGPI
	FELB6KZ9YyWfwV7ALLqfavax4IMvBrY1sJGhOTqNXxWJMFy2g9eGU+Cb53MneifE
	OpOD/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua80fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 21:44:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so113029985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963092; x=1746567892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN6pjaM2etTBGja25JzheiP58CmaPRV1x4Pzl8D4/+o=;
        b=N9WxtM20ab9hgwGgizBUaaXZfnfAZhgwIvuvZLYzCF4aJsy9Fg8tS/lcl3h9JkX6Gp
         /8a5PcnkaPrHTXtTvuK0RE46pueLXVF9cA0393/MbTU5R/Oos8edBnyT5d1KvWxFgqh+
         OHA/p8TA0rcrPRQxPV3hsp4FRvM5C1nMP3AtN3KubefELLgivxuBbF8e/4n0NZpT57Ao
         giO/iEuOXipxyMa//drNJJIaoaBKES4HjKO2Bt5IJhH5V7NdQsVCyYcHC+sGp2AaRsvR
         A2pYZDjIQ+fWwBZCt5+HQF30GyaI7CBGHYfdOiYlo+V7Obh73WdXJSZcx0+XVcHkkPm9
         5g0w==
X-Forwarded-Encrypted: i=1; AJvYcCXbNNxSNx2D+aNb66jjhCcRZU+x+k6l0cz0sh6xmMd4uwQ9USJvoLAfRbDjN4uwSdeVSMobkmgVWoJ5UMIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnO6avhJGux+4AW31le95hoFCEUx7VsEuAfEUt2SYhsQsG3Ry
	EjxWH+Vp65wHDZvEFDSbB9Wq0kD17Y9XG48GLDdmc9OWBTCw4NXEuq8bgESfQBGHtrA9ab8Ki4l
	C8Y8ycWG8FsgxLH4nvYyK2p5L9Bg/bck03w5Ir+QzJ6k+PfEvfHQzYW8BJHYz7BCE
X-Gm-Gg: ASbGncuH0koJVtT9EsDBgj/TfBOkevb+fDctUi6o8ZbDdk0ER6Vvdu1kI/zcTMhXPNZ
	HWbPVi/uNJBIjvI+mEkcLyjG8aQ+JbD8d15FSXaBqHIzlR9yEFHWEuxLGw0rzUSG2WIuNgVWW1a
	TheJVEkux4cEk6V/gEO1flKzn6sLy0w8b2N4i7dM0ffZfB6IWQ6cBSbZa2qs5op0F2L3sLfiy8n
	r3uFgFaz+cmymHrZ6tUBYXG1hL7w+RazRepTRk8sqkeZNj//yvZCC/blSjT/SiofHzrH0TThONl
	0KXGxT/VWnxY1TGZHF+Gx49GSry3RosEo3QRy/itgV9MlhNWi/Ey5OOUJ0igKbuwOg==
X-Received: by 2002:a05:620a:17a8:b0:7c7:aee7:b959 with SMTP id af79cd13be357-7cac884649dmr7296985a.15.1745963092333;
        Tue, 29 Apr 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4U0UKZFlmd3TBQNHJ/q/KhcLsN4Pb4aGDLUgdr3LZ9oZ/GjbmxIHPsdffiOjq8p8tlXQqVg==
X-Received: by 2002:a05:620a:17a8:b0:7c7:aee7:b959 with SMTP id af79cd13be357-7cac884649dmr7295085a.15.1745963091773;
        Tue, 29 Apr 2025 14:44:51 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1d34sm828131166b.185.2025.04.29.14.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:44:51 -0700 (PDT)
Message-ID: <fd1d1962-82e1-4b24-abe3-2818c0965a5b@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 23:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: ufs-qcom: Add more rates to
 ufs_qcom_freq_to_gear_speed()
To: Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>,
        Can Guo <quic_cang@quicinc.com>, Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250429-topic-ufs_sdm845-v1-1-faabce28a63b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-topic-ufs_sdm845-v1-1-faabce28a63b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68114855 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=YsRWGqPVQEfpbUtioscA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE2MSBTYWx0ZWRfX0Bt4IlW0UkEz KXfIUohg1FWfnnnxPhOtzagTgfLa1yz7X6QCYZwdahB7SrwlA6DrMy3u/pjG/hdmh22IgMmJD3+ FFYi5WsLrltX0dWFapxORGwXCzSvWls2aVkRV1UiTBr5JbsDuJfGmQbZv7VEH/tQf/98CyzJhkJ
 1DtKghVgJplx37hwApzPmmjOG+thr1Df8i0RsY5XWMOpjsr9kwmZ59vfmazvGakN/2naQghGvaf +FaQbJyvXBUpv7P9A0aA2fwKZINW8MUH1o8YBrrjlIALkXKVW490dxF/WA56cVxIR/trh/tFrJw mjjWVoV2SzBEr4zK3rlx6nsbzW9Uw5zNtXwFIpnBy9tkJNBAjvWiaqsu7tF9fSK2bxxDDWhuYZF
 093HpZSXsqQiF9YrsE44uPi3oNtUonehOYvwc3XmierhXgta4KWgoAzqkUQ9FO1cOmJ2HZ4V
X-Proofpoint-GUID: w4-v4R4is9bl5-inZswpMWGVekSTEo-B
X-Proofpoint-ORIG-GUID: w4-v4R4is9bl5-inZswpMWGVekSTEo-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=993 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290161

On 4/29/25 9:46 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Booting up -next on SDM845 results in a number of warnings like:
> 
> ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 50000000
> ufshc: ufs_qcom_freq_to_gear_speed: Unsupported clock freq : 200000000
> 
> Add the rates to the switch statement to make the check happy.
> 
> Fixes: c02fe9e222d1 ("scsi: ufs: qcom: Implement the freq_to_gear_speed() vop")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Please ignore, I was informed that the issue exists because we're checking
the frequency of the wrong clock, a fix for which will be posted by another
engineer soon

Konrad

