Return-Path: <linux-arm-msm+bounces-59239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F747AC28A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99F457B1649
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED17297B6A;
	Fri, 23 May 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOkNurup"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA1293B5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021359; cv=none; b=ovNyIXM2T+cqHXpVkxxl4Y7tUhrLCkufXt0FE4FXZowCpBzXvbefguMwJmUW6yTO2VRB5V8TbV2XrMGe4v1vOsmN47tONZjDBfVY1peSSKfsPcB4nsLka56eZ6noBc1s+mvxr+oebhAsjXcffeFsOMP8jCib1slvKO+4dbmMrlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021359; c=relaxed/simple;
	bh=M6PzNRY4HhHhr09n1kFz6xIZE4CK6zN6xFgodUr75ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoGpXQUxFfajJhD8xOYT9HD2ncZGzbxI/m+a8c8M67cL3xtk4Bk0FIhQ9hgmlU4lydPw846hQsUGIIdAhqJkkCSi5MEWYYCPM19qvTppHEziorXKnC3HURBucHD6wwK2362R1IVu7R0uRy3x1kApoNY6PGce3I/pbsZlXoh+Ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOkNurup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NF7192004048
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qUS9IAn75k2YSaUHF1zbCK7k
	qs/z4rRzl1ZCJmNqiD0=; b=OOkNurupXdAEeKFs4pu3gB5gMht6Hw6FiOdiGfBf
	wVeixXgJPtg38dltZ9Id0PT1SDBY92gqgWNof+kXikabNzlDZPxQIQ7wrpsr81KK
	DDgqoHdual4cF93xPWp/byeARo0UtqB6iZAZtLplNUboXHL4PSUDX0Xw5QBzL76q
	mPrrSvE14o0JHLMQRiI+3+11CbEwIGRHMMeTjv3NlhtmPVaR0TSewbFv7UVDmueo
	/BZSoR3ZgRbTSfMI78oCR/2RbvBwYxLUzRCefZ0zgmeszAYeUKA2cVr+KLWd02Ap
	x293a66PqYOfqFehQZ2YyM5lpsx6rT7kxsI5d+TbifZi5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52p85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:29:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e114ef64so1348346d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021356; x=1748626156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUS9IAn75k2YSaUHF1zbCK7kqs/z4rRzl1ZCJmNqiD0=;
        b=ktIBn9bvG5+aa5ccIFY8wWVkMR4d1elUbVzKi+9KYBsh6LJMsFnmIQIiYwgEWnjtYX
         PlSw0e/qtlcYM+m7F5ZMp7Et7b0beyHVxgQ+HAJaZD1w2hwtqgIdrpqkMhNRM8lLzfMg
         maw0IYgeZ9QhX+RoyTrqHJbX1Q4G9EHd0KpRnuZgrB6wIr4cJqIDPddgHy9Uk8bV0hrm
         10KtXviphmxX0gUijje+fyR5Q5BDmMUW8A3R/SUAVzKxTJGuFJjd17L/KzFlh1K37SFx
         lRWGqylYPorxUxKVwNp4f0IB5nu8oaQertLgH8KohPUYM0XxPoxbUQxh+AcTDLqKvcky
         wogg==
X-Forwarded-Encrypted: i=1; AJvYcCXVLmP6Hb0MbnUuT4I7fK48ApA0pOh02uh/taQv6pSZ+G12/40UP1eGTASQS1aRd5Ph1mim1iM55whsBZmU@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNhsI2cbE2UQElE556q35Rc8rYFnlJ0Q+j80ymi+M/vmM4NBn
	ce2NcA8k5gGIOlJf7NNS5ENIQVZsQqOkfdgQvF2b6B3xpFuOSUpqwPjutWz1Xyon2PD6k6sZ9Fh
	XE5HkMMNasWCJe8+JVRZqW9NGWlSoDXL9MK9OeS9XHF9DRds7JkMyB2USFgI4F5s8AsHKY7qLLN
	b1mRI=
X-Gm-Gg: ASbGnctnR9iBceQaApeLCkGLIUXoxAL23WYTOcdQK8lDKObkX9JLaF5wSOEnaqVCx5b
	v/hrz5iOsCGddwSaPbhVwnzzLpAqjvsXgznrXYjg0rAfBU84hF4ge5CqQLJIM/8Eoi2v8TajhXw
	f1HJIFzmswwnv9b6AodICof2hg+JO4xmWYe8HKpkfXX6jb6HmHV+ONXzY9jjoU9Ct9eR2lX4Cga
	s+Vxsv0rAJW77WysTqF+uP7EdfqpEh4jh9xG41EQvnXmyZG/3ksVYtUYuhi+79B4bjPWvjuxh8R
	qJL4z3v0UN2EAQ0fS/nEUqscQF2cwHZ0S1yYyPOX3ZuvrBRiT5uGPmWREZTentQ1nnsgM1Iiie8
	=
X-Received: by 2002:a05:6214:4115:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6fa9d134843mr4398176d6.6.1748021356216;
        Fri, 23 May 2025 10:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUOtcTRZIJcjyLZJZkrKYyKY/eSEuHo98vUITz7sITbtq5VD0SVJC3uqWi6AJ9eJreJqU/jA==
X-Received: by 2002:a05:6214:4115:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6fa9d134843mr4397936d6.6.1748021355828;
        Fri, 23 May 2025 10:29:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm37783601fa.99.2025.05.23.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:29:14 -0700 (PDT)
Date: Fri, 23 May 2025 20:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] arm64: dts: qcom: sc7280: Explicitly describe the
 IPA IMEM slice
Message-ID: <xixb6ixro5il7idlq7nqp6h4vz3qcvd5tlwbmxsvm6lkcwwhb5@shn5by4zj3ad>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: GGm4rwpSeCjLaEasJ4Lj5dta1gWHafG2
X-Proofpoint-ORIG-GUID: GGm4rwpSeCjLaEasJ4Lj5dta1gWHafG2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MCBTYWx0ZWRfX0YPG8JdtSb52
 KM9JtWIB0G8S9RJK5RnBj6NGqR0vHbBq5TJzlbjarB9DFVb81BPIBbBKmV+Ry2oYSyZDKukkmhQ
 cSnAdwIqi0y9IYIdIz7EwJe4DsaCHlYUHm8qFYBkIa1xpA17rlEkOAh8Ym+xiI+2EmGtuUJm6Lo
 d/ScVE0ZUIFfr0jF3HgMLVIilttf578q4ViwBe8rQCETwDncpg1TJP0+yqBzyTTAsrNrVsrNABw
 g5iJMWGtENUB+L9tUzGT2BrO1ymUgRYAlh9Q67Vf8GxZtAykzjLKNF52fWEAx4OQ9DEVoBIpMlG
 xf+Y3XG/DKH1Zgw4YtSNrgxNYBIz8ntgsUT2rpiIZaHknIeAhfZVQiQEXqasX+WoEdVNYaQiwbP
 3TH5C+82tILQBQeTGDj7xbJS0X7s0AOMjtjKdkSfZ6Sw51Mw2QLpDehJ8iu2T2usDvKHDous
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830b06d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=bJ3CpmIcVIv4Nmd2ic4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=703 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230160

On Fri, May 23, 2025 at 01:18:20AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

