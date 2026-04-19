Return-Path: <linux-arm-msm+bounces-103628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FgMMsPW5GnZagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:21:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F89042418D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 15:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9555B300D47C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 13:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA87633B97B;
	Sun, 19 Apr 2026 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFOd3KzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUF1vTSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C2133260B
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776604780; cv=pass; b=CE9gLSIG54067RZb+1p2l8NKcDvkgVXF5/GX2Q8ivH5wCfodFUTC3rYLNbz/aGN1gI8jZNqEq6NCz9f8mF0PxvMfjZwj3sv5bozpmSgaTwLSdNtLSLV6FZZkVF3IOFZ8u9Vh7lopf5w4HBhmJwLEZ/FfHq/WUZPGcw/qxHF9vW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776604780; c=relaxed/simple;
	bh=hGMf5fcXMikxZ22kA+5m+pXhWS4RLIjSKdkdh5CV8P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6R54AQnNbnu6+O/IRXsQrZtWoUIXaK9xy6eTGgeZp6o90oNSg12Djdydy91s5kwKKfNF5a898KAl/f2VyGubVWC9yJTSQFFa/0J9cSUFs1dMDERaXj56dLb5KswrLd5TlIblfzr9GwFSZwajNUqDoa2NTRFNLn4l4kSG9aW0Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFOd3KzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUF1vTSB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J10DXo287707
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 13:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFEbVjsG/sMNcfIwunoNEXRA
	cnnBUNfXQiMwhzLe2YE=; b=IFOd3KzE874deenjw2eZtlDu7eCGbbk0c2MXRDTo
	M+h8nADAOTLqMlIhsR/MqkA4wQV7jioIpSIfJ2C3pVF6hSffstVXa49Hc+DtnQ/n
	C9b4Alci0El6FRhr/Q2vSkxBWCql55mPi5u+c/410YsE6UwRyeInykyGMzYTTxMq
	hoLNIGDE2+GaiO2oRe9PR+R6FYIlffcLt+6Qa9uPJ1ZzT8+na8jizVj5Upq/3z3q
	UqqriJvd6o6aUKiE0xv5QA7OsztDnrzbfYhKtRS2tAj5FhFYetz37PHAO43jDEo5
	U0sGiYc2BmIhjA/Aj7OrkxgvXqmp11kz8uIhgsWDkn5Lbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y62px0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 13:19:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso4473822a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 06:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776604777; cv=none;
        d=google.com; s=arc-20240605;
        b=T9DKJNlFFshfZho9cEJ3rzN+Ui2AkfiUsgYD0XvcFZ5Q6WZHZ9/1S78iLPoq6II1M3
         0hnXU8BVvDQEjBPMROh1oiQi7wKZnbWE+NPwfRTSdOU2ZHKkdFXSkVSg6f+cQGO9cF0i
         xRfKqQrEFifwYho6cZ/pzsG33jTPz/CIqEJSM++IKZlNrUHxWB0oBM7LD2Iwlhczlvt8
         n0P0U2GqPbv3hpb16J4T6ebyUdKvwPY0HEanCQKHkmOQDWLPp49dmZFhKKpcWjAxVNfc
         ftsRK9oqJvDwWPz+ygEOX1msliyIcGoIQVb6MDmLcs2Tay8mcKeIA0wrmlFMEihkUlPF
         Q8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EFEbVjsG/sMNcfIwunoNEXRAcnnBUNfXQiMwhzLe2YE=;
        fh=QKJd3/Eoh+iUYWakYKRVglsfXhvG7gTD5iGFV+yRDlM=;
        b=LlyRmDd5RmeOEQ7i6DgqWjI/q/ZJVXnax3myuN7J07ku9AYv0i32H0+DfYbRLwduoJ
         NEUUojO7QujnHpjjrlF4JzNCcyTj3BsQ4oXmamK4rBCtglCGH793rD+jE77TWYv/DCZa
         B4M+80awweTs3fv411MlKawM56mvmFH6+hJQ+AWFYSM6zltDQf3JyOlIkAE3xSG0Z+Ku
         VNEeWsGNcrVbLNokNpXw1RdUaXMVsbiAH5az+0Q0siwXh5wkcUcV33wdpfI5B7KTRqxJ
         ZrWX3EUNkECEEuOldFoQRrohPnkeAcMuTg/w4fRmzZWpMHQ62k3qYJauNS0yv/iW1AuB
         fP8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776604777; x=1777209577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EFEbVjsG/sMNcfIwunoNEXRAcnnBUNfXQiMwhzLe2YE=;
        b=PUF1vTSBwnSzPmULlemEkNHKiyTeci6s982rV5tEePP8KACvic3KvYPg7ODGdSlmpT
         YY20hAcmoiAQ8SI+aALuNDeD8OG1MFi3hpPAwvjyIZ2bVAg5W1kPUotJr7PAAysnGZAz
         C7T3zZWezGo09aDePamVMX+hzHYsPXoX75m+PEMV8/CT91UrGdyuL6Wkdij7X241b5eT
         9ei8l+KUGTrJ+zVru+5wgzfE11xQxdcRQBwdIIGMQ3OH3lxoCF6NAPDGPJ/itR1X2Mfs
         fn0sUVVfgUASZP392V0fJuhnTYI8FqMGHTQMQrsJ5yXVL9gJeu0H9jodSkXDaSzgY/Nz
         pAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776604777; x=1777209577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFEbVjsG/sMNcfIwunoNEXRAcnnBUNfXQiMwhzLe2YE=;
        b=IL3YyGG1YcIwoupVgJYekWB71wlY71aeeV8BC61FkBuS4iBxB0yRoBNv3kFilQkA4N
         ozPEfdjherkHGA1xXOBliFOAeEK8cblVRUn24jsoj/vWtwFTmGbfrxK8+FkyedMivzy3
         Oa4mjsdDxfgaTgRf1Oe0mJpJaxYXgL9rxro5AYeZCy81zyccrHLZVa72pMMoearnuuQ6
         +7pHY9PYye38QDo5Hj0+YuWdRbeYix4+n5fusOvw0AnAW3TKENzvwy1nRGl8Bj7SJAaP
         Bw4m1NSoet0DvVpIKSrndhkGrRul+x2fgnrSutsp5MSj/GGIDqc/spYZH9s825N/KMsi
         +mLg==
