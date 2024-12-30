Return-Path: <linux-arm-msm+bounces-43620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2C29FE5BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF77A3A20CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 11:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E291A7249;
	Mon, 30 Dec 2024 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0afciHt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC1E1A706A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735559991; cv=none; b=uMWmvNgrFDiyraFYFWh3YieFsgURlYuaWuQ0LCj1rOerDslP16ofyrnrsfELcnn8cAoTmRoLGCuNi+8DloVlTc8BeKOLODXROrWqcKaR7dEZaWxr0LKd5idms9pg4tVZ4FoqLIxWr/NiAZAnZ8dCs0ys/ZpcFubYd2p0IvTbvC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735559991; c=relaxed/simple;
	bh=uJl/FPrs7aLV0o0yHvZEfpNPHTdpTCh4g5t+DzGg8Hw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uEifZXZPq8YK5AFxG665xQ5+mzW5+INWvA/WJxoILtmmcLKqypWaGpzs9X+U5C70/HuR/yOQIuCvc0QTo1hH9hNkafzHNNRpV1jvHTWOy5ncic2iKMkiPfF0EtkCL6aGE6vRU7tdo0JQ+Zl+YiPmZ0Miklao5NBzms/OmH5HW5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0afciHt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43618283dedso91183295e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735559988; x=1736164788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB9/yODLQe9+puXrprcjZ851oLTBx6bI2CxwOj5wqkw=;
        b=u0afciHtlkKtMcRu0dCvy4RDe4QYhNW0LrsLgBOQ3EcMeB8k+WPK6UrhY9+t9o55Q5
         RwiE7cg/HzUedF1zlC1KK5fACO5l7pPfIoRWtvUedVJoIFVQ8StIYDWzWAwOH5AFM2A/
         LIRBPAEd7LL5iRRrWpB8S2C+bymbIzlmX+eUo4GE4qvW/kCDMtAbXELb8Id0P8UpRByS
         3xKPtlSW4vonfr5B0+tjlEGNjCSuGfzTMbW7WgwOMukpbNyH3BF4tS767sCjqwUoWkao
         iC1Uzz0RfXNQaTiIApV+YcnKlvaYXyWFi+Z5r6CDtW+jKH4zrLeR0UabfqWhI3IDXwC4
         0PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735559988; x=1736164788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB9/yODLQe9+puXrprcjZ851oLTBx6bI2CxwOj5wqkw=;
        b=NFE7HlhJe8FeyHfjdtYWuhdB7QH+TS/0ooTJlrYWWDBzfYTRFCxP6rrhXrT3PCkkl6
         9gzErC2ops5f3YvUayyOEEaYUVZsuSxOaaYRm5lWUsUa2mh7s5d7yb0Jd71M25pQUw1C
         hZ+JL7dwvNRYGfGOUF5dbjPThH0WfE3WOyo+LA1zBmpfHavfYGR22hxXbulYz5X/P6XN
         Raq/xenjc9xE1Fli+Z0DAvBm77VAXK9kja31HbbNvkXZCu/uD1pj+QlG91vQfq8Rc3Ck
         m0SjrVcu+m+wInxh+TeQFJ8hIlh4hIMlezANN4DpxuF4v46i+2oYPtFD8I5zweZ2ccCh
         38bA==
X-Gm-Message-State: AOJu0Yx2EL9yO9YA970GyajBbNUv2s992t/l3LpP0YLfWCStnN9xfxVj
	F29HM9vfiHL8eCLCWLzUuF/QDf1zedUSVugOn9oV/eSd0STZ4b1lAGYsI/jnDc4=
X-Gm-Gg: ASbGnct3gG1de5nu7EW88sHBPVvFc1VVTXJ5rtR+yzHLNsMvZQs9ncwpa/yPGHqgeuZ
	0XsrMGXlFGJafCf6NVjlOC21FSRMQSQ5B5ikst6a5S0WnOr8n31LlRAT458tTbNMwsiMXOhoZCB
	NQi4mlsNNml2ZIo8dbKeXFr7stqTp3jAVwSJyF16Xi0fU4ji9hBRlYWeRoHU4ugAkuO1kal+37b
	VAsxo7Dt7IntaR1kpLnXcst8yhZYWEfVCc47XJQXxj62U5ZcXvpKpjsJ1W/zI431VzFBzFeriQ=
X-Google-Smtp-Source: AGHT+IH7PQnUhj9epYwjrvd+9otFloYOan9mIkPrQcwD6X8nhBT7WBdL5oh06N9MlYKlRKXTBPHadA==
X-Received: by 2002:a05:600c:314a:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-43668b480b9mr260928215e9.20.1735559988376;
        Mon, 30 Dec 2024 03:59:48 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea42esm358854655e9.9.2024.12.30.03.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 03:59:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, 
 Anandu Krishnan E <quic_anane@quicinc.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 quic_ekangupt@quicinc.com, linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable@kernel.org
In-Reply-To: <20241230115241.23202-1-quic_anane@quicinc.com>
References: <20241230115241.23202-1-quic_anane@quicinc.com>
Subject: Re: [PATCH v3] misc: fastrpc: Deregister device nodes properly in
 error scenarios
Message-Id: <173555998703.252613.8963658462497802006.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 11:59:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 30 Dec 2024 17:22:41 +0530, Anandu Krishnan E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> 

Applied, thanks!

[1/1] misc: fastrpc: Deregister device nodes properly in error scenarios
      commit: bd79a7dbb3625304abe3086de99168534e9552c5

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


