Return-Path: <linux-arm-msm+bounces-110031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLA6Nv2gF2qzLggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 03:57:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B875EBA16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 03:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 572973041878
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 01:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8CA2D5923;
	Thu, 28 May 2026 01:57:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CAC23394A;
	Thu, 28 May 2026 01:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779933434; cv=none; b=smu3o7bBu3fkEarL3/IEbBTZwT86LKs+be6j7sFGIMzdHtK50y0HvQ3D+HrqyrlfNTXlMXNz7V9ssM0jFkHwFV8NEY28bD6oXuvVL2HGx/t0kdCj7UnNltVh46768W6DrNqAaDhFO1CkNM6l/CE7nqF6/UicPJgADKnOJc606CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779933434; c=relaxed/simple;
	bh=KBlLgF6gRJ1Qn56J9PT2IuLK4PeEsqW8yyXjeblENb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VA7U4Evzphp1Sr/I9i5N7Ym6rYtEGU4FlGFygexnXLoUFJROKGq9GpafTb5yc3Ihox7xEbIMvBopFiJY+5b1oVJ3xocX1DMFIiqwG7sOgwJzkX+ti0Uk7DlZ//wrYnJqQDAkxiknOdZPIpnRpcKsHNyccyx2WcbyeQoxNcAAU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz3t1779933411t051b27aa
X-QQ-Originating-IP: Xo+WVLqeetR6zv4ASWWCm/TADq7Vz3fao/NqAUF+c7w=
Received: from [127.0.0.1] ( [116.234.26.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 28 May 2026 09:56:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3255798331960100904
Message-ID: <755BEADC478F92B8+16dd5a2a-9a6f-44c2-a84a-af36675a3346@radxa.com>
Date: Thu, 28 May 2026 09:56:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa
 Dragon Q6A
To: Gekko <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522101323.31911-1-graham.oconnor@gmail.com>
 <15015D7EB84640D6+cc21a9f7-ae1b-4a22-bb38-34d6fafe1bcb@radxa.com>
 <30edf212-f656-4c09-a066-d765debf3fcb@gmail.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <30edf212-f656-4c09-a066-d765debf3fcb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N+4N2KiqbZESIbKj7VNt9rs5Mnx/p51JwKlMwucRmj8jNA2dTiFYqcOE
	mC24iYw+JFVK2O67Pvntmtb9eil1I9ma0ANnwmGLN8cOCsXHAmJVuNVrpOB8NIbB79gb/FX
	WJrqpY6SacedYJRiuPYBVM29K+i328Qvks12iOBTYv3U7eT8o+SThCGQBueCW920Jdy34AA
	T3WgKjujHTKimTfLqj0J4lNnWhdblPJSPBp3dRzwNtU13lGlRNkXFDl1lU4MFWJEaWS+/PU
	EICyTYv4k1Zpgn7bhC6Mnl66RPX4RuAzfme95QxeMrJuDnn1Wdia1yWveo62njDARtJGFEv
	8QH2khW4nOypHnsBDrnHe4pmxDgCyQI0heizJP//R0UQrMA7DZBYJJZeBGub/h8VzAcd39M
	iOtC8fjHSFjxM9X95KoqC9szY6ibCSZPcf65jL0ZU02Cy6UX4ajwfL89iAputzCiuSerf1p
	t20IOBPDY73BeN2pmhsmzsfNAZVExAUPYeXgeMdtDbZ1fTks8mf1R03AXBCSWWgLmnEYmcN
	0u0OGDYGlFkbRxXMMmSeDYNqtbrvhSW+t0/ITIY6TLL0nUi8FajEMWNWw/50NPZWXirDT2S
	6q6M8LgHwacwI3zF1Kn8ZRgRvET293NIVG0r9kxwRQCsIONX9I/KsPvPNw30WWrzmXS1YU4
	ehyKFC/Sss4WxM5ZrSo1+y1hZVX0S/sFyEO+lP815DtD+NA9UrrdrsAzr2JitXWf0w1Fakq
	8wG5uv/CWYo+ccAKeRJMEfqxeBso1y81LDkl0CqP3XS5n4M8Lk13K01Zwm0u/parb46MMUi
	xLNPWRsOLSRrKb+anuEzeneg2S/xhqIYd2JwiCU75400svUaR8XdkwCWqei91IWdOSoqjIu
	MxJidqUcfo7WwtGfboTmyuekUpSTGrqxElv9hANtDDjyU/RxdBS1sbXX3qURbntIJ2R0oAp
	w1jMcaEIZI941KkSM4NN/y/KzvVB+xa9uuipFYuL5xyhQPeoZalij2aZII/Qby9RO+R+gb5
	dURtuceBUXC+V14iGYu22+YHVJ9jP1qTPu+LVQTHz5C/gRngy1G61HT41sV9qVecDqNYbac
	FK8r/HsinOR
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110031-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,radxa.com:mid,radxa.com:email]
X-Rspamd-Queue-Id: 38B875EBA16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/28/2026 4:43 AM, Gekko wrote:
> Hi Xilin,
> 
> Thank you for the response.
> 
> I appreciate the offer to take over your patch set to move things 
> forward. However, I feel I must respectfully decline. This is mainly due 
> to my lack of experience with both upstream kernel development on this 
> hardware and the patch management process itself. It would be 
> irresponsible of me to take on something that I'm not knowledgeable 
> enough to ensure successful completion.
> 
> I'm happy to work with you to help in any other way that I can such as 
> testing patches, but I think you should maintain ownership of the patch- 
> set and submission process, at least for now.
> 
> One of the reasons I withdrew my own patch-set is that from what I can 
> see your series covers everything I was trying to achieve, and does it 
> correctly :-)
> 
> The only one that isn't covered is the patch for early TCS 
> initialisation that I'm discussing with Konrad which may be unnecessary 
> anyway.
> 
> Graham
> 

