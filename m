Return-Path: <linux-arm-msm+bounces-101783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePB1CDQ40WnAGgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 18:11:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2E239BB24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 18:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A01E300CE5C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 16:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051903845CB;
	Sat,  4 Apr 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr12GIBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4cKB+YU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1938239D
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775319086; cv=none; b=soemkFGxWg+0fo6u5PnHgjAqywWPlI8h1VWMJaHKms36eQdG3mFbaGByTwh+p2/O4lNKUfON4m6qEqDkwfXEsjJcxi2Ff4WAc2SRqHNoYHqg1Zp/OlzDZ5rYRgSV+IxNd6Y5PNdWWAQKFT2SEomiCfvR4G4MDPYrKnnLmZi1HkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775319086; c=relaxed/simple;
	bh=bW9xYgE9SNH6ll+8xaDZvgD4uirPY/Eg0q7gZgq7iNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIG+KgRXIVglp9dfepwC6RtZnfWo5tB1YlBncfu5n60mibl6HELuuNu8vEHwEwrLTwXGhTjhMtx0Chzko4epuDMzfo/pai+6CBZEyD8jD0ddJuf074XPRpMSJm/Tdg2BsMXYlKMYlZv8819EokM5oks+RbpfQWazR9KjU7HiWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr12GIBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4cKB+YU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340K25k1309852
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 16:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K1vmndmn1HUaJpD6ECwraTYIO6B30j5Udur3h3eAZI0=; b=nr12GIBAkl1TPvto
	03hnhUW4oQyMRO193m2dtwo2YlhzQZd5cI9WyBuZ6MvWJmBU0cQDNVesKM1wJxqJ
	hlGwQ3kDMQyvjPFeRoNKjIhJeZ1xlxWzUJcsdhpW5RjRRJmWl9r/GA9uIAJUUltR
	Xu4+I+m/97DsG4cCy3LV4/09hQkHYbvB0KTgpTIBIkKGntmzc2LZWrtnM+ynHyWl
	9qNHwrZ+uyWmYDsYsV3WwFVkNcrmFGG9WtJV6FH46LZDILWHdXg3p1k1ghY9iBS/
	4pE88iLibQe4ZFzdlanF3VhqEnE2F/qpXhDLqaZVPCbCZwHNOl75DhG+yxkwYsoi
	A5kuww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhbf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 16:11:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso39372095ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775319083; x=1775923883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1vmndmn1HUaJpD6ECwraTYIO6B30j5Udur3h3eAZI0=;
        b=J4cKB+YUZXBXiav4jW9zvgsMME2VsrqtkiHJOryzX9O5XQfEgTY9ZRSb0uhr3OYZAL
         1Q0Y9asaMPZQliQm9R3Keq8HiFk38n0X5HDlMETEWTToPwvxUEX7HrK6BbgJrcvZ5dWC
         DgfE02FO5M/HQS3aorSmtN3/uRp6uEiV++7BBVU6eijdZkqtOpDTC+Ztlz+KjhDWszcr
         gBpS+ovMMVgXnciKuAEsucWlhE3Wf932S3TBs6DvpOWoMai06fYGQkMGla18DU2Xlapb
         edmY5oe2d7CS0i8RADuMorGajKV87A5stOQ4l/oI9ltZ/BjK7iKQJ40vCPHsFakWhWe+
         sOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775319083; x=1775923883;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1vmndmn1HUaJpD6ECwraTYIO6B30j5Udur3h3eAZI0=;
        b=jQc3emOwu8Y5u7NRKNvtj1sRZhO/OvTwRDwzJiqvexYfgwe3YsYv8BY4DK2pSP1c1+
         Ni8bA/H2bGFHBClBQcShOmQ2ZprC6lbiM5HlIxDWXk/jV5Ow5+vVi+yq0NBTklpeyN+2
         yw4sQ+zPnmGsvARaOcGU/sorqyKGNp5zuxThzFsq9Y1SMC/Kl7H1gNaKiPJ/dA9iMv0u
         d/dqO+NIF/dR049E6SKB4ckzVhDc/MAkr3JWygexd6Qpeygwg1tlU1bjJBBSjJHeSaLq
         EvjyZZXZi6eX3zH+5FpDx8S45ZTTnnmxnq3j1yV9shBjbWCH7QrYP52Dv81hGmTX0zWN
         7fVw==
