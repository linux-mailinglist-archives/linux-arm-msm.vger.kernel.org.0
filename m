Return-Path: <linux-arm-msm+bounces-88671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11BD16EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC954302BBB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC7125F98B;
	Tue, 13 Jan 2026 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdDnggCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E30369220
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287523; cv=none; b=l2RBz5bh2n9BgdsYM0N80NprKRwpJ5MkBSaQ1uSIm+GA2rpHJChyoBed7p0QVry4q0xl5TwaadZ/59cyZ2FHHKy5D7RGgbpKHXwvf/JzHPn+SaA9xAvFPMAXRcJVbvUszOoRzUKRFNojsz05TQ9CKiD3JO0l26uqLukf95oAiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287523; c=relaxed/simple;
	bh=zP71oK+dk9NVP1xGIDbhCHq4iUEujGo+izh0qw8II4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPR00rYKi3i534z7nPUhWwZIf5YjJhqjwGbUSkcGkxQVc88QyTDxmuaQ1c72IgPirqN83BAlUWu0JlH6wC9poVoIHahb9RUqQASiMxk04o77u6j6UD2B5jgZKzgw5kIGHNHzfCbdOBw9qlByoLpmCQ2LDXbMIJIYbU9CmcJbVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdDnggCN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d0788adaso48176015ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287522; x=1768892322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v0wtDg3/NAN9kt8oWyIWMeqCacGDPCLQ5PqTweWycMo=;
        b=MdDnggCNOuuBlwakvKc/U1Nxq2ZhE/HU8QHQ6HSFN2pTEU3bYsKiaAbf74MxEgYcOf
         56avekTzCkkGjMltsYoRf4S45fkOZ18SmCdeJkfB4ba5yYwYbrBYtm2mzMcAABRaDZTi
         NmHYoy+JyJ6EDOGK9lSb3m3P1KU2cpCAkQt8dEwR5hFYkqpVQtQvSzCXyQRyd+9S4JBk
         pHzsiczNT9iYfZbvQGPeDMBB5x7qJHoL2hHvRHbWxwUc46jTgSqlGnLuzHmgrOGtpPpb
         Vatm9QiU335PSFNXfeZVUMajThaxXLsZoEvIVu2eK72xoPb3rxm0cSbU3ylo0SWaUWzG
         8eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287522; x=1768892322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0wtDg3/NAN9kt8oWyIWMeqCacGDPCLQ5PqTweWycMo=;
        b=YNBcDN5Nm/gxIUgx35VnFr0Wyu2K+OkS5jzU/CRpcyqy85Sj/kZu9F1fRXDsfBMQCQ
         m8Wbr2eBgSbtBFtSD61e+IIx6+2kqOYMaapBVjdIIvRCCQ1BcBDJXtKkKXa7cfOZIwoK
         TubAUwUjr8WxdrCvUwjj+r1+v1heHuEPvX4qjbUDrORtck1vrIZTkYfNQl8tyxaj+Mro
         g0UbiTE6qw2PqhObhVqT2BAGdE4BF132tBWhX5+kqddM5yH+Dj213oCeDXgRitd+AVG0
         ofyzXX6bjAaPe63wRWFMvwVbxfrEBYMG1cNPuo0hLUdVfq6RmYo3uuO1hJbsqn5lUkvw
         +g8A==
X-Forwarded-Encrypted: i=1; AJvYcCU75rjzwKAcsPFp+MfdjHWRuIWCj9nyIidzyB/kgrYzFLSlp3bI4zJZlV/rN4p1LVL+kh4eGHWGcgT2Lo9m@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGOPmJxQDdaqZ/lz7+h96luDID2LdXcwTNdggz9Aa0L7ZXiiQ
	MguF6PGTQWWw70bLFxyfBNEeRN4HtmymI9ec59+ZoHjR8uQ0whG6cM/gl3OPpTswkc4iObqIKzI
	OmwBBoBQs8E0tlW6y6queYb/z8nzkgOw=
