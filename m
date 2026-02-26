Return-Path: <linux-arm-msm+bounces-94258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOfTCG0WoGlifgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:46:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D01A3B01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EDF33219D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DC328726D;
	Thu, 26 Feb 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mn1KgS+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaBeiXnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D255279DB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098380; cv=none; b=UnlwZSxfmOFpehNJleR4vfgh8EZLRMnljMimGwuoCkLin3kfqUNklBuiFHh4QinRFnQo8VWzLAx0MgfwW957FJtlCeY6ERLENAeYcuaCUTJld6IlPhn24Kd2R7z2gm9vcIilWLVZ2cW8JmL/vZH44vLZCLj0JKj6f0YSho1dpng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098380; c=relaxed/simple;
	bh=75YVOLzhyztS/Fwr4fgdn84cU9fbvC8GxjP6xzwnu6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNA7i3UNqIp9Iu6gJQLa4PoC62aZn7abodYX603/Ly0Dq6+8gEeiT01/dMXdSLIcEAdOKR7D9cy0fwzlvn0GUB7aZao0e5QlupW0AXIzSFcsReYMGUdF+g404v7kzB1NjXGMM3iZD1viN1sBZ9GHYQ+vy1Bp6eoEvO7B9CJJN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mn1KgS+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaBeiXnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q8siqK714288
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uyo9PkJsca3y+WOAJ0ajcsalmGWBTs5mX7b6mTfT6z0=; b=Mn1KgS+Ox5BSFoMV
	d93Ihvcc0NNYv2Y9cdYbm49f63Qvz38ds4rNi9T5dsHAhdHExCiHWwLCgPZY4HTz
	bBA9g9yL+J0uvm4RDZVzWRwfQhLihMDOUOfXWFEvJXBwiNHXRtwJP5NexpaU0+B/
	4wHi/NwRfpbKFmI/3kA+Wl/ZOoFExGlOYcpwJwLGEnIWPaz6UMFKS6rTWLVmQPqP
	QMx84nnEJVf90GIk3G7qROyMFU6uzIcwRIQF8Ug0Aw8TxhzHs3ZeOpHEeZT8DNSb
	kxYoDCE5YWLl05J/kpeP5T+52xyhd9ftXcKf2O1IDLpPdrIgddfYBd4mEP2yX1JP
	w7B2CQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v04rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:32:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7b8fe7c71so2377625ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 01:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772098377; x=1772703177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uyo9PkJsca3y+WOAJ0ajcsalmGWBTs5mX7b6mTfT6z0=;
        b=GaBeiXnPUoDDkGsUQWhsSDn0W9Mu7scntNtcAf55bn6XViJ7R/qSe1Z2FXtgV+/8OE
         NmVbD69rb4JJlmnuVpzO1B2BEkFtDq70pBAKXKR1MvQKhP0azwBH/7SW14OY7C1+vYAB
         wrDKjUGi6UcWitkChQVexsBZqNUxvJNja92na5zdZMtuN4iuYiACaMsnm8xM52ct7TrS
         c7NTkoIykAzdwlFkzdInJpVXGEsLBG549QOfPu9ckeTHr16HkJfnDjWemGCYpmOrMEiD
         kmfbnWCiCagF3D7P67UYUTkPX/wptGLokKc9+sJyzmme2OFpjfmxR9TV9S2l7QM9KewM
         PF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098377; x=1772703177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uyo9PkJsca3y+WOAJ0ajcsalmGWBTs5mX7b6mTfT6z0=;
        b=atfHnR2gf5wuVVrOi7qLPuE64wenInxAq2dG5pSDr2G6hTTrPAJ+M2PAtaHhfwOXtQ
         csuUXj4c4TF/W6F/4f2pzwQ4nof5cH2z0d7l1VH4K/+iPbE6LvUw9D0d9wf6Xy1WeNAy
         7MdP8V2ZrsvlICGNWmakI5kMZEFXFoTPJDTo4X1B/jSbSedew+7BFCVLrduef7A6Q4EF
         El92Fmh5GuHirgb4RRBBfuIkxJoaAa2vWUGRljaGwUR+oQ2Nuf1dSu2afZGozaK21GGS
         zkh9KGyyr2vrRO8Imyuo9uN1eThlGssbw8+1VfgmkuF8GqhQDMtoQNYQfUI/PYVcdJvf
         IJ0g==
X-Gm-Message-State: AOJu0Yzm9YvVvJG9z+Iq+o/NMkiFyubHA61s1zFRWKCHfoBGbqbHzGlO
	tS6WqyuYQfPf1li7xunssNnd9FtiqrCpjrhNqDd/7l8hmLoxE76oaheDsJjCiItFzu4bzSPY4ID
	9KrjgbW5WiR57G+4UjwV2VTTp/jLomLKS2luUeUbY8FNB36SL0OTqpPvyvtGPGzSGRX0/
