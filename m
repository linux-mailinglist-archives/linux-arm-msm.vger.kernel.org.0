Return-Path: <linux-arm-msm+bounces-116446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cb+aCQ5TSGohpAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:25:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE670645C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:25:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p3yzhfuP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X9K63Pw6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A358130053D2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44EE1F2B88;
	Sat,  4 Jul 2026 00:23:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE41A5B90
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:23:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124598; cv=none; b=nR0cZ2YyEOBpV13H1WkBjRo096AVKxhQvJflOcJYqP8l0qEEZgc7/F26o/MlrkBMn957NHWB+4eMCNmw3LjWqjubvU9WdCYfGsoY6ebsfZrOFVID0clz3WNYxmODm3miwOP/WB6Mc26CXm8eo0sx6m5T9RwvHJrjhTjAwCsdlKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124598; c=relaxed/simple;
	bh=KPZo42l65hTImjZ55/y4AAsr6m2lG5IImpSre4pcMjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuQy19HASXrfYaqX2s0qxXNiw/Yaht9bKfB4GkrCNN7hbeJDSsmU7eexwVtHrgjA76A8KCPg4jWp5ElwzhXuxuyVl52ZBqgIiGFuVc7XfyDUtZHnHnYqVQVF/wL3+++ATZq/rVUDnDi0tpC/suVnOVz3EZzHQWBo76FzlVmf2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3yzhfuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9K63Pw6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Nl4mr1441988
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5OVmVCNKgOLLiZI197tnD6iA
	z9XinbgJfYuM1B+BsNs=; b=p3yzhfuPiXmLYOM0JzkUf3GCCJN8wBIVk/zuXW8h
	kzAqLnnwzdzDU2dIXETT9lx6dBA+/+dvYKeNXd/IZpb8WRlSV9ZfEDShaTMdf+Z3
	P5otFKNFl6yYLPral7yNv32hWU1P55SOtLvMqsK1S8YF+wPQzCtzwaN9dFgqbyDX
	HAERCB2IZiW0v76hUKS7petC+yw3JXAwjHshZSSQ4N+V+yjz6fpk+DWZFykjBqqN
	8y0Xxj11JQO4TxWSX7qL5vnrw57HcK9nOu78Xvwy4PamOnXw7kJUSrQHnoEu9RMj
	Qw/0v2Y4lCJVbye7ViNoYoXCsiKFo5UJS0Iw+Y84AVIalQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5cb4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:23:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c364ae3bso88202885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124596; x=1783729396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5OVmVCNKgOLLiZI197tnD6iAz9XinbgJfYuM1B+BsNs=;
        b=X9K63Pw61fDqAzvmzSQV4SPgsOzhgS3Gpz6muSa+LTHIFee/PMGBbom4i/oXEuECAX
         kOyGk0e3yRLupaKdpz2otabMoEjCtrCz03mSEgU0ctX7g9JgI1iWcSk1bn/biCEHWo8C
         eycc48E4ZOUhCfe9yqq+6ww2WSpBADGu4WMM5LVos8LfQGuxbHAP7mspM6M74YQSAZcr
         TaDQCAjLoJo1blHbVTJLWtCTWIZFbO6FcsYu8HSuhRU1vGJIoPt0QvDI9KvGCw+bE/8/
         kX987vhbvN4LUd/3ZymdH55aSS9CZ1iqP2KnlvJiqmvpdAktDR3h4J2eSBinBn5GD2SF
         lFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124596; x=1783729396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OVmVCNKgOLLiZI197tnD6iAz9XinbgJfYuM1B+BsNs=;
        b=npBNDAH8tsrjxksby75EEx3y/mAwxBZB+irWFcFGzSi9RAG8nb5S6IbYirLzozXQId
         q++tZeSRVYEGeJ8HPsEKjvYrfgKnJk3vVq3C2ZVUwFgb/MD9i1ss16rNZGlZUqSwnPfB
         mU30lJ8Bsm2Cjsa1TlZK7GYVdTi3HRgdXYvqOybt/3q96P2H1L/j1PPQUvV7GKcbMapY
         SdIQ0hOEr+84Vq7wCO4k2tt/1xoJEFuKyLMg+I0D9SKRyGaY6v/rlZ6qEuOa0E4cERiu
         WhkjiGlXFd8nVDLWM7kU2kU5o4uMUj4/RafWD7gnagsQEUsGdL1HBPcBOFOr+a2LP2nR
         +j8g==
