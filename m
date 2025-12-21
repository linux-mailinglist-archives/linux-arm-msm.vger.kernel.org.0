Return-Path: <linux-arm-msm+bounces-86067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 187BBCD4260
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 16:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E4593005253
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 15:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDB627F01B;
	Sun, 21 Dec 2025 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="q/Nzukba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51A24677A;
	Sun, 21 Dec 2025 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332272; cv=none; b=UxaSjpdkJNnCNzMFOSp/F3VlBKzGGF9WnZTUBvO5w8M59/FpAeAZffh6PhBRKw7nEDNGz8Uxt+lqyojBA3RrzT4ho3+Ze62tYr7jJGA40ZDXxeUZsXT6tBYlouHeYzFcsPvmuqySpafrjNdTHcNJXfYn6lxIB3RsbF0Dt1dZ7s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332272; c=relaxed/simple;
	bh=Le7MnfIeE6ofJcWT6xvlpGv2J85lKvVFqHuVBMrY4gI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r/StoxJSt1+Gk4iXH0SEmXrzfLKwSB7qzcy1jxs0LtdRXqgUHlbNfuyLbioDQLpbQsEJnYoyL1jfS3xQOe7xyYwZpbFe9qFIp9RTUjepDpjGgTua6T8kAlOkTCEZSqZYxDrlP5yBx8yrnuqsZ5DQneQuBP5svNMuN9G1NjQOQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=q/Nzukba; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1766332265; x=1766937065;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Le7MnfIeE6ofJcWT6xvlpGv2J85lKvVFqHuVBMrY4gI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q/Nzukbamj1l04GH3vNkyceNReRnApfJf+vUAB891KcLqoK9FJaHbsCG6dOtxOLL
	 vXXZXHZqdIReWxq/hK8YzjRtG+0Ws/SOcrOsiwpFWWSK4IP/DeoGaJ/1CFuCZYYEG
	 c7YODcokmxxGEeamCBehFOMQicWVMFxITM+aluSfFLYxri0hgnNk+TU/qivR5PJhX
	 xQiBxWuujXVfUc/6Ej+NzdV9BxUxkLqy3g1wTjJ65Jpu/3oJRWVFEoFq1ndVUv/eF
	 +e/Fpela8Erpd/epst4jJzmDCl0GNsCN1yAZibwVOw9COAVM3ynsYvIIMZju+OAmt
	 +sVJw5BeKgJXYi4c4Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([80.128.162.161]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MCJvA-1vgjMY3oUk-009owI; Sun, 21 Dec 2025 16:51:04 +0100
Message-ID: <625ca8eb-5d6f-4109-8000-044bcf868337@oldschoolsolutions.biz>
Date: Sun, 21 Dec 2025 16:51:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
 <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
 <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
 <x2zwsjk4vv73a4i4pj2aphvajtjgkw6mkzs5brg6adlm4gnxpu@r7pbypzvcsi6>
 <124d3c41-1826-4927-b4de-1d2d1ccaf5d4@oldschoolsolutions.biz>
 <yfddvt44btci7hxv35hskoxliahml24mmcc4qre7s6ypc6bg5m@7v3pc5wmn7zw>
Content-Language: en-US
In-Reply-To: <yfddvt44btci7hxv35hskoxliahml24mmcc4qre7s6ypc6bg5m@7v3pc5wmn7zw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H0PesZcyzwQUtaTpm0cIWyfwqjRdqvKepCV/MdtHKSCRWmlg6WX
 qjibeVJcmWNlGshZdsZqGx74Ny+EuzmkpCRc5KpsgTYQmhYSQ8l1YKhuVz2vQOFnjDxGETe
 kE8xCgyOxRBHHLJK8uC1BKlfji1gqiG2E5kuKXJSvNWBDJxOZACMzLCDgqSYVUWjMIN0sGy
 R7BexjEvfFkG7Xct9+XAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gt35wzGJhtE=;ytY+dUrIa0Of+468SygYRyjJLtV
 0FI4MDu07FK/1Pnd45XFNsD+b8KXEalY2A0IXQmU5zYUfRF7zRUx0rnSkZQuGQZlHo6DfPLqB
 G90S648aC7UpZ7nQoJlfrTO8TUGqX6/z+s+fDz+VaAQOIdiukFglfTe6HrISNFyai3O1vh5M1
 1t0wT4YQiEwFwKBOeC/g5cc4Redef5t/rSXs5Bl1LvNwzNSd2yyq+pRSqlfyMJiQ3XQE/NmuX
 rcxuJfREDBsFc5FwuCMSSbSWldwE3zBDdyW+5ul683mkdGn1UY5pReVoscVWrT8Tf6wf59WCa
 AXlNfnPUDjcOPYGPkenJpYFOSpfQq/9PCHQCCf3KuEpO2twU457j311oh2yb9kH48GERtSN/4
 ghw2Zo1kdHA5OTBiZbz1+Tvwd3aMsoMrO8zuYTSHv3A5zQgM+526RHaxzwEerId2i4VgFpaqh
 OXZYZw+VfrSnOHlc9kRJDECEbr5LvPXhy5rvro3pbT8sp88wW/7MQVijxX/gghzWM1lVG8tsf
 zpi8R6PSH8B/yEvZKcSyMG1RKvm82J0tokwvbmcGXthyUmeVaqTBLhlWk0ZT/qCSmmB7vUzuP
 w/ugDDXmM4uwCkrY4hdanz/WtGi8EvkpiwDQpQQYCv5pds+hED3iYWsmjCFNkqYgQvxIWj0rD
 IDhfyL+yeBK9NEzGI30B9ZOENzEt5oHRD/qdl4Z3O/dQBFVsluwo3YeZSpfuFLF/0ypzlilKj
 dFQD/jcJ5f70BpMoGZKjukb7oHA83i+4ly/p3V5BctZgThLNHB1DaoMu+EfAhcJMHtA15ISlw
 6TxuggmFo0qZOkRh3oKVrInV/qbeUtjN6XFJxffX8Pk8D9XVCQBO9pgdHv57TMct7Bi+y+/lB
 bV7XdROO6SgyA2bXTgo+oX4sa787eWPTxZ173nbLS+QI0hPxHSLdZEsb9j/Xqh8YL+QvQfFct
 Tdo8c/4+reQyf8KMLmi8yAYz+ZfDStOd7iMskMKjyCxXGDac5q7EUAo6G4szOZSglJX6bfjj2
 O/vAQ6ez9xnZ0mtuxrpplEEfupdvYO5giUVc/wT3/680eLbHEBablBrmW3rcWNCKxRm65HKxG
 oQ8CSKbcE9U6My56ZoyUAdV1QBrq4YtWReGlThsXKj2u/2JPXjesA4VCiOk/zPT0wJ9Ixh1uF
 3zwxSXzHaMTh6RwtPHAbR/TUmDz3xe3FydnqQD2Ox2CnAaRO83PYgD/aSct1ThN5/9vwUo6m8
 uYnGOiiKbZFVaxsQ3/w7MHo+aY9FMPqgAdN1e1kp5kCJjo/dnloJSkVtSrnwn9GP/VBTp3pBs
 Ar/N8zKKlfTD7p1fjgIM/eXaQHFI5voqhClZdzoePvxvJHn5LiawEnVA5zTz2gWlsbFEy5hMQ
 nZLJcTsU4OoLuYNMCOnr47niiSkrd8Un2gDY+7LMcx8vggj/I109QJYluLjyFBX2vqqhvbd/t
 Xl5ML5cpL6oXOS44U02BwEv0iv8Je9DRM7s7tcm6TZ4pTTBZe3dxeytAYZ2JkY9IFFL72vUNw
 cETkwrpfpk9JuOkznn6a8Y1d16hgN1cqCilglfqg2fxmlObWIb5mOj7XXBSwMokL+WkGcWcqa
 9+xmbr9lqMcVl2NDcnJsTOsgp/Qo5uiu8mmhQwYedcuQCwMeuLoCi4sm6SpCNR/WADHTlDQjq
 0+cvSIAjA092e2ecMJHr6hqSGmzPcfZDuZ6z9V/pYBF5UtJf0DlYBj2WcVU1hhsHZDnwIguAt
 fEU8jz8vZ+YBV4/QTy8NurUdxTkVY4rk/7IuC+W/0qyFesoExM+KRz6DnL6683s/9tro1G+RK
 2mXY

On 21.12.25 16:23, Dmitry Baryshkov wrote:
> This can't work, the pin can only be used for a single function.

See, that's where I am, too :) Configure it that way and you get the=20
HDMI to work, be prudent and remove edp_hpd_default, and boom the=20
internal display is gone. Maybe someone with some schematics can shed=20
light on this.

with best regards

Jens


