Return-Path: <linux-arm-msm+bounces-107752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKROJrPmBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:26:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C20C54C60D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 937A03035BFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662B1426D20;
	Fri, 15 May 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NB1iufjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0mwwwz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6842DFFF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836517; cv=none; b=slqwSJqWg+EjZoetSabVgA4O8JK+Ua0xWhh9kk9cChaSnsuaZ94Pl++39ihijm+J+YcTWiMBScefIarAnV//EIwU1Xg1ehktHkYG0RgcSG//442pHoICmhfvfO+p34OD/Is7+psXaCtB5yzy5IyhuKMLHTXm7GR+8Vk9pp9XTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836517; c=relaxed/simple;
	bh=NefE/0kJbsphrvHNNstIdOu1bVoutl8ZbcpsZB2T93w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUUyBoJc5/vJocMT7Z65jeuHtXLjH/D0qBizQ9C34eKljMs1C6UqPxIP9NXYiub6FuIKR4grplxVvuBkCRaxLOc7w+tPaNKqtNOscFrXftMQE39J/JaVJw0EUgcHVVRrVfVhuoh70YB+hAX3439wTJUHeZloZnZ+PcNeGwwte34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NB1iufjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0mwwwz8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F58UYS3200281
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DricSgktW3Hs5pfjuBgwQwCFVfVZNp5DndSxnqXR+jY=; b=NB1iufjrr56CLtmU
	DW6hKq1muFQJq45D1cO9UrcRZsUHxAs/FVzYihVHZZiMLiPNZTvEAe5gMGUViQvs
	NBFEcvtiGeVPQqtHeTku0kG3huflZWmOJkK93fldYlXZXlHgDJ2t8B2C2wNCSFaa
	4ZPVWMXrIv/NOKphe3BQVAzfSUIi5mjlSDXnKx+SfgLSvh8odO8iA39QRyV8HIUq
	/bNWkF6lH68T6AKT7no45pEaj0GxRl1sdy8pXfNUI4ZhTWrdL4EB95ZUF72MH82l
	Kt8OR+nWxcZyZgIkEUni4Dk3VbP+cwQm6pXpcfnfxNMAbnNMaR/k1I/5nAHxZtH0
	DD9QRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qthm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:15:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so8815625ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836513; x=1779441313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DricSgktW3Hs5pfjuBgwQwCFVfVZNp5DndSxnqXR+jY=;
        b=Z0mwwwz87gqeTXQNoMzGL0VTCjOryRiZNvJom4QVahBKJeEWE+0PeYYh9GDTGN3s7q
         ntzJWDrovyjFnKkkr/n0LHvT21z1wElARiXLeSYeXKAUp4/4Gxdblbfhn1MUvOtElFNe
         lTXVnsu/GuKW8OVivXgvTu2naGw2Z/mp07ame60RTxEmYU/pbVhkHZDqceHZHlzvGgKe
         8bWBywwf9SIN322U0BQ+D9GkEJsr0ox1/KuG7TdgKdIzTFl5jbDGCXgkxfgt1F35BgWW
         /5GTsNcj/UjB3qNmMhGSkfyLZkT8VQ7nnJToqD3gKbjx+PfTIPl4j8WoZm99LIv+sg/u
         yJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836513; x=1779441313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DricSgktW3Hs5pfjuBgwQwCFVfVZNp5DndSxnqXR+jY=;
        b=GdfaaZTecL9D+4ZcXLNkfW54EAlWlsLlmzByHCv/22Y9FXkRQorCCJcx/n28mc80SP
         rm4g4AKKqBl/s57AIXYRmrDavIYX5cdsKgXDZxwDqbYfIe1d3i5hq2p/kCaRTfu1mmcc
         TOy0eUoEsfhiGdwZTKN3+BASlH6zTjYfLXsuqpwDZm+m/UoF9jtvVwhdz/FGpDp8dw6t
         kMhgmwxMqE75BIRrsGQa1EItl2TmdTrElwlx2HiKDGT5GXrcDnpmD/gDjIJt8Qxk0XxP
         o72HLJJy6WnLcMxJiwxa1wlJVDRusWthO1X4Sr57ujxS06/1KlG5N3xoeow4G2/slnSj
         +kxA==
