Return-Path: <linux-arm-msm+bounces-6755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0845828623
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 13:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEFA91C23BFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 12:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E08381CF;
	Tue,  9 Jan 2024 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CtqOLqJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2CF381BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28d80eddc63so1018789a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704804032; x=1705408832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+K+iBGf5qDJUPXHd12KoLyityxUnYoSVawKfBzB7oKM=;
        b=CtqOLqJwMUwEbgcD4NnJmGg+ciLhVp3uBmR95Zs7DejavkHVzl/aPvf88XD8RWTGgk
         GAZDUnoDGvbEOqnRqDb1OML2635DyAmsT/ofckD5xVDSXhSXM44GZlmJHquCKDlsGIcm
         x1j1M9quKbukzfY1koFcCHnwyH+jQlk9N2440=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704804032; x=1705408832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K+iBGf5qDJUPXHd12KoLyityxUnYoSVawKfBzB7oKM=;
        b=UCh3/MoptLyt1JeHiPgvRF2hbKrGuN7iL3XfoL5Cm9TNhCZmC/nZC2uNM0hoiKRAQw
         6bJEDgRRH6Pwq1MnEIuFjVyfNjmJ/fQGKBkN4QDs2KTxTfIRZGaP083c4vE/gW68BY9b
         Ms913ALZekoVgQa/ZhIU8LjGXOqFe2x2syNaR5T1mm2s1bwZwVnE9Fb77maNFua2d0H5
         F4x6d5QBKgGxSbM1H4KNBjZVCh7rJ+20LnILJ3xwQKbhjKzhVLpFntaLE5+CTJ45is1f
         /YQKJ+oS8t5L45QifgMhmLF9D0BxRbFDRjngWFrSLg2WHJ+nIXKNZaJ7jVHShzA6ME5l
         TFYQ==
X-Gm-Message-State: AOJu0Yw+YpZY2d1lZq3EuJ04TEOW6xmlfuf2kly4QWYvze2S8FzcAZvi
	ARnMPJb0LvLHWaHx//jArQV6EcI2r/zN
X-Google-Smtp-Source: AGHT+IH2offlfMdPACFUtIsHxeVqe+6Gd+f44kMTmBAtYNCgy/GtMy0D3GBgDlzNju2HOn9Ag3ajUA==
X-Received: by 2002:a17:90a:62c4:b0:28c:843c:105b with SMTP id k4-20020a17090a62c400b0028c843c105bmr2285019pjs.27.1704804032290;
        Tue, 09 Jan 2024 04:40:32 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id f89-20020a17090a706200b0028c2b4f5f32sm2027011pjk.3.2024.01.09.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:40:31 -0800 (PST)
Date: Tue, 9 Jan 2024 21:40:26 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: venus: hfi_cmds: Replace one-element array
 with flex-array member and use __counted_by
Message-ID: <20240109124026.GA1012017@google.com>
References: <ZSRJfRdUXQOzagKr@work>
 <202310091252.660CFA9@keescook>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310091252.660CFA9@keescook>

On (23/10/09 12:52), Kees Cook wrote:
> On Mon, Oct 09, 2023 at 12:42:05PM -0600, Gustavo A. R. Silva wrote:
> > Array `data` in `struct hfi_sfr` is being used as a fake flexible array
> > at run-time:
> > 
> > drivers/media/platform/qcom/venus/hfi_venus.c:
> > 1033         p = memchr(sfr->data, '\0', sfr->buf_size);
> > 1034         /*
> > 1035          * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
> > 1036          * that Venus is in the process of crashing.
> > 1037          */
> > 1038         if (!p)
> > 1039                 sfr->data[sfr->buf_size - 1] = '\0';
> > 1040
> > 1041         dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
> > 
> > Fake flexible arrays are deprecated, and should be replaced by
> > flexible-array members. So, replace one-element array with a
> > flexible-array member in `struct hfi_sfr`.
> > 
> > While there, also annotate array `data` with __counted_by() to prepare
> > for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> > array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> > 
> > This results in no differences in binary output.
> 
> Thanks for checking!

Sorry for shameless plug, a quick question: has any compiler implemented
support for counted_by() at this point?

