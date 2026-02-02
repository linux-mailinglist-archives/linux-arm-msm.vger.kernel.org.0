Return-Path: <linux-arm-msm+bounces-91502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKXoMG6agGnL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:37:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D6CC688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B191301BF42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 12:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF5484039;
	Mon,  2 Feb 2026 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i+jSE7Wf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvdfJgVU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293CA1F5EA
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035628; cv=none; b=JqVhSHzdALnUdMQbsp6Q+JulDtEFodCiKKoYCzpk3DsMuk30lru4UPEPexpch+hUBqpFOYZTu9AfVpWQgJdMU5rqlTM6N06e2aZY5tYRwYVS0UarDbqYdH8SV3W+1WYjY0x6N3j+GPWEBv+IeW3+R418S1SpbSmnfMWTpPFotdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035628; c=relaxed/simple;
	bh=pJ7QtqCF0fgtrlttR+MWGZCFXfWE7BzJ6hYLJnM4A8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqZxyZ6k8NnX77UJPqGVt1NBe++D4vJuWA24ARkRIEaYUOq2T90WzJjy6CmVy6BsL55i3s++C3ZadYXkCXnvDW/dE6vvABPOQfwYCvEGvOQg9b7Dk78n/XMoeGUIBr6JYOXtdb6qYICuPN1sXF6AXsh0mUIjYHfTibCgkQcxlG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+jSE7Wf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvdfJgVU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AvnkQ2261746
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 12:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTL6r2wYEA2xWE/JWb4djjHI4HXg/jrUhj6IdqBDmwI=; b=i+jSE7WfHBUNOkRn
	G+gAuxiVmyd/myAhWWES4msvX95KbVC1Fc0rTr5PpHlaNLGvmXVxiw+MZ7Zz1EKV
	YIvjPyUjwl0wbwu2VVFGVXbiVGzC3t9kLm1R2LpZwxUDM0cuvXUEj2pI4dibx1k8
	cCWGtmHKdd2sqnknB4Dr6bYwQD7fPspw2sPvS7fFgiSBex5gaYRo9Mi+XT9qCgVr
	rOH8xCQXBEEJsBwKCZfEc6rDTgCplKjQGRmU1LffBLsjofz7TgCqWarp3E09Q+mr
	8KmSssIauhbO4P+K93bmvNMJzk9iX1IJByF6Sk73kANYQFqj2esABfQJ46SKntPX
	Fs6FBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmtg7p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:33:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso94641785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 04:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770035624; x=1770640424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTL6r2wYEA2xWE/JWb4djjHI4HXg/jrUhj6IdqBDmwI=;
        b=KvdfJgVURma5HGExX4WYY2yRPesKhZbJmKbB78eovVhlhJhu3vYNICm+3Di/ncQaUj
         pEjgC/hVuYE7EPZgtiaYM3TY1+eeeXyiPwRrnQHZ/ny7rYiYToz6gE70X56NAlhekoBP
         9qcnzlZwx/Z7PrRCi+tRFFs4xeGG8W/+eMANZXF3P79vNHMgIQpYCKxkGUtQOfn5Y2wx
         vwuNJgNKu8/x22C7i2On723JwTiQmhMWS26HWvBVFy74ggaDosCbEFgLU8FhsUsiyQ2T
         qoSx/EFGyuifdi5XTku4Clu+DXase+D0jXnVz+5yGdr2pc1C29kC8R+iTafA2OL9XFRf
         a/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035624; x=1770640424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTL6r2wYEA2xWE/JWb4djjHI4HXg/jrUhj6IdqBDmwI=;
        b=VUNbby9m6uY5ueuss8RuBDuOlAPODFHjZFwuPqdp6HIV4lj8eDgCm/488wtYANB71E
         QuiR28taGs5f6PBAsNY0RMUFDipl9OtZh5Gki41MpRfigJYfG2L9gtQqLoQEm1DnZG0U
         H/pAwyuCVmi70xzEt6ieNChygjP77HRGZlZ4ERkGTCtV30J28hwJovlyHsehs1JDmIXi
         4Mj7izKAzVxZaS4SYUu7gFp7M/MGV4kKZ7QJRTa1trn3AO3mWtvY/K2Xt3iG0ck0/WZp
         WKyMXLfR6QxX+7Jxuy/c4OkXdTY456Gq8DUaeeReGqN/fZ0j4UkaLF9/TzR+mtFb9j6s
         ZReA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkSeZctYeKAvnMAvp7pXIg0Ukh2MliQ7gOVou3a//LR8gMQDT3UanVzR8QJ2mwz07uHciLRi/MdbVWzim@vger.kernel.org
X-Gm-Message-State: AOJu0YymMup5T7JMMfAzGaxtSywiaQo5Qjz7sBAM7dBhyuW83gKBJtzr
	NG5MkXiyHUGd6PKCSuxhtolhGXFMf6DIVCb/pjEy9YzWOS0ig3xHNpCqh1wF6v512MpzfLvoUa/
	yNqGF9F/i7505Cplrh9//msg13rBQiZfA/n7tuZdY+WuuoEhRFNx1Dk9UpCr9DtkR2qUq
