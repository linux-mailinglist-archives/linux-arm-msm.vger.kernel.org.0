Return-Path: <linux-arm-msm+bounces-90427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACrbBC5odWkuFAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 01:47:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C147F66B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 01:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ECC9300B779
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 00:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0A919B5B1;
	Sun, 25 Jan 2026 00:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTTtt5HT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670023EBF38
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769302058; cv=pass; b=O8Ozq95UImbCJK+zmCPnT/BuvZCl5UuHkTs6IiQlFAnCZedG04s5EeR54gRKyujyF+z+3XmSQkDa5yuYNRNUHK2SaKKdGgNUOboC3EGxOVoPARyClQd5h5JblSQ0YR+FK5Gc4ULF8saYpmXGx29krIzdi2rKorR9gWHO0Ydn89A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769302058; c=relaxed/simple;
	bh=j68YDE5pzNwD2H8rjYp9JKTi/bC7OMC2aw3wLnja6CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjKLQJ4OTUhizH9I8VUhPPWdGn5vMtNxm+QTT7/uwNrGhZPGpArnTJqyKs6hVsc2oH5VlHU1EaDLdje1WfRrPvM4qgCAl5J5fg6N0hWuYj3JLpFa9hdc4cKR7IpvIYb6/GC8NJi5ofih56t/fIMDHlsLoXntJA9ei+YvOSup1KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTTtt5HT; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b883c8dfb00so710091566b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 16:47:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769302054; cv=none;
        d=google.com; s=arc-20240605;
        b=ePQy9HTOHe9tMaq100r00R/T3t8Ly42mBH7DWz74emzvfh8zk+kRis3AI4n7rTj+gw
         BzS7C0n72w0Diww0S0IyJ5VhiYijSMt76rxjp88zZXHnUpM9sZtFUFlZbEzMRpVwFpa8
         dEpS+O/sxcZUHqMoWS1lwx3L7C/DjWp2SYRQPML+wsmqqm3rWMrInImwMrYru3oRSQMf
         CDbG0x3mGiSOOYYnYyBzpMSnE40oao7HHM8XBs4x/Id8irWsP/NqULLrqj8mFquFQtfZ
         7k7lpgM/YkFsvzbjBXmvrjcqKV/LQXERX6IRlwBC/DqMkwaCGg4ev75hCqJhB/+4YkWU
         +D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KaSAerxnhUHlMoEW4LEuB3JLwXOEBI6R2O75mA5dTPs=;
        fh=ea4XsJACiYPrPGLjk0kxGpbs66fGA4MFbYkhTYr0HpQ=;
        b=dGK8YMKhzzmh1S5Wg6RiOQ/u7ASIJ86DJcL3rcTVqogvTLEsW2EOWlmW7ly154wpJX
         elCfStZTX1noIdq8pUm8KNKWYb2qWlyOfvPHJR7CVSZPOsbWG9VRONonzqKkD3s0pVy5
         Cy44Qs3uUbArSN1LCshTk1QBZTiOt7eAJMXJFGrFg7oLIyy07JdN6T0U2jDieovn6FkX
         CHGHJNJzCVqyz/bamdfCjWMZRbAqxCSGfc3MT/bm/7ggCcSjEyUK2wZmwbQIB03u/lQx
         3dFV2CFzYmYUCsQmHLXqrpHdpgK/Wii+pBehNHjrpVO/UMMkM1iVSHd6zJpYdaGWNLU0
         YhJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769302054; x=1769906854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaSAerxnhUHlMoEW4LEuB3JLwXOEBI6R2O75mA5dTPs=;
        b=JTTtt5HT8wcXKjNCPP+6B4MU0SGiqrxsIIOrUEsCstcHW8Z2HH5IZuqmzqCzpva82f
         x3Dfd9fuQp1mCDb8NRX7TTfgEZt39CWfUW1+zv7k3r/S7OwI+oIknNiG64/MiMBR63S/
         2tffV+rRqYMnfqSIWf/BFUlDKNYkyXQIWzKfi4045k0Olm9TeKwXDs6bSLc0A6fi4QcY
         xxe4doCX5pMAz0iBaoep2pVM8aK5MVcMoZMPsV5IgOqXMvPMp3xBy6dDtKhgLKkjpnRz
         h1puAss5ENg8SSD7sTZ6r2pVyDAvY7LYMkehynFeWphVzznqusG2ilTFwAGJAOh1ER70
         qlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769302054; x=1769906854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KaSAerxnhUHlMoEW4LEuB3JLwXOEBI6R2O75mA5dTPs=;
        b=L+QWvH94acL62FTq/aOtfmLvGYo6HNyJU4L0qnGG2MmztLiM4YLiI8LGTKQwkic+v0
         TbsivuqD+n5bfMTgWiWhL9dT6a77WdsXmDd37RAY1EcfRq15/5/oII3AWLU48eC6DO2v
         SrQe3BmimCj+fR4mU7VKccyhFuRRhVtYKXXRDKqlMw2mQNYTqZc4DP588mhjFdqDZNQ3
         PTamlCarW4Hg8KdHSGeWT1KwdvxZThgLwzF8xntShG5oE2XqL3nx2OSWAsftsSi0oL2+
         MjjLg8fFSSq0onuZW8iyYzx86/sxDVEaxmuZp+8Qb/B2PRR1gEKVNuSb1uC8wfkYd8W+
         QMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt9ZOL1Gv6j1JeT6Ylsv4wW4EdjhL4CoOCDxTFe9h/7yBcKY1kamAEGqesDc6SiEKZMgn488THz5U1Rdnv@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUTT7Ncw6VbtMNOVOjXEd581n6AuzZUxNiisNUrO33dXIOf4Q
	C0zvO+FVCbbeTsY2+jHElBEo76LQcY7onYShHd4yyVXjGNRSAF80kF8xXGf+FcEga6HF5mKHNJE
	QxVnFkGqmo4U2t3+0d2pJoDId4Q4ehOU=
