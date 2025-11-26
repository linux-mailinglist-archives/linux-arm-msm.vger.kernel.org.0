Return-Path: <linux-arm-msm+bounces-83377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F20C882F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9DFE6355B12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C70227C866;
	Wed, 26 Nov 2025 05:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM8HwPw0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLmx+CsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E52BEFED
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764136220; cv=none; b=DyZnL0Ib/TZW4Znky/9xW33vKNtSRHtGGt0qnh/xetRfKyEaA2mRBv6mbHzVtjlY0t+OTwZdYPnGA61kfRq7X3POyj9ph64yAXoTQh9PsQbXgq2HA7EjAVy/2CeRDnBXfN7VMTdQAatiFpSZcPoL0u6EDqoHhNw0fqlZm1/6j8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764136220; c=relaxed/simple;
	bh=ttF7g/HI4xjWDO2S+W1eWwXwb0J1pzuOvnpAW6X680s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgo/h2JND+P36j9cWrii9rI9t09aoxv4+3bC4k4S9MSG5aQTi7Dx1FC+MQf+3tGOhOpqNBR0+m60MyKm3Lkl6skyDdW1IHs/a8tPmcQGmHuhnBlmaISRppfbx5l1rNN+utAaaeBtjfV2CMJdFnB/3dUdXZoFeGnIpyk+a+PjgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM8HwPw0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLmx+CsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APJqKSn3255887
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vrcddnSWMIMist8s6iUOyqA9
	lH40P75BQ8M7NzoNT24=; b=lM8HwPw06UwJhEYeSnF4WklV9yIyg0ui45Cvsei/
	daI7gIVgpOnuYHkZplSw4azaHPQ8HtMbKvr2EJ466l4XOuo9SCVrK6nCOptVLiXF
	ZlKReiXAEro4eXIE+8efGWMqLiELFZi1Tw2DFjBNemgxemvDh9II/mz3k5wvKsQE
	NWSobL7YSRNN8Z9ehrXgDxBPTdWnpTRGueCAUNjED6SSDhcRqkLiKwtTVo6mLGp7
	6gNevpWq5+OYB8wLvvI9AWUhBrGCavyQpU2gBHKMSB8NHk71GBRBSYor/6n7FSQM
	bDCiE6Dc6VLI4z0iWDeQPFqDVXovyLvzvRYfzPZzBqmECQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c2pnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:50:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so345867a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764136217; x=1764741017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrcddnSWMIMist8s6iUOyqA9lH40P75BQ8M7NzoNT24=;
        b=JLmx+CsDyq980irVNWD7Zyh00r+VWE9PQ2Z1lzM6WzKTtRMiUot60CJoBpiKJ6xsXV
         xkaVvbTnbcPg7aytwuQ+ih4XfPeGFzbcXGtKzFKmWuPpp19QY/3YHMKeg6W2HMizAWlD
         V2T9WAcdIPfXLtG5W1yH9Fpex9cfkXtT9HylBEwyQxR0o+bMLduNqiGKGLypd7vhnQCn
         F2L/9z6ZNNJLIkGO0xNdAzrWdIQWbuAf1Njw7r58SxFH3678GC1iBOsH7Jbsr6vtSytN
         v8aXPoThel1wyAwBFDjvEtnFWWOpRTJGG53rpB6VtJMz/EUFdJRvAltlqECwSTly83Rr
         Sdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764136217; x=1764741017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrcddnSWMIMist8s6iUOyqA9lH40P75BQ8M7NzoNT24=;
        b=vdF9R9lFZsO0yHZ2urzVtQRqUhkSD0U+DXWz0ObI255eTw5JUSbYSEkYw7zEjpV7wo
         yyTrVOnE5DTRgGcnzjNb1LI/1ObZvJ6LHbpm6OcVIitbXUoMhIvmCvnoEo+AvsWMqEW9
         e9sDm/ciA5py71n0mRXFMReLx6PHILMqkbJtUyHCcj0N5TB1M5nvwzK5wnmz1le7j4r1
         Kcl2FFAE/vWIzcRu0bZ398JrICCYnkR50ByAQVfqVqWwF9QhOWggyhGpvXlViny12TOQ
         o/cHng3GQLc4totR9cSi6L6GbT85Y11bbNQgv5XESBZI5VqWoTjJkqF9Vs8im+UaMbQJ
         7ymw==
X-Forwarded-Encrypted: i=1; AJvYcCVp5H7A0b3Ca4DNpbjHFJtBcMyVJNF3VEHlLIPT7n//9eOgMDObjOakQFg4npnFqtDNq+tTp9QmwKfkzFyb@vger.kernel.org
X-Gm-Message-State: AOJu0YwkAj9p1LkvPjtvd9Z3nU4LWi5ppelNs/EU4b9LJSISSjZHc9VS
	ATMqIg4hkgFzoOaI9oKdLltcaUYrNOdJR0/hhiCdGYwzZvnUpTkoUjP5mngvCYmfOAsk6V2LC+w
	6iN0G8erfUD3kUw3EqJ/5Tp0140mDkIzcj7g92wk32Wr/sL5aOZdhYSeV0TBLngfxh4Hn
