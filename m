Return-Path: <linux-arm-msm+bounces-17179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE38A08C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 08:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9A47B25269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 06:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1A513D8BE;
	Thu, 11 Apr 2024 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="WhC3YmI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sonic301-57.consmr.mail.ne1.yahoo.com (sonic301-57.consmr.mail.ne1.yahoo.com [66.163.184.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3508B13D8AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 06:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818097; cv=none; b=ELg6IXTPj3JrQBNpWDiAERWa30dTadzOh/9LHylSZ8woi7Od2zKlNYVtca9UtPlrS+TV7ZpKvb9h7g9ZuR+nt2xgd3JtV6xCG1+KMbpflPYJ1QHaCSQV6Bgs9eBpuvqbo8optfAFPhB8kSfk8wpAoe75IgigkSznSN8ijNPwclA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818097; c=relaxed/simple;
	bh=k0ZlMfrNFa4oACFYNAKWuxw3hkfR3adQO+Fr932Gcik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGjjmIhxDxfjhD5W0gcOT5PNl27EkqSov2hfQrCc/HJ9sjT0Bcp8ebCFVSulrJPFligc4/H+hTerbnfi6naKY2oRAP1HeMf12CWY0JHYSc40jYvAaiDxOVXnySuh51IvDPbaDMeIySgEBEdJmohuNqbgKPK6A9UXZ2heOS+hmOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=WhC3YmI3; arc=none smtp.client-ip=66.163.184.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712818095; bh=Pt2DxSwAO0y7IqFZlH74B70QCkK8Cr+VNYRgIQonXzg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=WhC3YmI3QRz9Jxb8QRPbRE5L3+6M1+VZCNaU7vMbf3jcpUkKiweUR1HY8UFojdfdged7EUFXljdpVOXbqZr+soXCDscHKmyT3hiIyxMRpibUoTbgkW5Iz7kN/YVMQwhoZVX5cJUdmI88ckcOzPsrVuy6xOG1/oYt7bDzMT97Fwk1/NMrMxURoXLDbkzOMWeOPvV+xQKVKtq7mKyDt9U61wTLgmUfaeRUsMCRr20mJHR5IXo9hc8FGrqlg+A91nGgagwqRwqCmjwIrlvl+pnEMKXrIptHaAJrrZ/LE+Pw4WMLyuSnjjyBfOPTtcq/A0zXoYONKUVX8uPlOcA9T9aT9Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712818095; bh=Fc2eD32BsD1Az6mKn/vkm+6fQN5bkhuvq7iG1yU9HwJ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=TDP2shqitcwsE0NEn3UUTQ5VGEmwyQJ1UgdEGlWMW1Vm/QY5izikWrn+morXUTlkbCPA1olWCQTRKVpqXeOx5ryI/BrbPXzhXkcJSvA/rr7bVkOX5Aaa7IexXDijFzVJVnHjT0IKdCGpPfHjMAds8MsirFyLo2+6WZc1JBfOcRUIAfuRN5Ifp7VBgTRWvJXqyt0GW5fokoj+3ayqr29W92sfVLgnEja1JioZFYr5YSUg/GEvsLeZlfuApOpVW2hdOfDz6sWP1ZeOSDJUZFbigZNORr37QrhRMGy8+CfnKVakhiAvk2zuzUPRxbA05Qk88v/KKmaKvWyWdqpJJ6hIvA==
