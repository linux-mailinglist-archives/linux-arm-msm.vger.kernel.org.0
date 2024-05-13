Return-Path: <linux-arm-msm+bounces-19773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE618C3A70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 05:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F94D1C20C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 03:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A7F145B23;
	Mon, 13 May 2024 03:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="P7IiSgus"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18011145B1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2024 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715570623; cv=none; b=WN8aKx0Xdp2joiFeIdP8D1kgdmPsDTUXB0eIbZlcHuSDXtDP/F6S24iUklmhFeMSEeLAe1Vs2qNVrpcthc6lhvk1MY0tFkYctk7FgQ6JRbLff16+s5IeBONrCKfQ2RK2qQBZA/t3TCx23P+DqnpwPgRzgE+Vl8w9N4W9TAefybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715570623; c=relaxed/simple;
	bh=XoegDtlcSO/zIWKuRP063e2zFQ+RAdHrnLhPXIuNUEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeuArVLRZ0hle7sm0F6ZE/4IHjr7f4WWUxdcXmMC5Qf5hlGP6mvFp68cdQbjrhNIrpRdsFwj/nSaCS8R35JUraSBF0Zw6bYkQCZDr+SvvpyARMxU3TGbvWHMWhLDdInb0d9NVbwF+ma3hxo2HFd5+axzhPaLIafarBrYotb3vB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=P7IiSgus; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f12ccff5eso5239992e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 May 2024 20:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1715570620; x=1716175420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3m7C5s1EzbrOCKMut3xyPmXWEUzIM5EzWY1SS9dSVQ=;
        b=P7IiSgusaN8tA/JtV2ZeR7LTt62mSdbHpi7C14dNPD54cI5D1X5HFaYTot85dhoctB
         /nKJPziKXkJlsDqDp5N8S8c1PVYypEb9IhzhV88+CLOKmP+92UAzTi/hf4jL3H5Ix7fu
         7o2cMlD29pERtxRN9L3HPvLSW4D1GBjwWd8PQ3ZaSOrSwUg9mhlNg+dzB/omgv/UmFTw
         ZcqTsGvCgfx958jHOEWSbBKur7/jWW++jNe3umLoC4rjLAH5yqLesr4Q7kVkcxQ7804a
         uJmmesqZSsH3GMJ3NnEi+8aTBFpvcTD7578zbhsZTYPqDunFezuCME1zzvZKATDgEreJ
         vj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715570620; x=1716175420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3m7C5s1EzbrOCKMut3xyPmXWEUzIM5EzWY1SS9dSVQ=;
        b=uaOKAwwZkcUVsWDmSk65vtq6XGEVZyvUjWI7eY0GugSLTRXoTJYSoRjVaKBHelY7NR
         n8cA0svn7z5z7FRZe0dpYE/91Knv+TKyGXgI4OvfM65an71anVM/eqbbaPw5oUIXvKRN
         3A5+/VE5q1Sxw1iWWT2VvHDsnlZQaUVrFgJtYQGdLeB32Icq1cTvFTtor+CuuZPg5iLg
         jRf7ArOJ3FZYv3ync/nxflHsvxaMNTNeE1cpggPzGW2OwTJB33mfAuT+fd5Oek02TvzF
         b8KGIeMSl5VAF77/WuY42R2JofOM2YB/9iHE+6v+du2mBFCh4Ixjtobm083uRBD73/xy
         E3ew==
X-Forwarded-Encrypted: i=1; AJvYcCUXX7Q38C4hgluMhpcGiB+bx1V2KJ1lTmUYL/EnHzSU2KHozz1cE/fGyXDi6k2Wd+DOot+Qu+W0fNbh7238dc38jYSHJmwEnBXrT9RtQQ==
X-Gm-Message-State: AOJu0Yyx09DEoVII8X/yGuWMg7+Zoi25t/Jj1h30bU3cBkbVYkMn+cWp
	NxhMzIqTtILoL1dIK7NN+73CvqvHnxOYLejtHhKBxGFHdkUTfo3YI9yhm3WwBIUo5YUg1DE1Y3p
	l8ytTRo5vQrByxcPXTjwRaEL/8BQjLWLiZCga/w==
X-Google-Smtp-Source: AGHT+IHy34Cl4xZziZ107yfN01l4O0AakzJJxSzjElicrXFSsUZTQI+ymQEJT0TItQo7MqTqkqjIYns4wqu3zrFqwIE=
X-Received: by 2002:a19:6410:0:b0:51a:d5d3:ee52 with SMTP id
 2adb3069b0e04-5221006e6f8mr5380369e87.17.1715570619914; Sun, 12 May 2024
 20:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
