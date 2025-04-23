Return-Path: <linux-arm-msm+bounces-55142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D46A98B88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72CC74454B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DD01BC07B;
	Wed, 23 Apr 2025 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3/qI/lp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456A18FC91
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415606; cv=none; b=gzqqzZK9owNSmzkAyo5FmsKUpZ7Lqu7YF3OPUMQ0gFO7toPsrV4PqR4g/iAR4d0MRP04N5NWDRJxepGMV2KmGKM8TZO0Ce9E2dbbRjDP0JKe+zuMhe9Nz2WAsJDT2PXOtGcFHJWge577yamd+m5dbQW7h6h4Oq7vHNVXyFVr//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415606; c=relaxed/simple;
	bh=rJwd76XakKbW6cxRp8U5C3y66nF4fzEk7nsIfRq8GqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmDxlC/TJke2ZOAQyJTrP/eSIuPw9BNCESYt4Nwpnyb3oOtYli8hq+MCx/YoAgBLKYwvcYdpv4EJcfV7NVQzjfKOCNiwRRQWgvZyyZHRmTD9ZB3J3cUKwngH/WJqAnpW9EKrEel1WIMZSqzDz0IqnS6PkGwuRvTkkPGH60sK30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3/qI/lp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB6aeG024113
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MzGZGH78O/v7VDsO0hbF+sd8
	L3WE1LofXSiV/zXbbD4=; b=d3/qI/lpCL5OMx0yWudKghR5Ka1Om5c0Zomxf3dU
	V615Uvp11b6aR0VNPvCfbVGDyrzoj2VGeg6LlCg1/Tj4JWxpgjdxwxNZR2iyQPCF
	4KWsRP1VyGNDDvU+knRPnTmDm235qSfanwbC+C89naB2pizHreeEsm1/sfecsm4/
	JeO+cK8W7kvuplzdnDLxCRKCfwq+A0FQZV2o5sb/gqa4WqUP5Dn7HwJBYs6G2Y9C
	9kdf9iRn59ls8JDeC1w/ilmyrOsAeW761JLPs38rd+3otMYucsAjxNNXvgrJxzss
	B58J6sk4sm5HBsCkfyvhFG5XjaYp4I0ukHWipHXkwmHb3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a9bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:40:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c572339444so984398585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415603; x=1746020403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzGZGH78O/v7VDsO0hbF+sd8L3WE1LofXSiV/zXbbD4=;
        b=ijRDQ5WxuAqi08V6+/t0sZm9AyU2kBNtBeBod6SIXibG/F+OIEPrbIZMLVVCGIMZsS
         yVb0AqNBfFVdpNAndxp8R0uq0SQLDiwHGTSLiZPzKxMiUJjvhJp955ss4TWriYojGEAi
         Knrb/bPGtkV4vuWa7YOUZb3Q5TLmB19gCJX7tgFa6atjoB6uCi+7tdYIksEo96QErjBu
         nUlzoH49jb0xwRoHbubSMr/mRH4Av7OcwBP58pTXnpbmPWC8v7ci0+LsU9JPUaSLQic4
         5LtdFIwFUA0Ddm+ELxGapP3JsQyTSXVYaNV3VHc63gPmw2NKX7TXJ0OuTub39jYH1KwA
         7JIA==
X-Forwarded-Encrypted: i=1; AJvYcCXFhL8A+SedfoR7DMalTpSW8qL08BbiYKl5tWuIEjUfow6O2eMmm5aACQpmljR0Ee/dABc5RFehNwZ8HYWh@vger.kernel.org
X-Gm-Message-State: AOJu0YxQGeHl/f7vFjWfbvLATw4EUoOCxpU2uQZrHyDGruHXcLr6lLCa
	JXEd7sLsnSQq43l5NUC+TN+7tvwsSWXspjB6r0mmJv0yK1jo19O0HcF1iUP3aURwy0e7OedU2Xj
	uriVILIY/slJIZLFsDUOFKpX+/0Eg9fRBlmq3ZXMSfs42fFV18R2E2WJsVZanwSnI
X-Gm-Gg: ASbGncvb9RKGjvjSxV7XV/IGXWD1gUf9ukgWlopOgDJZVNGJtE9uDJqirDyg0jPmh9/
	pWEG4KsHDjhqAETiq36aKzt/q0g2K7CRLltUUtMU/j34MDC7NY7xNnLo3ppd38PMbHZSR/gLfIt
	dKbZtI8ECb+F3xLVRBY1RiS2ivS33a8oSYXSQ2WVOnZTf8bpimToxy4ytj7idVjUzsC9iY/g3H0
	bCj6f14+cehkldLmgwg6fDH5gSPX0kgHdXg85jgmwBfwhFWM7TuSdZkYdSVymuB/JdTE9WmQb9d
	4cLeO8eJvxytHLOvVuHeNs8LRGssv7q61zBz2PRtSjV76rWGbv5djLWtb0Jvu8R11KIFWVM+nMU
	=
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr3328124485a.18.1745415603143;
        Wed, 23 Apr 2025 06:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXVhG8h0EHaKSHuLFmXYtc89YmYuzioiRWb4XkNp4qE+H/B1Jd7+nH84J5Bky5hsij5Y6aHQ==
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr3328121585a.18.1745415602827;
        Wed, 23 Apr 2025 06:40:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310908270a7sm18290281fa.66.2025.04.23.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:40:01 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:40:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Message-ID: <n3o4a7jokelces4jioccoub26ikwpeyzuc4ac5uzvumqkilha6@gc7w3qpb23q4>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
X-Proofpoint-ORIG-GUID: k8O9ySJWLy28api4c3ESOriJc-S2foJp
X-Proofpoint-GUID: k8O9ySJWLy28api4c3ESOriJc-S2foJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX5fF8csIDywfQ ycMyON6Em20xog+7YGN0KObWF8kFHEur6qs3AQz+1F3S6Cf1SWVRG+wSePWsNewSMwtsGxcd0Pt 19nVGhiOh8Xlm66p8tbnLjUtIcmEfJQHCUxDENaLjJoMZyjK1td3XMbXVXO6aHzTqvBFstjBBUx
 rGmZreqU3fwNc8ngjf4AEC1fu/GgqAfbaBnX45ilIoJiPh9HqRFSbasivv36VRdK0+vDvcWPQRb FejR+mluTBe9HeKACsT0bHvFUZpCsmZu+L0SLQEto3Ib5/v0jb73SVMH6MpqaiRxtluCN6/m/Zh vzFi6DiMrJtQZRChEHbo+sK2Jx/2x7ibi5pVCz5+Dh01PrrdiiJ9vQsCTDWfo/BrcH3t4CUZ4xc
 aKF44B5s0eYFwYeF1YHgPozNOUlxUr6kaPeohpJ5DBDxv26DAwtg4ESKcClm2jZR6kxSJjgO
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808edb4 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=2fRsUtMu-athF6_tqjIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=841 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 05:17:42PM +0800, Lijuan Gao wrote:
> Enable all remoteproc nodes on the qcs615-ride board and point to the
> appropriate firmware files to allow proper functioning of the remote
> processors.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867..b0db2c3ad409 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -240,6 +240,16 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs615/adsp.mbn";
> +	status = "okay";

Empty line before status properties.

> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs615/cdsp.mbn";
> +	status = "okay";
> +};
> +
>  &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
> 
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry

