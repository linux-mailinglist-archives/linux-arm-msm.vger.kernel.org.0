Return-Path: <linux-arm-msm+bounces-99645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLtROvB9wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:05:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AA307D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E925A30CC60F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ED53E023C;
	Tue, 24 Mar 2026 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7oo8wSy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCnNyENw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60627A476
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353537; cv=none; b=f4ssbYmW8YF5lNPiUUCS4GcsUNYw8uzZkMS8S+HChUpHzmnw4qzyejR2TSj4ND5nceHdDQ6QnyTNTR3Q6RORcUaZ+6ycuI+ElT9oEzo0TiyhQr/WCgCU09Ru93LZ5VGfZeJisIWqLoFKSTS8y2IZGs+DMQsnrt8qx2/PyvtmXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353537; c=relaxed/simple;
	bh=ckylz1D42VqgI96f9II8osrhte54J6UEuCkjDNdXrCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7xkf/sZNinh55iY9RwaMwCiWfyvwtlB4DE5KC1CUh+tCpfxL1WdyNcCFxPlakNNbYVMKiUETue/h3lhIshBoTqoZmHr7PMgIKakd2Kjlafb8x5BtjqxhPsr9G9HnAL7kbi/5OmJ+DzhfQMgONDl29hGqDzGTGngBxHepneOZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7oo8wSy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCnNyENw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9SGLb3635855
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clH1e0Cy4hwsmGxeM8ke0FPWxpPVuAh4VlJlFp4Vk6s=; b=D7oo8wSywlR44Ms/
	GZyq45fCaI+vFJW2ffoPvc4unCl8JnZkN0r2SGhJ9xS9xV6m752GDGZRVp4tUZRK
	dPOl219jhA72Qjg0m3ok+zv3tHpt1GNqyniO1dvaCnqTIg5s56X2cCig+z/SKBTk
	ddO7mK4/jkxysrqNTIikvuBlrvmTlf0kqmNoXZ3ISONZAL7Z4NXM4WEEl8BdvTs7
	R+VRhwETdkLwmDONyLvcffbDhjJrjiiIl3fCeYbfumg9KHEsbxHLUj9XzlA1o90M
	xCCqFajZ2uuuTV3mJd1EAJXvG+PkgmGKmjyq+/QAO7WB6Bp8yDtjLXtC3irhp7iq
	wa+Vqg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4mvsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 11:58:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c4664f75fso1623115b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774353534; x=1774958334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clH1e0Cy4hwsmGxeM8ke0FPWxpPVuAh4VlJlFp4Vk6s=;
        b=aCnNyENwsxieVfnv8L+DTngw84A3cmoP7lFvc1Ljm7OxeFci6oOXllgZUj1ji5H7xf
         CVK9uWtTTN02Erl6G8tB1tPJzXkO+dse/wChNfAE60pHjDqvxNNYuq1D9OVRXamsaZ0l
         Ib+7zuLGt+BGeKaEm2iJzEZdyy0Ao4VbEdXdVvyRHtzPUalN6dhMLL7UABgUgiD3Kobq
         FVo6goJdydaZ3tDdLya2d/EzQGQ+GXLARDi+Fse6xPohT2zFCwF6578Jh0JixmlmpXRb
         /OBqiOqyeo07zHyKjYiNvUZkx0C4+Hzrlx/9NM/dZM0SVNti5PF4CEqkiacu198WJiGm
         alpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353534; x=1774958334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clH1e0Cy4hwsmGxeM8ke0FPWxpPVuAh4VlJlFp4Vk6s=;
        b=G6JKb4bNg110SsK984cuvl8b2GVciYXJJLQSfBc3EjekxhZyyP4BnrvutjQIaeW1Hv
         y7A5TSLEBYyK1hYG3YXwHxrtw9GaJ6X3ILGzZhseqLc78bZXRrB+Qn/ud8IWuJplN9r8
         GGy6we3Fe1Y7jP7a2UdaOaxBhG399d8iWu93BTgeB7OnUdY15ijj8ja+vPvF/9OF6iWc
         ioG9f54OKWRKE63hwtCAzYeJjysNMiUwDQzgE2twa/rDELOPhtZS4h4hhrITwnaYiyiA
         KXmXndmfCY02AIZqleNzjdnrZHTKUSqI2Lh8MjU01uCHLW9KBwidjnRrJKEoTgjZU+gk
         OtBw==
