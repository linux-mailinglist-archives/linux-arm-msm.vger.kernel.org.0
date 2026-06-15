Return-Path: <linux-arm-msm+bounces-113272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TRAfALCRMGo1UgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:58:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09468ABC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PB5LOxcv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iyOxt4/R";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113272-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113272-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 564F33034303
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 23:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7848C27FD51;
	Mon, 15 Jun 2026 23:58:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAB372069
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:58:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567890; cv=none; b=cObhqQjNOySsAalZCJfHNJuaA/KW2m2Z2hZ2dW8SUC3/0MT0PDEr5FbWFwluK4h/6iPrxEMBBlrJp+y7bWt3C86osmy9B1UZtv2Lpx7yKGJv83Hd7iJ4/OP74DkKnSHCOGMu5wraIOnFenhbI4JMDESazSriEwGIWD3BD1iGcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567890; c=relaxed/simple;
	bh=dXgnF758wbGBlQYz1pt2babWPV4W7MLM+v3OGrNIXzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROamHcGJSuVKKMqIjlMwaoJxaWgCeuIMlWZHZzoSRYp5T2OdsMRx+k5OyjGeWW7QA42gkvfb1oyprs33gXL7MpBPdhBvWdceENYkNEoUepuW02lH+0YPd6gEK4Y0j0fRzGSsKhgBM87AFyThwQC7WX31dcxrDJLCE1eDoh1mzxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PB5LOxcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyOxt4/R; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxJjq781712
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wv1looJjod5t5ie+2ZQGALjK
	nlbUhZVcDCWAm+1jUjU=; b=PB5LOxcvCkbIO9+5l+e2KxY157t3BQ4zqM00qYEj
	lQTxeOXxI1ktkBFAwj80Ku4RpEhwbZSQrFvZqpGMDq4S8XEIYs9uXV6S9XfBcu73
	KzZnvfnDzl92z8cFfDIyEIKE/C7phlTYJ1ff/kVzTItKJUdksLMmVP5qOteNXC9L
	ZIXyN1OPV+SMjd77qGxrj3B3NYDaCO6c6cnw1w/hHBc4Dw0A817bKuLSB7/sLrm6
	P+o21zZGzhmvrot4gl04+wDLL9d5EIMf2iYmQHXtDwxltg3B92U7GdmTOdxmobMA
	ey1vpOzamV7DXqWRIdNDuxg59VV5ic5PZNtO4B3kJSAhhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjupfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:58:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158e75cbc0so592936085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567887; x=1782172687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wv1looJjod5t5ie+2ZQGALjKnlbUhZVcDCWAm+1jUjU=;
        b=iyOxt4/RmE6OMn2Wg9Rdy5NQBep7TbdXlqwb4CaKbQMNbx7RZdBPkkCq13PsmeMgsm
         ss7jqjlXpG/5OAxgKNqWS2Om71D0VEh0DhjIrliRUosKUxPnPIP3+EcRJTQguhxFcZ/z
         0LieZY5+7F/fic/YRTLcLBbnINlKJL4YEdLZ4TvtqRUf/gyajTpcAUZUNyp+iF9Yx/Wu
         d+F1qUmSx9xCGMgWthyq5dH+phQ24M0JJ2i35hryVRUHrYFV+iC9SsB58lv08wcCXrqd
         HAy5n2PD1VzFfMxW25LOyVASHyc9K36qmErnVDRh3Wi7Zbl9IX8ReSe9ZMy7BEZd7vmS
         XYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567887; x=1782172687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv1looJjod5t5ie+2ZQGALjKnlbUhZVcDCWAm+1jUjU=;
        b=jV0TtxNTwSqR5xMACmA83sbfDH+gMz3abj3/nuCJCKlSIv4ZsdI0Sp4PE3uZ0o/XMq
         8zlvEfCTlcOQPPZGxeRoTWnsRnEJ2PpuCMy7jNJ832LfScTZMLjCwkxrH+9YFYGqif2t
         t7wMps2uV4/fJnK3n2IegtNmz67QBBJzq0Tey8tptjc5HIeG589uknNH84vdLMoLRyWj
         TeLs6Xm4X/3vveif6gB4LRkK0/ZtqEGbLqCNDVvi5o5yVzGkc+pQT1EdE0GgZNczjouI
         J0F0jlqVD4N6kzNgeKZUG1P4z7BUxbipFkEkYNdYoiSq6ULX2zz/rVkn+xLRB5nTAQrI
         8Pkw==
X-Forwarded-Encrypted: i=1; AFNElJ//Vp+cXc2iegT8EuUgSnrY2cMBV116/dGYhD6coANvkpaAbjHDftq9zD6UN5cq0V/PDEHxx4KHI0D/YMPg@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGwEli6m5nj7sCfmJyvW1QCF2BUOjO/ZU8W8h7M3s9ZKVUEsJ
	oTDIfA7u3yfsVKGHMslhHAxOlSuL8/mll+Y05D/JKZvkUsve7f+vQPUulybV84hOL+gY7UIiv5D
	3VzxV4Sncptbt397RQiRLIMdglzKhL7Z7CUYo3XGVG3AH2TdB1j6jv3Zik4P9qraFfFt+
