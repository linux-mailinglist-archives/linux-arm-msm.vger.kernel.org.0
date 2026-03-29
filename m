Return-Path: <linux-arm-msm+bounces-100562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sWRpLlhyyGnVmAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:29:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8C63504BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 01:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2BDF3020D5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 00:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6CB188CC9;
	Sun, 29 Mar 2026 00:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLDj8BN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qviii7GM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEE92E65D
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774744148; cv=none; b=bEvRHSowDstNm+YN8feFD9TJADqxeVZ4dWGwPfxBOL1/cGaO/rQvNzY1QMqSc4K9cSdiLgckQ+FaSTKw6g8SjqyVyT+LuyWL3iQdxHh3kOBxAF1qf0Wp7SjiPfIwfSlRPGoNPyLtbPnTSZX/MjZiQLINzbBRJqYgYm4W0BeVi/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774744148; c=relaxed/simple;
	bh=elDdznpCSRqzU5VIhlNo0P196uCTRQLn0x0FwxL2ul0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4naCOCtvvj7QdNKR3Uu6fQX9E1Xc0FkL2kv1YIEgZbtbe78XpwUu/vnDJMDRDCKl51Zi17WYg3fsy79vmniZ7Au2t8kqFZo1hLTZMKB7PW1vpCDkenfbqKQzMWV9gsgoM3KhUPbPhjNTITg1VEnx+o+4EZRUs+p/dvHUhYh5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLDj8BN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qviii7GM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S2XbSM2835255
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZkU7aasVRrXZNc/v8lfJfyTh
	imm2Ym1Bzg+L/7Q1M7A=; b=MLDj8BN5JIRwygQRWsC73fDvCIXNvf9r0Knv0911
	2hKHC88PUR6EYA/P0X5N8NknNPqq2EUgxoadLm3GrBiKQl0h7vCxwW/+9C4rX9lE
	zyLMqk67oK1x7AZbbAve+jD5ub4qw+lncKf2q8oNQmIVYpGg1jGK6LBtDDmreSpq
	XmG9c6RuRopZ1ym9jD+965gQbI5UE1HfSKMZZoXMR5WksYgMncL/70bhlV0KxJIF
	cNkLKpYa4DwaFfp4zbM7JfROryFm3S7JumPVK4PZWor2Ep60khhChvJh7sCzAsBz
	7zwwzLiZT1+y9nE/owrjuM1XQqgMUELcCAka/E7CyVakHg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afsv0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 00:29:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso95669441cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774744146; x=1775348946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkU7aasVRrXZNc/v8lfJfyThimm2Ym1Bzg+L/7Q1M7A=;
        b=Qviii7GMBw8U6UsN/DjsOCr6+R+u7lFVn1OU0jn+rVAQBBuiSPHH+AE9GiYFZVv57S
         fOxrDOsiB72aJijGEKCbiGl7hZkK8ju94TSTNVarOpb3Bu8lQie9KT1LKEpjiaLKEQgP
         uUkICmVt4OnS2KUhSSWAKCnR2irjOmm80wMp+1At+kpq73SwcplSNDal+aJAfni4rVPS
         Ye64+Do/QFxJmvkf5c4S9o+xAnlq/vrVimKVYnS9QeYBED6hwu5u609tvNnAFkRW8d/7
         Xl8OHB9ZlsRSLwSU6RzOdMhB1sIQiuTlP1Efg6ex37JRGS3JxPZ+8s8Jlnw1qGotBlZX
         pAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774744146; x=1775348946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkU7aasVRrXZNc/v8lfJfyThimm2Ym1Bzg+L/7Q1M7A=;
        b=JNO+//0gTChwEth8k583ZuF3IF7rA1vDrw44Wr8SB9mvaBVjIcIJPv+eGdXp/9BFmi
         L5Ouv6NAXGRIsoDuIiz5AgODyAokFzzn/6jW0VB+KBD3KpKKtf2o+TRSEtpP8VBfpiF5
         9tSspLIDk//EJ584Tl5WCoX9h9PKm/Ui2FUVBwlWB0V9gzHTG+vPtFVfQW0YErhO26Yq
         ybzAsbYfucCVzSQN6v47BLpV2upFZD03lyIMpmrC44dcUK0TNf+OYjJg4TxJFkXLYxKF
         TLXTHO8NXSRn7jtn0OnnUsq8y7CVJJgKu0H5cJmClHKGXDWWm1BbGjQQhsziY85yII1g
         YyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnRqvlm8tF2VtHw21EcaPOobFeOb5aZOAh2dPDtkFh5y6TM9i0xlwZeqGCl/3KWKObKveWykSu9GWCic4W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywahqr53lgWxtKsQoGRY5yH2DWQMjCjbcszcyaLwXlnuEC59wIx
	PHkokFigzRR9xeuMcPi8x/JNWPH6UKXVNBjTvwMJeD7h94qHire9PmqC/p4pN1dELfLOgDZtf8U
	lpmpbbkeJ2UkX3a51N9H53Wvvx8LjtQM4+Ep1pVShFmBChaLDWmRlgMt96awpWRoo6dHI
