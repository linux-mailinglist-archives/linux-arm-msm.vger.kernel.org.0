Return-Path: <linux-arm-msm+bounces-85691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91352CCBDA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5118E300F893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EF7334C06;
	Thu, 18 Dec 2025 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlfkf5OF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcFj0Unz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCAF3346A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062476; cv=none; b=rZZKdfUuNUFGppq8T1Blm5uDmjMaK25JnpbDVoUmS8vxj8DuhQokraacOQwqCyeN6eREtn2sTuSaf1scmBCJDS2NSGI/tQnYkPqNkgB7pctVJ+zgoL/AWE91zlPsUY/JGsee2TVyqk/Vh/d/Fdu7Yodqhr95026Vs6gw/ryu8X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062476; c=relaxed/simple;
	bh=S8D+P06PB7aRecFLdpg3DssFWrb1K6ZioPew3WOjjco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0d1e5WQdh3wlH2VIMYi6CyQTFrTGoKpjRy1VNXx972qEeK2CvD4ioUaJ5X8QapwHujQQg4JJNKN5MK9/ezorzXht6zYszYPTrkVYWWWpzr8zYRww1JXImzGi8dnutN7lIm0dsDmEk1qlz+UCNtWcTmEZUBwo9qMacFoNePxbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlfkf5OF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcFj0Unz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB5Ydf1335080
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vX5prLkY5BGuM+9/a1o7xlpGpF9PMMfKIXmz9Il6pQg=; b=jlfkf5OFHqrOw/Fn
	aEdsdPqzNCkYP22n2aacZmmVjRTbk7Iph3rHZy4RdqAEprqeo5AW3SCwjFMeBVVi
	ZG8Y3xrp84TeNHR9dTNUuGr63Qga3i4qqVjcHLHjtv2vY9ibgKWFUJbHnj40KOUy
	H10PCwjspBsIjb++sYpiAV8RjCQPCqbuGfv0zArN/nc1PeU6w202D0XTksllLW4K
	INPuz1cH5qGP15ARFbjPG7TSJa+tg0+zTZ1zZ16YShkQ8H70sY3VMGTqcMbTTvp1
	8iRhbvyEERhzEFOng4NRH3IrlmRn9NOksohHYj847+MiB/MZt3HMxlE9NRX/QzKv
	srSMZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec0a22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 12:54:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2fdf3a190so10403585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 04:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766062473; x=1766667273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX5prLkY5BGuM+9/a1o7xlpGpF9PMMfKIXmz9Il6pQg=;
        b=BcFj0UnznYJ1TpZhfN1U4GoWmudkrkGVV265uj8I6ttqa+FmD7X2vPeV+h+sncPqXA
         Wt3Q9kmGvXPWE8sizDOr0gNmunqS63boAcBY0MKR6JhYcBV1iXDSsg0A6QpwKgeLWC73
         tRMDt3On+VOb3qhfddYszYgM1qADiY0KJSwfdVTnSgQBp0a6tEGflmnGWnPAoQBju177
         csSoEiRwFgX04QTFoJRKk+RwyeJ01905Oe81pk4lTkHNo9l4NzD5/705BbUVLXWFrsk/
         cS7mFyPiSgrVIp19uYCA+m/wdZoRd325haSEVCV3T4T1AZASlFTknT3Cgh5b+QSeL1j9
         H+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766062473; x=1766667273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX5prLkY5BGuM+9/a1o7xlpGpF9PMMfKIXmz9Il6pQg=;
        b=h9nSNXH+kU/8eTOYUJeI6bSRaG7pzbQE6vUYiYRELVa2rtTXxSGxXfa9byH6iVx7Vr
         SiGZbudzsoVvUSE4GJy/xWgvLcKlpX7vbcclKKB6N0uCVihADGRIZHrQhn/JMb/OCmr1
         tDAwvwx93DPFGgLzsv0G1UcYs6Mnjcy6srMGQra/qFLzEhtTCE7BhB8J9A7XwZd0SYto
         +ox/Rc0L2Gzva1gElyLipKPsp2GuuQUCvA16m1wv1ilQRDisPWjn/2y1r4r+61bo4d7A
         +YUgh4x0OTqiVm6PQ/wAyNT7w9OfV9PsOH0qBBox8180vLQS7yVPnsXgfwEuDQPBQ3ve
         gaLA==
X-Forwarded-Encrypted: i=1; AJvYcCUw6tBOa/MfeYy24DQBAlbDSVXL/cCmBXq3CHmIX0nVK/KRO3zr4tFeLIzM29mgA1UhKwIEhXpnwLRodwb1@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCXbwrw3/VFsUzffIBqSiUvTcxnoRCV0tG/JiEpAs5cIF0jG5
	y7PXZ+Aahriyig6lapkTgbJSW5y3Xe9irru9AYMV+OyoxGUL8Lpymt406iflxf6PYQIIGgBtZy5
	Z8pTIMUtxSfj/0VO0gGJrPg0JYappriGZ3/yDb6+f3ws8VLCMQzac5NzlDH26K9Ls3GNc
