Return-Path: <linux-arm-msm+bounces-16667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ECD89B02A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 11:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4051F21489
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 09:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D823117554;
	Sun,  7 Apr 2024 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Holm2nyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6917550
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712483543; cv=none; b=dAMhP7/NJAWr5TqAKArIHh1X+0k1/jrzDfzOz2JvzL5J76wC6SX5OdTK40Q3FpZlbSHiJZIMeTcVEOz5vcriCTZogCg8j2HR+m4QwwqqGPNwUejZkQy7m1VoILa92Wvuy3V+yBGsDgQf2v9aq0FShj0KOwJIMHlog0r8Ov5F63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712483543; c=relaxed/simple;
	bh=IWTIjbsO7ky6wjX0WM/09NBDuwxkAXd4zp0bVFc/FtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBgcdumzqS84RIUUrieRPsGckxn8nGpF2jwQ95HD3XkDWAYMvdh4lopYdSBlv87SFRCrH1w43Nsh0FILirFCKpGbwPLekRms1Phnh/Sh7cOQl6roZjH2/5ts6AoovfZCBRa3dLYktcLzG3kiy96gmxZD7mirjQxWDeeHHEw+xPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Holm2nyq; arc=none smtp.client-ip=66.163.186.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712483535; bh=hB89fBU1gf++hm9muSsqTrPVUIEBVDR5AlHXJ0AmO2I=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Holm2nyqpBH7oD3G1anhhg9lONxthDR9Fic5rjNUqTMBpWU8k7igHLxjZJ4u8vQVgGJ3VtQf/AXSB2rAmUESObDankOnkOrl2ekMXGghHQnvKi0OcQr7I9uyKr7bZ133Mj+hCVuFTLpROjf2pmKYFaUIlFEEJpNsc/nkizKq7ghe13KpKCl+7d/HN3j5M6pUYsx22z888hhAyOT8+yQ2mIE1/Kp0/w+/uSlg6ap2JjN0+21dUa/w8q/b7K5VB/XzrdlGsgVTKeryzTA/GbIybmBcqih0cBVj2D8DVmr5bo0YBTPrqa2hvSGLLTcln/oR1x8XwKDHeMgAiuFKYE+voQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712483535; bh=0LPdJsidU0HJqr2lDdo4CtjoLEkTuGwHCS65OVC5GAq=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=hN10gIFzbpmwtoEyrewOyrmjU/aN8dwH5CzeqzUFIx7nGM5yY6H8XLB9r96QsUuvmDSfF3OW5QuzRIdoBTHw+xnKVdnz/7cdK+JBssJaVNuwAFqr0SQVdWZDsFUnP2W3FD+9dLL5c1+ut2XdESuBVtQ0DPROjhoAw1JIg5oaEANp2zcFAeFcSQzV1IheGLQDrzxuYfYKFOZRoT5DvGQJqs3gxn2oU+SKo0JsxXMXBPBPO0ZanDUn+N1tAT2usbHQYFTkhpBLYEkBFR+5d61tz/xLJacgLsDccFh/IwF/p5oMEPIv4fnW22Y7/WoxnnbiJiFOZ1y1W05ORjZ/hSLyqA==
