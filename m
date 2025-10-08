Return-Path: <linux-arm-msm+bounces-76402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E7BC4ECC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A5F9635230C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DF0252906;
	Wed,  8 Oct 2025 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTUylmez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE925D1F5
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927505; cv=none; b=UKnzL8pxSxYNYiejIT/Hx22hILLYUwGDLT2gRsdHuBhci6q+pEOIqauIFi713eRcy4XVnqUAmr0odS45phkGYaAtiCDSZgtAYUlboOKUzpixMVsFiUcHp4x0LnQdrV96mKXi1GVuMQpC70wNo3eBJSckhXacE/IGGPfow/7gaP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927505; c=relaxed/simple;
	bh=r3H8Lglxh6g+EZJFP80aL7W2Zh4kLp0qdaNdNibtZCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dat8ScSCrkBVN0wST5XXWvTD8p4rvAoQMXAIO4+kYtcs/u+LJfSNw+dTzbY93YikkVPg85wIvK8n5lrSPYT4TTx+dntK6oRZ0jhXEdyjYW4jNPQ5PzshVGJ8wefTYighne+6Y62mKSwk4gbhognLHmRUPUCRPT6d5AgUUQr7OB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTUylmez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PSW014216
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4SEeZvSbrbgqu/r4DhrYahbkVZg9swdS/wxQIvKWh0=; b=CTUylmezdCRBVdxV
	6ycAzcUxgxndHMywcVRqAlaItVvxpKfoo+fovtBgSU0rgK7jA2qb8q1Q/PTIxipJ
	ra03yv+Vn5hnHQdJPgDCRqulDlCt2wfYoFwC4CzaefYpCMrmxeJym1ju9Iddmlr1
	GwaELSSVJVRFc5tk+tZRW/arH0F9v2m7aF8gMGdhqLAPB5GGPQA0ISYzb71Xf7/o
	ACx9KBZncU+HQ30b95aXo/rvMtlGQR+Kb88cVbe3/YGc87aIip/GykmQJtHft5+5
	rdWxXeyuiMaq6PWljf1eh1PDj8LHtmh3wxcyjT2yZaTuQdWHFFh/TBU53+GcMXic
	9nY2FA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0p8cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:45:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-873eac0465eso27286286d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927501; x=1760532301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4SEeZvSbrbgqu/r4DhrYahbkVZg9swdS/wxQIvKWh0=;
        b=UqHigWfb1glYHhh2aiSe+LVUlusHiFgBUSQTsXwPgwsT0xOGvZLBveJzy+FOoitqLF
         R25Q2bAbgvrAcNWf2bP8geMWkMwDl2enflRbcCYbQiLI4L5iTVRg15ZV24CGOrFqFtMd
         xyOr78ZUwQdDY7fmeHe4y1eY+yaQtV/HBMDVS2b/TFptivVm+GeahS/8103MUkka2CXE
         QX1Qx++l4/J6EziT2RSHj3i8WaIsmELr/HwlVUIj6S1jItY0+5+lP0ah2rGtorQ0YO2s
         6NZTgeHtjV79tw8HWDl7a7kyF6ldmsUyUB4UjwPsm0r24RyhyXfcFuyHxgMiAenmk+Mi
         K8TA==
X-Gm-Message-State: AOJu0YwDlIFIz4srLRliVNPlFWYQ6nkwztGQIGIYOvYpiWorH3HMlQpQ
	ZNHeYpHQcjcr8bNzKmyzJlWFrcWvshXR+XFLaZiNi+bdpbWcoOG3AS2B7XbhfRmeh2oTnaIakUV
	oRc/jcKckIgjBg6tU7kY6eXq8AGDwsVtIB4YJTv3e6Q/hOtIi1LWENIScDIEO7LrhZYgn
