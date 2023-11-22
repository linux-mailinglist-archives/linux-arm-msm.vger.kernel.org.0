Return-Path: <linux-arm-msm+bounces-1449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C703F7F4027
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D8C280FD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3273D3B7A8;
	Wed, 22 Nov 2023 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xl9atxrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5FB10E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 00:32:29 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cc77e23218so3265557b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 00:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700641948; x=1701246748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SKD7ps1yzVN9YyslM/iBpqLP523I7QRimM6aSYFE9qw=;
        b=xl9atxrtCs/O7Rljt3oJ7A8T+hwiYAonhbMg3odgk4h25Y70BWpEwUph5hmpQuDN7D
         DUWnVyLcwiSSADhUFGdJq5rftQnd9Trcj0BGNq5DQbYuMsLr7sLS5oUEqiZMCarvCSFs
         OB37XZKqRJW/308+NwTes7JnLDTros8r07dI0uAofJK4r+o7ajBTa0+NNejjJhDX1kSz
         LY5lhUAkLjU+FRNNck1CdFuk6uSALy/bjV4cVQzpCukH1wjpTZxBHWSvsJiNSakcf5oY
         nn4scrcYucAWZ7DB5V8X9B2MYZfc5e+G8K90/zSEjVhUmbm8deFJ18lSQ/zngwGiFVWy
         QqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641948; x=1701246748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKD7ps1yzVN9YyslM/iBpqLP523I7QRimM6aSYFE9qw=;
        b=sz2JpXWUPehJGmm/Q/DVhfvxNJTZJ1fpDB/b32jBI//ru+Z92i7WZ4yjKgby5ctmsG
         ybyoSBnZKNSeutLGldG7qD+JvCw32Gh1Xk8/fK1gDFT7TGve89PqDdqoACcdf9Ne6lGh
         uonuIkYOENPluV0/AkgTI+GKtpilykr25HNx3KQot1nLZH2qgQo3idXSlc9A3dP96cmp
         dL6iPHMKjATrvshvNyFp5z5VHTYQJH0iz4iRfYYP2xPkoUgtZIEzPvCZ4Yn2Um4Wltn6
         9WNEYJKNDjIaln7IBqdsOYuKytibWWBpgLWDI61NTGuOwGLT1f6yxtfd9oS+NEganQDG
         Gc1w==
X-Gm-Message-State: AOJu0YyKV9PnlRhqs/KR8lmHp9CEy2s4ybCAyEBrUE4Jj/VvVq1Cb6B4
	dk47L+6HnBMnNJgHq4reCYi6VHC1jgb4sDhz4nRy+w==
X-Google-Smtp-Source: AGHT+IE5g6LemC66GK6J4NtBnEPhGvTXAOLhtI7zh/ZTgg1uxNkugF5SAUnxnXKq9zo05CTFg+SDAeASJdL8+iGTQBU=
X-Received: by 2002:a05:690c:4782:b0:5cc:7431:871 with SMTP id
 ha2-20020a05690c478200b005cc74310871mr699694ywb.25.1700641948499; Wed, 22 Nov
 2023 00:32:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com> <1700637042-11104-9-git-send-email-quic_cang@quicinc.com>
In-Reply-To: <1700637042-11104-9-git-send-email-quic_cang@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 10:32:17 +0200
Message-ID: <CAA8EJpreEqStpjkN5z3+ufiFXP22-PcW4U+wR6Y7LK7QMT_Ktg@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] phy: qualcomm: phy-qcom-qmp-ufs: Rectify SM8550
 UFS HS-G4 PHY Settings
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, stanley.chu@mediatek.com, 
	adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 09:11, Can Guo <quic_cang@quicinc.com> wrote:
>
> The registers, which are being touched in current SM8550 UFS PHY settings,
> and the values being programmed are mainly the ones working for HS-G4 mode,
> meanwhile, there are also a few ones somehow taken from HS-G5 PHY settings.
> However, even consider HS-G4 mode only, some of them are incorrect and some
> are missing. Rectify the HS-G4 PHY settings by strictly aligning with the
> SM8550 UFS PHY Hardware Programming Guide suggested HS-G4 PHY settings.
>
> Fixes: 1679bfef906f ("phy: qcom-qmp-ufs: Add SM8550 support")
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |  3 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 28 +++++++++++++++-------
>  2 files changed, 22 insertions(+), 9 deletions(-)


-- 
With best wishes
Dmitry

