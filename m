Return-Path: <linux-arm-msm+bounces-77158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB783BD8B97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8A5318A568B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B9C2F28F0;
	Tue, 14 Oct 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK0kaZ/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A2D2DE1E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437243; cv=none; b=sAhu9vdVU6QHstqsMkyKixmUhZOtUaYbtGXD3tAg47cHc+RA2g2yne81vs+9zZt0enxX9HUYP29mnKsfL5O0cb2rEPTAcsG7CLDuXwWYhUSx0Uk/cBtoN0jxvQ0Ec56mWPyXd2rzZ5leEKHIF0EoUpgXlrCNpYzFNPSnBncTICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437243; c=relaxed/simple;
	bh=+2ZSg9gGJunWQCgc7+1XgNDm2+FG38YtZxEeD+FZuus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV0b/knMNBcR5rRCuJiJZw7uELxURHgRkNRsQ9gbvxjyh1F1rwC0p6ZQ447BBXTO5AvhWRHR0GRrNxe9PXn0rhlJG6oh8M/1ZQ8zAUo4B4EMqnE3/G4SzVfFUhNCzVnQnGDw5NSS6wKnLc7sH9iJgyWTq4j3U+oYkq5I1CtOhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK0kaZ/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87LwV008731
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2kEdtMvDPt+rqvURw8acoIqtysfSNK7vYwUQNqZU+w=; b=bK0kaZ/LrwoKKi0p
	XypjxupzGHGUP87OAqbmX/hn93c3WYD+NSzxoZo9IeSESbK91D75ItUqooYfIs83
	5yYh5NJtye4qiEBD6GuYXfrCPyNi7tMwrznIqtOpIfsSV8Wg8VuYuewTjjt6alWc
	RKdeHdK1Sa5/VhxLJwHseYKxZ7o3c68Z+c1dBDHe5Koe/7Z3VUMjf17wvdpne7+e
	x+RpVv2oho3quVuIl97bXNq2jEySoNs3s3BVBOiik2vjYosi84wl+oh2QgjfisRV
	uKL3NLBQ9xrk6Gdwg+/SIOyedXBZ75MtpIYx/QlSdgDIRDV/Hqv7NAGSe0p2JOWS
	64yYTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt4w1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:20:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-883618130f5so291397785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437239; x=1761042039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2kEdtMvDPt+rqvURw8acoIqtysfSNK7vYwUQNqZU+w=;
        b=WsJG8o4Ijo5PiWESWN9iATjasySLHh2kuJWJgJvoEi1BHixfFUs5urhs2GcsNZMNI8
         PtpC7H3bElpnCcHs1SS5yNCjmf4dQPt7CRSC5MHB95VrQoDt52CY5t+Rg3Vds0Vv4USN
         DEQgI3Ue4LUBKWx3Z8nQr4RVavCyDy0zdm4ZEIgn/6opmv30xwULh/ThAZwJ3aR0qdPm
         eohC+DPdmHDeiAmKtsz3mfCRJyYTfTbyk+RilZeaz3b26BKk2iVksulhRcwf7odP0BTS
         eiA0SAVjtouZtEgfEzVYw89Pj975HYZ4LYMbVyGhHXdW+Of2tHoRwFJJv+km6jloA/Go
         Iiyw==
X-Forwarded-Encrypted: i=1; AJvYcCUI4l+s6bUMH0Wj4dSkaGjGnyi8nkNIlvNbC9dVi92yDDFmnLI6u7kDcuRnOa3tPlxXKIPpZq0XBJ55AdGu@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMRAxn7xyeDj8kM8JOOHmyvAfDGsp2jr8j+kk78UT1dWeXwxi
	THWV3RXVYb2Zpsb+P2w1yjTUUUgSbfDFUtJPxJGcoXa4blBAipSz2ReYC5ipzHYEJoL/e9iSccu
	Ud02mCWlRvFMDVSTmxVkSQjmR9TfbAdcSnY6GxEW3Pv5cRRGbGQrQb0Y/SUgxn+TxqpNe
X-Gm-Gg: ASbGncu0Luv4rA7T65ZT86sNCjV1bOpFLR4mwVQUkTVCrVXqC8IQyjiBak/1dvwGQAZ
	upS4k8/dj6oJRIGifYQ8Vh/KuLK6uk85El8uM6MJde1my4etR4rpkreAwiNfnP7mv7edEZhX+8/
	KPWz9wnt8GKthaJTPbWM6qbgduCPqvMXi0fAotQnjm84zNMNVnkBe0g1Dcev8T5cdiwAqFZYYbO
	42lGPw+Iv8CytB8BZLpSAQQrErCr/CedNpo6jhhBEFTEfZeDbQZF+QiwAz0Hu3YuJss2Yaf/QY+
	iTD9ZmyuHrzX8Z5Xq2/Y/6Zn0G0swGR/O2wcJZf79Sxusi5NtmKq3jVqyzFVjoWBUeBaIR+WwnR
	IFzzppkIv8Tmvg37L97Eycw==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id af79cd13be357-883527ca0b4mr2301900085a.3.1760437239573;
        Tue, 14 Oct 2025 03:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEToilszXXVl6TOFI/ery5IS7Gp+zKZiJJRhsldaBWvmJKNQriMnvgZYNnBuORieNhVzsn2HQ==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id af79cd13be357-883527ca0b4mr2301897685a.3.1760437239106;
        Tue, 14 Oct 2025 03:20:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67c9b68sm1119466766b.32.2025.10.14.03.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:20:38 -0700 (PDT)
Message-ID: <c84bec69-dcd0-4443-b1df-6590426d6598@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:20:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5
 camera sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
 <20251013235500.1883847-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013235500.1883847-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FzKN8wCHvYQ2XQOTzFFZzk3z4r739mA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX4iqQPNLmJdFi
 X5CMI7vnp4+Hd3pGZ3AvgobEimumefG9H3yjxPw3Jxiwx11EjneJGCQCTij+CFPKIvmEdHHo9cW
 69DbhtcfdshO/kSKGuJt1l7V3PL5QtXrHd7Q+STMwwftEDdKLSZ5fYwIj6fLZ2XkTyYqP7io4Kl
 uiOztIFvOH6TA+wqhMLcJv9TTAWpCzVMsPmDrmoGaUrkhLvR1gvSu4n6V1fvWMmD8WkWkP7xmPx
 Pw8JhSGwTQSbMwMgQokFlXj/kuP2twcA0MUanluSOZ/ZPKsZ1f31GsMfdXQjralgCC30rlT0e+g
 qcukKaIihlRNJsM2Q2ROamx8aKRVnC5Gt77zZuWmhjkUfbRgUhZXqGoIYacmP581UZVD4yGbI45
 5ti6Nur7txRVeUmcZ4W5acfZ+Tt60w==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee23f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=11TjR-Pfd0tNEpgAFlIA:9 a=QEXdDO2ut3YA:10
 a=NXw8GaxpU7kA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FzKN8wCHvYQ2XQOTzFFZzk3z4r739mA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/14/25 1:54 AM, Vladimir Zapolskiy wrote:
> Enable CAMSS IP and Samsung S5K3M5 camera sensor on SM8550-QRD board.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

