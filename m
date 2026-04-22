Return-Path: <linux-arm-msm+bounces-104140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JKWJavp6Gl4RgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:30:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18F447ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B13933014C44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BDD2E2840;
	Wed, 22 Apr 2026 15:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDvEzbE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPPVdrYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488F32F764
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871770; cv=none; b=M77NLU8d78/LCeNyvHQ7RtubO85Qa1B8SLhSCVka57glcbUmEfVX/MhalvWaPEi16Tzo7HI4cjvDlsri/HJVqJxDtwQFUgKX/GB8tzXlAHLbRhoGgmZVm4Q1Fp8OjJjLi1w4tkMhsSWmyXjEPTtfxwJYpKNPrkmP5tqpvQDSLzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871770; c=relaxed/simple;
	bh=CdRMxxJhqXyKUurFEc019GhT9+7D4FmZqb+enKXrILg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnsAvbZzBeRElTWmDWoZ24ObiItD6OeCGJAjhRjL3pfx9Z2SGClELvQ2ZKm8Zmj0Eo3FoDs57lu+XsJZf61m7jPNvlS946XQjRteBcwlPSdgNvog6/GQTGY1U1yLIjc8RzsgtdPSdEhUGKzP+r1DysN8B1Eyjoj8xdy8UZ1YfJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDvEzbE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPPVdrYc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MBKpIO2209084
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gz667Q+iRVsAFcsm5jartEDf
	sKFXucp1huh8Y+6crxU=; b=WDvEzbE3LXpZ9DP1+prVK1VZpX+2ExaYiMDn7T1r
	MZtnsfWy0S7tuwYJEv0ktEZnURhBlSbmVgtl/1YlRvLGm4Nf9B2X28QgTCJMaqYG
	SVvIEKB44Ag/4P+puI37FHj5iW/JWzsI4goa5ivXa1htB5HF2IC4svx7nzBP1dhx
	I12H1e4/+EN+WiyQmg08UKaPbLnWptmMv+T4pTb+1TRzgEJlW1NYFFqYgg6FSi+2
	ky18fzVCZ68fbJHxKuxkKd3xLPso1svDSFLInB/V1XyiunCd5ziAybO49seJAa/6
	P+jZZq7WWV36wmqS8m3/CEhBPtsldsKFWFrlnf0gsnegtw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengc09m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 15:29:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so39433941cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776871767; x=1777476567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gz667Q+iRVsAFcsm5jartEDfsKFXucp1huh8Y+6crxU=;
        b=HPPVdrYcUS8icCJRz2jGbkvcmJ2TlW0qx17P8JBTQH6S86oRfRyhDN8cms2KNxMylt
         wmkuI8VX4aekleGzQEbwAXZDvfDL1LzJkfShMxziQjfdEXjzUPfRPRszO+dJ2qPnulx0
         ydPvnS9KoznH/I3wlPiLHoneXiUkAceGliuPGfjc4Afp3rJg8v4RKeOhabc0VoKq4RD+
         yfAMN+dv5SGt+BZe0c4jtPbfRvwguwiyyOp5uHH9WP/517kvzpayJ+93hwD87Rc9Z21j
         fU1TJt+VUSy7M1iMuD4ZvRqGYXXMm/qPssu+LL04YfglrXcbRDisdAoCA2XCIDGoDyYj
         yQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776871768; x=1777476568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz667Q+iRVsAFcsm5jartEDfsKFXucp1huh8Y+6crxU=;
        b=khVCbbI7gFtMYHRIjlwYR5Vyud+KVkVoUpY8Y6fiTXyKtJeF1euD5LrNVwquGIhwg1
         VH4CkXjLghN6Rg0t7pnOS6shNGAweyYt54OfEgBZcAGjTt9bbMWTcT/ACfIAjOch7n6Z
         mEcT+JkvMQzGpFvRXRd42HpqTnZ7J3GqO765YwGa2pJohwJonf+4bnzYDBtp+niGZRWw
         0jygLCX2JvRJZcM/ljRmD0dqiaSTWO8/CNlliQ81p4ArvUqzdy/2e/JXUQwJkv68bzvd
         t3VxJRQrSyVUS7tFzP8ZRj5841WEPOtDfxhSTr+Ko6HEX2YviGHzCbYMG3xQQsTLjAqB
         61Uw==
X-Forwarded-Encrypted: i=1; AFNElJ9AG6BgVqsLqEMejREeUdg2FBg4T0/9YLtv6/MhpSnmjMgtkVxUHNr80PKRzXIFt6T39Y3N9LZDO8QH/Z9D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Er3QzlZsPl3EgnT+4ztRBY9TE9Xi8MBQqwwvQxAy5t908RLH
	HEXmRUj+iQrdIvjjsHuOKJkvAUfjQDkxZskBPS3HgZaDYgVmeOGYFaWxgJI1wZkeycbCSx3W3Lt
	wKRKlrYZ8xRrOSQQc4aRT19ma7cks2tXcV1xptLqoTHKJBXEGng6NlMf/xz9mr02KejpVjgnAVi
	/L
X-Gm-Gg: AeBDies+GLRclXK+lZUklkeJ8wYN26xTHgkBjwMUU1B0zoDDl3tT9AMQFcHLSaTKkKA
	gzFx8tCz0ta0iPBfyOBQgJwUPPek6Y1tsqQDL/oyjZVPnW7sA6SzprjdkKPqHdwfO4mC32KSzL0
	ECaql20+RXKeAP3HccpR4e2r30szeIfhhsBp/dmrSNmVLEyTaaUWe/BanmgXEBrTcDbveDMhgm8
	jtKbNR24sCb2L/kohR3lB1Ht+xQHOZvpiSMnkb9oad2KreZ8YFsGVd7yKNwhwTKWeOKJVPEpigF
	nG5n8/qhEVAgR+JB5u12bR44ZzlZhKC/7JALb3vjluKYZTJ4OJW35GERsDctoTFM9AL6ujck24v
	6GKpn4UGrZOM94eoqVa1sI8NtA3Qwyoqict3/5+oxcye6+kyrU2xVcKPLQfGHGLEg233VxJMGYK
	UQu3A30tXGig3t1L4Hn6sVTI+AfzbQ6uIwi7Ip3p/qmPab6w==
