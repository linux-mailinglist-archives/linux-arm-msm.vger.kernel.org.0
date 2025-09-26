Return-Path: <linux-arm-msm+bounces-75285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB7BA314B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E46D1B2406C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27F727E066;
	Fri, 26 Sep 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9oB+WLx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ED221D3D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758877890; cv=none; b=CC4jNk8bFNi97FulyfWxXdNGk7Atmyll8WaL2S3E8EHcdo027QD5VICKt0jB/WdOx0PP/l6u/hekzlthMeiVKOyM3i1hORWoqX/4gna7ckz19GTtb3i3ALvy9qiQs3ESRz4dxYVBS6AUUr2JPeWSIl7vJ10CQm82ILnHcHc60ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758877890; c=relaxed/simple;
	bh=Q9cVFgVDTi0yD7DcpxpXPEPBn9ZNBsja6Uc9akvcPeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISYQ4oBihKZyM+B04DEgbYh1FFTT1ZCP/5etlscug0bUBhO6wZdf4xhkiqdPDvIw4aKqmKnH4b5QH+98z220gaSsgQ2ihI0wLxxd0Q+9XI7ca7iLb+v6FNJ8ks7JB6kMHJEi7dZZp4S4RdQjbQ1dr0zIo4kTKJAhQp5vZG19aAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9oB+WLx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vggI016018
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwMS6RiPyG3muvL8gIEP/IdyDMuWnY9zWPsqgfT3jmo=; b=F9oB+WLxy1WCJolY
	iB/ozRPi7vxUVIRFRX3X/ivZ4qQXI6SmV1PMp/HN5MO/laRuVL0oe3s+eSEdwyZx
	/HWxVHMJ4qdHVTnNZqYRKFXaB+WXSfslX8zPnWIm+mb+0DoETeAsXohp837HzIBb
	cQLRno6uFVWLieYc2fTgJ/mILdVqW5Erw7ieelW/RmgqG1CKvtrc8e5mtxMCFU0O
	TqpV54PPNaniH4yGkrbhXWeigTuWf1VEQOK5900tHbkxH8aEoN/C6noGQaKaGXgK
	Vly7x9/wXGZGoHwvQrX57iSsYuy97Vw9OpBeJ6Yr47XYHbpvbKDfXK1jL9Ww3t1A
	jyY/yA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rj7q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:11:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33428befc3aso2183857a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 02:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758877888; x=1759482688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwMS6RiPyG3muvL8gIEP/IdyDMuWnY9zWPsqgfT3jmo=;
        b=bU9wbOeWa3T9HerZLSA9/xVnqpTG8aB7GxgtXq9fU12t9OSaL4ulqfnlTqdU7g6wtu
         mLq6M01oJp/AGsygE8R/RKIvN2HgSj+GGsAFprNmOYYZqR+N4jqcS4GBfYyCuUB463k4
         D+PIqniDPhxRJMP+1VMr7swSnDdw7a3Dl7l0SLc0/z8eckAv7YDz5HqWV716Jw+QyWto
         K7qIqWrzSt/A7S5s9GmuYeobiDYfo7f0k2YwGo2a/0tv3DmtnbiM9X7YMB6Zuj5yxjrW
         JsTsB7GZqz/wzcwx5oOUIQ8zOz2lQhI4m60FpEhxtSMuKtIIwR8+LJco9nR8yymq6k71
         2jNA==
X-Forwarded-Encrypted: i=1; AJvYcCUc7Wr0CFch1DMo+Bag4IOzPKZb5OWUCJqnhWjDsJTtMpA1/c7kxUbW2YXsMQRnvVxH26fdnHg0RdTw5uCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxDI0osBa12O9I/6roj9KEJidb32tD1Rmt1v6LkB1p6/DR/SI
	y0tuImdjUvpwvMWhiPp+8DKU+d0VeuGiMw9wTutJ/YWZoeJEBX977dJKsxo3W0Z4OVIBdflpu85
	ZUHEbW8zEUPDDVVPf8zinR6c24BmG6K41PAOW7KMLMld7Ad2HqIg4AxJ8/JAoYephgGAW
