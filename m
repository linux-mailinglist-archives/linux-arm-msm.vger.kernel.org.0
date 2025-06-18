Return-Path: <linux-arm-msm+bounces-61673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D407ADE2F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB17167035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 05:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A23F1922C0;
	Wed, 18 Jun 2025 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfse6n61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827971EF091
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750224161; cv=none; b=o1LhOf/aNSx7edOJyV93oddVQ0BfuJELHItdSgCeqQ6WwfNfoO7tYuRjxY2Ggbx7iX9RG4xWxngBByTiYscLg9BCm+xBFtWD7CEmJUGIc0AD91vBhAZE3EbrmCG75zo4eg0oNTY2RSSv3+fZ0WtPkKF5bUbnek84tgwnApjN/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750224161; c=relaxed/simple;
	bh=zNSLyQ418h7s2pWnKQbVJL3Hx6AjPoaLpAlu4+qN/Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdihDWaY881y1tQl+0RXYVE2yPZvja4NsavFTarzSxtCRB8W3w2IS5dmf7zj4ZFlfJN/P+XE7m3nvo70a0DO+wJr3APJmVxelep3YlGDmPaMe8mI7Wo2GCro9eZe+nj5G9cuUQcizA+CZgx83EcjQyOm44ExplDjQT1wZZC6zwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfse6n61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I50gT4013681
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 05:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfTFGFpiffzYmC6fjsBnbW+eD86WS8MQlLmrP9ufxVM=; b=kfse6n61g+u1w6r/
	lmrZunITbmNH5P24rjw+yVDEdLVaen0WDglvkS1lQl0glQsN8l4/qlEMrP0FO+vp
	pjt1SS/sVrzHODJ9Ba7ICZ0fsAAHEVlTOvU8Gx2Sc7yozk0Taniq6DyUzloOSC/u
	B4zJl9fRoZ7v8e7+W/D445s6GqGj57NNNb2iMySg1U55alWtZON1P8GZlJJ66y+c
	JSs7aqdEjqL70zHXBq/sSRYa6PXTl3kycNKo5RRjDruJdagck0cwWwYIt2Uy2M5t
	GBL8KKXXTAep6Aa53nVRzXf3SgsdHG3K5zxGtUmiYAVP7w82rbtsD+4Th6RjFP9R
	RAEH1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5seb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 05:22:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394772635dso4775729b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 22:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750224157; x=1750828957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfTFGFpiffzYmC6fjsBnbW+eD86WS8MQlLmrP9ufxVM=;
        b=Yc5zp/X38LAEyuIj0ABeopVFXntmIDoakVfrgRGKTlvj4jNm8/SLn2vOqAROxyf5eV
         ZuzD4J1OamAvGtmy+VwLnvlFYqvL3qFN6jDq2tS9HNztutlvkFBZaxIkyGLhQjOR9j4j
         7uuHJWgF5uhZVFsQQt+U+ss/TDGiJ1G/xnDI/C3YcsZyKsa3+zH/+KqaCErjOTyoRpok
         eo6A0eb98qGJiYVNTNs67N3qPe5Eoa2JaqS4a9vwXUGc75O+UxtXQXvWEFhXtxDQ5lX1
         7uX5h0WNd2GhUL/tvWZ+A/OafaR6nvS9T4OO4WFQ5LneLl+Qf5tW1+TmhtOfU8FiWbvZ
         cMvA==
X-Forwarded-Encrypted: i=1; AJvYcCUTM7DUpApyDQSxUTyGCSQtW+gCqTSF4YFfFqaT76PX4VQVHjruMmD3/1bXFS3GuISmhM2vUOlFFF8lAMG8@vger.kernel.org
X-Gm-Message-State: AOJu0YwvUuisJ8nuSGM11uKkalQ76Ipz6VPrSfxZDk8y19LG73xirch0
	yNzSY7TNE8Fezc8XAR8SLW0V7BWcWbfB+8hjcvgDpCm0efT8p5R0eAc3smkOw6LrlYFK+C1Zc15
	BH49Q8jDW/620leEzx68ytqsP8cAiNrtSxzgaA7TDBb5OY601+SxWTcm6c3OUttU0cMIF
