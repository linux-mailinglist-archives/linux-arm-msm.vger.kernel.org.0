Return-Path: <linux-arm-msm+bounces-90611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOQgBj27d2lGkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 20:06:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0B8C54E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 20:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D24A9300468B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 19:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19D226B755;
	Mon, 26 Jan 2026 19:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNgabcq6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0mFQ1+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B891156F20
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454392; cv=none; b=AgvP2unm+Kqv/tbu5CqTd0gc7Jfex+rnDcHrTPHw/zIXjsV3Jkn/sb8Yv5+00YViVsf7JMcT7xl2KOlXHgJ+jNT/2fKSkS3/p8oY5ZFCrlYoIu29FOyHlxwW3nH0577QOog9qO/+3mUKwNPuNscO5rb7ZEzmAPhUPqXUoXSWDaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454392; c=relaxed/simple;
	bh=Vc7qpgtssUWVLlBgX1+yIc01wQ6fyIU43Tq94cpSw6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gm8Pgi4yE99/dAIU5XIxDGpkdU9SAUfmQkWiTH0i/M4tL/W/xkBwPkHfIn4cdudGd5nyfS7VYhbIGTt/nksR/0x7RBQJtwIQkDzP8ceZoFYVG/w/oBbIhuX2CCYCpkiQIistSMz27vNX3q6yjGeHFZhZtE+fYZZPsLDl2mRdQzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNgabcq6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0mFQ1+3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QI4YKt437561
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=; b=BNgabcq6SW2ytwfo
	4uTgF7dvX05saxO/C7YR+sA3rimUP/8WizBD7V1nrMJmPr7s+Jdx4jN/8IDKi5pr
	bujtO0yQ0jjkGnfCAPPRsBIO0ujzOp1LUKIaPKkvWq/52pQsV97GV27BAhpPUjm4
	iVg57RuM6u3SQ46WBqbDUNdIr1qDTR4nbMVdAXtPkISQepps5TCrls3DblZ5Bbm5
	QnGhUZPPM+O2tNhbxjyptgkNxyekw3eQ6MOXJgcfVRox4zbYwtSc21oJ2+92iBk+
	EV+LeZc+slStHTDNlk8oCfsR60P1RgF77NpJwXYXJaVkN85+etyfR3m4wffJ0EGZ
	ShO7tQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uwkkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 19:06:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94834f7a238so5680923241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769454389; x=1770059189; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=;
        b=N0mFQ1+3FqhpTjXuSEoPxjKl2zFU/BL16t0GkpVDa2yTURnDgC7MZYy0ed+JMJcT4N
         GiI4YaIuoR8n0kbYwHS/u3swMi4zK9AcydjGAlcifCli5D2HXSha2ytolKOq7lvLy2b0
         ZdBRcr3Bid7VmF79CtXWjAAxYV4Aty0TzqSFeLTW2r3WziDUaghc5VD9HciLkm/WdTi4
         4OQsgg+oZBexz4roHK7jIuIUIDNDOXWsCa3CY99nf8zWXOoBd+2zTnT63spNkTo5zjsP
         7rXIskGPclhpYQEKaqShCkN/a2rhoxvvLA90QLWYxJCObSYz9UDaLVmiBaS+fcDgHGbJ
         buug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454389; x=1770059189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=;
        b=di+rmpTKNa3M2GL6ZJKfYH2f4McRxSIeTO4y1Xvx9H77PUfK912pnk4GjNbqFei7ox
         Hiehu88S+4HuT22HkCsIG37WDOPwItPfAifUyoqgDJBo74/xa/mxUOKU7oDHVMfy/ZYR
         cA4hhsYnkqb0Tt7Q53pNH/+lRKQ6+27TI7TtMhejhorDp/3RTXQSA3xuPU1bchy/oxXH
         VBk1KVrN7Cr2iz0B1NMthJzZQtniiPF9MJcjR+5ua7HozJ36k2BCGF5ttxYji5560z+G
         iOqghtxObT3Y3IHzl/OZNgPRr0GzuAuanyeIL+EMJ7JgX76xXKTJ7gaIkMpYW9emvC6A
         XM/g==
