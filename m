Return-Path: <linux-arm-msm+bounces-113540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6QioL0N3MmqY0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:30:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 311DF6987FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:30:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pwRwjOqW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BZY4hc8j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113540-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113540-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F19931037B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43ED3DC86E;
	Wed, 17 Jun 2026 10:28:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938EB3CFF44
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:28:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692129; cv=none; b=ENKgp3PbHEKP6sRqb3XWFZhhV2pNKiDpA1PAUdE/h4FJpNux+oJxMfj9cUlvTgpqpA3h5f4eyneCq07IVsFaNxSd+ist26lU2t+NdM5H2iGbMWoT/HVp+gSqYB1xt+abqW4HHcViwsvzdvSfcUCgyOf3TPT1EjU4cRwQyiG/34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692129; c=relaxed/simple;
	bh=vykhn2iUP9xzlyVXNGgjtbmpfhnAgLGYRybi/3hncsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK8cPUzjIyqw1VtrfrP+9pF5tgXsHg6rcdOjk85OZqvjD6eaLYEFKhX0RupctqIB8wMWG3jKgpEJV9G2ScIvXEGCiaZtFwk5h1jWdhBq/UKehn+MqGlBqxvatqfAbK0vKrtQK8pe8MNQIysnFa2QdatbNtnGBe1ndgB28BeI+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwRwjOqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZY4hc8j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UTfb3273522
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZhZEMTvXJ4lvU6WeVqcP5knOXjwk4Tb18lBp//QSNo4=; b=pwRwjOqWrbf5FSGY
	5VmV/wfzVI0mVxz5HCTrZ62nmhQysC1pbwHvsS+/0/sbO53J/A52uynb0LOktg7Q
	MkIHasSuTR6CKFtT8ho/AlUbT7+KRXS8PKnxXCmw+RAk29/eAqbL09E1VTyctQjC
	3993GtdeijB/bnrg2HDpuiOMAl7Pu6S/nuotSnHx1Ar3bFNOb19BtV0vw+4weIze
	xScr5Uz19E25MGymxM1we2u+A4tOET1O8158sqUWsMW4GOm8fIt8ah1roRb1fd9e
	0pzJB+tzJo1u18MNYQNt2CLKyBuJ/5vX2l6Wa0YnOblF0VqVzafDgXYpec/Q9fzV
	FesO6Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtn27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:28:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso6507701a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692127; x=1782296927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhZEMTvXJ4lvU6WeVqcP5knOXjwk4Tb18lBp//QSNo4=;
        b=BZY4hc8jUWOmaF1kQRy4EGEejBKRsI+0BHQHu9JDAZz1MYNt10V3mcsGMlnMByf1Dl
         dx83NHbb/TCqWVmxw44hRoU3pkdcI9xl7YuNeCSRnanDFZ0Kfp20YlS7XU1jPmIiS08F
         QLFt0p3BP9ZnsGrH9k6NvbGe1BdsoxAyyiOYy7tgDu9P9pRjUcfAOPdLnBd0DPkF9n7d
         fyW22I8fv5Eo/9mEgZTgKP9L5Fbr+rBQdxEc5yFRJ/bwlu0+1dJmulZIJ9erY2jNXbbI
         u8oZdNaR0wWvyw81R7NORCURhCPgg2ub5KzaMI/0qsyxxockO9tqS0+LTu7NCMIS6YzA
         PLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692127; x=1782296927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhZEMTvXJ4lvU6WeVqcP5knOXjwk4Tb18lBp//QSNo4=;
        b=Ozn8knFDPeiNEe71dIrPVAM4bzAU79Xcyg4tfZVA0WouHN2KG04Qhxtfjh1X4kE1F0
         K9ckXOiXzP4mnpfzppE3Rrkh3PrYKzszFiiV1TAVIT0U1ICJ6lKKBXoskWWdxUCTqK32
         6xbiqd968XPUrNpaxZNVkSUuBVw0gtjxS9fdFzTnTJWWcDjpRLcxJi8uIfAO+2lOHXVS
         tQrsDfspjsUmCHiR8wn27yw56Lmbf8680v5ZnR0W4WyiOIRUzwFGKhdtugtgRkyeqwEL
         MmBnnWfH0FCmQtAQd40S470BNyAtC6eAygYXCKZWGZorui21d0JmRL7o0l0vyyBpDaUC
         UbUw==
X-Forwarded-Encrypted: i=1; AFNElJ+vpbRBwg4def7OO7pi4Qnd0fIIbddUS0pxYrtA7m2MhjDr0Xl5SWO4tx8O8xxbE46E9JAUvYtohoBe/6tr@vger.kernel.org
X-Gm-Message-State: AOJu0YySJIdgafi0HUPYnaoLe5t9/DWXfehTVH1wm2PWvbVK4Htlz37S
	Aw3D1Uae56BLofeO/NmAa7zPWScm0vYOQT7F0MVW/FFtTQm1vb8f/ElnMavUzSX6DNviANaJ+kD
	cXbqQb4Paxjb9Ky0K44V9dPnSvJJcD0jXJ+KqAKUXsC6JK+U+0DEx16CAL419ExPY4xAQ