In-Reply-To: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 12 May 2024 22:23:28 -0500
Message-ID: <CAKXuJqjLFL4iYFf_FxTpKUpHPL2-G095Pyp0Qn0ofBCKwFqRRA@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] soc: qcom: add in-kernel pd-mapper implementation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Xilin Wu <wuxilin123@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Alexey Minnekhanov <alexeymin@postmarketos.org>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 4:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Protection domain mapper is a QMI service providing mapping between
> 'protection domains' and services supported / allowed in these domains.
> For example such mapping is required for loading of the WiFi firmware or
> for properly starting up the UCSI / altmode / battery manager support.
>
> The existing userspace implementation has several issue. It doesn't play
> well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
> firmware location is changed (or if the firmware was not available at
> the time pd-mapper was started but the corresponding directory is
> mounted later), etc.
>
> However this configuration is largely static and common between
> different platforms. Provide in-kernel service implementing static
> per-platform data.
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Sibi Sankar <quic_sibis@quicinc.com>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Xilin Wu <wuxilin123@gmail.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>
>
> --
>
> Changes in v8:
> - Reworked pd-mapper to register as an rproc_subdev / auxdev
> - Dropped Tested-by from Steev and Alexey from the last patch since the
>   implementation was changed significantly.
> - Add sensors, cdsp and mpss_root domains to 660 config (Alexey
>   Minnekhanov)
> - Added platform entry for sm4250 (used for qrb4210 / RB2)
> - Added locking to the pdr_get_domain_list() (Chris Lew)
> - Remove the call to qmi_del_server() and corresponding API (Chris Lew)
> - In qmi_handle_init() changed 1024 to a defined constant (Chris Lew)
> - Link to v7: https://lore.kernel.org/r/20240424-qcom-pd-mapper-v7-0-05f7=
fc646e0f@linaro.org
>
> Changes in v7:
> - Fixed modular build (Steev)
> - Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f969=
57d01207@linaro.org
>
> Changes in v6:
> - Reworked mutex to fix lockdep issue on deregistration
> - Fixed dependencies between PD-mapper and remoteproc to fix modular
>   builds (Krzysztof)
> - Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
> - Fixed kerneldocs (Krzysztof)
> - Removed extra pr_debug messages (Krzysztof)
> - Fixed wcss build (Krzysztof)
> - Added platforms which do not require protection domain mapping to
>   silence the notice on those platforms
> - Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b=
6f847e99@linaro.org
>
> Changes in v5:
> - pdr: drop lock in pdr_register_listener, list_lock is already held (Chr=
is Lew)
> - pd_mapper: reworked to provide static configuration per platform
>   (Bjorn)
> - Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-2467=
9cca5c24@linaro.org
>
> Changes in v4:
> - Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
> - Added configuration for sm6350 (Thanks to Luca)
> - Removed RFC tag (Konrad)
> - Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858=
fa1ac1c8@linaro.org
>
> Changes in RFC v3:
> - Send start / stop notifications when PD-mapper domain list is changed
> - Reworked the way PD-mapper treats protection domains, register all of
>   them in a single batch
> - Added SC7180 domains configuration based on TCL Book 14 GO
> - Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12=
a081d9d1@linaro.org
>
> Changes in RFC v2:
> - Swapped num_domains / domains (Konrad)
> - Fixed an issue with battery not working on sc8280xp
> - Added missing configuration for QCS404
>
> ---
> Dmitry Baryshkov (5):
>       soc: qcom: pdr: protect locator_addr with the main mutex
>       soc: qcom: pdr: fix parsing of domains lists
>       soc: qcom: pdr: extract PDR message marshalling data
>       soc: qcom: add pd-mapper implementation
>       remoteproc: qcom: enable in-kernel PD mapper
>
>  drivers/remoteproc/qcom_common.c    |  87 +++++
>  drivers/remoteproc/qcom_common.h    |  10 +
>  drivers/remoteproc/qcom_q6v5_adsp.c |   3 +
>  drivers/remoteproc/qcom_q6v5_mss.c  |   3 +
>  drivers/remoteproc/qcom_q6v5_pas.c  |   3 +
>  drivers/remoteproc/qcom_q6v5_wcss.c |   3 +
>  drivers/soc/qcom/Kconfig            |  15 +
>  drivers/soc/qcom/Makefile           |   2 +
>  drivers/soc/qcom/pdr_interface.c    |  17 +-
>  drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
>  drivers/soc/qcom/qcom_pd_mapper.c   | 676 ++++++++++++++++++++++++++++++=
++++++
>  drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
>  12 files changed, 1190 insertions(+), 300 deletions(-)
> ---
> base-commit: e5119bbdaca76cd3c15c3c975d51d840bbfb2488
> change-id: 20240301-qcom-pd-mapper-e12d622d4ad0
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

I've tested this over the weekend on my Thinkpad X13s with a number of
reboots and seems to do the correct thing in v8 as well.
Tested-by: Steev Klimaszewski <steev@kali.org>