X-Forwarded-Encrypted: i=1; AFNElJ9UVQfxB72uaIEY4yzyqGHZB5MpT+rEbLOZDNi69IsazTqn0DaNMKvknrYHc0n8iTRpuotQf7FeE0tVFNI0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf96p02c0jdMFMsZlRVAp5Upei6STimbyE7Qc6HZ/npdVyQ5AP
	XAzx276tPf27xcSscIcIpZCN0lNmNjwPhzANe0SA3I4d4tfep4T5NvELyMb96rhk+q7lZjmVVEq
	uahPnHPk5JlmngrRMLX/4TsusFwseJoaASRKyjnKWeiOuT08w3ez5i+F5oKNtt4w6W8ZNEgeZrv
	Un27Z52z9UCclG0QeRbyudtPWUlmrN9yIRKwc6AZhA2HQ=
X-Gm-Gg: AeBDiesIFEqv6/A9qxbkHdkQOJO3El3nfTLxZDQJNIM7kMRMTgFP+Xv1H080FzZKJjB
	dk00fWo+fOkIkjLwkDuAkkmaEyOhkXIVjyLEdwMmaNu0AclqUzdwK4xq+WbHIBILh/f3hOh3g/Z
	oPQySQX5Xouh1yN+v5x+5VOzpdosKuu46lGtEHIONmJ6wtCmhYmI1ax05Jh3tMph0+/hh/xxRNJ
	W+fNSnXTyMMM/Jsq3HJDy00JADnfaXhT1Y6b06AqgFuXS/l
X-Received: by 2002:a17:90b:3c8d:b0:35f:9ab2:a5b4 with SMTP id 98e67ed59e1d1-361403adbc4mr11438355a91.6.1776604777246;
        Sun, 19 Apr 2026 06:19:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:35f:9ab2:a5b4 with SMTP id
 98e67ed59e1d1-361403adbc4mr11438313a91.6.1776604776685; Sun, 19 Apr 2026
 06:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
 <20260409062617.1182-4-jianping.li@oss.qualcomm.com> <7rfiwbbunlbzmhdjvsfqccltdx7cveahbgg2rk6kkom2jesta4@nnbas4vn63we>
 <cf0b6133-e15b-49fa-b9ba-e67ac8bcf7d3@oss.qualcomm.com>
