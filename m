Return-Path: <linux-arm-msm+bounces-14338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B7E87E3E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 08:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34232281102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 07:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E5222337;
	Mon, 18 Mar 2024 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bakgQLXM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2D21105
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710745895; cv=none; b=DSlLG3pwyDP/pFXQrzNKyxPbZFvdHx5Srzw+6zYlfbr8w76tv2mui9v8G/vydPuWJCcntOMPShXCbwWTwhtvaNsG+BLCPxahQc39/uQPDf/iw2LkRNDvHww/FKJJUxESaT+//HDIkXo6tK7wrwhCwNgHi4vnkgiyINrrTRQv6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710745895; c=relaxed/simple;
	bh=SrururavG+N20uLQV6wSNjtVq09E7FD8xFoRu1t6mQo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J9R7wpYIZPbiL4ogbKJxNfUq9gEOO9AN+D70kWk9lEXXzioNko+UYPjVLr6dejfFOXrVe41TG3FbW1cxMKNRZ/b3iKFvtneIv+5uvZl2CuLZ0P5+l2vj8P28FkJQG4pq/ugdd03MDN+FtcDeLsUOrsvO8neWrk/NS+pHm4lymTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bakgQLXM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso370380766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1710745892; x=1711350692; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeRv6wWUGO4049P3j2OySs144lGj+ZeTDqiDzx4NR1w=;
        b=bakgQLXMLf7k6+t5tJnz60ny6stSr7FlrA8d9sdoTCbIlympuWa+KKZGNCQhVuJ7I8
         /26gA+tDvfn32iJ7n7k+awVGYd1ExNW3up3VgGVDzBr9YPEPG5ZuxaWD0TRDDb+QV+8N
         0iSxbBr+m/aGRlUuJZKqsA3i/HVWBd9HbWIN/epfIhW6EvxddHxX3UKqtrGMaqktb00Q
         v/FoVgq9jsDE94lAx7E1gs1p3wmt8pjrip9nJZDDrpINkt7OrZFUD8/nnUm7c1HyPwmp
         XOmShVREYwRBqHas3HgYSs76QdUME1dgy+beGUfxcx7EWZzcPkanoRLaUgUoMyEtrc3i
         D4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710745892; x=1711350692;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VeRv6wWUGO4049P3j2OySs144lGj+ZeTDqiDzx4NR1w=;
        b=Zw9qi2O2x+o12fMZ94RjBkkbYPYpdwMdVIt5zPspRBo0prSjba/9va3EM1cTqfEnXu
         cUHS83qe3HMmqI1yC55E/Wz+FNkqS/gIuUuJJ1wyHWYE4Bi82pfG9yPQYbtKXRCQ4mHC
         pT7JDuaSiJ2HT0+7O2UO22VrEFKRV4oZuO6GXRzB9SVFhboWm0ja5B0uQfHhYf9pPYec
         RkkcR/IPd5kd+d84G/yFsV/U01NC07146VH23Co3x24tFlvndurGkxnZh7msJioSP0Zh
         O4fKrb4EgGhPQAHAHwiPu7Zxkvt8orGmpSmwzuVWF21F6deEh+/349vmfyLJnteOzt6Y
         9F0A==
X-Gm-Message-State: AOJu0Yw+d946R3KciWZP+W3DEDIGJBuoSc77GZmbwU5438zZz+ObteTC
	OHb7MIpFkQpTvb8MNqJweulCLAeLh0Z49+RPc6TuhtEN6F9/yaOu02g/YHkdbms=
X-Google-Smtp-Source: AGHT+IFFvAoRVXiyVVbqmQ6QoDavb++Ps/7SqBBQhgnyqUgmFdd9+pMtZIjKJBie44OQFsvt+LH0CQ==
X-Received: by 2002:a17:906:ef03:b0:a46:c01d:b595 with SMTP id f3-20020a170906ef0300b00a46c01db595mr1208577ejs.53.1710745892434;
        Mon, 18 Mar 2024 00:11:32 -0700 (PDT)
Received: from localhost (046125249120.public.t-mobile.at. [46.125.249.120])
        by smtp.gmail.com with ESMTPSA id lx9-20020a170906af0900b00a4638693bbfsm4477665ejb.116.2024.03.18.00.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 00:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Mar 2024 08:11:30 +0100
Message-Id: <CZWOT0K3AE2F.1BUND7M9Q5RXO@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <quic_tdas@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>,
 =?utf-8?q?Michael_Turquette_=C2=A0?= <mturquette@baylibre.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-2-quic_tdas@quicinc.com>
In-Reply-To: <20240318053555.20405-2-quic_tdas@quicinc.com>

On Mon Mar 18, 2024 at 6:35 AM CET, Taniya Das wrote:
> Add the new QCM6490 compatible to support the reset functionality for
> Low Power Audio subsystem.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscor=
ecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.=
yaml
> index deee5423d66e..861b41933525 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yam=
l
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yam=
l
> @@ -30,6 +30,7 @@ properties:
>        - qcom,sc7280-lpassaudiocc
>        - qcom,sc7280-lpasscorecc
>        - qcom,sc7280-lpasshm
> +      - qcom,qcm6490-lpassaudiocc

So QCM6490 and SM7325 and SC7280 with non-CrOS firmware (maybe some WoA
devices?) are supposed to use qcom,qcm6490-lpassaudiocc then? Is this
what is intended?

Regards
Luca

>
>    power-domains:
>      maxItems: 1
> --
> 2.17.1


