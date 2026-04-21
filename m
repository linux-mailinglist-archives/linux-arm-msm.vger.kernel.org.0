Return-Path: <linux-arm-msm+bounces-103985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKMEJSPj52nMCAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:50:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98F43F8F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D28301F322
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 20:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836213DD509;
	Tue, 21 Apr 2026 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bH7BWvrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQ5biy1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0C36F41C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776804535; cv=pass; b=JeI2BEvLFVOlu5N9CnOfgDv0xBc7n1Gu+z7136k0DuM2kCRSrTwaNMpiUCj6xN4282a4XmtBUObKHcS/Rt3kTeJS66c33zH4oObasl26EbjdoYeXjccD6M2zL2sevlg0kwoW99QpPCDslVD/cQ9uoDkCMyhhMTYCk06rXjAJRV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776804535; c=relaxed/simple;
	bh=3NL8vQxNYpeewtA1WBaIEx7QCJb34UVwH3Jliwl3DAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBwnJWhH+Iapd3ND7C2dKFz1S0xQ9aXh/GbMn+XxsZ0dwzJITYuz/7BWkJnD2QLuF13vmm1aSMf/uac1cJK5+Fg32AXbtzF807dGjHeqa9dAhMbCNAt4BpCzS+2Ed/ghlRi+VTkMYv3MxUhUjmd1eUeY5x0rISUWWT5wxvFjpck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bH7BWvrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQ5biy1d; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZhZH976179
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=K84Km0y0mD2F2Fi/couOcnPy6rSeHjToADl1xZZVRyM=; b=bH
	7BWvrD2cxuNolAxRl4Ho+HcBbsxavc/eFUS6Wn2z7ahj5lzWaVsqihNXlGdXz7PA
	NV+IWpRcyFfUOZ2nY2HsliDQPYE7YHI+4UcalkNioXrI0BanYHAJgaCFbBopxcF1
	3WGgG0DD2OMQCwQM7MSrykLDfSRZpVqtcbge+zcSyMTmyKK3hdJnWPhCbsZm+fOx
	RQoFzSBu8UbkIg/5q1seZaTfqAc9WfvK4SJwYAIihnP4GDNxT+TzKqNS961C4A4K
	K5Hfc2KpC+/H0A4aJF4GSMplIDy96sV4vnAC/MSUrbWOxCjLnl/1j5l1FjQT/X3p
	Il1sur5BvBT8811BDENg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpene8ctk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 20:48:53 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6948df7c598so5439687eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776804532; cv=none;
        d=google.com; s=arc-20240605;
        b=PVTGlqTCFuYHJh7LdSY17v9fTlWV2WVnjK0m3le7Bk3ToRzJ7Tf6HKGtygdRq2ybg0
         CXzIK5SwGwsxGbOu40NRFPCUQ/vbp3isJx1OyrMoL0LZGhLKdtaTYg7cXLkijZXqcRmt
         ZL8CQOUttS3OtTVB3t77QCxuE9uFMMj4Zc6IBx4vCf98iKzZAThUpxhmHLNUHcQ6y3IK
         HJVxjFqCAKTKgWt0xfXudLiKJVahAG5gq4yL/rG5jdxucVNBHIxCv77Xp2puRV9eeph+
         cQTg+uCJo97uLOkeV9dW/T5k9KYACYSQXgCX1RihZjUGZA5fsoBDZz4ByCOSCzX+LKFp
         J9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=K84Km0y0mD2F2Fi/couOcnPy6rSeHjToADl1xZZVRyM=;
        fh=k0jg7usSeAALKtiYxd2Ysqz0DNzwMOFpTSOsSdw3MBk=;
        b=Aa50Fj1hefZQWw2hVbxzoBUrUfYhpLP2jzpfu5wzEG6FCrmO8UnadmCCQW+KGm5g/B
         vCJazT0OTVRXsKGMscAnQgPSZ62R5T5N5HrjvkdEZ7vjtfhioJGIVo0UUs/XZBg+gvkV
         w7w/v75A2ntojXmALD1PVb92hRD6XxLOKAD+ofanxO/Dd6WGiZdBWquCejkdvQmnvWDP
         g/tXuOFibgY3/f1siUDHNcFVde5MUK2fmj7c2E4YMTGMjNQOHfdskJ8IvzfxmmY/cLYX
         v/MlXKug5FBB0/LtM+0vzp6VPGOCjBdg71q89vWpl1G1FSMBp7DF0j38zaRANusCYlKo
         V1Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776804532; x=1777409332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K84Km0y0mD2F2Fi/couOcnPy6rSeHjToADl1xZZVRyM=;
        b=iQ5biy1dybPzmCsXlm+mgeI9U9p6z1ynOvYVz1978JUftT9EYUstxu40x9VBeOKIOj
         Du3Evzt4r1evDToRyU1ggmv5adTv5FMVM+wOJmDp0LYLZYJ+ShFeYnCAotZqA9aQXXRT
         wgd5ys3WQGN7FMjNEQpb+056FHTFXICGcPG0F0osb7+aJYvy45aTVCb7GRiSWVBn1TEk
         Yl/SHxVLa6LCSuMKKHrtPmaQd91Hi+0IjzzTMANeROofNFnhe0QCV29txhBzeFovadgt
         i/X0PfcHr49xyuhGvbrLF02ZIL3JSa1IACiKIjkheUPY48r7m72Zes9kzWGCmXZn9TWs
         ZIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776804532; x=1777409332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K84Km0y0mD2F2Fi/couOcnPy6rSeHjToADl1xZZVRyM=;
        b=PJ8Kwo4XliTJV78s9+iCz6tCbr/O68QkIjGxlW1nDYFe/snhD/9GwkoVMdfWR3xtb3
         xs8RqnqQWoYY8m9u96TQpAKCQDFj4NALQxc7TaR9XOM2y0MYmpxfaejBEz9EYc5jrNZO
         c5cUwpUxBVqZuUszZWf/oEcGxPeW7CmZmNP99fkLgR44Getm5SgVL8tF65iqdLABba6N
         e5xZIJoCMjnghLhtpzdq4NOTvssYCOGNhdkIppR3qPKBMAlgqNImcbxeszhXxBosa2wR
         ulwsWCi3Vu7i9iiceXFln9ut/xMoY1hLuKU2yIHmo2meKOZYRMytXvmrPHr5ylrxogOx
         y/nw==
