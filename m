Return-Path: <linux-arm-msm+bounces-86055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2312CD3693
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 21:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A073010993
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 20:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467DF28EA72;
	Sat, 20 Dec 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="jbfzC021"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49825C80E;
	Sat, 20 Dec 2025 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766262210; cv=none; b=jIx806zKosn4xbqdTJtP4mR7rgymB7Taf5PiG9wCSVncj+tOSQC9lp4sdy5IiCfU/7eEsl0Ur9pAP8cIqYW7GVL6Hp2mlQeRNCeWvntTpHK+OcPk7psysFokYa8Zfty7AGs9NT48/apQnCLKUiNxP8BROjdxAKECwq7jakfLT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766262210; c=relaxed/simple;
	bh=hjpijsCjlk8DRnDfyZ+fz5MqPIyQzV7LalH7iGjoBv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8HJm3x2r63pNWjTcpxIN2wZp983Jl7+MGcdgINLJAErDlUUoAEz+1BkMcyNRXnh57twZ6AKNXkocO+PKzJPbcjreu+FdIECf+RHlyrUnKTQtERavO5E0abPYAxsHJPbpswmYnGEVqx22L5MYDiBNqMgoSw+yGAZKzVcFdGRIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=jbfzC021; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1766262205; x=1766867005;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=hjpijsCjlk8DRnDfyZ+fz5MqPIyQzV7LalH7iGjoBv0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jbfzC021H/AsxmX73OdoQqvrx8anhIwoiyrVRAZHdX1epTuTZ7sWFhI+khGC49Qi
	 SSsIfzBgI675aEFKxsVB1Nb1sEzFNzCv6EikIBcaLyJ+uz0ChjbM3Xz6mo2TbVkfT
	 qavRK3QdU37fIcnZlmGmppaJXvartq7BDIXuISSd7QOFhXNieuq/xgw+KyvXmV+tO
	 DE0MykQXfIzyJ+o3L0Cwz28QcV4TanTDN+Ues0BYLgxF3Y3uRFsfGizZ/SaSsCjUb
	 swk1HUHiXuNfSGoMBKuBqKRCjr1CuhZF8AQin/Nxh8uLD7YocAfpzdE3tB2fyzHOC
	 xT64R8B9CFxqJZb2Lg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MGhds-1vjkyP2em2-00ECOT; Sat, 20 Dec 2025 21:17:23 +0100
