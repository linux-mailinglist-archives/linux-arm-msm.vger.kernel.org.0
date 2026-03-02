Return-Path: <linux-arm-msm+bounces-94797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM8vLcBKpWk28AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:30:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 624831D4AA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70D09302BB93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D284B36F419;
	Mon,  2 Mar 2026 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F397xZlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4K/6uHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990017080E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440227; cv=none; b=HMgoAxzH6rnVkhVF+PL0ABengyIFxGbCjV9NjK076GAtY+6zZUvZvmc/p0PqiX3Itf2oVTJJEaSFQ2wyp6C1tsC2o1iwWvzD26yCO6fUkCKogOJ6tNwg9FGNv1YEjI04WG2fpVX2OJSLwadH7Bk8mt03Zm609n51kLSf0upEpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440227; c=relaxed/simple;
	bh=PdVF4m/Vo8WwHxWVtyMWjZ6gfXH79CYdbE1OAJSIHQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYzfCCN23qmtBmSnF4ZSE6t2MstzWyF74dZUpzOnMSqlweodoKgYl48mfswS313MwsVF6MVActjEP6cteWwUgjMcLsT0zFY/VwSJb0RmW4QRs8s9yiF6ayvhxfpX0TWURL+rgBbTUcZQJcE3HOIyxtU7T+rf9NFqmV1eRKGaLjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F397xZlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4K/6uHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226vP7m2649150
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5DyDPWzjeqxKw1lBuIpfRL2Rkz+BBRZDEujzzmhu+U=; b=F397xZlXt+3Y0PbW
	4GvCqNLRVlqR1r5302V/ejr4ymSCMbxsnFMmGet8gtg0+T7cuiw9zFDLYfVWqXtx
	NHlwNTObZFpQT/F303E5cQcgZk8NfJr0aI1KnaApBRNfvsJZlCUaQEbxBW/yROr8
	MGrgB/9Xs6gNGuk3AS4y8/ElenZQo6FbkYv1Y4btzHMmxOhiZitsAP9rrbPD0e67
	W/13xJJiNcD4XeiSLenJUotZhxpSbPSchyspuYCGRlsWKUdTIXe6Z/nCTaw2Mztn
	9GSMeYACtWDb0ctj4xcnLZSkc7zywEaRk6xIIIN+QNJGWS6wEqmFI4FhOQ8wc4Ue
	kYPSBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkvppe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:30:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506bfff75edso527524191cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440225; x=1773045025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5DyDPWzjeqxKw1lBuIpfRL2Rkz+BBRZDEujzzmhu+U=;
        b=S4K/6uHdaB1mfRUzRnC2ndAO5wZv7QUhcsEIsxcbmbTueCFxnI9nDs+VJVbr9wjb5A
         pnqRAUSqp6FAqyMHHANPLhq4NB9/B1SXpumFRFxczZAjxnQKdoVLm8u+HRdgY7zJEMsg
         GJi39bOZpfXGQdHT6czirbQ6rJC4bsouFYiXuOLPSruFvTeFMF/IwlILlB93RDNFFE/c
         QRbNSrJzEB39n0tGOsJoeY135Lo3rG51JoiaBH+iFVYZXpTxnH89VPj9fPnRpioEz6qD
         S7EEE6Kus9JvGsWFgadeKV28c3HHSpllrwbedBDaYPDGRFDbjlPXcPpgCi/N/LKjfJbG
         LfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440225; x=1773045025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5DyDPWzjeqxKw1lBuIpfRL2Rkz+BBRZDEujzzmhu+U=;
        b=oqU2zd+aRGgcqmeYutEBuILa0CXbNBaq/L72Wc1tcZ80hLi+rUucOWTKhDmKBHQe8Q
         /RyRIyNsPd5H4CTr8HzVe+MaM4idgrGbQz1D4MC0M9JBmsYTZpbHU9lZIz7EPIM9SzQD
         S6+TRjmBG1vAOCr4Mm6CfV6TLwTgN5kw19E1UyiRhoBEeZp5nBrLMUJk+beBIxmPvS6A
         RN3Qj5hWNMPlks85sC98t763HSghmY9Cwgj21KxWcOqKuyovM+2pBUqWD5T2d5B8h37h
         fS2YWNcsIdNxFPfVehNTcrp8+JFAuxrl5qacANcHAs1wHYWOvr87wHQcf/aOzdsjdTtG
         h4XA==
X-Forwarded-Encrypted: i=1; AJvYcCWgmy0lLC/3DfZkjHAVIYCdO7skryK586hIYvw1HhMEBAZZsWMJz7nhL4Hno+t7pVVJgSCoiezXRaw7oTeB@vger.kernel.org
X-Gm-Message-State: AOJu0YydTbeGhoxfSN3WoVW6dQYgRd7dq1iOh29i6uZzccKlMPfhbsTg
	WPvhLTvwufGhGPfPB75YZCerWmttbXrkgW5SJO1prBdz+if9oPHpBL5R9Y3TSjzFvcaewi1kGNn
	O0OC+Jwr5oTFL1rAx8Wn4SEoGgO/7vt7tAd95JPe6SPhkWV+yj26Dqw3NLXUOmUXRpsXL
