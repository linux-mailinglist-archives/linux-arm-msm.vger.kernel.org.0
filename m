Return-Path: <linux-arm-msm+bounces-109611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKVVE2MYFGo4JgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:37:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8F5C8BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29FCC3008C0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A453E63B3;
	Mon, 25 May 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQw2kWZb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGuTmuGk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB72D94A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701854; cv=none; b=c8M8On3wRwRK5OayrCt6Y87gc8dkaFSkwbutyrXJ8IEfM3VYXinw6T//oB3QTiOeKMjQyYyCmt3I7npBPEHljz9zTghXFnWiHrUQT58nXepL/+98+0+phQvbRQE/20qpSH/flVd/p90vCExgQmASTpHH3H7LISNl8cBscEisgAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701854; c=relaxed/simple;
	bh=AcXHzPxq5UR5HDp0KL9txljJc46sYueXNGbCyEGAhBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfjG3Zxk+uUCXlfwxvcB/t+sIZJsaSzm/QQitd9j9TdZpVGrrnaaTkhW8fiqu5PCS6NTvSSVTJ90SCAGknFduRUlDch0nziI6QkALRyj96TdIJW1BdbkVlnL/9BIYAQe7bY+mYuEZD2+YrKXFBZfBaaeZ7UC7NyD0X4K20oAJ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQw2kWZb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGuTmuGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7WJTv2244701
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOQIvvm1gvabh9O4nNnnFAMEBC9uqf0uaqK5rtlsLZE=; b=FQw2kWZbw3beSEaZ
	5QsdI4wq2NGPeMRVlD4hEz5GazUuS4huUnsPmJdvHIRiMRCGL9ZSVwVB0NVmeHRx
	wVEMfDDjlNtE8vbCi6X16xfgjI4cfUCzPPzQJmBspGNKbYIg8bzOJNg6xby0OcPv
	HZTAoW06dxlrNnXFnLN5UtDo22m880Fij6WAFEK/YigLY+cL/0mVgxcjuoxXecmf
	ZJjC8iSpEKUOFvVlk3ZnhAd3Odiu6acPuazbbc/ZaZbo9jRkVmd/F6dh5EBvVdhL
	xqnuauzu761unPAlEXBABTjOhiGSm7PwK2KIRrMkz2zafgRmEG5H5O+w0UFV2XgP
	Ez55ZQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p23s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:37:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso5499605b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701851; x=1780306651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOQIvvm1gvabh9O4nNnnFAMEBC9uqf0uaqK5rtlsLZE=;
        b=DGuTmuGk0r47y0nK8HkIgHQpJZiUa5wH2ZuR0yYpOliFsE+i/4sUycaYG39mFgm4Cf
         grTNnlDt9C/AeNDkf6BMbhFJGIj+D0NJtqEeQUD1B3Zv3436gxXQEjRmW2HxCUID0+pW
         Fw+Zv9g05flW05o755w8nsiYqd7fxAiKXDwX7CF2/0Fc4rBirdJAC8Z2rUUE3T9NwL2p
         d5uJPeOqXgBmPMq7DjI88LaF+Wvh41QvaPdyXxQR2SND5vYhq3fKEKwJSrpcyhrgOWZZ
         RFMJ3qff8EGTg+tTEyXC4sD77X2yxKEsFscl42gL+Np71xSxDT3kkU9zDLDKlI7ZAi6A
         yfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701851; x=1780306651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOQIvvm1gvabh9O4nNnnFAMEBC9uqf0uaqK5rtlsLZE=;
        b=RbY6awRXj2sqBfFcnpydpMkzUKUVhoAfLTZQhXqMp8i5GwJGpii1jd9S/38OZ6eXKC
         3v94r3QwsH/xvIhvTXzrv9ePSZ0ccRLkzhUUUx7s5vfTAQzuh7+W6nv9icZbawGokL25
         aXYNgEMCOhYAbxTkyihl7NDvJNRgJ6SpGMBB6E4a/QR+LqSSWGcc1lsL0IjpCuN3JKvC
         U87nuqOsaiEu4m8o71059Qhv3Rse5Xxq1oTJrC0GYd7gHwduA0BBkwEkiHAYMcGivdCv
         vKI4as5qnpoIck++O7e3H74qstB/aj35EJQEaxjIb2kaV8AsEjRn9mVnenz14GIRDQk5
         t2qQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/z/TAjjFs4UfGrCI43b/O+p0qBDUnMSKY1/Ia1wBIsuzzrWxGax9VYGONd/DbUcddLf01ThenvoURSlpg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgc+EXQAIz+PeA24PIQKdERYa9wT3JJ7dWITasshiWdfhBA+SJ
	bWsd7NhNm8SPKmbaRP9XuSxwPdgJoC7cxDlBROrRtgs65OMaiNMoqj5vg//+BJo5dJOrDLb5C6l
	622tAbx9vNFuzhI/RfG7iVMfpc/EhgpX4ALRSevRHSnzWpDjFiLQTDXDIzRYNWIV9oDyT
