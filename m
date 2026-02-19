Return-Path: <linux-arm-msm+bounces-93354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIBpDQnYlmktpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:29:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2515D5DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7D53016D2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509D1338932;
	Thu, 19 Feb 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HLID38pC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K+fgUpJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BD33344A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493379; cv=none; b=Wq/YhL9OjIhlbmdeEGj6dtHfSUW+05U82Z/89Yrs4KuIVBzrDnEbDacb/VjDjapGgwBRUjznPq9gIpguV1/CO3VyQVkT9qX3t+ytXbNb/PcH5SLkLNx5z9+eXItBl61LsYrRWlCKqdO8Aiq+oNz2uutLkWOJJisRxwurWFSU39I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493379; c=relaxed/simple;
	bh=P0qIIDfzpUiJILQtOfKkgH3ZroDXXuMcD8301mLKV8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyVTnP39l9AlfS4h1RFnaYvO3HFPGC0MfVxqSZlCl5ZQ+tqIslCKWCs9xYglbDH4cOCrmQUZzntQnFKtQe2FwHq9PL5o5VzivzXGTusN29M8B1Emf0jWzaylbeAot1Vt21fSh2SzbuexpZYP0Q53PrP0jNnRWf2NaXLieglY7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HLID38pC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K+fgUpJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INpial2884025
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmuTNsdxIo1Ki6HQWuWsIBHgDhy9MLo0BmLXHdFSAeo=; b=HLID38pCUqKfFzwx
	b6hpzh8IRG9bMMCPET2CAxNJx7mxj8YtQphfrlWcRTaRT9IPMoc3+FJ3kE7TZFt3
	7aH8EByuzwUf8n9MJWaakbgayLYwxwgp3kAJeNGpo2EuoZLXKlExEUC8GgVtnDqa
	99po56qBb5a7TH3Oix4vJZO+vnjJNNmaFPHdUzWmjQWr7Zzi0vA/er8Q63uHQPtf
	dtGJtxQen5KSKalVxYh6rkuP3BB/oiKCc8xrR/lYuQDItnwGLKII+vIbjp+jT71/
	JaAiAIn7Xx90MO0eB/G6BitdyRG2zGlMv1gKSVn5Cfqyw9EORz+jGXY7h9mHcmN+
	5LDH7w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg92et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:29:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946c23cf90so7373406d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771493376; x=1772098176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmuTNsdxIo1Ki6HQWuWsIBHgDhy9MLo0BmLXHdFSAeo=;
        b=K+fgUpJ3yuBRzfYrry3sQRv3YdcCtTxeja8Qnq9gAiW250kklcInvWmSWMyAb4HovW
         ixwzRGD0+f8UxDjN3zqagYasPMjx+l80kQ1IcjfwjH52I4D0HLyGFKxYx3/UPdDXPNyv
         PKhjcadXXtrcm2noYJC7UskL2R76GHF+Hg50BwOdyLW0lrJOplChmEo4OCVpw0wNcvQz
         noJma1vPA6dPNBu8ssLjfDNw3mPAcxfvvFZdL4YQj41jhlPJEjxhGXhIJbXPZZmdXz1k
         NGio5ZFoyOt8JQjWWqr9A5MWOuMdbdtWgmrcou+lJu3Ql9ev6+4EV5/Ow2iaqZfNKegR
         uFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771493376; x=1772098176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmuTNsdxIo1Ki6HQWuWsIBHgDhy9MLo0BmLXHdFSAeo=;
        b=O+vzkdsvHO63M3jvsbsfW/wZAr65+ANJBXtwnwELWFle0Y/La0ZgR8KC7O6dFcivtz
         5ObDibE+Wt53AA5SHrQQKIs3rz4U+gi4GGCRtJ/b1xhMnKnM3opC0G0GPkn7dv9A/PNY
         cjZxvZ+GzG+hhOq5Bwk3ZlnfJ1H+qrg+j0d76qgpnh60PQsez98ZrTMw0J6R0H3d+e46
         OYfuXS0X2EDVdI50p4R3vML4peuBPXs9RPQPueWpagDRuOPv2c5Jb367wSV4Ir87oYBc
         NzgXXL7DkRIdoYnofyKZ+NW8u1yEQGiXfgBr2an9rAAIysBBQrhArdwj1eINSypP2nzY
         lJhg==
X-Gm-Message-State: AOJu0Yz8MGThr4l61sKzeykSQHxPkFeX180eN4qAHufke6FKMvRtVQuo
	qlnXWlNmFwXxecNUFRBKoQ3HnUHanlA4qzN14UPM2FV66FIzv68Wp0q2ejCpJIQ7kYLSIrUi028
	qMdsh0oHpyLikrB8/IyohgDnVHQmMYzWQqo9gGvbWy3MBQTSVPHh6abg2BcJTGbC+fUyT
