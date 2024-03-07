Return-Path: <linux-arm-msm+bounces-13577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A48748B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 08:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524261F23F68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 07:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551616306D;
	Thu,  7 Mar 2024 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skRAZUVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139E629FD
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709796598; cv=none; b=DDxRG9/8WmwS0z/bW6RqCXbyKv4WZSmDDUrBjCSPll/m5iXtrFs3/lKG/N85MXDpIN51Jp5MKNmxSXBjyGXtZ/IPWoTUTAxIiEbHbkjpbd9LF48JB6ffL3gbr/dE7a6FVUoQS4F/qySNTqN6HJ7q4cfZh5S7ziPGmQvx4JI5nBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709796598; c=relaxed/simple;
	bh=bSM3ySkxuhJbqbzz53H18Qqk1TGUit4TtwSmY4Cd/fM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ6mcMmC6F9MznBcMLHw1ucVKWKFrRkoYghAke1O3dl2jElyu8nUzMkUwienCJ0LOvDuloB8mnJK3e9kCbyTzh/RP7hfdcV40raq1wxq7zdGan9x4Tv8ax/kKZHE75tXJ1XQlZz4IJjAXj5CFnveAw0ucAiVADMCqhqGiibMrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skRAZUVe; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-60978e6f9a3so6448407b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 23:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709796595; x=1710401395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ivNWvY9J61C/Vr2L/OIMeKBJWQceFrpq54G2afsNiFk=;
        b=skRAZUVez+Q3/E9d6ziV8S5sYm4GLHVZYB3rkO3UNVNwnKgt+xRJ8MsSN5beKVPNPL
         PRS190qnnPo7TmopfDCSwA91avpRArD2/pvHF2Y5puqaOA8wmOMO8L2YjapYEFmw9/uU
         D8z/GTnSU3aaPAQes2i26EeeL9m1wn/wUwYaaZIslX+7CKAdNNtfRSMvdzl9d/+4gwPg
         ZTNDushQWJDxitagRU8Y7KiTZerEVb99mM4gfb8Ii8fNwuqe9g8lFR/TTg3t0e2rlE56
         7oyA6PR5bkJQecemTUaj6sMWgbi4XZsFVtbzGYWS8Hd6JF2E2RhtS6OK/gIUTOMcWvZY
         +ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709796595; x=1710401395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivNWvY9J61C/Vr2L/OIMeKBJWQceFrpq54G2afsNiFk=;
        b=vaX6O+jf6xZD/EYNAE6zvnQZ3fS74ERqCe9qd9YMIHHS+XUK0AY1cv90t/9MWWQqgf
         SsA7r/yCacNNVHezOmHymf5kp+fpXevxsDh/NbZqCmFzpe/GfTAfS81QPDsd3u0kkKyc
         gQI9HO6frQ+rIMtE8GtZDGqGX2ujfxa9NlKNgKq4l+yD5aWnSIsuFLMFCehxdPjOsEvt
         wMupHhfuQHvOjOkLZpWAfcHXJkNO1ei60bjunyeHv6ipGji9+uUELnzst+nKZ5qFIFSx
         eF0iwiDQo2YcUsm4kXVWy9+c1a1TrIzc34oaXYZg7DfSvVxMDs8L4KjwvjDygG46Pb4z
         ZSUw==
X-Forwarded-Encrypted: i=1; AJvYcCUCaTNLhjCjn8TMjpMPICKa4DV9Qj3vix2AJY0vffbcUQ0D3x/IzRDmLAvz2uVZihFa55gaK7ipfqEohXA72dfUcZFIMnxLkmUZumNpjQ==
X-Gm-Message-State: AOJu0YzbutxEloiZc5D1sF1rKpCWaweoA4bk4yGMYHU6308vW2nbT2lr
	sRFJcKQZUTAi4ctOLAR2BkYAPM8yuh9FmC8JhaDw3M873hF9Rnm8mLnDN95jm1LA7pE6UJZUSPK
	EftahSdam2YupW2maP0Cdd3xxGP+iSfIZ0D62hg==
X-Google-Smtp-Source: AGHT+IHz9T+wdq3Ux69tJgjFTjX1cQdWvWqR9PR2o0pf0rlixD+zc1omJVthOzxQDeQ36Qf9wgf0cGiBjA+biewE+Fk=
X-Received: by 2002:a25:fd6:0:b0:dc2:5674:b408 with SMTP id
 205-20020a250fd6000000b00dc25674b408mr13753108ybp.57.1709796595612; Wed, 06
 Mar 2024 23:29:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpoghqa5r2vc5XXdfVJy1WDBysXs4LdMybgdgqMTcEPDfA@mail.gmail.com>
 <20240307030219.92701-1-amadeus@jmu.edu.cn>
In-Reply-To: <20240307030219.92701-1-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 09:29:44 +0200
Message-ID: <CAA8EJpp++=NLZVv7we3Cwz+G7vL9xFoXqHgsMyQZ8tgdNHKcyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2024 at 05:02, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi, Dmitry
> > I did before writing the comment. You have the only IPQ6000 case, it
> > sets  drv->versions = IPQ6000_VERSION = BIT(2) = 0x4. So, as I said,
> > you are enabling this for all IPQ6000 SoC versions, unless I miss
> > something.
>
> Sorry, I didn't explain it clearly.
> In fact, there are some ipq6000 SoCs whose msm_id is QCOM_ID_IPQ6018.
> But the chip screen printing is ipq6000.
> OEM boot log: `CPU: IPQ6018, SoC Version: 1.0`
> For these SOCs, I tested the frequency is up to 1.5GHz.

So... Do you consider this SoC to be IPQ6018 or IPQ6000?
And anyway, this should be explained in the commit message. Otherwise
anybody reading the commit will have the same questions as I do.

-- 
With best wishes
Dmitry

