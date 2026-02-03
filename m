Return-Path: <linux-arm-msm+bounces-91726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jSSzOIVmgmmETgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 22:20:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 473DCDECBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 22:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC5F300BE92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 21:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E68736829D;
	Tue,  3 Feb 2026 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpNH0cFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfF4LNMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7D33A9EF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153589; cv=none; b=mpk5T5lmbrFaztntMY0YzfZTo6ejBVjvPCg6I4iJmN5RdkQwOW52aN3IJDl5FoR735t4hoouIHb4zr0KIH1GkE33cQow9i9jizE1Gf0KAT+2QXwtIVfsh66mAoKZg0hYuo2Yy8rI6PUvowuIoY5vnYOB4K2rAVpyCFOZwaVzqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153589; c=relaxed/simple;
	bh=bFohYmbqKUT3egFwvKxHenfuOx2+qymCLQhXu4myon8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ9kJSuE3WScvPKSdJeuOJCU+BLhA+62xmpOzBkYar1gj2EY/MooZHtzddw3a3p2AQgzl9cTQ5y7SqOhffymTOdQC75sllDQzCYoqq+cxdwCszd1dX2+HhoMg3ih84+kGYsKoTj5QMd7CJtYtZ4gtBn2H0QzI+03M5CE+fB5eEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpNH0cFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfF4LNMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImOCq3824292
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 21:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q33evH6hj3WLvmlwGk+wUZ9n
	+vp3DbnG7eTLX/m9t+c=; b=JpNH0cFN+0s0YOCsINy6XRDrWXmdJwYdjgIUZOZU
	9Cd/8S1Qk/0aEK3hXNBFJdVXhb3K5wR7bUEI6q4e7psb64VJ9rH3aVO53dRqV4Gb
	/4yflun474jcKFk9HqNC7FVPsfXHworI4SCBqnvmeU+HqL90r7odhoi0dCtKdirb
	Qayy09JfXx2ERiIB+8BJNIl8xi3hQJgwqtmbhbLJDoaJbSZUVSKH21T/q8b2pP2A
	+aELZnKbftBmYbCViSyCwnAnytBcRM7vpK51cz6hhFGfKYKSNZomnw8/Se7uLOLf
	jV0j/Hu3V9GZalR0ayumJiVTepO49EK9Ri3orC/2+LAhCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33hy3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:19:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so47973185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 13:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770153583; x=1770758383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q33evH6hj3WLvmlwGk+wUZ9n+vp3DbnG7eTLX/m9t+c=;
        b=NfF4LNMRdubS9dGmpN0peLgV/Kbzbz2oDzeSLtJBr7X4S7UQYYlRF/M+YHy3ygA8bB
         vaa8J+XzxHpMHw/p7yR32FtGFdRxGsFJXzWujhxNvZuf+CLwnq3PAoVO58s0fk0SOY4X
         wOT/oSzeZJbp0+1pfOuRziDa5Qff4GFgvx8ZLG9aX6s5sTxeFnIs+ONiMMHrQCN0sXvN
         xvEhzzqGp7kQlwzv5g4c5PE0dgilfh17ggWXJzt1qQgXx6ukqZosMVjgMAhTdt7t1Dez
         C+F5wmbXCAksl4K/gVzNSiJH7cJwJbY5Ok4FJM3fjTiyoftiUlD2rL+bXV/9xGxLD7ms
         A3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153583; x=1770758383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q33evH6hj3WLvmlwGk+wUZ9n+vp3DbnG7eTLX/m9t+c=;
        b=qBKLoAbpO4W8oA+aeE1nzWisWhD3tKtJoN9GuXU6FLtUd3JIOgyQD+DFicvMmItY4I
         H6q/axY+Id7ZsfPgHDClqDZD5hClrWKn7rEPMUYwXIgkqL153CW02CjgqjHWTqzcHB1E
         MZGs5ypPMkh+p4BTBjbV69R38UkA6hlCVRs8LAuH2ujOARITRmiYQ+qYI2m+Kuo89ILr
         ACNMmyNzhc3W970M9SyR9/ATl2OoAraisbONSpa/wJzdOFLYWAxSVE8BGYVcp9l61ezd
         5uZLs36WGvYGlJZ+G9k/QIZuOKYQEmexQw+R8SIfRoI3ZBpW8SHt/UBdpFjChxq8rPrR
         xXfA==
X-Forwarded-Encrypted: i=1; AJvYcCXXEo3H2SVUNUhQMzDOZFpDImnmUTzUC+rABf1oQL+FR1VHbaNcfov7/ajCp6B4BJCJNBSpeuLXdhPtFuAz@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUANBt2R5a+Vv4hQPC98IVgGWmcbCSCQdBrSPgRewahTrUGA0
	VU9Rtk68KVlbpMJyld1DGP8qqMoqKdYsH8SY8WXnhJboSqRKh1CI9HpYVgoUTU816DeTu31GD6Z
	XdWdYsuApLV2XxkUg240JZcdE2N5LnvLXGQKekzI+joLcIyKzubxelHC80cJlzwD8GYm5
