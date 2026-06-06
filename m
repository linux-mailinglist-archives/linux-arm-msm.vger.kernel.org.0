Return-Path: <linux-arm-msm+bounces-111537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0WjvC5yJJGoq8gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:57:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F664E5AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 22:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bWfiWDrM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lk9Ou7el;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47267301A387
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 20:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7433BFE5D;
	Sat,  6 Jun 2026 20:56:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A93B42F3
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 20:56:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779394; cv=none; b=p4wkwEBaTLxJpSLCv8uzeF6QM/DSSejL12ViFOPApHnujpfAdid0GoRSMlEApdtsezR9+LEMEcfDoMBCMdZimuw/C1n925dKyCOmMItw3jgfyIr8xncw1JEheP1hmL9NL6DWswo1xml9BHNdAcvnMU4y3D4x8mgLbcjpmU5MCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779394; c=relaxed/simple;
	bh=vy78W//SRtt7ax22hJTO3Yi3mnrdE5br07hh8/x6/U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDTIuC/Z/7jBt0XmcOWEHr7rVs++kicojuESeMea4DsOQNcfriUfNTeM2Mq2y70r9jXWYqOPNTjPdyeKDAa8ULpH1FY9FaBZ8WIysKPIj2Hn3PYL/N5CFIk4cVknTtQGDJ6TTMQPYoy7IWDATkOkji+v6fw17IU5MId8Ysq0GgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWfiWDrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lk9Ou7el; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656KnoO82847825
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 20:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJf6VxqlRqIaoomMLbPEONsAHBXuZjssJS33E0d0eeY=; b=bWfiWDrMkIWF242M
	+9p/OjT0GACmMbgnBTJ7kJ1yvBpnd7HSNLmIReEPThOZitm32mX9659BHir1kt2j
	t4DyEQPeJf5xCU09e5fuc7ezL1OZ5aiPpiGkS5Nj8P3HEiSWOAQOQLjkoGkF1+U2
	pduime/3pael9tVnEK7Ppp9xS4UC8sUJMH7ub6UUvZOaTyod3h9Al6C9UsBDsrpy
	dcqUS1CwbgQbOYxm1kwnQGohLHCixpQZWZQ4dwnGDeI63c98ichPzWL42+qei8oH
	u3OeB2+g5TE3EeJRLc+cQ7Xgw/arL3TBfJS9YNyp21+TBIlpnBcCUWPBXJ9zxA+6
	8GOBEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf2dh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 20:56:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so29113725ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 13:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780779391; x=1781384191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJf6VxqlRqIaoomMLbPEONsAHBXuZjssJS33E0d0eeY=;
        b=Lk9Ou7ellgi9z5DCq36Q/WROcw/0BqCREz7k5+mG8orfKXNSVu+jNOqGZlM73t2O3a
         AV8cgK7F/E8hx9pDjw6rQN+Mw6KCEuD19kBzOcGi9qlXuzS6QXbLUxGYIkCv0Y6TrMoH
         952QFXrOcIv6sjuRUVJx1QNutARF07eQfJOlqgjVzYN1yhb/gmzpeC/PJSlUZYq7BC9Q
         kabx27smcdd9FLQXH6c48nbY2RyL84mmeoXJfVya2y5ftEd72jOPAJUxvYsydYP0uHrK
         c2cwKyHT5c+MR2RTIXlUYNFpHu7G81P37TQgidbfLtWBKWZllCilpGPAX4KY/sjIOdeB
         v2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779391; x=1781384191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJf6VxqlRqIaoomMLbPEONsAHBXuZjssJS33E0d0eeY=;
        b=ak8Q6Fh6txbDE7cDaRY2MCbGlIkGBExY6VYWQiupP/uUIwT65Nm3ruc3WRwWVhvz46
         Mpha6dqTa5gDkFvenG1YaXacmXmjA6aqp35/lqF2m/ux/58T8XsFAvKkV3wNesfY4SeJ
         KWeKmmHzwCRnjnxk7j5iGgQYXi/EJrdb7aYnHYO8230lDY/87IedH3LTRzkQ9eC2GVwZ
         8E2pMa/H06Hk5feuMCVN1LMOQjbwGIJJHz26SwgPg/qST/VZnulL8Y2p3ATm+/MhKB01
         FALfWONSqbvN2hPTT5KCSvXwnpvflN6TNsetlP2k4RVzAHx+SCuhvTjd6mqhhKIivcmj
         iFTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LLZeXn7c1cuzJe1PElz7PbjnimUPUsQe0kZSSxaDd3FczJiKvesFC5WNAwehoXGx2iwpJrIvwLbxEeAPK@vger.kernel.org
