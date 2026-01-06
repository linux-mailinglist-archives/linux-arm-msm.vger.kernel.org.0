Return-Path: <linux-arm-msm+bounces-87703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6CCF8C02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7B8530773B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601AF345754;
	Tue,  6 Jan 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLMhynWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbH7eAGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D513446C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707555; cv=none; b=uPE6ecXir4wJtUrVAOCquhzF21xpF6nmDw5M/eRXfXSBNWQ3m1NU5Ed5TXBKBhClKrp/TWLv96K7WI1WUdRh3FeE2D8u69K41fa02JjAWMeLa4ERWoltk6Yb4YkHXJle2UzELGhQuzMM1zzmj85VSMXu7bhMFa21WdLVcbdwuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707555; c=relaxed/simple;
	bh=0U8nvqz1Jdap6Z1viwsxxrvoCg1hGkeq0ztOlTbn7hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njnnZpBoncpUApbvmrwhF6xBv1tID5zJY0iOEShBuV2QFoAVu8R/UZfhRXt3ySEBG+vsq58sZG3v4ceXBDN7gfrIR7RkRw5Ucv/uYoTf1IU0WhMqCSq5u/UMNpzvKfN+tNNpyPazrT715jCZmhcz4UO6skmVnMvIXvo95eUFi0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLMhynWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbH7eAGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AgYAT1462345
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 13:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69L9hORNOToKC8dCqW8wEbOCuaXEakIhANIpeU+LfCc=; b=cLMhynWK/VzAGRvv
	cfs8HutXqhyakpONGOgG4IA8BIhVunT3nBggdFR2SqswkdXM188J/4rDZR6MGrjV
	S897nquRZCUD0EQuPApmKMArCeHZY0PQBraciQrB6bIin1pk77HErlHRcFoxFZeB
	HJ7ZgvbrvqWvQO5mzmkM1qpw9shvb0i947YTU4E2IcAmHyCnedRflKK6e3MGaH4V
	TeqSeiovjaytskI73vLcoDe1IBXT3xqeWS8lbbjACd7eOOefXJQMAiAIKM4HtpV+
	XsUgtFz/XFW24P2q5/4bRmd2EhlAgZHS+N7rhteKWeYy/4wppai13CHtPOd3+J5X
	sZ7dBw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm0fyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 13:52:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c337375d953so1599664a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767707552; x=1768312352; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69L9hORNOToKC8dCqW8wEbOCuaXEakIhANIpeU+LfCc=;
        b=SbH7eAGvcIc4DzuIsgFeF3a38u38ODaSz6aX5fYzLAvEDcAd/3CdsRlY3xkxiHi/BC
         nZYzBRWdTvpXPU5wVOLd0hlwjFOpg5CHDDKoOCc/9gC2Frr+ORQ/+TKQvfjd1Fu1BRYS
         3k7PPQtSSyEG4lMrKvPSDJOkAhE4SbpVT97BENV9iMwvib0syrh2IJLl8zo3sRAQ+G3s
         LjKrpTN0iDKh5nOJjUiZzKWOafG8dFYpzdiQv4o+DdIpz2Dg7/pIDAVRZt6I5oPeo9z6
         yk2mTu5+Efg2j1hCs6S8E6vPWBj4Ijp+AVIyJxB10zIUwtoRKmQwrKWbSHmzuQJPj6uZ
         s5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707552; x=1768312352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69L9hORNOToKC8dCqW8wEbOCuaXEakIhANIpeU+LfCc=;
        b=uqcos7PDJGSaR6wcBMjHz8gI78bvojLtla+vDgh+QE3chOszzMGhqg9VmXbFXCc3SK
         6bVI2njn0mYd9XJ0qPHjqkvwKhZaF1p2c1qCxDSKgtuZkFv+b6IzgjWFRiWuQ/F8h8o9
         xeykQ+aIw9Id6HkM+YaU5tAipCf1mImjzRtqCjH0yxOspzKbkpZo8iKYm5QLEB3pVzCR
         qH1vnX0XHpK/KCBKwN6bwsv5LNQM7wm2dS9utut/m0QSyjaAD9AXRiDX/nnG7yNa+flV
         Pc4o1LnCDqNI2sxNWOE06lFR4mcx/MRtiemcVnRRx4QlELx5Yi+dMJ/zhPhDx/Pr+Wwt
         SRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdSnBebQVMje48jNMl/5Ehcdt60NBoz2z7EeZ+wNd6rtbfEdNZCJq3JKfPGkVu9M14bKTJHoUi5e9okSbT@vger.kernel.org
