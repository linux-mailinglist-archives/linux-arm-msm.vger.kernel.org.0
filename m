Return-Path: <linux-arm-msm+bounces-116447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x1lMFjBTSGompAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:26:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A536C70646B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:26:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mnuz4L13;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FNdTXdzA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116447-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116447-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93F05302F5A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BF21D89EF;
	Sat,  4 Jul 2026 00:24:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E463C7262B
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:24:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124654; cv=none; b=nEmn4yilOinKXpblM/t+/R1vgWgadB8RESKIVpWvn2e+VsmhMuEiZuGZ47dT/1fB+9GC259Y2il0o5b2uxInbLfhKMVFp5Aw4d8Y1IffA7R25/FX8krm8UbgGEcmBN82YgTszQhlZGwU786fgS/TPpDo92pmqbOGV85cYr/54EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124654; c=relaxed/simple;
	bh=Q8XLJVd31a4uqkHo70kNzZRqRedRGi5J3rgHb1sVHik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erM0sCrwViwXYPmgWrzXBUTRAHt0j5Rv0fbkcR7FOEGUmcSFC0CpNgtebQUplxCbe7hsCXsMuvrUPvy/aztLa6mqD5gZYVWBWKF25BdtJaOR9UItvg8xPw49CP3jFmiEanAWUyyht+6L1gl0AiSVJfJQfElIbRgNXq3A2h2SAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mnuz4L13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNdTXdzA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQJs9839027
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPghQLxdklXsOaeUo28LNs4A
	s5M6v+8qzGSOyFIOr2g=; b=Mnuz4L131ip0X9LCSp5EOrMgvlOpNVwG/jCPeEYy
	geRG8JB5Vre37VsjEuFIsH5+Ccd7zuozj+nwSaiupWKRLxdz/2YdfZjXCSgqYovh
	Ly+DYYoVFF93p8CMHcBRD3UAxKKUBSg59MnwDVEcDEN28xfLIhbfrQeAE3EKKvUQ
	PD53jQY2pG+LKAbSZxrkw5/6BH9D9GsBidQ2b3nPGY2JUDo6ugjsLLStCkksSQsy
	BeZ1KwhDI6cft29phBT71qjB4uLQV9YIEwEu6HjIP600bV0Kjmoje8vVZIhfjhqI
	OBYO4MrOJa8PSRSW3cri9gmG6zkZvCmIBi5iSABHCiUF8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu64j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:24:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5740so117903785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124651; x=1783729451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPghQLxdklXsOaeUo28LNs4As5M6v+8qzGSOyFIOr2g=;
        b=FNdTXdzAIdFGFoTlqsVdXB1Al1/2FjW5/gBNweFaV3XX+N7mc/kyZfozOkU5NTDqOD
         Ia2f7fVAwwMJMRkumur3kajtXnL0Yvpr/IO9m4XzfyJZH0xSfl7jSRSdhPbWIAIPsMTf
         m8nQERleZ83n2FC8DWPpQj5JOZWRL5G1UKCnLyK+DHDprzcVAQkQuP1DBuiVj2+OP+lQ
         kTvefQJKsIDKkSozRSdbMZwM1oR2478Dt7m7jRTcPop8LgWVH8dOff8ASbaWdhrxkVSE
         I2xvcffdV5eNLK9BWnNOjNlxnEvY5PslFIOwtjnY9Nyj/VybpIby3i+DSXnm6dV2qBYx
         FYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124651; x=1783729451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPghQLxdklXsOaeUo28LNs4As5M6v+8qzGSOyFIOr2g=;
        b=Mp4F9ZU0SUb2eE+UPowZpwuHvqrPPcdDRcy0+0qI+4IbuM0AfxxN77tTXRDo1ZMMXx
         81ml4Lh87e1q0tLhoZa5hGPjrPrb3romHiGXCG/V2myE4mcYn4ws5XshJGKnPIMydw+U
         OHUR2x1m/CvE8apmUIsivvQocy5l+7Lcl6vSueyeiJQLajJCguQnpFRBb6I3oDkO31br
         bAzIX+tavh/9/psVG6rKXMPINxaEcdqHtbGduGTDD7sPECDLg+wFcaSKzr7hJfsHWej3
         la3wOjKy5Ij+pbz1Z0NBOLLDTxBih/K7L644dAc9H8RExwXYtpdURISkkeAfO2DFr84Q
         wE8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+0VHl2A4qbgkC64E3H27/9vfBtIOsOcB3qY6cB4AzZZVCi2eJofE2CzAaEu4wFPg3KrAXIonwHDrrhcmcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxElCd2e8D6VKDmCiRre8j+imnJEGHzkkX/CnibPbjwSXpg8Il4
	EwOFblJwtfZTaKxLuFIEnbDU6KQMyxuYy00pbRGiVmlhnHtfkcefYgMWeRPRq/A8WDDXXRE0Xw1
	poxC/XAp1Hv6f8/BupP21aikpmlzKjWzc8hp7JGUVIAWVL9MKjXYIQsOmh2FIBcCbvwp7
