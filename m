Return-Path: <linux-arm-msm+bounces-96400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KHGJxder2kXWQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:56:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B5242C46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A472E301AAAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ED738E112;
	Mon,  9 Mar 2026 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4WX/iUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BlAYXOLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F71A375AC3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100563; cv=none; b=GgjKqc+stML7d83jsJ0rxW44dXKv/Xc/VnVpOJiV+wM6cVxHXax3OhQlKjCDwmxisVXQ9eGvpB3ET618ZAacQW0+5j79WAU3RhCSsrqR/SFv/eGME+i8x45tH4m2pF9dEgGsQGzGpM7jYxREeJKVh6TIk521nY1kxSqI+8empFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100563; c=relaxed/simple;
	bh=APoB2GRIaTLewPG2eJJrNGl3EI+jktO1KC29NiUkO3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1Q2JaiXAXemlcLnKKLYZQd4GjwuGkY7SdW864o8wQhiYWLLiU9yqmhBEbsdYGzbXuJTMu1W3bxYDg2SjaMdNsbsfTfKbKDpnqd3BDGplsDMCBS3f7zKsIlsq+qYZx+w58E9R8cBxRrmbnqLAjq19s3OPGarYLZF5Fhq1HBaDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4WX/iUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BlAYXOLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBn841203506
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 23:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gg5U06zvmfTeNo8OPcFnYQbQ
	yTfxWnitEMe/QrqOWCA=; b=d4WX/iUviZxL1yn5BMH5jwJj4eSI84LcSv6hPnW4
	mXEcttwdXfm8JFjBAgLyy2TGBeomgn7rOhN0fHRgufzPfkQLt5uXjZqWBXpuhAtt
	S8kfdt+AA1A4PtMnZUIuK+OtbXmEqNk4M+2U3TslkjNuB/M9Gp17AwLpSM5Px0n8
	+NOdKvuLe2enPrnCUFjmMgYkBtaz7rjks/d69VwBVXeXwUMXx9QQmU8r3A8UclpD
	26hxOx5eD2vyEl1rCy3TctTilzqoIOOlWZIlr9ZDtiVkBWB72XKSPOa3HoXxorFi
	QCJHl0TbphAptx9+bCvy4Cqohxsm/FfivQZTgyK/n2ngCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329ren-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 23:56:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso9682059685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773100561; x=1773705361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg5U06zvmfTeNo8OPcFnYQbQyTfxWnitEMe/QrqOWCA=;
        b=BlAYXOLp1soMMQaMr+vg/p1VZ1b5uBZYiKZ3PnIrL9Bqkd03GVKzftgOFVHoa2CAVd
         jfpam6iWknGGgykiRhMiX3GgUfACZw8oqvyX5Ck8d3+KVYItmzIKc/TtQNE/SrFzMbLe
         Rc6S76VmWy3iC4vC+ReDEiJgwQOE4UBE1zNpXY92HoJICivoDh6Nf5BVrVUV0+PU4XIo
         SQTHUFu8fCpP/wQCILaV+ZZKNORBrfPE45kLqufQZPQAgxR2u8u3rxPCoBJX1rHJMYsL
         cIj6dBK7w/clFlmS+qa1P8HppjObV0Etw/A4ho7nheuAIDoS7a0c1sp9+L7X7uqJMAzb
         A1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100561; x=1773705361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg5U06zvmfTeNo8OPcFnYQbQyTfxWnitEMe/QrqOWCA=;
        b=hwjWXvnwoWV1TGEAgXysI4MgSNNDoL1LpMBFNEW8LflrRbSty1WSclgvLsqDea/V5V
         odS/ukGYs8mmO0SB9howD4D1gZo1VEUS4fUd6k/qYesOiibuZ9r7wFTfhOF3MXsCjkif
         S6+NOkty85sdBHLS/LbShnHTCIFgcX3/G9Eg/CbE5b/vEy76n8KYQ/yTjITQ1t1p8qIS
         i8Us05IX2MN7cUOpWStdib0C8MsfnM3CYEwZySDbaGQdqjcw5FufJ1BgHte7WZhfCQtO
         XUdwjdz27taB70/tGiVo1WT1AjF1dirFH1Y2NTXZXMxBDtbeoiYghQwALCUmKZpIoKR5
         xk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUY5wvHIAPwxzBNaprZqZFA7j2IFofdxLseqqbdODlag8L3TJvnGt+PpWLMgpUItHtid+ShtRldia+nTOlb@vger.kernel.org
X-Gm-Message-State: AOJu0YyZg3kUpK0HUbU0KlFTc+hX2hC401Kv6TWbeBbLDzJWNEshccR0
	9QXhOHyij8cSnTy4aChLXtPTRpuN8O+bYCFGpKgLc8i5jlpJ8xC+Ha4ZNlgyeZw+4QNda6+jAnA
	ZyB7rZeg5DH0kONE2Qfc5S9tP3E+S9t0eRkJ/5ueVorbB0ve3KMcagIPOu61OGqUo5eUv
