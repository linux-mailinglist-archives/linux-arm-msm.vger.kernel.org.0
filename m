Return-Path: <linux-arm-msm+bounces-76763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC66BCBDC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 09:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A3AD4EAF35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 07:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A54245020;
	Fri, 10 Oct 2025 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePi0qupT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EE923E35B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760080117; cv=none; b=pNc4UwDTbvR6/9a9y0a5Bodarb77hRcv8Zly4rT5Kj4cqH0sCgKDsinBOdducEIfEvbs+0hrIxdEBWexeI/8KzCmo/s0EmYj2IXmk73g97B6QpZy0w73CdioxAGWnhU4vheRAwLqyT3xm/hV6u/7CSz2fWLzlHHZdfaol6fHBWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760080117; c=relaxed/simple;
	bh=Qah6LtuAX2j9QhShtLOQTOP9p04jYYw3IQ7Ejye1OLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9CTYk6SMc6JKkxN7dWqGkL8EwwybpW4qHpJ6Id6/RahOL4Ar5EOkCr6VAJomjjNe/XqgysIfy5v0ozeCBxlo30K01N1u33NSGlpOEa96ZuQzM/sFQS+i/zL2VzhVxeJBCbF4mxhp/dfl8ya7ogZCq3w6W6npeM92r9fwucBQgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePi0qupT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6WwHp006078
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xw2joKvpmYxeQiWj5Qkkalzu
	uu9OHAViu8m2lKPfbr8=; b=ePi0qupTMVKure/+v15XU5VDZVhvBtlXo11+ouuo
	GB5tJp50JW0F3Eql1t6CTeToLy6fphhu1s9HPc+bP+J/xg3FtS50GNXU4IjMrofb
	9w1ayYENruIdPR5mdlkRBtd+Uh3LZSc4uk59IEVxWuVXKcr1RL5euH9AYNZ8ulS/
	6aE7j+gre3OV03/y5KkPRA0+f5wlfMIAtfqHgpH5yb32e7Wa9hz+kGqS/XWGZ+dw
	ocVjh7AHaXCiuP4ea6uXaWZDJO4exRsgC7k/9kHzjc+iHNrA/HkNvr81VGFrwKLX
	OvfsO/4GqkbQcMhHEjOQzbNJ+wJECXwOxTAayEb8Q7kv8Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j5frv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:08:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-780f9cc532bso2651633b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 00:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760080114; x=1760684914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw2joKvpmYxeQiWj5Qkkalzuuu9OHAViu8m2lKPfbr8=;
        b=Cb8UAUea+0bJe0SN9qy0ITAUHZRNJJSiFCmY7axUEzh40hPTzCYWrCUPC7YvpKLQyF
         5L4KHOaUasAvHB5O4cVpymRI65IGa4HIMDEVisp9ErDu/FHzW1ntG5LAE89oS1SNKOpL
         h0Trc+wewRck1T2TyaooyL7Qr96767mIokcjqX9+v/FUqt/6/i1lZwoq5p0hOosYayj9
         MOkUsgD6aBO0KTZmc9srMJO6j/5jLWLcQw795/3R6UVQkdE5YP9fMKOrYR3ReN/FA6uO
         C2l3SOKmTPJE8AiCV4dA34G9Fv5HJ2CKq6MvLfvvSTzWufl1XxMdalTC350wmNmVdI7y
         7mog==
X-Forwarded-Encrypted: i=1; AJvYcCU072yVImtlZi4QDpkuliiiMLOLNJ1+T5+EN+AwVja3fzUPjyWPlfv9+Gem++vn8PLlES1qK+tLLiVh8E4X@vger.kernel.org
X-Gm-Message-State: AOJu0YydqbUfJC2CYAauTEfn37pkOcBmpHTnJND4NSZcbi9sIgmVUjQL
	2SIqf5Q7Vp/4gTZVKyezExtAou4ONFNqRJ3ku2oBvcwxZovgkv432jwy5+iog2S+kRcJ+qaYymb
	gWtmI2ujEz9xfRZ3mFd/xClf13RppIq1t7bUeJVshEGH90QufIOXR0eNBCFyYnCtVmCV6
