Return-Path: <linux-arm-msm+bounces-93571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCNjN/+sm2k84gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 02:27:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13E171514
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 02:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 983273019830
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 01:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32081D5CC9;
	Mon, 23 Feb 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNS9gO64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbOpltJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FD18C332
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771810044; cv=none; b=ReIXpcWswgIsfD2LOn1o/eAkyOu0TZVtboi/ivlaWcrF1OqUXR3hQrd3a5e/guPbOry0Yquj//B2H/dmUEKybjUyRUyNuVbv0di8XZ+cABceFTWp0jnuz9Pqz/tiFWToBCCk9yaoHOTysubnNzgvbewzD3PXuQVQ0en9d2aA1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771810044; c=relaxed/simple;
	bh=0G3/fVFWXDWd5zj6OScRBLA7Pto39xgPATr4cu62hGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN01/aVGxGD8SOGUg3S3FJJeghlAOBOfLl4QibCuw/nzgo7AngYXQgJInB0xVKHhH13Ve26T+gLRKWjSqg8g/LYiE5ms8nBXdmnBfjaBwg0WQY1X+/pSTn67+m17cLFrHIn3oqg2jYTr+SWLXw+niN1Nbj0Nble6tR9G8zSpoTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNS9gO64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbOpltJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKxhBF2570444
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nc/80AnnWzN7Qo5u3ZWEwQKF
	DtrZaT4Kue5jCLEJQfQ=; b=bNS9gO642xJRcQUTr0Yep2Af/2ExXZssXrHLX6T1
	vpovU956i6r3RufAlUUT39qyiRpqRXM8Pdt2IIblyLz8/tY9SEFna7EXh3/31Ka1
	sx087LBjlwy43/hFJkx7gjwImm2RhxtamB5O05pPKHSUAbNTA/4vlwHby7A0fO0M
	yCgU/0wmpbTD+agoYBoLEbYeAZwjIA8w+D4K9mQ5vj+NT0PMGIVvub5Cshk8v524
	Uroh3SHNGUf4IJXqVqf9eD7rMxGAMNhvfZVlILH0CT/XWC5Ih7T0j2cHNzZDjLuR
	WTlNX0uQJfOjBOFaZpBTpYUAfGKEumARTrfbQA9VVb8nxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgu2q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 01:27:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3fae6f60so5053252085a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 17:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771810042; x=1772414842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nc/80AnnWzN7Qo5u3ZWEwQKFDtrZaT4Kue5jCLEJQfQ=;
        b=JbOpltJbJbjt/WqLDMTVnf+pZ/6Unyr5oS+Y/MsaD+p2JkMtlfd2hwcZD+16orKTYL
         yaX+omxo4Y0na0NPLc/Lfu8XP3Nrf1VJW3SeOQhnYpQyqlqzEvXEsVw6KCVrMGmTXPWV
         +EMaALj/aNwR0hOaTo3x8e5xC+OF8wIT6XDeHYsI1hoOdC7/xhHd5KFimLhbDFKRpKfA
         mgWkspZjBR3C1v2XTdcokoQa4i9uXPOEonGpZEDi3+ADtttHUabvwlaih1e2iw2t8Wg6
         auy7SkoEK+5ZqRZ/PteUZvdPzrcZEdylvg9zMF2WbGmdATK0LSSX/gshsKWxHBhbYgVl
         kB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771810042; x=1772414842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nc/80AnnWzN7Qo5u3ZWEwQKFDtrZaT4Kue5jCLEJQfQ=;
        b=YSGpPqnZ7phI40Er1x1Jxs1lYm84HTceojKJFGs3CpDgoC6pRc+jc4/hhmiKB+Vq5v
         mxdX/SPrZ9vOtsXFTEnOn6oyvsuDOW3696RULhSXZtD6en4jJbO6qCIYWLWmzEphgEL3
         fYhxqpmCyL2GEVqKrISodgQ0/vo3YojdajfvZnocK3/SbSDC+u4s/oUl2CN6sRUD7yve
         tPXbDiDuC1XQJBlRO3Q+YIGvsegrA0DeHTA4IYUfRWJxTsAm+leXzRYnUFbDTZEAE143
         p7wxhF4z6jQs5hpgHC8eyo5DZckMqGhfGKIf9R4Xyebi0kZK5jwNe7ah+qd32nQSamnE
         Ux1A==
X-Forwarded-Encrypted: i=1; AJvYcCVJnctJ0yyhLUpxgOgfsIcsMLWVnVPTzoWPZvMIqCSw72S4jo3gmbHu5sydzz7fT0CHuM+4GKco4N2sADOu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3SB5Q4ItpzEgoi1GVJMQ2AcXzEoz8/RM30ozNE2JHnRsBlBU
	j0KdEzBXzwjDhKmT2M3E5tkWvMy+RwQZ9UkfXNAtjkKEF6sj575E1vTTPh1IlwGqLQBBM7X+qZl
	O1+nM5WmuX5o/3Q8/7hz3rHOmxXexTsBjCfUB7ied0JU+zR73GTdlLGJ5uHs2HwRh2rgY
