Return-Path: <linux-arm-msm+bounces-75208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8EBA1A9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3699A3BF222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D729F191493;
	Thu, 25 Sep 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7u+liQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AD3FC2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836726; cv=none; b=miiCyOMniHbYKJ7ZInupsCdOnGTZgDh4Vu4CGfsOB7l1YxZeA4RZcu1YErTwwW5NWkYNItbF7Xm2G91j+3563+8zBb8hTTbBgvbuwWghyzNCoM2M0NN+s+ovPUwyp/oN13rV7g0mav5bjtSmUwYy8hKFj8gvNBHH1JxU9CDwe58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836726; c=relaxed/simple;
	bh=YhLlLoCcel08r9Gx/Qu2bGRQ4+ve/mWhng6cCkd6vzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofktM2cUPwwa/zsZ5Ky2hgr6SGUzL7iyAfnO/9wOpq5066s4FFOtU8m+CUIzjAV4NF8ePM1MdGmenUr5f8DqOvJLFKGHDficpqVgUdRFRaoJu8NmnBAgUm95WWiNOPYHDq9wR3hsAhz3+LpNEV3s/P1p97WOS0eCB4i6adMdEgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7u+liQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPnTk014750
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EaWCskU7/xIy9v9EzPg9EedR
	NsRDoPnmo+iW5K02zbM=; b=c7u+liQdik0/p4p8xSVjRh4dmJiO0AAOxax1PKXZ
	Fu9la89LPXABeg6F7/osgY45pAkvTDaU0+AgHmzc2RoaQiExCl7e0DEEK/6HFLYn
	d8+IfxNoLFhEh/VOEuiAFx0nCO5T23zZ+M8qBGqZzS55X/d5xCuhkjbkBRdLiC28
	uP7/9NS8YADtYd53Thcmso/aLfmANHgTQcuCemlZJn+M6xyruxaglxf7buDfwAMS
	z/9NtAgjmkrPic6sI+ElOd6RHQm78ziQfgjfIev+//Xn3TrXP4y1q+F+ZSVYdYmk
	R4vCerdHSr/wVm+UrshwfdEF9gFSpC6bpIMGoQgUXE37zA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t8ghx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:45:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4cdcff1c0b1so48262051cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836723; x=1759441523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaWCskU7/xIy9v9EzPg9EedRNsRDoPnmo+iW5K02zbM=;
        b=ZakanlldJ2ROf6fMh1+wr/Zc+IaUx1PWvOeXRAF6wg4fcfuvCmtZ/5VRZuUsEvqaFf
         nmEXS7SMJ+rNhO2h82vNkgesb6CMRN3H6Jb7HZ1EpzKv2ZW2VtcqJJvorQuQ4zpWphS/
         NWxbbfkjRAtd8acn7Oe+fPQgokq4kUD3LwtMdh/rK1hhc5F3bMIcY2UhHdUKfOSmaIhX
         8UKA5GiQJ9KAVuD98bBmf/HYMPq8sLBFgPHjem7iYnyXj6aP3KPaoT01z5zugYsHfP0W
         0ZpaY08qg4X5aU9mPWir7ItKFVboQ5ch22YBAqbu4qPLDch5wRIYpres6YWITirWf6yT
         h68A==
X-Forwarded-Encrypted: i=1; AJvYcCW5w+Tz2vTKMOzrwrtPINo3AiBtS2w63DeRGUy/fi5dz3d1yFW3eyBRyr+ghdq7R6SxkW38THcT1O8nj7qv@vger.kernel.org
X-Gm-Message-State: AOJu0YzME9oyv/wGGkzOukMjMpHeSX+NqhyYi4GtnLaNEDg+nvC0VEE6
	BGP7feL2QxSXXU4Lcqgfj6O3Oj09auEsQ62Y0aW19u/ndzMmpTug8RlVvaQvF3WeXy3mjTOuj/N
	RJ1qIZaGZfNnZND/JQERp7m2gjlapRBrdRhpW409kZWkm2u+RdSAmqi+T/TBOAQ+gXA4H
X-Gm-Gg: ASbGncvl4rSO1kQf2OHcGqRRXD2BlkP9UHBBilQ+CKBDtzCcV3xu2T2vYf1p4v/krKy
	BsKTnTkGJoT2O6UqN0i5t8AGtjVsLGG/wOp6fu0UvBgH+nDW0kGyLofSA20+dtc9i7Bngv3T8i/
	XSmQXRmYPpkFezcGC26u1U14XlKFfNKVnCCdy9rOjUAkPw7dzOpCsjEwdadymEKPtCZYJYzCxfA
	vxx82J/O+TPKDxJXeYoNduRTrHc80SCoGm6YwvJq481eqOnMtCfLH9WxI2lKQcjhCYWwWQbdm61
	PX7+1Hg1+ref5TQL3CfbwiywHSN90a/rzyPHwmKhQUMVicmp7csAfa8LKTZZ+INTXsZtSxd+OON
	TQJTr+7HrsUU05z4l4Dvg0n4eu19b0SEB4ypt/K/8KlNAWn1sz6pj
