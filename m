Return-Path: <linux-arm-msm+bounces-94355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID6uG5bhoGk4nwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:13:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 932AD1B128D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 01:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA7830055E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 00:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EB51E1C02;
	Fri, 27 Feb 2026 00:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5gvzhmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtUAx/eJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897B1DF27F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151186; cv=none; b=JaQ3ofZ4NM2tEqs+ZzkSZZixdj+m5xJc3uliGIgojhL7h01HEvuS3XrY6zK5+7DTcESdHszCmppot96pNGW9ywj//GzJHe2PnCysYY457t1ZD/aT0PsCmTCb8Tb6njmGLTj0EMUTI27uajMhPC2csV1M1j34AkHsoiB7e2RKcNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151186; c=relaxed/simple;
	bh=ZoJ0luas96X91hkPWSbSnwHP8sULaRoJloAEOdcSynU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsgHwVsgpd2S1TWgQulG+zd4a8/s528KzbtsPLf+npWoAS4GuyN3EjPfCnI4LqgnmQCejwB4Z+FUOT58QVDUkvA3UesdoPNg2wDAdjEKLa3XA55uz+73fRgFAUwAZV132KSNXCm8D8mhdIfu1RufzsJn7DR5sqH8iygcxi5KnbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5gvzhmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtUAx/eJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMaZk93279960
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ez1lx7G6CRffeJqKJSqvaQuN
	VhJe+YNXpf7lrt/K510=; b=n5gvzhmOHroL/dMUkIj15h6rVfB26oC8jmn/DgwA
	URYtwgKnAnf8sThlbMHDiWzsux8tYCIh/jmYaJM+08+ena21r5zt/oKk425628bK
	CJ94N3lBmlgqGLEoei7g8JFzJesDB5AL1GrukZFGQmfJAPm3v1K1nFjA0ScsREA2
	+Hsjl0k1UfwVvYm6UdBzIxRh+Nntvf3qYDVZOjW35lWGtpEBH6sIWQOp7NFtzDYj
	vhDINuLcG6HQk6g4SEnoglfP4u6uMcrHlux1pJVcss1Wt9ZwgJbrPrVemAqdvpyz
	dlWNP/HavlbgaLVfGg/3jesMnw/uuppoqv2TPU7uat0LMg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur0xh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:13:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899b12d76adso154255326d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 16:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772151183; x=1772755983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez1lx7G6CRffeJqKJSqvaQuNVhJe+YNXpf7lrt/K510=;
        b=JtUAx/eJ3K+xW5LHeZR9pKTJ045dZqzjMDD7lcYnkSKn6WkSHSI1yTpDU6L3oBDT0J
         wRAFIKZEoDvXXs6NOnMnJESfIfGaK9/NInjmHcd5dXy1E/vXjDGlNzvfGGKUoAxQX0Hs
         S17JvGHZVz2WHBpdnwLwo2Jr+FOAfWTg2uJVwMQR9C6KxfEQHl6zL6x4aEsIfmnpkV+v
         P0KlvzsNpwpSiTYuTDiAvWocp7pKL7vUO8f7U79mAwcWAFgNmX78SxibyCo98LKXA792
         HE80KHaq0pmQSRnemGx1sySUtKSXDWyC1N9yVm1lU4zRz2Dwuz7Gp3wTsZ+hxr7aBqil
         X0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772151183; x=1772755983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez1lx7G6CRffeJqKJSqvaQuNVhJe+YNXpf7lrt/K510=;
        b=ExpLDyyWZJuHIubSGICz7xj4V3dDissRg0vg4P0pWeFTy/41bFpknNJgq3Wme6X9gy
         xYdafK2/Yxgj6za7/p/JbuPDOeTUEjMZrKWVP2MKUQlEiiYYjkKwYzNXXoQJL0Y+JUrv
         85z1vMFolKLL02ckn9svUKU1OnNTT1x0yZ0BcSZ+8q5mkkZ69hSjmvl2o6mO1KF22IvU
         Y5+rSkK2VBrSNSwoQ1zVn17cAVUQJM7Dkz9W6VEehOvjV9LocpHYnvTxGqiTZasfyZ1j
         Qm5lzQcaZ9DEEBv7yRvLUJEGuPiSpvKFIm4urV+gKXORkABWi8d9CeNd52Lb1/722KuU
         GOFA==
