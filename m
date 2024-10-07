Return-Path: <linux-arm-msm+bounces-33332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FF99261C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 09:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D511F239F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 07:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F0C17A597;
	Mon,  7 Oct 2024 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FaNftz7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58CA1474D3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286436; cv=none; b=BSwJKELAxzqBiPC5iH2NP70hIQEEahTOIYPXz/xOoehXyHjmEw/ya9NH3sZPIbw0X+KLZ6ttHcmzAddbtjEIswotmUvI7DQbmP/k9sCWzHi4KU0xReaGTHxEMXXUKVAU+SWNAsrMjA/+hSgcOA1faG3Q2ypXgCm06sD55PLixvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286436; c=relaxed/simple;
	bh=tA0vf/LKMjm65h2iXKNoBIXf017Xtl0o1ImH5wGAdIg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=d3tDTmqoP7foZfVfLCkELeD8U9RgyRQsFsSZ9FzChwnVqac6VnOXJZgFDL4Wo3Kt8bx86MqWIFCkCy2avZjevY4e+0kRwzipp7aBf2371tJqUXq7J0+Z6Rgt7oH1+KYjGXDpRKvA8qXFJJhJDtioLfP2kKV37UdCMCZKbTF1JI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FaNftz7H; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37ccfbbd467so2984489f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728286433; x=1728891233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JfQSTnXredGt081DQK4doBdILo7LxgqoBD2tUac13aY=;
        b=FaNftz7HPefdD/9YgWkLtAHUshHp7rE3C7wDJJ+vwc8uIId5LNi3RwH/o7nZtP8F2w
         n3cyWyzVW1PJ4nyco/yWflsJ85TlIr+ZkWZ1HgP+nGoaSHi59n9xFK5F5rtP+peaOK/a
         yzrtThoMyRZUCZrVj5ECb0OC8TTIpvvsjZBpYHqdxQ8TXQouNCX/wGQU1dpvtzDlTZ4j
         i1mU2T/97F/g253JRYR0M7Jz25kTmfEqANF/c1YJ47chCLgy2dE7ZnRk/JpAgfdDX7rb
         JkNHGa1b5CFPW1nKcfPr80Q+0emA/VOJsIW4uMTzeKWXM6x14o8h++t5yWGJJXLBbPeQ
         AlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728286433; x=1728891233;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfQSTnXredGt081DQK4doBdILo7LxgqoBD2tUac13aY=;
        b=YCdqgbb0WSRejk0G1cxcI7CkC12t0TrK5bDQyqJAXPJhUslPRRvmF36/s+iZNOP8j7
         t9cQ2ZZnv+4gcYDq5U9ezX9/rVaeLr4D5YK0s2wW5Rq8HFs4sxn9sNtMUKwN+vA4n9F3
         KT9StuHhJcmhuytDSYBJwQBPlxThGPx0UPyrqbKgLZ7RwxOVc6vjalkyKdthBwx3ssaP
         Ne2A0BEvyrkTm0rmoRFsUFj4M6bmjcSC0ju2lp1ObK9qPWFEW55wJfiCiBO2JcSsf6LY
         oRJCzvcoAUO2gJNsxM1LBg7FNq4t0Q32jy9kqEqITeFdIKa4TBjPTSydCv7tz/wd5ejG
         BgAg==
X-Forwarded-Encrypted: i=1; AJvYcCUCLmp/wSfgiFXwPmUKkXn3e3TVWr9Wgj2vBwkpI3fFedJQWdueWlLoaCJUhnbCwl8rEzJEpH//vDwbNiKl@vger.kernel.org
X-Gm-Message-State: AOJu0YweCSN+2MergQkesk7iXh+Vpe639Z5+Zws3ptll8KrBljj+uvnL
	FL/g3KeEWY8qg+Ydc4SX0GSbqKTGT1UVa58UorFKhlZXq6lOrH4jjuDuOXZ16iE=
X-Google-Smtp-Source: AGHT+IGHTOsRfB/RLltA6wN6lFuH5F0Tmucj/D2n0kI8Zp78hZD/B7Yc4VCHHysM4z9rA7Vq8FHxzg==
X-Received: by 2002:a5d:69c3:0:b0:374:ba2c:3028 with SMTP id ffacd0b85a97d-37d0e8df955mr6202908f8f.36.1728286432987;
        Mon, 07 Oct 2024 00:33:52 -0700 (PDT)
Received: from [127.0.0.1] ([176.220.237.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691b725sm5023127f8f.46.2024.10.07.00.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 00:33:52 -0700 (PDT)
Date: Mon, 07 Oct 2024 10:33:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
CC: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: =?US-ASCII?Q?Re=3A_=5BRESEND_PATCH_v2=5D_arm64=3A_dts=3A_qcom=3A_s?=
 =?US-ASCII?Q?a8775p=3A_Populate_additional_UART_DT_nodes?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1fd4b0db-f9c1-44db-9aec-45f3aa269e19@quicinc.com>
References: <20240930085533.17119-1-quic_vdadhani@quicinc.com> <uk3zgyee62vrkcwtujkuw754wacvullmsjnimlqhmmbjit24rm@sqcrmbn7ngsg> <1fd4b0db-f9c1-44db-9aec-45f3aa269e19@quicinc.com>
Message-ID: <B12D1E5C-76DC-4B71-B1E4-39F83B1FFFC5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 7, 2024 9:06:52 AM GMT+03:00, Viken Dadhaniya <quic_vdadhani@qui=
cinc=2Ecom> wrote:
>
>
>On 10/7/2024 2:26 AM, Dmitry Baryshkov wrote:
>> On Mon, Sep 30, 2024 at 02:25:33PM GMT, Viken Dadhaniya wrote:
>>> Currently, UART configuration is populated for few
>>> SEs(Serial engine) only in sa8775p DTSI file=2E
>>>=20
>>> Populate UART configurations of remaining SEs for sa8775p soc=2E
>>=20
>> I think this is a long standing tradition of adding UART configuration
>> only to those nodes that actually will be used for UART on one or
>> another device=2E Is this the case for all these UART nodes?
>
>Recently, we have begun adding all possible UART configurations, similar =
to what we=E2=80=99ve done with I2C and SPI=2E
>We will continue this approach for future targets=2E


Please describe why it is done, not what is being done by the patch=2E In =
other words, why do you need all uarts in this case=2E


>
>>=20
>>>=20
>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc=2Ecom>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc=2Ecom>
>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc=2Ecom>
>>> ---
>>> v1 -> v2:
>>>=20
>>> - Modifed commit log as requested by Krzysztof=2E
>>> - Added co-developed-by tag=2E
>>>=20
>>> v1 Link: https://lore=2Ekernel=2Eorg/linux-arm-msm/98e7dc28-4413-4247-=
bad1-98b529f6d62d@kernel=2Eorg/T/
>>> ---
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p=2Edtsi | 231 ++++++++++++++++++++++=
++++
>>>   1 file changed, 231 insertions(+)
>>>=20
>>=20


--=20
With best wishes
Dmitry