X-Gm-Gg: AZuq6aIVdRlUIzEhKBir3tDPzR/hyR/tB0h9xZjWpXzz4eQcniDU1SdQea0qq7ZRj5q
	5KaosgAVf7Q5r+xgtOj31jPusy+qrKC646RNqmyLRV+VqYV7bw+tbINzIAi58gR1q2UkVReIvAr
	2HZV7Hz/sAu9u+5KFPMeZoNPoNxYJWTA1MgggILtPahcq44aEcfZJ3EqvTqYBi+pZ3ne570oIom
	XEcnf0UIQFZbD7cO7kaafLg2pBArMn9+dc7wxryJAaeu5j+RpwTKS7rZdXfduY5xWdtHvLOP9tE
	kjGZnyo=
X-Received: by 2002:a17:906:794b:b0:b87:6b9c:6386 with SMTP id
 a640c23a62f3a-b8d2e883dc6mr19707866b.56.1769302053616; Sat, 24 Jan 2026
 16:47:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-1-394609e8d624@oss.qualcomm.com>
 <CABb+yY3v7RQTEvnd3g94ntY-COHwKcYPuDfh77bEKzZ-PS65EA@mail.gmail.com> <7ed55d7e-869a-43d0-8905-c7d9263ca505@kernel.org>
In-Reply-To: <7ed55d7e-869a-43d0-8905-c7d9263ca505@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 24 Jan 2026 18:47:22 -0600
X-Gm-Features: AZwV_QiB7PopHFl17OYpGtV7RF86gL2WZmVdv9UWEB7fLHh2IOlzT3taAeKj57M
Message-ID: <CABb+yY1kKJTxEcbYvoHr+7w__JNKEyKXML2RcMxjz2AvQM2c_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Document SM8750 CPUCP
 mailbox controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90427-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 65C147F66B
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 4:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/01/2026 20:40, Jassi Brar wrote:
> > On Wed, Dec 10, 2025 at 1:02=E2=80=AFPM Jagadeesh Kona
> > <jagadeesh.kona@oss.qualcomm.com> wrote:
> >>
> >> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> >> SM8750 SoCs. It is software compatible with X1E80100 CPUCP mailbox
> >> controller hence fallback to it.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox=
.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> >> index 9122c3d2dc30fade96eaf54aee41f890327deb6c..9d99af46e531aec615f91f=
1c139ce4fa482e41c3 100644
> >> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> >> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> >> @@ -19,6 +19,7 @@ properties:
> >>        - items:
> >>            - enum:
> >>                - qcom,glymur-cpucp-mbox
> >> +              - qcom,sm8750-cpucp-mbox
> >>            - const: qcom,x1e80100-cpucp-mbox
> >>        - enum:
> >>            - qcom,x1e80100-cpucp-mbox
> >>
> >> --
> >> 2.34.1
> >>
> > Applied, after trivial rebase on top of "dt-bindings: mailbox: qcom:
> > Add CPUCP mailbox controller bindings for Kaanapali"
>
> Both patches were already applied (see other emails in this thread).
> Please drop.
>
Dropped.
thnx.

