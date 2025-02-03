Return-Path: <linux-arm-msm+bounces-46747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD2A25ABA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D14D618819C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE91204C3D;
	Mon,  3 Feb 2025 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEQDNj5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645B204C06;
	Mon,  3 Feb 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588926; cv=none; b=iEzA9kTLgSyYzMer6f3rt5yL8w6wywvohM3e58HGqAtg8wwnGeL64daVabu7DAOirzb/uwmTkh40VwAJYMjU8qBXriDuHU2+hqjSHrBI69BYtTikWXEVyXcQdiXzHwRXWmEDY9ns2Yg7ZXnuXjz9zn4XSkcuzeSSTdTr488wZLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588926; c=relaxed/simple;
	bh=NuqqQyHfFGF1hnhhM8hscJiABk2U4z0F25oUREhkTK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dOf8+cl7Mf/kgkUC0pzwbwpD/dxe+VKL8rl9an9Ti1WthKiYyyM3WLYJ5FYtQoLUGzehQLzC9ODp8FVcxM8NdIgphu8IWGPVHhZjrfyBIzdBydRfebb0Fdx2jGq6vtJrVHZ8NASc5T107P/MyCKwT08hvxKDp+0DCHhjKRhCBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEQDNj5f; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so44300885e9.1;
        Mon, 03 Feb 2025 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588922; x=1739193722; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NuqqQyHfFGF1hnhhM8hscJiABk2U4z0F25oUREhkTK0=;
        b=OEQDNj5fy159O68qFtk0hxFD+iAWPd5eMPqiDur/7DtzaF2OmfRWboMzs2S7JTz5HE
         vHWj5YZQXHQBWEGYQsBGSh+c2PAt0YYCrAQLDQgcZrrqtM4O8fooWGxyeeTEzpspmoge
         G9SIRjOinT7CdanVMrFb+wkvVKWzVwxl3STUNnyjxKyfXkmOuZ1uJFyGOuzBKegpENcx
         j6pTKPuagTvQKb/WTapV61R9hRwHYQTq5+ueA6mu7lrEMHV3qqZ+eKrNjdLYFxc9pMTH
         lAt37kGO4iLruylgSB7+gSxQjyP5eS1E5dlgFd/PQ9qkWyqcxEnNglFdvxrq09r8Gnga
         pbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588922; x=1739193722;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuqqQyHfFGF1hnhhM8hscJiABk2U4z0F25oUREhkTK0=;
        b=CskSkOmrgEvOTQ6pggpSg3bV4NbrzBAiMVaShq7+z79NgM56tk6YsrYWRwsym4BQOl
         skSVt8NBbVZFd7SmHsa49ohfJIE359LzrX9UD9zJlB3A7+QsomIZ0Baub90zLTqCpsJI
         zEEfK3kJZpw9N3GtInj0wqmdPDqj6ZFMS5+Axsxy51uq1mi/o+EcCI4Ziaq68h4Syh2z
         j14PdpmyEiWoxW0WeyjC5Bq7ct9ltIwO9fMhj/Uc4W83j3juN39648/wTHQyHjmHuo17
         CLnlZB3dlwo+GncAoUYWMfF8iW2Nn0DTstllglpc8uf31png4+RxNGkdqGln97Ur4G7/
         tHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbaU26YKluPqdvA0KgxODGyQZ/tbb5GLOQIL+qrr8sxISODYBpXnJ8YyUEyyD5YrvxN2ZBSncdj5MkyvY=@vger.kernel.org, AJvYcCVWkuc9iAbWuPth4V0/z+zIoCn4pmepQEPWuW/cGjoMs5RrbkoQra2OQdVM35+gQn0LQLj0BWB7zVaOYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsonZioWIF2clPYJPVNb9tjs8IKixusp5qv56GJYlZ4+EQ5eYC
	zd+/xn6JuSIqzCu9AGQH3Hpu//uiZF1RoIdY1AjEpwgplsCbBAf9
X-Gm-Gg: ASbGnctF5Sgeb3hECR4M9IURthghiUZoFmjO95p4XpsngI2fJ3H12aKKL/cLrM7/om9
	aYQTFblp13LnERyAIaBGtC8CyF0c8iAxfwMETuGhangIjoQhxuKDvThG60mSTYG3q9kCk0XJPFG
	lFoS5dupfZdzgj9aJu1ByFjcv4PnyaDEOiydld3UXlxklLChvykzNBGogBKfWDU6m91IrdiN43d
	4iFdeWZr9BMcqjPjgSILIogImUAKenjyTOXRD1jj++3jQllbj50RBnDeMyzCmTkeQpDhVmNl6pE
	evjLz06ShrgDIkAcug==
X-Google-Smtp-Source: AGHT+IEJPEowxycx9DAnaDaZhWHphmjMmX0zz+Mt0tMvxSHPPfnIEvt8NuHmqHb2F1fxGnRr2wQvQQ==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38c5194da70mr17191751f8f.10.1738588922422;
        Mon, 03 Feb 2025 05:22:02 -0800 (PST)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d4456sm158215415e9.7.2025.02.03.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:22:01 -0800 (PST)
Message-ID: <a6e95e276bdb8f2e217281361734cb044311c416.camel@gmail.com>
Subject: Re: [PATCH v3 4/8] scsi: ufs: qcom: Implement the
 freq_to_gear_speed() vop
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Mon, 03 Feb 2025 14:22:00 +0100
In-Reply-To: <20250203081109.1614395-5-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
	 <20250203081109.1614395-5-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-02-03 at 16:11 +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
>=20
> Implement the freq_to_gear_speed() vop to map the unipro core clock
> frequency to the corresponding maximum supported gear speed.
>=20
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

