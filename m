Return-Path: <linux-arm-msm+bounces-97533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAS3DQsktGl7hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:49:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CD2854BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BB37305DF0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C3B39DBD8;
	Fri, 13 Mar 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYkmE4+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBdtVtG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59219006B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412064; cv=none; b=hPtdZ4j4OhaM/mZGEkh+NDDJ65TS8dP4HooUWdeCzUF+oqrc+k0fjq32HXaqsUmRVaSCu1eN8oAyZ3yWHSLgqZJuTEKjRQvajktNMtHMJUrgjZk1uxAF1kooCr4oemO8OIPaQJe4qoTeENiwwlM9GC71lD3zl6LHGZ6G9Q5kRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412064; c=relaxed/simple;
	bh=BACkZW5/adrsVrKckEKfXL69KLe9JNUj0KfJuOR+9jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZvv4Ez65SEdWxmlZwwpyNe74h5BwXIvKIlxFCvAEzV43Oh+e4tR/hFK3pVskSJC3R9Y4oP5OcIufFyO8iZjG7AKx40azGwvAc98L2lLgVU0mAJv+CO4urwcQqlrIegoZGOrWcNF6bsaT3fSM2NTQYWyJsGbwaMrTyb/uuH9gJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYkmE4+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBdtVtG2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsEP5525628
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1UfQVZ3QMmjbZwV3Ni6xdPVm
	80fQVP/YkVW72bzlpf8=; b=UYkmE4+nVezerODJyFx6D+p+tk7h8vZ9Z+rSMR4A
	9XcuxT+lHciUiVhuIlo7s9gQchOOGoPFLoDcPrkMD5O9PH2sqOL+XMtjsooCJ1j5
	nmh/G8pP2uRM1AZhdLrhp7l3RK6nXgsutAiNi0GOsmO8E/t+4yeEpLNT4aNpFCd7
	L9VNqh5AhseK7+7uBqPKqhKsbBpcK0Nx14czqCcK6KuPqoQWVlcNB+dRr5BczJpK
	gSMzrglppQGVawOlvMBQQyq0N+gPukv8hssXFw9axEFKL9fkrV0nEarV0BDLCLqn
	HINcjLpTmcdFm7A9RTss3G03BJlE4My2WxP5ip0T1/+HGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84rnxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:27:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so1404924785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773412061; x=1774016861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1UfQVZ3QMmjbZwV3Ni6xdPVm80fQVP/YkVW72bzlpf8=;
        b=TBdtVtG2ktuMCGReLXNbv50g/O7/sKT2d6iBeAbzkGJj+55jX8bVmMk4uACK5gx2T3
         imP/SZ5ntGn5O7/PotKokgMILEuP//Xd6IYF+O2akbJwu1ystKcpG0u3LoENtJ8SC2k2
         wTHHdmpZRl8D1on+E4UIckUDxCttf1vKP1WiLgrVyk7mM2GkKxAuyj/7c+vqLPxxafJN
         ugBS5gTEXmL3Fyu0yxh2hokyIwdySWtvEGRaIUF6cc5NyUMgysuHonxVP/lON6sNvgX0
         JBpk/8/gG9U16WDMbyZ5dv55VS+T4yypoQlNsBrw+6ESFTS1r+IbYLuUrggazzsPX/F0
         uEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412061; x=1774016861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UfQVZ3QMmjbZwV3Ni6xdPVm80fQVP/YkVW72bzlpf8=;
        b=sYtpJA2KR+IJSo6U0rPSn/vuTXc+7vYOwzAfUh6RtpmXvrkQiWsItLeFHRbT8dGVtq
         5qGtyVGXe/O4+VMVXFh1zKEyCoxu4WM7sKGVcLto4hgZymhtFCG8x7DOYMhl76eRdJ7t
         nJ16oG+3rgc90VGLI3UZGfXKa6K6prSkOGh30Akzy7Csx+kemquzeO4heFxTAnHpO6rt
         t85Nvs47wKVEqOqG286IJ0TKDfdvvhz1xTrggyn5eQW7UCmP/ebMAF4INvOlX2qKyul1
         I6ouIgD7spPaoME4ffGmniKj2UsptGDeCaaCyDhyQQqETBsbNh6zFDqMvUzfMgNf+l/5
         36Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVoMpW2tDK3oS0IVu1PD4chsaYMg4nlvsN/hBcSV9la1yCqhI8LsOJYVH9hw6jKXSjaURiU6F2G3yZid4ma@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EHRdXIgNSk1+afeqTgkQUK1BnawX4Hwm5sDmRyfiQ1DQBYDU
	MyheTYnLW5SztZcxX2pX10It8PWXR8Z7ltwRmPqNrh881Tjyl7M1LAWGQLdJf0tPhoPW9AufJVo
	zL6Lg+vLkUa1xYvJDpzTGeKcMRMZAa02apLZgsbIlvLqwtDaI1KCPwa2WkEeIgYYemjU+
