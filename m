Return-Path: <linux-arm-msm+bounces-100909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKLMM6rsymkkBQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 23:35:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF85361820
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 23:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7E7C301090A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B348D3A1CE3;
	Mon, 30 Mar 2026 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYbKyioH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpsWSyoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6C739D6C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906462; cv=pass; b=C/KcGiIDTenhpkYEexZmgam5C7GKUZ/K3D0s3cRKL96vC+qBspnZOU0KNfJgq/EjuRwu4K9wRSpdmu3Pub7kpS2i1kGa8VQg8AoJ/kS9uU/Ru4UV6CE2cVkbQlYYcD6nheFCSrOUtyLEnk6vi5P1Mglb4oh+mwnXyPhunHOCvEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906462; c=relaxed/simple;
	bh=7iCmLVNTeLdi8foD9NCpyHVLLxSR0JqRhq/+hYldl4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aI571MhKJGhPRQhb1ZTUHtNMHnUpewqIlXbOBMAfP+VZZl6ciJmumRj6cnh5vDYgdrHHT0v3pFFupYaRcXnJTG3D7IPy3xkLJoUHM8z3+jwZwcYYYdw3DWA+QC9BM8EoD6DXUcKaFtrAoUIu34valB1VbLuPne+yWl9x27e0+DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYbKyioH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpsWSyoI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKPXYi2458297
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=3LlKiUEOpiPEoMZQb+uCcX+3SA93NAXe4enYwUSdS9s=; b=XY
	bKyioHQ8R74hcWfXN0BTumsSF/TlZ6OaI2GZNwfa3DAh+5Y30h9TwpewSAqqgBhf
	rAEssd2ewA32BjZ+ntX4EOG3kEmkg6BMe1N3GUJbXb+KyhvhP6XE+WW/o0kDKstJ
	kxKReJTfb7KfjrvAADJqn+JewSAJHbXy3vDHxGd+JJhf2DGjLmztH/DoQCXYBZzW
	NjmDjidJE3VsZ2hKi7f9vnV2kJhFFwVBhfTwJRgIMvXlH+5kVEpMic/2NUgauhoW
	SBlFbQnKdSyXKvC0gmOd9FCf2b4IyVI5Smlt+yv+TE9Igjz0DFjneX3nUrGBed/T
	U45r3Fx0E1e0u2BVXNuw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmu4cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 21:34:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-467b2af6710so13257498b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774906459; cv=none;
        d=google.com; s=arc-20240605;
        b=k82tw+yZcj5TR50Pa9DUoERKYTrgH7g9QwJQnPnhqsyZGvTluBKrfF1WXltuP40WNw
         jRtOEJEfLnaFwFlLf5lu797Qz12A8WnVe+r6LO8GoHcbhgGlkLmNhoY9YvRE2W0QCTYx
         XmGe7M8fTjAbY6jmm1zg31Yplgua01kf8L+21R09isd4h1VToZpFwz/SZ2/leoEdEvVn
         0fdjtUSsWBlbk0jR/JafuKXS6h4/6B3CXw6YjplTAeGsG41pfaqPnvlovwww9lDAw7Ji
         zQdXh2XwY2SvE64BvnaMEPM03t9inwci+eMeFXYVfX3ULJWJoTDT3TOQ9FCXkkAbEiKq
         RHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=3LlKiUEOpiPEoMZQb+uCcX+3SA93NAXe4enYwUSdS9s=;
        fh=00IydmG/ALN0mWS1hphFFGKN820QEAoqpzEcxNZlzsg=;
        b=LW3C2io483h1itJPm1Sc8sXDVXxXG852oVp8j4Lf9Y/b45d6H1KrMYu8t5AMI8TRnZ
         pQhSUks15OVxXMSnnGZT2WaVrREHRcVmPm0ru7lNlrqj2wGRGJF9N9wApm4RIl150Mlp
         /zcPMl+kt3P4e3zTeXM9YEncarfuD18YksAdLreyJj6y8onguzQP+gZnfBDvoOO4wrsG
         FYLqxHBxVNZPG4c3s9spDB0qoyfu9lgw7FKVNxdKn9/RCb8v8hjETP7RcG/loDG3eWXu
         R8lOZz+8ZOiWkyGyN5VCyLPJlgjAXjNJ8KxtlWnf6IByBV3DEXRRGil5ZiWTZ+clu6Bm
         3t4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774906459; x=1775511259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3LlKiUEOpiPEoMZQb+uCcX+3SA93NAXe4enYwUSdS9s=;
        b=gpsWSyoIekh49cTjcZuXcWwPrXPFRA0LguXof32ihpQewreUK+CpouJfi8JaK3Dpq2
         +uLdDF8+fsHx4xgx8G8CVyZFQ0FofeIjkdh2oKOaozQCG3oIPfPeeBb0wChKeCnBmUKd
         thmzocpRgvwibYobXqVoGJ0z6yQWXdT3s0ddINMLGEHWBO/jzRVAGiIOyDHN4+4mcEJF
         mYUbLEKn7z/rmPB49PIphCZ75ScfXDTiJxxj5mHWqAgjxqAJBlRmuBkyKo6B6KmryyHt
         WZ/QOmv1TQFN9BkC66gEN7xSW3gBRlYaljRRtITvsg5S2lTB+hLwgndhYMnsaWWOobOS
         /gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906459; x=1775511259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LlKiUEOpiPEoMZQb+uCcX+3SA93NAXe4enYwUSdS9s=;
        b=aNwLUIjtG9oBS3AvwrdHy6LyRsBXBqEeeNnzOl2yW/k05hdERYpxZ8gNRw2X/hJ7jd
         CoyWlWqM5FUmaRJBcFRc/n9D6xx1Es/lNqdaQJt4HzSKZAAFQ0/Gj+09nfB82om+bW3F
         u5dQTFwGxJ2e75MTvEJQNMPW+y5cnm/4LPXQJWpMsIX43qZpxBDjQqYUQiks+NwpXPrl
         zQzlqloUausOzgPaz7Dw2Mue8LjSGkNe2ZobQEJ2ZfIVrkC9yaLPLtkRhi6r/UO/QGlx
         3GDLK6R5/bLMSVT1yvnXw9pjEJZardmfAlI5byMY7UXIyebil0IaqT7evZolOXvhhdFj
         ngpg==
