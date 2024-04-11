Return-Path: <linux-arm-msm+bounces-17211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204F8A0E7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 954851C21966
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E910145B28;
	Thu, 11 Apr 2024 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="bj1IPvKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sonic302-48.consmr.mail.ne1.yahoo.com (sonic302-48.consmr.mail.ne1.yahoo.com [66.163.186.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAAC1448F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830515; cv=none; b=IYcrELtfGTJ1nSmxCNO8pPB9kkZB0RNA32RlqV8vhuWhhSWaJ0IM+ncVsP/yulMNOMqQOKyNRmRkwAQP4AoxUiEMT29x5wwPquRXQeqJ8Va1TqzhZyoSMcFN/eDx6PCLl5u5JcVqMyyANSxYwPTjQ+Gy6Nhf+2Wz5wbEy2JDJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830515; c=relaxed/simple;
	bh=nLPiicAZhj668D8fB5GjdtT8makd/lwgyoDBhv9tku4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzprVK+Ouo1/is0lrP5eIVzPe4ZS9ekYjOIsqHYr6B3vLAehTfdGI8Nz8dEQgdT47RvfOqSLNrrCfTS6tKvZZAFYVr5fbv/oQTJXFcdLgFc5ER/MUe63ZLDR1k/hoO3gXD7cRInc/PVaD0D5xf8gm9jmrIkEZGdnnpo1zoe4Tro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=bj1IPvKm; arc=none smtp.client-ip=66.163.186.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712830513; bh=FyWFp6hm6KQidmYIN5llczicdOuEw/7yhwY+6fnIACg=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=bj1IPvKm7Ost/r1DLTm8AHm+DZAa38F9c4D72xBVkeAS7DfdLBJ/2TG9gF3S1m3K7tcmJzGL9NhIjpYyWoTlctfdwtO3fdEi6MRVPpulZYUGq6BThNV3Zrdo8sV3BYxJY1sby8kbs/eSMgFf2FT2OzISAQ7Y0db1ZbsRmKsY+FouHH2upyLgebF3yrm7/jLFe7A1UwJuegL/aUb5JWlLRjoHDIRSLP94hiZu91E74t66SJpo9zB5ftVbj2+EV3gOUNVi5zKirFfu4dsURRbsciSkM/OxdIR2+0UmDYV+UOSYSCsL+0PtfyZqMQxkLSTx8sOWdj1qtXTWQy7tmx585A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1712830513; bh=dwf+kgWzpIwji9eB/J4qi1SDsWYuNCTIBm0jHWE5EWc=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=JdnSL40LoP/ynqKe5Eb6mrywQLXHWCNAvM/8nseewhIUZhjiHR1V5RtE+4L4IiNRBMkxqNXfddSlz8s+PnzO7Y+FsiY7KWF5MvyhJbXxU6GKmVrnrDSr4zQV4I6palqtnL3m8PK/b+/RCYZ+yUkpUkUxbS0peDzYwSEULW4rssbnlFISgm7n3dmcIRFh58mv4qPKZn1Riq5fxjQc6d3C29WBMWvAMG+Dwmnoy5D3xcc2MPnt++wZcv2Pwb2ZDxFF6wKy1RNYhlQMpM6FV0tBQqQ48FsXiKabpDOmiHH0K3eraxqMuDWy+Z8OE/ulxVPY3FPcqlfHWh/3YyueiCCrvg==
