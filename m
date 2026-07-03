Return-Path: <linux-arm-msm+bounces-116184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L8E7FM5gR2qbXQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0046FF6F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:12:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m7WEMdh7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KfgCORDQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B2BB302D0B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49192376BC5;
	Fri,  3 Jul 2026 07:09:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35D938A720
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:09:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062571; cv=none; b=E0pZ29U9Xj6YX4cZKcxETsVCNnLS4TJusuxVyV7N9Vifn+JotLq662pI/FBRvsjZwar3jhjyOSImoSFM1vSfzcPu6qxTm8kcS2QyQrVw++l4gLSFjPtN/ygSd4gR9pBjQkiFXjL3uRpcLgyuxtyuT+UXS/XrurFRo9NkGDG5mo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062571; c=relaxed/simple;
	bh=g68P9A+dHxeL+ip9hbd/hg7B855lI6NTTBSWmJGzM5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khPGU2ku2LaJLVKTlik+fZLqH4ltea6ypTJeyHOwJ/B05SpIIqBZzwICAf9LpfdIdbK4Jh+S7MKI8um20FduIwyca8HNta7WIC4HLDU33EO8o2T0knR0g57vknLru45MRPTwiHOrAKRdmriUWb+UyrYH8VSPsQeij5u9R4A1KVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7WEMdh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfgCORDQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rmU83136311
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=; b=m7WEMdh71Psqfl5n
	7u3F9JF0IqWCcTOWexl6N0VvRfy5oMrOvc/BXkcpiHesjCL4ScP/VvOT+UlU3En6
	awFbxrql5gP2jK+D1nmlz49QZ4/l6UwYMeU5/cO3NbZOD0X7xH/69k6IcrBHZ/Bh
	8IlbLmIOXwy8cY19TnzkI7tecD/acGItQG6quWhy+q9jAdOzjolN0VOBxeENHrp7
	98rvlNpETm6rqijSe/TOfkS5RsUKTANtNzT5UDlua9bkBZNEOYcpGx7U9qCOBoXx
	bVqNiua1i39nlJsiNcT6TlmAG8TQdgqMyio4Eq4dA4JfVmxgFes4EVoxM0fr7EDl
	v8dyWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b59405-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:09:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so1034241cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062568; x=1783667368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=;
        b=KfgCORDQHktzNq4L1ngDUajDOA8mc4bkKDoSAo9W0R8OU/BCL+B3QqCSLnp1ZBAyIw
         8FN/uyTXRZCND9aw5BIpxkle5U8bi4iJAt/69bFvsYRcSGVYPdDH7zdu5d8SrfyVi5hD
         D7cJRbjjiR7KKQojEaaKo5FlyKvO7XNJ19pvV+tA7eVZYDsIKu0qi5mn2Wa/zT6qD4N3
         XRS5yAIZoyOwFjGfGwFzteSe8VnqvaaaIFuWOs2T0a+7EAIo74ctwNrRK+hyO9kE8twk
         vUuK1GmZ0c+wKKBdpJhkuDTJcVA2GNlNkhZPx0WFznvVEg8pNzo8kguHU8nhBCn7MvsY
         xjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062568; x=1783667368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h7txza+udYa7xb1ypArvnZ7qpe+WLyJsm/FYYt7b6A=;
        b=Ugg3SQjSzPB/g8qL4nLUJcGKOuZGTfB2Q5qQUBWQAg8GFsWumpI7LMAPjK8GpWLcl7
         +gUWxlTHjsg17ddhFIe52vvHjEXezvuuzVhzsE0VzLNsyn0jbFi/xI1PEmfkf+7ewAj6
         HdbnZ4jeuu5k28ADBQGB1ivu+BF72FiMQ6uc7Sy+s1PxPIYd2jhxzU0GRgCE1M0HygBI
         EIi7LwLMycb41HJQFZ+PI1lWSaVP/6S/6MuCDhNRXCPC/V2e6bcvD5Dy5qT5BSKArDdV
         WVcy225ALsfyPFhN68/VwxQSrHPihWIkfGkrCLN1F1VU1lYWXmB53ESoxgFmRMgPUAwT
         RWxg==
