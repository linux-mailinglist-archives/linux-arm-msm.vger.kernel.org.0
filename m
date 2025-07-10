Return-Path: <linux-arm-msm+bounces-64354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A448B00146
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E1C3AD2ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006EA2550D4;
	Thu, 10 Jul 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC4i460z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3121B2405ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149455; cv=none; b=VJWeXJijc43FSk2DK1+0HKrQZvcnvmYMfEBw+Ojd0mIlRl79BEMBshq0lS0bEOr2FAcZP8CagGTkeOo4dUo7y1vca8iTFBttTzfL7/XSo0/aat9/KBo5LNUcJvvaCNO/ee49DXQ/S17E0EI2TmDEQDgEQWdDvAWNTbIT0irgfv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149455; c=relaxed/simple;
	bh=3WpSLx1lOvBgBlWtCmaes9/MUjWZbRyaDXKVUI5jEkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaPaEP65GB+ZZjdIVnIOglq+Lg9iv1rShBosO4Iw3J5Jd3fIznZKCYjb9/VziyGRr0im/l4RoGzzVkqsW0Li63S4/fJ2TgERHE7oaCTdEdeW7xvODbxjct/0yIYeB5eVjAmbEg8KqFPpcRawRsDI9UZRNhfK73HcOFPc9lXDYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC4i460z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9HFpd010099
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qylshFqGhjqdpqss4EWahA3a0P0XpI5R9ccWJmm4pUM=; b=HC4i460zUPUFENA3
	MjRi8M3dzKhyuwssANgdh7k8mfip5nLU8X7F1JLj/sxneVaa7iaUdR15UzXVOO1F
	ImzFzHvTm3/blYiN9gmEt4eFM+SKwfcWqWcLM5UUWm+cNkd4TvGlDZQkev5fv2sT
	TcFrMkRA6al43ifj2jkubAJs3FrUfNvtZkkkcVcB4X5gGng2otxgKTuXqt6KlQyp
	dcUR+PaPy4JSoiLFp59cAR7s6aGWZ6mI3ejAN7yQdgXz2XAOshrFt26Xpk6Yu27Q
	bXAA1+6Ihl0EE1FsykzY+81TpsEqFSxeR8ojjOmPNiMs9ZCfJm++Ekb9bCaLzkT1
	Z5N+Cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dvv4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:10:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dbce38d456so18702285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752149452; x=1752754252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qylshFqGhjqdpqss4EWahA3a0P0XpI5R9ccWJmm4pUM=;
        b=tnKsxhBOa2NowJsNwxKeTqlikHRWtObWT6s/Gi1yLYkQvmUPeca4DvmB7oLb1AhxkW
         UJH/iVCeMj1iwKiE1Hqzvv37MEw44Aoih9RQZelcrxn9QQktlUdBlhj561r6V/XYQdPY
         NmRC9hs64NK7WUpejjezrRdi62ObgHKZK4BJx7JdL9UDGD2rMMmxXmi5SdT4igDFWjQT
         7GHK7UDy3DTvMoARHDb3BIREKA2rr7LJ9HZmcBjtNAG5t35KUzYcYXMd2wi/sAuw410d
         AVZz2mL/w0HnpO/tNEioP5zqYwxlV81dp+fw/cSzLisFRaWJw2vb9DcNxZpyweQedI2v
         Jc1w==
X-Forwarded-Encrypted: i=1; AJvYcCUSkJKVUCLC+3r/MCiyv00MbgXIfaKUIqT+3GqKgUy5TRMmDRtW2ZmTrl9BimdyidgHsv51mST6AukVEX4p@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzH4B7O0QnRLQLUb9RuV49ZIH3Ec7E1rKAXnOC8jPlRER7t1V
	nJo31muV9Xi1CgrJGv97nLbddpDlX6Wn6QEK6uXpR5WIN/ZVtIw/KoO89QGtC5SyW5jvGLTO3k8
	DkEZpcynNptc1wrA3KCTYASEd0aIMe1FM00nRN2ZIyTUNRlbQkDXAQVUxrHfth3Qt3KdD
