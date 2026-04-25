Return-Path: <linux-arm-msm+bounces-104528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M59Dnrn7GkcdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:10:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2021466DD0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 18:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9181300231D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 16:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02930286425;
	Sat, 25 Apr 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="riugWtBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67F29BDBD
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777133429; cv=none; b=uBQPEK0+o40/WPN/Jj0fJGGMqGmjXvuAee9724RgEVEaquFXDuXIO4M4UtYTF/jgCBCuj1/Ao3XT3we61xQ75KqajS7RbutM7KHmLcIa4jBzJ1b4wYQJWb/LHv9vOwT769wMeo82Unn2bod6gPdFu5/gnjiANvBCm96RfjzyfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777133429; c=relaxed/simple;
	bh=/xP97QgAG6Sng4UBN95jLhjYqSOXGbVKmTTI4VSPQP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmfB026GL7GM7i66C/Ccwul4AtHK/ifuPve7zVedLlTpK4oFtmgYvX5XHMZcRyJgpWcB2HyuiKLqBVbo6pP1T9WdndpjZJd96HdJppqA8JcTuW6GRrvwRDz0400zUgNVpgzG2wQ+JAE3TDuSDvzNfyqmH7Ckr/SA2QSZjD7g/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=riugWtBY; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <39679013-dacd-4804-a52f-0c36adf8e698@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777133415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ynvlte9oVbZie+t6M0KrIDaGSCpcnJUqWKTJmYdMj54=;
	b=riugWtBYbVQv0zypxynL+IKHxdMc2b8mHqS5dIxewMS/uFtZDYwszpg3Zg/mSW/JlvMiWL
	8Z5Rs5St9Kq15aZPhBBC/Q7l4R3xWToOnSTr+jXHoaoGBcLYRF0fU3g9cdmuE970wlX+GL
	TAq1oXtn9gj5UR4g40hiplboskQxIij2AiZ9g7L+Z4My95kKxnEkDd1ms2MwaMr+ua8Soh
	rraLni7j4OFBifvn+Q9PPTBWlNlOSzuSTEr9gLTRxC+2vYWGsE3qVICs5l7k67v+QQ41Gw
	jn2Q/KunylD/BBXAemhoUbGXAbR5RylGvV5Pw5loqh50NrMufm6Y0cdZBZPrPg==
Date: Sat, 25 Apr 2026 13:10:04 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: C2021466DD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,qualcomm.com:server fail,packett.cool:server fail];
	TAGGED_FROM(0.00)[bounces-104528-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]


On 4/25/26 9:44 AM, Dmitry Baryshkov wrote:
> On Sat, 25 Apr 2026 at 15:33, Hans de Goede
> <johannes.goede@oss.qualcomm.com> wrote:
>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>> to stop functioning. The EFI GOP framebuffer should keep working until
>> the msm display driver loads, to help with boot debugging and to ensure
>> display output when the msm module is not in the initramfs.
>>
>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Thanks for finding this!!
> Most likely we need this to be performed for all dispcc drivers. At
> least for all laptop usecases.

This is relevant for phones (ex-Android) as well actually, though there 
have been attempts to fix that by adding stuff like

             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
                  <&dispcc DISP_CC_MDSS_MDP_CLK>,
                  <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
                  <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
                  <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
                  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
             power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;

to the simple-framebuffer node. However there have also been some 
"random" issues with the handover to mdss drivers (even with the mdss 
reset) so some postmarketOS kernel builds completely disable the 
simplefb driver.

~val


