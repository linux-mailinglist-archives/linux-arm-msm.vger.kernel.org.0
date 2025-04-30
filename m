Return-Path: <linux-arm-msm+bounces-56202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B4AA4424
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335201C01CF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 07:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BFD1E9B08;
	Wed, 30 Apr 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="qiDXNL33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1E1E9B14;
	Wed, 30 Apr 2025 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998678; cv=none; b=BYe3c0Yps126avCD5tDQ9Hc7sJEqtu5OzMawnovz6jFF1RKtRgc7ypgj7kvucZWfvKUKAKggLITHXUXPT/3TGbl7xr0Ai78xVBfpfq0HTB3fneUUSrdWrmWqQWen4YGviVcOAcYmlwm3HmYqVW6wucS43Gfg6xiEZzZ7K8BuE2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998678; c=relaxed/simple;
	bh=C4sWc4j5j5AeC0Pzx7XtMY7aROUJ/SFJgSlMDYKwMIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=honRWhtoyb/+Czw4KqZDo6rWpj7l3/R8kYCWF2MY8uNxb4R54FpZUcOclS3Ubc626k8qqbR5NoJI9s+lo4daEAPsRlwLESPFTapBtrD7upQAk6yzBWNoBkxBusaKFHnCPfiSQAXQlpH8Zt434RI50RAvyobT9U00Wu1M4BCmbIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=qiDXNL33; arc=none smtp.client-ip=212.227.17.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1745998668; x=1746603468;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=C4sWc4j5j5AeC0Pzx7XtMY7aROUJ/SFJgSlMDYKwMIQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qiDXNL33SbF84E7ZWDUtnM//0zHHLqF9OrMwrX1CjiKVFmzFzT2DnWJ/oAPgY/sa
	 cuw8JbQqYiJlb3y87GjdHtHIVcrarTVULYPOG7QIa8qGDvrnXmpqpxfIWc4JDaT1x
	 Ca3S6Ir+ausKe9Z2Bor2X6PuWvvgOm3lWkvYc1cfqpImQl3X/PNNI/xJOXiU5Gg5z
	 F4CaGgKy746So4rtifuRNgT9yEd/GoESPqe6Z9DLebFoYkEugTTWpU/iumfpSbN61
	 zhiou4RVsjX5GO8y3g3uXWkXeX2qECZBsndMB6vs78lnxe4AY9l/tBSTjOHC+aOtk
	 2VJVG+4ad8cXvxFabw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([62.226.32.213]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MIxmm-1uUJkX3cFe-00OMvm; Wed, 30 Apr 2025 09:37:48 +0200
Message-ID: <4d8142a3-6f65-454d-a187-9207d1eb4b82@oldschoolsolutions.biz>
Date: Wed, 30 Apr 2025 09:37:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
To: Sebastian Reichel <sre@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JpVSqj09iZRd8sl6/HjNSrEVXKRnrfcWP9XCJ4yO5yO+3xVOc8c
 j21KQQu+FbHh0FHvBgsKPBUbyWXuCNFNJbX7AhIfIxDCbcvNTBMetWI1dlWAbrZykUo3g7A
 lFCT8BBWv1r9VYPBbJ4pIBElpx+IUTXiencs3O7mHHTyYgjGiUCPU7n6i5wsBGmQfuSk0uI
 tfLNhAWqyey5qbCY5v7Fg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HaGr14C37kE=;wJFa2OrmyhIBESnHP8BKCQCn+f/
 dkEilGKaKUIZUMdhTMkgfYSrdd9I4l9kK7LuTp3u4uQbmuyKty2Trm3B3VbgFRRtcj/elmRDS
 KJ/mUhxwjcUuMvnqxCNZ5uxhYg/VpHJ1jzL1zkpnn+XArwKkjUdpP5fIoZLqF8P0TLZa4j/rC
 /tHKD0IqkgBDM+ghME6p8JRbB/WWmet/KBNraCsf8ngqgT6PTTXKTWJhcGSHa5LssMONphtIP
 aQg9fLUfJC9n3p1rlWIlIyHeyWL+0Jmol0TEbk/ZKW1R1doLQeoEaVjb7xx+O13gkaU5AytOY
 Nh0Gns+qZ8FZF6rpGEWrt8v/bcXCK1zqHu73AE0p+OP+MP0gaRtY/puzFW+OzqSx5DQaJuHNV
 HNZQSkU5/HiTyKD8CjMmb8m5sFj/z6JebNoZO0lceJ/yXpLEeHdUiFp9JXh2cvYhg9+Dgr+Ns
 z+x+Eyuu+mXq0F2PVAfH0YrOz2LouzAwHpWzkgnBsgN6jwcttVWnwpB+CAVd1R0hkBXJM++xB
 VeAN5rNCsgQftJBDDBNTSl/8pB4A7jaK7dUFjllzYTze2KgR0DJAOUqPlwUkrj+RiRP1ja4WE
 pZEku+pttacbEUPjGN5hLm1Jg2IoT9lmuFI7S1bqGrVTvCDlZ3CM9Bu2m/fuKVDJo+NMl6UyB
 xYgFX+Ad2PZpueQdeQ+mALpa5PB1+pAatQdsW7uJR6Q3ht9y3TlQYxvyeFB7ATik/CIUZric2
 7Ki5kDsq4e060GAx1cIGQEgUpSEKyU1TL1p7Xpt18+/1I6bxOCaIE/lDDzplBjhhYzS1sVdBO
 eWE+eiQQIJ3mAtd3DjNOBfYfJKoBb+oY49vRK+xUFXlPlJ0iM3ccoAEFPGxdie03v3g3m/iFl
 9VZg4yXhxdwvwLz2BhXPRbuG0Pslc/UwpiW+5r8Z0sRyTYdL1OyqGOMpRvmwJx7Z2rR0Trkhs
 pj8tr7cz43HX3lCjHOPfkLlsBEBuRDHzgNC58ukJdwsCxC0eqYEnMgkACCF8ZkpWxCzFsooGA
 S9REldhysCgXMeg7sX9Glvui6HpTaiyvsXjaniXQ+gQCSqXjv3y3C8XsvUC+pHuGk/4oQgrEc
 YJ9XcSqt8WPTJfVWNdvTyT1WPW1XjSmQWEM91J2RR1ITd2yi1rGWxxFYDbfQLgzfaNQ4zfxVL
 OHjddI1TbtwJs/inqsvjO3rP8Lb1s7EQ896noNgt7ihfb527uUz6y4JI1w00V9NqrGLiNXR/b
 4Q0hBcCtEzhcmi+GGukUH3Vfu5OPykJ4Skn+kcixRWl4KCCs8LKxF95o4CHqU3H50vpqNTJNi
 j6huzRE5LZgN8CFut3GBpSBnDcMq73o8zC89cDuTEgu1j2hjRm5tKFoxs1BS93tBTWO3zUXHI
 eXNG580ZB5n6Zr5IafE+TLdrIKwEdX9q+MPf8UNijgGop+5NcWU2zKSexT

On 4/30/25 01:26, Sebastian Reichel wrote:
> Hi,
>
> On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
>> ...
> Looking at the diff I wonder if this part should also be simplified:
>
> /delete-property/ #sound-dai-cells;
>
> This is done by all upstream X1E boards, so maybe just drop the
> #sound-dai-cells directly in x1e80100.dtsi?
>
This is for phy configurations where a display panel is connected that=20
has no sound channels. Not guaranteed that it's always on mdss_dp3.

with best regards

Jens Gathe