X-Gm-Gg: ASbGncsvJi50NSWB54ARzlUKSh6tAHcIXG3/HXJ0A3QpsFVJ3WgrZ0C6hFEFv4533ki
	TANcJ3oAKFeIfG5eKVa7OmzNIuU9O0VFTXWm3XiaqQbZl1X7wLCxeIO8IouQg3NOJI957SbVwcr
	ZTK4MlKu4KeeBruc3kPikq2x7ivO35GZLlA111gi386pHrJ6hjoSSZGBZblWxM4G3f2VhpJOR3z
	qw+FD2ApAh119BvdQbcEAWnGuDRbNDffdmUWp4zSBCp93DrYQ9loq/vtSc+D145Yn13pdOhA1nL
	j3iVETtO/zk4sSo/WUDVemW+29+SZqxCBPI91pHv27MPy6aixT4Zq8DlzXJy5PSSl3jLn3v8xAU
	Rrdt0whLuZ2E=
X-Received: by 2002:a05:6a00:3b8a:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-79231afd0bamr12299734b3a.10.1760080113783;
        Fri, 10 Oct 2025 00:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmzhrFcPAMPGHBtZVt2ioi5eAMZgjgvwzYs//hswKwOgxEZGG1Cd23PphUugw3BHrPYFhivQ==
X-Received: by 2002:a05:6a00:3b8a:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-79231afd0bamr12299713b3a.10.1760080113312;
        Fri, 10 Oct 2025 00:08:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bc13674sm1903782b3a.36.2025.10.10.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 00:08:32 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:08:31 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Message-ID: <aOiw75D0RhDNLZLQ@hu-qianyu-lv.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
 <da2vvejbqdteaszzwyktczqivjblyawzh2k2giyoxdxlxcdrcb@fkuqivjmaggf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da2vvejbqdteaszzwyktczqivjblyawzh2k2giyoxdxlxcdrcb@fkuqivjmaggf>
X-Proofpoint-GUID: EMk1cCRFuN1o_5cq_FchRKAl4owGUk1v
X-Proofpoint-ORIG-GUID: EMk1cCRFuN1o_5cq_FchRKAl4owGUk1v
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e8b0f2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ylhLzIKeAnBU69OqGgMA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8ZdzZE/WfVJn
 7Pljx4nzXvvS9a34tdU3UnM3+0wStByhCrt8kbfhgT+tDQDGgqqnGpo9WbAsbUdFfvkJl6DIEe3
 aWv/3FnVGQ/5TF5a1l6AEHf4dXqjM7ReY4xQE3Rjlm6yw/0/4JPTPs33/MBwIaEXmfW5UshwxD/
 3awc2myn+uWk2L+zGJ3jdKAycXHHR80Ig+r3W1BinZh/M5XmZTXUHSPaN0v7CfPehgc7XUZQuBw
 4l0srQsgQ49CKZRM4EQJD8jhR5uIzci5E+mcmYJZJeCyh4+7BWQPeXdFihsdJ546cxViysHjFi3
 31Ux0AGTKZj5RUYuCPDfPY9aA2ZeYf5Xgm8wG3AYZT9bakGG7xsjdKOOnjxSZctCUG2tp4VOoOG
 p+M3vJbtm3Y2aXieE/Y14N8qq4XIdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 04:36:59PM +0300, Abel Vesa wrote:
> On 25-09-25 12:02:27, Pankaj Patil wrote:
> > From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > 
> > Describe PCIe5 controller and PHY. Also add required system resources like
> > regulators, clocks, interrupts and registers configuration for PCIe5.
> > 
> > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 207 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
> >  				 <0>,
> >  				 <0>,
> >  				 <0>,
> > -				 <0>;
> > +				 <&pcie5_phy>;
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  			#power-domain-cells = <1>;
> > @@ -2511,6 +2511,212 @@ pcie_west_slv_noc: interconnect@1920000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		pcie5: pci@1b40000 {
> > +			device_type = "pci";
> > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> 
> The first compatible is definitely "qcom,pcie-glymur".

According to Documentation/devicetree/bindings/arm/qcom-soc.yaml
the preferred order is qcom,socname-ipblock.

- Qiang Yu

