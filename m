Return-Path: <linux-arm-msm+bounces-113305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GX8hCm6eMGr2VQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:53:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9850E68B157
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:53:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IFA7giUC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G8kTN4N6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113305-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113305-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C94315B3D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ADD1DE8AE;
	Tue, 16 Jun 2026 00:46:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DE51DE4F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:45:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570759; cv=none; b=Rs/pvaFRSl0MKtyt54HZ5499CdOUSDSleM9Au5XZUMyp8XmmtK+flkYWLjC7rKFfCQ0gV+vG8O+JEepAjLIoSMVijVEWdb8JUtMsh1FALnuqEduNMH7c5+kVb+d6fNMO0ZGDcRFnKkrtgcsvUwL27S3BceLN6NmfJYf6+TgjJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570759; c=relaxed/simple;
	bh=eONZ2qDP7bYpTubFKihJUwGDET5Q6Ud6Eyqy7bWpHzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4qtptmS9tMrutR0GwN9kSTUJib4B4D3++2JvBYD/5MIkqb90uIQq0P582qr+lmtcIaROPFsoH4mx0a/H7+bfFKoMXIz9uSA3WVxO63tqPvWy54j9LB3aN7U/e5XXRfGwpECAkhiN++5/Mnq9dpPi98Fh+lWq8jAiRRSIFKbTi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFA7giUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8kTN4N6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OZ6e092268
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjMiqxVc8eOO/stxC6osTkMjw8kH6o+EomigNC09KwI=; b=IFA7giUC3jxXpCFS
	KB2vvCSn3udjKUgRD2et6JXMxTnllhdc4RJJWGaXtnZJbO923DGHwJUjOvcLhOie
	+T/q3QWq8S1jx07pzh55W8aJsMeDR/nc+DZwmdbP5E3KCbdx/swIEa1doZ3i0hhs
	nAw3pfz4p/k+hVAJbwUCNXvQUy7f4hBeMo61L05A/civK2tWowq8i+Jig7eAWlbc
	BjHckQaoTHbf+F8YtWzrFz3+R9FGmJRmSY2QmcuWc/OCb/K6jUrLIXFKAcI56euI
	Tvzaon8Jk/xELeyHCMR9U8WCWNGM/DPlDivUPJbjQl5yF6mrzCSk7jMCwV8/+cNp
	yMI5rw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983ycs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:45:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157de5360fso907030485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781570757; x=1782175557; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yjMiqxVc8eOO/stxC6osTkMjw8kH6o+EomigNC09KwI=;
        b=G8kTN4N6IGEfsVLC2hWfKRY6LfgX1gSgR/l2jegTUC3GFicIzpdPzeV92OF2g5LJoH
         cp/mEZWDJvGiOuAwpLi1Gw8F93m1B92p3Gm8cWIuqoLvKp5uVmixNAYdPwBe97gbxbS/
         1BtW3m/OKK+Ormz6OKagHc8c8JH8PP8Ts/Omtb5dlvxjlnW3zqeUQkRmCjtGWnK8lrPQ
         jDMF7opVqVUs+4KlGEzLeB5YOdFrImWxMD8a0w+XFR1jn/P3z1wVUzfkXnRvSvD4lxho
         PKClbBRoKLj85PTXRPVxI8NtnTB6phiZ4Aej5k8auuB75gVxZMZ70Ga+q3eeWfZk37L9
         LhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781570757; x=1782175557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjMiqxVc8eOO/stxC6osTkMjw8kH6o+EomigNC09KwI=;
        b=PcieAmQZ/UHF/qVdhIkn6Ebxe6NBdoiYH4iIWzZwn9oZpjEAMCbo1+OxvNKAHnQaca
         YgyheNVE8zwfksLoWRslFk8OshhuEabz8/qY7JAqPb/fhtOESrNKp5LzXKsbMPDmkv2U
         r8EJL3nsMfmJwAaRO6kVhNnUgQQougdXqIerWbJ6q6bjB1VFx0dp9NMXbc0LVvuRqFOA
         xmW5t28kpFq8qQgc/5m0KNqGaNi36qfvYix36kmJ1ceQl+c0msbS4+jNTkml+nnqmpL4
         RUmW3Im2kg1YCEV3KUb4E45OxqOqBTIkYg8ZcXEJIS/79S+YFXFsCJgbDCW85TZJvQK0
         xbPA==