X-Gm-Message-State: AOJu0YwRYtUeXhN6u3sCKt9l6bUv5uaIJ79JfIOKOACOCxTzl21u91uH
	WjXL6xwbvj1n47bCh7R2Yn6MDE6DGH+rs8+MrtvvaoJz0WAkJCQoFAKr/7mT54MWZWPVt43vOtJ
	hEdh3mYT8e01nJrgZcCyrrlo/DkZLrUon9eXcQZf3LZ95zw/Q7nKehfBTX23qe4RqpJQL
X-Gm-Gg: AeBDieucRb2z1JYUXMDscYB5QULAMNrjqp8BVmbtUWcXX0faX9PXg263BiiIfkliTsJ
	ftdBlaX/xMzyekHJtpeg1VBnREewxbQSOIDqUCmP6rrmjYfdm7XatTXu/qOUisk7EVccl0f4W9I
	tOvAsYeFX1UiMcnoDDs1DPRIONydL6j0PbfYOBsBeiVjZqoDahSrOkAZ+3MdGg1QBctB+0fYf9W
	+DwUyIb6J/0mkqKsPjDUglOrAZNeoCFClKyrKjxZSes5wnzhlCamCblQ20axTyX06yWOeLSUJdU
	anQ9FFbc/7wkSnHUIFekBAVzAufOY0aeTsA6bAL+clY0WrslBvCssMd/E11aJrTi9dm6s51tAsD
	Mc2DaD2FUKGo3JMc1g/qJsU20J0MpNdGYEETaRHcGboot5g==
X-Received: by 2002:a17:903:3b87:b0:2b2:539b:d2a0 with SMTP id d9443c01a7336-2b2817d7a3dmr72345575ad.45.1775319083496;
        Sat, 04 Apr 2026 09:11:23 -0700 (PDT)
X-Received: by 2002:a17:903:3b87:b0:2b2:539b:d2a0 with SMTP id d9443c01a7336-2b2817d7a3dmr72345235ad.45.1775319082989;
        Sat, 04 Apr 2026 09:11:22 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b658sm96006835ad.31.2026.04.04.09.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 09:11:22 -0700 (PDT)
Message-ID: <09c50a08-e8d8-49a6-9726-d01829ad96ae@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 21:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
 <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
 <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9mo8nORDC9tsCj6KW3AK4RmC_uN6zapu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE1MiBTYWx0ZWRfX/Kiil6bCNd8j
 vuMKbwD2BrX1b83onqpAlAYAsDmtNdf0CHju1IC7atryq8X4Ukf/0mfKCzlVJWLUvNB2MTQHWXJ
 X5JN4dJVpiw7foQ9w87UYxgNsoTRo7FEdCIp7DN+4oWBSgwNJ7eSeFBRearawHNgjtaEn8CQ2MX
 oPnGsh79jKafr0EhKakgrGa9l6Hxl/1kz/BHx5MkyUU/vVAMqPQHDGChxwNV4Fn2BGze4+l4Bm1
 O9+DDYEC+zSTHpHbq6A3AuMRyzHoqSZjLitbUiqFBfD+Uy5svl/XBJxtf7x80J0xcLo8+Os7TGN
 omyC7OEhZ1TuUWMWb/Vfl2NRJ0PG8BATr0Pvb4ZevE4ycnOiQ9b6S8Z3AoxSmxpLlRG1m+5B42g
 jT2iGakfQq6I4eW2/Y37uw+WHDBg3iPBuyxX+U0raCANyROPAARrhdrV5WhoDYRQmiav/8qC7S9
 gyMhPIx1eeYQy46huhQ==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d1382c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=0mu9dE30S8F/XAQD4H0lhg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d8YLdYc5JhK9K9vzHkMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9mo8nORDC9tsCj6KW3AK4RmC_uN6zapu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101783-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C2E239BB24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/2026 1:50 AM, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 01:39:50AM +0530, Akhil P Oommen wrote:
>> On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>
>>> Enable USB support on Kaanapali MTP variant. Enable USB controller in
>>> device mode till glink node is added.
>>>
>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> +
>>> +&usb {
>>> +	dr_mode = "peripheral";
>>
>> I can see that the usb port in the MTP support 'host' mode too. Should
>> this be 'otg'?
> 
> It's stated in the commit message: OTG requires glink, which is not
> available yet.

If the issue is with switching between host vs device mode, isn't it
more useful to use "host" here? 'Host' mode does work on this device and
I use that to connect an ethernet dongle to ssh.

-Akhil.

> 
> 


