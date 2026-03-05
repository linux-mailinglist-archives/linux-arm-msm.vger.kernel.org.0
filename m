Return-Path: <linux-arm-msm+bounces-95543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENcjJiNCqWkt3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:43:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DAD20DA23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCE96308827B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAC0373C19;
	Thu,  5 Mar 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDWZt0Um";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8oBxFNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD2F30EF92
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700048; cv=none; b=iSs118CcLzbgqlaBlD9G+jz9CtedFST78o+IzonGJr/nXkPHOg2Um+Xw0FkWbbZXCr9i/Majm0lHsuccF4cXZjyDPuozEwkN9tc6tz7ge5zJjAK+++9b2J1KKJFu89SGNaH9CfDxqgQ8DAKDOdy2Y/MzBniyoeTgrpMyKRD66p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700048; c=relaxed/simple;
	bh=5A9HEXmKY1kSYKEFmRjjPxigM3GrrJ8dUEUClUysDg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDsnEqUJDua0n495dWzSj3dTFX12PK2EunB30zKkLWVv6f1YlbhNxbzpHiWtsvQnXU3r2D4wjafTG7CWoHN1g59KY9mc3BQ66lc4QanPhpLy52rhX0TsvRe99pnZ/eNUzGdtuV++SU8s56J7aAfGlyuZruTBemlTiIQr5zh1frc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDWZt0Um; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8oBxFNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251NxDe3665129
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMfCcUyY2UMWF+U4/TQnvNQb
	6IM9B8sI0EP+RllkSJA=; b=YDWZt0UmsxIduQCZf9HoT7VIufl/Xt26OFGirRP5
	jUn55SXNrr9emyD/1NP/Lus1XDEqXej18tzr+EY096EpKJNMjWn39zN6MEaxK/EW
	HWxrktD7dylv9FYOz+ytuzH3O+JDpIBZ7YouT6Ad0LN1FthJB6qsJ/IExRwz72i+
	gGEKiA0NUc4KsTXD4EWZ57+6wVG/gCLDCNSzjOqW2ymzhnm11gSNb56rM8lGJJV7
	CcL6h9cLU9fsOupAqfwPVihXT9vkrkaD+CFfaVXN3ggukHN+FcpJxsnB7cooR6X4
	hQtj6gAbGl30RNSpmPnT5bsL2mVPkNg6HscpxJn2CY61xg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u191a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:40:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be232ef3d3so40737044eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772700045; x=1773304845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eMfCcUyY2UMWF+U4/TQnvNQb6IM9B8sI0EP+RllkSJA=;
        b=T8oBxFNn2JqAcDnCLcf2/mQLs0kWjIzzwbCDzTuaF8qJO/IayaXPQsz9NIcKKUGB0w
         olmMM0YI1v67WI+uM5y0GDHvAg0T4TrzRwnke1jlKQzvms/Cyftlo37Me05+dz8eZ8J2
         bl/kdyM8HMWfDTiE4G2Wb4PTMKnE0hD6vCvY70EVz3ab4bvAFpGSPKse/8YPeJVKa/4L
         f4txakg4CvolvZRjq4BzAWGJNYXMXN+GqR+2B+NCwgXy0QfTX3QCAfU1vh/noc4H8VPb
         KV29fSY9oDc2Fsk9ec8ZfINZrWMXWgCuzu0ZPb9MU0aB4X2Maw88eGD9ji/udtWYm0Oj
         3Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700045; x=1773304845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMfCcUyY2UMWF+U4/TQnvNQb6IM9B8sI0EP+RllkSJA=;
        b=HoKIhkafJwro/7PKseoW/nSZHwRpsdDgz148hNfMjAWHyUiuaVF5s5KtXwoXzwKPji
         a5DAqzpO/1XB6rumL4je5VGcspz15HloQBfIBQvtaCACJ8ta11TqhOSlR8+3eo3fCOqM
         ON7JpevJ+rSO5ELuzlQENM8GKuQ4VpO06sniuD5i8dSOr0c7R9UDVAbJmPXD9b/7endO
         c4EqQGO2+xU5M/jCvKbvXb26cBpkkGOlB9YvgsZuvzpWGTYdPmJL9pD5QFkJPbcMrFTR
         xeaahAJjg1HqF6AgK8VKC8sql1XjPvh1d0q/YJbv1YDP+Pp1P432aIhR8rDrbag/yWc8
         OKBg==
X-Forwarded-Encrypted: i=1; AJvYcCVKHFyqW0fIrv5RXAIq0qANSc9HtzfNNv6hn8vrM/eQ4wG75Scuvcx2VT2RdD6Uuwky0bNXggNrIlp5QLAa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf2DvaElkopJh3GEaZUpxDFCfqP8XVLDsqhxJ4ihRHrTTu/vWP
	ebhFFVJmrV28mEZVSk3+X4IPsUahf0gLrHkWc0Qo9z1U1Gr4HXD0dK+DmolXXTI0f9pQZHk+0oT
	M6NTF/ipNWViko2JqHQSl1bKm38SUBg2FfLfOo58JdxHX33Dz+1Q8NJ1AlPqy0f5qegsG
