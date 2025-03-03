Return-Path: <linux-arm-msm+bounces-49971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA4A4B8ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 09:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5D0188C9EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 08:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A711EDA33;
	Mon,  3 Mar 2025 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sa3oqQFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100C1C8FB5;
	Mon,  3 Mar 2025 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989731; cv=none; b=g0N88FdjwsOv25CeBv5/JTni/RZ87c4jWouG8HzC/Pk30UCS4XDwxqR6w/bhghHbp1Zj+rrVeDVwU8niqDURce3Po9K6a2ZvpiaQiogoB9wxoFu5oqYkjQEX1AwoCQ7czWvKNlpoWUSvGiU3O61io9mZXo+grUHyWT533OyWvao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989731; c=relaxed/simple;
	bh=C+FdRvhtkVZnGaaa2bGtGDngNfD2yjN7+GvSLwFeCRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZURCTaxC6Rz7LQ7rhDA2O9nlD0PuarAxRUd+JavykjutzYoqtareHoVn5iCmXdf0m6NyBeOhR7DO/AA1ZqpdCA7XpROqtjgOVkUyMxcO5/3SiFBikP5Wyg0WG3X+okpCn9kWFYrmAQiUZVLUcaIoEBuI8pCGxoDlErhBupkCRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sa3oqQFX; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740989726; x=1741594526; i=markus.elfring@web.de;
	bh=C+FdRvhtkVZnGaaa2bGtGDngNfD2yjN7+GvSLwFeCRQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sa3oqQFX1K2fQENnZAtmV2Ls/aPlRJf7KVvq08Kbwdu8bhEu9tt2+Vdm8x2FeHov
	 a5xtfQ+T1eBzrnW6sLurLTKrV+wbphXYHxzBLePh3vSS3+1Fo17+k7melT+wTeoDe
	 dHwq+iLPhgRsRCmA0oj6wwVYTL2J/lIq9TpjdinHNI8C593aSG1Oeyxdh+XSagV6x
	 V9okUZEw5t9MkcxIzsQz/+wyuBXYJGuRyT+CMfuQ/gjKIiDwSMVGmV1ARN+gldLvB
	 CdIZt+PToF26Byj3YVlZ4+xbUBgubl1BGOC3GgNHW861FSln4UPnDsW4PyFrOZERU
	 IMs4eCavpmBGVLLR6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.19]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9ISh-1tsbSD388V-0019Kz; Mon, 03
 Mar 2025 09:15:26 +0100
Message-ID: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
Date: Mon, 3 Mar 2025 09:15:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l61V0/AxxnfLP2CwSsghwK08nUFAsuRp8A9xZrnTeiVv24ZQ/3i
 G3RqnUSDyuxhHQZurimb7PiKwXU+E3AYQdbSIZXeIB08KV04ZaIwwV6knwRGWgTrx/XbTMg
 CBbyohY7P+EBXFxvTLfoNgfYBAMIogVtGwuVEb013+xJ6c0saMHuLXFWDU4EPclYOhKB/Ey
 tGrwZLuNRsk+/ZLmwQalw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+dEdQWoQ7kU=;IasLY5SUCezkQ/oK2dlxCFJnD1K
 EJ01spAXIy6+nudFKoE9Ket7tA810fP2bclD61wzlHRGOv4tQIHAjxmFEE2d8kFXsN+a/mPkG
 FEVtu9wjQZHMXgKSMoC5BPZoDpkzD/U1ZXB1CUWPUuDB0pv7RJq5r/R6B12AP1OMXzCfTU9JD
 HQKL7MyACkb/xotarJowiXBcVEu/6aHj1Zp36NpLfQeCQEVhsprW05XRB6zJS5J5Glc6AS3Ie
 uc4MkOzsy8XU3/HU4AS+inJMduJnuSWrdSxzFrNSMYND/jnPk5zOirakBHoh1yny/3+M6oDeY
 9Atayo8H9W9OCjxR6DcXcnhUTdAlzZrMlUm9pZKpxtatC3AgFgv1XDDOKcf4yaidQ9xLSr/rn
 +GqCxAvIKhT+dR3vCubnYfZPN8xmkJxyPgqRYueCCKSBxhqvTzfYv7IKEMxImJWM5wpQvo5fz
 mgt/io8nxznlCpVV1uZl7qtzsUkOrletjiSuj0aOdQp87vlnvem0wTUWyqLiITCi6Y2NFcZgY
 +OASaJoFYY3kXCTYlhJWCHe6qXguImSMFZ4YobohpinTpKWiZbTw2cZikfKH6z1fCdTrMd/xA
 2jj47hfyTHRDcT1ViLdRrZrNumqNOBggSDj/wCDaLFVXlGV/vZIqRvo5SfOZqDiWj2KMmQnJL
 bwM0Wis7oqvKHx4WWYMpArgPX9Yv4aNySc+wg4M689OM3e+3vDQBUG+N9LF1C3MC7LGGyoG5f
 N7xOGsxwTbTlwpJiRk3BjZjdOFgdZgLfzg6gkZQSG6ABrJrKTP6l/K0Po2QG61tOmeRXILOoy
 5r1UjE9ozIkmxKQhxRgrZn44y1hHW6/Sx+wb0hm402OQx/ZQ6aA6dlhiYdGICGYHGpcTlmExg
 9K8IAbsr4QQpm7X1hHLtmrxfU7NoUzLGnU5twl0X2YskzuQlhbprv4pq3PliEkqOKgWHKnYaI
 uxDhPlHk3d0UbaV9ognngBO09PQe20k8Cv0i9JB9PkWhY7LySQe01zHatFls93m4uTyZDBkx7
 ButtyGSLIyuqZrDn32SlKwjM/H3LhvbD/nAVfC0nDv5QxMgrPd9jQXhi2vAmsm7j/5rveS5ut
 4zIqLIODlafpEp/zwlGAqFZBpXsHIDgfS+HgKLLI3wzft0e46RCZ07BYVVN8aJSC54MVKdORR
 5DOOgieAt6BNAtTj8hAXKQas//8niv2v7DbX2AFyatHBiySgO2uhFDUnOrXGlgvVoQPMgOdFm
 xNgbzehk63lnxFNhe3Y2yOuKjXmbhUFzrz4Ojv0zdX7bZdZXJwJM+SklDknLXtWtfkHvT57jt
 Qs2Q0HSAVP2jzgt785f8S4Woib/Cznidc0aV/A9Zb9zQJ0H8XYRoAUMO83x4+9gEFPgIXeDOP
 ZbqiAAcogIiZv76m3m2cgXepNh/SPn4ffLOmgAUFkyH/UmqOi7sgcs3Zv1buxi1Si7rTdgDOH
 +r3VzdjatZdYYDqtQCigjk2oylo8=

>>> The address of a data structure member was determined before
>>> a corresponding null pointer check in the implementation of
>>> the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdpu_h=
w_pp_get_vsync_info=E2=80=9D.
>>>
>>> Thus avoid the risk for undefined behaviour by removing extra
>>> initialisations for the variable =E2=80=9Cc=E2=80=9D (also because it =
was already
>>> reassigned with the same value behind this pointer check).
>
> There is no undefined behavior here.
Will any software development concerns evolve further also according to
undesirable null pointer dereferences?
https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+=
null+pointers

Regards,
Markus

