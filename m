Return-Path: <linux-arm-msm+bounces-109305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCnLKDFKEGpvVwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:21:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBFA5B3CE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DADA309677E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DE2377EA7;
	Fri, 22 May 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrXiQlFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A17374745
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451639; cv=none; b=r1FwZuU2f7z9o9PKBgs/Bx3jNt67Y9KOhpqoFg4bvljBo7zdujiCr6QXYvPiHBCFzYDMrrrexaN04LRoVBZCdF19Lb4eW/HlwQkcX+tFbAl/LzDdhm/ZJP3nsYS1Bms4m4Kq+GM3FpMRYtc7CpPeZ2S2itwLrhcseNykMhvzTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451639; c=relaxed/simple;
	bh=8igC6V5gCG3ORklcZkPqAGB8ALlBsuox//yt23Usl/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6p3ivLuIghbGX7TkbUhrM9jIyV7/kSmrbmLtTfqGJq9snMSLRHfMwnzqBcBqkRKfapIIWzVtXR4pjwAM+RVNKz5mBI11p32vTl49h+y3Wjutk/EMYH4gxfoW7mVmsk/phNPW9JEgt0o/pg2aLqMqnqpk9kVCMvrjmNdJ3Qpth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrXiQlFa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43eb05b1875so4041130f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779451636; x=1780056436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRpKrzH+DoH1DNrXivPjGcJUPcnVpmZeapPmijxinYU=;
        b=xrXiQlFaPJ/aLpbWyCLckZcJYzAZ0DHMvhSeQMnPl04u9uo62gl/6y6jHbMcehvrTc
         VkEOcuMSU78CUwhaLf61XV1kAtBWm6v4o3yr8lCGpKNMI45gxKYxMyGulXAmZ5dxNKx2
         ggFJ6Y05/bAw1WOzUiWD0RxZVXN5WU7ttsseAO0QdO6C5t8CzZF83Zyyp9qF4XaxbaKd
         wHt02U/XPME2J54LjCnMufIhmXRPML1LUjQXYHSbZ19t3u0ES8hjMYfkvtAgt1y95B2p
         xUCQdL4p9yBDCCVwQXHijbDz95vlaD6DCqEwrnxLEZcKZsn2YwttybTdbg7YkT4rPPyo
         /uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451636; x=1780056436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRpKrzH+DoH1DNrXivPjGcJUPcnVpmZeapPmijxinYU=;
        b=DCjVf1ENy+MFFXhjjoNKBFnreom4NYxAvGbt4YHS53NNeHr94qh+EA9Q4vYeDJObZ9
         MeIM1DWCnfMwLYG0Sb1B+dyJH4G1uKvBzypt+NxNJr3b6nqFb/n4kv4CW4Lk17CGT6r7
         BsXUQcdST4IPNw6HUdxTXd55/CNp4f2AyoqLujhDV1TZrU35eR5EGGAmad0gd9QwD57I
         /lkiq3GZuz8vSqfPR3K3zyeV7esAmTNnw+sOheQNe3iZK449yEtBlRMm0B1Is6JsI4ql
         Io63b9l6rjmBRh2I3n2fRUmwJ0Xs1tPZYDEeY+gWFetIDCeLmQh7vNyjvJAHBD328T55
         AfPg==
X-Forwarded-Encrypted: i=1; AFNElJ/+A9WTELDbW0VS+RNVLQxIycAQ9/5a2T/vHE2pEzrcmLwgO/MJm8KjKF8aNQVhe6voc6SaFQP4wI6J8At2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ojrkw5339HPn1JjCchgI+wz43eYw/QmLXsTMm1CUBk9mkgt5
	7tGzKBbL2BHb8sMUoofMhwJZ5etA37yvkCKKfcwuge3ZRZHLk/joPAzZwg6PYGe7lJc=
X-Gm-Gg: Acq92OHA9EVKXdQl+zZB0fBJRWV+66MrM48cITZGUcmh+ldRBdEE074za5bB4Yp9Eqt
	1UzXU3UlRLsKhy1xuqGwqNnNzNYHDxAqx3IGHAE2ZNHgyvMSJrbXsnHmBvglwFYR4Rr1CzDvlCw
	mkzGWnSDn70AOKdsfO8QA1aubvy/ONeHKxMwh/bpkF/yXYyjPtjekhpWx9PKFHdKApq/Upjd53F
	LjO347V9MPxgCKOXjg3n7Ex5toWwlZv8HCZyuxUxxKxwBWQLYGu1DLOhwBLcJ6CLGCtL3U9RNjK
	uLHxKCVfa3/MSNH87nx1pAxr/P3yf3/rsLT1KP33p1NCksk1Fkm5J5Mu6e/Ba0I6zM3HW0QqF7u
	Kk+HZllXuUKR44jgyoj2KjoyEjJabNQml8N/IOX7AWj+R0e9jtYtu0m4NM2KQvJ0mG+o6wK6G9F
	UtaaYZ/rzi1i+OXeg7CZSQFCa0upSG
X-Received: by 2002:adf:e009:0:10b0:43d:c95b:c46f with SMTP id ffacd0b85a97d-45eb38bfdebmr3493505f8f.38.1779451636530;
        Fri, 22 May 2026 05:07:16 -0700 (PDT)
Received: from linaro.org ([77.64.147.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm3678635f8f.5.2026.05.22.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:07:15 -0700 (PDT)
Date: Fri, 22 May 2026 14:07:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	shengchao.guo@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ahBG6jKYdSAboWjs@linaro.org>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109305-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: EFBFA5B3CE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the ready
> state is detected, it will be marked as "attached", otherwise it could
> be the early boot feature is not supported by other entities. In this
> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> can load the firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Unfortunately, removing the ping-pong functionality that was present in
previous patch versions makes the whole mechanism a lot more fragile.
I'm not entirely sure if this has changed in SMP2P v2 or more recent
firmware versions, but in my experience the SMP2P "ready" bit does not
tell you if the remoteproc is actually running. The problem is that the
"ready" bit is asserted by the remoteproc when the firmware is ready,
but it is not cleared when you shutdown or forcibly stop the remoteproc.

If this is still the case, you can easily reproduce that with the
following test:

 1. Start the system as usual and let it attach the remoteproc
 2. Manually stop the remoteproc in sysfs (echo stop > state)
 3. modprobe -r qcom_q6v5_pas
 4. modprobe qcom_q6v5_pas
 5. If the "ready" bit is still set, the driver will try attaching the
    remoteproc, but it's actually not running. No recovery will happen.

In this situation, it is very difficult to detect the correct remoteproc
state without relying on an additional query mechanism like the
ping-pong feature.

You can make it a bit more reliable if you also check the status of the
"stop-ack" bit. This would tell you if the remoteproc was cleanly
stopped with the SMP2P "stop" mechanism. However, that will typically
still not fix the case above since nowadays remoteprocs are typically
stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
case. I believe this might set the separate "shutdown-ack" bit though
that is described for some SoCs, I never finished testing that.

And even if you check both "stop-ack" and "shutdown-ack", that doesn't
tell you if the remoteproc was forcibly killed using
qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
solution would be querying the PAS API to tell us if the remoteproc is
actively running, but the last time I checked I was unfortunately not
able to find a documented call that would tell us that.

Thanks,
Stephan

