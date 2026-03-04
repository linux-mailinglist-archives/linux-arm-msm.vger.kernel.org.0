Return-Path: <linux-arm-msm+bounces-95292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA4KAPYUqGkonwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F10F1FED8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FF9B30046B0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471FD3A874D;
	Wed,  4 Mar 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pg6RJo+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZT1GUoa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8A372674
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623026; cv=none; b=E5Qx2FF3NkBEFXtfo1GOjAmnZMXd3WTQbg24iCRRXFbcx8S5XI1xuuhD0P/tVqwESvacziTFeGj19ZY0ykg6tLxtpMUTqeAvBIMvsOKgjbXXDtUj9oJPKDV//AxnUD7jTIeAeKlo2OqY7Oscyj+WpjpE+tdCLU/YQa9HD4dfL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623026; c=relaxed/simple;
	bh=zzFtqBWtH6Dyz1PW4u7LQ+cdDpOkgipEInVKvdMpbps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9wL6ayGZGQ9K6KNn4sXDe1Iu4z3uq8W29OdVod8BoM/OAyF+/37OOtuYPKRMdDeIlavtjdrtU+HKkIi/JllPVjeJA1SY9oDS3iUG7kGWc7z6Qx/iAsa0J89b1Jrw3wzAkwnOA1i0t/hMAmIcPfVvKu9WZ3u7y8Y3wVJw7ddx9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pg6RJo+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZT1GUoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SO9e152520
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJAzlEZvvss30vWHUxUWvbLG0CgV2anuQPFTAryGkzU=; b=pg6RJo+7kdIbLWnc
	w3k2aEf0ZvRr3f0JpVHsRr2A6Qi70uBfld7Ep9rYaVGYOz3jV3jHhHuAvjKlryAd
	tuuQD7b7oB15qLAYT1Kaeqkyi5wMxiLL/Y7Rr8JiRtV48+YHmUpF7xdyg6QAErTH
	EtpHz0ot6K9ouIlzJ9UUC2bgT9O//hCk7ycyfaR+T88z8DFBs/y3BMpheT3ue5hM
	0DXeF0NUDA9ucSsMfYSzvtruUet/voVSGIICYMhlDFSxGHJT50EVccF/PRpDYjiY
	HQMARM9gN3wJUbrQfIXhdT/jmvULbUVeUz49lvq6I+5g4Ceej6mxXi7f0QiQxtmi
	EDSKeg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvkd5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:17:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70ea677571so4083220a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772623024; x=1773227824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJAzlEZvvss30vWHUxUWvbLG0CgV2anuQPFTAryGkzU=;
        b=IZT1GUoaM1yRSyoeL+IdvSyX1BudX/4jwvxXsd8D2eY8RQVLmC7bsdMgpOR5q3G+d/
         vRUlq6Eo06qGCM1fZfkRG56PSleHlhC7grf8+e/8xlONY+c3OHmJs2bigVBCMPS0KEl2
         0Fddw1PvFQk9fEtVwQ8+ChsOqggWcPu2QEk8d0zmiUScPNSd8Jxq0f3RA9qmzx/YXhrq
         S9NLb6iTl0J7hnFSr+LkWQy9a9NCgjgk07bjEgD+xuJOoNur4yZBKAEMl6F7apKSm9nO
         2GQQn+fSWYssfJEaJ+cr9TGQAzWZrnerRMIg3Hw2Hnky5dX96UTKHsqirWJVWjVAlxoC
         gzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623024; x=1773227824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJAzlEZvvss30vWHUxUWvbLG0CgV2anuQPFTAryGkzU=;
        b=IqQx5V1wQb7qULHi5nRre+VVS15bHr4C4CLtMrldj3MG/Q9Cgsc0koODNMoPME2Elb
         5eAixG6yxnxJMNI6bvPGP4ZSDFMnmJ3/gjx9KmmJ6pTUf2AP9LhMQlqjbrCSjgqaBvZO
         mPZtbag2wng2YXwEdytBPH+I+QLEIsO/h6nB3pfzxbK0Bx2TjNOp8btIMW/HrXMJtk9E
         C93oIokhWhZ2goolAhmX+uZlL+6jq0B0yiqUt5y+hjeQ3Z/jZVF0UpyByfZ1lM5VbirV
         CHc8YbWAHKIsu9HBNDB7WqW01ipkaOxKt0rt4h40lD4HXXG7O5LBS5vNh0iaKhkR8Q9b
         DYEg==
