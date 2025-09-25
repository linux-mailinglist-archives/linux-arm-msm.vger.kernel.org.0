Return-Path: <linux-arm-msm+bounces-75200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CBBA184A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC71741A28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FCD321287;
	Thu, 25 Sep 2025 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncHx4GVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B12D0606
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835251; cv=none; b=nrnYheI0LD3UhYX4/h2zx6c92CtimhNFfwRinosiJRvCXrgnmSgizYih7vB5VlDSckEXpRKh5yHsg3m3EjD5I2rpu8/mibJYHU+ADk9qClc7QFi3XpTJkY+YrmbeZMIK/yxgihFO5Hc8SeYNabd1FXv81iuJkoD6/2iPgipir4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835251; c=relaxed/simple;
	bh=rcBKbX2QQn3pJYGix6+NDLTiuW9SZmD8SBtEhKyVVY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0ItrrvYE90GIo9NmFFHZzpYJQiaSR7atetzfhurzFImAMZjedSPk8xgLyjtjyZtoegRH8qC8QgCP6XsrqDaDLJf15FNrV3LARYtr7VqFwb+aK6e3JY2KV2JMPZaA59X0nGXFwx07BNts6w52NY0zf6r2SPzyWb/mm2fkkP6zUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncHx4GVX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPmUs021671
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MNWENP4TW6FfVNRa3Q4FonUZ
	vk/5CHP1DhoTM0WHlGU=; b=ncHx4GVXQYg6MMTCJ7RYXegpCgTcsQFO1PK2sWkd
	mdL+P05vzuo37QgxtWCzzjikvqfRIbzHDBPK0ez5c46VeFHhwz7tzQ00lD0zRCDM
	6DWYi0TmadbPFFIfDdo0O6Z7RL7udFzvm+hF+04cD1yL4uY5ez4uY2kW475XsnPF
	VSDF673dU2WEOcAl+v5CXgx523H6ACDBNMghyE+5idEDNK0MmUPSrrIrXewH3s7h
	VRxwnx6B61lB4j/f03MpkZCK2HL3bKA1fX7lN4hoDrufJ/SzHv9Qe3g94hySXbIR
	9jkzrczffUacIFjInqYrqkaby4P9/hURvoHJSDHISC8cvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qreg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:20:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d77ae03937so39750121cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835246; x=1759440046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNWENP4TW6FfVNRa3Q4FonUZvk/5CHP1DhoTM0WHlGU=;
        b=eD/mCXXcELRpH+GTyXcNq869xSBWLF0pNIOgic7LeYM1WrTFAg8K+8nnpfT575dyEV
         hAzZmJDfewvrQPYFKoIhcUDr8pthsN9tkIeiaAcnp3ZLs02iYV9jQjsTu6FZ+JKp2yQn
         Tsj3JSQvDSlakCBCY89GSCm+n56nlaF9Iq9djYvdiHj3J49lr3XHoG7jjl0AdJluDCPp
         4q3KF4Oyne1t9PR36BPCtxK0V13dN3NfzR+NNktr/EL15v4ZVHuClhlBgKcWBiDX3AQS
         SCBqZdDELR0+9uJ63rgWCkI0xlqyJ/X4U2EFu2h7vMllUyLOGQYt1KMJyqt3tPp5M6og
         tgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIAsk6Pm+3GevpKZ8kyK/TUvaIFofFazkJ08X8KzHriQ0PJM5wu66SyPmola/jiNVQpbyOFiuU17zd4eFI@vger.kernel.org
X-Gm-Message-State: AOJu0YwnD0VQ5wJehpFiooNoNXYsCxWy1J3pECiNZ08FHBrnBZCdlL9P
	csrX88R8VurgeS4Jjssl56mOp6jeQLAYH73xkSljNt92tj7ObzyvzHEAVvrQIJNX6ioKHr7N82D
	pcjV5rN7X1iVKUibalm2+Wn5wkvRY7cQYLw0IEwwxvTOvMFUCNktwKYauRm6mpz/m+UvW
X-Gm-Gg: ASbGncsUSryjFV8gELFQWZ7DrAtnbP3OQPbiGfCCgSHuTwnbLy/dUHhaS/gU4iI/8PV
	vJ1wTO6q2CMWoHXqVzvOUJdYzhbeXNZlsibY176rI9kuXxc+EWv+7uDLxLQST1fmecie2U3S4gF
	KnwmGFdo21KINMtETgDn/9CYpYfBGwu8KgoMqbLBiBNL6RckUpfL3VRqP+ovSpzM3PvN04FYrP/
	7F5XqRu8uebQd1fSoVz5BxD/GZ1zIva2tlPlvpvceXjLT2AppvzmekRR+vWQAt1K8vkmygc3zcU
	/TY0uWGFR2mLKecVT0q7InlS/lCiSw9ViKAD8r6bsopXNDjLkP0fxHpkL+9MNx1ewvym9OwEyrY
	WaRvXCxosXBQ9Kf5YIhSDnbeOJ0wnCbHhvBUIlPtHzGMcYaw7XQF1
X-Received: by 2002:ac8:5852:0:b0:4c0:9328:18d1 with SMTP id d75a77b69052e-4da4cd4705emr60742261cf.62.1758835246250;
        Thu, 25 Sep 2025 14:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1zqTH59YzrLbgWLCbgeEbMpGPbOhNPJ4n+cnP8cXc6+u2Aei7sqWMXJ8qxBaawt/sIexYRQ==
X-Received: by 2002:ac8:5852:0:b0:4c0:9328:18d1 with SMTP id d75a77b69052e-4da4cd4705emr60742011cf.62.1758835245791;
        Thu, 25 Sep 2025 14:20:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a3102asm1122425e87.97.2025.09.25.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:20:44 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:20:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
Message-ID: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
X-Proofpoint-GUID: g7Mz5cKjnn3ZkhZBNdHH4l6aYe7KS0f1
X-Proofpoint-ORIG-GUID: g7Mz5cKjnn3ZkhZBNdHH4l6aYe7KS0f1
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5b22f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=awjpS8ss-hU3v18DcjkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwmhntwAbhLzB
 htKjrXsg9rPk6apjSkdenQ+YmstL9jC69XzjKQ/psflMAjywb+54W7aIwc7kzKChQzxuEcV55+W
 pBfkM9yzTfqCvfwXWq1rNnrMJs3BvuWLttrhqqiiX6gLu7puHjVBNnkcF0AGid9k0r8mYs31B4J
 dS2D0+t0sievxXD8FtrD1YpJvAJRwJknPvj5tpJdTuF9j5s31VGvOgYAc0XA75E0/8ttMamG3MV
 QqQR0IS/dFhLYuaJtgq9y60D977DARwy2IgKPuafPRZcTB/YbHOE837zBq6Di6UDJrmLK1em09k
 1RCUrkeCxSmGHdflk+0c9VnQU0TD3vdUGa88fRa8zVhTkNMgFI/PB3FxAgkJNXnMdPNpp7X+bpA
 m/cTcKJd5p9AcxbmIYYXVTyr5N/Bpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.

The commit message needs to be change to describe this change instead of
the generic facts about SC8280XP and SM8450.

> 
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e..dbfcc399f10b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -63,7 +63,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sc8280xp-camcc
>                - qcom,sm8450-camcc
>                - qcom,sm8550-camcc
>      then:
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