X-Forwarded-Encrypted: i=1; AFNElJ95GurTLGXlKmAMHf5ZbqQ5opGEFSAtFn6KvgCG6K3awmxYsbwhxgV6eGLygmKPQjrJ6As3wYiXk3D0ggsL@vger.kernel.org
X-Gm-Message-State: AOJu0YyXyIlRBb2GjUwVaL4T2zA4YWD8qiVWBwzuZaxAV1ttDYPgXuGS
	v266k2Ew1D5PvqzTZc62BVQkfoN+3PHkfm595WQhg2h3oNrlC6ummhisI73JurLWeEcFPxpXgO2
	IXgqRJQoS7HJY/AIszQMOHmgY/l2tAYb2c2AQbweH6mJu+D2E9cHsT6b41f5lUzcrGghB
X-Gm-Gg: Acq92OHrL3YvloJSveysXneJwzrzGcu7hIuMebz2pc5ivGUAQvkoEvS7lcAlacf3cKe
	VgyhcSEmQhY+8pSwGlJVUCW8nfNIW7GapcuUFIqPx6OmiZRzaqJfSBY/Vv4g+6VWIn27cxVHoal
	UR+tnaIkRjPtVV1O6+OxMRlP6Te/G69quHUWin3W4RwD8wSmAKgNnWDdjJ/QkMPjZgPLIv+f7xm
	jiIQC0dBXN7bcdBYu379PLGz9lcif2wkc6ZzVzId4qRyBkdi9XFTZGIgWsdp+QZSQNrTPPhEK2x
	pXwj+1WxmEPwbVXqEyUazrk1SUZIz8Lrj6VHWglkgUO6Pl9yHLka0m3Po5AcRd9Ansr6A0j84tp
	aL/e340xxBvqxHq1fR/8Se+YpZpYNixzYEPQYkKR5CELcLPMmKDPAtkFsiemnONpmPg==
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr48358905ad.14.1778836513363;
        Fri, 15 May 2026 02:15:13 -0700 (PDT)
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr48358635ad.14.1778836512834;
        Fri, 15 May 2026 02:15:12 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm54607235ad.28.2026.05.15.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:15:12 -0700 (PDT)
Message-ID: <adc65162-c0fd-4eb6-a2a5-bd0d04e7ad7b@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:45:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR
 block
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-ipq9650_tcsr_binding-v1-1-a41f612da54a@oss.qualcomm.com>
 <20260515-flawless-space-groundhog-0fcfaf@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260515-flawless-space-groundhog-0fcfaf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a06e422 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Z6vG9Vk2bhGQ9zti1q0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: M0uwvXFbRNW1TVN0M6zsFGEvCJHBHnxp
X-Proofpoint-ORIG-GUID: M0uwvXFbRNW1TVN0M6zsFGEvCJHBHnxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MiBTYWx0ZWRfX6nPkp3x2iiKe
 jwlnJ6l1Q6f2T9heqzjdw19HNE6hsmxN1Z+zyTFzRVE7Rk/EK2+VPO4HiOVX4JQfcfXl15GsLQt
 JKYqMXTQAXMUyR/OsIURoeB92EtiHQCY3fgNgu/o3gn/vS+NG1yBSTTcGkPZNS/1UTNypsxX/hD
 eBOoCP6bSrV4LOLmuUuc9iqXtbOpmSHWnsQ03hCv3it16Mc+cNXCGHqSWN9pO9Yfth1bPP40g4k
 017J2CFzVApsDNaS+PKaz2FzfoCc6yPgrX7papNv+yaxyTTNJl4Xgv2TRPmSLOLdm5GU9kUHgkF
 dQSW7FsAM2svtxqH6cTsFC/B/vQb3AtNVcXjOYSnG9IJPcGtcLz8kyj8vLXUzt8PgOObtUzsBVl
 4Zyk4Rid2Yj4KJcbf2WQN8feyDrgwHpI7Z2cHNHL+GXBRROto14OpRO3Y5IxCqYFJkFZdCNRDrZ
 oR2qSlRLH1wpTP7yo3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150092
X-Rspamd-Queue-Id: 3C20C54C60D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107752-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/15/2026 1:52 PM, Krzysztof Kozlowski wrote:
> On Mon, May 11, 2026 at 10:28:04PM +0530, Kathiravan Thirumoorthy wrote:
>> Document the TCSR block found on the Qualcomm's IPQ9650 SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
> NAK, I said it way too many times. You just sent COMPLETELY separately
> IPQ5210 and on the same day, completely separately this patch.
>
> I gave this feedback publicly and internally to Qualcomm already
> multiple times.
>
> NAK

Apologies. I should have sent both IPQ9650 and IPQ5210 bindings 
together. Will take care of this.

>
> Best regards,
> Krzysztof
>