X-Forwarded-Encrypted: i=1; AJvYcCXizH36nxFXmwH1rNhE+a2O+MaOWOVGtHymO4N2RLjAQfsTRPwV4dqlsdzz8fyvsexXNceU/Uiuxe4JoNE6@vger.kernel.org
X-Gm-Message-State: AOJu0YwHE1W4UOY7+PZRBWDVf60QaY7FpbQgfBc534I5FRQiWPKKGIBT
	x34ekXtDJUHjyy6R2wiAZ4bvhnVZC6d83hHmZSMKV7BSVwzKaUo7Dd9GLR0zg7HV7xUUeMKd3dA
	gos6VviYdccDMqCCI+nx4etRekwfY6jFVTINyfln9SK8BCLhAo2dcGVqhBi1VIanVYLcyYeJYKM
	tWS7dVYDngDb9OXS60uUVyTN8ODzlTSjQ3xHR1HHc8npY=
X-Gm-Gg: ATEYQzwvBjEPjLtvJVymmI3vWGzyLMdNlQHRJT4w65I6Ekpyl8dGKHAQMqrrmhswtg6
	bPgj4L/wp5Ip9gegdtqlxR8YypGg0RdzR5rP04QfMUhzqVPyeVsqv/D417S8op4KhtuB4M761XQ
	snt/ewwUYj4Q6rThgEo5ZDM2IUmczQJ6NLnqSgHWutdY7cdTLdJwrBPeloB6uBDyvfT/35LhFQA
	wxM3M5036kD704Z8mMj+wpdE4YyYV45auVK1A==