X-Forwarded-Encrypted: i=1; AJvYcCWlfGiF/W1Coo0sF9cH7/IYe5RV6CKD6ueeyNP2Vp3+W347k0d7fqbrWIh/JjlHe4CdjrySeqI0PRXqYxCt@vger.kernel.org
X-Gm-Message-State: AOJu0YxdBjMlDAo6lJel4lsYgAsLYT8DL4RhD/hSomTEW3a8n5X3u77u
	4qX0I8UUwiy7cjIy4jXdBXfLRgjJjhx4UKf8MAI+Za1e9WyI617uTumnB9lAYKHJHgos+2Xybrd
	aBpxTDFpQm72fSfARqStD/ZC59y29o/R2YGeox5LDZ9eiBP6taisJB832aE1rXMK2KhO4lJwU/K
	Gc
X-Gm-Gg: ATEYQzxrIjCNRNCFNB4b3+A7ExnHz8xh9Z+YVXlvf5L0jrHIGnTlPpZKaG73XAIiQhD
	P3sMbJtT8spz3LLtSpjoiym8iu/S9Ih1lvKztB5B17FE0z6w609HBin034WvpLeCQhKdoTws+rt
	nfS4o3vap8mQypnkRtpkqWGFIYCi3+3A2M3EM02VOwP5q3LrQQuLRrP8ya+8gNh+r6BM1e6C0+d
	rUm6IaDXAhtUuty7Sm/gdL3RSsijr/s0x8vopHM32LEqVpSd47mtsKyqJcwHdbhzFo/7XuYt+1/
	+q5hKmRprhqWVeNMLJUUTSfgTIPCtnGD+kurvYw3lYPwyuXEI7+rcz38S135FgjvXJftGkOPL9p
	ArmYAZodE6W0gxFHVp34cZ+YJO+SIlNUl1tAQqvm29z2lmEwVqckysXy9PTsNbEe1IQ==
X-Received: by 2002:a17:902:ce8e:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae6aa649dcmr17231115ad.25.1772623023346;
        Wed, 04 Mar 2026 03:17:03 -0800 (PST)
X-Received: by 2002:a17:902:ce8e:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2ae6aa649dcmr17230875ad.25.1772623022848;
        Wed, 04 Mar 2026 03:17:02 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae534088c4sm106087535ad.26.2026.03.04.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:17:02 -0800 (PST)
