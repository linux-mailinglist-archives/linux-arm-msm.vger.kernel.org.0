Return-Path: <linux-arm-msm+bounces-75942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F85BB7FDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 21:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E761B4A867F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 19:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A990E23185E;
	Fri,  3 Oct 2025 19:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T54qu9PL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7BA227B94
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759520300; cv=none; b=NTXn4LTzbfB+0V5ZKkqS+y+y8fRnaLoHbY94tiVHWHvZvsUuAdEDo4GUZkXUuvtFCqrx1OptNH9M0S6DYAXihERyTNPWxL31/b5insjjNUDCI/3zG0Fcd4CUkqw1DMhfM+nkafcNKS+scNbHNVV4jdNBZbPcj9/TFY7bdq4l9S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759520300; c=relaxed/simple;
	bh=6PA7/gZ6w/NaM0vZU25LxZi7CVbMutYUKbETi4CKwyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYPDttXQmrYl1JiEiDplD7wxThLLbDZz/KKQqrTQIQ3uWh7gugXGFod+HxxA3XRighWK7VSf5sZI6UJ2wC1Q0rGDSw8ETPFB14Kr31XVulFhP/aGV1N5HBHnvA0x+7UWNjdcc/hJkLNZHdHrjJ7g2SRzDh/sVNaImwMrSBh25ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T54qu9PL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593Ar8k5012315
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 19:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c/QeD1msDHzyxrlgBhbUPpRV
	r2cqluEXpYx+ZEgqG8E=; b=T54qu9PLdBEo+X3HJs2aoWSGZ7TqW0eB7ilFmhJ5
	XapBW6n0KZJ8cZ6i3VCZk2jJ6NTU91p2S+iW1L5N5Kb8RjNKJrXuLAeOFNLZ2XNl
	0t8KZ7BTlzbqKP0BYOMQwDF7vrAlP/TzHv3/KpoZLkG4/dwHdbuqUOLkMZThXfIc
	d9cA8sXENJV+34ea7aFpkkaPopjjcDIYa9jHrGtXvy53K4LzejRt6PH56iscWHwh
	Z8WlBkJkqSgRMvSjBTeSJSKejxijJNu/6TwR8rUER7LME58YG4nyX8aRuW8MFtRX
	0UxwKgltXZdjImcSxJR24TnY5MLkevMdyXJWJdVC5NB13A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u3yq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 19:38:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df7cdf22cbso95566851cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 12:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759520297; x=1760125097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/QeD1msDHzyxrlgBhbUPpRVr2cqluEXpYx+ZEgqG8E=;
        b=sRMGyInhlpUUY/O6FRpIsIqU3CNPDFgcIArqxmRBt7j/r1WO3saKRT7InvEwJbNc88
         XBdsWMflJY+aQU8jwT9egau21KL3DIVWmsPSHg0hkPOM47sF8bZILCCYiqQIq7/vRZcr
         XRQkUw2Bibqs+CE4O4/OCMvvb7yVxDVgv+/0pzAzd7iTvbTgaEzQB2qAYsf7eH8RkOzt
         7V63wGpK1VHn/6Hlrgzuns8DhzJWaJv3l0nGE/0LdAJCvNO6SIbbXsTl6RIwk4ZzDli5
         tB/MVnY2xBv7e4jFOknalmXelALKO3vq/SEd4RA7bs+/F4uwbaO9fQ0dYmLic+GTjej/
         MkDg==
X-Forwarded-Encrypted: i=1; AJvYcCUwrmTbpVppzOyYdSO3tB0FFM5eyQzhTFHkoZMdzxMTt8xVo82K+9L793ZmYkNlxO3f7WgrDVIf2H+PzLWl@vger.kernel.org
X-Gm-Message-State: AOJu0YxVyCCMhvX5qzhStiyr3k/ZtlJmLckP+OBYVxJtlEL+GS9rzTk3
	XOCWHzsc222SmO/k4XijjmgktawKhl1Ht5Qsd2Bf3uKA3zMFfyKodro0+yleJseCZ9kvCHKNE66
	8jNQPYwZKdnvl9uW2FFhaeV4kwT5qnMXrvWk2+HA5Axu8J9Hg7Iiwb0DwkAF8/Jhcm/VM
