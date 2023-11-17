Return-Path: <linux-arm-msm+bounces-876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B161D7EEF1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43D55B208AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99FD15EB9;
	Fri, 17 Nov 2023 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ug+Q1LnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A0D35B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:44:12 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5ac376d311aso19352027b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700214251; x=1700819051; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gJJ5ScMsDcQgAdEUE/qgp1NsHcLxH6RM2U6e9L4V7DE=;
        b=ug+Q1LnVZ+cZa0gknR0QOpbNHCyYNe7mWC1897/nbkCisd2W8bFz1Vp2ZeGglrIohv
         jXXX6BNSj7eKDujAmcMZL4HT1tF+xWrH85cSfB6gQ+No/Yg+TCuVz41G2IF7b3s+hhcS
         Ta7ThiDublARmrIAiAw3ch9gy81FpPVvglq8ETuMOwUCLZvj4Ho1BOEEW2uDdXgndUxJ
         99jWaTi0+4lT4Gd08kCzY0EVJQeJyIDfttrbcG5Oo3OJhS259+ExWY2bVrH2ndoSBItC
         R27pVT153T0ZFFDkFs7KoD6VRKASDEEI5FxXoUYIWVj5YsPk4g73kdspw0/8MMtSLZpt
         uXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214251; x=1700819051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJJ5ScMsDcQgAdEUE/qgp1NsHcLxH6RM2U6e9L4V7DE=;
        b=rOFaHPwj2S2P6wMKvKw7iQ8+sctR5qRZaV21DoakIbsUoRJgc1l3OT3lry8A8F+i6T
         tUXf2LIZ3EPLehFOzRuoPmGyNl9zYfrXx+sndkPHL5izH7yUVKlM79a2wY6ObDUWgFjU
         1KQ3p+O7e/8OGT1GO3gxh9u/iO6BDJpaonbctEtFUULbPdLBktqjLG5jKYDMa0tZyrrs
         P7k0orXS2R1lhn6rtgXvnZ+Ym+BLn/nEiZ+LpL/VhtNgAdv+8cKQHWBxMEBmpS4t6Hgi
         erKVCHvNeDhWeNDoEB2NVw0nn5GfpMJ7Gcsa3JBBHCh27vY63inm7uRIweCquCHMabX/
         1cSA==
X-Gm-Message-State: AOJu0YxoCVpSdaIpMcsvOro/ZUd6hlIjHmxohRs73vWFxJ+Bb70HLc1J
	AYLcEqHuIrh11kDkYF6Wj+mjTTNlaqjO3aUBmnI8KQ==
X-Google-Smtp-Source: AGHT+IFUNpTmKSRr3Ltfd7PV89xQ+VNo2TeLFWGiJMKGFczxIeg5nFKWILVTxQR5+WRdwuuKxlAQDTVgd++EucffyKc=
X-Received: by 2002:a0d:f347:0:b0:5a7:d997:cc7b with SMTP id
 c68-20020a0df347000000b005a7d997cc7bmr20438268ywf.23.1700214251291; Fri, 17
 Nov 2023 01:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117080737.606687-1-quic_rohiagar@quicinc.com> <20231117080737.606687-3-quic_rohiagar@quicinc.com>
In-Reply-To: <20231117080737.606687-3-quic_rohiagar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 11:44:00 +0200
Message-ID: <CAA8EJpp0ZLUMpvbDDczfagWsgZyHR_bBOZvK-kAA0NKg1JVMTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add USB3 and PHY support on SDX75
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 10:08, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Add devicetree nodes for enabling USB3 controller, Qcom QMP PHY and
> HS PHY on SDX75.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 118 ++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