X-YMail-OSG: xZrHN7wVM1l5H.UsOGDFs_zafXNU.i3oIrg78LRA65ku141t9CeluXwNsIB_d3d
 TrtAwy.aspM3NqONvT5ZbSlm.6agHr6SgCIvyijrkIZwnYUiPf6PcQCiOx_YOi4cd7VT6Px_pFdG
 a.49GeBuMQLPf8t7Tvko3XOrhVpT40y75b86nLyrhZnY8nEquyH.s20Z7XW5dGkqv6Jfewa_t_AG
 vWspCTJKiy.hdPhOIlpJkp7omrguNI3zQyCL8gofSd28xtBOa2HyF4H92u2m8Qmk2FDAJE5JyGac
 c.z02hcnVjc3G9RlOx4QOg3c3Gan8FkNIFtKTqy.VjsznOh9JxMzkFv8YxyRhX3gaU5KJVw9uIBU
 urfe_IhCh7m6QtdtmpJm1wWLTED0aWbSNWsoAHQDQF5vZfKWDoakzL9kJxwDpFogfZAohOPSt90G
 gxD6bhsZoEbRDFxFYqbG9Gb7BGyYjQQO.LO3ODtT8Dik_xof9x178IZ0PGUzfFmAAnfvo2Z64zL6
 kLARV9ktmuPGzKbFZbAPGvHd3s7x8i56qM_MSsOaEC_YY_765Ls2Wwsd_l.xOFldlVZd.pmHlB9V
 LXtfcRhxTCuIYMekpXx.FAyFylvfL0fMVN_4dEFqJPEc60CwAbHk9c5uBA2bFKGYTyVEQO0LpoNc
 oX9O3l8jcpC6BdtKSgEP50U5Y1nYLTzqtTrFIzSJg5I.ZDQSlkncXGu8aOrLUwyXFsU3RRQoNe8X
 ecDFq5EDQJkS7IRTugNK45snDf9YIp9fhUwEGl6FfZq59PTFEjaPLzZAvL8zYkn08z_C6hF7E4Ca
 kXm2qD2FBE7HMtWfTbcSSNvIBLQNFFMrbd0AZ17gKYvIjK7ajQN.tlHuqvZte9SmBgxT8yZ.rNrg
 itZGSbk9megmg9z64AOrAvNHG_ro0k.GTa1KA3JSq2P4MjTYxaWAN43UKlkMgwzJNLQhbE4I.zXm
 NJ7MjRBGR7vXo7sMQTNXL8hkyoThWBoG3MrHdcP4PMIyZgIfqK5CQ_1e0WD3ELubGBjYLUpy7dVm
 ZbAGL094fHfm_oNHTmNxapc5tR2HV.JpKNBxyYQ12nLXErhvzYHx9Eiil2tgMy5QE2n8gc1QfMNO
 9D_V_lwMcG18yaEpUAzPWgvYMXhgPBwqLY1z5WVTd.urStmDFHsrcd9d9ncWTketiXCc709CYnu7
 CaPd1.trCMGHGzpm.Yqj7tSY7kNgcDZt.GeMSUmL6z7sTppU4nnslzE9rxEn7kgDEW8wmOQfeb2H
 P1OUZYl7WfJXUJ5FWWf.fqXAomWmne8zJGpo8ZQagVR4dYQMHdMZ.B75N6bwrdfvZsCyNC4kp37a
 Dkjn9hntOvGen1woUepQfndFbzZIfY5fzD2YzlH4xBrPOQAY1cwT553MZcp0gixoViWD35O_6EWV
 aL8x8AdqHsvIs43.tUYeaeg9jGLCapDv1t1FEy1NhahVN9htkjvxS6SIQXjZvWxEZwhzHzxF0GjJ
 jCUOyGA52SChNfzJHy4XBIonOEAg4p2LA2lad527efIy9Atz2FuEDVzGwscyUdT1aY7J2T.Yx6UQ
 fnjgQORB7YZEIl8tzzF5bKnaOrvtzeNWoTMHQow9hUJ27F6KDHGOB4eZoIkAxJcIp8U5zpn2Za6k
 AVZWB4dSOl7tb1q3w1aYPGA95eTchKlyhSNzY68A0xio5IqrtLl7HRT0F5bF_aYV.PGYi53sWsKx
 AAy4vYcfk3f9yNJL77M2zoPg3MI4AGdYfaVfIAev8gs324Z9PtlALe5sWUMppeLquFAzzHGKEqCy
 0xZI9VGU7XMj6qtNv2_Sy7KF9doWjRWd_y3PGSKrXjTyMNcfDSRxuYo.eBPtGAm.kNBBuLl_JBrn
 Bx_hYpWI_1z90d0Y9K_GBKbsl8OSa8OP1ah1ZboR9KmMWSl2FO1uRykFHyHW6NK3qfCUi7vxkzuT
 wLJ6BxdLTeaNGRdLzGIy093CUxr7Df6G47Z6B8IVjJ.RgwgfTSX9.S72mRc8AZL7wwAFJJZVCj72
 R4ynTaw_mF5uegDB2L2XPEQNc2dgiOUOWVjt1xJeU.gD8AWCKYHQ4MtuGKdNTK0gSAi2qgxQOP7v
 t5pLpqoabvDOJp8aYub9x5uWbKAF9GPuxFL7G0Xu4cKCYEMzOUpZgdzZ4f9MYSZ4cvXTaX144PLI
 CBqB1s29VxdCXOhK06NSEuprjEFYW0Q03EtAs.9Rmk56xpS53s5ABZRvlc2aKdIUI5soq0_SDNzM
 oGMX69jpCrxVUFEO7rJwEccD5doZ4aNpXHDVInXL53m_5O49Zw3PU9QNYLNAeskqYVIpC4i9yge7
 I58ObdBfe.hu3yYjurfw-
