Return-Path: <linux-arm-msm+bounces-108205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNQkK5MYC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:48:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99C56DF58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 823D9302F9FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683861C5D59;
	Mon, 18 May 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BnYS7rU3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRs7bOil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905F3481658
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111978; cv=pass; b=kTo6FyuvwBmPSN5xWPGPRvb0FXVmofrGS0ihrNMuOf9tkCOsX2V7pX2aKd66OFEyOWdofgUTNbP6Iki6BjaLeCBh83c7rBdmlav2m37i4OdizCFUVDbtDXRnyPMTo/2drVcCmXwijeGNh8K7p0tUhv787CjJLC1UOin+ZvI8rtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111978; c=relaxed/simple;
	bh=Fu6+3yIwWsHOeIpuocf3V+gO0/lTsFlpj4P1HsjT05s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VwDFQ9BNXUiSK4LQ6X+JrfVFjijRzWRz1kp+FyonADTzoPAxK/9LElQZhBmnS/dd7lviTvDlj0z963OEHcJL5K3SOE6eGuZg9BuhaBQzG2VRAsv5cdS4cWLHuhDwToHjkzkrn2ha2A7Ft+tM9vbjuKYPG20cnvvSUxCFyCNYScs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BnYS7rU3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRs7bOil; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBw1cA1250890
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dxfhEg8QEY/Fwu3v3gUctioan1qabjbHVVxxH9aJwkA=; b=Bn
	YS7rU3q4PcCR8njXHqZ1p0V86V+Xx+f7z7Fsl5ZbMU10XkS0JK8+36HP7sEktqrw
	IimnN5lQ3H4fztquVb6SlxYSNqylAJ6zoGxHH7zz4KuHIYGUOzFfDPDQ6+i+7Dhj
	8DEx7er7E54rWS63+SOj5qhSUYE7AXPJwkfNM9mLmRP29Dyekd0r66Or8fE1vfGT
	g3PnLShMeeCAdq1RHitfFXSfMA/CdwWfkPYP/6Z1tswlXhh0JIyefqbGzzLNaHGA
	x0iI3MNTf9u9wrFS+kGBQh7Bgr6olP7c9TrfH4BE/m11WbdoL3J1ctypDPAF5fpM
	1VVLxlvsI28AV04+L4dg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0gdgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:46:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4828a2091d9so3844309b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779111975; cv=none;
        d=google.com; s=arc-20240605;
        b=JwrW1D1ftRNLbZ70KpUEqyEJ+cqBeMaybK+WSHmo6a+KFJaXdbSzNLwbY+rpUmaPwI
         YKq0c8u5HffcD9o4IqhMAR0K0kR/35Xrf1oQAIINQCO+xOmlaak5W32Nb7wuYcTyGJON
         GSKQ+eRoWaDhxOMChCffSCYbKM0Ctx8xrONETmlgJ1KmWkRPuyWlIS8pt9uD+92BbTDI
         yq9ULQ2iHC2D3H5RMPu8q5+xuEmAXDGlaC4gTJ9/tSarYUS0nt4j7Gc6aVU70sXM/VgP
         +VctB6DJ71xgvvHAuFKa3hnd4mIOzxdLFbo1z1pkZE329CT5xugP2IGUyKwc3vlyBs5R
         XRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=dxfhEg8QEY/Fwu3v3gUctioan1qabjbHVVxxH9aJwkA=;
        fh=6GG92my2VWd2ld8H+STOI3dnmGiN7P7MqkY6RBxL18g=;
        b=eBacbgu+q1bPxW1KaawDz/ghEdw0WMvcJdoYgSj2ZxgCP4IKyNCX0brx9dgZLO7v7u
         uNMhkUTP0TQCojWvgn1l9Gx0u0ZnQiGK0+2vZqUtHHSVMA3oMMqcezpC/FenUVd3zjJe
         PeQE5V/f4+ir8Dp1rHWOfPXjR8FsJfd+ZJ+zzb5ZxgaSJmqm/IqxQKFWBIP3YKD2yRcH
         IQpgWaPzNbC14iyzu5E8Mn8EAnI6qYhAixfHf4/ANXbaRHjtCz7mrdVYMaMH8ligAf7j
         +ZHZS6q34hLm5lXlF9ifxMkT0CfEHxApAWHOh7I1xi9R9rAobmwoOiSz2uaMEBOAUO2G
         YBsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779111975; x=1779716775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dxfhEg8QEY/Fwu3v3gUctioan1qabjbHVVxxH9aJwkA=;
        b=CRs7bOil4tEnKdgvfJMVMBDko4pLeg/leAMPKc9qloLiiDsQVYWMP/JQvwXq8wH10N
         VzkSjhqxExb4w4JqB9yetQxB5K1okcOoMWt8TdUAsDfruV7nXKQ5kcDflmQjCEdaxeG9
         hN3jnYJkA93hQLSBbDrRnTD8hB/98lzIlSOg6keUOp4FvPSK9WOted2+1R1Ebt2OOAxM
         C3U2jETTd5SABY99sySgw8M3oj8qkQpdHJuLnPs1jVmdEBizgHy4hNqyh17BUI/rN8lK
         mvAsFS9WXvcviCC+SHX0RABWhbYJ0vrIKfLLGuk3MS6Y0C+DH1jNU8nBsy6yMfk6ZhB1
         Jidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111975; x=1779716775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxfhEg8QEY/Fwu3v3gUctioan1qabjbHVVxxH9aJwkA=;
        b=TfzhovjU9P7zjstnKzoAerpw+YpctmVQ8J6k3j+4Bh7IOk/sf5y/9gN1KR++7ZEyc8
         0IZpR1PsjuQB5qT1/YJw60WOmv4aDBuHnWMzGKnBz0vwNgtoNmp9l+ztznafyP5wsZjC
         SYP2ATwF341StvEEaNIEZARkEpDf1TSZFmSpkl6OkEL6OHOOoRgB+6Lv6mslz2qJ4/MG
         37rZDTXZNKy69esm3+knVzBnh/vWZTofTyi61scYJwDjifo3/+Jzb7cXYwO4o/dyGSJo
         alI2gHppo7v8CDrNTXq7wYJmtyapuF1lXL4ujGfSvr5UBqchgsvDCdKe2eR8BEBMBS8E
         WAKA==
