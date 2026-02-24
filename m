Return-Path: <linux-arm-msm+bounces-93876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMK2KJojnWkkNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:05:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E51818C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D8AD30299C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF0D1E7660;
	Tue, 24 Feb 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCRRUHKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jji4R09R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A0243956
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771905937; cv=none; b=bmzjDupmqB2k6PgnsOKTqzPQJY5Yj3Er0RxdOf6xoRIopx9wIz7zBD6Ry+HTl0EhNUfkG1/jD85JHr93Amwjzt7SkHe4AArW+HxY1ueOSUASXB26f00gvpSmoGY3OLXJtSv+XZbz1EfDHcNHjqlm6x8ubCgEPbEIjoWPOkAOvtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771905937; c=relaxed/simple;
	bh=81TJmYsISJzw2vkYd3W+a9qNHSCY7ZfteqgWjZKnJy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYviAPJZRYD1umFpnHHs0Y0cratcRwRaDvtk3/GOQT9HTpZSnMKol3NjhJlyKvRgtcPuBZXHRKm1BQ2m8e0vMp4KZ36IeG79X5EHDtEITLG9zK3k0v5mLqnYSWS7nh7AJTmExdMcXEJc7JE6qAJiy7wGgvPx8WJAPp8Du9Pf7c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCRRUHKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jji4R09R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3Kou82681300
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=; b=VCRRUHKZyEj7g2Ei
	o1jvMPoTyrzmXILs4k2jjAWaKDlXMNhXetJsHOd6NgfO5Q5NFc1VscLgsk7Aqw4+
	1UajcLaIXaPD3Pq4AQm/vqcdBaD+58lv6LYAFB9sMorLNRMdK6nbr6j7NeB0MnY8
	GV/zYWBsvykHROsJ1I1fiA/g8N+gytAF2eM/KRJdYTheEunZsHl3Z8EMQNt+GSOf
	mjbV9m08EDPgopYSeU+9zry6kHn5ffBmRSxZ8+VuomAtglB5jwEIkwMyEyisil11
	+7iCh24mheFK8U2qva3Ijc+nvp9y0TrBcx7LaHvUbnfuM6YEczI/0xvYA7tzwoHP
	FlRtVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ratjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso3560601985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905935; x=1772510735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=;
        b=jji4R09Ry3RR1ip1d8bKYKYTjNZ6FucZOlrGsK+xGzN8AOD1MsM7pEUwuD9HUp82XT
         FHbGYb7j5ZAgl+byqvkUYPLnZm/Cd7QlqtuS5fAIqYZut0OWh2esWCNjVVHKCdFNDMd2
         eomKQFir7hu4r38IRrJYznkW2a/F5KSJs4ceIxC+c8i5rGlHz4iXzBYhc7Vr0MSE0AII
         VqTMWhRsKWS4pwEN3XEwLTP0udbpLrr0v8yFDcwzWuNFL0wyB3a5v/jsW0P9H+IBNWeK
         ar0pfmktR4RtA+iKz2AG6NAdZ5KSvOU+M8R8CRg4uopnhRMQmphPQbHL4iO6GvGQAoaM
         vEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905935; x=1772510735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4fvuYxVjNpUmJ0ryko/nP3p8aeV4LlMrsvq7BoATTg=;
        b=J0sSBxrt13L/35k8pf0H6dQIgfrOTzDHh1J8J0vYGwGyqBF4iGpGaTckMdrdlzKnYi
         UZRnSHWZSUzzHl946uPCPe+7mK8XoPFK7DOBfXnlk0OE8lMWd2dtMCyYks8ShO2xaust
         NpZnUopWpY2wh0KaFUjKOlPwZ2wSCQ5+p1aP8ffj2yQau/TSK0Fa1qNVQSkhfPMWy+a4
         svb929nY+4sephg/63W4mnf8OvdII32mQWGQzDsiGHiSMUMFC6lW1XVLvJBH1uBbkEoQ
         mGnkyWSlEzVg+jFIIPdovqgsqaU6TmfaCVlyYGidNbVDmDCkP0MaAkfKNMp7+ataGWFB
         blKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy8SNdodowTTiOeLiCi/+nXm+fEENOOtaYxNSWMtWNZc7VUJjA5h4yH8oqo2NSs31OUXlnb4OnsF2i8lqp@vger.kernel.org
