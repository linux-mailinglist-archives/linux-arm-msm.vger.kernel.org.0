Return-Path: <linux-arm-msm+bounces-46549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B384A2239F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 19:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF47E7A21A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E48D1DE2DF;
	Wed, 29 Jan 2025 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="UPQeY7k/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613461917D9;
	Wed, 29 Jan 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738174220; cv=none; b=Bz/3oF/C1FWukqtlz5682MwyMJEzsz+r6P8QMfE/lFg5szkdoOKiuMS7+463rQeU9gDJcpKys8v4B/iJs08Vcde1wJ3navoNazWf3LFgibiWUz/O9DbOZgCPDyR1uo/iaKZogKmxB086eiK6J/MqogKMeLvLWtV12jD3iIVvues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738174220; c=relaxed/simple;
	bh=gMOapHYKVwtDoMIzCsesAyRHGCdSk9BOTKS4hZgV0s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNhNO7CoSjBjEde26TrphL61lvtm3cINtZJUqQDlkBB850WSaBJgJew98vdwTzQxMhWfrbhwikXrzZe+4GM5V0nAvAmkI+52hWd8eSG+MgTcGxKJUdofXxXyy3gZDNvxFLP9YfQb0By7qYebvnAr32bDsqhL0NKVh2VC9H5Idrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=UPQeY7k/; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1738174203; x=1738779003;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=0gH4fty1iZLIvHJirTG78ZCFfaqlvNXj5sdZpZQlg7Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UPQeY7k/+i15z5WYoVjxYADFcT9h4llHSrRGTt3wzITZNGDA+zO2ursUO1rhfwB2
	 soXz6WJNDTHyGq14f22nqLCLhZD5/MaI35NbtoTEAHutQkakXCEuxrvloBVXA8mbp
	 6szvL2282pVVCUWUsQEduUshF8oN0gHw0Z49Ga1I1EDO4hmu/KLUqiakW2WkCNeER
	 BAymj6um/ruBZ67D5EEh20ZEdVuZslDSYRagqDvPAaCu7zoJkxCceYIIJNMbB1Jag
	 cYSdgaFaoBds27qfmtnqRjlUy1NNOAEdvA6jWXDXRmf1rJP6Ko2h/MEGiTo5y0oBI
	 x1gwfAkMI0P8e9hDUw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.152] ([62.226.41.231]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MIdaF-1tixGI0eZR-006Tag; Wed, 29 Jan 2025 19:10:03 +0100
Message-ID: <044ce59c-0e88-4af0-a1c4-85e5d845fc04@oldschoolsolutions.biz>
Date: Wed, 29 Jan 2025 19:10:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] X1P42100 DT and PCIe PHY bits
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rgS6R69+EMZL6buCYSYarAw9vHwG1EFkx8Mhk7T/U3FkPpv/fzc
 8qmgijp2hnWTkMPFrZBXf+iIqnXtK+xp9m8Bjv0S7gs93PuoUrVtcvo6hB5/s+2NFOOc/vR
 vuJ9PsiVgQtsNoFL7UVkOV8vNHd2wBURfQA0blb0k3k8gIv4DhFbev8vImSgumvP6yyYQph
 H7s80zEyT8LhH2TH5aX5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OvsIYLMQuZg=;tMcbzYeFgKIQxJjLWn+8RXX3qjr
 spyXhKax0GKN1gsZXCWNYe3vcWhV6VfqcRsvepDGVZU6no1WoK9snvsht1b4+HZ7Buhm74X7z
 1CThnypK/QcR7dga0xMpPRZrm8jWAk2ZPy9jfnfr1LcDo1rl59pf8T32mY6mvV1ucnq1Rgvts
 tBz1OmWLy35suheqTZja4GsjX7QDzPcVmXJlP9ZV3xkcT3aCGqDCMMbEw/6rX+yE4CZRMVu5I
 /HSQ4dMXnaQMMVmYfkLVToFNjBc/cVWGkDyC+TLrBZbND6YhNPm/8p0OyIQF3ArsWNfJxmdgO
 IO5oK50RGfA0YC7Azm2OnPuH6w4VoyMrE52vCEPmwabo5q/eKq/MPwJjJgJcnfqHaGRmcQIIz
 c7Lj5q1ps2jOcy70jTyOKO/fpO8KJlb0Rbve3Q95G3h8wfWC0Xcc7IXqzNZokhbZmaajNg4MX
 Jzz4ksbh5QgmHAMT514pN1rmeekCp5DtJ5C769FJAwYGC+vTsGIwOwCHtvk02xK7wN/Yt8tMv
 HC+iqkvx3MqkcmgkrAQKxKD3MZmfCjXSYMq5fJMN29S3oZ8PgcN48gCiD0bAn4QGidHqDvQJX
 YCGQ+ZCif3Zc5e9nCcS65K6JlN9WMCY/WXElR11Q+jp6G+TIhTQ3HuU+UCcILsrQGMpRkfiYw
 iokHENdkNuc1tU1TlLj8RPgsXxrAuYOncePB4wHpoOlruVAhlwikzQjaJD39BY2m+uViPt1jK
 YCSLHnL3WF5USJBRE/Xj7lSNlnY1nEHvtWG82R1/KVq4bfoNxZVvby1UkaJYxut2dVrg8ukS9
 Ds4sfxY9XBAunGZoGQcDH57/shDSM0F89owI24+Hij4IiwV90j13H0gcs2I8ZCVxfOJ7Y4Ndj
 gq/vPVHldigxaqgPWZKoHE9YMA4P4RHhWAN0QQev+5UhSxbR963AoOgDONqyecyCQUexIqAj0
 wIjdvlwGk0wHKQwqdFZC5fPMhqCeLkIMoIzcQc1TnUwTJVTa+wtxkSucAvZvOsMQy3hjCwqWI
 7S5VDppJ4DREya4I8j7Ye32LHrrabSbUmluca9ZpJ91WLQLRn1xqhoS0TQQS5A/030Lf4oVgC
 SmUdLtS1tWamSzF9G+AJawyskAokC9QfGYtpwIA3CXOBrsbM7ORgQXh36iBszM22bphmCU58t
 INQw8eIivAmhcnrBAn5xtBh8vmrateD3NFIZegsw/xA==

