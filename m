Return-Path: <linux-arm-msm+bounces-67935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E80D2B1C96D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F17441750F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C822291C39;
	Wed,  6 Aug 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVYKFz1j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6E53AC1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495921; cv=none; b=ZEt/+TtUxVdKJS60BdTw19yfInp0Hzr0y1ohzRY8h8jiAGLSaTFpQxfx0c2zCSjGw/0kA/BRrUpZe2PifxzyoLDQ1HgG+fqf+AeWzCq3QMhI+GP38Z/szHZiJL3VJb2H+O97S4eR7hGwlF6uBJgSU/VUqCpHZVGBYHIeaQvRgXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495921; c=relaxed/simple;
	bh=unBw+GnMWnnx7sxRmdXg/LrEJMSOpQKmyIAZWWmxFYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgX3t+aMbfv0nLtIpKWApEv5xVucngWs+FmJQQ5g/45e1D/kJeMc6MNwsJMF9Y1jz+TUwpK5hzUvz9t3EtKQQRyWUjKPSar290tPF2Tf7DvvYRYpmApVT3sBNiJTUFm0HGmP4OTBfg3KyoZVLX2d1soHvynqodIScVJD9fM8d1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVYKFz1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576C7cTr019899
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 15:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNS/uT0UsRLTZGD2d6XkWPD5SB9JWddvW75QWH/H0eU=; b=AVYKFz1jdDIocdhe
	0o5fmMz+DfjGieO6x0g+rQWNH5CaTK8jk7KRHLUEISUv8IEDX2O+f8VVue8xWmpc
	8OwMlUTuzuVivad8WHfjixUvac4VTIyiMT2UwiuuBf0w1LMStUAhV7Nfq4TfdgTF
	58nAu6jegsO4PaWqb25GfMeisXKhUFfHW0SHQ52xgr4yjdIuNWOrGKGxd3+qSeFe
	509UJeVj5T09RmA3gKSbgyU/0pR6oeon8uOf+iHHo53iiXoHCAacxCeuxoZzxrtj
	xBMtA3/Euf7oMzFiFCnC1CNJY4W7ZjKQ5udtDyN2sGp9S6SFW/fSazgsK1w5XOIF
	n1WscQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1ba4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 15:58:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e698aaff5bso177885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495918; x=1755100718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNS/uT0UsRLTZGD2d6XkWPD5SB9JWddvW75QWH/H0eU=;
        b=iadQn0S4DEgr7jejQINJB+fxdyI0iHNGcPefdYcNhHPkijdotXaTm0s8DR30y1fmJJ
         u1kbZcAt60go/0LnoPqsCo7Gh1r7+9BxLuD2eBzfT6Npra4k9h6zXdpvh++FC0iIkiaA
         boXXS495P5xW0bbN3rxNSqrdDyxeXYZ+getxj8UjRM2FMNy0fMviRRWiGSBEYWon5x26
         UITXwfKM1zINXPICZTqk64uebyaUvt4kfMOZPiD3dJgcdrQoDKQCTZelQdd68hts15d8
         GpLKZStvYo2nOA8PGeIYbkrJewNI+Y7NEDJawtJ87boelWbbzTpGkzTPT56CRoqkmoNH
         fVsw==
X-Gm-Message-State: AOJu0YwwKeTqKQ0owyTFDJjT+JxvFi+Rj0DOBPcaXS5EhPqHnLad7dj5
	bqM4qngmFMe38LYmWQoPlvmnDbx+Kas4TD7woj9YI0SUD14jnOQBdaWCp6/81iHdYy72TBv+I/u
	T+65t8YqXgfA/O2byyGYYor2YlCaclhobPbR31F+tx64pMEU24E01bhYbxI2jX26KJsF+
X-Gm-Gg: ASbGncsAdzcM9eK3ccjyPx+otx30wwNpfok5o+bYk9JiTlrsfeqX9u8TI7deJP6fDg1
	qD1Rldeu3SPsuWAe6wwXp2KToBbKOfTxjpv2kKPJU7nG1n8ZJOlQaUG+5vOxpLCu5cjj67KjT2A
	B9G2YuRovyC6IKMyHX67Rfdp0hyUH4uFk4oR+9rUBixQavu7M+ki9C2tj7wQPjt5WET9oVOCVXI
	P1d6AFSa4zgnxFeIDf2ZxkNGnA5owMg5PM0yZNf0zhxrtSv4JmLG6CHq/JjOwJtnN6PadiDK/Ps
	HeAqiIyW4HOZ0MJC01L1LHdx7oSMh1D00dm2zC4DNRm6paTa9ZnGsrHruRxsPDWuzpZd31Cf9VP
	0Mxla5g7BKnB3eaO7Aw==
