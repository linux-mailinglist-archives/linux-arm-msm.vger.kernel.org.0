Return-Path: <linux-arm-msm+bounces-107156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP8IGWVsA2of5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:07:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF874526CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0420130DBDDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2C63DC86D;
	Tue, 12 May 2026 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5cFxzmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2SVeQej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00EC3D9691
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608495; cv=none; b=L20XfR/4Lx1dHm3jVR3LXEtzxGFGPmkxeX2bNmCnLfhfkBDRa0+x9DXfzx4dyKY1SHmeKXEBhiMJEEpBvhvuj+Qpoq13bzKKQUqhIeR6cN/v0+Wft6pUfBjunqgITFhkW54zjiR+J5HDVEFSY+5rl69LqYkupcR+3KG54W0/BWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608495; c=relaxed/simple;
	bh=3+8jnK8XI2iwZthPRjCLqFq3mERrWJmHeszgeFA7XlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9abARZJmaZl6nlpyH7sybsRQG2PjepuY9cBDnPqxaOJ/5bkPepRMUD+Bz5WniYLXL8w8/EMbk2lETBUZPQHQ0oTQ5IfuXlJz+A+/v7cg8mleeKa6ZVPUZod5eCrriUCsLJEI1E+CmSjd9CMKR+qZK0WcZ74m652650vMQrOOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5cFxzmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2SVeQej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CDgGws680094
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dTPg8xs2E+E/JBOzkf2F2fve
	OOKD8h9RFmbi3eb+g9c=; b=B5cFxzmbhn7c4C0999w44OMYa2O1XJ2SURV5PLvS
	Wfh3NUVja3dyCCOrxpPZvpbIEYD79Pb7MKINbgU7MVFab3MtrggAJW4Yd/nZPm/A
	1sSLp0l6ciqgOdM+mcRO1K+VPS+93S1FhET2XBkYibYhQgmawLTSqMA0gYAFCDQp
	s7xPUaD+ipxoOHtEC4dbb7v3qQbLuIftJd113wKtu06X9z2hg7zHUjt2KQznQ9Z4
	zv1emP/BIFKBMw97P4I0hRV4BWkGEXSBjsoscD1Rh8HyWDoX4MqYtbV/6ZWFnrD0
	Qm7Arpo0c2bB29yWnYe08c+vVFgyqI1vScPW1CSZ6anV/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avh302-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:54:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso40884281cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778608492; x=1779213292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dTPg8xs2E+E/JBOzkf2F2fveOOKD8h9RFmbi3eb+g9c=;
        b=F2SVeQejiEmvOkyE1Q++gTaJMZFn1WpMV+wZCfMCki7IaNNJhQ5/j1ztmLrvcjtNCV
         n92CHSjPpxL9vcVi90jw1WxqnfaQXFMvcRxRAsQ2WSY1EFo6emI7JhABt2zyOOLH/s9A
         aVsvMCh4uFy5vpRreu5t12WWBeprWj3zCmbY1MmnMqr5b/gJlVVPoaP/9wrBGYELyd3X
         yewWxgdScSyGUaxYvNScuOujv7Olu3rUo8tGaIKbteDx8PFMOKxwUXO7sJSRMN+6/JwV
         tm+K6RtF8HPjCGi+QA0em39JJBqDhKVSkjqIyM4pT3me9CV+aJH4RfniH3FKn0Tdwt+8
         GFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608492; x=1779213292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTPg8xs2E+E/JBOzkf2F2fveOOKD8h9RFmbi3eb+g9c=;
        b=Ohi3pIDSbWShDRPsh5JMwDknCEqhNg14yUhKc8rQPZD16hmrTFxxWdqNopUK+UzGQi
         MfhstGU7lHvmZ5Lf0Egq+OJZGXNa/2WGsvldAUfkOXld1CDKDzonIcSO7lLbAssS9Ijy
         37cyWsJDOyN9ZO1xB4tBxf/DZxX1BomD2a2vBYVMj33D95ipFJT3n6Lk2PGzcWKk6NV3
         kinjbqbPIFCJ9MRLFhk1ptf8POFtUrrzoiEOyL1hj4M9vwBbsv05zTpRzb45Fykhc4Nq
         so8PjMZasPHkaNfc8gYl1EK/Ig2sL9OTbyLhCenIbYkth6l+C4oCU+jRLR5/VirytaFY
         cKQw==
X-Gm-Message-State: AOJu0YzAGfR2vHZr4ouys0umNi3MzqPLRCKpHgvvX+8h7nCoMS3fwONi
	WnA9y31C+XcNcc2Pxvmzbb7sKdanyrHPFkYF2Cx7aGZPafhhOwafmM54T1NmVMk41oBaTMXhltx
	tm5WA6w1LjptAKypmL0TFQZC5VL1iOWByTxfWuUFsDC9uV1p2C/k2vRwJGNiLHC51WFrw
