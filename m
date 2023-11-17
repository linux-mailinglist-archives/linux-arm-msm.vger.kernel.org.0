Return-Path: <linux-arm-msm+bounces-874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBE7EEEEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA5D1F266F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35E215AE0;
	Fri, 17 Nov 2023 09:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y4QPMIGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A927D4E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:41:48 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so1724308276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 01:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700214107; x=1700818907; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GKbU1pmqk9ezv/pS4QlNqR0Q6EVoRSle9QHrp/jGlg=;
        b=y4QPMIGMqmoYh0hy8jlA0b//M9GBQIKiSqnHJsLS6droKS2jUyxrJ42B55WMtVBkHS
         DTthVKWAAEIbnR9ty+ukquiK8GaRao5NGQ4at7ORe8VKwUDHt2pFqeZ8Zg0lrjjcpWns
         IKMzWCt856UVXZtnO4bJa0C9me/3g0f7D7YapJLG3Yw7C2vPHsrOgTpqOlMbYMqZgNCS
         j95lf4qVNQ2PsLlPLkmi6nib7aE2qKD3gsNIFPLoKPXY/4S3AC6+P31uzlGkQundE/y8
         UCiGdMP+TqkDLmYkSc7SFWH/Qko36CqHw+8X/7hqoJIu76mir0qgtovrcXXUm1ok8FDR
         O1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214107; x=1700818907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GKbU1pmqk9ezv/pS4QlNqR0Q6EVoRSle9QHrp/jGlg=;
        b=DOlVdPLp4E7FFCD6gyQz6JxEQK6rmp/vG1wTIlVlbowaDX3gkQvMcoq/cWvKMfmI1d
         cgWGnEO+Khx9tk2zW4dAJHjqkTSWKFknEqtMSP6nqj+9RhQYlhSVUZqFSviMenVOFT7s
         LoIfp8eIr7OC0taVOV+Z4Y7sOwTGImqxS+oAVF1WJKuTlSkBT76RiD7ALW4VTH/r6bJM
         eX2dZ5mENgihcXpW4gemZmBdrozc/srCVoa3fa4VtwGD9QUngzzl3m4p8slpgY/SsaMh
         ajDNIu0VSGl6ju2ezFRa/0Dnu5JWawGVwtrP0pcNuZjHK9+NzHE7Iswhjz0PEnFdvV7l
         ypBA==
X-Gm-Message-State: AOJu0YxduAaCzl5KwxY/BByjL5KOMN0ZY2uk2TIOij74eI10xP+bfY14
	9yRCBcZaMfJrsLc/BaE8p3g/x2tx407wilhs9ICDGA==
X-Google-Smtp-Source: AGHT+IGCP9QVnIOT2ZwFVpCIH9TdmzbEkkXBwatcoCkJWkH8/33ArI5X8qfumCKGOVK6mDD9npCZM6y3elKdW9s6bqM=
X-Received: by 2002:a05:6902:1503:b0:d9c:aa29:6180 with SMTP id
 q3-20020a056902150300b00d9caa296180mr21870680ybu.46.1700214107344; Fri, 17
 Nov 2023 01:41:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117080737.606687-1-quic_rohiagar@quicinc.com> <20231117080737.606687-4-quic_rohiagar@quicinc.com>
In-Reply-To: <20231117080737.606687-4-quic_rohiagar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 11:41:36 +0200
Message-ID: <CAA8EJprO=W-wkwTV3x8HRHtvuDhfKXLfWj5MQJPS4cqKkngJ7g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sdx75-idp: Enable USB3 and PHY support
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 10:07, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
> Enable the support for USB3 controller, QMP PHY and HS PHY
> on SDX75 IDP.
>
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




--
With best wishes
Dmitry

