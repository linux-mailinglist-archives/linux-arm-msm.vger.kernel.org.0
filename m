Return-Path: <linux-arm-msm+bounces-77154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03692BD8B03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4DC24E2154
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC0A2ECD26;
	Tue, 14 Oct 2025 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpQiSkmd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9D2D4B5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760436866; cv=none; b=KTCVPTBQCkYQSpwnpwsJRcTER98XdAbYJq4D4coT2qfUVT8P+0KFoWt4BCyPK115AJ+xJ46HGv3OdHuHsz3ey9HC7h62VdAJfb0noEdL30LMzn4Kks39eds4pa8D5tdW2DzHCSoaZLpeUW24vL7wNCIk6fyekUGq6C91GE/6GxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760436866; c=relaxed/simple;
	bh=p2TdPMV4pF8n2l1FtsxCGoLL8f8hoiv0YnRdvUXX/Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2+E9hwYmy9EAHP8YU2VAbNXBjXK5udrmOX7yG2/BuSBa9jTwLz1GF5tJvFqB5MXQ3sFODXG/onCbNYK7yIZUUNyIRULAsLoFXDJJ2ud753kPkwwcwpyeY5X3CEl+oBp28sjaJCgZ1iGrAJnfTt85ofB8e+TkpbVQVS6HT/pu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpQiSkmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87NP5001552
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMqv4XU7nIEZtG/sYMmrZR0+
	HUe1TmboOJN+Lx0BU9A=; b=lpQiSkmdqbENU6E09+OLL0c0rGlbdmFCqjO5KuE9
	x5ddN2YLeiOmpsl6+RX6fTMK95i7qVPY71hB6MfodrIqY8plcZ75YQObzBHwzk2p
	z6ZeA1jdoz69eZtg5ZCBfuAYajXoBamGM4QTgLETBHKrqgYL0EIG6SshP+rdLbsj
	iMwvQS/Y4BJSbkhCvp/5a0WooKlgUEgHsTDHSHJeOZWc9eBzMv+r0WypMHTI8s0m
	XRYKD+Z+tg0yuPb+P9hWVsREAPI02HN5Si2Ksn3uRQgdGAefzzcKLF+GT0PC3p6X
	XkecNJfOnfIdr3D4FgA19+JasxOlKJW4YI9VwQW19oReyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk8157-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:14:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-872d1a88c7dso811773585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760436862; x=1761041662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMqv4XU7nIEZtG/sYMmrZR0+HUe1TmboOJN+Lx0BU9A=;
        b=BT2EUU4y3cbYIgRhgRS68Q3Y7sCYIxyrmXUXLoNtQlMncJvEeYHBH8Wrnh5omxi7TJ
         +81RotnlPFAPWWWaWk9/SapVigwhiYsbfxvG5HYnLztnOFXfoafE8Xx5pwa7W38Tdw4y
         vSY5eJ5Phr1ZUv1UfPQaIhIBhPJitXzwQWRS8F69Y0yW3DYwEXSf8mLeStIN2klQPOuP
         Q9vbW1RIyDglbmgCbghaTDQ9F1J6ZgtNUwfXemFFRXai21+6ACDrl6/jWOKdFHnacSyh
         FTj4aaFglXMbaLVHYZiysTVkP0HeblxFZzbIoqiMiO8UtBuOVlLEC5UU6+ZtjXPMcBfw
         J4hg==
X-Forwarded-Encrypted: i=1; AJvYcCUnxYiuOY8A+a0r6DauoVirz+nGx05cArMb6EnYgfYw1dccJxQUs8TxA5es7VF2+8ya5ibJRTh+BpM9zFg5@vger.kernel.org
X-Gm-Message-State: AOJu0YymIG67uhU90HW4J+9C59BOjT9ex2Y5YYOtlLsI19vm+nmrvitT
	PVqbRcJUQpHz32k+QrlE7irjxOvwsgC/MPBsIW5mxIzAK4ioAyhrleRmDzTjk0lln54PQnRzTY3
	61IUk/wyrzNkthXhdenDDHNvZrzBg1ILYvibnbsSKwdhXdYF1sxhWsSiwf+S/Ty2NIfhP
