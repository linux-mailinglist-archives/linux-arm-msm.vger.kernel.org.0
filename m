Return-Path: <linux-arm-msm+bounces-97333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAvUBym6s2lXaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:18:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F327EB57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23049300D0F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2390036B045;
	Fri, 13 Mar 2026 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYOta4Hp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L26W6IOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536936998B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773386184; cv=none; b=rv7HCUU4CFHP8hNAdYP9qDfoxpcPIkKx47ECjJteV0FcM/2fY8WWr+RXE7+1qtHCHwke5yZNcU/ezkxsyu6PHWfc8xcX+67lOsEg0UNhdlwinioQnYnAG8kNcrOuAeP5hUzErTiyMaAY7i+vUDLQRY51+2CXhDXZtU3frrkFvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773386184; c=relaxed/simple;
	bh=SFwI+Jq/KJmOfA7abaLf8IREH4YS2mFFsWRr7zhWaVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5FIbxF+tatXKuaGISXagStDjJXe/G255wfS38DwuaQMLzb8dysNVp9gXQMoOgSjuylT3S3Chc2mtHh1kC77g3T7KnmbDC2CvNgb6TQWRK4Ilern9wOvsXj7B2+TnIN9E24+O6hBKmUTEVry99xsV2SyvhrMExNRVzonRz9TP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYOta4Hp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L26W6IOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tafx3466736
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=; b=kYOta4Hp6PVm9IEo
	z0kzYQ7SouURAyJ6rUTTvPIoClsZXCgEpgm9eIegOOHN5QFlkHFjyubBt7hd7hyE
	cbOMlzo76yJn1yxqMtA+ZqwPGfS3bCV34TogNZSJ5/VCPWu5j49ux1+sRj+B651n
	QGMQiDz/iJd05KRzSFJVg/BFBYj4+WjCDwsdxWkF38g0A75m5ktyIstd2V8SbjET
	zdzuNBkA1Zws7sfX9UWbOnpwy2H1OrCtQuJG/DgGhjZ0x0G+e++0ROoTnPyA5xE8
	L1G9gTSRqrfL0RXA+uVzBkq+8GWOL5dpt1EhWOIeq/L6JCiZfHVex8W+W5phkdJb
	rpJ2HA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60mxtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:16:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4af66f40so21098765ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773386177; x=1773990977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=;
        b=L26W6IOq3DoGxMkcjOM63FCCvWwjaQXV68rrx/Zs+ynuApdtW16hKcHLZwM1GuAIOq
         Y5ULnumJFkIvMJBl8hgJGk3ZANh2TFQ+56T4CpuqyhAJrtl1vCEjFLutzKRCE+mY+LMm
         +y5nkjdtoz6z9cACJX8RL78GGhRNS6lLkrZGwU1HhnVKXTx1loHNKHBbd7mAsgDORV8Z
         3WZwXJWzmK+cnewSo8kTBrUcMCX3HSVr0Jq3ndXqzDeXEBs+HPuPZtpfAn6QKpvfp1YA
         XPjLhUb3VRPNGbKg4JB2BhsndzRJZ6pwoNEFo+63VtMcmZ3UvBvXmWp6mWLzg8ZkM8Nl
         zJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773386177; x=1773990977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2IlKIi4brx2n2555N+kXUhgIRruRM2KVO7+XTSNjAw=;
        b=owRgvPuzMc3uo+BBOoJOBEgntK19teJ4iEGw6lXlvlEAtmG7T6lP390uboGRQrEvrl
         m7SVfN4OdFUSfPh0Ln2imNyuAzIRMcxcBYMLqEsyQFeKi2kukz3znPUznUIqE7Uth1OF
         5554XD1OgGQYV3dZ47V8Ibd+KaKupcdAp82VZ0TaCaprhLBuj659r2nHNA5FlmkjYqXx
         Gj7l9gSOpelVDognL0fo3C7KxPoRkZg91yvS/sXTmV609QmAVq/TE6xeSRaIEincqxeN
         slEA/zpMK9F+dmjINNNGNnm+WsYENZb9fo0UfRS8ugNpEOzHBnwA5miG0+XMr3tOg/3e
         jQTw==
X-Forwarded-Encrypted: i=1; AJvYcCU+cis531vcX56okg3sejUTipXhIa3c8zVqcRX2EtN60ZgcRcpo7txamBlGR+jDnTFiKRM58eumfWrqf3g4@vger.kernel.org
X-Gm-Message-State: AOJu0YyPS6vq1pftMif96oVEc/GgcC74Owcy3/GIeNQIADbJ2AF6Q+Tw
	8wD5fT8sSphsk6eOl5q58lUeuVfd3J9TyvyaiJ7rOdx4pOKOmauawUjKV6hSuAkY3/rTJLdNmdx
	BUOjF97XyhrxlVwvuKUqrqx12dphBupBfcuSSdPc/pXqzfLmKqzBvp1LbuHgFKvny8Fga
