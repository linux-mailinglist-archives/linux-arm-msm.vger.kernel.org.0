Return-Path: <linux-arm-msm+bounces-22300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C81903B39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 784C7B21A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A62817BB08;
	Tue, 11 Jun 2024 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL1IKhVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B9176AD4
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106993; cv=none; b=dGakzibXAkOY83ICkUFR2SD/EsE0eRfMhTkacMO4XoIryiEmPfvuLiVKgYtU5IrUSjwkB3b4nBjdyXcknrxXy4Qe4TbtC93lt8iAQ5l+xXSaV1mSbTOoekdwODRDYJ4c67084+/HyhlbKG14CrUGTHp5zktpOcC3mH5uVKrkCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106993; c=relaxed/simple;
	bh=5/w1fxjjLpUaMAtqSgUdQY44foBz0hFdDn8lECfTnxA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l/su8FTgAEd7w2qIizhLlKgLOraQ3/v0Oi9V0mkheubhys1n8F8ZSlvhY7pL1a1fR2D1cKSXFpvahfAS+VhrK4RclFzubHdcu9Rg1T9n8D/4wYYFQVm3sMX7/tW7K6Kg0FiwHC4MQeG+ILm8uDss5j6TbdEl971DN9/kAHx/0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL1IKhVf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57c60b13a56so4564026a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718106989; x=1718711789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOddwMpzJW/6gs70n9pWk7Fv9UPxutUQ3E6BTp5E4Gc=;
        b=gL1IKhVf1434YxCzyjM83ISTNUSfhG78ftSMQzNQq5M0G0YJOMQrLldmBD3yH//dkH
         XWckLOV1x7t+pNfDkd5AQEwbD3CojK6r3bc3XeebmYyOOp1M87VjQh7/jtakorpZ2HaW
         KtujXfu4jFDgHoxp5yMj37HFxhXt1dTIh26XhA5UKUuBe7KITXnr/gu2eXNqYBAHs7sC
         w1OE/JxMQa047JtANSHod2oVZnPCg0FJFX6r5a46KwyWMvPeII1T9N4AlLDSD2+enPF0
         WUEtX828eq8q1UGrRbOtbYpqs2ut/MVl6S4Rol3CJSqVd9oJQPYRJ+i54aZp5ws86I/Y
         6ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718106989; x=1718711789;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOddwMpzJW/6gs70n9pWk7Fv9UPxutUQ3E6BTp5E4Gc=;
        b=ObTlQ6Ndr21pd46jAR+MEQR2zs88oLDnJ6c/3/Wn9Oro1CM4Lx7LTLaRt80UMWqsZs
         2e2YVl6Ll937cuZh5QrNnKQPRMJ77DCZIpMCo7SOhtTi85Vjk4r4o9KY2Hqt+bLFpO5z
         Acts6gLTg0mkV9EZFlWNKhl2/VM/g3b3pEWl+AjV/PloXyzfc2Y45R1s3Xn5Y5cKFBP3
         mPxJDgXbD8m0ZNdSTOvv8OOLx8T6Nu6rdCo1dgmg1apcg3VFylcoP5BoB7m//5m/3CPS
         mzGsr7L8IQx5stTEdr1LBmA/JczmsUtq46j2+XeW5/mwudovcO/+WD71TA/wiczof71x
         DABA==
X-Gm-Message-State: AOJu0YyYmt/Gmr3hNSde8S8RQUGymHNVDZmH4N6cC3aREOsnIpoHZyhr
	TdGkSnObfHF2x+jxENSNJyOYvdnfnRqYUVBd7klW/KSvGd09ECksqkCK3Gj0TxmtqvQ+PgbdyKN
	sJ08=
X-Google-Smtp-Source: AGHT+IFP4m28hl48ttcEQ8P2FYios026SYXaYffz8UvYZieOHmYVy4+wRns1OxyElbht8qv1wrV7rA==
X-Received: by 2002:a50:d602:0:b0:57c:84fe:1acf with SMTP id 4fb4d7f45d1cf-57c84fe1b0fmr2543110a12.17.1718106989655;
        Tue, 11 Jun 2024 04:56:29 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c960e677asm851632a12.62.2024.06.11.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:56:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
In-Reply-To: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
References: <20240611103442.27198-1-quic_ekangupt@quicinc.com>
Subject: Re: (subset) [PATCH v5 0/7] Add missing fixes to FastRPC driver
Message-Id: <171810698822.68529.11340532030579148495.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 12:56:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 11 Jun 2024 16:04:33 +0530, Ekansh Gupta wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver.
> - Fix DSP capabilities request.
> - Fix issues in audio daemon attach operation.
> - Restrict untrusted app to attach to privilegeded PD.
> 
> Changes in v2:
> - Added separate patch to add newlines in dev_err.
> - Added a bug fix in fastrpc capability function.
> - Added a new patch to save and restore interrupted context.
> - Fixed config dependency for PDR support.
> 
> [...]

Applied, thanks!

[1/7] misc: fastrpc: Add missing dev_err newlines
      commit: 372eb825c2040b81b6c20b8ff662a6a551f236f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


