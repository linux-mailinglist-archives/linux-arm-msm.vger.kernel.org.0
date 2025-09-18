Return-Path: <linux-arm-msm+bounces-74037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51BB837A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 10:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E58A7B97B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 08:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E432EFDB7;
	Thu, 18 Sep 2025 08:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNG14Fln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E242D2EE272
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182967; cv=none; b=nURKtv/2408oJa/G5aQnDsEUCiIEGF35odRton1WQfNVM3cnD317XsfVSYla4sYtmEFJ5eX2t106AagX8jKP2y40owbIw6pznm3vsE1tQAQL66JW6rJZqv8fxuZI+aHcbaE8N36/WRfDEHDUjsEfANxlobROcjLsNCL2+UZZAww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182967; c=relaxed/simple;
	bh=bNRSsVjHraTSifvRPC86WNSgH9qdAgtHsEY2HL8mCSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rp0f3Sv/Z+uVQZxsY7EaH0tNcON/Lp4p2MNcHaIutHiNQPsJDIcEHOAH8WL18xQklkGzA7JJTf9+RdyQYw7Y/FBKJ5rbrKpvZe19+SIpjcnWQRBIn3l588yqafd2jpZzlvx+Sq5Fkf5ctcvAHA8haGdOR8lVZnNnUPZnnS6VqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNG14Fln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I0oeki003563
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 08:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJA7VAffYY4Y1JcP7y8dr3RF6SvDCYE2JBAiVTScq8s=; b=TNG14FlneGPjGZIk
	rU1SOrJfefZxLUAGSYR4v2EUICihsjWgtgRq2182wSyl47USJ6hjveBTdaX6pnn+
	bPGaBl25BHoc99wkkkqf3ZjvCumoDMf5JuzTg/AsRJvQ2oj/zNGxLkMR2FpqVzD1
	7SYgiNXfOcoeefrEFT6Sr8pwvbkOkD+0DouaEPckVl+yUqZPKHnroEAU4s5rMowp
	12EKJska/lmDEm0uCvEoiRIBJHY1gX/ebd1tth1n49PWFywSQI+DcLSNDpj65w7P
	k0TqzdyOAXGW8pdE9OFmkp9+bAgvSZY0v+TVXqBM3kT8cW9vcdDohRxgYaMudxgC
	X0tvKA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgu27k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 08:09:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78df9ea0c9fso1484256d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 01:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758182964; x=1758787764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJA7VAffYY4Y1JcP7y8dr3RF6SvDCYE2JBAiVTScq8s=;
        b=JacQEyxHUVSmAULt3hFk+U3A3Qp5V8kdkbDZhCFaOKWwjBqhlPwzPI5x6P4PjSFPyf
         rRx504d5eBI9kuXJ3Qx7Oy5XXuUQgAgfhfNRTNctHjSJ/CF7WEpRTiu7RIICxC//yKiZ
         c2tQlCCXtx7SQsfQU3D7cyZKfKOLW2RLod/aNcaUkrdRzGR7/TCKSAYOQzVwwfEFwgkw
         muiYB7a07ysjnl7WlG4977H9sAIkkQ0sPmr9f0BUIhr0WlsyFhPGrXoEH7CpdTkmmyKj
         epTcK2YyVTpQEwyogCoYisbbQBGfmdhM9ea8eIGgXvDG37+DtfphHu4PFtam5bh9cv3p
         Jf5A==
X-Forwarded-Encrypted: i=1; AJvYcCX9L1NTpFLVG289CnEPw0prn3GKOvUmtXlgVHDuuPSOq1tEaZps8HYd/8jO5H783I2WBlGqa9Xoa6lusYp/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3OVQhq5Vw99xl+GQ5k6T74ovwmiohWHc1VIzWvrFPdM1nYLk
	Hg58uW9X+ylT4vVkSOvrdxBlvlzjHKMALu1ucd9dKy8mZ+T1Q4+8XcwjPhNDHePdJ7lvNpfUmuS
	nn5YLNhVoLK+vL7M09eyXHNwzvYJtfshO3uUpVMSv1DqxVQemKNhiIVA6JhLhrBsrSWbQ
