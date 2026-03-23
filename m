Return-Path: <linux-arm-msm+bounces-99119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO2TNYntwGm3OgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:36:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 431532EDAA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FC9C3031831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8B43603D9;
	Mon, 23 Mar 2026 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbvW9YO/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFvUAruX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738F35F167
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251209; cv=none; b=VPNJtO99Nxk3WOZx7EvA//zrLEg28JImSB5qzY2ESeWI94NVIrhscBEzdMGV5rwhEY731m4szn/wbaalBmmPdj1KCYL57wdJl1Mcszbu0ib3P1sXwHjjnIbIxNJQUHO+K6nst1zh7IRPpyCW7r34f3Yyj3hFzkwLwuNSxDMB4Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251209; c=relaxed/simple;
	bh=D0CZWMR5ibJaoRsrqAm1rRbDlWyWVdXFVBCtAfiRcrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLlIUnMii3ttG5RMUbxwYmI9lfEHjqdo7GiKvHvmOtfkmDtBKopAs8ZkflgFYIA0Qe8TXa0hVrATtyrdaVR3Xx+4B0mh2Rf3fpOnMCqVNcVY1fHGYTI8REAVnqC5DAW8ox2wG7gPummS/ZmQphPNvRIEcgftRv2R16qxmnAjqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbvW9YO/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFvUAruX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7M5cn1200685
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3tuafgFaFZGhFcFJPh17nurWc0LbFwgtAEVLAogobY=; b=EbvW9YO/OqJNdmma
	m6IZL1qg+BWzrvLyBcorKbDAt2If3fQrluhl9NVbwzeyX6WbEFI+THimE1LZj5cj
	MAcJnI++G1BBVAAW3i3IFdWZj28z9e6bGsl77ac/MphDbJe0trckSA/ZGgEe8Sa4
	tr9Xkco5ynXYgT/x3RRbNJF1KE6QnzijPednIEaROIPKxhCY7VzJOugzr5Jk1roA
	RND4RJzmGWjwRao4oCnmFPYCvB4VTlvOpewsb1+RNgwajCztR6aK47RkLYmOdKxN
	eowxPiNi76mVb8I2vKdmCh1dmu+P8FFAFE/XUJy8xtQ0ufw086mww4U8vMeNzvot
	hEYUGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5v9er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:33:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090bc4823cso85536381cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774251206; x=1774856006; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3tuafgFaFZGhFcFJPh17nurWc0LbFwgtAEVLAogobY=;
        b=ZFvUAruXkL9aqvCTg5iUsW+0w9ZI9/PgRzsePblvTbkja73peMDvF3slDYV2NoaICH
         0Iljxur8G+8MJ3ZVdX/p42BPZN+tOeqVgSPiKByrGISruELTehXwsUCy67Nc5Y3HcMD1
         oeCn0FA8D8DHrpsGfGbRqSNIdnelU02RiSZrfiyXieAzQwLQm0+h1YpomcTk+nst7YxC
         YrGhS1IE9r0GPk3p7Y0y8D2SThXrP4Hhmcnp+jwd8FsNzs6wH/kvljgYWR5zVIzWsY23
         UF5mQ467C3qKTZhntbxxD+reknat5vIgH1mdBiDZyGUekeqmKoPWnCzdRu584SY/Uzcq
         J7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774251206; x=1774856006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3tuafgFaFZGhFcFJPh17nurWc0LbFwgtAEVLAogobY=;
        b=RnC9z50d0kgFmm32xkz5jQPx4EenJavPOiJEL1w7rWa9oyucg9w5P43Sqp3toejj7w
         WzORzU7xsfQEIvyoDVNbGzMjxWVfe86k5PRITccQgVVML3Nm1mJHCfwP09qZaDm4odpz
         E/U1dtrUBUL1D6q8AFRZfijWnZ6JD0OSq7mraAMQq/hBjhXWJy8FPXuDue27g8N75Y/G
         lQc1eHkQlXYyknL6+Abi2Xx1Fik+F7w6z2BckuTb47Yi1XS3HIJ+g4L3vgD5QcBhiQVz
         91c+vCGULSUI/eAYUO1Mnc3wJOvuntUkZeyUdo18IUTkR/WGZ1OrscwW67tvyJoP2lVN
         qDZA==
X-Forwarded-Encrypted: i=1; AJvYcCW3jc9Phd26VTB8E9UzOnwwDuB+5tIuh8hoBpOhrv4r54q1y9YeP7zuFMwW4XUGA7emPBIjWyxJmPtgtFOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz13dB55k74VLth+9ivTcU9GUrqedgaQW+szMCJHqtbLheqJIX
	UnPSdzEeiYQnAk/iqKu1ZZLBQFGotAvnMn87Iwk49ruj4lvBYol1GCsig5utRBKQXJyHXMi+9C6
	acotsbavwyGXE8YZ3jhJhnbC37vHtJgYzpNgFe3yegfZM2bZM/RNTmrHOTv5Gmc8ZE/NyfelxHL
	LC
