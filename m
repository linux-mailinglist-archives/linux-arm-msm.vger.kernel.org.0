Return-Path: <linux-arm-msm+bounces-12487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005F862CEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44E60B214DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D591B949;
	Sun, 25 Feb 2024 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JbMcQ7Ii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0484C1B948
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894018; cv=none; b=mzPjWlNBl846qLCKxZ2hC3CBaoKRL2sMuMVSXGZ1M3NlHSeslgwVtO4pR7kJj1F03u1ySmsb6pBxMSmqd/42A5v8XmCQGmegUTlXavu/kN+iNY00IjAqbXzKkdgshnbvoxTDsErsJ6gkyqzgNk4y+e1H6Tv16AyXbCc/1zcsRdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894018; c=relaxed/simple;
	bh=sE7UpPpq14m6j1C5fjYJz6pL/gBGgixJwDk3zBLz1LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMo8ESBQkIt60ahvf0tWow7x6vUtVH7p6guWct5LuNCbPVZVdytoq4Eeh58SkuumZRDkknjb8F2ApHNNgTr/Rvp8v0Ix83yXnlXQAnjMZoM5/25Wa7Mei7qHhlJd8gfP6lNcWe9QXe7NOF9k0jbpEV+9qpM9KGZj9XWmXb2eIQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JbMcQ7Ii; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7c78573f31aso116367339f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894016; x=1709498816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fP0+4HWFw0qnQgXN16N53EqzsauNUwws4Q93UfRzHx8=;
        b=JbMcQ7Ii6vhGOHKqIk/6ZKZCvrQtQinhqyfUalCOBgLhp+xha6WiAYbgAxq2lbkjjh
         IYJqIxhKggDPDOn39oiBavH6Z2w0lmCt+Sb1ajpeAv58Rf6ihPvCSYu1nD5aRS4EfmFf
         XqLEFX6nSiDMQzAmIz5a7MNbllY3Zbhx0BPv3+ZGSc255EREFlYboJ3SbThSEOXD5yZa
         0OG7Vgd53BGzDY2oOohzvBTmNGdn3N79Ou8SqO5/55oQyfb81u70nN7oMjukG7Av220R
         aDBdFUh3fQ5W2Lde566NDygA3Iw5G3l+/sQgpeoCFTa8H/Zp7ypqk5hcSrgRaG8uE72I
         +pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894016; x=1709498816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fP0+4HWFw0qnQgXN16N53EqzsauNUwws4Q93UfRzHx8=;
        b=VWslYA6YsIhbWJ0A2Fgl9u+V4sulxau6xV/gJEfntZQzSBk+1xNZ0xpg8ZP+2G3ncB
         yIRYKhvSenOPVGKxP3k9LRcIlZBMd9QTN0UevshkZ4aJG0tYNCRiKRriCa9r4C04O+k8
         Noe9JJF9agCKL3VkqHtdZ8xjgYlLDMz78z1tlYk1uhFlweGsDXntzY5j7MjjCRJoBoQ5
         PhcAeM0DUIK4g0YBaoSWuTG+PGYZrh6lxpQ1Ge+GXBa3kkIiul3fxIYvxWiyjKO0GhJ3
         5hQz9MintQ8WG6+dhCdo8uVIZipOWL1K8f85RnhfJ09PJ87Rphf9FC7SUh/V6vp3GD0B
         7k5g==
X-Forwarded-Encrypted: i=1; AJvYcCW0Hu5ACh+mMcq1vVL31HO3v3MlUh5nI70pq4M+4BWS5UmohHqbXv7QnXgZVXfVfVkcNrk/kJyF6HCNtnONG0UG/xeJgmAyMZG/Gyi8bg==
X-Gm-Message-State: AOJu0YzM/Qlc6dxd5Pvxk7nc2A80XiPL/0E3v1k9bKNvo3EdkFVFEwm2
	Q0XAkVk7glc+R7YKHehf1QAWlgrsnccqBJ435MvkDMfYSisuB02rsNTR316M0oLF+29SR1Ii61H
	d7/Vnaw5D4201WvBj1VVd33KKvsNQLUS3S8XXmw==
X-Google-Smtp-Source: AGHT+IH30JucjSV92EMaK6FP3kuwTYaUFcc6+QVaz4blJzc7lhZK3wG5byZhUyFYLDGqCziSm3HL8i5G+2N6h2Bqk2I=
X-Received: by 2002:a05:6602:2c86:b0:7c7:97e5:48ad with SMTP id
 i6-20020a0566022c8600b007c797e548admr8177997iow.16.1708894016207; Sun, 25 Feb
 2024 12:46:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225202545.59113-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240225202545.59113-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 22:46:45 +0200
Message-ID: <CAA8EJppVN72sfz_rjn2K4Za+nBUva3KqP4RRaus3Cs3U+UZQiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: drop unused kerneldoc struct
 geni_wrapper param
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 22:25, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Drop description of non-existing 'struct geni_wrapper' member:
>
>   qcom-geni-se.c:99: warning: Excess struct member 'to_core' description in 'geni_wrapper'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

