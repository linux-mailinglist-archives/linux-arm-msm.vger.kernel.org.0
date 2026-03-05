Return-Path: <linux-arm-msm+bounces-95689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DrMDEHfqWm4GgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:53:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BA217D12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 20:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2EBD30234D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 19:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2C93E556A;
	Thu,  5 Mar 2026 19:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="VRZpQFp+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF403DBD64
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740411; cv=none; b=AcSXGmZF5hq8tfCt6RL8yUVSmX01BWgBykbectE+0BK7xBeJMZZsR3SK+PGn9EuAtBL3T1LqPJ6b6lB8xwHJRgBKPR/1pHLgwB68lKNowaXj2gEiT2ksiwAtRnKu1ZZTphZ/WZCXDs6VIfncSlVtUery4fl+aD9I+0mlWDw2UKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740411; c=relaxed/simple;
	bh=0SoELFVYgipnnUW26xRGknrmQF7L9bcYC2ThHdl4ecg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhX5IInbYM/YCYFX0lC2s8PTOMUhBEa+B2Vgq7reJ4bNMUx6O2OvYvsjWIrct/TfCfhceJrQGEU6YePIog21nnyJMbLcTuSljlE6EgjCmhfhC+wslTKI8wre3qVLrWOrBro769uBy3cW0Pc2c0nyp6mnRZxvrsM37tZZvvODsEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=VRZpQFp+; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id yCzzvKzpUSkcfyElGvHLmY; Thu, 05 Mar 2026 19:53:30 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id yElEvCmoI2l0kyElFvJSDW; Thu, 05 Mar 2026 19:53:29 +0000
X-Authority-Analysis: v=2.4 cv=UfRRSLSN c=1 sm=1 tr=0 ts=69a9df3a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=pGLkceISAAAA:8
 a=cHXIWmrghMx9ieuqI_QA:9 a=QEXdDO2ut3YA:10 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F2xE/DQ+Q5r7oMcXl0ntg1chhQRqOV9k4gwBnHRdV80=; b=VRZpQFp+atIYsQW5dHJl2ybcVq
	qAE6jUAUdVaOWYFaYTwH0wT428oYj/lfXrlDMX8UduRhlYO/kE8Q7USuhA2lONB/WN2oYOI4MrB1p
	xXNh50MQhPOqS6pRdGCkKtmkiJflyrqvqIe6yNlumxvXKgEgX/8fYcRp6S42rOk8Kq0NszgDWphnQ
	0qm/AFkA9S4J5W+u2oVtkp+v45pGtUVqq+0aNuj6JrFN2SXCaqaN8JVsFMEM1JEXYN/OmF3wqwcJH
	cRJq+V51GbDjZQ/9ZLI4eYl56vKPoHxPW0Dqpw+33JMdRjJ+2MmvJrUWi9+a5jlZg16EsCW+9JQD7
	sZuMA8TA==;
Received: from [177.238.16.13] (port=51890 helo=[192.168.0.21])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vyElE-00000000oh1-1DvD;
	Thu, 05 Mar 2026 13:53:28 -0600
Message-ID: <5bcef6ea-e83b-47c3-b75a-cfd13e4073c7@embeddedor.com>
Date: Thu, 5 Mar 2026 13:52:49 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: usb-hs-28nm: use flex array
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260304230636.27808-1-rosenp@gmail.com>
 <8d7a25e8-3af6-4adf-bcec-394895519bea@oss.qualcomm.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <8d7a25e8-3af6-4adf-bcec-394895519bea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1vyElE-00000000oh1-1DvD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.21]) [177.238.16.13]:51890
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 31
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGfO+kG+T01njWhIkxbpxVlDeATgSJoBXmfAq06TA3QKcBpoBCTC/Xo4CmHZJtwUUYaEkxVUsHS9QacURdKd72X0yzyy4GmCvWR1YKSJI+dWnit3VSKR
 +3iTTFxxOCG306LUR6Vc6F9k+uoXP/vFM8fa3af32yIUlFac9SaHuJlLNU5oYNh8svknMYNP+9xAbMw0OHwnijBI6N6NVD9ll5rAfOCGDEHCO14+QxmHN1LV
X-Rspamd-Queue-Id: A18BA217D12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[embeddedor.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_SOURCE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95689-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[embeddedor.com];
	DKIM_TRACE(0.00)[embeddedor.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,lists.infradead.org];
	HAS_X_ANTIABUSE(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[gustavo@embeddedor.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.784];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi!

On 3/5/26 19:06, Konrad Dybcio wrote:
> On 3/5/26 12:06 AM, Rosen Penev wrote:
>> Allows simplifying allocation to a single kzalloc call.
>>
>> Also allows using __counted_by for extra runtime analysis.
>>
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
> 
> I don't see how this is an improvement - __counted_by() is useful for
> cases where we don't know how many entries there are, but in this
> case it's fully deterministic (as priv->num_clks is a compile-time
> constant)

Will this always be the case in the future (entries being a compile-time
constant)?

Thanks
-Gustavo

> 
> Konrad
> 


