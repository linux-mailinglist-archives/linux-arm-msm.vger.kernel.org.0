Return-Path: <linux-arm-msm+bounces-86056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D290ECD36CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 21:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43A973002509
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 20:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AF3310627;
	Sat, 20 Dec 2025 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="cWjngpa4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E61E2F3609;
	Sat, 20 Dec 2025 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263492; cv=none; b=QQ9/rIqAnWsHOJxe6rDuTFhf9Q7LfwaqdIQpo39HFwtHyLp1eUx4hiX/XhVHqsPSy7Ar7u4TwfOWzDURWaRrJ8DbpwYt2kud4Un9sog3KT+0xfSlh5szva3VbtugckG/cB6MHtfBB9hmjpbaWCYxv7N4w8s94myG2d6ZZu2saXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263492; c=relaxed/simple;
	bh=Lzk1Ok3BTaaFHpZupHeCiDZY8/Dy+OZE5zgQHvrutgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pa603WO5x5UVIAnVF4Y0TEUmZXZD2Ig8khu3jS5tccUjLkOHLdzd6HT9eO6IkYzoczCGELycNCleX/YiauJyvx4HdZ+jZbP14GKBc3WEYOFR/395F032pnjTp8wOX00LhQfUYac0xcPm37IHA4eyyq2CfeMjwvt+am1UMSn29gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=cWjngpa4; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1766263488; x=1766868288;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=koDcGig5xLflj819KhwLIEcNAMdfnUESnwP9JoYSg2Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cWjngpa4nmPB7An7QhDAU8etLeTUKqsUX/t4K+xita2RbQ0iaTwr2wzjvQGTcudI
	 rMCBSJgtkU63NZ5GQK/bZ0c4TMFl6ao2g/21t3e+h+XfS9o1IaksdqrgvR+ea9pgi
	 hII4DSRO5YSp+xISE8JlNa2fSIgEMSt45nArv2qekqvP5B/anSrkt9FosWFS5tLoW
	 v6pElfDY3hgNkqsybgiG1R/uAL57NCG6SGFz+JyP0XT/m3cSf6UB6RroTPJHGB3H+
	 +RwnGYpDW3E6R6fSom9jt9s4qUVfYYx4clKNsGlIYssOcb7TA/gXS0XpsxG/KJ2Yt
	 +OLvlP6D/KBtHxzLnA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M6EOc-1vdgAw0aIi-0056At; Sat, 20 Dec 2025 21:18:38 +0100
