Return-Path: <linux-arm-msm+bounces-108026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOpcFvWTCWqOgQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 12:09:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB8560615
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 12:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435EB3013D72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB99335DA6D;
	Sun, 17 May 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIvOeCuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A68D35DA63
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012575; cv=none; b=lfmAZUo1G66mPxRyWN2cDSWw6zb3u5twMW9gyv7mw9nP9cTW6p0LKXlNmCDTmoNfTXN+EfU5sdKiZe+X3FEuojB3Dfu8R90U65VUiqQETK7a1kWflUQzUjmn/zXGmu3aaoC4Qb3mwVDQB4PYFG50jzy01QQ13iRD87W74ZvUEQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012575; c=relaxed/simple;
	bh=F5vNZAymUdgzsQpw5kF6/hbqKevS0z8VrSXy0ZQ5xxM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FO6/vSbDH0wGPhMvTfgeeuUvATMUYoJR9kLNLRmJThsRcJS5fCf3urC5+9r55+Kzh3MuIRrbEtXXmi8Rnl5MNi6H18x63mHFcGJPK2LqqW1XmqlMbqm8oyIz0YLTmF0XWYgBF+JTTagWACTGiQaB4nan4ke7DczAr+aOu6G9uVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIvOeCuE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43eb05b1875so526623f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012572; x=1779617372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VNJLSUKdFxTUDMe2tzuMJwTcJLUa59qTrANJUI4DYPc=;
        b=cIvOeCuEeBtYpTQBF1+OJQxkUFRoKofOGUKfsHS7raDsdy55q1UpH1l133LHEgGse1
         0Zpnh3PUJWieuJtzbo14CrENn0+Ezg6zfGhRBbkXq9IK4OctuOAxhb7UcgHUgfho17fT
         bfrjmcZs5qashKAQb03PfL4/iwZTFV6Uu7ykwfQhu0rm+YwGEND+ikKVmV1rsyynxgMa
         ZDFiDO23uPN1W5/ddZJaLXLDuLp15b8qkOnLiizeOhTroqDg0O3EjYNj/5S7LaJDz8Vt
         rbxeMWiCocV3H9pqepjXnPAHjLmCcWG74liAx1yfhFHi1cN2O/apmnd6ahNN1lLKvtfa
         xqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012572; x=1779617372;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNJLSUKdFxTUDMe2tzuMJwTcJLUa59qTrANJUI4DYPc=;
        b=MOb2HXTLDEd4DC0MCY7kUJqMXra553dtiNsE3stZxHumA/7DEiw1sw5yj6xySaREDs
         1gy8mzznPKQ12WX4Ao+lw+xOq9HfS++m/ztXPjci0RF1E6F4RRWzSnjdC2uZFQeayNN0
         56t2k3XL+9mJRvIbivyVjNyrRpHkInK/glkOCx/cUOb2cNgOJOV5t5196/JiyAc3iN2I
         dBxzTA0CUnDW2bUcU3TStGhzG+AgPVMfhBsS5HA9PUqvWr1p3HpmVQtCJ+FRKG3xwRSM
         CRm5Eq8Riumj24jKPNopzd2dIBn7YvDXPQ0Ad/EkphWAOoTOv8lSUQUfQVxhN/Foo039
         a4mA==
X-Gm-Message-State: AOJu0YwjkJ7SKZ1CIOjemC4YGlbNvwdsTHGY/+J3Bh5O8a3+8ZjNzsVu
	iYaFSudg/A/fkeuBG5KFY6LVjAZyM6lL06llxaTVD9Wab225/jqZG8I=
X-Gm-Gg: Acq92OHM0z9iqRjdsX2ZJODPMkMblPlzKU0DVy+3WCuWCfyllH0Li0w0wXmhZDJX2p6
	R+++DmJPy4ZBgc1Qy8TCY0fo0cYEx9heDLRktriwMneLtG4c0CtRB/kL6tv1koKqHAcJeOOA7ew
	ym+S71TtWGQhPBYYI+5G2Nt9vz9G1Oy2tj0v3W7O3Q6TlPJD/A+tObFK1QBB45OSj2iEzD/lHW/
	t3Rn18XHvE+yK95iPEQKTgFOcQ/7N5EtUg7d0S5ES7mzJvB+NZHMQHxyXhYVJu5rvBJg43q2MeN
	wARrvrgp8Dku9xil7klG1VJ0+3PfpSScNtRxvLKeUoYIQIKwrEg3VMB3g5Qot9X6eJtkTNvl9fW
	ik28npaowD3KXIbat1gQy8rnEodEx1HyNPu76ksrg7Nbn6p/LXWPJ/rHG71jBxS2vfEkdkoc7Ho
	3uEmsY1WvkDliJNjFJz8M8FWd58eM5MAARszzKNZ2N2eBugeAuUuePlHSMI/00C2RwXTicaNX8r
	gnOSNFXRvSKaL+H42mKescCon1V9SRa6RqSIlf/+5KT7NaJCzt0wWMlTGe02OEuTsOK/teMlCOt
	E2Ge
X-Received: by 2002:a05:6000:22c5:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-45e5c6049acmr15219684f8f.31.1779012572096;
        Sun, 17 May 2026 03:09:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm30260076f8f.18.2026.05.17.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 03:09:31 -0700 (PDT)
Message-ID: <78d5673f-beb9-40ae-84f1-2cf5224394db@gmail.com>
Date: Sun, 17 May 2026 12:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt: arm64: qcom: sc8280xp-blackrock: amend usb0-sbu-mux
 enable gpio
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz>
 <25464c46-4576-4411-a7a0-4ad950605ad5@gmail.com>
Content-Language: en-US
In-Reply-To: <25464c46-4576-4411-a7a0-4ad950605ad5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28EB8560615
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.57 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108026-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action



On 5/17/26 12:03, Jérôme de Bretagne wrote:
> On 6/9/25 22:53, Jens Glathe wrote:
>> The usb0 port didn't switch to dp altmode, investigation into DSDT
>> UCS0 device resulted into GPIO 100.
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Tested:by: Jérome de Bretagne <jerome.debretagne@gmail.com>

Sorry for the typo, I meant:

Tested-by: Jérome de Bretagne <jerome.debretagne@gmail.com>

> 
> The same issue was impacting the other sc8280xp-based model from
> Microsoft, which is sharing an almost identical board:
> 
> The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
> same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
> working on the Surface Pro 9 5G (arcata) either.
> 
> Switching to GPIO 100 fixed the issue on arcata as well, to finally.
> enable external screen when using the left-side top USB-C port. I
> will send the fix for the Surface Pro 9 5G as part of a series
> fixing various issues and limitations in its initial device tree.
> 
> Thank you,
> Jérôme
> 