X-Gm-Gg: ASbGncvQw6Lg/at0a2fF9QGyvH0EIxPp8XlAcQBajqE016TGJbwZNmGEDoaUUt2JmZd
	UImtm6u2Fj5Vcb3TOuGr1EFCSmmVXsbxRgF8lxaX1IpKcUtpoYG3zv35xBkdPeMs+R6PYlKwae0
	i9S0G3rhVvlcDy6meR1ZpdRP3MiHUlAjIV+/Q202TuAgypUbE14BVoZMje1yUOQ3nizgDCmZwAI
	StjES+jgwYNgQHRrrrOfWGYFB5JY8hdNvLTZyIvsgwIFWo83M/OBLaorF1QS3C3JXDJZcD2RpWJ
	vg3gRljgzdN+QD+32TymZu9R7tUGs286GKZ6Xotz6ZrvmRoWJa2J7aIMiiKHlH6QSKG5G7d/Vhc
	P3kUkPrw31bgXaJrBYGEysEZDMZS86wcZVGXT3JNkmKFZTdNuwuXsmEou9w==
X-Received: by 2002:ac8:574c:0:b0:4d6:c73f:de88 with SMTP id d75a77b69052e-4e5766fa419mr66222421cf.3.1759520291209;
        Fri, 03 Oct 2025 12:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa6kGS9lVlPG9s/2DewNwN4ny2UeX5qnAiNzIzbVl4p+vL4Y447NPSIDi2TcL94+kOw3WYpg==
X-Received: by 2002:ac8:574c:0:b0:4d6:c73f:de88 with SMTP id d75a77b69052e-4e5766fa419mr66220391cf.3.1759520288686;
        Fri, 03 Oct 2025 12:38:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a7e65sm2090376e87.112.2025.10.03.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:38:06 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:38:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input
 clock list
Message-ID: <xad3x7qn6qxrnfqrhcyqkileh7efwizklmwlj4firdqpkz67em@2bcx44acnpre>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
 <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX7Mo7iNh+M8Gb
 DUw5zjbyEcSSnjcpkQBsNvDSkZSQNciQLJZHuAK6ZZ0BixC7dfzRMqdxhqCM9QWEY6Hi8HSnttp
 Tmw8/G/vWqZjC4S3GUww1mVsRwJtbSeESF23a9K5NMHIQi4c/jZMKuiX7mccGRI1JtC4yGit5zh
 z7m4J5VA8an3x+YgQcZcZrC/zXAKY4L6JUrrn/aSmzNE3FlRABZfXSry+jfjPzobOuHRD8uCVEk
 TX85dgenZB7UpzBy917hnmaGA8ePHTL22s7k1rn44rjHYAH7g8klw2Hb8S2VOGr2KFyKHYvJEZ3
 IzWGPHe/6JTQJo+MS5onk6Pyw5NjQk+Lf7oCDUgllB9xQtBYIC3epruGIl6LWwKc62mxNBFjdPs
 XVKy3aBY7O0sKlKlDDbqQ9/3FeKUGA==
X-Proofpoint-GUID: _0lkr6MMUOob9Ac93R8jMzbpzpSBcS6g
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68e0262a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=AeM-GoSWWiRe9qQbtTAA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: _0lkr6MMUOob9Ac93R8jMzbpzpSBcS6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Fri, Oct 03, 2025 at 08:14:40PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> With the recent dt-bindings update, the missing USB4 clocks have been
> added.
> 
> Extend the existing list to make sure the DT contains the expected
> amount of 'clocks' entries.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

