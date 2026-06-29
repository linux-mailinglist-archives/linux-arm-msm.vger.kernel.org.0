Return-Path: <linux-arm-msm+bounces-114971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FN7gAN1GQmp73gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:20:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE36D8D4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:20:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xyu6x5t2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W4+MXHkV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114971-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114971-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCAFA301DC03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462323E5A20;
	Mon, 29 Jun 2026 10:17:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2753D9DA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:17:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728260; cv=none; b=txgtKZSxgkIlaJzAJr5SovZqNqKrLebrnjOa9WQrKU9Nxpxt2hQz84WFV6cRDZnAdx3cx2UMsaCO2hLsSO4q7uDnpti60ePOr96obdXzXDl9lzU3bgY/dVhk4jVVKUda5D+QUgv1+rJzGO98+aUYxcX+E9tEnjNfM5hUIJF6Zo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728260; c=relaxed/simple;
	bh=XOHN+A9UrA9lHMZWm+prfk5DYaDZGzDNDx3EItH6QsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGYhtTLpnkYJRnQQ2St6L3nLPtFjq+TRA1Fe+H4eW9oImFfbdkDxyJeY/YN/jBwo5xDMI5zOVGWtWVbZolIaMni1gfU7wN8Odvhf6yqAJXyvYOKRTzlvxEHPdsvGwllbnwhYFw2japJizowt6ymg3BtnuHJN+UAY9zZu/qF7YxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xyu6x5t2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4+MXHkV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7E0Wp2188886
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=; b=Xyu6x5t2IhWN50Rm
	RkIdtnimzBHYBG01Am3OOoDXEpgwZ7M49iHo1y/iRG7fi1+x0+1F2qFf+icKs9PP
	PXXsMqM9n9pXjUEr6L5Ay+qpEdW5mty70Ps5AuRDko6vVGOjGOCRcofRbqT5WKoQ
	0zrKOBjwEsXm+ghQ5TMqeK8R8KuyTQKe+aw4sThcuPkRDrBz6mua32YP/8UdMf2n
	fG+rypcyYIRE61MdsZrhzJKYnl/KUA7kwucVsSUYwLLPxJq1RPZrqmrXwPt6wq9Y
	4SXGdYPirMCeu9bcKt6yL6XLLSzfdzQ3sjwtNxLqPpFkcvMFc18/fMsne9k9WoYb
	+UQbzg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trs73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:17:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845df469a26so2503531b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728257; x=1783333057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=;
        b=W4+MXHkVb89CInWLGQIOGCoOa5LAUT0bbgcjVQ802AkF76TsDSroX3blV1a+yTHRgN
         8PfYRaH5K4AdZPo9PhBNROC7JGmsZk4+0mR6JtBhycb7mTElJeLuG9tvjP39pu9iHmPH
         c7T7naWkmlot86HTuhE7d3fBWAdCLI4+H+Du3LS1MvQ1oWyuRvCoH24x4tH8867tvlNi
         qK+GJr/swWL99cvIdHey1WO3ELF8VqZp9BB/m0ns2mOy0/7iMrNGSq1t+CsAzYGqVHlg
         RKU8tr4vXz4p7rQ8osZ1cF3NkX2d7JDePlNT0r26npIu0M2TL+gzgfhQoOgRPGDUKj7T
         nhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728257; x=1783333057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGVDMRWxxVhXu6sG3ksNatTGE0seC/FgPwmQZg+NpqA=;
        b=V8gZCeFbvrGHlxMW0zBypClxhyxuuerkRF8/ftxRvXn0bn/N8Fj7KP+XpTtQG1focI
         PGetMEroyz27v1vjuZLi46oYCOaWKnS+uojS8sgTsFJ65VsWrzuSw8Qh6z6zFtYuUA+P
         7ECl6Ua4wSgcx/gm+3vwry19cJrwiRDHvsKDIZKm72WpcMOJqWcXDmoTk/biOt/mdpkz
         1dpC82hDaF5fFFpvSskBoPydeDfI6gA6prcVpgBxKhyTwJEmXS5iL30lFbMc4EzV4ZDi
         1KmVAicJxfvmAClYOYSQoFrUSvcAMFhnEZQ35takQ4gjggOuczolZFWZ+fAoAopNmf6k
         NgRg==
X-Forwarded-Encrypted: i=1; AHgh+RoYOCdxn5rAAr9lOAZNtohPdxdeT0X71geaztIhpQRwJ7YgXzcE/EMRUGLZOKw/6Xj4bPxzmg6UJ8wnQqJM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7tBuCRx9VJIx0MsFyPyzJbX76YXy+pEK+MK7K379pzEnBY5A
	2VsURuH+eJVI7yPWmbS35Amh3/kR3xzUX69PVofv1yLaQjQVb5he4kPNIrSGoZecdibiWkGpkhv
	B8zu82npsQl2bjPhB49V/4MVtsBI/fE0AgFCVEVnMbyTzoVaIRNGpgskTGuUgEkamU9YN
