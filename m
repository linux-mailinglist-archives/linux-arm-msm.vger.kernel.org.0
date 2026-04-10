Return-Path: <linux-arm-msm+bounces-102614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DmNGja32GnnhAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:39:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32D3D4352
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A34C930008B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CC43ACF07;
	Fri, 10 Apr 2026 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alWKGZxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuiETaJL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC2A3AB277
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810352; cv=none; b=p/4qya8+XMwQzp9AjKvVFwxW3AAxgyvwMQxR/4eqT1Ef2B2b2ugEyRGW1bIxzCNCSlVwHcUCbheaSvlKfjtPBbedNnq7DTa8h5MUveNgfqXytVUm7RQmU5uzB9S+g30/ca85xX20b7Bit2eZ8c+oVtbCrw24wa0AnhrTwKirjIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810352; c=relaxed/simple;
	bh=85bLsqNq6J8Yg43xXH2WwToGJpPw7K40P7+3iiOLLOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFQXYzUhJrE+PTwDqW42PH4k46NDHa+s1aoT3pXXzd2K89juwzNWqm7eoWyi4f+DY8HnWBXhSLPRHfGQTxD4G7wN8KElpPcrYCKvgcrdpbC+2YaaXIOPjS3VzZk5Dz+jTDdt5/DCaV3ep7cqhjMQPK6sGHsT9CD3rA2KfhCYQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alWKGZxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuiETaJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A71vE31729917
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=; b=alWKGZxUkjf1lCfj
	4c2KmL5paUVQFq9vBJtjrqqgPLvbOUlkIOo/sUhTqBCZVM+akaim3jzU4SFqoy9l
	oQTlYiUlJH2t/XYN75hC5XNeJ7yXlqn6tMln/pN4iSjrvJzcp+vwDLzk4MrxWu3M
	8dp8mQdrgbiYbd7QzR1AS02EUalYPLAXrKjkU+HsiDxOIyx+yOrSI+K+pETJ2apc
	BOJfSAxsq2AQc+svh+Lqczl6T9NKOZQtjINU9hJmuNwyr0x0PF87pPK5QZxzqvLg
	ZcGdYdFVwbLOrPb83+0oE/93Qr5pAXg4c6gOWbgmCUja1nM6Yw+56H4PCQrvpu2x
	LDIMaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxke80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:39:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aa34663273so5413336d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810350; x=1776415150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=;
        b=GuiETaJL77us/zrF0OHB2tHvrARnEaPoBlKq8xAxqFeIQqZvYU1RquJDCQOYDVSNB3
         ozP6a2TXMwyrmKVHeKW+yluYyTnl21wjrviR9kWS7Cp3ENSWGCLnsTQsOns/s2bdj+Ta
         as20NgC+4g3M/g4QKasJ121Jsgt2sB5HvktCkYH+PUv5C732x/i4OkDEwWrs1fvLSrQo
         rF61Ce5B+rv4Tr1iXKwG2A61DE4/I5SCRN9qoAP+5PJZDyPST832xWvfYSgbwDkdPxOa
         HSwzCJdgAy//PKed7DBgGLeRO4OniFdy3vcUs6Z2fRJJmhvkvRb30OJVvUJV5ricFwwO
         /+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810350; x=1776415150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=;
        b=cjGj2cIy6O37VCu5p10pNUoe82iSoe+K8/JBa6APy5eoOlZYQf0x7cU0MMMBKXFhrq
         nWvuYxOsceWCuo8ZGl7JSW3gMHMcQaY3RI0ToyUaNS1KfSolMO7GK9ZcAN5SRdI6BWRm
         uiKcb3FzbGIMvKhA4vV7nLi6PdQ2T9ajMaAFenvjm/hz2boxvFw7loxR8NfzmOXn9rzy
         BnLg4uiUqUxecFoC2rNhtkgOAM9X3C2KZ/iQYRvvSMAC6IZ+BqUc1j9HtfvsHsg83TmS
         qLnlPTkrcb7nv9kpgVvbMU2o20Hzc0pn9eRmhivLfh/5bdxDm9y4Aos5ObLwsZBU9KQW
         In2g==