X-Gm-Gg: ASbGncsuX4f1Dql4i+0Nh5rHJwkGftTYqd0rJ7ReKVTS1hEpJnrk3lcucNGiVjMW+KE
	XAl1rjKiVEhJ6tE4OPj2BVDVenOSgLdYlV1EgaZCVh8CZnmYxlg3UDb8JhaqTlWIsnxBErq6zNI
	KKVFUofTx8aDgMP1mDoxnMhgtb/Pjw4Kj1z6EinkIlundYnb7vPzq3nYpnSa8HIUyNuEthmldxF
	CS4dpz37QePIH97kLq/WCGiBal6BURPJyYx0UXF24McqG7UeBlWUiqWmDQfhnW0+LzcAjhWYRWw
	qRT7iFR4eNAK0ZV/UgXmuDnXm4UR80XsDHVrd0VCv5I/Gk/lAEVub/jaGgZVM0IhgRxvAynIEoY
	te6vN90FKKdoIjDH1VVBEmC6upAxWKyfcZAI+wSc0svCX2EnvCYZE
X-Received: by 2002:a05:620a:701c:b0:852:d8db:f4e7 with SMTP id af79cd13be357-88353b34013mr3649401485a.43.1760436862450;
        Tue, 14 Oct 2025 03:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE26zUzxtiqBGz0fWHzoxuwaD0agTvo+ttD3Wx8z2D8qcgGeylJwiFMQLgCJJlf67ZKAB+sWw==
X-Received: by 2002:a05:620a:701c:b0:852:d8db:f4e7 with SMTP id af79cd13be357-88353b34013mr3649397085a.43.1760436861964;
        Tue, 14 Oct 2025 03:14:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ee2asm38789591fa.50.2025.10.14.03.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:14:21 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:14:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] phy: qcom-qmp: qserdes-com: Add v8 DP-specific
 qserdes register offsets
Message-ID: <5t3uowqhhmnbqhrvmkr7pfls7753banu6aizlszczrem27uesu@po47ah6eic7p>
References: <20251014-phy-qcom-edp-add-glymur-support-v3-0-2772837032ef@linaro.org>
 <20251014-phy-qcom-edp-add-glymur-support-v3-3-2772837032ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-phy-qcom-edp-add-glymur-support-v3-3-2772837032ef@linaro.org>
X-Proofpoint-ORIG-GUID: RNgdrtbdr9bLzdBKXHTYHxlcMpWt0n-g
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ee227f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=UOUSw7ZRRveOu6dMj8oA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RNgdrtbdr9bLzdBKXHTYHxlcMpWt0n-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9tv9A0HqjVhy
 w/+y2ooU5a+LKkA1uXI/Eo7PopO1zjDLXqmKo28PnfMJebsmmNBned04Hkapgfqq+w32WlMBhOK
 9LVNdphb/vyTlZFYKjyuvOWpL5ciiME3dQXVyayH1hqNfBLSgPchIUQVVEBW/7NMN6w0zGdk/mz
 UlIEFLC7r2CcJaMJtyiBSPoPKocaa14df+lIR6PLLKQxfjr43bguo+XSGf2S8sHb1jYF1OMgGmz
 Wt3huYp3W0B/CkK1sOOQtVRsuzuokozppKIROmnjDFnBbsWPMjZRx+CoWMszRBrWl/gsMYk1KFm
 AKFT/zjXi6n+dYfmStNAPK00Kk5+noQSaEsTu9i8ghlhBWoOj4+RVaIIzh9mmjdk8NgXBSw8/3F
 rI11yWq0GYB9MNtzBtDtfuD0RK60QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 01:02:29PM +0300, Abel Vesa wrote:
> Starting with Glymur, the PCIe and DP PHYs qserdes register offsets differ
> for the same version number. So in order to be able to differentiate
> between them, add these ones with DP prefix.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h  | 52 ++++++++++++++++++++++

I think other patches have adopted
phy-qcom-qmp-qserdes-type-subtype-v8.h name.

Would it be possible to follow the pattern?


>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2bef1eecdc56a75e954ebdbcd168ab7306be1302
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-qserdes-com-v8.h

-- 
With best wishes
Dmitry

