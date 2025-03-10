Return-Path: <linux-arm-msm+bounces-50845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7AEA596DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD100169841
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA82322A807;
	Mon, 10 Mar 2025 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFi+vrQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E105F229B0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741615159; cv=none; b=HPabF2uuekI6IDo7LWg9CawqK6msYi/AaSL0FSDdF+WzC9hdIwDOo8lTh+jKz2pgbrrVG0sxm+L1KFmepPhaxY1Ecaqs03ZwjBD30BOQXE7OMOipnkOKXT7K8fta2ujsQG6ZY48xWFxorYl2NhVqIhIPqopp76vSPL+ISXmM5lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741615159; c=relaxed/simple;
	bh=syyxOaEHK6qGzYm1I/AmZ2tNzmZiQDHijlwgzKigXfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sf5FdC1eWBbtkW+5aELh9ui3qQd0J9DQrTlfugGcyoPnkWXtLjiTVlL8ID4n/Gw3x4fD4CRYjXT51FM7dXpg3p/Jk/zJy2GXDlgcjKXDPQuCVuqDlc8zvx3ubw1zaK3dpOgSYSEoFpO0AkROs3zh9PKHIYFhkZ3FekL3h0tU5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFi+vrQ5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso10060375e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741615156; x=1742219956; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ppfwn2QQfECUfr6VWbo/Er8VHdHAsKrXKFLiNhCsl+4=;
        b=UFi+vrQ56vCYm6LL36CYxOObDLqY/uRCfsXVWn+xtiq16oh4VTupXZTOs1tsv7NC0t
         B5mHyu0pgfaAryDaceG1yFayV9+wMUb03IL8bzW0hXpqyT+26t6jbqaCMWsV16X4Uw7V
         EkqwbGlMCi4qVcUGHabb87Hw8FltiACPkrMeclscew7QDT/o4ZswBd5diAgnY3NA6ulD
         UpgbG1KlHA4DUHLfyqSkVobq2kIJd0QGIzzvj65rNXmu98Qu5kCjp5ZHA7/kUOaIbcaE
         Eb52YxDjW8hdPCarnmfUyIsVaW8ipqsdi11vHrQoisaqCg0E9DMbMY9EHzUqBG+E9QJM
         H94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741615156; x=1742219956;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ppfwn2QQfECUfr6VWbo/Er8VHdHAsKrXKFLiNhCsl+4=;
        b=LdAOljErVxLtIhPhTsDe2C6YKecf2JZkNRBqv8DfbO8Zo8gSNjtfYTnrY4KasyERpe
         dga+ZJgxlO5uQcTkpJKDGdYkc9F9TqhKvwOWE/sqdhUXN+ikyhb6hUorz1Aca9HnX+4s
         KU/P+SPkDBZGX1npn0Im4B9J9na2NohjcsfjfVT6JBefiBCKHRfSrHYcLd6dQ87rLQ2R
         6AGi+0I6cjL1EXtxWYarM3JBz8NiegwLjgrbJDiWs8ZSRWQ6wvaQIXTed/ZUvFKjeSvj
         kV+Hru8oIpbWkIIbo4b4HtgM0Iq+XGfXEUBVGf06rlBiAV3/zj+wj30Pt1rp7xIZ/MOx
         f3zA==
X-Gm-Message-State: AOJu0YxPGyJpDqJJEnzLowguQFDr7NsM34d+UytVUBSXoOt7Kzju03ZZ
	/xgeDr1Y1Td2e2nnCm5+44NIrO1Ck75vkKgtleMkW2LakpOTQ1OJAhFVsa3ZGSc=
X-Gm-Gg: ASbGncs1YhBMRwaO4eUWpt7C3MMe1RcYHCGvQ0HGPhxDySRG2ne2V8V+4gBHuf/9gZM
	7cIHlUIAr/r/PUh3iKLUNliEuan5zDeK082UC5aRNrat/BQvnKQ1gm7ZkMj0ikOa0mIOB74X8XW
	Zn4uSuk0MjFMM6SE9xteEKqDqY++j9I5MJn5AocCnInrcG9I/3kGBdXbr8o47F6yW+BRcwKfgKm
	9+v8Y7HaNJnkGI9EsY7z1IVA3/iwIYqRc4bL3Biw8iWEG7FxvwPg8KgatZj2ENQuZottYweM6pA
	d7nwTvXrVAMLM0w+NuKa94ZHytMZSHWNYNCfegpbjnIm6UaRjg==
X-Google-Smtp-Source: AGHT+IHhlPge1QdiXNWDLFdy1b+GATvLkusfheev4kJ9+6b7/X0g+edMS2rZmPk8kSvKobX3NbWCJA==
X-Received: by 2002:a05:600c:4f0c:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ceeeeb95amr31294145e9.24.1741615156074;
        Mon, 10 Mar 2025 06:59:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8c28f5sm145821965e9.9.2025.03.10.06.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:59:15 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:59:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/a6xx: Introduce GMU wrapper support
Message-ID: <7129575c-28ce-48be-9c4d-201f8d6741fb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konrad Dybcio,

Commit 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
from Jun 16, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1844 a6xx_gmu_wrapper_init()
	warn: 'gmu->cxpd' can also be NULL

drivers/gpu/drm/msm/adreno/a6xx_gmu.c
    1790 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
    1791 {
    1792         struct platform_device *pdev = of_find_device_by_node(node);
    1793         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
    1794         int ret;
    1795 
    1796         if (!pdev)
    1797                 return -ENODEV;
    1798 
    1799         gmu->dev = &pdev->dev;
    1800 
    1801         ret = of_dma_configure(gmu->dev, node, true);
    1802         if (ret)
    1803                 return ret;
    1804 
    1805         pm_runtime_enable(gmu->dev);
    1806 
    1807         /* Mark legacy for manual SPTPRAC control */
    1808         gmu->legacy = true;
    1809 
    1810         /* Map the GMU registers */
    1811         gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
    1812         if (IS_ERR(gmu->mmio)) {
    1813                 ret = PTR_ERR(gmu->mmio);
    1814                 goto err_mmio;
    1815         }
    1816 
    1817         gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");

dev_pm_domain_attach_by_name() sure seemse like it can return NULL.

    1818         if (IS_ERR(gmu->cxpd)) {
    1819                 ret = PTR_ERR(gmu->cxpd);
    1820                 goto err_mmio;
    1821         }
    1822 
    1823         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {

If it did then device_link_add() then this would fail

    1824                 ret = -ENODEV;
    1825                 goto detach_cxpd;
    1826         }
    1827 
    1828         init_completion(&gmu->pd_gate);
    1829         complete_all(&gmu->pd_gate);
    1830         gmu->pd_nb.notifier_call = cxpd_notifier_cb;
    1831 
    1832         /* Get a link to the GX power domain to reset the GPU */
    1833         gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
    1834         if (IS_ERR(gmu->gxpd)) {
    1835                 ret = PTR_ERR(gmu->gxpd);
    1836                 goto err_mmio;
    1837         }
    1838 
    1839         gmu->initialized = true;
    1840 
    1841         return 0;
    1842 
    1843 detach_cxpd:
--> 1844         dev_pm_domain_detach(gmu->cxpd, false);
                                      ^^^^^^^^^
And this would crash.

    1845 
    1846 err_mmio:
    1847         iounmap(gmu->mmio);
    1848 
    1849         /* Drop reference taken in of_find_device_by_node */
    1850         put_device(gmu->dev);
    1851 
    1852         return ret;
    1853 }

regards,
dan carpenter

