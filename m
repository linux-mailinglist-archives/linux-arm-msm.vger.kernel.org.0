Return-Path: <linux-arm-msm+bounces-100823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCXPFZiUymnF+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:19:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 157BE35DAC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 17:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E7AD305470D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8D732B9A1;
	Mon, 30 Mar 2026 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="D0xGysUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9113290AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882544; cv=none; b=IZsthUl1hx9/O5+f71zYcG9TllsOb7OA7q1xcfYtwpx2vvTMMVR2KHPln5JpCUguaqwiimsnty2y7qPp222BXJ4wqgBgk2pY40aovcQFR3hDkbIev2JelJXevhvFSIkB1tjay595kdq3gfH+bg/te6VsIAdrRg15eOmyw9RGdN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882544; c=relaxed/simple;
	bh=ALD3uDNicTlrTjfpZN84frj9IWM1PUG20b/GPPZcjkw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=E1nefVk3tBNntorAi1P++pokKhBRVAm8J+dUYaaAdKO6iEjJDXV7v5Dnq6YwtUGWzyZ6RdpfGc/s4yPEZoT2PaDy+VlgvbTLbZ5aU5ror/b4SoQ77YZ2eO+31v9v6JfRBUSK9/xCzxmONqBY+6wQVDAAWCRZItl+768aJJVOA5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=D0xGysUO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9961e4f71bso693687866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774882541; x=1775487341; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=469O081Aaa7aoFYWvcsfiJCJp8arQcJSe+eDYXLPnyA=;
        b=D0xGysUO4tD9ilbCGSWDFxnbQ1YttanWFBZtidn+/fV6kkOfmpuTCaqgcStYnN/A2f
         1rV0HvtQDwqgger5BwCPl1z0/A5QiF8mpqOwHvVM26IKlxdEWlHrq2QsyUjSm3XreuWJ
         7m0vMn+w8eBNjZJv78Tvn1CWzBi9yrdl1xaI7McMKv1iivjDm98W4GZQE4sSLNoQd2as
         ddYUeuhvPl/Qn/SsN8lKz6FqtyQ5j9YzybZeMG8R6MAv3AVgxAu7gONb+I5chp7MjUqy
         wKaNgfYHJP2dE8xptw+CggpzCmROvoQgM/VbSsYCIo/D2/bknx4Tp30Br4NK0qz4vE1B
         FeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882541; x=1775487341;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=469O081Aaa7aoFYWvcsfiJCJp8arQcJSe+eDYXLPnyA=;
        b=YALz4ILnZzH9YZa3Ypqe9DnOueQY+bEN6QtX5MJmQm2YTH03vqzn/7sRktXJcSSRav
         JTCYYP+YM6xyDcXb1hs5U8aOkEVS0F/KUQYFzNOcYuAXcPxnO3ZqwmYM9LcAaInY1+YL
         eC8tFTbkIor/YJ1B/eZDUYll+H6cMXB5QD+TwqjmNTxrxK3A3OnvXda/a8Yiu3pXq3iH
         SDmR4UlwwjsvjBwwr1xPggkps34uO55Iwab4YUhMSv/D/2uE0+tNHNE6YTpmFv/0atPB
         6gtUO147sD2xPusWAPdt0AiUAKOxWKBbJOBliE7et5btvUVDTBGceuhJkmocQO7M+iFB
         XRjw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ25uuyf3o9JszS14Ih6M+XJqkuDJMA811ONVmz3J1KG+Vat/AFPb0boHLtx3mHARGePAfFQwyrEn3M2Zc@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrAMuAkKbXksTfYPPQoheDFXxCteRIhx3Sn+bE7hEjOHkSETC
	TQa+PRIhql5K/Ssa/pbYfYX+U+HDWrOAVmJTb+/sH8jU2KabACh7t8G6XiKhSbpypzw=
