Return-Path: <linux-arm-msm+bounces-65436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F274CB08A68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A73560856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E5028B41E;
	Thu, 17 Jul 2025 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBsNLYvI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D144A1E1DE9;
	Thu, 17 Jul 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752747622; cv=none; b=MY7j+NjftqBeVdPC/ZROarsDcw678XNFSTVO+qK8ahywgVB2L244NEJ2fu4fFXgMYud1pPKTw8rpdK5C7g2sp/xFwUlmKNZVM5+D+5h25kSzkBCH7GbgZ5IxJE5CMShcM8PkxPkLSr6IKhYXuV1M8OG3z4EqbzHS7JLXbeMEtk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752747622; c=relaxed/simple;
	bh=hiL8PeW9E547x46ejeKBtYo91AKJR5q+WcE1Wsi3I6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbp2CZR7kBy1Rplz22VQQkZwHYWKTcI5ruyzuMM6skcOKi5xs0MJLGUCB/znNokIDc8y4E6EVwDUsDWBMci+kCKWUZ0A8hAxfKWIAB/saRrP5TuFKO9DEA1XiLuR5QUz4kc+SOvPqsJO0PMS9hNUCVnm8yF4DoDf8cPz2M/7kuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBsNLYvI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so637677f8f.2;
        Thu, 17 Jul 2025 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752747618; x=1753352418; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3nqRBi7n+rmYbqWhl2914eyEJuadwuJxywGJKNC2w4=;
        b=IBsNLYvIbb648B/Wl5slbiSQzJwRyP5YwYwgsx+rRKW8zITSZmsPIsnxo3xdDAfdrs
         P2MsIXxw4M9Tv1cotdccgFIOp0lERz38gPnkGxewDjead7AgPbK/lLs7QSBVZs4sTqKN
         2Lsz5YmbSiEfDI00So+m5MACwy0YJY6viRpMZ4y+iXClItbWDRvdI/nXq15NSh0Yutvy
         MBgKWnC2yikTP5H9YrpH4VFHSm0df2/uOyxTDiM+jcmaEfflubcHdba77h/RQWAk8IE5
         kOCc1sXSUfhJCYE5RsyDk42BamO/OqjyBs6BgXcnBRLhK43MEYepP1a6lNQ/XROc+1wm
         BqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752747618; x=1753352418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3nqRBi7n+rmYbqWhl2914eyEJuadwuJxywGJKNC2w4=;
        b=I/1WHXI1gg4iz+/zP/5ncjUkjNP93XG83QGLHkM2WAyJgocMaNi8aqJNJDVcJF3g5D
         Y/XybmgoXKBZpu9LPjiPzwA+k+uxVgPgDlpl7IuxWBgrQLwBCi7YxRH5n/ceNQjjrHlY
         H+QMJCsM3IXt+pnTCAEn1g9mEGaMBP3m7L+kJbLv/Hprw7Cql1LrUe7YGfQh1hRhjvnK
         yu/9m+YcNpHBPCJc/cnJhFiVPR09cjVlt36yns3tljcSIOd3iWIs5tcQ6zmivztIUP69
         3F57PfojhXrzV3HzlMxXBZ/TtfHfGulvU+hQc9mEsybGroC6iGLueGGCpgJJEOzYzSQ4
         LSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+2dBhzY1JttF2Fpv/gDJxXy0LBoeUwOCtr1q0+Ora2xjwGWYAfXrmYgwGzmy0Nj9yiqK7Jm+d@vger.kernel.org, AJvYcCWDh4j4pJYwMcnqlK7LJSXV2NJ6O5XczB3oQHA7bK4sTa6eWSFqwCWBk9XlEfiAvDkVKUgJmbO1mZvm5dcE@vger.kernel.org, AJvYcCWZOOPCL6VHBBEmL2JrP8FSNQDeMbloVi52hXfuQAUhkhXSb6McmVBJZJcQlm4dOxmdu5396W/87NI3@vger.kernel.org, AJvYcCX3Nldd36smRKOK7501zTm1HvVod2jHAQmzoarFFKJtdAWA2Dv/qUHx4tYti5CViXCKm8vSDxcq7289lZRL9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZboRq8fgpa896IgZ0uf6Q98H26c1Enj2cr4QUtfEwQ+LjTssu
	GQokrIKo/fdkIYnsHkeqhR+X3cnlVH1likkMKULcUz0DxQTsamoLas7stTP1RJnwN+YFDybuefW
	eQwJTPk2ieT52EDufx1jJM/3DnO0TRQ==
X-Gm-Gg: ASbGncuR6WYKKITaIj2erHqmd7ui8wOxBdkHifSa5S59pKAqr42TBcnx8rVgeqM1w7c
	pEQU84+hctPrt1TMC0LHw6xZrlr5nhkzL/clcX9SdjIo9wLg0D0fvYPWmDzBW8zGmX8S195jG5b
	TYqTNGP7PLZLCgCy39ry3ob1L6xipBDvRrrJHWamTpvTQpU3xBBM3WVHhVfMdG0J+Il3Cxao2oO
	ja+xbw=
X-Google-Smtp-Source: AGHT+IEExzPg1ZFquopOlKqZeD7zQXYVPzF86QGynEvx2ljIbgvGg2a1b926W4qwEBzJfp6GnS5qUDt4LwMU28iXFjY=
X-Received: by 2002:a05:6000:2482:b0:3a5:5fa4:a3f7 with SMTP id
 ffacd0b85a97d-3b60e54a361mr4528105f8f.58.1752747617790; Thu, 17 Jul 2025
 03:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701183625.1968246-1-alex.vinarskis@gmail.com> <20250701183625.1968246-2-alex.vinarskis@gmail.com>
In-Reply-To: <20250701183625.1968246-2-alex.vinarskis@gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Thu, 17 Jul 2025 12:20:04 +0200
X-Gm-Features: Ac12FXyjBUphoLYn2GR7CZGe1qBId6Bk9wQMdDWE_cy5din5jYzLL32gxBGRlVA
Message-ID: <CAMcHhXouMRKEu+1hK-XYeuHa9RCXsEOR=ho0vEVCXewTsWFrtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, 
	abel.vesa@linaro.org, bryan.odonoghue@linaro.org, 
	jens.glathe@oldschoolsolutions.biz, stable@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 20:36, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> pm8010 is a camera specific PMIC, and may not be present on some
> devices. These may instead use a dedicated vreg for this purpose (Dell
> XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
>
> Disable pm8010 by default, let platforms that actually have one onboard
> enable it instead.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Hi,

I've noticed this was reviewed some time ago, but was not included in
for upcoming 6.17. Perhaps it was forgotten?

Thanks in advance,
Alex

>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index e3888bc143a0..621890ada153 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -475,6 +475,8 @@ pm8010: pmic@c {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> +               status = "disabled";
> +
>                 pm8010_temp_alarm: temp-alarm@2400 {
>                         compatible = "qcom,spmi-temp-alarm";
>                         reg = <0x2400>;
> --
> 2.48.1
>