X-Gm-Gg: AY/fxX6x5/mQ/4ALojY8qh5OFVWqZpy11gzQVP9cje9k7GLPwtzdgWzUn9TKS6Dk4us
	1CKkwUs/izs2UzdRxFoy0xxmmzMWiWZ2fndQuwN/FBGgu6n4CK76brxeH5sE1ZcfuCd6qR0YTYl
	53BiOlD7177hAiA/ELKfh0U8k5qdQ35y1oWhOYfmHgfgff1T/0wjdaVwymjowJmmbzIEW8rSr/s
	nOUYw5Abp2mJmbvjkJF3jHiYP2Z2BSZ1VZnz3PZw1Zt/PMXC3j8m7D9vSF2Ndhc4u0i
X-Google-Smtp-Source: AGHT+IEDVedBQs5GfreScTfX4yE9cE9dmVGG5ks4O89dQrxXlzHfxJKIw2ZOnH5F/6u5XdQzjdfyn7tUBJ5AnhLzyoM=
X-Received: by 2002:a17:903:1b6b:b0:2a3:c667:e0a0 with SMTP id
 d9443c01a7336-2a3ee47dee7mr224342905ad.29.1768287521679; Mon, 12 Jan 2026
 22:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113023839.4037104-1-xjdeng@buaa.edu.cn> <20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com>
Reply-To: micro6947@gmail.com
From: Xingjing Deng <micro6947@gmail.com>
Date: Tue, 13 Jan 2026 14:58:30 +0800
X-Gm-Features: AZwV_QgAW4BzVTUyGjflZNCkvP8Jwnfwfe8NpKmaCwTyZdbmheLOF9_bQe0CWoM
Message-ID: <CAK+ZN9pFiC5tj_-cEdp_B-BOwBZRat-JxococWd_mWRtEVLDVA@mail.gmail.com>
Subject: Re: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem() return in rpmsg_probe
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I have regenerated and resent the patch as
v3: https://lore.kernel.org/linux-arm-msm/20260113065409.32171-1-xjdeng@bua=
a.edu.cn/T/#u

---------- Forwarded message ---------
=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A Mukesh Ojha <mukesh.ojha@oss.qualcomm.=
com>
Date: 2026=E5=B9=B41=E6=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 14:36
Subject: Re: [PATCH v2] misc: fastrpc: check qcom_scm_assign_mem()
return in rpmsg_probe
To: Xingjing Deng <micro6947@gmail.com>
Cc: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
<gregkh@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
<linux-arm-msm@vger.kernel.org>, Xingjing Deng <xjdeng@buaa.edu.cn>,
<stable@vger.kernel.org>


On Tue, Jan 13, 2026 at 10:38:39AM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not
> checked.
>
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration
>
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to=
 the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

I don't see the lkml mailing list as part of this patch.. please use
./scripts/get_maintainer.pl to collect all the necessary mailing list
and maintainers to be cc'd.

>
> v2 changes:
> Add Fixes: and Cc: stable@vger.kernel.org.

Changelog should go below ---. Also include the link to the v1 in it.

> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index fb3b54e05928..cbb12db110b3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2338,8 +2338,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device=
 *rpdev)
>               if (!err) {
>                       src_perms =3D BIT(QCOM_SCM_VMID_HLOS);
>
> -                     qcom_scm_assign_mem(res.start, resource_size(&res),=
 &src_perms,
> +                     err =3D qcom_scm_assign_mem(res.start, resource_siz=
e(&res), &src_perms,
>                                   data->vmperms, data->vmcount);
> +                     if (err) {
> +                             dev_err(rdev, "Failed to assign memory phys=
 0x%llx size 0x%llx err %d",
> +                                     res.start, resource_size(&res), err=
);
> +                             goto err_free_data;
> +                     }
>               }
>
>       }
> --
> 2.25.1
>

--
-Mukesh Ojha

