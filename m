Return-Path: <linux-arm-msm+bounces-89853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHanL0Cub2k7GgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:33:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673247A29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00B7D904C9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 15:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1A746AF2C;
	Tue, 20 Jan 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkIRZ1G4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ujhyk9sQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6143CED7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920770; cv=none; b=YkV5jtgPSQZU4Qu/1WuQYyMpKrlWIaNVDUSph57BGm4k/lauHw+PbI+JefmpU3yu+Qs5we5s3KJHQt9sXlKo2IHXS67Nau5bCl9thiGjOP4AThZJCMbOqbBYpKEBk/19Lfql83CpsnLaztF1WYJmyVJwXti81lGHW4ikwPth6G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920770; c=relaxed/simple;
	bh=YblBCSIO+Ze+wW74gpCOTjlIUF9aS7ZvTbmSmHD67Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcRpFnbtvHq2e0aIAhggYPyad62a4e34GJDmbcBYv8rfVqNfJ6A9gL94ZT58JDe4AC2idAUeYT3VTZB+PORp6ip/5be74qd6RjsKXe+7KnpPJnGGDM4CzV/w7vifM3pdVE7w3JBcCmnQNPnrQEeYE95h+35ntz9xQS7o23tl0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkIRZ1G4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ujhyk9sQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDgfF7782040
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZgHrGhKoJPUcO1Zkr5HE9E2/
	XP1B6ll6VlqYUNqZux8=; b=UkIRZ1G4RJdh5FiKLLcXcE0ptLhxgnPZFJhJFJQz
	7hrUlHbmMPf2cW5yBpGiUPBDX5Ge6EqjecjwzbqHEKX14OqtaCvwOdXBYFiztJCS
	aF15JpCL9iyIFsaixCtS5WsRkx088RP0onUTvXgS9mvtjp1Kv+AnnVCRe6CLdQg1
	APiwP173WVJ9Q0umBxqK9fi4qmPWbI6e2NUzW0U+p9XKTZ+xki2LROgq13xTMy2S
	ac/Ch6KYd2FC7KstduBhpODXeoAaxNsWr0RvfHMaIokqdEIiB1oPEQ7EcpDNcQ6R
	KAgZezL6FsOcVsWxSyG2XkPU4PMHojo0FmERpZ6OpO+FDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btatyr730-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:52:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c67f65cso137100385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 06:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768920767; x=1769525567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgHrGhKoJPUcO1Zkr5HE9E2/XP1B6ll6VlqYUNqZux8=;
        b=Ujhyk9sQhR+1vu0e+S74gaRtvWCvQJ/+eeK2Zs2UK3hitZHPLeKeaZSMO7LRyPF+j3
         /7xeD92u5w8/e66fm0CwUgne0faURqNOh8yWLr3rFU4+WNg3u42+gWpAPNgNbmHOsvva
         hl04A/Kfyi+SHS6oQ4eRL9bu0juJJBjHcXwQI6Zrg1DFOGxxQH+t7o9abqQmJheA3mVp
         09hj3wEV3w6/oK58S1GQS1vzqRJihOF8wikOMyWYC0DSXWPAUHxoZ7sm5wXqAEHn1Qxx
         Ec+ZSLj53FpwN3xGgnUQwEM7+wBQVEdG7rPhpgajfaYN9eQWtcz82OMWUaQ82hPYqOKP
         1znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920767; x=1769525567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgHrGhKoJPUcO1Zkr5HE9E2/XP1B6ll6VlqYUNqZux8=;
        b=jO9dfc34K46RGiht1NejGgVcmydhXvC3pv9rMp495VRM8p8jr7vqr7LwYLYmGtl51A
         blc7MNycU9g0d+tDOVdEoYqLetVDtFpjDprEDjYcdllOLrZYJpQaboZ92NFKONo6d4aH
         7xszOB9/JeC5wBLcHqlwYL33qlrkU+2sQBhCCoTKfdAzLx59ixVS4W9cJuhaSApMxuuN
         9SQp6Mxw2laqGQwkY5yoD6LF1+q9Jl2d42/O+jDfTL53CQkkcw0/MlX1JArUqLUj5V5I
         cGhJKsXYUfA7G+93Xgh4OPcRWr3GJWq1sFaYO4vrA1I/RAX1RsJpxU0+vVlq0lzrXy/p
         5bmA==
X-Forwarded-Encrypted: i=1; AJvYcCVejF4PDLEmm+zXA4o66DSiH8MvDwKJZKoPEgNBQj9w4FD13f9Z6S2KLy/y5VF6bL6q6Dq4FRdPR/wXnB9M@vger.kernel.org
X-Gm-Message-State: AOJu0YwR57cuSiROFQ7VIWUHlJ8LOf/m1jc25hLYQGCcuU+Urucs183F
	pfRXt1diMq3S3oOL6lf5IkE1Wmoy7LbKcEnN0DQgyC//i5QKl8i6vS0a8YpKARJv2enqujpld95
	yq66yaU2aPOYe1ptatcTtNA2Q4fNVXM/YdKupgUMbpWDHWCju3RkjgzTVUspOPZp54SwV
