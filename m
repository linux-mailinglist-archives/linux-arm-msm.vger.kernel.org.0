Return-Path: <linux-arm-msm+bounces-96777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P/nHwCAsGmwjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:33:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29919257E59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 21:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E84D30E8AC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 20:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7626036682A;
	Tue, 10 Mar 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbQaL4EJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7CA175A98
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174683; cv=pass; b=mPRpgYTlGBCv4Hs5l69XEzju9Za3kPIJ4WSwG+29H6VTwqmlGiXXoslLHOv+rqo1Bf0KjMWl/8YVgD2099RD8tT3cDjhS8ASndLMn9IU4YEeRYOPJftiQXlfkBPdMzp8AN2kuUsBF4blrBo0mimlxnEbxUr3e35I1MntMVnjUBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174683; c=relaxed/simple;
	bh=rGwT+iwlPcz7fLrpp4wRsrxUUp+hs3Nud9RouFTF1L8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4+de3E/2CJxOB0YFRKQvFcpLAgliV8jgj+IP8CC/p0lS0N5wt1p31P0GD3OKXCHhK5WfP5wQJklf1R/pxsTbAQ/Upa1kZinQ5TrZ3RYdJUi5jdt4bvGD9vumMUUxhFuk9sgPd0wPMTzOaXv7Z52bHRSWyX7ZRaBGcOxfrjhFdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbQaL4EJ; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a133502accso6713991e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773174680; cv=none;
        d=google.com; s=arc-20240605;
        b=kKXU92+vVl6f2TNy/y96m1JlgqFrRTGjEfqujmEb7D7N/mQmj69mmO++hJBmwy3MvG
         0rh9aAEorTI51Cj0jQanHIgdaTbO7E+RgrkczDCIKcPlQcwACoBHIsBcontU3P2qXR6J
         GMVyZRZBN47rGzothiu9YghKhO1NBnFB6jXUYHMZdjhG/FP9/6esQGeLws2uUmEOSPQH
         KMuUKwd0oQTMWPMD7Ybd4MVU6Q/hYwOHBvmDopy6XsYLgQ3znMC4eDOU9BTQJrcMxghi
         T+3267tLwUfCFVXUhEbGw1vWrfJE98NkSYk++U81oQKCIiLHPKSYLoIIVGCeLX1sRx1S
         qxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q0TVLG9JTMKpn6Vqwj6rN9mE85YOz6NbxAoBKHU5OcU=;
        fh=zC3lv/JzHYTYrjMPlSRGR1eeV5STrjUlRR4f0tMMtFc=;
        b=FUD8FnNnaqTSXXfqdjwuoAUDDTlAs5c2VzWuDqkvE+AOj3gwKB3SsgGn+DJv4oUYQp
         xcuVAWSg70GltRvz63ofq+QYkJel+sukC/Z7TRa6HcNkpDU4qiik3jzVNvK7JD9fVXXY
         XeCwiKxbIy+73sL3Bo6/00oVZiXrePEg7FGRU40RqpSurhnrZ5nF/V11wG5b+pgyoJqF
         z7VPakv7vSu5RVpeeR1JkHSfSG4p4fpliqaPtFOXk7slIolnvapg4YRQ00mCgFJxQN0n
         X70nsByEOlzV5kcgGiatKK0mHhCTYzh6ldAwGR4zl0vnvgfVx4a+GOYbUIoFX5+oDt2t
         ulCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174680; x=1773779480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0TVLG9JTMKpn6Vqwj6rN9mE85YOz6NbxAoBKHU5OcU=;
        b=hbQaL4EJmJEIzSOvXXfcgm8MHqHCmkDSTVzuIfxj9iLC9GpcGQfsC4Qj7GP4vpmq7K
         Sn3hVFvX/RpnEnbk651jb8+LFiNifA4TUvPWVO6neSdHkgKYrOXVIOdSQECu8eDor4FB
         0XlS5u9tJkMqSL/B//A5PncRJfO55EShb1z0JiPCM63Wup2JoRmkrgTrFJyN6vGnsbGw
         7vKMNqJTHc0K9HwOMlq6XsP9UjFITevfLpN8337lDIOGiJpp2PqxjsEXjWP4NxnWoTAN
         U+SHZAB6SGyRHk5/05sDbM+gkv5p91zktSn7UG8S4uVfdF2i3Nlt3Fw7gfIeOBZycHXz
         IN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174680; x=1773779480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0TVLG9JTMKpn6Vqwj6rN9mE85YOz6NbxAoBKHU5OcU=;
        b=n5mMNXcVxD7MN0vPmzjcLWVL4vbxiqoKo8742fQHUqe9oX+toYVIbCR44r4to+xlTW
         lP0n5vva9sZk9tciYcyaoC/2+ctkTnrZUV9BpRnvUJmf1DVtmTFisW7Om73lW3VKyPL2
         klf5g5cgRMMe0TUGZUA5I0gfCmNzxREMfznIL0022F1uMW4NDjYDqEPzKY83v4cP2E11
         Ns4LZpe0MFzD+ptExcyesdQYnwhuDklYrR+5M+snRVTQsaUVQDeYll+Kc/+1D1ZB6DG3
         b1eX+czyGzCBkq0/iSrKKzz7OzgIhv0VOHyQ35QQHrl7Mb/l986oaVqZQnWnfBL2WVFx
         E60g==
