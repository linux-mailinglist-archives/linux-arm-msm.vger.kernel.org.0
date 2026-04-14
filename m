Return-Path: <linux-arm-msm+bounces-103017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP4nN76W3WkmgQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C03F4C5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 03:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799683035D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 01:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61882C11DF;
	Tue, 14 Apr 2026 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyaN0o2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBEty+Ly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B67283C87
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776129722; cv=none; b=PCRsOHOMSxLnaB4qkEwUTpcnxh+Cv5QWjHiefEcHC0LcQRrL2rYkfEpdTSSZow/OnixP2wcMyWTxX76JqBacRjMc0/AQeFxQ92CZAy4Xb/BUgyPsdgb0sKG3nlrdLzBq1BUAvWfElZO9o6n7zSQ7Rmqp60qMBMBetD+gKts99QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776129722; c=relaxed/simple;
	bh=r3rYPLi70tuJoeiRujhGKOn0b2ylCb68vrqRMODmu2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhH+u8o4JnwEQGIAH6H3JB+6LX/WlAKNIdSCptGUa7RJmF0joT/6eSmrhVYq5aN9F2h8GfPf9DiOWLQ8xYwnSjaxj0qp3PRY71nUy0xcI+pq/ss/4SOSitIdrkpunb+v+ruutN9InyPxLHJQ7YIdKBieZ69DQKIU7UtOx7DdEp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyaN0o2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBEty+Ly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCap3967284
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=13j0lIg+3hXQ0BsIWq8S4CZg
	qftpQKo8hNJognO8YVM=; b=PyaN0o2RAxpg1GTVdj/uzS35I2rmsOCCp/08M2kE
	X/MHl+pt5qpz2RI/8e8jObMd01R1A+M5/yyLL+i6LNg3hwBv9zwmtjguO0cOjrQ9
	uQ5QQ3/FRF/qRLLzPKtDY3kkh1M/CK9k7lIYhTqJCO1EudBTXybvW/JDsfzEqNrs
	YRgyAq9Qbrii1cJuUlwsF5/67aWFytW4lBg+3GoDvkhPNxDNpEAnfaPN7TsibPq3
	UVdCz27urSuVVnwEmQyZzlQRgwLyVf1NtBUzztHyI6jsVQcHTdisRqHwmSDlxE8g
	CESQlp82e7T+diarfN3hYsoZmdP1X0XXotRvFLzBn/p/8g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v0gre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:22:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127876be621so4322129c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776129719; x=1776734519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13j0lIg+3hXQ0BsIWq8S4CZgqftpQKo8hNJognO8YVM=;
        b=MBEty+LygAWjsyActlic5tZw45MUwL6fVp4aOA1SouORS2bW2WSAr07oIUnSUQYV8y
         nuND//ubuBGlGG9FLdFQDy4zBiIoF/pKEHHmjkdskKJSA6ZI/ErIjaDsGASPnmbe11Lt
         0jLJmIMhdK8oTjv9tsKj1ngpGM/gyp3RS5bnZRn87XWz5U5Y8p34KxV+vyY0uUlanDsq
         ZnujxaFzJKFkiIyNKVwIHR2raL9Xj5fKoZZcr1X5fP0AaP09XpaGGDvtlBDyjMjgUcU8
         VYz7FpMzl4WCCJ2Ofd+S1PSjZ1hShEnga7RBAzSFjcpYQ0Ie/m5U1Q1XFHC5EsxOBVgx
         iAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776129719; x=1776734519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13j0lIg+3hXQ0BsIWq8S4CZgqftpQKo8hNJognO8YVM=;
        b=N9a7nNuYv+OkOpUTayv93OTAxMm9NREqpFbd/zaClXQU+WpSpvbKd6fBGltDEKZJlT
         1jrnvvV8zdE9pcGFRyWa4LExe8QWqEMtK9Aeq4tkMHYN9I+nXCXTaj8WXphv+28eU1EP
         oEHG9W6tkZvBVfTcs0OWYHRms/p4pAGBNusU9cTsfSDlg0TiRrTf/YPGafS0q81oGdPB
         bIqT5ix6aijBihhLR27KDgmzr4eQgUrADZHlzud+D3OP07q9F6VAGNhPVKqWhgSN1t2x
         s0zpHdEKVcOOegY+10HAXKYGXzX1t5SZqSOYmIsr8s3vN0lFWXZSb6AM3ToRjiq4NRgI
         WdmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t41lnpFG9JUX9Pdt4oos44paKKYLiFAvGKtrkmMiF4ZjUoMStq7U1agR4e9D4/69lHugBiZgCQCA2Cvws@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yEiR5DA1cxVUi1a/Bd2FNBgkmjrqs1XKES1LlQ7xdIj0pXyy
	iTH6EUB0h7/GMrWYqzP3S5np0icv23j4f9nROGC6XNbNIK0HalVJPS+DCrmyOUwqSvZXnLN8D1x
	NgRCDnv4NoEKMFhzBBKhJsBi0QeLWKMZS9DguwH9B+RV+oIMc8WmJWQoV9v5LO9fGZUGc
