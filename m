Return-Path: <linux-arm-msm+bounces-52078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB68A6A4AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C3519C368B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1EF21CA00;
	Thu, 20 Mar 2025 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5ClOE2t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FD21C19F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469342; cv=none; b=inizkJbEPgjeCFNhi0eRKrN5b859+YOtbCx1YP7lOrF9TJTvdeVMXo1qRSecnlAK/8618b0h5cK2zweFen4MU+HU0PCAVDwlTSAOR98DFGaVlqPvcsu7UqufdjktcPSG3eHZavkqkeJdzgVFP+Ejf/HPGB8+2QdbTqqkTKt3OTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469342; c=relaxed/simple;
	bh=8GeddQRYrZDi8Hn6C7CMbCI6u8Xy1d2P5T0zSy+S/Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxuRytS9eDWeCaUb6qaMWq0hgWSy7f58B0U8l4+/RXYGh/qAoyV/lUBk3rx0c4zPa26IAF0jJEV2AgNehSRl5PT6cg+lEfF0y4KolX8eJJtfFw2CcW/vinkA7JCtpgkhrqInVdLRCGqC1U3Cf70sisbPQ6Ll7+2UqHMP7IRAIO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5ClOE2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z3wM022787
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LViJEFSHQu4fEUHOMYV1gGdK
	UV6iZNYeAAORu+bVxSE=; b=J5ClOE2t2ddKY023LTxHu18K77h2+x0Rswoxb8AT
	TlFGt1I66/OuHvUm8rZDxGUr2Qnny6x6Bcr4WksTEWIRF1bqwXEkUta6TLunoEXh
	Wb1wVaTh0NZWbzVs0nLn9CDhpHcLrGNjuPA9V/7McGRP0emEhUgmMc9PmkdWlTMu
	rfFwp90ApRaNLXHZ68tbVWWlZ/IHOhWAE7Y5nrIEd19w7+QFVbiLkrKTqI9jPK6O
	zpp4Rfpqq/UJK2FKtZs29izAxNJgrVrM+K+MkCRTI6DZ8r4o0qXQLkhP1VKDXH2z
	ciix8C+vEkDchmYhF0osyuRgHyIr0J5aANK3TH6WWdywEA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fdmwx2gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:15:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9057432so13045946d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469338; x=1743074138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LViJEFSHQu4fEUHOMYV1gGdKUV6iZNYeAAORu+bVxSE=;
        b=jvrop77y6Sc5OKlqsfWnXMqwJkx261FnQMq5vNsWamRGlox+0lXvcq9prCIYcsPUgg
         4oTa9mfqKnRMw0M+VyOZ5W+U5YeRpkAYEJTIJV9iV2RuKQ/UJsCQ5UgyjJ39p2vP/0LH
         PsZocAV7fRaD3YhddyZlqFOolPjfANz5yQDIaNMAnu62hHTzXEauAuLyVS0H6LHnL/1Q
         G9GTLJt3YGY56solk7Sq3yc4/MoR8KqF/8TXg1Udn6qm9rIWU+zW2IcyOFXTFexBTGUc
         lstgP5uYERU0+AXiwRx8963sUku0gZHXrytNg2se75pIt1wzf1yIO++BZJZAvv51A0sG
         attw==
X-Forwarded-Encrypted: i=1; AJvYcCVGjYmbMDNnYXmMWV/V3G8Q/P1OjmJy0fCY+5aTGPJYodw25tEHQlrro5RL5yf5la4EopUl9F/RdQxzFOSI@vger.kernel.org
X-Gm-Message-State: AOJu0YwNentOKKAUjFBW4Qh/vWfQASh6qeNXKdDGv8qgdxcgm3mlTELl
	6C7QSX6B1NgsXj5Gb75XekX5amurmq2W6aWpSeeNUWBeWesWRzGxB67/4mGK7SQh7Wab4QclQ5c
	cf05wYN0hi5/a5P8PGlkJ8BJMWb4zHlvSK8sLep/W0mtizbKLN71bIEw11zcIMi3/
X-Gm-Gg: ASbGnctK/Wt2H0Q/tqMjvCFS7/RpnO/5cYAxRygY5pzlPrr1dypo7N0WFqLFHhJpXAS
	GbEXfXLITdAuO8HFtgU5KACycSxQbQa5MdWXGWBwYQyiKmfaQ51cjzoG8zN3VB3w+IzxhabFJ85
	5Nu8Wqkd0zDbd6h4caON0AuXcoQWXhwoLIhewSZyliwwkYl7Veg4R1u+NrPcSbidg6lYhq2tXTg
	xlctyeC201EAfrmHb/K+btZZ8MIyIsTfI5t+4xQ2goMzWwCNFUvne7mGMpi5QXNcRhojrPI34lQ
	ANZAtUh5NkP5/reboKt4+g4RoJbW/qwzA+Dv6Qw84NklvNPVLazf8HJqIhorniBFhyoGEpp5k/5
	a9E0=
X-Received: by 2002:a05:620a:4409:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7c5a8469324mr1058963985a.36.1742469338412;
        Thu, 20 Mar 2025 04:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB1D9oYjTuzcj8GT6lqyA6rvN2jK+uWXGS3E204rCKsZ1C8vP4wn7sMsblG886rNS9kUJl/A==
X-Received: by 2002:a05:620a:4409:b0:7c5:562d:ccfa with SMTP id af79cd13be357-7c5a8469324mr1058959385a.36.1742469338088;
        Thu, 20 Mar 2025 04:15:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1c253dsm26168511fa.80.2025.03.20.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:15:36 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:15:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sumit.garg@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sa8775p-ride: enable video
Message-ID: <js4dmf3it42mhiqvjk46fxo5nbxfqzqlmkaqmnqqvgbbi3p5rg@myaillyf5evh>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <20250320-dtbinding-v2-3-8d8eaa4e76cc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dtbinding-v2-3-8d8eaa4e76cc@quicinc.com>
X-Proofpoint-ORIG-GUID: o6UZkXVcF3ucB2DSSv9QEZs9PIeJO3Vw
X-Authority-Analysis: v=2.4 cv=ReKQC0tv c=1 sm=1 tr=0 ts=67dbf8db cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=zU-VzGr7wih_uMZSifcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: o6UZkXVcF3ucB2DSSv9QEZs9PIeJO3Vw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200069

On Thu, Mar 20, 2025 at 08:24:31AM +0530, Vikash Garodia wrote:
> Enable video nodes on the sa8775p-ride board and point to the
> appropriate firmware files.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..2b3d0876dc7f270dbd24081b698ce80e2c27a174 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -1038,3 +1038,8 @@ &usb_2_hsphy {
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> +
> +&iris {
> +	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> +	status = "okay";

Nit: please add empty line before status line. With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