X-Forwarded-Encrypted: i=1; AFNElJ/8MfRfCluB5TbbCNGdLiNFr+/3oTMguFJZMKef8U9Nub36N9r4+c5FIwS0xK3d3icquejojk41oRvs1yfT@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNDy3xvG+GQNks3SBxJQY27uF/BiGQkfB2nr1x4dmLhNCxK/o
	0dDQLIG0hJiXsWpVWW6rI4QkkxxuAVykZcJsrDGcvWWWh4herZTZgORxwG0JpmJM7Ai11w1CnfM
	8eBAYZcza+YSDp9dwzbSxOXYiyP2o71/w7Y5B4EKIfVQmCktCVAtqWS8la0TGxr7vDJjFq5zgV/
	fihzkkjwjaf/vTkbRJHHPVRF5JS+kLtGlE2oalnAAXJXA=
X-Gm-Gg: AeBDieuYGk7xUmDGHjyZs6izuKf2F98zSM8g73M0/xW5iFWEPgGJgrTJcBNUkJjbIGR
	n13OiH20YD2ptPOSIDYGHCh2SmArTVK1LLWMg3nxkfONpIRpqVxAs3XKz//K2sH0LXFK3DrutCx
	DFGv4BhzwZ0/FtgAb6r7Ftlow/JwJ4ndWvMmS1j+am/UlmkC4DxOWYLYmdexIn+3rjjOKZfsuWL
	WG+glzT+5Grk8oIi9sJTQ8Q/0v760eiLlR43AqBlY5s5Epq
X-Received: by 2002:a05:6820:1c90:b0:694:99de:9989 with SMTP id 006d021491bc7-69499de9bc9mr2087133eaf.32.1776804532525;
        Tue, 21 Apr 2026 13:48:52 -0700 (PDT)
X-Received: by 2002:a05:6820:1c90:b0:694:99de:9989 with SMTP id
 006d021491bc7-69499de9bc9mr2087112eaf.32.1776804532128; Tue, 21 Apr 2026
 13:48:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-2-robin.clark@oss.qualcomm.com> <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
 <CACSVV01TK+iLiaCofFfPU2eeMGT5HX5iW0rf=m+gjojXsjrk8Q@mail.gmail.com> <puvvx2h2jnoxej42blcdx357uzx37ogwnqldcynklmm4acameg@4zvnrueodcon>
