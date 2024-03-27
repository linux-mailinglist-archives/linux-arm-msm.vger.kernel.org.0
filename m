Return-Path: <linux-arm-msm+bounces-15376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35CB88DB55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 11:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4632F1F27DD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 10:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205B437140;
	Wed, 27 Mar 2024 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZGpmWnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F526AC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711535833; cv=none; b=Nn0y3/TrjuVSk+vLXEXuxdNPmMDEoT8E2czw/eh2gMxPr2Eb7J00LBmClDDeAls9vxfdhLQ3XTp/WvfkaNrT1l6/71ICjAzWI7jQIV+WvzdsYMKkwbVzOb6x1G9vnAZp40CgOpRE0fWvbz9t5iIg5ZYFrHPki+eTnFtyZCsLshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711535833; c=relaxed/simple;
	bh=9MtnUGb5/xVzmxiQWRd0pMDTVCd37nN0QPXrSbZMyo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBVQT1BDQ00ncVfAVLxnA8kxlOBjI+XCjja22tw3HgqcMGnefNWdo+Xzzsx1V1MwZQG5z2rBdUKoNZRq8kJc7rBk+LXRf/KBvl+BITxePcSHrcUt83c/0VG9OFfr1O64xSQAFkxta+9Kl97gxg/1r4EgfIwfSvUlHDJrCcrnqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZGpmWnY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so137224866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711535830; x=1712140630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0RBjv/Mk5+1uH8zHWpw+frS6Pk+FGxJ0ixEJQeiLUE=;
        b=GZGpmWnYg6GhwFB6eRNKaXWKkyMmDfdOPHdGc9Oqfl+KzdIbERbRLu80RDPtBzImL/
         cVvS+IYkr3VeTNM/msdVaWUtIqJTpbgmoY8dnAecGMrSmFRIaHms2BPxG17XI8qM/scj
         lx/nhKELnCvQDgK7EF+xCen0FYNVgQKXSzsE3Idrnsis0FInaCzvJlHSabaVNlfLMxow
         rKCajQ+0xqi1ukr70GjB6zry3zgLLYOSPGTCq/PjnnAw9QJxUwWligP7OF5XQNLqcIWc
         8p7oI5SqtQcP4FxjZ2UvN2QianT7gG7kQRz/XIQBactQCAWDJJCMCuu1Fn2O+2ZgJwA/
         GZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535830; x=1712140630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0RBjv/Mk5+1uH8zHWpw+frS6Pk+FGxJ0ixEJQeiLUE=;
        b=xS9jNt7VOIrfkiSGP4rdLwhpplbb/ya78yAkGJKzuMw6Yj5BIZX6YDwB7TJ6jtGtPu
         xzYhgeIdF1nGw/6UrkkbhS/czolngof/riPkgzpmVFKYs4UpATjNFDePqWlmuZdTlZTj
         YJTQ4gIwl/CauYuEf2QoXPU+KwsdINqwPxZaJOjTsk9Q5fNhoAWw5KVG1AgZjIZvYv+S
         ZRjbtZH1HMsXtTJUQbgCqDhb+9ea6yY8y4Z61lW6tPv899cWBKsEHMU0+5Jiv6AO4PR9
         agb/8UMEKkJ5QDNSXjQ7SbXQcuYFD18w+lDD0cImEDlIjfG32k1GUufeCB+Ddl2TJ9Zv
         1ndg==
X-Forwarded-Encrypted: i=1; AJvYcCVWOKrscGrRFxR9cwXAzKz//ii31uedLicsAEq4cSzddmiFzd3w5VXeAolI/+J/3dkKTbQkfRQDv4knavk7qhI7RAb89OJ2P16LeCP3Mg==
X-Gm-Message-State: AOJu0Yzq2MS/kYX8SVm+YaxzXRAsQ3mgm9rUjoG20YfXVeqOTFfJ1/yg
	ii2GQdwjK50lI2Bhq5wsP+/KFaokbwt0beo8Hg35Tg16VCfUH7cD4O9l8Nd2O36Cy0iYdFNGim2
	N
X-Google-Smtp-Source: AGHT+IGz4Ddt/Fv3CJl38Ww58TnJzydiHKubdfPR7I7n1Y2mpYfMpwk6w9WcDu9linEDr2LcHQ+bmQ==
X-Received: by 2002:a17:906:4552:b0:a4e:ca2:f597 with SMTP id s18-20020a170906455200b00a4e0ca2f597mr141687ejq.30.1711535829275;
        Wed, 27 Mar 2024 03:37:09 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id d12-20020a50fe8c000000b0056a033fa007sm5109218edt.64.2024.03.27.03.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 03:37:08 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:37:07 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
Message-ID: <ZgP209t7IhdhcZIr@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
 <d213f262-ba0e-4cf8-af0e-66745ffea429@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d213f262-ba0e-4cf8-af0e-66745ffea429@linaro.org>

On 24-03-27 10:23:51, Krzysztof Kozlowski wrote:
> On 26/03/2024 17:28, Abel Vesa wrote:
> > This RFC prepares for and adds support for 2 buses, which is supported
> > in HW starting with version 7. Until now, none of the currently
> > supported platforms in upstream have used the second bus. The X1E80100
> > platform, on the other hand, needs the second bus for the USB2.0 to work
> > as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
> > all found on the second bus.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v6:
> > - Changed the compatible to platform specific (X1E80100) along with the
> >   schema. Fixed the spmi buses unit addresses and added the empty ranges
> 
> Why resending after few days? And why without reviews?
> 

If you are referring to the initial v6 patchset, it was sent more than a
month ago.

https://lore.kernel.org/all/20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org/

> Best regards,
> Krzysztof
> 

