Return-Path: <linux-arm-msm+bounces-32890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B498BFB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 16:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 582EAB20938
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8E61C9DC6;
	Tue,  1 Oct 2024 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdn5ZAWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCEC1C9DC1
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792223; cv=none; b=NcQMu3wG7+NvqpIp4Gb/X0ALi9Mpl7RVgGVEcenjg8o8d40uVEaQF5MOSzsKdbZkiRMrwWX4aBRXnrGVawX/xALXN0VxtfNJNTZ/ZnmWXN6LEalHsDhV5wSCLTZbkCJKq927ISok1CMpq8Q+p8Egew/M6dHDYDzwCAaTw+NrRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792223; c=relaxed/simple;
	bh=MvAacLaDBceNrpSd1jDzbEXuHGqrT8pU1AHDnl3+2N0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mO1KBpWFSzZWqVQBIMClYT/6uwRf3gOFkakcE2YHlMbQbu2lOHgy7c5oVfQRY1IvAE2QN2e6neSQbtKYSM4g5p+3uyoMqkf0zoIjwNerfUFdhdau6xjkiNpnuEFsPJbpb3ZFn6+oJtjZ6amyHDg50kDS9Rc2wt7HZAm6nIsOPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdn5ZAWI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a90349aa7e5so823686866b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792220; x=1728397020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MvAacLaDBceNrpSd1jDzbEXuHGqrT8pU1AHDnl3+2N0=;
        b=gdn5ZAWIlhlAGBtI994A637HnhBN7pzbMZUIGdGYOzc3jSXtcbblPFNGNcPE1ZE2K3
         +1jlTBS+RHjctMot0XILXqoeUQOVSmCJbDp143QaWRIXIXr1F9X+n2G2/c9c6Z/bkDQ+
         8LunTI1TvYUr8SAmI1GlEhakLePL+sV0q3UPxfmPhkHqBDq70ebjmtme0+aWuh6ql3QZ
         +EjXzL5hx2V6zIRyTGlanS0qaO+Bc47MqpoWsCjb5QltRkU4RD+/zfsQh3mkLgdvloCp
         NoFOvN6GdGLBhDy0QUrxcGe0dlBBMjoTg+ZaryqFIBh3mQFENNsIlkMK6VYismyFPzJ4
         R6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792220; x=1728397020;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvAacLaDBceNrpSd1jDzbEXuHGqrT8pU1AHDnl3+2N0=;
        b=Ps01uV+LPCPcqtJEGCs9SMgoXxwuhr9+oo1Iw+yud6bv5rsCzu6/gpiz77nIQbNoeY
         c5eKlBo4plUf/TQ41Wx/RdCCcWXDFJDBIiUKMaF4Bemx65eezSHfql82WCagQ+7v6caN
         lqjU+IHP9XgoPTvOz8WaxPcxesnn96Fe/KA4rh+4TzOTJe1u2ir05CD6mEy6RPUMEiNs
         NZABC0ZVOa6jnKWthPXtZ2oreimSuv3RvC+o26LZEQ642jbdsFCDBmiJC/XdG5np3x6y
         y7n2p80gOGFvYpdlamRCWoZc3HYjzxaRuetlyZpD0UTwqblkggcOeMnff4H4XkDOB3Xi
         PEig==
X-Forwarded-Encrypted: i=1; AJvYcCW9M3AlrQM0lt20SdW7EIy6nxgSE3Nz7AO0DkiiEAh9YRzbMaKVTMBIAGBI2+68k92gmzdA1ZxVZqfGhIcM@vger.kernel.org
X-Gm-Message-State: AOJu0YzjwYRo+Izw4GhfEKpwmHWoZzg2wDhjUGjuRXVhhU2PS4HJzG15
	Ig7RME6Cvh8nWPhWM5yU+yGgCbwi8TYEGrVy9ugXg3g29Ydp9hxext0GvtU/C0o=
X-Google-Smtp-Source: AGHT+IFEWffX/CHGY6XoMdO9kdp7HM2GYhPbJlSBDdG8O1hxbquzBTDo/fLcnh7exBe/tUwFPn8yXw==
X-Received: by 2002:a17:906:db04:b0:a8a:18f9:269f with SMTP id a640c23a62f3a-a93c4c267dfmr1736758766b.60.1727792220071;
        Tue, 01 Oct 2024 07:17:00 -0700 (PDT)
Received: from [127.0.0.1] ([37.155.79.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947487sm719545766b.139.2024.10.01.07.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:16:59 -0700 (PDT)
Date: Tue, 01 Oct 2024 17:16:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, quic_mahap@quicinc.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/5=5D_Display_enablement?=
 =?US-ASCII?Q?_changes_for_Qualcomm_SA8775P_platform?=
User-Agent: K-9 Mail for Android
In-Reply-To: <609440b4-e46b-44c6-ba33-c30f4ca8d863@kernel.org>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com> <609440b4-e46b-44c6-ba33-c30f4ca8d863@kernel.org>
Message-ID: <576B115A-CB36-4795-BF23-75EACD0679E5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 1, 2024 1:16:31 PM GMT+03:00, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On 01/10/2024 08:41, Mahadevan via B4 Relay wrote:
>> This series introduces support to enable the Mobile Display Subsystem (=
MDSS)
>> and Display Processing Unit (DPU) for the Qualcomm SA8775P target=2E It
>> includes the addition of the hardware catalog, compatible string,
>> relevant device tree changes, and their YAML bindings=2E
>>=20
>> ---
>> In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt node=
s for MDSS0 and DPU"
>> depends on the clock enablement change:
>> https://lore=2Ekernel=2Eorg/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0ce=
f@quicinc=2Ecom/
>>=20
>
>b4 diff fails=2E b4 mbox + b4 diff -m also fail=2E Way to make reviewers
>life more difficult than it should be=2E
>
>I'll move this patchset to the bottom of the queue=2E Please in the futur=
e
>send patches in standard way, so our tools can handle it easily=2E

This is the first time I read that using b4 tool is a strong requirement=
=2E This iteration has been sent using b4, previous, probably, were not=2E=
=20


>
>Best regards,
>Krzysztof
>


--=20
With best wishes
Dmitry

