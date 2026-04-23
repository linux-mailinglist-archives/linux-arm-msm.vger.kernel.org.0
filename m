Return-Path: <linux-arm-msm+bounces-104284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOXQFs7y6WmepQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CC345096E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 246F23047BFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A6638737A;
	Thu, 23 Apr 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yw6KaeUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haj5wdUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F238237A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939454; cv=none; b=b2/to+qpNc8rPbnGThYvs6Zis+qNCvqg9OKriBUmWMzCHH0JisYQ+ej83ZXIgNTCacgk50pvzxn2kIgj4O+P/fvwZL+nbolx+AT8wpa9JvZtXnopEGaIQjF4eQw2+gl/hFnHg44DOptQkymq502qEHde9o2biyeUAsftlbYJaq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939454; c=relaxed/simple;
	bh=/FElXYgF/gNkXlABS/T4KR3HRe8JWvMYz0/3rOHOcWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDFhbd4+Kfc7oVzp8LeeTa7j5jvVfBq4FEoa6/j2NESqW2zKUCtLYTyrrckQtgXUPUVi+vXUNxk0vtmkYnu1RzaxMbvO5x0CsrO/DwLxKaKzGZUM6Q1s4YVB8DhL1fld+DCtc+kiaCvMM+nA3yR3uzVJlp4z5EFsxPjAHwhJqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yw6KaeUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haj5wdUV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uAOC3294959
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MrFUNh0Sh+14OqZmTVoafGPx
	XO0ORTKN4V0WTnuxCeY=; b=Yw6KaeURW8LP5PUGegvNSdD1f0U/NuQBfodB/PyB
	86a20sNYTUrywxKWWEfp7bTEUWC/xRu3fLa8zGCdJy2mT9dmYDef8u1yEyKVe3dx
	M8nExOc7PwednYRhxbp5iLQxMrGUqzuR1uzRwxDX+wZPagsA5dMvMWiCRiuIsiVk
	PeoDvHVZvj1ef0TtdoPLJ86nchO0Gc95Eip5Wy31tXQd7feZCUW69wDKnK6YuDWo
	Dkt6u1/RTGb7pGNh+aUzXswOvwcTcuxvUGBGkoba3fPxsT1mJcnTMWTlVmmWMff2
	yUfD4I32TWPgsSWbPKHMnKpgY1w84iPTfgbLeETN5+E2og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282u915-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:17:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf1ecd1dso85018771cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776939452; x=1777544252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrFUNh0Sh+14OqZmTVoafGPxXO0ORTKN4V0WTnuxCeY=;
        b=haj5wdUVEhWVluqnWuxNo5kZZ8QYHOhlY05bovnYW8rDKwwBtMIq5azvhY51DrA3Ul
         DgIURFIoVoNk1xYlctVBvyxo9R/9SbksPVONFZwUbxyRvdC2T9pWV0qBPh14r0zN1lNz
         cpzyxwrrRiuWCxOOPo9TT8ukLLB/Q1V5KCraRDfoHSTIiYc6i8AcjV9oUi/6+tdV03WV
         doTJ4V+4+4z3rB/3AZu45pCDdLuRrdcn4z18FS7TR5mxNgTdiQs6RkW5hPHnRd+86KWe
         992b/GSlcf4UZUSDoIxYwRHxBZ1g+TZm2LwRLp8+NmERth4wnNLb8TsRgiToRW3nbLC+
         B9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939452; x=1777544252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrFUNh0Sh+14OqZmTVoafGPxXO0ORTKN4V0WTnuxCeY=;
        b=n9KJflz1TKEk96VSEDcjPHgPrLwLSTW4hR8OzO0pDlQfKx97h24qlvhsx+ow83YyIb
         sCIpgahvWteUS/Fz30kAn3AkYgqIAbxmqyyKC0Lv/6m+WK6VoDYr0OT3TaRTLLmq0jru
         ommb7/9gEWBpUPKdsqakoJqBuXn/FFi1xJJcaO0zF57GZo+6y6AGWX56tOomAPMlOsKv
         uik62of7G83kEeR/DbIN+KfLnY+02uvnFMPZuagtqNHDAocr/6Ypn1jYCRCH2Uu1pAZV
         975lsNJ+vbijNMm+VcZ32LpgNHDO6/iDMSCenU157svWENXMgN4KFmzAZKuwMHCvbAch
         UNSg==