X-Gm-Message-State: AOJu0Yzevr3Y6gPRCZeLDodncTjaDYAjcn9J8b5xYLuVxKJJTbZI0PZo
	55UExGKvkNGtq4RyCOwro50Hp4/A56U+97vtvsr3cd6kQLeYeqS4/IQiwDZMDBB2HLR5AtRp8n2
	aAs9WmJ46qOEOD46FhubWD8sL1QJ+a04YhsbyH270cWs4fWi/hllZO4NleGWRtthjQ99LLlwVT5
	MN4LsmakECzl6+HMvu6MqvTyYtbihpbSrDP+ThSm4bxvA=
X-Gm-Gg: Acq92OHLB9dkCHNZA6qb+p9Y9Iutb/4WmAX2K2Q1u8Q8Ju/VXAHwoJECM2cu0K1J6xG
	C7Ph3kEq/3qq/+h5xLBmCdGuvPAaOx++xANVOJqZzOktUj6qFaujQaARGA7b7pjKDwrXPwk23y/
	iAkHqLB1Hydyw/Zm4000m4jaQ7WN7NYsI3ClZTpJXKGASKRNiWL08imXZcxlhqfdMQa2Tz1uRm8
	+tKi3Vxjfos1EklWXnZWlxguT0xlJdcIh6lrQ==
X-Received: by 2002:a05:6808:e407:b0:479:eb19:6e6b with SMTP id 5614622812f47-482e5609a80mr7140919b6e.15.1779111974850;
        Mon, 18 May 2026 06:46:14 -0700 (PDT)
X-Received: by 2002:a05:6808:e407:b0:479:eb19:6e6b with SMTP id
 5614622812f47-482e5609a80mr7140893b6e.15.1779111974260; Mon, 18 May 2026
 06:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
 <20260514134052.361771-14-robin.clark@oss.qualcomm.com> <836c9b33-4215-4e20-96d8-a8dc29ac6dde@oss.qualcomm.com>
