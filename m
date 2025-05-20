Return-Path: <linux-arm-msm+bounces-58771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3CDABE34D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F461BA8561
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8665625745F;
	Tue, 20 May 2025 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="QEHIyRUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B471B7F4;
	Tue, 20 May 2025 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767681; cv=none; b=m+Wwd14TTZgoYjOeEwWVIZI6v+ewtlBM7A84a+AgmW7W7Mh8w4T/oBdqpyYiJFrZnVJnDMMeWFtc5nLEGaVzZXdXYQkgT7awHzUQ8bqJ0Svb10DU6mdxDTs62+2/kUL8obBNPvhZ5HZdCq1V2o30WulxSooaPw9hU5q1JHOua0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767681; c=relaxed/simple;
	bh=UEQmc7EnoeLkbu0X5ucd8/eCgxM//FTbeTHiH6u8VfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=roSO2U8hcZahf/8hzr8OMLKnIXXbSR40irama12WiNz1Q8SGYvWS7zQthOhfeGgHaBQHilxneDpx2fKBAaHcrT9LYxhMh2rMDk3RJ6yV6Ktm/wcYg65zAyJHGWcGddeh6+CYNwX1VODTm6uJ9koh5OKUWDlsGhh0tWNfKjg7dQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=QEHIyRUn; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1747767655; x=1748372455;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=UEQmc7EnoeLkbu0X5ucd8/eCgxM//FTbeTHiH6u8VfM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QEHIyRUnFAUhZugVNxbw3wCD6N3dbQ0jVvVzElsVBgP2voRKBV20DkrBPUb3xu5b
	 y6fZGM49agxjmR4AsahG9PeZ4Zhx8VFZSYalsdbmoucvPtFcjK05k+FzLlwV19W4E
	 pcqqRE64ZNIfPKXog+gjlzy1W+mymAyt7wSk6TnSewph8rV+aLNwvfy1rKK5f/i0I
	 FP56YkmaVpASkwFoxBgcZzhfNIwgns4zLemoBBMRgeS1l4N2CuHxMcnPOX0aN3ivp
	 BFAUMH8tyRzoNwulntfqtR8FUr2vRDzn4kiL20nK2bv1Y6ex0IwRwHRFyJQGwM2Vl
	 VC7w3M4egFVxpA5snQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1McpW8-1ur4Cr0LwY-00eXiL; Tue, 20 May 2025 21:00:55 +0200
Message-ID: <41bc969f-395a-4d35-ad9f-61a99a44d1a5@oldschoolsolutions.biz>
Date: Tue, 20 May 2025 21:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] arm64: dts: qcom: x1p42100: Fix thermal sensor
 configuration
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250520-topic-x1p4_tsens-v1-1-bdadd91b7024@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250520-topic-x1p4_tsens-v1-1-bdadd91b7024@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:djOzc8VKPHmKtJXvutj61VS093nWHIlfze9RmSWcNrMnZ4eE8RO
 Jrb7dE0XoIIJgCtO2GCtQaKsY1fiDjSpQSaJyMhb4j0H/dgEhmXVpZ4+JVCkFJcUoMr23/L
 t/QolmKMCb60yHZPZAePOYrlYfsYtg9oPvi4nzxgsOHiWOaVJvwcJD7aC3dHR//kXGkO/o7
 HYKBDBqw1yXCSU8OYyF/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aE/KgntSojU=;6NYQ6qupjuc/i/j+Oz0XhOL96m4
 gLVoK39hNDfxtUFMB2GwuHNiILkifZPbozlxOgF+Mr1GV5l0ktD8+9LsCdWHK6dSxzuhzeiOI
 AnuOfo5AA/a4YsINFgG76+qmRs7xadsN8IARGrgVisOvshjWknpOrj4uwcSLk9USQJy8cojec
 42RmQWjs5LQvPHpuXpub7syreuapKN5LwWipl0fDnuQ1bUsoXzHR/0EAyjSENhTTMdVPdW8U0
 jbkZJuFyrykoHYryY6iwra60lo5cA9cx9Oi3JcJoZ/fYIT+AhiC0jPFX5Kdr0ovh5jX6dzI6v
 yzKPT3mXykfT2TipX3Fuh7eCIMSkZQnOdNkbloJakug4WYF+cdGV69ynQhSqVrzrtmLAkUmdA
 CZnTZlA9iafXjhFiozfcVPHUTSQEuC0Mwqy18Lfbqp5azn/M/zMAPxGNJ7932VTQ1/2fu9Vvp
 CZMuUPykOiohNWvVI/Pl+T1OHweUfsEXwLfT+KpnCiOV0idIntuEkVBjWiz7m6UQq9YKc4sMV
 RRhysDYp+SePkxUAeg2jJBndkoPFITF3A2BQ40Alfd0/6k4z21Rg2sUtiHbgGAGPrill0ZbRs
 0dUbjkkitokS9Wjn3j+GJ3XJp11vMtQpoH7WZONsw4PbReSLtZ4fE7WJt3GGTBNiPCiWkz9o7
 VRC1mIHJRYBNr4ZvOzdskvVkaz/saJDyLGrYpFRnNvtEThz3tiZBP5b9lKB1kCwV+NqMXei41
 a6tJVg7Me5MXgtJtuaIsVG3rqmY7mzu11HDuRILvP4YUhKri59nU5zdaWRyeGDCwQtyrm25TM
 kvcSonuziOHuRVRW09F4dXqiTNFkTLhBexP/RvIwZjiPfSusnr/ED2sADXAkxHJslxDHEwd5I
 Go0kLDwN/3OG7wayECg4k/wtRMBh+l6pOTrOrnq+gbJlUBrbK2y6vKcjTOF0/v2YrWU7XsftB
 k2waRfF9pNMV17/qVhKvXrGefGXWDRtqc9h344QRz/hPxqXHgMIwSlQhzyE6Kt/cISHSs3dVB
 ydvbOUUFx8JGQtNd4ZZzpYLV7jqWsVpXG5jFtFQyWK7Q5H7JTvRe6gsodcrFXyuEU/nyKg8vt
 00lvL2z/WeFYxIggzrJsLX0BxHneRPcjOZWJkn0IB8xidEaEzxHNjs6xal7ufySN/KuxTXVzf
 4Mkm+f+pbMSH+zDReAfDKmJpWMkEPfOFhQLix4hSkZbg9dJfjLZ81TATTlu89EG4s+osCquBY
 HNJddBZR0Ab2fjeS1GCFVlAVoFB+pVAgdW4Zy3NwOJYKye7W4wH3q9o3pZ33tZf18viVbGJPm
 a2xq54G5Kngts3zOGM/yrsgLPLoCMx7lv1e51Duwjb7m0ZzFKAQzm1/c6UlAye1Pv8UYlsRVe
 +oOFOygTM6vaI9iefkC9oTLoE3xX3UF13uOkSVljEsWq9d4yJ9Vq7+vRjm

Hi Konrad,

On 20.05.25 18:42, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The 8-core SKUs of the X1 family have a different sensor configuration.
> Override it to expose what the sensors really measure.
>
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Compile-tested only

nice, thank you for the patch. Applied, compiled and booted on the=20
Lenovo Thinkbook 16 G7 QOY. No adverse effects, the thermal zones can be=
=20
read via lm-sensors.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


