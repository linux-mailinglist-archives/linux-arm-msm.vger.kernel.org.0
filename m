Return-Path: <linux-arm-msm+bounces-22299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FFA903B37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ABE9B21B64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08053178CF1;
	Tue, 11 Jun 2024 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="noh2At1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A11514FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106991; cv=none; b=pAFwW0On6a1T+6vKAH3zT70ayRtJ19nA/vTzdnkssBVrS5nAfPNpVkdmOPq68Q+8e2khdCV8DaW13rEFzGlFYgQ9B1QNTChSIn/hJOi6XQ6IaAOfIAWG0ZftYjJu7QbK4tSCS7obkAUGbT9BcD/XIvrSF0kybr7FRIv5ypsEbh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106991; c=relaxed/simple;
	bh=b60H6iwQtLtwbEdqhPNPN3MAzTHsTvZVsKR6YgqVkjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LyPI91NlJOpKih5T/KgPsDKGvhsQ2tSI35duEpri/gcmxuvfE0D8CROznaaSGhZ4/D5als2ajVSi4vGl8PIQ5/W8k+PHB263kEkxEd7xXY+sXXmr+SqYTia4IU2H+oVn2ke7PuBGeiThS/TtajpCi9J1+GkS3O+dJOEZM+g/PKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=noh2At1L; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c61165af6so4587939a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2024 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718106988; x=1718711788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOQGwGYGp7iCwEU2oaPnwQ54CBf6jzk5PtxO4hXtPkc=;
        b=noh2At1LvAbL0zqfrvbN+2NeMnD++m0EdCxPyuILI1yNz+kECtFHqSPFKyDmLBEKqA
         FU74uAe5ecLU3AM1kakbKQIR4++0U8uk3sYl7/61Cgni+HX/ebhoPaBYX8HnQ9sd15Y+
         ciZ1zc22FLV/hLL7WsEDxFn135YHWpbwD+n0elOT9CL3EkDgYCMVnEgn+MCV0IbYl75E
         rDn9b9eAuSuSRrxN+7n4rObGc34jpR//RCTX+0PzF4MyfkSq5JH3/LsxYKeyVrTiHn5Y
         NSdSAUfsRoxv3fqwWzx6Sf82nZi3D6NmKVdw6MVsOuwIuyTf3AQmoPnzgCnuW0aiel9w
         quCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718106988; x=1718711788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOQGwGYGp7iCwEU2oaPnwQ54CBf6jzk5PtxO4hXtPkc=;
        b=v+WJrXtbnUbHlVGKIbv5lTvsMURGk+hSYuezTrXPXWx1veQEFGt9al8NWXMIaFJjuC
         gylrzuX8e5Q7YE/Jp9+oNfIhlAujxjsqLrWC1hZGfJ+mh+HxUjwo101DuV6DWcnT4fYy
         Yw4Gm7uCwDI+pRCL/Pxxs1mgM3KQt/EyQ8bp4VW2D/Bs02lBwIV9kjaVP8gKABq6MlFf
         djXGQtqt1Rk5fec2VAB2iYz7EUl9hOmBQw4FX8FizjObV60QgbOkVeevDJjNxUJ05i7H
         g2wrp1Z/Z0rugQD1g0BFlUQRETjv14Shu0el4U6L1f+erCaN4vi5+btYKAYQ8YAQGlkW
         wIVA==
X-Gm-Message-State: AOJu0YwideBadmn80Weno1+FLCcHzGWB3CNfP3dTxis84ySIn7fijqlO
	dSCRWtNqC4K1Ftv+Sniw221d3XgL7wb/00rAuu9K8a2yBeKdo1aBCLgGSsxaUFLr965Uu0HBFb0
	k4Sc=
X-Google-Smtp-Source: AGHT+IFA0bok5KmXR8AeW4Ak8pvAute/Efj9rz4I1LbxhP9Hnz5VuBZNyHDGWWy/+jzYmGb2CRlpmw==
X-Received: by 2002:a50:9f89:0:b0:57c:7fc1:5d57 with SMTP id 4fb4d7f45d1cf-57c7fc15e88mr3427610a12.7.1718106988021;
        Tue, 11 Jun 2024 04:56:28 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c960e677asm851632a12.62.2024.06.11.04.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:56:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
In-Reply-To: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/8] Add missing features to FastRPC driver
Message-Id: <171810698723.68529.3654404056336837599.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 12:56:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Tue, 28 May 2024 16:59:46 +0530, Ekansh Gupta wrote:
> This patch series adds the listed features that have been missing
> in upstream fastRPC driver.
> - Add missing bug fixes.
> - Add support for interrupted context.
> - Add static PD restart support for audio and sensors PD using
>   PDR framework.
> - Redesign and improve remote heap management.
> - Add change to support unsigned PD. Unsigned PD can be enabled
>   using userspace API:
>   https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173
> - Add check for untrusted applications and allow trusted processed to
>   offload to system unsigned PD.
>   https://git.codelinaro.org/srinivas.kandagatla/fastrpc-qcom/-/commit/dfd073681d6a02efa080c5066546ff80c609668a
> 
> [...]

Applied, thanks!

[1/8] misc: fastrpc: Add missing dev_err newlines
      commit: 372eb825c2040b81b6c20b8ff662a6a551f236f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


