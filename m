Return-Path: <linux-arm-msm+bounces-117750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ekXaATxvTmqmMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:39:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3D728230
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:39:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YUXT7sfr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mt4v2WER;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117750-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117750-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3CFD31F4598
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81926439331;
	Wed,  8 Jul 2026 15:13:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037843933E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:13:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523627; cv=none; b=UOrNV6bNpyruC4To1t9niBqPkp7745ZDEZMYAzNQMi+qtE0IeuOBm06o+MGGm4GuiO8KlsrhTDf8iXbbbjinsIerNk8ZtnNDmvhg0ERYe5RaFA+6T1jOctS74J1T/KMNzn67WTdz3tQngu04eQvC2kwSxEE5U4GxkU35rriYucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523627; c=relaxed/simple;
	bh=bo5ra4Hpc8FFQaXGnBIBldaa3XB5/oPRylywI2sJ2kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpQSMaAcz3eAjjSKn6gkZdWmLteLcrF/YdpNbr/JLxwgeIoNJFKj7indG/47bSonjHuUgolbfKp+yLdds/KLyLSHac866jloZe8rAt6ydxYQkgRw2dMU5mAfMr1dlcG3pt7ViHohGqgsgWqK3pySz0FVUxEYF87g2nQW3gI0Hxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUXT7sfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mt4v2WER; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3sY12751523
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejAQoKDDCd8xD1bhBnlWfyS1/qCW0J7Woy3f1QpgxZM=; b=YUXT7sfrnD63qrpj
	a64pfvfel0gP+7c095Tcaizxk0LhMiIVA0b8/2rF3zDjsSFnipZs0MyAw2xP05oZ
	bCkL/C2305Bx/ooaUOeXw2DxkqB4je5lhJLL8MKBZOd8ZgefZs9xqE5TY9vyYBjS
	qTQiOuXd5BWr7aQi9W5ptEwbQHyo3MCUapIVM+AR0ASo+pCxXykRvfn8v6iMxs2y
	MEf63WvwOFBXvDHuYr7wbdjGo5rJSFPYFRspm71g3TSQOvcw0s8eKni1qCcMmq6o
	QY5zlD13JxtmGncKjDdbpGPM8yU35TmARIOO+FjsAUfOZYJFmDlW/eUxXkO3ShqH
	+PDqvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu3kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:13:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eebafso1662640a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523624; x=1784128424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejAQoKDDCd8xD1bhBnlWfyS1/qCW0J7Woy3f1QpgxZM=;
        b=Mt4v2WERH90+hjxjg+oWxZBw2ar/iNb9bvqoUhWZDMLBquM2ebU4LYeuAYvA+MMerz
         Kz3OklU9Hbbj2wypigqGTiMIZUppIP+FZSe0D+pJeiUjG568Obfdpb0Ow+4c6WWwILZ9
         84FIxnqiXhIqVlc2QfBwjFBN6CLbuB2eINdb1ILWjcxvUItxZnebqbwMf3KEvyt0aUUg
         l4/nhoRyEoVG1MJeTGbOIVztkPhENhLCdL9Qtdq/66FcUJYNRo4TnzeaqBOEqKHH6UND
         QYE2bPOb/s0XrDsTTvG0LNpb/jdlbCp6viMSg5GkqMQ+txJyrMady+mSCDnqvryFYTqs
         qn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523624; x=1784128424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejAQoKDDCd8xD1bhBnlWfyS1/qCW0J7Woy3f1QpgxZM=;
        b=CdtOpYOdFa4s1UT8m6fM9VimGsruK2nqxvbGu0n7NK4qdvGmCfBcjE3ogBWNTRATaH
         opV3mXGSnRMoBKc9AwKQmw/Ob/gaI/HRPdUkcwzKMLaxP6WnbVqJUbEW0PMUgCa0dXzN
         B8rs1XjDcTH/K+tS5h08eP561xe2oWFicf3MQ3vnRcfAYVWz9nBYllOlg7FhSiR8hdtu
         Pd75Rw7DAnHVhyEB7y6Q9qwnIilu0vRWV1TQ2/l7OO6tUHfqYfOZKj2wEtGRn8MuPuLM
         uKlM6oP7OPV78GNWL9Op6eoBX2/dPFOCFxGaPH7j34aIK9liRx0niKGOA2TESFHHpGhm
         4FwA==
