Return-Path: <linux-arm-msm+bounces-15532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8E088FB57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 10:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7714E29DA17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC052AD1C;
	Thu, 28 Mar 2024 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3jrSrfQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C554745
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617959; cv=none; b=BRFuYaMyzkaxutjuTLbhKtIw+ukgtjg1XZLhUcd/1uMliAEuH6Q5rq0qod3x1h40pu4YmbxzpJA2lm5Dbb0qvfVs+nNTDBYEIqBk+VOXTt9eUH7QwBBWlQQL/6y6X4DhPGNDLEEm3KbVnwe4Y89xtAzcjUg7UlGjaRL7W4g+O0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617959; c=relaxed/simple;
	bh=lW8QqTmIIY5WWx+5Qn+Qztgo2/CDJTQmC1e6LI+YfA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU3bKMAHDlKKQ/h7xfgSuzKY2aqpMdNxtfVLkiO+QcYEao8jbNP+G9TGzdwEOFwKstNBOdpU0gGiTWBf74DaJL6PVp7Ml/UCBYLK1UaCK5VUoxme3sMXuDX/tAh0qs+6vbILQi5Y3OmaOneMFPRvEeS7fm5urEMN+XJKHLNmuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3jrSrfQ; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609fb0450d8so7774017b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711617956; x=1712222756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW8QqTmIIY5WWx+5Qn+Qztgo2/CDJTQmC1e6LI+YfA0=;
        b=v3jrSrfQ7otb2pl6j3f+M3wl9clduYqFmhPX2yXMypjMpSBGMPxUzKYFw5cSMvIIf2
         CRCRRwF1/HXeuHD3XmaGVAFeafjBT121aX0zXXdL2MHTELLleoDriGz5r2mgIxoOaeWD
         vlbr7Z5csk+Jv8cMjEDqrJ3o2GPrYngJ2Sy3iagDAD9OCQ7U/l8mHywLhrm1RtzemmFl
         c2REYacBxvOE2sZvtwJVMU4Nw1WjTWccNsjzXcx+ILFd0qeNfnWUs4Z7VMTv6Rw2uFln
         0/2yfHlY4ayktljtFDMvwJZpday2emASH0Dei2uke6eW+GjH5K41TxfT5KvbDKlYsf7O
         9HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711617956; x=1712222756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW8QqTmIIY5WWx+5Qn+Qztgo2/CDJTQmC1e6LI+YfA0=;
        b=wyefPxfhLRON/Y3MVVm+F/Xf2WHykBCewnh+KqXUeFWCe+hljcRyF3bxv/J9GZx9FZ
         GNbXbZztLJv2flK0K56oHGp0et3P9i9QaBNU9KDOxMOPAJLbbUamAoHuzHLIOs/k7/eQ
         MbDtiI2ToqrcD6wh+Ymu+JzjJSJWTd8S5Rc9n8ws2GSvrIblov5D3eaK9bmkqOjl2UyH
         vI01JcZXoeu0HgpEL0eK2sbvXhCx0wYeG9HDcke+H81rUCQ2YNdT0jnALEFPm7tNrCA/
         zHKa4pjfRb/bVHq0m8WURspwLDRlabGwq3sbs8O1MggizFQdf6c3bE9clwplEBMLo9Wb
         VwWw==
X-Forwarded-Encrypted: i=1; AJvYcCWW0rl1BUny8X3Lfbzp73hyt4fSGWJ8Rbb+cZ74CbsbkFxcC9OlMDfxU3nUA+QTImzDRE8LIgZ4y5irND8qYn9F1RUjgraXhThph3gDyA==
X-Gm-Message-State: AOJu0Yy0cJsvTbCP6CJKSWlVON+ukZdJRJuFORuOI17glXq8lv7DE8Lo
	qxpI+0ID3zjeiZrO86Rup3Yczdc39A0y4Pk4lFs4TQ42FhfBT77hpZFYp8JsSrgPhhuBcTN9M3f
	+CKzN7QbXvKNr5jypZZSfLkOzERHtkVf9iR7Giw==
X-Google-Smtp-Source: AGHT+IEh33r/cMIL950w9pM6WTLyu7qyZj+WM7cEtQOkKt3p9m3geR/QDnirj2kZX/VA91a5L6wD2wnlxO8fyT2VdWc=
X-Received: by 2002:a25:c244:0:b0:dcf:3aa6:7334 with SMTP id
 s65-20020a25c244000000b00dcf3aa67334mr2478797ybf.7.1711617956166; Thu, 28 Mar
 2024 02:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326220628.2392802-1-quic_amelende@quicinc.com>
In-Reply-To: <20240326220628.2392802-1-quic_amelende@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:25:45 +0100
Message-ID: <CACRpkdbq5iTz6azcdSmsUiaOi97coz_XDg28RwU1GL=SQ3uXKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add GPIO support for various PMICs
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_subbaram@quicinc.com, quic_collinsd@quicinc.com, 
	quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 11:07=E2=80=AFPM Anjelique Melendez
<quic_amelende@quicinc.com> wrote:

> Add GPIO support for PMXR2230, PM6450, PMIH0108 and PMD8028

All patches applied for kernel v6.10!

Thanks!
Linus Walleij