X-Forwarded-Encrypted: i=1; AJvYcCWkYwvyISyPGfY1pQs7z2VcUku1IkhYE2HBJK8XCcO96SW03gSMrXlZ6oHF8qvlXv2Gpa708CzsOURZtqTI@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwT+hpJ1sG7GYQA8t8tV6KZTk4F3eHc1HEnUVWd0MCA2RwNBq
	JN2i7aT5B2fADzcYWF+0mvAFjrTxrIOUcyL4mon/7TGzpX242mfU0HZUx6pfVg7q13zjy4TF5wj
	QHxcM8jwe+8qJeIVkwhBNi8S8n9UXgcRwsFfkdEbrL+B7lqLCAOCoSmHXHkj+lKnIfPMd
X-Gm-Gg: AZuq6aKsNnxJmlSJoTM76iA8CbXH3MmgL7uoa0cnv90FOfjtZklM7uwpKj06QRqxopY
	zCaUoY72Sek08Nk4PL7p4/9sgn8HOB7A3UxsuHwB1m1tSS5Hw8Q2M8QedIGWUY6SLYGEsqSnAfq
	2/Ht7k3cYYTvFck9SYkfV8nVIDAwC8e8OsoUxsvifLMBMM105ynNACqTok3Rtpz4IH3rmSyGpCv
	053Su79YR0/71mapxYlZzAOybveqJVqT8sgS8sAHADtsFXmSBbr5BAHZLMV5Ukq7/5PrJpOzF1h
	FxRhwBoOzKT+SMegeZw+RB+A1scVhkmH8zu/S3gyWApY8r7cnrXnyXzN8ZFRCwWla4hoG+Hw3fG
	7rRe/DETwTFe7df2GdcqijKxeywOOc2dQmyL2A+/vnBgcwDke4uOMY2kx1LwqiQeJSF1Zvdg9I/
	ZdSIFaRp5cYW2eHjzXo6tsaBU=
X-Received: by 2002:a05:6102:d86:b0:5f5:3c38:c4bc with SMTP id ada2fe7eead31-5f72379c561mr45488137.23.1769454389113;
        Mon, 26 Jan 2026 11:06:29 -0800 (PST)
X-Received: by 2002:a05:6102:d86:b0:5f5:3c38:c4bc with SMTP id ada2fe7eead31-5f72379c561mr45465137.23.1769454388494;
        Mon, 26 Jan 2026 11:06:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df5b3sm2898858e87.6.2026.01.26.11.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:06:27 -0800 (PST)
Date: Mon, 26 Jan 2026 21:06:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
References: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MyBTYWx0ZWRfX42QYKzeCXor2
 sQqfJDRL9RSm6YgPUfGRJV6dhg4sBt9ePsBBBMvLcUztYkK1NMsTyWHgVknXjOi4Hhp8Gy+tJSy
 HQ9GeZPFTD26oJuXSAj8Y4aXQZO7ttYbHiCcgQeBrqq1uv+QjFqnUcUACeJ8kOkatwpMbZC8Sku
 ueXSxLWlq02uU9ytg1eKWn4w861p8LhaEIKC0Wb1jLqo/yOKyJDLHZg6njbqfjsJ/cK3XRTkIK4
 W7FemJpyr2HhaMX6e7E0NHKHu54wCHEVH4rGznP03HsdKgT+P2cvIUSCnNgXFLS62H0zg81iaOf
 xLbGkgII7AJKfr56XfUTucVfMFvV5xhStGFgieWCPUF8E/m+li1X6aWfwe85bS3Y6KTL2RkFeAG
 i8fWEh3Gtozzk3MM3Am6Ews075zSTuqffOmJIGYRTw08RRFPKJreTvQUGMLp7BAtxnCcFUsNl/n
 sLgnDAeazBHr1IjM3fg==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6977bb36 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K78EwcQ-zvPrcKlDjY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 2YK12H7UbXjBBEY570wAUDTtKrNBTarW
