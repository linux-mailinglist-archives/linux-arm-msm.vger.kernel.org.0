Return-Path: <linux-arm-msm+bounces-66999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750AB14D79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD75018A2B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6083C28CF61;
	Tue, 29 Jul 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOR+HhHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFAD28E616
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753791097; cv=none; b=flXhLIAVDRFobzUYsTrkqgKp5UMHpeOVvrcGXnSNvVN/XeV14/JJTuAhWHiw/2Ku2M4K3O1ornaO4FOvYymtQSVhRPpqq7f3E48rgNOTdNuJtwqBBWPye9ekQiIkBq1FIYgrbkyKsN8gq3HRggSEpYJwjPt180j2zJHUSwLrh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753791097; c=relaxed/simple;
	bh=WtaahhtHI8wCSsflpowLiUT/PdVdKqZ4oKuS99Kip1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bl0tbIrI4RuXqbHbwuN0vgu14o9eXPO7rU1w2DRsVd88nncjEq9sXAuroL42BztK3ibXGyQb2cXnOBv/Hfb7AIXKfvNYoFQ+MjdjeETmgCtkdd94a1vFHIGDB6qUxMUCbujliMwKZGVkxt7rUHaPRnUvlkP+qf5RXk7kLwP5cB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOR+HhHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8ORHk018159
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 12:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4QE9lOzTrqBaaFrVLkONL9bTvaiKUb2/mfEEdEROAZE=; b=AOR+HhHONlZuDO79
	/zflcFlSc2qIq20MTQp0NwDDW1zBi9VnW+ePX2OsI8OPmmEiG99pXmngTl7iwxMc
	soBxgKAHjqc3mNHqC1SosL56HyGtRkBgVLbJv/or5QuN872SroZFk/mpyCa6vU43
	2Q2j4n0dNqE+jnz5kz3CH1iahtjW/YFKTO1v51h4LLA9bN5r/a2wQ3Qdvl10iocT
	7/wUtfPBPa8rs4jAstx/PGhuPL/lHIv4jylWPGvdV4kHnFpvn2/k67oZro2hCKnv
	QKCYVcQN4bYKvLNyUyQmwZuAzSm++XZ4OygYNtAaL7EWMyXDgaSALDWb6g2UhXDx
	5nrdiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkyxa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 12:11:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31ed2a7d475so2392203a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 05:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753791093; x=1754395893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QE9lOzTrqBaaFrVLkONL9bTvaiKUb2/mfEEdEROAZE=;
        b=Oa6C1fmhR1wLphvxBRlW2+nWtKN/QUQAR6B8QwzCyqI7tv2OCkk3awIV86ahdq1oah
         tNWN1iJioorpz0eIUXc1dHGZyAREAcSNFHR/6ZO2T5jH0PBNDaR4K5vhPbmLqVkr/K3O
         Tma6efvJaEQx/BEkE195hh/oAXq2UIXrlaXC062tRRmtOaTx26YlpCocmZF3xutNXlJq
         pPXQXiNsX7xmcYEDx/NOZzqlAJKQI2zSbVQEMcBhj7JOWsdLB9InU8vJUwC20TSY1e/Z
         kEStCc8SPEeoSQb4n4kbHbu8PSB55mjJ4DvyeM5fnpwqSVHe33t39uUgRMlIuU1sHtqH
         MBQA==
X-Gm-Message-State: AOJu0Yx9sYa+rbFokwiY372cB6Te8wp80yB+qRYHOflYHx0oRs2q3nYk
	KlhCOCJH0Cpurj8qgXuR5wZTHhBAI2aDOxi/MeYP+793/MWR8wjC0fxyHHMeLU1y7MK0kp9GAbN
	gzlIh0VA+j3UYgCUYVofvqgiqtXxot2njHEz91R0mcrnqCcwUgA4j8pQi4PCjrLI1z4Rj