X-Forwarded-Encrypted: i=1; AFNElJ8bv+Qpjd+nDn1vydsMNJv9ZX5DJiTG+T4ApaYLL4Ve9467EKLc5xt9vxP6HSuBjKXa0d1hzHGGclBEt+6B@vger.kernel.org
X-Gm-Message-State: AOJu0YxhgoBokyubDHnWIVt0mtT5nlIMka2KkIHuGMODBClkFGMNN+H9
	/D9tKSN2vFe1ggPPuHjC1rmTlesOae8s7ykxUCkXw3vHJvZkpGuoC70gX1FjDyPjQ6qDGp0MQrd
	BAxSm7RAbutlVk1lf6b2vPME1e9RoyDGpFhhG2ndC1PDC6KMo71xGmCPzVdY2C3tO1rxt
X-Gm-Gg: AfdE7clyBGlTP3RYiqqntDNHkchR2UItwg4nBtfCnm6Q0gt7SBVFNBDw5TCJTMzqE3+
	T4F/X97GFtvhUhsmcHVRvVqMFNGapaqRrDC6uQliZclMgSEigGfcaG4218epjnqzv76mxBlM0BJ
	CNeZ4RoTg1F7DoNWrp+2BBTH24Oa8CdVLDSkky39na/3KP1z3fSgakJKT+0SuG1EFp3BdhWggcH
	5EuFy5xoGIcNXDbYs51k+scap6JHoRnG3sYrOZggEFoPtOpvi41KojKOgpAuOVXHLoZf0LkMa37
	lQoH1sZtN1WEzG2aw639T577YRHFi++Jbqq2q+aBZJPCBzTmaAFzfM9xgj2D0uHkRejuDPGs/Y5
	ILVuoveARIaR1PvLAS5XbFA38/EumpdR95XRWnE2c1hAcnKsozpZdn5hVm2Gzjnuol/d7j1KMeo
	/ZN/oFH5iOh2wANvzakI+udwa5
X-Received: by 2002:a05:620a:700d:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e9a512f0fmr246529585a.67.1783124595808;
        Fri, 03 Jul 2026 17:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:700d:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e9a512f0fmr246525985a.67.1783124595311;
        Fri, 03 Jul 2026 17:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm866645e87.12.2026.07.03.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:23:12 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:23:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Message-ID: <pct3rk2jr5ed3apeniqv26mmhkye2dvzkxb4banvvnbn46jmq4@vgde7zbudux7>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX8b5szuhBzOhv
 c9k4nIPRDwi/MMyHsJG/yRr07j/CMoudl5/kXVd0IXWtoL98cZw8z6UeQ7L58ue/nYky0nWxqOn
 FOGGg19lbnWA/pdv9sVhSdHa+i6xPQc=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a485274 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OumLNwlXtCAUlcyMYLYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aaXDBIEpaLRmSXWMA96P0vYi5otqZEbC
X-Proofpoint-GUID: aaXDBIEpaLRmSXWMA96P0vYi5otqZEbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX/rThK3IwuiIy
 79z1ijNNMl0wfcTOk1ZRMeeXATJDKNnxMe/jy5eOJSqjNdrjqRdhxBypAKkul6Tye1BkA/+M7VE
 QQUBxu24OugweMmGaZJrg71gtO9ZTCQtzZ0IRv3ZxMgSD27xuoet/6hMq5IFmxS0yd38qqloBWG
 ghnTnHLXjHXAMpYcIpjpMz+64EkcbcjzYJP1y7rz63ynGm0v2dZMxFJQK9KHW0ivkykX5ddVbD0
 U5HUzp7fUGZ70TGnMAXVbre4jHAZaz1JNDaXm3mQMElqVhR98GHWEVWcNluH0X85QnW3urXunfa
 WyitzUSHFKg4g9GVDoTfn9I6P1+bIp2PZl3gQ4JbH6GebGnVf9nmW5VC/W3/s3qA4DDKiTnf68J
 Vb7c52dTxlpODRUuxVsmkiKcwMA0XmF3IpTUzXnVVYzPdUE/qFmCZ8Uu68G3on4U6oQPCZaPXwn
 ktMQ44MLYoWZWcUArpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116446-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vgde7zbudux7:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74BE670645C

On Fri, Jul 03, 2026 at 12:01:37AM +0530, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a reminder, fixes should come before all other patches.

> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
> index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
> @@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
>  		.parent_data = gpu_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