X-Gm-Message-State: AOJu0YynDzf3638UUBMEWhat4ov12TZphCP6y6IioVRscjbAMGv1zaJd
	gUxihcb746zBhbpZnevRj5tBNlDgq6+GlEZsIos8PV8d1Ur68uur1k3jhLVjPLJ2nCd2WCKpGHA
	EDANYLoeQEqEb2LT3+bHjn3mZE4h0E400bIAGmCRJ+WBqY3G/8GYbviw+GI4biou3PfRq
X-Gm-Gg: AY/fxX7h6OFjkGDybUpIrYAZImaiiEICvMQ/3fzOEYxNeQFSzfvI785DrDqevAX10zL
	WWKv0pBuOamGciBk4/oPxOjX0MFF/I/v7Do+A5iyJVOqLD/eL0xOcnVZjlA0JnNV/X8ytWTnDW4
	77M7qXg7Xws8kUH1gXfPR02/kYKWlwtq9Y1ckOTffytRV5XrpMCpWc4IIQ0nDJnR37GMSltCmBH
	sZhMW7GSJ0XIOio8t2gzZk5ZIx2mxAkN3Ef/nEV2fWSvmsCTgIaf81leLndgDiE2HHOiba5DF8M
	Sm0xHcJq98CHPs1g/USUYnMWpSaMN0gW7Y3dNosk0DL5g8vXJ66Bo96Fuo2e0ZuRNxvxW/u/We6
	4RMipqX+Y8c+Ak4ewdarGH7dB
X-Received: by 2002:a05:6a20:e290:b0:350:2251:59f with SMTP id adf61e73a8af0-3898237bc4emr2703876637.38.1767707552274;
        Tue, 06 Jan 2026 05:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAd9htxKz1Kby/a6BwohNG8XTxxujXxKPv86hzin3Gicw7jtMfe4ModJ+eBBaMP7enak0wqA==
X-Received: by 2002:a05:6a20:e290:b0:350:2251:59f with SMTP id adf61e73a8af0-3898237bc4emr2703844637.38.1767707551611;
        Tue, 06 Jan 2026 05:52:31 -0800 (PST)
