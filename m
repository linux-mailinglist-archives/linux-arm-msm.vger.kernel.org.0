Return-Path: <linux-arm-msm+bounces-112436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EIKBJtRTKWoLVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:08:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10385669167
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="dUWXN/28";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L8e3U612;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112436-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112436-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F79730347F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C50F404BCA;
	Wed, 10 Jun 2026 12:02:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31562403AED
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:02:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092960; cv=none; b=OtpyU0TBrXPv8gMllxPg3cxwEUsJSAmMDyrEixHY4WYv5ZemSLcXK5kDRu/zi1j6UPd/95q3PRBDyEOqu+cDqcPRPdP8wYKYBVXQLrwH2GPqtIYN85P4J1h8oYjRGDm5kOLzsQ17TZkHzB3VkVP+iAIg/KqeGdBW/c0lf418CXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092960; c=relaxed/simple;
	bh=6N+clulkPZ4b+YW1h7cMHtrZN8QWlpzXaaiZ3uRZxwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCOwCBCas6mgOWJaiB4Oz9KogtXXOwNElnEyFNIMP52Qnb8xTLsTC3jRbDVB/o6TXx5zPUwR+oJ9/SmjqU1Wd+wT6SuE5YSEW/H8vR1lqf3RtW7+GPa3mJN2fpvlsn2nmW2zq+Ut1Dg8EcJue7x2YsV/33MZVL3a2K6vsw5oOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUWXN/28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8e3U612; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ABNE5F1447676
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=; b=dUWXN/28H3Gtxug4
	ks41kiAke4JNBhKpMulTZDdrUnKYWHXkPzGTYn1fkasbP/PdAoYD5hX++Xc1kWwZ
	VMauhM3cYii9mZnp4PGhes7AfCoR8jGROnUt/GtpuDSsTm/eIMDDzLu5mtwrgVf3
	jPP+SCpIPoxKKLWeDucqIrr15Vn/9wVJo4VHekjxaYOMbZvJ+FSZc6dJPR9Dnhyv
	LlitetEZNfFG2feFczsldwHOu1lV/EHndPCsVzh8b+1oj6wIuqiMiD6EClifE7Xl
	SoSeMda94TdwCrgjgeuteZlc/LejPc07cqR9JY6GutmOO9K9zvOGCiAp5ivZlcqu
	em2RlA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnntbb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:02:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so3364149a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781092957; x=1781697757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=;
        b=L8e3U612DLvib8hEIzZGEapMpB6gGJ5HquQ8Kbq8k/RN3rtzn6QZsDZkzypFEoN+nx
         V6eWPZ2IPabAlfcYGOF0CrROOUHOGPmmWr+RpzamamwV2r36DLuGT1/C/MP5H2E9XRgK
         SWuPW2vb7RBcxkF16lO/7FHaiUgGAsZRxXqU4XCUTQJfAgyGOPvavQyfM+uqmTf/Z4Hn
         sUw9LakynUpv7ad0BRgMB0cmw9bvhCFwari/OQJOiJ/bwFtvLI5syqloYodwnjmiBJFc
         y8dUC5RYu7vlt64ipCPvw3M38LfVXgJK3TzQ52bWuoQqC7EojOu04vfEM+fqiyrM7JZV
         jjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092957; x=1781697757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol5IR1Aip1z35CTe1ZZdvuNeCl8yaycEOk4X8EMNnRs=;
        b=chus7CoMNjLOj7FxaYaItIxpvGf8vpzwcD/PpBl6T5fmlSNhV6iJXsAGbDEB4Jbqwl
         giXob1ZcsnXQjmB1DZAR73vzgUaXgfy3aqO2mWwcDkUj7GC7qHwd90ckRB09HwcSGDkq
         mE1u3xKtmkzTVLHPtnJyseYqF6OWH9zTkDjadvGjXJiAsZDSB3nEgeTwE2F2wvaPOXdy
         sM4GNfbe59hYutuWWLyVwAYa9QemYyByhP45squGkA+PmyzDkqulj24p9fQwH3pP/XHL
         8P16uE8Uf8WbXEbA10JU8xRDuG6kuQCkyDDaUdJizFDj7l5oTSqNSVaIS9famWjsDH0O
         4QuA==
X-Forwarded-Encrypted: i=1; AFNElJ/oVTDXRYVzQ5qn8NNRjDZwcToYO/PNiwmJuRnwsQW8Ly42w4l/c23EKAOP8oBXMv0WIu+uaN/8SjBcckor@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl1kR+HwqRBz2m8x8jTquTBGwX8REYPCeOUdV9B1NLSYw6CcM/
	i7QqUyRIgJvtwwlMhKhaalrHUsXNYs/5bnho+N5bysRuxLTg+XbP1mft2pVdG6kcY4N/K6f9ixy
	p2ADB0aOcAAV7qvtOCWk/fWaLbto8QRm91R0GEcUgxFZ3+rM0NZAG2dXJ2mgEslcEo9VY
