Return-Path: <linux-arm-msm+bounces-118282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHaqKxXsUGrw8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:56:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F88273AF7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:56:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="I42/IKe3";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TTWin0qi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118282-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118282-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A904300E3C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DD942983F;
	Fri, 10 Jul 2026 12:53:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65D4279EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687980; cv=none; b=GCIXJdlTcPMNAMNo+PGKoP0qkcSgfxz+mR182LBsKVxXKV50Y4BHNiGWAiiH3Hb5ihMF6/MvLN2/zVdVYDbSRAFn+jB8bMDcKiCex2IFkKKYLSkeL22DKns9l7pR+uKqTa8VucWoY5DMvtHuqxBOkekJWJqKFqB4CqipSHx+PUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687980; c=relaxed/simple;
	bh=dff3dPz6fj6WTu2ipiERxBpDc6obBjfF4qBxHiQ0VQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZzInCdN/EKsxOy4ppSFFlpWbThqkEPSx/kpnmRDCOyqGySv/Y44BXXngTqYRRiR4gncUl22Fn1u+sazkIC9u09dgIDqsAUQC0cQkXirEAgp6ptv79pdFxwCvRKlKhUNzw377VRVjgM/D/UvNKXGWVdbACEO/1hhaTCtoAGGDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I42/IKe3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTWin0qi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmmHZ486817
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NpAfu+gzDtNcSOBz6LH2pQ8p
	/Lp4trDqfrlm8ofYnek=; b=I42/IKe3Ri7lwyhxcP0dFl8qFQsMZfU3/utC6aPK
	eAN/xFQ+dwmBwLOZ5GbU16gbOUoqyNZ7IThEm0FjgpqXriMwwI7ZFq7vXpa4ilaA
	xY8MVwJQOL5iO0WrgnrdPvdQaWoZ96CY/8eCNX3+rfoedBsriIvzOge9GyiTb5EI
	CIiyZmZRYWdXoWOBlX+TOun4Zo5KDZISDpmx2Qj7xxrW/RhXDhdQAn8UH1RqYKIZ
	u252r/L4QbuqCzBLdhNEYCtieER6FgfyLuF9wfU33O7KPXLW92K37Rk2RvODGnBC
	aM1AQ7GI3JhgPMR5Zb3FeYff6jIO4IIqRRUvcaGtkzu0LA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwtb2tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:52:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-96dacd0ab0aso94440241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687977; x=1784292777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpAfu+gzDtNcSOBz6LH2pQ8p/Lp4trDqfrlm8ofYnek=;
        b=TTWin0qiqB0AWM2LBof4QfsNT9HPUntmWzB76f5Mk+m3VdgFABrfHqE7FzF74zz8q9
         ihefGc2h+uPVMwCk5rsYPMf9nCLhvmMrQfPDGgmnFabTeipPfIvfFnMh4pz608qAKrHE
         hZfo0SdELBRXPNSiGaPH0yZxOpx+b2uQkq6GeMjax7PvoZkW0ETW1DC+V2KSpL3haLSQ
         /b0/76mS3wQg9NqF/Jz1XP9L+0+sw9hk5qGvYAUMZdgidcFhTgHZWXjBwY5GdnAP468D
         Nb1mC0JBSjlToONE2jTTZx9GVWYH4cY5HhiLsS+icsW9sJ7P8av2UcmnVy7MYv0lWqgw
         /BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687977; x=1784292777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpAfu+gzDtNcSOBz6LH2pQ8p/Lp4trDqfrlm8ofYnek=;
        b=p22YKy4r87VehXuq5iMQjObhLKZ4zas6pvWZTQl30h8FMCJD7T6CPoy72Mia3Smvwe
         Dt58Rlu2/1wRQYSvO38csBv8O5rOF75ckc4fZ9rsJxtP5q0r1/uCLmqqcg3b4kZeSq5n
         z/ICV1kddXN/5GQxXWaAyx1Pmpsl5GFH6j6K6nH3ut9wykpZdRFL9zi6/eEgt5e8WkBH
         +hlZBtBq6qE5qS5RAms715nE2VVc59GPyRXzkTXEeujhzJIzYKpNIMPxyL95usn9sNTo
         zCLqzH19Fy2Flt61CpFhNN2V5Yu+0PlpKeQ3dpK8SvtyUWxxRGdoV9gK631Ru06RfZcM
         fvAA==
X-Forwarded-Encrypted: i=1; AHgh+RolaPrS2rSAV1guAi2Z0+AXqbuE0ABv3TWLWiYqmW4jgppUtjR26cGuQ3/OU/KXUfwHNpwcdvR+OwJJK3Dw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywin4lCqlr3//5a4sphfT3WdFExIisgchEs4HIM9V2Uk1p2u9QU
	wqOevkm9geGeIS+R0bRFjKHHpmJPKwasASEtRIdptZqvouqJmyYZR2ShQqDZl+gfHqJQ2rrzcvY
	qTz6ps8IfNEfYQ8c2skCgyIThWk+f9eT1Kyqw4RSq+OtIHeVA3i7ctWNC8FVGOErk58qtNqDgE1
	r9
