Return-Path: <linux-arm-msm+bounces-33381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F65992EFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1001CB23B4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2271D4358;
	Mon,  7 Oct 2024 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tISX/tgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D011D3183
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311019; cv=none; b=ZCmqyIPJksH/0UZyESgRqeh9CyUflcRz5Xz5T3LfVijBYqA6YFdQD2gbnv4FCUlyp2EvgMe9++HTUHH1WVFjBmfn+lAuPwW74fkN86pGi9Vu7x2Qhc2DO3BOjHjYML7elkhyfP3eYuhA8RBz8mT65xqlRz6pOxX7ulCp2lgAnsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311019; c=relaxed/simple;
	bh=sQIRs9DtatqE47/uuL7DROgMBz3p66i8n7KBGfN77LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lo1FU676OQJsgnimKNui+dMgJzcZO6pfia/IFgNYBJ/xiLuQuXWLCk3ZMlKKvycZhmID02hR4EUEaZ1K+abB6GdulPFkFm7n8SFEZcnerqXW2AXTy/RjyERA/pRfXVJ1V4u0dHGf34QKihcGdIPwgqFkMh4G+pr78QpGbJM+LhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tISX/tgB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e3e4f65dso13805747b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728311017; x=1728915817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sQIRs9DtatqE47/uuL7DROgMBz3p66i8n7KBGfN77LM=;
        b=tISX/tgBp229b6Q/vKwSOzXHKdC3nxyYyadJ0QB1CCUGN13FCDti1yWKJETzBbYu39
         QZqFJg/JdWQf3Kxupr7O0OAll8XqXaiMIM5MMyOWIMXciaF4Sc4Ascdh/tnJNJOCaGa3
         HKHnet/QNxn3KWuY0jK9ZBtG/Qcq2vJehFP+de7lE0vl60tq/mmnWkt2C3qLMtO8A3o6
         4eYyIYVNs1ret9TIAypmIcnBTKX7bbwJexlzE8k0dAx3n3JyrXCfjxrpomMuMUP+fLus
         P0UbK8FLARKVXY1uZ5h02lhHxSiaBBymlLQ54MhG47uOKDWUzJNDcH/la2+rOGsHd8Dg
         hrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728311017; x=1728915817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQIRs9DtatqE47/uuL7DROgMBz3p66i8n7KBGfN77LM=;
        b=HBQIkiFiJSJDHbyDJQ9NyFtbTTel5XFwIAudZ0VWiJM02SpQ0/X3zwzfMBJQTn7kbS
         U5xK4Xgy6tXN0kwcXoMVqusYtAPTimlyedlc3EaTk7Fv+vdT5Icr+Lw4kapH6a4CyR+B
         ufkFqI8fXw6mUbTnKBGryas+ebL2ukINN4JNprQZ7ZiftCwiEy/T5G1YBTw5PYbFaOPm
         4E9CD5DLr3CQ2+kNToRbZW/vHgNpz/tVfNZdoLLPv2qjfz8kMQ2h47XxrE+5ysXlZ90v
         xoRIHW4et0BhskslIZRWVYVm8JjIKFAeYtcivS5XOuAZXxVbIrYoTZc4ii4dtZzoVu6h
         SyPg==
X-Forwarded-Encrypted: i=1; AJvYcCVeMPTGLF/dy6zPLLDDQrsekeM0Y7hH5EoAu+riMiG8/sCUnyLFkOLYhUiw4AnXIPYZMgY/wLxN7znhEA4u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1QZCVz1rjJt4WkSXchcR1CzJArTF+Xk0PzUC1aMS7szMa+VW1
	oqB8j7s5gC284KPggTm7uTFV/sWs4SoVY7d6Muj/NEDn1G/fe2SFwls9YCEx+8fNyZbGFspuVuR
	22hGIpMUBc7rqve7yaB0VSlcLZ8qy58xj7X5xyQ==
X-Google-Smtp-Source: AGHT+IGbKaYdYvNXtodRPEpekH5GsR5hqwr4S76hZ1k73gzB88gyl7RxLM4wcUiR/GuN0qmmVPqnBOpOSBZ5Jwq46ak=
X-Received: by 2002:a05:690c:89:b0:6b9:d327:9ad6 with SMTP id
 00721157ae682-6e2c7295bcemr87692547b3.33.1728311016940; Mon, 07 Oct 2024
 07:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <20241005140150.4109700-3-quic_kuldsing@quicinc.com> <ylfkupkpy26gupri4lbwij3sh4uwrm7lxr7q7q2rhrgiwai6mc@bkplz3mlrsxb>
In-Reply-To: <ylfkupkpy26gupri4lbwij3sh4uwrm7lxr7q7q2rhrgiwai6mc@bkplz3mlrsxb>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 7 Oct 2024 16:23:26 +0200
Message-ID: <CACMJSevsbXeVV8t=nZ1L_ZCefuaU0Ew5=VFcSWTSHpMj_Bo92A@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kuldeep Singh <quic_kuldsing@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Oct 2024 at 03:18, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Sat, Oct 05, 2024 at 07:31:50PM GMT, Kuldeep Singh wrote:
> > The qcom_tzmem driver currently has multiple exposed APIs that lack
> > validations on input parameters. This oversight can lead to unexpected
> > crashes due to null pointer dereference when incorrect inputs are
> > provided.
> >
> > To address this issue, add required sanity for all input parameters in
> > the exposed APIs.
> >
>
> Unless there's good reason for the opposite, I rather see that we define
> the API to only accept valid pointers. Then if a client passes a NULL we
> get a oops with a nice callstack, which is easy to debug.
>
> The alternative is that we return -EINVAL, which not unlikely is
> propagated to some application which may or may not result in a bug
> report from a user - without any tangible information about where things
> went wrong.

Agreed, I don't think this is a good pattern in a kernel API (as
opposed to user-space interfaces where we validate everything). We
expect a certain level of sanity from in-kernel users.

Bart

