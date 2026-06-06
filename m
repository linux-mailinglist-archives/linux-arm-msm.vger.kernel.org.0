Return-Path: <linux-arm-msm+bounces-111485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /nC5F00FJGom1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:32:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBC864D363
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:32:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E+n9r6bn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=emRfwZc6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111485-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111485-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C902300D1D1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D596638C42E;
	Sat,  6 Jun 2026 11:32:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72D3242B0
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:32:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745545; cv=none; b=XTHazDgw/NSjnvbRrKJKJ1PUUO21GCrzAxQUg12/JAC1RaUTGJkz1ZGtnMcC4rsjkaTe3uXy5/F2nKL/GKXZiUhryZA5G1mDk70zZ0radbYelklEl6Xh+fAC23bRXOTg7SlLOpmkioWNR5h+qfnZhTeeAkygnOFoVOHkpEVHb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745545; c=relaxed/simple;
	bh=HaxKgkGgNYx0k9XNSRNrvt/BbgC1++5qnpO6UiN+C4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EW+EXhXsFsupkVgVu6syXb1plm92L6ttk/vVCs9hQJM0epkS2cjr6AZj9Esp8lp3biVlV6qhKswuAtAzLPmIkOmRympXUqy5HfzmwLplSYKgURfox3S4kYRW6Gs2sgfR2RGXxu/squMOpsMJmQyqWo4o9wYxGxVaKMnAl/fNUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+n9r6bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emRfwZc6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BE4jU1258094
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nvXT/1SfUOoEE6ujMaH6turp
	9EtLMNdFzLZalWYo4ww=; b=E+n9r6bnlrP10pod15j20uxn8JcrvuRDXcF69D/x
	c1pRhGk+THtylw4ppFLTU0dfX9GedtgbizGitF3NpYThFJUTTd4FdAEugQ35lQuL
	d0a+aCSxw1wt4iK9eqZ6krc9fQjPz1/Q/ipp/ZN0bSR0+ReyC4iijfaJRLEG/3ke
	Dqtlx0OFr+LOialjOJg+7mw3Uz8eT41oTPx0Ov0yQc6XOkxzYf6MQ3Pgemsa/lzN
	BmU9CBsLsXCLQQ14C2Cyr5ZWpvyhB2/+YUjFFOOWLVoAr0hBh8V0BWmBSgu5jEh9
	t2Ci7CkSZwox7Jl0SVXSMY5PNoCPKEGXqztsnudl6Pg8IA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrs3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:32:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963eeb6f2baso3042079241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745543; x=1781350343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvXT/1SfUOoEE6ujMaH6turp9EtLMNdFzLZalWYo4ww=;
        b=emRfwZc6T1rZ8c+87XzFAEdecTLVQ0zvn/UvNIkNpjg24MQ/d9N8AYjlmoH8i05a/e
         L3voDdESBJosFH4eIwjBkz4mBh0+rP4yzlkRrfFMZpAt9RPYPHqpfGMcLOre4+DAceXq
         UiKCgV4tSzS2IMSGrzvXRppwe0/awXs9W/pZ+qu8IfuY2pUE+ZXnqfmhR6dK38Z0eJl2
         KSY5gSyad8Y4YIaab7o7ajPN3NIZHOiuT8z4ApmAZunPgi8Vti4WupymoLAv0B4lwXGb
         3LzmbzhILi7OoIOcMcr1o1COdLFvKiEqXo1mFATOGl4gYFQT0BYb+jdBRIhblyjP8Oes
         l1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745543; x=1781350343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvXT/1SfUOoEE6ujMaH6turp9EtLMNdFzLZalWYo4ww=;
        b=YBR63MN/9aUUGjjYZluUm7mD3m+NAaGpV/jcGFaRb3Wo8BkhXx+Ba3dMvfMPAoQqHm
         sfcur6HsM/hAhyHf0NfDB8MLCwMaLF9VYvyiopht/bR1rOxxR1ehc+wYpfI/EqkoH1F4
         +BwLKHB5smGHsbAo+iVEIdsWXf7tNUTdEgYmBdepVdjteDPtNoSRWvpPscL9b43gj/yS
         Ev5ddvX0h93QXnyFegSDmoDMK6EoCaDZL84bi8/zWhGYGnue5PkC99OJaNJaW1g1FrbM
         pUBzJLd4qwpPZJ0871tTg6HXH031C9qBiF5Bx8CdpjDBy+8JH/gKjHpRuuRlqGjXjpMb
         NeWQ==
