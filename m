Return-Path: <linux-arm-msm+bounces-93059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOJIEKEblGn0/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:41:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A801493EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD69430028FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D942D2381;
	Tue, 17 Feb 2026 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYU22juG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NECLUs0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676D23C4F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314075; cv=none; b=IlKo5+qkkZqzwTKXH3Bvj9+sbOSdtekzF/Dq/NGposPtTkt0yf4eU4exu1bDNk7Q/xO5BKqukNq8smzdWjx+5xzig//rLxCwjjlSTPhqQ4m7prZ/glY5/SBvQZ5aJlKCJzJ+nbOnWXIQG8pxfT9F5R3QB1O+bXKyKwJMtiqVfXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314075; c=relaxed/simple;
	bh=/gC+8O0Ta/JGs14mGk4zJ9tMSLuy2XCPq22nfMdC8Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTPnzYAPdvcZWqzBwJIgnrditvhbp27z/bWrv3KboWKrGwEDHkEX1NDIYNYQuViF+UdK0NN5sM/Zs1UWGROEHmBdNP+HMxoqGD+hwip1DKuwYPTzBg1fSNMhm0snUzHQaNLJjzMh7xAi+967Ws52CC6yDWHuYYV9XnP/7kilLOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYU22juG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NECLUs0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4EUt1544897
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKhJoOuZx2FucQUbomIoWiNWGak8XORahFbx6/jtBDI=; b=TYU22juG1gy4IgnM
	VXI7Eb31xt2QnwD5Xs+IsYs3Y1c7VNGk4Dgnh4e3mDRvmcps9hRLYKyErQUn9xHx
	5oqQ52+oyQyTykv4svGBgjiLDp7Qzh6wHSbz5noe5mTqWfqtXRNic2/GfazpLY8Z
	Tj6Rg/j4iSia8Q4vsh+IXwPEvOYx9w9CNiCS+MUaoK12wIT45qf4DiCFs1eCPSmZ
	MfOuHOunV/NK0oni6F0fzA6VN2ajdWwWwzK7XR1l5tXugxV1Fua6q9N17JJsdjTl
	K492TQkIONLhX76/nnnY06YJFdmXnw/rlcuzyMzumBH40cJjYw02vZC/DQ/fksbJ
	nSsDaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsd3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:41:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354e7e705e3so3208815a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314073; x=1771918873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKhJoOuZx2FucQUbomIoWiNWGak8XORahFbx6/jtBDI=;
        b=NECLUs0KELDLSsx0HlXt9hJl/AG+crHBfk8WJ36Zavz/5yKcWj2Nq34jwTBZZizM0e
         IaVIAMalMqFL/A7ohhqXcX5yQ0U/Bm6TdEm5t1xKSfbc9E7321SISUug9GVgPBCC4aKH
         t42TWSUef6XOxNL5ZeGwLbcCi9LyEkEuiZ8YrRTeulhiFji8VwGATnUpUuHpfH8698LI
         ahGwaQL4doBvjgYTeGe073nFaIFyDq+PTT2Ddbykjwr49znNpA0k6qsTZ7S7FWeySuxJ
         u9w/ILLzEEqh0n/geAoKhXJjYB3IhSBTWqeWkpZUjWyDxA6IebzoJQbaW3oQ27wMtbQk
         bfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314073; x=1771918873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKhJoOuZx2FucQUbomIoWiNWGak8XORahFbx6/jtBDI=;
        b=Yu+gbk1TgmwQJxqwgVfQYb2yi4gFc5y19My/bVPDOIgtJwetMJyXQMO13bzfBjmuB1
         f3CFUMeuKhRse151/EpVBgbVjzW6B1eG97wSPzyBHc0Zm6ckYU8XmuSCWwKXCPig9ncD
         EM21hur9KhCVl1BTYkwFkXlBA0ChNwUDKhlfYDI9WuKVOC6vrKX7h21hFVTqVKQC1SAV
         vWp6CadJ+XteczT1wt5n2KUqiI7c33PWT17QX84YpRewLv8BTeHEWJv4MyyGhIV+HNI+
         A3eQv8yQYOdpB+spUM3F4dqxa/hDPXId8611F+24k1vT/1//rLVDo3alBHH+eUCexvwk
         HNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl2AgEBO15/1moq7gIia17ziaIbgREL4sQa6rJ57y0ez0FGZuJYR9SrsXFD00XZQt1uov0MLvOycYAmTnL@vger.kernel.org