X-Gm-Gg: ASbGnctGknx+X+GjWuGowsEjTWMEtW2Z/CTbNqTE1DwlUUXuzAA5G/wfXGZEVozWQ+t
	krQSfK06yCOlYrsiPyNfG1GkDZuIYmyEdfjlhc4uaNFp47jsMXHR9FyttAluP0uzhlw7cIx3FAn
	JxAv/eLk2iMOINRVCkwfQRrW/Oe1jwv8s3rctSvilhVyoyGyMTKngwijtI+t6e9t+KoCzxDK4Bx
	r9bLNr3XUWK0VPPEwfEwvXH2QFpPEpW/l0PrYFWEKzt4/bU4vTkKiYZN9ZLrdSCrY6iNT0xq1pd
	7TE9jhdmyHywvAn2N7ecL0XTbOM6QU8FxzACHLswghw+l1ABIZTC1lHA7Fp/H4p1LnIUKh210Eg
	VMymU2HmLH4MiVlHSGFWhMlcHMjQmw8+/PAO4
X-Received: by 2002:a17:903:948:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-27ed4a093cdmr79278905ad.11.1758877887580;
        Fri, 26 Sep 2025 02:11:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqnSucq9QwwfydAdBOvQY2cA+Yy4I6IVDVeZYCo0AArAOV4CXOKIvi2P5d2LMNwXIVWHyGeg==
X-Received: by 2002:a17:903:948:b0:24b:1625:5fa5 with SMTP id d9443c01a7336-27ed4a093cdmr79278595ad.11.1758877887091;
        Fri, 26 Sep 2025 02:11:27 -0700 (PDT)
Received: from [192.168.1.10] (syn-076-033-021-145.res.spectrum.com. [76.33.21.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b0685sm47455865ad.116.2025.09.26.02.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:11:26 -0700 (PDT)
Message-ID: <60c65d7c-1564-40a1-830b-1c9931776fb7@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 02:11:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
 <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
Content-Language: en-US
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
In-Reply-To: <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d658c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=jL+KNGaHzx0ZtsbCBWd7sw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8xtE-M9Tj1n2mnedfNEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: mKgNpEpbq96bNTXZ4LHnGjvLhjUvEIpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX08oBMx/2iyZK
 MZeXLatL1qtBWFUa+XyoZ272pKQODoFNl2rBUTTa5RYwIWzs2dZzDk6bNhzP/PPD87rZwoS21IZ
 kRkzufS7VxuOUchLXpYcrWLzcT0XdWc7086bITUvlLu+Xy4XMWeH7w9Xl0Q/Vjrcks4emwfLeTk
 VR5uW6WR02xQcRdi8afbo0gnEpB0oSlhZQVZEgD+jh8MNf0m8TpNn9hZw89MwF8lWuDBGA1E2LP
 jFJLytTivnkkdFsyP+MR9Ir0l1xgiNrMqzsUnTvz35Ow3tHBJftEOe33m2X2UIoc9CsVJ4YZspL
 bGFEAWjcZ3euzQGXL+jLIaJ/I0d1yW2C2qqn4DIrUCxn6aB1gnFbvr+O7GI3iBW5v4bse8+MF0L
 DnsQN1hEscX8rY89ASpBu8wusYYxBQ==
X-Proofpoint-GUID: mKgNpEpbq96bNTXZ4LHnGjvLhjUvEIpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/24/2025 7:09 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:17:31PM -0700, Jingyi Wang wrote:
>> Enable more features on Kaanapali MTP boards including PMIC peripherals,
>> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
>>
>> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
>> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
>> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---

[...]

>> +&usb_1 {
>> +	dr_mode = "peripheral";
> 
> Is it really peripheral-only?
> 

For this initial submission, we haven't yet defined the USB role detection
infrastructure, so it didn't make sense to include dual-role now. The
controller supports it, but without the connector bindings and role switch
implementation, it would be non-functional.

Thanks,
Ronak