Message-ID: <0be1b15f-df0a-4ff0-ac97-8aaa46dd9b7c@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 16:46:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
 <20260301-secret-exotic-nightingale-80f55c@quoll>
 <4cf9c98e-767c-44d3-9e71-bcc790e83997@oss.qualcomm.com>
 <edffecfc-ea3a-4c1e-9e72-58c7c134248e@kernel.org>
 <d3de0b25-861a-4261-8d9b-a3785187bfdb@oss.qualcomm.com>
 <6606bdbc-95b0-4adc-92e5-cad70d250cee@kernel.org>
 <33737c4f-b668-418c-ab03-f27ed3b6fcff@oss.qualcomm.com>
 <cc30861f-1e10-41d5-87a7-496e18bd358e@kernel.org>
 <78d08114-d573-42be-9cff-39c228c68848@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <78d08114-d573-42be-9cff-39c228c68848@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4OCBTYWx0ZWRfX+gIjmknPk+AX
 3H5TIGLUP7RbDcmjxdwi6LYA6BiFKnypf50rveGCgrP2EX/t/cbx9u1Lr3r17pFuh1a56PckZZA
 ph6wIPx/t1YhdXy22thwgK3Ttf2/yiw2BWB+6AuHlzmroRBb7W94DS3n0i22qKwIjsazmYY5ZUM
 oizW0yXXfUWkLdgfanmoQGz+WDqtlpn0tVBDc7HG2KJJURKi1A5gtA9JghuYURYg025b2PazZ0K
 HZvhE3IRInS/ltdmRr8VxEPr4j+3I5sXvp/sQ/CM4YxQco+uU6UPxix1/+OdI0uYUc3g0TV/su8
 ONW6TXBR4K3tcnp/3AFlaeuQWhW6nIzSWxDx4fl17xZqM5YQMLbxuXuCyq8/6LxEzJL7h0CsLZj
 n7KJvjy4eLV8LMaLJHX9Tj6PuFpk/gSSRoe8odBDW6FsOR2BhJWP68sNEAcNChTU8+uNk+L8pm8
 kQ2/spB/nqgvViVavqg==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a814b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EiiTORyVyZtV5cGE680A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: qo_7NpVWU7akkfQUtccqmFMw4zRBTzYy
X-Proofpoint-ORIG-GUID: qo_7NpVWU7akkfQUtccqmFMw4zRBTzYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040088
X-Rspamd-Queue-Id: 0F10F1FED8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.131.57.192:email,qualcomm.com:dkim,7b0:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95292-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/3/2026 4:18 PM, Konrad Dybcio wrote:
> On 3/2/26 5:33 PM, Krzysztof Kozlowski wrote:
>> On 02/03/2026 15:56, Konrad Dybcio wrote:
>>> On 3/2/26 3:54 PM, Krzysztof Kozlowski wrote:
>>>> On 02/03/2026 15:10, Konrad Dybcio wrote:
>>>>>> Also not accurate - "sram" is not the reboot reason, which has node name
>>>>>> called "reboot-mode".
>>>>> What I was referring to is:
>>>>>
>>>>> patternProperties:
>>>>>    "^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$":
>>>>>
>>>>> where the 'sram' (not 'smem' as I typo'd above) is obligatory
>>>> I know and sram is not part of "reboot-mode" name. It is "reboot-mode"
>>>> in existing binding and DTS, not "reboot-mode-sram".
>>> In any case, I believe it'd be good to drop that requirement
>> Ah, and one more thing, the syscon-reboot-mode is Linux driver with its
>> own Linux requirements - syscon - so probably not working with sram
>> bindings. That's another reason full binding should be posted and tested
>> - I speculate it simply does not work.
> It won't even probe, we talked about that a long time ago on a similar
> occasion
>
> https://lore.kernel.org/linux-arm-msm/f6b16d1d-3730-46d1-81aa-bfaf09c20754@oss.qualcomm.com/


Sorry, TBH, I'm confused here...

I agree that, DT node should be as simple as below for now until the 
child node is added.

sram@8600000 {
    compatible = "qcom,ipq5332-imem", "mmio-sram";
    reg = <0x08600000 0x14000>;
    no-memory-wc;
};

When I add the child node, it will eventually become like

sram@8600000 {
         compatible = "qcom,ipq5332-imem", "mmio-sram";
         reg = <0 0x08600000 0 0x1c000>;
         ranges = <0 0 0x08600000 0x1c000>;

         no-memory-wc;

         #address-cells = <1>;
         #size-cells = <1>;

         restart_reason: restartreason-sram@7b0 {
                 reg = <0x7b0 0x4>;
         };
};

which seems to be matching with the binding requirements.

and the consumer can reference to this node like

sram = <&restart_reason>;

I'm not following what's being suggested here. Can you please help me to 
understand further on this.


>
> Konrad

