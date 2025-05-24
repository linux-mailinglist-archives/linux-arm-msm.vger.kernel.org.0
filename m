Return-Path: <linux-arm-msm+bounces-59285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5EAAC2EF2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 12:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9895A1BA44FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 May 2025 10:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2ACD1DE8AF;
	Sat, 24 May 2025 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="vG44CBST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29519DF8D;
	Sat, 24 May 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748083871; cv=none; b=NAM37DfQg4cUmvXjeOHo44QE6FyTs2QzFLFE4tAFvkQWuFy2Jm8wzRSia0IuQ+S+Tairny1H4aiTuoPTVCD0upBrwjahkg8J2/X4LpZTBmL8H6CuoOLrMVsJGACsXel2GbjgtBz1L8M3Ncxslo0IkrZ7dbbpEzz/hdRoX4gfO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748083871; c=relaxed/simple;
	bh=V+8gcksgA34Mb1jQ/H076ofeWB/Ytb2Wb9fhfJ3Dbls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2TrzXCfowfy6HGbUfsbEQkdAQovcN8RZB3Hzic29FVTNCuv5o+A8WqryOTo0b0qcQ+9t2ZmNgJpHTD2BIsDsOQ82wHfu0eFiQMpbdbpn4mN/tliIPeM86I6BRYZjyLbu9ZfDZjBgnfHllkpzl0/vsxkY2H7/BnWnf7X5LDk+2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=vG44CBST; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1748083848; x=1748688648;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=V+8gcksgA34Mb1jQ/H076ofeWB/Ytb2Wb9fhfJ3Dbls=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=vG44CBSTSn21UNvz6yvAkFjtROBT8/wA1PBSCmWhcVWanJ7ifZgdc4SqO+LJjvQ2
	 ubyQPrtKb4N8kADNi6Gd0HL7iXkh8TNafQ2aVQb1GFdt2x1BVfgPCeDDbETymSpJ5
	 xvQR9Xh7NXSVGqRcrB8AvRbrTTfb3fVBjFYfYOEdabTdE7hxMOtxilprPVEcn0p30
	 mB5Q5icuj6BGGKOBcpl76gChXjmlVANI7crKOU0B154CSZOVmGKgHuGpC4edEeXMY
	 Vcjcy4D3a27NE8FUmNYBkWvJxljLoh5WCUi4Vj0gE2B5SkhJMpAoAXOAg+I7MLmet
	 5iB3C8vDj6CLxSE6mw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.39] ([62.226.41.128]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MaIKJ-1uO3Zh1kRx-00MAMB; Sat, 24 May 2025 12:36:20 +0200
Message-ID: <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Date: Sat, 24 May 2025 12:36:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
 <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CEXvmp4XCv+8zPPu+FcRtrcVcIxIkzBQVcfODOJhdqb7Xq5nhl2
 iYumIEoYBXlBZZ3Asv1pLlVyv8B6IyUTNMfwrGnSNjuzKsFFeMAzXxKDKxUA+63MbZhzxVU
 AcE60yDuRzxqTw7NwXQhR/u7VUz7PwFW+rxOAX5wKLQh4GXX8Z2GbRSadCWUC0rLSE//4QY
 HaYDaaBgb/Xlj8nhFretA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h4CAzilZimU=;zbk78YgQufcWfxxf4+ETUMk+xN+
 LI8EYn2AN1rhQOx+IXFj2cK4480tQGQgRl2PBihS+m3mEcqFOnUIrI8NlSAht/Kk5+Blgwo2O
 R2rEp2b2D80XoKrMHLzKAmOhyO7BG/MIq9Ye3ReeVnj7WVegyV6tZzofa5+MBpsvmI20F6okW
 tQCUfHdelfwQr3m0164NCcbSmHGXaPLRxBFGDnsR0l/6VfV1PJc325zE+bUlqJLdB+zx2fgG9
 RChDM2qG7cfHlm7y9Z98/FoQRJhKPw6nR+6jPstHXi5JG+LBVeTBWP67UjHIwfpgSHNJBdt13
 vKc1OKIxnSLjM8B9jk+afac1H6HCDDazinGUfZZ2iUuzOPtWev9ccVViIgZ7hBVMWWl6ag+AO
 qPmGgxgn8uHZECZfqHnSPuBoY4oVopYszb5BuDoP1G1Gx8JI8WT7nKJZl/6IseCeUapFEW8VY
 +8F1iJhihO+yf+3J+SQw35FILQkYN3xdWmrR1/P/NAv9VWquMGOWUWTX/0QutZmX/CbTcFKsy
 KVePBkK7vKuDci1pyPNGUdj9o8cxLQL5x1AGscSXBQnmMKDH7Y29WOdDwA87/DeWrvLx9LhgN
 fJ5aZngsrVxFvVlfRKYuLhF847fIBs+IBjzj3PB/kE2ZFUgnGV7UwMglW3XNAwDozckMJygCt
 i4U1Pw59X2LBV1j6jAjfc3AR+y+RqlpSv6owzIvJWOlQrLxmSopomgqlaSLxFiJBqo4a5IBOf
 59xPFfMo0VPp+DAvQ75ikZ4GF3EWAkc3dm2cc4VKlAjgVHUwPNBxFXmuy0m7VmNP5LVQdlcgm
 1b8M//w1C3Cx+Mo9UCF2uUBi/Ml+UiCWIvA+NKqBOffS+LEJmmEK1iUwjqxFVCC4h3DYMbtyC
 TC88jmJvk1IXrujGzNzHzaDtWh7ybsvPC76dimJ3mWxvse3gH+ogxJ7/uUZFIpEqzv7DoGhVj
 kSPKBmuctOk9k11Ir3xhJOpD1Kz4ST6rxPQuuxvvmMoLS+C9oTe8mqn9LcFNL15s9ijCfD1U1
 INdWTXRosAkDr7FADQSuzxaKlMIYyIbBliPJnKW+OptGu9AxeprSLDBHwCWr09q0Lx76BfF2v
 TKPo82ebye6BfjooinhX23/++4iRlcHd/P2Oa4KGSAuh36GYNseFg430higOP+NKhPYcD8B43
 EkZMQyYuO7WH3pOgMKKjSr6Fn9myuh8QcNb4C1rIw0bOaJIf105nu2ticMA/TBsLsrQ3Y39r/
 N+TOlgcriL6SWlQfhrAAemVchgd3U3KvyYeQbaR7O3Vzt5Yksv/N8ldNGH/0z5zy48fALPqMA
 8Y/qlIkxaDNKWYqMs9aFYcyyqbriyhrCjVSmvo5oCgtCBb1IjwogOaQKiEYR8hGWnGOzNUUEG
 JnMyNI7Jbq8EF1kDKirevA82G77F+nVD+M29JLTKAc5P1Le1LQmFuOZd2N

Am 24.05.25 um 12:11 schrieb Dmitry Baryshkov:
> This will break without the next patch. They need to be squashet into a
> single patch.
>
Changing the order wouldn't suffice? No problem, will squash

with best regards

Jens


