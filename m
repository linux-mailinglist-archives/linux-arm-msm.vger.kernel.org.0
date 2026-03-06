Return-Path: <linux-arm-msm+bounces-95741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCwROnSaqmmbUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:12:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC2321DAC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B09003054201
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AC533D509;
	Fri,  6 Mar 2026 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpeI+n/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ngi/er8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23C133B6E4
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788264; cv=none; b=M/2Za8JHD/J9xj1S+btGbHyP4AX50NnD+K5TIhjyTDF/gmAnJEKs6jIQqUZZZpTsJ05vbdr97J6+bExouDRRPPIpTwWUqd/XeW2NRY+KXJnBtqODHR7UjOF5lu2nghHJqHrH4eBdsDHU9B8J4mYehyY08+JMEptfwT0WELi9+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788264; c=relaxed/simple;
	bh=Yk8SUA+V67eQSwhV75yXkd1h4PLQ/hQF0OPWFK4MC84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHwi4KOgaGbOgxNKig301dckGN+tgFnkm0p8kmNdqMrm+t+q/mQ6FJ5aqb4AKYWFSqphKsiDfUQC/Vt7vX9EIyAKGGuvoI2TLAdUjCRYOKSS0eOW4IyN8cIgqnqyQUuF79AWNWOwYr5089VcT7qWNpXHneIU5NoWqfF19uSvGwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpeI+n/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ngi/er8y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aSNt525917
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJt+sEk9Ph+RtMedPWdMfyZ46IJhMQBZLTxr25P/jBc=; b=LpeI+n/p6rkTn8Xu
	JwdP0/vEh59I3Gr+D8YaNdXYw/cS9N1TMdUIApvbCg0Ps6jvitn5IwyvQFum8rd1
	sHkrvHvo6WMWiBe8mCsPvpxlXwfkOAk8Vv6/aoR33StvdTyrsXPP0eWMSegzTDeW
	YkZTzRjSKvU8sqLm0ZRGkWz+fU5bfJa4jfrlkiDErlqOERU0umX55fKdAXtUj0N3
	lVGc2uD7eZUAlo3LgzfFCO6UQRoY9FyiBiLQGtODmvKjGVrF8b+kwja9abOAolmH
	AJz9CjEWHLGUAG0jjtYLX1hkFYY3apkJFjHgnknbmMmqJo6IIp/LbVcfg6h5DIGo
	c5wjWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dm34k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:11:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so635268885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788261; x=1773393061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJt+sEk9Ph+RtMedPWdMfyZ46IJhMQBZLTxr25P/jBc=;
        b=Ngi/er8yvgCVHE6rtMcf/eaF8GH3jZvke6VYi7vB0On+2jb7JiynTOCjWd/R5/LgFg
         OYDdg0Fz8dQvxmTzP7kAlX0MgWQZFWlQd/jQtGgfTumQkQvtYj3AoIfGEwOaxhd95D74
         qgSMZT44+MsE9F5vTT2KSAf1MtVU3nikqPiznVDU+AI+mlv4saBQhnfcpDrk086pPk6h
         6Js7EEl2UuvY7fXjCBrWVQnBSZf2fGFCCU72pBHITtOzHgFsTkmfA34T1jUUzvT9vFHs
         psRkV33A4F4zvh2hC71fO879QYbJRvzpOk842EOPtLuvdiaHt08j7gJC1E1Xj7LXUF2L
         pt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788261; x=1773393061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJt+sEk9Ph+RtMedPWdMfyZ46IJhMQBZLTxr25P/jBc=;
        b=Js9FjZ7ufjbU4PsG3ul72ArtCSkr+IrRqeiAcwEUs4Q2PY+S1vyUrfEAZOCoKCYUr0
         N6bw+U1lEVIEPNREhqcKqLLkuVGP9TGIeFoiyDUKJo/vkE54rj4ijXFiI7p1oxrMgiao
         EbSqwIDhipx9NVcD5OSqoXlIpy1tHGFqFCP57v8+mp876klUkzDZVT9dwX1dALbp99JD
         tp7/2PQaLatoS2m6EeiRiFSy5OHKO5cDxhxJjtnoQXOijdFG5v8fKJR94wFaQwgbo9+R
         hheGNoqXmfD1DCHuvvsEXIRC4LURz5KdXyllSVk0KlPJeMD/LYfbTO+C8OLK9NdRTj1j
         l5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVJJxv0F8ngCtc8J3+EKlisiCpV4xM2zRu+jteGshnx6oOzt4GMRVsEDev+1+51H7kLlmtJtWb61Ef86C3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+hLmwBlHYrERVl+3f/CZBV3Q+aEkTS/UbYCKFululKFFQm/2t
	QsF0XpEsYpp5uF+aJGcot59nHpsXR1bBW4fxLqoXOYWXtyCceUWUTA6Q9+ngzKCxjy/rSzdE+lA
	jdtyIzQHtlwTD+o8LA6pN4nNuwSLO1FlaU6ByGL3kcs1GKIWqpzN+/bYJMFNna6xrKfcz
