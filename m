Return-Path: <linux-arm-msm+bounces-118803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AkgAIqn2VGpMiAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:31:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7774C69A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a89fZUTK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WdVI+wlZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118803-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118803-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A41C30207CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFA42D060D;
	Mon, 13 Jul 2026 14:16:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C0240BCB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:16:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952172; cv=none; b=eAkhoNMrq2bwG1MEmPVrSlswX/v/ZUb5ihNZ3wql3NAjpgHmuboDuPYTCpbMiecMXPZXDkaiqvjDtWYn0WV9pVvfmu3vf/GRIlFJAqzbC18DsDfMfxpSFZUKzgun00R+n5J5occZq6DCTP0Ul9kXmSF1rp7QZDSX/p+KVMAVU0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952172; c=relaxed/simple;
	bh=rjRRwXeoSvQ2Yt2kDuIXsZVmldbbQ93lhgFEVsggEBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sr0eXSpA+6KjPiJ3s2OnIY9wbJry05GOc//R7AGTcFhX3CWkE4AvXHMo1ZQJODyKgGAuibJZTe1tc5e1ksxm01LBGs9WjxwOLlFhztQwQw0EfydRIcz1NMoaSVyJK5x/0qz/ltjxgZVcHjP7lsXe7+aqaYNq4AL9BYdFimFPy/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a89fZUTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdVI+wlZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDV4Y1299276
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=; b=a89fZUTKY0N0QfDn
	ltmn0X2fEeXWAMOmkV1ChSPUa4LS39VVSoRq/MX4HbD3qqM/PSJhF8PpwLaXSCa8
	o9nt5KCmu4pxH/m1eaEOoVi2fQ9Q9X2Kt7TTtdVbWz1ofkcMHyIdecFd/UW3j/Ak
	qqd0pgE1cnesSMa/qX/22P+8OfLKvnaLqAoWZqi0XhbhmKzjeDMWUWDZGmAagz75
	VlkBWRdyd5szxUzaEjlTba9l8CdVIuFjrbIYZS+ZbE2PXLX6aMTPY7RUq4ah5BSG
	R/pzV6uYg9lieDTYDjXTzL8sUm2HcMJCYuuayVxWkymPCXXUxbWBpiJ5QYGHGwvQ
	l4gJLA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3h1mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 14:16:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1692504b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783952169; x=1784556969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=;
        b=WdVI+wlZDmaK3lyYN35qalo7WpnokSscPrKHRzP2Ves/cO/rqLduxuHsz+CJkVPRBk
         XTbZ+xsESfTpNnUSW3hw+eR3M1BPv+puC63J6/fcEFGypcDAU9zFVuBa29yy9zGi/gM9
         j5qMGZwtpGKaE2EGhiNwvEzVkcepbflHYTYG/4I00wzPrcZp3fsvPYnM9nb7snrzmCcY
         Zk/U/XoeVTsawBsNtMqm64PTaudMK6po4unWCtfYqU1bEVaL7RiLd5a1AwUWxrQbLZgO
         YU+knTaKDGpTzar56PdaK7bt2Oqvy75gX2xedsm/mjh/tmwD4rVgFlmVL1RbJafhjLxi
         QQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783952169; x=1784556969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9Td5s4NB4XQ8rznggNIITWnlk3IwS8MZDx5I4v8/zU=;
        b=O2n9ZAKHuWEIUvHPRCME71bvrj20X1Ta3Zyd7eT71+Qu2QWpaGNCcoQB+iyVVFBFjk
         GZLFd5mN/26M2aADcVIOfp53haAVpQJTG6a8kzGGDgUypB/Rh/+TSYzIg7ouxrilVn3T
         QSfHHMxt4aKHEzxBzyFFXS0id1ikyTzjKXnxnSQ3tM2VQu8H/UagZ9lUZWcOYxj0xGwY
         gYn+ZxlVemFn771GHKRBb9fapV9UhlJlPtejM2wSlIdNfHf/z9+6jJ/PyjHHlaouA7/c
         aFaP77ezSX3F4SbMNqroBZL0oj+KOhoLJB+Zwk4Bme5EZ9OI7y/D6vJHxSUTAhC9VLve
         op4Q==
X-Forwarded-Encrypted: i=1; AHgh+RojTqRL3pKdwyNtnEe0bgkTI6TUYcGkg9ND0T1chHxp3GPgaeBJ4HrVf9BZbK/yLXg8NWqJPlScziLsPygJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsU51kz5Cb1PVRp89uR4uZ2h9BZhz5bjsSh2nQXntUrWaDn6xC
	n5BgX5WWpMPHtVNO7b/5gIvZ8GEVv8l9fuvcixeWwOGbqCTxWu2qDNN0GyNhrl5tssS8cjQhTlt
	bj1Kn9rIPIhxVSVAeSRsgaUAbyu7bVKe4PkbIbrGXfWTBHL5EcP0uJQ8BN8cLKipZCqRC
X-Gm-Gg: AfdE7cl8MX8qh4D3BqXTzldcbrVnKj8DmnZr19aNQgZvzuq5mhI3LyUGWB7PIZ6nk95
	X9Hjeb0XBChKoyoavSgu+BU2p8kXqw8qCVmM3fYFWiMBGcKYjS6JAXZp37JKwGOzhYZyfrT8iBx
	rRd+BeDJnUV5c2M4+1asymqRVojtkk7G4/Ziyz+4yfPz8YAFuWIkTnPRFHonKP7sMftTw1dDwS0
	Zj0siGJQzDFnmnYpv4BXRr36PMi1LpXJFCDF/BJl2ReYDbJio96wPHZu5lnvoIGxqO7aPchM2UQ
	aWaPgwugG4vk3ViU5bHWdSOYKfJk8fpRqVCx0tUZEWk1XcYj8o2hr9wdLn3/ydjYP4S992SLCXr
	kqc+G82MPkQObRnTdgSm66135J7RH22lPkY6paIwe9fbj
