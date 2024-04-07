Return-Path: <linux-arm-msm+bounces-16672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035689B051
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 12:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062A42815BE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 10:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9DA1642B;
	Sun,  7 Apr 2024 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="cCTMcL5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96914F78
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712484814; cv=none; b=IQrOdwZHk5li+BxBVBhUh6yGPxXtfeLFDSWs10o0LpmLgg2KHD1VPnxqsWgtReDpoy7HeIl9y+q03oo2XFHQI/UyzWUNHJ9i5DEYg//wPVSEZFaPOLbHtBIhB6GP38nnEb5F7cnQBBsJVsDedjU6vN5dTBMgmiCvLc9qPE2k0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712484814; c=relaxed/simple;
	bh=yGgCFWmUblU7TeY652VRyEhoNAP7wR/NJDvGHApKSok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKWQUVnnvK/kLM9ZaWhM6Rztp2aY/w7ReXpnTR1huECxDURh5P1a290r7wgo3rF7XL74l5wSSEQxL2/j2wBeWH1wfLJi9WuYQ/S43eGN0+3DKUJcIyIjq9CUAg3XbdLOyIRM7ZHhy+t3ZcUPODQRZmCvLEm8SFDbsEIHv1pihkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=cCTMcL5v; arc=none smtp.client-ip=66.163.186.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712484812; bh=C+AJS1T/rb/tqDj2Rt/RDlXJGUr5YMNuZdSvL1OS3yk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=cCTMcL5vjVM4WwJs+HzL3od9RxKivQtnOIyx0Xi0xgoELfyicDYtAuvLT8vEHzslc94/bYZ+U9LeyWaTj4xj79VAWjquJwGapsZdG9Q+o+AtQJgwBtO3bc5qh3pnH2QBMc2ZUBSyEES5xCd+jgmR5SQmnGvxc5quGxXtdeu/85D1oU89lJv+xb86ucby6s8BoHLUCCYJsHnTeG6px/ROrSXVP/wfmxK45qdEtBWLyTdzfFhH/Mqn+OxV0PyMILviccFanJAOx/Ivqp9BS6h7idd1ayH1KNHO8DG4QNW7Pv3khVjZQ72rcrJlXf3ufIMFv3qtYxTBZxMXoMTrwDcaQQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712484812; bh=bq+nFBfHBNuvEp0h+YMic3Jq/BgNUep9memVDwMJjYF=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=PFOao9YV+LQae05tsEJh6eaOKzBkO7DhsVgIDs/JaKS23dwh34LaB4IuXAX0mvTNvIYrFiyXQtMn5itCxpTfduDxeDXzzK7PHSIrf8lByCHNE0w/03XydYUg0OgfVlK//MPPTfitG6PGvJShdydm/S7nFcBIDYdZmY2zZtk23oGYcVhWmWHzbiFHuQbCKIGCB+hZ7tq9KYh83VRQWaEPnMeeXVLDmnm8Ly6KpcaSoWe++PK5uaH2q/hJvlKR/KyxH0sYWvScQIRS4npUTWt7K+yEexj2B4DD11YWdogb3O2tjl7aan42yHI5DJHnkxuKd/S4Hd41OU1J2NlFozS/nw==
