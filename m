Return-Path: <linux-arm-msm+bounces-96602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LXlESf5r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:57:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7184249D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06723306E3FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D6137FF67;
	Tue, 10 Mar 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axvnG9Nv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcUSdF3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE7537E308
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139895; cv=none; b=HP8XAqHLq1MY7rRxh91RDTVrUnLZbZVlbb4vic+/dKQgzucvm1DnfJZF1v/BtpaOZ5ewFGxxvZA/tMxCXb+Wdk8cBofYasRpvxQwGq9QWi7Q3YCBdBJCkVKftG9SD1LivFoRaclXbwzrHUthBHKyZ4wlSmr2ftnIadgl6V4I5KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139895; c=relaxed/simple;
	bh=XhpZp1QKBJ4YKSocqV9F4TLkXLx6k7iyL0hajesjqLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl8pGst3IHmCqRvJr10/wWBICO/3UznTo0A6mnvszE95NZ73j6B/4eHriJJWPHLs+dRu1e6VI5k6amfYzLYFhwJ7GvCRcTW8T8d2GBHMoGu+ik+SmWUddycPxe0/GWqi4ogjXZsIo6Ko/zRlvwAlwHrhm1YTyB7EAcHmTUi6MQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axvnG9Nv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcUSdF3b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A96Kxb2460634
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qiq7UaTgraz2ZufUPcfLIhtGpZMBr5Zft0ZDlFR6CpM=; b=axvnG9Nv0oBcGrf9
	HiKVhU8nk+iLpH6zyRnpsHUsCO2CDcfvVcRGl/dVIug2wYgZZWACketgKE2NjCsi
	Pggs+FPOl0jK1UJWYDxI4FM2ZXw23gNY+LvxFV82wYLZnDAcopQl5hrwgS7SGnGV
	sdMwksdjuihfZhE1/vYctEUIOb7O4SJcO6OOthK/2dLcKBXxjbKdMLBn8PQ+921E
	0QMn+4RdYJfovl3UeynSoIbuH5xMLMwfXptomAWFAjdsYjD3C4RjOpWXpmdCWfNZ
	oCkHcDXjAtMuP2TQMLdg86W5Q7vHPbhyJwkTroLZ4O0ZqVHD0BThrcpHpyFyEFcq
	OW5eVQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1bxbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:51:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fcb63705so45235386d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139893; x=1773744693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qiq7UaTgraz2ZufUPcfLIhtGpZMBr5Zft0ZDlFR6CpM=;
        b=YcUSdF3b4RqCpTLMm6nS53oLRuuIghafaOeRcJELQY+tbMXmNlLt0Sihghozs0kqb4
         8O/P6kPY/b62HhE6GmLdvsfxmW1Fj44devhuiKQBy5EftGDvophD3U+AQLTSIjx1+z2X
         9Lp9cXrb5imQfaUoJuWU+XnEICxVNwmWM7Xgv6+FyJNhUE7E10BKd36Od3+JtxRtqZAc
         vC+EbdCcZt+Ra6f934yfsYADvYB1IYS5+Q0JLddPCYvfhGN/oYFFGflpZcReTulUdjLd
         4AJlR2oFgqVVviaaTgOwd+DQK7qS+BUYTKU2vPeiI0uMioR/1D8ntA46mTCmSnA88Ey1
         zBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139893; x=1773744693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qiq7UaTgraz2ZufUPcfLIhtGpZMBr5Zft0ZDlFR6CpM=;
        b=nh5zvpJfa094dVvi8LY51gcRhyWaWBcmFXKdKPL9JwkmAQj62GbkBT8Wd0y49UrbkC
         z8ROUB9Ak5wOYZJqwAuB3X4OxSckTOv0xpdNUiRzaucmSfWT3z5nbOLvBavaQTjBYUR3
         QyZ6F1tJPQtLKHhI+54lqzfjDLk8mjOHNNcjYhuMgXlMXQGglYmBAyHAtRprZ5ewtnSM
         dqXinWWNoKoE1t5Pi+L3YYbxR5B3zbjI0BgPtdBWfnmaG1ui5eRKqt1j32OT75LvaanE
         uyJnOyUre+bOzoVaYS4onTetRWLXzsyqiqX6n03sbYYIVE8hqaoyiCJnufwVubtXEXJf
         ctMA==
X-Forwarded-Encrypted: i=1; AJvYcCW1xz2oijZZ2LIBseOxUvepYj9N4hk8w+oah85FSdq9a0sUe4JTHJDLpwihLtNWpQtwMCN0v/77zUNt7eLr@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYKwxWMT87vtU8PchzJ/WXKKyTbFbzGyezp5O2w7NhMjGgCyH
	fBPmzF5L4ZqJ25N+GKrAACBGgFspOr5RRzInxQClr/yFjZKptMwdfLHIfYF2Brmjhlrdbj6xq2Q
	RIqxSW/cxsWMb8r28yrx6qDSU065E7WXnusNqjOOJDzcgrel4Ewyn2OxHMHurQNivJLOTNXgAZk
	Sg
