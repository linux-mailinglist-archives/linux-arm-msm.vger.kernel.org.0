Return-Path: <linux-arm-msm+bounces-3386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C458044FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166252813C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2F73D9E;
	Tue,  5 Dec 2023 02:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbwU6ybY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC58119
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 18:34:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso2473024e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701743649; x=1702348449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpaMsJ+mJnMBHitD97cG3Tu8qBw0lnksRrucuKZ12i8=;
        b=wbwU6ybYj/Ph+rjn+HrRhb8okylJKL8SHV4akYmEcuSj+LGdKQNeC4p5gRDkvtkQpf
         mOk761uVKbDu1901c0Z1KEP+b7hsP9fjTQWp9RWArdz9T8tirNh68Pg+31Ix+G0KUCcE
         1U/jXqjnPYHP9Bc75+lREotWGEojQLWD+4/IlXGikwsM+2h1SRBjC0LYtFN9CEThnqF2
         NPRCaAzfFhpiUwCw/L5mAoyzGuobzTGdpcRwJXdRF6+sU7NnRdg7sj5X4teRncOc5sq0
         Ne1gAjoCtU0Qu90MViDV/hj3DWSstDHnhM2GxV4YYz1XuXr54d3J1A/fGthifuGu65xr
         l9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701743649; x=1702348449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpaMsJ+mJnMBHitD97cG3Tu8qBw0lnksRrucuKZ12i8=;
        b=fWAdt0gn/1iMB2ek3PVVuyNrfzgoNPD2gXRBHPECUdEAfgxIqLgZnigDXidXgpI4hI
         Eh19n7EdfPdCcnI0D2R3FdtOdG45NOr21AwpHZQZ/SnnHcxC7GlSM0ISqc7dLp8slppm
         kvF5o8JucJhUSb9Ilaes03gTJgtKh27Q4NSzFvzTOjymR9RHbCGarVToCmaloq2Xzw74
         MYgAvo+UdVnYwCJbnKxhqcb5oqnnk5Y9JQX/UYQ6XYlFovVLAvrMUactgVT5v11cjNJX
         Up0b+OudQx/2/g9ilLrusnE2WImcfrQcuLi+hOW7laEdk7MYpcAUB/LhH6yRHKczajpy
         DBGA==
X-Gm-Message-State: AOJu0YwHn1/Om7AvaoAk7k5Mbxbxcbg3o78BFe3kh0QroQGpRB5Rc6P1
	gYEp/YfqkESvxMhRhBU+3qA60A==
X-Google-Smtp-Source: AGHT+IG67aMeKoeDw3yoE/uU1x+gMjg4dCzQH2MkY+v8uyNXuNXe+gI3Tpdid7xpUI5eboGQBS4Uew==
X-Received: by 2002:ac2:46d1:0:b0:50b:e1ea:b61c with SMTP id p17-20020ac246d1000000b0050be1eab61cmr2454905lfo.49.1701743649146;
        Mon, 04 Dec 2023 18:34:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:34:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Ryan McCann <quic_rmccann@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Liu Shixin <liushixin2@huawei.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH v4 0/6] SDM670 display subsystem support
Date: Tue,  5 Dec 2023 05:34:05 +0300
Message-Id: <170174354266.1582017.6964573131829397385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Oct 2023 22:18:07 -0400, Richard Acayan wrote:
> Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
>  - move status properties down (review tag retained) (6/6)
>  - accumulate review tag (3/6)
> 
> Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
>  - rebase on series and reference generic sblk definitions (5/6)
>  - add interconnects properties in example (3/6)
>  - remove phy-names properties from dtsi (6/6)
>  - accumulate review tags (4/6, 6/6)
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf5a80695311
[2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e1af3ec823b
[3/6] dt-bindings: display: msm: Add SDM670 MDSS
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c965007970ed
[4/6] drm/msm: mdss: add support for SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3c13a56e4353
[5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e140b7e496b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

