Return-Path: <linux-arm-msm+bounces-108134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFfhOHHNCmq18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:27:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F7568BB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 842C1303B21D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DBB3E3166;
	Mon, 18 May 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="SdOSASeR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CAB3E3C5D;
	Mon, 18 May 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092621; cv=none; b=XazY6+dnokYe7WJA8p4IGSyPdyhq1fbjdJT50ZTaHjHZWfrDRgVH9xSFH4feF6rf1l/BP9ImyYfzMa/fgOaFg7Fnl4QLurtWJPS47cO3Ss3SVkorsbSNXOR22p/xfH+ulbReIcLN6feAOh4dD+pf81yXBcvlGZMJgrjzJJ0DTqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092621; c=relaxed/simple;
	bh=kgStGLXhG6f6snQ7zl82m3YQebIQmQ/uDIpd2ljx2/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFdbHfhB+wtgSXEV2smItk87S/+GNAUT/CPmHlW6onIkCUp6+ZFAyCB4RMgLwqOrx43xsqFeGOR7JhtJ/ba9YYxzdrFD6P5jSN+z3ziOmqZaVn9Buqy44HCE4HJ0vzxbPSwSNS2OBcVQvnXogsRAh0BNnnqPM1IariO0G5qfa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=SdOSASeR; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1779092617; x=1779697417;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=kgStGLXhG6f6snQ7zl82m3YQebIQmQ/uDIpd2ljx2/U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SdOSASeRKBe8TW05G92GQY5M5B/SpHNsBfC785cjM8P1UpJUIXMkeTpHrI7v0WJD
	 5dJ/GHKZ/JGUKAkQ43/O+gPOnClGUIaf7ofTv+An9MhAHP1mUUUNgMJ6I6pIPz06s
	 KJeEtRF8ot1EWz3mFoQZ6dbvimTNPT28kQGaq05jV2PLXdS1pPXscTIiQ+v7O+ThB
	 cpHqc9XW7EmVQprmyR/dxwRF5ysNre/2lnyZoVDYj4koyYvxtDyexJWKfDp3hGbuI
	 xgOcjzn7MNw1TUwMd1ICSK6H/USfS9S3VrLNbkyt0vcgcE35Cft1irm9spsxA1fLd
	 o7GQX4P9aCY2Jq0/NQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N0nOF-1xLH7D0cwn-00ubRb; Mon, 18
 May 2026 10:18:06 +0200
Message-ID: <f85090ed-d308-408f-a132-46d5e0cf2334@oldschoolsolutions.biz>
Date: Mon, 18 May 2026 10:18:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
 <dlpgdby6m5zsl6onu7rqzzatbq3jiqm5r5gvtxoh5k6lmuzqzo@gk4clmoa762b>
 <a7278ad1-8315-4efa-86a3-c42307ba041f@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <a7278ad1-8315-4efa-86a3-c42307ba041f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uws79Q5mnequ0MCg53aunMdwLa/TBFztVTcuh6/nza3dl1xxwMI
 1KWlxL1JAga22JsVJolxs84g1dGQM/Hhfw9yjpJYc0Y0+EOjNiWD0SsdCEt1rXm/noiCzwE
 4pyhsAzFS0YvGOysI3oswR01HlW12m+thynLCXOGeD3G7KK6MtoE7L43aTdCq4xl9xNHx0K
 ltKhXhEx0OmsOpFGqL6aw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fHk1Icj1hWc=;JwJMVYqgUlIDML6ZsFDVNRJVVSG
 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
 IFqwekWrL4asd/g88jfrMWzLMv2E4=
X-Rspamd-Queue-Id: D05F7568BB6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oldschoolsolutions.biz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108134-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On 5/18/26 09:50, Konrad Dybcio wrote:
> On 5/17/26 1:59 PM, Dmitry Baryshkov wrote:
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> P.S. Might it be that you need to set both GPIOs? Might the other GPIO
>> be related to USB4 tunnelling?
> On the CRD8280 schematic, GPIO_100 is N/C and there's a comment that
> at some point SBU_SW_OE_N was moved from 100 to 101
>
> Konrad

So the SP9-5G mainboard (arcata, blackrock) derived from before this=20
change. No info on USB4, either. Would be fun to get that up, though

with best regards

Jens


