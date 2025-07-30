Return-Path: <linux-arm-msm+bounces-67158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B3B16161
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D17AC5647E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2118029AB1D;
	Wed, 30 Jul 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nv/zDsgX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56629AAF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753881876; cv=none; b=LYgMopVTpMt5bk2h1lu0ZLCLr68MWIVSh3zK1Z9VmMo2w5QuCbP33Bbo0Qm3XOLLj0VUVvpG6Lx6o36HSorCS/6ipfEnoFbGsYxfM/JbI0ZWTzlxEp5jSppVlEcCycYxmqWUsdf0zZyMCfZpyXApnlpUny22j0ZF/OuRg7Sn4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753881876; c=relaxed/simple;
	bh=e5IwqqJeeCUDusazZ7w6XkeOtv7ySZo6uxGQet2ZmjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsAWlWYaFMWjBFYNAXUs81Qb829+Qmm+gF9c3UAh5tcNl9Qrae0XTdSCxnvObQTj/oiQypHFayTzGt+SXy+SqNlodp9ijt0FleP91b/L8rN4v6fod/3ztuO/9TXs7PpmjfTo4mYLc/1eT1byM5dxSMO5zwYs1j9k8gYSbA8Zp4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nv/zDsgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbbG0002051
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTzI3N8eKRe/dkZlaYa0pONj9a17JsdqA7y1qmJPaXQ=; b=nv/zDsgXDUZzZWoK
	3pnSQwA7AkfWBjxOvzCPQ6TW+45UOkWquG8nIFBRDbPRF6m91LAVzvxw9o2NV0ug
	QgX+aA4I6LG3RtB3zG5SnFUT4LKd5SNwSqGhEk8jjDQ64/kH6azeKKbFm7EKdc91
	5FrMF5h/jMudSgX/C8qeqRjMCyu48IHGNlha09w21tSraKDAw2K35cQYn4KAg2pZ
	nvBUq4EW9uvtTIp2wQjXA5+yBi/QIUU7eZuXCeZYJFiUQ832BYA1Wo8ctjF6mPGf
	y8aJs+Q2+da+lcSfuFVMG57tLzPo5YQMDfqZvk63205ObTIG4unPDPWcy2ZVwInE
	b2JGSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86421w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 13:24:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7de3c682919so72771785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753881872; x=1754486672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTzI3N8eKRe/dkZlaYa0pONj9a17JsdqA7y1qmJPaXQ=;
        b=MhzDaWTHGvX/9d3MKnJIfB1nXcbOk/SbjdQ2bwRBwSxn/GPBWb6cGws9+yUCTS3wBE
         3OivNMEMY6EG3q5DbrNKqGjl8orMf/5MD1V2U8K1Hdu0BWq+ZU1E+xMlXkTiaHmz+vC9
         XdL1l7WXJ4s8va1Mv3mvaOtiWw4ocSBKe9kTsvcai0dkylKb6sOUR8Kh0RgmpSG7BBHl
         mLbVn0CTiW9+1spsIOFY5Ii8HtqA4M09mZQiwcoD+DNIGJfKhxI6NnDGT5J3cqeUq6WU
         grzr9F9XbfJzYy72yl9KGXae13XU01K5q7HoJyDXt5PbD36IVeX2I8wsvXhMWSY6LXSb
         ATzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGa4/tLjzFJk14E/DJTKZqI8o74oPPSE3uISia+H6PD8JjQY33z8ZDKc9SuiX3hSsjQ7OfdwC0ixF4K1YX@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHXeqvEnWIzRxIsA6qxKLt5Cm1f4I3SOtwIhDW4FyM5HBaW7u
	xNwqQe1dH44Ooj2NI2HTe0LYNQ/TvLe9AoakWm1/5k8C/SUST6VrW33JlwgNspLPPgj+9AO66VA
	Vxl4MKr3cH8RICHwrPKXSIXu2H5iqwjIzyoJkobcmPMLWHnRzQ3uTnV5qDI+u7b+XOz+H
