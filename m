Return-Path: <linux-arm-msm+bounces-103107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCuSGkIV3mlBmwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:21:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE84B3F89B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B89D1308F773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FD03CD8B8;
	Tue, 14 Apr 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3LcniT2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C03CAE90
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161631; cv=none; b=lchzQcXjfQfXpGVBaSSXYsfCl19Uuw2oQ/czIdtC7eQBMP00BUXyb/9DjFY+Zn6Tu6bmCHSPRXU5ZrVK2Wxnr3tEKM/vKZ5f2l6KOMcoTsAxWL7a7N8Y9FACJ4duo30Wz4fNxd1SUtk1FAXoTvyD4cxaLO7tTvLsxQ/e4uoqun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161631; c=relaxed/simple;
	bh=EFlGQxmBV63HIP9B7f6FSoCl+XbSrkz6uGLoVtAEIjA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YvAVo/tu3QjEenxuV/B0nmtk8S0SEa9yGyfF29SYb7EsiyeRH9Gbip8rANHg67/s64YufQ2Wz5HJly2kseRHHMCfs9Ol7BIJC4U+IpQ/7K/1YVNbra5OQOIEYOMnHhr9AXIpmRdsmo0fmHvPrpx83bMgLufM6ZyR1EJ1W8JTv7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3LcniT2/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8d7f22d405so826979766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776161627; x=1776766427; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJSw8VlpR0SQaT46EC/ZG9s+q9gQW8P2r5D2rKPIRLY=;
        b=3LcniT2/FJVTH29ctgWS3JueOyESsAEv7zofYheA6NTgFwGGAOv8E+hpip+wLctUlI
         nX/sRgDqxmcEmqAhbHveClc4CO6NyCQ+cALG/SixxXgsUG26tcSPXFyo9Phj+1MumiRD
         M8hlaj0T0qKvdE+u+hakCtj4NsRAH5m1ioAjrRE09OR2FE1Gs3Y05RGfVHV46AMF8kWT
         30Jb7TQboaINymU4juc9mxoGWwdq4IWTO/sNg1/WcSNdc/BRHeRV0rYu3FGEjp2QxVbM
         VRebTLaf6ubYcYTk0hFkf4dVkHanPUEdjnkYOd26N17qJVWJhwbu1B8lksyfco4n6tzP
         AltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161627; x=1776766427;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJSw8VlpR0SQaT46EC/ZG9s+q9gQW8P2r5D2rKPIRLY=;
        b=nx5teNHrRHMICWGEKeyiLlXTFgu6Hp5MVb7sin2WBmvFMQ4eKf1weY1VVZmlJdVsVT
         ijVaORhqRSFymIUjszQu3UTpKevPOtvHCwMsxBwYILrwJAvMENKOFBtyxBrfe+EbUC2B
         SzAWddX66eb/b58PyOuoYXrxHeWIHbyR4Y8/GJgDZv7obw/ZVWoeGHlmihMJQwBiviP8
         +/ltyQSFhHt96ut2J1Qzb12k0OB0n0PLb2Zi0xBnapDiLNZKodKrTz84yZYTqiP+rxdv
         ZYxPNgr2reuGt+zENKjNC7I4u4yKyykGK1rwWsSGGScBbH93jqn2PNlyvgQLi6vc7In6
         mQEQ==
X-Gm-Message-State: AOJu0YwYdDoa80iPC57qRSg90qfVWpo+eIXSENE3V2u7gBZdZ5XoJbck
	UV054SlpCFvUKKwT9pxOu0Js/R4a4ju7wKaFELgcSpgSc5hbussqoByh2FHswIwipBQ=
X-Gm-Gg: AeBDiesS7Gf92MOCqRf9mQYYmhcGSdCXJFmkOkRlCGI7MtRovp1e0K4lh7gAQuMbv+Q
	HtHtD557nRnUJyw0+iQ5x4ukg5ar5tqWJNJJHWFLKW9qa6ckMbsVZEfLyv7eDqEuyY5rvUWZJVd
	UppeYdwvVKEx5NHIq8QDptRU1myB5TVBg42bgQLUZ1m9KNCq+b1HX5S7vJPO9pgrjrkbJ2bXCq8
	0xh1Y+7J7X6izFnW35ldYciP6yJtCFRzOHA+Q3Noa20Itdd5WdWYLVLAy0B/ZWMY1OBX1ap/drw
	YXKqlKHUJT5Qos23oGLpmM/NjDOkYrDyoL3ANU+XdpTkTNyqIozr6oAqffs8oQcyB0CP3RiEyof
	kucy/m0zw1CAiGnAQC/y6pWVsfILB7FR2+HnAa805zt+RHEosGkaapgr3celNKYeNQIo++IMy+d
	KJmado5QB0FG0LpX/7pNHSHif+ttqKkAoXe0nKrR1ZF7pkOUFnllZihIoNIJN3Ddo5XLMq
X-Received: by 2002:a17:907:c80e:b0:b9c:b475:90ff with SMTP id a640c23a62f3a-b9d7298086emr974077066b.30.1776161626946;
        Tue, 14 Apr 2026 03:13:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dee0d9csm386880166b.16.2026.04.14.03.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 12:13:45 +0200
Message-Id: <DHSSQYIFSY92.1J57RLTLCH8B@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Pengyu Luo" <mitltlatltl@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
 <177463970785.3488980.6066718261448635938.b4-ty@b4>
In-Reply-To: <177463970785.3488980.6066718261448635938.b4-ty@b4>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103107-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: CE84B3F89B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

On Fri Mar 27, 2026 at 8:47 PM CET, Dmitry Baryshkov wrote:
> On Sat, 07 Mar 2026 19:12:48 +0800, Pengyu Luo wrote:
>> mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
>> not be the uncompressed data size. use src bpc * 3 to get src bpp,
>> this aligns with pclk rate calculation.
>
> Applied to msm-next, thanks!
>
> [1/2] drm/msm/dsi: fix bits_per_pclk
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/2d51cfb77daa
> [2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode panel
>       https://gitlab.freedesktop.org/lumag/msm/-/commit/82159db4371f

Just wanna document this somewhere, 7.0 is quite broken on QCM6490
Fairphone 5 (8-bit cmd mode panel).

Picking these two patches plus "drm/msm/dpu: don't try using 2 LMs if
only one DSC is available" on top of 7.0 makes display work again.

Regards
Luca