X-Gm-Gg: Acq92OFymD81Ntmie374auuaYg1FbidoD6ZUESMruuHwyK37x1l7nbwuOMktEmYx6cv
	wma8aqcZBWQQX+mzWZt3WEuUoZzXZeQ8qEpW/yaD8NCyUCaNhovQ2N0qeFak2Tl44hPhUNM7GLq
	sElBzP3D7N87rKK2JG+TmbK+kFYcxN24X2df2jzbbwCtF4a7BU6lGgGPa8CxH8bAZXz3XSvpu/O
	D9hY/7VoT38z7XeAJk66HLZHwBG2aQ0Bh6a8d3St4orT8aJT6QSBXtvIMbj9Vn55rsWSLMtvPc5
	mtLbt6GiRfy0MhRnUSIB67HFBrpp4/ZdhKkJ8oItYUpaMUKfOcmjA2HAW6Ql1JxUuZJO4/stnPt
	NljFpfoa+TO/cahC7bOCOyNGQmIbKrd/Ar37aqvRK8Ysz7GVQ9j9QwmoKrGLcUlf+QUsDaekfXo
	7hQOFqg/hQaLj9WBPpyU54axyWEhWggUZuCSU=
X-Received: by 2002:a05:622a:188f:b0:510:1543:31e4 with SMTP id d75a77b69052e-514621e9218mr416223791cf.59.1778608491863;
        Tue, 12 May 2026 10:54:51 -0700 (PDT)
X-Received: by 2002:a05:622a:188f:b0:510:1543:31e4 with SMTP id d75a77b69052e-514621e9218mr416223291cf.59.1778608491227;
        Tue, 12 May 2026 10:54:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c66facdbsm2073776e87.28.2026.05.12.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:54:50 -0700 (PDT)
Date: Tue, 12 May 2026 20:54:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/8] arm64: dts: qcom: hamoa: Add inline crypto for UFS
Message-ID: <s4mb2v5xbbt2ssbo2ji5hkyuc66sgiemegj3uv2lybepm7regb@ucd3fpbbbuk7>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
 <3ef6b7bec298de5109296a9e64d12b896e017d0c.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ef6b7bec298de5109296a9e64d12b896e017d0c.1778498477.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-GUID: EFIc5D0Rl89a5zsNA-5Nmdp1ju6s-xGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE4NSBTYWx0ZWRfX85OAuI5MUUnC
 LntAbF8jkaiUQMUmF7y+uzCjFy+noS18cMkTO3ooVAyr1hDg0mWhDR9UyuV17GEdzMj7FE7J4Fi
 YtbfpBtaaBB7XG4DHbPQodRdYPhQ1+87OYi9p3vUdOyU70PtwrpG8Q2M18je1dEQBcS8mKTvlrq
 6LgjOjVm+DaY0tiWiDKn4t5oql+QbFUSL8/9O8DzMfOkxNwtjEsXGo4hrZ+P1ew7ulxc9yRoBc6
 W7lRr33RFzaUnZenlYlF0+hebRvGeOvW13OmAmi5BHzVUvGlUwt5uLAmZKq8LJe1tveJjZCKwPh
 Qd0YKWGTJJwDY7FkxcGVtGqYUzYsw/c+CD3ijPXC9Pvyadc5Jb2iJFYyUjeYwLBNB40k0j5Z64n
 bco444aw3BYf8dgGjPg84ArdWj/fitlcJ1c1kRNKydeTUaQ8gr8jzTlrDNMDFUgNCY8AGK9BgoF
 tw89zy1rSnvWDsa1TpQ==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a03696c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=MQIoPJBItOCSEHx-f5MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: EFIc5D0Rl89a5zsNA-5Nmdp1ju6s-xGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120185
X-Rspamd-Queue-Id: CF874526CF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107156-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1d88000:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:40:56AM +1000, Harrison Vanderbyl wrote:
> Add the Inline Crypto node and wire it to ufs_mem,
> enabling UFS storage encryption on x1e80100 and
> derivative SOCs.
> 
> This is needed to support encrypted storage on
> the Microsoft Surface Pro 12-inch.
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 051dee076416..35755eabe549 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -3952,6 +3952,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&ufs_mem_phy>;
>  			phy-names = "ufsphy";
>  
> +			qcom,ice = <&ice>;
> +
>  			#reset-cells = <1>;
>  
>  			status = "disabled";
> @@ -3997,6 +3999,14 @@ opp-300000000 {
>  			};
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d88000 0 0x8000>;

0x0 instead of just 0x, please.

> +
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
>  		cryptobam: dma-controller@1dc4000 {
>  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>  			reg = <0x0 0x01dc4000 0x0 0x28000>;
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