X-Gm-Gg: ATEYQzyJNb6dwhGUTiYUFf9pGGPx37dL0xCNnStoZEFbLjqcn13ABbFh/w9LO814T02
	qhNYcuR0qBg0RQCKCjd5cuxPVHbyGvsydDNHzgmpkiIJwr/RBC3mqlVyIdoSCFwUrvXI3jYs/bj
	OF4MrsCqWHLoUEhqby8VIRF6DLBo2GB1daz+Qh5ECNVQlEu6umvuv+dZhPhyvuxqIvEvs6D+8d5
	hmZIyA9M7Gx51O5UcwcTKw0KAXzre/NnpXXJA0pekmESVRz9RyTUa/KqL8xxE9kA4gwgo+8xwMY
	HKNY6thOcBFaAYJcvGTYesbVP8/5TQRIWkrm2C2HS8yzDC4L6NSu7oL2EamFF3HxkSvQh7X5gFi
	lNyCf8qIkre0hwFMBdseZicCPBcKpLWawpKgKtMyCp7w9q4iydRqCdQiw9SdhiR8Du3NtJSdpfX
	oPDj9E4SP3IlgcP4G1hT60nrw+KfNRNwyNqWt4rndj5T5qjSP++iLE5KIHKWj4Abklq7P5
X-Received: by 2002:a17:907:7a89:b0:b98:9da:4d94 with SMTP id a640c23a62f3a-b9b5095e40amr877735966b.48.1774882541028;
        Mon, 30 Mar 2026 07:55:41 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fbesm301940766b.37.2026.03.30.07.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 16:55:40 +0200
Message-Id: <DHG7CMLREKDF.2L5V5VQCEYDKH@fairphone.com>
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mike Tipton" <mike.tipton@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Taniya Das" <taniya.das@oss.qualcomm.com>,
 "Georgi Djakov" <djakov@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
 <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
In-Reply-To: <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100823-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.software:url,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 157BE35DAC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mike,

On Tue Mar 24, 2026 at 3:48 AM CET, Mike Tipton wrote:
> On Mon, Jan 19, 2026 at 11:28:07AM +0100, Konrad Dybcio wrote:
>>=20
>>=20
>> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
>> > On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>> >> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>> >>> Document an interconnect path for camcc that's required to enable
>> >>> the CAMSS_TOP_GDSC power domain.
>> >>
>> >> I find it confusing. Enabling GDSC power domains is done via power
>> >> domains, not via interconnects. Do not represent power domains as
>> >> interconnects, it's something completely different.
>> >=20
>> > The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
>> >=20
>> > For the power domain to successfully turn on, the MNoC needs to be
>> > turned on (empirical evidence). The way to do it is to request a
>> > nonzero vote on this interconnect path
>> >=20
>> > (presumably because the GDSC or its invisible providers require
>> > something connected over that bus to carry out their enable sequences)=
.
>
> The GDSC itself shouldn't depend on MMNOC in order to turn on properly.
> It should turn on just fine without it. There *is* a dependency between
> CAM_TOP_GDSC and MMNOC, but it's in the opposite direction.

I can personally just write from practical experience, as Qualcomm
doesn't share any relevant documentation with OEMs.

Without this patch the GDSC refuses to turn on.

[  291.055839] ------------[ cut here ]------------
[  291.055860] cam_cc_camss_top_gdsc status stuck at 'off'
[  291.055878] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x=
138/0x144, CPU#4: hexdump/1995

With the patch it turns on just fine, no issues seen.

As Konrad has written, originally I didn't see any issue because that
interconnect was being kept alive by simple-framebuffer where I've added
'interconnects' to keep the framebuffer alive. However when testing
without this, the GDSC would refuse to turn on, which led me to this
patch series.

Additionally you can see in downstream devicetree you can also see an
interconnect defined for the "cam_cc_camss_top_gdsc" node:

https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qc=
om/proprietary/devicetree/+/refs/heads/odm/rc/target/15/fp6/fps_overlay/vol=
cano.dtsi#2943

Regards
Luca

