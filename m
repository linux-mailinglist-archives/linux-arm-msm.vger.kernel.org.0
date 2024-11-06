Return-Path: <linux-arm-msm+bounces-37119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 749C19BE219
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 981881C21094
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543D61D618E;
	Wed,  6 Nov 2024 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="o+YfR2t0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="e0xD7+km"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14D1922EB;
	Wed,  6 Nov 2024 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730884531; cv=none; b=Z3qqeABItxJx8clmHJtHso8tmY4Q/EE8EXjKCJLZ7zsM+SZO+cQOK1cD8U4rlz3RVyWXwj2V/QAwGztbjnrIFMLTM0O2L1QiQ4mXEALpC6XqZHDq/Jru2No/fiUfbRLMxUqYVLrrcTtQXZkk6JMiZxozeG1XgQD+XTh/QJbPn7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730884531; c=relaxed/simple;
	bh=U9Qhu3P5fXARAojVvmh+oO2fJp65PdJnqZhM34p3Adg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxNlg3Tiag5+jscwULNHwuF+vbjnSTyhYYGQwslGzN0p89/0ahDoaLl8lg86tUViqzj6qHrH2qJ50wYzY+jP3G6/YSlnRBy2wqUbGXWko04AoAH6XLDto3+2ExO5sDxgUwjtc+Cx8kR76U1LWv2cZp5hS6zpqAQV8YWopZCQvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=o+YfR2t0; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=e0xD7+km; arc=none smtp.client-ip=79.137.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=87CRU1qaw7POvQadpax6xnMCj8VvWy2fHabWKtP2IYg=;
	t=1730884528;x=1730974528; 
	b=o+YfR2t06WF2M39Z70PNTIcmzx9nG3ICp4509bdfeIqdWqab/OweIfVbaHCAL+5/paVZuWWM/4NH+Oube1EmtMZ8JiWWAVsWb4lV415V8KiLMTYWeNdzJSswjxqpHRmD485CvmyGIclIHZw3ykDtJ78mqeg8Dpp4lUwvgEMmPyHwkdrr/s7Qbuub6kYGwU+gV8sfaMcHbIAjMXFnQOX3xaRMCpCWDFBGzSVOsP4SiFugHFPHRyQd8UHc0nimZNzW/EMqjGmmCthmozX75F0dybYXyzQHBYemvm2y8TqTr5Y5uuKD+SJgiB9M+zJ7IrysiaLK0ct2l1OW4rC87WCfTA==;
Received: from [10.113.3.254] (port=40104 helo=smtp42.i.mail.ru)
	by fallback1.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1t8c8F-003suM-3h; Wed, 06 Nov 2024 12:15:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=87CRU1qaw7POvQadpax6xnMCj8VvWy2fHabWKtP2IYg=; t=1730884519; x=1730974519; 
	b=e0xD7+km8/EnomYI4ZpsZ0OScHavWzVyo8NLqzuOigiZDTiP0c9O1c4pbLECfaMfsG61LBqDiMz
	NOXn0zEa4C2cZv0KO3X74TQJ0AcMd6qN/IVvhPIhUht94lda6fX2ie8WZJSjLXvDGS8Zj4I0BBFh6
	n8TTbQJSGjicescAZv1ytOxwDXz/3vfnOsaEpxy0jymkva27nD63zgmNSRG7paLgsaMKPES6pjYHx
	1EkwAN0Z6h0Moq2sVvTm/6G6nb5qIPejmx4G1rmAnUa/V9ZBufqamc+fT9n/5o8MhyNZ1YzG/J4lP
	bJotn07m27lYAT+ljPdPgAFYv57Pa5Azmktg==;
Received: by exim-smtp-6c5957b6dd-m4hm6 with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1t8c7k-000000002HI-3hsp; Wed, 06 Nov 2024 12:14:49 +0300
Message-ID: <1314b8d9-c0cb-4d48-b7a6-1ac56ab7193c@inbox.ru>
Date: Wed, 6 Nov 2024 12:14:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
To: Chris Lew <quic_clew@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Hemant Kumar <quic_hemantk@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Johan Hovold <johan@kernel.org>
References: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9C47B42B23B2B45CB94400CBD9A05FE2C4D4AFFA14F9F7486182A05F5380850404D00FA800FA3F7553DE06ABAFEAF6705FD764840B112E70AF3E4F53D2EFF74AC3D433D207E322D29
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE792C68BF9CD4C0E9EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B28E90C11C329EF18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8044E6612FB3D68A3D96C05C9628ED4805E85E1FE50C2F9B520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0AF05157F0BAFB9978941B15DA834481FA18204E546F3947C989FD0BDF65E50FBF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E735D05AD665AB97B35DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5CF7D1176C897A2C85002B1117B3ED696F6701FCE8763F6B68D59E407A97E9958823CB91A9FED034534781492E4B8EEAD37F46C620FF2CAEEBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFBEED6C95D013E12287200C99A5148F9877F09537FCC2D272EAE57E9619E3DF6DF62474FBACD619B026F3AF21BCC074C661E145A3C729F3586072CAF2D23F936E8498C3E08FE5BBF6F37A8DA3E9B01C3902C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojd5Cr5y48m5i6dSUI8UvmyA==
X-Mailru-Sender: 689FA8AB762F739381B31377CF4CA219728464D9E07D7BD1C84B9A6E8DB39048D3ADC9166251157190DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B462E89913BE0CC0C43039A186290B7F475CDE8AA8962E7B79049FFFDB7839CE9E5D6FAD96F5A9A44C82185538A547B28FA3E1803173EFDAAFE462B494412DBAB4
X-7FA49CB5: 0D63561A33F958A5E461DB38A54415FA2C0ABF2C3A7EF85DCC55F97DC67B47F0CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F790063791665FFE12FCE6AD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC86D3A1509E1113711F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7888FFA144A8AE6D0731C566533BA786AA5CC5B56E945C8DA
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojd5Cr5y48m5iXhqAo/g8DbQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

05.11.2024 04:29, Chris Lew wrote:
> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> The call to qrtr_endpoint_register() was moved before
> mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
> callback can occur before the qrtr endpoint is registered.
> 
> Now the reverse can happen where qrtr will try to send a packet
> before the channels are prepared. Add a wait in the sending path to
> ensure the channels are prepared before trying to do a ul transfer.
> 
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>


