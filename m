Return-Path: <linux-arm-msm+bounces-73425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D3B56960
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 15:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138AA1895F31
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 13:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCD01AA7A6;
	Sun, 14 Sep 2025 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="kbax5zU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E781373;
	Sun, 14 Sep 2025 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757857017; cv=none; b=ifFiB0MEiR8+DTZDNfJlL5IIvsznfS7nmcJujUxTuqZlQVEhWv6p6W+0fzf0Ptro+XTOX2C2jWuq15yT3VBr5iMKoRnPq9nI/stc/pXgqE5t+n89Zg5Bo3V2Fcu6+MV1M89g6gt+UA6j2PQOs6xnNvXoiajD4vD2GEbnDo/4UEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757857017; c=relaxed/simple;
	bh=cep6ppNyfti/9r4QwBmFXdY7gr/J/HqDlQvs+irvF9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=At+GqiM6NuaB/fHi4bPZ/QvBGy31kEDmGL/qpZxOLjTtLK9s/uLsOEwVwyc2gOyxOyW0thwvcpdpa0tqJqayATtYcbNPlSxtSkJND80IDtMUOVunNuMtMRVo6v3ABPNI0vU33y0gFw+j0ZjElNmm2O9C5KswatZExowRafmfH9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=kbax5zU5; arc=none smtp.client-ip=212.227.126.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1757857008; x=1758461808;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=V8HxM2RBb75N6iacViKzD4Nxie/izh1GFeazB7D2ppE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kbax5zU5LqABuLZt03VT+ySbK1mQvG3LrZTCQ2sJIXzXKuoZX1H1clAS//yeQ4S9
	 WSpdgHbv7UNBUdKYsgW31jwDDgHXHXe7eUMoTjGfvoILQvP9qQLp4MjqJIk4twGkZ
	 RZfQK8GIQFyQtT/h1tQqsaenJMg5faRbBwt4JVgmCmZWlYrT2ac0HctqH9m4x8VTe
	 BoVci/kyheNbmRkQkLt4GdFFzIMMlMa9vTQiojZT5AtkJFifo6IegRBhCsGXAw0SG
	 AxVPYQn9g9ME5GxLdRsf/494A3pSOm9xQNCbLGAXMkCtEQr6ogTS6Ipm1rphEO4NA
	 pVEp3KlBz8qgmkxHtw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([80.128.171.52]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MDhQt-1v5FTK09Sx-00G2pY; Sun, 14 Sep 2025 15:23:05 +0200
Message-ID: <cdd2ac5e-d02e-4dc8-a4b4-06baad5679e9@oldschoolsolutions.biz>
Date: Sun, 14 Sep 2025 15:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14
 device tree structure
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250909-hp-x14-x1p-v8-0-8082ab069911@oldschoolsolutions.biz>
 <20250909-hp-x14-x1p-v8-2-8082ab069911@oldschoolsolutions.biz>
 <aMbBOgNc-382vwMY@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <aMbBOgNc-382vwMY@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YlzvjqDmjC5WJzo6NtUJb3yJu7LsgeM7OwrNS2wGl2kVA6o6jy3
 yvnT151gq24mTZT8i6GlAx+if51YocJrluBfiBimQdpik4RFz0YFN/vX0YeBDv3sLTRzXPj
 zUUfxY6JG69hWnt8cFhmxcGIe4wucwRXr4jJR1tNMioqgH9HhnN3u9MHITbY21k5xFiyzVI
 hroISMkqd92AeoBiCfYLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4IE65x+rPqU=;EMuMqg+XNeGuitKc4A6yssdqF+o
 dQLf/DABj7rgwQmUFIqsdOzT+5At72uSn3RAN5aLfjUYarLXojMpfHyQCab/67lE4uH73BmhJ
 FYnoFLBqwoSoHUTYkDHifI3mW6RNTHn3RLzZhbjrpsDCwB8E4t0D8PXPCzo3QABAyu6NZHJLr
 vQxNNWLlojGRPN6ABI7ESVrxuIXNp3mb4Akubw0wl6JtnBZr1T2qQQzROlfQ8LqIISHcCwLSX
 RaNSwedOAvzUhOfnJBIKT9HzAyJdyoxn7MWnm9cITv69TmtyZ6+ts1RRjaaqE0NsUyL32Ys8b
 ERtaItCDMPMvFXpPbGF/Si0yR1HgbdYaUtGMFh1U4qzF6bQzoOJDbswnhVil4eAgTwXhS0wUv
 JaWtO4KJctbmkQYM3tsVQRr8fM33WYUMX/DESwufXFvmwykisnVdSjZ57xEuh+lndCfmnIybp
 EwdqdPZZAW+SurCIzYx37yUDd6Z/iXf5SucCh5r3UY902yVBoFWgPq6ut06b0M18G1jk7dYaw
 IfMz0XMl7Sql2a/ZEyaaiognxDRsijazECEDi+M66ntuSeeZSOTKHVcSWoKrsM/doCzndr2hL
 TC7rf4xumsz8KIug782rgp4CAoH8JdwwdOIX8b/TCOtA2uUnbweGjuh2YwHlYZ32V/PZlw0kT
 j9hGaQ4YLmeG7ckOZo4PWIPRK0dk6s0AvtAQ6UWfT3Ei5fXrmJrIcEq6sf/RPEczqu77Fo8/A
 +CSk03uep7/IqQKPFFgStqfeXYJEUtriIGoMZJBemNuEgqZQj4Txm3q46u7n1n1G2Q873yiDB
 fXYveURNlcSfUI/AJp3n6dUhraIvSUq4yORk/CC6ObgNG3MlhLsMckZT5pmpW3mRcgyZCfTpf
 I+9SlSrXbBqQjHxv0B6G/GZ9cc/F9EWxRJ7+iDWnFIpCovG5oMTsUEkS45t1FsUiDUeo0i90e
 MYbJwR+5ruSH4aJxLuHMtPTn2A8S+2KyHm6cpizN4TGqIfi9YnGmZgYEG/XP4t4ivABYnoOde
 lW623Xqu1Zovi9WDx7spdeMMCCEwC176GJDC74hfPd+s628gxS7p6Nk8KT0fnfX87emae5u2v
 b4CP7R0WI6lobBcI3isbggMblOF5HFAXFp6NitFk6lFPreEicBVxnAHFs+9g2bXiZPOI9P2Fe
 jpjLRmvaoDKaXJgmXy3IdZXlUjCYGv7Ivpj4D2Co5TceDLs10EH0aEBv9R3CzgRETIMMdEs7R
 NSRBwf9/6rUAGcgX/AJGywqO/gf+U4JKSCwlFPHVuSSH5GgQC5KpQ/y7Qp6RTe0VPbZ1zsMGM
 FDuy8NIIkwrme4IP/8AfRzbozbLf9LSI4nZnMYvJpKcbJCp5/W0w/wOv+cs8XHcZ8iTZy7D3N
 tlDVBSTVw3UVF1CSkmSFyAQsVzeIFT0pZfvXxJLSjdXF5BT93ydQpc2uvl0csrBRYkVjD9GtO
 z2F/81PkRf3jNFUlGdna9iRYctZ34XWgQLy5pTbR0raFIinHm+kQhdcNPslWbeCWR8osQC6im
 6F0FUgsgNg1b561q2H+HDng5cFnDOXmCVKYo5Z+ed+6hlQyeTYlvA7S1dpBFVztrHw416Kw+K
 1k6OdbNN5LGjOi6QT7xAis56ROmT9+EuypjUAnjx73fY2lBobXF1CchN1XJRXaQByFjjEBLJX
 N5hjCdt5h86Au0KUMIqDmTocEt1/s7dn+bx9esP6EUQv74+e4jBXSvESDb0wlpZZJZb1MgJ1E
 i1JErCOP31Sl5EFaon8PZSyIKWUt7314Dzw==

On 14.09.25 15:20, Stephan Gerhold wrote:
> On Tue, Sep 09, 2025 at 07:02:34PM +0200, Jens Glathe via B4 Relay wrote=
:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> Extract common elements into a shared .dtsi file for HP Omnibook X14 to
>> support both Hamoa (x1e*/x1p6*) and Purwa (x1p4*/x1*) variants.
>> Required because the device trees are not compatible.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   ...hp-omnibook-x14.dts =3D> x1-hp-omnibook-x14.dtsi} |   48 +-
>>   .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1606 +----------=
=2D--------
>>   2 files changed, 48 insertions(+), 1606 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/ar=
ch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
>> similarity index 97%
>> copy from arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
>> copy to arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
>> index 716205b437df55489cfb7d29846cdaf8e403cf72..e6851dbaba121029bde9263=
10616169e319cf5e3 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
>> [...]
>> @@ -1028,6 +1015,7 @@ &mdss_dp0 {
>>   };
>>  =20
>>   &mdss_dp0_out {
>> +	data-lanes =3D <0 1>;
>>   	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810=
0000000>;
>>   };
>>  =20
>> @@ -1036,15 +1024,13 @@ &mdss_dp1 {
>>   };
>>  =20
>>   &mdss_dp1_out {
>> +	data-lanes =3D <0 1>;
>>   	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810=
0000000>;
>>   };
>>  =20
>>   &mdss_dp3 {
>>   	/delete-property/ #sound-dai-cells;
>>  =20
>> -	pinctrl-0 =3D <&edp0_hpd_default>;
>> -	pinctrl-names =3D "default";
>> -
>>   	status =3D "okay";
>>  =20
>>   	aux-bus {
>> @@ -1061,13 +1047,19 @@ edp_panel_in: endpoint {
>>   			};
>>   		};
>>   	};
>> -};
>>  =20
>> -&mdss_dp3_out {
>> -	data-lanes =3D <0 1 2 3>;
>> -	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 8100=
000000>;
>> +	ports {
>> +		port@1 {
>> +			reg =3D <1>;
>> +
>> +			mdss_dp3_out: endpoint {
>> +				data-lanes =3D <0 1 2 3>;
>> +				link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 8=
100000000>;
>>  =20
>> -	remote-endpoint =3D <&edp_panel_in>;
>> +				remote-endpoint =3D <&edp_panel_in>;
>> +			};
>> +		};
>> +	};
>>   };
>>  =20
>>   &mdss_dp3_phy {
> Please review the resulting diff carefully when you rebase changes with
> conflicts. You're reverting other changes (4 lane DP, eDP HPD pinctrl)
> here. :-)

oof wow thanks for the hint. Will redo.

with best regards

Jens



