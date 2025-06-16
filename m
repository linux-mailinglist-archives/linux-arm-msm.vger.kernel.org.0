Return-Path: <linux-arm-msm+bounces-61405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB5FADAB83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04CD3A504C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 09:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC3A2701CB;
	Mon, 16 Jun 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="xSBkN1Af"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745D202C50;
	Mon, 16 Jun 2025 09:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065022; cv=none; b=gF5RtiDU1IiXYB7XsU8Y9dIqvB6Rl4BNcXASvE7R5PJ1Mln/f+fWQtzvbFu+HYYt4YZMex64XvZ+fqWCX+uTTyeGbJCd9LxrM7oqt+i92hpoO68L6xDFnWJXwEWz0VE+9Kim/51qTnOkKffNhKD4+oUMBQ0t+YBYrUjV4WmJtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065022; c=relaxed/simple;
	bh=Ab/azGHZAN5imCLvzke6FrRFhZsJl1QU6kgQsGu6z18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNL0qhPFiuXmE3vd40uLorv+xVNHuehkHSPxJ+7CElHawwpQo8iRhsbCuBQHezW27rtr+xrHAL4egADBj6vPqfs4rQYN48vTOzqLMV8Dd/9OIzV9K8yD4PqS6z/M+pvuJ7e0Rr0ZE/Wvqrn7VW696OrgBC9IN/SoukbQAWcqeqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=xSBkN1Af; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1750065018; x=1750669818;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Ab/azGHZAN5imCLvzke6FrRFhZsJl1QU6kgQsGu6z18=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=xSBkN1AfEEtMEcgvvZ/bUfDrElxWGO4lHiVJfduxQyBf4lRe2XkT/+j90unZ1PTG
	 V4FKNFIrNgG6RaFveuHeinzSDX5G1CtoRoky0dKhY5NLPRrC70dU82vZJ//mbDOqY
	 JvK9WnkG0RTOr+F56qZtflomu1frtMf677lOD8GN/Mbgc6mrFufgj34qLGD6zxZyL
	 SIYPRflsbyBJvdSG5SdR4b5gojDrfnNnmIJ3nbNA1VOBW72zD2v1+gjG6qdE9C117
	 Lke+F58Q64Wwe6MaDDI2ln+2kS9zds0G4StGKAnwNwJCojcD6WzCTgtvmqAvS3kiA
	 9oe/9gle4d1LYNZ7Ag==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.107] ([62.226.41.128]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N336L-1unjU43iov-00wUjJ; Mon, 16 Jun 2025 11:04:57 +0200
Message-ID: <3d449803-1880-46df-aacb-b42e757f90ab@oldschoolsolutions.biz>
Date: Mon, 16 Jun 2025 11:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
 <aEffYQND8eUgJbua@hovoldconsulting.com>
 <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
 <aE_cejDMmmU48jMp@hovoldconsulting.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <aE_cejDMmmU48jMp@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9n3JJbsirUUTnyIWevxVAiWuOHNYigcxz+SL06SugMshZXOjIiV
 453xsIWJL6OFGFydTArw3j7+8lS7o5zlQej4L/HIrYlhSI4UGbBDK613IcVCOh0oYQFSsTm
 gOCv4dgAUGnpfeYTPaAtqxFPWN1Lk+NmZ/qCUpqqvmgTN8rU7tU55tsqwce6TeRCp/Hj22n
 zzIyv5Jt2o0fSq62YCI/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cuZjWuahtNg=;xzMFAAhf5qPzgZEqeXX/sUeuZFB
 UwIH1oC4TX3N0ucQW1rpI4M0tGbh6L1u7pvPz5iz4ui5iY7peuwMGkR4Moy9Kg/BXJUxkkWCA
 IBZnwjCqgmLE3ApwcBE5q8oDZUERhR6eJNAhxoS6el9tpn220DuO73Z+RAOcHeqMwJspQPhyu
 Unz2raRiRVW4OQvsE3hs6vHTTp9Uf377eMbsM6IJV1gDEn+t555tv2irHkJMRfz+saTXxgKqZ
 s9Y8CTeawhvFqCjVajIojbh0qirJHDXELjt4d1FxexwoooCgY0Cs6udLdbjdwou2zNv81ZQjm
 Td2V8nlyXTMsDpLyz8khFWMHpBcbFOOETAHossNfCB+keYS8+XthSFScy9iauNQyo4G/LJwYe
 UJDrJ3C0OiHNcjsXwTnxTg/Q7Hok5fVPMZzkHwp7E8vWS7txR7YeFXJ46ObKiCVcZIuajmrnm
 wExo89uVkTNgDRndnuYsjLUL+pTS+DM6rs8en7Eua5gwLn3QCtAsPNIqXfNNBm5h2clPVszyb
 HHLNfmTpI5L6YkZ0iItSdLUkPK15B2IRMvdXvWbalmon5j0LSTZuYUnx5QnrRb118rX5mQYJv
 w/TD+tiw/NZLOmOWwNN2sQ+XA2vCxlqZCvUmDN3Hx3h4nY+017ttCmq7t41voPcpmC/RJResE
 916LAkg+nyXl2VF0tY/hksfb7H5UFWeei97xFfqt18b16EILeo7XryCamIlX1ymZgJTolYFdL
 biD21MBx7UkYmmKSD14EfHXZZ7umC0AM18nhun/P5KDGYAY7QRkLQM/HA0hund5ecRn9K6YZs
 kbXMtPMuT+1t5HETB6TR0pwObUlF8yzSuEUEy4cmtDhq1AQzi/o+Ps9WHnvfEg2OqEFvg+Cql
 DUt3mj0UrD+dHjonkwMRYqct9DAq15MbiFPi4jOjRIzyh7kYs6tTQQic+HcPHKzJf99aKynFX
 0oZ8Mx0vEihhrw+pxbWoQlBsE3jlKG06+zkMSaTTsGI45/YAMasqsHOCzuqBZCwj8kQ7vgQFJ
 1Vbls3MvqIF7GtmPMXcQOupqjK7jd3k33+Hj04dfXjJz8e5CtttgIGm/I/Eyc1tmZE8CccTJC
 +wPijOc2RxL7xtvSV70+KPPtLFpU6/0YJINnJtDjyGIgHy/yHrsiGITzFudDxeh0zLUVJAVXS
 VT24TjZmaDTxGvc9O0nOz/2jo0boVYtG2InALThxDVlJAq0sdFb5AVqdTlTI6UINHCOB1K623
 R3H3QEcuOvyDzAIQWhxq+hdqkY6Zxmawj4QpwR+RKpe3UNmKtH+qjVOCz7IDp3wbWXtAAYscN
 zOLLORCPCijwmd9KIG4gK0g+0W/Ep3u/MIqXlvE1lGGiGH/VuNKztZFufpUZBUQ/z/CLEIqVr
 r//BldTiemqSuDJWrsrLzBJV0LcMfATyOHqCtiAOcRAbpAaZIFlnD/SniP

On 16.06.25 10:57, Johan Hovold wrote:
> No, this patch should not be picked up now.
>
> But you may want to revisit the other related patches for other boards
> that you sent in case they too are based on some misunderstanding.
>
> Johan

That, I did. No changes except for this one.

with best regards

Jens