X-Gm-Gg: ATEYQzx7phGC3hSMZfkTTZCRHkirQ71WLQ4aB5g/4mwra/UybWDI/2thIlWrO6mLxea
	iFN8V6FmY7En5y+Ydnsz2PW0mACIhVY6RTbI6Hjy+L16IOfiYzPaQibZXEmBrigxe60ExR+zxPu
	Z4J7XG1agjPUhrl1H/c9PppAnpUdWWFbx+8vqDLGdDmKXai0Rnd/581jNvQmpxwl4xW4kyncNrN
	W+/IaReAI43SdSbMy8dXo7QPAVrX/Fbr5fBWb0IPRTto1L9GQYKPsEyXC4HLct32p27js/sAJQW
	DXW/OBbM64h+O+MeqZIcRU5/oC1Jhlx2B3IMj43XndeCMvNd95Jsf+//L/T7KHcmCUhGQojb31X
	GU7vfWsJyFVDiwtKOnOFWFS8mNMH72xEjdAVs6yPGBbP0+CIT02umm+fa/3J1vrVN9wbWacnLJm
	yrIJAOcfXpIvlKJzhDl7kl+l2Bt/Ek7oLQefE=
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr110748051cf.65.1774744146037;
        Sat, 28 Mar 2026 17:29:06 -0700 (PDT)
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr110747801cf.65.1774744145620;
        Sat, 28 Mar 2026 17:29:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f48sm6770301fa.6.2026.03.28.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 17:29:03 -0700 (PDT)
Date: Sun, 29 Mar 2026 02:29:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 11/11] media: qcom: iris: extract firmware
 description data
Message-ID: <uoazld45weaugzeante6z4g6qu7wwsns3yi5f6dtt6w54ehdfb@byiekorkqn65>
References: <20260328-iris-platform-data-v10-0-46b92bfe7b52@oss.qualcomm.com>
 <20260328-iris-platform-data-v10-11-46b92bfe7b52@oss.qualcomm.com>
 <3fe34754-e691-9fd9-7fab-1c81f98ef534@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe34754-e691-9fd9-7fab-1c81f98ef534@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3lFSv-JKisaO19S_QRFuhusCkDNHXrjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAwMSBTYWx0ZWRfX1jK0swsjZQ3u
 Djkhedw1z3Ev6cP9sql5nvKpdBERn9l/T3Mhk96uA6g7SlSYQupM6nXFu6fawFBtjmgm/7QXzYp
 YpwgIikZaE6JP3zzucPpyFwsuURh2yYCKo5MQvjQGijBRuCKVc9H11/HXpIw2K1PhVvSsGuwzmK
 j8PU8/9mhtStVaTwiZA5hGIwWCkif9MHtqfkgspL15cjMqEx4yJtxhK4qLSbWYB1kS1uTm9hCbX
 knKdyt6lGfCSAZDCU+Pz0ToURz3ljDM/To2KyxYNvnvuIH5eY2YT8ERx6Vm9a8WJvTviLkT3LPo
 UueiHmV7SMMaExhalMqCMvB+PkgqLHuFvAMrS9oRu991+qfIErrSYPvde0L+8oc2fKliQbzr1HB
 QKFhOX5iky2eqvF2mPnTt41OL8Uhva6MRssM9pufIwn4aM7KX3Oz2FxAcaVTYS78Ie+8QFkJkxm
 /WbmevvHJNAs85tgYVA==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c87252 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2YJWv8jhSmvSyXWFslQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3lFSv-JKisaO19S_QRFuhusCkDNHXrjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290001
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100562-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F8C63504BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 11:55:49AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/28/2026 4:58 AM, Dmitry Baryshkov wrote:
> > In preparation to adding support for several firmware revisions to be
> > used for a platform, extract the firmware description data. It
> > incorporates firmware name, HFI ops and buffer requirements of the
> > particular firmware build.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
> >  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
> >  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
> >  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
> >  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
> >  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
> >  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
> >  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
> >  8 files changed, 57 insertions(+), 29 deletions(-)
> > 
> >  	struct reset_control_bulk_data		*controller_resets;
> >  	const struct iris_platform_data		*iris_platform_data;
> >  	const struct iris_firmware_data		*iris_firmware_data;
> > +	const struct iris_firmware_desc		*iris_firmware_desc;
> >  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
> >  	enum iris_core_state			state;
> >  	dma_addr_t				iface_q_table_daddr;
> 
> This is still missing the doc update I pointed out in v8/v9 as well.
> With that fixed,

Sorry.

> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry

