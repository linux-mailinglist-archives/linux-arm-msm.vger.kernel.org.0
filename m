Return-Path: <linux-arm-msm+bounces-5424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7365818CE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 17:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A0691C21F00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 16:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F382032E;
	Tue, 19 Dec 2023 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QY8N5XhP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB061F95F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3366920db54so2473453f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 08:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703004579; x=1703609379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRDzLjiMAJP8BbJu7ca4CzlHn8br6Q4rynefqovgK2E=;
        b=QY8N5XhP1A7bL5nrQ29AhKQmm7Vur6a3nChzQq4+z3HVTNQqsWc4ADP5JQbivf/tsM
         yOo5qSbWfh2xvUuGGd3OPjQrwqXVQHLTWoSBdOg8Aw0eS48r9HCFRYTFhX/aZmyvN/es
         SFVWn7lAufgamo1ylbmkF1SN0Mwt7btEr1b0mGq7EkWBblrUhf3ifDEIJdPfTcDcchxQ
         b9Qx+C7dtZmD5Blrssrj/jqNo0eFCXu+09cxk2lC3M2Vjp9L5PJumLZ2e9JT/WMt7Jeg
         EsZypGiPpcPdQyTAttR9hvUzcv8Y3zv9uJ/btJqGhp7KMNIoNwVCLJSaLBt785a+8uDa
         Qvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004579; x=1703609379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRDzLjiMAJP8BbJu7ca4CzlHn8br6Q4rynefqovgK2E=;
        b=PHmz3yWlus7wJKkdUF14EUvESW7kJCSbCTbcR9iDClkQk8EzetvUUWmDvjbDUpOvXO
         SwnPgtr94rAwRKhuWIsX1LmlrIb6MvMq4mQVLLvVGY5ETJF58jS/Gd2gkWsi37F1MIS/
         i9pFUOD15LDAEaVzD8S9JLk7UVFM75HCACx/XsjTJK9IqD3ipT6JXpwJgbN/Id8VdrCq
         zn+wY6N0bY6UXzyNBpCprs46yDuXQ8YqmKc3pASgBk+rh8Y8fVSGivKQ5QY8Br+prDlK
         HggHEpGgWJ2LqwnOo9ynAlIXPTfpcCnVpyPhIQqSRijaYGrQf2ToidtBbgKL36SjCqKb
         vArw==
X-Gm-Message-State: AOJu0Yw9nqoOpq9dW+Qj1rM29458KBsL6L8En///P6zAwwsVwegmwQyb
	nvvKWqR9An/XyF+piJaEgYQq8YFRrt2cawnv1pVMLw==
X-Google-Smtp-Source: AGHT+IGkSnbETqevyS5YLD3SJEnIfiIu+J0X0Py1heMFhXlPrhe8Yn8VmdFtz1I98N0U0C5dSxJ7i2tWrus4KMvpVek=
X-Received: by 2002:adf:fb49:0:b0:333:53b9:441b with SMTP id
 c9-20020adffb49000000b0033353b9441bmr4989922wrs.47.1703004579412; Tue, 19 Dec
 2023 08:49:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
 <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com> <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com>
In-Reply-To: <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Dec 2023 08:49:28 -0800
Message-ID: <CAKwvOdmMCmcHVd7+ymKgVUe5uZrSvUYMaD9Fz5GSBtHBMPTnSQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Justin Stitt <justinstitt@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Manuel Traut <manut@linutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 4:17=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Interestingly, I am getting good stack traces on mainline with a
> LLVM-built kernel -- both with and without that patch.

Probably because:
1. you have GNU binutils installed.
2. you're not testing .o files from an LTO build (which GNU binutils
cannot decode).

--=20
Thanks,
~Nick Desaulniers

