Return-Path: <linux-arm-msm+bounces-96747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJIHGw96sGnLjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:07:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1F2575D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 015ED31CF167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376133E9280;
	Tue, 10 Mar 2026 20:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A81T6Fu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815FA3E2759
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173162; cv=pass; b=V6ZUkjqXznxjl5x7DSJ8pBbOSfmprKzd63bgdWn/tU5HMnr968msEIfyP42MbwuYIjvufXUqcuv+C5nFSWQD/3sqitVfVY/iB9HmsKsThYINLZXBNLuhsbXTkPf0m1MKKZXf7uC8rAD2ho45NGdDzNFvBRXB+ubE3hgSQvtVoBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173162; c=relaxed/simple;
	bh=yezyjNt08EO4rLNbf8RM2RzmwHaocfDMLvlwLMlLuy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qulncNh5vz1pI5V9YZo6NXDAIXNaERhvCVjUE09BL0WqzsATbeJdqa9N2MKe6Qlp8P/eF9ZDKbg/87fnKOaqUyxZmiUADPgUWvlLP2Pmj7mPgwtzCS1dhzOkMX/jbgBsEhDI+aAeOgg5tJW4qvgiq9ayizQ3XDeKHd7dPATwGv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A81T6Fu9; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4989dacdso7824276e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773173158; cv=none;
        d=google.com; s=arc-20240605;
        b=VVIetvyhFxexeN56aDux30P+MiV6AFkBgVCvhT7CyOOHkTmYz0F/uJtQFqd34QsfPd
         2wP4aYUWevypbWVDA6AkirGzUSfLQ8VfkxjLfCkJY5E1G9BExRFoUq/VRSIDxNlPs8kG
         MRuMJz0LfhJZdr2kKZYhQKZLSp4r+FYJu+f0Gwf/Tkfh3DC7UcsIFLlJdCmFDxjd6m/d
         O/vcj0K12NQYYUij8rmMK6ViLC41X1LHwdRSKn+1ZZuv1hh0XNhDCKbl2+/nBLb99mGM
         A14xEAyCYLZ/Tlz7Su2befx0pXnHquGVZeeCRByc6cm2IddiEXwB0JjZHPz7TRVaHswo
         rBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQIXMNQ0k52fsARofvqfUmvTDMoK9RXOBJmQNC6ddnQ=;
        fh=GayqitBSaVI7FFhaURRae9FVwnU5Ev3UrPk8T1HjGME=;
        b=bAY3ZFWn7ih/hFFz15saL2IQxWfKkJEpqSUaGWqODRaNagcuwlY5JLsaeTdAui0kgF
         RS0dfuLfJRgUNdt7b3ULSu5ESWrKYhfRLYcB2dWBgm8E7Dfvn2ZmWnVjiWdoWa0b+POB
         PGucXUYLCC4GqhHasBLno7oAHOOowBpBHZzgU8/VbY7d9FXkt1035TaGOf8ln2CCCa/h
         OjC1E6ctwzz8kyVINJmkFf3OI34eLp3PvN2Vy8sa5mADQ/l+o2VO1gJWR4ffgiNGskcc
         LdS1pREWXCQby8s/JrmLySFMhHMM/SSz03j2D4nKVsrklEetI/+7VEX9Bq/DQqXkKO3Y
         5sXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173158; x=1773777958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQIXMNQ0k52fsARofvqfUmvTDMoK9RXOBJmQNC6ddnQ=;
        b=A81T6Fu90tE2d7aINcwxIooqEeRxzxvPyJVvnk9Q8SsLzCkYaLcmyYwSGJqjvCpH3k
         IzlFaFD0L1hYTS5v+TWuN22QrekBBncbbCGMeu7pZ606+DVIzo1pY6krCVcC0NpqZqa+
         97yhb+9/8y8R4cJMC0el94KG9vnkwVSi+kV4bObO00WsF8CSIGw3FSmHmkovk1T2GbZF
         3G9XB99nMUbAaKjdQ32J38Nop13AxC3utDRFM3j2jiR97c0OxeW/Bh0fmLLyj+Scnq95
         C1CL3Owtt4cKJNQ1X6PLZkUchARdKtc1TCXVsUKRjnxNB6z9k8dvzRdCBYdWE0JLaeEv
         TabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173158; x=1773777958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQIXMNQ0k52fsARofvqfUmvTDMoK9RXOBJmQNC6ddnQ=;
        b=WjhDKvzj2JZSX8h5CDX+g18VfpWipyiFkh8KhAc84ev3OWL6woMj5cTt8FDDqbiqnX
         a6I9RrWyg1VQ7TDYs/mB4oFqorwGI+qW8SOjnk0rdZlgbDaUohJH66sqblbPsd+VVbrp
         Id01+Lmhhzg/XPAq4Wi0quEjEzamUMJpWgQkH3g3imSXkfiD+cNU2Uzs81vRFLmizePi
         o+RrXKSwx/Xy0sc+AR3aW8qyHh1cV0pr/u1kcVJsAW6ONJkvrkYW6c7X0Q4txyJCobe+
         7iX01D9bseJMT0CCLQtzJ/8T3u82f1vy9eYipK5h7l+UACGpZKHpSWiBjRLYbOyglE9Y
         ZBmA==