X-YMail-OSG: 1hlGK1AVM1kOMyNXGs59jVqRi7tXT2tKZit24bBA0aYskwOuC7k7twy0F.uLvxO
 ZqqJEboGzLytD83Qywh.DUQGpPuOLYy2Oo3oFVQZw0McMCiB7IbH7uDKEZ3y50WtUE_FSuiGk1RJ
 Bv9iY3VtObwin2K2Z52imHaBbutO4wsHGueh_B5x11tXg9t46RXvfWR7GT132cq4lPQiazRyu2Se
 AKvibJ02DSvZwgYo64GPw4SvJ2VQoVc9hOWc7l.ZFEiH74yhS0FMaZM0ooGD_a5LGjtOEjcKh7xk
 VJ6LmDciz6k_YlrY3CoddA.IYOwz9kR1nPIacaZW7UAbYQJz1UmbCFaaDrPRvEjdUucVP94A7aJu
 vR6t9iqq4PTohy.4QMxKAdvFLkxB5FB6_2GjYV6YkfADE3v.ETKPokUUIQNnl6tREEShTpVPanpQ
 FScT_yWd9CIpp9ZMVK_6xRTeAIPLwBzT0rOoBMkzuFqHTB0XNBclFbeJy0Lkjo6X1SYbWAMP.LXh
 o1yK8AHXn55QJ58_HZrLZAxI_C5YVTKXlGPjxrzjCqFjlBkBxLXFwV03GmDVQvbdbKOsAGGtyfDD
 cJMcP2px6KJgLJ2SI16X_PxeLxXrn.tWbNtr48et5k0aRm.vuX94FUiqaTJjBhTILYOSxIMytRp_
 J83zbMf1XLamhgz9wzEnQ0E0.IxrRTfQd2YU4HQNF7JGYzhv.TmUKEBLT0UmHKaYpfWQekphwZtl
 KVd9AdRRabbHnGZzgCU4e1Tk5rWScRZpMB9WSwuxdVm_cD5.qbMbXSfuXv8BB1_4.5rtoy_ejNG9
 YQaxBgavBynnl8CBTjDMUTQCm.JVAwYJUnp7LgVC1Gt5ai49WUUWqzd0hZUpJmirYnyqNL2NqNtm
 uQkJCA8jDZI9qCWnsnc9DfFoN3rvzvrx7isVbuYpFeuxEIgu3S9y3JmAradv.oTWxZ.6EZAH7Wu1
 vdRiU53F.EpmrPXjRRfUHVauu6ir07E7TdRZB497UrNMLGJpAPmaPzYzX6hUdE.mlTcSu9kFb_JT
 zUn.zv2Ui6X7R.XanMP8RW83hmGBDHAPoiqB1FE1B7B_59S3.fviKbiUCXxkVfJ3OPM61SVg3eyY
 Qiju4EOa_7E9vpM5JXTEdZeOrGn9ptBhHTVYzUg_YFusdtma9LlMHnPHRGZT9cQdKkSH0vdjAOYo
 kkkCE1VAVjYvbqjOsK2DF0FfMHbpO59XXEijRDQAFAstJFLy7a6BGjVTrLazTiSNO6SrjpOD5Wub
 vyrh34DZWNSmM.CPHOl230LrEmY18KMUNtCb30qjAeWdGU_M2D9pBK.bhLbMBD8pybt3pMQN8Hye
 Gs8h.mcpbkNvqMjhflOfRRT7mV_cqjtn.UxSDR07ph1c9zM9TcFIA3hWCQ6_5Yn8JfUOhF5gL4f8
 nypmRSO6v9fmNxFbI.eGH.rKjhRRDc97FadrvxUf7e699D29OUWPGF4brT_XUTs0cO42DBmJ1Uhx
 3GI4q.idRJICuywkbQQCSsUiSCBhnH5LgzF5sHHO.o0RnQvWt3dJO_gvKSJp1xEYvK5k8adHL_bo
 _zP4zXnwrlE1MmItgUs5zjKQi77M44daWGnVjben86d8tC5gFf2DC0poiLCgU_lw75vP5vDyHUBw
 Tm9S5fiCkoIj7LKcbhRyowlUOxEhCT6WUE6_njK7_LU0vxZC.N9lXPzbD_vQehndd6AN7_xqTB8q
 MZO0WuS_TcFWfDV0Njux8ZbvhcndYToARGfLGL572w58iGpd8MZYzWPHxU0Pa2cmPg36HyPxoI7l
 OcTaJWjdoMJyxHyYturBR4h4K.PvJWVHBMMWkdzPKxEyoek.W0249lzpx6u8yMK3MsPaCmrYceH9
 dN44IHyi_h3GLRJf_a8BKUzRTLrQWX8QgbO5NzdO5K2NEWlZ9K3WNB1C9pGRtoucnMgbH_Z3o7De
 NLHtBWyHntv4qGy8SHRKn6MuTjw2SxIeV6jx9JBocNOowdIjJ1p26LbFChK9U4KxGo2v_qA1vGtg
 jRhjvx0wDPQfsJxstCkB5kBDnKxwJ.peHi_itRgHpjES82b9O4b9anH.h1sH8XJKhqepW6cim97n
 .0fTAgAmAhg6EJVCekYZO1Bfh1afkWcx8T7WsRJ0e7Hym2g4YCcEVNuNKCTq1xmrJkmRDjz2Zlbx
 gpEBcFjKLzX__pWI7OSp7TsnLLBVPxpRxYqCSEzJDD9PEW5of5og7wz4SesJ318oTq2WzY.HWdcZ
 XuwvOSrtZCcuplIzl3hoSI9jIXRCfr5sjSTAY6bExLx3oxwk21UmT30dIXvkrLMvs0SDqeI6ffKv
 NgXp8uSPGDg7GGwM-
X-Sonic-MF: <serdeliuk@yahoo.com>
X-Sonic-ID: 38cd3ce2-86e3-46c3-9878-96cb0e1b22f6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Thu, 11 Apr 2024 06:48:15 +0000
Received: by hermes--production-ir2-7bc88bfc75-nv8hd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e8da3dacff1862e94bec4019096f82c7;
          Thu, 11 Apr 2024 06:36:06 +0000 (UTC)
Message-ID: <46bee5df-3d66-44c1-9d7a-86e32a2149dc@yahoo.com>
Date: Thu, 11 Apr 2024 08:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Samsung Galaxy Z Fold5 initial support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240410-samsung-galaxy-zfold5-q5q-v5-0-9311ee9a55f7@yahoo.com>
 <8f2c7963-c660-41b6-a93c-0ac19818ecda@linaro.org>
Content-Language: en-US
From: Alexandru Serdeliuc <serdeliuk@yahoo.com>
In-Reply-To: <8f2c7963-c660-41b6-a93c-0ac19818ecda@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22205 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi,

The list of changes  (changelog) from the cover is not what I should  add?

My patches received only two ACK tags, on V3 and on the initial request 
(v1), I was not able to identify any other, I added them to their place 
in the change log

...
- v3
   . added b4 version 3
   . removed address and size cells in device description
   Acked-by: Rob Herring<robh@kernel.org>
...
- v1
   . The initial request was split in two patches sent due to the following checkpatch warning, was requested to re send them together:
     WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
   Acked-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>

I suppose that adding them to their place in change log is wrong, I 
should create a v6 and put them at the end of the cover letter? Or how 
to proceed?

Best regards,

Alexandru Marc Serdeliuc


On 11/4/24 8:03, Krzysztof Kozlowski wrote:
> On 10/04/2024 23:28, Alexandru Marc Serdeliuc via B4 Relay wrote:
>> This documents and add intial dts support for Samsung Galaxy Z Fold5 (samsung,q5q)
>> which is a foldable phone by Samsung based on the sm8550 SoC.
>>
>> ChangeLog
>> 	
>> - v5
>>    . Added ChangeLog
>>    . Added missing Acked-by tags in their respective section in ChangeLog
> Where? I cannot find anything.
>
> Best regards,
> Krzysztof
>

