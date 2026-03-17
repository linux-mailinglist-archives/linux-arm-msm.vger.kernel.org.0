Return-Path: <linux-arm-msm+bounces-98222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPS/HLpxuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:22:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E97632ACEE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6D78306AEEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57712DCC1C;
	Tue, 17 Mar 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+b1Uv+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0IcgWoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED83C0628
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760578; cv=none; b=Rel1oqV8hw3lsGzdBH64PqDglhx0p8UM4liwKXJTxhSVTPpPmn+NPNAGTj40IR8xbxkGUaPszd7FhdokCgti55W/3EaNBGM6PwUSUCOrY4Rdq1Cz96tsDzqM2e1gOS4sby6+BixjE4iBBEfs3Ufg+utqcUp+BCp17/+HlfuhDR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760578; c=relaxed/simple;
	bh=XNXHoywGWZ+uFUu9gL3s8WJ54dhhQvp1sCfyVEWsJY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AebjMaO5dEc+5Z1kptCgMxY+opMPEjKPTkWLnPi9tlYbVnb2c8pkXjgtaqADIAGh0jbcFJPX3wIu206nsRs+yJAF48CrRE9XpCRC7EnSGSZYklrghS1PBlPYmEuDNOxRz5yufNz3J+wUxTB4AK+k2eKksbT1heLfO5cUC8XQoBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+b1Uv+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0IcgWoO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBlpK71026285
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Qx75OcTdKKbO2u0Tb+ZEYBltpkIMr0354q5+lyHzwk=; b=e+b1Uv+VJzl39APO
	dfA8aRZx9R2OGadJOI+K1Q1ph1oSzaojd6BX7Ld7YDS+ZK9ZIjKh3Bcp6FBqCjD2
	xSQOMZiekl6cE+sjybk9NhHt1Qc8V/DhVd/+ApT842CY9J6At/cYnWZaz7tohD9r
	19efcOJGgvUXzM1bzHpOFZkBB0BtzwuvfDQeamuziiTzxZhsUjhSpX5bI2g5teKx
	sgp4TQgWLFCOj3PYSWK9Vp/m4dImU6zUCzeVY0247bob3FXSrjKXQhWinUMpXbYD
	qvvgDpqk5TztJqGH+fFt7+zQ5JF/YBqLpxQjLk9f+i8lHKw4SFfAygPX7ArIwjVW
	Czpg5Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6gr68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:16:16 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bbf529d09so107055431eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773760575; x=1774365375; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Qx75OcTdKKbO2u0Tb+ZEYBltpkIMr0354q5+lyHzwk=;
        b=T0IcgWoOvL7+dcHf2bH45+osHjB2VjPY/VWXOBQ6COgxfDYG7jcVSnCOEeMOB52VfT
         15bGh4H0ukUJOD79YNjtVOIW787qw1JhYIrARalnYeP5xldBY8BL+EYLVAB0NZMuDKDg
         KKXe2Y9e/vAu3cnc+nyQ6k8dQKcVp7GCEBgETBemizJAV3TUiG7l0acjYrNf7m60pVzL
         BSbAMpDAFGaud1HIcgbZSlSATvHvSlN7CfVNZkBmnGBuqUU2ntGZs0qpvFacwOgmV7v+
         6G0gHRiZLQehEu7Cg1Vbr8cW/dFk4kXxUbLleT/+NVy/EMeQci51pO7B0zlEdL43x22t
         YwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760575; x=1774365375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Qx75OcTdKKbO2u0Tb+ZEYBltpkIMr0354q5+lyHzwk=;
        b=lEQgLWMQjjZiIbCtPBA2xp2ouqxK2tq+SUQWFmwzpLUBhuq+8QUqB3Hnxl7DJjoEd1
         e5CsnVpCaIf2syt5uweGZCR/qnWLMSEa01uqK102b8rf6pN7gMmiqdm7Ep6WgnXsvzjj
         4a92GRtdTO/vZqJv7+5hvWGi4ZUeWQwP+amhLejHthnP0q2x7mJCpmKwLXhlgcXaxhXL
         BBgFlT+TwnDw8b6X0WPkWoGI8mYh365IJXSBPfKGFXhJY/hwGl3hUnBANX1Z2t8KKIwK
         MgPEHuz2Lxgj4xDhLBn96GZaZzKLLcKbLh8sdEzUHYvXiZiqBDoHH3JEBAiH4Xaj13hc
         QKiA==
