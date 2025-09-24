Return-Path: <linux-arm-msm+bounces-74574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B5B99603
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E10E63BF997
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4002DD61E;
	Wed, 24 Sep 2025 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFXLBCvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB72DC788
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708655; cv=none; b=piA7KDDNzDg8Wm4wlyeKK4yMZ5FtGPXogps3VF6vIMCdQmNTgj3CCoPj9EYO+gU+DyR+eNfC95UD0wQT49aCqWbc+I+Xun0yIiiNQpIWY3nwf4bd0WCokPj7lNd1wKjsSXYOV7H/cWFS4mh9VTT0K4li1u/0F1lYatswKbggvzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708655; c=relaxed/simple;
	bh=hG9vXk3xqqS5sJKxJ+b3Algeez3MySj5qds+jtA+wyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMvFqyGLwUxlrririARq/04ZZFzQNcK4eNETBRZgYFwcwoHR+TJi6IPIrXQo0/6F5zAIgrfRzI53lYYxqE31ZvXrx9H8DBDc8VtSqT8spvvrdZaZFiBEKQ4uedoplepz8PRL0CtTHMc1180bHkckPfwld+tdXhkK15CXBixkHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFXLBCvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iOPY025243
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	reaQCZEsqV9Ey3nQvVS9bb8F/IOH+ZGngthf5MS2fkc=; b=jFXLBCvgEXC5dOt1
	3HbjdXv6FWO2UjygCeTY/UbxVNPNQ+iXuRSuAFRHOloKsu9gaWC9PDc+yACPLBhA
	z6nJFzIQEUWNhjq1meI+slJiMwWU72zPd4y/xX3CcZGaigperMCUIjZXkUhT4jyp
	NUpc9Lvi5NHmdaicoNbjh4HqsPSqzI7Y3t5QAwK325BlO5N2LBYLmmqeoX8Sz/3Z
	5a80PhRXWbTzUImyzwtIDl/F2zfClIySUQM8NKs8VtUZenEGhETboyhxwji0Zi+n
	o+RaZdKSEwQq6asF3o5m1+rLchvZpueUYMmqqVfpqXezIg9Sz5bRxUjDDd5RS32O
	ebUnGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv13wc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:10:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85696c12803so29730385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 03:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758708648; x=1759313448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reaQCZEsqV9Ey3nQvVS9bb8F/IOH+ZGngthf5MS2fkc=;
        b=tD2a6bzzv9HGMWnews5W87wWjcBTsJ30LNj97FQdI7tqkiKM9rXM8r0jJGeeYMpzKe
         52ix8WPmVVjUFRjtvWJ1gV6cuA4EJ+VWHoIkgCtHjgb3/XwF/22GtXkMna8D6KDreLDq
         maGsl2OwTQnhrFFOd3faxDJNZqHXNw3EzeYT1QeR4VdG+lLHvPI17QUS/Tk6VKlMNzrP
         mY0OAzVg7TiMCBq4E7FIOOxodXE7E51OmnykEl/9ObF8W7yyD9Rl+YLg6RImXCjxdo8n
         HYC9wgFZ5q2EYgZKkXH2ESuEwmxGzVMpPqlcldKNFj+zJHmlWdtgeN2JWebqWunFHx1G
         4SFA==
X-Gm-Message-State: AOJu0YwshYn8ldHXE7gxwL29M7AnwoAnRwfCGmnFAyv1x9fnfC5rTPzi
	4VGfchkn/UfGOCd4wThQje0twwaa7OSxuXZMc/arJzA/FX1SZSj9AtmTiYKXlke5gNKNEyQB7aF
	OIWeYi8yur7I4LtKeJf3c4FTRumku51PmS/LiU6lWHUcWA/OuD69oPiwYtfeHWDo8DhoQ
X-Gm-Gg: ASbGnctC+kdh3ZaciwIZM//GXew3XrEMCX9mZXERK/E7JOvfWhAXJfR7XjOKlHuAEKA
	a+kQqiu71ZbZGHdkVF7ONef35I2pNcWY5MeXLs+YneoMISPr8Km80HFawYh8Udx8XId6r+VhYTt
	59iTpVjYexkXJmozdvTGpwIplozlTUsBj49M0VkzIijf5pp4GvfcHx4FVDa/2kilaVmNXPi/Id9
	je9g3/1m7BnIupTtfgALsgvq0Il/Lt1u4IXnctvi7QlF+M4O+L2c0HEJm+vWR7NW+IM6yxQnukH
	vPt5Zqde87Q/r+ic1xLap23apNm3ArlwpI7AMWxnquG40noRa677cPMjCWErJ/Krsl8232WRSKc
	nXqAEo35XFcOfvxxquGV3DA==
X-Received: by 2002:a05:620a:2983:b0:827:a484:6358 with SMTP id af79cd13be357-8516f7bc329mr421192585a.7.1758708648317;
        Wed, 24 Sep 2025 03:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSYug89XWA3Y36eawctaVvIFnPh8zbCfGbX3tsUavuH8pOUbnlgm6o1GsVRTRymVWoNhu+7w==
X-Received: by 2002:a05:620a:2983:b0:827:a484:6358 with SMTP id af79cd13be357-8516f7bc329mr421189685a.7.1758708647682;
        Wed, 24 Sep 2025 03:10:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b29c776391fsm893244066b.81.2025.09.24.03.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:10:47 -0700 (PDT)
Message-ID: <b0984781-dcf7-42ea-9974-ac8967d56fad@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:10:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: rename sm6150 to talos
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
 <20250923-rename-dts-v1-3-21888b68c781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250923-rename-dts-v1-3-21888b68c781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CDFSyWNG45fdUeGkh-hjYmbf89YIvHXd
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d3c3a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Mrsn0bZosBzyF9UykkoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXzrXhIewYTBz9
 +OY4Qxq8DMcpWzU4DhP7S4eSL/hCT7Cw3rgJkyM71kKhp/QJ1NZKdAwU715ZOdnv2JNWaZ/a0cK
 srghabMUdAZQmmMla0h82j9bcA7iuCYxaQ9Bx6yhoVBdMjljXYy8Iqh5PGloY2CkO8fxUkEwrAF
 klXWyb6Bo42bca8hs0pqlUz+Fx2l8TTDPPsaMUDRyojCTItrlB9IjvX6tUxsG8bLDwyU8Idumhv
 x/RWhwT+qXxDUxjeMba4QD96W4emwEl9Q/ROBlQrSeD61MLGaIWCM3+582AcOZmnBk8cvNQM26W
 1W4BHW9DTFWgl8gbk1vbgnkQEcPPqT8uSWtqn+fIWTkke1aYo7yXjELSKztLMaUuow0wqBuYHxW
 A+gBFJxK
X-Proofpoint-ORIG-GUID: CDFSyWNG45fdUeGkh-hjYmbf89YIvHXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/23/25 1:01 PM, Dmitry Baryshkov wrote:
> SM6150 and QCS615 are two names for the same die, collectively known as
> 'talos'. Follow the example of other platforms and rename SM6150 to
> talos.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

