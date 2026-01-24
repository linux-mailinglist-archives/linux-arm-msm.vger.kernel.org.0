Return-Path: <linux-arm-msm+bounces-90420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIAjFKQpdWmwBQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:20:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A135D7EDD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5456830071CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 20:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90D427A907;
	Sat, 24 Jan 2026 20:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhrlXF0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMjg5hzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAA25A33F
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 20:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769286049; cv=none; b=uEr5Ef9n0jmNWmbQ3esUw8ORHFobzdSmrWI1jx9+VPYFXH3Y1zCcBxn4q9S+ofXoCE7WBC/BUwHF5w1v2HM3QqLEYEjwl/TyWTn2THmslap256AgYzanpYsWKWjski6tfVgXD8C3GkJF7rgFRcwhtrPBpmOi5LsHIsmoGpOme1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769286049; c=relaxed/simple;
	bh=R8JNUZrxughMFlK1tUpGsMThTWnlGlQO6jgIt5A84iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7mCTP6CU6Qqy03/P2m0Am+U/+VJMa5FGTympj3cjQ6yCHTiRSYRDph0P+OkISw1ArxXAiNbUTB0kuEAY292/CR6i+9pMPcb5CORTwe066uenssqpRYeJoymL/Gy7x8lhGsG/mkogBgxrk5IvXTlz7DBTJzGhiDuu/GabXArCsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhrlXF0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMjg5hzC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OHhq9N1498555
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 20:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a2yYpxtKqPktlJWPHN0dsbO8
	FH8x+ZVgQuXzvQSS3eU=; b=IhrlXF0A+/PqUooOK9oDhMdx8zgrsWmnnP5vTLCS
	nQkQ0EOflxWnXxyPzZfpeO/gsP/UCImdbbukUnIEnyzHs2QfGUZUjcbDYfTA6HQh
	0mwExYBZw5IXc7EiertwdOOYib4J6n96cv1YS3XgWdoDt2G7zEJjil/OtuQf9Z3n
	ccFmi5P3GptbqhTQEjQ2qHh5Ae/XfNjVqy1DlvhrcCcvcDz6AIG8JzALStvoUJ9l
	bQNT10yHv2qqhJ81lVHrgp7o2w+F8P+eaMPlab35udl1N1JIPKbxBI7gwV3tDDT3
	f4Pfn4g1sD8VIv1ji9SsIcIzKqqqaiEFuiS1M919Wu0acg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9fs4mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 20:20:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so1178750985a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769286047; x=1769890847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2yYpxtKqPktlJWPHN0dsbO8FH8x+ZVgQuXzvQSS3eU=;
        b=MMjg5hzCEdwtB99j7xi5cft3g/B/j8yBZTyCh+sWu4mkgoJiQvHbRMTj3vg1B0DqwL
         bRKmUlu0xPrUuS3t7myrQh5QKBvECO8BB/MPOaweUaqspLphZQtPSIoljra1RM5LQlXh
         rGdzhxIRNRqIWckVLjGYLd/JVjMSOBXjv4/zGsl4wnJFSHDMkg5bW5HmUWso4BHmCVRw
         wynKqPnqP517WVze2Wn+olKRvQP7PjsFqAirsRIoFdT3aWR1KL7bO5DPdnr0xb0K8wg1
         LEzlfcBTgZ91CYDkC9Q3oCKdJLtcCC9+KTXQyj7w0i26+bThbOoOK1Du22F1jKKBbTdJ
         Ab7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769286047; x=1769890847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2yYpxtKqPktlJWPHN0dsbO8FH8x+ZVgQuXzvQSS3eU=;
        b=v2iuU6BjC7aezDqyFJ+nQIgkEMTDMs8AeyqMZs7RLWIcaNUA3H2tSmBwLlLXgHIk8a
         my4g6F7ZT1uID/2sKYj79vXvShLXMmtyr/CMNpZTRpSatE91qNZ5ZATbgPfaJwcFaoiG
         M0FptYLKxOPcyD+PjCHtg4SrjBeOfBCr16eyDU/4hgfrIynZdiROt8wNLnpIpgPw67O/
         kIoO0cDJhSXxWF5yz9RTfq9dmdP5Qz2xEmQ20fQ2E0s2sq7mjy4Cf239PQlYZIE/jBs1
         qqGOVUjwLjnwfM5u9kJa2N1nXuGad+nxynnjecDsk0WwDRxYZxP1yHTCZce35w/DFWk7
         0yhg==