X-Forwarded-Encrypted: i=1; AJvYcCVoL61dXzBf/2+acB+/RT48ijjGn0WyELNqYZrwk3BHghi3qkPFG+4d5iiLN3o1I/4fJgRheymXOfuxyJts@vger.kernel.org
X-Gm-Message-State: AOJu0YzW8Y/WMGTxVO0Y4509UbbKTbbz4CHqHsU4cNKXh5JPdIzknk7S
	ixQ3lCZJjEj7LZcRnIEJ2ZSfhT/XMGfEr0dV5Zh3IB9YU6Mp6jOnih6mYsZcOSeWlvwATGPfd1D
	JC0dG8qBLgRnpPtOjSUS3TkQ1eo5XlFodjqgqkcHKMBJ+w08gEKcMEnnGXUqQF5o2nK5rut8ezQ
	r0
X-Gm-Gg: ATEYQzzmONFTml2+hdrYkSVF2QuLImlQITnCjCsZMud3ckTNN9QmrRarwyjNPG1fLWx
	wRPY4luXsRbB4/bivtfEUQj0cbnSvYQFXOvhTja1S54wwaz2f1b1X/WvnbmmlSVS1rGFUzbqq3A
	lLXBe6ih+TpRPj50BDBin+A0VKRb7937Qh4NJ6KUOnVF5pa7e/+8krkLZsYjrQzJ/aRdkaqTA7D
	mH9eljk47a3t3u9oyoJeKR07fg8eG5U8LyjbLT3J6nOt/BryrgrUohzjzfpH/ktB6AUDbdCFbwS
	MndyFl6/e3W/wZSd+5x+KAeaWGseuIPaTkOveMUyiK8NDoqlgNaitAyY/vwKWkZqRlpOY9aUhe2
	/jF6hG7DABdQF9L70jyNY55RH5FkP5aOKZmrvoniMNv7huRbC
X-Received: by 2002:a05:6a00:908e:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82a8c247e08mr12677151b3a.3.1774353534197;
        Tue, 24 Mar 2026 04:58:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:908e:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82a8c247e08mr12677135b3a.3.1774353533721;
        Tue, 24 Mar 2026 04:58:53 -0700 (PDT)
Received: from [10.218.7.247] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38564de2sm7765843b3a.42.2026.03.24.04.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:58:53 -0700 (PDT)
Message-ID: <a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:28:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
 <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SWsT45lKwW5EnC_t6YSxCo8N2KbU5dya
X-Proofpoint-ORIG-GUID: SWsT45lKwW5EnC_t6YSxCo8N2KbU5dya
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c27c7f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XRPxiVp0QSZokBxyJdoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA5NSBTYWx0ZWRfXwsmr7NU5yEvQ
 itXiacrMRfHpI4an5RxNmMzOtZYQlXKIzF5SAjY1j6Lx3yKvB0vYXhVSLv0LQJc3GY62wOf78Qg
 29OBMu+TGfk/sp6ExPbtQS/q3fC0iSiydI7tUoTtz1vb4ocFux9lHjkt39E4pf9v1y+weVE84XJ
 PywmJ/xyZnBSy+QB6D0BvLfvamgUkCVT00v9VFyGsGbkCn0tpdikqMGY5/9idoonlCINIL6NoZ9
 4ykqB+EU0aYzWeEojwYVChco1qpxkBTKDHi8U89GsLUNgsUphbZN/X0jD+aDbxaiuecR/D3lffY
 O6aJqTApl4qnX4G/T/kCC1fp0FL+tmrOvd+VYPYNsTIhAM/arqOqEP4Dfn0sRyL3kFz/TYpqH75
 1901NqhRlY0v62X45DR9Hqnx6KpQdaIdKyaI1QyjtwOENnHvfL23t+DUKNxgOglNO0RSgJ57cO0
 zVJMu2y5iBN7tLbxdmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99645-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B9AA307D8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/2026 2:44 PM, Konrad Dybcio wrote:
> On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
>> On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
>>> According to internal documentation, the UFS AXI PHY clock requires
>>> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
>>> the UFS controller fails when operating in MCQ mode, which is already
>>> enabled in the device tree.
>>>
>>> The UFS PHY ICE core clock already has this bit set, so apply the same
>>> configuration to the UFS PHY AXI clock.
>>>
>>> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
>>> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>>   drivers/clk/qcom/gcc-eliza.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> Do we need to apply the same fix to any other platform?
> 
> Most of them, actually
Only SM8850 is missing.
SM8650 and SM8750 has the change.

Regards,
NItin


> 
> Konrad


