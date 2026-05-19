Return-Path: <linux-arm-msm+bounces-108496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLJIH+dcDGrMgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:51:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF22357F06D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F36F1308F695
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844BE4968F0;
	Tue, 19 May 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaWcXxlw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqP4v06w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC3C4DD6EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194815; cv=pass; b=A+cNK20OB8mzg3EboC9ZSRCCi02Rj31/GGfM9pNj/DkqAog/mGU0PBzV+qJ/PYIw8YRpU/OcuI2H0emxCEptW27MApB9w123YrXo9OXTLxtIK2/LAIw0FFmHoQAxxTzITml1qCpw1K9uNwhcnI3KF5BJi7CxQDkRR/sX+hCPWiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194815; c=relaxed/simple;
	bh=JSREQUsahyPYMllTrvhG5r6EDbyyMPW6V7ai0thfVvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTuYvFCF4P2Bod1HtCnxsW6YyUJBlZ9gWjIdKKRJc4/Pea/OJT61OMGOUvxLQXJkj2WJoN2lr3UP7xvfizWg0TQjn50U+zytdRudTX2qjDbVXjPdkoaA7QrnGgTR52TM7gAsBpAj7EEDGWZPDRnLYjAP42Sr75vWjdTJ0OVxqA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaWcXxlw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqP4v06w; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA3Cee1393139
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SnX1+k0dWpdDwjifpKgD22GoiWb6N1UdGpYIICyh80=; b=PaWcXxlwopLvKhSR
	jQYczDrm4ICaIpCzS6MWpUTYK0k5+43s3znzCWptl9t221LaEDu8QybTUE12xYv8
	hps9HyUDkaDhd6LKeGSPURanbafrtZLJ8l/WMHJD06PkMtmaTpPiuar4r00I8FIs
	YHohdXYy60O6bvL6degAwNTpShBXyVZ6Jy1rQ7K8IsBSBweSBvD/4vXejRlMTR2r
	4ptO3b664hsOn7PH7SV57a/5UFA73ktmg5MvRAfAvtL0MLIY4MUvD5V5hXLlHnpL
	WpAJ036Ew/9dmFgbyQThGO6w0KLkh1YTHNuwmsJgjkNKWLtw+SuungJEcEyvgzDt
	XzFwig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ns48ka2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:46:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so108882541cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779194812; cv=none;
        d=google.com; s=arc-20240605;
        b=PWh6uNjGTuL+ClVJln5eFGX0lz12TxYZt9/m1c8WJL3RK/1g18popXZRNU81ovfTyJ
         dilnL5vJuzUSYNsGoSRPUCx02hzkM2bx+fLjU/Yqx/tplFZiGnOi042l/IeRB5lSsEA+
         XGKjc9yNW5raLXEtJZ0/uNCTMJhAFlZvyv2fK2MXZ96c9r8qrk0AetYVgBZuy3lRmuZ3
         bR+7cFRz5+NDSGyI/M/9ODdDmD48Y5Tm75XElxQfJSK7TwXUCHY+kz+PEcJTEICw/NHh
         rUq2Gi3d8q940qJmYPcKUOKFEA9rM2B7zSwDD4xwFJeRG726LL3N/4BxVldJQB+7vHO2
         HahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SnX1+k0dWpdDwjifpKgD22GoiWb6N1UdGpYIICyh80=;
        fh=Y4Zo+9XxdOCE0qFNArkv4FqEC+nsH0h7Pnr8xTn3Bj0=;
        b=TkBJ/F2bjcENuSwx+/hu3nHPXebZUtZl+JHcJvfyAQNKrE2enQcAR/od5njwCVvkOj
         UrkWlLsXPl5xLjf3FEJsUFYxFRVdIbpfMcwl0I6uFdW1DmAwYb+0haOkb7TUJNebkSrb
         OoRwnz2T47eFT3yx6xIoEVmr+fn5dQ9N4ZZx1dpsELhvBqY8i2XqMf5lzLV7z1xMHXEJ
         1AlxJw1OdTWAtWXBvBZJPQKZdCW8kNV46eixD/THBrC9wAwy83Jb/gAzNgeAEmwT24Kx
         rCbBdjHCSNwuRkN1MpPa7CI2B/Yq1mYUGnrkTaQ9Tk/LTUaaS6RQ9+WWgjn3q4wropCj
         GlPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779194812; x=1779799612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SnX1+k0dWpdDwjifpKgD22GoiWb6N1UdGpYIICyh80=;
        b=cqP4v06wVMuNVb4fnfzWcVvmYcravwI0fa+wAluj/iJM0iSd/cZOGYzf4skF95gWPb
         GGnNWMWzk/qVTsQ0XHDFcRY1GkizRzVkOfP/wJ+J646vKOaQmKCv9BikSl1io8BjSabj
         GPdknJ7mEnIxtZpz7JuMqh9VmKIIB7YZiXK1AbYqHb5Ek1+WGDidBORBdGgc2NXl6QKw
         TvD+6xW+tqWMOlNrCuowkvoP4sq0WRTAptxvEkAQgKi4RtsTs7RLsAXCRzez/v/kg5G7
         6jT1J7IpsytysIuBqPBJcApo4PEbWd2BizQ40NYC8P9XXTHNabICbrRcF8POmfWQenm9
         cnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779194812; x=1779799612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SnX1+k0dWpdDwjifpKgD22GoiWb6N1UdGpYIICyh80=;
        b=S2EAiGxRHYqNxUrQwsSSpLhmVuXvtbqodTW80nueRjs8Gv/ybbAfEDbajrWVoIuYa8
         1NATk/ysBUPnnfzzkGvwrsxezfJWTAN+eP6klGXLj4KyPPVvVKZGhPl4VDklUvD42IEX
         ZDTAcQjmMPlSEmPCTmH+nT85ApElbPwNKJmTTv1j5vPeov5RTP3rbwnTn0nM6kDOesj4
         9maeDLtU0nEMR5+gqSlfPS8qHPh3twuqRscr4VvpwNCd4arGFS3S5vDZ9k4hiXfK2nYF
         h2de+0+9UMFBqlri3XglPwxPaZ5S/hxegNrSdLcMwSUjw5uNZ8pHt+qbjWA8104jH4Yg
         ihbg==
