Return-Path: <linux-arm-msm+bounces-103334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPHbFvNk4GkHgAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 06:26:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA3F40A2D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 06:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64E63082A89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 04:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60A2311C2D;
	Thu, 16 Apr 2026 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8R4JkUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXYprkkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299AF1F16B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776313575; cv=none; b=m5A6bG+iRa3+BoUDPHBTmnMR/8SXpi8j7W1LWEuAsJU3UulQiOgSZZVwWKbsqHoSzZ2daW+3pH9Xu9y81J3cC0z1IMh2ecgM2nL/1nIasze7wmGo59jCYCH1Pv8fHtFC4ELr04HwOxVfXYuNOJd66oXeRAbpElv8xXLG0jn7uGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776313575; c=relaxed/simple;
	bh=Bk5fdWievPsMhcjVP7ddh39E8mDSDOd9OEYhgtqqb4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SktmmdKCwptY4qqYHJv3nrHEPvQPCl6eVcB08CJvauvJWViSZhwRLllbYr0ZhcuZcxyqaEQG3dcQlkFA0wOd60dWUZOZao97AZDpAv1bjFJLDjhYwumlwZEv2buDMBDvriLfSsp+JU/zd+2jRfxJnJZAzIiEv0Q+UmK7oFeRgtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8R4JkUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXYprkkP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G27XGJ4052975
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOQoMqul5lfLpwYJj4xp+1nJWtaCb5mOonJ6pR8nuv8=; b=W8R4JkUy61RYGS3e
	HF/1igufJaO7fehXVmzKAak/NglYd+54NrUPvd2/mQdbxvntQd9dXdO/Jev9llUx
	dJ/K1GOomQrSEaS+4Ziq/RMSj/fgEKpZZydLyjUZZYGqtFiSxF74l7XvMsdTxH8P
	fMrZQAOQoqeTi6IeSVqKBpb4k9ippCEfyi+UFZyvbQmTsTTpfUKG4Twb7ytdba+E
	A41JprmK7ynqHo5s7Vdaw1Cn6+CgUgGejKVlDPB7mmIIezY4OGd74mw8Yn8HP48y
	I7gZWkDgGjM18C4j32YzVX+EY/fgtrcFFdUxTK6fJuBkICvkr5yxKI5VKZezYCHv
	8f0NLg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5uf1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:26:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so8170796a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776313572; x=1776918372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOQoMqul5lfLpwYJj4xp+1nJWtaCb5mOonJ6pR8nuv8=;
        b=KXYprkkPQz5m/Tk5xMmK0CcBypSO/FoMUpFxqPoFxo7M2r2cq6VrekM5rIEFASlPJo
         X83pZHtLhScHv0C5hynoaLZIpTFf4i3dxc6WKjq0eGGNuluf3BAvWbaLf8mz1oK3YkTk
         iBluo5jrlyYTd5kYIyiZjdALFP/fDkzyBud8ErsamKv41YhCoUduBQmBkK3+HHvo3luZ
         Obka1C2dr+5dr7IWGlsH6LrT4xKgRBYIcZYj9FphPi0hVf1MqvIf9VxM6OK/OKIxMprf
         c9yaXSNWuGf6/pFhYb3aFTqvbEKGqRkfmTiozG46wm142rmHAhwiX0jsxMcupLbxA0BV
         QVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776313572; x=1776918372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOQoMqul5lfLpwYJj4xp+1nJWtaCb5mOonJ6pR8nuv8=;
        b=jbFMyfoWftpEMxZFAmKzlTI5kFLywS5/LtLH5UMDz2yPPjNeGus1XaeDjKQ0nwEpEr
         0AIZTqhxmnSZUEO4xatboJ6UVhkGa2vu0iPsKvX7w+uJLXQIXOBJWuaTme8E1QWhc6x7
         7/rzKi0ka9ka/LJGs7d5DZIpYyynYAEAkVGSEoAuajQJim3xss4GLPjAn0JSUCae60v+
         /cIm25qqUSv3B6kJ9V8C32A9W9btG6mvD0W+CK7fg3MpGHVMnEPs+vfUgyYi5TF+vi8I
         YJMB5+zr4dckSJKebUm1YpOQvguzcq8Ktv5ZtUdl2uK8/PI9gBL74DS0RTGwcAG+ljLq
         NBmw==
X-Gm-Message-State: AOJu0YyCB7jaoQUS8omks3s1pOLVkOWyd2/a16mkHlGGf5WKI34Xp077
	KbKzdTem32uy5SBwagWa2D4QMXmdyseL/Tdyta+kYwVlw9UGhhvIAHFyjlAkk+j4px3avT+HhrA
	uYUhFmo7U8zLRiWxRJVc3HB9cnXgwVL1AmJ+5s/YiupqEmk+7Y7cUH7/SvIdmTTJw1H+r