X-Gm-Message-State: AOJu0Yyg7PKLbW4W1FHcnhruuhl7YDaiR+tQVpuqKHw0r2reI3CGkeIk
	Fx0LmxlYFUKrBFjl0bZR5eEvVQsnpIB0M52RfSbgLeLGTS7Jf7ikxzqm453ee8yEtH60tbsuT5+
	OR5hwy4S7JzKysQzqg3AC9q2nggZu+Po1/cnaMTAIxDdW0WMU/ggGnH7NNnYvAPYaeGrv
X-Gm-Gg: AfdE7ckUzw4Qx/pdsdnF6dl2pkyp8Day/bz8vMJrBhxME1NpI0AauN0Jb6HGo33g7ze
	5MWoWpCIwbyXA614nbgEOByU7dHzHNPve71PXEzTNc6h71etnHG76lyWVvFGIFGXekrZidzWn+2
	Aeqj2U/zM+NE7VElbPEy2hODw04lWUQtMc2P00UbiI/mhwkEuPj3ABbssPimSkT7i/ia1cUfd8E
	xqAyhWkiiJVDo7yu7sVrce2XAfhkAgmmCKDaj7Um8N3OK6r5Jg2CahMWQGp6ahTE23JSI77hVAR
	5O6zAFTLYkQNLdn6PeTLSamvQ7ht8oHl0ZuFfFGNTAZemQQv0LFbvRe2O8Q/GDSg8WholSX3ZC2
	DJVY0SA+73xpVosgaO3e4ftRFF7X91JVglc0LHdYktNBv38uuJGXzD1aUN0paMLfrjytgf2uW8L
	ds+w==
X-Received: by 2002:a05:6a20:3d0c:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3c0bcf16376mr3619040637.2.1783523624019;
        Wed, 08 Jul 2026 08:13:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3c0bcf16376mr3619010637.2.1783523623630;
        Wed, 08 Jul 2026 08:13:43 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm1518130eec.25.2026.07.08.08.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:13:43 -0700 (PDT)
Message-ID: <fb87991e-ea26-4ea8-b037-958b06e4f9f4@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:43:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-1-0aa0ec1fa83e@oss.qualcomm.com>
 <c22aaeac-1b9d-46a1-8fc2-ba48422736d5@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <c22aaeac-1b9d-46a1-8fc2-ba48422736d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e6929 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=wbZS0JleAGqbw7oGhZkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX/9GaklXQcD2H
 iRWih2fvfv466JrCKKLqsiN5doW1Gu6R3tPUo5+SvvaTw8QShnw9rRinjGp0W4fbLI55hOscFNy
 VkFC6qzw8BbO20mlIaXshDwrZ2rb55YhVQuqlvc9uicWFyOyyLAiw/dpZqVKrv1AoZZ/G2Y27lA
 wJjDUwyVRnD2paXQX17H5YLrLznXN/1tHdOurgYX2K/pjoEAQ17cIylntnVvoXhpALDL1WYwC5m
 Hw6VNcCWwAv1HW8rL1EKZh+CrwkEE1tUrkJvnCShSm0D3kkTC22Acc/cfKZFdA+qIGDoNMZsTMe
 lXYXkMS2MkNXi+NMQ7w4SLDY+rszoSJV3pBiFDVRjSXNJ2/zVDnYoZ9rFim6K3ZfQdsXe4DlXmQ
 QGsiqJ0RUrxrPLKtX4lCt4f0+dtpYR3WdvtCPM7GoYWG8rj+o+AzV1gJcnZ9oIbNyR6aJPt6HIn
 4a/11Y4WBTYIvZroJPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX6Pck5ElOoh+i
 +kXTXu7IKTmPBpWwkeAphSI241PmBtrJzGRtbxudOvsnfe+MwfYZ+z/9OXMxznx/dHcuQn9OqQo
 MMvr3g2LfDfobZaksyA3mvuzl85zM1w=
X-Proofpoint-GUID: 2JbX-uFQ7txuJD2lasl66t8EvN6ViM3r
X-Proofpoint-ORIG-GUID: 2JbX-uFQ7txuJD2lasl66t8EvN6ViM3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080150
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117750-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61B3D728230



On 06-Jul-26 3:15 PM, Konrad Dybcio wrote:
> On 7/3/26 1:13 PM, Sneh Mankad wrote:
>> Document the compatible for Shikra.
> 
> Please include some of the information you mentioned in the cover
> letter, since this isn't just yet another boilerplate compatible

Sure, will add the information in cover letter in v2.

Thanks,
Sneh


