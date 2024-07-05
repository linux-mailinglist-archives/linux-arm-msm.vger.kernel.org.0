Return-Path: <linux-arm-msm+bounces-25327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DB9282F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F248286D29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 07:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486A21459FF;
	Fri,  5 Jul 2024 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yXsl8Ou9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C1214534B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165302; cv=none; b=HLmcreVEXswRWehQhB5enJTxr6AcR6i7G/tPdyJG8tNxVsn2Js1Adl6s8ZWZuTBOdhBl5lnNvLdic9hJhYU67U7KbMeXSMCojWf3i9IIrcq+SBS5rDw6k7TSnUqZEVq52eps57+tfm6N0EyZKlJP289Oyhp1ERnckAg0DjMmyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165302; c=relaxed/simple;
	bh=C6Aj5EaEfcJqX9TIxh32n8SJfeYFTf/M3EglO+bsVXY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Dnu7zOFdpRIznnVNkjSo3eizuRfGvvCtFnVsQDwHQNgVy+aUEsqL9Rc60p/50ut0QlT8mi4YDdrSG14iuCE5a0b9WqPrVg4qjDLLNCurBvMXDJc7Yq4RTiN771BJvfy8Zx7RhvvoidVZJD7/bq9jOk4MTHwUR2cuIUXv0WSCa1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yXsl8Ou9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso1648235a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720165298; x=1720770098; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQlN9N4OmBSWIwYhAl+aMllt25uIxXclcKeBS5OjPEs=;
        b=yXsl8Ou9ZoVHo9/OSJYjcJYasG2CGtiuQlZ+XkRNCJz3mFDRc86LcEzpaKdKVuBh5v
         mxbtDCiv7g2kA8OA1wSYZIEBur5O0oS+aRtvKjaWywkC0RqgzKFEyLJRs1xrbqVH+yFw
         E08XS3j8LQJaeVqvqrZM6k6tNiH7WpWo//UkwJAbkFP0y+aSabL/7PmZXIGna6or2eX+
         QxOkaYaVTVhAvTXlHB2cTLLMWrlhbOc4BvJsv9kb91BeTV5qNVsoAuEQF81NkJ1Tq9Hz
         vurgEw50Ty3Fnbh2oGTM8wcWavMMUigcYLbCJyqqelscN8M/wA557X5pioPttkQCrK3i
         a7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165298; x=1720770098;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQlN9N4OmBSWIwYhAl+aMllt25uIxXclcKeBS5OjPEs=;
        b=qtzhc+3OMAzTr2ZKQLoymFa+WZPapnW3WEm337oY7nbIWyULVzJiBVlx0mpKGRgc2C
         lfT7FTA2L6d0GBXMnK01ZK7hp2G5/8Mtt00hvy8iq9MvM4prakEL0N2gsdiax5SnmQDE
         7K4voh4KgX/KQzmrAJlhvCyL0Dc1VtDrdg/+CcLCWknAmnTwLWiP/qk2bRK39jOBr6aA
         Lv14EnBNH0KZS9EqRxNDYar7RIfWlmnpBjwGfgGariYi6YTCBc3yn3HdpwbnaPGi7dn/
         I6/rIkVzdOe4C5rufODc7JdCkdxUyjDDcy+ZRPPa3y4NXJrWfi4fn2Izyy7mwz0o+Jra
         p7AA==
X-Forwarded-Encrypted: i=1; AJvYcCUp8nRoTQRDmBKVokUytddCMIaX4C8Iga0WdPJB2vAiz997kL/edsxmM+U5f65jEzLTj4FhW8dpuG643O76HEefvM7F0oFqKakPl98v1g==
X-Gm-Message-State: AOJu0YznEEGo+1R0S83H5IrkCb+S0020brDc2BQnbXduI6OwzYNdxA4H
	thXDIlmqR21b1hJB0dkH3i3sbBctzkOaDzQS22hF5CS5WFAKbHDJdmnMby+bcVg=
X-Google-Smtp-Source: AGHT+IEIm5temVbaI8ZdtQAUcJOvJoAb9XFwL+Ws+RRRznQkvBa2ZdaAzA/+T629AmJ9BRsiiBvWyg==
X-Received: by 2002:a05:6402:27ce:b0:578:60a6:7c69 with SMTP id 4fb4d7f45d1cf-58e5c72ffedmr2681374a12.30.1720165297727;
        Fri, 05 Jul 2024 00:41:37 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58ad8730dcfsm5059338a12.7.2024.07.05.00.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 00:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jul 2024 09:41:36 +0200
Message-Id: <D2HFPG49HZ8L.P337FA15VAA9@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add missing
 qcom,non-secure-domain property
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240703-sm6350-fastrpc-fix-v1-1-9f127de17175@fairphone.com>
 <wlqlcrlh4ogzxkbwmte75hvfatiysodt3ohlxxsyzhxkzyukh7@epjxupcod4z3>
In-Reply-To: <wlqlcrlh4ogzxkbwmte75hvfatiysodt3ohlxxsyzhxkzyukh7@epjxupcod4z3>

On Wed Jul 3, 2024 at 12:43 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jul 03, 2024 at 09:03:01AM GMT, Luca Weiss wrote:
> > By default the DSP domains are non secure, add the missing
>
> nit: secure

I did copy paste it from previous commits but I guess they're wrong too.
I'll fix it!

>
> With that fixed:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

Regards
Luca

>
>
> > qcom,non-secure-domain property to mark them as non-secure.
> >=20
> > Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
> > Fixes: 8eb5287e8a42 ("arm64: dts: qcom: sm6350: Add CDSP nodes")
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20


