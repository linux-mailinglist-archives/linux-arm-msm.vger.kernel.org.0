Return-Path: <linux-arm-msm+bounces-61226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7544AD8CD5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 15:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA01170C7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 13:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A3E86353;
	Fri, 13 Jun 2025 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZtOAtCT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759EC72624
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820241; cv=none; b=Rujxz39XvbY+VzannqwDg1HfW7uvwAVhkGqjeRdpsYt8Eu690zkgLo9cYG9+1dPfoSme/Je+hQYDCE7EXaSiiVQxDSP06PokkQnuU4Wa6D8UrTK5LpipgU6/ZI+2IVg3M18icw6fI+O0VzJKnG4O1gYT/kX5LdZsOPoNwESPX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820241; c=relaxed/simple;
	bh=0ZB4tBA7VPI4q2+c0Iur9EkWxAnjfflthKsJ5EfCyNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBzLjjmgg+aDHTkjR8s94/jNtkBfb+F1w7+Q1Be52Gp4Ocq+Yf5nPJEKhPxTaMxoIVwtZ6gCi9B0K7XinzFpGxI2IOgWhm7uQ0i/EjjbQVWoezhFZ0jjtpkCATUOVNB6lD402Ze0bfXbasUXK1ohH/BkugmL2pm6msClOj73snk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZtOAtCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D5MbPu004433
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=311F7krfIodtR5drIHKaH5kh
	X/9H/NonlAsY598nqSA=; b=FZtOAtCTdEghKcZAGH7tmzlOnJ+QW+EJbZ4a2iKl
	t2KhWrnRDLdrAlHY+QHXOtOtX4jVsrkiFWyVL4gHnyKM2U9KS2gqBy7FvzdjhKHv
	06+rwmBVGmq2HlCv7L3e5fKh9qD63JTFc1yZfs7OSJKRGwZlTzQa4VPtJreLCFRl
	9gBq8lp1iLl104flOuAILllRUNq3+X13vYOyZSEBpkL3urbsUYC+QZVD6XAR5bg+
	zBB6l4F4rkGn/r0YjjQ1aeLxBWC5yl/uIjV2PsFkZ97XJG+iin9fWXCmtYO17FTu
	XQiBIlEK20iNZt3BZePZvcdxqC5FjY91ePv2xUNboDy1zA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnk6ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 13:10:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so355694185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 06:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749820238; x=1750425038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=311F7krfIodtR5drIHKaH5khX/9H/NonlAsY598nqSA=;
        b=adAxsbuPV/uXzpe6Uv6MkIKAlNyciSNVBQrqdzjCAPtMXb/5JgNz68w5pRiMTr+szx
         WtLGSTvor8r3A/1jx+/1XCJVNZAvnbA3O3OLnjldtTqSpaajAOkqpGmzfTBw7g+gLt6M
         3m3/xma0D0otQ34RufjyNFMdU8CNX2RGD3dVhGY8g5kUBi2FlojP17+cSDBDpqxQ/MSp
         58ln3MXEA3FqiMpBisa8SzxA/XHs/pgR5DX9TKr7JBEFQRfuF7d3IKaD0C71O8Z+Eh36
         bUDi7KFMpr2B9g6JoKhoEc0lUugNueOf/Pl7e4yg5H7MG3TkqywtR8sBaVlIywiDXu5v
         Nefw==
X-Forwarded-Encrypted: i=1; AJvYcCWVa8glGrsnXuxuyqEqLPkjkPj7GnepN1wlgl9fOGsqTApj5ZVsguRthOqljKnmLCSQN7zbl1F0IVoJyW1h@vger.kernel.org
X-Gm-Message-State: AOJu0YxmB5+9Y4/H5XHwKEyuZV9E6mct4cz4csidTtJ5rqDqwb5cSjii
	yPOGDTOvFeX5iHZ5RKgnOF2uQD+yw7kx4YlW7sem/KrD0A/yeA+/elMo6GrCt3h1rTyVLQmnYTx
	y3RqGpqaB1Jl60eoVPMBEpqamnXGP5SH9RvGQYZ+RQXH2goLxLYLrhZWNI6V0S6qjFWQU
X-Gm-Gg: ASbGncu7nX2wy/pXMP6RO1Hy+MJkSqkbUkCRRUSBBsxZ6EN72Rj8A8CYAVjXimfG7yt
	VOUDtvLxDP9XSOyKL8HkN7Bt29q7zec54HyaKO24yVZ0p3Y6ALDuEGKitSAoTsMFkcJykLSENFu
	T8h7dX7CJsBcXQ4czWuFwYIB4NVXsSVYjzNS/GOY8TmVHZpH8fGdbSejP90TTFCjKgbEjULFErb
	PVemdBKj4nFkBul4W0UEY0x4bolkHJytBcEq0+4W/gulixGAoRUJIvfSqUuqHjhf/33zo65uQ38
	zJ4IRFJP58jnMI3Vd1Csl6w/6V3TYP5zYkLnY174gjZDJtJZ3fI9BNdxcYhlwjOw00gsgn2uaOw
	LD8QdohhmDqFlhDzBir6lAE2LSAcFLXa99wk=
X-Received: by 2002:a05:620a:24d2:b0:7d2:271d:d395 with SMTP id af79cd13be357-7d3bc4b5acamr527515785a.37.1749820238212;
        Fri, 13 Jun 2025 06:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7prG3XcpQX6Swj4+2/RLuYYqGBZcoo3RwqH7z0osM9u+iPSEeNwNKJ7Z5Tg9Glvb5yCkC8Q==
X-Received: by 2002:a05:620a:24d2:b0:7d2:271d:d395 with SMTP id af79cd13be357-7d3bc4b5acamr527502985a.37.1749820236999;
        Fri, 13 Jun 2025 06:10:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b33069a9asm5648641fa.27.2025.06.13.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:10:35 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:10:33 +0300
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
X-Proofpoint-ORIG-GUID: IVrYF8Cb-gc8OGGUTSpn_2IufoYCl0aD
X-Proofpoint-GUID: IVrYF8Cb-gc8OGGUTSpn_2IufoYCl0aD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5NiBTYWx0ZWRfX93NO1vO911Xh
 jM/eCD1i+fZZ9v3uRknXAaxzTj9T3ohCYmiCJHxempc2oPKRCIOBczE2xK+O0g6M7YgOaWfs/xK
 K4416bOeYvOx4zskcM3abK+Lb+6tOyPwAKaN2cC1o77QP/wal6ny8/wapDr0y+4AO2Dxj9MvNmE
 9N6Tw6LtvRn4to9TKgpNd5D9PkGMFGP0/S6Tu/mw+F0LlyYtTNxAfgKVBEJ1vCj3NVTsLOiAtIa
 OzB9pO8IUOf+5lhTSqqtD7uXtdySMSM9nVZfUmT7zMD24jGpXhuK6rO+1UXmNz8RcoRyH2mmADf
 FDNmGWfsqYxESl0INTgVGYh7OWXwA4diTHkFH3xXvJvlaNqptgWuVW4CTzi7Lxd/fOPo5LJhf67
 fFPEQAejV33Tbg8DdOxeY5uTG/CTq1ZscCdM9gOtyUbJhfj48ZTa2B7SMbq4nZ7QCHu3f6uZ
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684c234f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=A1pg4z-Cax2pQkPbWCoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=986 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130096

On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
> Add cpufreq-hw node to support CPU frequency scaling.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> +
> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";

This wasn't build-tested (or was edited after being compile-tested).

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