X-Gm-Gg: ATEYQzzogkDWWdnw7N4H2dAm7RR7Zejt4y7qjCft3k2nK4G+dkMGiQu3UL3izAlui8/
	J9wTphD5xf2J8rzMFtuBlEF93JtD/D+wgKlzNdJj+diV9UlXHHzGVzcEqa37nWAAu4ZUgAwOVq2
	oq9Ho/A+R31cRYVnhiXF8X/GZdbt+LSGsUgh3diiMqAQSY6pKDRG1l2tscDUbS4ve2r7cIxFuuO
	D4fvcjYMrBM9WggerDbArQhpJz1w+TYyHJYwUs84y5HDcAK/MO+7Qp+Z0rOGtv9frgHtUVldA86
	+ghxlbbLgC7gvk2KeEJXiZBwU/EUkK9VQnO+Sso2O4j1Lqq7SsevqHokh5AQoxOuofO62JJ9jVc
	cE5qj9AqfhMZqUVOr13EmqvM9Q5RljaLGMKkaAlYfq8lqu/2x7ulx/pWX1Aq6ntZaQNAU2g+kA1
	UFIZiaNcitfA==
X-Received: by 2002:a05:622a:1448:b0:506:1e15:d757 with SMTP id d75a77b69052e-5075295824amr163872041cf.56.1772440224759;
        Mon, 02 Mar 2026 00:30:24 -0800 (PST)
X-Received: by 2002:a05:622a:1448:b0:506:1e15:d757 with SMTP id d75a77b69052e-5075295824amr163871761cf.56.1772440224350;
        Mon, 02 Mar 2026 00:30:24 -0800 (PST)
Received: from [10.38.245.172] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm105508681cf.2.2026.03.02.00.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:30:24 -0800 (PST)
Message-ID: <a835930a-8f53-4117-9f08-8a50ade3d0cf@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 16:30:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] phy: qcom: edp: Add DP/eDP switch for phys
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260213-edp_phy-v2-0-43c40976435e@oss.qualcomm.com>
 <lvau2mmymqiczih5dkhgd4vrx6x5tn4tdp5wfaddkkrakdjajq@soihplbnfgzy>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <lvau2mmymqiczih5dkhgd4vrx6x5tn4tdp5wfaddkkrakdjajq@soihplbnfgzy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NCBTYWx0ZWRfX5SjLwA8eL47w
 lK7Uinsne0w2OApWJmFgbm0jsgyrX//XIuUIGv7LKQtfgSFmU1O9+Jv3f8+0U3fO4j6lawmZ12e
 dC51lV5/1mVTiUoL6JkTrK8lDSMnqM93+4dwmDSFea4ivTKl8OT1qOLr5yeQZB3pJUHVcdvkO3+
 z4BxUwUbdORV8LHYIhAv1DimIHERQzCzsKFZmNQzve+WCJIfUAzhy6Lh9RP7t+KXa9gfsvw2+aj
 Hr3PImOm/z+BD317SG7v1uf0IBmWS+NgWUI2r1K/cS6TJVD4jCIeHyIHBguISZWh3q7vG1D9fP3
 5rix1o/y3gB2nwN+MMqXv7dCV1/wM03AVX5YwQE3bRhtXqSc7ciNq3M2CiXUn3XPI3S7D2jPy6W
 0RpBHfSXZzd9yMd+JU1CrAdRLgHVluDWwdqJ2TYwHkXRYKSHTyWU8ex3BwyosNLsdJaELN94Dk4
 FK8+AhrYN/wxr47GE+A==
X-Proofpoint-ORIG-GUID: bt68yT4JnH0J42_kM9rsTl5ihVyYekKe
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a54aa1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gP65O5kftThAzFAvIssA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bt68yT4JnH0J42_kM9rsTl5ihVyYekKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94797-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 624831D4AA0
X-Rspamd-Action: no action



On 2/14/2026 12:12 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 13, 2026 at 03:31:41PM +0800, Yongxing Mou wrote:
>> Currently the PHY selects the DP/eDP configuration tables in a fixed way,
>> choosing the table when enable. This driver has known issues:
>> 1. The selected table does not match the actual platform mode.
>> 2. It cannot support both modes at the same time.
>>
>> As discussed here[1], this series:
>> 1. Cleans up duplicated and incorrect tables based on the HPG.
>> 2. Fixes the LDO programming error in eDP mode.
>> 3. Adds DP/eDP mode switching support.
>>
>> Note: x1e80100/sa8775p/sc7280 have been tested, while glymur/sc8280xp
>> have not been tested.
>>
>> [1] https://lore.kernel.org/all/20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com/
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Combine the third patch with the first one.[Dmitry]
>> - Fix code formatting issues.[Konrad][Dmitry]
>> - Update the commit message description.[Dmitry][Konrad]
>> - Fix kodiak swing/pre_emp table values.[Konrad]
>> - Link to v1: https://lore.kernel.org/r/20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com
>>
>> ---
>> Yongxing Mou (2):
>>        phy: qcom: edp: Add eDP/DP mode switch support
>>        phy: qcom: edp: Add per-version LDO configuration callback
>>
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 176 ++++++++++++++++++++++++++----------
>>   1 file changed, 129 insertions(+), 47 deletions(-)
>> ---
>> base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> 
> 20260108 is very old. Your second patch doesn't apply anymore.
> 
Thanks. Got it, will update to latest tag in next patch.
>> change-id: 20260205-edp_phy-1eca3ed074c0
>>
>> Best regards,
>> -- 
>> Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>
> 


