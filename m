Return-Path: <linux-arm-msm+bounces-111598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id skBkFLHWJWoqMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:38:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD0C651833
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:38:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KEJWkKlb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W+As7Ku8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62803300AB0C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8756C32D0FC;
	Sun,  7 Jun 2026 20:37:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26A32720C
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:37:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780864640; cv=none; b=VrU7v3+BlIQNPNzR6EsRX4gkReSTH0md0VKpn+XT9YXJu3op6OHQav6ejgWYWa4Xa3cmv9z0CmviCozCpmR6wAF0WIE8ItVvoOPmI9gu6+ZHpdVBdyhfx/rPXRdCFEXt9nxLzT68kJRxFjrFIQoW7hReuuTGaEgprDOEj5NgYEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780864640; c=relaxed/simple;
	bh=0cGGJKGkk2JMo1lA0Fxg4aE7RX05+Ls4NDrlqzrqLnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMcewYud/LKWd3xVFk5P7F4TTPtca2NPu86OU3InIpjl6lH3eq/IfLwbed+XUD3tXAHuaUxeQPc52s3AVjrty9yaPDBkNxslztwNozzL57j5j6Vf+5AMhxEz2Pg+t9mxSnPrs1U8oYY/aGbRxv102TOB0wDdmzFMXgv0OMjTia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEJWkKlb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+As7Ku8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjqtT373455
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DUnRWCAnDIUWTXaN6WB5sCQ1
	X0TmmEWbV8Gu3omt2O4=; b=KEJWkKlbI/srOkMYik6MREWScIqCi/EtkK/jr1Qk
	72oKH3zNGtbzyyCL2+A2Y8DuChsBU8whbN5uFjPMRV6zuwHf4HwqqO6uB4n6MVwg
	yIDyrcSeORUA9D+qCMaAdk+nlUPiG+18zg8QI4Q+eZFIF8znFlEnuVnTtIG6e9QG
	1w6R0aEXNLVDlpgzSbgImujQ2bPQb8HS5636zbJA0ygRwf/kdukBf3qdtD9q8H5V
	2E6tu9RBOLC9zms27BAn0mu/5GLDDGKsza1wz3m2PfKd7WcF9IYUrlC5i75kXgcO
	xevlH32PAzlQnHgoeJEWHjQM9BdgvTFMBHVOXDCBY1PaVQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadvety-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:37:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c89de84f33so4173229137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780864637; x=1781469437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DUnRWCAnDIUWTXaN6WB5sCQ1X0TmmEWbV8Gu3omt2O4=;
        b=W+As7Ku8A2aX+qrXOEoSiYwz2DYRzTlW2RKt53i7DtrVwPGdwftELpWS53ciET7D4I
         Qmw4e0p4gBklQHHHmPGGo8mIblbzgd4I0o1JLJThvoYwBeWChsv3dHOX3NBkRCTO6bzC
         X+2zDMi1n68Qevf7HSSwWIdn8jPS5hJpAgIbTZwY5fhoThUSWAHEKf5Yn79G8IYl65TE
         or6Yl2ZG1LdzGyLALVXlRixNy8L+XgolnLO6FZNhgPNnh/TPnvQdaz+mPQ+mIIMyk0fW
         ui7Kxpg8xNSFa1Up5yxyJHbGZMS9J5ABvNi/+iJUGtof9S351oIKlstNKgpNF29V+lsw
         LXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780864637; x=1781469437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUnRWCAnDIUWTXaN6WB5sCQ1X0TmmEWbV8Gu3omt2O4=;
        b=Z31A51ZPFsvM5ApR7jG514ny7ohF670V8CI93RM86UlTMJWE00d9RhNi+hYTSMSuqd
         Sk7695Zi+JYeo4oYW4kCBaQUFJAdo67snExM7TIt7nBwLXLp12N0M+sB6u1Jb9eDXnxM
         LBJlShJzl0ZIPP3tkocbaY/WGtRYJsBNziXXXiqTRxddN8yYnlzZ1aDMi4La0JKTDTTW
         aNFcIEtrIbwuvct28/Or7zNyCo/REh/zC7sLx2FoN1fdGqwCj6dTn1I5xNjhl2QDsXtx
         hPPqe0k26UosM7qQt+uP+drkUpmKaoQXtusFygfJl8mT2HFEoHScSvlS7/3mprQHRZaK
         YPxw==
