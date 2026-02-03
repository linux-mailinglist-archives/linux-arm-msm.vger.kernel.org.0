Return-Path: <linux-arm-msm+bounces-91636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP96FNzAgWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:33:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC341D6CD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF91C3051490
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6423033E8;
	Tue,  3 Feb 2026 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/DYMzqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5TOKK+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DDF261B96
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111116; cv=none; b=OAt40sj9e/kd5VArP7MeDzyaWJtjNsi7itrdkHVUC3RSybXflKpn3zaHRCpHhWojECOG615hesh1gT6FE4F6+bOmL7TPkZE+l38/MGbmHZXyWzvEZ2ni0ldDFq5MnWN2Prm4j2m61pfezgrA7YQXvmsqH6WGc5W3QfS7vlcb7PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111116; c=relaxed/simple;
	bh=7lWwlNRV+6r2H3mLL3UVH1qpDayK7pYL5ubxSaD9W38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2V1kZOKLqWo9wPBu/75TAJRxWDCbsQNMdBe+bHAHB6iq4dHMbgj81idpaiiLgbBXffpyBAzDzrU0WL7soVJGuzQUt/JGDj8pieo6vPswWydr0AwbhYnHzYcYo0hUKr85LyDKu8QtXbH1RZIQXMo5HTZkOdLSczjZPJIZR03880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/DYMzqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5TOKK+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138npw0848643
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdHSwOqniPyo27OYcD5Smnsc9jClWLTB1iwxoPHnzP4=; b=S/DYMzqNK+prf9J9
	YjaqJJ2xHmlwt+7/Of2U3ZAlamJN4S3nZsngHFg6FshIQxDnzQwQvkkkoNXK6XJE
	3cIk74xIijW44Y4oDkwDtflY0/YBT7TGg7whWXV2sUTx3CAKCTXccpNGqZsccL0+
	HzW0PyJmSzqycNpwZaDFVkIx+qhhLd1ZQe6gXDZ/2ahqkV78av05T67jY3Rrhpc1
	qfChTUDBD22Jocm7Tl3nSVPm3riCWCIHfpLGq5s/rxhpfw2Yw0W1h9P6EcViLxy2
	t9KsIJl5Zl4P+hLdsGpsjvJwQFn/vaaJ6WxDHguHzgp871XBIo5oAVyYlb89b7tE
	2m4PJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutg4vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:31:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso51729145ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111113; x=1770715913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdHSwOqniPyo27OYcD5Smnsc9jClWLTB1iwxoPHnzP4=;
        b=V5TOKK+sNUyD96H9XRyy1xL9Tp/J+UzyXzCA600WOR5wQdtOwJukkfRTgS8HdOvWdh
         YIQmyDsdD0wKHnLzWOoUV0YE1q9kAlY+TqbNyj5hHlMI4cThFg7jmXysrR8ouZD65wl1
         BnJX140pLOW0vyvt5iQP0n4cbcGawii8b26XMFDWHViNnhHABLW+xFwDqH2PlQewaIDm
         pnL0tjpb1afnYWcpudlOKtvBhS5SsRJMWPA2FKjkPSitOLckhtzpC4s1ydWMfvif6B6n
         t5wpefFlXYw7BMz571Yx9GDsndkNwZiNpB5daLHiWw5cRnDq9tmhD5Tm7gX8QHBm8Sb3
         Ow1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111113; x=1770715913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdHSwOqniPyo27OYcD5Smnsc9jClWLTB1iwxoPHnzP4=;
        b=rLA+kT3iahh0HwvYjLwfH5JMUa3hUhMtXxelfnvVQmW0Dlbn5r0r2NSCrdfb0VLvo6
         ADjAcReiTuMrLOW6EYoASgCGQLjvJ6jg86D02OQ8PBm7Bg5YDZK+dF4UNcXqUwHNYtzJ
         7MVWBjF2egFktj6L2JAAAaaG5cxXSHKCBSL5Vk2ERN7zpsYPkf721duNBuL05+KRhvN1
         q37Nhi4tEU/B+cw0EuAbp/XlU3zPJ783kh7+cxIGeSNqzQo2/uF16QDMa5bstk/iiRxA
         4meirOx2sxfR1t7bmpyCudAwj/SQy3CSe7g6GlwywkT3FqTA4CaKEPD+IAhb8CcDYK/b
         MUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7fFjpCY/0hO32qXh1JYobgecSQt+BZe9zTW5gqVRKLX3mPelRr9fhkus02nQS3rAaMn2H1tNJqYqQnsEN@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeqC+mqpOT0OdcXrpbJt/ubuZxrcxVh6eaNJJE9lByd917ApC
	ZgJr5w+KAcfNRhsGQAUZsbIC4hDlhqzooUZ0S8FtXRoLzuwqu5HhOfFEHzVX247o5sgpkicLFrr
	GxT/utUQKv55+Z+u3aISGGSnajFoBwq/YqND792b/cRJ58AbJ95YLWoS65Sl/xTS19+mq
