Return-Path: <linux-arm-msm+bounces-58788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCFBABE46F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C1E1BC3AF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F64828A1D5;
	Tue, 20 May 2025 20:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrXcPbEO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE9528BAA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771433; cv=none; b=YNTMB1oLkH69jxDRoIwtK6iIgb9dGLMa/t8hKf2S7WD7P2/NjuxdLhh+Ks2Uv1SrbcPZtsKbo5F7F25Jc5JbyLrLMK3RHKxH+P7CpH5gfcRo1RIkWk5Q1rPJ9lsmDJRumuIxwYuO71iNMttKve36zVHReO+vPINlRfFICqDgx9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771433; c=relaxed/simple;
	bh=Jo58uY/+5x29BKtnLD8ifhHMZfOyVH/5wLfRg+pPINw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhXoECdGCDfAOLbitJ/UcL6qaRYyUIInVdU4KL/6hU57jaQMpKqUYqW278cz4dL6WYTwtFFFzMDghhUrDQawNlt2MUVzd5ymkJX/VErjdiY0cnB8bBuL4ThSJrhLOsXnREUX13Y7G48kFWP40Y9Trv0gZEuIEQstyZrz5EooV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrXcPbEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdo70024716
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZzFtqYN9pw9QSLrS0tK+ki9d
	IS1z5CdQtvo1AHtdQc8=; b=TrXcPbEOTR2LWK6jJHP1OxQTiWc3DZ0iCxKyg/bh
	HHdt0rW/ld3/l8WrX6GFPoKbxPjU9XtQ7uY7H6z8x22pmlGaJrz4XbXjB4wurLHK
	/ylSSYvjKOFVqn2N7BY5jtSTS1W2T3kXb443Sg04wWqyCjZs5yXtjB5GDqgWCs7C
	OQojcc6499E+MEkeubqGc0goE66j65zoqd8WOsyLYwEUjAUdxboavgF3KLYHJdxn
	FkBblh9iVjSjCCTJ9OjmExdYSk7js3nZkATtCL+DQL2mba3FHOmDFuhyvpARn+Xc
	mjKHLvGsXzylIyy/XzAT6w6UWc/hnAKeTEA1zzbVdA2yCQ==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf30gkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:03:51 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc62c92d5cso35712775ab.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771414; x=1748376214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzFtqYN9pw9QSLrS0tK+ki9dIS1z5CdQtvo1AHtdQc8=;
        b=w4oSuAQzneHV8L9Xu5ykr394oRwmnIlEdwTmsGAsQt5FNXwDg+FpxkhGhMNUUenNIp
         YtyB1gxXM8LrdGOE13cwd9+Ij6o0XwOEzW0gvvSBWhAi6s6R8SMhR2zN+W8VsAznrGjA
         73zZxdbq3Em+KbSTp33qJ+KYuy+h5IqEbP9mR0ah/6jkolq5LEY7phTITpJFYeOsYzvm
         QQ6ZmBwT9NwYtwyPOPFWzFXTt6Csg6+LtkwcoOwPLbI/Y9dJ3YLmfsVWLgqVPc94BgNi
         AwuWZeMpGt/BSc7fi9t2aLVRKT5tHAz4zsnIfWsf0dKK+n1yOtC6mJKxWNF9aU3sYTHC
         7uKA==
X-Forwarded-Encrypted: i=1; AJvYcCWLG6i66YH2/TLQeCMrP60bpwhJN4nEWvw3tFIyzz2nRXajc5VIXvEq9ybw1j3YmYVMJB5w03OXLDUZPiRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz43168qpiVw18pQAISTVn2hpT4SJbditoXBOxRXlHJ2o69WER8
	51lS5JUo6nWzTsfT6bsdbGX9CnAM6uVlDm64JAgnGLKcRUm4JT/M88i5pa0ixvri0HVfpDCzDsJ
	oyUfUVwB/OwgZ76HARYTPuE79acl1CTNAHX/crHOs9L7y//qQWR+J9wseagh51WXv5X7T
X-Gm-Gg: ASbGncsB0geH/ZVdVESmBz2QlwQYo7XQoWiOHCKypmmcwxh62jfThNR7cW2vjHfG87L
	jJE/VASkU5gkbxDoGjKqStUO6fM0pFawA7pbfnjRkIjvtqdM59hYn8q9MKTYUXhqHJWsT6i+/hI
	VX0i1DlK94dPYozJ8ZqXHznT79TaesyBWL8jaan6E468O0MDchEaxMlJSgR6sleiVqDi8FSPDp3
	ZK58WE5n2tSEXcllZWYYGZmNzBcBVuVTTPokGyHFkkyrykfEyNtgWFS+XtLqk+2a7nIZLvf5quV
	dtabaDID8vq6UYkXmC/wtSrGchgut0mq1Rmz2aOHVUOsefGlqZC6aKP0hRcDL7xdfyhCWnz9KmM
	=
X-Received: by 2002:a05:6e02:4515:20b0:3dc:72f8:eb5a with SMTP id e9e14a558f8ab-3dc72f8f6c6mr59168445ab.8.1747771413730;
        Tue, 20 May 2025 13:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkMQW0eEqSL6CRJucy/8YPsL/wGcX1YlADkSUGzyRXsUQv1razd3w2wbK/Q+8G6RL1s8s8Aw==
X-Received: by 2002:a05:6e02:4515:20b0:3dc:72f8:eb5a with SMTP id e9e14a558f8ab-3dc72f8f6c6mr59168065ab.8.1747771413339;
        Tue, 20 May 2025 13:03:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1608csm2506687e87.8.2025.05.20.13.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:03:32 -0700 (PDT)
Date: Tue, 20 May 2025 23:03:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <3fbffse4iqkegqjheeptnmsofz7fasqgnpbhhbzlzibv5qjxx6@dft4vafwlkfr>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
X-Proofpoint-ORIG-GUID: jqDTurcJ6Uysnf9vcSpoAGhaL42DNKMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MiBTYWx0ZWRfX3mLUVv0vTm5B
 HBwwFTUssLLzi2HeO9frDdTzsnTlcbJ+6iqAxOzH5/Y5PknG54LRr6v2z/xbJy0mPOc5q1MefVV
 RFDTl6VrfCsVrhJsJ2Y5FzRFTKiqr8iGJhYiRXOsIKpyxVzVQc+AnJiRcKnl6jnfPMpbvf6nYLE
 U+ZWkhzBWKwFtYdMyZHbgERGVQ6YTrEsMGdqP3BBa0SBLNpHRFHYpD9LlZBqxcBPEtppJm9Eq5P
 m9XS6ETxj6K3T/42vULsqgdxcophlxnIOYThSYEK+ZVzMP0y2QKfqfmU7IjtuMCmUyrsyR8CB/H
 rXLo1kKk9VGE6zx6/cUPsG/KF1KiWXezXw+g4tuoiLZjKJgmWgFKcYa7Aa0Z2+fCLlbfLHLLAiw
 njul9Rgd5Dntj61wyyUnoT0BFW2Hxv1lsWCpl+/BedA70t7wyxAo1gr/1eZ4501X37Fi0m+e
X-Proofpoint-GUID: jqDTurcJ6Uysnf9vcSpoAGhaL42DNKMk
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682ce027 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=ZElDdoEkwM7Icc7ClhYA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=Ti5FldxQo0BAkOmdeC3H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=735 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200162

On Tue, May 20, 2025 at 11:56:16AM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.

No WCD codec?

> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)

-- 
With best wishes
Dmitry

