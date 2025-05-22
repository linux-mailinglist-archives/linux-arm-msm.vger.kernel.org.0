Return-Path: <linux-arm-msm+bounces-59043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1CAC0B7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6FAD1895D4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904FF268682;
	Thu, 22 May 2025 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa9YyTqc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E81E485
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916306; cv=none; b=DgEQeThqw8BPmriYbuGIN3QU9XG84QS/jX6v9WjLQNLB4xN8xWJvtd1kFOH3ccgXslhZ5QCcgpPlZzJxupKd6oa6RujrgaW+aNh6Mt7QGs4kz1NFXZjWWy5+fHOgqBhTYD3R0452XtVTTnWRrvFdnKuoPzKPUC5VEc+bb9ht6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916306; c=relaxed/simple;
	bh=n5NvcF86AW6hY51Jx68o6/rnmz3zNVCds/LjSsBnAH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFVlac7tecsU8N+DrPbJGkp9qMgnWtVSMC15tdOMxp48lChPiDhQNeKNePk2N+hvnrhIuKVIoYwRmsl9g8ITtrsQzbjlyouDQ0oyh2D/XYY26F4OecLvN6awYWbUF9+r0sqIE+5f4viP8XSnKi1L0PK6Ws+n73DiP3D2/mh4J2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa9YyTqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7SpuP006789
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lCT7OHY4qkgiQFGYQKA7CZb
	Akqwj5/9Vf4jfYRxp2w=; b=Aa9YyTqcmPha0q2DghHt2xtcU5SYpTQI+wn9JyNC
	TPmR/lWZKU1zGBkKvQl+rzqe05qy4HRdAZV+B3kZWUl4/udXyyDvY6/aJQyp5E9c
	PnvR/TqDIzEEHZj1YqRBOaYT8HaTg/C8PrY7Y9Cw179AUBE8TUvX63Onr2SovWxr
	6IEi+hF8cnpPoswawlLp1ruya8hMT4vsx/Rh8Ai/+QZVJWnDpk6FtY79pkseUoPc
	IPCL9eZHPBgHBaff/H9WiXFv/HAegnUtXq8jI2RrCFcxiKs360OkUIBxn+JMsXcj
	zVWU1JPyA2bUkkZpw68CKKht2EwzNIimJnvyVObqibnkxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0pc6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:18:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b240fdc9c20so8068741a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916302; x=1748521102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lCT7OHY4qkgiQFGYQKA7CZbAkqwj5/9Vf4jfYRxp2w=;
        b=Gtw7m1wY0cr1bRFjrgBLM+ver/4cWR5Sa0R4OKzhS7uLWsZzVBG885O/1TRGh5ttpo
         jzbUpo4T+k9uIpqIoaoqW9CXvJEzFvyaNiEK7g7nTBBRGvI+mzDRx0+vuGPg0RGz3hl4
         3+9OvdSyU5wPXkOZrROy82+Y+/TyRZHIDWag4VxlT9xAAwU2LHexCDSsc/RSuR8EMzJX
         /6tFRz5eosRXF5MsEQqgVj2wC8WG6LffXGC6iKREyriWa5QjIXaoJ9QueW9K3QklLU+V
         gkz3QL7KQQF0FOx+OtauLW9XprCo7XYGKLZA2cw5rispuhtl42WMx+oBSsyOktI10RQH
         SJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXcytDahTBXvpGfw7K/YrmpnYGgQ4AnbEyMLCYopfu1fMKv2Kw9lbByxeKKAEP0E0L+Cv/0mDHoDkkv4ckx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjhz60WfYALFWf3XJyYvu7h8IilDpFKv6EN6axlPNyWgWFYi7E
	AQaB9YqcVDWvcgYfDKs4I+YhQ7CEebRKafakRgQRr1B07Ym/oCGIdzwfrCJTLwjh7y4ZMSKV+Uz
	yTw2l7NgE7IrQS8umqCfxU/DcvKSKUzRC7nqjukbp48lH+oZCOa+I2v1EQpT/Ck+13cTiFIIbGA
	UUawZedTvOl/Q5noXEpq0/H2F0H9q0GNNBqXqHDj6iKYl9q48dd4k=
X-Gm-Gg: ASbGncuB+Us0LJd5uGZJ8Rm0N5ysjCREehNClHuzHXNVeRQr86c95VIgU/fN5D2SZOK
	54MeXqsVKdcOI3V/0qOWT3EEWNfxPB6Pcxz0CRg/ldJP02px8Mjoj1OGcCtdaEhC85VzFf8KgRP
	lf5PZLGAM=
X-Received: by 2002:a17:902:ea0e:b0:227:ac2a:2472 with SMTP id d9443c01a7336-231d43c3e5emr391816855ad.28.1747916302402;
        Thu, 22 May 2025 05:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVCBtSXCGrxGhOjYPLWJ1Pge+L+iUp5ZhWbLEtsrjwBVC47icKDyLQuongy1ue5r0NbqFAbpPouL6VSBeNM0U=
X-Received: by 2002:a17:902:e885:b0:22d:b2c9:7fd7 with SMTP id
 d9443c01a7336-231d43bda66mr369410555ad.21.1747916291391; Thu, 22 May 2025
 05:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org> <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
In-Reply-To: <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:18:00 +0300
X-Gm-Features: AX0GCFsGEs3QorxIOmjt3hRGNqdEtBYgdaIA34L_R3JHBLbT-M4cKvdAgLWPMNM
Message-ID: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 74hKqWURSzfRUpLMMzqWWO8rgzbuavdP
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f1610 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=aPcUfg5sKJd9qEyIwccA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 74hKqWURSzfRUpLMMzqWWO8rgzbuavdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX0sNuhF84WFLk
 5akso4YVJ4IZ/p7w107LDYZP/dac75ciXZU+HD8CIRqrxcs6I+7fxr9vd5ogp0znOzVsxFtC1hT
 bVVAFupq5DmpPgusYZG6K8kHnu1pAyu5wGYx3jt1U5VwEq8TSdphvKFC+cAnqO3TwAljrkDQ4+Y
 EAqr99mXjrE6M32m2QM9tnycVocK5y1H4XmJ0rwA53pkp0MWWIzyA3uIXUlqshR2VHJlXcov/iJ
 uBiEIp24cWfbdrJO2rrkQY/fNi9bO/CQnB8kspo+LtBAzuC0+ThTjuZiiUtJ8ZG3MnrBzLBdTbu
 J8sgs1zDDkhKrR+6XEUForretwAnyMbLd94xcA1XHpJrYCONVOO6KTjajcMD2w0+qm6A3J6xGED
 hiMF+VDQuchO5S4E6Gm8ZhpTcbFzhvB4KLz/Lfy8AFtrl7nmggrbizX9y9VePnUld/VcGCOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=569 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220124

On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 08:49, Abel Vesa wrote:
> > On 25-04-21 15:00:13, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> >
> > Nitpick: Drop the double space from the beginning of each phrase.
>
> Sorry, but why? That's a correct grammar.


Being absolutely nitpicky, this depends on the country. In some cases
(US) typography settled on using double space after full-stop. In
other cases it's a normal space.


-- 
With best wishes
Dmitry

