Return-Path: <linux-arm-msm+bounces-40588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 877959E5C59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BC4C283652
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3897D21D589;
	Thu,  5 Dec 2024 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsPhLu6r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66915207659
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417908; cv=none; b=VoYvRCe1mPx+t8+MHvWofuQgmA/Bjt1/h6vgb87xihAF9s8Fdb4h9A2czLbbGJI3iJ/EpnN/zx2uR1ih/HUiuRZw+vqh8bDIyqHiaQPUMF5V/QMjFHHpmJfPtkg/27Yvb/8qBR/uzmoK4srdFpm4N1ebol97kxsaHu5KqAWEFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417908; c=relaxed/simple;
	bh=inCbXkwUzPcSLvpsaPPDZfCM12NcD0fYXXxPtBqpNnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klhzIvJEXu4xeZ0xq9IfNAMa7+lrkEX1zql1bgikRrJ+4IYTd2dDk5zRPPf+3RAHG+DxYSutN0ozKeCWl8J1zHu64OsNTZDzA9iYpm8ArEOgJ22laUP7j1RN69IxKGVWy9IsbyAni5JtYfBwxcEhi+eOmXlyYq/MUx8h2mfYTIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsPhLu6r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59x9NV031441
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 16:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvYEHuLrFacd4tRRJuuJxO6xcj+0DaH3kv4nnEJbJa4=; b=UsPhLu6riXg0XWs7
	hEZnl5ShhTpuyrx7sviAjFccQ2TLQQlMnIgY2nx8H9KwXM1s41o3cev2nUNmRO7/
	9jc5qctUPLAchs+IiQcl//6kYTmJmAi41PYUfd7YQyamoO1R1q4GiZ7nr/QwhHbH
	1+sWHdc2qllGXlg5aWRzTJ4u7tV0EmBivdlPxvfItWXWFWbMfohOCo8Vl5H0IUuA
	GAPcVEaaxFlwiQ3IOt4w2xSMXQ5rJHmdMFn5xkJz+cXCsEfMfkw+zcOGr02RqENu
	qOYfQMkAbN36dZLwdTbVeyvSlAxvJqQ/OmMY/O9vCK8TFigjj51VVfp1AlqKXa4l
	TK6Vtg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba141525-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 16:58:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d885afca84so2705506d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 08:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417903; x=1734022703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvYEHuLrFacd4tRRJuuJxO6xcj+0DaH3kv4nnEJbJa4=;
        b=wH93cYaDtS/8RMVkYyY9cnahYmOEgLtQBEi3H/ItnEyXcOuFtv+DhuWb2EkF5iR9wL
         XfsdKyIyFAidEqsb+wuxQCtydorwxh0pjp05ipLnSjAfSvuT/svVkgvEG3RwH2WwoJq3
         BZD67+D3J/ZOO6Jg5TU+idEr3ip9q1PFyN0ZTB1dGr+PQhRqUH4aUpjOii6fsikIKakp
         q9+Ni6E2GJ8XBnuwLUC3L89UkRb5mLP0GHMBceaF9zmSFqmcQfiSuwy7u+3cWTKk1MMX
         3NEjdAFyzjazUjht0o/viFThtC6wsAmewFUiLqXqLirMrUODqxASXXgoUThNY88HAvYk
         vMUw==
X-Forwarded-Encrypted: i=1; AJvYcCWAxuExTpwioKdcbgg+1CUAsdpp/JsQLmmjM78BuJ0hH0eDmfWEob7fUplMQWSJwZ73xvbAPSOh1UiMt7IK@vger.kernel.org
X-Gm-Message-State: AOJu0YzamUSgGJbCTs9xF37orc8oEgE+9IAfySBzlKJ+ZKsRnnZ1xvpv
	rK6UDMSYpZ8gvfncC8zkpgeZctAVokmRF/gs4MMmfXOUDMLVyJQOWFHABvMVJKZ9sVncDUWMglg
	MhnvvqOM/d7WSxbtmZ9P5SpvFc/FBxJXcjmunq5zRdx8riWvFKiu9/5qh8s/oFbwY
X-Gm-Gg: ASbGncuxj0JmrtNO9m6aibFm2+1QLco6FsoP7fLWttSvE51N5u+X696/agRUpqExft1
	m0Tmtp9z+WmJdNSoSgqIUi0nLleYpZYM4KV+HFN9tdJfRoGgS3nmDwTVwhrNtoWpD33F/XfdkQ0
	pm7pcyJKsAii9SQEYPFOlb6iOAkY+9bqQ1Ugpw66ImFOKSTkxpO4p2390VeaKcUg5DuTlFAl48l
	DyYZB1CCiRLR4QjmJ5ZI0W7uB5ZwHi0SSa1SGnxHPc7yk8gFbO21tNdYRld0pvz55aQAGo5S8d8
	lPlyTo6FzisxGeP7GhHx+Ke5tMF2CXQ=
X-Received: by 2002:a05:6214:529c:b0:6d8:aa37:fe17 with SMTP id 6a1803df08f44-6d8b72b8ce1mr64771196d6.5.1733417903468;
        Thu, 05 Dec 2024 08:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3gkUNAmqO6vru/PCoJ4kSNmbvskxFZvs6Kgllqc/8lYi31ikybio9azXiwqqimK8yIfYovw==
X-Received: by 2002:a05:6214:529c:b0:6d8:aa37:fe17 with SMTP id 6a1803df08f44-6d8b72b8ce1mr64770836d6.5.1733417903026;
        Thu, 05 Dec 2024 08:58:23 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260ea41bsm114574166b.192.2024.12.05.08.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:58:21 -0800 (PST)
Message-ID: <8a8cdb54-93b9-4093-8e85-f3d698d66e22@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 17:58:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: ipq5332: Enable PCIe phys and
 controllers
To: Varadarajan Narayanan <quic_varada@quicinc.com>, lpieralisi@kernel.org,
        kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
        bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, p.zabel@pengutronix.de,
        quic_nsekar@quicinc.com, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20241204113329.3195627-1-quic_varada@quicinc.com>
 <20241204113329.3195627-7-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241204113329.3195627-7-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5jHAO_UMdI49YP43agwe3A-HfVgIap05
X-Proofpoint-ORIG-GUID: 5jHAO_UMdI49YP43agwe3A-HfVgIap05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050124

On 4.12.2024 12:33 PM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Enable the PCIe controller and PHY nodes for RDP 441.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 74 +++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> index 846413817e9a..83eca8435cff 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
> @@ -62,4 +62,78 @@ data-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	pcie0_default: pcie0-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio37";
> +			function = "pcie0_clk";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio38";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio39";
> +			function = "pcie0_wake";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie1_default: pcie1-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio46";
> +			function = "pcie1_clk";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio47";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +			output-low;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio48";
> +			function = "pcie1_wake";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
> +&pcie0_phy {
> +	status = "okay";
> +};

'p' < 't', please put this before &tlmm

Also, would this be something to put into rdp-common?

Do we still use all of these variants?

$ ls arch/arm64/boot/dts/qcom/ipq5332-rdp*.dts
  arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts
  arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
  arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts

Konrad