X-Forwarded-Encrypted: i=1; AJvYcCVYKpIHzNEsYfUWD+Lh59F4n+9VxokA3bof8NeDitBEPr3u6c0GvhZ3dmHBM9RZuojqhB3ys7m0CqHYENRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7emmoKJ/CEgharpcOo7pHcfRR7N/XNWh782+SYbzB+v+gCqF
	HCOYCkC3BmXAu1aTmprFTLmngATe+NlYw0RIJpgkHIfGxvADR7Lca8uLwSNIMKpDtta9rrNZ+n/
	E4bDEVMDlTcd91LiOhqJvVKbqNo0QJ4sMfBu6AXheGAlU/QbutDLvzEYDWhsnEqs6n9iO
X-Gm-Gg: ATEYQzwUh/T+hxTXYLKbfnxRbd5pznPnnzU6+w+aQ7lgJsrvvEQXcs/X8O9VhTVeTu1
	OGRvshqQg8NI4aaXjGeLI1IV1iD8xkLIQoCRtDTlOMciL4lab8eJnwi1x4vcS+H/mCejNWJc/b3
	wnlVMoeh2FNuFZMovdUTIIpvzCkKcBBXvFIz+6W/8Kjvk9bARJaaJ/hJCJ4RTiA90eN2gB3gtjQ
	18FboobFXSxTqDZdZKZ+SkCBWCHmJWC+p29Xidlf58hCrSnjVMC10XEUB4As4312oJU9Bgn3Vwd
	thKwyOJePO7ZAuwgKq4qPU7kLkWwitMjahjCsrbQZvvtOS7eVDsMDUezLDtm5QhFTAiyn2MDlEz
	5EuxjgIfd/rozrkrPvTPhf6gkI4e0G8Fv3Ij0FsGAMaqd9bkPHgPmQN8+Fvr1C6s/bs+ypSBq4w
	Vyk+JHpo526rXnaut6GUiiEIqFVLgoU5isBqM=
X-Received: by 2002:a05:6820:468b:b0:67b:bf87:739f with SMTP id 006d021491bc7-67bdaa7e5a6mr10382345eaf.65.1773760574607;
        Tue, 17 Mar 2026 08:16:14 -0700 (PDT)
X-Received: by 2002:a05:6820:468b:b0:67b:bf87:739f with SMTP id 006d021491bc7-67bdaa7e5a6mr10382310eaf.65.1773760574041;
        Tue, 17 Mar 2026 08:16:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636668dsm4186512e87.70.2026.03.17.08.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:16:12 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:16:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <necpphuujv4cyc33sf6eaaamh2hnub2poch7rjgvxzu6id62zw@rxotgr3rtbsb>
References: <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
 <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com>
 <g3dclilgoee6a2dyfqdvk67asjb4ptur5nc52iqqeqpiiourpv@46xstae5zsy3>
 <DH4WJ5KZ39MS.AHLMLFB8E0JW@fairphone.com>
 <3e5f80a6-d9bc-46ee-89ca-b1b2ba744493@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e5f80a6-d9bc-46ee-89ca-b1b2ba744493@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzNCBTYWx0ZWRfX4PJ5HeQsf4y4
 BsOixbBjMOdgF+kVzuPbK3j4dm4S5PFrrHwEcsZ/8Pja36dUF+g8Irf4F6GOlaQvayCjboykRy2
 yBXew6SCDENOmd09M0jyhEYs8GSbueua6d/QqueggAApqHofRZP4HosdQKa46UPjy7zfknNjw+E
 Z7Qep9ZEAqqj36TcdozpnwXBS5JukvxkbbiAG918VDgWuo5SHlJ3rudyCspwZm/KDnerqWaRkPM
 I79qVirSFYzTJkEzqRkxJZkW/lJUAjaiHHf78pYv46S71kuuglS5YNfcLqnFhIemODH1k8Bgdme
 U4M/wp75vFM+28WIfR3Tuy5TzBbubRsOdjnPxQHwTQ38NIZkx/6E9LKwlRdBjkYZ9oqNProb3q6
 xMqMNBdWfunfHyF7ZFPRhKKlZaKg1asfIEy5a5/4WSj0aPUq0WAVjcqxAhpML70rM57JEqFCWy6
 jIh9U9Sfc66aDawf6/g==