X-Forwarded-Encrypted: i=1; AFNElJ+aVS8NfuDEm+BRzfVzMEbUQhKT8Lc9s4urh84JBqoQrBiJbQ6JZUBFygJB+lS+0bbZSKtDIWks3KI/fsR7@vger.kernel.org
X-Gm-Message-State: AOJu0YxAujtRvKsWoLv5wZurlmKv/wSmANeQr9K+ZRr6vkHY1bpmw9Se
	J1TYrygrceQqv3Twescw/XdQyzZhYRpk3BHTsk51TDPGoJqyjlkBSRharQD0mvq2xKrn1zCR0PB
	zRRYQJeDQpvsfy0XXmrG10YUj0Oi5apVNh8df/YNMYDgOl1OngrK1k+rG4tg82Md/FdgisD69mp
	Nb
X-Gm-Gg: AeBDieuTKbuPsc29dhHi9WNK9hkMtEWmK9e41hWV2KlPojoeTZj1Y1EoKa5/LNCA8V+
	MJzn1kVSciL61hHaAiW/ZFk3vrAJOKCaDWIJQhBA3/7xY7K2ZCFSrJl0VppOV24lRr0/GGcOb0L
	Y7Kf9g20PgJRz6+VfLViD5XBK7FQbVK3M5/sm5M+DZ/ibUncqyHtNeLiQlLtJoBULhY2OoM7l0i
	Nf1hNoA+SVPYUoFtBz1jqqtjcZ142JtqiKgySFHMBzL+mnjk1ib+uDr3bkwK7yIvftI0JqmGACQ
	PyM7lvAI28Zo3w1JCoR1mr3Rd55lFN87/yIj99ZySZfD4aruJhAYBgdCPjw1q3uXMcSuPEc2CNS
	h6h8Sk+IXwRXbbHnlfdu6GoCGrOx/1JeW8g+bIPPoD7vS2laDAO01S9UHEKe/mBD8iXFQ+HeHTs
	LY6R68j+OkRuTxqPRFn6Sn2W5jyTw47ChvUDlnmhHB4KSWqw==
X-Received: by 2002:a05:622a:506:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50e36827766mr391728221cf.7.1776939451557;
        Thu, 23 Apr 2026 03:17:31 -0700 (PDT)
X-Received: by 2002:a05:622a:506:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50e36827766mr391727931cf.7.1776939451013;
        Thu, 23 Apr 2026 03:17:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm5205340e87.34.2026.04.23.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:17:30 -0700 (PDT)