X-Gm-Gg: AZuq6aJD8xzN+xrbpKrtw72Kqd+JY1qjkySCPSHubzsK0qPw0RZ/aRQSG+/ULSxutV+
	ouyHTJuU+UmZ7qcyDgM53Xx57qcQOQ/ZqAcyjaSyi0+xwCmOEKJcy6awzJH+BbaAA2+xfRLi7Kq
	aP1DMiAlYX3uI7FyjO/tXEXfcA4Hix0t7LQgdYeY3SBRw1/MYiFaqbx3a02QuVOeX+sJVo0fr3j
	qRBV3YW3LRJ1zbhzcGJr4do6+AKXyRJ5I52OyBtAcNwqQb/OO83Lx0GBrTv5L4PnYxrk6ombuWl
	eOSTx6qE2HVe0rJZUt6FhuhjewhsM1gZSJODJi8o9Y4P1qG7Y7dc3xTL6ky6SKjC89ad6XpHkoS
	4+fbmoK05s2X+jyFVo4Izz2bgfvvL9bLHj3w9t6/VfHFBi4rYhhz6K3va0CtrjaQ37peRCuLOLe
	JF6ac=
X-Received: by 2002:a05:6214:4c89:b0:897:41c:a766 with SMTP id 6a1803df08f44-897347c8326mr203654026d6.5.1771493376433;
        Thu, 19 Feb 2026 01:29:36 -0800 (PST)
X-Received: by 2002:a05:6214:4c89:b0:897:41c:a766 with SMTP id 6a1803df08f44-897347c8326mr203653856d6.5.1771493376058;
        Thu, 19 Feb 2026 01:29:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e587sm541749566b.2.2026.02.19.01.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 01:29:35 -0800 (PST)
Message-ID: <aa5f536a-41f2-47e7-b80c-8559c13a69b3@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 10:29:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8550: add OSM L3 node and cpu
 interconnect nodes
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260218-sm8550-ddr-bw-scaling-v2-0-43a2b6d47e70@gmail.com>
 <20260218-sm8550-ddr-bw-scaling-v2-2-43a2b6d47e70@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260218-sm8550-ddr-bw-scaling-v2-2-43a2b6d47e70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kIT9Qb-BDZpevT370XDrHVLTHZtZJURD
X-Proofpoint-ORIG-GUID: kIT9Qb-BDZpevT370XDrHVLTHZtZJURD
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6996d801 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=hU_naWAkiL-jcIhTA_oA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NiBTYWx0ZWRfXxGHpSDGaSp46
 7Ah1yzKJ0ojBeBEEOSaa3osXAZiYI2Wcdz2KsgZYYu4pPr5Adl/eH6pT9Pvt/YEl7DLQil4+U+5
 OfJPuMTwMGWmGunjVkTWuexvCAl8S+OVDi/lwVjPjvUmDjHVG0fZR7HogFak2oDMO2h21GUsY5B
 BE9xvhLkYPBUXX309FJZ+WehZc7b6GsgZhiqRjCZcb/MRvoOVo/5PIUGG7JqJ34QHMA4AuW0ZLD
 9veisn3Epbj0lnWTA/0t8ZkpdDN163FDw/o+ayBSJ2a0sqs3AxZ5FKraSGrOQ/5uvQmTXXUuBwb
 cKyoh8yGJOxUeQN1SXakq+MruRnDZRg+lHBTqFCj00KCuqz4hc7/gLNGkFt/fQr24fGsgvDSwu5
 HnRjRThjppQbANBgI+B3o216Sn0u/648yi5AgZWvK3ouM9X/9yl0qUbB95fqi+1g3bjSlX3eCSb
 VLcimvLWPu7XRHMMaVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93354-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BA2515D5DB
X-Rspamd-Action: no action

On 2/18/26 7:16 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OSC L3 Cache controller node.
> 
> Also add the interconnect entry for each cpu, with 3 different paths:
> - CPU to Last Level Cache Controller (LLCC)
> - Last Level Cache Controller (LLCC) to DDR
> - L3 Cache from CPU to DDR interface
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

This should still be squashed with patch 3, as while you wire up the
CPUs as interconnect consumers, they cast no vote, leading to the
situation Krzysztof mentioned where the performance actually majorly
goes *down*, since the icc core sees no users present and assumes it can
send a zero-vote (which probably translates to F_MIN for the cache)

Konrad