X-Forwarded-Encrypted: i=1; AFNElJ93itgAFDnvw2mbawkJotLzHGA4npkSnUSQ4/Y7aD6ql2qIsaQRhMpzvMYf8SNWYfAX9FJduntwIdwKtfAs@vger.kernel.org
X-Gm-Message-State: AOJu0YydPURWX3+3BPqUd86A85vacOI23BQ3lWadEUDPHDN6WcfvnGLb
	8QI2R6wxCsuIxCO450D02mSTQmN2khiPubDXCRw5Vqk+0K8Fz7EFNw2laRdnvnyQSuuUHOBqw1k
	22qUsUw3990ADwjBmFgpNHr8aNW0ZsYOxejg/bxxDiodst9mhxMnUopW3H/Vib0FGMOdj
X-Gm-Gg: Acq92OFDbaz5JvcxDbujb7iGjqq6JhqZQC5E4cSZZNsManDL/iO2gbuP808QkkJQidT
	DkG/QWakYY8WZBazIldm3L+1OF9X0OmfAFDlSrcD8RVf4A6Ucda1Xx0zFSZBQN91wfmceY8hbAU
	G0QElIzILXA+z6A1Wxa0HB6BEsrX0wIsefgV+2cdSrEw6SjGLqez5IeXvA3TBhRZi4Ojcy6q3iG
	TFSej1L1osOxT6aoY7xiMCvddHdmwsJGLrfElzfGu5JbbLKp3Ilb89ANnahf8z/UdX4Fvmwc4VT
	jp/6L0RAt9llq84PV6CWdhaqtsi9F10Y7lObu8TWqOVyy4QU9FXMJuY3tfIVOoeps0NizYtioa1
	azeFLxbEvjHNOEMju1zPw+iGjWffYvRl1xXN1Z5IaCHvKHVTRvoe6RDsa80QR4u274Glc5gQq4T
	/zLgDvNpm2ZxKHLAVmfM1XlGESwTxrL0aui2lt4OA2rmo7+w==
X-Received: by 2002:a05:6102:304d:b0:638:944a:49a3 with SMTP id ada2fe7eead31-6feff817b15mr4051929137.11.1780745543294;
        Sat, 06 Jun 2026 04:32:23 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:638:944a:49a3 with SMTP id ada2fe7eead31-6feff817b15mr4051910137.11.1780745542847;
        Sat, 06 Jun 2026 04:32:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b985a4esm2372309e87.56.2026.06.06.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:32:20 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:32:18 +0300
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
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and
 sleep clocks to DISPCC node
Message-ID: <6rrerd5boc3x7kwuwatxk53a5dsirjqzndptskwfiyli22ds5s@dvmondtb2mfu>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a240548 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MnNUYsW2gAO4r4gG23sA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: oTieteP8aWbemTlMzhG1ysIT1e7_kKCI
X-Proofpoint-ORIG-GUID: oTieteP8aWbemTlMzhG1ysIT1e7_kKCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfXzIohjCfShQKJ
 v8vVvf3+Q9YTyserb+SkicNwX+0tQtoK1pmSesKg5Md+PFvoVjEUB8yvw9GI6pTFCkEgl7YABba
 O+qwZRWjLq4ykO/Jfnx6VHI23YiJqXnxgB3x76LQNg5bbfJJzKgFKuCeVNRyhvpIZYyUEXCL43/
 kj0BLWsslBu0N95goxf6Bu/U6qret4X+xHrGnW/WUEvbdsAkO4mSMe95hqRAEuQbQQjnzhit1in
 fyo93TwUeqOnZOoBLEupmxlDxk8urFj+F6vRl6aolSOk+XKhvxNUqWrD8hymZu0yBBltZbiJddT
 VLaQxoI5IhV5B9Pd0wQMs6zeECjyUHrDKSu5zDRFYSjvYn7Gxp0ZlhXUQrwXyNnR0u4Jyj5nl9E
 w8Z6VvTh6vek8srlO+DopYb2Rhdg4YakWvXROQBmaAImE3bl2r1UkuqCsFxHCoujlHM6H6voucA
 L8/swqciRiZ3rdDNuPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111485-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEBC864D363

On Thu, Jun 04, 2026 at 10:56:18AM +0530, Imran Shaik wrote:
> Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

