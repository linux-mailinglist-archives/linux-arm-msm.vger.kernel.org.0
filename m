Return-Path: <linux-arm-msm+bounces-92262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJajL1DXiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:47:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6182C10EF38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 263FA30058C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B607636EA98;
	Mon,  9 Feb 2026 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="dPAd89aq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BD10F2;
	Mon,  9 Feb 2026 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636448; cv=none; b=PULv57ltK2IAPCRjs/q3w3j/r8SAkSPI2M2p2yae1R6IvD2jeBrHtB6cMRrZ3J0PID1OJN5rq6vUDlgj1pqAYyk5NZwjolUzPu1A8mqlUNhkVchSONQzmvIN+kwHradc0bakvF7DDSwu2XKM+IKWfkZ6EMc8wNE3FofHFm56iTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636448; c=relaxed/simple;
	bh=Ci98xsW9EY1TON/NR9jHDoabdpxktSGoJAQmZMNonos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qLAYt7vwhErIoYBENL0GU1e9WAHxb9vQZwM7ZWP58cylB+gzeGNXPdDqm8wYpss1dH7UhH2YeVPSJpO92bNylOaNeGYPtQrA+C3RAT3Qw+Q+wEhtVp1Iv7bCUkEtvAEJSX0XBaJFhbcHyMnt00ls9SmMQoTZyfIF6v6KsXfWdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=dPAd89aq; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1770636441; x=1771241241;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Ci98xsW9EY1TON/NR9jHDoabdpxktSGoJAQmZMNonos=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dPAd89aqTxbV6SRDCeMaYezduuoopOzYbHMebPSku95wMB/Ot3/YR+eRowU29qI4
	 TZRpCmEZ1wU/L0APvGck/Rdz0gpDlpJX16byr+lo8QkUe/PVINIE4ljMYwxaMknWF
	 MUy0nTJ7uKCMPbaNo0dAMoR9iT/YieplkwSR3Y990g47x3uE2rvXNpCKOnqBpep5x
	 jBNc7PqqG4MejNMP7S0Fqct0R36BhWatnCE/NYjof/jygNWTzmZ72DXGtxevW+VlX
	 X+gWLUypsYrH13cpgD2kQn3NsBGgR/TboezPaaf4gUdGumh6/YTKa8cl8f+SQO/74
	 tmXjH1fN40alzwj5Bw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.109] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MhWx1-1vKlHm0BxT-00pnwr; Mon, 09 Feb 2026 12:21:45 +0100