Hi Graham,

Thanks, I understand your point.

I appreciate your offer to help with testing. I will do my best to move 
this series forward once I get the current work off my plate.

Thanks again for your help.

> On 24/05/2026 13:58, Xilin Wu wrote:
>> On 5/22/2026 6:13 PM, Graham O'Connor wrote:
>>> Thank you to Konrad, Neil, and others for the very prompt and helpful 
>>> reviews.
>>>
>>> Based on the feedback received, I think it best to withdraw this 
>>> series to
>>> address the issues raised, most notobly:
>>>
>>> 1. The DP_TRAIN_LEVEL_MAX change (patch 3) is too broad - it affects all
>>>     devices using the Qualcomm MSM DP driver rather than being 
>>> specific to
>>>     the RA620 bridge. A proper fix should be implemented at the bridge
>>>     level. This is going to take more investigation.
>>>
>>> 2. The display DT nodes (patch 5) should use the radxa,ra620 compatible
>>>     string per the existing Radxa upstream series from Xilin Wu, and the
>>>     lane ordering needs correcting.
>>>
>>> 3. The rpmh-rsc early return (patch 1) needs further review regarding
>>>     the implications of returning before full driver initialization.
>>>
>>> 4. DTS patch label dependency issue (sorry)
>>>
>>> I'll integrate with the Radxa upstream effort, re-evaluate the other 
>>> areas
>>> and resubmit corrected patches addressing these concerns at a later 
>>> date.
>>>
>>> Thanks for the feedback.
>>>
>>> Cheers
>>>
>>> Graham
>>
>> Hi Graham,
>>
>> Thanks for working on the additional hardware bring-up for Q6A 
>> upstream support. I'm really glad to see someone pushing this forward.
>>
>> I actually posted a patch series [1] last month, and it is generally 
>> in good shape. Unfortunately, I got busy with other work and haven't 
>> had a chance to send v2 yet.
>>
>> If it helps, please feel free to take over that series and fold your 
>> additional patches into it. I think that would be a good way to move 
>> things forward.
>>
>> Also, I believe patches 10-12 in my series are no longer needed and 
>> can be dropped.
>>
>> Thank you again for the work you have done.
>>
>> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/? 
>> series=1078242&state=%2A&archive=both
>>
> 
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


