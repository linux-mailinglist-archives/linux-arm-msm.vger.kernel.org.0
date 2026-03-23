Return-Path: <linux-arm-msm+bounces-99126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO7AL8L9wGmiPQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:45:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144B2EE6D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B4D43020022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB3B3806AC;
	Mon, 23 Mar 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APJSwq1u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EwhBn+1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628393803F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255106; cv=none; b=rKA4Lzr7xP8ljlF6NkLhkUU9B2qcmYYPIgYgI5miibofkfpxntRVTlRiH0lqRFwyopvTlmcIrF3t4Mr02xiNjJwTlQXe8IarIjgqJqbG/bEnKXCNsbHhWLFQg/y8fca93b+YvXvxNdt12waFMUr7HRV45TW9fefX+9j7GTpRYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255106; c=relaxed/simple;
	bh=/CizHBs+48HR9Bpy+4cG6rCTqs9+hHJMwuADdVBpBlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rZ2XGJHHAnF1CYxTN1QgxTB/bqoxVq9JYWcPWe50lGSLbCjR2z5gQEHchkUT5HsqgV2WB9FayRpMqSKES3GyED/p33KPwRImp9gI2+EHpoUzqyNKppXItXXtWxzM/LDF46pCSaHIKHhOvSQ2HJhuZPbURHDz5zekyRkNmRVIKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APJSwq1u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EwhBn+1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7D8li1317414
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xg8hyRHRkRjL+PNMC+oO/Qq2DuuavEACOcAZ/U85vZU=; b=APJSwq1uXr7FWU4G
	Nd/U5UD/CoazG0b28cCgqgsXEXe0gmqulWOlzYeSl6V6V0T661/hZ4//Ri+Pn8yO
	F9kEeYlf5wzYxaxVCee1TmLGBSWp/e+6MJl9Fs2OnaWiaq7vaK+5a7unXd7IuY/3
	t1xPRDqQJrEdj3D5CyNj+Fds4lZKXHf//ZB7sQBHeTXYOdYV+9rKjfGpZR3iZNei
	gGnd0BPBvuhghClxh/zFdzmaRpMFUGLnWm0R4F2NYfXGxvGFHZr5BUE6ZTmhytPY
	1sXik5X6V8pfcVGXK1GKJOaQ7i+3wF3bs4dmNepUyRdeMCEe6TWC7Oegoh/ro6H2
	B7zxCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghccwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:38:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509219f94b0so3601521cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774255103; x=1774859903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xg8hyRHRkRjL+PNMC+oO/Qq2DuuavEACOcAZ/U85vZU=;
        b=EwhBn+1CZJA2mPvrCRHcUnmS6ZK7YvvE9M8PoVV9DNus8s0/tRMFwzo8VM6ZKLfAIE
         jYgh3Dsger0ZPme8O3BqqF3afrdMdy3xUaJRaUUYFBVW3Pl7mv9+Ab9dty9zcFzPnn1n
         flN9RerzuokakcvA9RugGqrHk8Iy7R+V6Ly9wqBj9Gk+LkxNIn/uLp2/U3SFJxdQISNX
         TB99OxzUWBlV3XIYshF71JhA4gPAR/uaWJq3OyVVjoUT8crNNrnByuCxtygWL8X7ylFO
         Cl4RDXcRy+xouzSPHdhwLK7YOoRbOfPiE8MNh5f/knebTunJAdWhMi02DX/f5jZIxGJm
         jTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255103; x=1774859903;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xg8hyRHRkRjL+PNMC+oO/Qq2DuuavEACOcAZ/U85vZU=;
        b=YpkQHb7nS8fP+IAuw9xVQJ0iO+/fDXgNkynT6NyeaYC3FIEFTCk9uHfLp97AbwyCru
         46l3uJIvjJDCT2G7YMr21LwnX1+6uzHh1KORqd8BnCj3sQBPP5aHEAOf69sqa5eXtjPs
         3yzSrmExdJUnKuzJmpoP6Y3eDtLD889xXYosFSCYZNT17ZDN1qJ7tHrh7iq+xYfwNWRX
         1cfW9oTpZREKCZeeu+aQkVzvevntd6ic0fzgZo18BUjt853hJuWcVyqvxUs2YJIXU0ML
         l+qSXGnv1IQsh/rNUCl5PKzfVv7agzBVoOJiMgBDDjl7Xx4+Kx/6ugFwKNKT+78VlfvH
         4ixw==