Message-ID: <da036d7f-e509-483a-98d2-f511deda8d5e@oldschoolsolutions.biz>
Date: Sat, 20 Dec 2025 21:18:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force
 usb2-only mode on usb_1_ss2_dwc3
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20251220-tb16-hdmi-v1-0-18b1e20b396e@oldschoolsolutions.biz>
 <20251220-tb16-hdmi-v1-1-18b1e20b396e@oldschoolsolutions.biz>
 <3zazejrynu6cl4ah36virtjl2jthlrjw4h3inkp4zjaovbtaif@2dnywhywqyzb>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <3zazejrynu6cl4ah36virtjl2jthlrjw4h3inkp4zjaovbtaif@2dnywhywqyzb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2ykD2jDZXKqDQv+3I+TPm4iVpzDLp/cH2G7HMAHN3Ru5xtQ3Dvu
 Cur/HqemO4h/hymHH+3TQvnkn1dlQf1eIOER2seb/zo9rS7Y4+/4tZ5hq+BSbymKgfsdmFV
 8YHYKSLAdEIs53IlpbaKxVK2gRMMxf9F4CFUHyd38MwCC3E8q+xl42p0IyEkjllAxbqwoXd
 Ak4MZyqhx83P63kJb9ncw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x7W2dwohhqI=;OumdA1WVPairt3xgNyuFA+hvSlF
 tquNqtaDA2/fJH2dVKzJNdOjNNc6ROD7T1bm5xrRJki89a18KZfPf1GLEtMW4P7jHnT44Ne/x
 mGvh7UiKDPoSrhXQADh1CYJgDGO1iJfpJaje/5MORK5Nz3W1G6LEEnYLI4fS3MWuIda9szC70
 Tx5I2+Wqzt+m228aYH0PG9yfZ996B5Jv5zMnFQVlwCQwlOODFGysVs1uPI7RhGGtYEeQRkSk7
 SNO8YKpuXhHwIkcXEV/PSNnqNjY9wFMtGtWuehWqO6yYd6/dRvZAJs7TjMJRE46ub4Fm/+he0
 xMAC9E4SdXcQyBkqzKNzpixUuzyNdeHgA+ddu3hGOrmQGDFsdlSdX/zXn9bVRK8XmGYNGo6eb
 6T1x0M5b3yEYuJd3h3V6d5aGpCq4BeiXH1KHEqtionqbivr6oTo+nwS6A8ReL2QHb2U4fAUX3
 dAGI3KyVzNwlJJ7TyIUPuElrtr26FugRmITGrzt4FIawYXJqnu3YzSsQrVEGOkVc8L7hYsv89
 B54Mw5oAQYP4GyoFYYKJhvrzNEoCz62s6VkkhhbemIzffM6S53CDZUjRD/Wl/FOMcLphcdCzY
 vM30YUna4KcD3uhZvhwXpP1AVybL79VkAqCKulsOFdE5D1M63UFM68qi3nAopFX+aFzGBrYvN
 LX7u3MUOZaLHXFAgTkVxLJ5Z7TwTlB/zIz1Sj+L/WI6g8czpRR4XnWkxf4k3bVmZVktYQNCpp
 ptJQCf8wFI46QvYnkfN2eN1XkVYUSFgQG/gEckbkDuGuVItPy7Z+GvC0mdmfReS+kI04LP7/l
 qbFaxizwzhaT9ln1pTmhpY2XYFoYm1skDoj2yAMARXvn/I9TWvJp34db3u+6srdUTCzsm4COS
 gBNGAA8Z/uYDY/UFTscY1nrzE7GNMDONbui6NWlxgXVKzrDpY3RZoMjDsrPVUB+Ow4t7ISdHl
 v+rYa7Bl/OhuKSMTzRhyYepp1kVGyNfsUAs2YKWYWWzo3JjsE8vQNEyaTcmaNI0U2GETJhfhV
 zysJMRTL7ptokVoOjcLy9cRgb21hLOactKF8KoIYEJ2CZkuhsXj9d8jHrkjXN/oQsdRmWnvOE
 c0l1ukn6LbeSUhSZ/FFPyOiKrhloDMIJruAuQjqJQXor3/S9bUdKr6FQWy0n0uR2VzDoo9gWy
 fcdkF7Uv4y5zatJX5qyPVmqrIwjHqm752h5Fflilo9Uvy1fO8Fu2iY++sZZzrKTm1VQanAZAS
 Hf1xcloKK2fzzJg/Lrym+SK2a1djHT1t4bNchd3KuOE+umkKG57D+a+aemmkMGtVrOIJF29/p
 sQkm/w88KnnkUsk4d/ez8FMNcceCBIwq+QTcUInt0kNAs5pnV9Bmu7duoQDjzL5cIN45+BNuv
 2u0C3Ny1ZMApIVmjWs2q1dCUPMo/NOwCUpL7EnJpzYvMJHDcn60xZVRArFLKZVaCaqv5oQPFq
 vKlOGaKW/BBALgqjCojxNgcxHeluoPjRDr2sewzX5YgNe3LpWIs65vuzu07+8pHEB8bOkLTM2
 TQxi63+rl9ptTpxfIUDbSX4RVnUtQuJpoAm29rSbRTfPv3FKH+taxCm3Iu7qm2WYp4IxC0eUl
 UJ0J3tvTJXqsLEIVgJsmwiJ3YiGBWvnZyzQWKgiOMIax6WXTSRBvdioRoNOSTIiox+z0u807B
 hmuwI42DdJ7zNMhJFqBK4HWltqp5/+olt83v9auGXoi/AGifa7fdX2bWElPZACpg5mYZhPtw7
 SAE+ScPkMr38SfASJDKLXgqjO1kTKhYiZnHpJCBMRTA8AbHQVA1H9BzkCMIqHSKJyXVzM3QXT
 mtO7

On 20.12.25 19:54, Dmitry Baryshkov wrote:
> On Sat, Dec 20, 2025 at 06:47:09PM +0100, Jens Glathe via B4 Relay wrote:
>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>
>> +
>> +	/delete-property/ ports;
> Just delete port@1 or only &usb_1_ss2_dwc3_ss endpoint.

Good catch, will do in v2.

[...]