Message-ID: <26711953-5f15-4409-85e7-f8d93c377137@oldschoolsolutions.biz>
Date: Mon, 9 Feb 2026 12:21:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/4] arm64: qcom: x1-vivobook-s15: add X1P42100 variant,
 restructure dts files
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <7e96bff7-9b9f-40c5-b21d-663115a6459b@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <7e96bff7-9b9f-40c5-b21d-663115a6459b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pycj87TjOI4gtbSnw+RJ9SHrF06BeWsXwN1CB0yLtT79xEljTDW
 dMaYUt9c9GhLdihQFmFSXqi4xiXTfQBGGrGJ+HOeQUC6b2QC1rkentv20lJQHvPL129DgPt
 YJAh9ywszyhVN3juXWjmltarIqQemzYUp4DsAUygzVEndzAV8HgrVHDlm424vY4GojbcbhO
 RbgldLS8BC8l8g7KTaUSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:071P/sDOaVU=;j4VXBIzvd0epGfIRFPSoPSz5Y1q
 gzzuv6+otzOt6h5eYIAC3H/0lkA4Q2XHflMH+Mybyueo9jEL7xczixLVNosYi2qID6fM5Ev0L
 MXdAZxi78znz9IFnVp8sWpPs8ZrSC9ud7Y1joJTPBjR1G7iljBdVFvhTHhwRYsRnN/2SQhWCv
 LkH8FHp6H9xfowrOv3MBYW4lS4jFCn35sR+Flh9ORs+UH3Bp34+0/PI6YqzSyr655ugRCSQUX
 QiduSyjCFro1YJc5rX9vci+czFamU4ACnxDDK214l2hp1a3S2I3V/3uUZMxetq83qw1GtVKlm
 ndp/UhZ2eUC6lZ3wxE9d4bMWko0LJfKPqaGBus8kc8s25QUjajMyigaGiXbKE9F3betl4Jk7k
 x/9Jdk6ZR6cAz4B6lzTu7HoTc0bpnClQQ6fQ8A9M7gPBLZ1SOT7TXw8Nhm7oa47s5fCf+BFc0
 4CeiH8zGJXiWxDGP+AjaO/o2hCDX7iTYGc1pnnHnLIl8YYgXPZnrzgtCp/ALVlE0qbFIT5Ax2
 RiWWSmU0t6XOlLRqBZATGXcXEIDbFhGhQ4ZWITq3OZLPGpW/XRw84yrfhUwiEezXXC8/zwu1c
 iHRpIMypcNgqEUEGcZD0zTnmx7R2xDU5BtdZb/74OSt2H473WGiRJ3vsD7urW5636SJqtupAf
 UzPejNG4zJgN8ljfnyoPGhP5zr7+q2VfIlA95wO1+/vmbUlYytlmw1rUue/yVmjm10u+a65xN
 MDGlaWmsU8TwAQAaqGs2OxXB78XydJju8aEXaCGCKm4XUWvjXVkqyhHX1VgiFwyM2qwBVqut2
 lsSeRex6K2UmKPULzPgrgYLCOqKmrboqUx2iKsD2PC9PqXPeSOId7JBDxOLmysM1fQUzMJmQa
 hmfBI1glKYL3pZACZwlvQfof5DYSZ9cn33Yw5QEJQHkdmqImzWBZhyw/0hjotXrrN3r0ry2fQ
 30knuFeR7ThSV9gVcsupWpi/lBJ3mBiPQqthd4hZg0/MU6jFMCGPuNF3sD70CE/WbanbyN2T1
 1AFxD1vZHs9zxBo1MzBP4pNEruKJjmEXIf++JNCXPgW1yacCM1U/ieBPhKPx94K2sWBU4+Uiu
 7yCw4nlcIJpSR/YZittXBdGsiz2l86j9gjBdn1uo8u6iM5UVVd/RR5maBWns6AirGjNFdwNTU
 Hpqin4jgo7ISkT1/AIF39ORxG8LzzhZXUFeKk2jLTa0hL9adFTMfeSPzWEnIwiMyD3wgbUWuI
 saeViJhPm41Nx7ertd9Z8IkvC1np20ft9sFigaWj6dQvNJNKD+NJLHZLuV/JJ47KZF3GFkkmp
 Q4o6eRGndUVvO3OB6ueDAoXYr8+sygdVXz9pamgKstTjoFwBQdY3cDQy/gYf2pypDEr+d2Ckc
 o2l1yi/aPy9ozmmTid1LiMJcP23eJw4oGdljiHOhXM08kaFsqxjg48YyBY/p8rxQk++TSYnEA
 99HgGGY/2eJAOhk2amUofvVs2i5R+IiLLqoiJohSOfbvS0l44txIM+ZFL63Oz/bVBD2MKkoUx
 /9MsBQyexdr2YxIXdIm8gNJ5zmhK1F6241kgN2usIWbpd11WXz/62kggF89wvmMrQ8foen1lq
 EjQkMN0Q7S7yPaGaJRgBZtf6HvmNynQs3kIj5c9wpZabBWNmv0U+KlycKc6/u0INEWYWy5Uss
 9P+0GSLinw3IeZHSZ74Kr3sUJCa07qzoH5O+zvKdZpIEgvCzXi+bhkryV1+GJcH/q1rU4fpMW
 xLMJOIE9fVLpNUsVpklUw8T+oQjTsZfcXWj5Fz/F8za040XK8sqQLezziLBLXMfFlCRF85hpz
 XL7v
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92262-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[oldschoolsolutions.biz: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[asus.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:dkim]
X-Rspamd-Queue-Id: 6182C10EF38
X-Rspamd-Action: no action

Hi Konrad,

On 2/9/26 09:55, Konrad Dybcio wrote:

> On 2/8/26 10:25 PM, Jens Glathe via B4 Relay wrote:
>> [1]: https://www.asus.chhdakhdkom/de/laptops/for-home/vivobook/asus-viv=
obook-s-15-s5507/techspec/
> I'm not super sure about this TLD..

Thanks for spotting, the right link is=20
https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507=
/techspec/=20


Will be fixed in V2.

with best regards

Jens


