Return-Path: <linux-arm-msm+bounces-96379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMrQJC48r2mDSgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:31:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE5241B6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 437FE3012A91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B35636BCD2;
	Mon,  9 Mar 2026 21:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6ucDigm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ+hr0ZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45736345CDD
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091877; cv=none; b=lXMIbwaSQmScmA98b43rCTWMhESOTc2GBaUT1eMhn5Ibg7Prnb9e/kvCmT4Jpsl4lVwEu8pMz/HUZc00Kr4rXU+hWIGBWwc80dcwjWvxw4yYV60DstJjdfXvNmP/ciJIk1Ujoj36Ekw9fbGA3bqTUonIifTB6W9V8Mr4GfO9NpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091877; c=relaxed/simple;
	bh=QMfppnJB0bOmLxXStgiwpIw3NO4O3DrzoI6RFVjD6kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5DYv5NpbQhh0fc66+YZepQv6na3EKgr18WGLpRuKc131lACFjbI9kJLPRDBZYIPVQMlj8EZIlVdTtYj65kXv6rDIzltXQ+/IjcyUpe8hLyndvZULEu7ywJOmb9TYLi/JsSUvgTOXa9+anNXmJMdVgNJ3w0C0qEi02FiJF5ymM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6ucDigm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ+hr0ZH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCXTT746101
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/erZTekXRBJfl6UaU98s9N9P
	EOnpIY6iDEfc9ousCHA=; b=R6ucDigm4RD8BxJVg6VvO1A2GLolKLoFLb6WNLC8
	nhLMSf7U6DvW77L7xuqtly8Gao24o8Ug5zLF1kPKv6EJW3kCSug+pphhNQR943Hm
	7rMDK06xKd15pIBuw8wGvLC2b8rZaecdIlDIm/Ug3zCmSADFMvAJHjGzF3Gd3GCn
	hPb1t0ZwAX77aULgdAOZmCX8BztW8GaBca9hfkbndKazs+4O+dQBMOeFn/zdIHCv
	MTE5MPG2oCoYgnPQuiNmLCp5h0wj/AfPjJYjhbfMalFfDjVdDpcbhzaLJOB1MOHo
	6ewRGqIZouPDR0svc22iLQmj+0j2gXlN/Y6dxFT1NyJ+1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaahvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:31:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81be6f05so1050035985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091874; x=1773696674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/erZTekXRBJfl6UaU98s9N9PEOnpIY6iDEfc9ousCHA=;
        b=DJ+hr0ZHRExAEMCNTXBE5NBgEnrT5k1pXVXf2ongnzPJnUOL5H/CoFLPIS/ykPOQzQ
         YWXiIXGv9swxHok+x/274lHs7SPOccSxec54TvrCuZbg+wE+6V0+ithHImtuA9f9fGjx
         kIkHEXcrt/Sajq/BfX+ZsURn+3fgyim2yiSQUJSXkR5llgxnCtlVRL840ZGwCnSWLodc
         25w4Voz1UAzz1PwlLomj4U92b2RuLgtsbomm9rpGdUL4ZVAwrpIWbl3/PJIwWLA8M2Ai
         NmXTwxi2dTx+KmvAbjBpsCSjEIj76rGm+q10CrvbtHiE/01NOT05RXG0zmKb5ptgVn+C
         WnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091874; x=1773696674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/erZTekXRBJfl6UaU98s9N9PEOnpIY6iDEfc9ousCHA=;
        b=BJVRS2K7CMkCf1XM1GBHeT3dinf1euUUy2WZ6avmiERTfnvk5yxAZ942cwqmGIxq5W
         i7bZFBanGMH4HBmsVlRHYqoZCrPsmi9nuPBRG/eDJEEp8lmLFRla0ljKq6gnpNWPjyja
         yCWr2fKyvWnDGTv5DtxCYJV6HcpIyvxzC4A1M3qpX/SNm4wrBKdEXY+Hu4MG74NHw2Ik
         Oxls7X3agvfhiUWvLX2Br+sE8CRJVNVaCyTJ4DUAXOpBF+OLsr95AIiPXBK/YMbzPqvH
         i+l6kF76lxBRbT+T9VbpgzMYnho1AH7TBCMtg+r0nWF7cenQUOavo8dWyVUhlApIXtLb
         KEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoTmPpmnkgIkK3mcQCuYtbxQbYGnAmTo1aCORv8ayb/jk6xBQ6eC3jDjutb5jr0Jgx0PvPzcA8VNhMoJb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxqI/yjOwiqE2IUgTzVgNlL5gutL+9NjrFT6JyTG+6gb+F3Kwa6
	zapdPb325XEa8N6W0grr/sFJ6yfa1YWacxry2Q7Iow0XoXmCUIV1tKDshGMgf2vbKq3HNwH4xez
	biaU5iK0RR9zjgvVffdclsv540+Dl1Rupzz8isBfpo5LWvVGFF71uf5Nrt4tC+djK/njY