X-Gm-Gg: ATEYQzwdBy+OkC8PDBLJXc+P2cKV84Win2RgbgiS7zDklis3nmj2Cn8vnfNV8dnAaeB
	R/IuD6m/Ef9gUgQ/OkBeMYe/jDSznSgPg9G6UBa12Xk2m9nlK4pCQ/4JqS8esEJ1ZIETS0HhCyH
	JD52SjovbP4eHUCS744yIyYdP/N58HBBGLbqyHsGRZVOnbFbugJfsHmQLnVoWF2aFr+QeQVDcLy
	iPd+AkCWWomq58VDy77a785ygx5m57DJjtA9eR7lJ2ajGXLaHFhxRIBDHvINnOuCLucj/dcQ1rz
	JY1jYc1oVJx6h5WraYFK7Eqm+n6XXtrW+3R55cGH6ABzLn7J149Wnt7W+HYGcmxOAAapNNPTRrA
	V5JY0mRcV1ZuOQfo0A4N6EOSJijVSimx5DKiD7gIPTY416r1xVOAzzWdhhBXdR2jLLOMTxJ/C+D
	zc/c0lDNjsCdf/erSdRQIdVB0V99pD0sIj5J8=
X-Received: by 2002:a05:622a:34a:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b3744a44bmr184135141cf.21.1774251206124;
        Mon, 23 Mar 2026 00:33:26 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b3744a44bmr184134861cf.21.1774251205647;
        Mon, 23 Mar 2026 00:33:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192b74sm2367981e87.6.2026.03.23.00.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:33:24 -0700 (PDT)
Date: Mon, 23 Mar 2026 09:33:22 +0200
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
Message-ID: <3wp2puizxtd65wdskfzmkst3ju6erk7tv73qhwyl2pmfbbnvz4@3ixjc3a2nvxo>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
 <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c0ecc6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Gp_403MT8fa29MjLaSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NiBTYWx0ZWRfXwhNP5enOsnmk
 WNx+XbVAhx/KcKgUm4m4b9PCQWa1UkgUbgQk9BUWUR/dKNinuSN4zJKXoUv5JsVYZ8NGf6j+i7b
 BhTsadhz9AoGeoaEkg9CmxKpPnh4xFHb8+9zoLuyu/teP+b8STpQ91opLytG0OTlGXBIboyYEJO
 Zh18ls2/RVkx7edmtSBgWp0dkBWkFTPW2zpUT+WmvmTnl8zMKrK6SwCrlJk+Get0LyPEFU5Rmxa
 hNGid8nRDS6kaEEdRL3l3MOJDhzzkoBzKv4zqtN/rChubKjU6k/e92gMFLsGaa81dxCOOQKrkdC
 mvoSoJ68XWxUSw9Oav+nAmSO9enkU8VKVCF0/khAOcJWHizxoaXsHVvc/0M7DdaXVKdyl71GhyW
 tQPho45cH/H4bpp86XSeOROVVlwJNqQPLRmZvqHiYVYq2Z+6tqEBEZ1fAC/e0giyDOe1KIUwXNU
 HvFtac8alm0kdb6e4ig==
X-Proofpoint-ORIG-GUID: JGGdTSCIzoHiqS--b6SoTJmOiuzxovE5
X-Proofpoint-GUID: JGGdTSCIzoHiqS--b6SoTJmOiuzxovE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230056
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99119-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 431532EDAA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:50:32PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
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
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> > index fbe136360aa1..ef7f6f931557 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
> >  {
> >  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
> >  
> > -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
> > +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
> >  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
> >  }
> >  
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index e0ca245c8c63..7f36eb65dcbf 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -99,6 +99,7 @@ struct iris_core {
> >  	struct reset_control_bulk_data		*controller_resets;
> >  	const struct iris_platform_data		*iris_platform_data;
> >  	const struct iris_firmware_data		*iris_firmware_data;
> > +	const struct iris_firmware_desc		*iris_firmware_desc;
> 
> Missing documentation.

Will fix in v10.

> 
> >  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
> >  	enum iris_core_state			state;
> >  	dma_addr_t				iface_q_table_daddr;
> 
> <snip>
> 
> > index dd87504c2e67..d36f0c0e785b 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
> >  		return core->irq;
> >  
> >  	core->iris_platform_data = of_device_get_match_data(core->dev);
> > -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
> > +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> 
> How will iris_firmware_desc be selected once a SoC supports both Gen1 and
> Gen2 firmware?
> Today it’s fixed in platform_data, but eventually probe would need to
> choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.

Yes. Looking at the past firmware releases, we might need to implement
more than one "description", e.g. when upgrading between firmware
branches would also cause extra side effects (additional codecs, changes
to the buffer sizes, etc.).  But... I'd really prefer to do that in
steps and only when required.

I'd leave concurrent gen1 / gen2 support that to be implemented in your
series, if you consider this interface to be worthwhile. Currently every
platform supports only one firmware "description".

-- 
With best wishes
Dmitry