X-Received: by 2002:a05:6a00:1c99:b0:848:2ef5:50dd with SMTP id d2e1a72fcca58-8488ad09145mr7755442b3a.37.1783952169267;
        Mon, 13 Jul 2026 07:16:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c99:b0:848:2ef5:50dd with SMTP id d2e1a72fcca58-8488ad09145mr7755409b3a.37.1783952168780;
        Mon, 13 Jul 2026 07:16:08 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a49591cbdsm452482b3a.40.2026.07.13.07.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:16:07 -0700 (PDT)
Message-ID: <21867efc-b5a8-4ed9-92b4-059a020731a6@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 19:46:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ji8az-Z7SH3vUjb_kNsyBDqwEmH80lCx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE0NyBTYWx0ZWRfX8YTPwhBsr/iW
 E+Dur1vXl04WJHT/qb98CS6/fT3eRvZVDhSps0aYSBXYbTDppEO6GD/RwvjAAsSaaDM9yo2ka5i
 zGz4AFLF6GiPhhyB9sWf3RfA1rC4mqo=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54f329 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ggBkse9BzyKxnYN-cX8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE0NyBTYWx0ZWRfX3eBY8PYEw7Kg
 EuZM1DvLD0CENDz9XY+vkf2MhbE6NeJ4HaAKY+p3OdZdYv7D6NOS9ZWjZ4wBVyJW2KjKDGEFdND
 s2AengrE99QDnOzz/SvYjfMo3IEbncw9ktFR8FzLQgJdb9xwAx0yaInw2Y5pyfFsWsNAd8FHtDX
 3X/3h7ynyYt7alZX3xdJlWlbiC8mJe1ei/K8knRR7l81BFTdWn51AJXUfIb0CqrdlcQPS5tsNTA
 eflKCY9nUXEZz6Fxx9sYo2vzkPSzxBb+0xD/7H7MNHO0CYFLLM39TVGtjNrXuqYFOlSirz4lK+V
 c3vBdxQBc8VQZNQrH3L0y+y+omVHdF2nftSr1Q/h0mL3teIYaBlTSjrnI/jL9qjKKeDqtqt20/Q
 JtA4Ls6XxPtmvMw3qIiUJ2Y/MVtXjWqiCiK4oJuYVMX25wQ+bEatzpQX+Bqe2DgWZ70Uk8PST+Q
 TjpUzEmiM98vAGE+tLA==
X-Proofpoint-GUID: ji8az-Z7SH3vUjb_kNsyBDqwEmH80lCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6C7774C69A


On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe time variant selection to match the SAHARA MHI channel and
>> associate it with the QDU100 firmware folder. Add a firmware lookup
>> fallback for cases where an image does not have an explicit entry in the
>> device's firmware table. This allows required images to be provisioned by
>> the platform.
>>
>> This change only affects devices matched on the SAHARA MHI channel and
>> does not change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
>>   drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
>>   2 files changed, 70 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
>>   
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>> +	char *fw_path;
>>   	int ret;
>>   
>>   	if (image_id == context->active_image_id)
>> @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   	}
>>   
>>   	if (image_id >= context->table_size || !context->image_table[image_id]) {
>> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
>> -		return -EINVAL;
>> +		if (!context->fw_folder) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"Request for unknown image: %u (no fw folder)\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +
>> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
>> +				    context->fw_folder, image_id);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +		if (ret) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"request for unknown image: %d\n", image_id);
>> +			return -EINVAL;
>> +		}
>> +		context->active_image_id = image_id;
>> +		return 0;
>>   	}
>>   
>>   	/*
>> @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>>   	{ .chan = "QAIC_SAHARA", },
>> +	{ .chan = "SAHARA"},
>>   	{},
>>   };
>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>   
> This change should belong to a separate patch.
>
>>   static struct mhi_driver sahara_mhi_driver = {
>>   	.id_table = sahara_mhi_match_table,
>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>> index 391ab146f501c6ce1c81f6138f7c491a49c2f264..82e41632afc555a53dec3d8395558ae039b33bbd 100644
>> --- a/drivers/bus/mhi/host/pci_generic.c
>> +++ b/drivers/bus/mhi/host/pci_generic.c
>> @@ -300,6 +300,43 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>>   	.reset_on_remove = true,
>>   };
>>   
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
>> +
>> +static const struct mhi_sahara_fw_table qdu100_sahara_fw = {
>> +	.image_table = qdu100_image_table,
>> +	.table_size = ARRAY_SIZE(qdu100_image_table),
>> +	.fw_folder = "qdu100",
>> +	.non_streaming = false,
>> +};
>> +
>>   static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
>>   	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 2048, 1),
>>   	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 2048, 2),
>> @@ -1399,6 +1436,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   
>>   	pci_set_drvdata(pdev, mhi_pdev);
>>   
>> +	/*
>> +	 * Provide Sahara firmware mapping. Sahara consumes it via
>> +	 * mhi_dev->mhi_cntrl->sahara_fw at probe time.
>> +	 */
>> +	if (info == &mhi_qcom_qdu100_info ||
>> +	    (info->name && !strcmp(info->name, "qcom-qdu100")))
>> +		mhi_cntrl->sahara_fw = &qdu100_sahara_fw;
>> +
> Why are you adding QAIC MHI controller config in pci_generic driver? This driver
> only handles Modem devices.
>
> - Mani


Hi Mani, Above one is for QDU100 device. QAIC is not added in this file.

>