X-Gm-Gg: ASbGncvCrwnKjWgIG3TPr+vsVd5sR7dYuNHIEeuNWgQK3SE1dqOt1UOPaicRjerL4pQ
	kK2RMBW1P29iGZLaL2CyQImevJQgmIivsqQOra5JKHBu4SL07EsbxCFNvZvnvbo1N1BXIZ9R715
	ylqnpHB45Vc/kaSfrsTeK61D/q3lzT9PvVGts0wqbkS0w0M1SmAazPvjAnqab8j7ASR56KEIAiy
	nMYT70BKnTklyeEsJ5IpsHIEHblUSOxfidWF0N4tjUMbBVpHDr9/7q9tHy6rL+UmTeXa5q2BHKv
	R/Phd95AQkrkIuiNxr10m/T3N/7/zldPVQ894RV5BE8rYi6yUS35R3PRx9DGuLypKy/gf9FWIL2
	BYLk7lFX5kxgPFq653hg3fA==
X-Received: by 2002:a05:620a:4686:b0:82b:3e9d:cb4a with SMTP id af79cd13be357-83108b6a5e2mr366846885a.6.1758182963572;
        Thu, 18 Sep 2025 01:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4IK/Hv/LU0FDqkoYUbi5kVpSfI5NaF9URUEdirRjUipWlQyY+BY7AigUdhaAwEFPtoF+gSQ==
X-Received: by 2002:a05:620a:4686:b0:82b:3e9d:cb4a with SMTP id af79cd13be357-83108b6a5e2mr366844685a.6.1758182962991;
        Thu, 18 Sep 2025 01:09:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc73ba1e8sm140635166b.31.2025.09.18.01.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 01:09:22 -0700 (PDT)
Message-ID: <c94f8c86-625a-4c88-be9b-b29ddb28aec1@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:09:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org
References: <20250917163534.832523-1-loic.poulain@oss.qualcomm.com>
 <a3fkaue7vbh36gtvofkuucop23spupytjwtsuh4yq6k2rznf4o@fyfw6mi6lqol>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a3fkaue7vbh36gtvofkuucop23spupytjwtsuh4yq6k2rznf4o@fyfw6mi6lqol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a6KQloBhc2hC7spsW5G_00W5GD_z10S8
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cbbe34 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=yc5wwUi0_VSKho11VZ4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: a6KQloBhc2hC7spsW5G_00W5GD_z10S8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfX3Tj1WDgxkueB
 SA0SBRJY0T32CWhXx129ZnDM3t43QWQf9w9d0e9cJUhGms/v4FtN6/n4C+TipqZZzZyO0uzhBQl
 KLGB7XW8ozNRYlVZVNIWq6BFV8fRwrBBYopMHJo715xED8xuWQcHnIt3cET+IH6dG6aV+pmJYlj
 XXIJsOxPik0WV4MPA2fpyHrsCct91Oj2uxcv8556O8IzEryiF8Fzw0MpBdpvb5wvv5A9borREoN
 2cyQ4wJn88wK0yOUCFlteO6UKdwIYfKJ3v1jagtDHelV506KdULh0pYjFyECv4Ap0U0za6CduQm
 NrRV6mD6bgeW72ySkLGL/HGilLM23kDvUBRmkaQXUl+dQ31hdvbVL4DRowW/pg73iDtAN05eYQK
 boHUNVwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

On 9/18/25 2:42 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 17, 2025 at 06:35:33PM +0200, Loic Poulain wrote:
>> The PM8008 device is a dedicated camera PMIC integrating all the necessary
>> camera power management features.
> 
> 
> According to qcom_socinfo it's not present on my RB1 board. Are you sure
> that it's a part of the main board and not of the mezzanine?

I don't think socinfo is going to be aware of I2C PMICs

(except maybe cases where they're the PMIC_A/B.. and critical
for operation, like on certain IPQ SKUs)

Konrad