X-Received: by 2002:ac8:5a4e:0:b0:4b7:a16d:e5f2 with SMTP id d75a77b69052e-4da4cd4adc9mr70027751cf.65.1758836723112;
        Thu, 25 Sep 2025 14:45:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ8rvJdYnnVBaGZNPhC5D43eUt6pM6CHAIbkFZJDrYJzaS1aYSU4CbABE20Vz4oU/8LstcPw==
X-Received: by 2002:ac8:5a4e:0:b0:4b7:a16d:e5f2 with SMTP id d75a77b69052e-4da4cd4adc9mr70027241cf.65.1758836722550;
        Thu, 25 Sep 2025 14:45:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe6924sm8076041fa.61.2025.09.25.14.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:45:20 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:45:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mahadevan <mahadevan.p@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: add DT changes to enable MDSS1
 and DPU
Message-ID: <5nkxxydmtjt7hzp7v5ym4crx44d5o2v5jsq47bxehzzihyy2bs@owvruxcbde6a>
References: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
 <b1c12696-9e08-47f4-8fd0-11e415af187b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1c12696-9e08-47f4-8fd0-11e415af187b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y79uISGM9ei4KGpqsZmU6R69eRmvoxLx
X-Proofpoint-GUID: Y79uISGM9ei4KGpqsZmU6R69eRmvoxLx
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d5b7f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=V3-xdiz-50e7mNWZjwIA:9
 a=LDN4jnY7WN4wdhk6:21 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX49Dm3eFfIbWn
 KBP/WXMofg6sDG5nP81qCaM9G7gd08Rhs1QvHOuljhYcoH4gaLDL6/1hnW8C7Yg3vU8ZDh2/b7S
 KFXpZJu4usgbDy+mjEtCYEoUx/tf4zD/Xg6ZZIFcRR6Mk8DqBHWiBi0hMTHyNAdFt/wxFb6JohA
 PFfS6HQbil8gERCiBq4MQ2dCV3hr6gjO+FAHxGPBBTCFkBEvrVF+8vILW05WW7NVXV9OQAI+YY8
 kxS9JBWndFxGi2eGKntyieRmUjPe5bVKHmcaF0BBYKLBO2DBBi133LML17eAER7CGPa2GvLXVkz
 nXVP6vOxTOTr8Jt3xow38ECr3Kw2QsWwGWkHX87rv4muzdwCTFxmB9f/tKl2+cptV8LXNsBPotr
 C55WWE/VZj+/01T4qQ0jCXqsqj7xjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 12:49:48PM +0200, Konrad Dybcio wrote:
> On 9/25/25 10:58 AM, Mahadevan wrote:
> > Add devicetree changes to enable second Mobile Display
> > Subsystem (MDSS1) and its Display Processing Unit(DPU) for
> > Qualcomm LEMANS platform.
> 
> No need to scream.. "lemans" or "LeMans"> 
> > Signed-off-by: Mahadevan <mahadevan.p@oss.qualcomm.com>
> 
> Please include your full name in git config
> 
> > ---
> >  arch/arm64/boot/dts/qcom/lemans.dtsi | 88 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..45c11c050d3f8853701fd20cf647aef5c6a9a8c9 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -6751,6 +6751,94 @@ compute-cb@3 {
> >  			};
> >  		};
> >  
> > +		mdss1: display-subsystem@22000000 {
> > +			compatible = "qcom,sa8775p-mdss";
> > +			reg = <0x0 0x22000000 0x0 0x1000>;
> > +			reg-names = "mdss";
> > +
> > +			/* same path used twice */
> 
> this comment is misleading
> 
> > +			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> > +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> > +			interconnect-names = "mdp0-mem",
> > +					     "mdp1-mem",
> > +					     "cpu-cfg";
> > +
> > +			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
> > +
> > +			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
> > +
> > +			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > +				 <&gcc GCC_DISP1_HF_AXI_CLK>,
> > +				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
> > +
> > +			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <1>;
> > +
> > +			iommus = <&apps_smmu 0x1800 0x402>;
> > +
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +
> > +			status = "disabled";
> > +
> > +			mdss1_mdp: display-controller@22001000 {
> > +				compatible = "qcom,sa8775p-dpu";
> 
> Adding nothing more but the DPU isn't very useful at all
> and doesn't really let you test the hardware (since you don't
> provide a sink)

Only with writeback.

-- 
With best wishes
Dmitry

