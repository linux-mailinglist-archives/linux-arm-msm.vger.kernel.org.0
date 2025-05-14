Return-Path: <linux-arm-msm+bounces-57874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D6AB716F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1306F7AEAB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B008163;
	Wed, 14 May 2025 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqhde4ps"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56971C701A
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240355; cv=none; b=LEnudI/kfveCq4qyUd1C007U7qrRLRQLeYdDmkbTxwV+H9ziszIfKkna4cO1l4S8cGdLYJcDQnYuXeXatPFOkf2Y46HtSqOeI44IPqUmabsywRQq/iUBfGnAPfNx6j2BbckNtVveVj7Eq67DAPDnKYe+ZKyHhHRQuqkGsDLrwnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240355; c=relaxed/simple;
	bh=1N3x/GOevNWDg5nrpVSNIB9tY1j6A1Mn0q58cHpD7mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SVAKC7mum8JybSeNAXsHTCKhPUFxjAMXukxMxlZPVLpuF+XOM+kYkxCElErJWiN2Rn4Kqn762+G33lMxQTANzZb7ZsV3iZuuegrNAPbKEFfXpmpR5ZIsl3dtu5+xQe3KkN+YsShoDAD650YVEyQDgeFLMVJkcjQTlBukYpquHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rqhde4ps; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a20257c815so4061383f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240348; x=1747845148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=rqhde4psltSUx2l8eaFvCu2ZVjXeYPey8dGdXcQdBicQpeJe0yu+45FcLdYAY7Pm9H
         3CVpRola86z0/ipJ/5U/udmaIV5/77PzJF0mayxBNyfRkdM+MpOq+oRwFAGcmhNXl0Ee
         Yu+5h1RwYmbA2qOH611lBXLYO9/4eF5hT6OqGR9fWNo3DF3hFHvXpecrUepqWFxy8XJg
         HAgR+HHR9K6exqel9eaSRtyYAXImzz1PHY+9r/pXf5RMF+zls4xj5tUbP+wxCF6mPokn
         FumGX/CWW0dttd/PxMr3J7hxKCN1w3eeSdRWLLfFFUROgs6CbUHcj8Hm059VsUlSwo/Z
         aK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240348; x=1747845148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=ly6xgTwdbAEItK3hTGP2P7lUg5YO9QN8zn6EE8DZJ81CDXY+LhXlhFCPdAH9TbqInf
         ct2ilHYM5lu7R3Ugk/4loPvq6mVi2QI1k17kk4AO1tKpJPeSMjbVJ5xoF6L0rcD2gR9h
         RT8Iu27XvuvG3V6vG4FwZSPD99wq8pKecDs5EkhKdtWbZ7yJ6naG0Bgi53REoT3yN7qq
         hdLbD1SMTk9CF68i6Qmi3S5oQbPAt+9g44TwSxtEJhkuUVbFWEpa41RFDOyWk0vbOlqp
         9c2YXA7oIpQN+w4xiePpqdh5ZXhMkyjw5E7AWh7T065W5CRLfZm2QRCc69jFdQ6ba2W7
         RiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtL4KrdKh5z8DTBsg7bbKsAQxy790RLmz+6lb0qC8x73Yh6rG0Yz2yemdN0orvVKvAgOyMg6Qcz7/mPTTo@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7ZXN2Xf1HXgkjXmHbtYpYq57564log6miesciWiIN4EF4emS
	6YlFC9TNmDscw4TLMmPdceSRTaCFUftO/EueXV6aumsT7wfyIWtXk7vCMvSaXw==
X-Gm-Gg: ASbGncud2cBfWvxcyuLnYJ6z2JtXlk3wEpp+k9p5MeOwHXPNTAUDlYgCqMglhRNbiyf
	vuVT+/pvKoToJvicvVYfIxFmnnXeBPSi7uTPeuvIL17gJyErY7bP0RQNPCEDWLWeK5AMWC6rxaY
	iiw8Dhv+s3QB7ykQbk7Fv+zZQ+qbiNnRy+ceiRTQGJ0Vw9gGX1uKPKO/tm52R/P6zWsP7uqgIQO
	sdu1j2TCZw3jAEA0jULnFd32zgD7b7iIBlRHeSOCO4TeJM8yT6OdMAPUHxGt8yUu5bTKazaTSOo
	fqF7YfhRiYDTHtR0K8KQjLsI/PhvSSMQlK2/vGsIoD6T47FxfwZ56ZVo22WM3kByeEgftjW5cfs
	PwSn9Zr7tqZmp5b8Gc+/25nGdJe01CBjF7tWEAslGT5NE
X-Google-Smtp-Source: AGHT+IFn3vXnS6jxMSTKpvWwf0YAtvDrlGdswD18OpUum5KMQooxsvMQxaV39lTehJR9+Ij2bnRE1g==
X-Received: by 2002:a05:6000:4205:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a3496900a9mr3428305f8f.7.1747240348003;
        Wed, 14 May 2025 09:32:28 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm37650875e9.2.2025.05.14.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:32:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dingwei@marvell.com,
	cassel@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/5] PCI: Add support for resetting the slots in a platform specific way
Date: Wed, 14 May 2025 17:32:23 +0100
Message-ID: <174724032611.26337.10095399338390897616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 12:40:29 +0530, Manivannan Sadhasivam wrote:
> Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
> subordinate devices by invoking bridge control reset and FLR. But in some
> cases like AER Fatal error, it might be necessary to reset the slots using the
> PCI host bridge drivers in a platform specific way (as indicated by the TODO in
> the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
> link won't be recovered successfully.
> 
> [...]

Applied, thanks!

[1/5] PCI/ERR: Remove misleading TODO regarding kernel panic
      commit: 0b56264b66b695aa76115ae68c1365dff80814e0
[2/5] PCI/ERR: Add support for resetting the slots in a platform specific way
      commit: e2889025d83fb38faac80d976f1789af3320ecb2
[3/5] PCI: host-common: Make the driver as a common library for host controller drivers
      commit: a811ffd43754dfcaccff497de1d8ee0bd30f8f2f
[4/5] PCI: host-common: Add link down handling for host bridges
      commit: f24509b96c33c1bdd9cc57bc4f8a58391e846c8c
[5/5] PCI: qcom: Add support for resetting the slot due to link down event
      commit: 40eba89968afc15302fa5aaef207fd9ccaf1ecb2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

