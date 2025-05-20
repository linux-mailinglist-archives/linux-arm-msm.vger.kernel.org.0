Return-Path: <linux-arm-msm+bounces-58719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7EABDA0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B073B9752
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFABE244693;
	Tue, 20 May 2025 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itVwlzfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C54C241103
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749204; cv=none; b=QFobCKv0xA++6kP6eZ9FS2055EsRi5sMtDIpGcwN5FMvZFAxrqWVTXERyUaNkV/UwsptlkG++ivG0N7LaiI+20wH2YKPratru++pLv3Z6WUurQgBr3DwO1JQpLo1epzaBOgos9VX8LkpWp3YB1y2akPu7fpVr/fjNnWTbER9gVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749204; c=relaxed/simple;
	bh=NytEchRmD6ri5y6zBzI9MoKSpnGuOx8B4CkQWKB8wzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjPAKj/3Mlcr1kIpKsXLwCiBalt1xIIl+IFHhdQS6RBN39rUU4wUvyfx1OPV8YSPEYv6wCMrKVEXrWXHQpEgdaNIc4wn4W/QwAGxHytGdW+iIyYBXU9JAAB/nKcPdbzWrPLjAyjMhbHcA9qmoWERmX26ncMjiuuf3uaSLUF/49g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itVwlzfv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7uNuE011101
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzmmkJLGqmEy95U2mjSsJRItOa5uU8/07pfBFeoUYqo=; b=itVwlzfve9ZopG0U
	VlMKBUHKf6o5qCGd1JpGln30ho1N2kZETxNwEmnaryyzgQGDoizTyQDSc/gGVsan
	XRUPBYM1spQs+TiuEHgmzS2wlBZXFotQBXGv2AVVlOMGIkMuHkxFbmuOEQit/y+J
	/Oh9LoPyl7rjNAPDXBzsWB494eNNXIVU6LaK5Z9zyRQrjQi9mrvrjyKUxu8uQgQ5
	H/vzqs8noW8w1W2sZCOOwkfw1SyvcJId6Vlmfsnur7KYqaridSz8QnUjsybkilhd
	9sKBSZSnQlb5u90l361pRv7FbVn2ZPaL2CQdo4em3ylhVKmuCqywAVG+H+xmHGI+
	JgYPsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22bq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:53:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8df8d4585so29506486d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 06:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749200; x=1748354000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzmmkJLGqmEy95U2mjSsJRItOa5uU8/07pfBFeoUYqo=;
        b=XZ+lyvC0rpMeNvb5HthepXfEI5Ox7cL9sVqFzMJjo2+QWWiwdtvqu6EAL3rCg1IaK0
         X5XlZBJS8pKJ0izDRcwE9kLXMLOOeNvyof6Ufib9hLUhBEBEhs8PxT5CPBG1HwaVi46F
         UFL2YORXF3DSc9NByZe6DbBOvmjj2NmdBMKL6/teImVGWnAk8hsZWHy0xH/XNCSTKFnt
         V2Rt8TSxWzZoGnxPZuh/9b3LXEUt/+rhAl3RE1fgJmFUJEtPxTFMXK85adZEigoIRJnI
         ItI4dCitfbj7YGIKfB7ag/Hr3FjVzERZfiCCJ5GVs/EbCI9SSgZUzEgiEz42PKbveoiT
         ZoSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpXdpd/BWikcTeKN39+Mluc8/81oWT6iPmRU/UqkGAA2dPX/GvGzeWZc3EK7xW9IBe8jhza8C6thvKv7/0@vger.kernel.org
X-Gm-Message-State: AOJu0YxHuoDtZPa9hmy25xOHwmHirUU9wF2Epb/4pJJgtAPMczndXW3r
	wHLhHG15k7lIbo5HmpZUsqOjAWnqepOGLUBVS2lXM6FgOBembb43PnUC3nbyCvw6ODORyUCYun+
	o9LxTh8tfb25ur9jQtZJVCmwqzCVxWTWavIlKSrVI417290AQclclciIQ9Zi7qkwxborLeztdAT
	nXS70=