X-Proofpoint-GUID: UoP4TLN4RaBpxsdqAsQ2mikLvyRFow1e
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b97040 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Lq8GIy_tig5i-ImUSOUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: UoP4TLN4RaBpxsdqAsQ2mikLvyRFow1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_02,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170134
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98222-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[fairphone.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E97632ACEE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 09:59:28AM +0100, Konrad Dybcio wrote:
> On 3/17/26 9:07 AM, Luca Weiss wrote:
> > On Mon Mar 2, 2026 at 4:17 PM CET, Dmitry Baryshkov wrote:
> >> On Mon, Mar 02, 2026 at 03:35:36PM +0100, Luca Weiss wrote:
> >>> On Fri Feb 27, 2026 at 8:05 PM CET, Dmitry Baryshkov wrote:
> >>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
> >>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
> >>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
> >>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
> >>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> >>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> >>>>>> dpu_runtime_suspend, then we should be able to also skip setting OPP
> >>>>>> corner in dpu_runtime_resume(), because the previously set corner should
> >>>>>> be viable until drm/msm driver commits new state / new modes.
> >>>>>
> >>>>> That matches my understanding.
> >>>>>
> >>>>>> The only important issue is to set the corner before starting up the
> >>>>>> DPU, where we already have code to set MDP_CLK to the max frequency.
> >>>>>>
> >>>>>> Which means, we only need to drop the dev_pm_set_rate call from the
> >>>>>> dpu_runtime_suspend().
> >>>>>
> >>>>> I concur.
> >>>>>
> >>>>>>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
> >>>>>>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> >>>>>>
> >>>>>> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> >>>>>> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> >>>>>> platforms")), I don't remember if accessing HW_REV without MDP_CLK
> >>>>>> resulted in a zero reads or in a crash. At the same time it needs to be
> >>>>>> enabled to any rate, which means that for most of the operations
> >>>>>> msm_mdss.c can rely on DPU keeping the clock up and running.
> >>>>>>
> >>>>>>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
> >>>>>>> MDSS_AHB one seems to have 3 actually configurable performance points
> >>>>>>> that neither we nor seemingly the downstream driver seem to really care
> >>>>>>> about (i.e. both just treat it as on/off). If we need to scale it, we
> >>>>>>> should add an OPP table, if we don't, we should at least add required-opps.
> >>>>>>
> >>>>>> I think, dispcc already has a minimal vote on the MMCX, which fulfill
> >>>>>> these needs.
> >>>>>
> >>>>> I have slightly mixed feelings, but I suppose that as we accepted Commit
> >>>>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
> >>>>> we can generally agree that it makes sense that calling genpd->on() actually
> >>>>> turns on the power indeed
> >>>>>
> >>>>> What I'm worried about is if the clock is pre-configured to run at a high
> >>>>> frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
> >>>>> and doesn't impact the state of M/N/D at a glance), we may get a brownout
> >>>>>
> >>>>> This rings the "downstream really did it better with putting clock dvfs states
> >>>>> into the clk driver" bell, but I suppose the way to fight this would be to
> >>>>> simply set_rate(fmax) there too..
> >>>>>
> >>>>> I attempted an experiment with pulling out the plug. MMCX enabled with the
> >>>>> AHB clock off results in a read-as-zero. I tried really hard to disable the
> >>>>> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
> >>>>> *really* can't just disable it" type behavior (verified with debugcc)
> >>>>
> >>>> I think, in 8996 it was possible to disable it. Not sure about
> >>>> 8998/630/660.
> >>>>
> >>>>>
> >>>>>
> >>>>> There's a possible race condition if we don't do it:
> >>>>>
> >>>>> ------- bootloader --------
> >>>>> configure display, mdp_clk=turbo
> >>>>> ------- linux -------------
> >>>>> load rpmhpd     |
> >>>>> load venus      |
> >>>>> set mmcx=lowsvs | mdp_clk is @ turbo
> >>>>>                 | brownout
> >>>>>                 | 
> >>>>>                 | <mdss would only probe here>
> >>>>>
> >>>>> *but* that should be made impossible because of .sync_state().
> >>>>
> >>>> Yep, sync_state should prevent MMCX or CX from dropping under the boot
> >>>> level.
> >>>>
> >>>>>
> >>>>> This may impact hacky setups like simplefb, but as the name implies,
> >>>>> that's hacky.
> >>>>>
> >>>>> Relying on .sync_state() however will not cover the case if the mdss
> >>>>> module is removed and re-inserted later, possibly with mmcx disabled
> >>>>> entirely but the clock not parked at a sufficiently low rate.
> >>>>>
> >>>>>
> >>>>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
> >>>>> plug the MDP opp table into it and set_rate(fmax) during mdss init
> >>>>
> >>>> And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> >>>> level even though DPU will change the clock freq.
> >>>>
> >>>>>
> >>>>>>> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
> >>>>>>> targets supported by these may not even have OPP tables and are generally
> >>>>>>> not super high priority for spending time on.. that can, I'd kick down the
> >>>>>>> road unless someone really wants to step up
> >>>>>>
> >>>>>> I'd really not bother with those two drivers, unless we start seing
> >>>>>> crashes. For MDP4 platforms we don't implement power domains at all, no
> >>>>>> interconnects, etc., which means that the system will never go to a
> >>>>>> lower power state.
> >>>>>
> >>>>> Right. Might be that 2030-something arrives and armv7 is gone before someone
> >>>>> randomly decides to work on that!
> >>>>>
> >>>>>> MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
> >>>>>> SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
> >>>>>> has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
> >>>>>> should start there by adding missing bits adding corresponding
> >>>>>> dev_pm_set_rate() calls as required (as demostrated by the DPU driver).
> >>>>>
> >>>>> A bit off-topic, but:
> >>>>>
> >>>>> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> >>>>>
> >>>>> 96 is in DPU. any other candidates that should be moved over?
> >>>>
> >>>> Let's go through them.
> >>>>
> >>>> All SoC except those currently supported in DPU require SMP (shared
> >>>> memory pool) support to be ported from the MDP5 driver.
> >>>>
> >>>> Most of the remaining platforms (except MSM8994/92) also had HW cursor
> >>>> implemented in a fancy way, in the LM rather than in a separate pipe.
> >>>> I'd really like to postpone those, possibly first completing migration
> >>>> of the other platforms and dropping support for them from MDP5.
> >>>>
> >>>> 1.0  - old MSM8974
> >>>>        I'd rather not touch it, it had bugs and I don't have HW
> >>>> 1.1  - MSM8x26
> >>>>        Probably Luca can better comment on it. Should be doable, but I
> >>>>        don't see upstream devices using display on it.
> >>>
> >>> I have at least two MSM8x26 (1x APQ8026 lg-lenok & 1x MSM8926 htc-memul)
> >>> devices working with MDP5 fine. I should've probably upstreamed panel
> >>> driver & dts but they haven't been high priority..
> >>
> >> I think I have been saying this: having a panel & dsi enabled in DT is
> >> the only way for me to know that the display is working on this
> >> platform. I'd really kindly ask you and other activists to get at least
> >> some panel drivers and corresponding DT bits upstream. It is really an
> >> important flag for me.
> >>
> >> I can propose some kind of bounty for those getting MDSS+panel supported
> >> in Qcom DT. (Beer at the next conf we meet? Some stickers for the
> >> laptops and phones? Mämmi?)
> > 
> > Hm I realized yesterday (through trying it), that also MDSS is broken
> > since the no-IOMMU codepath was removed from drm/msm. I thought this was
> > only affecting GPU but it's also affecting MDSS/MDP5 :(
> > 
> > So I guess no panel enablement anytime soon until the IOMMU situation is
> > sorted out, for both 8226 and 8974...
> 
> If you're sure the panel drivers are good (e.g. they worked on 6.whatever
> prior to drm/msm saying sayonara to carveout), I think no one would object
> to have them merged separately, so that you don't have to wait until
> who-knows-when and keep rebasing them by hand

+1. Please submit them and cc me so that I don't miss those.

-- 
With best wishes
Dmitry