X-Gm-Gg: ASbGncsLWe4cFr6iMS0KJkefoHkyba2twYexovKEd0dWGenE3BIzV9A66ubJw+Ng+tN
	Y87JIkm98uX9uJeZ7G+aNQ1hl8HULq9tL5iK6WDc1fQEl+BKqPIJX1EEehx2qhE1hrrTz7GgJAL
	xJxuPhYR7Q8zDlYJ6LrJmuOSyAL/daXS0NeaQE4xCH+St+RPJ1cRU+YoA5mb+XHWaXw/dWMbamc
	54PNTlkRcxUucX3hwbNR5rHXgplyNQ/4j6NKlSEBPil60EWjQYiW9O+x+xUe/QMp2ekWVaDCq6u
	8k4FCPq9k+m7J/Mo54WFbdS7jR8O0DTkcaS6GTupPvlN4WIEduPmFovtk7Aj+rBfPp4HLhzSM37
	UC3CSIWZhL2Wnkg8Hc9P+H9tLA/Q=
X-Received: by 2002:a05:622a:181e:b0:4d7:6c8a:4792 with SMTP id d75a77b69052e-4e6eabd0e13mr30200091cf.0.1759927501509;
        Wed, 08 Oct 2025 05:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbnUKO/zYDB9iSF9ESa4QTwR2bSSu9bQ/d2iHEFREb9o0Vh2se/SdtDCUQBFmHWqDx3PMGHA==
X-Received: by 2002:a05:622a:181e:b0:4d7:6c8a:4792 with SMTP id d75a77b69052e-4e6eabd0e13mr30199841cf.0.1759927501088;
        Wed, 08 Oct 2025 05:45:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a7ee4esm1637398566b.28.2025.10.08.05.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:45:00 -0700 (PDT)
Message-ID: <20cb3921-1344-4e47-864e-ea99759a1dad@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Update regulator
 settings
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        tingguo.cheng@oss.qualcomm.com
References: <20250919-b4-rb3gen2-update-regulator-v1-1-1ea9e70d01cb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250919-b4-rb3gen2-update-regulator-v1-1-1ea9e70d01cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0lzw_fMjEoyoIX00AueYQ906H1tBm2OV
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e65cce cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=slaDHjbb3bi5TH5WbwUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 0lzw_fMjEoyoIX00AueYQ906H1tBm2OV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX6F3zAIq7ogiY
 Yhw/njUbfkgj3Cx3mvpyYlcEYf02VG2vrYtaMnzZUUcoWvqmfMMBPxn7zVcxFXIn4K4VDd6WdCt
 TmoFZQConWXBzilCIj6CsDfzBXUX8pSF7kOTHO4axfgsf9O5JNzGFu1kDvuM0BjCVZQfgZUg2AC
 5U1qQzWVL+ifyrjoBs4TcZKx65BvWLZKmX0HSt4ywsKmZZSm9Jjs6mujI7DrBUD6z0m/zsSCOf/
 nWa+0V/avo0I9SUGLkidgwTNt8LxIy3kqzaxpvOF1LaUDvBbzsTEx0XTAM9t7O+eiZLcRAcKC4T
 yi8Qecgg6K6vQrHGqHmnnMzaEQ2yndMkW3V6oPb3fGlr6u943w6XQRMx31eNHtcI2zAnqnDx6FP
 g6eL9ZG6TROn94v0b59ch9xUleKUBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/19/25 12:39 PM, Rakesh Kota wrote:
> Update min/max voltage settings for regulators below to align
> with the HW specification
> vreg_l3b_0p504
> vreg_l6b_1p2
> vreg_l11b_1p504
> vreg_l14b_1p08
> vreg_l16b_1p1
> vreg_l17b_1p7
> vreg_s1c_2p19
> vreg_l8c_1p62
> vreg_l9c_2p96
> vreg_l12c_1p65.

You should rename the regulators that have now changed their
ranges.. I'm a big fan of stripping the voltage suffix entirely
fwiw

[...]

>  		vreg_l9c_2p96: ldo9 {
>  			regulator-name = "vreg_l9c_2p96";
>  			regulator-min-microvolt = <2700000>;
> -			regulator-max-microvolt = <35440000>;
> +			regulator-max-microvolt = <3544000>;

This change is funny, no one noticed that before..

Konrad