In-Reply-To: <836c9b33-4215-4e20-96d8-a8dc29ac6dde@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 18 May 2026 06:46:03 -0700
X-Gm-Features: AVHnY4Kx6Z34rmVOGqn4E3nAuvg8tVMVODwKTTweDpCUiwHCp600_xIUyUY2Gdc
Message-ID: <CACSVV02DsSv7T4nDhmLSbNYigGNz4r1jmx3T=uXyg__=2CvE-Q@mail.gmail.com>
Subject: Re: [PATCH v6 13/16] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX5nkn1GO5OU8T
 yNDnzwP+PO90roEjCSpeZvbqkvUSjjhGj9FO+9MyyTZYQSBQ/32zgFzT8nU7yFn8ZB07t0iAeBk
 HMqMEDJnQSG59jMK45NqNk6k9Jv3RATNnz1OBmHylfxDPb9GapUxolzvXURuc23OqgBbXJq/IAh
 t6RMauINsvImsAbsLetGYfqJSmWmvvBJpKpR0tRyPaqhntrwyLbuUvKdoInMQSImoFTyXpOwE1J
 15agmcRB0W5HzywB47nxT/gSGKE6AFzHGko1Xnt57ZGJWSzn9Vmf+7qgG36wwT/DW1BORVfYFTO
 FaedlkyZkU05ZE1LROeK6xS0RdWkVfoFUZL023wUWyz/WJwb9NhuYeEZMoQmL4WxtdNJ9VtUZIj
 0i9Ohg+WEl1SqRRtTjgqyuCqTw6r/ieKiQyNm0ARtwAKQ4GaLpwkN93ku0Gb1CiJS2pJNPBhUzz
 Zu7ViAMejKsI55ZeL7w==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0b1827 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=6gC5UxSr3Lh0YhTRHQ4A:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: ydgfqTi3GvQjLaJvn5lD9U0ur-TmNfwj
X-Proofpoint-ORIG-GUID: ydgfqTi3GvQjLaJvn5lD9U0ur-TmNfwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108205-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4F99C56DF58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 17, 2026 at 3:54=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 5/14/2026 7:10 PM, Rob Clark wrote:
> > Add new UABI and implementation of PERFCNTR_CONFIG ioctl.
> >
> > A bit more work is required to configure the pwrup_reglist for the GMU
> > to restore SELect regs on exist of IFPC, before we can stop disabling
> > IFPC while global counter collection.  This will follow in a later
> > commit, but will be transparent to userspace.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c      |   1 +
> >  drivers/gpu/drm/msm/msm_drv.h      |   2 +
> >  drivers/gpu/drm/msm/msm_gpu.h      |   3 +
> >  drivers/gpu/drm/msm/msm_perfcntr.c | 516 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_perfcntr.h |  51 +++
> >  include/uapi/drm/msm_drm.h         |  48 +++
> >  6 files changed, 621 insertions(+)
> >

[snip]

> > diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/m=
sm_perfcntr.c
> > index 04407260a4e1..d6716ce0657a 100644
> > --- a/drivers/gpu/drm/msm/msm_perfcntr.c
> > +++ b/drivers/gpu/drm/msm/msm_perfcntr.c

[snip]

