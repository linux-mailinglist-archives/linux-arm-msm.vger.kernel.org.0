Return-Path: <linux-arm-msm+bounces-52231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A76A6C122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 18:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 071E4177CE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221F122B597;
	Fri, 21 Mar 2025 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3QsaeIi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BF22D7B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577591; cv=none; b=IbFTB8mmdMq5pGJ3XKxedbsPNGNQTkLgToIIXyblYDHqfCQpi5pfESZcvlUDA9Hmbw5EyzWP4W1RyjiQ0WhRd2oB+fzjiTX6GizHz54yIU0RBf185qnYdawmEEZXn8lMsvGOQM83YaOu5JqhEM2806j3vLD24goAjg/0o2YifV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577591; c=relaxed/simple;
	bh=RxFtN8yGAxrNqy4cbQSeY+rnG/poLgToWB9oUm6qL54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNCF+O/Kyx0KcVKWTejddfzLFtjfXK7s61Thx9EC8lLsbV2OewVojc2RVoQbV/q4PAFvnSpbfH6sNVOlo6Cjql4XpcQ1snuFtpBZ+3VFdA40rhSsgiKI41CfnnKPf7PV5L6rT/6dCpgTQa2Z3bodErN/lX+IXU9QkBRC4KKl/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3QsaeIi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBmb014999
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8uqUXv0r/8O3QLVh8vDMkagG
	kjjokeiI2xDdN6b6W64=; b=a3QsaeIiEM9t7Qtuc+WZurmqy0+WO9wpbCDREBb4
	FsQAJGFS96YtJgPsMW9+iufBUrK5AtDvSwuIhvUGw/DyPdevDEcFq/wEWRk7vra+
	QgMaxVSfY0mBRNMwAbjKYPtxyhZSAEUbAJ8Fb0ObOzSTzLERuQVGkF+z98WCB50m
	T4pn3/IfV63vVMzeRgUtNpvsYv85TdtmdocNVnsUYCS8WnTYz0hA6mqQ8E9Ih+Lu
	ggZ4OkkUaneyDM5iPE4d/zJNXXpOMrss4EIBeqwqFrVcBOXz7GUuW7NJqIqUsion
	IITHSQ/nTxI0cOG0TbpqPfylJze671pdaHwI77Z56e3A7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngnqjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 17:19:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768488f4d7so39602511cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 10:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577587; x=1743182387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uqUXv0r/8O3QLVh8vDMkagGkjjokeiI2xDdN6b6W64=;
        b=VdscNjm5aKhRGUXz+O9DcTdwgeRVtIGyBO7i+F67JmCkKnC/DVSQVZp0UM2KueWg9t
         D3K/tB6x4uTzXNNsE4XY00NHkkQMgREulh5Ve4mBQwO3IrNcXFYcrwBXanxclgnuQcHi
         SamUydNN5zQbDYmAvLNL7BYXzXEHCLUoZeF6W4Y2ftYG3pxpRoqGDGcgwRH2Zk///4Db
         q0QYAGlQg7C1BkiR3/Li4VHsylVkwHtEcbZuqQfhMcTkrURVJou8BFTwJhkw0rQLY6KB
         Q5brAuVU9C2zATXCa8Zxvct5QH70c3qj/c0O+VBHCHZ4DymPDbDExFV6fnCrtQpOv7tG
         KFig==
X-Forwarded-Encrypted: i=1; AJvYcCWQSewOzPnwafK9/3SllOnnG13IrlJYfk5ajiEMYh4SZrbB3cHNzNw7WGvS/IWeh6+S4+RsyPGfiZo5QJlc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9N9B9bWJy8Lbuz7Pv3Nh//9d90+i/ov5QL/YD/ivpxX32KjFV
	aQCym8cDyII40NumXPJOhb5bNAecOsdCK8kf83c6/4SkWl2ctOkzpP7eCyO713ImlIKLZpLHRJ5
	Uh3bm/+bSuz0A55M9DgZXFtXxS20dxktnigZ4CWAVgMNLsLnpGsGi2EuiOrJNzMlv
X-Gm-Gg: ASbGncvr1WC1sMKaLIe1n7JLr/lUJVr4i5tx+Qma1U3NFdFJumjBA1J7Em1pXqX4Gku
	tSPliuK/x+B4vWWsZiZR5X4W7+HkSDlgwecnNLTnhJsqnjSr64GgvXgiaH7j+fhqwMnPww64vNN
	MeEK+vijsjoNEnhchrP9FOrN4PFieIZ8cPKISA0yNog753XDuvGG2spKTRUKTU5tWpnBatiHKrH
	12Tc2ROwTxFq1nf/q45v+NGfRNUoPr81lZUDkRMmhEfyPb0eTcpB/B//EvHco3Rn/rZ3aqG1vcV
	ZekrrzYvmcGrPKoWJKHim8D6uRObDYz+4tl1PzjlAe+vuOKzRajoB8DUN3oeQFXrjfLqQQx+8Y3
	YEAw=
X-Received: by 2002:a05:622a:989:b0:474:eff7:a478 with SMTP id d75a77b69052e-4771de6458fmr49666151cf.46.1742577587094;
        Fri, 21 Mar 2025 10:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER60Phq8nLZh+XeCU4Jt2MqK+yrUa3O0K5NTXyK+Z44YiEZ4OyV6O67mgxGbNT2KMwFFn7dw==
X-Received: by 2002:a05:622a:989:b0:474:eff7:a478 with SMTP id d75a77b69052e-4771de6458fmr49665781cf.46.1742577586679;
        Fri, 21 Mar 2025 10:19:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad646893dsm226011e87.44.2025.03.21.10.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 10:19:44 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:19:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
Message-ID: <hgvfxxjvquh3tn543ae44o3lie3pwld5snbewy2lxcrtgd4raa@eyfm57omt3ge>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-3-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320055502.274849-3-quic_wenbyao@quicinc.com>
X-Proofpoint-GUID: Mum4qOsfXtuJRvd4iDdQkxwyCZVBd5aN
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dd9fb4 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ICgkrN6sfqZrQ0pjF_MA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mum4qOsfXtuJRvd4iDdQkxwyCZVBd5aN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=996 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210127

On Thu, Mar 20, 2025 at 01:55:01PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..32e8d400a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,16 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +			pcie3port: pcie@0 {

Empty line between nodes, please.

> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>  		};
>  
>  		pcie3_phy: phy@1be0000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

