Return-Path: <linux-arm-msm+bounces-13536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08110874086
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85279B23871
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D3A14036A;
	Wed,  6 Mar 2024 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F1tGa4ED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003113F00C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709753790; cv=none; b=IETz6VZqW7PhDdbilvHhdZU05SiDjc2JTSAObaaJwXVyhfcU09X2qD/efuypknLBtvKvNTQaMnhw26g/XthwIOJMRN1HE8aqFN+vYH6dFBdVMD89k8SykqZiCpbHRrWn9KBL8YVid0IoviKpPIEFTBVejD6NRNFrRvawtos1jPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709753790; c=relaxed/simple;
	bh=+zTZOJtQWczRW+rBcixwiA92LQfEpVnVOO+7OkSa9js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWa+G5aDY3H9OoBtB312hdO6TMVBBF0btLoeOG8m7MNbfdebzpdzYbxnTJ8KjR4NpGMUaCJi4+FEViSakaBzrg5HJe64oc4UtiVBp56JrexJXThgSe2d6wO14RZzJN3iIyJUCs82Z6Bwns7ZvNfcLireEQgp/YOXlUJRZ05ZtwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F1tGa4ED; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso27122276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709753787; x=1710358587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+zTZOJtQWczRW+rBcixwiA92LQfEpVnVOO+7OkSa9js=;
        b=F1tGa4ED6cbESmy24b2VRLh1mmdZ/OsV9rcA63m3HQ49ao8mcQO/p950BbtnYuIZKP
         UXGCRlqKU6nH6D3GWHEvWlvV/TAh2+Ddz47iAlciDo3uMEbvnX32vZr0ufxeNJTaJDq0
         r8qCFNNm2EKZbY8GdOyIdDLSYm882OzLMPFm15hBjQ60vtSqayZs4grx8uZzNjaQ2+iS
         NXSk94xazWNp7lCNkx48oIFwmmD/c+87aBGngI2+4CN9OaGRAWU41KrhKZvdItma9o/v
         z7MUJMPD80NrwcU7FPvY9zXMOqWS/yEbK923gm3Q1RO4UVNk4pFJhvz130CkjVwxNvYV
         Tgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709753787; x=1710358587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zTZOJtQWczRW+rBcixwiA92LQfEpVnVOO+7OkSa9js=;
        b=A9r/ydJOV310ugASQMUrEHyzFkIEJGmnMOvR688hDrdom/BwMYwKLA0zLTVUVg2dOs
         Vv9dBnS/qMIYa89zhv2b+wAoTvu4raVJfQ0PTWzFFayAMyXFVub70xfbumbzTPRS2OZY
         jWYZ5KEwuq+OEW/0Vmo8BQFeqVz+iiV6BRuSoMMyMdU4yM/GF1sLxhE7GsjZ/umLC33W
         kUuAXMnfnC4OXizIZj3c7efkZQWjAOLCwRNEOSDJaI+I7auqfjGEh/bfC9GJyvR+9nYt
         3xNkCVWANyBVgs1tlgPnoBBAtPwCG549bRqPl3gp/Nm34j11ObALx0bYh51OibBCc2ui
         Njzw==
X-Forwarded-Encrypted: i=1; AJvYcCX1iHTAPlfrBOgVZkCi7CWnrsrkiV+I9ZaxH+/X+8sj/k+oBN2S/bY0k4EBNDd5V1Fg+iU09Rz8V2MBee9p0bsx3J8vaBkviWWzWShCRw==
X-Gm-Message-State: AOJu0Yx+lpa0UPNGKvaO1qaJ9fTrgkkkOWAj6iN0LvHAyfBzIme/j3HF
	XXoriaC+zcxzVBSJ+PM+S9N1AoaAOx4cH/P6FLlfvoolXY3PDLaieIvzysmpfZKKCd4/wCdpeeW
	UHEdtkoiq+1R3AmWIrXnsi9Oi+pNm46tsWFRTgQ==
X-Google-Smtp-Source: AGHT+IE56PqzTgOCzvit2uV6IavBW/ZwGhxomF+h1LASvCEDd0BU2mz4uBztGXud69fzyK40Mo/XUedZQwcaV1pIqDM=
X-Received: by 2002:a5b:2c6:0:b0:dc7:465d:c06d with SMTP id
 h6-20020a5b02c6000000b00dc7465dc06dmr12264657ybp.28.1709753787664; Wed, 06
 Mar 2024 11:36:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpo+wLYzLNheCJKXHTZwwQO9zEnVYyGbj4gSPVVo9yoAMA@mail.gmail.com>
 <20240306154033.1290330-1-amadeus@jmu.edu.cn>
In-Reply-To: <20240306154033.1290330-1-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:36:16 +0200
Message-ID: <CAA8EJpojj=3dv+FDm1GwXQ4+DPLncaZ6_6LwWQV2T8JCFpR16g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 17:40, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi, Dmitry
> > After this patch non-PMIC IPQ6000 boardss are broken until patch3 is
> > applied. Please change the order of these patches.
>
> This is not the case, please see `opp-supported-hw = <0x2>;`.
> Also: https://github.com/torvalds/linux/blob/master/drivers/cpufreq/qcom-cpufreq-nvmem.c#L334
> This 1.5GHz Frequency only takes effect when the fuse value is `2'b1`.
> I have tested this patch on both fused 1.2GHz and 1.5GHz devices.

Then the commit message should be changed, because you are enabling
1.5 GHz only for non-IPQ6000 SoCs. This patch has no effect on
IPQ6000.

--
With best wishes
Dmitry

