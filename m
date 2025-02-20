Return-Path: <linux-arm-msm+bounces-48725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0949A3DF66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 072DA19C5E32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3239320485D;
	Thu, 20 Feb 2025 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taqvxzDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8621F9ED2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066646; cv=none; b=mvMayAeoiWe27ZGRelxGvBPl5aFiTvARlyHtHYC09sHXPMtgU8E0uCVSsxo/jrANj60PW5vmKO/Qcl1reNKI7XYfU7j+NApXYfQFeyXXQp+VwM2KJX3ioHWvJwErjavlyLsPBnzb6EuFEBkuWKbU16vI7YXYNwARw39XRFXEzZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066646; c=relaxed/simple;
	bh=ieiaw5OY+W9wjSsfmsFhHkkrsbAtEYxkH/L30OdT2RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCyvMMBH8hW7i7jeAnsnzcpOW40biUY80c0KtKGVhPUMhGsBSUnD4Kq7CKJ2JAF2a7KBjTE0MxNMu1xqWfEKU3D8r79Xz/zmQ+YPpLaAhyqrj/cb2tyGfU7t9VPVXQvGIugZmJ/AESjulr6Ykh2dj+60xVKWTisRoM3j4BA2+BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taqvxzDf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30737db1aa9so10532271fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066641; x=1740671441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VJw+h4hQVN4nQ/xzWE1GpPEBFqaeNGDtLbmaQLEVPk0=;
        b=taqvxzDflrbPpXDQ75Y89R/TPR58JLQgAeQ0JDj3Jrhzjpo7FI8RMhTaIw8UP7ejCJ
         zC/rQEWW58o4v0GlLqGFIk4+9wUhlBtta/QgZ/sevkpxLg20q/GWZpVKmwaxX2WDGKP1
         luTi7zXtdbNIPQE/hUFKy1SItGQ8NSlzZacHXmoH2XLqT3azeJVx2YzIJXTgRcIHB0ur
         O+7i4pioOsuEycVOVRXeilKhw3T/3M7ejADzj5dYWGpwCsDLuxeyFGoutZXJ9dlnDlee
         3qpEWtQ16LoqJm8x1flGLcHww4n9zqVc2OfRe28/j1DZxZpZvDwmmV0I0jVIrOKb9bX7
         5UvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066641; x=1740671441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJw+h4hQVN4nQ/xzWE1GpPEBFqaeNGDtLbmaQLEVPk0=;
        b=lW6RrLH14glurjBQA52xFkgi7HOPDDbf10hFczO3GPyAQ7U98GIe0+JVsFegpZ54xw
         NOHPfWCyOgFyNp69YR85zEqExGjyjAsqbaaRfL4oVJ/BaqjoGeXkVUSBeKT2D6/0iWhE
         pLx7r47GcTOMPtZFKfQi9IsAh/jHrcS8gpjpjo7KAXKHz0I0FbOq+Ul35fyWSLKh0MIL
         AYxGrum0w3orP1ThLuWZsiACBnQZMZYmnzAWcaSKpjbf/zBc9LSr7nYD2gHxq5bkw14i
         t8vwQKrZx3qP7TN5k5Uj7molJD2U7BkucAB1DLMhzSvUfvOZDr7bI9vODl4KrMJ0h65g
         70Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWsQq6at2iIR45YXZZKNWMEwBWaMrcsgsC44G5/hCe/+PT+JM/0uSLDqLzXga/voBhzwghiUP8UKeRWatJK@vger.kernel.org
X-Gm-Message-State: AOJu0YzcoC+cFDixlFktZt+EHUXGqQ2H+jm+DUt52F3i+ORCuKQUt7kM
	I6LT536GVXimE3IQ4al76RxIXDKcKqaHFCW78bmyszZiaEjLFdTQQ5pmupJb4zo=