X-Forwarded-Encrypted: i=1; AJvYcCXXTOdHIh4RCd5G8G7zssIEm4OeOQfQxnKBVCgEiPfkCuEmnOfC7s8g7BfpxaxyRSuqBKZZmYGBfdqYAE0l@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDwqidHHiRPbBf+ZiWlDQiV0sEpkizP+jWSinpU6dYD9oviwy
	iLwt1iVNSuz2quuIRqTJ3Xcuik1sSNkqet4dW+laWyl8qrX0buqV2xbUTJ1AQBzGZg1N5+N9a0m
	M1XtbiPNUn7NHjg3sioLnUcb+o9P6/WjW6gB/ntvxMfzExP7sXfP4FggimQKWUluIm3o+
X-Gm-Gg: AeBDieumuLhrxG+R2YbL0PlB+5kmREQPGboLn2FATUiZFUH7HNJGV85BXRyVsqcCL1g
	0+u7/lBwkPd0Svl+jyFgNsmqDYh0q+ppIIxVetQ9KiuWHvyj0lquuaFhxZHPhfxzLfIuDXig0K1
	I+ltZGeE3rQ0NVSRgmNxVLwcN3NJgJ1JbE/UCI+RHJwXq9jmg75chulZAJKl4PyjtRyyRm4lEs+
	lOtQAKN8Wimt/mBepw1GiGz7sfrtKZB3i0Ypb9OEPh5MJQqt4I9VAmZIMJ5jv2ZXT6yOAlF1Va7
	ojVk3JLja4WHmKzXwPTWQYA4jVoAiQKWnBCQSUpHAr8r+skBg4n6EJJg/l7enf2Bl1mX31jF/kN
	LCgGR1Ef3HwBYp+QBJTF5ipfx+vdZSpHb8od31yPSHePB1y/MmCJE1mKEHggxeSlP3fVk6H1d9Q
	gRsdQ=
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr19901666d6.4.1775810349599;
        Fri, 10 Apr 2026 01:39:09 -0700 (PDT)
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr19901346d6.4.1775810349190;
        Fri, 10 Apr 2026 01:39:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1e87sm59575766b.61.2026.04.10.01.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:39:08 -0700 (PDT)
Message-ID: <235ebe94-2b28-46aa-a283-bf0647267723@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
 <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MP2P8kBcZfBLh2peXV4keJjwOnHwNpLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX4YaGKDb7miy9
 ze+Jymr53PPc1kJGOVqrzn5FPCLJykVrGOekhxj9i7r4r/QdwAmkuTswERFOfnMYEajvjrfx+c/
 KoGsKww440t100PsKfw9zmT2Bi7uOngrU4F97ai1jIvXwxSn5Jz90gJJBcA9arF66F6yLfJvH2D
 xU9S3DHaxJB8lN9qR8puh5v7KC66+OohxzQzpsmRFLlGyVqPfN14inRH2d2d3DthpBIQp0f5/zG
 uBKf6AFcYHYsLXWg8FJyEBzfCzJCtX4kjEADRlOX/U/1DR66mLoc99cN0e/i0IvDB+BEcw303cS
 fwR9qP7EmE2LpR2CzgcvbA311CW+szduPtg9tfLzUZIX7MPbRY2Wzjvt5qLR4vgGU2mCTzcFr1T
 oehdSgBcGd4Mljqj90H+k2V+ws+u911vbVyc/NuaJbK/UtCQpzL8QdL8NU6gJR8XPdi+MWpKwBU
 qzbLjcYeIIq0tE6DVBQ==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8b72e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: MP2P8kBcZfBLh2peXV4keJjwOnHwNpLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100079
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102614-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D32D3D4352
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 10:17 AM, Luca Weiss wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