X-Gm-Gg: AfdE7cnVWSeX3YmQ7ANFuPp6J/Zfh33orPz8aepfkPJ/rT051OfOj1gWm23GuPHYyox
	uyYL0YF0Fg5DYHH96LFNZxJ+09EY8pwux+GByccdcKkOV2bIypCFhx8DgYkeT/h134wwlzGCXYr
	zQ3cEY6NtmWPUXvOYjuZm57MbXzQDZa6Eaz9iLoUQmEN3SlF2ozEx3jQN/cTkKn26JD1maRHZ8y
	TGZRs1uUyKu3sfONs+yy5BSwgYyHUZQ3LhLQ9fig8YOZflirR7hoSEsDqEt6ld4cRFWVKHiaMuT
	qUfhWgxgON3hF6hbUOocMtSe1ZP1ZUxpf6qhcfl8ZqvSAmkVxQMUNqIWbxjIcSPEztaH9zr01VN
	MZIaWIWXT02dTLey6zCzmT0sDaufBs7ZndLV8ZovBBqXyAy0HArJpSA33JK3Wsk507b77LMHpiY
	bpeeQ3p0k=
X-Received: by 2002:a05:6a00:92a6:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-845b3abb5bdmr16173875b3a.13.1782728257454;
        Mon, 29 Jun 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a6:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-845b3abb5bdmr16173852b3a.13.1782728257017;
        Mon, 29 Jun 2026 03:17:37 -0700 (PDT)
Received: from [10.133.33.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845cdfac944sm5773852b3a.12.2026.06.29.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:17:36 -0700 (PDT)
Message-ID: <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 18:17:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2026062959-distaste-launder-e253@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX0rMrE9Magvph
 cjIdWKnHuXJzZyLywRb/dNz8ZCh19xgu3SFxC5Lunj899ody/ACLg/zpVGbpsJkSUHdeg8Cw34z
 wzXEkBczuFtV5uHk9E/xxh3wbMlOCOUok2iihSc3tgpmxT9t2/8aMI6hUwRkpCYqKHq5qa3Zk4h
 CkTRUTW5IkIabXR3yqOQ9jqEiXwvcRl2660OjfEmpGG/7vhQjEetdIONXE2FH3O7x9b01plwuAO
 XbuxJTkN0Qz8Z0Oxd/FljHPMf9feqwM8yDcnN8nD9OsVh3ntJEi7xfACgXSBlrXYLVNHC9zjG8B
 ujQC42zkBkw9jk1HciT4iYpPGpKQBTLUuxw6Q9JhIs5PxEyVvixKKud33PaeV903Va1VX+oXsGL
 CycQw6m9sFmsxgDiV2urvjZr5ki/cflejY1Gm5BR3ykt/CNk07blcEGKJ48EBcD+M3nwUHnHgxp
 i4REZDZxDKJjQOcXDCw==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424642 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Svlu2gy5LF0AZrWEB8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX3yGbS5vHOdc3
 meJA+utGIIqLrJN94TVy8VONMoIHi7RZqpFi4hzdo4/Sbw41jZZ5m8hVw560aLw9h9uV9DMbAg5
 knKhGYyC4CHE8B7UyLvo0YcWp0+mKt4=
X-Proofpoint-ORIG-GUID: AiaN-gKWKXUUGTQD1u2exIKre6c8VqzM
X-Proofpoint-GUID: AiaN-gKWKXUUGTQD1u2exIKre6c8VqzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114971-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FDE36D8D4C


On 6/29/2026 12:22 PM, Greg KH wrote:
> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>> Hi Greg & Alexander,
>>
>> Apologies for interrupting again.
>>
>> As the TGU hardware plays an important role in Qualcomm tracing design, I
>> would greatly appreciate it if you could kindly take some time to review
>> this at your earliest convenience.
> The merge window _just_ closed, please give us a chance to catch up.
>
> Also, why us?  Surely you have other reviewers for this code, right?

Hi Greg,

Understood, thanks for letting us know.

Regarding your question: since this introduces a new 
drivers/hwtracing/qcom directory, there is no existing maintainer for it.
Given your scope (and Alexander's), we believe you are the most relevant 
reviewers.

The reason for creating the qcom directory is as follows:

/We previously tried to upstream this driver under 
drivers/hwtracing/coresight,/
/but it was not accepted as it is considered Qualcomm-specific and not 
tightly/
/coupled with the CoreSight subsystem. Based on this feedback, we are 
exploring/
/a dedicated drivers/hwtracing/qcom directory, similar to intel_th, to 
better/
/support this and future Qualcomm hwtracing drivers./

More details can be found in “[PATCH v14 0/7] -- Why we are proposing this”.

Thanks,
Songwei

>
> thanks,
>
> greg k-h