Date: Thu, 23 Apr 2026 13:17:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, ltuikov89@gmail.com,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: Re: [PATCH v9 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <ys6ujryc2bntxd66n2ft7rl73g7abtfwvhn66clqc52on2jwi4@7ladycubgrre>
References: <20260422092409.4107093-1-ekansh.gupta@oss.qualcomm.com>
 <20260422092409.4107093-5-ekansh.gupta@oss.qualcomm.com>
 <jqehwyeoda5t5kabxjouc4kgpnebndotkr2a4tuuiypzqcck42@dv3vu7wbq6nh>
 <52aa6442-7e0e-423d-beef-0ef2a6c06884@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52aa6442-7e0e-423d-beef-0ef2a6c06884@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMSBTYWx0ZWRfX/G2iYnTwIIKD
 elWiPTVMTXKjS1cYxQE7r94Pvm2uphH6ZVIAaLpqLGAV93rT72x+PV6IuQ1sjWd67HXaJ/hjHGE
 0VchZ8d8MYXpgedYmGhnX9nc7qbcohZ1JEz6WPqPjouxe4T0Erxnj+U4LbZWsjbbIWnkxj+kwg6
 hEBEp1VG/Mm67lxcGHZQUdAR6M8T3GRSY4ZpGolp1e/OeyCcGpRvZdcV+YKijwW1vWvqeKdG++h
 9/kFzZMXO0HB4QN1hgfig4Zg8dXhGYa8fSS1hiCMuqqPj628FYwqcg84LKvBY0bgK9uofuB6uUw
 MEJ8mM+aeel9DzOiij9T0hsUfJG3x9YPFl75lMwLMZ5FENS9Pf2beeTzyVeHLaKvJHvZA/O3PHy
 41XOHKl9IBKNNrhMAIV0/uwt3fnh1v2EWh01vgcPiSzW/9SChbHX2TDhXonCRqDT4UvLFcNvUOe
 M4VWvdgfsyhThmbJcOw==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9f1bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Ms8xwbpsCofS3cE9mJAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: MUwuE_WmyihsceGXWu3Uk2SbosXXz0LP
X-Proofpoint-ORIG-GUID: MUwuE_WmyihsceGXWu3Uk2SbosXXz0LP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230101
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104284-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linuxfoundation.org,quicinc.com,lists.freedesktop.org,arndb.de,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2CC345096E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 02:07:23PM +0530, Ekansh Gupta wrote:
> On 22-04-2026 21:17, Dmitry Baryshkov wrote:
> > On Wed, Apr 22, 2026 at 02:54:09PM +0530, Ekansh Gupta wrote:
> >> For any remote call to DSP, after sending an invocation message,
> >> fastRPC driver waits for glink response and during this time the
> >> CPU can go into low power modes. This adds latency to overall fastrpc
> >> call as CPU wakeup and scheduling latencies are included. Add polling
> >> mode support with which fastRPC driver will poll continuously on a
> >> memory after sending a message to remote subsystem which will eliminate
> >> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
> >> poll timeout happens, the call will fallback to normal RPC mode.  Poll
> >> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> >> request with FASTRPC_POLL_MODE request id.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c      | 148 ++++++++++++++++++++++++++++++++++--
> >>  include/uapi/misc/fastrpc.h |  25 ++++++
> >>  2 files changed, 166 insertions(+), 7 deletions(-)
> >>
> >> @@ -2331,6 +2446,22 @@ static const struct fastrpc_soc_data default_soc_data = {
> >>  	.dma_addr_bits_default = 32,
> >>  };
> >>  
> >> +/*
> >> + * Older platforms that use default_soc_data but whose DSP firmware
> >> + * supports the FastRPC polling mode.
> > 
> > There should be a comment, "don't add more platforms to this list".
> What if in future any platform is enabled that is based on older archs,
> i.e. doesn't use kaanapali compatible but supports polling mode. In that
> case this list might require an addition.

No. New platforms can get a platform-specific compat.

> > 
> >> + */
> >> +static const struct of_device_id fastrpc_poll_supported_machines[] __maybe_unused = {
> >> +	{ .compatible = "qcom,qcs8300" },
> >> +	{ .compatible = "qcom,qcs9100" },
> > 
> > Use qcom,sa8775p instead. See sa8775p-ride boards.
> > What about qcom,sar2130p?
> > qcom,sc8280xp?
> > qcom,milos?
> I'm checking for these platforms also. Will add if these are supporting
> polling mode.

Thanks.

> 
> //Ekansh
> > 
> >> +	{ .compatible = "qcom,sm8450" },
> >> +	{ .compatible = "qcom,sm8550" },
> >> +	{ .compatible = "qcom,sm8650" },
> >> +	{ .compatible = "qcom,sm8750" },
> >> +	{ .compatible = "qcom,x1e80100" },
> >> +	{ .compatible = "qcom,x1p42100" },
> >> +	{},
> >> +};
> >> +
> >>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >>  {
> >>  	struct device *rdev = &rpdev->dev;
> > 
> 

-- 
With best wishes
Dmitry

