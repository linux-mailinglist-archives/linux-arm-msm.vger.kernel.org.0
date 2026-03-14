Return-Path: <linux-arm-msm+bounces-97702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JvDDIE8tWkEyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:46:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9235728CBFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 11:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4BF03043D1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 10:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62E2352F95;
	Sat, 14 Mar 2026 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9d/BxDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZ2bR+u8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90092FE075
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773485180; cv=none; b=PtygsCOn8RhR6CLhy74VPp3Qlrb9FvgaUMyHHtblJZrQSryCKR7IL2C/ICWqJtAVvbet7M3E92+83CCr5s4PxwZh5ml/H9d9/azUfoUyL1zRUHForI13tqX8LXuJ9/9wAPcSJYt5r1mByllGRV9pn3v8Iyx+jSMqMLtb94N6ROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773485180; c=relaxed/simple;
	bh=VO/ejbKJKTWN9wqCY8JTlHi79NeKZjNOdR21IcIVe7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxahEbgMarUnkkVryP37eWykZTz6ofEV/aTlbQAwRqzeeIaDH9UMGCRxRZr5tuNoBI33tqE7sXxNERuco5gVMgRXq36sQp4K08JS0a1mKnQ8VTNjdRqqWPxc3HmzPpC6s3uF53/YTlcBJBrROdw0KrbB0BlQ6VmqGTzTJlhyhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9d/BxDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZ2bR+u8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E4m2P22008284
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 10:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VO/ejbKJKTWN9wqCY8JTlHi79NeKZjNOdR21IcIVe7U=; b=G9d/BxDZ0k8gWaAc
	oIudLIsHzRFOylZGebnaay0wlycmRH4RdK3bp9T64NIwCpUqDPzEjnz9sgAV2n/i
	vDlf6JN4Lo8++7bqxwJ/zQWktCGqOrkKZpJvfu9pM4mT8WKM2geX8yMhK9+36tGo
	PMXn+0uI3x9dwR4L2+v4c1Ji7zssfLRCBzHB2RnXd57Ri62x7Ep5fibIpDtvFTLu
	VDEyl0jmdJkmYYlQOLf14BXipFHIlbymamfOV52gIdxHql4+U1bp1dxXjRlsykq3
	O1j7WYfXJUorHkRhWrWy4d/2UHy+fFEcU/jGK/ayb+IwPnlbX5DsyBZkVSMaZwKJ
	wC2zig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7rgh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 10:46:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso1847070885a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 03:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773485178; x=1774089978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VO/ejbKJKTWN9wqCY8JTlHi79NeKZjNOdR21IcIVe7U=;
        b=EZ2bR+u8dSjMxm2zD/kjHgukuhfOZM+hsBSRvRr/PRJJhdXSDEYn7out/I5AEbcoQQ
         diXSWuns5QrpPMugUaPWj4WmR4Zh/mDX9q+DOlo9/IdBjWSwg1eGl3omCJitWKYjG+XY
         Pp2/7/r7yR4U3scf7sPQOBLKPWIyyMg/QHaTUVVt2a73SU3pRzfxniI/SsWAviD1SRQ5
         DGwsCuhXGU6gZmQazm57Roxd1hCyDm4VscsF5S95ERhYxbAhTWk8Jk+ADD1wOmhzxE6m
         lUL7qq0JjoT7cQzDS7EBFBSZkyaIsNi6Zn2Xn94YrNc+G7/NhAIAA9HXxKlrq68IksfH
         2o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773485178; x=1774089978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VO/ejbKJKTWN9wqCY8JTlHi79NeKZjNOdR21IcIVe7U=;
        b=ZmUaQNsupDCKe3zPxs291+J/1LgJLq7kDgaUCGFHOA9oc4bglZ61+IsixSOmvZLR48
         dknHQwCX0eze+Ebd8wq2R0pJ5AAvrY94P3Fi1jz8Lu3vShJXOlBKQQKJZtfLn0RbNyiw
         dnWowN8A40X09sC0nfk7ZNfUPqo0mPXjhIM+dp07k8ULo3d2Q8uvqnwPABxffXtQXnq9
         L+zZ4LmpNCbpJdz4LcKOiQqAG9V1fV8Y4bwOH5ds56qdWCXSr7q+MNXo6Bm4vpu1VPyZ
         4HMbty30kZWeKIAUIiNjH1hwhy3C0YsfPhilLuz7ATfObL1bX5+nVdgGfD+S2RCpLMD2
         OiZA==
