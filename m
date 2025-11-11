Return-Path: <linux-arm-msm+bounces-81220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8FC4D27E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFD031888D02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC313502A8;
	Tue, 11 Nov 2025 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVAZb83u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoRxYtPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B12E54D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858054; cv=none; b=foqLufanO3c9Z1I4VRyFZfuw8Mw9OMFcfAxnAJNimC8m3OXsDjzgZp9u4mv2bfv5BL6i7MpH+HQLLXkEjoolEoSuyT6OqoAEcplC4Gme+a+A/xJiWZnvGHshXwL4TfzlN5cp2+h64yhi9VeEIk3IYhcqtTRH/27zfFhGTnuyuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858054; c=relaxed/simple;
	bh=0fsV9uI1O/cKA8cAsRlcNpQnlJMqVYlThEFX+/lW8l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=el9hQWHfjMHLceGm1oNyK2P6aNlrPZZyWjm/TYeM9f9K5V/NWBfXDCfXfJfF1GZzgNEDs7oxhBhjlwfYoPRnOqX6wMXA+cAcDuZCqm8zBrwraCeVWm9jOf2maxKmCpS2H/42BQtobLxxAJLahrhifeyS5aV8PogoPhR6AmSif3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVAZb83u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoRxYtPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB7E5JQ211093
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZKoolRTpXFZGn0TM3pvNjb5r
	co+zakFBmbIW06wI+5I=; b=CVAZb83uTPYRJPOyqYQc9PH+81HrF64fe9dzCv5P
	sIige9U3UWG0Khm8TRBBQGAbBq8xshtY/ZzCQDS1e9ZZrMuGhytAJO7/Q/Sfcd8Y
	i2ujOHrsnCNMxJiCY0y41J0MOmsK/EHxGaL4+QXw7lR2RapsDNCMZpmLT4yorEvL
	3Ts2LeMS6dRg8L+Uxs/5xQ/IzomiZCvQ+t/4AtXGmPqHGYFX6wndGOx2toQExwKF
	gDlbqrqzUNbcnyMG3TGxZk76TLBf5WXg1qc11eEcu79gyYWHSV6g6hEsW/ReS24C
	bghmPpMs8RqrQgJeS0Y3dYiyX+Dy/o+mz3Tiwbh7c4ZWnw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8j47m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:47:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edd678b2a3so1258241cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762858051; x=1763462851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKoolRTpXFZGn0TM3pvNjb5rco+zakFBmbIW06wI+5I=;
        b=BoRxYtPNpRMBVONpQhneOhXSEkln5ZGZk7+IbNKGDhA5bozFDW96gDvuisIe+jd2+z
         Kz2Ru2y+UTNWjUFnSH47r2e186QHmUZ0pL7HzjV0ZuHZCDQrIBx+r90sNlVvTaQV6GOo
         Xc/GvwKHaB5qRwPk4mKy1JtacbspGJ/Yuysc2yZDtuWpNWHUfB1k8FG+4x1Jk/uu3iNh
         EcXBV/uEUOnQTj6CTQJm+LWbCQqMt2dV7/JbJGav5ZsPVb/blzHM6fE6LjiDfG7V5lia
         XzrBo643SBRNCz/tK8n2jTPW1Rn7SirqNCrZLxEDlWYo2vnIl0KmFBEEM9gH1O32fsTi
         3fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858051; x=1763462851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKoolRTpXFZGn0TM3pvNjb5rco+zakFBmbIW06wI+5I=;
        b=swI1vQiMiVtAFJS+CILelaPyodYsWwCB6h5I4q2XUWIz7nxe8A9urDHjgYvPw1WS/q
         mDEV3OQbucLsT3njhUQAiii2vyFCi6w/ueb5FoOnKmICdoSWTQiH0T1fv7gaEaCE9Js+
         znAJnXkw3Az7waHbVKwDm7BugKI34e3CAUeSZCBX0QIB/tGeUlt4VWOVxg1/7xXR4w7W
         vX6470zZZXXpZPIlZiYUTUmw7vLfOaW5VSICUIyt0pwb69vMrKcz0/ovINLaxR/pKD8F
         /GUA0+qm/hliJN/TwXqF43VuaX6/eYkYqAk6DFNFAR56mJ2J4j2mkcqbag/8TSZIz+xA
         bdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2cIfht6E2PFf8T4VwPwkzwT07XxwohbCM50O/9IuuvUjKqOJbregH0FOE0coyT9G4zxe0BgYzN2AV1nFw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1w6Ge4ZBXCfqWtIRX+fFWbIXbhPgqubq84aqdds5PZQjmaYGw
	QVv+Jhwee9Ou1AiQzWh/QKbegmTMy1ja09HG7lfZ9+5Bu37RpQJ+PXn4PvUbE63Xk9XtJZ36RAk
	h9COAjZirauDMAjxKbxVh9OLGTU7GjbAoEHYsYtWmEX+F6uPRMsuyaNt4Vvkb6S/w9SUi
