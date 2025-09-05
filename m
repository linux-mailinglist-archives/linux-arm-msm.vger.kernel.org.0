Return-Path: <linux-arm-msm+bounces-72179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E2B44D7C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 07:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC4FA003C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 05:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2FA2F0677;
	Fri,  5 Sep 2025 05:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="WaFnr3jY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51792EFDAB;
	Fri,  5 Sep 2025 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757049697; cv=none; b=uSlwZBHqmZp41kAITPRmQNz+sqha5uqthCsrmUckU5Vv6lVxbD3MGwaSx9Flv2zYnCfG+IZC5UWRShMXt6IqqfRJ47eGKdRTIrE8D5bnADF5laPEv4nElIjUdR2/t4Fx/NbpAMPPDcPw5bY1qFF9ypEGhNuSS3uuHORZL5uRmOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757049697; c=relaxed/simple;
	bh=IvqLa41Rgi5MStRNwS+3vZ63wEGrIeqTNh3mmJUDLuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClnGUAJ07VoNSyyTEm25RHCr0kE3Am00fFmGJRaqkaDBtNxFECL60U38ethJhJtZkt70rrKwEHKcdEX5HnuhpDuWFoDN0zTPLGINwHJeEWw22Q2lKlHvCpNq5rw5KwbM0BBGfrP/gDHYPxkEkLuOqJbhMd9hWzZc9ujXQdFuRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=WaFnr3jY; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1757049666; x=1757654466;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=IvqLa41Rgi5MStRNwS+3vZ63wEGrIeqTNh3mmJUDLuc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WaFnr3jYim3zobWPzFyjE7uIAigGtvl8F40hi4JltJgyoKa0kl+ns5gF3aCU7h92
	 MRe9tSIyP1VmkzjseAiHhtKH9Bm7ZDAl2pYkCJdTAjXyYNXltbhVa4SCn0lGNhtZs
	 6Ymzo2BJWyf6JQNqBYNyMKbDZrt6ZtU1HopPsgI3poA0ATPli/A7FYhq0lhY5MATn
	 lh6HLauJmdrUuiTM25UnyZGZ83Mnz/sVn9M7rkmkjdaH8tHLXogCKxfJBH7nepG2m
	 LLM3ibOQ5wuTAicE/drVPuXqXHImu7gOQykAJ3VEnhgef5TVAF0EBJr81Ju2YaKw6
	 FzfJSVnDjuvVIJgP6g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.145] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Myb8P-1uXdm83dgj-012Zfc; Fri, 05 Sep 2025 07:21:06 +0200