X-Gm-Gg: AeBDiesNfN3R7NlB56cVdia0aHxj6Ws8HhlCNBs+21akNxYPAy1yQQBC4C0Ho8f9F3r
	/Ri37EV3bA7NaTMwjpz1qUkQA+5stXJ/l4vWX3kZbH6bPKifPzvOgMa5fNz0NOOvm8w7YLgh9Y7
	EVA+IC4MogtkHw/Q5UnbD9LZPUcLbmbLpjpm2Gk5VGvJRDiKrk1PoqJztj6+lMvW7JOenWKmDs2
	5B6F6A8Ct0yMlNORnJoYVhA8cKvPEJCGaFaOx9XkB1soJ+rLB9MTDjvM7z6wNLG+Cn8m7dEpvNb
	xaHvWJNll0E8sibDsFPb4LgqACNG86sUp+fStNS6MHG6hVJ2XRPWn6uoxmzmGkeP2T8oCkWgP8q
	fTLhkarVxCX6fzfLMhICtPIl5zPaCGcMDuNaU8wT9nbzX+l6Ge+TMvRPKxAuiOOGM
X-Received: by 2002:a05:7022:1298:b0:12c:41ec:8303 with SMTP id a92af1059eb24-12c41ec8574mr3122425c88.9.1776129719127;
        Mon, 13 Apr 2026 18:21:59 -0700 (PDT)
X-Received: by 2002:a05:7022:1298:b0:12c:41ec:8303 with SMTP id a92af1059eb24-12c41ec8574mr3122412c88.9.1776129718577;
        Mon, 13 Apr 2026 18:21:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb162sm15588660c88.11.2026.04.13.18.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:21:58 -0700 (PDT)
Date: Tue, 14 Apr 2026 09:21:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAwOSBTYWx0ZWRfX4oXT9tCZ6Z/I
 UnSiFqOJeWfxDHO/SotP+R5BrORQctZu0C7nOfVM5qwfjb69xq/X/FTVWKzbXYpLkf6oTCf+7rO
 I4nTlOi0Ye6fmc295sZojqGTFhmxxp9q0hxhulTXpxpVXFDHCTfqeS4d8H7WimzG6VXf26vi/tt
 R8gT96B8zxKwSwX4OJIo9uTlAwmCjJkOOJ1VSfKYLQwHpEV7Jbrj/wEVG12Q/zV1XYZjV472oiN
 wBcbA+yPXlASh+f9sC9kWIoc4MdpysFfV75udQVfRr6xqxT3dSrsEmLBtHClNcgpjmbHc/u9asG
 tKw7a38Kaq6zdJy4tAPeNH5fVw5IaoHbbUlidxWIxZjHREkX7jt0eH8AeDcdEeejaH1WbfcsGOi
 VgEbMh77zFX4M2dsyvmK6Gx2yRMFcjeFXVkYc6S3EHqAFXyMc9rjrjj3EcDAma1X0YmFg7ywaO7
 WRDZ2DHn4J3ZdbuFpiA==
X-Proofpoint-ORIG-GUID: JlpmCpEl0SjznDIaFnE0SApG82LrUyDs
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69dd96b8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Veb1keqY2PKJT9AQ_SgA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: JlpmCpEl0SjznDIaFnE0SApG82LrUyDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140009
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103017-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D9C03F4C5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2026 16:34, Shawn Guo wrote:
> > In short, there will be Nord DTS using the binding coming, and I do not
> 
> Maybe there will, maybe there will not.
> 
> > think posting them at the same time should be a requirement.
> 
> Well, it is a requirement as I explained previously, said that
> *multiple* times on the mailing list, documented expectations in
> mentioned/linked email threads.

To be honest, I can only read the following from mentioned email
threads.

 - Binding and DTS should be organized in separate series per subsystem
 - DTS should reference binding series by a lore link

These are what I'm trying to do, and I'm not just posting DTS
simultaneously.  I do not really read the requirement of posting
binding and DTS using it simultaneously from the email threads.

Taking a step back, even if the requirement is mentioned in an email
thread like this one, I'm not sure it's the correct or well received
way to define a requirement.  And that might be why you had to keep
repeating yourself.

> It's also documented in submitting
> patches in DT (although not with that strong wording).

Either I'm blind or reading the wrong document.  I failed to find
the requirement of posting binding and DTS using it simultaneously
in Documentation/devicetree/bindings/submitting-patches.rst.  Could you
point it out explicitly?

Shawn

