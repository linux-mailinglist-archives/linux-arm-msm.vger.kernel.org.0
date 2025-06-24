Return-Path: <linux-arm-msm+bounces-62201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E75AE62CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 12:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A827B3B1747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 10:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A582222AF;
	Tue, 24 Jun 2025 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="Nwb/3+Z9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C352571A1;
	Tue, 24 Jun 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762020; cv=none; b=K6nncSBBqYcCoYg4tsOGGAFiDBkU27ZgKuslj1831qjodgGjOERwM4qIMudrdOOY64nzdQgU4CxZS8HjEuOelA3pkqEQHZy1o8FgnwT0tory3UzM2M9CCk/8giapc0vDSkFlK25LPGmObYPW/4agRTHxkENjn6/F2zJpX0IdJGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762020; c=relaxed/simple;
	bh=TbJ1l94P2T/t8hCGZfRYJjEcgqmtntEliTN9yS8KlY4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NdYVN2rUFB8ZJAOKtSEQ6R44vULLtBnNFz3zh5YzHO/bQjH0B1e1fDDFn8S1ZB5CtLqMAy4tGd3nJLuuMuybCM5dXuC6e+ndAErX1pOIfenXZwsVYclxMcp2kFiRN68qv+F0M28C1viVgN7iNINfolWMKzPsjyzp0LT+359sK+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=Nwb/3+Z9; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1750762009; x=1751366809;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=TbJ1l94P2T/t8hCGZfRYJjEcgqmtntEliTN9yS8KlY4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nwb/3+Z9Nyhq19xcuLuDaq6UEr+mP+6YAUtHnKGW2Ham0wQuhZSSaXA7A9Tl0eEx
	 wZmWfBSizcdjFFNzmrw0uQ0QCUXS7edRLDpE9I82r60SraIyNv8IrmzkADai3uqVC
	 pTpbVXep06iDe5svI4qm+BcLs91ft/qymkGw66+wr+R3AMbfykZkYHK8WP698a8kq
	 ASOxn0cre7kia7EaZV9eq2HeRBL1LQs+WdqiYrUKfw7xAnAK4nSeRTHK/ZWVV43V2
	 K5KoemHyqOvQsdg1p7yTfi1O1ZThCGe/DgCkLYbVFWwbYFqlip4vv0yBOcMvz7Ns+
	 nXunLPGXYixk69awig==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.39] ([62.226.41.128]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mxpqo-1ufWkB01mw-00rpl8; Tue, 24 Jun 2025 12:46:49 +0200
Message-ID: <a825ca43-40e2-48c4-8466-a13a94d3bc0a@oldschoolsolutions.biz>
Date: Tue, 24 Jun 2025 12:46:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anthony Ruhier <aruhier@mailbox.org>, Johan Hovold <johan@kernel.org>
References: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
 <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>
 <aFlFkD7uNC_lOtHg@linaro.org>
Content-Language: en-US
In-Reply-To: <aFlFkD7uNC_lOtHg@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WJ6+jCbahy8a7VMFCUXkufb8elEFng/GMGhjMPRKP/tBrAhwCMM
 I72zriWKAg2GgExytrFJ6Bq2VhyM1hFESM8P3ptcQIDhC11XCjQ/O07zhaaEG3su+IXWF5m
 ic+mr7C38i1fA02/XWZNnD3/90qgzGipRHslxq+a1wN33ox7r/KNiKCcSjhLPDRna78NylN
 P1GDp84/JTX7U1vFkH0ew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TAJmOecUC7w=;ovZLUIDeRg1egsK6z4Xy9dFPH1C
 6UyZEo+4oldiop0mTYtdZxmlC/7p6hg1S4Dlp+ItT7IheUTUYj3Uo95zQb8Eqxpi/XhkA1CHy
 EwzFNO6t3tOV/t99L68neTgKNFovJjDKAF9S8/4FV7HI9vRUtLJUOf39sOyBa0J45DwgcQACI
 7uNIhuxT4mJaLsuPRI/TA8t458P2w3MZStSZq17GrXh3huIzTgIh5/+KmvbnmKT6GRfivCxJv
 cCiMYlVjEtHQkKU77Gq8ptP8PpTs34L6/zL6OvsFNlnVsp15Y0wVp8ddCmc1wEZ2nOiIFAoPl
 ws2hzUmFDPrtjbHUF8GdnmCAmafdaAP8Sd2exNJ2nSD3DfO6N6QPquW4c5hUfVD7UULMexJWl
 icc4HcCMVRyzenEvlXfPbp0TRes/4alHsFRPKtgeVjmnNYxC2XG74WK1hiG/mG6VxmK4jbV9e
 pVAinpFeZoLMp3HQf9fLFy0m7T7vnXMW1nEFJjalVwkTuN0shRYe9pjfvWCPFTNfR1DDxouV+
 4avfGazLD1H9pHm5WMl3yCAom8+USLAPcDL8ILVrQsqcjorOlhY4hd/9aukbTkgzfphYPqrgP
 xpn4DDqwfiwKMw5DZ3aDARwa+tc62QLXmD6jhqg97hKVH8XFb14ayVLFqVFEuAXFdY2W36NVq
 aWFh2q6ehAyYCa34yqIza1b0r2lf1xvrnPPYJ/v+FIna3Fg/Yg6HYEYnaBA/+ePaKQ/lKr49D
 B+FyJUu3zn1a2ixhAvcORzp1G65HFbSSLAH+8/fN1BxYk1+5rh9w+UoONBLjcfLS3aPt6X80R
 5cBCdR7Cz73y/9QkjzAEz+x1HUo6WD+tQBN5BtEiUS5IJIEDV3fgGkFovsjpcn6Hw5mED5Cpp
 MyRoyyEuSYumA5a+mjwWh9EaeUC8/gTJSE74q7YWR4sOxg/7ra3jo7A5550tB5L8RHWsgoZ2Q
 +iuSFT0GswfWJfpp9IEZO9yf+66iI5CeoeXSmbCHOUc0A455Zf8dJ3FplG/fF/oVSsK4o2qPw
 v5sqRYEqa7icYe7eMlvLEBeMfdnFoPdqZ+Z3yLTvhyk8vOqxvZS44UKDjL9cT2UvB4uLuEEW3
 mwngFoelyE9H9oPoAtn7Y8Um7xle/IY1gIwnoSWE6p6STDRerhalYyo/lRtL5W1+Q8Jz2FbjM
 Rflpn7AsdL+6DEq6cOUT9YB3QzTGL5Qb98Nm84VUgo4YBXQv1gZPTDaXfQl6WcY/kyozCPhiS
 u3UTBdRwQkwDZQEWPj/dgwBkPxmdQzJU7oLbVAwfEWqIfdobBCg2i1ln1rs8Z2u+C/4EGDROk
 rsqF2CJZUnWX3hnqux8GKAroLwd9yj3D0q9nPkH9E/+uByoI6rL1eqGj5i+BIHISL057dKrU9
 2C+c+prH9rZUscnv5EfpzVUXz7NT3hNh0e3T0=

Am 23.06.25 um 14:16 schrieb Stephan Gerhold:

> Well, Bjorn has already merged two instances of this description in
> x1e80100-asus-vivobook-s15.dts and x1e80100-hp-omnibook-x14.dts, so it
> doesn't sound fair anymore to block these kind of patches without
> proposing an actually viable alternative solution.
Hell yes.
> From a quick glance at the Yoga Slim 7x mainboard, I think that WiFi/BT
> is indeed a M.2 card there (like CRD/T14s, but unlike QCP). We haven't
> decided on a good way to model that yet. It would be nice to have at
> least my TODO comment that I added in the CRD/T14s commits so that it is
> obvious that there is ideally still some rework to be done in the
> future.

 From my glance onto a photo of the pcb it looked soldered on without an=
=20
m2 slot.

I actually collected some experience with removing this card in the=20
Snapdragon Dev Kit (its normal m2 slot there). Replaced it with an Intel=
=20
I226V NIC, which works with the pmu-wcn7850 definition, but not without=20
it. So... still a bit confused why that is, but probably its also the=20
kind of working around pcie quirks that the pwrseq-qcom_wcn driver is doin=
g.

> Jens, can you add the same TODO comment that exists in the other two
> device trees mentioned above?

I did that in v3. So it should be valid either way :)

with best regards

Jens