X-Gm-Gg: ATEYQzwQuXd6kuZl5CAExUcwejYSzwTLaGACRhT0AiSeRPGdDtUoD0TErPxjnA81yr8
	QIWuZjE3RP198tuys3/oc7wsLUJVLpWXNoWDMyN44Apa2337wM0FzkaE2z9Om1iw9R00D8KMUI+
	sOdP8CearNGh2Dw4uJ6jn+5c57XNS/off8DWypYiclt1nfZNVk4vmbEYj5gS9BuwN8VychbBQkT
	nfd/Oiqffo+xGHoVt1UVeYE0nKDUq4dSJP9o7HGhI0gwkQaNhguTZgJQTyzzVsc0eKpK4u2Mwzp
	T7fztIZHjG+PqB8qVdcgbp5hsmPjAwezCh5WnZqgiaeDzl2Rr6F76nQaAcJu/DvkvWRcl9SNAcr
	5RAAEyGKzmYRQdTO/mkZiyM2rl2jrEjOMSMCUFYTfZ5iNqITIfOMxvCd9iMfYOYI5eXjzM0afPr
	bYT6COsqk7CUUfg3yqOFUoaQcZHU7aeYOaE2w=
X-Received: by 2002:a05:620a:7017:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8cd6d407d59mr1565780085a.19.1773091873627;
        Mon, 09 Mar 2026 14:31:13 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8cd6d407d59mr1565775185a.19.1773091873189;
        Mon, 09 Mar 2026 14:31:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfc545bsm1463281fa.13.2026.03.09.14.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:31:12 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:31:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
Message-ID: <zhgwgzgf2sdsxooqdknhxvk62mif57vcu3g73roptqwxblofbb@4hsgltmqpru2>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
X-Proofpoint-GUID: bz1rzJpQKfbl407alpZ7VUj_mAql6znr
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af3c22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XFCnTzhwHPFgJtnojrQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfXzuPsLzK23stD
 muIIppwXtABHQX1zIvAFwQVk+zBSsxUiev/KT3b0hIgC0fVGX99rn/CfRUu34HHpdMw6DsIiKS+
 GHVcpITVZLJv96iKMBXH7uOuHLYmjk55UttWOsYt0Nyyci1MxPjSzzNFhVmXZyh0aQL/DYzuxdG
 VxOYQXx31L6tSniNL7dKWhI7KRfU0a/FIeMNJIbQcuoxRQtJLa4vPVREryoj8iPxD5+2PVpMknP
 wnb5X0TWS0jdHg1EzEwiv8S3w6SbSRvYWZOgBVYvyxayVGKk2VPIA+cq5I9RbVvTci/I/LpsuJl
 g5GNqUFuVrWX2Uihvo8xcVwzwV6ekVTJOmE2mXt85gsRa8mZQt6r3942STVXGXC7BxYn/n8wh7d
 7j4TqR5Wn0cn4Oc9G/4K9v+zCuZQbngCfet6yf4VfHGz5JB1Mkbmd9KslG1aj6wsLEUi43tm9Q8
 b34sYjgSTSh7jvzUyVw==
X-Proofpoint-ORIG-GUID: bz1rzJpQKfbl407alpZ7VUj_mAql6znr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191
X-Rspamd-Queue-Id: 96DE5241B6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.1.134.160:email,0.12.53.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:08:18PM +0200, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.

c&p of the same set of phrases doesn't really help. Please write commit
messages, describing why the change is necessary.

> 
> So add the power domain.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269cec7942c..5f8f208f6063 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -764,6 +764,7 @@ gcc: clock-controller@100000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
>  		};
>  
>  		gpi_dma2: dma-controller@800000 {
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

