Return-Path: <linux-arm-msm+bounces-59790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB390AC7A52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4B741893CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 08:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C7C21A459;
	Thu, 29 May 2025 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="OcJftZtK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A92DCBE3;
	Thu, 29 May 2025 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748508222; cv=none; b=doshj6yoT8CbH63KrgtoHdh6anJ7L8uSXaLewBykSfvAZ63wiD0areNUJcFp12vNhv/42LCyaBja5PWJADoy1ht2Yof8NvlAWbTPWYmeHIsT52cscqCZe9jz2XmiWICVsYIx+AA+tTCYHHvn/VBaoX65GysUyN1YPDOqF/9TAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748508222; c=relaxed/simple;
	bh=tHCJEZlTUvEr5D9sioeISUHPCUIp9Q1ki8KmMUeb984=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2S9m6rh6lO32j9LDb7z1M8lAm2MMoJqy3DSxIDcbb3cOAEIBMmOZ3OakXlMkPNSp80H6KsZhpr16cqwTR1qirJoK5YzhXjjQ54QCNpG4r7QlsPfchWPYTCqesVATpzlwLcRaeZ2mX012BcUbXBht7vc0qPNpVVriSGIr958Js0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=OcJftZtK; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1748508210; x=1749113010;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=p9iY87Tn+tdgIRI8MAcUFWvBFjvzjQEGWBKTwolw1gc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OcJftZtK+nHV1u0P2Vhlh88yJlgZo0IhawOXcOc8hTzUC3bPNAq4hSj+mHOgrAPI
	 URsdPN+5ECyITBzVAMp4offmX/lyXBM4hK0ApVFz5h4qQVUbVG2Me8OhSmSe4GDYL
	 TsC3uxTB07hAYYlisJJASeyYu2+gygnbiDi4qqZUKEWVqmP2uIrk5ofILzEODtPoz
	 riJKnvpe8vAbt51R0vbs5K+iqlcHDbl7SDG64FFw0HT19/QZQ1+YyCialI6/WL/OK
	 7xTTyKr53+UJO/smNxBO48Gke+tu/JYwSWCZ3J7ooVytkUGFDpZkchrXTLfk0oRZG
	 Ar3Prthu48c3aNLmig==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MP2zs-1uWhQL3L4e-00Szli; Thu, 29 May 2025 10:43:29 +0200
Message-ID: <d435fda2-1471-4561-b7a0-ee831a8f0909@oldschoolsolutions.biz>
Date: Thu, 29 May 2025 10:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MrVMQ/XIXugB6wRhCU142jnMP94sqyQemvGnGRMNuI/iqNHY7hf
 Sp9k6NC9K5C/elCYxx5ZQBdscCV/0ZDm7MWdEi/IqFhmtUKkX0HUtUzo6YbDiUoJiWu2/1o
 EJT0gl1ra6fWb6wJycJAuzBnBwwJsYGHQtitcdLlc8CT2GfvyxEzhqvyWbL6Qa2vFHguzji
 A0kz0+Kp4IUrZVomMhclA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e8jvBCz9gRE=;l5f6nFFSsX9mpHIXambMyr8GDbI
 oelbdFuCPHjESQFxRxEPgZvK0J29F9JJX4IWnjUmnYYGqr7lGjHrL3QPVMVhNclP5bwj1IBNZ
 8fA9E+ama8qOY4fDOb7Tp1yA39+h/d8b5YOGWmZQYC5fXq+s03M42TN69HltpjzIqnomq9ezJ
 VRVbs/jSzFjdwMoG2IkcVfE4OWCX+KvJeB2hUXsef4XV8AMiefAMTJnFHdVe74cnvZvFA4ICT
 HOxb2Hd4XU19ofZ31CMYKKjihWeg1Gyg46KkqrpeEcfVvvtgQyyKy7w+aCODm3kQ6VS5iejlR
 uEUc0SSfUHDuitpOB5E/qGg23ItKGrSH/eDR69NlfdbBxuLCC0T36U8dVXpyytUOrxVz9mpyb
 hBMgqEjkjGvSDwny9VILKtLKfSaHZDxbJGJhiqrA68IlyOJ8wRJP859kyumQb+7k/E4R/Mdcy
 Wn6WrYTLV710nb5FQi9EQnjNyhKPUF4rwZzD68B0hU5ZyX8em9ts8Jn6UYidMUzyeKl0BxO2i
 vcQ45dixUgUZYwWXNu7Zuudw7QK72q7nbva8E0G+pxqSs35xv2XR2BzpiT6ZxvfCiEAS6Ebf8
 uI4Oh21zwmdOttlwoPHh5ubSLy0Khmb0jai2akwRUPOlJ2eBrKR2zLU3S2SLwBNKsw6CM5csk
 1W7j98wIxXiaJXkrZZvNW3prQ4UanNqhAzWLJB1qg8x6qj8qZHVHJ4afBmh4xvfr+MzNT5VCK
 1IAsykhv4XB7SJaI6FZq06e2/AK51cR+1BRtbN7Dtb7k0RCtQydT32jhz2zelks7cK7mfo3j2
 cO/HWZsvf5ZmivXeVMuPQ6F6MRwUaJenkBZcWinhmE6AD9yW9wBnMCQ8MzsgCAKXGDAR1oNzC
 mw17mhog3Vhw7XtBZgXWctESreSWM7fwOJnnbqtBj5WHca7TTgBbMXuf/lN/msPcmMQPoaUTd
 c0flJRcRCm/DiHnoynorVcrKZtNlfnTdkTOXO4nGtTLPDQncrpbURDDrbcLJTPZ7YCHMZCgk9
 IhNDcdNnYTsSg4N/6A55oCZjO4Di6ZOzUvv1DzTVkPkqzjDkIgs6QdcxxIQK6d6wszi3DCaF6
 VE/Nn6WCdRxeS9mdSQh4Ws10DepbiC5dP5NH+SPeYuMkNXB0nqcXl3VoexxwDGOzDPzxOD3NR
 kP+Utp2oNYJnM8ekoIsByogkwHJgNTT/VjTVRVAUgHaTNfb3Rsf+sGaaU9QMoV2vLYTo2l+wV
 27mz5134yidQoo04NVb7s19Yms5BIPEs3/k+KhM0Fa2N1PaGFJR7qxZG2hwl5d64Y420PC4oX
 iKHBaMlfq7Sz219mySBy6LAVtJDydXM1qPlowQEO974u0vEESxePOzLrLczDHco9+GHN+dIhp
 8mxOcNYxQGaVTF1MhVzfelThkF1rzQMDaNIkV7cTpN/EneeEyEfAQuOcFd

On 27.05.25 22:40, Konrad Dybcio wrote:
> The DisplayPort 4 lanes setup can be check with:
> $ cat /sys/kernel/debug/dri/ae01000.display-controller/DP-1/dp_debug
> 	name =3D msm_dp
> 	drm_dp_link
> 		rate =3D 540000
> 		num_lanes =3D 4
> ...

Hi Konrad,

thank you for the patch. I applied it, added `mode-switch;` to all combo=
=20
qmpphys in sc8280xp.dtsi, enabled 4 lanes on the mdss_dp's, and it works=
=20
on the windows Dev Kit 2023 (Blackrock) on usb1, with both orientations.=
=20
Getting 4k@60 with 4 lanes. DPMS suspend/wakeup works, too. usb0 does=20
only data, as before (need to investigate).

My suggestion would be to put the=C2=A0`mode-switch;` into the SoC dtsi=20
(sc8280xp and x1e80100, maybe more?). Shouldn't hurt IMO.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


