Return-Path: <linux-arm-msm+bounces-56524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD98DAA7540
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E84D1BC85D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5622571DA;
	Fri,  2 May 2025 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Hva6v3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685832571C7
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197111; cv=none; b=qSndDpBl48c4axY8ciPgXUBUJpTwAbgIKqri42ETfm0rBhtE34eWyeI83/P8Shfd5rPLRt/MNS2JpwyrtPJqhGZ7c03lPF4uCZqyBDD3/W0UmG7PaVqTGCgQnTuc/BeNA9KR9MQNGd+/U5DHqxBJ/YWdVplxdE+5LdjGwBEM74Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197111; c=relaxed/simple;
	bh=gIgjvlu9Lh4W9hA+25IQzvCi050+ERk+c0blFLwFmgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhUPItag0fKsoYewj5hqNIqTa4lwK/shZ732S1ADeWtRKaTpQTA5C82kzQjBBy1uVkfaF9PLUSFFJAZj5GyUa01BDcd2RpXuXXHQKB0KSsWmNN5lbi4RjYl1cVpawal3rKMHkop5AoK3uMZxvdWUCHi4q9tbfU+2NqFU9Clmjhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Hva6v3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DHUkb016400
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 14:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GKFBa6/zgrJ4k2F40/J4HmeH
	gWpS8VMAWbzSckv2X6M=; b=K9Hva6v3NyHFI7Yaru/1727jojyJSiREBT3xLhVg
	S/zkcXVacbQeJtlZgnCr9nj5cTx6G4m613rnV2WFyDDremtRxd/YdvQuCrNSy2Q5
	mAb6lCJUmjzDzXDjy1fDB55xpqyhIz1Qdd2Jgk2sBd9wOwZ6N4Z4hJpWOG+diKNf
	/MnaSnHlLniVGNxUXhXRjrv1O/qVhFY0U7pV4qkzggOlKv8zJxvg+IeqNZ4YW+Qg
	x13Cl/XF+hfInKPc6qlC/Ol+xk3RVM7VIuRlnCvQ2pw9XGyLly9cDRPUU4NnHaoB
	4E7uWMmqtiQj2Y6TzhRvs4sayQ8t71TKbMelQM93YqxKDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uagh66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 14:45:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so470757985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 07:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197106; x=1746801906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKFBa6/zgrJ4k2F40/J4HmeHgWpS8VMAWbzSckv2X6M=;
        b=nEbTFuD/eUWzPwhgSm8A8WYh8+O6khEtXXh+yZ3cnAtKPMF/L/tA4lgsl8UZF4dzCF
         Bi2+vcXV5fQS10IqoP+swWRgjjszb0D7K0LtZjYelVl8UtxOor5f5bksOFESOoIFnZ7B
         ptEv23EYhzA4zY5sCWa+83yRhsrIVsMVn0NwcVwvjswFmUl4tI0oLhAkcddUQxXaMMWG
         4X2CShZPHrd1GLlmW7rAbosoTpkIkiexAMIsOiurlYgfvtRUhOA3l0pfbAjdlbD6t83x
         CMX8LnaSkFkZo0Wj30WynibwppcDteMWQi6gNOHZlP/joEdUMNhMnTjETrJ76cR1cbv8
         WW0g==
X-Forwarded-Encrypted: i=1; AJvYcCWByeHbkh/+bWEeZHg70u++HMNAlx8y0AzK3Ch6OhZ/lPXtHQYcSvBB9s6qsqewVj5jcQLNFjOKt1Jl7AuX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VM+GyJf2qCbLBrz0HZjGDN0wWxdIPHwwMvczZY+KQ9nIlkyb
	By9r50sTLe/dsclE6RtlkY3+a/7tjwpwNAktqAzUWepbZnhNTzKk0YKhfi5wL8GC8N//zWnlprW
	TtDxLBvQZU3wgqUzK/eC6nSagLCTy/39QPCIyIj7ZYTgwjLrXs6fnSoIiRTqrRkzr