X-Gm-Gg: AeBDietsSnDMFZVdgXDYa0YV+g51yDSIF7gzu379tJawKstzuSSmZykFXE6WnjvPkWY
	YA9NWm2/nyMNU28q+BlYRvmqu99cJUaKjLV1TVS74Xs+z4m+vc1sheAtI0y1ACeE4bmAKoBbjDF
	oTCwdxDAiXywgk1fho5UK1rxC8iu6aMBpAMfX94xI1TkkFRsw9rW3sYdq9/XnFOAQOpWh8GsNff
	81WpuMY42irQVURb2dj9AWNzZqgBLue6sS1jHs3m97Yzm8e13zNvrnagNz/koQLb3FdIqOgIsB7
	cgiQ0YC5rSImxtiRjjB0PQgKhL+oV6Qyn3OYvdXKhVmrLpHfrWaROySAdAfgXCiN0q/12Po0Ke2
	zt129Q+5ziHgqwsWc3byWPESY2ozJTgq7Fx2+2YaOS2iTtdxV0xQ=
X-Received: by 2002:a17:90b:3c48:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35e42869cbdmr26132162a91.27.1776313571735;
        Wed, 15 Apr 2026 21:26:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35e42869cbdmr26132135a91.27.1776313571258;
        Wed, 15 Apr 2026 21:26:11 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780f0258sm37692115ad.5.2026.04.15.21.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 21:26:10 -0700 (PDT)
Message-ID: <b2fdbfd4-289c-418f-927e-937f084d3d23@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 09:56:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-1-34079f92691c@oss.qualcomm.com>
 <27c48c9c-32ba-4f92-834e-637dc728c6d3@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <27c48c9c-32ba-4f92-834e-637dc728c6d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69e064e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=x3goO2KD9uaNahKmKuAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: f7M7CiGrVhxIKIcmhNvxQPmwec4yIAcF
X-Proofpoint-GUID: f7M7CiGrVhxIKIcmhNvxQPmwec4yIAcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAzOSBTYWx0ZWRfX+Voj7sWZQDO5
 uy7RKJMqoDL7HkMGTylcjFRAjURpQlBY4AP31Lkj6HwYxvMiW4M6L45On6frQjWpsEN50o95wBS
 drdVEvROsYXGEJYiBziX/jdqdHfu3/G9J1+qAh1uLOpNqSk/597M9yxBbg12Zsydi+AMW8Ketsh
 NeudligZCFifJViK+N3BiR8x2B51fGxfKRtVtzSbrObr5WELdTmwcSu08Tx4gwy0Reu51Du1GZm
 K1Ng7zUsncFVVWWVkJyQ/74MKB+kqUHGpo7oL6/YzaZ8PrZJPPEc2Ciomzdl1VDwAl3h8/GlQeh
 +qn5yrd6BlxEhOUtTw4CsEfRHYEUd5RWXvsF31vn61ITikgxh6dRcnELVvZvWhe6Jk+7619oFiv
 /FveZzXE5dkTGHZsDepIGHb0792yM6DHhClOKDLDaZO6LBddmB5L7a4Eun/Sqk6fStlBkqxVuNO
 dhBxo+QneaHvPFRUNvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160039
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_FROM(0.00)[bounces-103334-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: DAA3F40A2D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 6:26 PM, Konrad Dybcio wrote:
> On 4/7/26 6:43 AM, Kamal Wadhwa wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> All rpmh_*() APIs so far have supported placing votes for various resource
>> settings but the H/W also have option to read resource settings.
>>
>> Add new rpmh_read() API to allow clients to read back resource setting
>> from H/W. This will be useful for clients like regulators, which currently
>> don't have a way to know the settings applied during bootloader stage.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -453,6 +454,11 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>>  
>>  		trace_rpmh_tx_done(drv, i, req);
>>  
>> +		if (req->is_read) {
>> +			reg = drv->regs[RSC_DRV_CMD_RESP_DATA];
>> +			req->cmds[0].data = read_tcs_reg(drv, reg, i);
> 
> Does this break if we send a request that contains a read request
> at index != 0, or chain multiple read commands? (is that possible?)
> 
> Or perhaps this is fine, because the only way to "legally" send a
> read command is rpmh_read() which sends a message with just a single
> read command?

Yes, the only way currently to send a read command is via rpmh_read()
with single read command (placed at index 0) and hence the read is from
same index.

From H/W point it is possible to fill in the TCS command at index != 0
and trigger or chain of multiple read command (With something like
rpmh_read_batch() API if a use case ever comes up to read multiple resources).

Thanks,
Maulik

> 
> Otherwise this patch looks good to me
> 
> Konrad
> 


