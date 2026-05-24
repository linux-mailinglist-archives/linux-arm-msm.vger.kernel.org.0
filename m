Return-Path: <linux-arm-msm+bounces-109488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPk0AWNbEmqbyQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 03:58:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F313B5C116A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 03:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E54A23004402
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 01:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4375722D781;
	Sun, 24 May 2026 01:58:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA502AD37;
	Sun, 24 May 2026 01:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779587932; cv=none; b=PJSWJGAmO9YchmvLnLO59nYTNPAuw/Uinq3Igrw+7t+jIYOf9xu3b4/U5V0eW/sgeKXxpAIVfv2HGAWVcGdmKghDETk1moN6+QtdzqKjg0mrK4Bj560PBF/JVaRnVoY15QxbqC2leIuymCc+QXr7GVTFpEJvCQ3n5ITjjrpkfLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779587932; c=relaxed/simple;
	bh=LJX3UDJEBWZclugIo9wnVCMsvrUIFevLdZMRx0Wn/qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jD2XvfQPHZpOi2ywfasDuPNPNTvLNdcXNJKMLtn0zJFUfqNlup6kAqhumFwh3Nrw9XpVFg5OTW1uB/qJGvFqMyRC3BpeKbCoJU545gR0sYLZe8DDAKjPjuBsRj8Prf926eCvccFehMQSDyRfhLXVs+8fXY3lmIsyJZT5yW9q0X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz15t1779587905t55917f99
X-QQ-Originating-IP: +CMkYgQkelm3p4bzQbNBKmYcwd2gel7t9keJU6p+mwY=
Received: from [127.0.0.1] ( [116.234.26.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 May 2026 09:58:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1059293555878524542
Message-ID: <15015D7EB84640D6+cc21a9f7-ae1b-4a22-bb38-34d6fafe1bcb@radxa.com>
Date: Sun, 24 May 2026 09:58:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: qcom: Enable additional hardware on Radxa
 Dragon Q6A
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522101323.31911-1-graham.oconnor@gmail.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260522101323.31911-1-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M6krYJmOiHLv/R2v9jrvO0PzDoHLyIBWgyO/RJ0v5jsQyqDerRgxMyXC
	Vu9my88aNPK0Xxuw9HI2Rb1g/hh7f40gvYPzoDBRMTcgkeMi7Lr5qiNSBgC+nuWjSCKWkU0
	aDzdIiInMYdpHEHR/oVOCr/rF/OEIi1g4u7MBsu9sKMaagIuuvJVeDvATLfZMHuBQtFpZqx
	yVXpgP1hc07ktb+xrSNJFSG+xzjQznbLI5d6JKSJYdtgjSCXxqVvIvHNdTCLHdZHT3yQzlp
	gSVPr/75LMbonlINqtColP1nuZhxhIFvpV0aNbXKJ0WYyrbPt+9sIcqmQp6B1H7AeXfnwiL
	UqwncV7iUBWsPKyaATZJJvy5OL1WURScVPOIHl9/iMCau3YaSeEGRtsWMKjEbyWjaPevhBk
	/OIKO0YCGatMC2HBv1U8CNZK+SgcBALZpLD+07UNQ0+VhdAnZlXTibPpSh9mv+bv5PpCZD1
	pZv92z5hcJJA88b8EpYPubLCdoEyKsP0wLf39KTvjaUCMafv4wtcLM2xSoSvh4CoikCXOz4
	4jzgjzANQCUi3zuOJ3nngEglDha2+6tyofrEeM6/ltPkV1m8tHLOI2Ex7yvGuGVzPrsNasR
	7kfwTvIGtlTwMTAHIFOtgfyOXx7ANUHoncHof4JN2SVIV0NMGZz7i4AcBjbbuBdEFfgZyzW
	DWgrPU/qvKU1aXaSpTOsTwnEMVJKDf9o3g//+Rx3e/nJYxsFd6aLvmf86rz0Qkv8N1FjvPA
	6xZDfw8D95/64Qe8EuETbO2DGVMewFZXK1ZSN9oTlYwOkAE2M+uAH4+0OXn9lnGpi8IYfvU
	Z2JJwIN3G4yi/cdqKVLsfiNYy0YnkBsRrNKv0QMFtj99s1micpl855nQU8OTgBdeQALesHu
	R8/GoQ3pXlD//+iBkFlA1/EVcWSPb5hG0gvq/Jvgy6dBXMd1sK1Dq+JIUqkHC1zXiRWR5pZ
	7jBIu2NdEyqRK/BaLR4gMnQna6WxIip02k6uomn7cNl1iFuGN2J12Ul3f3C98x6l3qWU5Mw
	hT5KL8/Q7OrbcJa3kZXPMUJB2zoxYUP+k+vmy4wts7AXqQb1fn912i6ixmj6oUnhZSxmO8u
	g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-109488-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.412];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F313B5C116A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/2026 6:13 PM, Graham O'Connor wrote:
> Thank you to Konrad, Neil, and others for the very prompt and helpful reviews.
> 
> Based on the feedback received, I think it best to withdraw this series to
> address the issues raised, most notobly:
> 
> 1. The DP_TRAIN_LEVEL_MAX change (patch 3) is too broad - it affects all
>     devices using the Qualcomm MSM DP driver rather than being specific to
>     the RA620 bridge. A proper fix should be implemented at the bridge
>     level. This is going to take more investigation.
> 
> 2. The display DT nodes (patch 5) should use the radxa,ra620 compatible
>     string per the existing Radxa upstream series from Xilin Wu, and the
>     lane ordering needs correcting.
> 
> 3. The rpmh-rsc early return (patch 1) needs further review regarding
>     the implications of returning before full driver initialization.
> 
> 4. DTS patch label dependency issue (sorry)
> 
> I'll integrate with the Radxa upstream effort, re-evaluate the other areas
> and resubmit corrected patches addressing these concerns at a later date.
> 
> Thanks for the feedback.
> 
> Cheers
> 
> Graham

Hi Graham,

Thanks for working on the additional hardware bring-up for Q6A upstream 
support. I'm really glad to see someone pushing this forward.

I actually posted a patch series [1] last month, and it is generally in 
good shape. Unfortunately, I got busy with other work and haven't had a 
chance to send v2 yet.

If it helps, please feel free to take over that series and fold your 
additional patches into it. I think that would be a good way to move 
things forward.

Also, I believe patches 10-12 in my series are no longer needed and can 
be dropped.

Thank you again for the work you have done.

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=1078242&state=%2A&archive=both

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

