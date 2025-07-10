Return-Path: <linux-arm-msm+bounces-64419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4211B007AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD55C4E5AA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDB3279915;
	Thu, 10 Jul 2025 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="celLluoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4D727B519
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752162717; cv=none; b=hIqtUVLR/5MkAyhznit6gvjja+rebUXMWxn6x/8L3EHyjHbaTUQJeblqpQTjjQXybDWkzhetLEsqGfMrRKQj5AGhVYFykp05Qfncr0rp66VVEhicmy43YtfsU8uOFWBQvKzPkDak4oVn200krnhLcGvbWRso6KWv8eu+Ju54mc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752162717; c=relaxed/simple;
	bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I66hrogTDrnBZ6KEi+Ub66+cCY5JkybmGQvbrMYqC2rzMV80Bywcu8r1e0PMF6Ca0rJNNGFJ25x2cJbO7do3p8fW1iAhM2FvFAafvYWEzRSafNjg4SHjBsk6etO7qivRArkE9z/yXmAw6iwFXBtHflkAQFn4U32RmDVAXEyCZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=celLluoZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
	b=celLluoZkFwbxr2D/qEZ+uo4KedZFjqRjf2EAXMW3u51lT4mUpHP5jZrksh30oM1G0XVPw
	CpVUeFGvH8XJSTFf+3oCyaj6lAAzQCwMa2vKE75/AnPx6l6Obxsf4uHepqmPRzBxDQxeNQ
	AbxJIcK7gazUPBFa2b8C7g64+UBFST4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-MTRNa_LPMOGMT7BakeyZ9w-1; Thu, 10 Jul 2025 11:51:54 -0400
X-MC-Unique: MTRNa_LPMOGMT7BakeyZ9w-1
X-Mimecast-MFC-AGG-ID: MTRNa_LPMOGMT7BakeyZ9w_1752162714
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faf265c3c5so17856596d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162713; x=1752767513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
        b=b4pBQdJ4TPWUw0ZgNwgZgjUdgjSzBH3kKvIJo3bGt3cHp0MXjYDeFZY/EI7Y3DfOIg
         kC0luU74gkWVArkBzRSWe5683OLmWvtUdoShvXEswzjfdKqCy5v+clSx8sW/ij9ALh7h
         zDAwp1UQywwYpZ6rB1S0G3anbneDnPpovHBFEoCaoftySaTf/bvm1fcANbv9yCeg/Y9A
         DgTajZyEtNZNxm7P1VaDYPnubeUgINos0w0JgQLCitxJIlgZVi8sFGoTvlKVkuYi/6u9
         MsBUxIg6WC40g/0F+Jw7ywhWj+sZ2AgZec/Rg61bPTGok8LttiUxk+nM7p5jhHCBwgkg
         t6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHeHD1/mGMOV0Twcb4fAM3Oax5lsagWR0izm3cFvGbygSEmEGIf6W66BTsxAM/3Ku7XSzIRsh+IRZf35Ky@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+5gtNB09EDeQF115/1D2Dcr1p7hQbebv+t61D81m9PkQGu24m
	Lp9ZDfVm0KbagSl3SB2EtqKekqJClPaZcG7r9mOCousDR3pArT0FiDNT4+kj8hHEy8pDzGy9PVp
	TRER46WW/3+LcaB4kATx5JnCdKimQwmx5gzEnDv2Ajg2z5Q9IP5Smisl7WM2CmdiyX8JVrXfCfy
	M=
X-Gm-Gg: ASbGncuTCXR5f1iOKp133BwopbvaexZU/v7AmNO0D+TBv2SKJxl3WtlyeVKYT+UWbOg
	qpYpw9fOR5aeCJ/4QfTYxXsJ4zHmtK2V799ykuB5KXGIESyuoKDqyiFLH84OIoMbn9e0PCvYgzg
	3SQpaF8jOkftMYYr8AJya5LzfHg2VnFksnDjT5pOjcnzRYf+UQgdM9azB6jVeT/wXmayTrI9iLm
	fkEhpLZ3CAaeSRvWpS1Iqbq/QL3hV0NPB4kriui05F5QmYVTi5RLhQNe/+HobRzNe6HpaIWvdQT
	SshN8QGme2slt2H2CAnJmN/JMQwiwfXe9bttFaRToQvLJ6zPEed5ZZWh8A2S
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101736d6.33.1752162713150;
        Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETv8kKkAF9gRKcsuP04l5OSaop0yTF67wtB5mlM/oS84I84ISgz+5x5RQyUV0R0LiOWXu3+Q==
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101146d6.33.1752162712560;
        Thu, 10 Jul 2025 08:51:52 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:10 -0400
Subject: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1297;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
 b=C1NOkFYk4ZvkSlhR/nJT1ZMxm1WrhT5fr4V1f6MUwtgu1IwsGHRhGihPJyKm/qfChcPciMqRX
 jMkYCRRA7J1Bi4cmmruZSnKv3HXP26MoB05WHwsHZzBAvqaIhMzvhGA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index e758411603be5157e468e8c076620d7c18661bf3..03838582aeade389d9a2d90cf9f03fad835f0733 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -69,17 +69,17 @@ static unsigned long clk_q6dsp_recalc_rate(struct clk_hw *hw,
 	return clk->rate;
 }
 
-static long clk_q6dsp_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_q6dsp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_q6dsp_ops = {
 	.prepare	= clk_q6dsp_prepare,
 	.unprepare	= clk_q6dsp_unprepare,
 	.set_rate	= clk_q6dsp_set_rate,
-	.round_rate	= clk_q6dsp_round_rate,
+	.determine_rate = clk_q6dsp_determine_rate,
 	.recalc_rate	= clk_q6dsp_recalc_rate,
 };
 

-- 
2.50.0