X-Gm-Gg: AY/fxX5ly2Dm005/XBgTfm9huZ71oJVfxfgdpAeGTQMxvf7958+Ab6UYPhKK8nYftTZ
	AfUvGnTAqVO7p7uQdUdJu+xAbVG67cw+cuWn0CVVyn020RWbgl2tVpkNlHs+FAz6zT/mFTB/q/0
	ORtYqbla1V+6KDMDCTPXdL/4lfHnZZMEJmXg8stbZX+1UDQewRmy/XQtqGjT08QWF/p6mtipGCG
	Xnz+/uCFnJNIA5npKPuXGmT5c/CiC1kA8xQQnvW8MxYO0NVgYgJPBuFew2FNDNbfHnerxppAfwW
	vbW0MMIe9beQ4TmNKovcwH/zxPC4YVxtxhY+zkHrzkwU9EKnCZcGi8SBSnU/7QgkwjbUeDQcim1
	nNNrSSpjBAzT3/im7RM50U5K9
X-Received: by 2002:a05:620a:3944:b0:8c5:2ce6:dca with SMTP id af79cd13be357-8c6a68d3547mr1953251385a.6.1768920766947;
        Tue, 20 Jan 2026 06:52:46 -0800 (PST)
X-Received: by 2002:a05:620a:3944:b0:8c5:2ce6:dca with SMTP id af79cd13be357-8c6a68d3547mr1953245885a.6.1768920766241;
        Tue, 20 Jan 2026 06:52:46 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43596b62700sm761202f8f.42.2026.01.20.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:52:45 -0800 (PST)
Date: Tue, 20 Jan 2026 16:52:43 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <7zdyb2wnojudnrnomnx4aiwvni3e6i52kfioflb3gslztsizkw@ofvvkvrv5f3s>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
 <zvagnaxqgrpm6bagw6zuov4oi6o4b7vmy673oh5st22tec2swl@abvblxgray2s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zvagnaxqgrpm6bagw6zuov4oi6o4b7vmy673oh5st22tec2swl@abvblxgray2s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMyBTYWx0ZWRfX3eGaCtq8MZgz
 fBCpjpuGVbKB7/Ne3zvvGbcDyvkAU1MTOYq3kKRcm7FEZJ65335GzPfnyEAfOssWCYf0l0hvx9F
 fr5Wl1SFjLJHhSPneIDZQ/67GH4KqbCe0alj3+1rniJtUyJIStECvmW12QesjLZSEQhFvSDsWWE
 lONYzoNnOstwqCFDUqUCSpKosFM+cloJDSeY+TXnhrVjCNBDRl90wAo8a9Wqsq/PG3CruZYE1tW
 hU6FHH4wuGyhNgZM5JfjXNJkLLneQ+96eJGaKOqjOW6IUvqlkHkwjmAl/TZTxK5OEnBYmpB98GP
 JjreqJY0PtrMo2335GrDEMd6mFBkS4piaVGmTzj9NYNvklY2b5i0HneYHg04cHslCukCtvYQU8u
 FDLkAgj2VZtGJmDEPea5nlOyKQVIbBdFO0jez27RMJNDJTG39r+yO3m7XDIChJZFNPZTA3L2mbc
 3aHmu9QiN/xu9M5YpAw==
X-Authority-Analysis: v=2.4 cv=IYeKmGqa c=1 sm=1 tr=0 ts=696f96c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=3ktymktcbobz44Ac5DoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: WtNKWo-6BccYJQfcs8pLTQGVreops2II
X-Proofpoint-ORIG-GUID: WtNKWo-6BccYJQfcs8pLTQGVreops2II
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200123
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-89853-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,fairphone.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,1d84000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_PROHIBIT(0.00)[0.25.240.160:email];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3673247A29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-01-20 16:49:26, Abel Vesa wrote:
> On 26-01-12 14:53:18, Luca Weiss wrote:
> > Add the nodes for the UFS PHY and UFS host controller, along with the
> > ICE used for UFS.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/milos.dtsi | 129 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 126 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> > index e1a51d43943f..7c8a84bfaee1 100644
> > --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> > @@ -1151,6 +1151,129 @@ aggre2_noc: interconnect@1700000 {
> >  			qcom,bcm-voters = <&apps_bcm_voter>;
> >  		};
> >  
> > +		ufs_mem_phy: phy@1d80000 {
> > +			compatible = "qcom,milos-qmp-ufs-phy";
> > +			reg = <0x0 0x01d80000 0x0 0x2000>;
> > +
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> > +				 <&tcsr TCSR_UFS_CLKREF_EN>;
> > +			clock-names = "ref",
> > +				      "ref_aux",
> > +				      "qref";
> > +
> > +			resets = <&ufs_mem_hc 0>;
> > +			reset-names = "ufsphy";
> > +
> > +			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> > +
> > +			#clock-cells = <1>;
> > +			#phy-cells = <0>;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		ufs_mem_hc: ufshc@1d84000 {
> > +			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> > +			reg = <0x0 0x01d84000 0x0 0x3000>;
> > +
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
> > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > +				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
> 
> Maybe I'm looking at the wrong documentation, but it doesn't seem to exist
> such clock on Milos. It does exist on SM8650 though. So maybe the TCSR CC
> driver is not really that much compatible between these two platforms.
> 
> I take it that the UFS works. Maybe because the actual TCSR UFS clkref
> is left enabled at boot?

Oh, nevemind. I think I was looking at the wrong SoC.