X-Gm-Gg: ASbGnct9IxTSLz2u9DGxAAGqsL1QLz1oMqfAGyf47g9EBwk0t0zdsj0SD2S8FND5gNS
	49BuT3yhSOpcOykKuIJcgdAP2i5lq/yzbDZHaOcTvJ0efAWLQEFDyP0837N+FGSfqGxPHzyKBwI
	CXOH8bUBt/x5sggv1Jq8nj9QbAbMqJjT3Fbp1rrykwEHKOBTQ7YE11/mm/uI0aSmE0YFUUDxIG1
	YvdQ+6Zk0muU7329uSHo9w5UpBC06KhUvZGeD3ooYonK2kDultcigV4oDVcxlCyWVLGcnK14nR5
	mJScvUeBu4px45F5qJTdxhkz/sWz5HwX0zux1OLupo+LGEWAiunwvHO/dC/laV3tM1/7mOIjA3b
	uHfHOxb4HPIPLLCwoxw==
X-Received: by 2002:a05:620a:280e:b0:7e3:4535:4f7b with SMTP id af79cd13be357-7e66f35c7e1mr216229385a.12.1753881872293;
        Wed, 30 Jul 2025 06:24:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGhiBVwlELcMoRQwGB79Dr2y5jrjodmypBvSVsOqt9WTv9u/8VXfq5aqICzEbt9JwVIxNH9Q==
X-Received: by 2002:a05:620a:280e:b0:7e3:4535:4f7b with SMTP id af79cd13be357-7e66f35c7e1mr216226885a.12.1753881871792;
        Wed, 30 Jul 2025 06:24:31 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6155181f641sm3377347a12.36.2025.07.30.06.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:24:31 -0700 (PDT)
Message-ID: <a58eb607-74e5-4f31-8ea2-b38ebbca5344@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 15:24:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Add TCSR download mode address
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250730132230.247727-1-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730132230.247727-1-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NiBTYWx0ZWRfXy1lAkwVUdRct
 RDU9KUMnYGrIIhkpWVy4Gj2kqOo8dUS84Oya1Tfyal1q+Y5Cuoy1iosIEKFz00s9Fug1yful7Mh
 4pxtfVFiN3d7Vovj1chMH4rchOgEJ+mizsW3wwZwQNCk/ncfEwNzzGhiQ/Zf09hZZrl4Uj+j07l
 wD3lJh5u15O5XQo92IYByWjfVJJKWMVCCQ6fCx99dl/SwZ08Qk5C2BslsgNz1Zmg7HQG6KYBNka
 ICKZ7p0up2kL3f1KGyDa8YDkWe8KNnEgsAOk4LkMl9xDZg0vgjqkm5taWWe5p5I/AYxFzeBHuJr
 zsUN95IWMqbWQSTP3q+u+JdVHXAWEYnIQ1HM+d9KDP4L4gPL+5tGDP9cGTYZdPQ68fOF2OPko8R
 jDGgsUVTUbiDyCNbalRXc6dRr9/f3NfMaBk8hJ3Hhb6Df+l4MNSUleg8qn7u95iP3P8PsT8S
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688a1d11 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0h7C-uHhpuvjb9gYxF4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eQx_yrqIJ11Mxs7k1CtIxif6lM0mJJtU
X-Proofpoint-GUID: eQx_yrqIJ11Mxs7k1CtIxif6lM0mJJtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300096

On 7/30/25 3:22 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Allow configuration of download mode via qcom_scm driver via specifying
> download mode register address in the TCSR space. It is especially useful
> for a clean watchdog reset without entry into download mode.
> 
> The problem remained un-noticed until now since error reporting for
> missing download mode configuration feature was explicitly suppressed.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> index f49ac1c1f8a3..08eadec59882 100644
> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> @@ -154,6 +154,7 @@ scm: scm {
>  			compatible = "qcom,scm-qcm2290", "qcom,scm";
>  			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
>  			clock-names = "core";
> +			qcom,dload-mode = <&tcsr_regs 0x13000>;

Can confirm it's the right addr

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