In-Reply-To: <puvvx2h2jnoxej42blcdx357uzx37ogwnqldcynklmm4acameg@4zvnrueodcon>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 13:48:40 -0700
X-Gm-Features: AQROBzDFDQHwJaqNGHFr5d-xcCmq3Cpb_DY1TGCm5x6Ra0ytgXqTL1173n8uPzU
Message-ID: <CACSVV01D388voqDxmfOm_qhV3=H+F3YW2oUjzZT7MfKYwjapDQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/msm: Remove obsolete perf infrastructure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDIwNiBTYWx0ZWRfX340gIJXr34xd
 7pTMo7XUsy3P4IKOFoPhNAoQT7wDc/JMLnxrxgAMnPavpt+fhwOBzO6NTXaS5ww3jjs98zJrFzc
 54SGtoCZSknJHiOl9jG6cd2WpG/DIdjhnn5dNAOo/6jlBVVtIS7alIncH29jS8zLOIF/BI1vlhF
 +TVWQ7C7ef3mDNjIyaRD1/gydVd4aIebMk16YxLsaI+rLukYQC7XvSrngf60v10mCiEopOe0iJD
 ZvY/Sz10oqnbGh0p1UlMSog0YNCs5UOxtFnkGfVLpkJtqx4OsFiyZ+i/868h7/e/f5VH6pPEcQ4
 nbZQUIvNQSv58KFR1N1VWE5kulUxtwNXLR0bc4/SRvVIRCr9iAhUChnUUhbxG4Qhj8ef4/gHEAB
 KorKqJo1kaGeW4Ql9p+rH9+FsXJwfd+amYTHYMur8ZbqvCvZVQAnfy2nH7Bwf4byTYeUgUM9Cz7
 nkSx01FYWhsNwz5PHTw==
X-Proofpoint-GUID: l4l486-CtQMmglB_-Ci3uxKb5CWVrcva
X-Proofpoint-ORIG-GUID: l4l486-CtQMmglB_-Ci3uxKb5CWVrcva
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e7e2b5 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=VhXg9fDGKa6XFcNS5h4A:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604210206
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103985-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: EF98F43F8F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 8:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Apr 21, 2026 at 06:07:20AM -0700, Rob Clark wrote:
> > On Mon, Apr 20, 2026 at 4:49=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Apr 20, 2026 at 03:25:23PM -0700, Rob Clark wrote:
> > > > Outside of a3xx, this was never really used.  And it low-key gets i=
n the
> > > > way of the new perfcntr support (or at least it is confusing to hav=
e two
> > > > things called "perf").  So lets remove it.
> > > >
> > > > This drops the "perf" debugfs file.  But these days, nvtop is a bet=
ter
> > > > option.  (Plus perfetto for newer gens.)
> > >
> > > Would it be possible to resurrect "perf" later? It was really useful.
> >
> > Nothing is impossible.. but I was having trouble naming things with
> > both old and new perf stuff in parallel.
>
> That why I wrote about resurrecting it later, once the new stuff is in.
>
> BTW: do you plan to get perf counters for a3xx-a5xx back? I remember
> that there was some issue with a2xx ABI.

So current state on userspace side is that only a3xx/a4xx are missing
perfcntr support..  although it looks like we know the countable
enums, so probably not hard[*]

In all cases, the existing userspace-only support will continue to
work.  The main reasons I omitted a2xx/a5xx on the kernel side are:

a) Not really sure how to do the Makefile bits.. since they wouldn't
be using a6xx.xml.  In meson I can use a table (2d-array):
    https://gitlab.freedesktop.org/robclark/mesa/-/blob/fd/generate-perfcnt=
rs/src/freedreno/registers/adreno/meson.build?ref_type=3Dheads#L20
b) No good setup to test
c) They don't have IFPC

They could ofc be added later.  The main urgency is a8xx, since I
don't want to add mesa perfcntr support without PERFCNTR_CONFIG (so
that we don't have an older-userspace, new-kernel permutation on
a8xx+).

I don't remember about a2xx ABI issue.. but a2xx perfcntr stuff was
added after I was already busy with later gens.

BR,
-R

[*] there are some counter groups that had some slightly different
config programming, like separate clear/enable regs.. which I haven't
dealt with yet.  For a6xx+ this only matters for some counter groups
(VBIF/GBIF, maybe GMU?) that userspace doesn't care as much about.
Idk if that was true for the earlier gens.  Eventually I'll add a6xx+
support for these counters, but there are a few other things to deal
with first.

> > Is it really adding value
> > over nvtop?
>
> --
> With best wishes
> Dmitry

