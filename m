Return-Path: <linux-arm-msm+bounces-90459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ade4NjAxdmkyNQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:05:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8C811B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:05:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01CED3001062
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E299B1F5834;
	Sun, 25 Jan 2026 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsG8IUqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3262BD0B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769353515; cv=none; b=lHjbncwgB6hRe3OBoyTZJKyau24uFxe5vSLYfXGzzdQ8khGjWU8sJ7FKcrVL/DuHdo37Z0qtAw3R0jMvDVgrJezvQjG05JhV6rkZ0Qhtn5b4Qt+BB1Xod40xvE9c8yoJ2wL/WE0Q4bWgi8N/xWKjXt6tHD7cEJJtWgl0Sh2CX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769353515; c=relaxed/simple;
	bh=SZoIxLnD9EmIiRuRuJRZsThNN/iHYmQn+XY7/nAp5jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmFfNdNgilyWQOJD2lQ1l95Go9/ydJDhLhWSpt6bkhYPYw1FRu+Mj+OoFrHVHAVSHlMtSmfP9UlYAH0yyMy148i4Cv2Z53ozbzn9aQVPua4Cob9SuqttHqyfT3nWkQs7IULHIDzsTwRVJhCf+vCw8c/fJVHYAoON0yhWU+k88Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsG8IUqL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so28884085e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769353513; x=1769958313; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZoIxLnD9EmIiRuRuJRZsThNN/iHYmQn+XY7/nAp5jw=;
        b=CsG8IUqL9De58X9czj1yNmadG+TGYeVV0A1UsnMNhlr6PCQ5trtFCwYe8I9bKcQrXl
         SIKOxe5DH0jW3JEay0BGkrpxhY2dxOx/2VDKS5ByC/vxXq3L9XUKzUqUnnM5VM/u6gkI
         yVn8QWmNt4EmEWA+C0G6jrnFgTZiol9n/q4O3I7MsEJXyL90gZq43Dcz2d6m1ph2Sy6Y
         zTlEGaSw4RWEtLtm7BQ/5tFbYVSx2wMPkAYPRzp/RkcdFkU5d7vYKQ5Hk44D50uFs2VK
         gkf+r9ZoBuFYuHiwa9zMMvADK09EfyOWwopzujYd48XYwDLEZN1hCf6VlZylYKqoLJ3L
         903w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769353513; x=1769958313;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZoIxLnD9EmIiRuRuJRZsThNN/iHYmQn+XY7/nAp5jw=;
        b=VIGROCbiwLzw4tN+m5aRQWmwJHzxYkdQ3FbeZ3gkhxaXupSYmQJI7Lz0JvVq0es1K9
         WjiQ9HII5UYBFd7cnKWtFm7I5+ECBYEJoiC53/ELb3pUD79PLhblI/t6nBN5dmrAAsKh
         HPOTQq22dlMCjGbYWlAgtYWC6rArkFQWt1DpDC63U9b4nulLytmGs7IKAZ/kjGSFR/Lu
         lPjYOkAhxv/K3+kjR/EDlnq9c9Oz0eouLMPUsMkJeoiKL/tDGXyalgVhZd44QhQmJUAZ
         02frZvzhmqeozOwjYGegiwQvHU2axd65vphQb8nCn/5SEbK8SM9mmy9ALjyKEkO2lsuz
         hR6g==
X-Gm-Message-State: AOJu0YxKcYoFvB40EQkXlYWN10oT3bs+wAj1oCl85PhvgyuYqlGjBGgN
	Ew+EudcEQTCSCp5sgN+ZYnXv+gJAJIlpFz5Z+drldk1/U8MPuxAMpGnOWJvzKA==
X-Gm-Gg: AZuq6aIv1bPLp1KrqZbqBh6GfVYrllSxQxU251vEle/CeQVMSC6PsSXxM/zditMTtHi
	1irladrF++W59ucKaycGLCCRtjV16ETJN0aLuhvPWBlCSaCmGAIEzpJD+lAli542lQAbrM3CICA
	Hz1W8lUQNX9+hjb0803phyhD6sa2DBHsFYfFPjlpIhxTj7Xl4EIi6jKcmWk3MUyDV/+tUD2hryk
	5GGSrwq1A7aAcoZDOwHjpfFPGDLvywrI6W01GX87ByoxpWOZ54GGdcnhUCtuUWXzNezZOBZRJ4m
	nK/QO2Bry+aom42HnGvXO5w6CfplqLDG+gfjVo2HYyMXLRVatRAyl/qN2Nbftqli1U5hADfzxMG
	irSi2BLM/joGW1CK3C4CCo+/g4l2n9pmsp0AysflAklKSJW/0zANlLUFricO/GN6wTkZG0/Azt1
	gQd7YdVaa0/HvfeZR8jfgBSS+oqFHd6nyj/gu32bZko4O+nNes
X-Received: by 2002:a05:600c:3e0e:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-4805ce67d58mr31855675e9.21.1769353512554;
        Sun, 25 Jan 2026 07:05:12 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbbcbddsm74979995e9.15.2026.01.25.07.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:05:11 -0800 (PST)
Date: Sun, 25 Jan 2026 16:05:09 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Subject: GCC headers file name pattern
Message-ID: <20260125150509.GA465352@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90459-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_REPLYTO(0.00)[petr.vorel@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petrvorel@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D2C8C811B9
X-Rspamd-Action: no action

Hi all,

I noticed GCC headers file names for SM* SoC have 2 patterns: "qcom,gcc-sm*" and
"qcom,sm*-gcc":

$ ls include/dt-bindings/clock/qcom,gcc-sm*.h
include/dt-bindings/clock/qcom,gcc-sm6115.h
include/dt-bindings/clock/qcom,gcc-sm6125.h
include/dt-bindings/clock/qcom,gcc-sm6350.h
include/dt-bindings/clock/qcom,gcc-sm8150.h
include/dt-bindings/clock/qcom,gcc-sm8250.h
include/dt-bindings/clock/qcom,gcc-sm8350.h
include/dt-bindings/clock/qcom,gcc-sm8450.h

$ ls include/dt-bindings/clock/qcom,sm*-gcc.h
include/dt-bindings/clock/qcom,sm4450-gcc.h
include/dt-bindings/clock/qcom,sm6375-gcc.h
include/dt-bindings/clock/qcom,sm7150-gcc.h
include/dt-bindings/clock/qcom,sm8550-gcc.h
include/dt-bindings/clock/qcom,sm8650-gcc.h
include/dt-bindings/clock/qcom,sm8750-gcc.h

Is any of them now preferred one? Or you just don't care?

Kind regards,
Petr

