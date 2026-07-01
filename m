Return-Path: <linux-arm-msm+bounces-115641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DHEmLLrtRGp23QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:36:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E016EC343
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:36:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="o/+9jzHg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ilzcvlcz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115641-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115641-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C323023DD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B85B40E8DB;
	Wed,  1 Jul 2026 10:34:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF4423A67
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:34:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902092; cv=none; b=V3Q5aRwMVG9OXwT/BeePPGh7RRsR/AhCBFZrlECn2L8jbKjLsuj/j/ojJ9o+Wgp3vYOECB4GcCoFFtF24eEnYkgrW9HyKcg+5U1tzdeFwJeSbAu2iK8mTgKse9MHYLUUnBuSPSIfwqc+umzrLlEPUa8S7X0EsWGLcT329mkUqSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902092; c=relaxed/simple;
	bh=Q+S+8O1M78oyBf4SeAO0DBjCNiz42SJhogcv/iJ/IEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDRyKTKAY02w8bKCIsAxkDYn9ZIcWAqz+DqbjvU4bwQ/PuiqPc/ZcBYh44baR29PeK2spb6qL4ZCPlbW5cQxXa56hF+diyUDAiIMLoi5JR92Azv4S+vEqK9xr1Mm4XlmsoS9isF8PN59VcbaLXgE57ht+VbnJ+W48q7fVBJeYOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/+9jzHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilzcvlcz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8O1T761393
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBjaamXA5wUppqhhT0yZ9IlQ5XxuWeojqrulhTasdTw=; b=o/+9jzHgKBtr6Yef
	MRBKL7YIu9Ef313xvza8/f3KzNbEK/JMsU88tyZKVYStFhaMlwzE2KmJBhRyDU1a
	rQ9czWiTlKismoB0Hv+iQiX9unUnoyLpsWU//gV78W19gSHZqBZKQp5NkMaJeay4
	wVYZJPWsptNyB19tB7eLZ7zmU/+nuVKZeCv/aXVHqzZkWYBlXM6HosZPB7hZk+SV
	SotaM5XMNjkxVTflrEiI9/aibzTsMbuAiINurgMycClqh5iizh8+EQi654gcGbpY
	u3O/VCSwfIzT5QR0e29LxsuirfDeuAFXbbdh8vDxOo91hH13vkzPomaGbNs3t94s
	3aXChg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd053t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:34:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so280721cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902085; x=1783506885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBjaamXA5wUppqhhT0yZ9IlQ5XxuWeojqrulhTasdTw=;
        b=ilzcvlcz+xF9hmtnj+I7KAXfiUKBbhgiS9mkFIW6TRsbWNbef0yvo/IKFbeG//mB0+
         JlNDc3S650bYTWfldYOWeWIT0DIJcc/B1NL+jR41xHEBRcQt+W2lj6VucC764XQoTnpZ
         9gEa6wZ4S5+CBO3uc4Y0R4LeJk/jgewaNO4+VkiIRqYGJ0hgHJumII7j5C8rbTsS9BCa
         6b04GjmfUEdG++E/Ok3mu9x17WiCxCLkl8Guzxx3f6jo7JadgfKakcw7HJAy7NWFfpOp
         UatYAToTJz/MFdNCYVQ3EVStEWaBRm1op7R/q6I9QMWWw8X/mPih71FdKfvWDr9lpkGq
         hWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902085; x=1783506885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBjaamXA5wUppqhhT0yZ9IlQ5XxuWeojqrulhTasdTw=;
        b=F/jZIH0oZevuJM5FkE8v8yg/GU+qgceqQ9wvTraJGJ6/I3kA+0xE0r5MC/WqiUkd0i
         Wyseb6Y0ZrGMR2npLWVfGfbZJ3JmV0jSLPG8QxE6KlJKHQawWu2PdOXd8n3ubkkg6+j8
         Gf9Y7/IyV8XKIk0sH/CibJKl1ySdtnNeAJ6lpxFBiixxth4QIWlDKwkJGmtljyMrksaJ
         SmgNRw/StRe+ixBQFDz5nljKC8X0194a759SECXK7I/XRmyyuYhnQGfZKB0mzEMYHrR4
         Ix4Ce9eyzB99CJKuA7LUSZMMmKb2BEq32LYsTBCZrnBuu1Z8iDzNKpPLZqhpSEnSQeWf
         ihPQ==