X-Gm-Gg: ASbGncvSBi0m1Kr3FOG/bQWF3d7C9pE+mw4W93LGU7yYUBDJ19+ki4Qg5kO4hw5xWiU
	DNqNb1PCeyRQ6f2PjERao7L0NkOQLbspqhlgFGZMIc6um0DxBpAcLojAuMR+QB3vJg1GQ/QcIDx
	+NQ2QAbL2hbqzYJqkqFTuqV0Rr+V8rp1pcA8jVr/x4yjytLaLnvdvk7GClMbx+juZVRa3Wo5Kwh
	cngD/Ul0bK0MdP/PspI5NpiwRkeVdUAk35LqJBg+TG4dSoifxO3fNoKn/Qox4sg+zHqJIPTOTLh
	KcHHsGd1hZZlutPwDGgC9Kisvu3P2sGj3B7rEz5/P61y19++g70QucnlRM8SPvsiDK2Ooyk=
X-Google-Smtp-Source: AGHT+IG96cDdlQ5ip9buGSbrayjmMs6tRL76tsdQABR/QmoJLFuyfSuDIZStdfBwmD72ax+ik4u3IQ==
X-Received: by 2002:a2e:99d7:0:b0:309:214a:6b16 with SMTP id 38308e7fff4ca-30a44ed34bcmr25621661fa.22.1740066641455;
        Thu, 20 Feb 2025 07:50:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a28000328sm15763861fa.66.2025.02.20.07.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:50:41 -0800 (PST)
Date: Thu, 20 Feb 2025 17:50:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: core: verify cell's raw_len
Message-ID: <scmsm6wsgspieamsjqftjfdswfmfh5cemiebb6k66qzetdovy5@oa677gskzst4>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org>
 <Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk>
 <CAA8EJpp-mE2w_c3K08+8AR3Mn1r8X58FRXvAUFALQ-u2ppoKgw@mail.gmail.com>
 <Z7c5niuwR3TVTQrj@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7c5niuwR3TVTQrj@finisterre.sirena.org.uk>

On Thu, Feb 20, 2025 at 02:18:06PM +0000, Mark Brown wrote:
> On Wed, Feb 19, 2025 at 05:14:43PM +0200, Dmitry Baryshkov wrote:
> > On Wed, 19 Feb 2025 at 16:51, Mark Brown <broonie@kernel.org> wrote:
> > > On Thu, Jan 09, 2025 at 06:35:46AM +0200, Dmitry Baryshkov wrote:
> 
> > > > Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
> > > > Otherwise drivers might face incomplete read while accessing the last
> > > > part of the NVMEM cell.
> 
> > > I'm seeing a bunch of failures on i.MX platforms in -next which bisect
> > > to this patch.  For example on the i.MX6q based UDOOq various things
> > > including the ethernet fail to come up due to the efuse not appearing:
> 
> > > [    1.735264] nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem word size 4
> > > [    1.735289] imx_ocotp 21bc000.efuse: probe with driver imx_ocotp failed with error -22
> 
> > This looks like an error on the i.MX platforms. The raw_len must be
> > aligned to word size. I think the easiest fix is to implement the
> > .fixup_dt_cell_info() callback like I did for the qfprom driver.
> 
> That sounds pluasible, but as things stand we've got a regression on
> these platforms - taking out ethernet breaks NFS boot apart from
> anything else.  I'd also be a bit concerned that there might be other
> users with issues, does this need an audit of users before trying to
> enforce this requirement?

A quick grep shows that there are enough drivers using word size greater
than 1. Would you mind checking if the following patch fixes an issue
for you? (Note, compile-tested only.)

From 2bde6ec5c9e74771f29170cfa11623208266880b Mon Sep 17 00:00:00 2001
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 17:43:54 +0200
Subject: [PATCH] nvmem: make the misaligned raw_len non-fatal

The commit 11ccaa312111 ("nvmem: core: verify cell's raw_len") enforced
the raw read len being aligned to the NVMEM's word_size. However this
change broke some of the platforms, because those used misaligned
reads. Make this error non-fatal for the drivers that didn't specify
raw_len directly and just increase the raw_len making it aligned.

Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/nvmem/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b6f8544fd966..e206efc29a00 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -612,7 +612,11 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 			"cell %s raw len %zd unaligned to nvmem word size %d\n",
 			cell->name ?: "<unknown>", cell->raw_len,
 			nvmem->word_size);
-		return -EINVAL;
+
+		if (info->raw_len)
+			return -EINVAL;
+
+		cell->raw_len = ALIGN(cell->raw_len, nvmem->word_size);
 	}
 
 	return 0;
-- 
2.39.5



-- 
With best wishes
Dmitry

