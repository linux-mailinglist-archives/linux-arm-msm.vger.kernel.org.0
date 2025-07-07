Return-Path: <linux-arm-msm+bounces-63877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C489AFAAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 07:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2C9516E57C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 05:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FF4262FEB;
	Mon,  7 Jul 2025 05:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="id5gyGtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39232E3716;
	Mon,  7 Jul 2025 05:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865883; cv=none; b=Buqq6hlRhfR7Jq1m/5cTdMG1IadOE3r8KQM1lkzoW6GqWwZW/JTCTjR+7MQYRFpHEazl2hntzJgNC1IUddhwdXLtCGqddRS/H1OzW24HBRHqBdYKIOAVXiq7s+RFeGNnXuoEpYtmWwySnkaQcG0d2mAPRjCSM/o9sc4T2cfnCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865883; c=relaxed/simple;
	bh=rx6pHyen/TGfkdYHa02N353prfXsh5go8davgnfU6Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LalzHSsuppbhI8QyUP1WM/uFIh1tlFD3LNpuJkC4sQHZCRIxbwMbf7dociT957b83NHpZir2KkOxdhI6sxzTzKHBG+nRSw4w6JFjneu7+yZ1T+vwwcAisvwFdhObomnBUe+O3qBuVr5GozQyJtR2UYoOjUSOfBeg4mtK4i4TIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=id5gyGtr; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1751865864; x=1752470664;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=rx6pHyen/TGfkdYHa02N353prfXsh5go8davgnfU6Po=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=id5gyGtrHH1e0azmQj4qX2mehB0bZ209QPfA8kg54dZSlkUrxvZEv6Oh5Uvt7VU2
	 z90mtbJEPzWbAGsrh+j16JwbHAIm88nePQlFxf/Uw/YbHjvgKRFtDqXH1GTZMgZUW
	 YAVBsRIlfkaQvbA8M/HsuhXnwBimUTirEYfOMfrX9Y1CJsyPJBuQJt27ix3zL7FbG
	 tTRghFark/wXaDU4eIsfdmkPjfUu8q9Nqyo2jsuaY1/6DCGZUqkD5AL77vofEGNnX
	 UcJpPA+IBpj/S3Kay6eNXjz+ROWY6H5d17pokmC0eJScRf47NCVllmVSy12uggdD/
	 atwnTvCxVpezeH2UTg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.41.123]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvKGv-1uq2nW3wvZ-00ybJH; Mon, 07 Jul 2025 07:24:24 +0200