X-Gm-Gg: AfdE7clj9chPpYet54gEYefvfnTuV2r8TeV4wp4zUd9FEi1g9cax3zGFBuXsu/HRKvh
	jvk1FwmQYtINduwX5+KKCVFRPQBqRfHA28qmYcN8gQrdAjMIfQuEF842lF8+CegkYWJG2efwqEs
	j40LfhOLVYrGRK1/fLRqQpko7QvQgCxTdRn0C7n0i4KhfB29de6T6073jcyiXq03rCGPNMMM/Gn
	+Csa99qnhL/jMiTBDD/Eomi8LP77PobQo1nUxlZM6OMhgRNug4GJJbRWW3uVazKaD7EFmBDmeiQ
	musuE9p0l3PSM6msk+AbBFHu1FZPkYCOheRWvZW6eXIEK39t2JerNU58UuRh3ZzOFYoimzrz+VL
	V01ss7YCP14mDAZS2l1vn/6t9lNcWzVuAQhXpiZQnaEkg/8SXmkQ+cXlxZUSnG5L+B0Qgx/tWBq
	LBM7GUvuJLhqSxA5D+fYaYxCAr
X-Received: by 2002:a05:6102:914:b0:740:2664:801b with SMTP id ada2fe7eead31-744e00462c3mr6355719137.11.1783687976770;
        Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
X-Received: by 2002:a05:6102:914:b0:740:2664:801b with SMTP id ada2fe7eead31-744e00462c3mr6355697137.11.1783687976325;
        Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm589398e87.62.2026.07.10.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:52:55 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:52:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <olngpgjkxejkpnxtbwazut32umi6w6zc5gsqybpmnzm6kliywf@5eclmxcnoybc>
References: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
 <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50eb29 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=0W1SmJJ0diwaTAMQS2cA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: v2NPfEBZqK72bPxE9nNjjjR34UHSbn4N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOCBTYWx0ZWRfX6GmDIlIsLY1H
 hVcf7tKexYLgbvo9nc38SvotPmriPHoTznJMWQK1nyOAUUmNcJH6TZMC42lIgNx3kPAxo7Di2dq
 tNVWzOJ+vCpCktFZIbEVfUiFhIDUn4M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOCBTYWx0ZWRfX7JsZwOWizZ4c
 CIL/vyxS23lYb7GACMMuaZwN42/6RgObgUdnvwFTMptSdliA8ARax8HoSWfNkz4gq1Z+MoV7Ssn
 M26Ue/49jaPap6SUQe5hhuNBRfHydF+caeonx4bcgRcGQcj1kMbdTsz3Wid8IW+lJpQOVeFMDjd
 5J+gApasbCL7cPYutLxjhM9TJKGDyT9/YYt2QuIk9jd3Ope7zHtlTQepOH8bmhtFkzadUas3byE
 /vBrkWjYE2N1TLi2AjLZGVm/4V4FJHUcngi06254qzffhjiIhszBiJtEyaj5VMszJrGjt7mwKRG
 9ECdtHP3PhlstdHv9h7oP/mtEIuINBSwmlpxWz8E4D6ulj5/feqNwSZa0944Ucad5aOJFuILw2K
 TWUMsb7QaRJlFhbaw0ath7B/T7diZkWUzaabBUmJ+fIll4QJR5VFGmxVqwIZm2ZXcIF+q6n7r5M
 BeE+MDQniuFMeDfLMvg==
X-Proofpoint-ORIG-GUID: v2NPfEBZqK72bPxE9nNjjjR34UHSbn4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118282-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,5eclmxcnoybc:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F88273AF7A

On Fri, Jul 10, 2026 at 02:33:53PM +0200, Konrad Dybcio wrote:
> On 7/10/26 2:28 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
> >> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
> >>>> On 08/07/2026 13:19, Konrad Dybcio wrote:
> >>>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> >>>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
> >>>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> >>>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
> >>>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
> >>>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> 
> [...]
> 
> >>> Which way of representing device nodes makes it easier to migrate
> >>> existing platform to the CSI PHY driver, while keeping compatibility
> >>> with old DTs (yeah, ABI, old DTs must continue to work)?
> >>
> >> Quite frankly, I don't consider the existing (meganode) description
> >> any valid, and would vote to rip it the second a replacement is
> >> available. But once, not N times.
> > 
> > Rip without providing backwards compatibility?
> 
> Because the existing bindings make ensuring the required performance
> state of power domains impossible, yes

Then, should it just be 'write new set of bindings and drivers for the
platform XYZ', then completely migrate existing platforms one by one.

-- 
With best wishes
Dmitry

