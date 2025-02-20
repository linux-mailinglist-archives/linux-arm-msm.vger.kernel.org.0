Return-Path: <linux-arm-msm+bounces-48704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB14A3DE5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F58E7A6B53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB921FCFDF;
	Thu, 20 Feb 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9vjG56F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232971F9F62
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064640; cv=none; b=siWGWnPPbZ49n3CI2o2dyQ6Ubsj5AnUb495gungc/8F6p2Sl6//zS/YM20UCadEKQtczXRUCWImNK+NbPDgNnEeh5nUt7aHA+1UnGQSbSyLqYp6oAavUY61sCShQgzpWzDLJDCtUiiUU39hhK1sL/pi9lAq3lKwCp7zFE6TZMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064640; c=relaxed/simple;
	bh=cXyjw3U+o9sNonpoIUsGd91UQ2ZT2Fd333nrixD99I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoDm8+goF1ihQblYy2VDW/EIcwzmb8pry0HjO1G/65JDXae5amPavwlG4adLQ4TRlUys2YvaDMTIMw2egq+20Rhsz0JbXse2vDbFKmcO3imk7jxTIT4URY8TGP52HlYx9g253VXNymVhEnLABcYd0SGwO8IMG4/TDfVjlbp/w9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9vjG56F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7QYZE015051
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyqX/wPqcVrrLtvA/RqDwo6FUcM/5iLCU4temwHdiYM=; b=Q9vjG56FFKu9Fupk
	rTl/jzXxjNSgMUPblmVVtcXl0TzBsAj10QUIUXlm1XSfoY2wRKxMPMR4DfhhukUk
	1rsG4o8aUPmFn0iAX5086dXNzp6NhYW3vqc62A0GP/3mIl3f1pRI2a75Qw4ohjOJ
	rQf7fnU8yoC2E7SYWL4Gh7Q9A1+NMS14euQu1o6w2TKEopasiQtG3o574ErnhsbP
	u8dYgEkLcChJ1XkvpKQtVk9BleU/QLtsn72aEZIoQ3vPtmWHWs4IW0nxP8s6FgXq
	VUKYpF+QJh7idSfJc6thV4qVeX6VS7Dv74eUtzk2LGKAqH8BVU8vGn1JsJEHM2o5
	3Ov7JQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy16fxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:17:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e65d6882a6so740386d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064636; x=1740669436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyqX/wPqcVrrLtvA/RqDwo6FUcM/5iLCU4temwHdiYM=;
        b=d1neJIrCkOEIGG7pSFF0pC0ilS3c6rSH7BlrgbRlMhmbIQdnmriHPkB/vtwFMkbdet
         LnzmRcrN7Q/0l37GD7HkvdyjJSCkf/Di0IlUfRuoIdtHl/ZJevXzRIdqKt/Yxq9wS0WA
         EApKNecquVa8J83XIVZabtIzXTG/I1V5p94istd4+08mF3/b41EoUtv83nebotF5NhfP
         szaVyJ/s+q9j3svG1i5u0yjnBcVHW5AKRC7urM1bFDeSfCrDJcwjStyU0P4zM96Kt63K
         Nm0InUOZ65qMdOYcyUfysf9dJgCwxmIoCf7i70l4xfc7ye6bvJy6k14lNesp+dxWb6Rm
         6cBQ==
X-Gm-Message-State: AOJu0YwGl5ReeDcCT693OYMlls5H4cBPoe1hzOE3nefEJZ3lSPJ+pzmX
	bwHJpHJjXwZgedX1rHTLUDpDQg9N8/fIETbR4OXOoCBgX858to93JlLdxlKrziMlCoJZWXSmrGx
	um7DUAX7C46a15HZCwkq6PPjj0rTThPU0WARkQZgPYYc8OsTa7hlBbK9BGXEpNq+Q
X-Gm-Gg: ASbGncuBO8xzd1okeTZo9NWtosRPR3B1x+DW2BWvYSsC4z7vf5LFGvz/BrH+XdI/Q6a
	ctS9hcDXmV93c5DC0XTZeD+4KdhG0un+SoQyZZ13wcNcz9njC0w2YIFO07cDIPG+qa8U/Wh/lbw
	Z8CKmIZvDK78BMJasfy+mhjjpEswNOlqsVUHZ2eB2NvA6IS8enbi1V7uIobCDU8LbVbp3DY3ydI
	2wfuXdpe7axNS0AoB+jTxy1z4FuI34v6HpBxu4ogVpKh27+ULy9BQwFRYhEhg5vLzU4OSXDOnRt
	SQIFYqUVOhsI8+BXpH5YErtX+WrXyXpGQmy2yAR5vNtkf/FPsOIWu8isECs=
X-Received: by 2002:a05:6214:d6f:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6e66cd0f7e5mr109551126d6.11.1740064635964;
        Thu, 20 Feb 2025 07:17:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtyET8snLYOZ5UG6zsxyvaebgAOp1Lqtaa+U4eVMQcS6k6ousx/ewVzRncsaB9ipBkNQttnA==
X-Received: by 2002:a05:6214:d6f:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6e66cd0f7e5mr109550916d6.11.1740064635495;
        Thu, 20 Feb 2025 07:17:15 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbefd080asm517329366b.179.2025.02.20.07.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:17:15 -0800 (PST)
Message-ID: <b3b20d5f-6281-41c3-9769-6545c6782eea@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 16:17:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm: dts: qcom: apq8064: link LVDS clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-7-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5XqXo5xEwJ0bFP_M3c4ziiCfYSfYyl-l
X-Proofpoint-ORIG-GUID: 5XqXo5xEwJ0bFP_M3c4ziiCfYSfYyl-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=682 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200109

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> Link LVDS clocks to the from MDP4 to the MMCC and back from the MMCC
> to the MDP4 display controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

