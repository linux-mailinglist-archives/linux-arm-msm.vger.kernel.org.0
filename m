Return-Path: <linux-arm-msm+bounces-99705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIxpCP26wmlilAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:25:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CE318F89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DF6430657EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348133A0E81;
	Tue, 24 Mar 2026 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmldXr5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuXvjSbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E3E3E2746
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369054; cv=none; b=EpO2VIj0qcH6eImmex2jqvAV3Z+8JbLgDPwpQBdyDfe6Pr4M7TUSYh6a3Aw+4u4hIAsmj9/SUoMABxE6MmPshdaqGjt84M0KDfqLjQ326u6HDO5gvbCCtEdFYCgiY1TayuwqIQ+R4k8un0qeDTaN4Gi2fqJ0YfDpRoDUbrhSGJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369054; c=relaxed/simple;
	bh=yX/ZH3hQoxhONz/+TakCdkZaTGuaUEtsesO/EgiFBDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcTZDcV4x7wydBkO0qpfbfv6PHZ7qiIk5pN3P4nzgy4k5WjKTVr2xlJ/Y7v0nmIhK6UgjkQG6Og/QgBP12Cs7MGtPpRMJL6EndQNhlIzhqs1Mq5mlAaupPaLnHqE6ivAfYfDDHh9a96DAPhVKchOK0qhif5h/Oez00onKUahins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmldXr5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuXvjSbZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wZIk3039766
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqgwSGDGP5+mYlE+BUXw0J3S
	9EfTkX6r6S6ZrZbik/A=; b=AmldXr5O7UsPWkOGNDAjpIJqjv0Cjpo5MrFUmS1H
	Bo5dEXGWpmCnX9pu14nYoIsz5MO9CZn0PsiC+IuVyIvsdKb7m83W36jQo/PtRXJK
	ihw0zUnM89X7mA2NtMJHzyUMDsRDkEPsZ3WdtVRzDdhIpsvL7mVbYHEnScxEqg7G
	hq8SPTNJD0OejqHqKvBwHrMysIRxx2YrFuTXkq4cU/QKEYQmS4KO5vCnY9m692hr
	ENC7yHCJRhINw4xbUvkWjC7lJlYbx8qrxnBJuY/FKaX4pQr4qXSRnVnRJhDSmc/h
	98uBy8PuWhVKrqv+3bqYT0um5O0qVmWp+eLakpZ5P/GP+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0hfe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:17:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so97620311cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369051; x=1774973851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oqgwSGDGP5+mYlE+BUXw0J3S9EfTkX6r6S6ZrZbik/A=;
        b=fuXvjSbZKQcgrqg9F/xNhOlaH++4M12ZC3vpF8XN+JUZ0ZjWRVK04u9kTe27dV5uE8
         oC0KurXVixNhNTj4gRRok30HYY/KlJgY4WfEGuJDgxjIb1cgLAtGajlYiO1+gLk21Xxg
         d9iFLqQu0FvEMiDufu7Gj6kJIGCFRCR0qNFBTgjabd/HVFuAChbuFWI9AOxxREIbqgq3
         g7Hbj5li0i+by1yCHFVAYF2OfunkgQXgHcAoQjWhRVztC1aqvPlrICgBqhwjpXIG4C8h
         fT/P4hH427QCf+casriH6/FgvA380N/QxaA0ASFh8sFqJwDsZLs6tLPSihkqy1Qb130e
         sg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369051; x=1774973851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqgwSGDGP5+mYlE+BUXw0J3S9EfTkX6r6S6ZrZbik/A=;
        b=KGLBgGhOHYvqf87DvXEhcL24+1Yk/8dynqHL9GqvpRCuHC2Ykbj+XwzrF+aBarRdEn
         9z5UO1ZW5YlwOZowhC4IgY1TSpkspz+5H+r2VR2Zm3GfcMWNyeaQfpQio9nhWWI4f0pY
         WGgX2VcRq3n84cg9WdcEWJ7AGq/po+yYwSDcStayzatX5iFj21QL1puW78NIGAlOx4gb
         ghZBm6ubUbbl3rP9MP0H3LZ5y1vpFWVh47A61TZbnb4XcUhrIfaco9PwCXwhO6OJ9V7n
         obQ24l7aoiHdLlfbebjUjLfig8J3FMq8yVhZKD/g2cvZzQpE9WkHvbz/AWxBkVv29Bsw
         EFfg==
X-Forwarded-Encrypted: i=1; AJvYcCVFQNhD9LjNl/AXV+cnE2+BNw4EXCzlejlT0dWqx1UDirOka5dv60xv3ZE8vnLjGWciJFJEvG347VLhbPju@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTfhmm3MaXRcwTJG2Z6OojbWNqJxUSR9mOwFi2guu/N/mSzUy
	Kew05ORYcFHjDSWQmyE/eDOwiTsecUbj35Y6IpT43Wh9OIbeLBKrjopnisfXCtXRNS2i5D8xCzo
	uyvHVReADlHiPeFtX69RY0Ez+O7sF69Bi1UGDcFof6uQtas8mAvyy5IdY9MSEokB3/NQy