In-Reply-To: <cf0b6133-e15b-49fa-b9ba-e67ac8bcf7d3@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 16:19:28 +0300
X-Gm-Features: AQROBzDfOe8tb6TbtxiKgC32SYzBneFn6Kn0xUJ3H9EoPJSBro1xveaZtfSBPb0
Message-ID: <CAO9ioeXavdTExdMgz1By5G0OY9qt-81p2dbD482GWsfQy2XM2Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: pTN6mU_04JmMSA1QFYuDZDiqqILWig8B
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e4d66a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=PyPOkw-T4lfDyJblViMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pTN6mU_04JmMSA1QFYuDZDiqqILWig8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE0MSBTYWx0ZWRfX2YaztejVp0DZ
 4FhDB6mFgcSXDUTrfq2V55GlPJ0jRaKLXoAxOYtFXM6hUn54YEPPNixpELcLh1MPybgXrREc3hu
 UheO7E4vlOSD/72ZsRWydy64XCJzE5FDMXMboKsIHhNB3iYTy3oISC9qX2NMOLIlHu3QoWtd8Us
 uWayipgXiAtJ5gkfUqr53TOKxnv5QvLtthej3zhEa7bKdfRtEkn1dPR0eqVwxGTSF9dVBqRog0A
 xSYoR3Rfqe6V0tDJeHM6eKUpR1u58ZDeR0opFfr7MSY+CIspWp/365h81PnRYzci1EagzYxahUn
 fNnJGOKpaKxD+f4WL8K5DWwsVon7YWjhKbPvnJO7gmIPiZkBDyU80dyhdmAUCF+d04hNdhfF/ve
 +f8DL0xLIx0MnSeMnfTDwEc4LHugxauxfM7AtqNanZSGRxfHLGT1mq0OegEgp1gPwvIo5hBhEwR
 YVoB4DAsD8sgUqvUgBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2F89042418D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 19 Apr 2026 at 13:06, Jianping Li <jianping.li@oss.qualcomm.com> wrote:
>
>
> On 4/18/2026 2:31 AM, Dmitry Baryshkov wrote:
> > On Thu, Apr 09, 2026 at 02:26:16PM +0800, Jianping Li wrote:
> >> Allocating and freeing Audio PD memory from userspace is unsafe because
> >> the kernel cannot reliably determine when the DSP has finished using the
> >> memory. Userspace may free buffers while they are still in use by the DSP,
> >> and remote free requests cannot be safely trusted.
> >>
> >> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
> >> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
> >> controlled alloc/free and ensures memory is reclaimed only when the DSP
> >> shuts down.
> >>
> >> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> >> ---
> >>   drivers/misc/fastrpc.c | 104 +++++++++++++++++++++--------------------
> >>   1 file changed, 53 insertions(+), 51 deletions(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 148085c3b61a..a67ae991c0b0 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
> >>      struct kref refcount;
> >>      /* Flag if dsp attributes are cached */
> >>      bool valid_attributes;
> >> +    /* Flag if audio PD init mem was allocated */
> >> +    bool audio_init_mem;
> >>      u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
> >>      struct fastrpc_device *secure_fdevice;
> >>      struct fastrpc_device *fdevice;
> >> @@ -1295,15 +1297,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>      struct fastrpc_init_create_static init;
> >>      struct fastrpc_invoke_args *args;
> >>      struct fastrpc_phy_page pages[1];
> >> +    struct fastrpc_channel_ctx *cctx = fl->cctx;
> > What was the base for this series? It doesn't apply to linux-next. The
> > code here is different.
>
> This series is based on the patch submitted last month. I will redo the next version of
> the patch based on the latest linux-next submission.

Please switch to b4 and use `b4 prep --edit-deps` to specify base
commit and dependencies.

>
> Thanks,
> Jianping.
>
> >
> >>      char *name;
> >>      int err;
> >> -    bool scm_done = false;
> >>      struct {
> >>              int client_id;
> >>              u32 namelen;
> >>              u32 pageslen;
> > This struct is way bigger.
>
> In the fastrpc_init_create_static_process function, the
> inbuf structure has only three members; it only becomes bigger in the
> fastrpc_init_create_process function.
>
> >
> >>      } inbuf;
> >>      u32 sc;
> >> +    unsigned long flags;
> >>
> >>      args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
> >>      if (!args)



-- 
With best wishes
Dmitry

