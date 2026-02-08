Return-Path: <linux-arm-msm+bounces-92173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHRZNXkLiWm+1gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:17:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF510A6B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 23:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC7B530086C1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 22:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CCB342C8F;
	Sun,  8 Feb 2026 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="jYSUCZlG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB203019B2;
	Sun,  8 Feb 2026 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770589047; cv=none; b=uDichIlTbEufKlpov80aHOL1E52in92RN00dhjNMrHKxdUXzFzH9p5/iYP60tIDkI+GKOOHIiGqD9Tra6EbvNNJBw+I/CqBH1hlR0UP77/7znP5RG/IONGHZp+mK+WHWHD1OIGM70nv420CPKxMnOey3cM8N7x/TIewP4Iw4Pq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770589047; c=relaxed/simple;
	bh=fM/kEI14kSqI7NhvfISk0A9R8MeXAynbDOi797/bEvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbOyTLmZgM9ViFVMC/zIaFUOvnyfqMT7JEbEb6436s0+wKoNKlvtx79EzKsEEbQzxi5vy5MA9P3laeXwADGTC1TjbxScMRo0UQtPxT19CM8ryFiPUQ6A7AK2MKQTBSRVtlOS/TL3/nKVWx/RcXoDi/UHm3/cV8Xz8/biQqVPYOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=jYSUCZlG; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1770589044; x=1771193844;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=ZHJn9k/wzslPKQUUGgsoa/8pnelKL59hdVyjpcUcW1c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jYSUCZlG9oYr/t1QjzKtXos0tsnFNqDnsRyJrwlqs0VBN95IWQfkvReCsq6YPWIb
	 R3wAH6SgLbKPQFIG4Eh99TpTiO9biy0ZRYIdpImPuCW14taj+Kh9H8kbP6JOSNg5m
	 yFsluDhqUS9CArW7C+Pol17wLiRwyimoUZ5qAApxmg4vXvAvXML+lR+7+wLbUD8z1
	 8nook14+E4Ow/epCsNiQhaMzQR3PWw/MlhPhJHQ9EJtby1mdQ9auKw6wkfK6B/clK
	 pJ7cgB6oOm3fCGMDGADK4UIyEKdts3l2OQpkmSollwfU7wBKcdbrMaOno0qPF2JI3
	 /ichG2L0HED1KSM5XA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([80.128.164.2]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MhlbM-1vKYpE1nJw-00fDkD; Sun, 08 Feb 2026 22:51:12 +0100
Message-ID: <dad0940a-9cca-41f3-871a-fca48c8c868a@oldschoolsolutions.biz>
Date: Sun, 8 Feb 2026 22:51:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100
 variant
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <20260208-b4-vivobook-v1-1-3a9b5e153909@oldschoolsolutions.biz>
 <75glzfxcgnjr52mexcbas3zzm5rykgzuhv3bflui4zrmnvov7w@gmfwegaziikp>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <75glzfxcgnjr52mexcbas3zzm5rykgzuhv3bflui4zrmnvov7w@gmfwegaziikp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WxjN1hbkToLMD5KuLMVLFRl48cS0BbGH5LaFEX4j5n+CtdfSBvk
 SUe55zNSkzPqfIv/UcmFayUcOyDrzRtk8+f6+52c+czH2c9rV9OII3/QrXt6oR3DrWjQwGn
 THCxbk4Ip47WFDBmT2WjK/WoIoMcjUCcE3oFexvAEoP+OKU2lj9zu0elmBJXbBeojDbCp8y
 DxBUOz0WcWxCDEKvGKPGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YbxEryZNGPc=;2nZ0eJLzx5l3o2wCld1RvN/XAto
 3qItgxLcQJUD5XCcI+muxD4DQ9JD6QJg4QELW+jo1KDbP9FF4nGGOlTWUcHcNQuxFlcUD0KBY
 zWNAtFCPCRXwoh7Z4bXp79S+zFO1krD7K8tjZE91aGUaWRw+V0qwWWSZic1+mCTPydTyb76T+
 DeuGfCkRL3NnKs1GwXqJKXVgK2KeSV03O3cUdoqa0WIlVcQXzsSUSqcdsY4JFv1KLFpx7lM38
 52qrVdpJmxJMmkfTyAD4uHGSqoQFelVh3ETYY/O4qNWEAobUuyBLob85YORYDpwvjJkQog+W9
 EqOtHCq1iay1F7wwyZ+8d6/BsfYefnd4F0w2uS5CDePT7FLHY86WZTjmb9VIN3FRwc5ts8M14
 123l5qq2NdcSXJ2h0Vs7KA6+YqQTblgsVHaGZhkekubl03InT/585wmP9M1ruhVoCRXiTGiXp
 /ResRt3ggCd2G5Ss2JvFIi4Y+f1KGGmuqM/MpCWvIkNhQ75IrY+191Wgbj6VaoS/UksWYA+Bv
 jDvCh9nUv/KQPibhDCnTWBr8O2mxqtQxWRspZRhD9CugA5UVTyWm4uNqGLrcy6aUVTb6sOs3Y
 /RFpzT1WeYEKhOitYIZcL03KAIlqPzj91xcl8QJaHD88vYzNx1ajlHHzrOeWJQppqi5metOjt
 IskXUXjH2AUiUqcF70192OUIZ9UCDxFGCCHXajOnYho1m2ly26ytX7+devr2cr9M7XXDo2nqe
 9eR/B8NMTFDX3jftQP8v/iu2ilGcaZ/gBXg2ajMFlas0CpZtsFhQeJ52GigXUTAtZ2zx/zzs1
 cMeG073ofrO+FATJ3TaHs4MDV5KPW3SThWGIvNMTdZpx6hl+1kRZOdjflk3E41X9hTYsdoFPv
 L9FyV4IW7g3IyCerZQyq2P4ow73Mk8y8eG/JToOhZyPuVhX3icIxZLU4Ca1VWp0dRVREs33Y8
 9GuAssE1TddVDP9aQ9OMHlB5E/x7sf+q2VABMcAFOQUwPytFWHUxS6+WUJ45UFiZYDPUY2aJW
 bqPD3vvrDinP0IyRSO7+noTtMudM16v6VVU+Zspy93+BQn18r5Jp62GRP5o+uza5FYH6a8e2/
 M5eutJNQcV+U+D5UZZdd5dQ05QeZ3zzFfVoIvRtzJHM0O0Gdqa0ZyaVjCuBbEHDCH14vqx272
 CUuBcqk42bcfa1VsOcJ72eZ3xz2qReEtnV0LSh5CPypXTZmhCsLedZcNJ+8U+HQ/qnXiqAaZQ
 w/rfTinfPcx+iBSl5D1mQ+jCyoR4GtxYWOdC+eNH8WM29e4R9rkAjKfBnaiov3YSm+sM2RSRE
 tfYX/x+3OISvkc4h7zTKP+WQ2LKmeHUu682WZRL/RzpwB+vA20MK4Z31oPxHUPhY3mDXIj0Pl
 GfwbWtDw5dRzUPF/R9/v1VzBxeWRuaJg1ZOnzYLKmPRj+bWJvCXH99k8jrRIIsP3yE06iS2UK
 KQXr7AgOEJT+eoA2sE5lK2lWNwsyzMjBhU/oSQA5llaZm3KR6rGNIvscuwioXrAboYPKmAvo+
 +yKULgFpSVmAexPmHEDdQKt7WhqCrNTz1GFawcsYvdLydUXJZQwGhzd0uco5E0+VbiCh0eowh
 0Vy7lyEXG8A0EU0J1I3Iq9t0/DJCq5VBjlrsVHYlOIexUbunxlq5pOC4QFg73DcbDr/RamA+b
 FTN1AeNrYqyCtvjXlJwd2tetB4OXUGs74HzJZThMOIQtYwMBeJvsRN+QUaAbkCsgiYBzEjgFb
 J1nqmJTeUFu5npf3b5/f85j6EUzo8zJR/0s595mlQLDpZNGx1gcfvMhs=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[oldschoolsolutions.biz:s=s1-ionos];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[oldschoolsolutions.biz: no valid DMARC record];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,hotmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[oldschoolsolutions.biz:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.glathe@oldschoolsolutions.biz,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35AF510A6B3
X-Rspamd-Action: no action

On 08.02.26 22:47, Dmitry Baryshkov wrote:
> On Sun, Feb 08, 2026 at 10:25:38PM +0100, Jens Glathe via B4 Relay wrote=
:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC=
.
>> Add the Purwa-based variant:
>>
>> asus,vivobook-s15-x1p4 compatible to Purwa SoC
>>
>> [1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-=
15-s5507/techspec/
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
>> index d48c625d3fc42f1a90f76a020753ae4daec8c5ea..5eaeda2c85bdc189d650bba=
82f173810854f5d1e 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1124,6 +1124,7 @@ properties:
>>  =20
>>         - items:
>>             - enum:
>> +              - asus,vivobook-s15-x1p4
> Is it really compatible with the ZenBook A14?

Ouch, thanks for the hint. Will correct this, it is not. Will be in the V2=
.

with best regards

Jens


