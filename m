Return-Path: <linux-arm-msm+bounces-28303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFE94EA46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 11:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 335D5282234
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 09:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F3016E868;
	Mon, 12 Aug 2024 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TE8suKoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9D116E860
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456250; cv=none; b=cRwKQ2n5/uvughX2p7suewqB2wdXSyo4Qy85FvFVw0q+v9OwcyINoDTCnBI3lAVMAh5RA90pwhRExQpZxl56lDN/5wFNIGLjlQAjurU67yUGXi+VVv0pw6EgnyQpnWK1aA4+LVSguhZ/B0kizsQhdkWcHDxK5uzYhY0Tv6bp710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456250; c=relaxed/simple;
	bh=rFbhJ1kr9LbVJJHVCLKuVhtZqqyv3L8v38WNx4e/J0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0IcilIHd1ZjBkw5Q/UH+AYeE/Q74T1aj4QT8YgZusxXdJS+JVyvrlpwv+3Ha9VEcPuXI0SKmWpxS5kV4m20VeE0E3yQdOA3MRph7DHvzAiTQJHRSFG1hHSwHtsJqKsHW/M27imrT3nTlKNvnzNbRnxGqE2hbsUfbv10wUnRKKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TE8suKoC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so516117466b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723456247; x=1724061047; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFbhJ1kr9LbVJJHVCLKuVhtZqqyv3L8v38WNx4e/J0A=;
        b=TE8suKoCwDjWQG/MpeHI15uAlAj6J7bg5ChlMgmDcjtn79G3zmvUa9n4djqR689+Ux
         GFSXETj8ij4c4GbxEiaZgjtO/Wub/vqjzhG914kCNZFHpQm/LpZgSwFj/51wP+pjcNi8
         jpDxTk3PSINFkC9N0IW9OMuQ7iv/UkwyHW4Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723456247; x=1724061047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFbhJ1kr9LbVJJHVCLKuVhtZqqyv3L8v38WNx4e/J0A=;
        b=FW2egzvHLfEAXNxOouv4x3dtxLGTQHWGLkPqww0K2Z8VkTfJSUqaj8C811k492z0yZ
         wF4hCixB+2eo+wDhr3qRRQw6MqgBz+q2ARm0GwZufTzRVmFkMO2E7Lj1dvLSexzyCgWL
         4qvpmXw7xCsg0Y2p7YR/O9tuRwRwWt5Rfz5GNkFJ+um9iZGqdbJdYsZomcjSEjiuny4W
         gC+j5q7qKDLp9cbOpeMfeUt7rLJNSMtr/ZztKc66Jl4Y/NOfd0UtqIurVpTdEZkP5uhM
         34+O9jBZZDS0pX+ENzIXXV75Ee/JfSOWbBzlQXlNkqxFqhyYiUQ4OU8xsV5lvoxLlfrZ
         ZZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdiaBa8YxkoVMT7gqwOF/Cf+VawntzIKaxlon1U67Uj33ZeFRJES0F29WKmW4K1JEoNQ+SMWDvez61SGx9INbYSbXX11Gk72P5SCjrSQ==
X-Gm-Message-State: AOJu0Yz7NtUqbrusQZd5H3mKzvjabUQZzopD/tEUOfJ9kdnnijoEfdVv
	jYma7ey2XkPWIekBPmQfY6J2faEtP5f8//xBNeWRa1H/s5D28yQBeekk4bOWbd5iHfiyWOXpdFs
	=
X-Google-Smtp-Source: AGHT+IHjX+aYi9fOpuLtTnzWUbwXL55L2TQ/I39iKIQm85BNXqUrgSUJcpMCSUXkoDyANPiCmaanWg==
X-Received: by 2002:a17:907:efd6:b0:a7a:a2e3:3734 with SMTP id a640c23a62f3a-a80aa5caf3dmr643683566b.28.1723456247220;
        Mon, 12 Aug 2024 02:50:47 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb1cd2f3sm214397166b.136.2024.08.12.02.50.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 02:50:46 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so502719266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 02:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYpSI3+xMuAg2trEfKApQhl/0ln0NYqEWVWI9+fRccPnii+3oX9G55MgYdbQr6rgzjo5I6ffPQgf4k68yQQNRPDV+ev3ji1GbNQW7vqQ==
X-Received: by 2002:a17:907:2d91:b0:a7a:9ca6:528 with SMTP id
 a640c23a62f3a-a80aa546a28mr622117566b.11.1723456245700; Mon, 12 Aug 2024
 02:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org> <4fsxowdpaeaxcnu7aewif6yqqk3jdgsjtksbznv2arnmmtiaq6@ibzf2qcel5lc>
In-Reply-To: <4fsxowdpaeaxcnu7aewif6yqqk3jdgsjtksbznv2arnmmtiaq6@ibzf2qcel5lc>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 12 Aug 2024 11:50:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCtZWUx_RmZ8j3-x_LN_m76AzyrUUrUubCGt8kieLGvZfQ@mail.gmail.com>
Message-ID: <CANiDSCtZWUx_RmZ8j3-x_LN_m76AzyrUUrUubCGt8kieLGvZfQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] media: Fix the last set of coccinelle warnings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 19 Jun 2024 at 08:41, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Jun 18, 2024 at 01:37:43PM GMT, Ricardo Ribalda wrote:
> > With this set we are done with all the cocci warning/errors.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v5: Thanks Vikash
> > - Remove patches already merged
> > - Fix typos and remove hfi_resource_ocmem_requirement
> > - Link to v4: https://lore.kernel.org/r/20240606-cocci-flexarray-v4-0-3379ee5eed28@chromium.org
> >
>
> Just for the clarfification: does the driver build without errors
> if only a part of the patchset is applied? I have the feeling that first
> patches introduce a build error which is fixed in a later patch. If
> that's the case, it's a no-go.


I believe it should build without errors for every patch: It has
passed the bisectability test

https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/62071294


>
> --
> With best wishes
> Dmitry



--
Ricardo Ribalda