X-Gm-Gg: ATEYQzy9gvRu4qiokucB7I46lblmNiPELSHI/BS3uWyEN+E3pU/1SSlRjH/Gar08SZt
	d7C+eA8l3f+J1H4+mcucB1aJv3Wg7BhkA41Lww4OoLfRuBV5rbHD8tnZ6jmLFAWT7s8IDfIhrAW
	a5gqELVWQtje5cNRNkgrn7aZ7iPGWM7DLEY24QvBJmCKH8IIt68oIoO/e6xfMeO/KuBOd1AHTui
	6vdYMYdeztglvGXePEKsI810qAZ/w6vTU8fWTbMBFSFNsIsclLsX9IombYXCjfnwZtR1en+22BI
	hVHSuFfAvV1cYFplTcdwDPWv2pyEG22DJG5jG9MAxsOtjgbE4hjzU+LC9xTOcSNvntSnz7t6DiI
	f0jBG+7xOjn1R2KoBPgxIMOKPn4hDyNU+i/2UGz5vekclB3zWkOREchEmA0UCBrv7mOp/
X-Received: by 2002:a05:7300:a483:b0:2be:2b8d:3987 with SMTP id 5a478bee46e88-2be3108dbd7mr2241985eec.22.1772700044529;
        Thu, 05 Mar 2026 00:40:44 -0800 (PST)
X-Received: by 2002:a05:7300:a483:b0:2be:2b8d:3987 with SMTP id 5a478bee46e88-2be3108dbd7mr2241972eec.22.1772700043963;
        Thu, 05 Mar 2026 00:40:43 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2c9c67dbsm3371059eec.19.2026.03.05.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:40:43 -0800 (PST)
Date: Thu, 5 Mar 2026 00:40:42 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <aalBitirfu/rHhIK@hu-qianyu-lv.qualcomm.com>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <20260304-glymur_gen5x8_phy-v1-5-849e9a72e125@oss.qualcomm.com>
 <u4abdgzrlfijwymnoneb6xa34l3y6fpenlbidvej5cgfz2dzkd@dk37ihalaast>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u4abdgzrlfijwymnoneb6xa34l3y6fpenlbidvej5cgfz2dzkd@dk37ihalaast>
X-Proofpoint-GUID: vI4HCjryqfGKsVIsP3HSCJaUjvG6MrVP
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9418d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6aSL9Ysz0BH7CvPNE-sA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: vI4HCjryqfGKsVIsP3HSCJaUjvG6MrVP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX5AcsJs7ht+ab
 FQ5JOCvo4opZ+Cuh8ABwNjHVDaiDrkZXQYU1GtwEc7oyNx1/tFExB+EmsP4DFUuOHhKyDTL8Tn7
 eRxK17Ughw+6SN/1yd9twlShGjP8FJWmmKBDhbpyWhretp8VfWXkrdXmhSNDbg+zkgL7ZW6pVwV
 ovp9X0msJ3G6KStrn0cUA+qESHAimeGUSY10mhEWWBRoDHySN1SiuGG/gNG3GOgGO6CFDQeFQzS
 OBYr1P5q5Ql2A9kMfoRhWcdNb53w46YjjIgFr8CSAZGr4tRTb0cRs2Ce9QI6gQYWfmhDRXaRp/U
 h/EMFadR+Dz2qbNNova/2zqEZD3QTYm5jbq0NZzE+ZNDxRNXJfswb80lxfv6ZAJYMHAG6+LQ4es
 yxHCLx7pbHNxOzSIOaZRWegWt1AHYCqYY9rcwy8vYSTKYilFSyB7yYgSO1NHvsSy8mY6vjiwXCh
 TfukHBAl07XG+C+EbvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068
X-Rspamd-Queue-Id: E4DAD20DA23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95543-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,f00000:email,1bf0000:email,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:02:18AM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 12:21:59AM -0800, Qiang Yu wrote:
> > Describe PCIe3a controller and PHY. Also add required system resources
> > like regulators, clocks, interrupts and registers configuration for PCIe3a.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 314 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 313 insertions(+), 1 deletion(-)
> > 
> > +		pcie3a_phy: phy@f00000 {
> > +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> > +			reg = <0 0x00f00000 0 0x10000>;
> > +
> > +			clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
> > +				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
> > +				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
> > +				 <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> > +				 <&gcc GCC_PCIE_3A_PIPE_CLK>,
> > +				 <&gcc GCC_PCIE_PHY_3B_AUX_CLK>;
> > +			clock-names = "aux",
> > +					"cfg_ahb",
> > +					"ref",
> > +					"rchng",
> 
> Please align on "

Okay, will align on " in next version.

> 
> > +					"pipe",
> > +					"phy_b_aux";
> > +
> > +			resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
> > +				 <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
> > +				 <&gcc GCC_PCIE_3B_PHY_BCR>,
> > +				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
> > +			reset-names = "phy",
> > +				      "phy_nocsr",
> > +				      "phy_b",
> > +				      "phy_b_nocsr";
> 
> Should we be supplying _b components by default? What about the
> platforms which might use separate 3a and 3b?

We can override compatible, resets, and clks in board.dts.

- Qiang Yu
> 
> > +
> > +			assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>;
> > +			assigned-clock-rates = <100000000>;
> > +
> > +			power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
> > +					<&gcc GCC_PCIE_3B_PHY_GDSC>;
> > +
> > +			#clock-cells = <0>;
> > +			clock-output-names = "pcie3a_pipe_clk";
> > +
> > +			#phy-cells = <0>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> >  		pcie4: pci@1bf0000 {
> >  			device_type = "pci";
> >  			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