X-Forwarded-Encrypted: i=1; AJvYcCUKemObjvDW17VrBtMO+owgT1DIMXKOqKX+ypMUg2a3EmoSjrQS2PcvO7IdXKNRCDb1vElGPwFTD7mdf2RW@vger.kernel.org
X-Gm-Message-State: AOJu0YzbvCNc4xJsKYlvue49KCxbq9Uc8toMj3s8ippbRhUSvkxvEki9
	I+KGwnI+R9xRS+Nj6jbc5WCX6KxPQdm8dZGmL2TSbJLFFZsQzlEF1Msvzmm5plgPTtIe8l4tMET
	/X0e6qu2AZmk5+xTOu5SvdpY3vEOnPChwgpt6TatnMRtgIA47iLqdQoLRLqSX5oaifqy+
X-Gm-Gg: ATEYQzw5u7/1V08tywoIPkoPSCsAY1jTVGe7XtbJcf5oqp92IsLS1ioWlt8l6bGBmgR
	EaI14QQ/HylGHQjIWShiO1UhEFnW53MCl8EAjCSTaL7awLQjLTRmqTQ9r/h7UijpsA1JHcqkyHS
	a+OqXK6ZDt7sK9S4Ka8e8RoSBBJCgWeAaoPnVylt4M3wKTHIyK0UW1hphiylZ1/uqC+2ubpPvLE
	NBdK82hIhERu8qqd22OHqFSnja2ZC3TXkGydYyF5riPM2EvW0RmCVGk+cL50pgeOWIJXZYh69HF
	nlnvaw+xRjHr4J21trPB5gWWegM4tfGdVQVSApXofL6wPrqNNQjWHBYtiH+q48zpbmNgcJuC8pQ
	qzPdb2NZQAlBo0yUUUbVsJICGynmJ+Dx5YaiG6uQMvn4huTtd
X-Received: by 2002:ac8:5a92:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50b6a488092mr1611901cf.43.1774255102720;
        Mon, 23 Mar 2026 01:38:22 -0700 (PDT)
X-Received: by 2002:ac8:5a92:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50b6a488092mr1611571cf.43.1774255102288;
        Mon, 23 Mar 2026 01:38:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe867e41sm79907515e9.4.2026.03.23.01.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:38:21 -0700 (PDT)
Message-ID: <f446a678-f575-4fdb-9768-a8fccbab7a38@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:38:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Drop stale child node
 comment
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319091709.20981-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260319091709.20981-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c0fbff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wlOBKQqFgzLDUkauGyEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ydq-tjLOvVCBJWO0dalLOAOJCAIvrYtf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2NSBTYWx0ZWRfX9iajeuw3Sf/j
 /PIX/hlQ3oTK174/3a3BAEDljMvmfiyEddHCQgn+1/++mrZacC7fBNNa1QKxCbLU37R5nNboZNR
 csSOTFW7lEfHqyuUeyBTTMKwtous6QFTDHFnZlc6IpJKlFahl+BLNXFbrc9u3ymgsy/5XVM3bL0
 lUrNTK79pRMTFZ1YnfboL0A9sswl2aXg75K369oUf40Sw8OwAbEVUabazPafcFcazpc1stxL2Lc
 xY8uErrlen95BVcZUgGcOamy6yz0URhQKSGA1u2HXuglZ6VcAhPJ/ithy7jH5+39OsNgO0+Q4t3
 Gcvo7IOq2OBlA0bk0tEmNnHoi6fdnsjOGKva5fHaqCHjl50MmgMqZmGUZ+zuzKghOp4u2LPHFNM
 Xcehr22XLg2zrLF0BN/NCkPyJQxWujuXTTwD3ZBoovZ6Cxk8EVq5fZyune7fWsnG2c43V3rIALA
 bGeyTNvCYt2VlOEalDw==
X-Proofpoint-GUID: ydq-tjLOvVCBJWO0dalLOAOJCAIvrYtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230065
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99126-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2144B2EE6D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 10:17, Krzysztof Kozlowski wrote:
> After moving the binding to style with combined wrapper+device (so one
> node) there is no child node required.  Drop the stale comment about it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 --
>  1 file changed, 2 deletions(-)


There will be a v2 of this.

Best regards,
Krzysztof