X-Forwarded-Encrypted: i=1; AJvYcCXCPn66+1Uvj09Wxr6UrmqOOEx94DdfiKetP47Jrb707EwcUYyqvoYzjAfzPhGUJrWbl5ot+/UE6wqjTzPL@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbpNpOwa6ctcQqZ4NfGlTighDIP1nmSng4KA2djGXfbQfy3GU
	doyGF2NlPMHxv1O3+/AXNo4OX9j4WzwC34bLZP/3xuHJlXz9Lrw8bDfS+tef6FqifoEcDsV+MYv
	ogwLyhR4dkvZow9TnliKdpQHwKogr7HE5uBdhb9aZjNVlOhiV51ozrAAIT/PLW1vNP5nC
X-Gm-Gg: ATEYQzyuJ0tuMZahmt7SachjL4vBHfr8v4EvhMH2DDAgoRwi9LYkiX4U+M5vPVdcHrM
	bcAOr/MU8A9iqbMb/akPgu5IB5t3HzAUM9xyYiuvIIASGQDlsbYH+2QB0ME7NAz7Si0hk8m/ZjR
	YDzblkWe/tzeNWPIBaB0hYqW/9vH54P6Zos1+3pq7u357r8hQlYB3ItTYoCh/gKqDTh3jy5kM0O
	PowUZrwddwS6tXc8d8BDbhldM0Kr2k7QDTm3zdrGoWai7kojguYPl5pvq8z0szE197OHmdTOG0q
	kfmHFAtCGjZRQ4lcw96XQjwX216LmRx71+NMYQLgD69TM4/IOGXvIoeECJI8yRpzS+PnvnyVH7M
	TQDwwCkdLFOWXHn54TnbYg5pwKESMuvddp1Awd0/n0l96ik/SgbGYYp9Pea4sHmV0dppAQKzB2u
	4Uvd2jSQ==
X-Received: by 2002:a05:620a:24d:b0:8cd:c077:40d3 with SMTP id af79cd13be357-8cdc0774143mr332912585a.25.1773485178275;
        Sat, 14 Mar 2026 03:46:18 -0700 (PDT)
X-Received: by 2002:a05:620a:24d:b0:8cd:c077:40d3 with SMTP id af79cd13be357-8cdc0774143mr332909985a.25.1773485177836;
        Sat, 14 Mar 2026 03:46:17 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:136f:df3:89d9:875c? ([2a05:6e02:1041:c10:136f:df3:89d9:875c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a0b2db487sm9068085f8f.28.2026.03.14.03.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 03:46:17 -0700 (PDT)
Message-ID: <2f10bb1d-bf48-4146-8a6f-345b35738352@oss.qualcomm.com>
Date: Sat, 14 Mar 2026 11:46:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: thermal: qcom-tsens: Document the SM8750
 Temperature Sensor
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aastha.pandey@oss.qualcomm.com,
        dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-1-250fcc3794a2@oss.qualcomm.com>
 <20260314-macho-solid-tortoise-408b0f@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260314-macho-solid-tortoise-408b0f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mNoaa4RC71PLrMLood8N6D0ZxbqsfKsA
X-Proofpoint-ORIG-GUID: mNoaa4RC71PLrMLood8N6D0ZxbqsfKsA
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b53c7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pKYB1mvBG6tSaCQwR-sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA4MyBTYWx0ZWRfX0FELLEY2k4NU
 21t8KlFYI1dCYHIZ8HawtUMpgpPuz0V1ZAbMJxvJLAdO04uDb/++FWOjFEQV4NBfi9YHgfWcwKX
 t4uTYR+SzNVLjslZnz0NgPLRG4ESXd2aloDRw/2AElPiqW3baZPN/ie0xmr/2pHkkVbrqGZrPoL
 UtJX6GJ3P/HiXJzyGoMEqpQ5beU7wZLL751KVEd2qT9GwQVX/hWsG2lweBuJMxBz7dax7PZOdIu
 Av/MDuVoVC48HjPhIGcKPXRkPMTJB1LS1jMAepRqiBPCDCTNHC5x71zYNDDlwMVWgppxP/RYJPZ
 ine8imtvUlbD0fd4GIYcFzpQ9aLrD5btL58FyLUdHDZTkj6ukFr+jAwgZ+z0S6ZMyxtRMfjmaNh
 i6lB2jwEVVlzseY716VJaI/nf/PDpk8V1gjfSZ9VjLABV/Ar3e45ttQIWRQfx/oSYIpa97Q935L
 vjXREycnrXITVQjhxEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-97702-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9235728CBFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 11:30, Krzysztof Kozlowski wrote:
> On Fri, Mar 13, 2026 at 04:04:17PM +0530, Gaurav Kohli wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> Document the Temperature Sensor (TSENS) on the SM8750 SoC.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---


Applied thanks !