X-YMail-OSG: 0DA6kfsVM1nwR23I0UbehfkcWLvCI_ajbttLepwVuLyyajAG4p9bTHgiapfStB9
 IvRrrTMO0ZUQ8WX9KyzZjlhxOXZbtyMcjRLlRWSLSEP7cHutpmr.YDXtaZjl677RXAw..XN2W8J6
 MiPCMNUZ7xywyS_wl5fB1lPhu9cEBwyQZoZl_UAbt8tQHp8OMo5Wa.moRu.xXVRgMbfngJzUoo3i
 G0MiWcmJgbFYM.E1ptk02y1nW20GDlaUVoa5HzGAitLMgdxikYGUdTz5oYi0G1e8t5aUgoUVuJfc
 eoyNz.2y4pkZKNnwwTLLXp.i.uHRMgkvt1Ms3Xna7uLEv4b5j7bXidy2wvOdJp4zgbNP9s44sZp1
 sg9fbIiROnK505TjOFeqYAfKG2PUAlPnfYzbKU7EhRfrrjescbZarGUewX3J7jNH4jnsy96PG2AF
 8A6imHB95cBf9jWFUnnrrUIOEFbgMpZjcIlBO4qGjp3Nwmv9cb47J5XEQLJzSWOX5vdp.KHGxvaA
 ZDL990Q3fHUuYGRU8.HBgQfQTvyjoqOcvY0f7FTCnmKictSfJSXAO0WREdUP2eDIyl_yB7V3BF3w
 FnvK3jroOQEYLEG3ToJSR36HSCADLEGhCAgBjHF2xfmb_L0wLPvZmfUJvHdoYdWb0wmmjRk5Kan5
 Uog.NP7b2nYWd9HZAfcmgm8xCyULuSOCPnvfqbrO0wDN9IyMaNGX2.7RxJtltug6G3lNoOmhGH..
 NX0f.c3AiT91EYCU2gkWiqrgaPCJThoN0kiMckFZ47aQURsL6KSv0WTkgZIe3NevS.6yFA0khz2n
 ttU7eeEy0lpz.UmNq2OP7wwFCdjWIMtby6cr.Uyc9NV1exG0dJKQ7mNALmwSGzkZbf3nrOe4E5UP
 Gk.RUVLG00c.sxUFUR5ZcFhH2p4.mJ2Pw3whYb8bRo3.N6P3ZLtJ6csw13.ZIeuO2mpOhpTKMdrI
 YmNt37sCP_Y5dj5lrFI_l6EK9_dw3YQQV_JHD1vfEdMRa4pF_jTlSCrv7g3iZEYDouEkmGxU_aS8
 4lSsg4eZSYF0HqxXASGtdZKYHeXO16Yg116st_Xr4VB.56FdofCo9.pN437X.5EvtnptFz5HNps.
 xvCdzVf77ZXzW0ML6qfnuTv2MwtKccIbRoTme5OC2hbXrIZ3zvSmaksUfp45lFoyljIh.353Hy9l
 PtewfdKrCueu4XrfYWGkdTKyopLo0DOi9qPWYjPR4uXdMPorjUYvmiNztUKxS_M8G64k2s39Na77
 LOsqs0bQPTX1jazpDaQcBZmo3mmBK9oMv3NW7xeS18oY_dviI8fJMeiBqEv2of2796ocihuWRdKR
 p3_wkgW1oLMChoVKCeFS3f68QDlTgy3IO_0pioAoII87hIC.46wAbxWlxIKQyOdxiyeUogKN9x6H
 ww3iEauENVLC_b_cOx6R5hVMQ.OpckdEhJ3qcSiLaqvlYEwLP3M12wBAyv5qwy2GtKdlgAK7A4iw
 QhZ5Od9fNa5x559mELepia5_omql.ssuKdwqwkcyaH5gYWg37Hvnv1KkK_62bMmJTva6G_aoJ7bU
 UiuawvOplMiYi_ObIMmpwDzwy.1iX_IZUiwRC1sbwoa0Yp5QmcSGsNIaimAtqJbcH5oaN.YSMH0p
 xXInBnEtfhgboXIBfXKi8BYh2LFeAxyfYauzfBNcaJascyqVSaeCRjMdc446UbVhTcO71OcQ3.CM
 O5_syph2Uj2f1CVa6u70ZQX7TJJ0ZFhvzpPBeMRodjvUNyWMyMQn8EW3qVSeK45PU2WnZyMpBAVM
 FMN73avtlos3RazTwnHpWTwccWdFb76bdQddcjt6co9lSw2J5Q7pb0JCFUvbnAvTiNwje3Z9CXVE
 4DC2GL.ydDNn6UqopQPzla5cX4MbjBHZqkyuTh4GnInalhavdqZCl8JLV_Y0e64d6H_Io.iMPaYF
 wB6oSRCwcRNywIWY8v_.Txnj9e_IDO4_sEo3gigA7STBjiLbPBnOAmpDsEGq1AHrcliKCGeZred.
 YmEMlKqbC1RLKszyxH0G3.9eElFV0pDv53WHGO9.hixwjAFEerzYvjSPDbeC4Pkw_6xf_sDPQurh
 MSrKmrVCipOZkmby.IM7u2VOf3meiUZihL8eHXchH4bmOGZRD4Q1nALFltPQ8oTPMTCgf9Tg7aZb
 1BdD.1MFHkKCSKzeCMm4VQtQVNSOiKWlrzrCyojXhYAjSq5uhsVn_7WTAxixZZp8RAjpFBA8e90f
 0nI9tPtLFTVWwpguhmtZkN0yFaWAw0WSaesgo4W9dyrDt7gUkI8HQYwvgGAngx8Zo
