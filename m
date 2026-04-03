Return-Path: <linux-arm-msm+bounces-101627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKf9Ix6az2lHxwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 12:44:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0474A39362D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 12:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0608D300E603
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 10:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571863A9DA6;
	Fri,  3 Apr 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEUmKtDt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnB17/Ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F13537E6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213077; cv=none; b=hBWKlw1GgC2fxJ2UfQfH+fBnJjTDkd89eHCaXBKwxvg7jLXqNJwWRKz23IS0zss+mQD41j+dpOM84V2YHDAbwe0wfMSxlWFwaUtFZf2ua19SvC1ab25jHRuvQVO+bBCrd0WiiFqvEB7kDQKMlBiNW6OCkThnA4yQGtRXsH3fgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213077; c=relaxed/simple;
	bh=i+5OV1UMLf0KsB6PFIHIGfzBNc9YjQNT7smSsDfyqFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzYhDLtAYg6QSGP+FOaU9jJ35rQB42woXuJaAEi5hnjMOUU+76p/CRUTubpSRBIaTjddXz2lcJf5aQ3+34xu1BO5WgEfyzwYfISa417VnEVNeVKUlFSe3eneuOWU9IvZQ1fQ9d9+0WoRldHEmirC/yZeFcyd6FFYpZidUsFHaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEUmKtDt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnB17/Ye; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336FAol141947
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 10:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp7jHdTewElQMOorsvsIFbf0ZsK4yvWuAEvmqGviOTw=; b=oEUmKtDtsoDZ/RsH
	KD8QPRgFr20LYSOEq2bQS6KF8110TysMJA9lQSdtWKmMWVnWqhn1a7gCqzCVQOTG
	RBB1Z0KILG593kuQTVD+SfJ9ukEBq/UNH4e9P4qUjt4R2Sw58LsXNEV/BIzZpr0E
	7c4b3rPP15y1gie7U7O2Nzn7iADLfFSbECB0/blXK2HkXdpghCMm/wELH3YL8Udh
	cfVr5EMc04l7RpP3UgkVmEZMdgSSKeZmfjC50lvxFNaXEjFEtIgpoJE8gD4IDwup
	vJD3FZStaYI0YO4EbFxmfFKZhf/xD9PWun+U1YtY7FAV7h7dOiRo9faLmAv39dBn
	FMWTkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y0s0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:44:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad179c7fc7so4709695ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775213074; x=1775817874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp7jHdTewElQMOorsvsIFbf0ZsK4yvWuAEvmqGviOTw=;
        b=SnB17/YepJNySg8dflIXwCzcLmxhJcMYIDCOo/uj5DdTdGDAlWHKIjIBDwFEpxbcPX
         m1/fh1fleZSuYe175Z6YPphvFwAlHkjSd7oQOjLA11PvA9/jkS5gGpZFpEr0C75TmiUc
         ry4TpmJSgw2bvfNHkpoTZX1uXW+i4xcozgcvytw7Zl+ChIx0PrkvyIBGrV1HSBkpoMtn
         njAvMpkFJSbudYNVEvdLHr1Cji1XCSSpT5T+v1NTKaBGkOQ9VP4IYm/XYegEtatgyP57
         gzsK3rKlgbswAcqkCF+4C1zwUfhHRP9L5l41KqegP7Rs0Y8TGQNb2xm372OUtXpLgtj5
         U+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775213074; x=1775817874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qp7jHdTewElQMOorsvsIFbf0ZsK4yvWuAEvmqGviOTw=;
        b=EzV+nY/PPcYytg9hn+9f84eOoEwQ078rPUVa4pwp9wJbVYNuFJFfFdDVk4+3840GNs
         zTjcVUhwOjflE1y2f4jF6iDhs31klGEWvhjxjfOabvK47EhjJjdkvERAWROMYWlKoBp5
         wGnJFU9X7tz+dBrf8M1koOJDkhYrJPZdKJ1ertMh+DpDm/eerZgtiDg3x2XnEHdKMV2C
         30KpbFm5zGI4rBUwB6jyGTUuDd7io2mN9DOVq1wqewZVBRIK0FimDC6dDDcOcAGqa/Dt
         8ihKIBwWjh7Q2FU5WtX39dxAd6Nuwu0x3LssKCtotkb+PO4EZNiIl5gqtA3db8lhIWuJ
         /AHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtWpGmc+x0Gyh8QKtg29NZd/nhJWYoFWXx0VCT5iuyfI2frESZ7yAAhTxb522WI38klubDk4j9RfT8D800@vger.kernel.org