Message-ID: <8b562354-1c6f-4b13-be55-b23a6a93d9be@oldschoolsolutions.biz>
Date: Sat, 20 Dec 2025 21:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add
 hdmi bridge with enable pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-2-18b1e20b396e@oldschoolsolutions.biz>
 <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <72bq7sblm7iprtxg6oo65mit7vsheux2xatqlk3csf6sp7ersg@77p5hloqf555>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ULkHe6ZDJAGKhqlk3xGCZnaHiVchS3N/1pZB9s5AEOv/Ly3QHqN
 HNQHqemdukM6Mgu8yBmXaes9nb2CGeUrBGlP8Kh3ZQflefkb5s095hhzr8WswFci9HqMcNv
 D9aOyqJryCHCT94aLaowrMmkp8zor1q59PA2PYVtqbVhfxZe3dJ1efBz/5K59FH7rD9yCfk
 Uxl6qlhf39gr1TCHN/5Fw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7uItiO9Xt3g=;0dz3/j6uBgx0Ddq7bz1UfvotTUY
 5bY536hO/LGHQ3sa2IsM1oQmAf4Dcm6AECDItwATQWCHrLtqThaFGfRthxQmIAvC0Br4MNZni
 8DYtbhXhUqGD119SM4x5x/pS662aLDZwKp5ijRuVl6MvTfisxWGeK1zSfk4F5MNvDxpgUBhNF
 TgczDSPDBr5cualYCIfyWzbIAL3nUab9FeE5Qg9IAE0VnQr9Q6jWJaAOI6iV08XDf+XolgXDW
 8/bOF7zhY+LlpTfpxi72vZ9lIF7pZAWSt+sUkrpscGuBBmxJUZTWLJ1gvySzaUJZHsDOLFAgW
 InD+h0YJNX8eBb4fJaCgz9eR75B1Tfu2cELI/Zsoq/RUi/5jJaTH7Sz3tOcaLeVihyWxa86m7
 z0U3q6VjhU61Krkd0xrhoRcs0Vy6z4bI+e2us6EbhzztdVfyD+g1lYvuhpIH+2bbqVLRt8zCq
 rGyVOSiqDYDxDNTZ3/g6tJ6eHK9/D/N4/eJ5kChJwNwrpGZpPmz1sOD+TaSZ6wr//pF56hko2
 9gqzvrQo2/9lYy7eBbLPR/V6KN+qG+zySWGDN1kMXe8tuX1mc5uMc7YtOE6x1jsajnLmD2H1y
 n052KLI4kSCCFOmKR1qciqadcNVUAVsuCLCrdNPNHpAeV033/16klx7vDXTl3i46p3Ikn9s3p
 DQG5pLvDCg0gXYa7KV411CRviz1w4fc4cGbdEfZvZ/0eu1XHlpqvX8IJruCWoMfZJ+8BeBbI3
 5J0DvCqG5C9gyVZeh/d8QEmYkyj7j8XPdZ8Nj9V7eYsPmdGHX9QHN4hzaPBB8yb3Sw4OZs8AA
 45u8Vncv8pMXV6534hQUkpbh6uYS9dgtFCe6Ysy77hfb2Nm4Y1mVMs/0HBNMPrWTKFDSqgz19
 8gnFIdxWz6l8eS8HXjhErpqBtkzCV1fw8CapzUbjm2TYXz/UFNF7oJsDt/q6uScqNTEx1VsJK
 aHxF5A+u0rJf+iycw+s1nWb5Q5WHIFQltt6wYPtQljnNlgkdBSZjPBUaNtranPwzdaR5ibyAL
 xDRuusF7J3jyqYCyzFDEz4omkRtDz4Q32wgrhESnhQmGBDnku5k7+bL6qYmfbcOxZGy5smR37
 KZoY3vDa8zbC2rGwQxKmgMqfL5zHLmj2cXYKUhi95CBDnknscQgZr/HJ/LKMV4wPnaB5Vzu6V
 WjobD3qiUCPxQ9Zg7Ov45c4jWNAUWEAG1RnyLOIMfXpHDlyWuHdDNjMJQONPs8Qrs1hJHhegm
 MeOaeXei34jxAL4dmn7z2nevKqrBkDLygienFp8VxObreh/CLbRXxcwGShVdey5ZWKymbJNtD
 6SIawC/d+PuHqz10Rc+8cniO4Lkk7u0dbwV4Wgl6e2xcvhFtZr4qUqpNvN8PhWqGEZBBzL8Lz
 Q5S7lQLb/GRU/QJM22YjJrRPNq4gMIYCAU1blUFoOR9g/ZXgP70B2Wdf5rJwOE54tVHRtD7Ff
 KpZyNlK3YFZxonV62jVRIZ+DGFCNyhqNnqtZc361qxvJ9OrFoN5zlFClVyYU555xdMZe/AOck
 w/b+vh4O98agMbhKJO+yTI5nakBPvnQNV6tV3foTOQGP+qAvYXFU4joFCIKL0aPd7SHfgrsP+
 7MtBAZcCLob3Tt8UWl8JTQw/LHl1Uux/mnBLdnxVxHYLcnvX/SlD11492zfkVo5tmH8XY/adc
 PzLuvjZn2tIDQoR1MEKF3QOAjqf4U15/1dZh2oJMfOpU1n629fdpr15Xjkf6X8AwjRyzZ0T8I
 NaQHDyyWo+18tLQLnV4OBuA1mBgmPs+pVTru8cdw2ygfgNehQkTvTYBvPAPjiFdIFd0CqGrcl
 MlcD65jAi80kEXEKrlNjDYDy7w==

On 20.12.25 19:52, Dmitry Baryshkov wrote:
> On Sat, Dec 20, 2025 at 06:47:10PM +0100, Jens Glathe via B4 Relay wrote=
:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Add TLMM 119 for hdmi bridge enable. AeoB has this gpio.
> Whaat is AeoB? I don't see the GPIO being used in other place.

AeoB is a resource format used by the QCom Windows drivers to add /=20
overwrite definitions coming from the ACPI tables. [1] It had the info=20
that was not to be found in the DSDT. Actually, x1e80100.dtsi has the=20
edp0_hpd_default pinctrl which is required for the display to work with=20
the function edp_hot. I verified this, you need both. I can use that=20
definition in this patchset, too, but its not for HDMI.

[1]:=20
https://github.com/alexVinarskis/qcom-aeob-dumps/tree/master/lenovo-thinkb=
ook-16-g7-qoy

>> In general this is the same setup as on the T14s. Since its using simpl=
e-bridge
>> and also is Lenovo, we also use the same realtek,rtd2171 compatible.
>> The real chip identity is not known yet. The bridge is wired with un-sw=
apped
>> lanes, though.
> Is the chip marked anyhow?
I don't know. Haven't looked inside.
>> As for gpio119 being used twice: It doesn't work if you don't, so it ma=
y be a case
>> of TLMM multiplexing hpd for both ports.
> What is the relationship between enable and HPD?

Yeah, good question. Actually HDMI hpd is wired to gpio126, and works=20
without the enable pin. But no link training succeeds, no display coming=
=20
up. With enable set on probe() this works. If you have the lane order=20
right. The HDMI socket=C2=A0 is "above" the type-c ports on the TB16,=20
compared to the T14s where it is "below" the type-c ports, so swapped=20
lanes sounds reasonable.

[...]


