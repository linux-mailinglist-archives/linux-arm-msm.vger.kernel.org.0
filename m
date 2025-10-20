Return-Path: <linux-arm-msm+bounces-77989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8EBF0EA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CEA64066CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4DC2FDC27;
	Mon, 20 Oct 2025 11:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6Q3p+Sm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE7E303C9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960816; cv=none; b=k+uzeQA90Vs/NnollQjo0YAVUY3w4C/l6JMP+2tMcuRH5eN3Xs43+XrYHQyqzCwq7cWyHRQeTtAzjxANZYLMeXFUQ67gAv0KjNTwR1TYOMQj2Yf8daTz0czU+ilvsbpcc8yiaFa1zJ/g7hyXdBqUnJKIf8EotTA8j/SbZjYgQLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960816; c=relaxed/simple;
	bh=JFiozswb4GIwcHmliKn473FjPA/idEM/isbif6byJ4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3cFzuyrIC7R9RYT4cWFb7EF/BWmV7QiwpUnBo2FY7aLFnWpb2IItw46dWPK3SwBZIFnpo5nIt5TZr0Y7hE1QBY54Xo1harM9Il8hWSqIoYxDHJzWufI/KPQBcAyLuYWYi3+Kx+HWL1GBuvjw+xv91AwbMdhUR2JPXCe+RgoL14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6Q3p+Sm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLOMQA004086
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rm6MWCmMyPXrv+yc3ILYtdzHGcjXJf3gMY4k9S9ZBr4=; b=m6Q3p+SmEku7qT+Q
	p72G+slTEFiw2gYOI2o5MzZYVzlNt6dyW/mOHHVpOcuYr0RYQklGgWaqpojzBmRf
	OJs93sX2BXAoNc83bsmlHueMpVa626jGox5koOPpQ7iRbPQu8YPF6Fqmf1+0Bzk0
	XuYHTuoNxHpqGqPhzUbqqdQr7PmI6oI1e9uzAIjJQCm6bG9VOZKyzyYHyMQfE7wB
	4ptwE2mlU5d2+/V+5FmFWWj3O0BMycGFw1NS+uYyFo2J3n9NY69M4YVj+YV7Oe4B
	gSRqyYt59BqL6d2cCZvfpIx2Cvc1bPm7GlEDwHBSPWEyybrIadK1R233+snxYxSS
	uu2qmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v0kfcv92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 11:46:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-850553dfef2so15267946d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 04:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960813; x=1761565613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rm6MWCmMyPXrv+yc3ILYtdzHGcjXJf3gMY4k9S9ZBr4=;
        b=gHf2duVsQhWE61LG1lCUTyXajt0fhWtcEvVAkGeyQAjPiO6uCHnpVmRGPcDtONVcWt
         nyMNWkUGii11CAy8NQf5k96+8ei11dPSVFZLoMRQZFQvm0UBWyEX1UU9p0UeSdk7Gi/E
         ye0wrRbNBm5Vbr+jlljEPG27tY1zDWTXvE1s0p+g7TFNbLzqw/GS3RzjBmorWq6qjsD4
         lbx9oXlTm1r1JZBvmoyMCSdvRQiWOmN0UFEnK3wtIsfpOiqSk5XCvi5ynlhn8dpda2Io
         WAhQXMAFpYUAuF+HeoU3N6rspSLZUhWt4oLzaTm2LhzeHXs+D2+0GlpStU3Qm+NGqdcA
         vdZw==
X-Gm-Message-State: AOJu0YzRTg6j8mbdsLayD12rKLwnsviDYYm475lfmx9STgnd9187fDVW
	sLUz+2Jj48vPD1T5PDgmLzHrfpjzEkAQUdtGff8hXDhMdjcenZfe21U7o3DLsSiKbzSyrsDhJR2
	HF0KzVGMaDKhKwJ0MIbqfS9gcS9giDNOrC7AOxDV4RWYx74RzM7W5cpvDUVdASKMJxWVA
X-Gm-Gg: ASbGnctttrw7i7iBCEjApXnLixvaif8oFhFZi9Fmr6HLZ2XktLhnPS4+ueWiENk6B8r
	O1jKsheQ7Ut5DT212pfvikTJTjxXE/PDVQCV+vsaodPrc2rfzn8ix5R+gU0CsI7Dj7sUQDzlPri
	/VXZ1MX/wvxyYwXEgM7mgjuecim2cwdIPZuylkYipAdjW1yJ818zYHylgiogRhmbnr3Eti0v1Rt
	d/2lxKlRFLNcsReRlpvwmDHBZHWskBBzdYD4kEvIlt+CKH4kVqhwFeJoSEXe1RK5HvUWNoGmOUj
	sC/e6kBbUks9iFRxjaZWUfyjG8idUP6pk/rSynZiTSWsQ9KQXWChseb5sOULEMEF1pR8Ym4KJ4B
	iywoxjBOydHDvZFdpzNofmDosfO12Fx3cX52nuFPQmH1tBBDhy4pzx0Vy
X-Received: by 2002:a05:622a:164b:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4e8c1ab2c0dmr25835641cf.5.1760960813376;
        Mon, 20 Oct 2025 04:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0ciRktPb03dlEiAGKzDkyoD8TX52gJeD8cUeDXieeIygJWDMDsI1gkSlumLSnNzXkAMMGzw==
X-Received: by 2002:a05:622a:164b:b0:4e8:9126:31d2 with SMTP id d75a77b69052e-4e8c1ab2c0dmr25835501cf.5.1760960812952;
        Mon, 20 Oct 2025 04:46:52 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526175sm770447166b.56.2025.10.20.04.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:46:52 -0700 (PDT)
Message-ID: <6491e048-eeff-4216-be03-cf14437b6788@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 13:46:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-pmics: enable rtc
To: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251017-add-rtc-for-lemans-v2-1-0aaf174b25b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E6LAZKdl c=1 sm=1 tr=0 ts=68f6212e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xE60aKYvQSwzfKn-tTsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: II_oHAMSDXVciq2FNBqSf5QpRWVFCaXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMiBTYWx0ZWRfX314+zLO3JExi
 a3dR86RRc8lm/XoLDLUEZ3qOclSGIuA9CGgSBhr6ITDXWIFUGMkSImxRJcGBa7FVHcGzd/Tjf3+
 rekxuq+7uYSaBWx5bftpXIs1YFWPN+a6Gs8Y0yOONtlc6dfyLQqsubkcqMug/RD0dyEiipXlBX9
 nL2XzssfV9xFRDEQ/N19YwJoNoNpVeaDmNWEjguN7IG7QRBnWqVOmxxxdz70tCfSlnv8U96N05T
 RS9mHbOo5kKXWKM3Uxt/7rF/L5x9xlzoB5bJeXUpkssmV33yriPFWuduRYPSmzcEw5MOfLO9/lX
 qGLUs4AwYhWwzIj+IEwY0zo+WtPyghHIyghJoNcotNhHq43RIxuJ+Asaa8li4FoFqxX/p48n8ey
 OOazGb+fZz5vup52aQTVi9iFHtklkg==
X-Proofpoint-GUID: II_oHAMSDXVciq2FNBqSf5QpRWVFCaXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180002

On 10/17/25 4:56 AM, Tingguo Cheng wrote:
> Add RTC node, the RTC is controlled by PMIC device via spmi bus.
> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