X-Gm-Gg: AZuq6aJpd5s11QjH6GueoiB5+f2wOBckuH29U1NmSapAoh4zdHC5TL3Kfmy6AM/aSwQ
	kvjK2bt8pOQIqSz/CYVgH8NzkJZPJOkpoZc094EUfbP9eHkXVw77HJ90r3ybni8wg8/ACUVL/Sc
	GvNv3VaFLWSMTj3xSf+nLXX8bbKHOB/Ay2YnfrfzuPMO6h99QsnGuVCT1oCE10w1uNiNPnkM3Z4
	26leBVVLoonr8Z1LYmvmcH2A7ON5R/niQcUwfVeDsbHDtXQ6esqEjSxAVX8dsjW/qEC/XHJPRAi
	GV1Mhp5SNwtwxEEPUdZWOy/JPtzTbuF90cueVkUrAa8rdcfT/BH/u3vpiiWsAAJROutnCaezNcf
	dbuMsGe32jRVrVqxkDYMFlnyMCR2P0AGohmJ4f0c=
X-Received: by 2002:a17:902:e982:b0:295:290d:4afa with SMTP id d9443c01a7336-2a8d96b0eb9mr115559175ad.23.1770111113168;
        Tue, 03 Feb 2026 01:31:53 -0800 (PST)
X-Received: by 2002:a17:902:e982:b0:295:290d:4afa with SMTP id d9443c01a7336-2a8d96b0eb9mr115558825ad.23.1770111112690;
        Tue, 03 Feb 2026 01:31:52 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8dc225534sm111999505ad.68.2026.02.03.01.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:31:52 -0800 (PST)
Message-ID: <0f8c0e5e-4921-47e8-b602-e6c08bb1f6f8@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 15:01:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] soc: qcom: ice: Add explicit power-domain and clock
 voting calls for ICE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-11-e9059776f85c@qti.qualcomm.com>
 <7da1727a-c1cd-466d-88fc-e140b2e7fe5d@kernel.org>
 <54bf72b6-6397-4655-9c30-680b1374400b@kernel.org>
 <82a6ba61-94a4-48bc-a012-d09152b32781@oss.qualcomm.com>
 <646bee0a-8b10-4fa8-9d17-030876179c02@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <646bee0a-8b10-4fa8-9d17-030876179c02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX2ZdnSLSD64JO
 +ha6AGg6DtXlaKNeCj+IeD3OXnKqbWSDB8zIi+0nl6PYDH5GD8EuZL/zqaV7TX9JFEeLuXzfe6H
 kEClNOvb/pseJEoTRGQ0yaFgHQ5M39yXi994BEbh3ahWPnlEwvdDczOeCgDiN36fkrIRW+CL20O
 ml5bCFBkJxRypIaNoHBMA7UK0kLskrMeinYI16R2ncTL7z66N/9ihO8Eixt26h7nJCiowPQ0q/5
 p23DBOBzKOaw8LDQa7CatdPWAGzMIElXj7joOO2EPoicHleuq8DGXB2r/u3XUaj12pQIIUkp7lC
 Jt9DjiEYkpoyrxOVxBoWOgk1sRZ+NAXs83oNwzB+Sqzpyf7wDK+YOgrVj5e8sY04uUsPmbvY1lK
 rVyjR6KsRwNJeZdw9i9O3lJ6QfVOa09aCSMjTTDYrnytDYy3OVZpGiZdJq+hi8ssP7APmx2bX24
 kcuZYhPMeCyqotERImw==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981c08a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=TJZTRc1pyfe8BRA72ZMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6xP7DUAeK4_kpAwtyRs38fZ5D0tp0QOy