X-Gm-Gg: ASbGncv1wvg2FpCVXtxSff0MBa3velvpZ0xIvYdxa1A/4C45Z8am7C+EulfATLcfz+5
	Su0eVnidLjvfox68AgxmTyvf3tvrW/ep5lq5JawP8/gR0FIylDjgQT0mmcnVhQZPA9l2tDicgQ4
	X69vIexUMOQHiJab+hvDvS2jOOnuq80MHZM1SGEItfJHqP7g5nRY7kVIrDKmm4XnAsNmJ9SfSw0
	+Co82pWXQ9llHhh37zRF/vQrVrnG3Qbf3/JTcdms6vjbmaDNt5oIm9K6VY43MZV8oGRASJzD6DQ
	QsYuOC99enDxpN717W2bmMfpEpxmyIHVGMdPooxObvzHMd8oNBJbMuaE1LUbOwJS0oCpA5q88qn
	1SvE=
X-Received: by 2002:a05:620a:470d:b0:7c5:687f:d79d with SMTP id af79cd13be357-7db8ec65af8mr344976985a.8.1752149451757;
        Thu, 10 Jul 2025 05:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNdXIlzeTaHsQw8JV+VNgiKFo/GTeGYtHM7NPf/e+vpsxjpM2ZxW4+HG2cXIrSvCR3dYQdRw==
X-Received: by 2002:a05:620a:470d:b0:7c5:687f:d79d with SMTP id af79cd13be357-7db8ec65af8mr344975285a.8.1752149451347;
        Thu, 10 Jul 2025 05:10:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bd9sm121061566b.132.2025.07.10.05.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:10:50 -0700 (PDT)
Message-ID: <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:10:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T8TNEqYHegcBIrKGtWWIhK4-D7waNHU-
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686fadcd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=JvZHP73eehLcbYbFTREA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: T8TNEqYHegcBIrKGtWWIhK4-D7waNHU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwNCBTYWx0ZWRfX7sxc/Xld5TlE
 s39jW5zBzt3STAX+UYp/VcXqCwUKfwU7tNmdvmVREeYtE8Z0HA7xhKhCOtLT8R33ZcFbQWB0v43
 TnKrTrIAcilV9FflESWacl0QAtxXbpUWnTstCxXedKiJoZJeFIFKNhZlizY4DJNcIy7k5eAbZBK
 04lX++41kt8fQSDLVasTWx5uRylhd2TVsfxyAcDGoBfPIJQis9rHNih2CS9bszKckY4tsnhRjys
 VGU0aiXlHjxO5b9oEmehm4ekzrjEQH5fEFHOgtlr+GK7y2o3+L9JLDjV6Jt/PVtB7q4IVD30VnY
 fho+oIFZ8V3n41ZQ7I/lR3Zo4Rqjsx95Y/BqlKOknBkSX9XmeiVJxxjCl/Ml3ZQtDZbY2/fUDxC
 7xBlWhlizIh4ZTYHhC/FCODU4aA9PjRNYZ3amPrvFcsodPEBlUQ37V32rmpktYGXE6p9WAHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100104

On 7/9/25 11:18 AM, Luca Weiss wrote:
> As per the downstream devicetree for Milos, add a register write for
> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> The downstream driver supports an arbitrary extra init sequence via
> qcom,param-override-seq.
> 
> volcano-usb.dtsi has the following which is implemented in this patch:
> 
>     /* eUSB2 HPG version 1.0.2 update */
>     qcom,param-override-seq =
>             <0x00 0x58>;
> ---
>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870aa7f7971a51d4a567 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>  	/* set default parameters */
>  	qcom_eusb2_default_parameters(phy);
>  
> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy")) {
> +		/* eUSB2 HPG version 1.0.2 update */
> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);

Said HPG asks to clear bits [7:1] on all targets

Konrad