X-Gm-Gg: Acq92OH0JopnhPeN9NGkOxA8U8MY3k91PscNkvo8/zO7MJnGYCoxEdE2XYPE26B7F0t
	xIhw0xU50fyV98oKb2vMkyUJzoQAalDZ9JLX3FdVNp4pq7Roqp6IFeDo3bKrI+i2o8UYojMdiZE
	2kAlM0EKK4OYua9K/UbOwrEW+NjT3dYG7J54rjVhlgRYQsidC092rIFbERU5uzhenO9sN35Qbzg
	vZOluiEJAO24QBIQIdacnJloXcHa/RYTR5V0j4F+8okVdhaf1uU2xSNfY9vunPQFIy4rNgFIt+R
	w/uDL8eEwmYfOrVF9V9BqkPROMJTVpcZQm7mYKpws7uzxntZgpV7zvwx+nTU/6ekd07l3LfzZ7R
	hjYekWteEYFQlHxERV/8QdrUoPBcJ8D+D1Dh6UiXcVc9Q2g==
X-Received: by 2002:a05:6a00:ad8a:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-8415f1a06fdmr12494029b3a.21.1779701850600;
        Mon, 25 May 2026 02:37:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8a:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-8415f1a06fdmr12494008b3a.21.1779701850131;
        Mon, 25 May 2026 02:37:30 -0700 (PDT)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb3083sm8990026b3a.43.2026.05.25.02.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:37:29 -0700 (PDT)
Message-ID: <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:37:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mkYtWOUoQG3jGIzrI6tV5NgCO-IZFeey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX4KMw8kKcEzJv
 8HFt8VgV/9uQc5mdNmFBIPSQ1gL0vnRQXdV6+hFf7O+aHvk7ssek7SIn2ZvToti7Cg2dSxGm5z3
 44S9VWcP+rWAajxq1szQVYLSoMz2V/D9YlIkz0v7q9sLwdKX3HTcBc+eA2b8g/Rz3aQYVgxIpGe
 DIpzRMfk7eNeJq2u5d23QXdD+IR3bNDBhQGrn5pHJ89aQ5XZIPSlVstiqpLuNNu9G9UlkcY/Gr5
 3jE8zwaB56oqHDJThibKOQheWVQvOBfoqoqYMaKQYrwh2laC032JLH1BP115lTNfj646BctpIyT
 u+BRBQ3Rt3n76KmxEqTo63vHH2ATjDWn5/et0mTcGt8eGavn7j9ze8ifyyRCW4QV+ZUhqXUFoe4
 Jl5bKRnddyBkNuoN+ZCThDbSQVesGknNzvkrj+t1ITcC5JUDqB3ZEIckEuLFoLcbrMNjWUQrgh6
 bPeq+GDBSnZ7OFmCmcg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a14185b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=in8ZqU4PNEo4w4k2-loA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: mkYtWOUoQG3jGIzrI6tV5NgCO-IZFeey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109611-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3A8F5C8BB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
>> Document compatible string for the FastRPC interface on the Qualcomm Maili
>> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
>> fallback to Kaanapali.
> 
> Can I assume that it has the same bus width as Kaanapali?

Yes, the DMA width for CDSP and ADSP is the same. If you were referring 
to something other than the DMA width, please let me know.

> 
>>
>> Assisted-by: Claude:claude-opus-4-6
> 
> Claude assisting to write a one-liner patch? It's becoming ridiculous.

This patch was generated alongside a set of Maili-related patches and 
was not created specifically on its own.

> 
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index 2876fdd7c6e6..afe52296bf1d 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -26,6 +26,7 @@ properties:
>>             - enum:
>>                 - qcom,glymur-fastrpc
>>                 - qcom,hawi-fastrpc
>> +              - qcom,maili-fastrpc
>>             - const: qcom,kaanapali-fastrpc
>>   
>>     label:
>>
>> ---
>> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
>> change-id: 20260512-fastrpc-9f3b691f8e2d
>>
>> Best regards,
>> --
>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
> 

-- 
Best Regards,
Yijie