X-Gm-Message-State: AOJu0Yys0G1bAzsDSAOIAdzOpu5DJfwGdVOommXGw+Z7NlXFHcQgRxWQ
	Bpn9aeB4xytLWMswpsVyAF11jNvuFKlvIQb/uvqzkTuMlr8/7BI30PJbF0Sz1QclF3ZgDrpi/MC
	HxJ5QgG93TzmSJLWNytZj/4gWsfYPdI58addrBk6evQ4fmf5Ny0QeHCAr3eBiTS/pFJ8kzsQ+Th
	NK
X-Gm-Gg: AZuq6aJOU1T1LfKiVyMtUuVNh7xL3E42nd3dvlnuLiHyv2hSRHkYsF2l8UeAQMPmjHG
	nc5MvUSxJ8lf8lvdjzKArOncNSuORnptHljNSgDtOTeNBWx5SXs4Te4tmf0OGmQIoPgaTP2J5UC
	G9WTQ+Ofl6glvXXRNf4xNy8DDZ0GkybJ4WKgz/Qilsuh7+7KelCRJCiKt762vXaxARMRx0jJ+Eu
	lry0Y+Wf7XiwWGAbLfwcyoiaOU1Blo8B+Drraf70QifOKJM+bYZI1SmID6yGs3Osxx5gZxwtq0b
	aXR7NdjWilH01U0EZtB/+wuBzAbZQbuf8JmovBf9IFMOmbrcLSQozpcw7dHn+w1qpUokCWgAxqw
	dsfptlIdgwD7ENKf851QtKiBTOCjgY0iCt2jtxJNfJRr0ukqf
X-Received: by 2002:a17:90b:35c3:b0:356:2540:bdb3 with SMTP id 98e67ed59e1d1-356aab9a337mr9700504a91.10.1771314072735;
        Mon, 16 Feb 2026 23:41:12 -0800 (PST)
X-Received: by 2002:a17:90b:35c3:b0:356:2540:bdb3 with SMTP id 98e67ed59e1d1-356aab9a337mr9700483a91.10.1771314072291;
        Mon, 16 Feb 2026 23:41:12 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e7d95d8sm20072354a91.2.2026.02.16.23.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 23:41:11 -0800 (PST)
Message-ID: <3f59dbaf-1270-42bc-a21c-210c92b398ac@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:11:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: Split to
 separate schema
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, janaki.thota@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
 <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
 <xai73ei5ixb3qpp53cjvk2h4adlfo2zl7qglshup4pbeyh4fpi@ihdos4z6vsoo>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <xai73ei5ixb3qpp53cjvk2h4adlfo2zl7qglshup4pbeyh4fpi@ihdos4z6vsoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MyBTYWx0ZWRfX/VBlReVsAftm
 8lhy/cOP+P/pSztka4FF4MZbXvfv+EXNZlLwy4zJNCF/d5fyln1DHt2Ej0Cf9keWoVHw5eviiTi
 J0odF2TzFo3vrjFNtRTlVOwOWajrNs0LJfpR7ZS0GMfBq3l2AlURPTjvl3nepff9ivQaKYOdGFy
 lM47dIwYPogFDyfvqeO7AMWEXmBupMNtF/FdYu+cBJ1bN3OXbZY+Sn1jRzYa3/V/HbmRinp1XHc
 6/dJoeaVB02lwIzXYS+Kp+Y68jFRRQ+ktjXUOh1A5VvbG+2Z1YzX7q/XxQUn4X5j+XRd9EYpXzP
 FUzwYFn6UJnU7vnjyMEcM1LyWLSKQ5If0Zws1cjDNx6b28ttGtv6NTQBmyJMS8VZ1/R/g/ACPTj
 7swve1MsH7K8YmOrgRuWU3tKzkSIV/e/t+cRDXuD6fpuWvwZyrIpBfNdLi1UUmSAAksi8g/xmTq
 SVmBHQSEihBg4E1F6xw==
X-Proofpoint-ORIG-GUID: SLUFAF3tIEJNJbzR7oGyE6Ft1s8oYMNB
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69941b9a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=X7cMRLG0ekiW5Bl67NYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SLUFAF3tIEJNJbzR7oGyE6Ft1s8oYMNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93059-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68A801493EC
X-Rspamd-Action: no action



On 2/17/2026 12:04 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 17, 2026 at 11:17:30AM +0530, Vivek Sahu wrote:
>> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
>> possible properties (19 supplies).  Split qcom,qcc2072-bt to separate
>> bindings, so device schema will be easier to read/maintain and list only
>> relevant properties.
> 
> How is it relevant to the commit? You are not splitting anything. You
> are adding bindings for the new hardware.
This commit is added on top of split schema where for each chip set 
there is separate binding yaml file instead of following up traditional
method of updating qualcomm-bluetooth.yaml
> 
>>
>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
>> ---
>>   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 48 +++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>
> 