X-Forwarded-Encrypted: i=1; AJvYcCUqp4VIf1xl7T6xijNziNFHn9XcTbMNp7GqlNqJA+N30XVGnYGqbOaIJfJv4xeQdT92cDzthkJiCCyUWK25@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZK92hta1vkBhwf1ER8JWsytYeQ10ti8/0sKJI9l841EElBg/
	ie4C/EdysxMn8BWMkP6dWYiI23Jk9vs+aot8bVPULFbENqUZWatwOsK+Vs7nQxlYgk0n43nxTdK
	cuyhE31BHdmrnxI53NX0N3CQPYmdIPWs=
X-Gm-Gg: ATEYQzyY0vlD3XGuX2Z0dQ5OhxE7stycqEl+olYTQW7fDIGTS0gX1DUfLlBt7ePH8uT
	BkGf2mNVtEB/Oh97GLLvTdiP33bUEqaK2v/gjk34aTmTW5IHSw7X5LeYh90yn4VA33RouGRtS1L
	pazt6nJT9TkV3QNxZJH499nEht5gAxB76/DWMjKpSQiE3700mWF5Q7Gq/u8cIqhh9OTUByK8YWU
	5yB1H7tYOsBPoSrHIDt5+R3Lt+gCIoAzs0079V9bxTXm9/POeTjDXrspER14qqO9exNlrynTIKa
	+YNekoXHVHT3fONJgDOqWtXarcgEbYgYzjcOT7COV6QOQPF2Zos0gLJnQlueA2Ef6R9P
X-Received: by 2002:a05:6512:608:10b0:5a1:3f3f:a299 with SMTP id
 2adb3069b0e04-5a13f3fa3a2mr3200287e87.45.1773173157485; Tue, 10 Mar 2026
 13:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
In-Reply-To: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 10 Mar 2026 15:05:44 -0500
X-Gm-Features: AaiRm53YqtD7m1k1WfcVh97y8PC5B6LMFnLkyA1AYIHdfdl0-cKTgK4_AfI5oyY
Message-ID: <CALHNRZ9R1XaYWeTneZmyAvGY-s2-rbSC_=bSV-nC8_zU+bGLqA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU
 bandwidth scaling
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C7A1F2575D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96747-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:07=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> Add the OSM L3 controller node then add the necessary interconnect
> properties with the appropriate OPP table for each CPU cluster to
> allow the DDR, LLCC & L3 CPU bandwidth to scale along the CPU
> cluster operating point.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v3:
> - Squash the last two patches
> - Link to v2: https://lore.kernel.org/r/20260218-sm8550-ddr-bw-scaling-v2=
-0-43a2b6d47e70@gmail.com
>
> Changes in v2:
> - Squash first two patches
> - Update opp tables in last patch to match how the downstream driver
>   parses those tables
> - Link to v1: https://lore.kernel.org/r/20260207-sm8550-ddr-bw-scaling-v1=
-0-d96c3f39ac4b@gmail.com
>
> ---
> Aaron Kling (2):
>       dt-bindings: interconnect: OSM L3: Document sm8550 OSM L3 compatibl=
e
>       arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 ban=
dwidths
>
>  .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 367 +++++++++++++++=
++++++
>  2 files changed, 368 insertions(+)
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260207-sm8550-ddr-bw-scaling-b1524827f207
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

What is the normal merge sequence and window for linux-arm-msm? I see
several things that have been picked up for -next recently, but none
of my sm8550 patches that have been reviewed / approved have been
picked up yet.

Sincerely,
Aaron