X-Gm-Message-State: AOJu0YzkplHj63qepCaLT3kqfgrr4ZFxUWwpa8JqjAlAobon2oeWFMJk
	P6jdGmupH4qb12y/KZZYtdLym7rrS2VK8P0jabzSOeEE5mst1dnKsGsVS2Zu3qsQVlcsKsJ5agV
	mb7aCGQfMSvL9hHWrsOI3SNRw0sVAsL8EGk7Hf8hxKsqRvwLeZPo3CigTT/eVJzF465La
X-Gm-Gg: Acq92OHHG2Tw07m3I03Mkkj9gMXe6QILbQYnOLPHA6r6uGoV0OO5sQ7Y3h+VF+3n9ZB
	GtwZ1TRNKPuSc9cV73NmEuhb1w4vATVT27kldi2OF6WVanBMmj14Pd5U4pFpel22FSWQAh2KHQH
	1myJkyOcaKlQ3gla2qOnzhYPRG52EmaWQ2jo3xOb8p9JLUpiOborotA6b2zlQp+nZ8MqSXfKh0D
	51SjPc01Z04ulkYX1Jpx7BD66nAzdF3FSAHttw5vYTK0f5dodDIpufuhk3/PKUYZr4/XYrMWFxV
	EYfSPKh7VXesOuo19LnuqPepOU1GvqG6YAo4fXUCPWzltOfUxg9P2QB0kD0QJEVMLmzQIzIjRKb
	NVppySJV7dvhf5UkN6BG/QKAIIrmIVB+9MKJE35XMI0qKy0jG9LoudG/h+DDZMug=
X-Received: by 2002:a17:903:19e8:b0:2c0:bb2d:a30b with SMTP id d9443c01a7336-2c1e893e978mr99638895ad.32.1780779390796;
        Sat, 06 Jun 2026 13:56:30 -0700 (PDT)
X-Received: by 2002:a17:903:19e8:b0:2c0:bb2d:a30b with SMTP id d9443c01a7336-2c1e893e978mr99638565ad.32.1780779390329;
        Sat, 06 Jun 2026 13:56:30 -0700 (PDT)
Received: from [192.168.1.8] ([223.190.87.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e2d7sm135379395ad.39.2026.06.06.13.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:56:29 -0700 (PDT)
Message-ID: <14fbf0ac-c5cd-46b3-a42e-8cd2ccd622f5@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 02:26:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260521-shikra_crypto_changse-v1-0-0154cc9cc0de@oss.qualcomm.com>
 <20260521-shikra_crypto_changse-v1-1-0154cc9cc0de@oss.qualcomm.com>
 <20260530-amphibian-mindful-saiga-ffa982@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260530-amphibian-mindful-saiga-ffa982@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a24897f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hwwt4TTrG29xD97kRhuzDQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hQ3fLCEdGXPuY6oLI0YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: fBiSLFO4ULOE2kKzCbjq7_gHxx7L_VPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxNSBTYWx0ZWRfX+sH9sLmG/d4Q
 CmXx+MJXs6S6GOjJBFSC/ixV4wrWxICIGH+mX8idaEWuntZHJDrYiPExcYpfJge9uK7Crmo1T+3
 hTPw6H73c5q8z6/R/09OtXudfVGa+8euucYzJI2YXj4C5APr/h7+fXAujC+1CJsGMoe5Jjkr5A3
 EawgQ5BtnhscMo4Q4b2DkusH2EE/FkHn+Q52jOlPFkyG8nxE8xGaQOcooaWP5vrwFgGG8BJj1eP
 mpr79NWA1kiuWuJB5dtaKEcdS8hZ9nH3cilOp1UwA6hgwonpWlALUJT6f3EDqjgOAAjB5zEbN3r
 yeWboDf4RP1RxYbrhnMUXMtf5O/CTwVoIwAzsM/+zZJuUI24GFLj+iYaPG7nmmR64M43lxj2f10
 lDq1jAM7RZZnnOVXYaToVSYGTVUr/ANfLejHa2JW6eA1kJOkZfyDKsC8C80AbWYEBxhrGMuz92T
 NXqwJJHPEqi9MV0LrQA==
X-Proofpoint-GUID: fBiSLFO4ULOE2kKzCbjq7_gHxx7L_VPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111537-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:thara.gopinath@gmail.com,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC1F664E5AA

On 30-05-2026 16:08, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 06:47:08PM +0530, Kuldeep Singh wrote:
>> Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Missing constraints for clocks.

Sorry for delayed response as i was afk.

I think you mean to update shikra here for clocks.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml#n57

I've an alternate suggestion for this list.
Let me send patch for same.

> That's also v3, not v1.
As per previous suggestion, I clubbed all crypto modules together and
sent them as one series. v3 is only for ice whereas rng/qce are still
v2. That's why i kept new series to avoid this confusion.
Kindly check cover letter for more.

-- 
Regards
Kuldeep