X-Gm-Gg: ATEYQzzZ2y9Su184++0QUJRk+gX/XGaAxsdSYJcmvdIf2YL836jXz1lSLOjYgnQzZFE
	nX9GGgf9OSCp35yVBmmOus7sZAZbu8Mej/fFzmnOUWuAAnxwAqffGLcngFsLcqjswPmBwUz79Hq
	2m3Tue2v0/tktszVT08h67gTKO6ChX46Xxp78IwJ8EieS+GcIcWvAl3uM6fZTNFbzWMqi4Tsvpw
	xsPVfyqe45YAK2dqFrknW+UrJ1VrDaZpNWgq/dEqN4lVZAnInhTiVGy/X87Kvh0WfjrL0cDnOeq
	iaD9LZVomRXXvhUhdVt7w78j2Cw0uAKObXt1o1KorPpK2/jMUnwJWlkfARxTDkAGXJ2VqjDydjy
	3iXso1KNsdlxnzvclxrXJ+6qJPaYdYeGMIwxY6xpe3vjtyMkTxQH7tw==
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr25528705ad.37.1773386176725;
        Fri, 13 Mar 2026 00:16:16 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2ae:3cf0:3aa1 with SMTP id d9443c01a7336-2aecaa3bfe2mr25528405ad.37.1773386176268;
        Fri, 13 Mar 2026 00:16:16 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c733sm16610105ad.35.2026.03.13.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:16:15 -0700 (PDT)
Message-ID: <a17e4c07-1f00-4b0d-90e3-2eeb1e71a248@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:46:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
 <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WcjgNhNwzuXkihssm2A-ENyknycdwQVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NyBTYWx0ZWRfX6tXQGh2QEiIU
 V4M58x3WEybvyqGGAUSU7v2a0ECGubHAAltLvPB2GDga58QXyWGLmuNt9T0bLyJM4xcHkhWihbS
 LG/9zpKKhCxSb9IX74FtPT7N+xuz7h/qePMbvSS8Td71iaj2BMPcigr6KFnOQcYbrujc561j7RH
 i3dZtvSN91XnEk+ma3v1Zgzd+w+7yeFN1urF121nwjovyrpJwMUzKlO4s/X9zJjqas3OkVu2kMn
 Jb4dkmkkGhVh27yPwBt6zW9KcVZGttdBCdVCzFtgrL5580vH1W90y+4GeI3h2NMcV5RmNDdAq8T
 aF4EFprqE2muL8EVgH+E5tyLZ3N2CzooEsBhSsr1GM3/x+5YwygxEWCXdB6HwYkYmJ4x++bbHSS
 Kq9UQs7pB8kbhyfdyVA3Z1F69rHbOQHEdZ1ZWcJ0bmKylxP1jxGFB2VHNPJ6sbFH5RhDBlESNc4
 I2D3BXe+iM0wRV/M3kg==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b3b9c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=8pif782wAAAA:8 a=EUspDBNiAAAA:8 a=BRVcir-zca08BhkZB6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WcjgNhNwzuXkihssm2A-ENyknycdwQVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97333-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,wikipedia.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 203F327EB57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 12/3/2025 3:07 AM, Bjorn Andersson wrote:
> On Mon, Dec 01, 2025 at 06:13:19PM +0530, Krishna Chaitanya Chundru wrote:
>> Add runtime power management support to the mhi_net driver to align with
>> the updated MHI framework, which expects runtime PM to be enabled by client
>> drivers. This ensures the controller remains active during data transfers
>> and can autosuspend when idle.
> This last sentence hints at there being an actual problem with the
> current code. Perhaps we do this because it's the right thing to do,
> perhaps we're making this change because devices are crashing and
> burning?
we are doing because its right thing to do, with current code we are not 
seeing
any issues.
> Start your commit message with making the reason for your change clear.
>
> Ask yourself https://en.wikipedia.org/wiki/Five_whys when you come up
> with your problem description.
ack.
>> The driver now uses pm_runtime_get() and pm_runtime_put() around
>> transmit, receive, and buffer refill operations. Runtime PM is initialized
>> during probe with autosuspend enabled and a 100ms delay. The device is
>> marked with pm_runtime_no_callbacks() to notify PM framework that there
>> are no callbacks for this driver.
> This looks like an AI prompt, does it add value to the commit message?
>
> It can mostly be summarized as "Implement pm_runtime in the driver". The
> only part that's not obvious is the 100ms autosuspend delay, but you
> skipped explaining why you did choose this number.
100ms taken from pci port bus driver reference, I will add the reason 
for 100ms
in next patch.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/net/mhi_net.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
>> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
>> --- a/drivers/net/mhi_net.c
>> +++ b/drivers/net/mhi_net.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>>   #include <linux/netdevice.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/skbuff.h>
>>   #include <linux/u64_stats_sync.h>
>>   
>> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>   	struct mhi_device *mdev = mhi_netdev->mdev;
>>   	int err;
>>   
>> +	pm_runtime_get(&mdev->dev);
> What happened to your error handling?
ack I will add error handling.

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>>   	if (unlikely(err)) {
>>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
>> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	return NETDEV_TX_OK;
>>   }
>>   
>> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>>   	}
>>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>>   		netif_wake_queue(ndev);
>>   }
>> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>   
>>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>>   
>> +	pm_runtime_get_sync(&mdev->dev);
>>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>>   		skb = netdev_alloc_skb(ndev, size);
>>   		if (unlikely(!skb))
>> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>>   		cond_resched();
>>   	}
>>   
>> +	pm_runtime_put_autosuspend(&mdev->dev);
>>   	/* If we're still starved of rx buffers, reschedule later */
>>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>>   
>>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>>   
>> +	pm_runtime_no_callbacks(&mhi_dev->dev);
>> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
>> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
>> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
>> +	pm_runtime_get(&mhi_dev->dev);
>>   	err = mhi_net_newlink(mhi_dev, ndev);
>>   	if (err) {
>>   		free_netdev(ndev);
>> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>>   		return err;
>>   	}
>>   
>> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>
>>


