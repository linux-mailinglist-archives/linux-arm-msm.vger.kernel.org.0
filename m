Return-Path: <linux-arm-msm+bounces-54803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E11A9431F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 13:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4231895389
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8CB1C5D7A;
	Sat, 19 Apr 2025 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epcTpPMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61593FE4
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062549; cv=none; b=A2+CVp9gZAzfBhnoxIKVGfJN4aRB7aIl4lJBHImwS943uA3mYle9yAJAKvK+EtKSYwq8zNpM/XOKdgD8ojU6K7idTkefg8VWXQI3dW+Qq3hqhDAtl/DX6P8WWHkm6oQZRpQ8elgVitgWFr2aPyLA3bj8tR3c1vjyzh/6i6kOkjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062549; c=relaxed/simple;
	bh=P9tqwhHMVnrLVHGyw0rO+0pqyRE8vhdeoUEsDHyWUwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OSmhmE9fZfjbCL3E35tOtW0Vkeb9Tq1+mf27gLiVunMAHH1qT/Na5sJOwJDAlkiAVUp3DxmLpr2RwLE2YG3VI0XKJiavA1ZYTwMQpAGlzwNNoGAErgD9VH0pQBiGeHSK6V4X+U5D4DQbMBJWG+TuFuR5vuOhI5a1W9vEaEuvfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epcTpPMC; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b98acaadso2507046b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745062547; x=1745667347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOQB0CfnACTH9btXGksImz/Bb/gsN8Vilrarvj+IkF8=;
        b=epcTpPMCecLiYLN/vvQJTDyqUw/fvGdOhoxQpnO9e259ZtiHlFzWE6+/kTwyhB8xbI
         mHYHYUjoZx4gDkxGA7cshDhto8MVCaDH7GK/Fb1mYEYVzt43EbwwgVtLHSNLQPgN//aK
         uHSnSQwgyGn0lmteiHMe0kCa9Xwm3DUAPaIAu7aL5NB3b5M3Oyt3TMT42KLchNAn6q0D
         WYXKXMQ8OWDJ2spvJ6BNuUU0wpWal6eyHLUJvB7cvbHOsv2+Ker9MupBXeT0n5PrLwA2
         lu8x2vsgD1jlDU2m+CesyCtdkT1xT22DSFE/8Nb0jxDdggAdSQ6sCNBf3phDY0WUN2Mg
         iZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062547; x=1745667347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOQB0CfnACTH9btXGksImz/Bb/gsN8Vilrarvj+IkF8=;
        b=Jmntg/CJcrp2fk8eGSssODjqlh9QGtcwBN5lfU0mDYN+yjYdtLBLbxbQzVl+eh1aqj
         Irj/hxcfbKU6B805ozXfJ8l31lMZkjN6YdTxYQhezKP54m9x0tgvRkbrW4bbfGMAsE30
         gOYQBfOwy3ZEYPr2dTtPhvaMaQ23IKDB978Db5UYxDQXWDfZcx1dlnDiQjcQ/LO+/Qdf
         OayeJX8cUsEydDAGhIPBt1RVxUunV13vM4Bbh11s+RTEXZlHU9wQp74ZnHBOqR1S/iCt
         EgucQJRxjN+Cl0vBNHKsEuxu7/sZZKD/frGZhSScNGZmXXohQgR7IANn2rsnHtx6nq3T
         /dRg==
X-Forwarded-Encrypted: i=1; AJvYcCXU5m0cQO9IhbaJszAvnAJ/q+tM3VOwpFpC77m6oy/L10GblZIsdDod1ksbMaWuHHyXGw9dmyJ3mhjYU1pn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw52pmBOrBm7TtXDU8j5mXcUWTzwvbsYzOxCkokCDQb9y/WZrBi
	HuZ5Uyk4mWide47YXbIMftrEzc0kltKGOpzGW2WDWi/IfG1E6ck9ZxM0jY9RXw==
X-Gm-Gg: ASbGncsQOhfwr3OJwxDZdAHB8xuWkVg6o9HE7yH1u5NXqFeHQN9xfZp2NGrKedtCDtJ
	pHIDBMpBIucsUspzhVJO54qZuuTkbOepRect+tMyb9ro3eEhjKU0dIWxgm7yaYB45Lu3ZWwKNvZ
	svqTY+iBmI/9/agQlW21DHDY5Rlqi+VUxkIwWD3y2hYTGv/qXTNJ33hf/Lg8wq6FZjj5xJHj9MO
	zzCCZ7UBGy3N2KrDqjam+QiX57pkRrwEyR1hciesZdSXOWREB1AXg/1hWwzUxz6Vfz4+6JRrlLz
	jS4neYyv63YSwSlFL1E0VmPzdV2FU++1zBh9PazkOgZds9yZ+sO2hIr+KZSzWJgO
X-Google-Smtp-Source: AGHT+IGCM+3I80JA+fktzJ6AOpYl4TuGcM59V0sIzl9Rp8Wbr/2ZN2X0j6onHQC7TRSSw8S7bfKA/w==
X-Received: by 2002:a05:6a00:44c7:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-73dc147bbe4mr6963805b3a.5.1745062547148;
        Sat, 19 Apr 2025 04:35:47 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaa8104sm3094614b3a.123.2025.04.19.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:35:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	George Moussalem <george.moussalem@outlook.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	20250317100029.881286-1-quic_varada@quicinc.com,
	20250317100029.881286-2-quic_varada@quicinc.com,
	Sricharan R <quic_srichara@quicinc.com>
Subject: Re: [PATCH v7 4/6] PCI: qcom: Add support for IPQ5018
Date: Sat, 19 Apr 2025 17:05:34 +0530
Message-ID: <174506248858.36993.16776911962965372493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326-ipq5018-pcie-v7-4-e1828fef06c9@outlook.com>
References: <20250326-ipq5018-pcie-v7-0-e1828fef06c9@outlook.com> <20250326-ipq5018-pcie-v7-4-e1828fef06c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Mar 2025 12:10:58 +0400, George Moussalem wrote:
> Add IPQ5018 platform with is based on Qcom IP rev. 2.9.0
> and Synopsys IP rev. 5.00a.
> 
> The platform itself has two PCIe Gen2 controllers: one single-lane and
> one dual-lane. So let's add the IPQ5018 compatible and re-use 2_9_0 ops.
> 
> 
> [...]

Applied, thanks!

[4/6] PCI: qcom: Add support for IPQ5018
      commit: d17ce83fec4abf4e2b11c6c2268f095e35a220d4

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