X-Gm-Gg: ATEYQzzboIW8vsa/yGDbl4RTc9QN4Stm0QHms7wAPO1JWYIXTAfnbfNF6HJwyUA3m66
	AxyI5ObqJhJzhauW0e6ZBdUNfq9OokTQSKTb5LhCZiJgnxepeGk9lsg/9ru99lImz0P6LnAoDXY
	f8JLu6EHb1pWipnaTB/dezSsA1Z3VhEd8fDeKQMdUU8TFm2QA/FZFmoP76BxKbXAk0ANsx+G9WJ
	VSiCvJcLPrfA5YyID+pbNNwu5AWJEF874Ob5/xZTmUOO7qe+FXCdTRIUEVRiDyoreyVSHeDG2+c
	axHy+Y/5ZQ5ShH0R8k590cVDdon+IP2tABqEfOe1JNoBEG4lesFh0+F8MaCRyRzhmsDTnY6jl0G
	KY4Pdrr9gHEAekcfP6gly+GOUZTcnYZ4KGQUZGw5MfXgUKjAg5e9OViwzRxrO3Crdi//JyJbrNG
	3HRQ8=
X-Received: by 2002:a05:620a:468a:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cd6d371619mr128111585a.4.1772788261026;
        Fri, 06 Mar 2026 01:11:01 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cd6d371619mr128109685a.4.1772788260566;
        Fri, 06 Mar 2026 01:11:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18bb33sm39509366b.65.2026.03.06.01.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 01:10:59 -0800 (PST)
Message-ID: <a1622ab4-d656-4015-9cda-4cee7f3044b2@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:10:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Kaanapali compatible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
 <dd14f8dd-254d-42a8-944d-f667153bea12@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dd14f8dd-254d-42a8-944d-f667153bea12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 10se7jcVBDtu5XNtb2Sm9AbWc4PWfHuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NiBTYWx0ZWRfX0YIwsbK3pK8s
 13UnmUSRjEN31oH8vs0m0felFCUB/szCIr9dTLOjgVwgNslHWbUiNBYCOPVDKho3vpIRp+04fc5
 BDlufa0BX2OZwO5rN7j5aiUWK6TAdNottxiPRLhssaUYFBEq5kOsjNYzJICTTEDaAwrDvtMqEZw
 1kz7gCx9J31of7OLukZNEQjUK0I5e+Wxmu3yhZb6InrU4iC7qt5Tgrm4LnS6lXNOf86f8aaQXa7
 y0LuXLMomMqVqtx2jg2Ufu930jT9nCxALcqZ+4HXCUqzTmRs5MyBvt46fw16rhlM1R5OQeBMveQ
 JKkJt6+IQSwwNcXpWoFz8sxdCSz0BtjjSlM+aF1MPiJub2REvGcc1ZcwOgVlHcwGjp7Rh7KypW1
 OgQOCOzBnbNGMu22T45ngBk13kuayMmZulcafZFNIRPnxllJP1PtIYKMDMDGcpy3mRMWhZ/JYYa
 559R36/YN0ZLcarJu4w==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69aa9a25 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S330QWMK7FQG4XRmxJIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 10se7jcVBDtu5XNtb2Sm9AbWc4PWfHuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060086
X-Rspamd-Queue-Id: ABC2321DAC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95741-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 7:55 AM, Akhil P Oommen wrote:
> On 3/6/2026 12:10 PM, Jingyi Wang wrote:
>> Document compatible string for the QFPROM on Kaanapali platform.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> index 839513d4b499..2ab047f2bb69 100644
>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> @@ -26,6 +26,7 @@ properties:
>>            - qcom,ipq8064-qfprom
>>            - qcom,ipq8074-qfprom
>>            - qcom,ipq9574-qfprom
>> +          - qcom,kaanapali-qfprom
> 
> A question to the maintainers.
> 
> Do we need a new compatible for every chipset? If there are no KMD
> facing differences in the HW, can we use an existing compatible string,
> like sm8750's in this case?
> 
> The fuse definitions (which map to nvmem cells) will obviously differ
> between chipsets, but I am not sure if this alone warrants introducing a
> new compatible string.

This is to prevent the case where it later turns out that QFPROM on 8750
is deeply flawed under certain conditions and needs to have workarounds
applied retroactively (because we're pinky-promise working towards stable
DT ABI)

Konrad

