Return-Path: <linux-arm-msm+bounces-101798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nLteBuVp0WnXJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:43:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21D39C492
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C1BD300A8F8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B533DED9;
	Sat,  4 Apr 2026 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+V3T6Tu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GswY60rY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA4D3321B1
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331809; cv=none; b=jTAFazB2ZDJbQu9QQM9NkKqiQK4rGQItRTHZNaIFoQxBmUUHW4w9vkv+//m+WViaMtcNS0HaggmoNKDpE7soimgbdJ3JRQwTowF1w325HTrqaJVaoKv5B4L+pgSMYGlG2yuEnxQYERzPbE7RWQxVnhPL2/31NR9q+gJ0fioeSd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331809; c=relaxed/simple;
	bh=gskJ8saBgNIWE/qvWa08ln2YOItC7Vi8/Bs2LPRmxbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXgzErkSyZnMSMz4D6mTVKFhakf/Wx3xacKYTEdGt/qBJ7fRIVr3Fzte5Wrn0R6A/o64KOytiBGuuEajrdGRWp6fdA0x6kKAMM6wN+zTRc2y7qEnzlDjqvAq8BIlhJykyeha0uqDGMiFJ32JTr1vv0fU4b/kN7dPcIs7X/+McEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+V3T6Tu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GswY60rY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342Xk0U3989220
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KTvRBnoQezY+6pRorEeRgttd
	IFDhZPsNJpAbY+tkaqg=; b=b+V3T6TuJdnyChuGEgOBHiWw2zgJN4eil2Zo0MGs
	4Lm9LvPZLxKBkcqVGyVvIh+fgctq4xm2UiBZ6gwyiCyBR+yFTgTjL6EllW4E689O
	has0if9IKSjUIW4gg7ZZqiqsqS5UEYJCqP8VFcbbCuuGvi8+pqjsbHy3BAnsI33Y
	9LtgwQyzuoI5x/INqByQn3LMKbQKoB4QirGbqIWQoJI7BihG1k4+k0I75QlXHEMj
	y5ajEpWIhALj9eZxsQMhBr07/XpEPWAPaVq5OWmlu/AP2PA/Q5mCuntBURQk3JpR
	Lbl97Og8r6OyZWSH+phxYPdHlzm9zszgJ5A3RCNDnu6zYA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhevj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:43:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so73283811cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331807; x=1775936607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTvRBnoQezY+6pRorEeRgttdIFDhZPsNJpAbY+tkaqg=;
        b=GswY60rYicDNWMymZKYMawcV8OHiOelLAkbtNb2M0CfUh1vjF/+OETcymZuBDrJhnf
         qHDadtO5nWlEpvU/nGu4/55pneRgIXJmVI+Tu3UGVhXOS4Rw/QJeXumq4xwQS007eiis
         fU8yCC/syoVz9mxeYOFOoSZKN7455fsP0qwiLC+uZTBEOJPz1DExCQTL223IFOr1Y+Nm
         k8cN6WA8rXf3pokAw1s3Sfu355ZY9/g5xyWqAwDZ5aSXLXdL9qDuNxqW9MpEVhOrMLVM
         wASZRnAjSJSwEcZi3XGAV5CVkW0P48mkBXKNaRC5rCMCW3v9jgAF3X7PjUFFfUjft8we
         mYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331807; x=1775936607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTvRBnoQezY+6pRorEeRgttdIFDhZPsNJpAbY+tkaqg=;
        b=EPtd5r6JWElhxq+3qfYfiylkvudHNOcV1W494vUuzQwR28uEOUMAcFsE145RqiMbeZ
         IxoMIbkaLe1dWbbMiMLDATcF/3ihQG0dQ4uxnSi726xY0wxS4dv53cGrfcc7Lvf+1OHz
         rkNZH8D4j4iiACQouo39hlCMhj1RirlYepDNwVwCKyCtuygppmeXa0xU52/gV4CwPoAI
         A9ctjOFTqimCtnGkK4c5Cg/UXAqIpiNHC+oYnQW8x3Z5F30cEzVpvaObLWZZmlR36WaJ
         lFYnz7Zx5QbHZ2HiSL8PZyDpoW0eTykDFFemp0UILBVpNK895gVkR0sLIw7cMuP2rawz
         Lb8A==