X-Forwarded-Encrypted: i=1; AJvYcCXZxTcRK3V/Xu+YKjfoF5UOQDNsW1XUYdB5OwIMM75cTGUZAbKoWR8oU83USos5vsFZW+bdeB8jh/CM/9U/@vger.kernel.org
X-Gm-Message-State: AOJu0YxqntM6Ps4smM7Iy5973da7UWOr/uluxi1zgePJYcUT6Oi007d/
	OPU4SBHbnGYFeibb3SRNxCwuRP2QdmKF8bFzNHziw4vPT+rVzvddxSN6o7ASSysPtnaVevN8HHy
	5UkvRCjfgftsX49HU9ZHrzTfRdTpAqOyJfHNh12lsFHGIG/7cRCq+CVJ9P8FTkq1si2a/
X-Gm-Gg: AZuq6aIYXf4dNDcNao1q5QaTvJF/wwV02ntQ7Xo1UQZoFQA0IeVecTXGHnth47BYtrm
	y44KQiQs9s/ow4R2u03bm1c8GUYWKvIUa5ueCNOWtPJGtuOgYuh8Xkfn/kG8I9k5xzCaaahh0K3
	EvzBIjqiHac6LZr1JReDKd0/QUJb+CAOlexce+jQcifz7aBWmuXYDDpRQ3cv8vt+r9ngIh1NgVm
	tMRzXg07cR4KbhyTSbJtjTxaEJBafMM0NFtg1NTHxp8dnvSjoENMr5xcwLUq1qB+Kwub0WHiKGI
	DqUFC5EkHP9eW3l+q6kRdKh7vL4sWMtplZJkK1Pr/zKOHj+ZGsduFD8HMqdH1Fyiv1FLUQOagHT
	kNyp0s+k3VC7mRwyJivcKZVipyxyKK0t6wSH+1x8iZq/9NmaLh2J3YAKqK63QFnuWnu1ni98QLe
	7RNIO4iOmARdVzQ2ASOc7Of6c=
X-Received: by 2002:a05:620a:28ce:b0:8c6:ac96:f5e5 with SMTP id af79cd13be357-8c6e2e5a599mr712596685a.83.1769286046727;
        Sat, 24 Jan 2026 12:20:46 -0800 (PST)
X-Received: by 2002:a05:620a:28ce:b0:8c6:ac96:f5e5 with SMTP id af79cd13be357-8c6e2e5a599mr712595485a.83.1769286046303;
        Sat, 24 Jan 2026 12:20:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492d04esm1530905e87.102.2026.01.24.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 12:20:44 -0800 (PST)
Date: Sat, 24 Jan 2026 22:20:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add video clock controller
 on Glymur SoC
Message-ID: <gxbzaayts6esoje4kwak3iey2pj7wu4focdgd3vmu7qr2qqrld@wlaf5kclbvmv>
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8CB4BixBXNR4QuJqCeRNKW2iphXr-twt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2NSBTYWx0ZWRfX/jihhMjjcfF0
 DJz0Z7dsjR/8Wn0TgaHU0e39agWxefSuvWOzOwvqTbMkc8WduNw0GcNJpK4xSuTCAFX5xkgPnRx
 MAwsYJsfIia7UF8Ky6ZryQ4r17AaKPiwl5RMDI03jqrpES8oBkoi+nqdM6/EGD4p1G9S9qlr5Ey
 j1hj9y8maDbXd5z5/A5PiQqsUhymZBe4P3HFCkjOknBlZp+iCytnQYqzWtACL7Mqek1rM+ZZW1j
 cVi6jSzIdQcWCGff5HXhH6saWPX6KXVf+rjpC8vvTNydsoYBg9asYcxpw6l35mIKzRgux0lCbq6
 cpW1SV+KsRpYzRUSYsHTLO9QXKvS0qGlDjQoqdshrm8Rb3mo4YnoFgkpDhOoMhcBMawWoTUmrwG
 3vA9pdjCAT9ggXU36mbMRNoPgeK+DiRDVrUzdzEVWCyAZLdzAMMaEVFZI4Y5kQZlMraRfP3q+Mc
 cE70njUD93DUt7stsXg==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=6975299f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0zoNdEbV9BZt45G0VZ4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8CB4BixBXNR4QuJqCeRNKW2iphXr-twt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A135D7EDD9
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 11:05:02PM +0530, Taniya Das wrote:
> Add compatible string for Glymur video clock controller and the bindings
> for Glymur Qualcomm SoC. Add the clock resets required from the GCC
> clock controller for Video.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>  include/dt-bindings/clock/qcom,glymur-gcc.h        |  1 +
>  include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
> index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
> --- a/include/dt-bindings/clock/qcom,glymur-gcc.h
> +++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
> @@ -574,5 +574,6 @@
>  #define GCC_VIDEO_AXI0_CLK_ARES					89
>  #define GCC_VIDEO_AXI1_CLK_ARES					90
>  #define GCC_VIDEO_BCR						91
> +#define GCC_VIDEO_AXI0C_CLK_ARES				92

I think this one should be split to a separate patch and paired with the
corresponding driver change.

>  
>  #endif

-- 
With best wishes
Dmitry