X-Gm-Gg: ASbGncvJEeBAzc/iK4D9Bq+NHbvuVhY6kJf0/vH9et0dAAcVmDI+IVfDtXow5ijxGkU
	ixReeAIAXBrSBwb0cD0oCkQ3iZ4Dqii3li6cX7XucBaiDJmy/IZwbYuzDQGwlGBmKBPEahLZGmt
	VjrS8Zf55KuypKiC/JaIt8RQkGQ2jwoi5PbIRxD7/CEoXn9uhvl5aOF08ABDsfA0fqIBLkTauXV
	xr3A+Aq+HqKaksadL+O/xC4D1z7tF7rxxwif+SefZ1gTUeNFxIcw6Ys0A1pf/g4wl8g8X3MOr8+
	qTvt1FCxiuWVXQXzkaJjoNxySzYALLVRic1qB0PIqkwTBz2M9XARHFZeoGKhLDbwNqKIm4mS0Eg
	/7BrT83EJ4HRMKPIK/OSwT1RST5Vltmqjb5+SuL3KwYEgrhUnkoqLmLtx8vC52KsTp/jlUMan7I
	a1OS790m8fF8RezZhmzohXscPPRxI5WR5SbyGQSw4=
X-Received: by 2002:a17:90b:3a84:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-347298aa082mr20939770a91.10.1764136216375;
        Tue, 25 Nov 2025 21:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1Yd4RRVFedf+s50sVVrr6yg9PjUjyPbdiVwivB5S7YHm+LoWXx+GQ5QLyqWmewklrHSiJIQ==
X-Received: by 2002:a17:90b:3a84:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-347298aa082mr20939744a91.10.1764136215825;
        Tue, 25 Nov 2025 21:50:15 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c414c226f9sm19690543b3a.53.2025.11.25.21.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:50:15 -0800 (PST)
Date: Wed, 26 Nov 2025 11:20:09 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
Subject: Re: [PATCH V5 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
Message-ID: <aSaVEWlyQ2jzGFwN@hu-varada-blr.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-7-gokul.sriram.p@oss.qualcomm.com>
 <40aed2f4-ec33-4087-8245-7c4acf861387@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40aed2f4-ec33-4087-8245-7c4acf861387@oss.qualcomm.com>
X-Proofpoint-GUID: zcPzEu-2o3gBSzgzEJUgO7cnNIH5VaU2
X-Proofpoint-ORIG-GUID: zcPzEu-2o3gBSzgzEJUgO7cnNIH5VaU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0NSBTYWx0ZWRfXyQfmzhui4Gb+
 l53w75qihyjkjG/OBbJHuf1jXgwl/t3lEaoDvcm771mw/H44+8wsQBN7S/mstZxhsVHKwL/k6Ya
 qm4skeVoXyH/vAqQ0kNs+7nzQ1TDhNgOtIai/RXUAcs9qH+hMa+OzYJzvqVH5cRMEexRZgJPJvC
 GcsRg6LiaqycXRkS5VyPpg4z7TfkGixKZX4RicnDfyIDdiYDvY3ATHrc8CFS52IW4P8JReGmB5+
 gbKoKUK/NIP8PhIEHubtvhFYy9aUBcNcWpbZuT6NxsCSJmpaWxEpqu/45VVUm7JjbOpBIj1yb3Z
 hTSx5sYLoOB8XpxY83uZchVi9y0bgyNgcfDcWTTUCUQLUb2X4drJRa2yJD4vHCfLc8fGHY4+ooz
 WHaVMqnuJFM+qXzRaUuq0K+P0C7hqQ==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6926951a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WJw7T6-RpKapZiDBOtQA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260045

Konrad,

I intend to follow up on this patch series as the previous person is
stuck with other assignments. Will address the comments in the other
patches too and post a new version shortly.

> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> > From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> >
> > Enable nodes required for q6 remoteproc bring up.
> >
> > Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> > Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +		q6v5_wcss: remoteproc@cd00000 {
> > +			compatible = "qcom,ipq9574-wcss-sec-pil";
> > +			reg = <0x0cd00000 0x4040>;
>
> 0x10_000-long

Will fix this.

> > +			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
> > +			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
> > +					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
> > +					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
> > +					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
> > +					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
> > +			interrupt-names = "wdog",
> > +					  "fatal",
> > +					  "ready",
> > +					  "handover",
> > +					  "stop-ack";
> > +
> > +			qcom,smem-states = <&smp2p_wcss_out 1>,
> > +					   <&smp2p_wcss_out 0>;
> > +			qcom,smem-state-names = "stop",
> > +						"shutdown";
> > +			memory-region = <&q6_region>;
> > +
> > +			glink-edge {
> > +				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
>
> Shouldn't this be 323?

Since Q6 uses 321 for glink and 322 for smp2p we have to use the same
in Linux too. As of now 323 and 324 are unused.

Thanks
-Varada

