Return-Path: <linux-arm-msm+bounces-57778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F0EAB6053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 02:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6880861350
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 00:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45431EEE6;
	Wed, 14 May 2025 00:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVPfuWvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5905453365
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 00:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747184362; cv=none; b=YgrhNf4NaYlByxeGPwlfKwfr/dgcaMC+wusFI9sqNoZOX7J0MG468oGFt4Uo9uUg/059yhir9AC6d0d/VR77vNu3el/oqwNKIsZtjq38e+d7ygYsyi9fX2dPWo8rrvzj8MrmGT+0RgRjEw/iPJMSE8uG8NoNn43UMJVPPS4dObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747184362; c=relaxed/simple;
	bh=PfUaRwWLE7xuBYYWZ9RhZCbng+fAOgq6pjlUuOjLmyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtbT9iOeDMuTp9BNibNOg2GdFK/Bmmj7xPoDxvHMyGtdIFxZMmoh+80JzoE8B7958HiOj7EylkzGmZuo4bG1ZBEyGv9L4YrgL6crQrYyHo5XvD7AYbdXmTRXLPt31qfAMwdHkSu2FALRK+c3URFPhoKQrV54piVza/L56hH6lpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVPfuWvc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIUGDC006881
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 00:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tTxcl01PEmLXwG3vhnhNAzbg
	xBv5KPSQLGu4R6f6OxM=; b=oVPfuWvcLSYlrZU2GlSuiaiibHQb0rWQbCq40ZwD
	ZATrGTlEomBFL2X/tus1rxQnhDxO9fX2Ax9nH0mvz9AVUlLX6Iij2bLvHgX+tgIZ
	DCqdYov05bmLFC5vX4ADmAWdzZ7b75xZfDg/A9b/c2OrP4+YVe+RnHUm2zbKd6ha
	xhrIItutQq9VGmZ+gnqNPQqBnN216lbhLui4WpQW/AvbscW4egXMALgBdgnKvn3l
	PpNSOssRqAaO7tMf+N9vjOsTiwjoD2X79dwS23WQodtrf0j/vx5xpy03RdAG0Z59
	X2cVnu5XgNkaBeF2hV1Z1uYKJneJZRYnbIggXuyLCIHNuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcygv14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 00:59:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cabd21579eso728418085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 17:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747184358; x=1747789158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTxcl01PEmLXwG3vhnhNAzbgxBv5KPSQLGu4R6f6OxM=;
        b=b62elMhWFSwUt7IjGLtH9cjMyCBdB0z6f8yUbQuRLdcPc7NdvfBJMhqLR/MiqryRXT
         2ecWBxeQfIAxlyDGZpqxLbkJXDnTwwZLHJZdCb+YcQ4do0knURZL47RlLriW/GEPlaFF
         QAN8T/LOGJxfWgSI2YLw92Qx/ZD53qyvlCaX8nO7BgWsoXxPuixQI915NdOsqWPZi3pB
         cZkoSZnkc4Ja3Zl98WbYzsS3EQ12EFmqjfNPfRRVc1o4fqBTOq9pW0iw1ghSWrkWJ/JX
         r8soXkOhfrej4unUXCqyQU7zkxtZ3xY56QqEfNyK9yrG9+ClcJf4XdLvzZqdPBo6Pv0V
         uo6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW17U5u1drar127Bs+dWEA1h5T5VsQbeD5IsSvk88rRYKa10aogzf+60OKHeBIsGsyd8bjB/t5cwcB68a78@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfPMuKvNCOXtgUtkhTGMzGVUdA2tOIeSFS35r1ggYRieFgvN2
	z9VJC8vvbiSifYWTS7QMddFvN7jhTxIP6FlZvG9mLgl7KMy+iW8RNwPXgcro7YAnDh34KHwm++O
	I0r9dwtS63KERE5SivnNGg5S9zEyAJhNfFq1ut8LPmod2xjqo/85pYjTi5go5qSF+
X-Gm-Gg: ASbGncvO4n2ARmmevl+b11lAYvbVR1gb82Pi1GT4uC3jK3/PMUHKc1671703AUBxXCq
	7Q+skivdUzWdGhW1k9Gw6T+KmbhCVr9Eij9hbIblJpDkmNix+xwqQzC2zGz13vQRRUDlmaj9c6f
	pkqv3mCPJzPzH+o9jHkAr5yI0YV25yX5hg4Fksp16QUz37ofVgsSxwiGflO6YWSPxYdihXywMhR
	w4FOaSJj+DGGuLCrKfmAmBqE0n9QC5PVa3ywWI/sn+YufpgjXkyxT8yHyqOLvN9PXxFuyL81Nhi
	aJh0OUar12btKvF7vQjCG/ivC02bhoKEzeuLiqHn7kx9pY21sjUc6rv9lVYm4TN+4BIOJDGSx/M
	=
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr224254685a.35.1747184358018;
        Tue, 13 May 2025 17:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYw9SE04klQRvkfoCB/RwP4rwfTjUfhHfUXv4t360h+A2UdXo2t9FLTB1i69oyPRdksmwASA==
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr224251785a.35.1747184357622;
        Tue, 13 May 2025 17:59:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6fa1sm2047195e87.128.2025.05.13.17.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 17:59:16 -0700 (PDT)
Date: Wed, 14 May 2025 03:59:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
Message-ID: <naoq2w2rrksdz3wjau43eaffawusymx6vwtazgszv6cwlur272@rctxn6pdahci>
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: wwbzT1oUTATB00HQb_1Hkxevaqts0LTD
X-Proofpoint-ORIG-GUID: wwbzT1oUTATB00HQb_1Hkxevaqts0LTD
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6823eae7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=A3aN6VE87vRDyCXMWEIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAwNiBTYWx0ZWRfX26iWg3a8arhU
 4JQ4fIQ93rguHKUo5YMulgtxa9bq+7p0rDTS8WwaVqZT9J5ZkfLxw85OVCoLMYAlLvuvYCwI0ow
 ez1g4vqujxiKbL8tjg2+v+r+v7Mml4MKsradjgD2rJ0fOkGlujjvb6DGhXpJliIZHrLCprG1fLN
 RUWz+gCRP14VIz1iWlSn5kdPaovT5z64hxxbpu3Lo1Q3/NFcK6WoB8jsLJcAhwjBRtqq3piEBQV
 /f7/VT8cXrRkuzz/3w6vzVAI4FD9VgTTrebeovMVpwHjOD/JSvbDfYjAsWjWuZiW/cjAPzur322
 gb+ZYUyx5afjbM8lJjKXRCb8rhXv2VadAkNzgJ1fveBtDKQu+KBogD0kiUPe+DTISwZOx4k2mFl
 2NDblkVeuQaL+vVW6y6XsXrDGiWtM6Uvv2WZnS7jMWrCuNQNfUPPRYu5SDnbzfsiahWgHEw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140006

On Tue, May 13, 2025 at 05:39:18PM +0300, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.

Are these currently a part of the main camss block? How do you plan to
handle backwards compatibility?

> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 

-- 
With best wishes
Dmitry