X-Received: by 2002:ac8:7d11:0:b0:50f:b821:9c3f with SMTP id d75a77b69052e-50fb821a068mr95722371cf.60.1776871767559;
        Wed, 22 Apr 2026 08:29:27 -0700 (PDT)
X-Received: by 2002:ac8:7d11:0:b0:50f:b821:9c3f with SMTP id d75a77b69052e-50fb821a068mr95721771cf.60.1776871767000;
        Wed, 22 Apr 2026 08:29:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm4554946e87.30.2026.04.22.08.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:29:25 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, quic_chennak@quicinc.com,
        quic_bkumar@quicinc.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
Message-ID: <pbcoz4acox5ifkopf4k42jcu5cw4ppcvbizrpnpkkjbbyedwj6@vvk3af2xam5k>
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1MCBTYWx0ZWRfX+0SUjUwNJrZE
 VvifYlFFjXo0eDgbZ4Pd6xVujFOctUsXNeuxnL+egKKKF5BpBT/v8Mu4TgeI+qqE2Wktz7t4+Sf
 +K2U++jOT1BCe/hqRjuv3NBqoD2nlPkHm9u2FwPi9HedOgirFYKbuTE7nTbo5Tg1V/YpAEWktDH
 fWNGzA0z9yVDbes6dBI6G3u5LSCHQKg+XpAKCSCkZ++/nTeUVGO9G7pRGj7l1rysW09nbyqzIhd
 YcMV4K1km5JUnKopONgCaNdK3jj3jIAqFmD08XJB+theqMa+D1Da53hZxwIrxx4kdytIq1T5Aut
 FU0e0DISrRvcX5gX4F9qygYSS5b5KVPrySKVsmSyVV51/cIKJpSonfsYuKghN8EdOa/9/FkOjGg
 MIT7btcLLbLx6y+gSfs9peLD5Gntpv/vp3PAyOxGR/4y4umLVHNxxzDXecgAjhsgkUbXKD6LPXM
 aiWCZqBeXFXkQbCLKOg==
X-Proofpoint-ORIG-GUID: mIfvTaNaaZcAwkK5ksjx0BBs07HY-x91
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8e958 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Gv3PURsRAAAA:20
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8
 a=HyfyWxjmqhP_gXxERdkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: mIfvTaNaaZcAwkK5ksjx0BBs07HY-x91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220150
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
	TAGGED_FROM(0.00)[bounces-104140-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f6800000:email,qualcomm.com:dkim,f6000000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,9f800000:email,oss.qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B18F447ED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 01:59:23PM +0530, Ekansh Gupta wrote:
> On 17-04-2026 20:45, Ekansh Gupta wrote:
> > On 15-04-2026 15:22, Konrad Dybcio wrote:
> >> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> >>> Downstream [1] this region is marked as shared and reusable so
> >>> describe it that way.
> >>>
> >>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> >>>
> >>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> >>> ---
> >>
> >> +Ekansh some insight, please?
> >>
> >> We're giving away that memory via qcom_scm_assign_mem() anyway
> >> and I would assume that making it not-"no-map" could introduce issues
> >> when the OS tries to access that region
> >>
> > With the current version and the upcoming planned enhancements, I don't
> > see any major benefits of making this as not-"no-map".
> > 
> > With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
> > entire memory-region to lpass VMIDs. and un-assign it only during
> > fastrpc_rpmsg_remove(). There have been implementation in downstream
> > where this memory is dumped in case of SSR or audio PDR using minidump,
> > so marking it `reusable` might make sense there, but that dump logic is
> > not added upstream.
> > 
> > Upon checking the DT, I see a bigger problem here, this memory-region
> > looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
> > Please correct me if I am wrong about this point.
> > 
> > [1]
> > https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
> Just had a new finding on this. There is one more reason why it is not
> added as no-map in downstream. This audio PD carve-out region is not
> defined for most of the platform's memory-map.
> 
> With a change to qcom_scm the memory during boot-up, issue was observed
> on RB3Gen2[1], where EFI firmware was loaded in the memory region which
> was causing boot-up issues.
> 
> So defining it as no-map might not be correct and it might need be
> changed for all DT files.

Just to point out. By removing the no-map you'd hide the issue instead
of solving it. The region would still be transferred to the ADSP (maybe
piece by piece), possibly causing crashed once bootloaders / EFI tries
to access those regions.

> 
> I don't have a history of why it was added as a "no-map" region on
> upstream but looks like same has been followed for almost all the
> platforms. This needs to be modified based on the memory-maps and the
> region needs to allocate memory in a dynamic manner.
> 
> [1] https://github.com/qualcomm-linux/kernel/pull/487
> 
> //Ekansh
> > 
> > //Ekansh
> >> Konrad
> >>
> >>
> >>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>> index 4b47efdb57b2..13094b5e9339 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> >>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
> >>>  		};
> >>>  
> >>>  		adsp_mem: adsp-region@f6000000 {
> >>> +			compatible = "shared-dma-pool";
> >>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
> >>> -			no-map;
> >>> +			reusable;
> >>>  		};
> >>>  
> >>>  		qseecom_mem: qseecom-region@f6800000 {
> >>>
> > 
> 

-- 
With best wishes
Dmitry