On 25.01.25 04:31, Konrad Dybcio wrote:
> X1P42100 is a(n indirect) derivative of X1E80100 - the silicon is
> actually different and it's not a fused down part.
>
> Introduce the DTS bits required to support it by mostly reusing the
> X1E SoC and CRD DTSIs. The most notable differences from our software
> PoV are a different GPU (support for which will be added later), 4
> less CPUs and some nuances in the PCIe hardware.
>
> This series very strictly depends on the NOCSR PCIe PHY reset patches.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (6):
>        dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY
>        dt-bindings: phy: qcom,qmp-pcie: Drop reset number constraints
>        phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
>        arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
>        arm64: dts: qcom: Commonize X1 CRD DTSI
>        arm64: dts: qcom: Add X1P42100 SoC and CRD
>
>   .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   26 +-
>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>   .../dts/qcom/{x1e80100-crd.dts =3D> x1-crd.dtsi}     |    7 -
>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +-----------=
--------
>   arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   44 +-
>   arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   17 +
>   arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   81 ++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |   18 +
>   9 files changed, 148 insertions(+), 1318 deletions(-)
> ---
> base-commit: d7dfdec72fb32629d1affc32ff37a66a7fd1fb53
> change-id: 20250125-topic-x1p4_dts-3b9509bce3a3
> prerequisite-message-id: 20250121094140.4006801-1-quic_wenbyao@quicinc.c=
om
> prerequisite-patch-id: 719a1c1319a8f25be57f1e9bc68887684ff0d7cd
> prerequisite-patch-id: 44ff71b8033fc91867a83a2f8f063fd0d9951d5e
>
> Best regards,

Hi Konrad,

I applied the series, and its successfully tested on Lenovo Thinkbook 16
G7 QOY.=C2=A0[1] Thank you!

[1]
https://github.com/jglathe/linux_ms_dev_kit/commits/jg/ubuntu-qcom-x1e-6.1=
3/

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


