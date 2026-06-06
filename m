Return-Path: <linux-arm-msm+bounces-111480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2mJsDC4EJGrD1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:27:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 857DF64D323
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:27:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OoDMoWSa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FsuxzjfK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111480-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111480-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B7B83010C27
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56136389E13;
	Sat,  6 Jun 2026 11:27:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B27138887D
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:27:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745232; cv=none; b=IHckGbgsMF3f37/s1mtCq50RBOcl2Eqwz9YZSDNKGdR3894BuyY2FTvCi+kZu4edXy+bbH5GiV2NQ3LX/ruP4BG77trW4qSWI3uwyVV1n4awej6ClfPo4BNFpuVdmhBuD+o6ZuczZnCvQFc8HVDqihCuSci+KP9JYVgbTtD1EYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745232; c=relaxed/simple;
	bh=FdVULs37rn10bkN8n51cMn1RVuRA7F78VvXYpWTSit0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dErq3Q2hl9kyxEMnsbzzSwMCM12x8fmxvF9J1XvdLvyFio7RdGUGUprtZUxbjyNxomCra0ks/bAuOKF2h7qvbhcwicX4SjZUR5/HJAWNdEXgAUeNMiPdN1RtJFgjRXRCCUa/F/KwrTCCAaEmSWmKwFq/QWi3cyQqQkic2Cqv+Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoDMoWSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsuxzjfK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BDaxt1256797
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8WOWvEFcDyV3Cr6kRzEoTtPQ
	IWhythJtxxOpwTuHVI8=; b=OoDMoWSavCeT5ZKWTo+bxdyH5c8Rp8eiOHTjJh0v
	pff5Pd/yKd/sP7VN6TuulodNOTKHskwVXACx4jmCwqYnE1krAdexUyYU2ra+7Z1r
	UKiMDh/Cvunr4NyjauTssUYsG4DrmJMOfvKP2EvNwAhNCuy8bDqIY8RcAxn84qY2
	JDZ9Z5wsAqhYttBMyupdIYDtfKXeXIcE/x5AtFBs+bAWLdsaE0GW5uv2NQwX0ydM
	mw+XA/EBJoGl5ep814f6uwyWqRoOTrKS1UAFCDVgB1K9lENwNRErNuRiaI0knb85
	92WDiT/B7kQGGTRc9o/NRMlzm1ZmRYwlxi2A3P7+PDiZMg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrru2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:27:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-96395e5f46cso2926383241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745229; x=1781350029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8WOWvEFcDyV3Cr6kRzEoTtPQIWhythJtxxOpwTuHVI8=;
        b=FsuxzjfKPa9ClK/muHTxjsLwHDT6/ZoTSs2LoEyxbbnAGrRZFCljAc2OvE+qyiZOX6
         Dt5mzt7tRNU03IMEzUNbwxM+eKcqq2DF7VqubYUsJ9ZOmxkFa0ucqiwV6jhFQw5o36Ye
         TP/s/begfRPvTQWwscpsKpjT3ZuZ3G++jQ7gS3+Gf42vZkzYBVeH8XyGYFf3ZH7LM2zi
         wKHK+fRzJb3js01MSk5VbyB1j+pje2Rb8Q12mfYIYZttGJ5fGjfvxHS/o3F8fhh730Dt
         jGNGzSFmOcCVc+Vwh++2ybo7++ydYtI3wwJ5mOgLBStrMYm/9jp8H4xuciNKI5Ra6yGW
         THDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745229; x=1781350029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WOWvEFcDyV3Cr6kRzEoTtPQIWhythJtxxOpwTuHVI8=;
        b=fsS6daJn1woWRjxnSqzR0Q5/hDuF4XESI/qLpMd1UOi8WRvX1d6ug8G4th0Cx6YaKh
         oj3GkqHS45k3HecvhcVG8GJXvgxOVSkNQaD8QG4uN4lAk/pa1GtSoJ/VNnbXzvBrUx6M
         vJ+1/dmwtxzmnjwqye9JdXDsYTuFz4F8uufp9D6wxELzNryLup8dj82Hd7Ttpzcpxtju
         JdigFbFujykHuYFJSbn506r8QoQZ9Z2cfXnLi8Ecxc9duJ2JQ1ayaYh8o1OhOd3s/nmL
         tlqW2VE118dQTOXu5Wy9hVj6LptA000HpO1qZhQB3Z5QTeT+p0iLKp4qa65sTO1Yy07J
         sopw==
