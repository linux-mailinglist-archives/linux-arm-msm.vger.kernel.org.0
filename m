Return-Path: <linux-arm-msm+bounces-92647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI9hC5mUjWmI4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:51:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362C12B913
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 601F330074F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 08:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6716B17C21C;
	Thu, 12 Feb 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnDwNuJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLCFX+1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A02BE647
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886292; cv=none; b=rcypCDGZAnTYW0t7VIcGn9R18GAxEUSXvK9bLU1K40S0hEy2ZEb1bPUO1mHKIq8F52A3YaEIcnio91Wm8Gpz0Cdy8GILnsrH0LW+d2797gYTs5Yfv5XcPuwotQq3IkPTLDg+zoPbXLWzrYOC7rnPl4SqVRP4jj81tJsvJmw/e6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886292; c=relaxed/simple;
	bh=XE6TpHh/T7ne0t5BpRvkUIHT6EpqjBnrWgQsvurFYB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AafGKuhPDAgRYAh8Chzp2eB0c+XnFYa7MFfhf41V2W+Rqtyj3bT3C0UwntX2UpeQqdGl2WuvmNtR3KVRuinyX6QXvD9aKWgeCL9XUtHxsmur0rHcejxjdkJxZhKrPM6tz735R9/h29cGyO6zi6gkYiHNAlEK4IqTPAwZ1OyLVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnDwNuJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLCFX+1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3Rx9u2545019
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2lDuVV6NS6Z7BmlriJs7dLuO1aUiohzAfUrMrJLlmk=; b=AnDwNuJ/DSeBOVIG
	BLBqJpteiRZoY2hcrHBFJH7O2O0hLQ/mxaL18qsU5cJ4fuQQNYP7LkdbEZbQc9mF
	J64v+F35LpOs+z1ZZOrPLL3sBQsnewRr2R5hsYoYHtFYTYHuYFAfojnvLG3jnLbW
	XEyRmR9wht7cN0T981N+K7rE/Ex2a5+xFGW/Y8U4A5cX7YiQJVtHvHk/7G3ae4rb
	wM3H8Ls6pdroy+ehkGqwllqrcQblB4vxzSPixZM0ZCS9mGOjzJ4s41KPjLCPZKhq
	c+dwKOXtLr2bi1uktnYlwcKZRz89dHjGrNLAiZVC8PWck6+IFj3tDKhgK/RYGMI5
	SUOQRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpjks1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:51:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a94369653aso83047935ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 00:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770886289; x=1771491089; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2lDuVV6NS6Z7BmlriJs7dLuO1aUiohzAfUrMrJLlmk=;
        b=aLCFX+1XHcY/uh5tZsPRfK4IMauOY2nDZHEYti3vb7czpks6NthxWmCxwqyTncRss9
         A3ehy9sZ+nHudtVRrhMhcjymKg0WRr8iiDtyXbPcQvU2enh2AFXtR36b7jMJX0qyqJKI
         BEOSMIVKztOvn2vzIy9r5DqyoMxeTzY6owqNyIa2wNa/m6XIFZur+U2zQ6JYeLEp1X6n
         X8aXy6XzHfwVj9x/xK32/vd9PnEkmB7hy1B8u34ACxjRaFZBbLI8Mu8v36d6Nr3QsnGI
         iRLtZROYM9mi/3aILZUnc5S7tdclOQbLJrZSWXz/aCdnb7PISjfSN16G6rXZg7pVfGsv
         +c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886289; x=1771491089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2lDuVV6NS6Z7BmlriJs7dLuO1aUiohzAfUrMrJLlmk=;
        b=YZl6OnfCVsL2m+7O+7z/Ijj+x25opp4YZ0w+RvMNjU48A54t8whDVUx96AmfEdKEKB
         QHCoHuMncf5IkyI+8XqvQGW7iOooQGQZVXjIwB89NemM5we1MYBuMXXUgRoIleAIAHGJ
         qK11A13laQ1Tl9upJ9UMp7AopMMAPV4ui8CBv+c4M27A2UNGeWXVq0NMo/pbnBy38mfv
         aGcZAIhhQOoHccubxkhgI4pTtZad7o3HZ9C4zx9P6ssn5zcq/ivty3Q2zjStHqmK7H43
         fp54tHzin//3DC0VUpEcGdMv26v+BnA+Da1PEkeq/Kfg1v7YkmZfjANM2szpT+0h28Hh
         HSwA==
X-Forwarded-Encrypted: i=1; AJvYcCW9PyiG4tbzunINROahW5q8p3fvaws+erDAxN8DR1xyuQ4w+c8rbi6YnETctAmQem/9eJSPFIOV+p24YhBB@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEQAyAowvkf2IfIf/BUvzToV5xRm1x7j0gNyEf9lqHttTXpU5
	3G9CRSQqgu8MRjn9SAwv3gjRHIA0totSy3b+/wRLtF2tibIybKB92qsN6gJr3xoPzUXw6qXOqh4
	/tFOt+q8MFHqLULfMlV+xnZSxfyWcebsO2Icp0qgq2w9YcQwf2AlNBqNyPutwLfSdEYvR
