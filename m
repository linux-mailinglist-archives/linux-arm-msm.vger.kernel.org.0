Return-Path: <linux-arm-msm+bounces-101546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IvpFK5gzmnvnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 14:27:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD553890EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 14:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DD56306B839
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 12:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A500A3E1CE3;
	Thu,  2 Apr 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fI58aKgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074E3DD535
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132702; cv=none; b=fzcoGzDz9CLavGnekAvGmMZkfRoVyT/yY0IXaL0v2rUpaNHpvIDcQx7A3VSeAzzq0DE/agzdaUqP1+eNbzgFEvPFNPQeNVdxOgRAcUjOGxC/NUZBLlA1TSJnrCHMxtt/tsdE9+V4tMucmuU+9/w0eYYRMm3y68o8XKeeuuX2VOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132702; c=relaxed/simple;
	bh=VFq9AWUrc9CcWHC7ojF6xOAibaAgS5IkinF3nAaUdvg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PhaxsZRTNPoXDcMiSmBEeN3png8nSEMo/QcM6RMex38LAqFpZ+NB103IId9JgirwWEOROjmMS/iTUKnfA49kMMlx5dNdqCyGOIiDQ4WVSdOyMO1Yd7Ksor8BSOAajmd5oX8SHGuiKYf5aMo6Lu3Ezott9eFiSCPaQknfVINkvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fI58aKgq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66dd0531d01so1187630a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775132699; x=1775737499; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV57QUhm1LJKEL7ZZkpUHcm6gesGlh2s479uzYXuMeM=;
        b=fI58aKgq/aSY+7Z0jlFsYNSi0x5D4tu+9WTXceYNuambD3bAFsdlKg+qirj7dcEuts
         2v6YPKNa8OvP4Q7GCGxf1TuI4QzsFq80O3AaW6VRUSXcLv+fbSOX1mrYLq1I1n2OffSm
         LRO/YU1TqqOJH/j7lTGWNq3X1VFAE7eJdX+gYbcZT7u1iKu+PeWoeWkywwQor1wOf2Pa
         Cr9P09ugasZw5iSDqQbL3uNM9akYymOkgikzPomeRz7eP19/hAg/jeGdQLSXplIWEq+Z
         vLGF0FQMrG26vj1ZdGrZUHWBi3QhQRgaNZjHYftVLgAVAckyxfvkfX+XqpNcpjpD1rJP
         33Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132699; x=1775737499;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV57QUhm1LJKEL7ZZkpUHcm6gesGlh2s479uzYXuMeM=;
        b=YnAX+P82wv7pJcMtabuTApHMN0IdGL6tAh8woJI5iDXdRMGKKWFVnOhiW77BqUD0Vv
         DaOcd2ATel/40SNKuWQI1i3/trbEfhJM6TBg6qGNytYhjj+0/Kbxw3cv4k1KqDBxL+4/
         7QpErYq3nT2RZsM1HMzzEx2E7jJWebvvVMrjWtME7HVOTjVyoUHxqT8fve55vsjErxh0
         ykW6v1ScBchPXS6+J+W8yTnm7lv2dM0ERebfnun7YC9TUQcWO4+VzEUDkwzGpkstG/o1
         zp7/EIyZ4Nt2hJ9ASrcN6kcKS4PSLianggcyY1VXQ8CaR3k1vrallrFGUmmRvh0+fqw0
         j+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUuiK7dNpnbwU3PGsULpD3JXGldySuq7e6z8NHD0XUVay0lETZaME0Irsoq1/X4+yiNd0GkIQKYV59T+yiD@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTcXjZtM5q6PAY9maWu0QPtVuRW1Wr71nIMN6OyY+3kAd8BNi
	xGyahyOdpi9NvU8gu3t/QAl6wvujRCIJ4svyl+Qzs36gyaoa2y8uK3x0ng9JH05OJFo=
X-Gm-Gg: ATEYQzy+zigcb8AZFVy20dtKWLy3zmIJTKJbOctCXl7CXUjSxLCOw8r2uI8G9qSRP/j
	mkTnD8fD/q3IymUcwpcJheC8h8NjnzTwV9d6xlF/mVieWaFeXd+Lxb1gTPNqNhyLFTJ5+8KMmue
	yYMdK8K0IzFURMEYbunJ3vEl6il57b2F5YbmZg0PAyzjGy/tdDultkPSHvudmSHd1byGgDXWGSJ
	S8rEpZF2BC8euEkja/ClVIPFwawpccmSvPFLZWl2v96qrC1wACJDXfVThXp+49o5zoDOe2pXKV7
	VygEPErHMGd/0ozxb7ad62AgnChm9NK2qKYX/YxEy4gypj2XDpSbeYvvechSg7c4l7wLHIRfTAR
	2sH2WVnvo2CWOzZlsFNaAz+j9dE6PEo0wYbFCECcpLOiOi69EFfY37H94X9JrDHdkuj+8RFE6iy
	SINWrfkJmivvwI9V+VzGUs+v06BCpXn1/hVouB0GXbLFfP3SAXaOoYhCnT3dK5cIuOGErIubYcb
	ZiUe7SOBHlZNe3Q3hhrXFPVe4FL1IjzBS5XOYuxHaNDgko=
X-Received: by 2002:a17:907:3895:b0:b97:c968:d9ba with SMTP id a640c23a62f3a-b9c1378f46emr488650466b.5.1775132699170;
        Thu, 02 Apr 2026 05:24:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec6esm82792766b.16.2026.04.02.05.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:24:57 +0200
Message-Id: <DHIO0VFBOHNX.381P06A2CRHAZ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
 <20260307-inventive-stingray-of-pride-5c2216@quoll>
 <768180d0-bab6-466f-9f5f-54b36f353bd6@kernel.org>
In-Reply-To: <768180d0-bab6-466f-9f5f-54b36f353bd6@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101546-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: EFD553890EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 2, 2026 at 10:23 AM CEST, Krzysztof Kozlowski wrote:
> On 07/03/2026 16:30, Krzysztof Kozlowski wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,milos-gxclkctl
>>> +
>>> +  power-domains:
>>> +    description:
>>> +      Power domains required for the clock controller to operate
>>> +    items:
>>> +      - description: GFX power domain
>>> +      - description: GPUCC(CX) power domain
>>> +
>>> +  '#power-domain-cells':
>>> +    const: 1
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>=20
>> reg should be the second property, like you have it in "required" part.
>> I guess you copied it from kaanapali-gxclkctl.yaml, so lesson - qcom
>> bindings have acceptable quality, but not good enough to take as correct
>> starting point.
>>=20
>
> OTOH, why this entire binding cannot be squashed in Kaanapali one?
> What's the difference?

There's no GMXC power domain on Milos. Apart from that they're
compatible from a bindings perspective.

However it can re-use include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
because the GX_CLKCTL_GX_GDSC definition would be identical.

And also the driver (which can be used as-is) would be identical. In
that driver qcom,kaanapali-gxclkctl.h is used so it makes sense to keep
with the kaanapali header, or not? Making a qcom,milos-gxclkctl.h with
the same definition is not wanted?

Regards
Luca