X-Forwarded-Encrypted: i=1; AFNElJ/HfyQXvABcmk7XKoCNo45+MA9EMikgcCe0JFPBZJxAJ3Hg0nx65h4X8IDS8FRFSX6Q5FUv6Mk7WGuGdJaY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3TSwyncuffo384Hl8AsWfoQLZIzYXvz8KoG7UzlDMZIDa1rt
	jyZYc/ONUlB+TiiMqaaZw6Y6FVn4fKGficpkJh9nJSsPWxZ0Soxtw216Dd1gqPb7YQH3HX+xePv
	+2eYGc9OJdh3uMUgNWLIKahGT+7Nelb9ePmgcW4sP2f7aqDPNEr5QZq5Z6TArRWU+LA4m
X-Gm-Gg: Acq92OHe1URvtSTUepxulraXhtVpllhGyTGAZIwVUyeJFzp/zkoeg4HOmL5WVGB5Bxb
	EJGuBCr5L7/FpNl7Fc6sywbEWLp7bIp1OvdIpQqfKIB83YSmo0MVPRkGybX/krNYEVcyLhlTqCX
	ONpy0beA/fT7EYC/S1WRVoNU7VOSQaq/eDhQbiG/0s2+R4c+JxpMs6gthCTHRtnUItphiGbkPII
	74jRoI5M3v7ZOjcaskULM+lfAbQ1xOJbVhV3pp3LtTH3W+dULvvuOAQs69bKaN4+RLfyrgz/SwA
	cQOCg9cPlIETCKC9gu3JPdrspXtP7AOxqh23OqMSjA/fNIdp1TralSNOt2FHUf9pC/wgR6A2ONl
	7SpVGfqo7EisR9Um6rot1hiX9Z1jkLk0t8RSw8toMDEJPMQMYR1rmC89XsJqDdt4ncoGKhHpwtO
	tOrbQ+F3Tf3uGBM6yRpc744Q9oDbo/ZWZNWPQ=
X-Received: by 2002:a05:620a:179e:b0:911:e11e:dc0d with SMTP id af79cd13be357-91c2e9fe4f0mr247241885a.24.1781570756922;
        Mon, 15 Jun 2026 17:45:56 -0700 (PDT)
X-Received: by 2002:a05:620a:179e:b0:911:e11e:dc0d with SMTP id af79cd13be357-91c2e9fe4f0mr247237885a.24.1781570756332;
        Mon, 15 Jun 2026 17:45:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e171788sm3061583e87.35.2026.06.15.17.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:45:53 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:45:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 29/39] drm/msm/dp: add an API to initialize MST on
 sink side
Message-ID: <kr6obgjfl3c6ggbzkb54pyb4zevcmjvhlq4xho2yej6kynj6t3@36kxpiliyt2u>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-29-b20518dea8de@oss.qualcomm.com>
 <32jtwnkusxultvsgvnalrvccfkcyk7744yf4d42pqm7wudysvt@l4pnrzfxh2f4>
 <1fe8d286-7182-49ed-b6fc-dfa3766f851a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fe8d286-7182-49ed-b6fc-dfa3766f851a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a309cc6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ftLlCC17uhUtI0jg2S8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yNAERFaSGja_lwp9SjpMHfzDYo-7YFh4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMyBTYWx0ZWRfX6tIKJ/O9W0gS
 K6ji/X9UHKCo9/RbOwcuZE6igg9B0/vJCznKTsw8DuJN8QDnHV9izMWK3jkAjS8BPdyqQMvQ2Es
 UCcisZUi2ozo3ExMo5S0g/wwKYIVNzc=