X-Received: by 2002:a05:620a:2584:b0:7e6:81d9:359a with SMTP id af79cd13be357-7e814df0c35mr241157085a.9.1754495917405;
        Wed, 06 Aug 2025 08:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2XRnua00uhBgXJfMjuaXYjlV+/ag9i/MerbwZyjSbEZJVYDAvoxc5k5/SUInzS+jgdX/iJg==
X-Received: by 2002:a05:620a:2584:b0:7e6:81d9:359a with SMTP id af79cd13be357-7e814df0c35mr241144185a.9.1754495914102;
        Wed, 06 Aug 2025 08:58:34 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8feaf2fsm10329223a12.38.2025.08.06.08.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:58:33 -0700 (PDT)
Message-ID: <f368b6da-1aa3-4b8e-9106-3c29d4ab5c5e@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 17:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
To: Mark Brown <broonie@kernel.org>, Nitin Rawat <quic_nitirawa@quicinc.com>,
        vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, bvanassche@acm.org, andersson@kernel.org,
        neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806154340.20122-5-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXym3Y1wDlGL5v
 SrOlcsixxKcVkPktUao3Wxb3DetCAwNVC4i4p83A8UnjvA9UEEoZj1CteGfT5EXx9XCvAatMSaf
 lGJfiTW7UpoWJm5Cm2IVrvTX8yQKBgwFdJa63VWyAZb20+FEAVoaNoayiQbhrWNrftVtb9zWZwl
 b+h1W3xG9CfbTheYEaCIXcx5FiYubrbqdN6kh9dMII2G6BMopNSSBzhnE+H7wAM2Q/Jb757yb8Q
 p4cs4zYPcTkXJuGjiHeyGQuAEWwxjEnWlxqnMZMgEIxl7UdANc3mwhJghvxSExVmf10fRw3kxQi
 jMTP4d0wlTqclQRfN8NIQ6I2Sh8vaY9KZd5T9H6eOTkMGBVgO/q4uy7W2t0+E+V7xKsgC1Cm25i
 S93B6394
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68937bae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=LTPa4ebz5QvcgEhxLXIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j-g2WVlP7zDtsmQDK_jPzIYFdBvhjRQf
X-Proofpoint-GUID: j-g2WVlP7zDtsmQDK_jPzIYFdBvhjRQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 5:43 PM, Nitin Rawat wrote:
> Add support in QMP PHY driver to read optional vdda-phy-max-microamp
> and vdda-pll-max-microamp properties from the device tree.
> 
> These properties define the expected maximum current (in microamps) for
> each supply. The driver uses this information to configure regulators
> more accurately and ensure they operate in the correct mode based on
> client load requirements.
> 
> If the property is not present, the driver defaults load to
> `QMP_VREG_UNUSED`.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 9c69c77d10c8..6e116f7370c3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -39,6 +39,8 @@
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>  
>  #define NUM_OVERLAY				2
> +#define QMP_VREG_UNUSED				-1
> +#define MAX_PROP_NAME				32
>  
>  /* set of registers with offsets different per-PHY */
>  enum qphy_reg_layout {
> @@ -1894,15 +1896,29 @@ static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	struct device *dev = qmp->dev;
> +	struct device_node *np = dev->of_node;
> +	char prop_name[MAX_PROP_NAME];
>  	int num = cfg->num_vregs;
> -	int i;
> +	const char *supply;
> +	int i, ret;
>  
>  	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
>  	if (!qmp->vregs)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < num; i++)
> -		qmp->vregs[i].supply = cfg->vreg_list[i];
> +	for (i = 0; i < num; i++) {
> +		supply = cfg->vreg_list[i];
> +		qmp->vregs[i].supply = supply;
> +
> +		/* Defaults to unused */
> +		qmp->vregs[i].init_load_uA = QMP_VREG_UNUSED;
> +
> +		snprintf(prop_name, sizeof(prop_name), "%s-max-microamp", supply);
> +		ret = of_property_read_u32(np, prop_name, &qmp->vregs[i].init_load_uA);
> +		if (ret)
> +			dev_dbg(qmp->dev, "No max microamp for %s, using default %d\n",
> +				supply, QMP_VREG_UNUSED);

+Mark

do you think having this in regulator core would make sense?

Konrad

