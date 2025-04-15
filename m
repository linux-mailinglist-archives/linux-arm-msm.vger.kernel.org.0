Return-Path: <linux-arm-msm+bounces-54317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E07A8954D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9CC0176829
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 07:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD67227A138;
	Tue, 15 Apr 2025 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1FxBRCg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7E2741A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702749; cv=none; b=jrOK6z3tK00rmP9o63EanndNyZ14dUtTnlGo+iH1dhlaWiJBtO0+YR/6U2/dvSA7KQVQxoMbTfUr73JeANrFgJK7136m2TC0WA914sWxkdq0GvPDjEh8uLTLF56kxTbe6anRZnoBMRrkQw2VjGA5QeZVh/go5GUg1JpEwnoa7nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702749; c=relaxed/simple;
	bh=coA5grQd3y/jbhzcHeYZ+ZELLUFIBztOc/cGelyrWGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzndR7iQBa7O67e5H5WoVCkdMj7e4KGb99Tpf4cgyesOHOn28Hq6SBxcZXcl5a4yJe4WOCWqZP2ttzCUjNTe+mmXOerpwLLGECQoV4cDuQMcm1CZbhVLOE2FwR7zvmJtjmg2LaQ8E2QMISkWuh8VQIIFCTP9dc3Ot4BnePXjums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1FxBRCg; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227b650504fso50113765ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702747; x=1745307547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMVqxq4kdB7NkpAdRlpNvoRHAP7rIXsRI0v6UU1I0eg=;
        b=g1FxBRCgqIYkEZToU/fBsZXyjiTvjFtxCa6X/SsPMF5Zu82At0HSbXMZVdOxyIgcFM
         rYVhtlS3js4PCzWYRVTRcPc5nWvpSd3Ncz8q6pTyVgSyQF16MXJkkaNdBod4FR0Xo6Q5
         s+Z4/zkIe1G+jDuK5gi/YzKVPxBvBT6+fhrpc3Um+S2Is/U+fMyq/MixfPSLkThCSRu1
         JRo81pfPYGA0Tg/nf9Uoy4YMbsmEHSvDchfrbPRVOyRmfWLoqz8ENPBjKgXbLrR/XxdX
         B5frW+poLxDox+NXgg+EzwFFHiGFEeKPSpxPyrs3Na5/wJyujCoVU8WCSLDLclaEk0eB
         Eb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702747; x=1745307547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMVqxq4kdB7NkpAdRlpNvoRHAP7rIXsRI0v6UU1I0eg=;
        b=NRyFdlyHUppQV2YUW3FPSY18uGTX9WrFm5T39Mjxc7NXUX2EUEthKLYIrmv+c8ENcp
         +LvO5oCHdL46vujFqmHKlgyx3nck7fRFGT4rFXfrEQAf/iBQbdWmtM0swuTmE32mY8ja
         mEddXA5f+YsYqrEe3nYwQkTrI1kTrBZ2THNm9fZgHtBVFqDJ95WCxtNEj5RxlzGcOXPC
         Z1ElyiPzN4F4xudVfP57iW8PujIfwA914hJZiS9kv5yfzPBt9rYeC13D6K3yFLxqb7G0
         Fa0MaGCwkDvHeyg3ss5/QOYwy0c2v6v7MtD2vNdjBJA5wh+on7IJHsxUkZPOv7sIFJ3b
         iBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX94Jj+j80zLJGKA71Kh3C0uWndFq8smPqPFFkpfAZ5Py1Srp5ROViZJjsNI4bXJ7GOiX++OusthxoYO/72@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+5ZaxCHfkm5A4cW3UiGmcFYmhK2Uhz7+EwjuywxJQlUCJrTU
	jEI9Fiaj4Gzk0RIOLWMas6StVNa/+EyJH4C5Y33xD4EC1HXjQX0N0Y/BcW/utw==
X-Gm-Gg: ASbGncsfdCSZfZe+VKGkdZudW1gFK97T82Ubs5Tu8uPZaOczqePpkqzYmkT+7KeXS+C
	3j1+M7hSvCtCXVHUbO7LayTHTFDamGzdtVM7h5guCILzx/Y3xDCJ9ljTQJuezEkTvW9eew6wXVG
	6R84l1GttduN9jsd48/ghfZfb5ERdWuKeV+2YrkISpOnzJ7iX98dga4hm5l18RL37PjJQOo1+LT
	kJhlziV1yDh/Pnmh8ZLCZBO8iniOA69hRKXsGx8F4b6yRTQNsg3L3hUlgX+sCfl5L8Day9TysG7
	HQgPBqTBVybsE8OQejauhT8gRB2+YjvJOjN9AGA5Ddd2H69wYw==
X-Google-Smtp-Source: AGHT+IEHpiLa1qxpwWSUDM89uSChUDBqXG6QHK/dkH6ohvACOVduUY35hpQk6VZSxSq6hdZmbeAjVA==
X-Received: by 2002:a17:902:c952:b0:224:912:153 with SMTP id d9443c01a7336-22bea49590cmr237075775ad.5.1744702746719;
        Tue, 15 Apr 2025 00:39:06 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b18esm111163075ad.82.2025.04.15.00.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:39:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:09:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_mrana@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_ramkri@quicinc.com, quic_vpernami@quicinc.com
Subject: Re: [PATCH] PCI: qcom: Implement shutdown() callback
Message-ID: <tb6kkyfgpemzacfwbg45otgcrg5ltj323y6ufjy3bw3rgri7uf@vrmmtueyg7su>
References: <20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com>

On Tue, Apr 01, 2025 at 04:51:37PM +0530, Krishna Chaitanya Chundru wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> PCIe host controller drivers are supposed to properly remove the
> endpoint drivers and release the resources during host shutdown/reboot
> to avoid issues like smmu errors, NOC errors, etc.
> 
> So, stop and remove the root bus and its associated devices and release
> its resources during system shutdown to ensure a clean shutdown/reboot.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

While reposting a patch, you should include what has changed in-between in the
changelog. Even if there are no changes, you should mention that and express
your intent to get this patch merged.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

