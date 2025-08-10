Return-Path: <linux-arm-msm+bounces-68223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41986B1F9D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 14:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDF933B54C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 12:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406A23D29A;
	Sun, 10 Aug 2025 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mIzuZOW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5B201276;
	Sun, 10 Aug 2025 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754827275; cv=none; b=AhkQ/T8+Xp+zw1ihj4OLHib8vCMRiUjqbdZm3BP++jyZwAKhvc7Qz/gJACTvfGTLgTIxR0XKjF7PzgSYfvBKDcreWTP2rVyFTBmpysOkhWVjDvb6Fl1Hk3YVYySGp6/VX187D0zfsKuZsRk4Z/XZvRhlFSx+6UYtvqhueZKoYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754827275; c=relaxed/simple;
	bh=k9B2JCKmSZUIJRpLV8OYvueqHpattOGdK+TE2s+olQo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=e3vm4FgcoeCieW33RuUxn3G1bRaUfRFNL6vPZZMjO0tGDZVbD4wWdzbdrXy4KOTljdotAg7pgAo4WvFeSto2fRDBS+uTEe1wYd6bNELG7eP2tyVYTzo1Rw47k3zTge8w9Hz3KInfZL/PMsAPZNoqrLeI+yCPnop3qXiMrzDMC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mIzuZOW9; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1754827228; x=1755432028; i=markus.elfring@web.de;
	bh=k9B2JCKmSZUIJRpLV8OYvueqHpattOGdK+TE2s+olQo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mIzuZOW9AmBMkZTdiU7utnISbkl3IulkF7GPN3DkHzlaeXQM8kElU9cqrA14v3Yc
	 K/4AkgNaSzcC6nZaXO1WlRYuf6C2y2igskfsmhRmPyxIMXtus51mISN6bCIGZaU+e
	 yvBD0NxMkB0f+JQpjroeX4ar2GAr+04aAttuyH5WZkXhc+h4KIGRKYgXaB4ZmOi7u
	 iJ8MdXB1oQ6wC9gk7lI5HAlu8yol6DlqMcS/7AeVcZqo5RycSEUD9rgMumCk/yD15
	 qBLBu/mj80MP1HrU61fxxDCHmn7RP7fuCIVaXtQ8tN6k3M61kb528Jue8kHp0sFmD
	 KRZnchNFK/IQpO0Tjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.214]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MhWor-1u8BOp19xj-00bziI; Sun, 10
 Aug 2025 14:00:28 +0200
Message-ID: <f9dfcc92-4591-41bb-973b-86d12ca37e19@web.de>
Date: Sun, 10 Aug 2025 14:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nitin Rawat <quic_nitirawa@quicinc.com>, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250809134445.19050-1-quic_nitirawa@quicinc.com>
Subject: Re: [PATCH] ufs: ufs-qcom: Fix ESI null pointer dereference
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250809134445.19050-1-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tNAT3Y3hWHkN00T5qgcJuljXa+yFPG9RuKonbjG/0VKoePFkuWa
 948cjId320pm7wQ9NFN7a1HCBmCesSs3MipV3dzH+7AiyD2ruroIZKELOvDgSbGJ9HgazpL
 uANwvQl1XDvnWdGAL8d3YkdRPSgkZHy8y6tMvQXLwJ/PO5eDOmdRK0KJzZjqblGj+2cnUeg
 RahUq7PdROeG79Oe8bZeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r257I7fehCY=;1kvrFLrPT3nppF9dBHcFwLnRsiB
 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
 FwrvMHXAKZQ==

=E2=80=A6
> Fix by restructuring the ESI configuration to try MSI allocation
> first, before any other resource allocation and =E2=80=A6

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n145

Regards,
Markus

