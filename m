Return-Path: <linux-arm-msm+bounces-50147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3C0A4D911
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F30A17A7FDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEE71FDA7B;
	Tue,  4 Mar 2025 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AmIgf7ma"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696F1F5854
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741081594; cv=none; b=pWhdTSIxCLJ3+5DELEf6Ox0q6QPqDzEU1aqrGQ7uDNTvcr12RrOBgz0WcHNWtXw2f0LBJNsOk3y28azsha/dYGOqGWGRALRGCDW6f57o8UHT1FJTC94A41D/sSGexaNH/FS74sFxtsiSVc1D98Te1zCCUr/pQsTsx03bYeu9ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741081594; c=relaxed/simple;
	bh=lkcrIjTkq1UIQT0SkOH+4uaD7wIEqpSNJVOOJw0jvRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVg6xhxS8AS9jEirzbjWDhDjJ8RPPobtEu3qr1/X5hJYbqJDZWiA1Nwsm7oxP2eYgAt8CMChekPon8Q1GV/IUhOpNvzx6d6ZlDgnfykmYHJea+brzGPCw2z03RM4HR+1YvZ3Bh4FDPicMnv0dHjfCZCJCsPI308j1opy3pquv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AmIgf7ma; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e4419a47887so4074482276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 01:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741081590; x=1741686390; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=42NUMWp1p+p6ckMbx/Ocz1ORWAedvf6DRggC3Szep3o=;
        b=AmIgf7maqmzagac5ef2fAlXpysjAYeZowCfg41F3wnuqeXXYXZv3lHHu3pRtbLAPR/
         LdjzbFCFPCArCWjdJvNh1BnKlIRT+0pWzbAvmB/EBe66Gbq1PwHXtSSLNwIgaK844dMd
         W2LqmzLU3GHI5/bA/M+pJ0218TnT9YNnrbJZ+1KlP9GgqyChSFEgHCpxv8tgVpi5Qt37
         RDwbukLmk2LTLvRZNv51PDRCu8DlMpRQMWmVdmu1fqzxEaM0SGjBsLDYHw7vAt6kmFUs
         PS+UH/NpRVpTtXtws9uYmnUyYP9TK8KxqfXs62CFMlP1bAenrOv6Fc2/sy2tAQyNZ1u+
         I9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741081590; x=1741686390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42NUMWp1p+p6ckMbx/Ocz1ORWAedvf6DRggC3Szep3o=;
        b=RUeDqhqEhUXPiJTHnv3hmkKW6TX2ZZnOf7AkO0EKHv9tHZQJajGcoXP26Z/5QHxiL9
         AXXaUb1ef9sORuTcX4aFgFkZFEIZKnSlBpd/MHnA61LcaAZ1rABhPbH5ATFhIBG+XBqG
         el9AbVwvw5qlG/NFRuKgPneHLuwXEGfUzkmTGZIhyiQkaIBFI7ZjQhOZAWADtZnm1UJe
         KyE27A9Lwl4L1gPW2aiaUuGNXaDTJfr4zGB+yR37T+xPxsmRe7BdkYbneR6zbLOzKJ65
         6RTIrMuQwOVHYC35GZsxwjsRqs7QrOrpbNS3AYDtaQjUnobj1n2t0MrLrn5lj96dAtAl
         WLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqizvDmFNCC50RfwkG87xNOEUV62DgaDuIo6/MGpKrH9so92ZzavyIkBil8xHzhGtA/UnhuyH/6Z+LqzYC@vger.kernel.org
X-Gm-Message-State: AOJu0YwNild0PxBRpTm8C/PKt/AlhQjKNkdaADfdUnjU8VSaJXbQ4cNz
	kJaoKNx39qjfkfLMROe+tAmS4/CSbYF/bB6H9exfoct1RRGbqCQYEd67ql6qgvt7LFCsYKCyG39
	Z3zZGwFI3molY4o0QUwEOu5X0u5mT0+ocyxu5qQ==
X-Gm-Gg: ASbGncsS1zX3SM/457fuKXrqXDb+RUNfTyujXPw3jxoHnJLVwUbm/OZ5DPpTInIfw/+
	2hQ7c42BQ9syvAFvEn544uG5+HmY7bGhL+njOtvuPwPok68GZK/tmr8BmVBdnfJW1Jh9uwv7giJ
	DMFr1CEWzRClUez154pdELHMAa
X-Google-Smtp-Source: AGHT+IFInbqjmWLZj4CguI5UAuggpoFNnXPyCXEm68iY1s881uvIpdVSxHhbK99CylDz15ZxH6O+wYWkYQJcVjpg4TU=
X-Received: by 2002:a05:6902:161e:b0:e5d:ce4f:66bc with SMTP id
 3f1490d57ef6-e60b2f5c916mr21056408276.45.1741081590555; Tue, 04 Mar 2025
 01:46:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-3-quic_srichara@quicinc.com> <lakoxihaqlu3vq42eoqtlip23ggdieizotyzax5up5n6ndbwsi@ddqyzvsdtmkv>
 <1359984c-2ace-450b-a3ff-bac0b9fb5cc9@quicinc.com> <2xpu26pu4ovnchumwx7xzlp2gldpfgsurnhuqaioygb4a6xmsp@ygmpk6furqs6>
 <3e326578-ab46-4d7e-ad1e-3d572613498b@quicinc.com>
In-Reply-To: <3e326578-ab46-4d7e-ad1e-3d572613498b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Mar 2025 10:46:19 +0100
X-Gm-Features: AQ5f1JrLWZmbA3L3ZWFZ6k5ZbyNJk4rnUbtfMAyZmdQl1qilIhBMnwVu8p1019I
Message-ID: <CAA8EJppXHXafwx+GPh0UhFLRLW5DNj8RwXdO4+fDdXp=SE13Uw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 10:33, Sricharan Ramabadhran
<quic_srichara@quicinc.com> wrote:
>
>
>
> On 3/3/2025 6:34 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 03, 2025 at 03:58:42PM +0530, Sricharan Ramabadhran wrote:
> >>
> >>
> >> On 2/28/2025 12:03 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Feb 28, 2025 at 10:23:56AM +0530, Sricharan R wrote:
> >
> >>>> +          dev_err(dev, "Failed with status: %d\n", msg.resp.status);
> >>>> +          ret = msg.resp.status;
> >>>
> >>> return msg.resp.status (is it really errno?)
> >>>
> >> ok, yes error.
> >
> > The question was if it is an errno, not if it is an error.
> status != 0 is an error always.

Is it an _errno_ ?


-- 
With best wishes
Dmitry

