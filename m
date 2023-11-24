Return-Path: <linux-arm-msm+bounces-1850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2B7F74BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 14:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B18001C2087D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 13:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAAE286B1;
	Fri, 24 Nov 2023 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwZ1dc09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A461110FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 05:20:18 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5cc77e23218so18852717b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 05:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700832018; x=1701436818; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=duwkvZHrBkTaBuc8LOMphh5Uy/87rU9msacGlhDLoFw=;
        b=LwZ1dc09aQrh9Yf2fNtFfuaYH/YIP9rA4/XT12K0+39JaMepF6sQfaUxllhH7EPRMQ
         U5uXHiM6YqyL0Ze+niVd0R8pfOVeDMhXeUHjhTraSGkFnV7foXhE1042thfu/npo7DAl
         2we+fgEHJXbCOq3zW3rf7VpFLd+WwM+3zMd9ahgf6JKeA14jAxoe2w1yw5DBbfUjWwT7
         3Gdfe6HwA4mfQRp9KwhzglzxzRBDMX6PypfjkIpQ9cH51oh8u4Mw9d4SBACUSahQ8HnC
         qPa1KC/dl7fFOzeEUcez5I/HX2dQRAT6ly1ILu9hvNIuzNi2cz4vxwu8fEVpvKWIQs8t
         yPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700832018; x=1701436818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duwkvZHrBkTaBuc8LOMphh5Uy/87rU9msacGlhDLoFw=;
        b=ntfo3aajoODtEQfeWSxV2AuHcWsljUd63J5pbnTHrBnrbuVXwL1tsuw2jGx8ZRUKiZ
         Ez3VReYzeXYMwsvYKmHg6HvwllMffx5cPocyeFkaSTV+JVbVGQdyOBQieUF3nqrW9ZCH
         DHQ5J5SGD2tWwwgC0HAkg9SZ4d+zzD5Gv8vCKwNQYdxpSxHMKf10EA/+P5JV+CGS84Mh
         q0ChT1FjJWXOAxQde3iQTCHspthL3yFKsv8/uni0LzIsS8zar5Z74cv4goR+kVOjh936
         rgX8X/pV2MtIeQd927R2pm4Q5YGQqluT/kgdSanBd12so+4fN8qCEEQQLIL7WZvuRE9H
         y3EA==
X-Gm-Message-State: AOJu0YzcVDK9bjbogcDSAzfVWZlXHV9Vg0RScbPtJnQQedKJFyaRagEs
	B3NKCAqUfhTfNi/nHqHXJMDuwvxohzg1469Ys/zusA==
X-Google-Smtp-Source: AGHT+IGTMWDoubenznwguJuKisn/kdH02n6RmrB+3SpiznhGgPENvFvkg5/wCeChRLDXvMftBTinfn7BhYh8JQE6sQE=
X-Received: by 2002:a0d:ead1:0:b0:5cb:464c:ad23 with SMTP id
 t200-20020a0dead1000000b005cb464cad23mr2791623ywe.42.1700832017875; Fri, 24
 Nov 2023 05:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124121305.1954-1-quic_kbajaj@quicinc.com> <20231124121305.1954-4-quic_kbajaj@quicinc.com>
In-Reply-To: <20231124121305.1954-4-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Nov 2023 15:20:07 +0200
Message-ID: <CAA8EJpruXcpLX=c9o27rqHuh3u_ktqp_a+PN=DcCbq8sWW612w@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add base qcs6490-rb3gen2 board dts
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Naina Mehta <quic_nainmeht@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Nov 2023 at 14:14, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:

[skipped]

> +&wifi {
> +       memory-region = <&wlan_fw_mem>;

qcom,ath11k-calibration-variant = "Thundercomm_RB3gen2"

Also please cc ath11k mailing list on your next submission.

-- 
With best wishes
Dmitry

