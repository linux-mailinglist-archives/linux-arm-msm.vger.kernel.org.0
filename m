Return-Path: <linux-arm-msm+bounces-98089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLqkFNIHuWmEnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:50:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70092A51B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8574830179C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF38392C5D;
	Tue, 17 Mar 2026 07:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tyul+yUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51481392C3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773733635; cv=none; b=Teuu416yAGvc7LTHoubZrv7DIJ7sukg45oMxx0e//cnvHfov3qqJGGhe3ra8GnhqUwwY4KLw+JJMH840ohdR1uSZ5AiSXZgBDqxP37D/Pz3u6OvY08hanZ6NXE0LWQvQlVrgunsFqRP6vTUIoJftOJT3Kc7HIM8O41O2u5RyQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773733635; c=relaxed/simple;
	bh=gk1q4Zl54I8wiUXgNa0EFd9UnVCSqo9XNxXpZitFYp0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qp/tLMTuXPzOP94WFlQUK3uOK/pdF6ZVT9qdKVGrGjIajAICPUZjn5HPy6TPhTovYGu+VFD4iiabA+HvltXFaBfaZLPqFc3eC8SQJT2BKvxNEB9ptRe70RFIviz6+PbmCWo3fj6ao+Abwad+yd1Bi6zjr+ouCVn+rT61tb752eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tyul+yUb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6631e0edcf1so7698234a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773733633; x=1774338433; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URtMf0QMNmyDbkNY3uQV2w4aEQAMl03HuCtwS6fp77Y=;
        b=tyul+yUb0zm8JwTCUjfMl8ah0v17KD5Qc/Q5P8T7+0Ol6/XjYYgKXpthP2ee9nj4lC
         +WfXUIAyabn8eqd+kMm4c+dpns4Yp3nRyCcIZM3RWP26opI18OAshEmgb/QomYLD+VJx
         HmGLugbfQ0J5X10abs/B5OIydw7m1Z/0xM9P1f/KfewoP2JevKtX7x3UGBz3GjNsPEoN
         uIG/5vYqVn+8A36CwBpCSg/L4q0/3zlH5IqhOV+Yd180DiOhzv0A4WrT7z1CYkYlelCg
         zbNFSxmsG9Ooyr+pMZDr7jFZLKKSrshcOLlUjuEE/jOhHtA5mvcsM897SQL+s79EzcHR
         JaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733633; x=1774338433;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URtMf0QMNmyDbkNY3uQV2w4aEQAMl03HuCtwS6fp77Y=;
        b=U2GI/GR4SbhvqBc94WRakiuXS31FGXTN7MgtFgLNIJX1v8uCnPyy5A2q0oKmMgshRC
         GmL0F741kxm9p6WiByosxptJ7273K+H6R9CzfmCfqUPPm0PISbuX1xlWH+bmSL7qE3oL
         MBufB/QUaGXXCx+HtzSan/wId8GkWc3YBq9EHm0SEnGEZRwU7TsxBWvplEI6WVl18jyf
         n7pJw42W4SySUYKDT4W3r8xVTDRFZZ0elLdxsQKVTsJPa+gPq7RiMkxloD0Z9iylVG9n
         S9NRsMjcbbxyD8AUIVdoKHCYjUqkBWax6qortU2LFTefCgGKBQajp4ZFXfCZUmenFTB5
         niIA==
X-Forwarded-Encrypted: i=1; AJvYcCWGrIi2btC2Guiv5F9v1LWcndzBli8JLMDMh6S28MJ2He3qoxLbJPnw2eRRciRW5zHsc3yQC1PGl3URRsvf@vger.kernel.org
X-Gm-Message-State: AOJu0Yypv2QMGttwngVxr5FcaYv9wBc32SR2gbar4cEy+rs/otY+rpzl
	TNM+Lsn8kdOE9IPitvr4T6uDSEHqksSp5KoUnjhItVyO3XV5f51EwmASKHEf02RkZHg1zvSnjLe
	5Lf/f