X-Forwarded-Encrypted: i=1; AJvYcCWuuTwNFUFIyZ6o3krz0H2QgxF5jb5DOJYT5Xt/MW6p6CtD1HzzzDbeWVrz7JiPGP0lkp2G6XeHV1sW+Ni3@vger.kernel.org
X-Gm-Message-State: AOJu0YzapaERDNtDhKXYJTk+soATg4kN/G6Z/ebxqXRSNSnJwhkLgjbR
	Fxo8JDPY963jpLtwkG2yvo3bD2Y1l4fCJpC8HAkiMmv5q1Aq+PXURSRmxdN1jtiEabfJMMmE3aP
	c2ur2f1mhv1AsdaaQMUJKxQrQXJETLiM=
X-Gm-Gg: ATEYQzyAlLo+NMs/Av7zajFE3+lcQcPqjYzgUwKblTRdo9JRs4JWr2yGe6ZVzED0Tm+
	hahQX0HEFVxA79aADmmctkGr5XFBcKteRhT/Az4UOjasttLdU4J/UJ7+QPQd5DHZFVIwf/eXWMR
	/hasQgUj7D1/fxtWiUgCyxpDLwkONxKA4MAdqosMJnKXhYB7CZr5FTwKehc09U73qXhR0Ndm4gd
	fhWwP8pY32Jow/XlyoqpL6ZZtIvf3LyuoEeBmf4YrXs69gxgHimQc4YgqoyjubIBQQ0DjhorhSx
	hC05Qku/MJlaXbDr9d7376JqPZkez5/5uSI0zsandSmoIWABUACtY0JfwBQjejFehyu7
X-Received: by 2002:a05:6512:2204:b0:5a1:1d47:76e1 with SMTP id
 2adb3069b0e04-5a13caae710mr5357598e87.3.1773174680103; Tue, 10 Mar 2026
 13:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <CALHNRZ9R1XaYWeTneZmyAvGY-s2-rbSC_=bSV-nC8_zU+bGLqA@mail.gmail.com> <97134126-f1a0-43f4-a4f6-0c1bd85e0c92@oss.qualcomm.com>
In-Reply-To: <97134126-f1a0-43f4-a4f6-0c1bd85e0c92@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 10 Mar 2026 15:31:08 -0500
X-Gm-Features: AaiRm50Hf3iPK6NugLvQSXXwLyR31efJNTkfa9DQKJe8sbkpY8MxEetmFEFA02o
Message-ID: <CALHNRZ8vEcq75O_M2A4F6p_Y000SvVgu4pAW5OLtX0ucAGAqFg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU
 bandwidth scaling
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 29919257E59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96777-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 3:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 10/03/2026 21:05, Aaron Kling wrote:
> >> ---
> >> Aaron Kling (2):
> >>       dt-bindings: interconnect: OSM L3: Document sm8550 OSM L3 compat=
ible
> >>       arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 =
bandwidths
> >>
> >>  .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
> >>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 367 ++++++++++++=
+++++++++
> >>  2 files changed, 368 insertions(+)
> >> ---
> >> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> >> change-id: 20260207-sm8550-ddr-bw-scaling-b1524827f207
> >>
> >> Best regards,
> >> --
> >> Aaron Kling <webgeek1234@gmail.com>
> >
> > What is the normal merge sequence and window for linux-arm-msm? I see
> > several things that have been picked up for -next recently, but none
> > of my sm8550 patches that have been reviewed / approved have been
> > picked up yet.
>
>
> This one is probably waiting on interconnect, no? Not saying that
> merging here is easy, quite the opposite - it's frustrating, but you can
> help by responding with actual data, e.g. bindings were merged and DTS
> can go, instead of just content-less ping.

So patch 1, the bindings, has to go via a different tree; then patch 2
goes via linux-arm-msm? Or does the first patch need an ack from other
people? I was assuming both of these could be handled by the
linux-arm-msm maintainers.

Part of this was a reminder, yes, but the question is still honest. I
don't know what the expected merge window is here, knowing that is
good to know if something got lost in the mix. I've got a couple other
patches as well that are standalone dt changes with no other deps.
I've had patches to other subsystems that have sat for four or five
cycles just waiting on the subsystem maintainers.

Aaron