X-Gm-Gg: AZuq6aIAkUuJwEcv92JRawjHW/xsRAu2ITyJssv20V55tvUPWXiuMIbE58pYhRiWc/J
	4FwOxybG+wF4lH1MZJWU2dTvTgyED36aJ1a83jE0kLd3GK0Qnu+AFyccwPw/CKnectGTlFGMCwg
	NjOKjJNLtnF4lvXoa2SOvzy4XNg5qeTuKMZfo2puw3WrCnF0CWdQd8PvsJ6tjKQ0rlT/q81Pz5W
	gb6+Dd0ODF7Y5kLoC5bCxhrQiyVN//P5qgu/UEWkpUbWZzAH00nnKWkWZKFGTK20GErGepxE9p3
	T433lJJhAjZPdX+JUvo++zYNvFh8AhF2uG314q6ljKiwuGPBajHSe8j4qX/T/LAXrWVDqyqQub0
	92wMenjuLfThx0zmrvNUL1o91w6HLaeraWXEkfrw19cyM1UfFfmqPSJbfS0qbFPH7sR9AHtZZFH
	3MXCLcBg8lbkKyfPyU+2ix9+0=
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:766 with SMTP id af79cd13be357-8ca2f81cd2dmr133809485a.2.1770153583352;
        Tue, 03 Feb 2026 13:19:43 -0800 (PST)
X-Received: by 2002:a05:620a:4709:b0:8ca:2baa:766 with SMTP id af79cd13be357-8ca2f81cd2dmr133805685a.2.1770153582815;
        Tue, 03 Feb 2026 13:19:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6ea0dsm1218481fa.9.2026.02.03.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:19:41 -0800 (PST)
Date: Tue, 3 Feb 2026 23:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <pm7lequ6lqrgu3mloytfph5opz6aynaa4ag6uedc62fprpskoz@qqvonfthnk6n>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
 <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69826672 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=AFE5799QvwBUUD9YL4MA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SUpitdSbzW0d5LiXZDXxh9x42z6SxhS1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2OSBTYWx0ZWRfX/hBx5ceydveC
 45wEaUcmoMFBJVmvm9p7QvI1WRU5Ln431qdF80Et1ijcUnZWde7vQ0SCDEQLYJDtgmE/hitIRzS
 lY6tWz8WzYYIjwoUENmGoi7jvYiOyaW8JYE/Zyllh3FfNZxwIU0GlsnmVp4HObvkqbg7wO8FLLG
 LOMzKJoWe2MaxTzq0+AOXDkheqTJBb375DP1pcv/FVpsJMYWHieGJhpPTSWIbM/Uvwsb6n1LJob
 MlTK+IgmalpZdwmKmSMy29N/C3bq6WihA3sg4ZAhBzaBYh6Dh63iVMOlJcf91zOt12ycczGhbre
 lp9B8CdSLd3i/+iOBAwC3xXXoMJ+8x1lH9MmrfEu4ki0gqrqX7X48HvBkmtjQ8wV6j9Mh/RP5h1
 NDs0aUFMGPDoHn0fBwwEzoVK2W15F/etEScwy0JZ9tlBw1FHe2TykBVNEKot15aEN/8sZp8GayP
 XUHppZiwjSO2g3hj0Pg==
X-Proofpoint-GUID: SUpitdSbzW0d5LiXZDXxh9x42z6SxhS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030169
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91726-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 473DCDECBC
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:06:59PM +0800, Jianping wrote:
> 
> 
> On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
> > On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
> > > The entire reserved-memory region is now assigned to DSP VMIDs during
> > > channel setup and stored in cctx->remote_heap. Memory is reclaimed in
> > > rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
> > > heap lifecycle to the rpmsg channel.
> > 
> > > @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > >   	args[1].length = inbuf.namelen;
> > >   	args[1].fd = -1;
> > > -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > -	pages[0].size = fl->cctx->remote_heap->size;
> > > +	if (!fl->cctx->audio_init_mem) {
> > > +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> > > +		pages[0].size = fl->cctx->remote_heap->size;
> > 
> > Do we need a flag? Can't we assume that remote_heap is always to be
> > allocated to the PD?
> We do need the audio_init_mem flag.
> Once the PD starts and daemon takes the memory for the first time, PD will
> start using the memory,
> meanwhile, the daemon can be killed and restarted. In this case, the memory
> is still with the PD and the next
> daemon connection should not take any memory for the next request. This flag
> is maintained to ensure that.
> The memory needs to be resent only if Audio PD on DSP restarts(due to
> PD-restart or Subsystem-restart)

This needs to be explained in the changelog.

> 
> > 
> > > +		fl->cctx->audio_init_mem = true;

What if there are two racing IOCTLs, trying to init AudioPD process?

> > > +		inbuf.pageslen = 1;
> > > +	} else {
> > > +		pages[0].addr = 0;
> > > +		pages[0].size = 0;
> > > +	}
> > >   	args[2].ptr = (u64)(uintptr_t) pages;
> > >   	args[2].length = sizeof(*pages);

-- 
With best wishes
Dmitry