Received: from work ([120.60.56.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c50347bc321sm263043a12.18.2026.01.06.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:52:31 -0800 (PST)
Date: Tue, 6 Jan 2026 19:22:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH V3 3/4] arm64: dts: qcom: hamoa: Add UFS nodes for
 x1e80100 SoC
Message-ID: <dbkrbec6t2agwk2swe7olz6zkhyphpbcl7dpmlwie4esvbbvro@s7ybpmaod3d5>
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <20260105144643.669344-4-pradeep.pragallapati@oss.qualcomm.com>
 <7gi7sh5psh5v4y5mrbgln6j2cjeu5mogdw2n3a6znjtqyjcyuk@kxpe566v57p3>
 <e396bef2-e5bf-4e6d-98f4-37977d5d93ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e396bef2-e5bf-4e6d-98f4-37977d5d93ec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695d13a1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JR4DBjdY6jk8CmbmB73bTw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ur2dxFwE6iJ6aD69mVkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: TdajjaRfQnlxEnNMwD-Q0qyLlH9kp9qv
X-Proofpoint-ORIG-GUID: TdajjaRfQnlxEnNMwD-Q0qyLlH9kp9qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyMSBTYWx0ZWRfX9RRzlRSPLpwc
 bt1cbOehrsBibWc44W0q6FcyO//XeIzs3f1GUZBOkdiX/dHqMm/RaDeWdYB/E6JPNRqY8+Iictv
 rGn6s+sXZMiF9/bAZEX00i10CKqmSBnjjOyV5hivM1Y+om6KFIudZ8rH8+ZkoFmXDJHdiA63IUG
 kr7XV38KbfxMj356gWw6nbV8s+o5wRhBZ9ltlQa6QK6GJzXcBn5h9JFbIWMC+tzxDodUL0XjeOp
 iX37LCbd2ySpCWevyudaX9kLJJtNUH0ENRKVbY1qym+RWTwU07m0qqxXLCBCwy7QIWJ46hnCbu2
 NLUYUcBp7SJFQ07Gwt+Yhg1faX4GKhOSyGm/YATmbzU22xjBE2ZlyLC/ntj44azPIx/a2z6203L
 V75rrFRFLjM23o5Y8bzgbTZgNK3SSUT9WOQnKMIBQjv8B63M5xIjxtdnQB8X3OHaOyzf/S7h6/P
 VDgq27DxTBJZ4q2WebA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060121

On Tue, Jan 06, 2026 at 06:30:05PM +0530, Pradeep Pragallapati wrote:
> 
> 
> On 1/6/2026 1:36 PM, Manivannan Sadhasivam wrote:
> > On Mon, Jan 05, 2026 at 08:16:42PM +0530, Pradeep P V K wrote:
> > > Add UFS host controller and PHY nodes for x1e80100 SoC.
> > > 
> > 
> > Minor nits below. With those fixed,
> > 
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > > Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 123 +++++++++++++++++++++++++++-
> > >   1 file changed, 120 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index f7d71793bc77..33899fa06aa4 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -835,9 +835,9 @@ gcc: clock-controller@100000 {
> > >   				 <0>,
> > >   				 <0>,
> > >   				 <0>,
> > > -				 <0>,
> > > -				 <0>,
> > > -				 <0>;
> > > +				 <&ufs_mem_phy 0>,
> > > +				 <&ufs_mem_phy 1>,
> > > +				 <&ufs_mem_phy 2>;
> > >   			power-domains = <&rpmhpd RPMHPD_CX>;
> > >   			#clock-cells = <1>;
> > > @@ -3848,6 +3848,123 @@ pcie4_phy: phy@1c0e000 {
> > >   			status = "disabled";
> > >   		};
> > > +		ufs_mem_phy: phy@1d80000 {
> > > +			compatible = "qcom,x1e80100-qmp-ufs-phy",
> > > +				     "qcom,sm8550-qmp-ufs-phy";
> > > +			reg = <0x0 0x01d80000 0x0 0x2000>;
> > > +
> > > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> > > +				 <&tcsr TCSR_UFS_PHY_CLKREF_EN>;
> > > +
> > > +			clock-names = "ref",
> > > +				      "ref_aux",
> > > +				      "qref";
> > > +			resets = <&ufs_mem_hc 0>;
> > > +			reset-names = "ufsphy";
> > > +
> > > +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
> > > +
> > > +			#clock-cells = <1>;
> > > +			#phy-cells = <0>;
> > > +
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		ufs_mem_hc: ufs@1d84000 {
> > 
> > ufshc@
> ok, i will update in the next patchset.
> > 
> > > +			compatible = "qcom,x1e80100-ufshc",
> > > +				     "qcom,sm8550-ufshc",
> > > +				     "qcom,ufshc",
> > > +				     "jedec,ufs-2.0";
> > 
> > Drop jedec compatible as Qcom UFS controller cannot fallback to generic ufshc
> > driver.
> "jedec,ufs-2.0" was set to const in dt-bindings, dropping now will lead to
> dtbs_check failures. is it ok, if i continue with it ?

I was implying that you need to drop it from both binding and dts. It was
incorrect from the start anyway, so there is no ABI breakage. But make sure you
justify it in the description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