X-Gm-Gg: ATEYQzweHHIhVgjI9iDiA46pLReybAOpgvx2hsVCOCL1PPBeZkzMSGPHNkp0U0YSfTd
	qH9ByCDj4mjkniYtwxszQIKSNOq+r0mPppUpxNmp4Od893gVmbxvsjoQvQgpGZyibflfMZnyigl
	CzQnWV/H3iJiIATMEAUN+N7Q48TEjXXKVx++6E/qwCXG4e4hMyR8RCvljG39WKpA9b93yot68ag
	HCQMjeiH77NJ8HkjRQmpLQQGu0PQeGpfqOpcOGJxfALwcZ/UagRlvKKzcRMpqdNHvW2ICFhPSAp
	wkIjKe6XD8NkHgp6pt2SLlmHSN0FbBS9XOWtaPlBgtzeuusyJMzOx6qWNCJ7sDDWJTPdSartV8Q
	vLVn6bzEhPQ5dMHk4nvxcRFk3HJ+c0FmD6Gbw5K+OOZUCTJEn/taERTKS2mtyK0YLgfDThaC49/
	qtc30sP8VBAHlSv9+scyHPTGvYMTzqjqr/ekI=
X-Received: by 2002:a05:620a:5350:b0:8cd:c02a:657b with SMTP id af79cd13be357-8cdc02a679amr91876885a.16.1773412060596;
        Fri, 13 Mar 2026 07:27:40 -0700 (PDT)
X-Received: by 2002:a05:620a:5350:b0:8cd:c02a:657b with SMTP id af79cd13be357-8cdc02a679amr91872785a.16.1773412060123;
        Fri, 13 Mar 2026 07:27:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm1568740e87.7.2026.03.13.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:27:38 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:27:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 19/27] drm/msm/dpu: invert the order of UBWC checks
Message-ID: <m52qs62cjqdrdidtu4l62voxjifyeb25hl33kk6rumgst3vhyl@jcdjmhq2fgdx>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-19-b7e8f800176a@oss.qualcomm.com>
 <7ed3af47-daaf-43b6-8d2f-dc6b528d2c00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed3af47-daaf-43b6-8d2f-dc6b528d2c00@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b41edd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=C14lroEPiMBeiew-kZ4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNCBTYWx0ZWRfX0uckHDpuR1CV
 ocZZ67BOJoZMClsLurHNF5NroBnXWTNeoCb28kFDpnaCRyP/BjUc+ZRxztCO7DDHJ8kAXvwtjZu
 2BdQBmWyvPZ2O0IloD8VYy5obGpdIVu3JKd017HaaV28/hXmFoH9Olh0XRnGGGJp2hvxYcQTP96
 /ii07kAFEACmViRZbyRtwovqnAHJkoppAAHee8dYS6svWi1LM+lC4V3TjYQ1m3APBwXVB6w3fX+
 CSjR/0LiW5EXK4uW5uJjdvKroXCzfF7kt3KJElfNRwQeyb5viXSfv6MAbwpK92S0tAhajTJhJO0
 MWsyh3XAfytLo1vDZVDMmdM55boPShVcg9nFyr4KkDOCS+BQ7rXfTDn7bsKG4+UDNv7SGl27cQJ
 gVFgZh636ojQfV9yKZbzFbTarJkNA2u9jP0A/iOFEiYUdajiamgkqAVFrK7d5juLblIpOHSareI
 6IFNqxK9Zdy8Z3eQeaA==
X-Proofpoint-ORIG-GUID: 8lBawv6z92ALJbpuSEd0Cpf5bK1c4rk2
X-Proofpoint-GUID: 8lBawv6z92ALJbpuSEd0Cpf5bK1c4rk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97533-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 371CD2854BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:25:18AM +0100, Konrad Dybcio wrote:
> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> > Unlike other drivers, the DPU driver checks for exact UBWC version,
> > making it hard to add minor versions if necessary. Invert the order of
> > UBWC checks, letting the DPU driver handle new minors transparently.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 
> >  		} else {
> >  			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
> 
> note this is existing behavior, but do we want to write to these
> registers on platforms without UBWC, instead of returning early?

I'd really hope that developers who port DPU to such platforms will see
the warning and fix it during the porting effort.

-- 
With best wishes
Dmitry