X-Gm-Gg: ATEYQzwB2Ae92OazJJ+DEixqOlqbjF3o1GS8J3eF6JIeII1Cdtv7oFFMRh7N8FraI5i
	9NfjLVTk/3KMz4iiABPC8QWM3GJM1R3iM+ks4Bb7IBsSgOyZjah+4XYhJ9v+44uSlqSI4d3XFBi
	ceGc4e1cg1CkhCw5qZYNzv4pYAd+2QC5dqiLlYyUdeKeupIhH6Oo2stqsRtZFfIoObgSlIXTMz1
	xspR3VWbpY6Tux7ylJ3omfPbjCX96SwMiCIfkiF1gRD9UDBbvH0Fffv+ehoTxP6EwK2tFJ3azYQ
	xeOk5H9rTMqjJOZ0/rlgTyT2sgdJpKyTw07ov2oN0sR+IMAQU+Uid8l0nhwd7VfRNhsEaSfstdM
	qGm9xf3zeIvFhBx/s0vqops/Dia9B1XF+ZlrGx1ZSvc8+6hFZs1SrEb/FrgqP8p4l1NvM/qGuOi
	Fc36jYnvR6buHWoLf+Wa64ePPcQzeJE365lXGWCSXVE1VxKqg+Dg4KFojDPE7+C0vJJRZV
X-Received: by 2002:a05:6402:27c7:b0:665:20dc:cb44 with SMTP id 4fb4d7f45d1cf-66520dceb70mr4727389a12.29.1773733632583;
        Tue, 17 Mar 2026 00:47:12 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6670b92e7e0sm985353a12.11.2026.03.17.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 08:47:11 +0100
Message-Id: <DH4W3H5N4HQG.GAHFYE9XGEI5@fairphone.com>
Cc: "Mahadevan P" <mahadevan.p@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krishna Manikandan"
 <quic_mkrishn@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
 <twm2kcouzbwew4md27f3o36q5odpctlfugmkakxom7b2ittftg@qb7golmack6c>
In-Reply-To: <twm2kcouzbwew4md27f3o36q5odpctlfugmkakxom7b2ittftg@qb7golmack6c>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98089-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: A70092A51B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Mar 16, 2026 at 8:54 PM CET, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
>> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
>> >> Hi Mahadevan,
>> >>=20
>> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
>> >> > On SC7280 targets, display modes with a width greater than the
>> >> > max_mixer_width (2400) are rejected during mode validation when
>> >> > merge3d is disabled. This limitation exists because, without a
>> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interfa=
ce),
>> >> > preventing large layers from being split across mixers. As a result=
,
>> >> > higher resolution modes cannot be supported.
>> >> >
>> >> > Enable merge3d support on SC7280 to allow combining streams from
>> >> > two layer mixers into a single non-DSC interface. This capability
>> >> > removes the width restriction and enables buffer sizes beyond the
>> >> > 2400-pixel limit.
>> >> >
>> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display fo=
r SC7280 target")
>> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>> >>=20
>> >> This patch is causing display regression on QCM6490 fairphone-fp5.
>> >>=20
>> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on th=
e
>> >> screen. When reverting this patch everything becomes working again.
>> >>=20
>> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-li=
nux/-/issues/41
>> >>=20
>> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
>> >> quickly?
>> >
>> > Could you please provide the resource allocation parts of
>> > debugfs/dri/0/state for both working and non-working cases?
>>=20
>> Broken (with the patch)
>
>> resource mapping:
>>         pingpong=3D# # 68 68 - - - - - - - - -=20
>>         mixer=3D# - 68 68 - - - -=20
>>         ctl=3D68 # # # - - - -=20
>>         dspp=3D# - - - - - - -=20
>>         dsc=3D68 - - - - - - -=20
>>         cdm=3D#=20
>>         sspp=3D# - - - - - - - # # # - - - - -=20
>>         cwb=3D- - - -=20
>
> I see. It tries to use two mixers with a single DSC. What about someting
> as simple as:
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index 0f4921b1a892..cbb7caa194c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_top=
ology(
>  		topology.num_lm =3D 2;
>  	else if (topology.num_dsc =3D=3D 2)
>  		topology.num_lm =3D 2;
> -	else if (dpu_kms->catalog->caps->has_3d_merge)
> +	else if (dpu_kms->catalog->caps->has_3d_merge &&
> +		 topology.num_dsc =3D=3D 0)
>  		topology.num_lm =3D (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>  	else
>  		topology.num_lm =3D 1;

Thanks Dmitry, this also resolves the issue!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