X-Proofpoint-ORIG-GUID: yNAERFaSGja_lwp9SjpMHfzDYo-7YFh4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMyBTYWx0ZWRfX6h+U4IDlpc/g
 vc9nL6pMNEIQdggU/oPprqYfK1PF6+sQgA5kni9CRcTe/9qsvvh9FZWh2IWjUYE+e5jBbui6Skh
 EZQLZRKDMrHQFAae4q/58H5DyTI3oxJKlJcBbI3/CRumuDc5x7Q68JEOV2U2LMDU2Z1Zda7W4Q8
 mUOTCFbStMyV/8R/FJbdSAOxVD9fPNjymG+aBoNP8+MIC4u/klkjCHD8LJoTi8Uee3YxwtIAU+U
 j4bPTcr1jAkmEagBx5U8INbygko+SKwKU9warfHZsKpzwpRYJbIAinw9QA6HcYo5Pszrf9bIaWK
 LLBGoZAgytxP6lmhjMKqd/P+eQqXtvBVY7/XaCyRdjhFwu4HjNdepPTL2XaHDldg2oSNPrcn0I6
 X6KFFj7109NbT7+JWRoLAMRZdgjbX7vlgIZ9WYDFAvhwOLljJYO0OQhdYeEx8RmFsmDJ0IrKS+c
 TGBPFN9qPThnnNr0Akw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113305-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9850E68B157

On Mon, Jun 15, 2026 at 05:02:27PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 8:15 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:34:04PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > If the DP controller is capable of supporting multiple streams
> > > then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> > > DPCD register to enable MST mode.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 57 ++++++++++++++++++++++++++++++++-----
> > >   1 file changed, 50 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 8ae690ce2b9f..abf26951819a 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -14,6 +14,7 @@
> > >   #include <linux/string_choices.h>
> > >   #include <drm/display/drm_dp_aux_bus.h>
> > >   #include <drm/display/drm_hdmi_audio_helper.h>
> > > +#include <drm/display/drm_dp_mst_helper.h>
> > >   #include <drm/drm_edid.h>
> > >   #include "msm_drv.h"
> > > @@ -270,6 +271,40 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
> > >   	return lttpr_count;
> > >   }
> > > +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> > > +{
> > > +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
> > > +	u8 old_mstm_ctrl;
> > > +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> > > +	int ret;
> > > +
> > > +	/* clear sink MST state */
> > > +	drm_dp_dpcd_read_byte(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> > > +
> > > +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
> > > +	if (ret < 0) {
> > > +		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
> > > +		return;
> > > +	}
> > > +
> > > +	/* add extra delay if MST old state is on*/
> > > +	if (old_mstm_ctrl) {
> > > +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
> > > +			   clear_mstm_ctrl_timeout_us);
> > > +		usleep_range(clear_mstm_ctrl_timeout_us,
> > > +			     clear_mstm_ctrl_timeout_us + 1000);
> > 
> > For 100 ms you should be using msleep() instead. But where is that
> > timeout coming from?
> > 
> Will switch to msleep(100).
> 
> The 100 ms is an empirical workaround carried over from downstream — some
> sinks don't exit MST immediately after writing DP_MSTM_CTRL = 0, and
> re-enabling MST too quickly broke topology probe.

Comment.

> It's not a DP spec
> requirement, and other drivers (drm_dp_mst core, i915, amdgpu, nouveau)
> don't have an equivalent delay.

Why?

> 
> > > +	}
> > > +
> > > +	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
> > > +				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> > 
> > Isn't it too early to enable MST? (I don't remember this part of the
> > standard).
> > 
> No, this follows the DP 1.4a MST spec. DP_MSTM_CTRL must be set before
> topology discovery. Topology discovery uses AUX sideband messages, which
> don’t require link training.
> So we enable MST first, then discover topology, and only do link training
> and payload allocation later in atomic_enable().

Ack, thanks.


-- 
With best wishes
Dmitry