X-Sonic-MF: <serdeliuk@yahoo.com>
X-Sonic-ID: 3765697e-1a35-48c8-acaa-1614da562948
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Thu, 11 Apr 2024 10:15:13 +0000
Received: by hermes--production-ir2-7bc88bfc75-8kqvj (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4610702f466598076d8aedf02a619181;
          Thu, 11 Apr 2024 09:12:31 +0000 (UTC)
Message-ID: <13e5f1ee-a036-417f-982b-7fe8ec6d8f1c@yahoo.com>
Date: Thu, 11 Apr 2024 11:12:28 +0200
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
 <46bee5df-3d66-44c1-9d7a-86e32a2149dc@yahoo.com>
 <37c5710a-426f-4054-8632-e24b9d920bcc@linaro.org>
 <fda53b22-c3b6-4c9f-80e6-8f22637b8b63@linaro.org>
Content-Language: en-US
From: Alexandru Serdeliuc <serdeliuk@yahoo.com>
In-Reply-To: <fda53b22-c3b6-4c9f-80e6-8f22637b8b63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22241 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Hi Krzysztof,

Thank you for your time and please excuse my lack of knowledge, 
reviewing the first reply I clearly see now the details, but i missed 
them initially, I suppose that due to the lack of knowledge in regards 
to the procedures here.

I am going to  generate a v6, thanks again for your valuable time spent 
helping me.


Best regards,

Alexandru Marc Serdeliuc


On 11/4/24 10:47, Krzysztof Kozlowski wrote:
> On 11/04/2024 09:34, Krzysztof Kozlowski wrote:
>> On 11/04/2024 08:36, Alexandru Serdeliuc wrote:
>>> Hi,
>>>
>>> The list of changes  (changelog) from the cover is not what I should  add?
>>>
>>> My patches received only two ACK tags, on V3 and on the initial request
>>> (v1), I was not able to identify any other, I added them to their place
>>> in the change log
>>>
>>> ...
>>> - v3
>>>     . added b4 version 3
>>>     . removed address and size cells in device description
>>>     Acked-by: Rob Herring<robh@kernel.org>
>>> ...
>>> - v1
>>>     . The initial request was split in two patches sent due to the following checkpatch warning, was requested to re send them together:
>>>       WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
>>>     Acked-by: Krzysztof Kozlowski<krzysztof.kozlowski@linaro.org>
>>>
>>> I suppose that adding them to their place in change log is wrong, I
>>> should create a v6 and put them at the end of the cover letter? Or how
>>> to proceed?
>> Please don't top post. If you add them to the changelog, how are they
>> going to be effective? Please apply your patch (e.g. b4 shazam) and look
>> for them...
>>
>> Submitting patches explains where to add tags. Look at other mailings.
>> And finally: why even bothering about this if b4 does it for you?
>>
> BTW, in reply to your first posting I gave you detailed instruction how
> to proceed with tags. Let me quote:
>
> "Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag"
>
> I think it is clear where you should add it. I gave this instruction on
> purpose so we will avoid this mess...
>
> Drop all invalid acks from cover letter and send v6 with proper tags
> places in mentioned place.
>
> Best regards,
> Krzysztof
>