> > +static ssize_t
> > +msm_perfcntrs_stream_read(struct file *file, char __user *buf,
> > +                       size_t count, loff_t *ppos)
> > +{
> > +     struct msm_perfcntr_stream *stream =3D file->private_data;
> > +     int ret;
> > +
> > +     if (!(file->f_flags & O_NONBLOCK)) {
> > +             ret =3D wait_event_interruptible(stream->poll_wq,
> > +                                            fifo_count(stream) > 0);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     guard(mutex)(&stream->read_lock);
> > +
> > +     struct circ_buf *fifo =3D &stream->fifo;
> > +     const char *fptr =3D &fifo->buf[fifo->tail];
> > +
> > +     /*
> > +      * Note that smp_load_acquire() is not strictly required
> > +      * as CIRC_CNT_TO_END() does not access the head more than
> > +      * once.
> > +      */
> > +     count =3D min_t(size_t, count, fifo_count_to_end(stream));
>
> We need smp_load_acquire() to ensure all prior writes from the producer
> side are visible before the 'head' is read.

circular-buffer.rst documents the case that smp_load_acquired() is not
needed.  Maybe that is assuming TSO?  But I think even without TSO
address and data dependencies should be maintained, so this should
still be true on arm64?

We've been using the same in a couple other places in msm, fwiw.

> > +     if (copy_to_user(buf, fptr, count))
> > +             return -EFAULT;
> > +
> > +     smp_store_release(&fifo->tail, (fifo->tail + count) & (stream->fi=
fo_size - 1));
> > +     *ppos +=3D count;
> > +
> > +     return count;
> > +}

[snip]

> > +int
> > +msm_ioctl_perfcntr_config(struct drm_device *dev, void *data, struct d=
rm_file *file)
> > +{
> > +     struct msm_drm_private *priv =3D dev->dev_private;
> > +     const struct drm_msm_perfcntr_config *args =3D data;
> > +     struct msm_context *ctx =3D file->driver_priv;
> > +     struct msm_gpu *gpu =3D priv->gpu;
> > +     int stream_fd =3D 0;
> > +
> > +     if (!gpu || !gpu->num_perfcntr_groups)
> > +             return -ENXIO;
> > +
> > +     struct msm_perfcntr_state *perfcntrs =3D gpu->perfcntrs;
> > +
> > +     /*
> > +      * Validate args that don't require locks/power first:
> > +      */
> > +
> > +     if (args->flags & ~MSM_PERFCNTR_FLAGS)
> > +             return UERR(EINVAL, dev, "invalid flags");
> > +
> > +     if (args->nr_groups && !args->group_stride)
> > +             return UERR(EINVAL, dev, "invalid group_stride");
> > +
> > +     if (args->flags & MSM_PERFCNTR_STREAM) {
> > +             if (!perfmon_capable())
> > +                     return UERR(EPERM, dev, "invalid permissions");
> > +             if (!args->nr_groups)
> > +                     return UERR(EINVAL, dev, "invalid nr_groups");
> > +             if (!args->period)
> > +                     return UERR(EINVAL, dev, "invalid sampling period=
");
> > +     } else {
> > +             if (args->period)
> > +                     return UERR(EINVAL, dev, "sampling period not all=
owed");
> > +             if (args->bufsz_shift)
> > +                     return UERR(EINVAL, dev, "sample buf size not all=
owed");
> > +     }
> > +
> > +     if (args->nr_groups && !args->groups)
> > +             return UERR(EINVAL, dev, "no groups");
> > +
> > +     /*
> > +      * To avoid iterating over the groups multiple times, allocate an=
d setup
> > +      * both a ctx and global stream object.  Only one of the two will=
 be
> > +      * kept in the end.
> > +      */
> > +
> > +     struct msm_perfcntr_context_state *perfctx __free(kfree) =3D kzal=
loc(
> > +             struct_size(perfctx, reserved_counters, gpu->num_perfcntr=
_groups),
> > +             GFP_KERNEL);
> > +     if (!perfctx)
> > +             return -ENOMEM;
> > +
> > +     struct msm_perfcntr_stream *stream __free(kfree) =3D
> > +                     kzalloc(sizeof(*stream), GFP_KERNEL);
>
> How about using GFP_KERNEL_ACCOUNT everywhere in the ioctl path to
> account the allocated memory to the process?

Maybe the circular buffer itself should be?  But the size is bounded,
and I don't see much other use in drm..

> > +     if (!stream)
> > +             return -ENOMEM;
> > +
> > +     uint32_t *group_idx __free(kfree) =3D
> > +             kcalloc(args->nr_groups, sizeof(uint32_t), GFP_KERNEL);
> > +     if (!group_idx)
> > +             return -ENOMEM;
> > +
> > +     stream->gpu =3D gpu;
> > +     stream->sample_period_ns =3D args->period;
> > +     stream->nr_groups =3D args->nr_groups;
> > +     stream->fifo_size =3D 1 << args->bufsz_shift;
> > +
> > +     mutex_init(&stream->read_lock);
> > +
> > +     guard(mutex)(&gpu->perfcntr_lock);
> > +
> > +     if (args->flags & MSM_PERFCNTR_STREAM) {
> > +             if (perfcntrs->stream)
> > +                     return UERR(EBUSY, dev, "perfcntr stream already =
open");
> > +     }
> > +
> > +     size_t bufsz =3D 16;  /* header size includes seqno and 64b times=
tamp: */
> > +     int ret =3D 0;
> > +
> > +     for (unsigned i =3D 0; i < args->nr_groups; i++) {
> > +             struct drm_msm_perfcntr_group g =3D {0};
> > +             void __user *userptr =3D
> > +                     u64_to_user_ptr(args->groups + (i * args->group_s=
tride));
> > +
> > +             if (copy_from_user(&g, userptr, args->group_stride))
>
> use copy_struct_from_user?

I think this would cause a new userspace on old kernel to fail,
instead of simply ignoring new fields added at the end of the struct.
Which for better or worse is different from how drm_ioctl() works.

>
> > +                     return -EFAULT;
> > +
> > +             if (g.pad)
> > +                     return UERR(EINVAL, dev, "groups[%d]: invalid pad=
", i);
> > +
> > +             int idx =3D get_group_idx(gpu, g.group_name, sizeof(g.gro=
up_name));
> > +
> > +             if (idx < 0)
> > +                     return UERR(EINVAL, dev, "groups[%d]: unknown gro=
up", i);
> > +
> > +             if (g.nr_countables > gpu->perfcntr_groups[idx].num_count=
ers)
> > +                     return UERR(EINVAL, dev, "groups[%d]: too many co=
unters", i);
> > +
> > +             if (args->flags & MSM_PERFCNTR_STREAM) {
> > +                     if (g.nr_countables && !g.countables)
> > +                             return UERR(EINVAL, dev, "groups[%d]: no =
countables", i);
> > +             } else {
> > +                     if (g.countables)
> > +                             return UERR(EINVAL, dev, "groups[%d]: cou=
ntables should be NULL", i);
> > +             }
> > +
> > +             int avail_counters =3D get_available_counters(gpu, idx, a=
rgs->flags);
> > +             if (g.nr_countables > avail_counters) {
> > +                     /*
> > +                      * Defer error return until we process all groups=
, in
> > +                      * case there are other E2BIG groups:
> > +                      */
> > +                     ret =3D UERR(E2BIG, dev, "groups[%d]: too few cou=
nters available", i);
> > +
> > +                     if (args->flags & MSM_PERFCNTR_UPDATE) {
> > +                             /* Let userspace know how many counters a=
re actually avail: */
> > +                             g.nr_countables =3D avail_counters;
> > +                             if (copy_to_user(userptr, &g, args->group=
_stride))
> > +                                     return -EFAULT;
> > +                     }
> > +             }
> > +
> > +             group_idx[i] =3D idx;
> > +             perfctx->reserved_counters[idx] =3D g.nr_countables;
> > +
> > +             if (args->flags & MSM_PERFCNTR_STREAM) {
> > +                     perfcntrs->groups[idx]->allocated_counters =3D g.=
nr_countables;
> > +
> > +                     size_t sz =3D sizeof(uint32_t) * g.nr_countables;
> > +                     void __user *userptr =3D u64_to_user_ptr(g.counta=
bles);
> > +
> > +                     if (copy_from_user(perfcntrs->groups[idx]->counta=
bles, userptr, sz))
> > +                             return -EFAULT;
> > +
> > +                     /* Samples are 64b per countable: */
> > +                     bufsz +=3D 2 * sz;
> > +             }
> > +     }
> > +
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (args->flags & MSM_PERFCNTR_STREAM) {
> > +             /*
> > +              * Validate requested buffer size is large enough for at =
least
> > +              * a single sample period.
> > +              *
> > +              * Note the circ_buf implementation needs to be 1 byte la=
rger
> > +              * than max it can hold (see CIRC_SPACE()).
> > +              */
> > +             if (stream->fifo_size <=3D bufsz)
> > +                     return UERR(EINVAL, dev, "required buffer size: %=
zu", bufsz);
> > +
> > +             if (stream->fifo_size > SZ_128M)
> > +                     return UERR(EINVAL, dev, "buffer size too big (>1=
28M): %zu", bufsz);
> > +
> > +             /* There aren't enough counters to hit this limit: */
> > +             WARN_ON(bufsz > SZ_128M);
> > +
> > +             stream->period_size =3D bufsz;
> > +
> > +             void *buf __free(kfree) =3D
> > +                     kmalloc(1 << args->bufsz_shift, GFP_KERNEL);
> > +             if (!buf)
> > +                     return -ENOMEM;
> > +
> > +             stream_fd =3D anon_inode_getfd("[msm_perfcntrs]", &stream=
_fops, stream, 0);
>
> This call makes the fd visible to the userspace immediately. So better
> to move it after all initializations. Ie, after
> msm_perfcntr_resume_locked().

Hmm, but this doesn't play too nicely with cleanup.h stuff, because
the no_free_ptr() stuff must come after the last point of failure.

But I think instead we can use get_unused_fd_flags() + fd_install() to
defer exposing the fd.. I'll try this.

BR,
-R

>
> > +             if (stream_fd < 0)
> > +                     return stream_fd;
> > +
> > +             INIT_WORK(&stream->sel_work, sel_worker);
> > +             kthread_init_work(&stream->sample_work, sample_worker);
> > +             init_waitqueue_head(&stream->poll_wq);
> > +             hrtimer_setup(&stream->sample_timer, sample_timer,
> > +                           CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > +
> > +             stream->sel_fence =3D ++perfcntrs->sel_seqno;
> > +             stream->group_idx =3D no_free_ptr(group_idx);
> > +             stream->fifo.buf =3D no_free_ptr(buf);
> > +             perfcntrs->stream =3D no_free_ptr(stream);
> > +
> > +             msm_perfcntr_resume_locked(perfcntrs->stream);
> > +     } else {
> > +             kfree(ctx->perfctx);
> > +             ctx->perfctx =3D no_free_ptr(perfctx);
> > +     }
> > +
> > +     return stream_fd;
> > +}
> > +
> >  /**
> >   * msm_perfcntr_group_idx - map idx of perfcntr group to group_idx
> >   * @stream: The global perfcntr stream