X-Gm-Gg: AZuq6aI12MOb+9bAgsWVOGO+z7SBm1iPV+z+gS9NmXA9dtijeRqlLniRKESYyFyeiCX
	hefuxhHzcfDpgXC1N7EhB1LFD+6xUK14vT4Vh+3Ye6p37dDi1HjpLPOWSz1I9gokLgGn+Fi/1gE
	/49GlSwgUJ3XeW6VitunisaxMCvP2WskcVDeeYKdjSaSzlNKfgP2+aJiXIK+Prp77Dbn+zozJqY
	WjRrzdR/ZN1yO2yOeS366jzzyCF0gaqE583YrzeV5wLgV4WFX/gU10e6V6nAxINCpFgn5u4S5M0
	QOFImOsa9UJeRkZgTVyewFwQhvH28nVohKZKfsWZfpkoQz4XLX4BVhPktDjNTJbtLEdDoOf/x3v
	h3w8DM7W1K1mRPlRm30F5JWYUhFFAagY6VUZ4rMAM2jYUFfU9T11sKPnFTW2VHcHva1o=
X-Received: by 2002:a05:620a:1929:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8c9eb266dd2mr1041772285a.3.1770035624343;
        Mon, 02 Feb 2026 04:33:44 -0800 (PST)
X-Received: by 2002:a05:620a:1929:b0:8c9:ea8e:c55a with SMTP id af79cd13be357-8c9eb266dd2mr1041769785a.3.1770035623742;
        Mon, 02 Feb 2026 04:33:43 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86deesm871906266b.3.2026.02.02.04.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:33:41 -0800 (PST)
Message-ID: <c5ddcf1e-b599-4a8e-a23d-d1b680f4272c@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:33:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
 <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
 <2cktheoo5lmh5odlvc4iad7gclx3h4hltg6rbzphga6uu7dbaz@3p23jh5nxhuo>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2cktheoo5lmh5odlvc4iad7gclx3h4hltg6rbzphga6uu7dbaz@3p23jh5nxhuo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=698099a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2hTYSUoH5--4YhmpkQQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NwL_myb8QUdyMyh2nZK8QYN2aRQZWoyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5OCBTYWx0ZWRfXzKElye8D3H6T
 uFFI805jdShcNF9b7YkyL7hJuuUY/iY6dKOfaUQxffCeyHEUGGn4o19sQ+C0wDJjTnfI0EdYXze
 d7F339YdiIbS34i9sy/DtH/abHVLwOwHRuEOX1FwMxKyw7vGDmEoPmcLoCVC7VzAVzzDqNF7Tzw
 EYilaeGkDxe0dLU4I5WQEqpQYEJveEmPxQAl5qXyYsVZsmygOueB365JGJV4urCB/Wvf+JKPTNK
 oZ+q2O9o0URrnZPTd29FDYL8VYfAxTm/4wwRyrTlhX8x+ZghYxo1Ideqvly26aax3Uxvwcv1tZI
 qOgbY6oGktBejrk0eh9wXPz0doX+JiQLLHOjxuxBfxA/sRkKXDbneGE7bo8RCWEJxbhiRK3y1uc
 zrYMmAjVjBR9rvdIhjCYi4gYWXr6xdaZiPwYiShztMMXPqAclSA9zfqxZUHkJuC6oJxDCFq+Jim
 OEvVKF6kXHANfduGDTw==
X-Proofpoint-GUID: NwL_myb8QUdyMyh2nZK8QYN2aRQZWoyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91502-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 648D6CC688
X-Rspamd-Action: no action

On 1/31/26 9:20 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 04:14:30PM +0530, Kathiravan Thirumoorthy wrote:
>> Based on the discussion in the linux-arm-msm list, it is not
>> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.
>>
>> So drop the compatible from qcom,imem.yaml and add it in sram.yaml
>> binding.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v6:
>> 	* New patch
>> ---
>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
>>  Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
>>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
>> index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
>> --- a/Documentation/devicetree/bindings/sram/sram.yaml
>> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
>> @@ -34,6 +34,7 @@ properties:
>>          - nvidia,tegra186-sysram
>>          - nvidia,tegra194-sysram
>>          - nvidia,tegra234-sysram
>> +        - qcom,ipq5424-imem
> 
> Bjorn, Konrad, I sadly don't remember the outcome of our discussion. Do
> we need to specify that this SRAM region is Qualcomm something IMEM or
> do we not?

Do you mean BOOT_IMEM vs SYSTEM_IMEM?

I don't think we have a usecase for the former in Linux and I'm not
sure we ever will (plus we already refer to SYSTEM_IMEM as "imem" in
a lot, lot of places)

Konrad