X-Forwarded-Encrypted: i=1; AJvYcCUL7+rU0KfDoBgLfAya+wcMRfGUo9PM5BgdD1UHix3+uti4No51fzjSoCl1Lp8GKp/9A7sCZ/h0vpEzvw0v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44B2e91oTyAaxMjxD0yM/HXC0TtZwEdwjecLJsXqPjKnfcaVT
	7SocfjeQCPPNmZ0Wr3TbXCzxry4y9I5fOSPyfKqOQkReEMbX/usoaOcqBoG2LGql/3TQHvGoioe
	+8nM1r4+dqBuI0DPiTGeth40UDtHL11v+A2vFcPkTZq5Czuhoi8K363Hwa3y2rflEfngg
X-Gm-Gg: ATEYQzyCsaZBwfa2dug0TAjPTGYeQzxs2f3LhdkPJRMkNrN3ZpoLfGiDMzq6FdY+c9z
	OsVgoQ8vVqumcxkcxNYhXDBqQrbz8Zf+VOrN3rQ+qDi94/PMT6VzRNFdafA43pMlSXn/76TpDKD
	JTZQ9Y5gy63jbC4tq5KZ1iqZ6x/MXqVqa9xaLOK+yd5/qFpEC6HRygUrzGsA/yC1Ia0RzCFVTki
	PzMEtvU0PnSwVGaxlNi4oTh3KhXtv1Vkt4lzm+NJDIIZYD05hJqSto01jovwKr92AfPnjxKBc7I
	aFa/+RZzOloCoVng3yP4dsujooETPct11KlwzukqoeKjhCTVR8q6zWFS2IAmKFvZloF5ka1epiF
	EsECzLjpqJjHGWp95IoJHEwkxQl3rhwOConxBl7JP/Ef4I6StWlemtnB2G5Ke7Aj4lB6CSLl4wb
	c+zk41ZdI79xYNfYLr/Q/vwQFraZo+4jkdQJM=
X-Received: by 2002:a05:620a:4151:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cbc8d8658amr130611685a.20.1772151183039;
        Thu, 26 Feb 2026 16:13:03 -0800 (PST)
X-Received: by 2002:a05:620a:4151:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cbc8d8658amr130607985a.20.1772151182593;
        Thu, 26 Feb 2026 16:13:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3021eebsm11008631fa.39.2026.02.26.16.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:13:00 -0800 (PST)
Date: Fri, 27 Feb 2026 02:12:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 09/13] clk: qcom: rpmh: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <pzxxshl7l75xawlbbju7p2aoehbsv5tce6yb3rllv3e4fzpond@l7x2tur3i3ih>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-9-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-9-4421dd2f6dc6@redhat.com>
X-Proofpoint-GUID: mX51pl1S-WoYr6PH20-mKIYhPB_-uV3z
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a0e18f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=1r2m-iIbPs-O4eL_W2EA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAwMCBTYWx0ZWRfX9IxHXYWObz9m
 46O8Fhf8jkUEDKaAKul+Wk2Vaa7P2Te/ceuF/2uw6s9NMgpvwOZdvWRlGv0p1T64bP/Nodu9qkJ
 HlyJhXhhfOMBKZz5i3p4MIzUXi9fEqNSAbM4NXStJ1OQlOt+9R/lBPYY8eYP4Y0N1+1wOg+3c6c
 xysp+fMhWzauE7++MC53PJsNYhEnNux6toGVnJjDpnzn2m3imkwrgGYPjHHMTeZPowDfB5nZ9sp
 ufd2REmJ01p1ELzmTRRETLFWaEtuXFJOC7MvPC+SW6blg0O+Q4j6EtSenP/h0PjX+/O1mHqhwbn
 bDPH0CAWoF0ZQEhNC++pVHdLJsFaEt/ghv0hroE7lfyh5gRIR6zNvqwa2W+jGHXxx2215Mce8qk
 u5v0WpgmmGBAEYOYX+1ACphAQI2Brtp0o6yuZ3XSEhK2vXKNEr8ds5UGmL/iqUiHXPSxbw48il1
 iBj3iFS4do7MM/yFfOw==
X-Proofpoint-ORIG-GUID: mX51pl1S-WoYr6PH20-mKIYhPB_-uV3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94355-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 932AD1B128D
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 01:16:53PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-rpmh.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