X-Gm-Gg: ASbGnctj/plKpoCccT4LtdGQdYNZ0fk1F+YhrrF0G820uttsr3h4FoRI0r8Ywq0DylZ
	LkgXD+uSPsav8+0QNXVNP0hY7y9DzMFx8tkvzM5FZoVbFF4A/20sNJ9pDb1NdcD0Nl59FURlpx2
	l+tmLolmz5qRLn41gsO/xpIV+ZO0cNuvmcIW+ocBh6LvfUWozzIXXrwxYcVwj6Lda5xYQlB6IuC
	3l+nlYGSAjZXdJVHIuvrPf9IK7cisPwciotKnK37j1rfMIeUNf1ZWk9UXP1peIRHUMzk67amFhW
	G85sS8g5XZ5R+nYNBFOmezOtjIsuUEhWsjJshQbgv01y/MKRqbwMyg==
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-7489d0335f6mr21012548b3a.19.1750224157574;
        Tue, 17 Jun 2025 22:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwXyKvQ8Xiz0pixedDfbHKQlZlOr+c8lkODmf6tgRR9I5uagxkblxgMGrvDShoOMlSPgKJOA==
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-7489d0335f6mr21012515b3a.19.1750224157157;
        Tue, 17 Jun 2025 22:22:37 -0700 (PDT)
Received: from [10.92.170.132] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082b10sm10373395b3a.105.2025.06.17.22.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 22:22:36 -0700 (PDT)
Message-ID: <948e0112-1ba0-40b7-acd7-19fa9d93559c@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 10:52:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
 <20250606001139.jaods5yefjccqni2@synopsys.com>
 <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W18I6MBbGAJDCgP1O60cnbCbkfXP-etN
X-Proofpoint-ORIG-GUID: W18I6MBbGAJDCgP1O60cnbCbkfXP-etN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA0MyBTYWx0ZWRfX44HXfEOHrifr
 N2d5CEhNLUIl1Sy9APtRNnUG60F8TyrD5pUIf3UMjWHhGe1RslX0OTKBfnzZMm6M/6mdEDl1UaD
 wNPYM07hqq1b4at8YP0CsV99RsMk8JMpAh4IlJMmgCMdTX7/2EVlX6vBfN974XGCj0ToiXcYHn0
 Hin/1CFMqyO03hbW7mSphEegBzgyP/7RK5a2ShYltow9MRPAfLdyiyXjuOCJy18+mbQV/iC1zfD
 jXGllxAXtEeKbFXKw0pinoisef0yIV2sA6g7BtYheNvpnhTLGJ5H9I7FbOmxpNte/+4uGu32puT
 wkgv7Bq74hl0q8MCaWsSscrKc/j8jG+Kt5dC+hYNfoGoLFKmNGbqh995EJeeUADZ//Tfkn/8w9g
 vVmECww1z3wdWcMF01+WxP7Q8tuOCUTJj8gxhSfKYcnEiCEyMa+EG0sLFcxan9ffSJRkSvgr
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68524d1e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6Q_x32ss1i95r1sQoNUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=430 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180043



On 6/18/2025 2:58 AM, Konrad Dybcio wrote:
> On 6/6/25 2:11 AM, Thinh Nguyen wrote:
>> On Wed, Jun 04, 2025, Krishna Kurapati wrote:
>>> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
>>> blocks any subsequent attempts of probing the device, e.g. after a probe
>>> deferral, with the following showing in the log:
>>>
>>> [    1.332226] usb30_prim_gdsc status stuck at 'off'
>>>
>>> Leave the BCR deasserted when exiting the driver to avoid this issue.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Is this a fix? Does this need to be backported to stable?
> 
> yes and "might as well" - this file was re-made last cycle and this
> patch won't apply without the recent
> 
> e33ebb133a24 ("usb: dwc3: qcom: Use bulk clock API and devres")
> 

I sent the patch on top of usb-next. Perhaps when I made this patch, the 
above mentioned patch was already present.

Thanks for the review. Will send a v2 with cc'ing stable and adding a 
fixes tag.

Regards,
Krishna,

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