X-Gm-Gg: ASbGnct1lzR7tl582C6ccKSjU5M5YQYP25SqTLFHnPG+OTrzCHnpbRqNTkghKija3At
	cmp1JwcFx//YkB105Nv1zKzcYG1k//zf+hj2eN9ECbBsj9Tnrf/pKK5Uc52uVgRAwAzCgONiJb7
	R8+QGEnK1tV+puau911oJvpdBpAG4hz4/QxD2mzkAGH0jR0TNmLe602daZVaytGFOg1EgJI5+1m
	RiP0QHvTGNenCZvYQjediSHMSlyZ21qJ7wkaPrDugTlou51d3+cv1/HdQxFqgXAp8qFrfgiPSRH
	5YKAP93LkGRIP2kmfJQW5ya7MgfIxndg/tCBx3G37jJ8lYGshv62Am8LorldFQr6QuT4QEGbQ7E
	=
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5264 with SMTP id 6a1803df08f44-6f8c23c84f2mr149748076d6.1.1747749200022;
        Tue, 20 May 2025 06:53:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpbUSkwGfbZZniCfNdqu3+I6X+lzhrHJKQURfdahHBBDAeuuxwT7dh2le41RV5OLb0mIkroQ==
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5264 with SMTP id 6a1803df08f44-6f8c23c84f2mr149747806d6.1.1747749199646;
        Tue, 20 May 2025 06:53:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f302c2sm2360020e87.61.2025.05.20.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:53:18 -0700 (PDT)
Date: Tue, 20 May 2025 16:53:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
Message-ID: <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMSBTYWx0ZWRfX9XitY0YitjBX
 s2GUAdP2uIVTomVSFTl6tA3QDMundOK4OpY7gGjTD4SOrRkoJwRef2SvdkYe7l9cjmkfJ074c7N
 l+Y4MCBujmSmKBwsLcfCKWlBXyCfideuEdTJ7v8dZE9CBcT41aRgtgYSYpK4ZOz39fvG72Sgzpk
 Fnno+9n4yicJnfKuukJX2G2IxCaGGoR3A6v1ABYmFq6IsNzrk2u4W4fAVwBTGBppbj8NW8/8No2
 8P4PK90tEoQSTmMSTcWu9VHDzhCWA5VetP+w6QvMuxYGsS2Ypa9SP4vnX86755kLCpSdV4BaWhZ
 Re/00MhDti9MM7TlhTX/GLYeFKfvz6YDzNArV7mOa3wz1lGyP7LpKBAZbQs9nyAfL9R6QLKbYqT
 fMKrEIc8whn1oKiXT+BUztCLQtZzp3gOS11VJIFf7iCpgSbamkDB2+PZ8aUiWVjfj1oGfZ+y
X-Proofpoint-GUID: rIFR5iE4N7ObviAzMa5FQk6ZzwoWtU2S
X-Proofpoint-ORIG-GUID: rIFR5iE4N7ObviAzMa5FQk6ZzwoWtU2S
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682c8952 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=BA8RXWgV6jDCk_iHtoAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=930
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200111

On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
> > On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
> >> Add reserved memory region and VMIDs for audio PD dynamic loading and
> >> remote heap memory requirements.
> > 
> > Why? Was it not working without this heap?
> 
> yes, it will not working without this heap.
> Memory region is required for audio PD for dynamic loading and remote heap memory
> requirements. For more info, please refer below patches, it has provided a more
> detailed explanation.
> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/

This triggers a bunch of questions:

- What is audio PD?

- Is it a required component?

- For which platforms ?

- What happens if there is a memory region, but it is not used by the
  driver (SM8650, SM8550).

> 
> >>
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 8e86d75cc6b4..d9af79ff8c4e 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> @@ -188,6 +188,14 @@ rmtfs_mem: rmtfs@9c900000 {
> >>  			qcom,client-id = <1>;
> >>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> >>  		};
> >> +
> >> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >> +			compatible = "shared-dma-pool";
> >> +			size = <0x0 0x800000>;
> >> +			alignment = <0x0 0x100000>;
> >> +			alloc-ranges = <0x0 0x80000000 0x0 0x40000000>;
> >> +			no-map;
> >> +		};
> >>  	};
> >>  
> >>  	cpus {
> >> @@ -3863,6 +3871,9 @@ fastrpc {
> >>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>  					label = "adsp";
> >>  					qcom,non-secure-domain;
> >> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> >> +					qcom,vmids = <QCOM_SCM_VMID_LPASS>,
> >> +							  <QCOM_SCM_VMID_ADSP_HEAP>;
> 
> Thanks. Will modify this.
> 
> > Please align '<' vertically.
> > 
> >>  					#address-cells = <1>;
> >>  					#size-cells = <0>;
> >>  
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry

