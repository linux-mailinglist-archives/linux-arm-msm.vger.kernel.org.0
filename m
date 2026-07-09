Return-Path: <linux-arm-msm+bounces-117948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6EVoMxJ8T2q7hwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB972FD44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oO+PeiCG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WFUkoin/";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117948-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117948-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C54D30C35F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 10:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D64403B16;
	Thu,  9 Jul 2026 10:28:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22473FE67B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 10:28:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592890; cv=none; b=URy8THeJDBMmUAnPDUwwbOyRf91aG8jETKLd/ph1m4Q+NoTGN+dI4ASPZpEWFhVSkQNaRJpfVWhO1TORfMDG3ML1m5N1TEWi5+gv8n26E6EXQkyyXK9Uc0zo6KiE4K+IMnrL+rbcCy92eZA1jxIQ4N56XPNFN45de+j23MTB5Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592890; c=relaxed/simple;
	bh=pqexknD8on3L3GLefZ+md4dIoKVfLl+/H00x1fJ83kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyVVTJEkuxUmEGVjETymiv7tF23Az0qOir3T2Mt8IZHI0aZyLaiqJQw5/ldO0UtHhpo+atJkfvSWRI2M+uoFP+wRicryPUfjcE2I8AGY3UUerdNKuHsip+YsqflFsOawweoo9SZxUKaBLn814t1tHWoXecqFFiAjsSwDe4E35tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oO+PeiCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFUkoin/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AO2jf1495522
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 10:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=igZX3grvnhIhD3DQIxHwSmvF
	05FX0mYhoyqwIQDOVzw=; b=oO+PeiCGNkYPCX+jneQZkVQIZo9jE9Fgo/BQ0iWd
	tUJFhExJvFPEGsBpvr4BWhUuPjU3bTGUhDlv6btmnHoA3Ryz//EDBeOX9gPFNI/R
	wiNQt1+LRpY7Oo5aUQlfPTSdXGOnVkF7U8LqzK2r5BZ+eN6SXSaopqprTCsfNrJm
	LPeNVn57uKRw+5f9pMyVdYeOubBHSfyVudp8S4o5shgaG1ku9pHhIbsWjPZYwofU
	RmHgZUuXG9qGyyPbIurMDBgAJ8wAe/3TKoeyjWLw562qlemKluhUHSxvSyIqh3kc
	E0ToRELBul8v+NaLdPo+c6KSkr7MOfZ1n0j3Yt0WntYeAA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvu4wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:28:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-745031889b5so107143137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592887; x=1784197687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=igZX3grvnhIhD3DQIxHwSmvF05FX0mYhoyqwIQDOVzw=;
        b=WFUkoin/Pi4JKblc48tvV/Dqro30dfU/fbzzTWeOCE+Poy7zPMpM32XVGduoiUD+p8
         XAJv9loNkq5rbuYgJFdL8MyVwf42ukE90wy3gEfzZwoQezfG0xuhGJJ3HLlI+6VeTS0w
         gxrRqPBJB8FezOnUeQVTt5ZDBOoMcOXZPOxloPGgrVeEjM9oCBie0f6yKYi9uQELChop
         bDBn6GBvnhVxS7cc/l1U5J6/E686YKGqGevtKLYJpq7qT+8noB2Ina8bBEB710awej73
         AqxWrZNAXILRpcUP7hB1hEA1c20+L4qHrz37zF63bjnzTvrGF0RzansqmNYWWBlMMJMZ
         VoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592887; x=1784197687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igZX3grvnhIhD3DQIxHwSmvF05FX0mYhoyqwIQDOVzw=;
        b=QIfhczfYaVW95Ch6/9ZzWXxFPyMn3xi2COQTuDO1iQPDoDUSInuJK33ENXGHMq3CRy
         N3fn6XjO/DuoSlkYDlsWvJHBEB8Kz7ANgZSRc2F+ok0P1O/QjM/zSipxMXnk62qu9/U+
         9eZzNz1RCEG7KC/AKY59ZxoIrD5jJ2AFT4MkAzyaGnBX+fdpCnb53K9+0oUsTrZ5OshN
         6Ulhx1q+Rfb5A5pWDQjne+Jd3yTxtpbn7sSAXRUZbuDDAaQmf/bK6UUY5qW4eGXo9Q8p
         lgvHZKAtqpcjgf9tkIJm+aussB99aao83lX+gx+83Lmdk2kCW1k8IuA8XAey0wU26oUH
         z1Ig==