X-Gm-Gg: ATEYQzyEDwNrSSfMrutlIz4yHP67frt8RrcgJxqfkp3hiDMLUGBXCIypMv6mRmYj1b/
	STgRAQyTIef1nirgDkgTDY1VEjCNYNBH1t1neHX3XnZ7EgQy90YjvvsZqsyd2+4GtrbP1/KBxZe
	EprFB8oonqam8vqLMicIWbqI76ArWCqmbEDvIm6L61+kuWYqrh49T0+X8lIfqsOQceMpzsdWHm5
	8j9boxJv95J0ocyi4UYEmM134dahqPf21WqCbnNCfiCWhSyLRnQ+O3fgySvoX25RJbO2plWrDWM
	ZD1VAqsRjEffFQsrFhiaxrTy2Gg13D1RNq08bIDiptVINbpfv8TnGYEi4CBAo3ucS0wByaB+wNu
	tQq50vKuQUTVpipyFF4WncghbP8k6F/Xdc+eSFAO1P2yd
X-Received: by 2002:a17:902:f38d:b0:2ad:b230:bd5d with SMTP id d9443c01a7336-2adb230bfb0mr33451825ad.4.1772098376910;
        Thu, 26 Feb 2026 01:32:56 -0800 (PST)
X-Received: by 2002:a17:902:f38d:b0:2ad:b230:bd5d with SMTP id d9443c01a7336-2adb230bfb0mr33451715ad.4.1772098376450;
        Thu, 26 Feb 2026 01:32:56 -0800 (PST)
Received: from [10.253.79.190] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22e7sm20214345ad.3.2026.02.26.01.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:32:56 -0800 (PST)
Message-ID: <b8d07c22-8b93-4689-a5c2-427e1eb6f7fb@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 17:32:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
References: <20260225091700.286108-1-wei.deng@oss.qualcomm.com>
 <99196fad-9d1d-42d1-af43-80b6a2ab262f@kernel.org>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <99196fad-9d1d-42d1-af43-80b6a2ab262f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i9zxuoO8Rx4znQ86QPdU3-umVZLW4_S5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA4NSBTYWx0ZWRfXz7lN5EN+Fk8P
 plmFJYxgduKuBz/N+vjZe4i6H14m8qbv3x6AoDE2gBp5PM8PEPHj5KvnvU69e83GAniMR5zXod7
 k8GRvSYZXexwqpSPDiVwaGM8sPOIzKCynxZ4U6xqKyikXhem9jynUSPL+mpv1e4fnHrWb714+2h
 qZORF+OJjTlMyEOyiTdUpfyykgLVj/95I/eO4JO9oaYixB8iBqM8glZJWyLzEeLu5mcULkk9otN
 DpCadUAKhZFoUxI7AzK2ioFi2HNfp5gibGmbRTIfYppPuLW0Hr7t4XHh5mdHAZt0NpgFgEp9vqr
 cNw0VTOaSmJ5CCXsT3F6X9wvwL/1XR3DD6ryQMGq8yLiP1ePoJUsmSQ3L76IMu0b+sUUe+SB+84
 u0YzM6th19XmyuC6wjIm3878/IWkUfDQ7R52sSeLLhBwazY916MJmuYcE5b6QRWeah0p0Ypstjo
 oanmYn89BC8R1/aixAw==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a01349 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UB3C3iIAKtE6oQ4yFSQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: i9zxuoO8Rx4znQ86QPdU3-umVZLW4_S5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94258-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A8D01A3B01
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/26/2026 5:18 PM, Krzysztof Kozlowski wrote:
> On 25/02/2026 10:17, Wei Deng wrote:
>> Enable BT on qcs8300-ride by adding a BT device tree node.
>>
>> Since the platform uses the QCA6698 Bluetooth chip. While
>> the QCA6698 shares the same IP core as the WCN6855, it has
>> different RF components and RAM sizes, requiring new firmware
>> files. Use the firmware-name property to specify the NVM and
>> rampatch firmware to load.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
>> This patch depends on:
>> - WLAN
>> https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/
>>
> 
> 
> Which depends on 5 other patches. Send one complete Bluetooth+WLAN posting.

Thanks for the clarification.

The WLAN patch has just been reposted as a new v10:
https://lore.kernel.org/all/20260225071459.1600394-1-wei.zhang@oss.qualcomm.com/

This v10 no longer depends on the additional patches mentioned earlier.
Given this update, would it be acceptable if I re-submit the Bluetooth patch on top of this v10 WLAN change?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Wei Deng