X-Gm-Gg: Acq92OFuOVa54diyOOhbvnGytXxCLzg+L9y+wGSAE6zU9Nzgv2LW8rgqQuVH2sapMPc
	d6pg+Dg0cUpMNw0PxcFsVxObuCEL67Cuf8jPTkXs5hpD8idwnSo9fyH6rh0znQW7Ojo7MBdRaqw
	tIC+aynK0zfZ7nurTTN9OVbaxK/8v4V385izp/eHVgyUw4i1exLyjNs/dpzVkpMwfO8D3MxwP21
	AzFvZVhqIyH368xWcOWb3P+2RxPtrwSkbA6NZE/KWKA0iZrFG/fiXQSdx05uRVumvreJSrzyJ6G
	k8G3uQSSvWPmmk8KFaRNbs7QQBetwc3ju3xbOOEQIfiyPuLB047IxeIKbGyzDkZicTjwDzP+E5G
	2eGNPahMYlvY8UNNgmItmdVtRP149MSQJsUsvcha7nvoP0ZktiBQNYxiuLPvZP9EiJ0i/fzcaE0
	S5iSllAay4XsjDrds5Rk3SEsLzcmTcgd9KMEU=
X-Received: by 2002:a05:620a:4725:b0:915:aff9:5449 with SMTP id af79cd13be357-9161bccaedemr2529199985a.34.1781567887499;
        Mon, 15 Jun 2026 16:58:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:915:aff9:5449 with SMTP id af79cd13be357-9161bccaedemr2529195285a.34.1781567887005;
        Mon, 15 Jun 2026 16:58:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b7a3fsm3080320e87.82.2026.06.15.16.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:58:04 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:58:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 1/6] arm64: dts: qcom: add PMIC5 Gen3 macros for
 channel numbers
Message-ID: <oyibcqgnr555bkzdr5hetlfmhcg74ldbd3covrflbqcaygs4oi@6vppubpkjcfg>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
 <20260615-topic-sm8x50-adc5-gen3-v3-1-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-1-216a2b5ccb85@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX+6dR1/ObFrx9
 LmrQQsNkdxGZP6htLIQuAEBipBOSb48yG2x2c1uNSebB2Clt7HfEWBx50TrGjlj4wHq+IyeB1DO
 AZPzNM0WTftuSVf04VTUKAg7/8Br/AMD83rGFkb4wVkh5erFyz+xtkYyQM0A53mGjKUDy0RuVmq
 XZqBlJn9MTc+Ls6oKdQtfoS+phiVnzO4tuhiFE+6LQcIvfqJ5MP+68QlB4MA21x5PlNDIfd8KO3
 Q074EfPbAdYnYjiHPkQSeVD0if16EcTsYcRTS+93LBLUX7pfV49B5kh1JyGrRonya1vXajyDB56
 guybNWNVao1IbwHG8R7e1mjDZF6tRLM3xqu06t5OIbw35mulyTuib4dwCeGtLhNDkcLL0baTI7G
 GSkQChImJhwxzTveNiJB2OZjyTUESQA3ehaz/biVAkLtxXmIlYG8YzfbykkA2lZbjDpkVJh1pYe
 93qHQXGBEhpNQZZ4Eiw==
X-Proofpoint-ORIG-GUID: Ncyiv4NacKD41gmig0ZeC4CvNPAlwEZD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX3aOxkFA3WLp3
 n+u/IkclVIi9/kx7TcL8ELkmg1qdRxnPYAHWeFlnvPKROsqp6kaZBhd6YQqkzfizCbFJXAYTuPo
 RrpTQS/48cUSex/syOSFFj7XskP8sj0=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a309190 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DACwfw4lxhdAJLq7RHMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ncyiv4NacKD41gmig0ZeC4CvNPAlwEZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150253
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113272-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F09468ABC2

On Mon, Jun 15, 2026 at 07:00:07PM +0200, Neil Armstrong wrote:
> Add the PMIC5 Gen3 macros to calculate the channel numbers which
> is a combination of SPMI bus number and a constant for the sensor
> type and configuration.
> 
> The macros definitions were taken out of [1] where it was initially
> in the dt-bindings include directory but since those are not hardware
> bindings but logical numbers, they can be moved to local includes
> instead to make the DT source more readable.
> 
> [1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h | 88 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   | 46 +++++++++++
>  arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  | 85 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h | 22 ++++++
>  arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  | 52 +++++++++++++
>  5 files changed, 293 insertions(+)
> 

After 's/ACD5/ADC5/':


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