X-Gm-Gg: AY/fxX7PCcClIHPDUWIuUcKrPzi8X9h8lIfqihV/gwe+7j1eDHCZ6uRpSI6R79RXeE1
	TQWdLPkeWIVdOh6fobhrhmz9efVUGo3AkdlFUkraTaW9Id1UJaGXg6iIxy15B+VW3hS3b1kxjV6
	0LyjUteQsPnhkuA/MuJwE71UL7aTMNWW8Bnz8rlVPun6yjfCOK3DOW2gUm3EmSO5mlpDRlne+O1
	bfbypU1qYOLNgiVWmymJ9mCUD0cOriuw5cryxmx/9kEEDfPp7UnrCJxdIOIBNAyMML7x8fF8jaI
	5W/zOeDAeyQ/2exFbcaf63BZsjHB394tcPk46hwi6pUCLfc/auZaBWxIEgEIT1AIMAi5j3TeQtC
	+4/Z+/L9lKPtBJVDmLXE0QhfyKtOH+s/IYNcFqqOIjZgcbS19pOP2m9e6LudszDi6Rg==
X-Received: by 2002:a05:620a:4606:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8bef2e5aeacmr202673185a.7.1766062473116;
        Thu, 18 Dec 2025 04:54:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFVhNleIagJjbTmayjBVlxQUPdoMsqVJTwevIXX3mxEIJmE3AC7VrtbFRwhWh+AzDfrO3NOA==
X-Received: by 2002:a05:620a:4606:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8bef2e5aeacmr202670285a.7.1766062472712;
        Thu, 18 Dec 2025 04:54:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5889d412sm2452925a12.33.2025.12.18.04.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 04:54:32 -0800 (PST)
Message-ID: <b2bff591-807b-4041-bdd2-feeb89d4f7ae@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 13:54:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU
 nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251015065703.9422-1-mani@kernel.org>
 <itksdoavfha6xnozfrh5jcc4g75gcfyxp7ns75yz7xfb6wruy3@qwkcavvxrljp>
 <qzpeft3wmmh7idysviyevrmfs72oeoz3c4dddizfovd7ix7yoq@6vtqz5fhknij>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qzpeft3wmmh7idysviyevrmfs72oeoz3c4dddizfovd7ix7yoq@6vtqz5fhknij>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EL8w0ERxwBR9CQfSPVknOCox70qFAPyV
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=6943f98a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TZdRZBtRXuM2BF84sGEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNiBTYWx0ZWRfX7IXo8Y4va4Wf
 HsVihmjsFyYRblS9PSaoy9hcfu3QnJxEqhRtmN8QdR7CMsmKsVj8u0jml9rvyS8fyMX0pJ+KoT/
 9EFDUNfgw/tgf4FzJIrnNGX3rsvzBmYAfoOKYzFHXn8qC/CBuBQTunSeOGwkeawlMx4thfgv3wJ
 562w1wewo9AJe2eftAZ1J1ANRLdGmRsZD+U/nAH1j8MTPuyyEj3gUcFrWqvHa4WoApK90DbpXtC
 HL82aGa7iGJTnrwiCubfNSvC22/PfiL4Es1q+2N8SRSyex6ALQZt3KjNjRdWmkkTnt0w9GiIule
 GdUUFHJia4GoVvrnHSsofWLldF5dCy8kimCfIEg8+OPpjGwTj2lu1NvXLnT0DEko59rEM85B8e+
 BR4ccCRTbwlsJFQayhYil+ysgCyTSA==
X-Proofpoint-GUID: EL8w0ERxwBR9CQfSPVknOCox70qFAPyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180106

On 12/8/25 6:13 AM, Manivannan Sadhasivam wrote:
> On Sun, Oct 19, 2025 at 07:01:30PM +0300, Dmitry Baryshkov wrote:
>> On Wed, Oct 15, 2025 at 12:27:03PM +0530, Manivannan Sadhasivam wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>
>>> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
>>> '#cooling-cells' property. This will allow the OS to mitigate the CPU
>>> power dissipation with the help of SCMI DVFS.
>>
>> #cooling-cells isn't enough, the devices need to be listed in the
>> thermal maps.
>>
> 
> Not strictly required unless the cooling device and trip points are wired in DT.
> But I don't want to do that yet, and just expose the cooling devices to
> userspace so that I can experiment with something like thermal-daemon.

Rob, Krzysztof,

Would it be an overly ambitious idea to make #cooling-cells required for
CPU nodes? I'd imagine some sort of cpuidle or cpufreq is desired on almost
all platforms, which could be used as a cooling/throttling measure..

Konrad