X-Proofpoint-GUID: 2YK12H7UbXjBBEY570wAUDTtKrNBTarW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260163
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90611-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41C0B8C54E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 20:31写道：
> >
> > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> > > >
> > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > > > >>
> > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > > > >>>>
> > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > > > >>>>>>
> > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > > > >>>>>>> is called from the CRTC side to ensure the topology information from
> > > > >>>>>>> the CRTC check is available.
> > > > >>>>>>
> > > > >>>>>> Why is it important? What is broken otherwise?
> > > > >>>>>
> > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > >>>>>
> > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > >>>>> engine starts without a valid memory address, which triggers
> > > > >>>>> an IOMMU warning.
> > > > >>>>
> > > > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > > > >>>> exactly know what is going on.
> > > > >>>
> > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > >>
> > > > >> Sadly enough the text below is not a significant improvement.
> > > > >>
> > > > >>>
> > > > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > > > >>> during the plane check phase, so that a plane can be supported by
> > > > >>> multiple hardware pipe.
> > > > >>
> > > > >> What does this mean? Without virtual planes in place, there are no
> > > > >> multiple hardware pipes.
> > > > >>
> > > > >>> While pipe topology is decided in CRTC check.
> > > > >>
> > > > >> ?? What does it mean here?
> > > > >>
> > > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > > >>> framework. Without topology information from the CRTC, plane splitting
> > > > >>> cannot be properly executed.
> > > > >>
> > > > >> What does 'properly' mean here? How is it executed? What happens?
> > > > >>
> > > > >>> Consequently, the SSPP engine starts
> > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > >>
> > > > >> IOMMU faults. There are no "warnings".
> > > > >>
> > > > >>>
> > > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > > >>> is called from the CRTC side to ensure the topology information from
> > > > >>> the CRTC check is available.
> > > > >>
> > > > >>
> > > > > Thanks for the patience!
> > > > >
> > > > >
> > > > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > > > during the plane check phase. When virtual plane is enabled to support
> > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > > >
> > > > number of pipes
> > > >
> > > > > decided in CRTC check per interface number, resolution and hardware
> > > > > feature.
> > > >
> > > > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > > > So how is it relevant?
> > >
> > > After revise of splitting plane into pipes, the number of pipes will be decided
> > > by CRTC check for both virtual plane and non-virtual plane case to unify the
> > > plane handling,  instead of assumption of 2 pipes at most.
> >
> > This needs to be explicitly written.
> >
> > > >
> > > > >
> > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > framework. Without topology information from the CRTC, plane splitting
> > > >
> > > > WHat is plane splitting?
> > >
> > > How about: s/plane splitting/splitting plane into pipes ?
> >
> > This plane is not being split into anything. It's being mapped onto hw
> > pipes. But before that, the number of necessary hw pipes is being determined
> > based on foo, bar an baz,
> 
> Thanks for the correction!
> 
> Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> allocation occur during the plane check phase. When virtual plane is
> enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> be needed, so that a plane can be supported by 4 hardware pipes.
> 
> After revise of quad-pipe, the number of pipes is decided in CRTC
> check per number of interfaces, resolution, clock rate constrain,

Where?

> hardware feature and virtual plane enablement. The decidsion of

decision

> number of pipes will happen in CRTC check for both virtual plane and
> non-virtual plane case to unify the plane handling. Before that, the

will? Do you mean, after this patch? If so, please use imperative
language. See Documentation/process/submitting-patches.rst

> the number of necessary hw pipes is being determined based on
> resolution and clock rate constrain.
> 
> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane mapping
> will be skipped for the first time as number of pipe is 0.
> Consequently, the SSPP engine starts without a valid memory address,
> which triggers IOMMU fault.
> 
> Defer above plane related operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.
> 
> >
> > >
> > > >
> > > > > will be skipped for the first time as pipe number is 0. Consequently,
> > > > > the SSPP engine starts without a valid memory address, which triggers
> > > > > IOMMU fault.
> > > > >
> > > > > Defer above plane related operations until dpu_assign_plane_resources()
> > > > > is called from the CRTC side to ensure the topology information from
> > > > > the CRTC check is available.

-- 
With best wishes
Dmitry