X-Gm-Message-State: AOJu0YzMR17Wcsr+bMmKPqG/p/3IfVB1cuvkvFczQkhArN/BOu27mDbR
	z9kfGcU4gp/j/IE41i96JuLek0M1KsTal970yjuXENKoWUzOXRe18SCibpLYEniAubQxoxwE5Ya
	5qGjcbVRyOCtWS5zxN6mb/RIi4b/18uU2s6iR7eihvCTYj5NvI/eaG8DmR6XWrWlNq17C0OT9a1
	PJ
X-Gm-Gg: AeBDieuH1FoSInJcof1t1rxaAGuJhKa7lOFWuozXRzy2pcMOswd9EoBRHt0/6NR38pf
	F6GvG+J56bBKbkUNUPLOY3Hao1MDPyEDt4HQAwMP2l7oQPJ/bUcyrBhnBpAKoCkPrOD0GFf4Pxg
	x5o8ZKlqizSWolz4t2cn4VG1+hd4f+YArI05gJfAWtwlr94S9/US+WKY/NFWT0NtT4zEy3PR6zB
	YgswyvZ72ocmBU+c0Q+/zKf+7lDX78v6yDfZ1DQUMkT8aDuzdllI/bGJ4iKESMRnExTaGJiP73O
	O5X+j0rV3hAcCP0cm/DNYSav0vcfMClhWq6qMTRc8TKSu6Xhgy9Nn2zJDjcYu/eIZy/kbVZJQq1
	0GcJx2+6CU9SQ5B3G9kqgM41SKOv0U2rigy8PO2jrEud4FOFyeQ==
X-Received: by 2002:a17:903:3c47:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b2817ea307mr18235075ad.7.1775213073987;
        Fri, 03 Apr 2026 03:44:33 -0700 (PDT)
X-Received: by 2002:a17:903:3c47:b0:2ae:54b2:27d9 with SMTP id d9443c01a7336-2b2817ea307mr18234915ad.7.1775213073561;
        Fri, 03 Apr 2026 03:44:33 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d55fsm72340455ad.11.2026.04.03.03.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:44:33 -0700 (PDT)
Message-ID: <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 16:14:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69cf9a12 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JE7w62522NqE47sMXtoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 8CgMjPzMmUrEXEFmYatBRPsecyUwTLGO
X-Proofpoint-GUID: 8CgMjPzMmUrEXEFmYatBRPsecyUwTLGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA5NSBTYWx0ZWRfX3J7IKqBtMVmR
 C8QgUjcWy4hBojEoBckMzjQR/pGrtm52eCCAQe++QVwQu169bEAqvy6i2K96lRIjTvyeINTfQB7
 Hby7qES5tk9xPtka3SRlW/+m3ftj9Yy3NE6mgox2vUmVQ2O06mZeBRqk1LLeN8wzZvRW84PZExp
 hrcn5TXvfTYx6TZdToXume7ew49X6VgYkvvv604+vXb/vQFcO/si3mihUwsvnaVuUVmzG8e+vgW
 XtQ+6yPz4SMDlF0avS0frK7PBayVtdp9uO+njbwQj6AVXHs3GErwJ+U7HJNseIJgvlwnkenSw8g
 xNZYmyz1npkMRPfDBrWmZQIO+KEmQWFi1v3y1admrKZOqnmj/WTtNkI/XrlJu+oCRb3Oc8mQHSc
 Xi+QB3ffPoyU6NNDfJ7dhM1lIPX6f6TY7jrsyfZDKnyPWTkTvKo/QMLsIpQwk61xW6+pF++67s5
 B9fKaIapajtHd6k6OPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101627-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0474A39362D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Dmitry,

On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>> Introduce bindings for the monaco-evk-ac IoT board, which is
>> based on the monaco-ac (QCS8300-AC) SoC variant.
> 
> If it is a different SoC SKU, should it be reflected in the SoC compat
> strings?

Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
-- All IP blocks and bindings remain identical from S/W PoV, Hence
haven't included the SoC SKU in the SoC compat strings.

Hope this is okay ? Your view on this ?

> 
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ca880c105f3b..c76365a89687 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -918,6 +918,7 @@ properties:
>>            - enum:
>>                - arduino,monza
>>                - qcom,monaco-evk
>> +              - qcom,monaco-evk-ac
>>                - qcom,qcs8300-ride
>>            - const: qcom,qcs8300
>>  
>>
>> -- 
>> 2.34.1
>>
> 

Thanks,
Umang