X-Forwarded-Encrypted: i=1; AFNElJ/L+eaBnNbEor+N40ZaA+TE7oTm1P9VgSyMFjG5Eg6GCP3hPln8umJCDhV7b0Du9mnQFTOmnmS1YsYdIAO0@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJcoddwiDWGTCvtROyVEkZpCNNA9lVhj4YjX9y6j/Gyd9+Kz4
	HiQxGxqN0hmzO3HWp8gtfr12gPNAbDkfh7gGGXh4waYxxlaUI0TYMxrqre4uA/q7psGB1ChlyV1
	7WKUSzfXKbGED5022fOWMJlI30fQCBVEuUYeEeYLhwO3PwhdiEbjoHxdsXCgnHD4sXq0J
X-Gm-Gg: AfdE7ckvz4W2/pKR5FqQ7AiT0NvLky8h5lsfzhn21zkhlXBoL9BTUtjRl6Y1avKqa4u
	vEp2sIh2023vyoIl+2EeMs++ybzz62SY9Hmk64X8lHT9jlNOXqeqkDZkw/HHY7jJVEFmgCPfhFx
	SO/1CxVB/vCnEzFVKDgALyIDuKyOnz/KJI/Vdup9q3OCESTLYRfwwUw9bNBkzPxkchhTa7wh22r
	YqHsoNKPuPets51V0J4676ueUXDN3koDB3URqnkqAxsdfzQuJRVzhUJoS11UTdXqMZDFKmLaKrS
	JUaWgaCrEe0+QMG5cE2SnTaXPqxIPkhRrdkG1jMvuhokVyO7SEq+awEqez9RTYASpHb5Td2kqUE
	eZrCWGwQt0xmkG20WI/smVVDavg4wPt+SERg=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr96521761cf.5.1783062568258;
        Fri, 03 Jul 2026 00:09:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr96521421cf.5.1783062567659;
        Fri, 03 Jul 2026 00:09:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290794sm236901566b.38.2026.07.03.00.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:09:26 -0700 (PDT)
Message-ID: <d35dcc4c-7155-49c5-9283-a66174deadac@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:09:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX55IoaZSr0hoN
 jk83RQpxG/VXbV3yvegxJGeCFnoqUpcNd3hTJPXDHJmBx6zx3lUlEJR/VzNy+w7dDPIDbTd/Zfr
 Wbj+cVQNgq70Qb3WbPedUj+kK7sGp/c=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a476029 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aS16L__B_HUEhUwf3xkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: EHFMtbmD3oQ0uwXwuVXt322n5Fkjdddh
X-Proofpoint-GUID: EHFMtbmD3oQ0uwXwuVXt322n5Fkjdddh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NiBTYWx0ZWRfX5s7n6BtTATBk
 J4VxLMGHSrzAVSLqi2UTadynJa/tH5Mdb1/a9sPFYgZt49iq5r9zv6k8PFIQUpIWZfOCrv/MJ94
 amHKXP+GtwQNzZlvVPdEwWLmwGleGXyfVcFlt9p6E2mp5RPfyAmajkEyqLNQ6gr2eHOkfOcbCDc
 CiRKVs16vttyMgO1qbmOqvOFvSHbdXRj3BxtNos0Gf3eW8Zeo1hte4TaNadQHyGLjriPxn8mgHH
 X18/PHcaCARht+WXRILzTJJIp1o6pLUu4jWTSRow7lx5Xl2Ccp3hQcC1Dqdn5l+0zfIfLSJufZV
 DiZp6Uz5+olYOhbSlVOwxtoW4n8gisgDJ+JBiFOYzVTqetEZ4qkIrly+APCEG/PZK/nnTbK0tuk
 N1mkdL8EKbB8+xAO0cbSTP2+R2v1lBLD7eoHuU0zNJo3i8w5TH0J7P4Gh2r3kMjZRwD+cHWhj7w
 z4Vz79uu5jOeSatgzWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116184-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B0046FF6F8

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with CX rail.
> This is to ensure the genpd performance state votes on GDSC the to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: a2b32096709d ("arm64: dts: qcom: qcm2290: Add display nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


