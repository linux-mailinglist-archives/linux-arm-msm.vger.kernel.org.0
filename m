Return-Path: <linux-arm-msm+bounces-15901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1C8936E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 04:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86FDB1C20A3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 02:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5137123C9;
	Mon,  1 Apr 2024 02:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B++V6pKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF810E5
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 02:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711938219; cv=none; b=kTcHuqzs2+/nq9HcOCWYeMtJIE+581EtiX8MeQJkhrQCW9XBF0uiJIx8CbF3BdEgKWodXXlkq14cIOlZ3DTN8wVhdYevqyu8vHBh5MZcQ9cQIczAun2II6krbrMTUnAsI0fjc8Ed+jWfv9GLsmPBRwoRhyWxdwL8YxQooaAACpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711938219; c=relaxed/simple;
	bh=j41BO2dds6Fv38WNeZ85tSAZZ0NU5bCk5e9Xy6YPOvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sacrWAc5cwRNtLbC/mQDcDzQk+mWvOS6pWYTGWAYSTz3hyeE3J6xwi+hBoJwNgrBoeRBJbPRLwf5DNnb7FoI3HQdNOu2TA0HRtEh22EQGuvBqWiZDmbR2hSpiOEvlJX5er+vlMhExQ7j16PGeBr0nz2I3ljh40oClLKpEF9XwWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B++V6pKj; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d476d7972aso52367281fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711938214; x=1712543014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXfMuGsoJ/atd6ywH2U36Cddge1WO0AgRUSU8JyF+V8=;
        b=B++V6pKjnrKbvxb0bdnHNvsH3umBDCY0NXtjYBxvJ+4agFPDESx70CeB7OHBRBPNMO
         u/cwSYC3ybdBcNighhcWdJYl5a0HdXsIYf9Fmj/UbcUY8emk4VjC2M71lh0XoR86InmS
         /sKyB+ACPPkAUAemX1FCnZbRgKUJ/RontcS/W2dTHNtNThnGf388MpTJZNoH2IJab5z1
         ts//zl301tW+c/uMaQ/fQQeSan437kNip1S5YHRvhtIFLQpNVjttGxTYKWyPICNZ9jBY
         zGyEez3AaBrOYf8rUn8r+OHAU2IgW3xnxQ2VRkiDguj3x+4nwoNwM51fxCACXR4S6jq0
         0w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711938214; x=1712543014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXfMuGsoJ/atd6ywH2U36Cddge1WO0AgRUSU8JyF+V8=;
        b=unKzt6N6e3ktGELYi9uKlmxDrFWhlpuQYMz7q52SEHY4wl8ne5LnmOaU18VeBJOqtu
         rI4n8nC7Pdci29DI1MKIf6fF1AkpP+18PM2YneHj/1msUSqioKq48zH9OwqaYaQ0fMA5
         zEpY9tsf6Sp6R1+8Pl5ES1lTjh4IzpFWm6LdTaEA6YCuq8J62epeu7eyUjnIkc+q5e/z
         iudKN/TkXE9siSgL331fDFeir330c0FREg80rDagOcbJr57WN7SIgA04vN04DTvXrNyd
         0GJINTVMJCl2b363IAsn/faZb4ERPdVKSJjI6w7DL5/ChD3RtuusPhIB8KXORjxY+csn
         bKAA==
X-Forwarded-Encrypted: i=1; AJvYcCVwUSuOKyudavW+s0te6wUkkeb4aE4MMHDY/kTwdnme+TTQoQzA8/j2cAKNBk+2MY/iGv015aDMebgAPvV9iOE2KxenT8f/tjuL53/ytg==
X-Gm-Message-State: AOJu0YyLXwvjYgHvDwIwqACEesexVmNiDbBXrB6f7z4asVvvmwjvhj6w
	JXp2f916YG4ISFbL9MYyFRl3qAYM9aozEl/zUQJCt1GAiI+0Odb0juJlNn/NSz3NR4Ma6fNSdC8
	3RDIr0UjrlP1VBGl10aYxrvdJEmNbNGuAOvxkdw==
X-Google-Smtp-Source: AGHT+IGYmZtdzOWFfR0vTWyRYyRt7t6Ny+ula3JSyIJ78UHqJttV707k8TBzXPIipjhpUNAlaXV03FimDjkqSbpIieM=
X-Received: by 2002:a2e:964a:0:b0:2d6:d4ca:fa8b with SMTP id
 z10-20020a2e964a000000b002d6d4cafa8bmr5023108ljh.34.1711938214572; Sun, 31
 Mar 2024 19:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-topic-sm8650-gpu-v4-0-206eb0d31694@linaro.org> <20240318-topic-sm8650-gpu-v4-2-206eb0d31694@linaro.org>
In-Reply-To: <20240318-topic-sm8650-gpu-v4-2-206eb0d31694@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 1 Apr 2024 10:23:19 +0800
Message-ID: <CABymUCPqeu=41=jTnTLKkERRG9PMaqsmfyq41TDa43kNvjxEcw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8650-qrd: enable GPU
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Neil Armstrong <neil.armstrong@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=9C=88=
18=E6=97=A5=E5=91=A8=E4=B8=80 18:12=E5=86=99=E9=81=93=EF=BC=9A
>
> Add path of the GPU firmware for the SM8650-QRD board
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
Reviewed-by: Jun Nie <jun.nie@linaro.org>

