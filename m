Return-Path: <linux-arm-msm+bounces-73081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8EB52CF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F333A1C20478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD1D214A8B;
	Thu, 11 Sep 2025 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+EtQOfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E422E972E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582341; cv=none; b=dEofVosn1Y4WdqIDpvBNM67VZ8dQSiOGflR7QRYWTcFEnuHfdlQzsVefgJmfMKofnvpijctMitMcBIFM2r7n3GufcYqqLfrbGwgEbliGC0rYLSPKW5xZ2r8uMHxe3AsL4ax7aMW72mniARxlDdJf+GqLkl0m3Y8RhwRgoDQpL9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582341; c=relaxed/simple;
	bh=BVZPqK4yiZr+zCprTIFb581qJ4VMxjfjDLW3iCiUq+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofL+fAQki017fvdH/v6N+poEf64MU31miqbYCK7xCL1SELwla6I3ufugE6F9HT5n2C9PV0xuJ0NydQ3enknJdvUoPCNpqqVwyKf0mtPdSXPUFCGoqxJZI+/7B13ITGC6AlEWw8dPALe+FmmYPTBHMn2+PsmWaq7Z4aKWfRfOf5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+EtQOfO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Iu7Y008865
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bezhBuF4V+ybzXrQaFEQjpHR9x111qy3qVqkDZWxW0=; b=k+EtQOfO9mI+GZxn
	FMOypxcStoOpBCYlG4Un8ZZOteM61Qkd8OJ/bu/BEVe5mIXr4D+ZasyrSX/wU9gm
	PRzlGy28CC7qaKvGR7E151JuWJAzzebDYm9cPeYgViBl7pNZ7lzVGpBCNzrKet18
	mhbk426TWGWdMdvznD/sP0LQe4WiJD9GH0HibFhaGjOEtmvJNnGXAyJ6rxjRmme2
	gbrnNOsxOquarYPI9HHqegWp/dc2P0YArLYFQhcEgFZJmNN869G7tV5MDCQp9GvW
	+NND/QaewL2P4pAp7941R2qTnl9p11Zf+T9rrhzWakZjrrUeFFg0+i4Rp6DGT8ia
	54+mgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapqav8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:18:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b4bcb1e32dso1789721cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582338; x=1758187138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bezhBuF4V+ybzXrQaFEQjpHR9x111qy3qVqkDZWxW0=;
        b=dhvJiTq7SbAULCSkEOU7f/+ttFTUYsjk9M18K7JBNAraMs/BR2ibvzL8P3zx5Q38YS
         rgPTSbIPsxf8jJ8WOeX5ZeBXUjCd5ArfyYcWbeaCBDWHq32ZrLm6/bheuhOviLF1Ix2K
         Q4KHvTXPeyd61kvFrN4W1FvvDhH6683iWvW7USscq5BE3uZD7Go4Qw8/qtCjm522vm8M
         JQAbicshv1FBOO7WmTpJYVWdybuzRZp3l7JUSpWxUHdnAlkC+imHSPkk14n/iFtWf1iB
         WrAnrZjDHQqY5U3QcZY3Yuy5Os4GtXQ3IlT3HX9ktxJQYBTKXu2EqppGdDwC5lQLPTJc
         FG1w==
X-Forwarded-Encrypted: i=1; AJvYcCWahA20bqAlf7tSyw9qkk8yXiD1KmZNPupt3KDR2MGvMmIOsi+jdtY0w1tRio7ZSK48RZcWk0mFtz2Yngyj@vger.kernel.org
X-Gm-Message-State: AOJu0YzqGT51qYO2UOwb/FPK5aeF/6gdf9+hSuAnUwh81QF1i4MAKCgg
	Jcu13ekOeFY8Z3eyi8tSJGF7flRCPZGEVGdIbjr5WE3C4idrogpyuWmyKCaAY/1L2r/4/VixYmo
	YyQtZ7Y0hx+KZGGHP6eev2D9Vfq/vVHBJ/IAoF83U5790Qy+6xwl5Q2JJWEziIzpkP5v/9zNM/+
	UB
X-Gm-Gg: ASbGnctN7ruNxWiG4Bx4Jo+4ifGMTIdZ/qIKEdoJO8TqfCoDxDtuANr6bQSATRNPAP6
	r+qCafLRh1lT/eE0fzt27f5/wIy9Pq4hVuotaZlyD2AK+2MxKBtoUufsTCdPUYAeMRsaPLbhPFA
	mdJigo1Rlbhzq8tZaYheZQR78LYhJWhHZLAJ3GRUHp+f45O6irbaQ1VM8cHcT9yzL5dbvbeF+Up
	dgB7E4vxMclAPwVWCgmrdyHJjoO9v66bQDSzHp6R7ZBbNtRVvJ/UohdSNPArQHJwQh6BVSJg7Iz
	fB/VeDjSFHpzrhh3w6WzVSm1i1fHjlBSZdEvl6KpUYEEvu2bkBwTBc0vuDne8dKCixm7BjCpEPo
	4xFM3nbQx+c+4AAHn7771fA==
