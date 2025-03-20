Return-Path: <linux-arm-msm+bounces-52077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B2A6A4A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75B0482F81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BA521CA00;
	Thu, 20 Mar 2025 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z1vz7mQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3031B0405
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742469299; cv=none; b=mUVQJzb1RZda1YXKxzdZFWXyWYdymoJy4PJnKmQTovlWO16emiQxrBzIGEGrjHI1gzjZ1jDG3c3Er7cCllrBmi4RWwHDNdMIz3KU9YO0szRilaIxi0k0aNma7hCfCkkgNUuVUGdmIBnBm6JIuMXcHJR9TdaPkU5VJyrWbYWx8V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742469299; c=relaxed/simple;
	bh=KlHQ/WFnkGjmsqgep/V6ueRLG3RRI5gfdfEkHx5aY+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuzXmMNb2MKmTAlheL3vW1HCEyW06ZTkJH0ELyh8xiyMmi1ik3fR7CsT0oJDdPihKTPBLouGqlnRK+lRHpiWQZUOLU51A5fym6bsje/4Ur+r8ui9Eaq4K/VciKzqEiWeqxfmq8y44/KeviwTZkx4M0T0TT/jSNLpbG8qtavpmXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z1vz7mQj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z6Ex017488
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CphREDIqT3X+IPjX/cFD5C2t
	2uq9/2FWUbiQkv6xqKk=; b=Z1vz7mQjo0Un0ItYPnUmKcpxEmOMhvwUPHux9/HE
	4pjyCKfZ0bo5JF5jNM9sprCe+y3uJsquBFzo1JBRygHdRKH8LqzLkxz/wFukmAMn
	9sn9wcP4vVg6hkGaZVotIZhxFb7s9NCb+/UmXmnh4oN1/827Bb/Mn97vs0M3X6Xk
	STt3CMLuVWgTcqRm7bRftbjJSQPhvoF+sqlPnQ3inDMoyMnJKtwrWxGwSYwXPMAE
	ClrNVYp0ovXetJZGe2WBxufw2eR+ORTGD0dJLuwioNsu+HsvrEbMhe+XbxuO9v6Q
	vfZJyJGR2cGjBNZlxPcJkp8ZKhsOhbfn/dKv1Y4VmNQC8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbrman-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:14:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0a71aaf9fso198815585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742469293; x=1743074093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CphREDIqT3X+IPjX/cFD5C2t2uq9/2FWUbiQkv6xqKk=;
        b=EqlfulZehcuv9MDATFIISHaC9NsmFjiUXGcZZC+Qt79ZByfHPMTD/yFGRLPATuragp
         AuquskV1tsbt3arVl/LDdd1gDUbWUWoIp52n3KISyNAJmEzCEDGfdR/7BZNXFLv4fkWK
         33AwmNhJYw0RS5sOJ3vT6xX/kFPE7zf754qamtM+jvpjNwnk9DbLUT52xejcB59sK2ZS
         wbVitFUTe0aofMAU/Ty6veeyTYdbIvH0aNwtRZuCEdZFGg+1Ow50fJy9tL0MX3iA6Y/n
         or6ypaRrtXOY0Q+2KyFw67xqiOhu9ohjs254czzbAwkHBj9wZeGHLRhF3Sb1orD5pFHU
         PXvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdAPguum7+qt+hO04wgVIJBsSKSKBK9IUmpBQAsuorioTveDwq6u/LXKvxiVOqwXMmSdyThZFinghqKnCd@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfQ65Xb0EbM+VBJaAaYoTCh0uhYhVL/nn5LJdOuB5n1TbZwfF
	6FhA2AtnMmIqaI3o8KmCah+Rk/06vuSDzikAepnv2t6wkJcWcmYvFHvPumMEUTcMLfDgoQuaUjT
	2pwLnPw6rzfl260P9opN4uqS8B4tOnKhjFy7souXTZadu4BsVvCoPoQJVJ+H2ZQTA
X-Gm-Gg: ASbGncuHygU49OkfzSlq45T7Z+vXLuIOs0uMsst1jQGWMQKGeznHjQhEoRAT8wuPbyi
	Jjj4WOZNKjiJ36z/wnMFMgYTDfORGHXSmp9lnhfYXV9yobWTfSulW+VnhRowLycIlQZTnDqQQ/j
	X5ilHFQStt7D651jOMUvglzPoYErwND+DQtxAyhvWLRI5La1ZWMO6PRCp//qqtjW7TwjQgCvXwp
	UE4H5KTqMNkCgh737vjPAGDVTbb47DydQPhjgCpKt5FVPDytdn2uE0Jnv07BshpAy6btEN0Vu/c
	iCK7fwwb0CL39uKU5vQfYfNJDEE0/NfJzQ4NS5m538kzMx5+vwyhVOgOpzRmULbdBOmB+N1D6po
	3Vk4=
X-Received: by 2002:a05:620a:46a1:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c5a83d3f7amr778271785a.30.1742469293280;
        Thu, 20 Mar 2025 04:14:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMbzGxGL+jwpf9q91HSRSqez6HkMOjgloJv545KGKYFtz6HFDw01gcoqjAgGPrCIiuIhR30w==
X-Received: by 2002:a05:620a:46a1:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c5a83d3f7amr778268885a.30.1742469293011;
        Thu, 20 Mar 2025 04:14:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a833csm2243614e87.44.2025.03.20.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:14:52 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:14:50 +0200
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sa8775p: add support for video
 node
Message-ID: <xlzyboz26ma3kuvwjbnnev7iolcnpm3wd5ajps2v7ci3frwsqs@3j6qfh4n4ujh>
References: <20250320-dtbinding-v2-0-8d8eaa4e76cc@quicinc.com>
 <20250320-dtbinding-v2-2-8d8eaa4e76cc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320-dtbinding-v2-2-8d8eaa4e76cc@quicinc.com>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67dbf8b0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=2z3VMMZyhDFlt49ukAUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mz0UMDVpVY4wfPv5fw_Xedw0ZDM7TkVX
X-Proofpoint-GUID: mz0UMDVpVY4wfPv5fw_Xedw0ZDM7TkVX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200069

On Thu, Mar 20, 2025 at 08:24:30AM +0530, Vikash Garodia wrote:
> Video node enables video on Qualcomm SA8775P platform.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 71 +++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d13003417a15e64c9e47833725ec779e6..0b5bfcdb803913396ff269c9002b4314991075b8 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -3783,6 +3784,76 @@ llcc: system-cache-controller@9200000 {
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sa8775p-iris", "qcom,sm8550-iris";
> +
> +			reg = <0 0x0aa00000 0 0xf0000>;

0x0 instead of 0

LGTM otherwise.

> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +

-- 
With best wishes
Dmitry