X-Gm-Gg: Acq92OFLjiTRWZ/yclY9uNjG9A35bcriXAqxTcudKSwboHtFMbhoB39rkPklzgPN2m/
	gF7ULIZq5Tm0SRNv6dPY+t07yv7Nz+LXpR8InKGj+3BPnj5Q/XDpIxQbyyh0XYyqSiZSCrcwhUA
	bv39WEQVI0s51603yDwwZnabkDnh4mAPl8VATq+Ro2plJV1KY068H49laq+nPbEybpxRe7qzlmE
	hnnMow06iX+Gucbrm6GnqSk8WIZtngMOD2Fbe480nX3c5+9YZc9p9i9GwOmhVxOPnGA9d2ZhHq/
	zwe+Qi6phkrGICqZZo8vy8iWSXse5Knj/vhR++o9fyOx8W6KmPJcdTMUssm817ot1GRgmK2BtYr
	i5zEEtmDOe6zzEZ03YZWoa2eETLGf0M3YIkRg58QXFJY0QKiUYsL74qMSFkOCzAg=
X-Received: by 2002:a05:6a00:c91:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-842b0feb656mr25453839b3a.46.1781092956747;
        Wed, 10 Jun 2026 05:02:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:c91:b0:842:4327:6cfb with SMTP id d2e1a72fcca58-842b0feb656mr25453772b3a.46.1781092956257;
        Wed, 10 Jun 2026 05:02:36 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221cc3dsm24523372b3a.1.2026.06.10.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:02:35 -0700 (PDT)
Message-ID: <0593ec29-b670-46e6-8eaf-a146e96a719f@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 17:32:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ujf53zya6hes3hkddhsmgu4wyabodnyg3zdwarxmcsoy6p5h3c@ild34ppiyvre>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hM9JSpLwAothdbfcVKOV8v8wDxFElpQq
X-Proofpoint-ORIG-GUID: hM9JSpLwAothdbfcVKOV8v8wDxFElpQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExNCBTYWx0ZWRfX7ERHOeMC5cmr
 eE8uLK7RwWI0xW9NRpdibQbmQHJWP+pOcoLW2QM8UAKUtsdeF0eNDNhNvHiF/Cw3LQPQq7l2SY7
 RyGpKNOST1y771fJN1Je/xjSPbLUjvBwt7OtnorlJeeeSWbh4h4RmWYRcZf5jSx4WeqUcDn5R7a
 YuSSI2baZv6B/EesunAAJmEttwDHdi1MzG0ZkNtWw0/KfOY5rwFRbieqwPINs35JopC8sU3pIpL
 /9/2akwV8GL+99yJyHB75rNzyAeggX5UbEBgOvicb7QNrB/Jj0mFQAt/6pulnL+3upxGI5gm6dg
 nJH0GXr+PfHnER2ezp0WNRngzLv9DKhxEcjKusyJzLyFxfOofjEAXFvBsWDYZ9U7PTRlYD5G5zF
 VXvqr7NM1+sYJLxdEol1ZY7g8K36locLhaNTZyojNajj4AqUam4AZ3iR76CJkABqo7NRE4KzMV3
 p6/Za4ICZngNXz/OIew==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29525e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AQWUehsJRALLLA6uX2EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112436-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10385669167



On 6/9/2026 4:17 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
>> Document Qualcomm PAS remoteproc thermal mitigation properties used for
>> QMI-based throttling.
>>
>> Add:
>> - #cooling-cells (2 or 3)
>> - tmd-names (thermal mitigation device names)
> 
> Describe _why_ you are performing these changes. For example. why do we
> need to handle two different cases for the #cooling-cells?
> 

Thanks Dmitry for review, Ack.

>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml    | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 4607b459131b..0d07a0750762 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -79,6 +79,20 @@ properties:
>>         channels and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  '#cooling-cells':
>> +    description:
>> +      Number of cooling cells; 2 for min/max cooling state and 3 when
>> +      selecting a thermal mitigation device index.
>> +    enum: [2, 3]
>> +
>> +  tmd-names:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description:
>> +      Names of the thermal mitigation devices available in remote processor
>> +      subsystem.
>> +    minItems: 1
>> +    maxItems: 5
> 
> Missing example with these properties.
> 

Thanks, will add example.

>> +
>>     glink-edge:
>>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>       description:
>>
>> -- 
>> 2.34.1
>>
> 