X-Gm-Gg: ASbGnctptGHxljT+lj0v6CRE27BJP+Y5vBDWXRspRSKEj1i0qu/60AJxBRcSdZxFFk8
	4NkdY+mzH+dBPcO0ddOj3u7xNltVMgZMla3Idf4pqxAu0dTOWpRHcwuuRAJTVemW2kmEdH1nsvg
	/smzt/6DzNemdrw65+KTfB9h5si5bTn9MNR9kIUmIGYdVeynwrUn5mJ/KGLe/JO0Vq2ZPbF9Pgi
	jiHkBoMxuZ5BBsbcEjeKiDU9790t6M6XkpYvL2Msw9bD2zPTkMIprhmAaZwH6rZmsHp/DONfbVk
	dTniMNnnXnB66HQfLcQq1UUA4+tCTb5CgyVPiKM6fV596aWOgwl4q1xM1gAchuObtdKfT4duDda
	Y6GCwLzr8jxLohsr+fUUuQNhC0qL90ov9ttpz0NUUikFKpCHK1sCOUzTzhy3zE/41+8+cvcNENu
	AEGpRHgDy0ODlm
X-Received: by 2002:a05:622a:180e:b0:4ed:b83f:7896 with SMTP id d75a77b69052e-4edb83f7ef4mr91668611cf.49.1762858051388;
        Tue, 11 Nov 2025 02:47:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFCDtYxB/LW3BIrbMOEAj1jjHz3Vws4ZmtYsIjAkOgW0wgxINYmTrO7RAEFffB8gVmP/4YAw==
X-Received: by 2002:a05:622a:180e:b0:4ed:b83f:7896 with SMTP id d75a77b69052e-4edb83f7ef4mr91668371cf.49.1762858050950;
        Tue, 11 Nov 2025 02:47:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd771sm41797901fa.29.2025.11.11.02.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:47:30 -0800 (PST)
Date: Tue, 11 Nov 2025 12:47:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] clk: qcom: Add TCSR clock driver for Kaanapali
Message-ID: <zom2b3x26phaxsmabvvzcuutaig2cdmsj4ggnssmuwwc6mhksw@22jwrk2d3tor>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JDIIbWhrSugnfduSzdnI4u33bsncoBdG
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=69131444 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=G3bzr5uV0MXi1sWuJYwA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfX1LhQabqeDhgq
 4MjLIK/P9cgU8yFY6vN5HqrFWIv6WkFu9DgxDHpYHLq5PhLlLI/yFiPt16EAwR7Qs6OxW5FxNbZ
 rZE6lrKTkYo1KtBkrRvfiMUOOLuWhgRSm6szF4/t1vYXi7umikUCYc8Mkuiaz8E2tx0Jo0at6wT
 SQKVDzDguO94phZwPGLtF6fsgvuyaD6pxf02sNub6K9XbAIOfEgQ+Lc/GDUTz9DmQd1x2RqTYx+
 r+2CGW7VtEeROZfHwnT7hdKl8ThWeUQLf6m+ZXiH+TuZ0e2CL9zkGrosjNTghbwMIgO22HC4Z6G
 QsFJojZFog63Y4MMsFl/ys+JlrRgDDy2W5UhKVhJWi4iEG8zOdhsXJEoqpV7gE41Xq7WpaAbVKE
 YIHo3xRt/XcQ87fcEDIkeDU5nsG53g==
X-Proofpoint-GUID: JDIIbWhrSugnfduSzdnI4u33bsncoBdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

On Thu, Oct 30, 2025 at 04:39:08PM +0530, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   8 ++
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 150 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 4a78099e706c2cee5162d837cad3723db75039d0..8ec1803af76cb87da59ca3ef28127c06f3e26d2b 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,14 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_TCSRCC
> +	tristate "KAANAPALI TCSR Clock Controller"

Kaanapali?

> +	depends on ARM64 || COMPILE_TEST
> +	select QCOM_GDSC
> +	help
> +	  Support for the TCSR clock controller on Kaanapali devices.
> +	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
> +

[...]

> +
> +MODULE_DESCRIPTION("QTI TCSR_CC KAANAPALI Driver");

Kaanapali

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