Message-ID: <2fca6922-c312-4ac6-9b1e-f2aa492e1c6d@oldschoolsolutions.biz>
Date: Fri, 5 Sep 2025 07:19:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v7] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LCJFX39gSHvMklOr93P1mOJM7P4b9qcXgpSoFcZkrYwLAOCad08
 qy2mWKK7IydJ9UKDeNFYsbw939l+e/isCLilco/K2AkEUUMciYONWHqGaHB8ny1WqLKOUHj
 8DVHhXGVMilw3wz0nHAWtLBDMqCu6Zw8sao1HXnNdHJRupM1bzpAYbr9yU8sWwLuvG8dwGd
 BpqEhaFW9uzlWa0Jlx5CQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+QBQyDHBlms=;2IonQUqzHq2LnYp6i3VkQ2d0i3r
 TXVqC9rlkdIeaxw6rzfFBP1Y+pXcH7XgkG8KcPZ96bJflB2I1c0PONBhGJvzuq/sH0pAzwyjv
 9oZcjtt3JxoWxyj49aB3yplXGJUK1CGcsvf+o8qqCvCcTNOy+KaA2RBfbaISvwa9nbLfmQJQE
 7V2Un6KSQpjH+KTul8O37K0QX2xYx7jby2iJgSLkJQjPO8UVkjAL1HnTo6BtZWHkLoRMxdPwv
 9EJC+z0OI97h+Gd/mZSOY8TXAvLacC5/RlKZL+nFP4kTNh6+9Wbf4xDyOJAI/ZcRvrHFRUosF
 nsVXP2sJsNKhg+9SSib96Db4fQ4n7EDM6DLZpNhhoHrzV4fDkJkm07Cd/dn30HgNn23dgRkJr
 KflSykmlwj4Zzw5O8qCeNmzMMNk7ln5b6YjYsfc3GJgyVUbM0WAxsKHzQUK/uiN5iAJbCuqNl
 /s5vzi2Q3qCmehVeLlZAaSzjWQWUgjIxIg2qrvrqLqUdKfjMLzF/zQT4BrWTSPrwNe2C4QPCS
 eORhTrrf45/I+v04uyfV2CEuyxnn3B3si9eMgR7x1+agl8ANXWeaNbqYEmebYkGpAh9aC3RV1
 AH+xZslX8wr4G/Efw6+o4Y2CUS9/YiBlPILB/zSScw7vT+RCMVnzLf+XsdIjXmzuTk7wIX2pr
 fV0kEBvfusuVLA88sVAZK2fVyTfvK4yV+1rtZ6b9IkDENXfIuQsm1oQGfg6RiTzWhYJ8GX0GQ
 Iw+LUwHOMALaP5tmc8lJ7KXpPclA8fxE68zRd+613ohW050ZkXEhsqLwP47VDhgLthYUgpvGZ
 y3kk7tlh+e4aWQuyKnr1w0Pdtl7+gnFadRh3rWbx/NmgqJAvxYcuQ5h+3AMY2V93+1C8Qa8Zx
 1e9OoznArU++TTdmdPB2GslcUbzrfuVEcqj5cPVoY2YEANYPFMewQghG/OM+Tc/dvWojDrRu7
 IcR/GHkx7Og3279gU0hVXzP39Kewe4htMcEKAXVNCBezVPW8M+iicJF66NOd/RULRWXs1kPAP
 BJaRYh4ib6oxvxUUJ2ruTkkq8z/t0YPDr6ANzsvW05Y6WjSy07tFu3XjUHb7MAQlCJ4Ijfw0O
 gBTBvI1AOLB/kh3GsEhCPL6BLYvlgKR8UkmPWP/I89lWjKZ+kV/Uyc8BP6/e4mekkyh0Oem3L
 ubdW6WdzarOWdpyRWOOQRxWNrNhYFXFd/7ZsbHJlpkZACexNuusiU/Yo540MX+pDgKoHvnuIV
 i07xtgKG+V2idzCK6BaMHpZKgaw1aTjIfwlozzz30fgZP+QMKr2yNlhF1e93+1YzPS6wK/+P0
 3u+aBaky/wG+EFiavKEkOhtJPB4U3/x5w0EutZDGssddSbJOiDoIXHM2VdrdjiLbKBHrSz1Iw
 kmEU7V2U4etJZTJ9QF+znAtzsK4DLuZiVtclIfLqzQknav8x4rGfOBFGDDDV8ywMvFhhqGbjW
 V3HTASx8dOGeIiJZ4UfL0/wMLWWrxpAikRReE/qws6z9dQ4m6FmZrnNkypB+be3v7Iemqwk7n
 +/6k/icRYwV2KniJZF+Z2A0P4xNQB517eX10R5LwFg+WtR6568s/vXd6BNLHhvdQdZfgk9RDL
 hjA3+5y1BxtKpSTPx7zuQM/WHR7YbbhTreyixdtNSuqGiFV3EBvakZOsRSR2gQdAWqrah9YSB
 LepRHzoQzKPUtzQShD5ZIGsyEdZ7kO74ujxCc6IGRDHuZ0MbW5T4yCzkyaOQ9ox3aUL4VJ9+h
 VRB1tjcN6jDhVPevtscNppc3g5SlVEAfhWmza11Hb/zxz/mTDQEo4nPo=

On 8/14/25 22:16, Christopher Obbard wrote:

> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
>
Hi Christopher,

I have this model and the prerequisite patches in my tree and using it=20
daily. Working very well.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


