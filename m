Return-Path: <linux-arm-msm+bounces-74787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5F2B9CB97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A233B9839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559541D63F3;
	Wed, 24 Sep 2025 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ea+Y4f2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A526F2BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758156; cv=none; b=jOazvL4DUptELvhkfE62hTcJktC1XCjAe+U+rawho7ntjrUDbGuiC1YVb+SkX+5wT+geb+mzPOqaWjMmXoTsryV3TciURF90mDEiq678GnY2LpyYm7G3yG+HZ/qCeDQPHSkp4Ky/ICi1ffa29ut5oZ2gRCANoCywGvQW2VsTMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758156; c=relaxed/simple;
	bh=pVFWRyED9uXe9kpHIiNh5s/rNAukrjZqYdBaoVesJPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7faZ2bBtlAcB8EoXrYCYu1q4e5+SfAq0uPId2Sd70MuttqUa8JF8YSqPCwq2vbVSxy9P15ZiZUO0pSABeQEcjvUb5/lmD5gKbjrezQjLq12gJ6I++TO6bqBwcqP/bykr9eIm0TQq1TrOp5hfzXAMefIhQ322W79BkzkZ6n4isM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ea+Y4f2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONKY8Y002710
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KQxcXsvZfAS1wOTJMcdFx0mfDRF5q6RjS3aOLT4mUA=; b=ea+Y4f2NY5vZ8Jx8
	uPTphXJmu2TWODn/nklaUjeLfv7cGSV6z+oFfah1tg251ajdMV0S/urHWVUsvz8P
	9UaERUeDUZiYO9Y2dJPaeSbwC4z+K1DWLEliefK28hTIi8+nXfjwEliUb9twl3UC
	Du30Hd5s5U4/LCt5g4J3lZhvMAapmGFC7PlSmuZSigVM9HF7NokpDg0X/f1oHxGp
	XFU4x+bhPVkv1w1kcDn1R99JpfuCchxIh3y1u75g69wIA2m0NT517H/xETz+rwVT
	nOBTw8WBeItV+GO4wG2bB+lWuf4kzNA043XnomSuU0eCtfhd7icA6USIUqE28h4o
	dDG4vA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf0n5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:55:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b557abaad02so487592a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758153; x=1759362953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KQxcXsvZfAS1wOTJMcdFx0mfDRF5q6RjS3aOLT4mUA=;
        b=krjUnKiTaJrrhH50Eznka0kbwE+OLr8GqBLZnC/r7IhqNS51sWkYK+t7l3K93Oqp5D
         KLbRI2J4MdVMyLRaCwgWcbo5v7HKpjLhr1VD9CsJM47uI8706/5GYAoTsFuSP1saYf8D
         RB6pOHAill9vhLHyqLphclOwW+EBceVb2aU1uWQ3soLUY8zt5LOZMXu1RRpV/NUTCSLI
         ewtiD01HrehbVmURQuJeEcHoahmMWarlG2eL+9viTFdcyjLEM0pA+ADohvy7MYxoehtm
         Z8drd1rGBJB6eve2BRMfvaHEl2y7jB3V5q3cSDM4QeLfLgK4awL0xPzR3jQDN4ldybmE
         hE1g==
X-Forwarded-Encrypted: i=1; AJvYcCV4Dfu8hSZ6tERQVOoa7BJxkiJQWIFzYdefS91u0JjJwLRK/sxSLyUfLfmTuSeyolyUWB0FkORo5x7O+hCs@vger.kernel.org
X-Gm-Message-State: AOJu0YxdHcTQQEKAEez+MSLISXLssdehv927HmOJKgpDay3sHPj3N6KP
	7Pnkdy7nDOsVArowDfFMFx0xFfcMZIx39FRZqhbT9Ca+V6/IiyUvL7BMDR84vI11k9zscun/Sc1
	jnVXqMa9LqJFDNsIv3gpmWS75wNVIKI1i62H+YFn/hvpKhiRJ7UeKdLlvJD7gnkc1v3XT
X-Gm-Gg: ASbGnctEd5xW1blejT5BxM35vtD81STL6GFqOgPY3JNZo23nfsmyY/m7MuOEYXTZxza
	Toudx4FR/lHP/UzWxcqK7ibKjHUkPr06mVe9M9hTIHqTJiFk2LzF3VAApgsUbQG4tLqEm73qMXx
	U1HTSYXyT75sA1FyRG5uQ6Fcn8z+Xf4VI6C/Wt/RP91lXg6WTb+09NpLnvZI9pgearu/6R+OwKD
	/r/I6hPeD+qAziCkfZSaqHAkatDf6B0eByj5csPdPvqOMvzTURCOKhSVRfhy/lG+UOGmJywroRJ
	BykPmycO/meMeN/qwtUdwSKdIX5kta25v90YIlLQsE6Uw3OgpJ21rdpSO+wzcPzN8kGNuwTWvzV
	5AFr3FP0ErGUqR7LL6D8fnT48HezmHaFfNJM=
X-Received: by 2002:a05:6a21:998d:b0:2b6:3182:be12 with SMTP id adf61e73a8af0-2e7c7ea3a80mr1785216637.19.1758758153129;
        Wed, 24 Sep 2025 16:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnZP/Cw7FjCDl1k9YPTWC9PsfI8KuZIFhusxaePj9Boj23xR7A+imFLsr21Pu2tm9ndHFGvA==
X-Received: by 2002:a05:6a21:998d:b0:2b6:3182:be12 with SMTP id adf61e73a8af0-2e7c7ea3a80mr1785187637.19.1758758152728;
        Wed, 24 Sep 2025 16:55:52 -0700 (PDT)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238cab8sm233347b3a.2.2025.09.24.16.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 16:55:52 -0700 (PDT)
Message-ID: <e06694ec-41a9-4d31-9fd7-8f24f6aa17ba@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 07:55:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z9k3qM9lYXHocAikyA0pgYTSqdqe_pDm
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4850a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BM8lxeQmQxDjDH1EPigA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX+W0pZy4jbT9t
 iD0qG1U+/Z6hQIr4v+ppc1ORaXiLNXkwgnNVKQDSGPd0gv8pu9UuAZRl5j6MHOwAdLI+ciGcLuR
 y6xi5PUUPyg5waSIy13cUjyKGY3t9IfUjhjTKWQdQWP9YGo/g6XyqBqshxr+aEzK1mvPrthjtX7
 TgTvMrPKxEw7I+Oj6zp6IR/a5XwjBl2b0Qz2q/L3InwSI9dtiwUjsVvHiYY/8Tzgs5RksH60Q4t
 o2xK9Ee5e58RwJfoDS438fILcqmuTalMZX1v52+ibmVpJncJyaTXHeuc4fnSjwnHJpYQ4a82UBG
 nrvfxpzFr6EHOoB0+YiG9OyDLf7LxMjp64aAYq0TFB3F4hm/StiDbtrCy1wTCE+Sbi3LBzj6zC1
 psFkKtiJ
X-Proofpoint-ORIG-GUID: Z9k3qM9lYXHocAikyA0pgYTSqdqe_pDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

this was accidentally sent twice, please ignore this.

Thanks, Jingyi

On 9/25/2025 7:43 AM, Jingyi Wang wrote:
> Add bindings for flash led and PWM devices present on Kaanapali PMICs.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com
>
> ---
> Jishnu Prakash (2):
>       dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible
>
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml       | 1 +
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  2 files changed, 2 insertions(+)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250923-knp-pmic-peri-e067c827c531
>
> Best regards,