X-Gm-Message-State: AOJu0YzWdC9Y+Cj9TqVGvv7zBv6LAa77RLbgO1HekpElu0xVdOcgNIAD
	IkrQxl+YpUfFxgn/8qd2GxE1OmgewdFVBOWyZ1g5vYPeTQ6TFKVHji+LXa0d0Ft0Cbs9S0Suhsn
	gixphOAtRy8qFdm9M7Lrg+CUA/5+up0Agt/Df/HqOEX8XNF4zJ83gdKhD79CIdXwSa09y
X-Gm-Gg: AfdE7ck+xhhxaEfZpAB1kn+TWDw1+TsEwxrEFIYPk/BZ80nsmNhiTCMWxC8ZoxhSCx/
	48Tbfl5+MKFZWZWjRiVAH1hvcsuJwE8p59PJOlqW/4Wo/a0JIWNb0h4H4oQlDNCDlwLP/M3sVeQ
	qeOC8OGDRnQAYjfYgzUThRrbFR4/NbQl18agMhO4QSoblp/2UhfyF9N5gsyDdOFv4C7Eak8IbWC
	a2xOMnkxMYVFzWbanljWqYikU1oPCZj0dTFwJpueTK3RGYvX7MkgcjEAAHobHYhzqCw43CGxQ9G
	jgdO3KeA7mqtaTM4QM1D+jfJyoYjeBPBCIieNUhceKkqpa+vB3xXgB1sDNjeKN67CUxVJyxwP/8
	NVhZHSKqNTjSFamuvxHn4z6DiznJFU6qhryk=
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr9409481cf.5.1782902085613;
        Wed, 01 Jul 2026 03:34:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c26a8ec25mr9409191cf.5.1782902085193;
        Wed, 01 Jul 2026 03:34:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f499c4sm251567166b.49.2026.07.01.03.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:34:44 -0700 (PDT)
Message-ID: <12e86cc4-d96e-44f5-8c87-87a6df321115@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-7-e1a721eb8943@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a44ed46 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K_jWTC3QbOtyT-G4GQ4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: aNQSOvaKVgAsWbdWgnEkyPVcndRip3l_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX6I1zmze1yqlW
 E0n6dGFRDmAzUIjUhmkP+G+AncjJeCgnHJxJXZHoCKyKW3Kn/YRQFoApaqodoZhzIVulcNThMX/
 ACrDurqdF6XCgcIn3ggjgUwNJ79g6EQ=
X-Proofpoint-GUID: aNQSOvaKVgAsWbdWgnEkyPVcndRip3l_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX9NLZZiX/gvFT
 Ov/IP2E+kqsvye7l2plxjtfAvtABHFPs7hT4SmLGrf1/8xRlHY7k5tA0kYYAJ8l604g0NKM4j1W
 lx/0YCN8oxhf+b8aLcwJzqDAX3BbKQLmhPb8E4jw4eohqy5JDKARUPuBEzFDVO2dI3eA6/fUtdW
 3Vcx5YnmCRI1oWDR9HbwpKgh4YvUggXJTnwmckvi7FrkQKHpcycHQnItYrBudkM/l7X9LTjetva
 CVYUJvpYb7bVntdWMI7W0Y5Yzda95wVqvH3Wzer3p52FFaNOrODgZqr8pcjABNJs94930ylY6Dn
 DC852sqtPc11lBIMtrkj6BpXeLZK3LUbn0b0xdHdF2LsIXy7v0Ng75i05MwgvKB9DlDPQIhypMQ
 2c7elYeofrdIa249MVZ0SVnaN8usfEJX0srjI5LnIyloEYOj9zmu3evXesYO3mfGRJvwmdrjW9q
 akIRELXjfeRVFeNkH/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110
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
	TAGGED_FROM(0.00)[bounces-115641-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sushrut.trivedi@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 48E016EC343

On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
> Shikra supports single PCIe instance with  5GT/s x1 lane.
> Add PCIe controller and PHY node for this single instance.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

[...]


> +
> +			max-link-speed = <2>;

Please add a single-line comment right above explaining that the
host supports higher speeds, but the attached PHY is only Gen2,
so we need this manual limitation

Konrad