X-Gm-Gg: AZuq6aJc+SjVuucxoyP51k6pZTDOn7l9nyxLh5LRdxYWk2wNqDGvmGYTVAlnmC0w40y
	8TNJuS5aj8xdZLJlBbKhY20IdG84pZMi6WW2gSXE9ypguUDPR6qH6+2PIaGURQ3amJqDp+jqMt3
	cxCEbVohDjPUofTHyoVDbOnA4He8eTmS8SrneKUAcxuRcJdXIhzhisgbRQEMZA9PEeaX58q6rVK
	HJIyu+QL6HkcVvYIuaART8MvcSd9e4dMebhCuzbC4XkvQRLx4EkVjmOI4VHwv4DW8J6BIOBzIxn
	3jJUvxAYVeknxnQiVmGrwuV1U2Ydm7fCX62sm8rLQ2UR7cCq07HaGtO4IYWehrzaSLJeoAw4yAW
	VuI/mP/ke4SIEfge0DI2KgDEsK/f5vwFirmn7i9C3eHjCrOvv4W5petNP8DFGEQyESHmLDc6Cyz
	PXr6mNITd1ltq883KYYg+M8ydvU1X0VGAKXds=
X-Received: by 2002:a05:620a:1908:b0:8c5:3045:854f with SMTP id af79cd13be357-8cb7bfe7916mr1526394585a.30.1771810041905;
        Sun, 22 Feb 2026 17:27:21 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:8c5:3045:854f with SMTP id af79cd13be357-8cb7bfe7916mr1526392585a.30.1771810041462;
        Sun, 22 Feb 2026 17:27:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2326sm13201841fa.15.2026.02.22.17.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:27:19 -0800 (PST)
Date: Mon, 23 Feb 2026 03:27:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
Message-ID: <mgsigotfsu7xbquwgsrrm2rctx2e5xjmaijg6b7nzaedqerefi@oxvufd72novr>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
 <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
 <wiztxwsea2aojcxmcs2q4vskooli7lrw3oio75bij54273mrbr@ody4vonry2qr>
 <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <857f0582-8b46-4bfa-8c62-5ca6f3d0aec5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAxMCBTYWx0ZWRfXzoPcQ2AEbq/q
 vQ3sFfrPZOzmd9b//pFQ8xXEht9rQJQ18D7HLqby95mQWzel3lzdge2OFWSvqIephemmYDQ8u6P
 KBJlvEvhK2vERRH88ElxGfvvEutUICeoS5P6g0vhkT7jY+3A6JXKGO+dl1Cdgm6B2nNuOkYLvXd
 FUZ+ztxpUs0Vuxr8s9I3FTPojgVEFvNog44a09r+ZyGKsee/yAvupcgeJlzaVuV782yLofuU84P
 2Yx2hq9sRa3s9DaDgAj5iqG11Q3r5wA0/7BxZJzCp0ptzLrzspPU0JpsTv0SEQRqy8i+RdNXVwX
 +yk2A2pNf72w1OgtgeXgK8mjb+mXab7gAiRr6L/y/pDh0LvXBZ6zGMgrS6qWKOsBZRRKZ0C9BI4
 ScU83sPGi/a8b5qva6FH6d5i8P9gqdQ4OG14Ol0C/wQLNMEhGjcjOlQywAD8WLxc0mM/n+x4L4S
 pWAzw7tlvdLQT6RKkSQ==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699bacfa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=J2S0nMzMed9wqxottccA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fIJE-bPgCJsfZO46AxKshmVdc02G4Ivc
X-Proofpoint-ORIG-GUID: fIJE-bPgCJsfZO46AxKshmVdc02G4Ivc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230010
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93571-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A13E171514
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:41:06PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 2/18/2026 9:28 PM, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 08:49:34AM -0600, Bjorn Andersson wrote:
> >> On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
> >>> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
> >>> on until late_initcall_sync") setting of the display clocks is partially
> >>> broken. For example, when on SDM845-HDK the bootloader leaves display
> >>> enabled, later the kernel can't set up DSI clocks, ending up with the
> >>> broken display, blinking blue.
> >>
> >> This describes how the problem manifest itself. Can you please document
> >> why clocks are partially broken and how that relate to the GDSC state,
> >> and why setting GENPD_FLAG_NO_STAY_ON solves this?
> > 
> > Probably the best answer (for the second part of the question): I don't
> > know (yet).
> > 
> 
> RCG update typically gets stuck if the new/old source is OFF while the RCG is ON; but
> if the RCG is already OFF, the update proceeds safely even if new/old source is OFF.
> 
> A possible theory is that if the GDSC is in OFF state, the branch clocks will be OFF,
> due to this RCG also will be in OFF state, preventing the update stuck issue even if
> the new/old source is OFF. But, if the GDSC remains on until sync_state, the branches
> and RCG likely stays ON, leading to update stuck issue if the new/old source is OFF.
> 
> Ideally, if both old and new RCG sources are ON during the update configuration, the
> update should succeed regardless of the GDSC status.

Both pclkN_clk_src clocks have CLK_OPS_PARENT_ENABLE set, so the parents
must be on.

-- 
With best wishes
Dmitry