X-Gm-Gg: ASbGncu4axXXgcvu/wVXgunZhGO8hui8TWYwLv742HYLja/G+kvZmF7h9gYSWKPvyyb
	l0h0zWVfM2YuSOToLkyEn0sUUanwNYdE9/0pogwi2mFxfQQAqCZxd6PAnx3mQTZrrRfnE9o6dEr
	MTi+Rhg65Vjw0PKS3izOELUgvhV+9fVGVDx6sve1NonW+STo+gbK210VL7oGw0KU2RGRHSeTQ3W
	unY+yb+MaFYrhCG5QWpVr+CvpPFzTtOWaNuRTJ/eyGZfxAKexglG2iDd0TGd961utkQl56iipmk
	LCJufQSoBbr24fOweBVgCEzwzksUVdteob4pxCgEjHj1EE62zOm5m6FB/DtFFp1e+5mzk66X
X-Received: by 2002:a17:90b:1809:b0:31f:42e8:a899 with SMTP id 98e67ed59e1d1-31f42e8ab21mr1328755a91.13.1753791092865;
        Tue, 29 Jul 2025 05:11:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsgLFy8b++ep6TqapChmczzcUReCy8+FTDkc9tnmCqFhUILVLHVWY3NjRVOTnzXnPonH4Baw==
X-Received: by 2002:a17:90b:1809:b0:31f:42e8:a899 with SMTP id 98e67ed59e1d1-31f42e8ab21mr1328707a91.13.1753791092318;
        Tue, 29 Jul 2025 05:11:32 -0700 (PDT)
Received: from [192.168.1.4] ([122.183.154.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f5262aa05sm69491a91.32.2025.07.29.05.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 05:11:32 -0700 (PDT)
Message-ID: <8b7bc371-576b-4a4a-88a4-a4ed47d97778@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 17:41:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
To: Violet <violet@atl.tools>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250729120331.287245-1-violet@atl.tools>
 <20250729120331.287245-3-violet@atl.tools>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250729120331.287245-3-violet@atl.tools>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6888ba76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=A1H60L6fWQAu95VAuYzdKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ZSXNc6tYleypp-tdgiEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA5NCBTYWx0ZWRfX94DJiSYabfH5
 XATNuZcngK76qqviuZJgXCzrZzo619i10W0YIoV5+l4EKs0Funq++45mkqrM/P8lgKgrdfXUMIp
 P9l96kgdgyCNRM/hZk1jsGW/9tyAnpWEDAHTn+Tnx9HusBcTOl2zIXWt0AbV9uVw5WAXa0ihebu
 +H1FWNxs/vJ2rQTduUmwUrN3gXgTQECb/Zqolya7rHGEyzkeVkEFWbnHoiPrGh3s3bW6OVNuZh1
 s96XSnn7HezIywPZd3IWmSYrYLVssiuxGtrbHcU5l+qyS3+kPztqFxmMHIh7etoVj/1nL5rKSAn
 C1xJSSpjnlaSoKnGqz6RpY8/Zg+G/ouwIwSRV1S+rpXAbZTAB4GHWaQBb8l/PgZXIA3ndiJAUex
 7wW6CEOoI12/5p+FsXvAb0p175TyJEOvMgJt5+Ypb1K8mi/aZlAh4c26MisYJu+mBs2+0Ms0
X-Proofpoint-ORIG-GUID: nWqcrgpZiF5irb51t5Xnwt-YXl00d7d9
X-Proofpoint-GUID: nWqcrgpZiF5irb51t5Xnwt-YXl00d7d9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290094



On 7/29/2025 5:33 PM, Violet wrote:
> Add new device support for the Samsung Galaxy S22 (SM-S901E) phone
> 
> What works:
> - SimpleFB
> - USB
> 
> Signed-off-by: Violet <violet@atl.tools>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 147 ++++++++++++++++++
>   2 files changed, 148 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> 

[...]

> +
> +&tlmm {
> +	gpio-reserved-ranges = <36 4>; /* SPI (not linked to anything) */
> +};
> +
> +&usb_1 {
> +	/* Keep USB 2.0 only for now */
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";
> +}; > +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +};
> +

Hi Violet,

  The usb node has been flattened recently. Its not merged yet, but it 
was acked: [1]. Can you rebase your changes on top of this patch [1].

[1]: 
https://lore.kernel.org/all/20250715052739.3831549-3-krishna.kurapati@oss.qualcomm.com/

Regards,
Krishna,

> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l5b_0p88>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +	vdda33-supply = <&vreg_l2b_3p07>;
> +
> +	status = "okay";
> +};