Message-ID: <8e72641d-77e6-4d10-998f-669de30ae495@oldschoolsolutions.biz>
Date: Mon, 7 Jul 2025 07:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 0/3] Support for Adreno X1-85 Speedbin along with new
 OPP levels
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qLMGZZwoM6+ldmd7++Vubj4ab/6aDcgFW3bvzM71bBx9kFSjlpO
 Kdt0vlIOT2EVbwzMG+OUxcL8mafr4n75Bv0dti8oCoASS46v+fFcIsT8RBYtLuQJ62Wp5ng
 K6BrU1BHmCfUSAPpXgrYYybMM6XS/v6Z3NeRN17tdzYkmP+D/d/c03/HXRQdzBewxbx3n4Q
 sBrnAqN3krBwD4BTUAZHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wxN9Od9Yqn0=;HVU3PIrdxRkHBrsGN5YDaBNptv+
 QCMgc3Oj7rxaSfhMVKtkiZeqeEOxZ5pchTBt4F3i4Tp/lRJart/bRSx4L2b0qbpKmuFZpCATJ
 ofngEvNQRaI07zcgFqwEfouuQuy8Azr3jirzuwQd0YjkLrkFGr8udf8LWnLnAA3IJFla/7XQF
 1v5u5R/F6K7p1CI5PrZvyUdNp8A6giGE61GgUNdTJz37U13U5iL/xNCiKc07qvPrXjK7/1NhK
 R3Y2V4BUsaTUiY87J3jPFaTIscgt3TWf868gXIpVIZx9ALmsFB15tnNJrD91N2LjxHvGfcyks
 wt2X/40wZyguV1uF3d+VkT09yDz2j5h60WgWBSguIbhlujder+Q7wct6uHBSYOV1UrsvyF0Fy
 RX4z4ikZQa+ld+KfrStx4IDrSskNJ4BqllgcQOxsGx8MDEt+XWKLlNuBz/2b/Sx3L6gvusIe3
 8Lc5b4YXdWVKWpptISgOp5k5dxWukUCjDhaKCk51oO4GSvWDVfCoiNBGOTHjR2pKaXPA/6gjy
 Ck7YrrEFzjCg9Hi5v5Nt80dzwsM6zOqFAfRpbXD+BX1GYJUp+M/myULaSgpppdaHUXE6bLl8R
 qoQb4F+CXxPwpoIYfRo600nBqA+rHjxb86NaQobftPg3YLmFaTrVRR5ZbQeQrs76xxn52rABx
 QPQ1qNgCUg+oUPuC5AhYBt3rVUhW3JNea9UtXjRamGGddGYdvgcCwbC9mmOclp/tgx4Gk4kW8
 7TnDwwqmakib1u+R09EtpTTGm/HG+wgISTa5p/z8cglNk5/v82y8J7lhrPytEZfRJeJ6LzYXf
 0UOElHz8NMWA94DvVO29C0txHkmc81um6COhPlr7D4Tl1jH7x2NlRnxPnrT1lbJR4BxxjZPNf
 EsvFs3BllBCwGPgBQYYl3tBxZFbt+g5wZn5uU8SMa6TJgjyU2OciwRr5M9oHWzN2SUcPAIPmx
 +8S9MCfbV6B5tFKUE4pLO5vvaDA9HiTjAXmJh8eTZ0Qu1g9vPzCwswhGINdsA3edmV1Efn02V
 xcBEk5D78sLQE/ejkR9ykfMhgyJM8Ug+yDr53IoAml3I/rKsxQIcmLz9xCrfB7KC0ZsfqDo6f
 uxll58h1tPM7GgMluiZA1KzUpbLHbQLEWYl+gHNhdRVzUWrabIkAMRhtLLALhW5pA9uN9gWD+
 yQXBB0ZH0UI6TJbcXfmooO83H0mVllftEfOJJwp0DnPAWHL6awNyT+AQocmLjFSk6Kq/bafcp
 rU3LEs9dkzhGGhU0p5jUXns4NNQeLqq9j5KMyq9cJVXPImbW7EwFAFqZfh5713egyD7KJ+pHY
 pJK92dLBawv5krtIz2MknciGZ5Ps0te3wYwL7n6nxBypSff3iL6GGsOjVZm10fvc/47Ws9KVw
 sNIbyuz4SBtYnk5KsJBiP5LJ9suU5VewPKA3w8aegaSsy9nHc/SFibnW9xUDLcDSmFwr9Y/m+
 TEnxsHA3UdwdthA9OsNei8u+W7oRf38ztaKfPmaHxWXYg9KWGSFo45LKt0ZE1EkbZrFzP8847
 JwTnyQlPZ8jBBougN+42ULxX90y0TmqE0ZlL8Fpaapx4kG4PTKk3GkCjx+DOCp4xWbpEjwBox
 kjXjbpC1nma55CcL41KwN8vdcwpUXi/

On 01.07.25 18:20, Akhil P Oommen wrote:

> This series adds gpu speedbin support for Adreno X1-85 GPU along with
> additional OPP levels. Because the higher OPPs require GPU ACD feature,
> this series has dependency on the GPU ACD support series [1] which is
> now available in v6.16-rc1.
>
Hi Akhil, thank you for the patch. I just tested this on the HP Omnibook=
=20
X14, which - with the matching dtb loaded - shows the same max frequency=
=20
as I can reach during benchmark tests on Windows (1250MHz).

jglathe@x14-jg:~$ cat /sys/class/devfreq/*gpu*/available_frequencies
300000000 390000000 550000000 687000000 744000000 800000000 925000000=20
1000000000 1100000000 1175000000 1250000000

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens



