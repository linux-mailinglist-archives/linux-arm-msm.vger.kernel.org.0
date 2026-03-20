Return-Path: <linux-arm-msm+bounces-98893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WExOAyL+vGn15AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:58:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2942D6E70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67EBD300850C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E578E363C5A;
	Fri, 20 Mar 2026 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ESQtkPJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2E3624CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993497; cv=none; b=JnI/Mler2lEAXMyxcWY/ISZ/kq+DuhOXERO+j8IlBYN4HnySwNh43PRUPRorKSvOLVrsDoeM5bM0cQnA4HZXcQC7hzod+7jhtgyKl3iRCKD+cKf1yEfAPjxA12WaCAfsNYqYY9xp8xAC9D0dPAjeuIRJTd3Vf5fJInEJM4Q36yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993497; c=relaxed/simple;
	bh=9eDed6TPehI0qw7uXAXp2VHk1yY3TdAoNKukjEeQP4U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=lsCzJuVMDBWs0ohLVnwQDFF2fSJtuxdCi7ouPDcyhAAZ7sQDXdW9sImKQWndeI4uvj5ijM19jnU7Mzlap9AncY6f5RWbDU2sH1/nU4caJk7oqxj94cIBlXr83nj0CcFDS1k8vixumXkTHq98mR4O7dofoEQQjGvWnbZYNOrgwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ESQtkPJh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so491638a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773993490; x=1774598290; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eDed6TPehI0qw7uXAXp2VHk1yY3TdAoNKukjEeQP4U=;
        b=ESQtkPJhQT4pk5U+DgbtjMfLeXxvR8M/HtCVxCfaZkx7k8Pw4S9z9NISRDUgrmjCXi
         VGx6CkgW+ME4yG8v8tpYhH8KGqhZg0B84OVm1drfOZS6X+L/CKSlTsBHL2c7jlttwMGZ
         W5UZy8SObvq/NGmZBm1+d9R1pp+e2JmUEmpLCuX4u2UuNIONJecDj6QAGiCTwceBiQEZ
         eqISmnRFmuaj3YWLGK8UTL4ingazOqdjkeg4wmd6QSxSgSKHooSLfDbRxYOrL7KjPE7p
         cqso/AAH8aVjVmFoH9/LkbycXymfKWCIpeh6MQdtmdWWQjqy4WDGKAN4j88KSSJFLpWL
         WGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773993490; x=1774598290;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9eDed6TPehI0qw7uXAXp2VHk1yY3TdAoNKukjEeQP4U=;
        b=cyOk/nav3loxd2FUGVQSODqUybLaK1TevT4VWAQuE9IA+TD78bIOydeOE+cvWfj05f
         ZGx7ZOHwru4drKjFJhghHnDurOpO6Ly4QoFTgx3FYzRUvqLwjVs55lDrGiu4F1ayPLF3
         vdSoEozLP5v7e5tTBLyZFoOvijsHqlcgGA+yNJoe6DUkjU7DNv8j/4vzcgY9uxmoU0wh
         F6yLWxAKKkiFTqf4U9n9XUNvME5H7ohluE45YwuJSUb+zKVnB/wSbF83BteLG/C2UHZv
         18hiOieGBLtZo5rTlweYKkx067aGf6e+pfyT7ZtuR4CMToCATNf9iE9OddZhnPISmyeY
         KRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4PeWhk5UmUKE19VpAo5m8Od50yiXo0oAIa4mJlmxVe2hCobSkWqafsgJkLvko++rygFb+jcJ4hOF+K3ub@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4o0Y5HpER1jXsBTRQjEBsX3lbgpFTh2NMAmhs9Epwu6zjG7Uu
	shlz+2uCcSKuULhL3/LWcg3DNulbWtgRnGDL5uzHtthpUBvCDAGDevh94pC01nPuqnA=
X-Gm-Gg: ATEYQzxSzAFDLrcmPpQC8dedIY6s6WwI5MmI0RlIa4ATye2ahXjcyG+1kLuC7zOtbj0
	dMW18BxAWBepLDZjb82EVj4f0IaBi7Jf/ZkrByVDja+3eDAKoWCqgZ/5Z8ctTcMOHY3JqhFv6XQ
	LV03mY1MMV9JrkIgN1MivSmXUzaoYkzsjbB715KxxaEte4kv6nS4oQgkPQwwFZx2hkXPBol3cL4
	9fKWXEB6btOvv6wsK2XvAL2ghq/xoI8N9zQQ1PGBZAPJ97XZ4awJ94mP6jk/jQmcUU8hQ5JxkiQ
	VFI+Pof4n5dXSqMjfEInK+yGPALZTjv5aWLkxWAiST6fq7c69ZYfv7FXjceSl8dVeATuhveT7Qa
	90DH7XgeEfuGqy1/HOvjhi/CWZNS/kZRpCgnFHxKq9C6WX/I9h/91jz9llYL20czAAWkZx7Q2ub
	9Hidv0i49rHcwsGdelreDegJPjUHo4bslAcWuV7JrLDTTrsRR6DsMMA8Ru14ha54oY49uV
X-Received: by 2002:a17:907:6b8e:b0:b97:b6ef:fc8c with SMTP id a640c23a62f3a-b982f25c0e0mr131299366b.23.1773993489994;
        Fri, 20 Mar 2026 00:58:09 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365dbe4sm118826266b.47.2026.03.20.00.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 00:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 08:58:08 +0100
Message-Id: <DH7G7HV3PUXB.16AVBPYQDC5RD@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
 <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
 <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
 <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>
 <DH41T22PJEW9.3EO3P50QRXG8H@fairphone.com>
 <7d3f650e-38f3-44e3-bd70-319a16d142a1@kernel.org>
In-Reply-To: <7d3f650e-38f3-44e3-bd70-319a16d142a1@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.984];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 7F2942D6E70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 5:58 PM CET, Krzysztof Kozlowski wrote:
> On 16/03/2026 09:03, Luca Weiss wrote:
>>>
>>> I went on and checked. No Milos's soc_ahb !=3D camnoc_axi. They serve
>>> different purposes.
>>=20
>> Thanks Dmitry, appreciate it!
>>=20
>> @Krzysztof: Could you take another look at the binding then please?
>
> It is two months old patch, so for sure you need to resend it, but I
> gave my tag now.

Your concern was addressed in a reply in this thread, so I thought I'd
ask for your R-b here, instead of sending another revision where you may
not feel like your concerns have been addressed.

Neither option feels perfect.

Regards
Luca

>
> Best regards,
> Krzysztof