X-Forwarded-Encrypted: i=1; AHgh+RpVZwFSLpUqkhpz8+q2CLJ2/Ip622INGHXYm/KKK4ARINyet/YBL+bDJ5LVYNXbGoE+Q3PAK3VDJQSFB21W@vger.kernel.org
X-Gm-Message-State: AOJu0YyYodhrhu/yxsQzN5/7IMzRP0lipllWCyCrm9KeMrbgDlkx94lQ
	DDKfv/SPinkCw37SGVbpuV3PE7uvVBnYjthPx5NLf1EBzeOtmh7Bov7ivVtrv3/mDfNRrrjaJhP
	tMcW1QsdjGPzqAXCf/km+GXa6HNQYgmn/xtCt1NdGWtNP/G6gGa5TnjJAFNLybjAfan8e
X-Gm-Gg: AfdE7ckbMux7OAPVMMpajZ99p2cYbWP73Px7yXn0v/TtyMLmLZ7qqfNNKx2HPK2evdh
	Buv29C06hWAaO6synVUOYWIxp3OImVRqPp9Qw90zw78DC+5MBN82n+9n2imVTWPik9vL1JgZzQ9
	j94NIZnW22sbjfOacE1CapzZitJc2QqY71diVW2bkG/2CIQB7DJcaD4RAOJPhYGuqCRT4Nl4ejy
	AfnUJGLFOI6fRXnIvLqec/sl7gQHZAH9nDx4q08jPQPI4b7elC/fiS4Z6qCTJE1Ah1UyhmjOD3w
	QJlvxGHICHROHSC/E0B1Oo0wt+8OBdrKmnu425CLtRm/1d5C/Of3VHPSpFjgWPjNBEL3UrXd7Z2
	dN0wO3t8P8kskxsje73pPi9w4A9Jn4gZv0fMSpk4YC1ldIjFyg90AUEqLrMJEl9oDnlH5ZiYvA5
	uY7CEykPea0800tZCToF9vgUiA
X-Received: by 2002:a05:6102:b02:b0:73e:5068:823d with SMTP id ada2fe7eead31-744e0010e3emr3884183137.18.1783592887014;
        Thu, 09 Jul 2026 03:28:07 -0700 (PDT)
X-Received: by 2002:a05:6102:b02:b0:73e:5068:823d with SMTP id ada2fe7eead31-744e0010e3emr3884169137.18.1783592886502;
        Thu, 09 Jul 2026 03:28:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13839ccsm5186335e87.37.2026.07.09.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:28:05 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:28:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Message-ID: <ptdrtaeza6f2la6q6572nugz7jaeh646no5dc66vkrrjywj2vs@7nu5vusyxtcm>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-1-b320d822cdd0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX8c+YNr+jmmhT
 in7y0FRoYPJ9gvm98wvfjZs2fJ2XLfKKG6qnHmTvomGFbJX1s+ExFLa2fUweSrLCV4k7fkYDSox
 6004/jBPNLMsiUvMZo7BmZFFJLy9vjU=
X-Proofpoint-GUID: C5BVaF0HY-_XkA37FwjOyZ54bQgYx4bH
X-Proofpoint-ORIG-GUID: C5BVaF0HY-_XkA37FwjOyZ54bQgYx4bH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX26s7XuansH3g
 d8wUVeMlnJQkFOUvANxl0Ncss5LKYXdj0AyErQRIqKjoOYlOOgCU4fThM+D3GNB0R4FY06oZu/D
 icJ+HnbJAsNMqnt8DT+crB6f6cR+d6Vcu9Ve/nMDdvfXUECYlaGCVeXebZbxCptMKWNvJx93+m9
 7+JsxXyw6v8gNJP8tEuagQFgNj+iPVjHXtO6vnbrJ5oXb4Z6NPIZWviwdC6IBko4NLbKNdLaLyc
 /lPewM4VWD92sVDQKXc7dF2wpQVvtKFFFMnDQEtABm7L3S2cvs478ZKly6NcW9IbMQDTH89f0X+
 zewIr3qEA2DOtKma/RuYNcda9j53x8gWDyC2SAg0fAFnlNLmJn1MDmHE9dhGtHLqZwc/U9Cjmli
 juJQoUoy9AMedugMhbNPCTsmt5UUvbNzG+PQGG/RULbLEKlpYQ5Ik1XFlpmdAXictdjiyPhtwQs
 Ea+oinSFXp8Yde9mLRQ==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f77b7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=s18ixZmPgrtx1irfEwkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117948-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3FB972FD44

On Wed, Jul 08, 2026 at 11:55:05PM +0530, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