X-Received: by 2002:a05:622a:13d4:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4b5f835b943mr127330211cf.1.1757582337845;
        Thu, 11 Sep 2025 02:18:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHej3+Jv2aNe7UGy/rc68B8SuvBsniqqU8vGxQjkNQ7UnfITPBTfccyXJrxQognHpUtMSpmCg==
X-Received: by 2002:a05:622a:13d4:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4b5f835b943mr127330081cf.1.1757582337152;
        Thu, 11 Sep 2025 02:18:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dcf77sm88434166b.64.2025.09.11.02.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:18:56 -0700 (PDT)
Message-ID: <fff688c9-af7d-43fd-a3f1-00209842bcc9@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:18:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] phy: qcom: edp: Add Glymur platform support
To: Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-3-02553381e47d@linaro.org>
 <3bo2xr3jb3hrzsetjzd62dmcif2biizvoanxwtyhr2dmkb4g7x@dgrcvzujcwgq>
 <wetzewmbraeawwintmxqntjhvennq5iu2jeegel3glk7y6rsnf@4vwscm5bwezr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wetzewmbraeawwintmxqntjhvennq5iu2jeegel3glk7y6rsnf@4vwscm5bwezr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c29402 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=XHNhzRT3Os4RIKAzT70A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: l22eN2xu_ErNqrIEHimUuODsLNcCMGTP
X-Proofpoint-ORIG-GUID: l22eN2xu_ErNqrIEHimUuODsLNcCMGTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX05UX10K0xnT0
 xjHAPKtx6JLZiHz+VQ1Gg+uiQIMs50FSJW6EBFCfZeotLqt8JkcGm/MboQGieETtr1ue8ljA/5L
 SX5/+tj89V1h+9e0AlvkZ6sxNdDZRIyIObACjeoJCNOVzZpeq8/rbpmVeRnO0fOlPWFG/nzNR97
 32JIm2DkGHA3xpJ0q7bUWfcELtOl6asvkJAXRdsQe+7mhyw3RuAk/N5FHWr6ammr/7rV0EW8Dg5
 8owChqRqD90sW9qn1Wzg1uxCfEmEqU8sV/3IZJaP45UitnXlTDDKkvHb/GUAbPYppFkilrNtoxb
 j8EgTGPTZcpAwmOgz584EmTXJMTyQnOPrqLoIrhe2NvxqYjym7XNJvVz08BBKJEVAP8NmvGSJwz
 JH8P0irE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 9/11/25 10:52 AM, Abel Vesa wrote:
> On 25-09-09 14:12:46, Dmitry Baryshkov wrote:
>> On Tue, Sep 09, 2025 at 01:07:28PM +0300, Abel Vesa wrote:
>>> The Qualcomm Glymur platform has the new v8 version
>>> of the eDP/DP PHY. So rework the driver to support this
>>> new version and add the platform specific configuration data.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-edp.c | 242 ++++++++++++++++++++++++++++++++++--
>>>  1 file changed, 235 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>>> index ca9bb9d70e29e1a132bd499fb9f74b5837acf45b..b670cda0fa066d3ff45c66b73cc67e165e55b79a 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>>> @@ -26,13 +26,15 @@
>>>  #include "phy-qcom-qmp-qserdes-com-v4.h"
>>>  #include "phy-qcom-qmp-qserdes-com-v6.h"
>>>  
>>> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
>>> +
>>>  /* EDP_PHY registers */
>>>  #define DP_PHY_CFG                              0x0010
>>>  #define DP_PHY_CFG_1                            0x0014
>>>  #define DP_PHY_PD_CTL                           0x001c
>>>  #define DP_PHY_MODE                             0x0020
>>>  
>>> -#define DP_AUX_CFG_SIZE                         10
>>> +#define DP_AUX_CFG_SIZE                         13
>>
>> If it differs from platform to platform, do we need to continue defining
>> it?
>>
>> Also, if the AUX CFG size has increased, didn't it cause other registers
>> to shift too?
> 
> AFAICT, all platforms have AUX_CFG0 through AUX_CFG12, we just didn't
> need to write anything to the last two so far.

I checked 7180/7280/8180/8280/x1e/Glymur and they all do

It would make sense to perhaps spell this out explicitly in a separate
patch

Konrad

