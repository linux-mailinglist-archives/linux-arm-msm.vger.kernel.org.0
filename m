Return-Path: <linux-arm-msm+bounces-62435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90432AE8184
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EA11C2517D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E9A25D53E;
	Wed, 25 Jun 2025 11:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pglZHMNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07B1EF39E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851420; cv=none; b=pPgHIFrDYS+jpWN6uJdatx4Ymvq7hLyUP3wu2whQVYEkZ/AWOjrnuKoAAWk8Rl8SpeUX5nNyt60pQTSlquEAPOI5YvPcE6gEoqcG5zBCn/WwigeGb14FR0GbK6tbGFgSOD+zvBrFTBiPAiGY01kKcXM3Z+vtgioDyxpqbsMkh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851420; c=relaxed/simple;
	bh=3G/GhvP9CCG6uuuKkuhD3JuQieFN6BszJVp1oTAvZLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU4Tu5eKLA9qR+8HO6DvXassF7qe50363y96+W3/2hqRJRw5cSyI0idsDqExlemW7ncC+Kbw9Upd+358tE6r2PrzsRXTCjWg1MoyjFZCg+1KXF2oZvzeJZzn1pxfVFtmmJvBWzqrzhDnNwhiYkOBch+D4hZVhEYciP4xmQQPlAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pglZHMNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBR8CL026740
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0ZqMF2d605Wbo0XGZMg22hb
	R4jx82qoLb+yqyotR18=; b=pglZHMNIrsejUr3Im4fsTAi4rkmddbRlSEXsk1Rp
	CrW7ME+ITJASBFJOZ9xnPicrFfTACBCspC8krJCXrYwaEewCEI1wQymsUHSOfTBb
	RNyNp5IepTPyP+8i2VRwHyR0rCxqIIbW7gi+d5WbKIf/629BnMhOyTZAjmwTUg0R
	gUYZlJZe2gMqBqdyImnlmocMWD091w7yp2aj+SJenDn4rMtTnOq5/kZWjgpTx3jg
	yCrQoufrnbhiok5ro4I4O31NrGe3NOdSI8i3+zHbenaQH9SwJ2Bdn6cc/jhjlbf9
	Ww8USOwP9DMS+8Ysri0uJQX6Ybl6NVNOu7FmeecU2hLULQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqp6gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:36:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d40d2308a4so236868985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 04:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851417; x=1751456217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0ZqMF2d605Wbo0XGZMg22hbR4jx82qoLb+yqyotR18=;
        b=GV6k2KvZgJAE9PLvQWSKX+pf0Iye/PDEqLnsEBKUTTTVpwqgZPVVDbwUTTcDbJvK/V
         vsDXDpRlXVJK+dHRSEv8TJTu5W/NQYdLfdsE0JoyvYNR8U2JqA+B0jnu7XkhfH4K6z2b
         8teFwPtWcO74yidRPSJM7RCXRXbHqJ1yzx6gDCyiW1niNxHZgvXv8tqk0kUsH5lGzZx/
         JC33bc1kUlRxuEeoQ/mNOpCByB3koBzMfivJY/iKqP0eoVsoJRFB49Bf6RoyvuwxmCHr
         iySARTj59PLFfFGuY922+k9/bI1SH8df6MDtm3o/8GbKApaqggsHcUtbAc3IRLTFIPSV
         OIyg==
X-Forwarded-Encrypted: i=1; AJvYcCVInRBzxWEECz5q20jDo+jncI19CV9A3mTRxIBLJursqqmk4dy0D9s5h7JLPtjsAr9L/8L/dDj+Z8faFLLc@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlSDf5LiZYmv0jjmlwLm2QeQ/AxAT79drRcyS6Q0U4ycpD3yz
	V5ctd8wKQxeCNECpv7ygbvQ+Y0rmsLJv6WWVUoM0E9CCax84FfBO/ynhGQAMo2AXdZYiS4fesbd
	F912SGvQYFfg0elickfpxcTkDEPSKzjUlXB7mgLC9xNmBaD00INUYE8r+P1VbfJD5Warz
X-Gm-Gg: ASbGncvZEsLEEwqmHj0iMY90iQWTCz7mwk9v4UT/aoAUMfsPBnCSd2REOY1eujBlw2R
	ry40CzvvmMjv0+oGjK2YLYDKU6temvEguRjBgL06HMoEkK69ndZRgovkIiLItRJFxC0JIob6Zzp
	fuPH6hbTFgLjQL54WJgRXHcWFzakD4l9QmPnostShOtG2hIX89Klg4bwGrpfyYjJogAiESbuF//
	KJ/RH4wsA8CJAfTjWg3PDx5KoO6jqM2buglcPbWZhaRW0UIt+/y617ZdvMrLmzaDiUHeMKoaICc
	dqf13uBsEThe9TuawdIxbZbyslGXOdakcuOHrkVKL8ys6Ngb07J3IaXGH88Df246ueKnOQsfZZL
	e3tiue0m5eStR3kBRlbP0ilOIXDUzQFePxbk=
X-Received: by 2002:a05:620a:45a2:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d4296d72bbmr363649385a.25.1750851417053;
        Wed, 25 Jun 2025 04:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOfZlbSBvtazR55cWZRcy1/iEICqUADtznvjbtKccudKrNWAEvLrQQjTBY9oFp1Z0U0SCKHA==
X-Received: by 2002:a05:620a:45a2:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d4296d72bbmr363644885a.25.1750851416606;
        Wed, 25 Jun 2025 04:36:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ca8f46153sm11902241fa.63.2025.06.25.04.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:36:55 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:36:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
X-Proofpoint-ORIG-GUID: GLxNw2VXy1XY8KLWfzuntrH3GIZxUZxe
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685bdf59 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=A1pg4z-Cax2pQkPbWCoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GLxNw2VXy1XY8KLWfzuntrH3GIZxUZxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NyBTYWx0ZWRfX6YLQfjsQ+dEs
 io4riMg+hbW16xY0F+dIbGZRRxunkhp00JQLVNn35jj5GL7Qnd+uinZ1WbOn0hGvAe+oYFj07i7
 kJ5clHcGhn5yEzfIWmmnqPMjgRQVtPYiLhcM1uZ9r9AhFgrNtwO77lVW0g0BpP+B0Nza6NsY3ub
 dW5n9117WydSCjc41RYWoG97SXWX0hj9RYQG4B0wCC4XGBrYqOENwWeM4Oqs8NkmjuHeGd4vntV
 LUYndIt7dnY6QxtsbJhy5RkQOLI4z26GWG+NAHXc+O1592pzONP4gdrApodX2ODTW0RO/jgY6ma
 CTXGp3EHjr4itd3jCVHx5c6yXs3bOXD7jaSeS2rSGukktexvQIWPy+rq8hgdaWGjQA1OFyE0A6t
 6PTqdJf36Orfbeoiokx3DLp8ABk2fKmWUKy6iXk0q+lwz/xiHdcAfApSqtM9xGzH4KKDmR/e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=850 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250087

On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
> Add cpufreq-hw node to support CPU frequency scaling.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>  				qcom,remote-pid = <2>;
>  			};
>  		};
> +
> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";

Why? Other platforms use a true SoC as the first entry.

> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
> +			reg-names = "freq-domain0", "freq-domain1";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +			#clock-cells = <1>;
> +		};
> +
>  	};
>  
>  	arch_timer: timer {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

