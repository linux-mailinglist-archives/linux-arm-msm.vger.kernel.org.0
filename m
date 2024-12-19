Return-Path: <linux-arm-msm+bounces-42820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09C9F81CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B17B18948AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7EB19E83C;
	Thu, 19 Dec 2024 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="H4zGfLWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF919CD13;
	Thu, 19 Dec 2024 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629025; cv=none; b=ppwC9LFUdzG+sK63JIg3OaDx8fyjIAv/cJ3e3FFo67FTxAQJS5Y8fT7qyd5tp1at+kykmbWglwDdr6WssIx8MQXdoB+oU5u7eSTA9skQ4H4A403Ql46NG03q5NJrYouZolJeRzjFfLImU6RCB+DAWmF5SJrjhV05JNrpGzocRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629025; c=relaxed/simple;
	bh=bN+zIzjqUcjBSmayVtdcxW06WYaMkm2dEZFgRJcul/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fr6rH2VOUSSCU4SZ83BDYxEze+wal1V60NEAwVt5W6ZzPDuE6f7KMgu/mbUxaRQ/cu4fEHceP9Fp4u6TdFhNZQwJE7i51bSk7ebFx7tNtxK/WkQjdpcdDPSpuK5z50sh3FOGoLRV3k1xe02YLKFeV6NuKphdO/Kj4wj6oDY5zU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=H4zGfLWC; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YDcpR5KPdz6CmQvG;
	Thu, 19 Dec 2024 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1734629019; x=1737221020; bh=bN+zIzjqUcjBSmayVtdcxW06
	WYaMkm2dEZFgRJcul/4=; b=H4zGfLWCqZVCvr+/soQZG/1PmzesZcQ5EMaAWial
	pQgXZyhDM1qOTZr1l3mTZUCZ0yRaI493nM9UKOr11zQ8Wv+eYeHNCwNB63/spwqz
	1INTgHrPdFW2vNOL8KLScSlLCScuMI+DLtkIFXb9ACa1p+U+tC9n2Q8fLFHwjDZY
	HM22ZxxW9+LjlS+/PVK2hq9trCHGep6kM23xRJoPBi9d05FNhmJVUeKddGWoBMG3
	UQlZmb272TpzrDYre7triqA9oFWurwm0IbJEYJ8BxdybRVGeCRqJ2tdbrfhP6An+
	O2lHH2mUGfyfuMnGfXG2EkjFmA1nX8CiL0YwSxdtBpuYXQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id UO2x2iMcYNh2; Thu, 19 Dec 2024 17:23:39 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YDcpJ0txfz6CmM6M;
	Thu, 19 Dec 2024 17:23:35 +0000 (UTC)
Message-ID: <eadb98dd-f482-4479-8ff8-dcf301edf18c@acm.org>
Date: Thu, 19 Dec 2024 09:23:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
 manivannan.sadhasivam@linaro.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241218151118.18683-1-quic_rdwivedi@quicinc.com>
 <ac08d417-87b3-4ddd-ae68-8e8e9a68e04a@acm.org>
 <69503b23-12da-4270-9910-9440dba7df07@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <69503b23-12da-4270-9910-9440dba7df07@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/18/24 10:16 PM, Ram Kumar Dwivedi wrote:
> On 18-Dec-24 10:49 PM, Bart Van Assche wrote:
>> On 12/18/24 7:11 AM, Ram Kumar Dwivedi wrote:
>>> +=C2=A0=C2=A0=C2=A0 uint8_t val[4] =3D { NUM_RX_R1W0, NUM_TX_R0W1, NU=
M_RX_R1W1, NUM_TX_R1W1 };
>>
>> This array can be declared 'static const', isn't it?
>=20
> As this value is not modified in this function, we will declare it as c=
onst in next patchset

Why only 'const'? Why not 'static const' as everyone else does for this
type of arrays?

Thanks,

Bart.

