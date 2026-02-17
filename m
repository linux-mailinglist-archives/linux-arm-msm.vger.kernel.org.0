Return-Path: <linux-arm-msm+bounces-93223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFDpAuG4lGlmHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:52:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3270D14F5F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 19:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E6F793007A61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 18:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA57A374160;
	Tue, 17 Feb 2026 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPHBkMTS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2123EAB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 18:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354315; cv=pass; b=aBWnqAqUd5jwam2gUvthGPugk/nchl4akVGhCPJUo9xLJZTEhsIOMvItxo7wX9YPdpqfGwSlK+f8mGyUCAcKwx6w8jpyVMYkBT6HEYgD65RQ4Ko+OUcqDmjJMj2vIAawMAqyZIXD/T+iRe22krCkL2PKnPn34jDlqW6bRmCn4Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354315; c=relaxed/simple;
	bh=mlaZHFNq5XRxueoqRH3q0IdHdk7o8tvxpfjKaHA7LPs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nTxscpfdJTBdy/vKXQKNOdyKGq4he0cqtPUXY7DLNPBVRyp0KwMmgIXs3hgLL4S7T1kobasc0v0WcV26fWDfv6OZXMdysifGytsy1fndIodXfTiwrHafpa0sePPxt+pUOkS44Anon3x4QvOFjHKiyirGOywB/1dndrXlCZZ4+eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPHBkMTS; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso233381eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 10:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771354314; cv=none;
        d=google.com; s=arc-20240605;
        b=ix+WuWgVx2XuztQTKnjpmhJXKCd5gIzY4BXP8eAfPIXjriLkk2RFeTocry9n69S+W4
         Qd+wweunMcD7BmWCKt9FW7ixUwnsTFrMnMV8Lpxx1uV9JudpvfKBPZGTlFnSfwHqjchp
         2zGhPpJx0r5Jm/AME5Chte3BSEexUiaJ74EpDurrL/ELDtG1jHV634KE3ow042Pd66gz
         jtgMfRm8jqJhtq1YV2ATFeyFf8frIdsHiuUSkq0RBwLJJSH7EDQrug1I6rbE9k9QDce/
         SVSuNUmO53on99hmc6IKNBUpZr+wodvwE32Vsiglniw6DjyUfSRo1IIFBDmdHIYO1WqS
         jwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        fh=U5oxkFtYXYpQxrTcqoKiTgLrYN2s5EVbmVcfXD5BsbM=;
        b=Q9lJTSMCsMa7A0A0msTkacyoy81LdM8Van2LOFI0W/CZ20PqoRrBAcTbvAYSejrc+I
         99oTIQMuj1Lt7ErQQke7n8gl9pT59sC0aC+hHdfWgbTkFPZ/HwOQWNpz3pWivOvbZ5D2
         zcrWpVOWwuREeWlLR+UocN9bLss8t8oR+vTJJuIXfmirVVnTqIrgQvISUyE58MBXKnnk
         6xs4FLR38GAqBNxBfdLhLhp8oeWC6ok8QFlDc+YFJibjzkMOIP511ERXg4CSrnq5wmhO
         hnohVoyx+gDBmaMsWaMXJ5qdZ+NbtiZ0+32PkP5RODJoVgsjgWCQGs/0a8SxX8tjQa8h
         dn7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771354314; x=1771959114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        b=cPHBkMTSjsQBrLDzh0g8vj7f7bTw03oaXK9dbK4ieBzV5uV+wxGL935i4qZM2/biBM
         QE/Bha4ZjDL/9dUWLpQuPHfI8s3B/peCXQs2sDucRTrCV7+mAgqFgNpf1mp/+CUigEgf
         UxUmiEqc1OykzT5BvYjfQU4Lj3a2+DVZ9KNQXWVDV04oRxtY4l14BdpbfS5fGHcr1zMp
         sDwM2/o7ZYD7ioUiuURlKrQjqR9PaE/cif45Lm8juHfROp9KH+FeCBqpp9CNcLck1BEH
         O3ss3JLl20ZOzvb/o1E116JC8zQGr6T+nVrCn0IdtxigqnVqsLW+30+c3YsKVjTWTC6c
         kNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354314; x=1771959114;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        b=eqYVCz1FCyqpm0TboqMofA695qU1ahM5kOi8UYC62Mc+WgtyElTIErHoeyvAQ+xFgb
         YD4eBrVTZcRwDeqwlc0qJ5K75urE/MG0mg9S1tKzEhBoNRBvUF3L5mnFg0SGm6lZcccV
         eHlNLrWSpAA/r8KywR6XH3ExvsLJGxw4H7mecVLVYLAnrqFnLWukTRKLeJ+0UkZQq65B
         I4ug/6RA4Yxk8/Cir1EzbGh8fKd/1BO+aem+m2Q3YIjtfE41AhZmZWjtRhMlrk+U0mX1
         ElB2NXnUU5QSE7+wVSO+kJPB73DlqQw9Xo/7Aed/F036SZ5SV5sIUy2RgdzeYILC6d4n
         wMPg==
X-Forwarded-Encrypted: i=1; AJvYcCU9YSZZ1p/pPXlf3NMu2ThR5aT+n4nrSbtJrHduvaRsj7GPzDlaH0Z3o3UMG+zxI6/5DoZM8GBy7UEXNp3z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Arxim9ZouKA9hDbW2Ulp1YR7Wp+ftigrgBGxXnYx0yub8ofJ
	qi1Cnpfp4rXio2nM8PpVxxK+8CzhzkO6rR+cBlX7V87GDJIZLGbY6mNy0JuFiOk3AG+EyAXLENC
	sV7r2TTDii7WPIh8/Q7OY3wUKAWrEYOM=
X-Gm-Gg: AZuq6aL/IrDjHjEdmIQ//ZcUk0MVAr90VHK4bd+/iSkHiphPxQ9leKnYEjWpYYMB3E/
	ougui1ZGzC5+EIZRGyJE0Cr5FQH/9wfhVtdUNjNAIXQ/yHo0q+5Xbh+UovROw9uViaWnTNvK/Gx
	D2JIzLgiApNlcGoqrIwS5cqbw9JaDhaSzNnDtxijdDCTGtVy0M834jTPMS6zZdKeqyuoZ14FdNJ
	mGU2cuREfP+BSZhjnCzGhWrbzAiFdZdvLSSdNLgAbapaCGhhVHc/dBhYzTA+2hnK+VLBRGNxq47
	o33YZlVo
X-Received: by 2002:a05:7300:b90b:b0:2b8:1d16:9736 with SMTP id
 5a478bee46e88-2babc44ed98mr5624900eec.23.1771354313687; Tue, 17 Feb 2026
 10:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 17 Feb 2026 20:51:42 +0200
X-Gm-Features: AaiRm51oN_WMS2IyaAAXhBJ1VmnFKjk3HIr2OX6Yqqq7pT9MsuQDZGKYwbAC5Us
Message-ID: <CAHuF_ZqWTb5Z7J10WQaBR2adVi1rU-ZFFTCBkHh6nNtuuCdJDQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
To: val@packett.cool
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, martin.botka@somainline.org, 
	mturquette@baylibre.com, phone-devel@vger.kernel.org, robh@kernel.org, 
	sboyd@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-93223-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3270D14F5F5
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 08:25:20PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets.
> While here, align comment style with other SoCs.
>
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>

Regards, Yedaya