X-Forwarded-Encrypted: i=1; AJvYcCUnNFn5SvvbTXpjGrDjp7iPntUeA2KBnxTFLGDjyVUGLlc5bplXcdLp6/l7oROGWZ5yLGTuayxFhu2Yr+8Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57ucWOvn7tZhC6PlsVBAGush2ucIWtWowl7h/XHQEFZmbPYLp
	Fp/Sc3jVmKw2NxftdDwCWtyQvyfsFmLPfupxY/jhr3hpDSmQGQiPuMnS8Ro4pIC6NhA4XAPZ0xk
	QoGkEtolmCgkzPx+U+Oo5e2JjxY/MigBd38cyHPeECgQQH6xafDAJtDIO1IsjamT+AyhsNFqlWg
	Rf
X-Gm-Gg: AeBDieua3Bx+eS+YU2ZNlcL3b/63olwmMqjDbmA4jJDggsfOqtq//LwsNoqeMCANkh+
	Q2ZU9+iLfC2DQSE+9t0r7KCigAXvxo/xqXh+jM5hb90fXhw/6Nxn/BvXnZ8YUWJdgn5dPrMgAA8
	kZsy0A5OQhb2LzZtiEBVkMUV0dU1s9HFtYagLdPJ4dqPClGL3bA5R+6Si7KZZl6y4iKE75hEtn3
	x9CmehsqwF/Tnp9pkbH1/95nXXuFiMmCjNiFM1CijM+619dTsYwpYOaggS3wnu3mFdJ9jMZMH+F
	5pce/f3SRE19xNg5ztVkiYASuLhM9ctSENhcsiNjEAKekIRiBFowUTk99yoILz0huz+rQIkme2a
	hC7g9NJnAsg3VWYSnPp5lP01xnk/4n/UIvtyoJQ/oMsgRMGt8CNPJoPUught5JKVWtMHc18a4fX
	vvXmhRHaFJ/OnMwqxi0KMmtyeFv7vK57mmuvY=
X-Received: by 2002:a05:622a:8c17:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50d4fc17778mr135996931cf.23.1775331806921;
        Sat, 04 Apr 2026 12:43:26 -0700 (PDT)
X-Received: by 2002:a05:622a:8c17:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50d4fc17778mr135996571cf.23.1775331806511;
        Sat, 04 Apr 2026 12:43:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cd20sm2286805e87.28.2026.04.04.12.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:43:25 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:43:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: Fix cache and SRAM
 simple_bus_reg warnings
Message-ID: <3ozgkie2aycnzfvzs2mncipfivqs73bb5en63lorjan3oofxmb@xk34mt4xjrwc>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-2-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-2-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NyBTYWx0ZWRfX4TXf0r7HaKKI
 Bm3IIbDb/y8j4qKkJYIGC7uBceEEcDzKW7c4j7nVAL5ox1icfGAf02bCsKIbmt3TJOgC+H6An5A
 /jNY+clZZcbortbUvtmgcmlNyF8T0ALFORQTOXqtIJ1ignUl6QXw7qTC1KLL8RSONW9kNhg8c96
 OrUeSBxxw9pEh7MZzVp6oZjwe/yg+4thU8hwI3StayxgEF4udrs7xiiuz9xQ/6yjvWeXl2tgfzj
 xy36xkTRNeDzI7vOaEP7SWMMqH6oKMNW2HU9lKgye0a8DnA7ZNDK7RhvaKQXfXWjOP44VlZ3nOW
 Ky+Qs8dKJuvYDNeVE5V6C2f66z3xclbFhKR+fVD08/z0ObWbCxnoYE2iYrlchY2biQmndJzZTkT
 0Cir2n47e4ePqj5WcGZa3bpUUinY6KY2iQbgBCnNGSBTXv7RuzI3ZDzQgLvI8gbXIHhfxwk+CdN
 a1ehFr88xSn/J/zAzLg==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d169df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cCzoi3UEGlaZAWgPeLQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -fqTEf77ZbsrWy6YMEaA1FV_fdQkEsQx
X-Proofpoint-GUID: -fqTEf77ZbsrWy6YMEaA1FV_fdQkEsQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040187
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101798-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,0.0.0.0:email,81e08000:email,1.55.71.128:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: 4E21D39C492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 11:51:01AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of cache controller and SRAM nodes in Qualcomm
> Glymur SoC DTSI to fix W=1 DTC warnings:
> 
>   glymur.dtsi:5876.36-5908.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
>   glymur.dtsi:5917.23-5934.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