X-Gm-Gg: AfdE7cnjfj+jgu+kTbJ1RrGQ2HTAJc737wcZ/U2jtv8EvAsZFvYmQAYPJJrRQugNDCR
	EzkAlsf6S/YBy44olhoG9r4J/arOc3JU86Zd/1nV33ZEeVLJbPnFsKuVTyXeD5YjJZl7hsQxX7d
	hxXvgsbZ7l9zDg3KM78xug+y3JaEFR9iu179dCNzIZVfl0zkuAgBQZVqeDjYa+brdvHKLW/KEA4
	wLH7Gx1zVZ3BOUHgYIc71RivPEX/p8vEGnGziC3TF6//H7pvpUZMGpQ+j4n5KuwKg95gzjVviNr
	rss1oS51WVjPIlQlHh1XAP9Nkm2MB7G3yCHybmS7kVcD85Ap8sLvljd1lxdptu4y5lb4GcUG/kR
	cXsxlkhH6ldToaNVeyPNmnFv1b/a3GtErR7Yg/keNJBIQttJ3i2OBtqUzBCPHVHYjQrLBgJEIn5
	V+9SwAsQ==
X-Received: by 2002:a17:90b:2547:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37c9ebdd527mr2741516a91.17.1781692127181;
        Wed, 17 Jun 2026 03:28:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2547:b0:36d:6315:1de4 with SMTP id 98e67ed59e1d1-37c9ebdd527mr2741498a91.17.1781692126736;
        Wed, 17 Jun 2026 03:28:46 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ca1dab259sm1520012a91.2.2026.06.17.03.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:28:46 -0700 (PDT)
Message-ID: <b6d3fcc9-92d5-44b5-a7ba-39768f6beff3@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:28:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony.truong@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
 <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
 <frnasys4zgfbdmwd26m3fcfskopugye3s4zii6q2uk2w4in4da@kkrj4ffsgfyn>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <frnasys4zgfbdmwd26m3fcfskopugye3s4zii6q2uk2w4in4da@kkrj4ffsgfyn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rCLKKGuyu2P6zcdqqOtqzEjhvuJ4kwCm
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a3276df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HCCoXu3ZlwqH8F1Mh14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX2ZZ1gVDnXyNp
 6Xc+0L3hNdGNuXbAhxHsI3ydNSQatkOZDg14rIhkHLGAcDZFBcxgUtXQ4nukTqIaz1B9J4UKjct
 +sYuMbis8vhTYUmUCB/8kttqf2HQe5c=
X-Proofpoint-ORIG-GUID: rCLKKGuyu2P6zcdqqOtqzEjhvuJ4kwCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX2glz2g45fBTb
 UBv/TBPQOhJDoYTYxBrGFjdjkF+Af0v75O/gAAQlwrxFQqPH4bF82DW2oojiBHP+ynwILT5KTJt
 wB+PABTJ77yW78WgmAc9sb/tv+0fBikkLuyXfmeHn3AZ3ZGoXio7861rd7bv/wuGHQSF97he6Xn
 cFDV63nGFAnNCANksR1i2TkIoCzCrEWGX7dzxKU2DgqmeYCZB6WPAxsxqY+WiLb+++S4uXL2jA+
 gfRPkVL/UnoqKbeJj53dVJ2/yqk4Giqq9vAYJ0vSP7OjxBg/XikTLopzR5jljS/hJlrVt2oV4iz
 UEElceaKkExQZYVXYWhhv4A1DrT3qocTbC5QO4DMXMm6nx8EilktEPoTLVBpCQNh5piwGsfRDHS
 +rEa04h1eq/wqcZMJs62rWJsRMKwEl36cmyNnK3a6ay/UjWybxSO/WLsPCY3ixdpnPiClSffusS
 2CH+lNuiv39anNGVngg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113540-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tony.truong@oss.qualcomm.com,m:chris.lew@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chunkai.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 311DF6987FA

On 6/3/2026 8:01 PM, Dmitry Baryshkov wrote:

> On Wed, Jun 03, 2026 at 06:14:30PM +0800, Chunkai Deng wrote:
>> glink_smem_rx_advance() wraps the tail index with a single subtraction,
>> which only corrects for one full wrap. The advance count is derived from
>> remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
>> if such a count reaches or exceeds pipe->native.length, the tail remains
> Would not such a packet already cause issues as it will overflow the
> FIFO?

Yes -- looking at qcom_glink_rx_data() again, the existing avail check
("avail < sizeof(hdr) + chunk_size") makes the scenario I described in
the commit message effectively unreachable in practice: if a remote
ever supplied a chunk_size such that the advance count would exceed
pipe->native.length, that check would never pass and we would return
-EAGAIN indefinitely without ever reaching rx_advance.  So the
out-of-bounds offset I described would only arise from a malformed
remote, and at that point modulo does not make anything more
trustworthy.

As mentioned in my reply to Bjorn, I’ll split this patch out and
discuss its optimization separately.

Thanks,
Chunkai

>> outside [0, length) after the subtraction and the next FIFO access uses
>> an out-of-bounds offset.
>>
>> Use modulo so the tail is always normalised back into [0, length),
>> keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
>> checks added to the FIFO helpers.
>>
>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>> ---
>>  drivers/rpmsg/qcom_glink_smem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
>> index 42ad315d7910..4f143921b719 100644
>> --- a/drivers/rpmsg/qcom_glink_smem.c
>> +++ b/drivers/rpmsg/qcom_glink_smem.c
>> @@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>>  
>>  	tail += count;
>>  	if (tail >= pipe->native.length)
>> -		tail -= pipe->native.length;
>> +		tail %= pipe->native.length;
>>  
>>  	*pipe->tail = cpu_to_le32(tail);
>>  }
>>
>> -- 
>> 2.34.1
>>

