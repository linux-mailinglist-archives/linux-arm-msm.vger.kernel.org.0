Return-Path: <linux-arm-msm+bounces-74594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0990B9A109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 15:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84D4D3AB6AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 13:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4859F302CB5;
	Wed, 24 Sep 2025 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="UAvvD4dT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41513FEE;
	Wed, 24 Sep 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721154; cv=none; b=aKE1dI0RDWl9UBHrhACR2eKKsoMH2BcpBFf/tmAVSBcOW7h2Ni31dM5Fj2adRzCm+xFE/oeSL0fgS5YMdncRtwXjSyc+vakZ077loi2yLRTy8sg1T2+9HQzICoXQirLXCcSC0XU7XBoo4Wt/T9FYb828GnFFzV3L/IAQ7I65AS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721154; c=relaxed/simple;
	bh=oor/2HzXtZGar96+HT8pWpyVE4kM4Usish2ScZ3U/ek=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uW5cpZWe5h0DkQK3sRI0MTkLt4CxYS+6EiElZBupGxnKv2vffbCBWrxwl1rapZ8Aug7vq/enG2gorBHjWJzfm3fupIQq2Y7B++53s0U6JCUpv20TBw/RIAvdgGncq/e9apnfUruOvSk8iiAwmCpHsYTHWFiYNno/ks5seRoN+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=UAvvD4dT; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758721148; x=1759325948; i=markus.elfring@web.de;
	bh=DX22MgKkklx1Fe+WvTkE7MNEXVG7inOAvwDgftC6fmU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UAvvD4dTmnNHBXt7WseWtk6JzgliH7284UF0TDM0+jQbYsBf8gYgGvg3qVCKNAmc
	 uXCtaJsqf7P64L0stsnQ8eanwJklZUddvAjJuS8+cYduEfDItSTZ2IDt6nJfajM1Q
	 vHkFocuyhO4wH2a83wyhKdDQ622j6cAKjUDA4SpeaKLzJJvgnrEu32xQV+VpbnTLP
	 gvFjv4crBRCCjD9c5KyC25Y08jUlS42WoaGURmtUfIFMKUn5b/BWbdJCIZvGdpTSo
	 HoRksjYCCzobcDkbPqn3uplzQJebDgm69ucCj+VxmyoFEPtQXmRgRtEKY2ELcVx4j
	 Gwqzl37E8xrUJUIfWA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.191]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCogs-1vAB8W2FSi-0059eY; Wed, 24
 Sep 2025 15:39:08 +0200
Message-ID: <07f12345-fcdd-445b-8f10-2c3cdee0c15f@web.de>
Date: Wed, 24 Sep 2025 15:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Ajit Pandey
 <quic_ajipan@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc: Update the halt check flags for pipe
 clocks
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VgbhpuQq0o054I2AHSv6LMjjHbIXUdg09WWhwtrkHniE7uDxN1l
 6vfQuJmSxXUuLs/84y9BTZdWVf5DWEiw49xRTti/7A82JaFVInvwlwOJkrqbIC8gLp9F2+C
 0/JxRggy4VfQOyGqNsCc1KyeGOKkChkBTOUU/AdYvRKblBqN95NACYqC17uDivjV+DmqICN
 Ypkas3g9lt8U0DZ/Eo2Fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a1L5NO2WdJI=;IJMhP4SNYlYovpLBvc6bMulK6ul
 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

> The pipe clocks for PCIE and USB are externally sourced and the should

                                                         . They?

Regards,
Markus

