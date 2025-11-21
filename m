Return-Path: <linux-arm-msm+bounces-82784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581FC77FB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 136E72D0B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 08:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A149F2F0C7E;
	Fri, 21 Nov 2025 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lycoaMIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9229333B95A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714896; cv=none; b=fP1Ts+3HizK+5X0VKTK9Agluwt6yVyQ+wwGN625QV3+UG05xSUvWg3gCG5n5oGnAA0F0mF9+aLQ/PRr6ZcsbNICqWnnn8lWUsVO4PCvv2IhPBGjIcakjhfF9WpoLeoUl8gM4qAQUgOCFh5HvtCJiziPiKvas13LQyySuvQ6oX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714896; c=relaxed/simple;
	bh=KJChgOdRHFY+BFUlU/Zyi/qit1Aik0GF23ssqo1LXdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kj5HzQx8VW839KMRqaqyTqLnZtn+m9C+m72mv0ztLspN68Hxa/kTVN2sasGvLjtF1sa+pzBc7Z91qOhknoDC2PH+nPFELmp6swhW9IyFaV1jVzgcL/HIWvyaFYf8RLx8JvGLkWtorOKu4EZ4YjEMHRPr0L27GDc1CcxePEMNhjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lycoaMIL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso12525495e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 00:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763714893; x=1764319693; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfbcQZoQRYkfoUJ8z6q2svw/TAJ7WHV3dN7Lfo38Yh4=;
        b=lycoaMILHirnjJYIvDv69y2FGDBJDaoRztlGKFTjRi16rwDEX6c1OZ+Z3chW4xnCsg
         MGPQ0LG6h52zLS+QxgXzvfBUPjv3VatgGXCF8vfScyUJdcXBGSaGMnDzcjKU5ADRl/HJ
         YSiERuEIRDfTStgXb7Ocz9qtCsND8UBIGbWpyOMpw3gzeV6uZ6sG9OlFXb5v+bJvBp9I
         jC/jEUzMqnlFxkRuOnsCcVTvwjTCdmCVFPG712wgR/kUqiCeS2PlZcAmjuscfkSJurKo
         aElG6g5WZ5sI9e/nh7hkxhbeFkv+YZY0Ld5MfvBKfSuEA1ix8HhxwaLsov4rs9zkBzeb
         oJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714893; x=1764319693;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfbcQZoQRYkfoUJ8z6q2svw/TAJ7WHV3dN7Lfo38Yh4=;
        b=onF3r5q4AzO71FoK+L2ym05P90muOjnihE08NjryBWXivPSdaym1BOuXH+5q2hLn8I
         4LV6qwcz6pfAyTfPJ2h33By5YjwonAZWLG9cKtS/394wRnPdjZuMu0GvtkSDqMdBsEvf
         T3D1srIrjtumMlIzZjrD6GIX3KMz5hEY9/V9UAdNlkWbsxI0Ud2jGVkW9TgomR6pw849
         CGKekHRAuxmhsOPWfCyYJEJy49re56NKZI1KLLiqJ4I/14OLCvPPumW9Tcx4DV1DD7OT
         8xzgbQQ30O/0mGHLmH0WV1kSmlORd0pzuSG25DDIGQg02S8txCGtQq00TZrTHRKmkQ0h
         9hJQ==
X-Gm-Message-State: AOJu0YxQDaeWkIphZnVfIDwMPyiDdiNqV+J3jskTlH61cylgyvnfEm1C
	MlF25QOmB/4hNpZQ8snzph96ll31FkIA3ihu8lq1bxMpA9GVlF832SB9CwmGt8tl2Z9THdPiK6c
	oOS7G
X-Gm-Gg: ASbGncujcTe7lHM0jwjf3IQMLNwBe6LqnPoL7oN0skv4IZ0XvxQAaw3PFC3fWlDjZzj
	Otlso5pOim3LxzG+XTnDcdFrrtHUENi45ESPYwNo5PqRmSYjP//wVHs9HtW+0rNOUQvOXvg9RLG
	ceaRaQZ1+TpISoAlpdie5ORq9+ky9THzSVQTNBsiBcMU1weD2GTzCEAzOBtVN3vyZ82BUBc1PbW
	ZSa/mAZ1vYbD2OS/d5wN8nDOMcAYoFfzTg/XWJvbw/UaN8rCciGn/hDJWVNfk00dRFGlg7RBvR/
	G6r73IIB/w+dytpidVAkDdI5Hp829rvBNXFEaVqBt3axpdU7HC/IYatldETJMP/bdmIvsFPk7Un
	nTPpyhkh/DI7Vb06ZADY+24+N//sIliRsvaiEjJDpFs+jOJEWF93uaENJtBYAu2WZueYaQn9UFh
	0YbPTnOcG3qW+Cx3soqwKjvN5UD34=
X-Google-Smtp-Source: AGHT+IF3Uu6ea1OKHElnWjTu2CAsUv64WoAcUD8e/huE7EXd9QW83OzoNmfBG+KYBdVEE2Piu/LT2Q==
X-Received: by 2002:a05:600c:4588:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-477c0165d5bmr12705125e9.5.1763714891827;
        Fri, 21 Nov 2025 00:48:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f3635bsm9950114f8f.17.2025.11.21.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:48:11 -0800 (PST)
Date: Fri, 21 Nov 2025 11:48:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: [bug report] soc: qcom: smem: better track SMEM uninitialized state
Message-ID: <aSAnR3ECa04CoPqp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Christian Marangi,

Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM
uninitialized state") from Oct 31, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/soc/qcom/smem.c:519 qcom_smem_alloc()
	warn: '__smem' can also be NULL

drivers/soc/qcom/smem.c
    509 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
    510 {
    511         struct smem_partition *part;
    512         unsigned long flags;
    513         int ret;
    514 
    515         if (IS_ERR(__smem))
    516                 return PTR_ERR(__smem);

We recently changed this from being NULL at the start to being -EPROBE_DEFER
but the qcom_smem_remove() function still sets it to NULL and the
qcom_smem_is_available() still expects it to be NULL at the start so it
needs to be updated as well.

    517 
    518         if (item < SMEM_ITEM_LAST_FIXED) {
--> 519                 dev_err(__smem->dev,
    520                         "Rejecting allocation of static entry %d\n", item);
    521                 return -EINVAL;
    522         }

regards,
dan carpenter