X-Forwarded-Encrypted: i=1; AFNElJ/EI4U4nfctTk7VvWtDy+p+nDOyh0CEflDryaH6iyEbfByOvmSbVNt7Jom9O62KWDQtAjZpdDlqvor+Hfeg@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7vORXtULyII8RwESjJFYNPNeBfzzaf8o8jIk4wAyL3lfLoAe
	LMNBptcnJ7Do7bNgoX3kdlXqjjxCn2dzBCCFWygrhz0BcQuEAgH/2xKF9BrEjSASPB1WhoUlF4f
	B6yB/8dw2VwjrIAFOnsYBDPQZP234WS9FrqWvdoQJhTJD6EtK7K1XVJWaZrr5sgLiNmBA
X-Gm-Gg: Acq92OGdTzL+tEJZ+VfynlC5a7L23tcT4l/N4F+rEiLMMBU0cRVVMa+jb8AfNL9ZmhF
	qLG/Y0i47atiGCcNrjko5ichF4+od8cAs0yg0M6SAmaYrNwh8e3PvG9sU63rbZ3byTMpPrZuqYB
	+9ROLu6/Dgb68fgAs1inykfD8OrKPZRrzfcGAOOG4VUDQ5xzXyV3D/36Ru42lE4wqlJPYwTmklX
	z9X7daTtXRGDPg6f6F0Ki/V2/aeEQS+qWrpCmXLsdd8dok7A0iq1LGAu1tSzd757FpEh0XBLYmo
	dSchxHrqptLuXz9Gv/pAlmFP/F/CnQ/UldIRMlGDI1VuVSECTURa+gRqpxiriQkWMSKByhp5YuU
	5A2EDdf49UEsKV8V9qb3rgsiwgS7BcR37p6Y6z/ly3h55FA369YYf5RtyBz6Oqf3O8RT4937h3u
	KbSqIHaGGihR6K8fdSGJcJrKaKT69/3Keugn6EiTg0LAtk2g==
X-Received: by 2002:a05:6102:390f:b0:633:944a:4607 with SMTP id ada2fe7eead31-6fef853203dmr3956437137.15.1780745229387;
        Sat, 06 Jun 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:b0:633:944a:4607 with SMTP id ada2fe7eead31-6fef853203dmr3956428137.15.1780745228991;
        Sat, 06 Jun 2026 04:27:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm2372753e87.69.2026.06.06.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:27:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:27:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/13] clk: qcom: dispcc-qcm2290: Update GDSC
 *wait_val values and flags
Message-ID: <66iobdkznpqqy7twf4fhu33m7mclnndlrjc4urt2em6tfe6gp4@r7wd2gnzsjoa>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-7-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a24040e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=fySNQAJ5CXMXns773n8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: J_YHfsrJs-Rl6rrYOtcnP5wJC1WjaM6v
X-Proofpoint-ORIG-GUID: J_YHfsrJs-Rl6rrYOtcnP5wJC1WjaM6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMyBTYWx0ZWRfX0U7dqDi6f0yc
 S9ZzhGEYkXWvHVEQcthWLR677WKNK3ZPUJZC/oytJk2aEYsNqHW8bxNNqXbJ6Y9Tt+C5TRoaxt0
 4Qw5LRZ8P4YE5fdJoysM6uO2v0Ya7TEFIRal6WWQWP6Oe9aY7/L+1QJX/8IZkJSqd5+L/uUBeMq
 jZ9C/+RUfPxZo+eevhfUXziQaMfYmbMnkgRBPe3ApasEzNJQQOU2m58tYuSVvwUfdvTvK5fdR8d
 dgK1aPPXKtAUZ7P250YFqIq9CKv4Do4KOVZCZlI6xr0Up8LmfNe5wFJ1aiRzQoF5iaUenha2uDj
 YDfvv36KlP7UTtvt3Bj6JiS/xUTeEkv6s8Z5fFC/ar4AwqV1wvW0prMEGDxLa/HiZLbzmxbCxxV
 nd9is0/DqWqryraEKGjUZaqwYpu/lk/ssEOEcNOZ1ReS8j5V86PqYTtX1nrUYlMsaswPXwOUd+S
 sg48Zs2Mybvoj0M8eLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060113
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111480-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,r7wd2gnzsjoa:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 857DF64D323

On Thu, Jun 04, 2026 at 10:56:13AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC GDSC wait_val fields to match the hardware
> default values. Incorrect settings can cause the GDSC FSM to stuck,
> leading to power on/off failures. And update GDSC flags to retain the
> registers, and poll for the CFG GDSCR, and switch between HW/SW mode
> dynamically as per the latest convention.

Too many ands for one patch. Zero explanation (other than 'latest
convention'. Which convention? The flags describe hardware behaviour,
not conventions).

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index f5dbd19d0a0334362a44f91a69229cb0f018f309..4c1eef79f41b6907fe79f2b18bcb5f6160c74a43 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -468,11 +468,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x3000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>  };
>  
>  static struct gdsc *disp_cc_qcm2290_gdscs[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

