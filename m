Return-Path: <linux-arm-msm+bounces-95686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNc5NI7aqWneGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:33:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B78217984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 671F43019FC7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 19:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D863330FC1E;
	Thu,  5 Mar 2026 19:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVeZOfAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B71283C9D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739198; cv=pass; b=bDb8zPDOLh88oVKEYxxhpSZHkzybhFvCO0GS8xzLg5iVIC8O71RN9OKWj+MIgmBlM50u9MiE8FdV/eABbwykWZkMxELc11AlaF+ujGoJk5dZfTzERGwwqlYtMuN+2AZvjxlvJTc9OpfsGH53swDYdfV4l0rYPDkgCYM5LWyld1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739198; c=relaxed/simple;
	bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7C90C1a3KVb8jtnD72x7Qz9mBjxSs3Otr3DoTlJjPyUl6JEyIMjaYvWqYv8vn6gIHQauEbyVrEwMxjFS8yF69/cDr0YI5/HhJjhTSPY6me1K07yQWC6NiMvo5zdduB1Wr/aWlC0FRPW2STvlSH8yiGV0p19IxLVckNB5V97Q3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVeZOfAC; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so2053517f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 11:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772739196; cv=none;
        d=google.com; s=arc-20240605;
        b=Ib5c0SVVmWUZfXNulY2pOm31D+EWXvfGGnVJwBKgdjHTaoFxhkSjr4XrCV9WKCygA0
         qM0lQ9wo2rNy8NJjlL2xO30N8Zshl6LF7g49jNdjIgnHrTWVDNL3Ml/Si4jPLj5uG3lB
         C8hSUZfwLRGfAN2BbWkwKfEfHfJmw6ypdDn5K9I7UN2NNS9trfV0Veo+HF06E26v0NKL
         Euu+4pwwgYdC5CLjB11erbE+qezwYBIbYcYJfUkW1pIKTWTXSToGtRU7pVrRD5NXCqul
         XofO2VTsihb62DoPRde5al7tivv/oibslFNNrw0z4SGFjsyW03eMubb7CGEkr0ev9u8I
         JCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
        fh=YXYIPoj/cxdNzM2y3/gGkvRv80oc/lPRy/xDuRCdxAQ=;
        b=HeIChtN1w7FJdP1LpPU416T7K0zbopnQt+DB3EM4ZUlpkRiSFoToh7M6al3c7hqmAr
         mWD6SxCkniJvJ6J+taIfOq6WbCoWLHKqOaq6XfVQ75/fzLdOprIkBmj5e18s9Oh6bOSc
         5sZc7FqJ0/icNMXwkxqe9jpJoYArEi+ry3s9mFTGb6BZibOYhjqct0JMFnRhIyBZ52Uq
         +K4VCyfw/M+6JlGQ2gs8FpPwFr7AtlAFExQdD9ool70wiHzXmqn2XECUShJdjD/y+kWh
         WJ6lD9jMlHlCzM032q69+UH2QBli5LvLDO4udC6mohZC2MTn0oL+7BCZOgdKnVdNfNQv
         Y5ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772739196; x=1773343996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
        b=jVeZOfACPg/8VWD7c0bO3LaI/kL5nUbhPlYeOSdEfTHOF27afXdxGnlRqQy3x4KBPZ
         1Nm9UbzSUO7kjZpPI4DFnNmXW3D798vg8pR2z30ej+P2w4rHKXeC4KN/W78+LDbXnWGC
         xnaSmN46c+6c8yEgX6D6QvtkgUhsJ1G/lI0NtyvM3EeP3ZcNGG8++qjDkaHcZrSt2jhw
         Wxk6Ek6Aqxf4dI/5g/nqXwrQqFHpZg8RpvKRk2ez9wSuwas3rXG+s88ez0wDouD3EpB3
         1jU7fxTH5Xg2gsdAoiBXb7qEV4O4qG410kjIqh6/vlTR5Nb9mARFH74fptWt5EYCDrPj
         RlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739196; x=1773343996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3qFS8mp0A4He5fJiw82IIXCHjDSfPLpUJggQOZM0oiw=;
        b=A7QKgGDc3o3Vc1YhW/TDzDiVF3lAfkBm1gGzM+KeCYqZdjCyOXJ79QV08agKLDxa7N
         SyxYnVHFiA3cJz5Rwn1mXVazTCqPCRQ6ju/SBRbIpdvcyeitpmJPW5p5tpDXtHGvycgY
         UWUvUu16ZLJBpBDhxwwCCwB5gkUXA9DWz+K0vbcI264k8zopqIN7HcAKpS3IPz6ResED
         /aY0x4f18zN3yPMufiqaiMancRr8um5qfdLx9mfCyvvh2IbUf5NWr2CFtD2n12JEaERx
         6zqJ7a8Xoo+NFoaDE410IJkjabLeiAE6rkV/b+pqNk7xu554k3jw5qno90tXxJt/iYng
         1Mmw==
