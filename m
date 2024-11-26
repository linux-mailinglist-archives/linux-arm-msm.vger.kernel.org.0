Return-Path: <linux-arm-msm+bounces-39186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3239D952A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827B81665ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B1A1C2323;
	Tue, 26 Nov 2024 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="1Ktq5vjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD01B85E4;
	Tue, 26 Nov 2024 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732615747; cv=none; b=aoEQB2GMeyDZcGyJciX/569Ajm8GLhAGiF33eevPmUy++W3ZLsWE7ilMwacGG6R3qoJEwL/wLNCsACOIiyZs9PkyXkpf9t9vIQWyCePJbXOUL8/LU12eHJnydPSI7UJHQRtlLxOGwHwwpvv3FT6Fr8Gsw0Kfcastfk6ex/cqufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732615747; c=relaxed/simple;
	bh=RJQ2Ith3kfvkd77GXLCJbyKVRPntbpM7zCWWMZwykGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qs13LH9Bx0iVeHq1bbk3zxENpys/SayXqOiU3+FYnvgM4DjypC7/Div/r90i2VgBK+s+tf+g3d+XmuU4VKI9tTuE5YqbbXcUwR5O5/Yxr/5wAzcg52E1+EveMpe5t7wUbUbqKm638tp2hxkJcBJpO1Qn/nSKHhih8hfDad072Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=1Ktq5vjJ; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1732615736; x=1733220536;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=UqgJ48Ha4CrAwJTSYwvED1Nl9FQ6CTIHGQ+zfspe6IA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=1Ktq5vjJs8SKXb8MjMkwRf+TAsbfo98EFk1dN/yqEy41XQSBv3+nDnzWTVZgGsPz
	 Cay/sWrRSq2fMBr5FOshX/Zm/bis6HmiDrihwONJNCg94hpqmOGRjfG8b/ctnsFSr
	 J1XuZez8HbZslCE0q62V3qTHLL3Jb1ubA+Ofq359OKByqkypqz1pbPOgT62G1d7a9
	 TFy7CnLzYs4Njjh8zBunj+7rdw5bINkRhQyICWyOCd2GBRMfGvJTBxJnMFTdRUWiS
	 IHoC2tFQZxZ/x/fx4yhpy9b2Ot/MvC0ShjTQGrn8Qrddf3JdRVlGB4yffB4I+Kx3H
	 FhLis5fFexfacutdiQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.128] ([91.64.229.215]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MsI0K-1ta9Je12z4-012Kg7; Tue, 26 Nov 2024 11:03:08 +0100
Message-ID: <1fb0ffd8-1e11-4d9e-a935-29ea4e30c8fd@oldschoolsolutions.biz>
Date: Tue, 26 Nov 2024 11:03:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add HP Omnibook X 14
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>
 <dgilzuguxfvzqndp4rjm4hlhejgporfvollk4sqwquk34g4pka@dinzg2kfk4x2>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <dgilzuguxfvzqndp4rjm4hlhejgporfvollk4sqwquk34g4pka@dinzg2kfk4x2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:p95dLl39HAqGZyMZQe3at5sITGCOt38D4bkBO1HRwGKLBRasN+l
 miro5BoYdM1w3n66ThYdEwzBMMV/X5cVGMQKSKjAqCvl56jp526rZjoffmPRBm4oKlfZZiX
 PNHMfTivmIFPnk9f04D8kBEWxdJpB/FSrtFMXo/bDSwFIlWohIaVIBiK2/uoEWcLJR7eZiO
 OQeUjc1mXLQOcuIsjCfww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ednO9n8r/EU=;gd64rDU5CeD9q8OXZ07cJ8nS/cq
 HTwBkGUWAAv2XQqsSyPTDB53g95gwccN3TIdPaP43CCXWXnBWT6BwzkDO0hPD+gNWY/7qBNkm
 2uayGSeCTC+SnvuNNrAJH2vVgSX1tN9iU630xpIL3eiw7MvAb4mPFol4aJU1nSoeFiBQ5x8ce
 0xaO0m4c6SMYq2E6tP1a/oREw6AWLTO8irGAl7V85ZmCrUimTqQPeYc9Lr/FjY90TMgdGJwho
 vHvYgNfVL1vh8Ktu6A1CqhMfGZYbz778BxVrH4Ml2VwegupT+2b03vxV/NrUxAmdnsxC7JdON
 PGLBdpia7zEJzWEn1oph1DVxfdnpwCND/Doq9uBd8C7E2LY0mCH8iXr/QwUt1bDFpYjaXscwt
 mT46PyH/6hB/PY5jIoSt4AokalEZYjZ7EKotj0HA6AY59C0Qi2IsP38OfIJWwbplLr3V1w+aK
 OIiss+X6bfoZ8QD5IyNmU6QpB5VkxLCL936Oa6VhvIN6+43XocpRKgCEeVdif76Lt4bK7NoCc
 5RmENrsJ+Ybn0jusQ+apOOuWN7jdTTAXuRoV4vG7tveNK4RZ74Hc0AB2kC5BW0cSi1Uvg+slc
 wug+VzTngAu6Gmekuqcu2GIQrdn4DKXlVC/A4VGVo7QMoCVQZVPJhzWtDNeVxgNFDXoujZUHH
 fUccx7KypfhQfF8lWuFMTrDPUhqbKS6hMjLQimcRWypawtcIDONw3MUZD5QOL+1Z022y6yRz5
 Ak00/6xGiil9jgn/TGCxPz4b5GTYGW2eOFztZR+AXuhX8PlOEucPoFgyGYtTQcF4QxJQIzA5j
 e/4BtIZhewYLBUHvMSHCycdZPJ6eMCz4mfdgK02q+PmAZlEoAzqPP2v6BwZMHKozJIq8l2xXZ
 58Zf0hOmKruwtLzOU3G+sUkSF6IVMrvbe/JXzo+6Hi/aUACxD2InsxZrYZaO4OToT908JZHt/
 6YftJIhRoCt2vwUVuC++1sEy6x5ej/tMB1kO7u18qogYaIwVdfyS3kwMfiDSZ9j4k9ZdS+3Ji
 SKtGq9Xajn1eoKbu3WLM5+lr9TNIE0tme2Ln3dz

On 26.11.24 08:34, Krzysztof Kozlowski wrote:

> On Sun, Nov 24, 2024 at 02:20:15PM +0100, Jens Glathe wrote:
>> Add compatible values for the HP Omnibook X Laptop 14-fe0750ng,
>> using "hp,omnibook-x14"
>>
>> The laptop is based on the Snapdragon X Elite (x1e80100) SoC.
>>
>> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
>>
>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>
Thanks!