X-Received: by 2002:a05:6808:1184:b0:467:2a6e:adb3 with SMTP id 5614622812f47-46a8a42e498mr6226458b6e.23.1774906459262;
        Mon, 30 Mar 2026 14:34:19 -0700 (PDT)
X-Received: by 2002:a05:6808:1184:b0:467:2a6e:adb3 with SMTP id
 5614622812f47-46a8a42e498mr6226444b6e.23.1774906458873; Mon, 30 Mar 2026
 14:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-3-2b53c38d2101@oss.qualcomm.com>
 <2ddea137-bff2-4576-94ed-4f3a48aed386@oss.qualcomm.com> <6037882e-3716-47f9-9303-b448ab8fed79@oss.qualcomm.com>
In-Reply-To: <6037882e-3716-47f9-9303-b448ab8fed79@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:34:08 -0700
X-Gm-Features: AQROBzBlZc9G6qmr6Lv7xrF6Fx40xRoPwHxRj-mNzMX7XCK3aG0lTexXvjaa2wI
Message-ID: <CACSVV01WDDj+peMZ4qArDF0qe0A+o9UiKq27y4ab3XBK+aCWjg@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] drm/msm/a6xx: Switch to preemption safe AO counter
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE4MyBTYWx0ZWRfX/HnUY75Bg8T1
 jO+Ag93P6Ik4bW7OaO8MPoCLxD0ANcMSYtCtq8uNSISpVdIxYhQGe0gpzNrdPTc7LURg81sDjQ6
 HfK6sfcKW9OOSLb41yAYAjGOvWrbZQBfWxRPzjZ4P5IeFZRwcSxqlxoNKQLearbbHolRh7HVoDa
 XCE83h+jNg+IJcVbeKejLPIPrgtTwcGRinABCs6HkdBbmY/oUjLhbKjXEyv/YMGOOlj6z/eVlJk
 PUCE62adj16lnaM5jUSwCoXxFGST1CM++rwuRaABSVkwuGC2gbcrDWLT8bhs4xYqO/daJjNVMFV
 y++nmdFUZAnR8NytxCvI0uB8DzX/5lXf4SMxWv3nT++euT7Uw3eNtW4Pr1OzEnbsZxm5/adsilJ
 w2AFFOBfetSwq/T5Z/XvAlU3l951vQEDuxRkH0rpcQfGBiuwbURkN+prSv4KRnpESOJ/mZ/MhhN
 41dHpg1mQHx0m29uDGw==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69caec5c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=e9XDKlPaf5x7KOCXZO4A:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: PMT0d_2DFEjrFE3Rrgntpssyiz59H-5O
X-Proofpoint-ORIG-GUID: PMT0d_2DFEjrFE3Rrgntpssyiz59H-5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300183
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100909-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CBF85361820
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 1:51=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 3/27/2026 5:02 PM, Konrad Dybcio wrote:
> > On 3/27/26 1:13 AM, Akhil P Oommen wrote:
> >> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won=
't
> >> provide accurate data about the 'submit' when preemption is enabled.
> >> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
> >>
> >> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targ=
ets")
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >
> > (this is not a blocking comment)
> >
> > would the _COUNTER counter be useful to keep for any other purpose?
>
> That is actually a good question. I was fixated on the fdinfo aspect
> that I missed that this is used in the submit_retire trace too. In the
> trace, I think it is preferable to use the _COUNTER (or keep both) so
> that we can visualize the order in which GPU processed the submits.
>
> Rob, what do you think? If required we can drop this patch from this
> series. Or I can send a fix up as this affect only the ftrace.

So.. there was some really old ftrace based gpu timeline visualization
in chrome ("catapult"), but that has been superceded by perfetto
userspace traces.  The latter uses RB_DONE_TS event to record
timestamps.

I guess being able to record a sensable duration is the main thing.

BR,
-R