X-Forwarded-Encrypted: i=1; AFNElJ/jx+o1qpB/lYwonWUVRuMBWCCDMtrTD4ZwQbvm7KHim4I6NYqKwSMc294qZYsCPxYm9yURrSL0koo65eLd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gxvyHmVJEOOSraENgO06Y+t+JgxvTEQlJ84lmnekUnT33Avl
	bJW5ZzxDkT4cAP/2lldrMdKfG395O2t5YhyCMkLgr0yyqI7KuU/zETJQRzVgMrxpQdf28FHQduP
	gPhbT7nJcwkI/kiBa+ggXtMB0ruCd5dkPsfxVdlFTwVhBY53PurJbGEg6m9L/o938s9Cz
X-Gm-Gg: Acq92OH95mhdG2vY0w7+cpX8SGLKyaVkp+S2Ir+tU6MVOLYrv0BPc5bMxveRonZWEpi
	0V3fBj/awl+4Texn35XtvX9zkQP7zvbE3BcD12YTXbhLOkU6bjJLwlNoJ/dfbYgvWJoBhQSpfxk
	LpiyhQAJnA+OqImjYh5wn4XtRT9oxuD+WGLOQpSUR/K/DOhwd0G+tz2rYgAXRuJlLi5gv8Gylox
	zChb1R47nKWtT5TANNZjR2cfDTZYVH1Bie9SqzlM7t7h2ZPlUrqgj8xezVzvlLBnhx8AzNMZaeq
	fa1RndZQfrsTNzT9LQSJMMFuoKGcZAc01bkwJuoxvvRQN2VazR2DYKq/TmbTW5Y+j2BKweBx4n3
	W/X4auIpl7Sov0xdR1UTBBlkqmQUZ++c3x7Qbbw6wBRNxhpeqDekhoDX6n992QnHh9NJqa6j3GW
	DBx+HyD7RznKoiOCi+tWjvaie7dA84rvmETWR38wcoH1iSsA==
X-Received: by 2002:a05:6102:5127:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6fef8531f7cmr6123453137.17.1780864637397;
        Sun, 07 Jun 2026 13:37:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5127:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-6fef8531f7cmr6123449137.17.1780864637022;
        Sun, 07 Jun 2026 13:37:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9868afsm3330768e87.59.2026.06.07.13.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:37:15 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:37:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: iris: Add request key frame support
 for encoder
Message-ID: <io3zcir73kgl7fglv5ryaayy6jdozbifodia2bkatecinxrmeh@5cb7e3lrflr3>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
 <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a25d67e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=sDdIUKycxF9-MKv0SpgA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: UEGo2TXleInCDZjzXkafF4sJT6Sa6l9G
X-Proofpoint-ORIG-GUID: UEGo2TXleInCDZjzXkafF4sJT6Sa6l9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwNSBTYWx0ZWRfX80pV7Jck2uv6
 U+qdPKwv4VnKRPQjfksX/PisQWm38Ygje/r2+nlHwmrxY65UL7mAnHuKWBde7BDdAx6wD2xxPoA
 1zo2jqvP1vWomfOTQWXg81VZ2HBIST3ckiROFpxw/colmFCRRa4Emi3bDhmh5F+9T1j2IgRVUT+
 CKivwEgvsIi/LH4x2lg1ttGym2wCFaWlZK9V2mMZ8p0mgD6grmoTbHnuywJJTZbFnxi/ys/IStB
 7t+ppkHPxOuzBg+lUx+Gv0Q3Rqp5EvXSPJdlPg/DY/v9rsWVHrCtnn59SkuVbNOMoJADTLRQD6A
 mIpaesWoYPWFmbK9hYTaivKVtUl9NqF5k3SVJQualiWxdfg8tV7xE81EAHoPar9K9MuvhDICn5D
 9723+9Z/QJfQZFUokQSO8XJv6asHetKWMVvhPvY4/zmihP7P/YGFHJQQCTbWS/hd6HuLnJklER2
 aAb/+FCts/0Sfxh4qBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,5cb7e3lrflr3:mid];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DD0C651833

On Thu, Jun 04, 2026 at 04:00:39PM +0800, Wangao Wang wrote:
> Add request key frame support for both gen1 and gen2 encoders by enabling
> 
> V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  8 files changed, 56 insertions(+), 1 deletion(-)
> 
> @@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>  					     &bitrate, sizeof(u32));
>  }
>  
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val = 0;
> +
> +	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
> +		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
> +	else
> +		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>  int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> index eff9216bb50143c0d752051a6400605bbaf3803e..04c78417dbae33dff1cc7099e6f105caa606048e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_bitrate_gen1,
>  	},
> +	{
> +		.cap_id = REQUEST_SYNC_FRAME,
> +		.min = 0,
> +		.max = 0,
> +		.step_or_mask = 0,
> +		.value = 0,

How does it work if min = max = 0?

> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_req_sync_frame,
> +	},
>  };
>  

-- 
With best wishes
Dmitry

