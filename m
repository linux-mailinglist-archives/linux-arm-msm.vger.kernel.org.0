Return-Path: <linux-arm-msm+bounces-90189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGltGoYRcmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:01:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC53566546
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3649D8C7D46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A7036923E;
	Thu, 22 Jan 2026 11:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU9FRMLv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cudKBcHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BB3587A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082052; cv=none; b=M7gZPtCpO1mrIZ41Yaj2ZZUtqZ/oD82ACSm2/HVk9f4TVu9fwk9SZDm+Ujki7lXlFA222pLoMnk50aHunFFu45DPt+M8KmqaF1BDvWej8F+OGekVujrEiw+cj7c13sdlF1UYu7sKeoqadm7Lg0cTDRRWi82KUmWoUEgVN0raTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082052; c=relaxed/simple;
	bh=ZK0ACVROQAZRt6LprTv91v/5BcxRCflplQDQ9rSKjC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tEnURqOdCcT0Rrknj5Lb4qq+z0DvAyPgpr7Add7tBeP985VKnK0toPrf6QRkdmrIGroA4FKQ3BVGoqsn+1lh5Y2uRtpDOVwfaKYKA4IbqH/IOdLQfat6kJbSjQahwHV5dzDiiIDOIJ2uX2uzQagGU+adA0tWYgkN4FUZ+0qTdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU9FRMLv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cudKBcHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7X2sx4057918
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RFEI03KmqIimkO+9GAUQliSalAfKUYMXig/zdR6SbiE=; b=TU9FRMLvlN2+QBSM
	2N6qpQ3ezc1/lavcduoPFYRBgEv9rLmulr0vF28XN5a9F3EWDdu35eg7WYvSheMi
	sSjB2vLj5th9FW4IuZvvsUDItkr/zKpUPdjGjNZZ7cXEL6JY4ZQFlPHV54AHSJvl
	YuJpZE+5oMqrZhCm5XQsKOUolNRmUyPbU0duLP+M39TL+1aUrkOqp/4vpb84/jki
	kgzwDJXYJYuS50orkM+E6uhrn5IK8VdGyngqRnGbuvF+DoZzPykOIj6GQ/suPYOK
	8wb5jaTFLn4ysW/YYdFw5EiLQq8sUNnEQpYW7ZzdKLnfGhhm+9horkPhY4UHtNK+
	srga+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbt3rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:40:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c523d611ffso13511085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769082049; x=1769686849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFEI03KmqIimkO+9GAUQliSalAfKUYMXig/zdR6SbiE=;
        b=cudKBcHUccjrAE3fm5iMPE9IEcsZJjWLlJRh2j3IRpN1TQdOth75vKSx3u1NSGUErl
         /o1jfRo1/b/RrDoSUZcGCDGiWzLvnVvEAHQenlG79yGGWwj4gKnok+Vk2P3E6aMouJ6a
         U4O27xajFX28VPLY/fXuXC0+dWcTw/Kj4p7kq+PQ1joRmEY7lPtolvkzZVO1g70tv2E2
         w3MmfwnstJnk29XCdJsk+/rY1FbbgfQQlH28PTBYy3NmBc9DYlEH5ilfy16csqqHBn6n
         ZDjgEAVoZ96wL7/2QSvSgKkTrDiq1qMQaJJ8YZDgk8Qr+Om0u/jue+kKhPktNkDcXvn1
         VLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082049; x=1769686849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFEI03KmqIimkO+9GAUQliSalAfKUYMXig/zdR6SbiE=;
        b=jprRqrm9N+1khNBRaUM8C+zSRiGfXiIJfn2rHIRrms6ikxLmbVYITSlEjpCG9q6vwS
         rj6T8QWS0HKAoWFR30AgzuJ3LbvhtvOz+L8n8fSEI0aC7OQL6i1aa4axVeIp4Nfc0DBY
         ZbRY8l/TJD3UdJ3Mt9EvVzP/sbPn4EIoUymZ2in3Z/ja1IPCEzXY6t0esyd/kMKcoeMq
         /w1aJDXPZRaHTmsPSYxIDG78J6CV/JbxLyZ9YX4DvQFp+bYGYFcsMBFRpC86XXuW00af
         4YcmDYdeU3KY2Vy5iJAQ+YuBkdVHtWzYkSUEenZHctN/4qXcFT9AWz0Ud+7vNUgiS2lZ
         iVPg==