X-Gm-Gg: ASbGncutFfMpGbLVOuB5d3vw3+7X2zcCqgOzLXn2jUwwonMsnb449RjUIuEah0G219E
	HvwCJW0B/i48wC0/GJ14grsE2nZyga073JUitxiKt28KnayP5nm4iQtyZ6L248MZmXEJ4jMD9CB
	519vdoodKk654WjFZM3q8TO2w2DdsPtCykYdxHB55pdfynSKht4QvUCJSDZncf71IqZgFH00FpH
	fXLsnKpdEYWL0Qqlse0H7nWuGOp98yUlkDL1g+U8B7Eas6OZa/JFjMx0VdW5m9I8ioF7ZhKlYbm
	lDqMM/waJqJP3UpKPQKAOxv7W9MIfvDaW6NdUybYW3nrVeVPWrwgqr47khOjezCki1XxISjBpa4
	=
X-Received: by 2002:a05:620a:248a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7cad5ba79femr368388685a.57.1746197106160;
        Fri, 02 May 2025 07:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnTvg9+ZU86kpvNrwYxGXjpp9+8gfF9cru46QLku/mHRjHUI/CT9RbX1jXkEXwADoj3azjNA==
X-Received: by 2002:a05:620a:248a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7cad5ba79femr368384285a.57.1746197105730;
        Fri, 02 May 2025 07:45:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029306984sm3560131fa.58.2025.05.02.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:45:04 -0700 (PDT)
Date: Fri, 2 May 2025 17:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Update IPQ5018 xo_board_clk to use
 fixed factor clock
Message-ID: <frlw5n2fxu5wxrlaahiuwlgaeg4rsqk7ushpcgvc2q4mzorrzf@e4axknhir4el>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6814da73 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=dROWWaiHUd5sXOo7F1MA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExNyBTYWx0ZWRfX5h5JD12+wL7L Wn3dkR5F966f0OJqs4yhhIx81hd+jrNQ+iKy3Ax+nCN6D7l8M6mykSMkxOyKEpQ3LzN2fRwYAYf 2/O5MSJscErAWtZxecg/GzLruFVLHDykckxxdI/K57+I/waU2G9gdofeqDUx+O+2RQRxddw+WXp
 BXPdzI3YTE9bI3TA72g8DKSd0Dj8oFi5hM8mD5zl2nS/shi8QWvkglV6uYQqGNt5U9+LQFva/jM dXV85qOpEYb+hA038B3FS9omAI3pn/4cwalkXBnOc4mH+KBWpin0uBPvnKTOtyjcYyOKJhFYzDR J4HgRIXMv9hHUBqMJO0TlyLDU63LVk+lXex41S/hcNAS4TEUuZylNiy9hhTk/Y27nwp6i4KzG77
 wlwwYhnvKCc8YBV+829x1Hg7z+le/16vgX/A6nVxZSo5mebIYkYqPIgmGA+afgzM2w9ffVsQ
X-Proofpoint-GUID: _okMJg-Hr1iawL1oyaJsXquv3sajI_ab
X-Proofpoint-ORIG-GUID: _okMJg-Hr1iawL1oyaJsXquv3sajI_ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=934 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020117

On Fri, May 02, 2025 at 02:15:48PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output
> clock 96 MHZ (also being the reference clock of CMN PLL) divided by 4
> to the analog block routing channel.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             | 3 ++-
>  arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi                      | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 8460b538eb6a3e2d6b971bd9637309809e0c0f0c..abb629678c023a2eb387ebf229f6dd1c30133b19 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -80,5 +80,6 @@ &usbphy0 {
>  };
>  
>  &xo_board_clk {
> -	clock-frequency = <24000000>;
> +	clock-div = <4>;
> +	clock-mult = <1>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
> index 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
> @@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
>  };
>  
>  &xo_board_clk {
> -	clock-frequency = <24000000>;
> +	clock-div = <4>;
> +	clock-mult = <1>;
>  };

Is the divider a part of the SoC? If so, please move these values to the SoC dtsi file.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 78368600ba44825b38f737a6d7837a80dc32efb6..7e40f80e4795de25d55b5a19c1beb98e5abcdef3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -31,7 +31,8 @@ sleep_clk: sleep-clk {
>  		};
>  
>  		xo_board_clk: xo-board-clk {
> -			compatible = "fixed-clock";
> +			compatible = "fixed-factor-clock";
> +			clocks = <&ref_96mhz_clk>;
>  			#clock-cells = <0>;
>  		};
>  
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry

