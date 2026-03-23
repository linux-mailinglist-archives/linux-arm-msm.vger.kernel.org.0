Return-Path: <linux-arm-msm+bounces-99178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI8RDxUPwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:59:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE412EF864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27533302B22B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9FF38838E;
	Mon, 23 Mar 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKftpxX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHbKLfdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3317E38838D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259888; cv=none; b=WV3iLbtM8KMR0m7+SYTTH5AWQiGGLFFmcSGDRJQ9a4De4yqaS1JhCNN3cejjj7bYQg0yPkq7ziqC8OuchcJTjbDGjecdD7nCEvT7gHFR9V35G5WfC71kBp8dok+xxKS9u1zxNseNS6f7+7aM9wvmoJxwbdIeHrNPO/5zqeYb4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259888; c=relaxed/simple;
	bh=HXNzsj0LVrw02guzdU/nRwSJ6cMnqIl9UkeuSeA9RTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxMzQzZSgVV2AZOSa7t8NB9Ds8WOUCp+nc6jE577ClpR4RS3xRQVPPQpNsxDpHic2czfRwbINrjcL01CMkQ0BreEhMsCQiGz+YeFPi6Ye8Qj27L/ECh2YRjIvcSWEZoOzc9c2zuDoqf0/UFk9EF2AszFZ1S5FyZJV74ogxDDlE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKftpxX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHbKLfdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N77MV2024253
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsFad9FOjsEjXLg3S1NAj7Zevr3pMv9IohcMrhz9SCA=; b=MKftpxX8Vxk5cYqF
	HMtGixe4sB/LljTwgolHqV2BAZzmdKBWY3AMph062firnTZEiM9GCsGJJgRxj9jL
	u69ZonKpqrpscnS+A3UoIUN1Lta4IVPW5Vk8szka3M2z8LY+BCHulNaZCiFWOp9I
	pLxaDnmDT7Yg/O44mDSmGLw8mse83RY4L7/HMzYLMeRLO5i3Yu5P0Li9llT/BBh6
	F+BXn1E+qxxMI/S9jcbB8fCQWpVEF6e+uzgQ0RvSARYl1QBPb6BGjytmXwljS6Bo
	oLM4g3584xfRcEdl9QU5qnW38yIuWFlafGgRS8EHk53IWh/ZahkzkTibrB8PgVYl
	o5U7dA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4yb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:58:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso49929011cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259884; x=1774864684; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsFad9FOjsEjXLg3S1NAj7Zevr3pMv9IohcMrhz9SCA=;
        b=eHbKLfdHGn6VcDfkHFJMIPMNTawIsvFHPBchAcYhD80TLc//PgyE54qX0tnu4eVugp
         HA7h7V97jtIIbutqW3wC+r6oXHzV4KTtRI5TQNQ0C+a1ODdlMcM73welkopUuicjcYlM
         hGVlofGc83/guSQQY7cj76I1jrEpoBNIth5cS4EhJkgTPTz+NBsaGvGkePYklsw3mrys
         nQomeWnsvAoUgjI4X/2ArF8C0GqqJg94xmVTTOybrb6J/Z19FfdVWdkwkOg4hesTJFFD
         3149Mvn7PUGLA3byFrtJna5cZxiUA23aLJNgrpQ/q9qpSdXoVoJNBrf1quSund70YCkG
         2ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259884; x=1774864684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsFad9FOjsEjXLg3S1NAj7Zevr3pMv9IohcMrhz9SCA=;
        b=lL8OkdadbESh0/jU07iaeqPbsENUzeV4poOPrt2kGhCdKXSBhjAzwSQ4JlMpGOhc1e
         FGufsYN1eJkSclT9md/VC4opJ5Q2NcYbG7ywRBb5RQ/RjqkarloN+1mP9WCDDbMhjk8Z
         ZBXSsa82PZmrp95dyrm0kLPWcHwhIkPMgdF4r0KrXEXzX/RoHdxhHLAux/W+93R7nh3/
         Z51FuRWEHquGTgmZ7nhicWrL/vJg5S34wbf3YZG8cs4zrnBMk3Dmd6AUfi8dEUjCl7bN
         m5g0/ef4eshfURorWlcNZQ1o9nOh9JID3rKS8G7oT8l4nYHbcGr+uwkoCgYCzmWEsZLO
         QUog==
X-Forwarded-Encrypted: i=1; AJvYcCXlDVdG/HY5bjiwiSXEmfV5Wfvjl+9yRnPUyXGbS2oFSCAfBAWpqwldpizn2HLk2LX0saxzi+DpP8ZZLQ9x@vger.kernel.org
X-Gm-Message-State: AOJu0YwXp9E7hmMS0UQfvlbyVZA4Thnvc1jHI9FqEj2HrNT0PUBJ0Lyv
	lTdt5DtvWh2BzNZ0Z52Wc4ZAoQHKG9LbNRFy822G+ZVVRaWIlsr/kaLIe5uVUKJZGP5YkWciVzh
	QJo2ZCI7YL9UMf++OZsK/XN0gAKJFDw5uRBfPlGSKq10bNjLiYtTzshDSg1/Vipsk8Hrc
X-Gm-Gg: ATEYQzxM8lcH/KKOKOKpDxJKkDx9/8zQn3zVs//k1ZTiAu+S3qRp4epW41LNy3bNqY+
	QJ21lI+ClQy/GzzE1D8gO22kJPdCRBLP4kcNlCSwmd//LxHcEX5VJScISd+pt753xlBBIH6V0yK
	szSHXwXbFxfm2h+1EtaCib2LI7pa8vPOy8l8dI1imJa4LtjBs0nzPCNFIlvR4tFodWTcAakoPpG
	Fh86ALbf9UZl4i//7UQcfDpku9V2pHh7VuDBMuR5ECgjb29BbtMWRnzg4zYjdei8DQ86K4Jnb1T
	nOj5pxFFcvuMK79Nf7G7ymYE/kqmeRp0hDPAyAIAX3Q7bQ/VxT4HUXRiK4+2z1c+3L+8WKpJWKf
	UjSUkIBMhSBd1S0Fhwg35YcDvQ0KTzCt5z2iOpHzn7t1jIQGX+DCtIdKD+hilxHKwKaqAUkRqlV
	R9XUKrUrYiH/QLc4hB1VF9FYNAdCHm1HrskHk=
X-Received: by 2002:a05:622a:14d:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-50b41bf660dmr156792501cf.57.1774259884309;
        Mon, 23 Mar 2026 02:58:04 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:50b:41bf:4ee5 with SMTP id d75a77b69052e-50b41bf660dmr156792331cf.57.1774259883879;
        Mon, 23 Mar 2026 02:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207302sm2398937e87.46.2026.03.23.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:58:02 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:58:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
Message-ID: <av5hvd2qc3g6qddicdobtdprmaexk4b2cisgmq27sdvfvmcnkv@lmr2dwhngljb>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
 <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
 <839d9dc8-30ef-a2ed-42a5-106923b4065a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <839d9dc8-30ef-a2ed-42a5-106923b4065a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dPXbMfRZtTNuTHK0eCxJ33go2ygmRZb0
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10ead cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=k3VbfXO1dvbp11TfyXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX6s66plPsYbXt
 MFM8jBOfSp9WJp5ylpYqURaWQEIK5NES9WoHE8xBpAbTDjz/7K5DgAk3NjEafw9B1drvFIviWAC
 tgALnAv2bOHSHjCx9rLpVNrRnz0W4/SM8RT0enIJ+LULwSQRcz8OipENSzRW89g8rpkaI035aat
 FCJ8o3k+QUx9i3O8ENUbuR2pHe1duGb6YFn2OZrrX0g1axwuIr8hNSbf5tOVmcyyD7+nrrr11dW
 g+0+C/p/lOB/TZADQJeQr3lIlyD31vGNCkOONFGvCo5YS+CK3MezvEKuAP/m35rrq3dg0sd101c
 d+jGKEo93JhsIKVfY/q+1Qe+OVkFK768eqapAWknFoG62B+5Ri7vhduPl7g9ejisJWimU+z5+kz
 XVf20XHTLzxCSQg8VMDyivguwh+YZ1y9hWkF3vPMbKTUliq9d2gZkN+L78rWaQSH5jhpA+DeFZd
 kgAh0tZBgn9pCGOo5Jg==
X-Proofpoint-GUID: dPXbMfRZtTNuTHK0eCxJ33go2ygmRZb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99178-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFE412EF864
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 01:41:36PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/23/2026 12:50 PM, Dikshita Agarwal wrote:
> > 
> > 
> > On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> >> In preparation to adding support for several firmware revisions to be
> >> used for a platform, extract the firmware description data. It
> >> incorporates firmware name, HFI ops and buffer requirements of the
> >> particular firmware build.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
> >>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
> >>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
> >>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
> >>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
> >>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
> >>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
> >>  8 files changed, 57 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> >> index fbe136360aa1..ef7f6f931557 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> >> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
> >>  {
> >>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
> >>  
> >> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
> >> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
> >>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
> >>  }
> >>  
> >> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> >> index e0ca245c8c63..7f36eb65dcbf 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_core.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> >> @@ -99,6 +99,7 @@ struct iris_core {
> >>  	struct reset_control_bulk_data		*controller_resets;
> >>  	const struct iris_platform_data		*iris_platform_data;
> >>  	const struct iris_firmware_data		*iris_firmware_data;
> >> +	const struct iris_firmware_desc		*iris_firmware_desc;
> > 
> > Missing documentation.
> > 
> >>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
> >>  	enum iris_core_state			state;
> >>  	dma_addr_t				iface_q_table_daddr;
> > 
> > <snip>
> > 
> >> index dd87504c2e67..d36f0c0e785b 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> >> @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
> >>  		return core->irq;
> >>  
> >>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> >> -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
> >> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> > 
> > How will iris_firmware_desc be selected once a SoC supports both Gen1 and
> > Gen2 firmware?
> > Today it’s fixed in platform_data, but eventually probe would need to
> > choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.
> 
> something like this would be okay?
> 
> if (core->iris_platform_data->firmware_desc_gen2)
>   core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
> else
>   core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;

Yes :-)

-- 
With best wishes
Dmitry