X-Gm-Gg: AZuq6aIatdIJwJrXzePAeyQJL/0ph1Ys4ZhmioQrGbdaHnxiiIV4ZO0yyFo3z8KxSWQ
	K/8dh+a9kkZllLfFB60vlgaR5AQYHWb7U8d0BSsC0w3qURge0noeO7l67vsnmC67HOaxuPdwY5A
	FLq1lwU3t5y/uyiZ80QlO1TKjASQaTk7bnUmZNkgWeuS5yzs+kHN69cOGhiXHt7/RF4CQ1nCOMp
	aEofCxnE9YjvDlSNzuw+mnCvYF1OPfPPQ/L2dC+Vfx1Oq8BJqIolzf8V/2JGVm93NU4s6nvH+51
	Vu3WzjytTMiW1Eojg5qAsfT8dqvEKS/9H1kKODapL6imUrwCRzK5r6YK//RZcvUYaCP8qq1YLPK
	cbMm1Sh28Ya47hEpH/HzPE8n6OG8CTwD/qznCZZmEYI9eEJfuzeA=
X-Received: by 2002:a17:903:2c50:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab39c426ebmr19170615ad.37.1770886288766;
        Thu, 12 Feb 2026 00:51:28 -0800 (PST)
X-Received: by 2002:a17:903:2c50:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab39c426ebmr19170345ad.37.1770886288300;
        Thu, 12 Feb 2026 00:51:28 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2986ebd4sm46805465ad.24.2026.02.12.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:51:27 -0800 (PST)
Date: Thu, 12 Feb 2026 14:21:21 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Saikiran B <bjsaikiran@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, lgirdwood@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow
 regulator-off-on-delay-us
Message-ID: <20260212085121.65bxxp7xfvny6v2z@hu-kamalw-hyd.qualcomm.com>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org>
 <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
 <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com>
 <20260203162005.ui7sl4t5m32jwas6@hu-kamalw-hyd.qualcomm.com>
 <7da1e3e3-18d7-45f8-9168-481ce8e4493c@sirena.org.uk>
 <20260206161952.ctmzghln5tkqzvn6@hu-kamalw-hyd.qualcomm.com>
 <CAAFDt1uiWq-adPtXiD+i1swavK_GS+SB__+46NN5jtwOopz9Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFDt1uiWq-adPtXiD+i1swavK_GS+SB__+46NN5jtwOopz9Lw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698d9491 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=hqVRMzIdmVMcWLLNMpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -52_W9li3qQ5jD0Ujl8ArEHLS7HIneyE
X-Proofpoint-ORIG-GUID: -52_W9li3qQ5jD0Ujl8ArEHLS7HIneyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NCBTYWx0ZWRfX6oJLZFgJtFii
 +vLoc9qgsXqZGXUmh20JYdu5H9XouKzhQo6N/vufr0tw4S27j2NQ2EDZnmNjESt3BV9eXb0mCOK
 NErwG5YotVvJMESPMgDL4toIMkKrXjHlzoqH8ZxqfB7ByJ9dZhEiYqdtfMBrsxjjZ1YHbLLGm03
 XZ1BCmgBlBBrEpRSVvPdcZlxvmVWOzmG2FrN6qXR7zPBZfUI+0jxg3ZR2Q6KuD6aRTnKjvMRUFx
 CxccyLtWBm79h9R15aTdIeiDvMv3frtPYEuhUrs54k4SbEfMwpjJoEKiMw+EogSiMqiYA8zrc+9
 9ys0j5BXr4tlzFt35FctB3CrQjt6V3NEFkMbsnnPrgW4IsvyLgxLbqSx9jvU6TnQ7HdcezYGAj9
 RTkzsVnJgSaInK5+Rsb9jpsyUQhdxNmBzfXwcsGINCFX7Tf1uHM7vfIGDtcMguQQiNQEz/bhtyA
 RSu4OeVQg5l90AMiLhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:url,qualcomm.com:email,hu-kamalw-hyd.qualcomm.com:mid];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92647-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3362C12B913
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 06:37:24PM +0530, Saikiran B wrote:
> On Fri, Feb 6, 2026 at 9:50 PM Kamal Wadhwa
> <kamal.wadhwa@oss.qualcomm.com> wrote:
> >
> > On Tue, Feb 03, 2026 at 04:30:27PM +0000, Mark Brown wrote:
> > > On Tue, Feb 03, 2026 at 09:50:05PM +0530, Kamal Wadhwa wrote:
> > >
> > > > But I'm wondering if this is really a 'slow discharge' issue, because if the
> 
> Hi Kamal,
> 
> Thanks for checking the internal register defaults.
> 
> I can confirm it is definitely related to the power-cycling state. While I
> haven't probed the pads, I validated this with two software tests:
> 
> 1. The Always On Test: I modified the driver to keep the regulators
>    permanently enabled (never turning off). In this state, the camera works
>    100% of the time, even with rapid open/close cycles. This proves the
>    crash is triggered specifically by the power-down event.
> 
> 2. The Timing Threshold: Through iterative testing, I found that reopening
>    the camera fails consistently if the off-time is <2.0s, but succeeds if
>    the off-time is >2.3s. This 2.3s window matches the calculated RC time
>    constant for a passive discharge on these rails.
> 
> If the Strong Pull Down were effectively active, the rails should drain in
> milliseconds. The fact that it requires 2.3s suggests that on this unit,
> the PD is either effectively disabled or too weak for the bulk capacitance
> present.
> 
> As I mentioned to Mark, I have withdrawn this specific delay patch to
> investigate if I can manually enforce Active Discharge (via direct RPMh
> commands) to solve this at the source. But now, your note that these settings
> might be locked is concerning.

I discussed about your concerns, and it seems that we have some boot side DT config 
that can be configured to enable/disable the strong PD ( its not available
from HLOS though)

you can refer to Doc for same here:-
https://docs.qualcomm.com/doc/80-70023-4/topic/tools.html?product=895724676033554725&facet=Boot&version=1.7

forum to ask questions about it:-
https://mysupport.qualcomm.com/supportforums/s/

> 
> Regards,
> Saikiran