X-Gm-Gg: AfdE7ckuE3jBw/eSjmTK7tyZ7dhw5QagLVhpY2LSluXyNfTZIGlU9ks/YJ0SjZEtST7
	IL2hpCi0cIwRSYWsfgfeYKa3WgbEsaCrPdXQD7KuqKdFey0mNM2qmrTt9EbDzNUgCTs9MBji5vE
	hY2gMh9CQM+S4V2iFyOp6E5YwoH12qXJrDq9690z5Bni3cpsk8riJxWZda8h6yCsqsf9oYkIaVB
	qeqEH3saX1iSoKnNerYv0Dcaiwrc7L+fCng7UDJgqH9sa2k8aoxJ4CXplfCBORcdU2rR4GB/RaF
	94SXioWli7SIyWb2dnvWk8pIT1NZCc8V0RVM81hQEKWDBG/IAzRWXIBIAXseFlu5OH9QPPt9SXP
	Lrk1tH7eKb+izJsHZM0fqMv87mCnnyB6rmHz8CKyPpEZqlOVSI55wtvS+dLX1QWMlcD6e2Q94HI
	vVIglZrK8ODZbkfNpMby382u2C
X-Received: by 2002:a05:620a:4626:b0:92b:67e6:8ac9 with SMTP id af79cd13be357-92e9a52bdcfmr234719685a.67.1783124651342;
        Fri, 03 Jul 2026 17:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4626:b0:92b:67e6:8ac9 with SMTP id af79cd13be357-92e9a52bdcfmr234714185a.67.1783124650766;
        Fri, 03 Jul 2026 17:24:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm870438e87.41.2026.07.03.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:24:09 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:24:06 +0300
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
Subject: Re: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Message-ID: <4pbaiqofyb7jhujnftyog4idm3gu74kdwvrzod66zmtj4dbxa7@dovnrielmv3z>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX20oKSm4cuhl4
 TYWiu3Yg0tPAW+Xqv2VS/clmR15SfYXcsGhswSeU7x0hJGVFVfcM6p5WJVRo8gmvKbV7ZI6VlmP
 XFTsx0v1hOosnj5ENl6hxk5E4gUOemaB05fjoVFRSq0AN/9Cny0cu/N8j/oZCRDTd6r+n+oXRwg
 yLVc7yKj+ZozZo/6cMRr8AJqRhohR0CTBxcTq4CpDbbRrtGM0oWaXgNSy25PpOdRS2Oc9z650Kk
 gTLkhfs+omYgp5ctZYPO/sBwGQ+jh4PputEJeYXywpM7QbZKgdHHqgYjKiA9Av1NDJv/0O9qOzY
 v8SzDCFSzokmN8EKm67lCNffaVRpC9WGI8gayzmK2ELHFa+oWknLTBiJ7BwlzFxk35ThEvLDWRm
 SVe1R3jVbxNUhUWmILSXsI6XEVCcSs7JxvaXZAqzwzHuRR1mJPbleOomVr7ixUTYX6WFiZtJOuR
 O737QOQNawAd03IcLMQ==
X-Proofpoint-GUID: djFdyQp26tMlAhIB2YMHkm5r5qD0jQtG
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4852ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QOFLiwY2CebeDMEKwNAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: djFdyQp26tMlAhIB2YMHkm5r5qD0jQtG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX/MQm/+B/3g0L
 tFIM4QzrIRSyt6f8RnNgDPM1VI/EvOffnTWUh3nYcjqN8n0iGPuD9Ie4Gh5xddhY23vXA1i73Eo
 0yTmg9VaiHHGBOuG3suhiRjcbofTb5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
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
	TAGGED_FROM(0.00)[bounces-116447-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,dovnrielmv3z:mid];
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
X-Rspamd-Queue-Id: A536C70646B

On Fri, Jul 03, 2026 at 12:01:40AM +0530, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with CX rail.
> This is to ensure the genpd performance state votes on GDSC the to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