X-Gm-Gg: ATEYQzwA38PLwfnlz08Vblw0e8/TscNMVIjuyEdmY2KIh+rFkEZS1wbwPDNECZq+abs
	FCvpj+rUcbinBtH+5eCS0lkrDiFiW3O0UcPpYNybhoxb4TvlTsypI1kPPCHl+Yi3pFuwll0NRIF
	jfv6RvNiDgqlLfkP0oFGwovgX5ncwN9IxRLFwTAgiCO7NiM4RU9IY+ZqVAx4jjls8nESFNa2q07
	r1MqemzQUyn+ixVT61RpyFi9l1jsCkJno1a3eGQSidEsL00sy2ap4zOmpVxRqzE/xx3Q6YL5677
	MRd5AhHiN2ejWD/xpD2e3mdzqcwLjD5n7Amsj0kl5wNgopIMM2xZb9hzWLEy4l+F+ctu9oFDO1C
	rJx9Nnv4qcbkUxTh+pPkiS9r8ZmWoqcdlftXrczvrMGakmBeBaAsapunZB9+BevswbTpkQYyMqq
	E5eHapiQdl2vezK/JStw/BvqMYsYVlMUECyXI=
X-Received: by 2002:a05:620a:44c2:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd6d514b43mr1695424485a.76.1773100560847;
        Mon, 09 Mar 2026 16:56:00 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd6d514b43mr1695421685a.76.1773100560383;
        Mon, 09 Mar 2026 16:56:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfb8087sm2034751fa.11.2026.03.09.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:55:59 -0700 (PDT)
Date: Tue, 10 Mar 2026 01:55:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] media: iris: Add platform data for X1P42100
Message-ID: <wjue34qubjrdzwvmu74ysb6pfq7sy75gmihfzk2i4pw2i3koxz@pdg3vq6cgytk>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-4-75fa80a0a9e3@oss.qualcomm.com>
 <20260307-curious-skilled-ibis-fffadf@quoll>
 <b65e62e7-c223-498c-9005-af8c74861a66@oss.qualcomm.com>
 <8a7c3b44-200f-42a3-9888-aa72f401cea7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a7c3b44-200f-42a3-9888-aa72f401cea7@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMCBTYWx0ZWRfX/18UOE88C1SB
 yIly4CClOZGgI0VBPyCNFYhlOHy1LkDvD13xSS1laiVeTJFvsCqtZbz5kmvcnlcNhYeKq0QwVO1
 cyyce6eIm9UiFQCuWTwozwvLL6BJis1zR1detPKrqU3twvqvrZRDDtVEigoSR2jn7or3l12cwRq
 4YMcrjD7Cc2cBKg6u8nwGEKi9smmeuSsBMFBgBBLGjj0yRQuQtRqrh8jgSVmHeAqXHCT/hG2b9Q
 UQtfs5rBqeFU52+R2WPW85jbRTVS8iI/WKjR5j4R0lIMDaoN2dYrwf+onfOwEDHhTl1ltxOrKpL
 I9un0Hbe4IAi8bnr9oh+QfVNoJXhklp6XPBvZ7OxzXGwneeMPVYGfSDizoJ2AAce0rmaKSa617u
 t0i4qnXum2CpmHC4LdcDfX8YVrF1abxAVeZDk0+Ju4Q/RuepHo8UC3G+OE7wA9Q19CRg//TFTcd
 ehHIS3dVGRecRTh+/+A==
X-Proofpoint-ORIG-GUID: gLnrmFujYfDDlfUcL8Sut8rR6_Z_YKDx
X-Proofpoint-GUID: gLnrmFujYfDDlfUcL8Sut8rR6_Z_YKDx
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af5e11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=tZouj9Mp9CdiKozPqckA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090210
X-Rspamd-Queue-Id: E53B5242C46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96400-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:49:42AM +0100, Krzysztof Kozlowski wrote:
> On 09/03/2026 11:43, Konrad Dybcio wrote:
> > On 3/7/26 2:18 PM, Krzysztof Kozlowski wrote:
> >> On Fri, Mar 06, 2026 at 04:44:32PM +0800, Wangao Wang wrote:
> >>> Introduce platform data for X1P42100, derived from SM8550 but using a
> >>> different clock configuration and a dedicated OPP setup.
> >>>
> >>> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> >>> ---
> > 
> > [...]
> > 
> >>> +static const struct platform_clk_data x1p42100_clk_table[] = {
> >>> +	{IRIS_AXI_CLK,		"iface"			},
> >>> +	{IRIS_CTRL_CLK,		"core"			},
> >>> +	{IRIS_HW_CLK,		"vcodec0_core"		},
> >>> +	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
> >>
> >> And maybe that's just IRIS_AXI_CLK clock?
> >>
> >> People keep sending downstream code and name such stuff because they
> >> found it in downstream, so I have doubts.
> > 
> > As the dt-bindings commit message states, Iris on Purwa has some new
> > IP that needs its own clock for operation
> 
> 
> It's v3 IPU, yes? So why that block disappeared from further versions? I
> would assume it is still there and the naming just might have changed.
> 
> How this clock is used here looks exactly how v3.5 sequence is done.
> Alternatively that's AXI1 clock?

Looking at Iris docs for Hamoa, Purwa and SM8750, no, BSE is not the
AXI1 clock. It is documented as a separate async clock, it's propagation
is enabled separately, etc.

> 
> Or commit msg should really explain why usage of this clock is different
> than v3.5 uses its clocks.


-- 
With best wishes
Dmitry

