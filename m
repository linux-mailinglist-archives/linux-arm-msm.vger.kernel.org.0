Return-Path: <linux-arm-msm+bounces-45568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21957A16ADE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ED9A7A2B6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 10:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017221B423E;
	Mon, 20 Jan 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dooBRSTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595B51B3956
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369422; cv=none; b=oKoaMLdegGwYFxWzLIxtwqi8evmFERDnVCfBgxsbcvUt66VYgXkXaf2iJ/fkrTzepXpdQqdJ4bszP00JduMm1u94dJ0kvNIbejMX2H4+C2q2+QHiHoaiaMhlaASQm0SWM1Jp7zb7xJHDFtkLejM6SuS57iFYViK3iPbS5fazzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369422; c=relaxed/simple;
	bh=cGFMswoitNfqWi4DCybe65q9S8zd6SKRugROMu9Z7iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkWH2QD2gNmYwgGK3Ql9HxmqVk1J4CyRD7xhbeCsLw8dzXN1pD9OBDdz0nxMMqJdaT1qMAATDydLL5V/jUXM7DtdXWndwGXGsyeUsp8pKFGR0nJyiz4Uvew/YwUCYz93dyjwLDZLb2AESLi5bQSTNPKHllZGkhtGU5v3rJ+2R6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dooBRSTW; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3983426f80so6469961276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737369420; x=1737974220; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yFMrrqx1Qoj4jKMtWUIzCNPzlSldcF1l8F6opL+IAIw=;
        b=dooBRSTW+SswPghO2yDrLisFda15AuH0fzbvW1JH5OrykVSv3HVKZMSjrmAXZxzhYL
         DBxKF4olbLhGvg+ue6ktrUaFH6iw5Mkb665Hx3jwr44sqNCMDJQlHY75Zd2+NyItDJJw
         YdpwMUuL+j4H2ck1LMrxl1edSngGvJvD1gcFJ77Fetwq2OBLL685i0dwGZx4nw/yljJw
         1ugZ4DCMkyDWiFOQemk32i4v8aqRkIajkJrG3oTx08citS0xRiixrtbODSxq1ZsMdK+T
         vuhJMyDUYla2Tynb03+Afe7b8wn3Z/WSbj+v7JQFvMh0reYkDE6I29Up0Zd5VQR6Pzty
         iwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737369420; x=1737974220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFMrrqx1Qoj4jKMtWUIzCNPzlSldcF1l8F6opL+IAIw=;
        b=GOX2QgDx9dyvedOm6Pw/fv4hdP6IwVVm/TexiEfh8EiwYk9kE5rh2sksjoBM5pS/lp
         K5fbn4r0cdLviVxIokTUX2cLz+SYd78EoSeJTvxDLuwQg4pSejoRD01DCB9g8ldKoiGT
         V+vd8Wu//J7TbPEIgUSPFe+Fj8HfJ1O6d4Y+2lthx5TWNcCHppj4i+Vvkvj6SOeMWomS
         R7FAQAA1MYQ+fTfPP0tr/SWL4I/A0F8OgxR+vJnbb1m0udvA0o/9DlYZmn+2oWxahexp
         QbIoPsWuJqHw/AaqYo5MmRSAGsH/XFml0ylUxAwT5uYKczvCoSQxw1vlspeXhlQlX2Km
         J9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsqvXtqiUmOEgCupFXYavS4sqK/1J62ZKaSj1ikW6w5hshF1KFOS18bGMbX/PW0Yt5eEt+OPfJ1+CbMlwf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2BgVRU8od2xCFInGZPNEBQf+Q4XBTvWdGZ0Y/9jJJ3+staHWK
	Qo3A8Qs767yI8BbHDENTXRGL9YdQszT//s0ha7PeIlwdV4j0gM4mDQk4+io8AxBbumwotJ7DIBg
	UWLCB6Epm0eMSzEzLS84BL2+yyyRG4VrwQwLlpg==
X-Gm-Gg: ASbGncu6PzXW9aGLZLq/lZOadT6lsIGsup+6mJgYXB2LIM9i1gRC1I6Qb3WcF877BBf
	xk+HbFUIErvp/n0I05zxpvfuk7zDO5Q5ZrKkhoXqnH9jwamWNiJ1L858O3c1rRv9H39ZuoC8ZPk
	a3Rc1uiw==
X-Google-Smtp-Source: AGHT+IEDFCAj6TxNDA1GeMvnXyrXJYIlHEdBB7VN2ZztntxUp7ZfarbFRwu3Cdl/7oTaC1y81QjFGWBmbL1x3HoYYnI=
X-Received: by 2002:a05:690c:3809:b0:6f6:c924:befa with SMTP id
 00721157ae682-6f6eb671b22mr92127387b3.14.1737369420253; Mon, 20 Jan 2025
 02:37:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
 <cgg3s6f555eb4jl5segz7irwx2kkza7w6zucfyo7myrbjhng3v@2qmyrobzakhd>
 <71635b71-71e4-4c17-add1-bf41ce770632@quicinc.com> <scfoxmstfqgvqmxovb7h5gulh6bjhgexs6yxe2n75izc7sawby@djphyr2ilei3>
 <97f5f5b1-b4f9-4d0d-88fb-4c7a0f1c26ac@quicinc.com>
In-Reply-To: <97f5f5b1-b4f9-4d0d-88fb-4c7a0f1c26ac@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Jan 2025 12:36:49 +0200
X-Gm-Features: AbW1kvalUCoaK3fdSfJjJnzJOeramfJ4qP389PafQbuwuKgJociukqEgg9MZhIs
Message-ID: <CAA8EJppOHw5u_dMW=uXgyp3NSJmv9fwNvEL63NCqOpXUKPz5vA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2025 at 12:34, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 1/20/2025 2:16 PM, Dmitry Baryshkov wrote:
> >>> This doesn't follow the bindings, does it?
> >> I will add and re-use the closest target compatible.
> >>
> >>>> +          reg = <0 0x18323000 0 0x1400>,
> >>>> +                <0 0x18325800 0 0x1400>;
> >>>> +          reg-names = "freq-domain0", "freq-domain1";
> >>>> +
> >>>> +          clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> >>>> +          clock-names = "xo", "alternate";
> >>> Are the DCVSH interrupts?
> >>>
> >> This target does not have DCVSH interrupts directly connected to the
> >> CPUFREQ-HW.
> > So, does it require a separate LMH driver, like the one used for sdm845?
>
> I will check how it is handled on QCS615 as it is closer to SC7180 and I
> didn't see any LMH handling there as well.

At least sm6150-thermal.dtsi declares two LMH blocks.


-- 
With best wishes
Dmitry

