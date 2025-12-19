Return-Path: <linux-arm-msm+bounces-85838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66183CCF780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2425F3071AB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1D12FF661;
	Fri, 19 Dec 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dC2TE71J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oPe70/SG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70991B81CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766141258; cv=none; b=k1eOcyZzOK/ozv46i1lG9/rXX6Tc91gm6DtygdVAXukw5wHex02ZQvIPOma6dlnz2DrzmKToAe5nc7zdCt+099MEYRb5RgFjUnNgS4rmYzsRP0k7V5DimGy2u9gduoU5SSma2nW0Y9S8HXa/BIqpLKZSVFUisg+a1eEepXjjyf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766141258; c=relaxed/simple;
	bh=jcSLquhQd9vs3yycLTlkV962wYyg0ao0gWX1c4mC+3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtfG+uQsEhDyqiJwq86xwbWmotNBTthYakY48zXpVNDQymt3JNbz8F+078STvltwZcCZxsAr8tbCQBlFicSQs/b1qKX6agM3cDyAqO6ulsLypByX9ryPxCBx9rt6sGptGnSSqgQtDiyzGaJthEac1AB97BQPVMp6NEM907OgSTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dC2TE71J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oPe70/SG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766141255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
	b=dC2TE71J+YfHJewG58FwvcxeKkgfTh93hutbdh9GkWS3cPBgcoFmRCuDrbZk0Q7QNWVDNu
	0hn5R/RNi1GJ0zfJQYFs9w5HxadAT5iCjAGYSjZ4ABN5ubVF77pMXLoBqjBDwXDTIP93qG
	EX4zAKm9pvl4/Icv8FpiDVEFCACKE9o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-Zy-zobT5O5eo7ZLhPhcweQ-1; Fri, 19 Dec 2025 05:47:33 -0500
X-MC-Unique: Zy-zobT5O5eo7ZLhPhcweQ-1
X-Mimecast-MFC-AGG-ID: Zy-zobT5O5eo7ZLhPhcweQ_1766141252
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so13304545e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766141252; x=1766746052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
        b=oPe70/SGbEnIO1GuIo0AHGvbShooriHLnEi3edlRDk+bhgLoBfBUKQTQAG9LfwZ5yK
         QIc8ZJD+eQOHgpLxYuBqRIbB9Hym14r99iWTpwFuoA+6hxr8bQa4sYG3w3rdpLEdYP9T
         eOfd9bhjP1R2Itslw2R4MJNnvtQDtRNKRfqrzjQLEmWlZXV09sth9LL+zsZe//Pq0QTy
         7tUjavN8S96ZVVz/30WhRP3YJjaKsWe/D/1BD3GvpcngDS/pFtgrk3UEefjRDsoO6vuN
         JW2xnVsFLSPuxsq4GgdvueEpmLlG0eExwfijF80WDZikEKnn31UleMrS6FS2SDRAo2Qn
         4TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766141252; x=1766746052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohuBcRpV8beJcWGlYizxYN54dm2bkbetXdev9n84fy4=;
        b=vfXam//4JiySu0vnAYqQzBIkqlvcc6+oCEwiCE/SPfpcdgacHORrWUdCZWTp/XsXkI
         JtQ3xl/cdjPrgiXHwKgsU+cjAJl0n7F3rkdufuMeGSTqwF6PdLGvCyoL/dCWE5DFbMWX
         E9FR2DxPAjtYuXFkUxuyhdXUas+4W5o3WV9W/aw5Qii/TDo/JEiNoteM1jZ8K9pcPA7E
         5nYp1Gh7orxYrN7jmjEvJH1p+Y5Qlf2tu4Lbb2J8p17gSilZs/EmfdOJYF6o0aEDASwV
         fKOE4qlNdQXBrUTM3s6jhndjNaYdZzuiphwFafOESqAYxkMKSGZC3Kh7gVwqsqJoKvxc
         356A==
X-Gm-Message-State: AOJu0Yze38b+XJdNoC4Cd8ABcB/CaWeluck1AuMb+R2S4UAcz7VjITgE
	Aa0iJMVjrdTkx4nqkKyqfGVXYsjeKoTipvEvcR+WiXPAwJAOO5RQ6JmzpZFKRPsRhl7zoPUomtp
	bXbtR181SGy6V9osK+KQ8hpeJiDoLIwnBEq1NougtWN0NmF3cDxPzpu+KoE3W42aHK/M=
X-Gm-Gg: AY/fxX47MF8yPTI0h8qf5CkVdCjSWapVwdft2SeIUzKWvPHNwzKWVErNBr1CZtppnUN
	Hq6RjWJhIPZPja8yqcNNvFZf9zK6nw+avHZtoIdG+BkLoWKS4TReWFCSb9lO4rjR1XR33DrGxSr
	RLrrAFEg1d+vFzHVrGESImsnNWxoosKcM8weEW7QlJTXWv+CqrYGczrlJTvBQOTdjEAJxb0g0fu
	vjLKiYllEIHR9VwxfXd0fo+b2sAHEnjg6CNyfSiucF6BTDbtRgElILMU/AH5aAxkW3irstCiDZn
	LkfLem9VnrQORI+DqRh5v6iz4w2p12IHYErk0K4zEFynqOlFXqFbFSxacp0C0rNoi8ub8TXuWrA
	5Np3volQAd2Su
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr21387315e9.6.1766141252212;
        Fri, 19 Dec 2025 02:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0haeKdz6e1wVUfU68PetlUVJ262uD0U3xuzOT7CFHMjUWuxjHWC2bHGvwH3+5rKwg5RCnYg==
X-Received: by 2002:a05:600c:6812:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-47d1955b97cmr21387045e9.6.1766141251798;
        Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm92155575e9.7.2025.12.19.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:47:31 -0800 (PST)
Message-ID: <b547252f-9893-4c23-8b17-9808c8bdd0c9@redhat.com>
Date: Fri, 19 Dec 2025 11:47:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 Chris Lew <quic_clew@quicinc.com>, stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/18/25 5:51 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

For net/...

Acked-by: Paolo Abeni <pabeni@redhat.com>

even if I don't see anything network specific there.

/P


