Return-Path: <linux-arm-msm+bounces-95766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLfWHWKuqmluVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:37:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062221EE06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CE1E300B76C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BEF36309A;
	Fri,  6 Mar 2026 10:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IIPRPf/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC137C10C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793434; cv=none; b=nlbKoa5udJYFeAEtkGzZTMoYkxHRLnaWCpNUPblqWIW4sbinIJakt6vZvqpqyCGP0XkjhZpC+wupH0KT1OoYYNOMW60iQ/6Xf9pZOq/StwBF42nX1GJHXGO20IW+vfxjONNUsUThQWEIGBILEnDve6ctKOJiWhOd+rTPQ9Lgma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793434; c=relaxed/simple;
	bh=9mQW205gegUibeTid/1e5hyvVPikyOjbbJTshSUvqqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=aw3j35qiMSroQl9ZxH0iSw44bZYcli5wt8xWoMH9joHAVC1wHSRcCMVt7qeon2W5jtLTiseUoAfX4tM+qx5vFnWJ6bTbxm9dIgI8/AwqJRmBSrEkv0uttX2K/K/zN0way7ihno/heL28CO1Z8kpXcA0+fv2CFeKIBZSxFN31nqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IIPRPf/V; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b936b85cc71so1142864966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772793429; x=1773398229; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mQW205gegUibeTid/1e5hyvVPikyOjbbJTshSUvqqE=;
        b=IIPRPf/VjAEUXK8IyQI6dB7AJahg7RWN0BIknY7cs1Al2aaH1qimHs6i7pawIGUrqX
         aBc1Nslf7Kg9oY+W2vanwvTGk3ltaRcuCiCopK8wVNr8zNYLxxk4meZJPXmk9utElSw8
         F41of/pPfqErHw2h00WlD4cOll990+Tze/4WHyv7MeabOpmirywwPV/uhtInqJkH0CFa
         AOqTCp4ibA+NSsget7w2J3A683K91Rnzv9I5FxK9jwggUTGeUo8/lyxTzPUluFcavX+g
         YuamSImqSprJnKZTqCh2xY094YPt5lgYF0eI498QHjdNiqLKSMboazlBT/PPI8hVjVbo
         44Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793429; x=1773398229;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mQW205gegUibeTid/1e5hyvVPikyOjbbJTshSUvqqE=;
        b=aIMdWYWImvlLOtld2s88MW9OVkE6BnU8EFjdL3/O7DkCzZ6al2i+mL9qpooLK/PWnG
         Jgw6VtJOINY3DjXbGhNyQLd2H94unaAoOXsUcXYTXzudTs0ytdTHLzbKv5y+0QMXyr84
         Wjq7NuPzXqLSZGLQv7Ntils8wLc/uDwm3u5dy3HLSpjsiZUTa/ES7B7Zk83pZEtsxm4E
         Nh81mjm1A0NwhU8vHS/IX23u5EK0q/NFf2FxT6zEjO0ElIMwLTip+Q8Vkrf3W0fW3+0v
         FCTOkttW79HzCE05FLRpTt5jioCOy25j16I086D27S2HkKaoxvE1O5QSxABO6UdkrfTU
         IXOA==
X-Forwarded-Encrypted: i=1; AJvYcCX9cKaFygqy8OdASp9efU+f0M32ZNljqd5Rj1Vdqr/mcvus66jH7v9FtW4SvjW6LvWMt/Lq+fFnTeIyj2PY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6GIm5Zo/wKS7k4kQ9uHwEQhVD0bJEW8c13xDXk5a+GGEdj+z7
	ysC43cW9nqJyl3Yc1Te5dauh8Lj/VdBUhReUHjnUlM+d6iyk5073sTOeOobPaUcxFEY=
X-Gm-Gg: ATEYQzxJZafWLmwuTHndN8wa1FZNzn59DXIxyBvM1MJH1m17wD8ba6uspodQfxNS9pM
	PEo8OoBlVcH9XbdiBQILcaL9tAkm7SiOzuVDvyHcONwbjSRBBNhJnnWCbjO6mrY2MmAMbaGu+v2
	BkxswukYm0L0/lULAJvqaVPa1+QZzEBOJ8YCakTO8rSxv8XTIRkLfJuBTGhGzTuapmQVTSqj9Qv
	4CG7GOzTgpuOYS7TdqZnDgjTwjbT0lU+gU2H/TPpJMcPqovfC6dM1ZnxxajW/uE1h5zfhMbMHzA
	FCj26E9VTnrujvl8fN+VTFXhJ+XnLmJTKa/OhEm4eg/2NYIttERqgnsHXwGeBb1rU0haiIoIhvh
	36Ove6EGppZ2EtnTFXsGykg3MrC/5xjHALjd06699Py1vFUQGFkHwVOiZR44RyDAUSkJy9Ik7XT
	SP4JGJQ8yV1jYN43QZ1gTPaHB4ScS8IdO4zrK2yeXQaC4nCiOFEqZttp0wBD3FenDsBFjO
X-Received: by 2002:a17:907:9486:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b942dfb4369mr108342766b.28.1772793429277;
        Fri, 06 Mar 2026 02:37:09 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8ad0fsm46007966b.19.2026.03.06.02.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:37:08 +0100
Message-Id: <DGVMTLXR7VVA.3UCTHBGDDIKL7@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>, "Taniya Das"
 <taniya.das@oss.qualcomm.com>
Cc: "Georgi Djakov" <djakov@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
In-Reply-To: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
X-Rspamd-Queue-Id: 3062221EE06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95766-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Taniya,

On Mon Jan 19, 2026 at 11:28 AM CET, Konrad Dybcio wrote:
> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
>> On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>>>> Document an interconnect path for camcc that's required to enable
>>>> the CAMSS_TOP_GDSC power domain.
>>>
>>> I find it confusing. Enabling GDSC power domains is done via power
>>> domains, not via interconnects. Do not represent power domains as
>>> interconnects, it's something completely different.
>>=20
>> The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
>>=20
>> For the power domain to successfully turn on, the MNoC needs to be
>> turned on (empirical evidence). The way to do it is to request a
>> nonzero vote on this interconnect path
>>=20
>> (presumably because the GDSC or its invisible providers require
>> something connected over that bus to carry out their enable sequences).

Do you have any details you can share for this discussion?

Regards
Luca