X-YMail-OSG: dGKwT_QVM1n3ifVo18XuI4LRTSPwXAO6P5PcF2l1dl64t4U2t.sYjZZiVgjHv0V
 qihZU_lDhdrunQ_5qCvMfvpoLBIPOEYYwS0n0zbYYXkKdJArz8m5ZLHOAWtTqWt7gZEXCb6hGbwb
 LWu5n1OXUmVhYsEvCgfYHxHXgZ_WYtINsrYkcQ9Lyo8GyQh2M5M777pWRnukDkJPFRrjhmC2.tCW
 PRIs3myAr2sZNbBQ32f2MWqmbmLAFJYJQNHaLi0zIf_IHEwGqz9Zobhd0.whhkvYY2T75xbgPPGP
 xR74WzmFvpeUtTY9XWcugO1_uafbr0CMzpSjdO2Gm586zgugRXRyVadAO5t6LFA0CdjrvkbgVauN
 fEIcazDy4uy9wcP..DaKv5GdQKZRYl5XfDchv.Nn36j_yoqsn4khC2f7OWeCe3KsXMpLGJOHquiX
 zrAYe8giV_IauUvGGW.VdkeB8z0.5wIpCFgsJK4sIH96nKOQxNq8ZAvyN1DWhLzsU2Imoht6SkEX
 O8o1aw92ULb5C8FAoOQbXf_PKVggnOqQr90UXRNf17.mtCpsrF92dACjHAHYwbdkvk7Xdl_Q6rwW
 eJpAAFY99Agv6cbfzXJDGmRPOjH.4icNj3k02CXNParZTBMOS6ACPxoYpK2SwaUnPPTfl._HTE8w
 Y3nSaB7Dbr2_W3yal81a9pswfj5Dnurq5vaMAUR7aIIEUH1nIskobcUuxs_xy0ijR_a1YnfQ5K4C
 0C7bEsQzdA0F0CoJpM_AXWKSWPBDuEDTqPAJeosDGViV9dGhfSKwIebILSbfQLVaoD.WwelKhksQ
 5T53dwhAe9YSLkY9OQvpbYvdwIutppHJ9dUFgB9Z435ryMUjz3VT9qg74Zk5knxmFxSUu_8wHRWg
 YmkZmFU7odBxxsE16IvDyHd9r_rDG5h1RFBt0NnB5saRkqbUj3LUYKvlmTeKAnWxnOuo5b_LbFFp
 qYQvrwdDEWoGVtuk4UHAJg0S_UYc3YA.mBI.OqoDEMCqgPucik_v8BlTzl_xVujukcLrSU1F32ZW
 kEvkUTMoOc0keC06aRNIq01yvLVTAsPSzs0b_Rt5puCXg_gImgU0EqGrp_4dAtvce.wqKvwORn3I
 ypvMkVIOvTbiRdIPCQQcasEUi4tOTExhpOUu5I_uV7bIV1shVeCOXpOc8Vf7JdGoNUxs7vLO7ukc
 8vYDqmkqD0hXIiBva89ncUCo0TqFdrgl2TUYkVbs4ppEbS.gkClYfXDObHJOqxc1abYUoav9P_Wh
 rK6hKzW8hH8mWJ68th6VkBDHIPikS6FsGRoHVqZmNZy89s7XXfW2ueAveP3iq4vGkpQ4gGv4bSWr
 .qZMdVQ39EkybBb_7q2AHYx6PiaaDiIq5RqkbbvH9RXSH.X.YK9vwzuHNa7h4Kxh27n._uXm.c60
 fwYuzERMPz9yTijROWbMThW00pcLv7sbVuTy725UqGSErzNWZTdJQOT6nyJpnMGH9WF2uFGKPEUe
 2JgmIHK_ULnjp3knTmyJL5ng.g6ABYEi4tB9WWwD6U9BEr8AQuHq7Qu4ni9vaGyDn7JWuv80XKvL
 ftqw9w6wL1b1ICl_MEnroY6W1AMwpZJ_PYMwgtmReQpgri1N_mMv8aRLBD7fS_N8spmGKi9LfBAk
 5upaHNFUgHq4NqB6_NEmMJvAUA9fTb42VHaKK_fXzJTaht_W9TDrPqTUqS0j31A0.u9vLih6El4L
 zmu4zphZOatD3LWiPPaGdDG_8..kpmPmgYei3sVWvW25L2CsB4mTE4lyrQimVJFCQjHz_sQPFi5h
 Q_C4gVyLrwJcmD_KOeQT1q76YT.o14zuKc_g1_KcN5EabrYikFCdwd3dq6hid_UJr.KkijVjZGWc
 vo5hBOQfyZX19XyKjSFE08YPYLs4N3Yjj4tzhOT1M3XVjtE5bSggTClqoQWinRDGlSaoaagYYb_K
 _CoUBaKlnZZPSEHhsN6BAfrxArHrVMOHZapsJve.dKBCyTGGwzLVUlHiJWUCJUy4jBt4PgtJ64Ud
 TIbjW2ukuWMAgJ0IfsfQaecyfKS4WKUkmmOv35m4bYVW4Bnz5o5_tiF7MGipapWVIJYM3frYyrbZ
 nuX56YxABuJ4.ceahe8liN66hr20YduxG4lzl7G2abvn_s6ugpsS0bY1xbcUQW84.SMjoc5gpExQ
 xObw7b.k0YGcH35IQvjMyL5KhkzFjf6p0FJI7gATFgFptEKWJQ7rwnE.mQS91dy3N0rikwbn.LjB
 4GKRiGrKsLKgEX3IgbPKh.F7oW2R4qH3L39oej2KPN.iv75dImcIKfQA66d4-
X-Sonic-MF: <serdeliuk@yahoo.com>
X-Sonic-ID: a0bca023-4f5a-4498-a152-d9853cf88d13
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Sun, 7 Apr 2024 09:52:15 +0000
Received: by hermes--production-ir2-7bc88bfc75-6cqn4 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 69da7276310ac0065901e6077002f504;
          Sun, 07 Apr 2024 09:21:52 +0000 (UTC)
Message-ID: <46ca8527-8b3e-4894-a1ee-8f2663e457fb@yahoo.com>
Date: Sun, 7 Apr 2024 11:21:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Document the Samsung
 Galaxy Z Fold5
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240407-samsung-galaxy-zfold5-q5q-v4-0-8b67b1813653@yahoo.com>
 <20240407-samsung-galaxy-zfold5-q5q-v4-1-8b67b1813653@yahoo.com>
 <32b01e4e-dcdb-49bc-90bd-a75bb34c5b1b@linaro.org>
Content-Language: en-US
From: Alexandru Serdeliuc <serdeliuk@yahoo.com>
In-Reply-To: <32b01e4e-dcdb-49bc-90bd-a75bb34c5b1b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22205 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

I am terribly sorry, this is my first patch sent  here, I am still 
trying to understand what and how to do it.

How to proceed with those missing tags? i should create a v5 and add them?


On 7/4/24 11:01, Krzysztof Kozlowski wrote:
> On 07/04/2024 07:38, Alexandru Marc Serdeliuc via B4 Relay wrote:
>> From: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
>>
>> This documents Samsung Galaxy Z Fold5 (samsung,q5q)
>> which is a foldable phone by Samsung based on the sm8550 SoC.
>>
>> Signed-off-by: Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
>> ---
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.
>
> Best regards,
> Krzysztof
>