X-Gm-Gg: ATEYQzzFqVPSho7J/MTKf+1ogTUwNE856unrMSParLikyZjRsVPnzTD513fOAvk/pSi
	6kmEyw46jP1yWenb3GhBVCFEB+mwMshOqPfTSosN13OYn71Cy9SRA6llmL8SUSWBthjV+qXCTzk
	hZGkqodB3KlPnufAQWxQsddfulsBi8g9BN7eK48DD+SVd6JhefwGP2b6rnVCbkfGm7l3XZe6Qct
	+cbQ89OLwU3hv4C3lFvuDaF+Y1/5OtJZ4huUxilaMSxzjGKLs8acgvtzD0CqY28y//xw/LHqsRl
	3hxZStNl9ZQ+2rzrdTEqQyf1JLrcDZfKvtcbWR69megFnFq7Goh+4Ca6QmsqZ4BZ+lp/b8lAURE
	Awf4afcg+bkhL/ZJAVfypM6ZaCEUtMUsUGHzYKs2Ig1qt98c3hfm4yemmxCrusWa/jt63mbhyV3
	FdXRo=
X-Received: by 2002:a05:620a:454d:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cd8ee7483emr458761985a.4.1773139892716;
        Tue, 10 Mar 2026 03:51:32 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:8cd:8ee7:4473 with SMTP id af79cd13be357-8cd8ee7483emr458760185a.4.1773139892270;
        Tue, 10 Mar 2026 03:51:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629311736asm1364434a12.24.2026.03.10.03.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:51:31 -0700 (PDT)
Message-ID: <bc56780b-6ad1-4c24-94d2-f3233aa0c460@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:51:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
 <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
 <CABx5tq+D4OeApjYv8VkcbMv6-Atc=Ob1e=7f+xqt0k0CUoJbbw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tq+D4OeApjYv8VkcbMv6-Atc=Ob1e=7f+xqt0k0CUoJbbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v3URs7CizphbhOrwjCNg3G1pDBkjWb-J
X-Proofpoint-ORIG-GUID: v3URs7CizphbhOrwjCNg3G1pDBkjWb-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MyBTYWx0ZWRfX5J3n8fp7BHvD
 zELBgR+SDvwWRtlgnoi59wf3rrS4c4QCHSwm32UhHN/qcLJ/E0iZw8jqounj+A2z6lxTmjAkeaE
 FTMKVB8LZPtcQnP1RnR8Ky56RNYfImOPwa5hy7sd8BXRcu65x3O/KHXVIad4af7vf1a6sfl557z
 gZFDdTY2aTLMQYqMfUn8fxDRrMH+xvPS+QZY3S3S+/3R+9Pu9gYl3/Zayg9oFc2HRQN/gcPWkQW
 L1CsEbEWlGYb5HL2jAH5+mFfyRrkKKtRYIo6F6HqM7z5CLLLpL9fqCsMAB70vNpW7sJB8abUdDp
 iFMDGE5DGq6IMClfQFTYESo3lm2oYhpBBw5JIiuN/URFNH/45/nl9n4HLxzqpriK/UEGsqQ2xG0
 Zno+jqLzu8kli2xjwkLJOUrllmX6rNcGKfVBqsKKr+D5p307yKlMxl9heANT7w+CjgiSqCz/+dE
 8BXpOZwdPfvyLkf+31A==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69aff7b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=C6zI-uKJOvtAozOgxp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100093
X-Rspamd-Queue-Id: B7184249D1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,baylibre.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96602-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/10/26 11:36 AM, Brian Masney wrote:
> On Tue, Mar 10, 2026 at 6:17 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/9/26 3:38 PM, Brian Masney wrote:
>>> This clk driver has a noop determine_rate clk op. Drop this empty
>>> function, and enable the CLK_ROUNDING_NOOP flag.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>> To: Bjorn Andersson <andersson@kernel.org>
>>> To: Michael Turquette <mturquette@baylibre.com>
>>> To: Stephen Boyd <sboyd@kernel.org>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
>>>  1 file changed, 2 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>> index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43872bf2f9065e5d6d4 100644
>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>> @@ -35,6 +35,7 @@
>>>                                       .name = "xo_board",                   \
>>>                       },                                                    \
>>>                       .num_parents = 1,                                     \
>>> +                     .flags = CLK_ROUNDING_NOOP,                   \
>>>               },                                                            \
>>>       };                                                                    \
>>>       static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {          \
>>> @@ -52,7 +53,7 @@
>>>                                       .name = "xo_board",                   \
>>>                       },                                                    \
>>>                       .num_parents = 1,                                     \
>>> -                     .flags = (ao_flags),                                  \
>>> +                     .flags = (CLK_ROUNDING_NOOP | (ao_flags)),            \
>>>               },                                                            \
>>
>> The other two definitions (using clk_smd_rpm_branch_ops) also need this
> 
> Are you sure? clk_smd_rpm_branch_ops doesn't have a set_rate() op, and
> it's been like this for years. If I add NOOP flag to this ops
> structure, then clk_core_can_round() will return true with this
> series, and it'll change the behavior of this driver.

Right, I mistook .recalc_rate for .determine_rate

Konrad