X-Gm-Message-State: AOJu0YwfwhpQGoQYW/qmaDy06N7CYYBs45F6RkrfnBk//bMaRDSsu3x3
	C9hE0XdJNTTijm8rdGb6JqO2j4j9kJW20oQ+T68Z8n0txZUhL8IoCDu5hOqL2fZu0E3zOZXAFRt
	OtJgqQcuGHXY6w/65r0ATbH1POnixtyKxY6/5ggFE/EMgv7H1bGwGTHQ8vt3uzsm3a53RkCEUN1
	8F
X-Gm-Gg: AZuq6aIzSNHU0GgydWV+aF1K8cRaHY8Hqjmx6RFb+tuLm/o7PhJ85sja1gRCsiz6QPY
	pAHIULzcya4ifYxJJVhxKHOvCnzmP9nvQFtuWbdF85hI/21jp+4J2vrNbn/JpvsI+/hQsyuFDVO
	K0rwFsKpPaKmUxzx9rukwNCgKM6PW3IRkfbKpUFx+qrSwVbD7Lc5vZGAhOdIbCQloCRTzUuxltm
	5l4UArZbrz/xzvfFYwDvlBAf8HvmrjOdwd96E9Lcy4GD4bFcpartyZp1cj/8wwh6G2tAhhfs3n+
	yiEjIra9SkJyDTydimHJqfvX5MVCz7DGsae5/hLwUjDkomOnnvg3mYdnruMvokuV4j08jDhrhNc
	E6VCumwxkEH4Mqedp+v1aPK5Wxjxw77BpR22Tvad+cgGynBu3vmj43GmRVM7/R7wasc8=
X-Received: by 2002:a05:620a:2947:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6a67c6a94mr1953910585a.11.1769082048821;
        Thu, 22 Jan 2026 03:40:48 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8a2:568c:a88b with SMTP id af79cd13be357-8c6a67c6a94mr1953909185a.11.1769082048307;
        Thu, 22 Jan 2026 03:40:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce213sm16209618a12.2.2026.01.22.03.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:40:47 -0800 (PST)
Message-ID: <a52ea93c-537e-4234-869f-50cb625e47f5@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 12:40:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Gianluca Boiano <morf3089@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
 <20260121203005.13529-1-morf3089@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121203005.13529-1-morf3089@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6I4ddCJGUoUKDfc8YZY8T47QTisR8WUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4NSBTYWx0ZWRfX7pv4hlZ+Mlva
 zvEQPOLc2vn9GUzq0oEQVEooeBQ6212Nz4Ld3//5a6z9IzAiT4S85s4AqA7zphUk341MGBCzOON
 k4Ocxtss4VeCJTCkWre/DR4IxILwLakGe4DcUwxpeI4+Po4jO/EozfqijMP7IfhDZj53JO51D7S
 8t/847eG+1eJDILyK1l4OAiRWG74bDsLah8eZn5SpSbzoedqa8yr2iaNoWLjEeFO6jABdHd3w4J
 w/PtweHoQRY8NizqONbdB9wXDVf/P5gJzw9Wvjt35uSpfclg+Q5eH9TTuv1v9DBMnf6ViVXiKOU
 J3SX8y4FAyCuyq+5LEbTVqBMB7MzqxWr7bqDdHH/OB9sljT3m6FhONBqZ15sp8XHORNDWCD3TT/
 XJZhomVOpUe12GwIjf4/99sMMveh2dSqSO4cKz4P2AYZ4llgOMH5cUfyPw7CiB4XzyIWpkV3+fs
 407DR7YDDu/CaX6vwnA==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=69720cc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DIydkXfq6v2MYWbISbsA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6I4ddCJGUoUKDfc8YZY8T47QTisR8WUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90189-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC53566546
X-Rspamd-Action: no action

On 1/21/26 9:30 PM, Gianluca Boiano wrote:
> On Tue, Jan 21, 2026, Konrad Dybcio wrote:
>> Why regulator-always-on for l3b?
> 
> This regulator powers the touchscreen. Without always-on, display
> initialization fails during boot. This matches downstream behavior.
> I can add a comment explaining this if preferred.

Is there a chance it simply needs to be power sequenced in a specific
order vs the display itself? (seed drm_panel_add_follower())

>> Why isn't sdhc_2 enabled globally in common?
> 
> jasmine and platina don't have SD card slots, so enabling sdhc_2 globally
> would be incorrect. Only tulip, whyred, and lavender have SD card support.

I overlooked that, thanks

Konrad

