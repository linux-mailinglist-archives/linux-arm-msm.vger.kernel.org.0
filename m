Return-Path: <linux-arm-msm+bounces-41764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3799EEA23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E5C285134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193EF21661F;
	Thu, 12 Dec 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1ewZy5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664D21CFF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016154; cv=none; b=C1ipdk5Im6FXzLUJuJr+oSfg+S3TJs36SsoRl2BaQ+vLLMWNXxTMOgwaFKmgfW2sujZjB60VFeCc2it0MUSu0tcyteLVhgIyd8vh/kJfxfHL6fbXY8vyzVH2lEWfBbG6OSpQe3c8bqCLOtJRUuSdziQdvoZBkyrXUWFxN0Qt2XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016154; c=relaxed/simple;
	bh=kPKepROpxS43D+DUd0rMsLd1XyZAByT65j1DYkG+a58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3vbyxSVP5iHGaaSh+uGmSXSmHxcaHJHM0lfE2uFw2zFp3ZenKTdqxsxELIbxFZVe9dgAIkfgCl3j65yP36F8BMxhMIORWZ78tfWYVMUpyftODnoxe2NPwdPsQUG88X9/2zwI6zULgDvZ2jMNswTCbZJHvqxb4WlY5hwlazeBmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1ewZy5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7FArq002866
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWoZhsKROhJsNL7oGlk/RfeOg6LjV5292KaV8g0SxpY=; b=a1ewZy5DVCJIjH9V
	uaijHdv4TIFF71k0DvPnL+w/59CidACoz5JzfHKFHvIvzZXpquil3ziITjjLrF+e
	xt1WsRH+ZGZmPFiVigSRozrlIo4gi9YBDr01tGkyBmqpAq8RJEX3bZ+LBUbatMZx
	HfzkcrF/ymczqRsuCoNmcV4rKvd34lWjhNXzXY0TyoI7EJquYhV6ApRH2PJK36cg
	P4fgMVBg+cAPfRgYz9nuno7P62PPvabaUPjiXCwGfAEFD6REjTHMhLdP13P5Mdue
	eRDs0H+MccrAYo90jvQfLTzPAyv60ddwsBrL4x4kbqbEkaa4co7mIdtJcCuZqYuf
	pixqbw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9wtgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6db1009a608so322706d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016151; x=1734620951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWoZhsKROhJsNL7oGlk/RfeOg6LjV5292KaV8g0SxpY=;
        b=XmojmBVyNG4hrIEMWto/Teiv2lrrSBw/mYYMJD3gV/C9HU1oUqtLENQxmKGsf4n2no
         p7YOB7PJ0o2oY592/F/WqJL4VdrZcaIdY/CGSbhqmIepNMO88SzoIoqlwiZfLPlX19hU
         +9DlEyy/rGNCj8/vgZ6ls2CTSL+h28wJQs+faJeqL8foMtRwMBuuavV9MnscuilT724p
         p/5wKbfFSIpsTrs1kSFN5afZC8nVr8jzs/hoHVKrC1t05nC5pmhvG//ItO9tZhd/+Iky
         0Jtp1AfF4zPsex3AjGCMtN9+PmVY2uqnyZceLipv4SgjT3fLIMILaOPfDs5B4f/xBQUo
         2VDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdW2dXeP+DFVtzZzwFRMvYI6kkrI68Cdy0m4DrAywYzXdrECXPqvr9Nu3xA1ij9gEQEou8GJmO6mdj6q8L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/AtQlF/72nCOHZHFi57UJ/bt1YPBrqwkdQvAQ9kmXn6C0Crqf
	gSCxly4WEcQc8dAqJWLree9IMx61WDOE0QUs0Z21tbJv0qhnBn7OZNwDzu9uxuEnlR5A7IYhQw8
	EeYtLb0x5iDQIIS9M002Os7JjyodgF94X7keS+EEitLFnqJwfRpYV6HDUqEvZibcJ
X-Gm-Gg: ASbGncvPNld5wMSl/0sMLYF4jjN2z9Dwd4VYC9wGynRDKHNBEuZG2Frm01FTpff+gy/
	jF8azbI47bdSfpG6sI5VuFdXC9ZdwpUbHrjQ7XN+p+qIFYe6RLke4U2IFH/JdsU1KMgcofx+nF5
	AWWOtS3h1K5JHh3H8UG/Mq3xHO4r3+PXyvFJXJhe3++xVCOXhxGPb4SqbJN4BSIb7q/rKXl6ofE
	DFyi4Uq/suqpWAroC+ecBqClxbqxnIgU5EuPqxx4T2+a00Fh+0MI+0heYJKHCBROkH14q8AX5ha
	VWvTmWJnEF+i9bziB/EmlEDETK86GdiAPrNQtg==
X-Received: by 2002:a05:6214:3016:b0:6d8:cd76:a44d with SMTP id 6a1803df08f44-6db0f5cda60mr3223756d6.0.1734016150323;
        Thu, 12 Dec 2024 07:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFObVItKkexRSdtaJh76BpL6TAUzV1mdsNNZuTKmUGMDVCaT/aEhe37aNaCPzag8mlH8Apb+g==
X-Received: by 2002:a05:6214:3016:b0:6d8:cd76:a44d with SMTP id 6a1803df08f44-6db0f5cda60mr3223566d6.0.1734016149953;
        Thu, 12 Dec 2024 07:09:09 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67cd1e82bsm667249866b.53.2024.12.12.07.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:09:08 -0800 (PST)
Message-ID: <8a684eb4-c824-42d6-8070-9c6b3d582b77@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Enable external DP
 support
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
 <20241212-x1e80100-qcp-dp-v1-3-37cb362a0dfe@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-3-37cb362a0dfe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cUzDtUbsnp3flHe75cl9315QlDEP_Urg
X-Proofpoint-GUID: cUzDtUbsnp3flHe75cl9315QlDEP_Urg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=734
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120108

On 12.12.2024 2:08 PM, Stephan Gerhold wrote:
> Now that the FSUSB42 USB switches are described, enable support for DP on
> the three USB-C ports of the X1E80100 QCP. It supports up to 4 lanes, but
> for now we need to limit this to 2 lanes due to limitations in the USB/DP
> combo PHY driver. The same limitation also exists on other boards upstream.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