X-Forwarded-Encrypted: i=1; AJvYcCVQlrHt+OGk+9+g8a6RfhlipLC3Y/pQ0rayalGkqmdbEzO051vzJ3Cm4jJhQCOgKNnfsMd+59uwo76S6RP0@vger.kernel.org
X-Gm-Message-State: AOJu0YxejPF0hb9rfsvMW42BIWMS0BKBdPhj5Uk3q+oaFw5UxHIAbi8x
	qFSvrJvhqG5C6W4AqESHIV19z7OawWBU/TcU4KkVxj8CoGN6gKlVcPR8zKwN1bdHtZk51IIJf65
	4ewQTGEjQSVPdGUJ8AvxRBKwtNwQrSEY=
X-Gm-Gg: ATEYQzyVCPF5nSfIxDo0BumJwLQnnTySlgJkSRMAQ3DcvPn5TLX+KtmjTRc6v04FaeW
	6K1IXi7EclwzalhqBnETXnbFIt/+Wz1ZEBGZvuomxSIgcN7U7k3RkxYrVT+nFAydexlvo8Omcrk
	STrv/f3P3Co48DL8Mi0xpslmc6vFGXdiSOhuXDyLMhhDelWDqvVbKOeNRog5eLJGO1I18Q9xHRT
	DJIg/+wXPblfOn5zkUB0idTSKgt0EySB2niUcMwBjRNGPlOMYRM3D6t1kzenDTNH5Fet1UtcLOs
	SE24y9Gv/Zff+sNo6Vezlg1kCfSci17WBoLx1gtm1zfGfLReDlrzW5tvepL6F4f4WKeZcDqTwTp
	KN2FHsl/HkKa8pRVqcAqLJIw=
X-Received: by 2002:a05:6000:2891:b0:439:be2e:7339 with SMTP id
 ffacd0b85a97d-439c7f62551mr14098972f8f.8.1772739195787; Thu, 05 Mar 2026
 11:33:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
 <20260305003253.1022386-4-kerigancreighton@gmail.com> <dea45e4e-aebc-46e4-a245-3603da1779f3@oss.qualcomm.com>
 <CAN6+ztxfcNR8xR1qwgHQcHHM=zoQbMd-8oggb785ssPZ7f=y4w@mail.gmail.com> <CAFEp6-3JVicAVJB_+5ceSar2Jqstexo-0tyemg3C=qcznQsmxA@mail.gmail.com>
In-Reply-To: <CAFEp6-3JVicAVJB_+5ceSar2Jqstexo-0tyemg3C=qcznQsmxA@mail.gmail.com>
From: Kerigan Creighton <kerigancreighton@gmail.com>
Date: Thu, 5 Mar 2026 13:33:04 -0600
X-Gm-Features: AaiRm53h5gsIaUcJ-3bFQKEClfESn_bqkCltTUpNu0-wZ5K6CdZUoJq1mcxWf_M
Message-ID: <CAN6+ztxepeRaYPoTBj5rkeHZFhpZbNu4UYZ1Ajo-0cwsG4++Yg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] wifi: wcn36xx: add support for WCN3610
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	wcn36xx@lists.infradead.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 94B78217984
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95686-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 1:16=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Could you please add these details to the commit message?
>
> Regards,
> Loic

Yes, I will send a v3 with more detailed commit messages for all patches.
I was asked to wait 24 hours between sending patch set revisions.
Apologies for my poor etiquette (sending HTML email).

Thanks,
- Kerigan

