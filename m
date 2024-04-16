Return-Path: <linux-arm-msm+bounces-17582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFF68A6B00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECE51F222BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3083212882C;
	Tue, 16 Apr 2024 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWZ2HYuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99D38DC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270776; cv=none; b=h24j8ZKlx+eDqAe3Gr5ZUDnG1dXLddwHrktG8hrDuwPfmi41UvDJh3RkJnBWW7EM9cZ5RAAgPHrguhZMfyrg9QX/jVo0hIBczSOuzHmpBANQW1cHwc2fvNMEns3fSw6r6NzJ8JkfV8vsSqSDUY7riuEveN93+gG+E+r9eGGlXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270776; c=relaxed/simple;
	bh=WcNPnB4HdNSky7dJK2nRp1QylqwakQWWVq5Y9GzydZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnsnUrntU5MIdgjpF0eBoB3/WJczLDDObLk6IsclERGgCSTkYj77AW019DkAjemeToJsDxLufHH5iOr5JOZMB8s2HSOsTD8Hi9nSK3pghblaoDm3tChGi3vj4vE1Zul7S6XLoVs5QqYglFWlKNBlHBBUcWALZMYYwvjjczlZuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWZ2HYuu; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso4308200276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713270773; x=1713875573; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M3gjlcT6yiF6TVvBdoS3jyFscagYLua1Wg9Qh4m5zmE=;
        b=aWZ2HYuuo9tRCH3lJt+1c8eGxdq9O2uMEnUS8VDM4lh+X4OpE0pc5DrGptyQ/SL0aU
         ey+I21mT5EXhsKKf13Tp/RF2dfSVyAMu4ZPqm/GDbm3zlkMkj/A2EovMzZYLSyQPiPPn
         k0YIP4xqQQBxK82/GXhDcSry4EOvVEnBR4VUXIeXr20hrauMgXbjqt7Lz8grwuy0O/Iy
         +Mb1cHLB7JgPnLDyogNZ3dfDw0msSfktakw49umGlchARC/GpvEAkhnkPquiCoXO6D6S
         QBJ8a8+jwSMNxM98OAxW7PZOfiKr/mbuitTqHKeMCaF/EVEp+oYvCobwExVEmaQZPKbW
         DjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270773; x=1713875573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3gjlcT6yiF6TVvBdoS3jyFscagYLua1Wg9Qh4m5zmE=;
        b=ZrNAySFpvVssamVG5h7V6tlUY0zm9KCQpjgUWUOAQGQzwAmjYb8l/ChOZkiZhYv8Jf
         xZqJbuZUXnBnx+KOEtYgUNJ3nqy39eYieoFF+82LeldujzDzKetz/1MNh0txV5vjemvJ
         ixRxxcleyohC/6FIJv42eEIlEhL/it6r1heFXkoo/pt2Ud6l3zTdxmWrrJbaT1+sP+T3
         YoPhrp5J6e++lPLPGDCAeGMEuVzbXOVpZOPUEL7dQIt9dXZrqlw6ginzxa7Cv0I2pMeZ
         HS0dPg2BxV3D2c5nwVqokN0OLvnNWCFZoOCAXL6F7J2MrgfV0632Ufyj7ieWE8ZyMqMx
         PfMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoCDVxsz3bFk82YhwvRys39Do5EHeUX+W3JH3+aT+Z2NcISryhuto60NtSZEawCb8wJbpj0tJJ4dLXQRGXPW+zRQNnEv5vwToFKmOOmQ==
X-Gm-Message-State: AOJu0YzOq1fKcHvLrCrcAWV7uOg6X7DlHqSmIS7ZdTUlDSit0JUS6n7O
	OkIxpJienVBBzoKoX12bnF7/pBZqSB7kBblM+kXP778s9uZvNdQDuc1gBluqUG52KmKA87t3dW8
	Ow2ROoK+7vkYmVlQUHmrNesKBiKdwlx0sMEvl6Q==
X-Google-Smtp-Source: AGHT+IGXlRfeqmm+IcBo6jjagOdUCrT6bL4oGcafhUe0dWmfuVxrbx09Qjtn1cGnmNW53WyMGOZGUD2n/kFqx+9/OUs=
X-Received: by 2002:a25:ced3:0:b0:dcc:4b44:336c with SMTP id
 x202-20020a25ced3000000b00dcc4b44336cmr12963929ybe.53.1713270772932; Tue, 16
 Apr 2024 05:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416105059.1167-1-quic_vdadhani@quicinc.com>
In-Reply-To: <20240416105059.1167-1-quic_vdadhani@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 15:32:42 +0300
Message-ID: <CAA8EJprzdhDvmZdVXdHEJHpNA_Pj3=77v=y41EajFVe8LmAOnQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-rb3: Enable gpi-dma and qup node
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 13:51, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>
> Enable gpi-dma0, gpi-dma1 and qupv3_id_1 nodes for
> busses usecase on RB3 platform.
>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

