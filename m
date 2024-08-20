Return-Path: <linux-arm-msm+bounces-29065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B93BA9580AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CD97285511
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7219718A6DB;
	Tue, 20 Aug 2024 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AaO9QP+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780918A6B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141868; cv=none; b=OCiKjY1hoETvBPojYJUYO5bI5L1RfxuTnVJPbf5bgZFIQouZLo+wsMOHXhk3jN+fzyG5DUMbW3sdV83YW1lwL4GVY3O/LnPzpXgYtgFM+sVR9fgSwihtmpIm+DBOB0n/v6bZ6HzgjbIKpGZiT7u5FeYnvxKdaKpS/i9jGeK6Pqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141868; c=relaxed/simple;
	bh=IVTP/toLg2yh+Q9s92uZK4xzlEisMXLaxoaU3yPoRHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpjH9MQCE1bXhW9cvue1yTcWlwD79QPTcFvWsjSEx40BBMh3do7K/j5N06dl7ErqEnj/MXXo6BEiAnbTPWScP/7J/BawDLsVahZ8q4k0qBxXlYpoocxCZJix+ghmplyEPIVCs25QqSc3223NOe0qLCJ+QqgYlm3sJZX7hrDbT5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AaO9QP+O; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53212e0aa92so5832336e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724141864; x=1724746664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVTP/toLg2yh+Q9s92uZK4xzlEisMXLaxoaU3yPoRHE=;
        b=AaO9QP+OYxqoJjVhB/+v0LeienhEZbYzBDDlCJxMC9faeJJPFZb0Wdepc/ElKO2Ho6
         vC91nSdbSj7sxFEuE38i4USQAcr69mc1mCG79Jw7JTXzGBbo/qNcDZTTN5nuUJk+uiP3
         V4mUDRAxb+8hHY1pgUSaFCXSrqPX3SZT5taZg5k7vfTuTs9bO6mzvjA2VOkyteueUxn2
         EFzi21Hqiq+luBgfce31QOVVCOfZiCAx0wdpSTMQ9HNTqJYdc/yUsG5cUAo0pM0ww8HD
         rizr7OUQR88KKJUPW/o4+QRQlHFmxuuO7YjNkcVwhhd9nlo3S7L7Ni7kimJgEAZ+MPSB
         SUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141864; x=1724746664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVTP/toLg2yh+Q9s92uZK4xzlEisMXLaxoaU3yPoRHE=;
        b=CuFRBoLXhEh7tQAL32h1UtvAK28k1/7FnZvHJCPTcCB2XLvuC6V0VdtSGVSlE3+eFe
         VoM6NrCrkJmymAvI3iJjz9GFx8fJLUDp7AvNTwOY7+u4uyqbvBzgMjMiw1ybnY72vhsT
         qiFFp+2WOBR8OtthDp7YnPBNA671+41LUPdsnVR25etkfSsqKYkvfmSpiEsvo8NlO1cc
         NEq6n/2f0di/NTQ7jAvHVhDsulmZPGfretsn2zSjcPFEJMdSHvv7v9sAzbrpvEa7uUL+
         RG+516QS2GwbH+SA1zDA4UHM3bUMFZ3yO8RzAN2mPdsggDsfdDMj537Qnsnz5ODO0vgl
         dXCg==
X-Forwarded-Encrypted: i=1; AJvYcCWTW9HKAtFsNyuZqBxJE3rjUh7HTGB4a0vIvb9h8icy9djLI9TzcCynoh/xcnNSvP+FPnYlJml2s7kQt2lbjxBKgsc+8vE1FROtchST6A==
X-Gm-Message-State: AOJu0Yz8qR/8X2pbOJb8BLccBFPfpv89h7ayWRX2Di8bC6pstrsAokMp
	xamEC+n2g9Q/cx5qF8jc7fUcAM+VEonPNgpyZzQTlLEX/fsBORBcwZNT0e143vG2D98rxjB6Uhh
	YAdEG7bwYrDxCg0bHR42yVzfEdGJbJ0eo+JyI1A==
X-Google-Smtp-Source: AGHT+IFbDdTiw6Uk9S88S7dbr6cMRoYSFc48iuM3jxrmJUMbQvuz5tHkvlmpLI49vLNz6wM1Mmx8F8SVj9rCoaZGQ6c=
X-Received: by 2002:a05:6512:ad2:b0:52c:de29:9ff with SMTP id
 2adb3069b0e04-5331c692a14mr9702714e87.2.1724141863245; Tue, 20 Aug 2024
 01:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819045052.2405511-1-quic_lxu5@quicinc.com>
In-Reply-To: <20240819045052.2405511-1-quic_lxu5@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Aug 2024 10:17:32 +0200
Message-ID: <CAMRc=MfuW1T_dA-JdybqpYzEVY1KXmNdPsuB6J6gJ_3Gp+2jMQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 6:51=E2=80=AFAM Ling Xu <quic_lxu5@quicinc.com> wro=
te:
>
> Add ADSP and CDSP0 fastrpc nodes.
>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