X-Gm-Gg: ATEYQzzfLK1isCMqPr3sWI+LDohN5l2WDnDoA0bJdQotc699HXjjQZHMOZQX2bRbBtq
	AEYWHzG6+Lkfmf7+e4BC4cfncypqrs806Qecb7e2xZF7HkZYyuphtzs5rYxSnFXLdgCtyGwrjm7
	C0PN5Bm/HbbBDvCRF16OsLrgNWBvBTkDXNJ3lB4M76ugvucql8LOl71ZfM3wjcUmNwvPhY+BixY
	nqhGJcGFpykMiynXuq4wCmMyGqahPAb8ozFXHbZLpFIEIRx/oIBy8NV2Bn5AvLpJdRK2G4FdMC+
	j6Sk0c1wt1EHLquz97LjtmG+Eq0cBaab31ESMEXi8hcf1R//DIcQsiM9n0jFbFY+eC7KL6egRQn
	q5C8RS1A5XP2LzSqHk/4qQXTGMob1AvnNBg==
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr3065981cf.48.1774369051120;
        Tue, 24 Mar 2026 09:17:31 -0700 (PDT)
X-Received: by 2002:a05:622a:98d:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b80e8a543mr3065341cf.48.1774369050507;
        Tue, 24 Mar 2026 09:17:30 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48716547649sm316795e9.0.2026.03.24.09.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:17:29 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:17:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <45n6n3dbdcim2jzaflqr7yvyn3efkhi26dubnd665r52vtb4aa@565zb6kxzoel>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <acHxosznN-xbWtjJ@baldur>
 <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
 <87749d7b-b46f-400c-bc0d-932b15c7a75f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87749d7b-b46f-400c-bc0d-932b15c7a75f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyNiBTYWx0ZWRfXxsqUayWWcekt
 c3yaFafwJrnNL1Nj4RzEW0iQ/gZiWKWVsobeQWeSDzT/begsFNak7yG2plcGJyEljxLwGXTkgi4
 AYqiTngSN0Wg67bHzT1X3c3XpchjDAv53gee+07wxo/euUGflhC+mX9Un9l4Nv1gbMQ5OxoBMKs
 /1jvFcRXzd1VZR8E9PGfL59u5o2gSaa1IW4jyFrvF7KILAmX9A27NXZzM5VBwt+JDNRA0AJTn8L
 r49QHwdASNHDjJ7nTo/Dfa8KWJzl+RiMXSJg9WdKqWvUqcmRjYNFXdoegopBvsq17Hh5Nvt5XMg
 SyDvUzswbtx+Y3yl0XsAfBjcKuhxxwbXs+Um5+ihJLXJq0nr8uZdmylkW8WdCW44Axx1XBBRHtE
 /ULndEmM78FwtqoHeu+p6/uE72lYOtUlPSMIWxdxUSMU3YVTod9hXW0rnibE/rxwx8PQAI4iMff
 hnEsDwowgCvomdwt9xg==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c2b91b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HL9x7WhoLHLwXc8wI8sA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sq16U__4_IehOL5YqEOS8sm0EyCJkI_b
X-Proofpoint-GUID: sq16U__4_IehOL5YqEOS8sm0EyCJkI_b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240126
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99705-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E35CE318F89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-24 16:14:34, Konrad Dybcio wrote:
> On 3/24/26 2:45 PM, Abel Vesa wrote:
> > On 26-03-23 21:15:12, Bjorn Andersson wrote:
> >> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> >>> Recent discussions off-list highlighted that the GCC should vote for the
> >>> RPMh CX power domain on Qualcomm platforms.
> >>
> >> Your commit message should describe the problem that the patch is trying
> >> to solve, not the story about how the patch came to be.
> > 
> > Sure. Will fix.
> > 
> >>
> >>> Without this, RPMh may not aggregate the correct load for the CX rail,
> >>
> >> "may not"?
> >>
> >> In what case will it aggregate the client votes cast on the GDSCs
> >> aggregate to anything without the power-domains property?
> > 
> > So my understanding was that RPMh firmware aggregates votes
> > internally as it knows the actual parent-child relationship and we were
> > supposed to replicate that exactly in kernel for reliability purposes.
> > 
> > Meaning, in theory it should know to aggregate proper load for the CX
> > based on GDSCs voting, it's just that it isn't always a sure thing.
> > 
> > Maybe I missunderstood it though.
> 
> GDSCs are fancy on/off switches
> 
> RPMH votes must be carried out manually and in the kernel that's via
> RPMHPD/RPMHCC/ICC

Right. Thanks.