X-Proofpoint-GUID: 6xP7DUAeK4_kpAwtyRs38fZ5D0tp0QOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91636-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC341D6CD2
X-Rspamd-Action: no action

Hi Konrad,

On 1/30/2026 4:16 PM, Konrad Dybcio wrote:
> On 1/23/26 12:12 PM, Harshal Dev wrote:
>> Hi Krzysztof,
>>
>> On 1/23/2026 4:27 PM, Krzysztof Kozlowski wrote:
>>> On 23/01/2026 09:58, Krzysztof Kozlowski wrote:
>>>>>  
>>>>>  	return 0;
>>>>> @@ -584,6 +597,10 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>>>  	if (IS_ERR(engine->core_clk))
>>>>>  		return ERR_CAST(engine->core_clk);
>>>>>  
>>>>> +	engine->iface_clk = devm_clk_get_enabled(dev, "iface_clk");
>>>>> +	if (IS_ERR(engine->iface_clk))
>>>>> +		return ERR_CAST(engine->iface_clk);
>>>>
>>>> And here actual breakage of ALL in-tree and out-of-tree DTS.
>>>>
>>>> NAK.
>>>>
>>>> Please read internal guideline.
>>>
>>> Internal docs are pretty scattered and messy so I failed to find this
>>> there, which is surprising because this was frequent feedback. Therefore
>>> please update Kernel Upstreaming internal page with following:
>>>
>>> With few exceptions, it is not allowed to break the ABI, by making
>>> bindings or driver changes, where the existing or out of tree DTS would
>>> fail to boot. Updating in-tree DTS does not matter here, because DTS
>>> goes via different branch, thus driver branch would be always broken.
>>> This is explicitly documented in DT rules and explained also in
>>> maintainer-soc profile.
>>>
>>> You need to either provide strong justification for ABI break or make
>>> the changes backwards compatible.
> 
> If the ICE can not be powered on alone without this change (i.e. no UFS,
> just ICE), then please spell it out explicitly, Harshal. That makes for a
> valid reason to break the ABI.
> 
> Plus the fact that without an OPP table, the voltage requirements cannot
> be guaranteed to be met
> 

Ack, I have endorsed and stated this point on the DT-binding commit.
I'll wait for Krzysztof's view before updating the commit message to
strongly reflect this point.

>>
>> Ack and understood. Let me write this in a way that makes it backward
>> compatible by using devm_clk_get_optional_enabled(). Like I explained, for
>> Linux distros where CONFIG_SCSI_UFS_QCOM is override set to 'y'. This
>> clock vote isn't really needed during probe.
> 
> This is really a side-effect that we shouldn't be depending on, or
> even considering as a backup, since the UFS driver may change
> independently and stop behaving this way one day
> 
>> In qcom_ice_suspend/resume(). I'll only prepare/un-prepare this clock
>> if it was found during probe.
> 
> Clock APIs generally happily eat nullptrs

Ack, then I guess in either case we can continue to keep the calls to
prepare/un-prepare. Anyways, I am convinced we should specify and use the
'iface' clock.

Thanks,
Harshal

> 
> Konrad