X-Gm-Message-State: AOJu0YzMI6yswUTHpHIQgOlhH1tHD6EdW3eQ2/RP8cUbBuYsOaibIfrb
	kfjvyw+1VsINS95cLejTfrCdDu1cbEwXFRm1ckI2kRwKxbhAvGI2GmeD8hmQgyw4OogvhWukOdB
	xdwVwpg29K/6QmH5yfsImjoWH+ULWHM0/xzKX2b0H2iSpruzOUwySD+b7Pzk9wqUPC+6a
X-Gm-Gg: AZuq6aILtD6NCu9IJpE0JGb3vCv9xeuhNdtpoYrMNQqYzXikLNb0ZDQx7ohCNCQ3C32
	rY9hG0TaJAl8SaQn1UgenZXxlBIDmnfICJK7vfbKSk4riGq9RO1v9PjrKtnObjo/5ekOkLpOfl0
	1HNDX10gNljeOGRCx2i8woRyP5Oh/OeF3FxonUgyfUahu/LHG2m6pY7j8U5uUEIN+bQA5nmBXZg
	CfCe/ieQc4zGmmlYvziH4EEra1NQ562swUzHP9iCFjkPzwyJZDNA/WIdLM8DSSQEscGbMN60RBK
	V6IkOfF+aQFa6woRz7r5em1Z07nSsYvEXLlERRsf6N28gN4jpnn/njgH2uGA/jjyv5jBv9KS5/q
	Wv4WTVY2CrcCDd3/8imaHLTyuFD/AgH80W+1i3cr2wK+opDyL8FoYUSq3cxJgzofBMGRJoszt+4
	F64TDjnIDdRHrx/aX3D8T17Ko4GTu48WavYKc=
X-Received: by 2002:a05:620a:c53:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cb8c9dfda9mr1415446985a.16.1771905934904;
        Mon, 23 Feb 2026 20:05:34 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cb8c9dfda9mr1415437785a.16.1771905933106;
        Mon, 23 Feb 2026 20:05:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:05:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type
Date: Tue, 24 Feb 2026 06:05:25 +0200
Message-ID: <177190591481.429979.14151274658881021527.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206222151.work.016-kees@kernel.org>
References: <20260206222151.work.016-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YabLJCjxmDinMK4namCvzx1utQwayKWP
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699d238f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=HIUXOl7pohhbnBzAbCMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfXy2C4m32EF+Y7
 DVRyoicBEdaXX9mHuPobkhBp4woa2rRWg7AOO7XueIibbjJxIB6po/Q/nYu08vWYhSu0kcKYqdV
 R29rBbAPg9EkKEhyiLJB87y/0dvj5zdKS/aJQd9Wi3GpK5kxgCDPpNShfXi3AkBYLO6NHNxKjZu
 4zHK7oVPxEIBcKz2e8BoIKZ7aZjnYNJhIKFlXcDTiFClX5aIkZnasza01yCnO3nOexb4kSlhORD
 vD6v4exWye0VMwbHKFZtZ5FmYbEEGqyUI9HyWqtM63X/inDbkc+M2KBH/gYgIPRADmFQe+bp3CY
 ZFkqYje0YxuFM2Kb/zTOq1vxy0YHPnzR0X4CMYt1/Sd5w5bXIem+HsjFaAPD6xednDgCveCWGIh
 dJ3aRDMRIxO3a2NTGabznNbhkfEEhx0G1LjWLUuZ1ceBhAT/gLN8QNeS+GTsCfoyBekTTVaCne8
 YOPFjp+DjElsmKVXJyA==
X-Proofpoint-GUID: YabLJCjxmDinMK4namCvzx1utQwayKWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93876-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB8E51818C9
X-Rspamd-Action: no action

On Fri, 06 Feb 2026 14:21:52 -0800, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "void **" but the returned type will be "void ***".
> These are the same allocation size (pointer size), but the types do not
> match. Adjust the allocation type to match the assignment.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6f6f3535192d

Best regards,
-- 
With best wishes
Dmitry



