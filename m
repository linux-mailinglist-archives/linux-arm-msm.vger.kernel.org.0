Return-Path: <linux-arm-msm+bounces-42218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3429F1BDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 02:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FE8C7A03BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976FBD531;
	Sat, 14 Dec 2024 01:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QueuqPp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7EBD51C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 01:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734139749; cv=none; b=bcf5pLhnX5pedGTfLgV01K9oq7Awj6KbGSelvpWfdIjTtTMVAWorn5ULA6373osSNUX6ZvW2W8mYfLktShlcrv6rokV3uTKWhYq4tGdHdFeCsw5Q/ITpRx3b98xYuqko903ZeM0A45OAmDADQ+NiqELQ0ZFriRClT8hzLdR9kog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734139749; c=relaxed/simple;
	bh=FbACf+zYDKXAWssDymW0DKWC7LQPGZm8j9ATdknhB08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jktpB/Jnjw05StII8l0jrMY5iBIbTBH4xJZ6+0NtxQaOGHgXjkB4gusAnlluMhPn3sn5FCmlVr0v76EHBUAzxWlFDsrYieKzfon5fSHbMQC0exOt4LypjZhXUHKzCccvGjkFFuLptpevGzPIcmgzJy2Sp9UuBpk6fziZKOS0COg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QueuqPp6; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467abce2ef9so57141cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 17:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734139747; x=1734744547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FbACf+zYDKXAWssDymW0DKWC7LQPGZm8j9ATdknhB08=;
        b=QueuqPp68OWaZl6pXQexQdOxkH/CYd7sevN+Ed/04hbPHRcPPkwacF40NX65bq0u8S
         FgFmE0BeLWjF3JITg8d8VWs7mI0S1HhUHTXsAFdAUH3otsDl9d8ion64jueyXshF3nbZ
         LHsEbOZNaicG8YabB/x7Who7oX7DV0bNzfg7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734139747; x=1734744547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbACf+zYDKXAWssDymW0DKWC7LQPGZm8j9ATdknhB08=;
        b=s8D+2wQ2ABDHWwEB0IckdMCTJTnj4U0G12yzAUrzbur4OTRvp9aNjHAZE92zBitN3+
         OKzorPCh9rrJEJpdVUbPyS1+geOXbzlxUt2pMotLLo7NWSk183pxe4RGlA2xvjLsmmW2
         rKn5AjK0Dx9z7HfafF6ffGG6Fg0Pj5iDlw+j0ZkGLNVj8fwMmjqFBcA2/ZWCXhhab3Gh
         9Z83PIPAsxr6uXW5HSgLYaZukpJxFu2Qyzjn4GPQLp1SzT7KFTd+gkL0aZt+bl2NtV+B
         p4f+13bns+XO+uI8LAnMF9+wuekOaaSamnEC02Vzc/fljukhsONPd+PUmA8E45n93Zt7
         YjcA==
X-Forwarded-Encrypted: i=1; AJvYcCWXoWUuLhEjAIwTxf8je75Gfw9UtwfHpYnu5p2TF2DkfrEAHKe3a1aFXUdD0n2cvfZzit/zFm9y1BMkpt06@vger.kernel.org
X-Gm-Message-State: AOJu0YxTx2PDJP0OIB53jPdk8awMFJKiEgKYnZio03/Nh099IoMCXoYa
	Tj2jS4BSGJXca1ldoE8UoncyWGyfbCB/cSMXAxNEFrR1H+z5hZGfpzI0ke5AYC2y/zYUid4NB9v
	nNJ373txlFKni2L7pkhdgOchflJoIt1o/Y93D
X-Gm-Gg: ASbGncsc/CpPNvvP9tBjSTeHfpUMACUvZXup+I5Jj+Pq6rq394dav9mISiUwGxBOBzj
	VrHx23K+re0s1dZ9FYLxhO86ZeNwtbCuaEsY=
X-Google-Smtp-Source: AGHT+IHNtwf8QADinV12qA0ZzZiycG5IyBHw5q4jrC1tLoJV04+MI6FXaBeKEVoVuATlTKwSTdw0HE6Zeb5uzLpINtk=
X-Received: by 2002:a05:622a:1882:b0:466:8c23:823a with SMTP id
 d75a77b69052e-467b4a2978dmr640821cf.17.1734139746638; Fri, 13 Dec 2024
 17:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
 <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq> <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
In-Reply-To: <CAD=FV=WQf+ig21u316WvQh0DoKsdKAmZgqPn5LB-myDXsJtXig@mail.gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 13 Dec 2024 17:28:55 -0800
Message-ID: <CAODwPW919K+XdxjUe3aPgxsv0CEWwx0P_Hxvf=VniLhk8eagkQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Interesting. So the Gold/Prime are actually IDing themselves as
> straight Cortex A77. The Silver is IDing itself the same as
> KRYO_4XX_SILVER. ...so in that sense there's nothing to do here for
> those cores.

Should we add some comments to cputype.h to record which other
products are matched under the same ID?