X-Sonic-MF: <serdeliuk@yahoo.com>
X-Sonic-ID: c4a14069-9116-423e-a1c7-ab8455b6c999
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Sun, 7 Apr 2024 10:13:32 +0000
Received: by hermes--production-ir2-7bc88bfc75-pxs6z (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7f655095cc1d4bc604c8852f53d289b4;
          Sun, 07 Apr 2024 10:03:20 +0000 (UTC)
Message-ID: <84c8ad35-e695-4d5a-9c22-518b84e5dc6a@yahoo.com>
Date: Sun, 7 Apr 2024 12:03:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Z Fold5
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240407-samsung-galaxy-zfold5-q5q-v4-0-8b67b1813653@yahoo.com>
 <20240407-samsung-galaxy-zfold5-q5q-v4-2-8b67b1813653@yahoo.com>
 <d24628cf-a628-4eb1-ae2f-bf414b62534a@linaro.org>
Content-Language: en-US
From: Alexandru Serdeliuc <serdeliuk@yahoo.com>
In-Reply-To: <d24628cf-a628-4eb1-ae2f-bf414b62534a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22205 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi, please excuse my lack of knowledge, I am still trying to figure out 
how to properly send a patch. Hopefully not wasting your time too much.


Here is what was changed, or I should send a v5 and add the 
modifications to cover letter?

- v4

   . removed a spurious new line

   . removed pcie_1_phy_aux_clk as requested

   . removed secondary pcie1 which does not exists on the device

   . changed firmware extension from .mbn to .mdt

   . added missing reserved memory regions required  by firmware to 
properly load


- v3

   . added b4 version 3

   . removed address and size cells in device description


- v2 added both but added an extra v2 in the subject line instead to b4 
subject header, was requested to send the patch again, along with 
following mods:

   . removed whole bootargs line

   . fixed underscores in reserved memory by removing all reserved 
memory regions

   . added missing idetation to  spash_screen remark

   . validated the dts with "dtbs_check"

   . removed all comments at the end of nodes

   . moved status of the node at the end of the node

   . reversed pin control name with control numbers

   . ordered the  nodes alphabetically


- The initial request was split in two patches sent due to the following 
checkpatch warning, was requested to re send them together:

WARNING: DT binding docs and includes should be a separate patch. See: 
Documentation/devicetree/bindings/submitting-patches.rst


On 7/4/24 11:03, Krzysztof Kozlowski wrote:
> On 07/04/2024 07:38, Alexandru Marc Serdeliuc via B4 Relay wrote:
>> From: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
>>
>> Add support for Samsung Galaxy Z Fold5 (q5q) foldable phone based on sm8550
>>
>> Currently working features:
>> - Framebuffer
>> - UFS
>> - i2c
>> - Buttons
>>
>> Signed-off-by: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile               |   1 +
> Where is the changelog? This is v4 and nothing (neither here nor in
> cover letter) explained what was happening with this patchset.
>
> Tags were ignored, so maybe comments as well?
>
> Please provide *full* and detailed changelog.
>
> Best regards,
> Krzysztof
>