X-Forwarded-Encrypted: i=1; AFNElJ9KBlDA07Id+Gl8GCd2INY2Cwg/NSL9aH1W1WbxMSx7u+12ZH3n957NdhxzT5dDXdgmSMZedQWZLfhNSrqI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2ZhXCiyW3bqWkhKzHe5odYBVUnX/Eczq8Hd5puXOANCVwpk+
	dkOFnX2tNFGvbRJ2XqBxsyBsaOef0xC/DRQAqYOpE1YkjgIeJ4h7WqgYJks3JeVaXNVNyNvjSwt
	33ZTp/9FQDoepHS2nepgdZ9+W+2OnDY2RwHJCdJH6KXe27hIMcz0opLyGRqKOCaOgxjbh9fxOH4
	T1ZTrzbe/8iQE7W3npH7Xx1xjAoUfJqg4fF81dsqX/Zpdt9kIL9n0vXQ==
X-Gm-Gg: Acq92OGecQv7+X5T6BfEYxbOjB+xP0I/kbkT4PqaVWhoAuBPTscnzWX6n0SFhw9P9ja
	kv04d0Ja/3ZIObwA2PYBUUySs2RsxcVMmOvs+vmwbrfEdGZrc2Si55LpHnvHWMbBPdE8NwJ9KqF
	eDuekxgrWb++8T48TEzyKj49tGAik6G4V8Dp8JfgIb8sJFfYvTwgXFtcoqAXUXKOfGcz3X3wof3
	sfGYHo8yInAeRG/+mAq9LjrcWBqfscH+beuKvY=
X-Received: by 2002:a05:622a:250e:b0:50d:b0f9:1a66 with SMTP id d75a77b69052e-5165a20c07emr253806141cf.42.1779194812254;
        Tue, 19 May 2026 05:46:52 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:50d:b0f9:1a66 with SMTP id
 d75a77b69052e-5165a20c07emr253805731cf.42.1779194811677; Tue, 19 May 2026
 05:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org> <20260515234121.1607425-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260515234121.1607425-3-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:46:39 +0200
X-Gm-Features: AVHnY4IAFUXjXBxumMI80HUL62s38SMtNjuD9sgUlih-awOYvkH1ZnsJAOq5Fdc
Message-ID: <CAFEp6-06muw35D_oJ7SOrKdYjeB2KcCL-7YQHzwdOyNTsuzv2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] i2c: qcom-cci: Do not check return value of cci_init()
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEyNiBTYWx0ZWRfX9/pzlUiKdDBq
 EjqeEq/SALpBtr9KOyIwrbBNDFDmBwNCdwDXjDySiDA5+umSxufWA9j9XucfpUvTBQGYhoXThqD
 5WDnvdwQH9VDLH7gBb0ncP9xzbEnF18vTa3enrdkUHM8hJU8J5/m6j1+mtmNhMka1xGht+C70mJ
 96edV7dASGcFc5zxvtXEF8sed7DwVYDdafjLJaTl1ZZ5KBg1JSA+WphLMZF33TFrfnvQ12wLB4n
 cf7MMOP3SnBiTvNUuGS48HpQ93ccmp6f3uqcPymKOgo+JOzLMX5PbVkdCnGGBmp0NdOU4tEnrIJ
 1DceynfKAE9TAwXpKAPowz39sROlbsgWk6LDqNkcqkmzrD4wL+1TvOGns9GgZIb5AOo40yiJzer
 sGoR7MRPsT6yHlJJxahjc95cuS89Dz8ngtxKv09VrCxF4AY0e0BCDZ5+v9WLdO1+D9eIL9qE8we
 cwwD0JXByUwiR5tEdcg==
X-Authority-Analysis: v=2.4 cv=F6dnsKhN c=1 sm=1 tr=0 ts=6a0c5bbd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Nkl_wrZ5PYaF25YkcdkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: t8WXB--G0kwUeqV3wNsHmv-SjuGUcK0t
X-Proofpoint-ORIG-GUID: t8WXB--G0kwUeqV3wNsHmv-SjuGUcK0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-108496-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: EF22357F06D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 16, 2026 at 1:41=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The cci_init() function is not supposed to fail, and it never returns
> a non-zero, so it'd make sense to convert its signature to void.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 01e440b6585d..be41a53e30c6 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -243,7 +243,7 @@ static int cci_reset(struct cci *cci)
>         return 0;
>  }
>
> -static int cci_init(struct cci *cci)
> +static void cci_init(struct cci *cci)
>  {
>         u32 val =3D CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
>                         CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
> @@ -284,8 +284,6 @@ static int cci_init(struct cci *cci)
>                 val =3D hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->t=
sp;
>                 writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
>         }
> -
> -       return 0;
>  }
>
>  static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
> @@ -611,9 +609,7 @@ static int cci_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto error;
>
> -       ret =3D cci_init(cci);
> -       if (ret < 0)
> -               goto error;
> +       cci_init(cci);
>
>         pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
>         pm_runtime_use_autosuspend(dev);
> --
> 2.49.0
>

